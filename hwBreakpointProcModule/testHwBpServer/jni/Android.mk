LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CPPFLAGS += -std=c++1y
LOCAL_CFLAGS += -fPIE
LOCAL_CFLAGS += -fvisibility=hidden
LOCAL_LDFLAGS += -fPIE -pie
LOCAL_DISABLE_FATAL_LINKER_WARNINGS := true

# Set the output name based on the ABI
ifeq ($(TARGET_ARCH_ABI),x86)
    APP_OUTPUT_NAME := -x86-server
endif
ifeq ($(TARGET_ARCH_ABI),x86_64)
    APP_OUTPUT_NAME := -x86_64-server
endif
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    APP_OUTPUT_NAME := -armeabi_v7a-server
endif
ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
    APP_OUTPUT_NAME := -arm64_v8a-server
endif

LOCAL_MODULE    := testHwBp$(APP_OUTPUT_NAME)
LOCAL_SRC_FILES :=  ../main.cpp ../api.cpp ../Global.cpp  ../porthelp.cpp
LOCAL_LDLIBS := -lz -llog
include $(BUILD_EXECUTABLE)
