@interface BWPearlPortraitSceneMonitor
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BWPearlPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (void)dealloc;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11;
@end

@implementation BWPearlPortraitSceneMonitor

+ (void)initialize
{
}

- (BWPearlPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)BWPearlPortraitSceneMonitor;
  v5 = [(BWPearlPortraitSceneMonitor *)&v17 init];
  if (v5)
  {
    *((_DWORD *)v5 + 6) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NumberOfFramesToStayEnabledThreshold"), "unsignedIntValue");
    *((_WORD *)v5 + 14) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightLuxLevelThreshold"), "unsignedIntValue");
    *((_WORD *)v5 + 15) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightMaxLuxLevelThreshold"), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightDepthQualityThreshold"), "floatValue");
    *((_DWORD *)v5 + 8) = v6;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"DepthQualityKCount"), "floatValue");
    *((_DWORD *)v5 + 9) = v7;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooCloseDepthDistanceValue"), "floatValue");
    *((_DWORD *)v5 + 10) = v8;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarDepthDistanceValue"), "floatValue");
    *((_DWORD *)v5 + 11) = v9;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooBrightTooFarDepthDistanceValue"), "floatValue");
    *((_DWORD *)v5 + 12) = v10;
    *((_DWORD *)v5 + 13) = 3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooBrightDepthQualityThreshold"), "floatValue");
    *((_DWORD *)v5 + 14) = v11;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooCloseDistanceThreshold"), "floatValue");
    *((_DWORD *)v5 + 15) = v12;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarDistanceThreshold"), "floatValue");
    *((_DWORD *)v5 + 16) = v13;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageBackgroundTooFarDepthQualityThreshold"), "floatValue");
    *((_DWORD *)v5 + 17) = v14;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageBackgroundTooFarLuxLevelThreshold"), "floatValue");
    *((_WORD *)v5 + 36) = (int)v15;
    *((_DWORD *)v5 + 19) = 6;
    *((_DWORD *)v5 + 2) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NumberOfFramesToWaitForAEAndLTMToStabilize"), "unsignedIntValue");
    *(void *)(v5 + 12) = 0x3DCCCCCD3CCCCCCDLL;
  }
  return (BWPearlPortraitSceneMonitor *)v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWPearlPortraitSceneMonitor;
  [(BWPearlPortraitSceneMonitor *)&v2 dealloc];
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  self->_stageDepthQuality = 1.0 - a4;
  if (self->_portraitSceneMonitoringRequiresStageThresholds
    || self->_numberOfFramesSinceLastFace > self->_sdofNumberOfFramesSinceLastFaceThreshold)
  {
    float v16 = 1.0 / a5;
    if (a5 <= 0.0001) {
      float v16 = 10000.0;
    }
    self->_float closeDepthDistanceAverage = v16;
  }
  else if ([a6 count])
  {
    self->_float closeDepthDistanceAverage = 1000.0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v23 = [a6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(a6);
          }
          v27 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v27 floatValue];
          BOOL v28 = *(float *)&v29 <= 0.0001;
          LODWORD(v29) = 953267991;
          if (!v28) {
            objc_msgSend(v27, "floatValue", v29);
          }
          float closeDepthDistanceAverage = 1.0 / *(float *)&v29;
          if (closeDepthDistanceAverage >= self->_closeDepthDistanceAverage) {
            float closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
          }
          self->_float closeDepthDistanceAverage = closeDepthDistanceAverage;
        }
        uint64_t v24 = [a6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v24);
    }
  }
  float v17 = a7 / (float)(fmaxf(a8, 0.0001) + self->_sdofDepthQualityKCount);
  BOOL v18 = v17 <= 0.0;
  float v19 = 1.0;
  BOOL v20 = v17 < 1.0 || v17 <= 0.0;
  if (v17 >= 1.0) {
    BOOL v18 = 1;
  }
  if (v20) {
    float v19 = 0.0;
  }
  if (v18) {
    float v17 = v19;
  }
  self->_sdofDepthQuality = v17;
  self->_sdofDepthQualityFiltered = BWModifiedMovingAverage(v17, self->_sdofDepthQualityFiltered, self->_sdofDepthQualitySmoothingFactor);
  self->_depthSensorOccluded = a9;
  int v21 = [a10 count];
  self->_stageMostRecentFacesCount = v21;
  self->_stageFaceHasBeenSeen |= v21 > 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  int v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v13) {
    return (char)v13;
  }
  int v14 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  float v15 = v14;
  if (!self->_aeStableAfterStartStreaming)
  {
    int v16 = [v14 aeStable];
    if (v16
      && (int sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable,
          sdofNumFramesSinceAEBecameStable >= self->_numberOfFramesToWaitForAEAndLTMToStabilize))
    {
      BOOL v18 = 1;
      self->_aeStableAfterStartStreaming = 1;
    }
    else
    {
      BOOL v18 = (unint64_t)[a4 frameCount] > 0x13;
      self->_aeStableAfterStartStreaming = v18;
      if (!v16)
      {
        int v19 = 0;
        goto LABEL_10;
      }
      int sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable;
    }
    int v19 = sdofNumFramesSinceAEBecameStable + 1;
LABEL_10:
    self->_int sdofNumFramesSinceAEBecameStable = v19;
    if (!v18)
    {
      LOBYTE(v13) = 0;
      return (char)v13;
    }
  }
  float v20 = BWModifiedMovingAverage((float)[v15 luxLevel], self->_luxLevelFiltered, self->_luxLevelSmoothingFactor);
  self->_luxLevelFiltered = v20;
  float closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
  if (self->_portraitSceneMonitoringRequiresStageThresholds)
  {
    if (closeDepthDistanceAverage >= self->_stageTooCloseDepthDistanceThreshold)
    {
      uint64_t v22 = 64;
      goto LABEL_14;
    }
LABEL_18:
    int v23 = 4;
    goto LABEL_19;
  }
  if (closeDepthDistanceAverage < self->_sdofTooCloseDepthDistanceThreshold) {
    goto LABEL_18;
  }
  float sdofTooFarDepthDistanceThreshold = self->_sdofTooFarDepthDistanceThreshold;
  if (closeDepthDistanceAverage > sdofTooFarDepthDistanceThreshold)
  {
    int v23 = 3;
    goto LABEL_19;
  }
  LOWORD(sdofTooFarDepthDistanceThreshold) = self->_sdofTooBrightLuxLevelThreshold;
  float sdofDepthQualityFiltered = (float)LODWORD(sdofTooFarDepthDistanceThreshold);
  if (v20 <= sdofDepthQualityFiltered
    || (float sdofDepthQualityFiltered = self->_sdofDepthQualityFiltered,
        sdofDepthQualityFiltered >= self->_sdofTooBrightDepthQualityMinThreshold))
  {
    LOWORD(sdofDepthQualityFiltered) = self->_sdofTooBrightMaxLuxLevelThreshold;
    if (v20 <= (float)LODWORD(sdofDepthQualityFiltered))
    {
      int v23 = 1;
      goto LABEL_19;
    }
  }
  uint64_t v22 = 48;
