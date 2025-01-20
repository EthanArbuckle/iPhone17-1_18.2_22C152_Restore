@interface BWPearlPortraitSceneMonitorV2
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BOOL)shallowDepthOfFieldRenderingEnabled;
- (BWPearlPortraitSceneMonitorV2)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4 portraitAutoSuggestEnabled:(BOOL)a5 shallowDepthOfFieldEnabled:(BOOL)a6;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (void)dealloc;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11;
- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3;
@end

@implementation BWPearlPortraitSceneMonitorV2

+ (void)initialize
{
}

- (BWPearlPortraitSceneMonitorV2)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4 portraitAutoSuggestEnabled:(BOOL)a5 shallowDepthOfFieldEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BWPearlPortraitSceneMonitorV2;
  v9 = [(BWPearlPortraitSceneMonitorV2 *)&v22 init];
  if (v9)
  {
    *((_DWORD *)v9 + 6) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NumberOfFramesToStayEnabledThreshold"), "unsignedIntValue");
    *((_WORD *)v9 + 14) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightLuxLevelThreshold"), "unsignedIntValue");
    *((_WORD *)v9 + 15) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightMaxLuxLevelThreshold"), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightDepthQualityThreshold"), "floatValue");
    *((_DWORD *)v9 + 8) = v10;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"DepthQualityKCount"), "floatValue");
    *((_DWORD *)v9 + 9) = v11;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooCloseDepthDistanceValue"), "floatValue");
    *((_DWORD *)v9 + 10) = v12;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarDepthDistanceValue"), "floatValue");
    *((_DWORD *)v9 + 11) = v13;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightTooFarDepthDistanceValue"), "floatValue");
    *((_DWORD *)v9 + 12) = v14;
    *((_DWORD *)v9 + 13) = 3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooBrightDepthQualityThreshold"), "floatValue");
    *((_DWORD *)v9 + 14) = v15;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooCloseDistanceThreshold"), "floatValue");
    *((_DWORD *)v9 + 15) = v16;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarDistanceThreshold"), "floatValue");
    *((_DWORD *)v9 + 16) = v17;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageBackgroundTooFarDepthQualityThreshold"), "floatValue");
    *((_DWORD *)v9 + 17) = v18;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageBackgroundTooFarLuxLevelThreshold"), "floatValue");
    *((_WORD *)v9 + 36) = (int)v19;
    *((_DWORD *)v9 + 19) = 6;
    v9[137] = 0;
    *((_DWORD *)v9 + 36) = 1036831949;
    *((_DWORD *)v9 + 2) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NumberOfFramesToWaitForAEAndLTMToStabilize"), "unsignedIntValue");
    *(void *)(v9 + 12) = 0x3DCCCCCD3CCCCCCDLL;
    *((void *)v9 + 19) = 0x200000002;
    v9[124] = v7;
    if (!v7)
    {
LABEL_5:
      [v9 setShallowDepthOfFieldRenderingEnabled:v6];
      *((_DWORD *)v9 + 20) = 2143289344;
      return (BWPearlPortraitSceneMonitorV2 *)v9;
    }
    v20 = [[BWPortraitAutoSuggest alloc] initWithTuningParameters:a3];
    *((void *)v9 + 16) = v20;
    if (v20)
    {
      [(BWPortraitAutoSuggest *)v20 setPortTypeIsFFC:1];
      goto LABEL_5;
    }
  }
  return (BWPearlPortraitSceneMonitorV2 *)v9;
}

- (void)dealloc
{
  [(BWPortraitAutoSuggest *)self->_autoSuggestMonitor dealloc];
  v3.receiver = self;
  v3.super_class = (Class)BWPearlPortraitSceneMonitorV2;
  [(BWPearlPortraitSceneMonitorV2 *)&v3 dealloc];
}

- (BOOL)shallowDepthOfFieldRenderingEnabled
{
  return self->_shallowDepthOfFieldRenderingEnabled;
}

- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3
{
  self->_shallowDepthOfFieldRenderingEnabled = a3;
  -[BWPortraitAutoSuggest setShallowDepthOfFieldRenderingEnabled:](self->_autoSuggestMonitor, "setShallowDepthOfFieldRenderingEnabled:");
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  self->_stageDepthQuality = 1.0 - a4;
  float v18 = BWModifiedMovingAverage(a11, self->_personSegmentationRatioSmoothed, 0.35);
  self->_personSegmentationRatioSmoothed = v18;
  if (self->_personSegmentationStatusEnabled) {
    BOOL v19 = v18 >= self->_personSegmentationRatioThreshold;
  }
  else {
    BOOL v19 = self->_personSegmentationRatioThreshold * 1.2 <= v18;
  }
  self->_personSegmentationStatusEnabled = v19;
  if (self->_portraitSceneMonitoringRequiresStageThresholds
    || self->_numberOfFramesSinceLastFace > self->_sdofNumberOfFramesSinceLastFaceThreshold)
  {
    float v20 = 1.0 / a5;
    if (a5 <= 0.0001) {
      float v20 = 10000.0;
    }
    self->_float closeDepthDistanceAverage = v20;
  }
  else if ([a6 count])
  {
    self->_float closeDepthDistanceAverage = 1000.0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v26 = [a6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(a6);
          }
          v30 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          [v30 floatValue];
          BOOL v31 = *(float *)&v32 <= 0.0001;
          LODWORD(v32) = 953267991;
          if (!v31) {
            objc_msgSend(v30, "floatValue", v32);
          }
          float closeDepthDistanceAverage = 1.0 / *(float *)&v32;
          if (closeDepthDistanceAverage >= self->_closeDepthDistanceAverage) {
            float closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
          }
          self->_float closeDepthDistanceAverage = closeDepthDistanceAverage;
        }
        uint64_t v27 = [a6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v27);
    }
  }
  float v21 = a7 / (float)(fmaxf(a8, 0.0001) + self->_sdofDepthQualityKCount);
  BOOL v22 = v21 <= 0.0;
  float v23 = 1.0;
  BOOL v24 = v21 < 1.0 || v21 <= 0.0;
  if (v21 >= 1.0) {
    BOOL v22 = 1;
  }
  if (v24) {
    float v23 = 0.0;
  }
  if (v22) {
    float v21 = v23;
  }
  self->_sdofDepthQuality = v21;
  self->_sdofDepthQualityFiltered = BWModifiedMovingAverage(v21, self->_sdofDepthQualityFiltered, self->_sdofDepthQualitySmoothingFactor);
  self->_depthSensorOccluded = a9;
  int v25 = [a10 count];
  self->_stageMostRecentFacesCount = v25;
  self->_stageFaceHasBeenSeen |= v25 > 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  int v15 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v15) {
    return (char)v15;
  }
  int v16 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  int v17 = v16;
  if (self->_aeStableAfterStartStreaming) {
    goto LABEL_11;
  }
  int v18 = [v16 aeStable];
  if (v18
    && (int sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable,
        sdofNumFramesSinceAEBecameStable >= self->_numberOfFramesToWaitForAEAndLTMToStabilize))
  {
    BOOL v20 = 1;
    self->_aeStableAfterStartStreaming = 1;
  }
  else
  {
    BOOL v20 = (unint64_t)[a4 frameCount] > 0x13;
    self->_aeStableAfterStartStreaming = v20;
    if (!v18)
    {
      int v21 = 0;
      goto LABEL_10;
    }
    int sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable;
  }
  int v21 = sdofNumFramesSinceAEBecameStable + 1;
LABEL_10:
  self->_int sdofNumFramesSinceAEBecameStable = v21;
  if (!v20) {
    goto LABEL_66;
  }
