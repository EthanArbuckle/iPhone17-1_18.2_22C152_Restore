@interface BWBravoCinematicVideoSceneMonitor
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BWBravoCinematicVideoSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (void)dealloc;
- (void)focusScanDidComplete;
- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
@end

@implementation BWBravoCinematicVideoSceneMonitor

+ (void)initialize
{
}

- (BWBravoCinematicVideoSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWBravoCinematicVideoSceneMonitor;
  v5 = [(BWBravoCinematicVideoSceneMonitor *)&v9 init];
  if (v5)
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "floatValue");
    int v7 = (int)v6;
    if (!(int)v6) {
      int v7 = 50;
    }
    v5->_sceneTooDarkLuxThreshold = v7;
    v5->_sceneIsTooDark = 0;
    v5->_sceneTooDarkMonitoringEnabled = 1;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWBravoCinematicVideoSceneMonitor;
  [(BWBravoCinematicVideoSceneMonitor *)&v2 dealloc];
}

- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5
{
  if (a3 || a4 || a5) {
    self->_oneShotFocusScanInProgress = !a3 && !a4;
  }
}

- (void)focusScanDidComplete
{
  if (self->_oneShotFocusScanInProgress) {
    self->_oneShotFocusScanInProgress = 0;
  }
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  v12 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  if (self->_sceneTooDarkMonitoringEnabled)
  {
    v13 = v12;
    if (self->_sceneIsTooDark) {
      goto LABEL_3;
    }
    if ([v12 luxLevel] <= self->_sceneTooDarkLuxThreshold)
    {
      BOOL v14 = 1;
LABEL_9:
      self->_sceneIsTooDark = v14;
      goto LABEL_10;
    }
    if (self->_sceneIsTooDark)
    {
LABEL_3:
      if ([v13 luxLevel] <= self->_sceneTooDarkLuxThreshold + 1) {
        goto LABEL_10;
      }
      BOOL v14 = 0;
      goto LABEL_9;
    }
  }
LABEL_10:
  if (a10)
  {
    if (self->_sceneIsTooDark) {
      int v15 = 5;
    }
    else {
      int v15 = 1;
    }
    *a10 = v15;
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
  self->_portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end