@interface Prewarm
@end

@implementation Prewarm

uint64_t __captureDeferredPhotoProcessor_Prewarm_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(a1[6] + 64);
  if (v2)
  {
    if (dword_1EB4C4F10)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v2 = *(NSObject **)(a1[6] + 64);
    }
    dispatch_source_cancel(v2);

    *(void *)(a1[6] + 64) = 0;
  }
  if (dword_1EB4C4F10)
  {
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [+[BWDeferredTransactionBroker sharedInstance] openTransaction:1 pid:*(unsigned int *)(a1[6] + 32)];
  return objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine"), "ensureGraphForSettings:processingSettings:applicationID:", a1[4], a1[5], *(void *)(a1[6] + 24));
}

@end