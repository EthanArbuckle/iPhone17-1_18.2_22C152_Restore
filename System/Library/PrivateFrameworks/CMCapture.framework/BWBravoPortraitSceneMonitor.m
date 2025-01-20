@interface BWBravoPortraitSceneMonitor
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BWBravoPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (void)dealloc;
- (void)focusScanDidComplete;
- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11;
@end

@implementation BWBravoPortraitSceneMonitor

+ (void)initialize
{
}

- (BWBravoPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWBravoPortraitSceneMonitor;
  v5 = [(BWBravoPortraitSceneMonitor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    *(int32x2_t *)&v5->_backgroundShiftSumFiltered = vdup_n_s32(0x7FC00000u);
    v5->_subjectTooCloseMonitoringEnabled = 1;
    v5->_subjectTooCloseWideFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooCloseFocusDistanceThreshold"), "intValue");
    v6->_subjectTooCloseWideFocusDistanceHysteresisLag = 5.0;
    v6->_subjectTooFarMonitoringEnabled = 1;
    v6->_subjectTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarFocusDistanceThreshold"), "intValue");
    v6->_subjectTooFarFocusDistanceHysteresisLag = 20.0;
    v6->_subjectTooFarFocusDistanceInfinityThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarFocusDistanceInfinityThreshold"), "intValue");
    v6->_subjectTooFarUseTeleForFocusDistance = 1;
    *(_OWORD *)&v6->_subjectTooFarBackgroundShiftSumTooLowThreshold = xmmword_1A5F0D240;
    v6->_sceneTooDarkMonitoringEnabled = 1;
    *(_OWORD *)&v6->_sceneTooDarkGainThreshold = xmmword_1A5F0D250;
    v6->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v6->_stageFaceMonitoringEnabled = 1;
    v6->_stageTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarFocusDistanceThreshold"), "intValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StageTooFarBackgroundShiftSumNoFacesThreshold"), "floatValue");
    v6->_stageTooFarBackgroundShiftSumNoFacesThreshold = v7;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWBravoPortraitSceneMonitor;
  [(BWBravoPortraitSceneMonitor *)&v3 dealloc];
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
  float v14 = 1.0;
  float v15 = 0.35;
  if (self->_aeStableAfterStartStreaming
    && self->_focusStableAfterStartStreaming
    && !self->_oneShotFocusScanInProgress
    && !self->_focusLocked)
  {
    int lastFocusingMethod = self->_lastFocusingMethod;
    if (self->_focusAdjusting)
    {
      if (lastFocusingMethod != 1)
      {
        if (lastFocusingMethod == 2)
        {
          float v14 = 0.2;
          float v15 = 0.06;
        }
        else
        {
          float v14 = 0.15;
          float v15 = 0.025;
        }
        goto LABEL_5;
      }
    }
    else
    {
      float v14 = 0.15;
      float v15 = 0.025;
      if (lastFocusingMethod != 1 || self->_numFramesSinceFocusBecameStable > 2) {
        goto LABEL_5;
      }
    }
    float v15 = 0.25;
    float v14 = 1.0;
  }
LABEL_5:
  self->_backgroundShiftSumFiltered = BWModifiedMovingAverage(a3, self->_backgroundShiftSumFiltered, v15);
  self->_invalidShiftRatioFiltered = BWModifiedMovingAverage(a4, self->_invalidShiftRatioFiltered, v14);

  v16 = (NSArray *)[a10 copy];
  self->_stageMostRecentFaces = v16;
  self->_stageFaceHasBeenSeen |= [(NSArray *)v16 count] != 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  BOOL v11 = a6;
  CFTypeRef v15 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v15) {
    return (char)v15;
  }
  v16 = (void *)v15;
  uint64_t v17 = *MEMORY[0x1E4F52DD8];
  v85 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]];
  v18 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F52DF0]];
  float invalidShiftRatioFiltered = self->_invalidShiftRatioFiltered;
  float backgroundShiftSumFiltered = self->_backgroundShiftSumFiltered;
  if (self->_focusLocked)
  {
    int numFramesSinceFocusLocked = self->_numFramesSinceFocusLocked;
    self->_int numFramesSinceFocusLocked = numFramesSinceFocusLocked + 1;
    BOOL v22 = numFramesSinceFocusLocked > 9;
  }
  else
  {
    BOOL v22 = 0;
  }
  BOOL portraitSceneMonitoringRequiresStageThresholds = self->_portraitSceneMonitoringRequiresStageThresholds;
  CMSetAttachment(a3, @"SDOFFocusLocked", (CFTypeRef)[NSNumber numberWithBool:v22], 1u);
  float subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart = self->_subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart;
  float subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd = self->_subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd;
  float v25 = 1.0;
  if (subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart < 1.0
    && subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd > subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart)
  {
    float v27 = (float)(invalidShiftRatioFiltered
                / (float)(subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart
                        - subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd))
        + (float)(subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd
                / (float)(subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd
                        - subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart));
    if (v27 <= 1.0) {
      float v25 = v27;
    }
    if (v25 < 0.0) {
      float v25 = 0.0;
    }
    float backgroundShiftSumFiltered = backgroundShiftSumFiltered * v25;
  }
  v28 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F54300]), "objectForKeyedSubscript:", v17);
  v29 = v28;
  uint64_t v30 = *MEMORY[0x1E4F53BF8];
  BOOL v83 = v11;
  if (v28) {
    BOOL v31 = objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", v30), "intValue") != 4;
  }
  else {
    BOOL v31 = 0;
  }
  int v32 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v30), "intValue");
  uint64_t v33 = *MEMORY[0x1E4F53EE0];
  int v34 = objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE0]), "intValue");
  int v35 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v33), "intValue");
  if (v32 != 4) {
    BOOL v31 = 1;
  }
  if (v31)
  {
    int v36 = 0;
    if (v35 == 1 || v34 == 1) {
      int lastFocusingMethod = 1;
    }
    else {
      int lastFocusingMethod = 2;
    }
    int v39 = lastFocusingMethod;
  }
  else
  {
    int lastFocusingMethod = self->_lastFocusingMethod;
    int v39 = 0;
    if (self->_focusAdjusting) {
      int v36 = 0;
    }
    else {
      int v36 = self->_numFramesSinceFocusBecameStable + 1;
    }
  }
  if (self->_aeStableAfterStartStreaming)
  {
    if (self->_focusStableAfterStartStreaming)
    {
      self->_focusAdjusting = v31;
      self->_int lastFocusingMethod = lastFocusingMethod;
      self->_numFramesSinceFocusBecameStable = v36;
      if (v39 == 1) {
        goto LABEL_57;
      }
      goto LABEL_55;
    }
    BOOL v42 = 1;
    if (!v31) {
      goto LABEL_40;
    }
LABEL_52:
    BOOL v46 = (unint64_t)[a4 frameCount] > 0x1F;
    goto LABEL_53;
  }
  int v40 = objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BC8]), "BOOLValue");
  if ([v85 aeStable] && v40)
  {
    int numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
    if (numFramesSinceAEBecameStable <= 4)
    {
      BOOL v42 = (unint64_t)[a4 frameCount] > 0x13;
      int numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
    }
    else
    {
      BOOL v42 = 1;
    }
    int v45 = numFramesSinceAEBecameStable + 1;
  }
  else
  {
    unint64_t v44 = [a4 frameCount];
    int v45 = 0;
    BOOL v42 = v44 > 0x13;
  }
  self->_int numFramesSinceAEBecameStable = v45;
  if (v31) {
    goto LABEL_52;
  }
