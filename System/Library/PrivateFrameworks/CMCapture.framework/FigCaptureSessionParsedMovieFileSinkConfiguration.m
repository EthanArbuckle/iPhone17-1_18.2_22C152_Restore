@interface FigCaptureSessionParsedMovieFileSinkConfiguration
- (FigAudioCaptureConnectionConfiguration)audioConnectionConfiguration;
- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration;
- (FigMetadataItemCaptureConnectionConfiguration)cameraDebugInfoMetadataConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)sceneClassifierConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)videoConnectionConfiguration;
- (NSArray)detectedObjectMetadataConnectionConfigurations;
- (void)dealloc;
- (void)initWithCaptureConnectionConfigurations:(void *)a3 stillImageConnectionConfiguration:(void *)a4 sceneClassifierConnectionConfigurationsBySourceID:;
@end

@implementation FigCaptureSessionParsedMovieFileSinkConfiguration

- (void)initWithCaptureConnectionConfigurations:(void *)a3 stillImageConnectionConfiguration:(void *)a4 sceneClassifierConnectionConfigurationsBySourceID:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v30.receiver = a1;
  v30.super_class = (Class)FigCaptureSessionParsedMovieFileSinkConfiguration;
  v7 = objc_msgSendSuper2(&v30, sel_init);
  if (!v7) {
    return 0;
  }
  v21 = a4;
  v22 = a3;
  v23 = v7;
  v24 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [a2 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (!v8) {
    goto LABEL_26;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v27;
  uint64_t v25 = *MEMORY[0x1E4F217C0];
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(a2);
      }
      v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      int v13 = [v12 mediaType];
      if (v13 > 1936684397)
      {
        v15 = v23 + 1;
        if (v13 == 1986618469) {
          goto LABEL_23;
        }
        v15 = v23 + 2;
        if (v13 == 1936684398) {
          goto LABEL_23;
        }
      }
      else
      {
        if (v13 == 1685091432)
        {
          v15 = v23 + 5;
LABEL_23:
          void *v15 = v12;
          continue;
        }
        if (v13 == 1835365473
          && objc_msgSend((id)objc_msgSend(v12, "sourceConfiguration"), "sourceType") == 1)
        {
          if (![v12 formatDescription]
            || (CFArrayRef Identifiers = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)[v12 formatDescription]),
                ![(__CFArray *)Identifiers count]))
          {
LABEL_30:
            fig_log_get_emitter();
            FigDebugAssert3();
            FigSignalErrorAt();

            return 0;
          }
          if (FigMetadataItemConnectionConfigurationRequiresObjectDetection(v12)) {
            [v24 addObject:v12];
          }
          if ([(__CFArray *)Identifiers containsObject:v25])
          {
            v15 = v23 + 3;
            if (v23[3]) {
              goto LABEL_30;
            }
            goto LABEL_23;
          }
        }
      }
    }
    uint64_t v9 = [a2 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_26:
  v16 = v23;
  v23[6] = v22;
  id v17 = (id)[v24 count];
  if (v17) {
    id v17 = v24;
  }
  v23[4] = v17;
  v18 = objc_msgSend(v21, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)v23[1], "sourceConfiguration"), "sourceID"));
  int v19 = [v18 underlyingDeviceType];
  if (v19 == [(id)v23[1] underlyingDeviceType]) {
    v23[7] = v18;
  }
  return v16;
}

- (FigVideoCaptureConnectionConfiguration)videoConnectionConfiguration
{
  return self->_videoConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

- (NSArray)detectedObjectMetadataConnectionConfigurations
{
  return self->_detectedObjectMetadataConnectionConfigurations;
}

- (FigAudioCaptureConnectionConfiguration)audioConnectionConfiguration
{
  return self->_audioConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)sceneClassifierConnectionConfiguration
{
  return self->_sceneClassifierConnectionConfiguration;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (FigMetadataItemCaptureConnectionConfiguration)cameraDebugInfoMetadataConnectionConfiguration
{
  return self->_cameraDebugInfoMetadataConnectionConfiguration;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedMovieFileSinkConfiguration;
  [(FigCaptureSessionParsedMovieFileSinkConfiguration *)&v3 dealloc];
}

@end