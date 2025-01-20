@interface EnsureInternalStateSetup
@end

@implementation EnsureInternalStateSetup

void __remoteFigProcessStateMonitor_EnsureInternalStateSetup_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef Default = CFAllocatorGetDefault();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigCFWeakReferenceTableCreate(Default, 1, &gStateMonitorPerPID);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || (gStateMonitorMutex = (uint64_t)FigReentrantMutexCreate()) == 0
    || (gRemotesSupportingPurge = (uint64_t)(id)[MEMORY[0x1E4F28F50] weakObjectsPointerArray]) == 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigSignalErrorAt(4294947865, 0, 0, 0, 0, 0, 0);
  }
  if (dword_1EB28B670 >= 2)
  {
    v10[0] = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EB28B668, 1, v10, &type);
    int v4 = v10[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v6 = v4;
    }
    else {
      unsigned int v6 = v4 & 0xFFFFFFFE;
    }
    if (v6)
    {
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v10[1] = 136315394;
      v11 = "remoteFigProcessStateMonitor_EnsureInternalStateSetup_block_invoke";
      __int16 v12 = 1024;
      int v13 = v7;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v10[0];
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EB28B668, 1u, 1, v8, v8 != &v14, v4, 0, v5);
  }
}

@end