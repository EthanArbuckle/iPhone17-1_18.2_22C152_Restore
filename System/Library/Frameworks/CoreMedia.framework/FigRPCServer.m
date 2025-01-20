@interface FigRPCServer
@end

@implementation FigRPCServer

uint64_t __FigRPCServer_TimeoutCrashReport_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EB28B628, 0, v12, &type);
  int v3 = v12[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    unsigned int v5 = v3;
  }
  else {
    unsigned int v5 = v3 & 0xFFFFFFFE;
  }
  if (v5)
  {
    int v6 = *(_DWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    v12[1] = 136315650;
    v13 = "FigRPCServer_TimeoutCrashReport_block_invoke";
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    v8 = (char *)_os_log_send_and_compose_impl();
    LOBYTE(v3) = v12[0];
  }
  else
  {
    v8 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EB28B628, 0, 1, v8, v8 != &v18, v3, 0, v4);
  v9 = *(const void **)(a1 + 32);
  if (v9) {
    CFRelease(v9);
  }
  return kill(*(_DWORD *)(a1 + 40), 9);
}

@end