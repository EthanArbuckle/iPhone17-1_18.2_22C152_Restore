@interface FigCaptureSessionParsedCameraSourceConfiguration
- (FigCaptureSourceConfiguration)cameraConfiguration;
- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration;
- (NSArray)cameraCalibrationDataConnectionConfigurations;
- (NSArray)metadataObjectConnectionConfigurations;
- (NSArray)movieFileDetectedObjectMetadataConnectionConfigurations;
- (NSArray)pointCloudDataConnectionConfigurations;
- (NSArray)previewDerivedConnectionConfigurations;
- (NSArray)videoCaptureConnectionConfigurations;
- (NSArray)videoDataConnectionConfigurations;
- (NSArray)visionDataConnectionConfigurations;
- (id)initWithConnectionConfigurations:(char)a3 clientSetsUserInitiatedCaptureRequestTime:(int)a4 smartStyleEnabled:(FigVideoCaptureConnectionConfiguration *)a5 sceneClassifierConnectionConfigurationOut:;
- (void)dealloc;
@end

@implementation FigCaptureSessionParsedCameraSourceConfiguration

- (NSArray)metadataObjectConnectionConfigurations
{
  return self->_metadataObjectConnectionConfigurations;
}

- (NSArray)previewDerivedConnectionConfigurations
{
  return self->_previewDerivedConnectionConfigurations;
}

- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration
{
  return self->_videoPreviewSinkConnectionConfiguration;
}

