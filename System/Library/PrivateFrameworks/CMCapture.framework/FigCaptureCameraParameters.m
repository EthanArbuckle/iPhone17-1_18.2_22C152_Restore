@interface FigCaptureCameraParameters
+ (id)cinematicFramingVirtualCameraConfigurationForPortType:(id)a3 sensorIDString:(id)a4;
+ (id)sdofTuningParametersForSensorIDDictionary:(id)a3 zoomFactor:(float)a4;
+ (id)sensorIDStringFromMetadata:(id)a3;
+ (id)sensorIDStringFromModuleInfo:(id)a3;
+ (id)sharedInstance;
+ (id)temporalFilterSessionConfigurationForPortType:(id)a3 sensorIDString:(id)a4;
+ (int)movieFileMaxLossyCompressionLevelForPixelFormat:(unsigned int)a3;
+ (int)previewMaxLossyCompressionLevel;
+ (int)stillImageMaxLossyCompressionLevel;
+ (int)videoDataMaxLossyCompressionLevel;
+ (unsigned)sensorIDFromSensorIDString:(id)a3;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)maxFocusPixelHorizontalPixelBufferDimensions;
- ($2ACC23B9A21F50F5CC728381CA870116)landmarksVersionForInferenceType:(int)a3;
- (BOOL)chromaticDefringingEnabledForSlomoForPortType:(id)a3 sensorIDString:(id)a4;
- (BOOL)chromaticDefringingEnabledForVideoForPortType:(id)a3 sensorIDString:(id)a4;
- (BOOL)complementMatteSuppressionDecisionWithISPDetectedFaces;
- (BOOL)deepZoomTransferWithZoomedImageEnabledForPortType:(id)a3 sensorIDString:(id)a4;
- (BOOL)panoramaRequiresLTMLockingForPortType:(id)a3 sensorIDString:(id)a4;
- (BOOL)portraitPreviewForegroundBlurEnabledForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5;
- (BOOL)portraitTapToRefocusPrevented;
- (FigCaptureCameraParameters)init;
- (FigCaptureCameraParameters)initWithContentsOfFile:(id)a3;
- (FigCaptureCameraParameters)initWithModelSpecificName:(id)a3;
- (NSDictionary)cameraParameters;
- (NSDictionary)cameraTuningParameters;
- (NSDictionary)commonNRFParameters;
- (NSDictionary)commonVideoGreenGhostMitigationParameters;
- (NSDictionary)motionAttachmentsParameters;
- (NSDictionary)photoEncoderParameters;
- (NSDictionary)stereoDisparityParameters;
- (NSDictionary)temporalNoiseReductionParameters;
- (NSDictionary)videoStabilizationParameters;
- (NSDictionary)videoStabilizationSTFParameters;
- (id)_initWithModelSpecificName:(void *)a3 fromFile:;
- (id)actionCameraSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4;
- (id)chromaticDefringingParametersForPortType:(id)a3 sensorIDString:(id)a4;
- (id)focalLengthCharacterizationForStream:(id)a3;
- (id)focusPixelDisparityParametersForPortType:(id)a3 sensorIDString:(id)a4;
- (id)focusPixelsPatternsForPortType:(id)a3 sensorIDString:(id)a4;
- (id)portraitSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4 zoomFactorRelativeToWidePortType:(float)a5;
- (id)quadraSubPixelSwitchingParametersForPortType:(id)a3 sensorIDString:(id)a4;
- (id)sensorIDDictionaryForPortType:(id)a3 sensorIDString:(id)a4;
- (id)sensorIDDictionaryForStream:(id)a3;
- (id)stereoPhotoCaptureSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4;
- (id)stereoVideoCaptureSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4;
- (int)coreImagePortraitFilterVersion;
- (int)deepZoomVersion;
- (int)depthProcessorVersion;
- (int)deviceGeneration;
- (int)disparityRefinementTypeForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5;
- (int)disparityVersion;
- (int)disparityVersionForPortType:(id)a3 sensorIDString:(id)a4;
- (int)distortionCorrectionVersion;
- (int)focusPixelDisparityVersionForPortType:(id)a3 sensorIDString:(id)a4;
- (int)fsdNetStereoImagesAlignmentForPortType:(id)a3 sensorIDString:(id)a4;
- (int)gainMapVersion;
- (int)landmarksConstellationPointCountForInferenceType:(int)a3;
- (int)learnedMattingVersion;
- (int)mattingVersion;
- (int)mattingVersionForPortType:(id)a3 sensorIDString:(id)a4;
- (int)meteorHeadroomProcessingType;
- (int)nrfVersion;
- (int)personSemanticsVersion;
- (int)portraitSceneMonitorVersionForPortType:(id)a3 sensorIDString:(id)a4;
- (int)sdofRenderingVersionForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5;
- (int)videoGreenGhostBrightLightMitigationVersion;
- (int)videoGreenGhostLowLightMitigationVersion;
- (int)videoStabilizationProcessorVersion;
- (uint64_t)_readAndPreprocessCameraParametersForModelSpecificName:(void *)a3 fromFile:;
- (void)dealloc;
@end

@implementation FigCaptureCameraParameters

- (int)deviceGeneration
{
  id v2 = [(NSDictionary *)self->_commonNRFParameters objectForKeyedSubscript:@"DeviceGeneration"];
  if (v2)
  {
    LODWORD(v2) = [v2 intValue];
  }
  return (int)v2;
}

- (int)deepZoomVersion
{
  id v2 = [(NSDictionary *)self->_commonDeepZoomParameters objectForKeyedSubscript:@"Version"];
  if (v2)
  {
    LODWORD(v2) = [v2 intValue];
  }
  return (int)v2;
}

- (int)portraitSceneMonitorVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  LODWORD(v4) = 1.0;
  id v5 = [(FigCaptureCameraParameters *)self portraitSceneMonitoringParametersForPortType:a3 sensorIDString:a4 zoomFactorRelativeToWidePortType:v4];
  if (!v5) {
    return 0;
  }
  v6 = (void *)[v5 objectForKeyedSubscript:@"Version"];
  if (!v6) {
    return 0;
  }
  return [v6 intValue];
}

