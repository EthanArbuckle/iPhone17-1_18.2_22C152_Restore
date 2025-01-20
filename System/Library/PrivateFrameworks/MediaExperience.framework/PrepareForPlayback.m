@interface PrepareForPlayback
@end

@implementation PrepareForPlayback

uint64_t __routingSessionManagerResilientRemote_PrepareForPlayback_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(v6 + 32);
  if (v7)
  {
    v7(a2, v3, v4);
  }
  else if (v3)
  {
    v3(v4, 4294954514);
  }
  return 0;
}

uint64_t __routingSessionManager_PrepareForPlayback_block_invoke(uint64_t result)
{
  v1 = *(uint64_t (**)(void))(result + 32);
  if (v1) {
    return v1(*(void *)(result + 40));
  }
  return result;
}

void __routingSessionManager_PrepareForPlayback_block_invoke_108(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (dword_1E9359DE0)
    {
      int v16 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v5 = (const void *)a1[4];
    if (v5)
    {
      CFRetain(v5);
      uint64_t v6 = a1[4];
    }
    else
    {
      uint64_t v6 = 0;
    }
    v7 = *(NSObject **)(a1[5] + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __routingSessionManager_PrepareForPlayback_block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    uint64_t v8 = a1[6];
    v14[4] = v6;
    v14[5] = v8;
    MXDispatchAsync((uint64_t)"routingSessionManager_PrepareForPlayback_block_invoke", (uint64_t)"FigRoutingSessionManager.m", 1560, 0, 0, v7, (uint64_t)v14);
  }
  MEMORY[0x199716EE0](*(void *)(a1[5] + 40));
  CFArrayRef v9 = *(const __CFArray **)(a1[5] + 104);
  *(void *)(a1[5] + 104) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  MEMORY[0x199716EF0](*(void *)(a1[5] + 40));
  if (v9)
  {
    if (CFArrayGetCount(v9) >= 1)
    {
      CFIndex v10 = 0;
      do
      {
        ValueAtIndex = (void (**)(const void *, void))CFArrayGetValueAtIndex(v9, v10);
        ValueAtIndex[2](ValueAtIndex, a2);
        ++v10;
      }
      while (v10 < CFArrayGetCount(v9));
    }
    CFRelease(v9);
  }
  v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  v13 = (const void *)a1[4];
  if (v13) {
    CFRelease(v13);
  }
}

void __routingSessionManager_PrepareForPlayback_block_invoke_2(uint64_t a1)
{
  routingSessionManager_updateCurrentSession(*(const void **)(a1 + 32), 0, 0, 0, 0, 0, 0, 1, *(void *)(a1 + 40), 0, @"routingSessionManager_routeToDestinationOfCurrentSession failed", 0);
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

@end