LABEL_40:
  if (lastFocusingMethod == 2)
  {
    BOOL v43 = v36 <= 3;
  }
  else if (lastFocusingMethod)
  {
    BOOL v43 = v36 <= 1;
  }
  else
  {
    BOOL v43 = v36 <= 43;
  }
  BOOL v46 = !v43;
LABEL_53:
  LOBYTE(v15) = 0;
  self->_focusAdjusting = v31;
  self->_int lastFocusingMethod = lastFocusingMethod;
  self->_numFramesSinceFocusBecameStable = v36;
  self->_aeStableAfterStartStreaming = v42;
  self->_focusStableAfterStartStreaming = v46;
  if (!v42 || !v46 || v39 == 1) {
    return (char)v15;
  }
LABEL_55:
  if (lastFocusingMethod == 1 && v36 < 3) {
    goto LABEL_57;
  }
  if (self->_oneShotFocusScanInProgress)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_57:
    LOBYTE(v15) = 0;
    return (char)v15;
  }
  if (!v22)
  {
    if (self->_subjectTooCloseMonitoringEnabled)
    {
      int v47 = [v85 focusPosition];
      int subjectTooCloseLastWideFocusPosition = self->_subjectTooCloseLastWideFocusPosition;
      self->_int subjectTooCloseLastWideFocusPosition = [v85 focusPosition];
      if (v47 != subjectTooCloseLastWideFocusPosition)
      {
        BOOL subjectIsTooClose = self->_subjectIsTooClose;
        [v85 focusDistance];
        float subjectTooCloseWideFocusDistanceThreshold = self->_subjectTooCloseWideFocusDistanceThreshold;
        if (subjectIsTooClose)
        {
          if (v50 >= (float)(subjectTooCloseWideFocusDistanceThreshold
                            + self->_subjectTooCloseWideFocusDistanceHysteresisLag))
          {
            self->_BOOL subjectIsTooClose = 0;
            if (self->_lastSDOFEffectStatus == 4 && self->_sceneIsTooDark) {
              self->_sceneIsTooDark = 0;
            }
          }
        }
        else if (v50 <= subjectTooCloseWideFocusDistanceThreshold)
        {
          self->_BOOL subjectIsTooClose = 1;
        }
      }
    }
    if (self->_subjectTooFarMonitoringEnabled)
    {
      int v52 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D98]), "intValue");
      int subjectTooFarLastTeleFocusPosition = self->_subjectTooFarLastTeleFocusPosition;
      self->_int subjectTooFarLastTeleFocusPosition = v52;
      if (v52 != subjectTooFarLastTeleFocusPosition)
      {
        if (self->_subjectTooFarUseTeleForFocusDistance) {
          v54 = v18;
        }
        else {
          v54 = v85;
        }
        [v54 focusDistance];
        float subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
        if (self->_subjectTooFarDistanceThresholdReached)
        {
          float subjectTooFarFocusDistanceHysteresisLag = self->_subjectTooFarFocusDistanceHysteresisLag;
          float v58 = subjectTooFarFocusDistanceThreshold - subjectTooFarFocusDistanceHysteresisLag;
          float v59 = self->_stageTooFarFocusDistanceThreshold - subjectTooFarFocusDistanceHysteresisLag;
          if (v55 <= v58) {
            self->_subjectTooFarDistanceThresholdReached = 0;
          }
          if (v55 > v59) {
            goto LABEL_87;
          }
          p_stageSubjectTooFarDistanceThresholdReached = &self->_stageSubjectTooFarDistanceThresholdReached;
        }
        else
        {
          float stageTooFarFocusDistanceThreshold = self->_stageTooFarFocusDistanceThreshold;
          if (v55 >= subjectTooFarFocusDistanceThreshold)
          {
            self->_subjectTooFarDistanceThresholdReached = 1;
            if (self->_subjectTooFarBackgroundShiftSumIsTooLow) {
              self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
            }
          }
          if (v55 < stageTooFarFocusDistanceThreshold) {
            goto LABEL_87;
          }
          self->_stageSubjectTooFarDistanceThresholdReached = 1;
          if (self->_subjectTooFarBackgroundShiftSumIsTooLow) {
            self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
          }
          p_stageSubjectTooFarDistanceThresholdReached = &self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow;
          if (!self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow) {
            goto LABEL_87;
          }
        }
        BOOL *p_stageSubjectTooFarDistanceThresholdReached = 0;
      }
