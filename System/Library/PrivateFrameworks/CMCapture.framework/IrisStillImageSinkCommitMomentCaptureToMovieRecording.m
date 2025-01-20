@interface IrisStillImageSinkCommitMomentCaptureToMovieRecording
@end

@implementation IrisStillImageSinkCommitMomentCaptureToMovieRecording

void __captureSession_IrisStillImageSinkCommitMomentCaptureToMovieRecording_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = DerivedStorage;
  uint64_t v4 = *(unsigned int *)(DerivedStorage + 352);
  if (v4)
  {
    FigDebugAssert3();
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    uint64_t v14 = fig_log_call_emit_and_clean_up_after_send_and_compose();
    v15 = (void *)MEMORY[0x1A6272C70](v14);
    if (*(void *)(a1 + 72)) {
      v16 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(void *)(a1 + 32), [*(id *)(a1 + 40) settingsID], v4);
    }
    else {
      v16 = (const void *)cs_notificationPayloadWithErrorStatus(v4);
    }
    captureSession_postNotificationWithPayload(*(const void **)(a1 + 48), @"DidBeginRecordingMomentCaptureMovie", v16);
  }
  else
  {
    v5 = (void *)[*(id *)(DerivedStorage + 664) stillImageSinkPipelineSessionStorageWithSinkID:*(void *)(a1 + 32)];
    v6 = -[FigCaptureStillImageSettings initWithSettingsID:]([FigCaptureIrisStillImageSettings alloc], "initWithSettingsID:", [*(id *)(a1 + 40) settingsID]);
    [(FigCaptureIrisStillImageSettings *)v6 setMovieMode:2];
    [(FigCaptureIrisStillImageSettings *)v6 setMovieRecordingSettings:*(void *)(a1 + 40)];
    [(FigCaptureStillImageSettings *)v6 setStillImageUserInitiatedRequestTime:*(void *)(a1 + 56)];
    [(FigCaptureStillImageSettings *)v6 setFlashMode:*(unsigned int *)(a1 + 80)];
    if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1) {
      dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_571);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 64) + 360));
    uint64_t v7 = [(FigCaptureStillImageSettings *)v6 settingsID];
    uint64_t v8 = *(void *)(CMBaseObjectGetDerivedStorage() + 608);
    uint64_t v9 = *(void *)(a1 + 64);
    if (v8 >= 1 && v8 == v7)
    {
      *(void *)(v9 + 608) = 0;

      v10 = v6;
      uint64_t v11 = *(void *)(a1 + 64);
      *(void *)(v11 + 616) = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 360));
      cs_IrisStillImageSinkPrepareMovieRecording(*(void *)(a1 + 48), *(void *)(a1 + 32), v6);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "cancelStillImageMomentCaptureWithSettingsID:", -[FigCaptureStillImageSettings settingsID](v6, "settingsID"));
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 360));
    }
    if (dword_1EB4C5110)
    {
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  *(_DWORD *)(v3 + 352) = 0;
}

uint64_t __captureSession_IrisStillImageSinkCommitMomentCaptureToMovieRecording_block_invoke_1026()
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 352) = 0;
  return result;
}

@end