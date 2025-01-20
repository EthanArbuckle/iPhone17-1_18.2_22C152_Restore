@interface BWBravoPortraitSceneMonitorV2
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BWBravoPortraitSceneMonitorV2)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (void)dealloc;
- (void)focusScanDidComplete;
- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11;
@end

@implementation BWBravoPortraitSceneMonitorV2

+ (void)initialize
{
}

- (BWBravoPortraitSceneMonitorV2)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)BWBravoPortraitSceneMonitorV2;
  v5 = [(BWBravoPortraitSceneMonitorV2 *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_numberOfFramesWithStableFocusThreshold = 3;
    v5->_subjectTooCloseMonitoringEnabled = 1;
    v5->_subjectTooCloseMonitoringForcingWideLens = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ForceWideLensForTooCloseGating"), "BOOLValue");
    v6->_subjectTooCloseFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooCloseFocusDistanceThreshold"), "intValue");
    v6->_subjectTooCloseHysteresis = 2.0;
    v6->_subjectTooFarMonitoringEnabled = 1;
    v6->_subjectTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarFocusDistanceThreshold"), "intValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"BackgroundShiftSumTooLowThreshold"), "floatValue");
    v6->_subjectTooFarBackgroundShiftSumTooLowThreshold = v7;
    v6->_subjectTooFarDistanceThresholdReached = 0;
    v6->_subjectTooFarDistanceThresholdHysteresis = 10.0;
    v6->_backgroundShiftSumTooLowThresholdReached = 0;
    v6->_subjectTooFarBackGroundShiftSumIsTooLowHysteresis = 1.1;
    *(_WORD *)&v6->_subjectIsTooFarDigitalFlash = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarJasperDistanceThreshold"), "floatValue");
    v6->_subjectTooFarDigitalFlashThreshold = v8;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarJasperDistanceThreshold"), "floatValue");
    v6->_stageTooFarDigitalFlashThreshold = v9;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkGainThresholdHard"), "floatValue");
    v6->_sceneTooDarkGainThresholdHard = v10;
    v6->_jasperDistanceAtFocus = 0.0;
    v6->_jasperDistanceAtFocusSmoothingFactor = 0.05;
    v6->_backgroundShiftSumSmoothingTrendUpdateFactor = 0.025;
    *(void *)&v6->_backgroundShiftSumSmoothingTrend = 0x3D8F5C2900000000;
    v6->_invalidShiftRatioSmoothingFactor = 0.025;
    v6->_sceneTooDarkMonitoringEnabled = 1;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkGainThreshold"), "floatValue");
    v6->_sceneTooDarkGainThreshold = v11;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkAEAverageAETargetFractionThreshold"), "floatValue");
    v6->_sceneTooDarkAEAverageAETargetFractionThreshold = v12;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkAEAverageAETargetFractionThresholdHysteresisLag"), "floatValue");
    v6->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag = v13;
    v6->_stageFaceMonitoringEnabled = 1;
    v6->_stageTooFarMonitoringEnabled = 1;
    v6->_stageTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarFocusDistanceThreshold"), "intValue");
    v6->_stageTooFarDistanceThresholdReached = 0;
    v6->_stageTooFarDistanceThresholdHysteresis = 10.0;
    v6->_stageBackgroundShiftSumTooLowThresholdReached = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageBackgroundShiftSumTooLowThreshold"), "floatValue");
    v6->_stageTooFarBackgroundShiftSumTooLowThreshold = v14;
    v6->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarBackgroundShiftSumNoFacesThreshold"), "floatValue");
    v6->_stageTooFarBackgroundShiftSumNoFacesThreshold = v15;
    v6->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v6->_stageTooFarBackGroundShiftSumIsTooLowHysteresis = 1.15;
    v6->_deliveryOfShiftsHasStarted = 0;
    v6->_sceneIsTooDark = 0;
    v6->_subjectIsTooClose = 0;
    v6->_focusHasBeenAttainedAfterStart = 0;
    v6->_numFramesSinceFocusFirstAttainedStability = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWBravoPortraitSceneMonitorV2;
  [(BWBravoPortraitSceneMonitorV2 *)&v3 dealloc];
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
    self->_numFramesSinceFocusLocked = 0;
  }
  else if (a5)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 1;
  }
  self->_focusIsStationaryBeyondThreshold = 0;
}

