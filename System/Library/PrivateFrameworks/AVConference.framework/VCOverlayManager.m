@interface VCOverlayManager
@end

@implementation VCOverlayManager

void *___VCOverlayManager_sharedOverlay_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      uint64_t v5 = v0;
      __int16 v6 = 2080;
      v7 = "_VCOverlayManager_sharedOverlay_block_invoke";
      __int16 v8 = 1024;
      int v9 = 33;
      _os_log_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] creating shared VCOverlayManager", (uint8_t *)&v4, 0x1Cu);
    }
  }
  result = malloc_type_calloc(1uLL, 0x18uLL, 0x10A00403F27F3CFuLL);
  _VCOverlayManager_sharedOverlay__overlayManager = (uint64_t)result;
  if (result)
  {
    *(void *)_VCOverlayManager_sharedOverlay__overlayManager = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    result = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCOverlayManager.stateQueue", 0, CustomRootQueue);
    *(void *)(_VCOverlayManager_sharedOverlay__overlayManager + 8) = result;
  }
  return result;
}

void __VCOverlayManager_registerOverlayForToken_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (CFDictionaryContainsKey(**(CFDictionaryRef **)(a1 + 48), *(const void **)(a1 + 56)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 64);
        int v10 = 136315906;
        uint64_t v11 = v2;
        __int16 v12 = 2080;
        v13 = "VCOverlayManager_registerOverlayForToken_block_invoke";
        __int16 v14 = 1024;
        int v15 = 137;
        __int16 v16 = 2048;
        uint64_t v17 = v4;
        uint64_t v5 = " [%s] %s:%d [VCOverlayManager] overlay already exists for token=%ld";
LABEL_12:
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(VCPixelBufferOverlay);
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      CFDictionaryAddValue(**(CFMutableDictionaryRef **)(a1 + 48), *(const void **)(a1 + 56), *(const void **)(a1 + 72));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFDictionaryContainsKey(**(CFDictionaryRef **)(a1 + 48), *(const void **)(a1 + 56)) != 0;
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 72), @"vcpixelbufferoverlay", *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v3 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void *)(a1 + 64);
          int v10 = 136315906;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          v13 = "VCOverlayManager_registerOverlayForToken_block_invoke";
          __int16 v14 = 1024;
          int v15 = 135;
          __int16 v16 = 2048;
          uint64_t v17 = v7;
          uint64_t v5 = " [%s] %s:%d [VCOverlayManager] overlay created with token=%ld";
          goto LABEL_12;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 64);
        int v10 = 136315906;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        v13 = "VCOverlayManager_registerOverlayForToken_block_invoke";
        __int16 v14 = 1024;
        int v15 = 129;
        __int16 v16 = 2048;
        uint64_t v17 = v9;
        uint64_t v5 = " [%s] %s:%d [VCOverlayManager] unable to create VCPixelBufferOverlay for token=%ld";
        goto LABEL_12;
      }
    }
  }
}

void __VCOverlayManager_unregisterOverlayForToken_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberLongType, (const void *)(a1 + 40));
  if (CFDictionaryContainsKey(**(CFDictionaryRef **)(a1 + 48), v2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        uint64_t v9 = "VCOverlayManager_unregisterOverlayForToken_block_invoke";
        __int16 v10 = 1024;
        int v11 = 155;
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] releasing overlay with token=%ld", (uint8_t *)&v6, 0x26u);
      }
    }
    CFDictionaryRemoveValue(**(CFMutableDictionaryRef **)(a1 + 48), v2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __VCOverlayManager_createOverlaySourceForToken_block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v2 = _VCOverlayManager_AddSourceToDictionary(*(__CFDictionary **)(a1 + 40), *(const __CFString **)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 56);
        int v7 = *(unsigned __int8 *)(a1 + 64);
        int v23 = 136316162;
        uint64_t v24 = v4;
        __int16 v25 = 2080;
        v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
        __int16 v27 = 1024;
        int v28 = 182;
        __int16 v29 = 2048;
        uint64_t v30 = v6;
        __int16 v31 = 1024;
        int v32 = v7;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] source successfully added with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48));
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"vcpixelbufferoverlay");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        __int16 v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 136315650;
          uint64_t v24 = v9;
          __int16 v25 = 2080;
          v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
          __int16 v27 = 1024;
          int v28 = 190;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] Adding source to overlay", (uint8_t *)&v23, 0x1Cu);
        }
      }
      if (Value
        && VCPixelBufferOverlay_updateSourceForType((uint64_t)Value, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
      {
        CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          __int16 v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *(void *)(a1 + 56);
            int v14 = *(unsigned __int8 *)(a1 + 64);
            int v23 = 136316162;
            uint64_t v24 = v11;
            __int16 v25 = 2080;
            v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
            __int16 v27 = 1024;
            int v28 = 193;
            __int16 v29 = 2048;
            uint64_t v30 = v13;
            __int16 v31 = 1024;
            int v32 = v14;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] overlay successfully updated with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = *(void *)(a1 + 56);
            int v22 = *(unsigned __int8 *)(a1 + 64);
            int v23 = 136316162;
            uint64_t v24 = v19;
            __int16 v25 = 2080;
            v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
            __int16 v27 = 1024;
            int v28 = 195;
            __int16 v29 = 2048;
            uint64_t v30 = v21;
            __int16 v31 = 1024;
            int v32 = v22;
            _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d [VCOverlayManager] failed to add source with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
          }
        }
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48));
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
    }
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    __int16 v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 56);
      int v18 = *(unsigned __int8 *)(a1 + 64);
      int v23 = 136316162;
      uint64_t v24 = v15;
      __int16 v25 = 2080;
      v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
      __int16 v27 = 1024;
      int v28 = 179;
      __int16 v29 = 2048;
      uint64_t v30 = v17;
      __int16 v31 = 1024;
      int v32 = v18;
      _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d [VCOverlayManager] adding source to dictionary failed with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
    }
  }
}

void __VCOverlayManager_releaseOverlaySourceWithToken_block_invoke(uint64_t a1)
{
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48)))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

uint64_t __VCOverlayManager_isOverlayEnabled_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(result + 40) + 16);
  return result;
}

BOOL __VCOverlayManager_updateOverlayEnabledState_block_invoke(uint64_t a1)
{
  BOOL result = VCDefaults_GetBoolValueForKey(@"enableInfoOverlay", 0);
  *(unsigned char *)(*(void *)(a1 + 40) + 16) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end