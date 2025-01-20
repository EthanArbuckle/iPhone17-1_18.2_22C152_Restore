@interface CopyPreferredDeviceAddress
@end

@implementation CopyPreferredDeviceAddress

id __mxBluetoothServices_CopyPreferredDeviceAddress_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![a2 action]) {
    goto LABEL_17;
  }
  id result = (id)[a2 action];
  if (result == 4)
  {
    if (*(unsigned char *)(a1 + 60))
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id result = (id)objc_msgSend(a2, "deviceAddress", v11, v13);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
      return result;
    }
    if (!dword_1E9359ED0) {
      return result;
    }
    goto LABEL_17;
  }
  if ([a2 action] != 5)
  {
    if ([a2 action] == 3)
    {
      [a2 reason];
      if (FigCFStringFind())
      {
        if (*(_DWORD *)(a1 + 56) == 501)
        {
          if (dword_1E9359ED0)
          {
            v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
      }
    }
    if (objc_msgSend(a2, "action", v11, v13) == 6)
    {
      if (dword_1E9359ED0)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    id result = (id)objc_msgSend(a2, "deviceAddress", v12, v14);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (dword_1E9359ED0) {
      goto LABEL_28;
    }
    return result;
  }
  if (!*(void *)(a1 + 48))
  {
LABEL_17:
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  **(void **)(a1 + 48) = (id)[a2 wxInfo];
  if (dword_1E9359ED0)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id result = (id)objc_msgSend(a2, "deviceAddress", v11, v13);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (dword_1E9359ED0)
  {
LABEL_28:
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end