- (NSArray)videoDataConnectionConfigurations
{
  return self->_videoDataConnectionConfigurations;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

- (NSArray)videoCaptureConnectionConfigurations
{
  return self->_videoCaptureConnectionConfigurations;
}

- (id)initWithConnectionConfigurations:(char)a3 clientSetsUserInitiatedCaptureRequestTime:(int)a4 smartStyleEnabled:(FigVideoCaptureConnectionConfiguration *)a5 sceneClassifierConnectionConfigurationOut:
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v100.receiver = a1;
  v100.super_class = (Class)FigCaptureSessionParsedCameraSourceConfiguration;
  v10 = objc_msgSendSuper2(&v100, sel_init);
  if (!v10) {
    return 0;
  }
  v11 = v10;
  v83 = a5;
  char v84 = a3;
  int v85 = a4;
  int v99 = 0;
  v12 = (void *)[MEMORY[0x1E4F1CA48] array];
  v13 = (void *)[MEMORY[0x1E4F1CA48] array];
  v14 = (void *)[MEMORY[0x1E4F1CA48] array];
  v87 = (void *)[MEMORY[0x1E4F1CA48] array];
  v15 = (void *)[MEMORY[0x1E4F1CA48] array];
  v86 = (void *)[MEMORY[0x1E4F1CA48] array];
  v89 = (void *)[MEMORY[0x1E4F1CA48] array];
  v88 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v90 = v11;
  v11[1] = (id)objc_msgSend((id)objc_msgSend(a2, "firstObject"), "sourceConfiguration");
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v16 = [a2 countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v96;
LABEL_5:
    uint64_t v19 = 0;
    while (2)
    {
      if (*(void *)v96 != v18) {
        objc_enumerationMutation(a2);
      }
      v20 = *(void **)(*((void *)&v95 + 1) + 8 * v19);
      switch(objc_msgSend((id)objc_msgSend(v20, "sinkConfiguration"), "sinkType"))
      {
        case 1u:
          int v21 = [v20 underlyingDeviceType];
          if (v21 == objc_msgSend((id)objc_msgSend(v20, "sourceConfiguration"), "sourceDeviceType"))
          {
            if (*((void *)v90 + 2))
            {
              fig_log_get_emitter();
              uint64_t v82 = v5;
              LODWORD(v81) = 0;
              FigDebugAssert3();
            }
            *((void *)v90 + 2) = v20;
          }
          goto LABEL_21;
        case 3u:
          *((void *)v90 + 6) = v20;
          goto LABEL_45;
        case 4u:
          if ([v20 mediaType] == 1986618469) {
            goto LABEL_43;
          }
          if ([v20 mediaType] != 1835365473
            || !FigMetadataItemConnectionConfigurationRequiresObjectDetection(v20))
          {
            goto LABEL_45;
          }
          [v13 addObject:v20];
          v22 = v86;
          goto LABEL_44;
        case 6u:
          [v14 addObject:v20];
          if (objc_msgSend((id)objc_msgSend(v20, "videoDataSinkConfiguration"), "optimizedForPreview")
            && (![v20 videoStabilizationMethod]
             || [v20 videoStabilizationMethod] == 4))
          {
            goto LABEL_21;
          }
          goto LABEL_43;
        case 8u:
          v22 = v15;
          goto LABEL_44;
        case 0xAu:
          if ([v20 mediaType] == 1986618469)
          {
            *((void *)v90 + 6) = v20;
            goto LABEL_54;
          }
          if ([v20 mediaType] == 1835365473)
          {
            if (!FigMetadataItemConnectionConfigurationRequiresObjectDetection(v20)) {
              goto LABEL_54;
            }
            v30 = v86;
          }
          else
          {
            if ([v20 mediaType] != 1885564004) {
              goto LABEL_54;
            }
            v30 = v89;
          }
          [v30 addObject:v20];
LABEL_54:
          if (objc_msgSend((id)objc_msgSend(v20, "irisSinkConfiguration"), "irisMovieCaptureEnabled")
            && objc_msgSend((id)objc_msgSend(v20, "sourceConfiguration"), "sourceDeviceType") != 10)
          {
LABEL_43:
            v22 = v13;
LABEL_44:
            objc_msgSend(v22, "addObject:", v20, v81, v82);
          }
LABEL_45:
          if (v17 != ++v19) {
            continue;
          }
          uint64_t v31 = [a2 countByEnumeratingWithState:&v95 objects:v103 count:16];
          uint64_t v17 = v31;
          if (!v31) {
            goto LABEL_58;
          }
          goto LABEL_5;
        case 0xBu:
          if ([v20 mediaType] == 1885564004) {
            goto LABEL_26;
          }
          *((void *)v90 + 7) = v20;
          goto LABEL_45;
        case 0xCu:
LABEL_21:
          v22 = v12;
          goto LABEL_44;
        case 0xDu:
          unsigned int v23 = [v20 underlyingDeviceType];
          if (v23 <= 9 && ((1 << v23) & 0x310) != 0) {
            goto LABEL_120;
          }
          unsigned int v25 = v23;
          unsigned int v26 = objc_msgSend((id)objc_msgSend(v20, "sourceConfiguration"), "sourceDeviceType");
          BOOL v27 = v26 > 9 || ((1 << v26) & 0x310) == 0;
          if (!v27 && v25 != 2) {
            goto LABEL_120;
          }
          v29 = v87;
          goto LABEL_42;
        case 0xFu:
LABEL_26:
          v22 = v89;
          goto LABEL_44;
        case 0x10u:
          v29 = v88;
LABEL_42:
          [v29 addObject:v20];
          goto LABEL_43;
        default:
          goto LABEL_45;
      }
    }
  }
LABEL_58:
  if ([*((id *)v90 + 1) spatialOverCaptureEnabled]
    && !objc_msgSend((id)objc_msgSend(*((id *)v90 + 2), "videoPreviewSinkConfiguration"), "primaryCaptureRectModificationEnabled"))
  {
LABEL_120:

    return 0;
  }
  v32 = (void *)*((void *)v90 + 1);
  int v101 = 0;
  unsigned int SourceDeviceType = FigCaptureSourceGetSourceDeviceType([v32 source], &v101);
  if (SourceDeviceType <= 0x14 && ((1 << SourceDeviceType) & 0x100420) != 0)
  {
    [v32 variableFrameRateVideoCaptureEnabled];
    goto LABEL_63;
  }
  unsigned int v40 = SourceDeviceType - 21;
  int v41 = [v32 variableFrameRateVideoCaptureEnabled];
  if (v40 <= 0xFFFFFFFB && ([v32 smartCameraEnabled] | v41) == 1)
  {
    v42 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
    [(FigCaptureConnectionConfiguration *)v42 setSourceConfiguration:v32];
    -[FigCaptureConnectionConfiguration setUnderlyingDeviceType:](v42, "setUnderlyingDeviceType:", [v32 sourceDeviceType]);
    [(FigCaptureConnectionConfiguration *)v42 setSinkConfiguration:[[FigCaptureInternalSinkConfiguration alloc] initWithSinkSubType:1]];
    FigCaptureSetOptimalVideoPreviewDataConnectionDimensions(v42);
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    unsigned int v45 = 4;
    do
    {
      if ((int)v44 >= 256 && (int)v43 > 255) {
        break;
      }
      uint64_t v44 = ((int)(2
                               * v45
                               * vcvtps_s32_f32((float)[(FigVideoCaptureConnectionConfiguration *)v42 outputWidth]/ (float)(int)(2 * v45)))/ (int)v45);
      uint64_t v43 = ((int)(2
                               * v45
                               * vcvtps_s32_f32((float)[(FigVideoCaptureConnectionConfiguration *)v42 outputHeight]/ (float)(int)(2 * v45)))/ (int)v45);
      BOOL v46 = v45 > 3;
      v45 >>= 1;
    }
    while (v46);
    if ((int)v44 < 256 || (int)v43 <= 255)
    {
      int v101 = -12782;
      if (!v42) {
        goto LABEL_63;
      }
    }
    else
    {
      [(FigVideoCaptureConnectionConfiguration *)v42 setOutputWidth:v44];
      [(FigVideoCaptureConnectionConfiguration *)v42 setOutputHeight:v43];
      if (!v42) {
        goto LABEL_63;
      }
    }
    if (!v101)
    {
      *v83 = v42;
      v47 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v15, [(FigCaptureConnectionConfiguration *)v42 underlyingDeviceType]);
      if ((FigCaptureMetadataObjectConfigurationRequiresSceneClassification(v47) & 1) == 0) {
        [v12 addObject:v42];
      }
    }
  }
