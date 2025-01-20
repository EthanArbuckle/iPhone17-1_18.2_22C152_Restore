@interface BWBravoPortraitSceneMonitorV3
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BOOL)shallowDepthOfFieldRenderingEnabled;
- (BWBravoPortraitSceneMonitorV3)initWithTuningParameters:(id)a3 zoomFactor:(float)a4 portraitAutoSuggestEnabled:(BOOL)a5 shallowDepthOfFieldEnabled:(BOOL)a6 attachDebugFrameStatistics:(BOOL)a7;
- (float)doubleExponentialSmoothing:(float *)a3 smoothValue:(float)result trendValue:(float)a5 dataFactor:(float)a6 trendFactor:;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (float)zoomFactorForTuningParameters;
- (void)dealloc;
- (void)focusScanDidComplete;
- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11;
- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3;
- (void)updateTuningParameters:(id)a3 zoomFactor:(float)a4;
@end

@implementation BWBravoPortraitSceneMonitorV3

- (float)zoomFactorForTuningParameters
{
  return self->_zoomFactorForTuningParameters;
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return 0.0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  unsigned int v69 = 0;
  BOOL v11 = a7;
  BOOL v12 = a6;
  __int16 v13 = a5;
  BOOL portraitSceneMonitoringRequiresStageThresholds = self->_portraitSceneMonitoringRequiresStageThresholds;
  v18 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  v19 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  [v19 focusDistance];
  float v21 = v20;
  if (self->_subjectTooCloseMonitoringForcingWideLens) {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "focusDistance");
  }
  float v22 = v20;
  v23 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F54338]];
  self->_float jasperDistanceAtFocus = BWModifiedMovingAverage((float)(int)objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E4F55180]), "intValue"), self->_jasperDistanceAtFocus, self->_jasperDistanceAtFocusSmoothingFactor);
  int v24 = [v19 afStatus];
  BOOL v25 = [v19 afStatus] == 4 || objc_msgSend(v19, "afStatus") == 3;
  BOOL v26 = v24 == 4;
  [v19 focusingMethod];
  if (!FigCaptureStreamFocusingMethodIsPhaseDetectionBased()) {
    BOOL v25 = v26;
  }
  BOOL v27 = self->_focusHasBeenAttainedAfterStart || v25;
  self->_focusHasBeenAttainedAfterStart = v27;
  if (v27) {
    ++self->_numFramesSinceFocusFirstAttainedStability;
  }
  if (self->_focusLocked)
  {
    int numFramesSinceFocusLocked = self->_numFramesSinceFocusLocked;
    self->_int numFramesSinceFocusLocked = numFramesSinceFocusLocked + 1;
    BOOL v29 = numFramesSinceFocusLocked > 8;
  }
  else
  {
    BOOL v29 = 0;
  }
  CMSetAttachment(a3, @"SDOFFocusLocked", (CFTypeRef)[NSNumber numberWithBool:v29], 1u);
  if (v25) {
    int v30 = self->_numFramesSinceFocusBecameStable + 1;
  }
  else {
    int v30 = 0;
  }
  self->_numFramesSinceFocusBecameStable = v30;
  float sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard;
  if ((sceneTooDarkGainThresholdHard == 0.0
     || ([v19 gain],
         float sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard,
         v32 <= sceneTooDarkGainThresholdHard))
    && (sceneTooDarkGainThresholdHard != 0.0 || ([v19 gain], v33 <= self->_sceneTooDarkGainThreshold)))
  {
    int v34 = 40;
  }
  else
  {
    self->_numberOfFramesWithStableFocusThreshold = 0;
    self->_deliveryOfShiftsHasStarted = 1;
    int v34 = 4;
  }
  if (!self->_focusIsStationaryBeyondThreshold && v25)
  {
    if (self->_numFramesSinceFocusBecameStable <= self->_numberOfFramesWithStableFocusThreshold)
    {
LABEL_30:
      BOOL v36 = 0;
      goto LABEL_33;
    }
  }
  else if (!self->_focusIsStationaryBeyondThreshold)
  {
    goto LABEL_30;
  }
  BOOL v36 = self->_numFramesSinceFocusFirstAttainedStability > v34;
