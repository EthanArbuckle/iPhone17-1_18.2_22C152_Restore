@interface IrisStillImageSinkCommitMomentCaptureToStillImageCapture
@end

@implementation IrisStillImageSinkCommitMomentCaptureToStillImageCapture

void __captureSession_IrisStillImageSinkCommitMomentCaptureToStillImageCapture_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = DerivedStorage;
  uint64_t v4 = *(unsigned int *)(*(void *)(a1 + 56) + 352);
  if (v4) {
    goto LABEL_17;
  }
  v5 = (void *)[*(id *)(DerivedStorage + 664) stillImageSinkPipelineSessionStorageWithSinkID:*(void *)(a1 + 32)];
  uint64_t v6 = [v5 cameraSourcePipeline];
  [(id)-[FigCaptureCameraSourcePipeline captureDevice](v6) nonDestructiveCropSize];
  objc_msgSend(*(id *)(a1 + 40), "setNonDestructiveCropSize:");
  cs_updateSmartStyleSupport(*(void *)(a1 + 48), *(void **)(a1 + 40), (void *)[*(id *)(a1 + 40) movieRecordingSettings]);
  if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1) {
    dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_571);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 360));
  uint64_t v7 = [*(id *)(a1 + 40) settingsID];
  uint64_t v8 = *(void *)(CMBaseObjectGetDerivedStorage() + 608);
  if (v8 < 1 || v8 != v7)
  {
LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 360));
    goto LABEL_14;
  }
  *(void *)(v3 + 608) = 0;
  if (!v5)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (*(void *)(a1 + 64)) {
      v14 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(void *)(a1 + 32), [*(id *)(a1 + 40) settingsID], 4294950896);
    }
    else {
      v14 = (const void *)cs_notificationPayloadWithErrorStatus(*(unsigned int *)(a1 + 72));
    }
    captureSession_postNotificationWithPayload(*(const void **)(a1 + 48), @"IrisWillBeginCapture", v14);
    goto LABEL_13;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 360));
  unint64_t v9 = stillImageSinkPipelineSessionStorage_stillImageOutputDimensionsForSettings(v5, *(void **)(a1 + 40));
  captureSession_updateOutputDimensionsAndResolutionFlavor(v9, v6, *(void **)(a1 + 40));
  v10 = *(void **)(a1 + 40);
  [(id)-[FigCaptureCameraSourcePipeline captureDevice](v6) zoomFactor];
  BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(v10, v11);
  uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "commitStillImageMomentCaptureWithSettings:", *(void *)(a1 + 40));
  if (!v12)
  {
    cs_IrisStillImageSinkPrepareMovieRecording(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void **)(a1 + 40));
    goto LABEL_14;
  }
  uint64_t v4 = v12;
LABEL_17:
  FigDebugAssert3();
  v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  uint64_t v16 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  v17 = (void *)MEMORY[0x1A6272C70](v16);
  if (*(void *)(a1 + 64)) {
    v18 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(void *)(a1 + 32), [*(id *)(a1 + 40) settingsID], v4);
  }
  else {
    v18 = (const void *)cs_notificationPayloadWithErrorStatus(v4);
  }
  captureSession_postNotificationWithPayload(*(const void **)(a1 + 48), @"IrisWillBeginCapture", v18);
LABEL_14:
  *(_DWORD *)(v3 + 352) = 0;
}

uint64_t __captureSession_IrisStillImageSinkCommitMomentCaptureToStillImageCapture_block_invoke_1022()
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 352) = 0;
  return result;
}

@end