LABEL_63:
  v34 = (void *)*((void *)v90 + 1);
  v35 = (void *)[*((id *)v90 + 6) irisSinkConfiguration];
  v36 = (void *)[*((id *)v90 + 6) stillImageSinkConfiguration];
  int v101 = 0;
  int StillImageNoiseReductionAndFusionScheme = FigCaptureSourceGetStillImageNoiseReductionAndFusionScheme([v34 source], &v101);
  int v38 = v101;
  if (v101)
  {
    fig_log_get_emitter();
    uint64_t v82 = v5;
    LODWORD(v81) = v38;
    FigDebugAssert3();
  }
  else
  {
    if (StillImageNoiseReductionAndFusionScheme > 2) {
      goto LABEL_85;
    }
    if (([v34 smartCameraEnabled] & 1) != 0
      || FigCaptureZeroShutterLagEnabled(v34, v35, v36, v84))
    {
      v39 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
      [(FigCaptureConnectionConfiguration *)v39 setSourceConfiguration:v34];
      -[FigCaptureConnectionConfiguration setUnderlyingDeviceType:](v39, "setUnderlyingDeviceType:", [v34 sourceDeviceType]);
      [(FigCaptureConnectionConfiguration *)v39 setSinkConfiguration:[[FigCaptureInternalSinkConfiguration alloc] initWithSinkSubType:0]];
      FigCaptureSetOptimalVideoPreviewDataConnectionDimensions(v39);
      goto LABEL_82;
    }
  }
  v39 = 0;
LABEL_82:
  if (v101)
  {
    fig_log_get_emitter();
LABEL_119:
    FigDebugAssert3();
    goto LABEL_120;
  }
  if (v39) {
    [v12 addObject:v39];
  }