- (id)portraitSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4 zoomFactorRelativeToWidePortType:(float)a5
{
  if (!a3) {
    goto LABEL_24;
  }
  if (!a4) {
    goto LABEL_24;
  }
  id v7 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
  if (!v7) {
    goto LABEL_24;
  }
  v8 = (void *)[v7 objectForKeyedSubscript:@"PortraitSceneMonitoringParameters"];
  if (v8) {
    return v8;
  }
  portraitSceneMonitoringParametersByZoomFactor = self->_portraitSceneMonitoringParametersByZoomFactor;
  if (!portraitSceneMonitoringParametersByZoomFactor) {
    return 0;
  }
  if (a5 == 0.0)
  {
LABEL_24:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  id v10 = [(NSDictionary *)portraitSceneMonitoringParametersByZoomFactor objectForKeyedSubscript:@"ZoomSpecificParameters"];
  v11 = objc_msgSend((id)objc_msgSend(v10, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_109);
  objc_msgSend((id)objc_msgSend(v11, "firstObject"), "floatValue");
  if (v12 != 1.0) {
    return 0;
  }
  float v13 = fmaxf(a5, 1.0);
  v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NSDictionary objectForKeyedSubscript:](self->_portraitSceneMonitoringParametersByZoomFactor, "objectForKeyedSubscript:", @"Common"));
  int v15 = [v11 count];
  unsigned int v17 = v15 - 1;
  while (1)
  {
    BOOL v18 = __OFSUB__(v15--, 1);
    if (v15 < 0 != v18) {
      break;
    }
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v17), "floatValue");
    float v19 = v13 - *(float *)&v16;
    if ((float)(v13 - *(float *)&v16) < 0.0) {
      float v19 = -(float)(v13 - *(float *)&v16);
    }
    if (v13 <= *(float *)&v16)
    {
      double v16 = v19;
      --v17;
      if (v19 >= 0.001) {
        continue;
      }
    }
    goto LABEL_16;
  }
  int v15 = -1;
LABEL_16:
  if (v15 == -1) {
    int v20 = 0;
  }
  else {
    int v20 = v15;
  }
  objc_msgSend(v14, "addEntriesFromDictionary:", objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(v11, "objectAtIndexedSubscript:", v20, v16)));
  return v14;
}

- (BOOL)portraitPreviewForegroundBlurEnabledForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5
{
  if (!a3
    || !a4
    || (v9 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) == 0|| (v11 = v9, *(float *)&double v10 = a5, v12 = [(FigCaptureCameraParameters *)self sdofRenderingVersionForPortType:a3 sensorIDString:a4 zoomFactor:v10], !v12)|| (v14 = v12, *(float *)&v13 = a5, (v15 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v11, v13)) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  double v16 = v15;
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"RenderingV%d", v14);
  if (!v17
    || (uint64_t v18 = v17, (v19 = objc_msgSend(NSString, "stringWithFormat:", @"RenderingV%d_NMP", v14)) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
  uint64_t v20 = v19;
  v21 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v18), "objectForKeyedSubscript:", @"fgNRings");
  v22 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v20), "objectForKeyedSubscript:", @"fgNRings");
  if (v21 && [v21 unsignedIntValue])
  {
    BOOL v23 = 1;
  }
  else if (v22)
  {
    BOOL v23 = [v22 unsignedIntValue] != 0;
  }
  else
  {
    BOOL v23 = 0;
  }
  return v23 & (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v18), "objectForKeyedSubscript:", @"disablePortraitPreviewForegroundBlur"), "BOOLValue") ^ 1);
}

- (int)sdofRenderingVersionForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5
{
  if (!a3 || ([a3 isEqualToString:*MEMORY[0x1E4F52DE0]] & 1) != 0) {
    return 0;
  }
  if (!a4
    || (id v9 = [(FigCaptureCameraParameters *)self sensorIDDictionaryForPortType:a3 sensorIDString:a4]) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  *(float *)&double v10 = a5;
  id v11 = objc_msgSend(+[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v9, v10), "objectForKeyedSubscript:", @"Version");
  return [v11 intValue];
}

+ (id)sdofTuningParametersForSensorIDDictionary:(id)a3 zoomFactor:(float)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    fig_log_get_emitter();
    uint64_t v32 = v4;
    LODWORD(v31) = 0;
    FigDebugAssert3();
    double v13 = 0;
    float v8 = 1.0;
    goto LABEL_14;
  }
  uint64_t v7 = [a3 objectForKeyedSubscript:@"SDOFRenderingParameters"];
  float v8 = 1.0;
  if (v7)
  {
    double v13 = (void *)v7;
    goto LABEL_14;
  }
  id v9 = (void *)[a3 objectForKeyedSubscript:@"SDOFRenderingParametersByZoomFactor"];
  if (!v9) {
    goto LABEL_28;
  }
  if (a4 == 0.0)
  {
    fig_log_get_emitter();
    uint64_t v32 = v4;
    LODWORD(v31) = 0;
    FigDebugAssert3();
    goto LABEL_28;
  }
  double v10 = v9;
  id v11 = objc_msgSend((id)objc_msgSend(v9, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_257);
  objc_msgSend((id)objc_msgSend(v11, "firstObject"), "floatValue");
  if (v12 != 1.0)
  {
LABEL_28:
    double v13 = 0;
    goto LABEL_14;
  }
  a4 = fmaxf(a4, 1.0);
  double v13 = objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(v11, "firstObject"));
  objc_msgSend((id)objc_msgSend(v11, "firstObject"), "floatValue");
  float v8 = v14;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v15 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
LABEL_8:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v11);
      }
      uint64_t v19 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
      [v19 floatValue];
      if (v20 > a4) {
        break;
      }
      double v13 = (void *)[v10 objectForKeyedSubscript:v19];
      [v19 floatValue];
      float v8 = v21;
      if (v16 == ++v18)
      {
        uint64_t v16 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v16) {
          goto LABEL_8;
        }
        break;
      }
    }
  }