LABEL_14:
  if (closeDepthDistanceAverage <= *(float *)((char *)&self->super.isa + v22)) {
    int v23 = 1;
  }
  else {
    int v23 = 3;
  }
LABEL_19:
  if (self->_depthSensorOccluded) {
    int v23 = 4;
  }
  if (v23 == 1)
  {
    self->_numberOfDisabledFramesInARow = 0;
  }
  else
  {
    int numberOfFramesToStayEnabledThreshold = self->_numberOfFramesToStayEnabledThreshold;
    int v25 = self->_numberOfDisabledFramesInARow + 1;
    self->_numberOfDisabledFramesInARow = v25;
    if (v25 < numberOfFramesToStayEnabledThreshold) {
      int v23 = 1;
    }
  }
  if (self->_stageMostRecentFacesCount < 1)
  {
    int numberOfFramesSinceLastFace = self->_numberOfFramesSinceLastFace;
    self->_int numberOfFramesSinceLastFace = numberOfFramesSinceLastFace + 1;
    if (!self->_stageFaceHasBeenSeen)
    {
      self->_stageFaceDetected = 0;
      goto LABEL_36;
    }
    BOOL v26 = numberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
  }
  else
  {
    self->_int numberOfFramesSinceLastFace = 0;
    BOOL v26 = 1;
  }
  self->_stageFaceDetected = v26;
  if (v23 == 1 && v26)
  {
    int v28 = 2;
    if (!a10) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_stageFaceHasBeenSeen = 0;
  int v28 = 1;
  if (a10) {
LABEL_37:
  }
    *a10 = v23;
LABEL_38:
  if (a11) {
    *a11 = v28;
  }
  LOBYTE(v13) = 1;
  return (char)v13;
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