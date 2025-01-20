@interface IrisStillImageSinkPrepareToCapture
@end

@implementation IrisStillImageSinkPrepareToCapture

void __captureSession_IrisStillImageSinkPrepareToCapture_block_invoke(void *a1)
{
  v3 = (void *)a1[5];
  v2 = (const void *)a1[6];
  v4 = (void *)a1[4];
  v5 = (void *)[*(id *)(CMBaseObjectGetDerivedStorage() + 664) stillImageSinkPipelineSessionStorageWithSinkID:v4];
  v6 = (void *)[v5 stillImageSinkPipeline];
  v7 = (void *)[v6 stillImageCoordinatorNode];
  uint64_t v8 = [v5 cameraSourcePipeline];
  if (_FigIsCurrentDispatchQueue())
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v16 = v1;
    LODWORD(v15) = 0;
LABEL_11:
    FigDebugAssert3();
LABEL_12:
    uint64_t v13 = FigSignalErrorAt();
    if (!v13) {
      return;
    }
    goto LABEL_15;
  }
  FigDebugAssert3();
  if (!v6) {
    goto LABEL_8;
  }
LABEL_3:
  if (!v7)
  {
    uint64_t v16 = v1;
    LODWORD(v15) = 0;
    FigDebugAssert3();
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", objc_msgSend(v6, "sinkID")) & 1) == 0)
  {
    uint64_t v16 = v1;
    LODWORD(v15) = 0;
    goto LABEL_11;
  }
  v9 = (void *)[v3 figCaptureStillImageSettingsRepresentation];
  [v9 setClientInitiatedPrepareSettings:1];
  unint64_t v10 = stillImageSinkPipelineSessionStorage_stillImageOutputDimensionsForSettings(v5, v9);
  captureSession_updateOutputDimensionsAndResolutionFlavor(v10, v8, v9);
  [(id)-[FigCaptureCameraSourcePipeline captureDevice](v8) zoomFactor];
  BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(v9, v11);
  uint64_t v12 = [v7 prepareStillImageCaptureNowWithSettings:v9];
  if (!v12) {
    return;
  }
  uint64_t v13 = v12;
  uint64_t v16 = v1;
  LODWORD(v15) = v12;
  FigDebugAssert3();
LABEL_15:
  v14 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus((uint64_t)v4, objc_msgSend(v3, "settingsID", v15, v16), v13);
  captureSession_postNotificationWithPayload(v2, @"IrisPreparationComplete", v14);
}

@end