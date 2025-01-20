@interface SetEnableEchoMitigation
@end

@implementation SetEnableEchoMitigation

void __localHelper_SetEnableEchoMitigation_block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = CFSetContainsValue(**(CFSetRef **)(a1 + 32), *(const void **)(a1 + 40));
  if (v2)
  {
    if (v3) {
      return;
    }
    CFIndex Count = CFSetGetCount(**(CFSetRef **)(a1 + 32));
    CFSetAddValue(**(CFMutableSetRef **)(a1 + 32), *(const void **)(a1 + 40));
    if (Count) {
      return;
    }
  }
  else
  {
    if (!v3) {
      return;
    }
    CFIndex v5 = CFSetGetCount(**(CFSetRef **)(a1 + 32));
    CFSetRemoveValue(**(CFMutableSetRef **)(a1 + 32), *(const void **)(a1 + 40));
    if (v5 != 1) {
      return;
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) activeConversations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v12 = (void *)[v11 activitySessions];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              if (!*(unsigned char *)(a1 + 48)) {
                goto LABEL_32;
              }
              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "activity"), "metadata"), "context"), "isMedia"))goto LABEL_27; {
              if (!*(unsigned char *)(a1 + 48))
              }
              {
LABEL_32:
                if ([v17 isUsingAirplay])
                {
LABEL_27:
                  if (dword_1E9350F80)
                  {
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setUsingAirplay:onActivitySession:onConversation:", *(unsigned char *)(a1 + 48) != 0, v17, v11, v20, v21);
                  return;
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
        uint64_t v9 = v22;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }
  if (dword_1E9350F80)
  {
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end