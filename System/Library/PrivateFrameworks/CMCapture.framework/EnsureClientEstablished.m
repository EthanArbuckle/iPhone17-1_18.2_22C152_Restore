@interface EnsureClientEstablished
@end

@implementation EnsureClientEstablished

void __remoteExternalStorageDeviceManagerClient_EnsureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"FigExternalStorageDeviceManager_ServerConnectionDied");
    v4 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F22098], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F22088], v4);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else if (!gFigExternalStorageDeviceManagerRemoteClient)
    {
      unsigned int v5 = 1;
      int v6 = 250;
      useconds_t v7 = 250000;
      do
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        usleep(v7);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
        if (gFigExternalStorageDeviceManagerRemoteClient) {
          break;
        }
        v7 += 250000;
        v6 += 250;
      }
      while (v5++ < 3);
    }
    CFRelease(v3);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -16150;
  }
}

@end