@interface BWStereoVideoCaptureSceneMonitor
+ (void)initialize;
- (BOOL)resolveStereoVideoCaptureStatusWithFrameStatistics:(id)a3 sceneFlags:(unint64_t)a4 stereoVideoCaptureStatusOut:(int *)a5;
- (BWStereoVideoCaptureSceneMonitor)initWithTuningParametersByPortType:(id)a3 attachDebugFrameStatistics:(BOOL)a4;
- (void)dealloc;
- (void)focusScanDidComplete;
- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5;
@end

@implementation BWStereoVideoCaptureSceneMonitor

+ (void)initialize
{
}

- (BWStereoVideoCaptureSceneMonitor)initWithTuningParametersByPortType:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)BWStereoVideoCaptureSceneMonitor;
  v5 = [(BWStereoVideoCaptureSceneMonitor *)&v14 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)(v5 + 9) = 257;
    uint64_t v7 = *MEMORY[0x1E4F52DD8];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "objectForKeyedSubscript:", @"TooDarkNormalizedSNRThreshold"), "floatValue");
    if (v8 == 0.0) {
      float v8 = 1.1755e-38;
    }
    *((float *)v6 + 6) = v8;
    int v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", @"TooDarkLuxLevelThreshold"), "intValue");
    if (v9) {
      int v10 = v9;
    }
    else {
      int v10 = 75;
    }
    *((_DWORD *)v6 + 7) = v10;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", @"TooCloseFocusDistanceThreshold"), "doubleValue");
    if (v11 == 0.0) {
      double v11 = 40.0;
    }
    *((double *)v6 + 4) = v11;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", @"MinimumValidFocusDistance"), "doubleValue");
    if (v12 == 0.0) {
      double v12 = 20.0;
    }
    *((double *)v6 + 2) = v12;
    *(int64x2_t *)(v6 + 40) = vdupq_n_s64(0x7FF0000000000000uLL);
  }
  return (BWStereoVideoCaptureSceneMonitor *)v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWStereoVideoCaptureSceneMonitor;
  [(BWStereoVideoCaptureSceneMonitor *)&v2 dealloc];
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

- (BOOL)resolveStereoVideoCaptureStatusWithFrameStatistics:(id)a3 sceneFlags:(unint64_t)a4 stereoVideoCaptureStatusOut:(int *)a5
{
  BOOL oneShotFocusScanInProgress = self->_oneShotFocusScanInProgress;
  if (self->_oneShotFocusScanInProgress) {
    return !oneShotFocusScanInProgress;
  }
  int v7 = a4;
  int v10 = (void *)[a3 portType];
  if (![v10 isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    objc_super v14 = (void *)[a3 portType];
    if ([v14 isEqualToString:*MEMORY[0x1E4F52DE8]])
    {
      if (self->_subjectTooCloseMonitoringEnabled)
      {
        [a3 focusDistance];
        self->_double lastSuperWideFocusDistance = v15;
        if (v15 <= 0.0) {
          self->_double lastSuperWideFocusDistance = INFINITY;
        }
      }
    }
    goto LABEL_29;
  }
  if (self->_sceneTooDarkMonitoringEnabled)
  {
    [a3 normalizedSNR];
    float v12 = v11;
    int v13 = [a3 luxLevel];
  }
  else
  {
    int v13 = -1;
    float v12 = 1.1755e-38;
  }
  if (self->_subjectTooCloseMonitoringEnabled)
  {
    [a3 focusDistance];
    self->_lastWideFocusDistance = v16;
    if (v16 <= 0.0) {
      self->_lastWideFocusDistance = INFINITY;
    }
  }
  float normalizedSNRThreshold = self->_normalizedSNRThreshold;
  if (normalizedSNRThreshold > 1.1755e-38 && v12 > 1.1755e-38)
  {
    if (self->_sceneIsTooDark || v12 > normalizedSNRThreshold)
    {
      if (self->_sceneIsTooDark && v12 > (float)(normalizedSNRThreshold + (float)(normalizedSNRThreshold / 5.0))) {
        goto LABEL_26;
      }
      goto LABEL_29;
    }
LABEL_28:
    self->_sceneIsTooDark = 1;
    goto LABEL_29;
  }
  if (v13 == -1) {
    goto LABEL_29;
  }
  int luxLevelThreshold = self->_luxLevelThreshold;
  if (!self->_sceneIsTooDark)
  {
    if (v13 > luxLevelThreshold) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v13 > luxLevelThreshold / 5 + luxLevelThreshold) {
LABEL_26:
  }
    self->_sceneIsTooDark = 0;
LABEL_29:
  double lastSuperWideFocusDistance = self->_lastSuperWideFocusDistance;
  double focusDistanceThreshold = self->_focusDistanceThreshold;
  if (self->_lastWideFocusDistance < lastSuperWideFocusDistance) {
    double lastSuperWideFocusDistance = self->_lastWideFocusDistance;
  }
  BOOL subjectIsTooClose = self->_subjectIsTooClose;
  if (self->_subjectIsTooClose)
  {
    BOOL v23 = 0;
    if (lastSuperWideFocusDistance <= focusDistanceThreshold * 1.2) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  BOOL v23 = 1;
  if (lastSuperWideFocusDistance <= focusDistanceThreshold)
  {
LABEL_33:
    self->_BOOL subjectIsTooClose = v23;
    BOOL v23 = subjectIsTooClose;
  }
LABEL_34:
  if (a5)
  {
    int v24 = 2 * self->_sceneIsTooDark;
    if ((v7 & 0x4000000) != 0) {
      int v25 = 2;
    }
    else {
      int v25 = 2 * self->_sceneIsTooDark;
    }
    if ((v7 & 0x8000000) != 0) {
      int v25 = 3;
    }
    if (self->_sceneTooDarkMonitoringEnabled) {
      int v24 = v25;
    }
    if (v23) {
      int v26 = v24;
    }
    else {
      int v26 = v24 | 4;
    }
    *a5 = v26;
  }
  return !oneShotFocusScanInProgress;
}

@end