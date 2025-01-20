@interface CancelAllPrewarming
@end

@implementation CancelAllPrewarming

void __captureDeferredPhotoProcessor_CancelAllPrewarming_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 64))
  {
    if (dword_1EB4C4F10)
    {
      int v10 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v1 = *(void *)(a1 + 32);
    }
    v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v1 + 16));
    *(void *)(*(void *)(a1 + 32) + 64) = v4;
    dispatch_time_t v5 = dispatch_time(0, 6000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    id v6 = +[FigWeakReference weakReferenceToObject:*(void *)(a1 + 40)];
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __captureDeferredPhotoProcessor_CancelAllPrewarming_block_invoke_158;
    handler[3] = &unk_1E5C24430;
    handler[4] = v6;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 64));
  }
}

void __captureDeferredPhotoProcessor_CancelAllPrewarming_block_invoke_158(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (const void *)[*(id *)(a1 + 32) retainReferencedObject];
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v4 = DerivedStorage;
    if (*DerivedStorage)
    {
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v8 = v1;
        LODWORD(v6) = 0;
        FigDebugAssert3();
      }
      if (!*((void *)v4 + 6) || !*v4) {
        objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine", v6, v8), "releaseResourcesForClientPID:", *((unsigned int *)v4 + 8));
      }
      objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine", v6), "releasePrewarmingResources");

      *((void *)v4 + 8) = 0;
      if (dword_1EB4C4F10)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      [+[BWDeferredTransactionBroker sharedInstance] closeTransaction:1];
    }
  }
  if (v2) {
    CFRelease(v2);
  }
}

@end