LABEL_14:
  if (a4 != v8)
  {
    v22 = (void *)[v13 objectForKeyedSubscript:@"InterpolableParameters"];
    if (v22)
    {
      BOOL v23 = v22;
      uint64_t v24 = [v22 objectForKeyedSubscript:@"TargetValues"];
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", @"ZoomFactorForTargetValues"), "floatValue");
        if (v26 != 0.0)
        {
          float v27 = (float)(v26 - a4) / (float)(v26 - v8);
          if (v27 > 1.0) {
            float v27 = 1.0;
          }
          if (v27 >= 0.0) {
            float v28 = v27;
          }
          else {
            float v28 = 0.0;
          }
          uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", v13, v31, v32);
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __fccp_fineTuneSDOFTuningParametersForContinuousZoom_block_invoke;
          v37[3] = &unk_1E5C2C1A8;
          v37[4] = v13;
          v37[5] = 0;
          float v38 = v28;
          v37[6] = v29;
          [v25 enumerateKeysAndObjectsUsingBlock:v37];
          return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v29];
        }
      }
    }
  }
  return v13;
}

- (BOOL)chromaticDefringingEnabledForVideoForPortType:(id)a3 sensorIDString:(id)a4
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", a3, a4), "objectForKeyedSubscript:", @"ChromaticDefringing"), "objectForKeyedSubscript:", @"Video"), "objectForKeyedSubscript:", @"CorrectionEnabled");
  return [v4 BOOLValue];
}

- (id)quadraSubPixelSwitchingParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    return (id)[v4 objectForKeyedSubscript:@"QuadraSubPixelSwitchingParameters"];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (id)sensorIDDictionaryForPortType:(id)a3 sensorIDString:(id)a4
{
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v12 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = (void *)MEMORY[0x1A6272C70](self, a2);
  float v8 = [(FigCaptureCameraParameters *)self cameraTuningParameters];
  if (!v8) {
    goto LABEL_15;
  }
  id v9 = v8;
  id v10 = [(NSDictionary *)v8 objectForKeyedSubscript:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  if (![v10 count])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_15:
    id v12 = 0;
    goto LABEL_16;
  }
  id v11 = (void *)[v10 objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if (v12) {
      goto LABEL_16;
    }
  }
  id v13 = [(NSDictionary *)v9 objectForKeyedSubscript:@"DefaultSensorIDs"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v14 = [v13 objectForKeyedSubscript:a3];
  if ((objc_msgSend((id)objc_msgSend(v10, "allKeys"), "containsObject:", v14) & 1) == 0) {
    uint64_t v14 = objc_msgSend((id)objc_msgSend(v10, "allKeys"), "objectAtIndexedSubscript:", 0);
  }
  if (!v14) {
    goto LABEL_15;
  }
  id v12 = (id)[v10 objectForKeyedSubscript:v14];
LABEL_16:
LABEL_17:
  return v12;
}

- (NSDictionary)cameraTuningParameters
{
  return (NSDictionary *)[(NSDictionary *)self->_cameraParameters objectForKeyedSubscript:@"TuningParameters"];
}

- (id)sensorIDDictionaryForStream:(id)a3
{
  if (a3
    && (uint64_t v5 = [a3 portType],
        uint64_t v6 = objc_msgSend((id)objc_opt_class(), "sensorIDStringFromModuleInfo:", objc_msgSend(a3, "getProperty:error:", *MEMORY[0x1E4F54AE8], 0)), v5)&& v6)
  {
    return [(FigCaptureCameraParameters *)self sensorIDDictionaryForPortType:v5 sensorIDString:v6];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

+ (id)sharedInstance
{
  pthread_mutex_lock((pthread_mutex_t *)gCaptureCameraParametersLock);
  id v2 = (FigCaptureCameraParameters *)gCaptureCameraParameters;
  if (!gCaptureCameraParameters)
  {
    id v2 = objc_alloc_init(FigCaptureCameraParameters);
    gCaptureCameraParameters = (uint64_t)v2;
  }
  v3 = v2;
  pthread_mutex_unlock((pthread_mutex_t *)gCaptureCameraParametersLock);
  return v3;
}

+ (id)sensorIDStringFromModuleInfo:(id)a3
{
  id result = (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52F38]];
  if (result) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%04x", objc_msgSend(result, "intValue"));
  }
  return result;
}

- (FigCaptureCameraParameters)init
{
  ModelSpecificName = (__CFString *)FigCaptureGetModelSpecificName();
  return (FigCaptureCameraParameters *)-[FigCaptureCameraParameters _initWithModelSpecificName:fromFile:](self, ModelSpecificName, 0);
}

- (id)_initWithModelSpecificName:(void *)a3 fromFile:
{
  if (!a1) {
    return 0;
  }
  v27.receiver = a1;
  v27.super_class = (Class)FigCaptureCameraParameters;
  uint64_t v5 = (id *)objc_msgSendSuper2(&v27, sel_init);
  uint64_t v6 = v5;
  if (!v5) {
    return v6;
  }
  if ((-[FigCaptureCameraParameters _readAndPreprocessCameraParametersForModelSpecificName:fromFile:]((uint64_t)v5, a2, a3) & 1) == 0|| (uint64_t v7 = (void *)[v6[1] objectForKeyedSubscript:@"TuningParameters"], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  float v8 = (void *)[v7 objectForKeyedSubscript:@"Common"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (void *)[v8 objectForKeyedSubscript:@"NRFParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[2] = v9;
    }
    id v10 = (void *)[v8 objectForKeyedSubscript:@"DistortionCorrectionParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[3] = v10;
    }
    id v11 = (void *)[v8 objectForKeyedSubscript:@"Meteor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[4] = v11;
    }
    id v12 = (void *)[v8 objectForKeyedSubscript:@"MotionAttachments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[5] = v12;
    }
    id v13 = (void *)[v8 objectForKeyedSubscript:@"VideoStabilization"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[6] = v13;
    }
    uint64_t v14 = (void *)[v8 objectForKeyedSubscript:@"StereoDisparity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[7] = v14;
    }
    uint64_t v15 = (void *)[v8 objectForKeyedSubscript:@"DepthProcessingParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[8] = v15;
    }
    uint64_t v16 = (void *)[v8 objectForKeyedSubscript:@"VideoGreenGhostMitigationParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[14] = v16;
    }
    uint64_t v17 = (void *)[v8 objectForKeyedSubscript:@"Landmarks"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[9] = v17;
    }
    uint64_t v18 = (void *)[v8 objectForKeyedSubscript:@"MattingParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[10] = v18;
    }
    uint64_t v19 = (void *)[v8 objectForKeyedSubscript:@"LearnedMattingParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[11] = v19;
    }
    float v20 = (void *)[v8 objectForKeyedSubscript:@"PersonSemantics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[12] = v20;
    }
    float v21 = (void *)[v8 objectForKeyedSubscript:@"CoreImagePortraitFilter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[13] = v21;
    }
    v22 = (void *)[v8 objectForKeyedSubscript:@"DeepZoomParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[15] = v22;
    }
    BOOL v23 = (void *)[v8 objectForKeyedSubscript:@"PhotoEncoderParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[16] = v23;
    }
    uint64_t v24 = (void *)[v8 objectForKeyedSubscript:@"PortraitSceneMonitoringParametersByZoomFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[17] = v24;
    }
    v25 = (void *)[v8 objectForKeyedSubscript:@"TemporalNoiseReductionParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6[18] = v25;
    }
  }
  if (!v6[5]) {
    v6[5] = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  if (!v6[6]) {
    v6[6] = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  return v6;
}

uint64_t __123__FigCaptureCameraParameters_portraitSceneMonitoringParametersForPortType_sensorIDString_zoomFactorRelativeToWidePortType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 floatValue];
  float v5 = v4;
  [a3 floatValue];
  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

- (int)mattingVersion
{
  commonMattingParameters = self->_commonMattingParameters;
  if (commonMattingParameters)
  {
    id v3 = [(NSDictionary *)commonMattingParameters objectForKeyedSubscript:@"Version"];
    LODWORD(commonMattingParameters) = [v3 intValue];
  }
  return (int)commonMattingParameters;
}

+ (int)previewMaxLossyCompressionLevel
{
  if (BWDeviceIsiPhone()) {
    int v2 = 3;
  }
  else {
    int v2 = 1;
  }
  if (FigCapturePlatformSupportsUniversalLossyCompression()) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (int)stillImageMaxLossyCompressionLevel
{
  return FigCapturePlatformSupportsUniversalLossyCompression() != 0;
}

+ (int)videoDataMaxLossyCompressionLevel
{
  return FigCapturePlatformSupportsUniversalLossyCompression() != 0;
}

+ (int)movieFileMaxLossyCompressionLevelForPixelFormat:(unsigned int)a3
{
  if (FigCapturePixelFormatIsTenBit(a3))
  {
    if (FigCapturePixelFormatIs422(a3)) {
      int v4 = 1;
    }
    else {
      int v4 = 3;
    }
  }
  else
  {
    int v4 = 1;
  }
  if (FigCapturePlatformSupportsUniversalLossyCompression()) {
    return v4;
  }
  else {
    return 0;
  }
}

- (int)gainMapVersion
{
  if ([(FigCaptureCameraParameters *)self nrfVersion] == 4) {
    return 0x20000;
  }
  else {
    return 0x10000;
  }
}

- (int)nrfVersion
{
  id v2 = [(NSDictionary *)self->_commonNRFParameters objectForKeyedSubscript:@"Version"];
  if (v2)
  {
    LODWORD(v2) = [v2 intValue];
  }
  return (int)v2;
}

- (NSDictionary)motionAttachmentsParameters
{
  return self->_motionAttachmentsParameters;
}

- (int)personSemanticsVersion
{
  personSemanticsParameters = self->_personSemanticsParameters;
  if (personSemanticsParameters)
  {
    id v3 = [(NSDictionary *)personSemanticsParameters objectForKeyedSubscript:@"Version"];
    LODWORD(personSemanticsParameters) = [v3 intValue];
  }
  return (int)personSemanticsParameters;
}

- (uint64_t)_readAndPreprocessCameraParametersForModelSpecificName:(void *)a3 fromFile:
{
  v82[6] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  float v5 = (void *)MEMORY[0x1A6272C70]();
  if (a3)
  {
    float v6 = +[FigCaptureFlatPlist flatPlistWithContentsOfFile:a3];
    if (v6)
    {
      uint64_t v7 = v6;
      if ([a3 hasSuffix:@"CameraSetup.plist"]) {
        uint64_t v8 = [a3 substringWithRange:0, objc_msgSend(a3, "length") - objc_msgSend(@"CameraSetup.plist", "length")];
      }
      else {
        uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingString:", @"/");
      }
      uint64_t v10 = v8;
      goto LABEL_10;
    }
LABEL_69:
    uint64_t v46 = 0;
    goto LABEL_66;
  }
  id v9 = FigCaptureCFCreatePropertyListForModel(@"CameraSetup.plist", a2, 1);
  if (!v9) {
    goto LABEL_69;
  }
  uint64_t v7 = v9;
  uint64_t v10 = 0;
LABEL_10:
  if (!FigCaptureCurrentProcessIsDeferredmediad()
    && (objc_msgSend((id)objc_msgSend((id)FigCaptureDeviceCoreRepairStatusesByKeys(), "objectForKeyedSubscript:", @"FrontCameraAssembly"), "intValue") & 0xFFFFFFFE) == 2)
  {
    id v11 = (void *)[(FigCaptureFlatPlist *)v7 objectForKeyedSubscript:@"TuningParameters"];
    id v12 = (void *)[v11 objectForKeyedSubscript:@"Common"];
    id v13 = (void *)[v12 objectForKeyedSubscript:@"VideoStabilization"];
    uint64_t v14 = *MEMORY[0x1E4F55D50];
    if (objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F55D50]), "BOOLValue"))
    {
      uint64_t v15 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v13];
      [v15 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v14];
      uint64_t v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
      [v16 setObject:v15 forKeyedSubscript:@"VideoStabilization"];
      uint64_t v17 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
      [v17 setObject:v16 forKeyedSubscript:@"Common"];
      uint64_t v7 = (FigCaptureFlatPlist *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
      [(FigCaptureFlatPlist *)v7 setObject:v17 forKeyedSubscript:@"TuningParameters"];
    }
  }
  v57 = (void *)[(FigCaptureFlatPlist *)v7 objectForKeyedSubscript:@"TuningParameters"];
  uint64_t v18 = *MEMORY[0x1E4F52DD8];
  v82[0] = *MEMORY[0x1E4F52DE8];
  v82[1] = v18;
  uint64_t v19 = *MEMORY[0x1E4F52E10];
  v82[2] = *MEMORY[0x1E4F52DF0];
  v82[3] = v19;
  uint64_t v20 = *MEMORY[0x1E4F52E00];
  v82[4] = *MEMORY[0x1E4F52DF8];
  v82[5] = v20;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:6];
  uint64_t v55 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (!v55)
  {
    v47 = *(void **)(a1 + 8);
    v44 = (FigCaptureFlatPlist **)(a1 + 8);

    goto LABEL_64;
  }
  uint64_t v49 = a1;
  v50 = v7;
  v52 = 0;
  context = v5;
  id v51 = 0;
  uint64_t v56 = *(void *)v76;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v76 != v56)
      {
        uint64_t v22 = v21;
        objc_enumerationMutation(obj);
        uint64_t v21 = v22;
      }
      uint64_t v61 = v21;
      BOOL v23 = objc_msgSend(v57, "objectForKeyedSubscript:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        uint64_t v24 = (void *)[v23 allKeys];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v71 objects:v80 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          v62 = 0;
          uint64_t v27 = *(void *)v72;
          v59 = v24;
          v60 = v23;
          uint64_t v58 = *(void *)v72;
          while (1)
          {
            uint64_t v28 = 0;
            uint64_t v63 = v26;
            do
            {
              if (*(void *)v72 != v27) {
                objc_enumerationMutation(v24);
              }
              v64 = *(void **)(*((void *)&v71 + 1) + 8 * v28);
              uint64_t v65 = v28;
              uint64_t v29 = objc_msgSend(v23, "objectForKeyedSubscript:");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_49;
              }
              long long v69 = 0u;
              long long v70 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              uint64_t v30 = [&unk_1EFB044D8 countByEnumeratingWithState:&v67 objects:v79 count:16];
              if (!v30)
              {
                uint64_t v26 = v63;
LABEL_49:
                uint64_t v39 = v65;
                goto LABEL_50;
              }
              uint64_t v31 = v30;
              id v32 = 0;
              uint64_t v33 = *(void *)v68;
              while (2)
              {
                for (uint64_t i = 0; i != v31; ++i)
                {
                  if (*(void *)v68 != v33) {
                    objc_enumerationMutation(&unk_1EFB044D8);
                  }
                  uint64_t v35 = *(void *)(*((void *)&v67 + 1) + 8 * i);
                  uint64_t v36 = [v29 objectForKeyedSubscript:v35];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if (v10) {
                      v37 = +[FigCaptureFlatPlist flatPlistWithContentsOfFile:](FigCaptureFlatPlist, "flatPlistWithContentsOfFile:", [NSString stringWithFormat:@"%@%@", v10, v36]);
                    }
                    else {
                      v37 = FigCaptureCFCreatePropertyListForModel(v36, a2, 1);
                    }
                    float v38 = v37;
                    if (!v37) {
                      goto LABEL_62;
                    }
                    if (!v32) {
                      id v32 = (id)[v29 mutableCopy];
                    }
                    [v32 setObject:0 forKeyedSubscript:v35];
                    [v32 addEntriesFromDictionary:v38];
                  }
                }
                uint64_t v31 = [&unk_1EFB044D8 countByEnumeratingWithState:&v67 objects:v79 count:16];
                if (v31) {
                  continue;
                }
                break;
              }
              uint64_t v26 = v63;
              uint64_t v39 = v65;
              if (!v32)
              {
                uint64_t v24 = v59;
                BOOL v23 = v60;
                uint64_t v27 = v58;
                goto LABEL_50;
              }
              uint64_t v24 = v59;
              BOOL v23 = v60;
              id v40 = v62;
              uint64_t v27 = v58;
              if (!v62) {
                id v40 = (id)[v60 mutableCopy];
              }
              v62 = v40;
              [v40 setObject:v32 forKeyedSubscript:v64];
              if ([v64 isEqualToString:@"0x0803"])
              {
                if ((objc_msgSend((id)objc_msgSend(v60, "allKeys"), "containsObject:", @"0x0853") & 1) == 0)
                {
                  [v62 setObject:v32 forKeyedSubscript:@"0x0853"];
                  goto LABEL_50;
                }
LABEL_62:
                uint64_t v46 = 0;
                float v5 = context;
                goto LABEL_66;
              }
LABEL_50:
              uint64_t v28 = v39 + 1;
            }
            while (v28 != v26);
            uint64_t v41 = [v24 countByEnumeratingWithState:&v71 objects:v80 count:16];
            uint64_t v26 = v41;
            if (!v41)
            {
              if (v62)
              {
                v42 = v52;
                if (!v52)
                {
                  id v43 = (id)[v57 mutableCopy];
                  id v51 = (id)[(FigCaptureFlatPlist *)v50 mutableCopy];
                  [v51 setObject:v43 forKeyedSubscript:@"TuningParameters"];
                  v42 = v43;
                }
                v52 = v42;
                objc_msgSend(v42, "setObject:forKeyedSubscript:");
              }
              break;
            }
          }
        }
      }
      uint64_t v21 = v61 + 1;
    }
    while (v61 + 1 != v55);
    uint64_t v55 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
  }
  while (v55);
  v44 = (FigCaptureFlatPlist **)(a1 + 8);

  if (v51)
  {
    v45 = (FigCaptureFlatPlist *)[v51 copy];
    float v5 = context;
    goto LABEL_65;
  }
  float v5 = context;
  uint64_t v7 = v50;