- (void)focusScanDidComplete
{
  if (self->_oneShotFocusScanInProgress)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 256;
    self->_numFramesSinceFocusLocked = 0;
  }
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  self->_invalidShiftRatioSmoothed = BWModifiedMovingAverage(a4, self->_invalidShiftRatioSmoothed, self->_invalidShiftRatioSmoothingFactor);
  -[BWBravoPortraitSceneMonitorV3 doubleExponentialSmoothing:smoothValue:trendValue:dataFactor:trendFactor:]((uint64_t)self, &self->_backgroundShiftSumSmoothed, &self->_backgroundShiftSumSmoothingTrend, a3, self->_backgroundShiftSumSmoothingFactor, self->_backgroundShiftSumSmoothingTrendUpdateFactor);
  BOOL v16 = a4 < 0.9 || self->_deliveryOfShiftsHasStarted;
  self->_deliveryOfShiftsHasStarted = v16;

  objc_super v17 = (NSArray *)[a10 copy];
  self->_stageMostRecentFaces = v17;
  self->_stageFaceHasBeenSeen |= [(NSArray *)v17 count] != 0;
  if ([(NSArray *)self->_stageMostRecentFaces count]) {
    int v18 = 0;
  }
  else {
    int v18 = self->_stageFaceNumberOfFramesSinceLastFace + 1;
  }
  self->_stageFaceNumberOfFramesSinceLastFace = v18;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL portraitSceneMonitoringRequiresStageThresholds = self->_portraitSceneMonitoringRequiresStageThresholds;
  objc_super v17 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int v18 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  [v18 focusDistance];
  float v20 = v19;
  if (self->_subjectTooCloseMonitoringForcingWideLens) {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "focusDistance");
  }
  float v21 = v19;
  v22 = (void *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F54338]];
  self->_float jasperDistanceAtFocus = BWModifiedMovingAverage((float)(int)objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E4F55180]), "intValue"), self->_jasperDistanceAtFocus, self->_jasperDistanceAtFocusSmoothingFactor);
  int v23 = [v18 afStatus];
  BOOL v24 = [v18 afStatus] == 4 || objc_msgSend(v18, "afStatus") == 3;
  BOOL v25 = v23 == 4;
  [v18 focusingMethod];
  if (FigCaptureStreamFocusingMethodIsPhaseDetectionBased()) {
    BOOL v26 = v24;
  }
  else {
    BOOL v26 = v25;
  }
  BOOL v27 = self->_focusHasBeenAttainedAfterStart || v26;
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
  if (v26) {
    int v30 = self->_numFramesSinceFocusBecameStable + 1;
  }
  else {
    int v30 = 0;
  }
  self->_numFramesSinceFocusBecameStable = v30;
  float sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard;
  if ((sceneTooDarkGainThresholdHard == 0.0
     || ([v18 gain],
         float sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard,
         v32 <= sceneTooDarkGainThresholdHard))
    && (sceneTooDarkGainThresholdHard != 0.0 || ([v18 gain], v33 <= self->_sceneTooDarkGainThreshold)))
  {
    int v34 = 40;
  }
  else
  {
    self->_numberOfFramesWithStableFocusThreshold = 0;
    self->_deliveryOfShiftsHasStarted = 1;
    int v34 = 4;
  }
  if (!self->_focusIsStationaryBeyondThreshold && v26)
  {
    if (self->_numFramesSinceFocusBecameStable <= self->_numberOfFramesWithStableFocusThreshold)
    {
LABEL_31:
      BOOL v36 = 0;
      goto LABEL_34;
    }
  }
  else if (!self->_focusIsStationaryBeyondThreshold)
  {
    goto LABEL_31;
  }
  BOOL v36 = self->_numFramesSinceFocusFirstAttainedStability > v34;