LABEL_11:
  float v22 = BWModifiedMovingAverage((float)[v17 luxLevel], self->_luxLevelFiltered, self->_luxLevelSmoothingFactor);
  self->_luxLevelFiltered = v22;
  BOOL autoSuggestEnabled = self->_autoSuggestEnabled;
  if (self->_autoSuggestEnabled)
  {
LABEL_12:
    int v24 = 1;
    unsigned int v39 = 1;
    int v25 = 1;
    goto LABEL_23;
  }
  float closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
  if (self->_portraitSceneMonitoringRequiresStageThresholds)
  {
    if (closeDepthDistanceAverage >= self->_stageTooCloseDepthDistanceThreshold)
    {
      float stageTooFarDepthDistanceThreshold = self->_stageTooFarDepthDistanceThreshold;
      goto LABEL_16;
    }
  }
  else if (closeDepthDistanceAverage >= self->_sdofTooCloseDepthDistanceThreshold)
  {
    float sdofTooFarDepthDistanceThreshold = self->_sdofTooFarDepthDistanceThreshold;
    if (closeDepthDistanceAverage > sdofTooFarDepthDistanceThreshold)
    {
LABEL_21:
      int v24 = 0;
      int v25 = 3;
      goto LABEL_22;
    }
    LOWORD(sdofTooFarDepthDistanceThreshold) = self->_sdofTooBrightLuxLevelThreshold;
    float sdofDepthQualityFiltered = (float)LODWORD(sdofTooFarDepthDistanceThreshold);
    if (v22 <= sdofDepthQualityFiltered
      || (float sdofDepthQualityFiltered = self->_sdofDepthQualityFiltered,
          sdofDepthQualityFiltered >= self->_sdofTooBrightDepthQualityMinThreshold))
    {
      LOWORD(sdofDepthQualityFiltered) = self->_sdofTooBrightMaxLuxLevelThreshold;
      if (v22 <= (float)LODWORD(sdofDepthQualityFiltered)) {
        goto LABEL_12;
      }
    }
    float stageTooFarDepthDistanceThreshold = self->_sdofTooBrightTooFarDepthDistanceThreshold;
LABEL_16:
    if (closeDepthDistanceAverage <= stageTooFarDepthDistanceThreshold) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
  int v24 = 0;
  int v25 = 4;
LABEL_22:
  unsigned int v39 = v25;
LABEL_23:
  if (self->_depthSensorOccluded)
  {
    int v25 = 4;
    unsigned int v39 = 4;
  }
  else if (v24)
  {
    self->_numberOfDisabledFramesInARow = 0;
    int v25 = 1;
    goto LABEL_29;
  }
  int numberOfFramesToStayEnabledThreshold = self->_numberOfFramesToStayEnabledThreshold;
  int v30 = self->_numberOfDisabledFramesInARow + 1;
  self->_numberOfDisabledFramesInARow = v30;
  if (v30 < numberOfFramesToStayEnabledThreshold)
  {
    int v25 = 1;
    unsigned int v39 = 1;
  }
LABEL_29:
  if (self->_stageMostRecentFacesCount < 1)
  {
    int numberOfFramesSinceLastFace = self->_numberOfFramesSinceLastFace;
    self->_int numberOfFramesSinceLastFace = numberOfFramesSinceLastFace + 1;
    if (!self->_stageFaceHasBeenSeen)
    {
      self->_stageFaceDetected = 0;
      goto LABEL_39;
    }
    BOOL v31 = numberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
  }
  else
  {
    self->_int numberOfFramesSinceLastFace = 0;
    BOOL v31 = 1;
  }
  self->_stageFaceDetected = v31;
  if (v31 && v25 == 1)
  {
    if (!self->_stageSegmentationMonitoringEnabled)
    {
      int v33 = 2;
      if (!autoSuggestEnabled) {
        goto LABEL_60;
      }
LABEL_49:
      LODWORD(v15) = [(BWPortraitAutoSuggest *)self->_autoSuggestMonitor runAutoSuggestionWithSampleBuffer:a3 portraitSceneMonitorStatus:&v39];
      int autoSuggestMaxThermalPressureLevel = self->_autoSuggestMaxThermalPressureLevel;
      int autoSuggestMaxPeakPowerPressureLevel = self->_autoSuggestMaxPeakPowerPressureLevel;
      if ((autoSuggestMaxThermalPressureLevel < a8 || autoSuggestMaxPeakPowerPressureLevel < a9)
        && v39 <= 0xE
        && ((1 << v39) & 0x7A02) != 0)
      {
        if (autoSuggestMaxThermalPressureLevel < a8)
        {
          int v36 = 6;
          goto LABEL_59;
        }
        if (autoSuggestMaxPeakPowerPressureLevel < a9)
        {
          int v36 = 15;
LABEL_59:
          unsigned int v39 = v36;
          if (v15) {
            goto LABEL_60;
          }
LABEL_66:
          LOBYTE(v15) = 0;
          return (char)v15;
        }
      }
      if (!v15) {
        return (char)v15;
      }
      goto LABEL_60;
    }
LABEL_43:
    if (self->_personSegmentationStatusEnabled) {
      int v33 = 2;
    }
    else {
      int v33 = 1;
    }
    if (!autoSuggestEnabled) {
      goto LABEL_60;
    }
    goto LABEL_49;
  }
LABEL_39:
  self->_stageFaceHasBeenSeen = 0;
  if (self->_stageSegmentationMonitoringEnabled)
  {
    if (v25 == 1) {
      goto LABEL_43;
    }
    if (v25 == 3)
    {
      unsigned int v39 = 1;
      goto LABEL_43;
    }
  }
  int v33 = 1;
  if (autoSuggestEnabled) {
    goto LABEL_49;
  }
LABEL_60:
  if (a10) {
    *a10 = v39;
  }
  if (a11) {
    *a11 = v33;
  }
  LOBYTE(v15) = 1;
  return (char)v15;
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return 0.0;
}

- (BOOL)portraitSceneMonitoringRequiresStageThresholds
{
  return self->_portraitSceneMonitoringRequiresStageThresholds;
}

- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3
{
  self->_portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end