LABEL_64:
  v45 = v7;
LABEL_65:
  *v44 = v45;
  uint64_t v46 = 1;
LABEL_66:
  return v46;
}

- (BOOL)panoramaRequiresLTMLockingForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:");
      if (v4) {
        return objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"panoramaDoNotLockLTM"), "BOOLValue") ^ 1;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 1;
}

uint64_t __83__FigCaptureCameraParameters_sdofTuningParametersForSensorIDDictionary_zoomFactor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 floatValue];
  float v5 = v4;
  [a3 floatValue];
  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

- (NSDictionary)videoStabilizationParameters
{
  return self->_videoStabilizationParameters;
}

- (int)distortionCorrectionVersion
{
  id v2 = [(NSDictionary *)self->_commonDistortionCorrectionParameters objectForKeyedSubscript:@"Version"];
  if (v2)
  {
    LODWORD(v2) = [v2 intValue];
  }
  return (int)v2;
}

- (int)learnedMattingVersion
{
  learnedMattingParameters = self->_learnedMattingParameters;
  if (learnedMattingParameters)
  {
    id v3 = [(NSDictionary *)learnedMattingParameters objectForKeyedSubscript:@"Version"];
    LODWORD(learnedMattingParameters) = [v3 intValue];
  }
  return (int)learnedMattingParameters;
}