LABEL_85:
  v48 = (void *)*((void *)v90 + 1);
  uint64_t v49 = objc_msgSend(*((id *)v90 + 6), "irisSinkConfiguration", v81, v82);
  uint64_t v50 = [*((id *)v90 + 6) stillImageSinkConfiguration];
  if (([v48 cinematicFramingEnabled] & 1) != 0
    || (int v51 = [v48 manualCinematicFramingEnabled], !(v49 | v50))
    || !v85
    || v51)
  {
    int v99 = 0;
  }
  else
  {
    v52 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
    [(FigCaptureConnectionConfiguration *)v52 setSourceConfiguration:v48];
    -[FigCaptureConnectionConfiguration setUnderlyingDeviceType:](v52, "setUnderlyingDeviceType:", [v48 sourceDeviceType]);
    [(FigCaptureConnectionConfiguration *)v52 setSinkConfiguration:[[FigCaptureInternalSinkConfiguration alloc] initWithSinkSubType:3]];
    FigCaptureSetOptimalVideoPreviewDataConnectionDimensions(v52);
    int v99 = 0;
    if (v52) {
      [v12 addObject:v52];
    }
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v53 = [v15 countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v92;
    while (2)
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v92 != v55) {
          objc_enumerationMutation(v15);
        }
        v57 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        int v58 = [v57 underlyingDeviceType];
        v59 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v12, v58);
        if ((FigCaptureMetadataObjectConfigurationRequiresMetadataDetectorPipeline(v57) & 1) != 0
          || FigCaptureMetadataObjectConfigurationRequiresSceneClassification(v57))
        {
          if (v59) {
            v60 = v12;
          }
          else {
            v60 = v13;
          }
          [v60 addObject:v57];
        }
        v61 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v14, v58);
        if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v57)) {
          char IsSecureMetadataSource = FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v57, "sourceConfiguration"), "source"), &v99);
        }
        else {
          char IsSecureMetadataSource = 1;
        }
        if (v99)
        {
          fig_log_get_emitter();
          goto LABEL_119;
        }
        if (v61) {
          char v63 = 1;
        }
        else {
          char v63 = IsSecureMetadataSource;
        }
        if ((v63 & 1) == 0) {
          [v13 addObject:v57];
        }
      }
      uint64_t v54 = [v15 countByEnumeratingWithState:&v91 objects:v102 count:16];
      if (v54) {
        continue;
      }
      break;
    }
  }
  id v64 = v90;
  v65 = (void *)*((void *)v90 + 7);
  if (!v65) {
    goto LABEL_127;
  }
  int v66 = [v65 underlyingDeviceType];
  v67 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v15, v66);
  if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v67)) {
    goto LABEL_127;
  }
  if (objc_msgSend((id)objc_msgSend(*((id *)v90 + 7), "sourceConfiguration"), "sourceDeviceType") == 13)
  {
    uint64_t v68 = *((void *)v90 + 7);
  }
  else
  {
    v69 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v12, v66);
    v70 = FigCaptureConnectionConfigurationWithUnderlyingDeviceType(v13, v66);
    uint64_t v68 = *((void *)v90 + 7);
    if (v69 || !v70)
    {
      v71 = v12;
      goto LABEL_126;
    }
  }
  v71 = v13;
LABEL_126:
  [v71 addObject:v68];
LABEL_127:
  uint64_t v72 = [v12 count];
  if (v72) {
    uint64_t v72 = [v12 copy];
  }
  *((void *)v90 + 3) = v72;
  uint64_t v73 = [v13 count];
  if (v73) {
    uint64_t v73 = [v13 copy];
  }
  *((void *)v90 + 4) = v73;
  uint64_t v74 = [v14 count];
  if (v74) {
    uint64_t v74 = [v14 copy];
  }
  *((void *)v90 + 5) = v74;
  uint64_t v75 = [v87 count];
  if (v75) {
    uint64_t v75 = [v87 copy];
  }
  *((void *)v90 + 8) = v75;
  uint64_t v76 = [v15 count];
  if (v76) {
    uint64_t v76 = [v15 copy];
  }
  *((void *)v90 + 9) = v76;
  uint64_t v77 = [v86 count];
  if (v77) {
    uint64_t v77 = [v86 copy];
  }
  *((void *)v90 + 10) = v77;
  uint64_t v78 = [v89 count];
  if (v78) {
    uint64_t v78 = [v89 copy];
  }
  *((void *)v90 + 11) = v78;
  uint64_t v79 = [v88 count];
  if (v79) {
    uint64_t v79 = [v88 copy];
  }
  *((void *)v90 + 12) = v79;
  return v64;
}

- (FigCaptureSourceConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (NSArray)visionDataConnectionConfigurations
{
  return self->_visionDataConnectionConfigurations;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedCameraSourceConfiguration;
  [(FigCaptureSessionParsedCameraSourceConfiguration *)&v3 dealloc];
}

- (NSArray)pointCloudDataConnectionConfigurations
{
  return self->_pointCloudDataConnectionConfigurations;
}

- (NSArray)movieFileDetectedObjectMetadataConnectionConfigurations
{
  return self->_movieFileDetectedObjectMetadataConnectionConfigurations;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (NSArray)cameraCalibrationDataConnectionConfigurations
{
  return self->_cameraCalibrationDataConnectionConfigurations;
}

@end