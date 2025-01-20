@interface PrettyPrintContainerDescription
@end

@implementation PrettyPrintContainerDescription

uint64_t __captureDeferredPhotoProcessor_PrettyPrintContainerDescription_block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v12 = 0;
  if (dword_1EB4C4F10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [+[BWDeferredTransactionBroker sharedInstance] openTransaction:2 pid:*(unsigned int *)(a1[6] + 32)];
  if ((id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:a1[7]])
  {
    id v4 = [+[BWDeferredProcessingContainerManager sharedInstance] createProcessingContainerWithApplicationID:*(void *)(a1[6] + 24) captureRequestIdentifier:a1[7] openForPeeking:1 err:&v12];
    v5 = v4;
    if (v12)
    {
      uint64_t v11 = v1;
      LODWORD(v9) = v12;
      FigDebugAssert3();
    }
    else
    {
      *(void *)(*(void *)(a1[4] + 8) + 24) = (id)[v4 prettyDescription];
    }
  }
  else
  {
    uint64_t v11 = v1;
    LODWORD(v9) = 0;
    FigDebugAssert3();
    v5 = 0;
  }

  if (dword_1EB4C4F10)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return [+[BWDeferredTransactionBroker sharedInstance] closeTransaction:2];
}

@end