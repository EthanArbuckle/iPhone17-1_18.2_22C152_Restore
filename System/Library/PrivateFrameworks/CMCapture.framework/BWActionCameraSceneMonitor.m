@interface BWActionCameraSceneMonitor
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BWActionCameraSceneMonitor)initWithTuningParametersByPortType:(id)a3 videoStabilizationStrength:(int)a4 bravoTelephotoEnabled:(BOOL)a5 attachDebugFrameStatistics:(BOOL)a6;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (void)dealloc;
- (void)focusScanDidComplete;
- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
@end

@implementation BWActionCameraSceneMonitor

+ (void)initialize
{
}

- (BWActionCameraSceneMonitor)initWithTuningParametersByPortType:(id)a3 videoStabilizationStrength:(int)a4 bravoTelephotoEnabled:(BOOL)a5 attachDebugFrameStatistics:(BOOL)a6
{
  if (a4 <= 2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  BOOL v7 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BWActionCameraSceneMonitor;
  v10 = [(BWActionCameraSceneMonitor *)&v32 init];
  v11 = v10;
  if (v10)
  {
    v10->_sceneTooDarkMonitoringEnabled = 1;
    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a4 == 4)
    {
      uint64_t v24 = *MEMORY[0x1E4F52DE8];
      unsigned int v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DE8]), "objectForKeyedSubscript:", @"UltraStrength"), "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "intValue");
      if (v25) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 185;
      }
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v26], v24);
      uint64_t v27 = *MEMORY[0x1E4F52DD8];
      unsigned int v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "objectForKeyedSubscript:", @"UltraStrength"), "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "intValue");
      if (v28) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 24;
      }
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v29], v27);
      uint64_t v19 = *MEMORY[0x1E4F52DF0];
      unsigned int v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF0]), "objectForKeyedSubscript:", @"UltraStrength"), "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "intValue");
      v21 = NSNumber;
      BOOL v22 = v20 == 0;
      unsigned int v23 = 650;
    }
    else
    {
      if (a4 != 3) {
        goto LABEL_23;
      }
      uint64_t v13 = *MEMORY[0x1E4F52DE8];
      unsigned int v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DE8]), "objectForKeyedSubscript:", @"HighStrength"), "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "intValue");
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 100;
      }
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v15], v13);
      uint64_t v16 = *MEMORY[0x1E4F52DD8];
      unsigned int v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "objectForKeyedSubscript:", @"HighStrength"), "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "intValue");
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 10;
      }
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v18], v16);
      uint64_t v19 = *MEMORY[0x1E4F52DF0];
      unsigned int v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF0]), "objectForKeyedSubscript:", @"HighStrength"), "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "intValue");
      v21 = NSNumber;
      BOOL v22 = v20 == 0;
      unsigned int v23 = 300;
    }
    if (v22) {
      uint64_t v30 = v23;
    }
    else {
      uint64_t v30 = v20;
    }
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", [v21 numberWithInt:v30], v19);
LABEL_23:
    if (v7) {
      [(NSDictionary *)v12 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F52DF0]];
    }
    v11->_luxThresholdsByPortType = v12;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWActionCameraSceneMonitor;
  [(BWActionCameraSceneMonitor *)&v3 dealloc];
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
  uint64_t v13 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
  unsigned int v14 = (void *)[a4 objectForKeyedSubscript:v13];
  unsigned int v15 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_luxThresholdsByPortType, "objectForKeyedSubscript:", v13), "intValue");
  BOOL oneShotFocusScanInProgress = self->_oneShotFocusScanInProgress;
  if (self->_oneShotFocusScanInProgress) {
    return !oneShotFocusScanInProgress;
  }
  if (self->_sceneTooDarkMonitoringEnabled)
  {
    signed int v17 = v15;
    if (!self->_sceneIsTooDark)
    {
      if ([v14 luxLevel] <= v15)
      {
        BOOL v18 = 1;
        goto LABEL_10;
      }
      if (!self->_sceneIsTooDark) {
        goto LABEL_11;
      }
    }
    if ([v14 luxLevel] > v17 / 5 + v17)
    {
      BOOL v18 = 0;
LABEL_10:
      self->_sceneIsTooDark = v18;
    }
  }
LABEL_11:
  if (a10)
  {
    if (self->_sceneIsTooDark) {
      int v19 = 5;
    }
    else {
      int v19 = 0;
    }
    *a10 = v19;
  }
  if (a11) {
    *a11 = 0;
  }
  return !oneShotFocusScanInProgress;
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