LABEL_33:
  self->_focusIsStationaryBeyondThreshold = v36;
  if (v29) {
    goto LABEL_82;
  }
  self->_subjectIsTooFar = 0;
  if (self->_subjectTooFarMonitoringEnabled)
  {
    float subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
    if (self->_subjectTooFarDistanceThresholdReached)
    {
      if (v21 <= (float)(subjectTooFarFocusDistanceThreshold - self->_subjectTooFarDistanceThresholdHysteresis))
      {
        self->_subjectTooFarDistanceThresholdReached = 0;
        goto LABEL_53;
      }
    }
    else
    {
      if (v21 < subjectTooFarFocusDistanceThreshold) {
        goto LABEL_53;
      }
      self->_subjectTooFarDistanceThresholdReached = 1;
    }
    float backgroundShiftSumSmoothed = self->_backgroundShiftSumSmoothed;
    float subjectTooFarBackgroundShiftSumTooLowThreshold = self->_subjectTooFarBackgroundShiftSumTooLowThreshold;
    if (self->_backgroundShiftSumTooLowThresholdReached)
    {
      if (backgroundShiftSumSmoothed > (float)(subjectTooFarBackgroundShiftSumTooLowThreshold
                                              * self->_subjectTooFarBackGroundShiftSumIsTooLowHysteresis))
      {
        BOOL v40 = 0;
LABEL_45:
        self->_backgroundShiftSumTooLowThresholdReached = v40;
        goto LABEL_48;
      }
      BOOL v40 = 1;
    }
    else
    {
      if (backgroundShiftSumSmoothed < subjectTooFarBackgroundShiftSumTooLowThreshold)
      {
        BOOL v40 = 1;
        goto LABEL_45;
      }
      BOOL v40 = 0;
    }
LABEL_48:
    self->_subjectIsTooFar = v40;
    float jasperDistanceAtFocus = self->_jasperDistanceAtFocus;
    float subjectTooFarDigitalFlashThreshold = self->_subjectTooFarDigitalFlashThreshold;
    if (jasperDistanceAtFocus <= subjectTooFarDigitalFlashThreshold)
    {
      if (self->_subjectIsTooFarDigitalFlash
        && jasperDistanceAtFocus <= (float)(subjectTooFarDigitalFlashThreshold
                                          - self->_stageTooFarDistanceThresholdHysteresis))
      {
        self->_subjectIsTooFarDigitalFlash = 0;
      }
    }
    else
    {
      self->_subjectIsTooFarDigitalFlash = 1;
    }
  }
LABEL_53:
  self->_subjectIsTooFarForStage = 0;
  if (!self->_stageTooFarMonitoringEnabled) {
    goto LABEL_72;
  }
  float stageTooFarFocusDistanceThreshold = self->_stageTooFarFocusDistanceThreshold;
  if (self->_stageTooFarDistanceThresholdReached)
  {
    if (v21 <= (float)(stageTooFarFocusDistanceThreshold - self->_stageTooFarDistanceThresholdHysteresis))
    {
      self->_stageTooFarDistanceThresholdReached = 0;
      goto LABEL_72;
    }
  }
  else
  {
    if (v21 < stageTooFarFocusDistanceThreshold) {
      goto LABEL_72;
    }
    self->_stageTooFarDistanceThresholdReached = 1;
  }
  float v44 = self->_backgroundShiftSumSmoothed;
  float stageTooFarBackgroundShiftSumTooLowThreshold = self->_stageTooFarBackgroundShiftSumTooLowThreshold;
  if (self->_stageBackgroundShiftSumTooLowThresholdReached)
  {
    if (v44 > (float)(stageTooFarBackgroundShiftSumTooLowThreshold
                     * self->_stageTooFarBackGroundShiftSumIsTooLowHysteresis))
    {
      BOOL v46 = 0;
LABEL_64:
      self->_stageBackgroundShiftSumTooLowThresholdReached = v46;
      goto LABEL_67;
    }
    BOOL v46 = 1;
  }
  else
  {
    if (v44 < stageTooFarBackgroundShiftSumTooLowThreshold)
    {
      BOOL v46 = 1;
      goto LABEL_64;
    }
    BOOL v46 = 0;
  }
