@interface BWNondisruptiveSwitchingFormatSelector
+ (void)initialize;
- (BWNondisruptiveSwitchingFormatSelector)initWithPortType:(id)a3 quadraSubPixelSwitchingParameters:(id)a4 baseZoomFactor:(float)a5 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:(id)a6 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:(id)a7 ultraHighResolutionNondisruptiveStreamingFormatIndex:(int)a8 mainFormatSIFRBinningFactor:(int)a9;
- (int)formatIndexForZoomFactor:(float)lastZoomFactor frameStatistics:(id)a4 imageControlMode:(int)a5 stillImageDigitalFlashMode:(int)a6 isStationary:(BOOL)a7 isSecondaryStream:(BOOL)a8 binnedSIFROnSecondaryStreamAllowed:(BOOL)a9 ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:(BOOL)a10 ultraHighResolutionZeroShutterLagEnabled:(BOOL)a11;
- (uint64_t)_updateQuadraSubPixelSwitchingParametersWithVideoStabilizationStrength:(int)a3 imageControlMode:(int)a4 stillImageDigitalFlashMode:(int)a5 isStationary:(char *)a6 quadraSubPixelSwitchingParametersChangedOut:;
- (void)dealloc;
- (void)setVideoStabilizationStrength:(int)a3;
@end

@implementation BWNondisruptiveSwitchingFormatSelector

- (BWNondisruptiveSwitchingFormatSelector)initWithPortType:(id)a3 quadraSubPixelSwitchingParameters:(id)a4 baseZoomFactor:(float)a5 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:(id)a6 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:(id)a7 ultraHighResolutionNondisruptiveStreamingFormatIndex:(int)a8 mainFormatSIFRBinningFactor:(int)a9
{
  v22.receiver = self;
  v22.super_class = (Class)BWNondisruptiveSwitchingFormatSelector;
  v16 = [(BWNondisruptiveSwitchingFormatSelector *)&v22 init];
  v17 = v16;
  if (v16)
  {
    if ((unint64_t)a6 | (unint64_t)a7)
    {
      v16->_portType = (NSString *)a3;
      v16->_baseZoomFactor = a5;
      v16->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned = (NSDictionary *)a6;
      v17->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned = (NSDictionary *)a7;
      v17->_ultraHighResolutionNondisruptiveStreamingFormatIndex = a8;
      v17->_mainFormatSIFRBinningFactor = a9;
      v17->_lastNondisruptiveSwitchingFormatIndex = -1;
      v18 = (NSDictionary *)a4;
      v17->_quadraSubPixelSwitchingParameters = v18;
      if (v18)
      {
        v19 = [(NSDictionary *)v18 allKeys];
        v17->_quadraSubPixelSceneMonitoringForActionCameraEnabled = -[NSArray count](-[NSArray filteredArrayUsingPredicate:](v19, "filteredArrayUsingPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH %@", @"ActionCamera"]), "count") != 0;
        v20 = [(NSDictionary *)v17->_quadraSubPixelSwitchingParameters allKeys];
        v17->_quadraSubPixelSceneMonitoringForDigitalFlashEnabled = -[NSArray count](-[NSArray filteredArrayUsingPredicate:](v20, "filteredArrayUsingPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH %@", @"DigitalFlash"]), "count") != 0;
        [(NSDictionary *)v17->_quadraSubPixelSwitchingParameters objectForKeyedSubscript:@"Video"];
        v17->_quadraSubPixelSceneMonitoringForVideoEnabled = 0;
        v17->_quadraSubPixelSceneMonitoringForPhotoEnabled = [(NSDictionary *)v17->_quadraSubPixelSwitchingParameters objectForKeyedSubscript:@"Photo"] != 0;
      }
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNondisruptiveSwitchingFormatSelector;
  [(BWNondisruptiveSwitchingFormatSelector *)&v3 dealloc];
}