LABEL_34:
  self->_focusIsStationaryBeyondThreshold = v36;
  if (v29) {
    goto LABEL_83;
  }
  self->_subjectIsTooFar = 0;
  if (self->_subjectTooFarMonitoringEnabled)
  {
    float subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
    if (self->_subjectTooFarDistanceThresholdReached)
    {
      if (v20 <= (float)(subjectTooFarFocusDistanceThreshold - self->_subjectTooFarDistanceThresholdHysteresis))
      {
        self->_subjectTooFarDistanceThresholdReached = 0;
        goto LABEL_54;
      }
    }
    else
    {
      if (v20 < subjectTooFarFocusDistanceThreshold) {
        goto LABEL_54;
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
LABEL_46:
        self->_backgroundShiftSumTooLowThresholdReached = v40;
        goto LABEL_49;
      }
      BOOL v40 = 1;
    }
    else
    {
      if (backgroundShiftSumSmoothed < subjectTooFarBackgroundShiftSumTooLowThreshold)
      {
        BOOL v40 = 1;
        goto LABEL_46;
      }
      BOOL v40 = 0;
    }
LABEL_49:
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
LABEL_54:
  if (!self->_stageTooFarMonitoringEnabled) {
    goto LABEL_73;
  }
  self->_subjectIsTooFarForStage = 0;
  float stageTooFarFocusDistanceThreshold = self->_stageTooFarFocusDistanceThreshold;
  if (self->_stageTooFarDistanceThresholdReached)
  {
    if (v20 <= (float)(stageTooFarFocusDistanceThreshold - self->_stageTooFarDistanceThresholdHysteresis))
    {
      self->_stageTooFarDistanceThresholdReached = 0;
      goto LABEL_73;
    }
  }
  else
  {
    if (v20 < stageTooFarFocusDistanceThreshold) {
      goto LABEL_73;
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
LABEL_65:
      self->_stageBackgroundShiftSumTooLowThresholdReached = v46;
      goto LABEL_68;
    }
    BOOL v46 = 1;
  }
  else
  {
    if (v44 < stageTooFarBackgroundShiftSumTooLowThreshold)
    {
      BOOL v46 = 1;
      goto LABEL_65;
    }
    BOOL v46 = 0;
  }
LABEL_68:
  self->_subjectIsTooFarForStage = v46;
  float v47 = self->_jasperDistanceAtFocus;
  float stageTooFarDigitalFlashThreshold = self->_stageTooFarDigitalFlashThreshold;
  if (v47 <= stageTooFarDigitalFlashThreshold)
  {
    if (self->_subjectIsTooFarForStageDigitalFlash
      && v47 <= (float)(stageTooFarDigitalFlashThreshold - self->_subjectTooFarDistanceThresholdHysteresis))
    {
      self->_subjectIsTooFarForStageDigitalFlash = 0;
    }
  }
  else
  {
    self->_subjectIsTooFarForStageDigitalFlash = 1;
  }
LABEL_73:
  if (self->_subjectTooCloseMonitoringEnabled && v26)
  {
    float subjectTooCloseFocusDistanceThreshold = self->_subjectTooCloseFocusDistanceThreshold;
    if (self->_subjectIsTooClose)
    {
      if (v21 < (float)(subjectTooCloseFocusDistanceThreshold + self->_subjectTooCloseHysteresis)) {
        goto LABEL_83;
      }
      BOOL v51 = 0;
    }
    else
    {
      if (v21 > subjectTooCloseFocusDistanceThreshold) {
        goto LABEL_83;
      }
      BOOL v51 = 1;
    }
    self->_subjectIsTooClose = v51;
  }
LABEL_83:
  if (!self->_sceneTooDarkMonitoringEnabled) {
    goto LABEL_88;
  }
  [v18 gain];
  if (v52 < self->_sceneTooDarkGainThreshold)
  {
LABEL_87:
    self->_sceneIsTooDark = 0;
    goto LABEL_88;
  }
  float v53 = (float)[v18 aeAverage];
  float v54 = v53 / (float)[v18 aeTarget];
  float sceneTooDarkAEAverageAETargetFractionThreshold = self->_sceneTooDarkAEAverageAETargetFractionThreshold;
  if (self->_sceneIsTooDark)
  {
    if (v54 <= (float)(sceneTooDarkAEAverageAETargetFractionThreshold
                      * self->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag))
      goto LABEL_88;
    goto LABEL_87;
  }
  if (v54 < sceneTooDarkAEAverageAETargetFractionThreshold) {
    self->_sceneIsTooDark = 1;
  }
LABEL_88:
  float v56 = self->_backgroundShiftSumSmoothed;
  float stageTooFarBackgroundShiftSumNoFacesThreshold = self->_stageTooFarBackgroundShiftSumNoFacesThreshold;
  if (self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
  {
    if (v56 > (float)(stageTooFarBackgroundShiftSumNoFacesThreshold
                     * self->_stageTooFarBackGroundShiftSumIsTooLowHysteresis))
    {
      BOOL v58 = 0;
LABEL_93:
      self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = v58;
      goto LABEL_96;
    }
    BOOL v58 = 1;
  }
  else
  {
    if (v56 < stageTooFarBackgroundShiftSumNoFacesThreshold)
    {
      BOOL v58 = 1;
      goto LABEL_93;
    }
    BOOL v58 = 0;
  }
LABEL_96:
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
    int v60 = 4;
    goto LABEL_102;
  }
  if (portraitSceneMonitoringRequiresStageThresholds)
  {
    if (stageFaceHasBeenSeen)
    {
      int v61 = 2;
      int v60 = 1;
      if (!self->_subjectIsTooFarForStage || v11) {
        goto LABEL_103;
      }
      int v60 = 3;
    }
    else if (v58)
    {
      int v60 = 3;
    }
    else
    {
      int v60 = 1;
    }
    goto LABEL_102;
  }
  int v70 = !self->_subjectIsTooFar || v11;
  char v71 = v70 & stageFaceHasBeenSeen;
  if (v70) {
    int v60 = 1;
  }
  else {
    int v60 = 3;
  }
  if ((v71 & 1) == 0)
  {
LABEL_102:
    self->_BOOL stageFaceHasBeenSeen = 0;
    int v61 = 1;
    goto LABEL_103;
  }
  int v61 = 2;
  int v60 = 1;
LABEL_103:
  if (v12) {
    int v62 = 1;
  }
  else {
    int v62 = v61;
  }
  if (v12) {
    int v63 = 1;
  }
  else {
    int v63 = v60;
  }
  int v64 = !self->_sceneIsTooDark || v12;
  int v65 = v64 | v11;
  if (self->_sceneIsTooDark)
  {
    int v61 = v62;
    int v60 = v63;
  }
  if (v65) {
    int v66 = v61;
  }
  else {
    int v66 = 1;
  }
  if (v65) {
    int v67 = v60;
  }
  else {
    int v67 = 5;
  }
  if (v11)
  {
    if (portraitSceneMonitoringRequiresStageThresholds)
    {
      int v67 = self->_subjectIsTooFarForStageDigitalFlash ? 3 : v60;
      int v66 = self->_subjectIsTooFarForStageDigitalFlash ? 1 : v61;
    }
    else
    {
      int v67 = self->_subjectIsTooFarDigitalFlash ? 3 : v60;
      int v66 = v61;
    }
    [v18 gain];
    if (v68 >= self->_sceneTooDarkGainThresholdHard)
    {
      int v66 = 1;
      CMSetAttachment(a3, @"BWShallowDepthOfFieldEffectPreviewStatusOverride", &unk_1EFAFEDA8, 1u);
    }
  }
  if (!self->_focusIsStationaryBeyondThreshold || !self->_deliveryOfShiftsHasStarted)
  {
    int v66 = 0;
    int v67 = 0;
  }
  if (a10) {
    *a10 = v67;
  }
  if (a11) {
    *a11 = v66;
  }
  return 1;
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
  self->_BOOL portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end