- (int)disparityVersion
{
  stereoDisparityParameters = self->_stereoDisparityParameters;
  if (stereoDisparityParameters)
  {
    id v3 = [(NSDictionary *)stereoDisparityParameters objectForKeyedSubscript:@"Version"];
    LODWORD(stereoDisparityParameters) = [v3 intValue];
  }
  return (int)stereoDisparityParameters;
}

- (BOOL)complementMatteSuppressionDecisionWithISPDetectedFaces
{
  id v2 = [(FigCaptureCameraParameters *)self cameraTuningParameters];
  if (!v2) {
    return 0;
  }
  id v3 = [(NSDictionary *)v2 objectForKeyedSubscript:@"Common"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  float v4 = (void *)[v3 objectForKeyedSubscript:@"ComplementMatteSuppressionDecisionWithISPDetectedFaces"];
  return [v4 BOOLValue];
}

- (NSDictionary)photoEncoderParameters
{
  return self->_photoEncoderParameters;
}

- ($2ACC23B9A21F50F5CC728381CA870116)landmarksVersionForInferenceType:(int)a3
{
  if (a3 == 802)
  {
    landmarksParameters = self->_landmarksParameters;
    if (!landmarksParameters)
    {
      uint64_t v5 = 1;
      goto LABEL_15;
    }
    float v4 = @"InferenceTypeFaceSegmentsWithLandmarks";
  }
  else
  {
    if (a3 != 801)
    {
      uint64_t v5 = 0;
      goto LABEL_15;
    }
    landmarksParameters = self->_landmarksParameters;
    if (!landmarksParameters)
    {
      if (+[BWInferenceEngine isNeuralEngineSupported]) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 1;
      }
      goto LABEL_15;
    }
    float v4 = @"InferenceTypeLandmarks";
  }
  uint64_t v5 = [(NSDictionary *)landmarksParameters objectForKeyedSubscript:v4];
  if (v5)
  {
    uint64_t v5 = [(id)v5 objectForKeyedSubscript:@"InferenceVersion"];
    if (v5) {
      uint64_t v5 = [(id)v5 intValue];
    }
  }
LABEL_15:
  return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMakeMajor(v5);
}

- (int)landmarksConstellationPointCountForInferenceType:(int)a3
{
  if (a3 == 802)
  {
    landmarksParameters = self->_landmarksParameters;
    if (!landmarksParameters)
    {
      LODWORD(v5) = 76;
      return (int)v5;
    }
    float v4 = @"InferenceTypeFaceSegmentsWithLandmarks";
  }
  else
  {
    if (a3 != 801)
    {
      LODWORD(v5) = 0;
      return (int)v5;
    }
    landmarksParameters = self->_landmarksParameters;
    if (!landmarksParameters)
    {
      LODWORD(v5) = 65;
      return (int)v5;
    }
    float v4 = @"InferenceTypeLandmarks";
  }
  id v5 = [(NSDictionary *)landmarksParameters objectForKeyedSubscript:v4];
  if (v5)
  {
    id v5 = (id)[v5 objectForKeyedSubscript:@"ConstellationPointCount"];
    if (v5)
    {
      int v6 = [v5 intValue];
      if (v6 == 65) {
        int v7 = 65;
      }
      else {
        int v7 = 0;
      }
      if (v6 == 76) {
        LODWORD(v5) = 76;
      }
      else {
        LODWORD(v5) = v7;
      }
    }
  }
  return (int)v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    gCaptureCameraParametersLock = FigSimpleMutexCreate();
  }
}

- (NSDictionary)commonNRFParameters
{
  return self->_commonNRFParameters;
}

+ (unsigned)sensorIDFromSensorIDString:(id)a3
{
  unsigned int v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FE8], "scannerWithString:", a3), "scanHexInt:", &v4);
  return v4;
}

- (FigCaptureCameraParameters)initWithContentsOfFile:(id)a3
{
  ModelSpecificName = (__CFString *)FigCaptureGetModelSpecificName();
  return (FigCaptureCameraParameters *)-[FigCaptureCameraParameters _initWithModelSpecificName:fromFile:](self, ModelSpecificName, a3);
}

