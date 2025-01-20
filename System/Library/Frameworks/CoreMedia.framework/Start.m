@interface Start
@end

@implementation Start

uint64_t __tcp_Start_block_invoke(uint64_t result)
{
  v1 = (void *)result;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(*(void *)(result + 40) + 48))
  {
    if (pipe(v11))
    {
      result = (uint64_t)__error();
      *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = *(_DWORD *)result;
      goto LABEL_15;
    }
    uint64_t v2 = v1[5];
    int v3 = v11[1];
    *(_DWORD *)(v2 + 104) = v11[0];
    *(_DWORD *)(v2 + 92) = v3;
    fcntl(v3, 4, 4);
    if (CFEqual(*(CFTypeRef *)(v1[5] + 24), @"Client"))
    {
      uint64_t v4 = v1[6];
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(v4);
      v6 = (pthread_t *)(DerivedStorage + 112);
      if (!*(void *)(DerivedStorage + 112))
      {
        *(unsigned char *)(DerivedStorage + 120) = 0;
        values = @"FigTransportConnectionTCP.client";
        CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&kFigThreadCreateKey_Identifier, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v8 = tcp_clientThreadMain;
LABEL_9:
        FigThreadCreate((uint64_t)v8, v4, 0x1Cu, 1, v7, v6);
        if (v7) {
          CFRelease(v7);
        }
        result = 0;
        goto LABEL_12;
      }
    }
    else
    {
      if (!CFEqual(*(CFTypeRef *)(v1[5] + 24), @"Server"))
      {
        result = FigSignalErrorAt(4294955246, 0, 0, 0, 0, 0, 0);
LABEL_12:
        *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = result;
        goto LABEL_13;
      }
      uint64_t v4 = v1[6];
      uint64_t v9 = CMBaseObjectGetDerivedStorage(v4);
      v6 = (pthread_t *)(v9 + 112);
      if (!*(void *)(v9 + 112))
      {
        *(unsigned char *)(v9 + 120) = 0;
        values = @"FigTransportConnectionTCP.server";
        CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&kFigThreadCreateKey_Identifier, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v8 = tcp_serverThreadMain;
        goto LABEL_9;
      }
    }
    result = 4294955243;
    goto LABEL_12;
  }
LABEL_13:
  if (!*(_DWORD *)(*(void *)(v1[4] + 8) + 24)) {
    ++*(_DWORD *)(v1[5] + 48);
  }
LABEL_15:
  if (*(_DWORD *)(*(void *)(v1[4] + 8) + 24)) {
    return tcp_CleanupFileDescriptors(v1[6]);
  }
  return result;
}

void __usb_Start_block_invoke(void *a1)
{
  values[16] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  if (*(_DWORD *)(v2 + 88)) {
    goto LABEL_24;
  }
  if (CFEqual(*(CFTypeRef *)(v2 + 72), @"Client"))
  {
    uint64_t v3 = a1[6];
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(v3);
    *(unsigned char *)(DerivedStorage + 40) = 0;
    *(unsigned char *)(DerivedStorage + 24) = 0;
    *(void *)(DerivedStorage + 200) = dispatch_semaphore_create(0);
    values[0] = @"FigTransportConnectionUSB.messagesending";
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&kFigThreadCreateKey_Identifier, (const void **)values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    FigThreadCreate((uint64_t)usb_messageSendingThreadMain, v3, 0x1Cu, 1, v6, (pthread_t *)(DerivedStorage + 192));
    if (v6) {
      CFRelease(v6);
    }
    values[0] = @"FigTransportConnectionUSB.client";
    CFDictionaryRef v7 = CFDictionaryCreate(v5, (const void **)&kFigThreadCreateKey_Identifier, (const void **)values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    FigThreadCreate((uint64_t)usb_clientThreadMain, v3, 0x1Cu, 1, v7, (pthread_t *)(DerivedStorage + 128));
    if (v7) {
      CFRelease(v7);
    }
    int v8 = 0;
  }
  else
  {
    if (CFEqual(*(CFTypeRef *)(a1[5] + 72), @"Server"))
    {
      uint64_t v9 = a1[6];
      uint64_t v10 = CMBaseObjectGetDerivedStorage(v9);
      int v22 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, &v22, &type);
      int v12 = v22;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        unsigned int v14 = v12;
      }
      else {
        unsigned int v14 = v12 & 0xFFFFFFFE;
      }
      if (v14)
      {
        int v24 = 136315138;
        v25 = "usb_startServer";
        v15 = (void **)_os_log_send_and_compose_impl();
        LOBYTE(v12) = v22;
      }
      else
      {
        v15 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v15, v15 != values, v12, 0, v13);
      *(unsigned char *)(v10 + 40) = 0;
      *(unsigned char *)(v10 + 24) = 0;
      *(void *)(v10 + 200) = dispatch_semaphore_create(0);
      v23 = @"FigTransportConnectionUSB.messagesending";
      CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDictionaryRef v18 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&kFigThreadCreateKey_Identifier, (const void **)&v23, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      FigThreadCreate((uint64_t)usb_messageSendingThreadMain, v9, 0x1Cu, 1, v18, (pthread_t *)(v10 + 192));
      if (v18) {
        CFRelease(v18);
      }
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      *(void *)(v10 + 144) = v19;
      if (v19)
      {
        v23 = @"FigTransportConnectionUSB.server";
        CFDictionaryRef v20 = CFDictionaryCreate(v17, (const void **)&kFigThreadCreateKey_Identifier, (const void **)&v23, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        FigThreadCreate((uint64_t)usb_serverThreadMain, v9, 0x1Cu, 1, v20, (pthread_t *)(v10 + 128));
        if (v20) {
          CFRelease(v20);
        }
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v10 + 144), 0xFFFFFFFFFFFFFFFFLL);
        int v8 = *(_DWORD *)(v10 + 152);
        dispatch_release(*(dispatch_object_t *)(v10 + 144));
        *(void *)(v10 + 144) = 0;
        goto LABEL_23;
      }
      uint64_t v16 = 4294955245;
    }
    else
    {
      uint64_t v16 = 4294955246;
    }
    int v8 = FigSignalErrorAt(v16, 0, 0, 0, 0, 0, 0);
  }
LABEL_23:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v8;
LABEL_24:
  if (!*(_DWORD *)(*(void *)(a1[4] + 8) + 24)) {
    ++*(_DWORD *)(a1[5] + 88);
  }
}

@end