LABEL_67:
  self->_subjectIsTooFarForStage = v46;
  float v47 = self->_jasperDistanceAtFocus;
  float stageTooFarDigitalFlashThreshold = self->_stageTooFarDigitalFlashThreshold;
  if (v47 <= stageTooFarDigitalFlashThreshold)
  {
    if (self->_subjectIsTooFarForStageDigitalFlash
      && v47 <= (float)(stageTooFarDigitalFlashThreshold - self->_subjectTooFarDistanceThresholdHysteresis))
    {
      self->_BOOL subjectIsTooFarForStageDigitalFlash = 0;
    }
  }
  else
  {
    self->_BOOL subjectIsTooFarForStageDigitalFlash = 1;
  }
LABEL_72:
  if (self->_subjectTooCloseMonitoringEnabled && v25)
  {
    float subjectTooCloseFocusDistanceThreshold = self->_subjectTooCloseFocusDistanceThreshold;
    if (self->_subjectIsTooClose)
    {
      if (v22 < (float)(subjectTooCloseFocusDistanceThreshold + self->_subjectTooCloseHysteresis)) {
        goto LABEL_82;
      }
      BOOL v51 = 0;
    }
    else
    {
      if (v22 > subjectTooCloseFocusDistanceThreshold) {
        goto LABEL_82;
      }
      BOOL v51 = 1;
    }
    self->_subjectIsTooClose = v51;
  }
LABEL_82:
  if (!self->_sceneTooDarkMonitoringEnabled) {
    goto LABEL_90;
  }
  [v19 gain];
  if ((v13 & 0x800) == 0 && v52 < self->_sceneTooDarkGainThreshold)
  {
    if (!self->_sceneIsTooDark) {
      goto LABEL_90;
    }
LABEL_89:
    self->_sceneIsTooDark = 0;
    goto LABEL_90;
  }
  float v53 = (float)[v19 aeAverage];
  float v54 = v53 / (float)[v19 aeTarget];
  float sceneTooDarkAEAverageAETargetFractionThreshold = self->_sceneTooDarkAEAverageAETargetFractionThreshold;
  if (self->_sceneIsTooDark)
  {
    if (v54 <= (float)(sceneTooDarkAEAverageAETargetFractionThreshold
                      * self->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag))
      goto LABEL_90;
    goto LABEL_89;
  }
  if (v54 < sceneTooDarkAEAverageAETargetFractionThreshold) {
    self->_sceneIsTooDark = 1;
  }