- (int)formatIndexForZoomFactor:(float)lastZoomFactor frameStatistics:(id)a4 imageControlMode:(int)a5 stillImageDigitalFlashMode:(int)a6 isStationary:(BOOL)a7 isSecondaryStream:(BOOL)a8 binnedSIFROnSecondaryStreamAllowed:(BOOL)a9 ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:(BOOL)a10 ultraHighResolutionZeroShutterLagEnabled:(BOOL)a11
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a10 && self->_lastZoomFactor != 0.0) {
    lastZoomFactor = self->_lastZoomFactor;
  }
  BOOL v16 = self->_mainFormatSIFRBinningFactor == 2;
  BOOL v17 = self->_mainFormatSIFRBinningFactor == 2 || !a8;
  BOOL v18 = v17 || !a9;
  BOOL v53 = a7;
  if (!v18) {
    BOOL v16 = [(NSDictionary *)self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned count] != 0;
  }
  id v54 = a4;
  BOOL v17 = !v16;
  uint64_t v19 = 32;
  if (!v17) {
    uint64_t v19 = 24;
  }
  v20 = *(Class *)((char *)&self->super.isa + v19);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v57;
    int ultraHighResolutionNondisruptiveStreamingFormatIndex = -1;
    float v25 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v57 != v23) {
          objc_enumerationMutation(v20);
        }
        v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        [v27 floatValue];
        if (v28 <= lastZoomFactor && v28 > v25)
        {
          int ultraHighResolutionNondisruptiveStreamingFormatIndex = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v27), "intValue");
          [v27 floatValue];
          float v25 = v30;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v22);
    if (!a11) {
      goto LABEL_37;
    }
  }
  else
  {
    int ultraHighResolutionNondisruptiveStreamingFormatIndex = -1;
    float v25 = 0.0;
    if (!a11)
    {
LABEL_37:
      int v31 = a5;
      int v32 = v53;
      BOOL v33 = a10;
      goto LABEL_38;
    }
  }
  if (a8) {
    goto LABEL_37;
  }
  int v31 = a5;
  int v32 = v53;
  BOOL v33 = a10;
  if (v25 <= self->_baseZoomFactor && self->_ultraHighResolutionNondisruptiveStreamingFormatIndex != -1 && a6 == 0) {
    int ultraHighResolutionNondisruptiveStreamingFormatIndex = self->_ultraHighResolutionNondisruptiveStreamingFormatIndex;
  }
LABEL_38:
  float v35 = self->_lastZoomFactor;
  BOOL v37 = v35 != 0.0
     && lastZoomFactor != v35
     && ultraHighResolutionNondisruptiveStreamingFormatIndex != self->_lastNondisruptiveSwitchingFormatIndex;
  self->_lastZoomFactor = lastZoomFactor;
  if (!v33)
  {
    BOOL quadraSubPixelSceneMonitoringForActionCameraEnabled = self->_quadraSubPixelSceneMonitoringForActionCameraEnabled;
    if (self->_quadraSubPixelSceneMonitoringForActionCameraEnabled) {
      BOOL quadraSubPixelSceneMonitoringForActionCameraEnabled = self->_videoStabilizationStrength > 2;
    }
    BOOL quadraSubPixelSceneMonitoringForVideoEnabled = 0;
    if (a6) {
      BOOL v40 = !self->_quadraSubPixelSceneMonitoringForDigitalFlashEnabled;
    }
    else {
      BOOL v40 = 1;
    }
    int v41 = !v40;
    if ((v31 - 4) >= 0xFFFFFFFD && !quadraSubPixelSceneMonitoringForActionCameraEnabled && (v41 & 1) == 0) {
      BOOL quadraSubPixelSceneMonitoringForVideoEnabled = self->_quadraSubPixelSceneMonitoringForVideoEnabled;
    }
    if (v31) {
      BOOL v42 = 1;
    }
    else {
      BOOL v42 = !self->_quadraSubPixelSceneMonitoringForPhotoEnabled;
    }
    int v43 = !v42;
    BOOL v44 = !v42 && a6 == 0;
    if (v44 && !v37) {
      BOOL v44 = self->_lastDigitalFlashMode != 0;
    }
    if (v41) {
      int v45 = self->_lastDigitalFlashMode != a6 || self->_lastStationary != v32 || v37;
    }
    else {
      int v45 = 0;
    }
    self->_lastDigitalFlashMode = a6;
    self->_lastStationary = v32;
    if (v54
      && v25 > self->_baseZoomFactor
      && (quadraSubPixelSceneMonitoringForActionCameraEnabled | v43 | v41 | quadraSubPixelSceneMonitoringForVideoEnabled) == 1)
    {
      BOOL v46 = 0;
      char v55 = 0;
      if ((v44 | v45) == 1)
      {
        -[BWNondisruptiveSwitchingFormatSelector _updateQuadraSubPixelSwitchingParametersWithVideoStabilizationStrength:imageControlMode:stillImageDigitalFlashMode:isStationary:quadraSubPixelSwitchingParametersChangedOut:]((uint64_t)self, self->_videoStabilizationStrength, v31, a6, v32, &v55);
        BOOL v46 = v55 != 0;
      }
      if (v37 || v46)
      {
        self->_quadraSubPixelSceneBasedOnNormalizedSNR.confident = 0;
        BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_quadraSubPixelSceneBasedOnNormalizedSNR.enabled);
        self->_quadraSubPixelSceneBasedOnLuxLevel.confident = 0;
        BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_quadraSubPixelSceneBasedOnLuxLevel.enabled);
        self->_quadraSubPixelSceneBasedOnGain.confident = 0;
        BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_quadraSubPixelSceneBasedOnGain.enabled);
      }
      [v54 normalizedQsumSNR];
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_quadraSubPixelSceneBasedOnNormalizedSNR, v47);
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_quadraSubPixelSceneBasedOnLuxLevel, (float)[v54 luxLevel]);
      [v54 gain];
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_quadraSubPixelSceneBasedOnGain, v48);
      if (self->_quadraSubPixelSceneBasedOnNormalizedSNR.enabled
        && !self->_quadraSubPixelSceneBasedOnNormalizedSNR.confident
        || self->_quadraSubPixelSceneBasedOnLuxLevel.enabled && !self->_quadraSubPixelSceneBasedOnLuxLevel.confident
        || self->_quadraSubPixelSceneBasedOnGain.enabled && self->_quadraSubPixelSceneBasedOnGain.confident)
      {
        *(float *)&double v49 = self->_baseZoomFactor;
        v50 = objc_msgSend(v20, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v49));
        if (v50) {
          int ultraHighResolutionNondisruptiveStreamingFormatIndex = [v50 intValue];
        }
        else {
          int ultraHighResolutionNondisruptiveStreamingFormatIndex = -1;
        }
      }
    }
  }
  self->_lastNondisruptiveSwitchingFormatIndex = ultraHighResolutionNondisruptiveStreamingFormatIndex;
  return ultraHighResolutionNondisruptiveStreamingFormatIndex;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
  -[BWNondisruptiveSwitchingFormatSelector _updateQuadraSubPixelSwitchingParametersWithVideoStabilizationStrength:imageControlMode:stillImageDigitalFlashMode:isStationary:quadraSubPixelSwitchingParametersChangedOut:]((uint64_t)self, a3, 1, 0, 0, 0);
}