- (FigCaptureCameraParameters)initWithModelSpecificName:(id)a3
{
  return (FigCaptureCameraParameters *)-[FigCaptureCameraParameters _initWithModelSpecificName:fromFile:](self, (__CFString *)a3, 0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCameraParameters;
  [(FigCaptureCameraParameters *)&v3 dealloc];
}

- (NSDictionary)stereoDisparityParameters
{
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"V%d", -[FigCaptureCameraParameters disparityVersion](self, "disparityVersion"));
  stereoDisparityParameters = self->_stereoDisparityParameters;
  return (NSDictionary *)[(NSDictionary *)stereoDisparityParameters objectForKeyedSubscript:v3];
}

- (int)videoGreenGhostBrightLightMitigationVersion
{
  id v2 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_commonVideoGreenGhostMitigationParameters, "objectForKeyedSubscript:", @"BrightLightMitigationParameters"), "objectForKeyedSubscript:", @"Version");
  if (v2)
  {
    LODWORD(v2) = [v2 intValue];
  }
  return (int)v2;
}

- (int)videoGreenGhostLowLightMitigationVersion
{
  id v2 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_commonVideoGreenGhostMitigationParameters, "objectForKeyedSubscript:", @"LowLightMitigationParameters"), "objectForKeyedSubscript:", @"Version");
  if (v2)
  {
    LODWORD(v2) = [v2 intValue];
  }
  return (int)v2;
}

- (int)meteorHeadroomProcessingType
{
  meteorParameters = self->_meteorParameters;
  if (meteorParameters)
  {
    id v3 = [(NSDictionary *)meteorParameters objectForKeyedSubscript:@"HeadroomProcessingType"];
    LODWORD(meteorParameters) = [v3 intValue];
  }
  return (int)meteorParameters;
}

- (id)focalLengthCharacterizationForStream:(id)a3
{
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  id v3 = -[FigCaptureCameraParameters sensorIDDictionaryForStream:](self, "sensorIDDictionaryForStream:");
  if (!v3) {
    return 0;
  }
  return (id)[v3 objectForKeyedSubscript:@"FocalLengthCharacterization"];
}

- (int)disparityVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    id v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"DisparityParameters"), "objectForKeyedSubscript:", @"Version");
    return [v5 intValue];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (int)fsdNetStereoImagesAlignmentForPortType:(id)a3 sensorIDString:(id)a4
{
  if (!a3
    || !a4
    || (id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -1;
  }
  id v5 = (void *)[v4 objectForKeyedSubscript:@"FSDNetStereoImagesAlignment"];
  if (!v5) {
    return -1;
  }
  return [v5 intValue];
}

- (int)focusPixelDisparityVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    id v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"FocusPixelDisparityParameters"), "objectForKeyedSubscript:", @"Version");
    return [v5 intValue];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (id)focusPixelDisparityParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  if (!a3) {
    goto LABEL_12;
  }
  id v4 = a4;
  if (!a4) {
    goto LABEL_13;
  }
  uint64_t v7 = -[FigCaptureCameraParameters focusPixelDisparityVersionForPortType:sensorIDString:](self, "focusPixelDisparityVersionForPortType:sensorIDString:");
  if (!v7
    || (uint64_t v8 = v7,
        (id v9 = [(FigCaptureCameraParameters *)self sensorIDDictionaryForPortType:a3 sensorIDString:v4]) == 0))
  {
LABEL_12:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  id v4 = (id)[v9 objectForKeyedSubscript:@"FocusPixelDisparityParameters"];
  if (!v4)
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    return v4;
  }
  if ((int)v8 < 2) {
    return v4;
  }
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"FPDisparityV%d", v8);
  return (id)[v4 objectForKeyedSubscript:v10];
}

- ($2825F4736939C4A6D3AD43837233062D)maxFocusPixelHorizontalPixelBufferDimensions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(FigCaptureCameraParameters *)self cameraTuningParameters];
  uint64_t v19 = [(NSDictionary *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  uint64_t v2 = 0;
  unsigned int v3 = 0;
  if (v19)
  {
    uint64_t v18 = *(void *)v36;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v35 + 1) + 8 * v4);
        uint64_t v20 = v4;
        if ([v5 hasPrefix:@"PortType"])
        {
          id v6 = [(NSDictionary *)[(FigCaptureCameraParameters *)self cameraTuningParameters] objectForKeyedSubscript:v5];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v21 = v6;
          uint64_t v25 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v25)
          {
            uint64_t v22 = *(void *)v32;
            BOOL v23 = v5;
            do
            {
              uint64_t v7 = 0;
              do
              {
                if (*(void *)v32 != v22) {
                  objc_enumerationMutation(v21);
                }
                id v8 = [(FigCaptureCameraParameters *)self focusPixelsPatternsForPortType:v5 sensorIDString:*(void *)(*((void *)&v31 + 1) + 8 * v7)];
                uint64_t v26 = v7;
                if ((unint64_t)[v8 count] <= 0xF)
                {
                  long long v29 = 0u;
                  long long v30 = 0u;
                  long long v27 = 0u;
                  long long v28 = 0u;
                  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v39 count:16];
                  if (v9)
                  {
                    uint64_t v10 = v9;
                    uint64_t v11 = *(void *)v28;
                    do
                    {
                      for (uint64_t i = 0; i != v10; ++i)
                      {
                        if (*(void *)v28 != v11) {
                          objc_enumerationMutation(v8);
                        }
                        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                        unsigned int v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", @"X"), "objectForKeyedSubscript:", @"Count"), "unsignedIntValue");
                        unsigned int v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", @"Y"), "objectForKeyedSubscript:", @"Count"), "unsignedIntValue");
                        if (v3 <= v14) {
                          unsigned int v3 = v14;
                        }
                        if (v2 <= v15) {
                          uint64_t v2 = v15;
                        }
                        else {
                          uint64_t v2 = v2;
                        }
                      }
                      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v39 count:16];
                    }
                    while (v10);
                  }
                }
                uint64_t v7 = v26 + 1;
                id v5 = v23;
              }
              while (v26 + 1 != v25);
              uint64_t v25 = [v21 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v25);
          }
        }
        uint64_t v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [(NSDictionary *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v19);
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(v2 << 32));
}

