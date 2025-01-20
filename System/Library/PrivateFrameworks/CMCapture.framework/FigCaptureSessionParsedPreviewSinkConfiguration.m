@interface FigCaptureSessionParsedPreviewSinkConfiguration
- (FigCaptureSourceConfiguration)cameraConfiguration;
- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration;
- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)previewSmartStyleCoefficientsTimeMachineConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)previewTimeMachineConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)sceneClassifierConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)videoThumbnailConnectionConfiguration;
- (int)sourceDeviceType;
- (void)dealloc;
- (void)initWithParsedCameraSourceConfiguration:(int)a3 sourceDeviceType:;
@end

@implementation FigCaptureSessionParsedPreviewSinkConfiguration

- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration
{
  return self->_videoPreviewSinkConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)videoThumbnailConnectionConfiguration
{
  return self->_videoThumbnailConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)sceneClassifierConnectionConfiguration
{
  return self->_sceneClassifierConnectionConfiguration;
}

- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration
{
  return self->_metadataObjectConnectionConfiguration;
}

- (void)initWithParsedCameraSourceConfiguration:(int)a3 sourceDeviceType:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v34.receiver = a1;
  v34.super_class = (Class)FigCaptureSessionParsedPreviewSinkConfiguration;
  v5 = objc_msgSendSuper2(&v34, sel_init);
  if (!v5) {
    return 0;
  }
  v6 = v5;
  *((_DWORD *)v5 + 20) = a3;
  v7 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType((void *)[a2 metadataObjectConnectionConfigurations], a3);
  v6[7] = v7;
  char v29 = FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v7);
  char v28 = FigCaptureMetadataObjectConfigurationRequiresSceneClassification(v7);
  if (objc_msgSend((id)objc_msgSend(a2, "stillImageConnectionConfiguration"), "underlyingDeviceType") == a3) {
    v8 = (void *)[a2 stillImageConnectionConfiguration];
  }
  else {
    v8 = 0;
  }
  v6[8] = v8;
  v9 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType((void *)[a2 previewDerivedConnectionConfigurations], a3);
  if (!objc_msgSend((id)objc_msgSend(v9, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", &__block_literal_global_34)), "count"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  v24 = a2;
  v25 = v6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v10) {
    goto LABEL_29;
  }
  uint64_t v11 = v10;
  v26 = v6 + 5;
  v27 = v6 + 6;
  uint64_t v12 = *(void *)v31;
  v13 = v6 + 4;
  v14 = v6 + 3;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v9);
      }
      v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
      int v17 = objc_msgSend((id)objc_msgSend(v16, "sinkConfiguration"), "sinkType");
      if (v17 > 11)
      {
        if (v17 != 14)
        {
          v18 = v25 + 2;
          if (v17 != 12) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
        int v19 = objc_msgSend((id)objc_msgSend(v16, "sinkConfiguration"), "subType");
        v18 = v13;
        switch(v19)
        {
          case 0:
            goto LABEL_19;
          case 3:
            v18 = v27;
LABEL_19:
            void *v18 = v16;
            break;
          case 1:
            v18 = v26;
            if ((v28 & 1) == 0) {
              goto LABEL_19;
            }
            break;
        }
      }
      else
      {
        v18 = v25 + 1;
        if (v17 == 1) {
          goto LABEL_19;
        }
        if (v17 == 11)
        {
          v18 = v14;
          if ((v29 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
LABEL_20:
      ++v15;
    }
    while (v11 != v15);
    uint64_t v20 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    uint64_t v11 = v20;
  }
  while (v20);
LABEL_29:
  id v21 = (id)[v24 cameraConfiguration];
  v22 = v25;
  v25[9] = v21;
  return v22;
}

- (FigVideoCaptureConnectionConfiguration)previewTimeMachineConnectionConfiguration
{
  return self->_previewTimeMachineConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)previewSmartStyleCoefficientsTimeMachineConnectionConfiguration
{
  return self->_previewSmartStyleCoefficientsTimeMachineConnectionConfiguration;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedPreviewSinkConfiguration;
  [(FigCaptureSessionParsedPreviewSinkConfiguration *)&v3 dealloc];
}

- (FigCaptureSourceConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

BOOL __108__FigCaptureSessionParsedPreviewSinkConfiguration_initWithParsedCameraSourceConfiguration_sourceDeviceType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkType") != 6;
}

@end