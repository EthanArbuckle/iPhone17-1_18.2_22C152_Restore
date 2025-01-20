@interface IrisStillImageSinkCancelMomentCapture
@end

@implementation IrisStillImageSinkCancelMomentCapture

uint64_t __captureSession_IrisStillImageSinkCancelMomentCapture_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = (void *)[*(id *)(DerivedStorage + 664) stillImageSinkPipelineSessionStorageWithSinkID:*(void *)(a1 + 32)];
  v4 = (void *)-[FigCaptureCameraSourcePipeline captureDevice]([v3 cameraSourcePipeline]);
  if (*(_DWORD *)(DerivedStorage + 352)) {
    goto LABEL_12;
  }
  if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1) {
    dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_571);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 360));
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetDerivedStorage() + 608);
  if (v6 >= 1 && v6 == v5)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    *(void *)(v9 + 608) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 360));
    uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "cancelStillImageMomentCaptureWithSettingsID:", *(void *)(a1 + 56));
    if (v12)
    {
      uint64_t v10 = v12;
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      uint64_t v12 = fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_14;
    }
  }
  else
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 360));
  }
  if (*(_DWORD *)(DerivedStorage + 352))
  {
LABEL_12:
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    uint64_t v12 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v10 = 0;
LABEL_14:
  v14 = (void *)MEMORY[0x1A6272C70](v12);
  if (*(void *)(a1 + 64)) {
    v15 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(void *)(a1 + 32), *(void *)(a1 + 56), v10);
  }
  else {
    v15 = (const void *)cs_notificationPayloadWithErrorStatus(v10);
  }
  captureSession_postNotificationWithPayload(*(const void **)(a1 + 40), @"DidCancelMomentCapture", v15);
  [v4 setAutomaticallyAdjustsTorch:0];
  uint64_t result = [v4 setTorchLevel:0.0];
  *(_DWORD *)(DerivedStorage + 352) = 0;
  return result;
}

uint64_t __captureSession_IrisStillImageSinkCancelMomentCapture_block_invoke_1028()
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 352) = 0;
  return result;
}

@end