LABEL_90:
  float v56 = self->_backgroundShiftSumSmoothed;
  float stageTooFarBackgroundShiftSumNoFacesThreshold = self->_stageTooFarBackgroundShiftSumNoFacesThreshold;
  if (self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
  {
    if (v56 > (float)(stageTooFarBackgroundShiftSumNoFacesThreshold
                     * self->_stageTooFarBackGroundShiftSumIsTooLowHysteresis))
    {
      BOOL v58 = 0;
LABEL_95:
      self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = v58;
      goto LABEL_98;
    }
    BOOL v58 = 1;
  }
  else
  {
    if (v56 < stageTooFarBackgroundShiftSumNoFacesThreshold)
    {
      BOOL v58 = 1;
      goto LABEL_95;
    }
    BOOL v58 = 0;
  }
LABEL_98:
  self->_subjectIsTooFarForStageNoFaces = v58;
  if (self->_stageFaceMonitoringEnabled)
  {
    BOOL stageFaceHasBeenSeen = self->_stageFaceHasBeenSeen;
    if (self->_stageFaceHasBeenSeen) {
      BOOL stageFaceHasBeenSeen = self->_stageFaceNumberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
    }
  }
  else
  {
    BOOL stageFaceHasBeenSeen = 1;
  }
  if (self->_subjectIsTooClose)
  {
    uint64_t v60 = 4;
LABEL_111:
    unsigned int v69 = v60;
    goto LABEL_112;
  }
  if (!portraitSceneMonitoringRequiresStageThresholds)
  {
    if (!self->_subjectIsTooFar) {
      goto LABEL_166;
    }
    goto LABEL_109;
  }
  if (!stageFaceHasBeenSeen)
  {
    if (!v58) {
      goto LABEL_166;
    }
LABEL_110:
    uint64_t v60 = 3;
    goto LABEL_111;
  }
  if (self->_subjectIsTooFarForStage)
  {
LABEL_109:
    if (v11) {
      goto LABEL_166;
    }
    goto LABEL_110;
  }
LABEL_166:
  uint64_t v60 = 1;
  unsigned int v69 = 1;
  if (stageFaceHasBeenSeen)
  {
    int v61 = 2;
    goto LABEL_113;
  }
LABEL_112:
  self->_BOOL stageFaceHasBeenSeen = 0;
  int v61 = 1;
LABEL_113:
  if (self->_sceneIsTooDark && !v12 && !v11)
  {
    uint64_t v60 = 5;
LABEL_120:
    unsigned int v69 = v60;
    int v61 = 1;
    BOOL subjectIsTooFarForStageDigitalFlash = 1;
    goto LABEL_121;
  }
  BOOL subjectIsTooFarForStageDigitalFlash = 0;
  if (self->_sceneIsTooDark && v12)
  {
    uint64_t v60 = 1;
    goto LABEL_120;
  }
LABEL_121:
  if (v11)
  {
    if (portraitSceneMonitoringRequiresStageThresholds)
    {
      if (self->_subjectIsTooFarForStageDigitalFlash) {
        uint64_t v60 = 3;
      }
      else {
        uint64_t v60 = v60;
      }
      BOOL subjectIsTooFarForStageDigitalFlash = self->_subjectIsTooFarForStageDigitalFlash;
      if (self->_subjectIsTooFarForStageDigitalFlash) {
        int v61 = 1;
      }
    }
    else if (self->_subjectIsTooFarDigitalFlash)
    {
      uint64_t v60 = 3;
    }
    else
    {
      uint64_t v60 = v60;
    }
    unsigned int v69 = v60;
    [v19 gain];
    if (v63 >= self->_sceneTooDarkGainThresholdHard)
    {
      int v61 = 1;
      CMSetAttachment(a3, @"BWShallowDepthOfFieldEffectPreviewStatusOverride", &unk_1EFAFDEC0, 1u);
      BOOL subjectIsTooFarForStageDigitalFlash = 1;
    }
  }
  if (!self->_stageSegmentationMonitoringEnabled) {
    goto LABEL_142;
  }
  if (v60 != 1)
  {
    if (v60 != 3) {
      goto LABEL_140;
    }
    unsigned int v69 = 1;
  }
  uint64_t v60 = 1;
  if (self->_personSegmentationStatusEnabled) {
    int v61 = 2;
  }
  else {
    int v61 = 1;
  }
LABEL_140:
  if (subjectIsTooFarForStageDigitalFlash) {
    int v61 = 1;
  }
LABEL_142:
  if (!self->_autoSuggestEnabled)
  {
    if (!self->_focusIsStationaryBeyondThreshold || !self->_deliveryOfShiftsHasStarted)
    {
      uint64_t v60 = 0;
      int v61 = 0;
      unsigned int v69 = 0;
    }
    goto LABEL_157;
  }
  BOOL v64 = [(BWPortraitAutoSuggest *)self->_autoSuggestMonitor runAutoSuggestionWithSampleBuffer:a3 portraitSceneMonitorStatus:&v69];
  int autoSuggestMaxThermalPressureLevel = self->_autoSuggestMaxThermalPressureLevel;
  int autoSuggestMaxPeakPowerPressureLevel = self->_autoSuggestMaxPeakPowerPressureLevel;
  if (autoSuggestMaxThermalPressureLevel >= a8 && autoSuggestMaxPeakPowerPressureLevel >= a9
    || v69 > 0xE
    || ((1 << v69) & 0x7A02) == 0)
  {
    goto LABEL_145;
  }
  if (autoSuggestMaxThermalPressureLevel < a8)
  {
    uint64_t v60 = 6;
    goto LABEL_156;
  }
  if (autoSuggestMaxPeakPowerPressureLevel >= a9)
  {
LABEL_145:
    if (!v64) {
      return v64;
    }
    uint64_t v60 = v69;
    goto LABEL_157;
  }
  uint64_t v60 = 15;
LABEL_156:
  unsigned int v69 = v60;
  if (!v64)
  {
    LOBYTE(v64) = 0;
    return v64;
  }
LABEL_157:
  CMSetAttachment(a3, @"SDOFEffectStatus", (CFTypeRef)[NSNumber numberWithInt:v60], 1u);
  if (a10) {
    *a10 = v69;
  }
  if (a11) {
    *a11 = v61;
  }
  LOBYTE(v64) = 1;
  return v64;
}