LABEL_87:
      float subjectTooFarBackgroundShiftSumTooLowThreshold = self->_subjectTooFarBackgroundShiftSumTooLowThreshold;
      if (self->_subjectTooFarBackgroundShiftSumIsTooLow)
      {
        if (backgroundShiftSumFiltered > (float)(subjectTooFarBackgroundShiftSumTooLowThreshold
                                                + self->_subjectTooFarBackgroundShiftSumTooLowHysteresisLag))
        {
          [v18 focusDistance];
          if (v63 < self->_subjectTooFarFocusDistanceInfinityThreshold
            || (int subjectTooFarBackgroundShiftTooLowNumFrames = self->_subjectTooFarBackgroundShiftTooLowNumFrames,
                subjectTooFarBackgroundShiftTooLowNumFrames > 5))
          {
            self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
            self->_int subjectTooFarBackgroundShiftTooLowNumFrames = 0;
          }
          else
          {
            self->_int subjectTooFarBackgroundShiftTooLowNumFrames = subjectTooFarBackgroundShiftTooLowNumFrames + 1;
          }
        }
      }
      else if (backgroundShiftSumFiltered < subjectTooFarBackgroundShiftSumTooLowThreshold)
      {
        self->_subjectTooFarBackgroundShiftSumIsTooLow = 1;
      }
    }
  }
  if (portraitSceneMonitoringRequiresStageThresholds)
  {
    float stageTooFarBackgroundShiftSumNoFacesThreshold = self->_stageTooFarBackgroundShiftSumNoFacesThreshold;
    if (self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
    {
      if (backgroundShiftSumFiltered > (float)(stageTooFarBackgroundShiftSumNoFacesThreshold
                                              + self->_subjectTooFarBackgroundShiftSumTooLowHysteresisLag))
      {
        [v18 focusDistance];
        if (v66 < self->_subjectTooFarFocusDistanceInfinityThreshold
          || (int stageTooFarBackgroundShiftTooLowNumFrames = self->_stageTooFarBackgroundShiftTooLowNumFrames,
              stageTooFarBackgroundShiftTooLowNumFrames > 5))
        {
          self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 0;
          self->_int stageTooFarBackgroundShiftTooLowNumFrames = 0;
        }
        else
        {
          self->_int stageTooFarBackgroundShiftTooLowNumFrames = stageTooFarBackgroundShiftTooLowNumFrames + 1;
        }
      }
    }
    else if (backgroundShiftSumFiltered < stageTooFarBackgroundShiftSumNoFacesThreshold)
    {
      self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 1;
    }
  }
  if (!self->_sceneTooDarkMonitoringEnabled) {
    goto LABEL_125;
  }
  [v18 integrationTime];
  float v69 = v68;
  if (v69 <= 0.0) {
    int v70 = 1;
  }
  else {
    int v70 = llroundf(1.0 / v69);
  }
  [v18 gain];
  float sceneTooDarkGainThreshold = self->_sceneTooDarkGainThreshold;
  if (self->_sceneTooDarkExposureThresholdReached) {
    float sceneTooDarkGainThreshold = sceneTooDarkGainThreshold / self->_sceneTooDarkGainHysteresisLag;
  }
  BOOL v74 = v71 >= sceneTooDarkGainThreshold && v70 < 61;
  self->_sceneTooDarkExposureThresholdReached = v74;
  p_sceneIsTooDark = &self->_sceneIsTooDark;
  if (!v74) {
    goto LABEL_124;
  }
  float sceneTooDarkInvalidShiftRatioThreshold = self->_sceneTooDarkInvalidShiftRatioThreshold;
  if (self->_sceneIsTooDark)
  {
    if (invalidShiftRatioFiltered < (float)(sceneTooDarkInvalidShiftRatioThreshold
                                           - self->_sceneTooDarkInvalidShiftRatioHysteresisLag))
      goto LABEL_124;
  }
  else
  {
    if (invalidShiftRatioFiltered <= sceneTooDarkInvalidShiftRatioThreshold) {
      goto LABEL_125;
    }
    BOOL *p_sceneIsTooDark = 1;
  }
  if (v83)
  {
    self->_sceneIsTooDark = 0;
    self->_BOOL subjectIsTooClose = 0;
    self->_subjectTooFarDistanceThresholdReached = 0;
    p_sceneIsTooDark = &self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow;
    self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
LABEL_124:
    BOOL *p_sceneIsTooDark = 0;
  }
LABEL_125:
  if (self->_stageFaceMonitoringEnabled)
  {
    if ([(NSArray *)self->_stageMostRecentFaces count])
    {
      self->_int stageFaceNumberOfFramesSinceLastFace = 0;
      BOOL v77 = 1;
    }
    else
    {
      int stageFaceNumberOfFramesSinceLastFace = self->_stageFaceNumberOfFramesSinceLastFace;
      self->_int stageFaceNumberOfFramesSinceLastFace = stageFaceNumberOfFramesSinceLastFace + 1;
      BOOL v77 = self->_stageFaceHasBeenSeen
         && stageFaceNumberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
    }
    self->_stageFaceDetected = v77;
  }
  if (self->_subjectIsTooClose)
  {
    char v79 = 0;
    int v80 = 4;
  }
  else if (self->_sceneIsTooDark)
  {
    char v79 = 0;
    int v80 = 5;
  }
  else if (self->_subjectTooFarDistanceThresholdReached && self->_subjectTooFarBackgroundShiftSumIsTooLow {
         || portraitSceneMonitoringRequiresStageThresholds
  }
         && !self->_stageFaceDetected
         && self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
  {
    char v79 = 0;
    int v80 = 3;
  }
  else
  {
    char v79 = 1;
    int v80 = 1;
  }
  if (self->_stageFaceMonitoringEnabled)
  {
    if (!self->_stageFaceDetected) {
      char v79 = 0;
    }
    if (v79)
    {
      int v81 = 2;
    }
    else
    {
      self->_stageFaceHasBeenSeen = 0;
      int v81 = 1;
    }
  }
  else
  {
    int v81 = 0;
  }
  self->_lastSDOFEffectStatus = v80;
  if (a10) {
    *a10 = v80;
  }
  if (a11) {
    *a11 = v81;
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
  self->_BOOL portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end