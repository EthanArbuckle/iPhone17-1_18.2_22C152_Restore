@interface FigRCLCreateConfiguration
@end

@implementation FigRCLCreateConfiguration

void __rcl_FigRCLCreateConfiguration_dispatcher_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (gFigRemoteConfigLoaderInit != -1) {
    dispatch_once_f(&gFigRemoteConfigLoaderInit, 0, (dispatch_function_t)rcl_InitializeLoader);
  }
  uint64_t v2 = gFRCL_Loader;
  if (gFRCL_Loader && !*(void *)(gFRCL_Loader + 8))
  {
    if (v1 && *(void *)v1 && *(void *)(v1 + 8))
    {
      uint64_t v3 = *MEMORY[0x1E4F1CF80];
      CFURLRef v4 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFStringRef *)v1, 0);
      if (!v4) {
        return;
      }
      CFURLRef v5 = v4;
      v6 = malloc_type_calloc(1uLL, 0x38uLL, 0x10A0040FB48983FuLL);
      if (!v6)
      {
LABEL_16:
        CFRelease(v5);
        return;
      }
      v7 = v6;
      v6[2] = v1;
      uint64_t v8 = *(void *)(v2 + 32);
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      v11 = *(unsigned int (**)(uint64_t, uint64_t, void, CFURLRef, void, void, void, uint64_t, _OWORD *, void, void, void, void (*)(uint64_t, int, int, CMBlockBufferRef, uint64_t, uint64_t, char, int), void, void *, void *))(v10 + 8);
      if (v11)
      {
        memset(v14, 0, 112);
        if (!v11(v8, v3, 0, v5, 0, 0, 0, 4, v14, 0, 0, 0, rcl_HTTPReadCallback, 0, v7 + 3, v7 + 4))
        {
          void *v7 = 0;
          v12 = *(void **)(v2 + 16);
          v7[1] = v12;
          void *v12 = v7;
          *(void *)(v2 + 16) = v7;
          goto LABEL_16;
        }
      }
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CFRelease(v5);
    }
    else
    {
      v7 = 0;
    }
    rcl_ReleaseConnectionData(v7);
  }
}

@end