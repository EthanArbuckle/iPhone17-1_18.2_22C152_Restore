@interface IrisStillImageSinkBeginMomentCapture
@end

@implementation IrisStillImageSinkBeginMomentCapture

void __captureSession_IrisStillImageSinkBeginMomentCapture_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(DerivedStorage + 664), "stillImageSinkPipelineSessionStorageWithSinkID:", *(void *)(a1 + 32)), "cameraSourcePipeline");
  *(_DWORD *)(DerivedStorage + 352) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
  if (*(void *)(DerivedStorage + 608))
  {
    uint64_t v8 = v1;
    LODWORD(v7) = 0;
    FigDebugAssert3();
  }
  *(void *)(DerivedStorage + 608) = objc_msgSend(*(id *)(a1 + 40), "settingsID", v7, v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
  if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1) {
    dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_571);
  }
  v5 = (FigCaptureIrisStillImageSettings *)(id)[*(id *)(a1 + 40) stillImageSettings];
  if (!v5)
  {
    v9 = -[FigCaptureStillImageSettings initWithSettingsID:captureRequestIdentifier:]([FigCaptureIrisStillImageSettings alloc], "initWithSettingsID:captureRequestIdentifier:", [*(id *)(a1 + 40) settingsID], objc_msgSend(*(id *)(a1 + 40), "captureRequestIdentifier"));
    -[FigCaptureStillImageSettings setStillImageUserInitiatedRequestTime:](v9, "setStillImageUserInitiatedRequestTime:", [*(id *)(a1 + 40) userInitiatedCaptureTime]);
    -[FigCaptureStillImageSettings setFlashMode:](v9, "setFlashMode:", [*(id *)(a1 + 40) flashMode]);
    -[FigCaptureStillImageSettings setAutoRedEyeReductionEnabled:](v9, "setAutoRedEyeReductionEnabled:", [*(id *)(a1 + 40) autoRedEyeReductionEnabled]);
    -[FigCaptureStillImageSettings setDigitalFlashMode:](v9, "setDigitalFlashMode:", [*(id *)(a1 + 40) digitalFlashMode]);
    -[FigCaptureStillImageSettings setQualityPrioritization:](v9, "setQualityPrioritization:", [*(id *)(a1 + 40) qualityPrioritization]);
    -[FigCaptureStillImageSettings setClientQualityPrioritization:](v9, "setClientQualityPrioritization:", [*(id *)(a1 + 40) clientQualityPrioritization]);
    -[FigCaptureStillImageSettings setHDRMode:](v9, "setHDRMode:", [*(id *)(a1 + 40) HDRMode]);
    -[FigCaptureStillImageSettings setProvidesOriginalImage:](v9, "setProvidesOriginalImage:", [*(id *)(a1 + 40) isAutoOriginalPhotoDeliveryEnabled]);
    -[FigCaptureStillImageSettings setAutoDeferredProcessingEnabled:](v9, "setAutoDeferredProcessingEnabled:", [*(id *)(a1 + 40) isAutoDeferredProcessingEnabled]);
    -[FigCaptureStillImageSettings setRawOutputFormat:](v9, "setRawOutputFormat:", [*(id *)(a1 + 40) rawOutputFormat]);
    -[FigCaptureStillImageSettings setOutputWidth:](v9, "setOutputWidth:", [*(id *)(a1 + 40) outputWidth]);
    -[FigCaptureStillImageSettings setOutputHeight:](v9, "setOutputHeight:", [*(id *)(a1 + 40) outputHeight]);
    -[FigCaptureStillImageSettings setDepthDataDeliveryEnabled:](v9, "setDepthDataDeliveryEnabled:", [*(id *)(a1 + 40) depthDataDeliveryEnabled]);
    v5 = v9;
  }
  v10 = v5;
  [(FigCaptureStillImageSettings *)v5 setSettingsProvider:1];
  [(FigCaptureStillImageSettings *)v10 setBeginMomentCaptureSettings:1];
  [(FigCaptureStillImageSettings *)v10 setStillImageRequestTime:*(void *)(a1 + 56)];
  captureSession_updateOutputDimensionsAndResolutionFlavor([(FigCaptureStillImageSettings *)v10 outputWidth] | (unint64_t)([(FigCaptureStillImageSettings *)v10 outputHeight] << 32), v4, v10);
  int v6 = captureSession_captureStillImageNow(*(const void **)(a1 + 48), *(void **)(a1 + 32), v10);
  if (v6)
  {
    FigDebugAssert3();
    os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
    *(void *)(DerivedStorage + 608) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
  }
  *(_DWORD *)(DerivedStorage + 352) = v6;
}

uint64_t __captureSession_IrisStillImageSinkBeginMomentCapture_block_invoke_2(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 352) = *(_DWORD *)(a1 + 40);
  return result;
}

@end