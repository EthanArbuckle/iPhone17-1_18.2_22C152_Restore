@interface StillImageSinkPrepareToCaptureBracket
@end

@implementation StillImageSinkPrepareToCaptureBracket

void __captureSession_StillImageSinkPrepareToCaptureBracket_block_invoke(void *a1)
{
  v3 = (void *)a1[5];
  v2 = (const void *)a1[6];
  v4 = (void *)a1[4];
  v5 = (void *)[*(id *)(CMBaseObjectGetDerivedStorage() + 664) stillImageSinkPipelineSessionStorageWithSinkID:v4];
  v6 = (void *)[v5 stillImageSinkPipeline];
  v7 = (void *)[v6 stillImageCoordinatorNode];
  if (_FigIsCurrentDispatchQueue())
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v15 = v1;
    LODWORD(v14) = 0;
LABEL_11:
    FigDebugAssert3();
LABEL_12:
    uint64_t v12 = FigSignalErrorAt();
    if (!v12) {
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
    uint64_t v15 = v1;
    LODWORD(v14) = 0;
    FigDebugAssert3();
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", objc_msgSend(v6, "sinkID")) & 1) == 0)
  {
    uint64_t v15 = v1;
    LODWORD(v14) = 0;
    goto LABEL_11;
  }
  [v3 setClientInitiatedPrepareSettings:1];
  unint64_t v8 = stillImageSinkPipelineSessionStorage_stillImageOutputDimensionsForSettings(v5, v3);
  unint64_t v9 = HIDWORD(v8);
  [v3 setOutputWidth:v8];
  [v3 setOutputHeight:v9];
  objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](objc_msgSend(v5, "cameraSourcePipeline")), "zoomFactor");
  BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(v3, v10);
  uint64_t v11 = [v7 prepareStillImageCaptureNowWithSettings:v3];
  if (!v11) {
    return;
  }
  uint64_t v12 = v11;
  uint64_t v15 = v1;
  LODWORD(v14) = v11;
  FigDebugAssert3();
LABEL_15:
  v13 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus((uint64_t)v4, objc_msgSend(v3, "settingsID", v14, v15), v12);
  captureSession_postNotificationWithPayload(v2, @"BracketPreparationComplete", v13);
}

@end