- (BWBravoPortraitSceneMonitorV3)initWithTuningParameters:(id)a3 zoomFactor:(float)a4 portraitAutoSuggestEnabled:(BOOL)a5 shallowDepthOfFieldEnabled:(BOOL)a6 attachDebugFrameStatistics:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BWBravoPortraitSceneMonitorV3;
  BOOL v11 = [(BWBravoPortraitSceneMonitorV3 *)&v15 init];
  BOOL v12 = v11;
  if (v11)
  {
    v11->_numberOfFramesWithStableFocusThreshold = 3;
    v11->_subjectTooCloseMonitoringEnabled = 1;
    v11->_subjectTooCloseMonitoringForcingWideLens = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ForceWideLensForTooCloseGating"), "BOOLValue");
    v12->_subjectTooCloseHysteresis = 2.0;
    v12->_subjectTooFarMonitoringEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SubjectTooFarMonitoringEnabled"), "BOOLValue");
    v12->_subjectTooFarDistanceThresholdReached = 0;
    v12->_subjectTooFarDistanceThresholdHysteresis = 10.0;
    v12->_backgroundShiftSumTooLowThresholdReached = 0;
    *(_WORD *)&v12->_subjectIsTooFarDigitalFlash = 0;
    *(void *)&v12->_subjectTooFarBackGroundShiftSumIsTooLowHysteresis = 1066192077;
    v12->_jasperDistanceAtFocusSmoothingFactor = 0.05;
    v12->_backgroundShiftSumSmoothingTrendUpdateFactor = 0.025;
    *(void *)&v12->_backgroundShiftSumSmoothingTrend = 0x3D8F5C2900000000;
    v12->_invalidShiftRatioSmoothingFactor = 0.025;
    v12->_sceneTooDarkMonitoringEnabled = 1;
    v12->_stageFaceMonitoringEnabled = 1;
    v12->_stageTooFarMonitoringEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SubjectTooFarMonitoringEnabled"), "BOOLValue");
    v12->_stageTooFarDistanceThresholdReached = 0;
    v12->_stageTooFarDistanceThresholdHysteresis = 10.0;
    v12->_stageBackgroundShiftSumTooLowThresholdReached = 0;
    v12->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 0;
    v12->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v12->_stageTooFarBackGroundShiftSumIsTooLowHysteresis = 1.15;
    v12->_stageSegmentationMonitoringEnabled = 0;
    v12->_personSegmentationRatioThreshold = 0.1;
    *(void *)&v12->_int autoSuggestMaxThermalPressureLevel = 0x200000002;
    [(BWBravoPortraitSceneMonitorV3 *)v12 updateTuningParameters:a3 zoomFactor:COERCE_DOUBLE(LODWORD(a4) | 0x200000000)];
    v12->_deliveryOfShiftsHasStarted = 0;
    v12->_sceneIsTooDark = 0;
    v12->_subjectIsTooClose = 0;
    v12->_focusHasBeenAttainedAfterStart = 0;
    v12->_numFramesSinceFocusFirstAttainedStability = 0;
    v12->_autoSuggestEnabled = v8;
    if (!v8)
    {
LABEL_5:
      v12->_focusIsStationaryBeyondThreshold = 0;
      [(BWBravoPortraitSceneMonitorV3 *)v12 setShallowDepthOfFieldRenderingEnabled:v7];
      return v12;
    }
    __int16 v13 = [[BWPortraitAutoSuggest alloc] initWithTuningParameters:a3];
    v12->_autoSuggestMonitor = v13;
    if (v13)
    {
      [(BWPortraitAutoSuggest *)v13 setPortTypeIsFFC:0];
      goto LABEL_5;
    }
  }
  return v12;
}

- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3
{
}

