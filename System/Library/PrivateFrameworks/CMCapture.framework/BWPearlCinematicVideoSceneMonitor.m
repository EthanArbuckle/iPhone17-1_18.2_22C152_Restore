@interface BWPearlCinematicVideoSceneMonitor
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BWPearlCinematicVideoSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (void)dealloc;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11;
@end

@implementation BWPearlCinematicVideoSceneMonitor

+ (void)initialize
{
}

- (BWPearlCinematicVideoSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWPearlCinematicVideoSceneMonitor;
  v5 = [(BWPearlCinematicVideoSceneMonitor *)&v9 init];
  if (v5)
  {
    v5->_numberOfFramesToWaitForAEAndLTMToStabilize = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NumberOfFramesToWaitForAEAndLTMToStabilize"), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "floatValue");
    int v7 = (int)v6;
    if (!(int)v6) {
      int v7 = 50;
    }
    v5->_sceneTooDarkLuxThreshold = v7;
    v5->_sceneTooDarkMonitoringEnabled = 1;
    v5->_sceneIsTooDark = 0;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWPearlCinematicVideoSceneMonitor;
  [(BWPearlCinematicVideoSceneMonitor *)&v2 dealloc];
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v13) {
    return (char)v13;
  }
  if (!self->_occluded)
  {
    v15 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
    v16 = v15;
    if (self->_aeStableAfterStartStreaming) {
      goto LABEL_13;
    }
    int v17 = [v15 aeStable];
    if (v17
      && (int sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable,
          sdofNumFramesSinceAEBecameStable >= self->_numberOfFramesToWaitForAEAndLTMToStabilize))
    {
      BOOL v19 = 1;
      self->_aeStableAfterStartStreaming = 1;
    }
    else
    {
      BOOL v19 = (unint64_t)[a4 frameCount] > 0x13;
      self->_aeStableAfterStartStreaming = v19;
      if (!v17)
      {
        int v20 = 0;
        goto LABEL_12;
      }
      int sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable;
    }
    int v20 = sdofNumFramesSinceAEBecameStable + 1;
LABEL_12:
    self->_int sdofNumFramesSinceAEBecameStable = v20;
    if (!v19)
    {
      LOBYTE(v13) = 0;
      return (char)v13;
    }
LABEL_13:
    if (!self->_sceneTooDarkMonitoringEnabled) {
      goto LABEL_22;
    }
    if (!self->_sceneIsTooDark)
    {
      if ([v16 luxLevel] <= self->_sceneTooDarkLuxThreshold)
      {
        BOOL v21 = 1;
LABEL_21:
        self->_sceneIsTooDark = v21;
        goto LABEL_22;
      }
      if (!self->_sceneIsTooDark)
      {
LABEL_22:
        if (self->_sceneIsTooDark) {
          int v14 = 5;
        }
        else {
          int v14 = 1;
        }
        goto LABEL_25;
      }
    }
    if ([v16 luxLevel] <= self->_sceneTooDarkLuxThreshold + 1) {
      goto LABEL_22;
    }
    BOOL v21 = 0;
    goto LABEL_21;
  }
  int v14 = 4;
LABEL_25:
  if (a10) {
    *a10 = v14;
  }
  LOBYTE(v13) = 1;
  return (char)v13;
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  if (self->_occluded != a9) {
    self->_occluded = a9;
  }
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return 0.0;
}

- (BOOL)portraitSceneMonitoringRequiresStageThresholds
{
  return self->portraitSceneMonitoringRequiresStageThresholds;
}

- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3
{
  self->portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end