- (BOOL)portraitTapToRefocusPrevented
{
  depthProcessingParameters = self->_depthProcessingParameters;
  if (!depthProcessingParameters) {
    return 0;
  }
  id v3 = [(NSDictionary *)depthProcessingParameters objectForKeyedSubscript:@"PortraitTapToRefocusPrevented"];
  if (!v3) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (id)focusPixelsPatternsForPortType:(id)a3 sensorIDString:(id)a4
{
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  id v6 = [(FigCaptureCameraParameters *)self cameraTuningParameters];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", @"ModuleConfig"), "objectForKeyedSubscript:", @"FocusPixels"), "objectForKeyedSubscript:", @"Layout");
  return (id)[v7 objectForKeyedSubscript:@"Patterns"];
}

- (int)depthProcessorVersion
{
  depthProcessingParameters = self->_depthProcessingParameters;
  if (depthProcessingParameters)
  {
    id v3 = [(NSDictionary *)depthProcessingParameters objectForKeyedSubscript:@"Version"];
    LODWORD(depthProcessingParameters) = [v3 intValue];
  }
  return (int)depthProcessingParameters;
}

- (int)mattingVersionForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v5 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    id v6 = (id)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"MattingParameters"), "objectForKeyedSubscript:", @"Version");
    if (!v6) {
      id v6 = [(NSDictionary *)self->_commonMattingParameters objectForKeyedSubscript:@"Version"];
    }
    return [v6 intValue];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)deepZoomTransferWithZoomedImageEnabledForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4 = [(FigCaptureCameraParameters *)self sensorIDDictionaryForPortType:a3 sensorIDString:a4];
  if (!v4 || (id v5 = (void *)[v4 objectForKeyedSubscript:@"DeepZoomParameters"]) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  id v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"Transfer"), "objectForKeyedSubscript:", @"ProWithZoomedImageEnabled");
  if (!v6) {
    return 0;
  }
  return [v6 BOOLValue];
}

- (int)coreImagePortraitFilterVersion
{
  coreImagePortraitFilterParameters = self->_coreImagePortraitFilterParameters;
  if (!coreImagePortraitFilterParameters) {
    return 1;
  }
  id v3 = [(NSDictionary *)coreImagePortraitFilterParameters objectForKeyedSubscript:@"Version"];
  if (!v3) {
    return 1;
  }
  return [v3 intValue];
}

- (int)disparityRefinementTypeForPortType:(id)a3 sensorIDString:(id)a4 zoomFactor:(float)a5
{
  if (a3
    && a4
    && (v9 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0&& (v11 = v9, *(float *)&double v10 = a5, [(FigCaptureCameraParameters *)self sdofRenderingVersionForPortType:a3 sensorIDString:a4 zoomFactor:v10]))
  {
    *(float *)&double v12 = a5;
    id v13 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:v11 zoomFactor:v12];
    int result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", @"DisparityRefinement"), "objectForKeyedSubscript:", @"version"), "intValue");
    if (result)
    {
      if ((int)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", @"Version"), "intValue") < 5) {
        return 1;
      }
      else {
        return 2;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (id)actionCameraSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    return (id)[v4 objectForKeyedSubscript:@"ActionCameraSceneMonitoringParameters"];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (id)stereoVideoCaptureSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    return (id)[v4 objectForKeyedSubscript:@"StereoVideoCaptureSceneMonitoringParameters"];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (id)stereoPhotoCaptureSceneMonitoringParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:")) != 0)
  {
    return (id)[v4 objectForKeyedSubscript:@"StereoPhotoCaptureSceneMonitoringParameters"];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

+ (id)sensorIDStringFromMetadata:(id)a3
{
  id result = (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F54210]];
  if (result) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%04x", objc_msgSend(result, "intValue"));
  }
  return result;
}

- (BOOL)chromaticDefringingEnabledForSlomoForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](self, "sensorIDDictionaryForPortType:sensorIDString:", a3, a4), "objectForKeyedSubscript:", @"ChromaticDefringing"), "objectForKeyedSubscript:", @"Slomo"), "objectForKeyedSubscript:", @"CorrectionEnabled");
  return [v4 BOOLValue];
}

- (id)chromaticDefringingParametersForPortType:(id)a3 sensorIDString:(id)a4
{
  id v4 = [(FigCaptureCameraParameters *)self sensorIDDictionaryForPortType:a3 sensorIDString:a4];
  if (!v4 || (id result = (id)[v4 objectForKeyedSubscript:@"ChromaticDefringing"]) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (NSDictionary)videoStabilizationSTFParameters
{
  return (NSDictionary *)[(NSDictionary *)self->_videoStabilizationParameters objectForKeyedSubscript:@"VideoSTFParameters"];
}

- (int)videoStabilizationProcessorVersion
{
  videoStabilizationParameters = self->_videoStabilizationParameters;
  if (videoStabilizationParameters)
  {
    id v3 = [(NSDictionary *)videoStabilizationParameters objectForKeyedSubscript:@"Version"];
    LODWORD(videoStabilizationParameters) = [v3 intValue];
  }
  return (int)videoStabilizationParameters;
}

+ (id)cinematicFramingVirtualCameraConfigurationForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters cameraTuningParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraTuningParameters"), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", a4)) != 0)
  {
    return (id)[v4 objectForKeyedSubscript:@"CinematicFramingVirtualCameraConfiguration"];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

+ (id)temporalFilterSessionConfigurationForPortType:(id)a3 sensorIDString:(id)a4
{
  if (a3
    && a4
    && (id v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters cameraTuningParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraTuningParameters"), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", a4)) != 0)
  {
    return (id)[v4 objectForKeyedSubscript:@"MotionCompensatedTemporalFilterNoiseReductionConfiguration"];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (NSDictionary)cameraParameters
{
  return self->_cameraParameters;
}

- (NSDictionary)commonVideoGreenGhostMitigationParameters
{
  return self->_commonVideoGreenGhostMitigationParameters;
}

- (NSDictionary)temporalNoiseReductionParameters
{
  return self->_temporalNoiseReductionParameters;
}

@end