- (uint64_t)_updateQuadraSubPixelSwitchingParametersWithVideoStabilizationStrength:(int)a3 imageControlMode:(int)a4 stillImageDigitalFlashMode:(int)a5 isStationary:(char *)a6 quadraSubPixelSwitchingParametersChangedOut:
{
  if (result)
  {
    uint64_t v7 = result;
    if (!*(void *)(result + 56)) {
      goto LABEL_37;
    }
    if (a2 == 3)
    {
      v8 = @"ActionCameraHighStrength";
    }
    else if (a2 == 4)
    {
      v8 = @"ActionCameraUltraStrength";
    }
    else if (a4 != 1 || a5)
    {
      if (a4 != 2 || a5)
      {
        if (a4 != 1 || a5 != 1)
        {
          char v9 = a5;
          if (a4 != 2) {
            char v9 = 0;
          }
          v10 = @"Video";
          if (!a3) {
            v10 = @"Photo";
          }
          v8 = (v9 & 1) != 0 ? @"DigitalFlashMaxTripod" : v10;
        }
        else
        {
          v8 = @"DigitalFlashMinTripod";
        }
      }
      else
      {
        v8 = @"DigitalFlashMaxHandheld";
      }
    }
    else
    {
      v8 = @"DigitalFlashMinHandheld";
    }
    result = [(__CFString *)v8 isEqualToString:*(void *)(result + 208)];
    if ((result & 1) != 0
      || (uint64_t v11 = *(void *)(v7 + 208),
          *(void *)(v7 + 208) = v8,
          v12 = (void *)[*(id *)(v7 + 56) objectForKeyedSubscript:v8],
          result = objc_msgSend(v12, "isEqualToDictionary:", objc_msgSend(*(id *)(v7 + 56), "objectForKeyedSubscript:", v11)), (result & 1) != 0))
    {
LABEL_37:
      char v22 = 0;
      if (!a6) {
        return result;
      }
    }
    else
    {
      if ([v12 objectForKeyedSubscript:@"NormalizedSNRThreshold"])
      {
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"NormalizedSNRThreshold"), "floatValue");
        float v14 = v13;
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"NormalizedSNRHysteresisLag"), "floatValue");
        BWSmartCameraSceneInitialize(v7 + 64, 1, 10, 2, (uint64_t)"Quadra SubPixel - Scene(Normalized SNR)", v14, v15, 0.9);
      }
      else
      {
        *(unsigned char *)(v7 + 64) = 0;
      }
      if ([v12 objectForKeyedSubscript:@"LuxLevelThreshold"])
      {
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"LuxLevelThreshold"), "floatValue");
        float v17 = v16;
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"LuxLevelHysteresisLag"), "floatValue");
        BWSmartCameraSceneInitialize(v7 + 104, 1, 10, 2, (uint64_t)"Quadra SubPixel - Scene(Lux Level)", v17, v18, 0.9);
      }
      else
      {
        *(unsigned char *)(v7 + 104) = 0;
      }
      result = [v12 objectForKeyedSubscript:@"GainThreshold"];
      uint64_t v19 = (unsigned char *)(v7 + 144);
      if (result)
      {
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"GainThreshold"), "floatValue");
        float v21 = v20;
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"GainHysteresisLag"), "floatValue");
        char v22 = 1;
        result = BWSmartCameraSceneInitialize((uint64_t)v19, 1, 10, 2, (uint64_t)"Quadra SubPixel - Scene(Gain)", v21, v23, 0.9);
        if (!a6) {
          return result;
        }
      }
      else
      {
        unsigned char *v19 = 0;
        char v22 = 1;
        if (!a6) {
          return result;
        }
      }
    }
    *a6 = v22;
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

@end