- (void)updateTuningParameters:(id)a3 zoomFactor:(float)a4
{
  if (a3)
  {
    if (a4 != 0.0)
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooCloseFocusDistanceThreshold"), "floatValue");
      self->_float subjectTooCloseFocusDistanceThreshold = v7;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarFocusDistanceThreshold"), "floatValue");
      self->_float subjectTooFarFocusDistanceThreshold = v8;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"BackgroundShiftSumTooLowThreshold"), "floatValue");
      self->_float subjectTooFarBackgroundShiftSumTooLowThreshold = v9;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarJasperDistanceThreshold"), "floatValue");
      self->_float subjectTooFarDigitalFlashThreshold = v10;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarJasperDistanceThreshold"), "floatValue");
      self->_float stageTooFarDigitalFlashThreshold = v11;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkGainThresholdHard"), "floatValue");
      self->_float sceneTooDarkGainThresholdHard = v12;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkGainThreshold"), "floatValue");
      self->_sceneTooDarkGainThreshold = v13;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkAEAverageAETargetFractionThreshold"), "floatValue");
      self->_float sceneTooDarkAEAverageAETargetFractionThreshold = v14;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkAEAverageAETargetFractionThresholdHysteresisLag"), "floatValue");
      self->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag = v15;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarFocusDistanceThreshold"), "floatValue");
      self->_float stageTooFarFocusDistanceThreshold = v16;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageBackgroundShiftSumTooLowThreshold"), "floatValue");
      self->_float stageTooFarBackgroundShiftSumTooLowThreshold = v17;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarBackgroundShiftSumNoFacesThreshold"), "floatValue");
      self->_float stageTooFarBackgroundShiftSumNoFacesThreshold = v18;
      self->_zoomFactorForTuningParameters = a4;
    }
  }
}

- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5
{
  if (a3)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 0;
  }
  else if (a4)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 256;
    self->_int numFramesSinceFocusLocked = 0;
  }
  else if (a5)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 1;
  }
}

- (BOOL)portraitSceneMonitoringRequiresStageThresholds
{
  return self->_portraitSceneMonitoringRequiresStageThresholds;
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWPortraitAutoSuggest *)self->_autoSuggestMonitor dealloc];
  v3.receiver = self;
  v3.super_class = (Class)BWBravoPortraitSceneMonitorV3;
  [(BWBravoPortraitSceneMonitorV3 *)&v3 dealloc];
}

- (BOOL)shallowDepthOfFieldRenderingEnabled
{
  return [(BWPortraitAutoSuggest *)self->_autoSuggestMonitor shallowDepthOfFieldRenderingEnabled];
}

- (void)focusScanDidComplete
{
  if (self->_oneShotFocusScanInProgress)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 256;
    self->_int numFramesSinceFocusLocked = 0;
  }
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  self->_invalidShiftRatioSmoothed = BWModifiedMovingAverage(a4, self->_invalidShiftRatioSmoothed, self->_invalidShiftRatioSmoothingFactor);
  float v16 = BWModifiedMovingAverage(a11, self->_personSegmentationRatioSmoothed, 0.35);
  self->_personSegmentationRatioSmoothed = v16;
  if (self->_personSegmentationStatusEnabled) {
    BOOL v17 = v16 >= self->_personSegmentationRatioThreshold;
  }
  else {
    BOOL v17 = self->_personSegmentationRatioThreshold * 1.2 <= v16;
  }
  self->_personSegmentationStatusEnabled = v17;
  -[BWBravoPortraitSceneMonitorV3 doubleExponentialSmoothing:smoothValue:trendValue:dataFactor:trendFactor:]((uint64_t)self, &self->_backgroundShiftSumSmoothed, &self->_backgroundShiftSumSmoothingTrend, a3, self->_backgroundShiftSumSmoothingFactor, self->_backgroundShiftSumSmoothingTrendUpdateFactor);
  BOOL v19 = a4 < 0.9 || self->_deliveryOfShiftsHasStarted;
  self->_deliveryOfShiftsHasStarted = v19;

  float v20 = (NSArray *)[a10 copy];
  self->_stageMostRecentFaces = v20;
  self->_stageFaceHasBeenSeen |= [(NSArray *)v20 count] != 0;
  if ([(NSArray *)self->_stageMostRecentFaces count]) {
    int v21 = 0;
  }
  else {
    int v21 = self->_stageFaceNumberOfFramesSinceLastFace + 1;
  }
  self->_stageFaceNumberOfFramesSinceLastFace = v21;
}

- (float)doubleExponentialSmoothing:(float *)a3 smoothValue:(float)result trendValue:(float)a5 dataFactor:(float)a6 trendFactor:
{
  if (a1)
  {
    result = (float)(result * a5) + (1.0 - a5) * (float)(*a2 + *a3);
    float v6 = (float)((float)(result - *a2) * a6) + (1.0 - a6) * *a3;
    *a3 = v6;
    *a2 = result;
  }
  return result;
}

- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3
{
  self->_BOOL portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end