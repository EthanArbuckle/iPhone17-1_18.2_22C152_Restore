@interface RequestInitialModeChange
@end

@implementation RequestInitialModeChange

uint64_t __fsmcontroller_RequestInitialModeChange_block_invoke(uint64_t a1)
{
  v2 = *(__n128 **)(a1 + 40);
  if (v2)
  {
    v3 = *(unsigned __int32 **)(a1 + 48);
    if (v3 && (unsigned __int32 v4 = *v3) != 0)
    {
      v2[2].n128_u32[0] = v4;
      if (v4 == 2)
      {
        int v5 = 100;
        v2[2].n128_u32[1] = 100;
      }
      else
      {
        v2[2].n128_u32[1] = v3[1];
        int v5 = v3[2];
      }
    }
    else
    {
      v2[2].n128_u64[0] = 0x6400000002;
      int v5 = 100;
    }
    v2[2].n128_u32[2] = v5;
    if (!dword_1E9359FB0
      || (v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(),
          os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT),
          fig_log_call_emit_and_clean_up_after_send_and_compose(),
          (v2 = *(__n128 **)(a1 + 40)) != 0))
    {
      v7 = *(unsigned __int32 **)(a1 + 56);
      if (v7 && (unsigned __int32 v8 = *v7) != 0)
      {
        v2[4].n128_u32[0] = v8;
        if (v8 == 2)
        {
          int v9 = 100;
          v2[4].n128_u32[1] = 100;
        }
        else
        {
          v2[4].n128_u32[1] = v7[1];
          int v9 = v7[2];
        }
      }
      else
      {
        v2[4].n128_u64[0] = 0x6400000002;
        int v9 = 100;
      }
      v2[4].n128_u32[2] = v9;
      if (dword_1E9359FB0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v2 = *(__n128 **)(a1 + 40);
      }
    }
  }
  uint64_t result = fsm_requestModeChange(v2, (long long *)(a1 + 64), *(const char **)(a1 + 136), 1, *(void *)(a1 + 144), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end