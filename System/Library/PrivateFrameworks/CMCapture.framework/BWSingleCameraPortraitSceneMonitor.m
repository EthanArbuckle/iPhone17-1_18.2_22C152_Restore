@interface BWSingleCameraPortraitSceneMonitor
+ (void)initialize;
- (BOOL)portraitSceneMonitoringRequiresStageThresholds;
- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11;
- (BWSingleCameraPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4;
- (double)_focusDistanceFromAPSMetadata:(uint64_t)a1;
- (float)focusDistanceToMaxAllowedFocusDistanceRatio;
- (uint64_t)_focusDistanceFromFacesAttachedToSampleBuffer:(uint64_t)result;
- (void)dealloc;
- (void)focusScanDidComplete;
- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5;
- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3;
- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11;
@end

@implementation BWSingleCameraPortraitSceneMonitor

+ (void)initialize
{
}

- (BWSingleCameraPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BWSingleCameraPortraitSceneMonitor;
  v5 = [(BWSingleCameraPortraitSceneMonitor *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_useAPSFocusDistance = 0;
    v5->_subjectTooCloseMonitoringEnabled = 1;
    float v7 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooCloseFocusDistanceThreshold"), "intValue");
    if (v6->_useAPSFocusDistance) {
      float v8 = 10.0;
    }
    else {
      float v8 = 5.0;
    }
    v6->_subjectTooCloseFocusDistanceThreshold = v7;
    v6->_subjectTooCloseFocusDistanceHysteresisLag = v8;
    v6->_subjectTooFarMonitoringEnabled = 1;
    float v9 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TooFarFocusDistanceThreshold"), "intValue");
    if (v6->_useAPSFocusDistance) {
      float v10 = 10.0;
    }
    else {
      float v10 = 5.0;
    }
    v6->_subjectTooFarFocusDistanceThreshold = v9;
    v6->_subjectTooFarFocusDistanceHysteresisLag = v10;
    v6->_sceneTooDarkMonitoringEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"EnableLowLightGating"), "BOOLValue");
    v6->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v6->_enabled = 1;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSingleCameraPortraitSceneMonitor;
  [(BWSingleCameraPortraitSceneMonitor *)&v3 dealloc];
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
  self->_numFacesDetectedFiltered = BWModifiedMovingAverage((float)(unint64_t)[a10 count], self->_numFacesDetectedFiltered, 0.33);
  int v16 = [a10 count];
  self->_stageMostRecentFacesCount = v16;
  self->_stageFaceHasBeenSeen |= v16 > 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  if (self->_enabled)
  {
    unsigned int v49 = a5;
    float v15 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (!v15) {
      return (char)v15;
    }
    int v16 = v15;
    v17 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
    BOOL v48 = a6;
    if (self->_focusLocked)
    {
      int numFramesSinceFocusLocked = self->_numFramesSinceFocusLocked;
      self->_int numFramesSinceFocusLocked = numFramesSinceFocusLocked + 1;
      BOOL v19 = numFramesSinceFocusLocked > 9;
    }
    else
    {
      BOOL v19 = 0;
    }
    CMSetAttachment(a3, @"SDOFFocusLocked", (CFTypeRef)[NSNumber numberWithBool:v19], 1u);
    int v22 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F54058]), "intValue");
    if (self->_useAPSFocusDistance) {
      double v23 = -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromAPSMetadata:]((uint64_t)self, v16);
    }
    else {
      -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:]((uint64_t)self, a3);
    }
    float v24 = *(float *)&v23;
    self->_lastFocusDistance = *(float *)&v23;
    int v25 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BF8]), "intValue");
    int v26 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE0]), "intValue");
    BOOL v27 = v25 != 4;
    if (v25 == 4)
    {
      int lastFocusingMethod = self->_lastFocusingMethod;
      int v30 = 0;
      if (self->_focusAdjusting) {
        int v28 = 0;
      }
      else {
        int v28 = self->_numFramesSinceFocusBecameStable + 1;
      }
    }
    else
    {
      int v28 = 0;
      if (v26 == 1) {
        int lastFocusingMethod = 1;
      }
      else {
        int lastFocusingMethod = 2;
      }
      int v30 = lastFocusingMethod;
    }
    if (self->_aeStableAfterStartStreaming)
    {
      if (self->_focusStableAfterStartStreaming)
      {
        self->_focusAdjusting = v27;
        self->_int lastFocusingMethod = lastFocusingMethod;
        self->_numFramesSinceFocusBecameStable = v28;
        if (v30 == 1)
        {
LABEL_49:
          LOBYTE(v15) = 0;
          return (char)v15;
        }
        goto LABEL_47;
      }
      BOOL v32 = 1;
    }
    else
    {
      if ([v17 aeStable])
      {
        int numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
        if (numFramesSinceAEBecameStable <= 4)
        {
          BOOL v32 = (unint64_t)[a4 frameCount] > 0x13;
          int numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
        }
        else
        {
          BOOL v32 = 1;
        }
        int v34 = numFramesSinceAEBecameStable + 1;
      }
      else
      {
        unint64_t v33 = [a4 frameCount];
        int v34 = 0;
        BOOL v32 = v33 > 0x13;
      }
      self->_int numFramesSinceAEBecameStable = v34;
    }
    if (v25 == 4)
    {
      if (lastFocusingMethod == 2)
      {
        BOOL v36 = v28 <= 3;
      }
      else if (lastFocusingMethod)
      {
        BOOL v36 = v28 <= 1;
      }
      else
      {
        BOOL v36 = v28 <= 43;
      }
      BOOL v35 = !v36;
    }
    else
    {
      BOOL v35 = (unint64_t)[a4 frameCount] > 0x1F;
    }
    LOBYTE(v15) = 0;
    self->_focusAdjusting = v27;
    self->_int lastFocusingMethod = lastFocusingMethod;
    self->_numFramesSinceFocusBecameStable = v28;
    self->_aeStableAfterStartStreaming = v32;
    self->_focusStableAfterStartStreaming = v35;
    if (!v32 || !v35 || v30 == 1) {
      return (char)v15;
    }
LABEL_47:
    if (lastFocusingMethod == 1 && v28 < 3 || self->_oneShotFocusScanInProgress) {
      goto LABEL_49;
    }
    BOOL useAPSFocusDistance = self->_useAPSFocusDistance;
    if (!self->_useAPSFocusDistance || !v19)
    {
      if (self->_subjectTooCloseMonitoringEnabled)
      {
        int subjectTooCloseLastFocusPosition = self->_subjectTooCloseLastFocusPosition;
        self->_int subjectTooCloseLastFocusPosition = v22;
        if (!useAPSFocusDistance || v22 != subjectTooCloseLastFocusPosition)
        {
          float subjectTooCloseFocusDistanceThreshold = self->_subjectTooCloseFocusDistanceThreshold;
          if (self->_subjectIsTooClose)
          {
            if (v24 >= (float)(subjectTooCloseFocusDistanceThreshold + self->_subjectTooCloseFocusDistanceHysteresisLag))
            {
              self->_subjectIsTooClose = 0;
              if (self->_lastSDOFEffectStatus == 4 && self->_sceneIsTooDark) {
                self->_sceneIsTooDark = 0;
              }
            }
          }
          else if (v24 <= subjectTooCloseFocusDistanceThreshold)
          {
            self->_subjectIsTooClose = 1;
          }
        }
      }
      if (self->_subjectTooFarMonitoringEnabled)
      {
        int subjectTooFarLastFocusPosition = self->_subjectTooFarLastFocusPosition;
        self->_int subjectTooFarLastFocusPosition = v22;
        if (!useAPSFocusDistance || v22 != subjectTooFarLastFocusPosition)
        {
          float subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
          if (self->_subjectTooFarDistanceThresholdReached)
          {
            if (v24 > (float)(subjectTooFarFocusDistanceThreshold - self->_subjectTooFarFocusDistanceHysteresisLag)) {
              goto LABEL_75;
            }
            BOOL v43 = 0;
          }
          else
          {
            if (v24 < subjectTooFarFocusDistanceThreshold) {
              goto LABEL_75;
            }
            BOOL v43 = 1;
          }
          self->_subjectTooFarDistanceThresholdReached = v43;
        }
      }
    }
LABEL_75:
    if (self->_sceneTooDarkMonitoringEnabled) {
      self->_sceneIsTooDark = !v48 & (v49 >> 5);
    }
    if (self->_numFacesDetectedFiltered < 0.5) {
      goto LABEL_78;
    }
    if (self->_subjectIsTooClose)
    {
      BOOL v44 = 0;
      int v21 = 4;
    }
    else
    {
      if (self->_subjectTooFarDistanceThresholdReached)
      {
LABEL_78:
        BOOL v44 = 0;
        int v21 = 3;
        goto LABEL_81;
      }
      BOOL v44 = !self->_sceneIsTooDark;
      if (self->_sceneIsTooDark) {
        int v21 = 5;
      }
      else {
        int v21 = 1;
      }
    }
LABEL_81:
    self->_lastSDOFEffectStatus = v21;
    if (self->_stageMostRecentFacesCount < 1)
    {
      int numberOfFramesSinceLastFace = self->_numberOfFramesSinceLastFace;
      self->_int numberOfFramesSinceLastFace = numberOfFramesSinceLastFace + 1;
      if (!self->_stageFaceHasBeenSeen)
      {
        self->_stageFaceDetected = 0;
        goto LABEL_92;
      }
      BOOL v45 = numberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
    }
    else
    {
      self->_int numberOfFramesSinceLastFace = 0;
      BOOL v45 = 1;
    }
    self->_stageFaceDetected = v45;
    if (v44 && v45)
    {
      int v21 = 1;
      int v20 = 2;
      goto LABEL_6;
    }
LABEL_92:
    self->_stageFaceHasBeenSeen = 0;
    int v20 = 1;
    goto LABEL_6;
  }
  int v20 = 0;
  int v21 = 1;
LABEL_6:
  if (a10) {
    *a10 = v21;
  }
  if (a11) {
    *a11 = v20;
  }
  LOBYTE(v15) = 1;
  return (char)v15;
}

- (double)_focusDistanceFromAPSMetadata:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EB0]), "floatValue");
  if (*(float *)&result == 0.0)
  {
    float v4 = *(float *)(a1 + 88);
    float v5 = v4;
  }
  else
  {
    float v5 = 150.0;
    if (*(float *)&result <= 150.0 && *(float *)&result >= 0.0) {
      float v5 = *(float *)&result;
    }
    float v4 = *(float *)(a1 + 88);
  }
  if (v4 == 0.0) {
    *(float *)&double result = v5;
  }
  else {
    *(float *)&double result = (float)(v5 + v4) * 0.5;
  }
  return result;
}

- (uint64_t)_focusDistanceFromFacesAttachedToSampleBuffer:(uint64_t)result
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v63 = result;
  if (!result) {
    return result;
  }
  objc_super v3 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC0]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v65 objects:v75 count:16];
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  float v9 = 0;
  if (v4)
  {
    uint64_t v10 = *(void *)v66;
    uint64_t v11 = *MEMORY[0x1E4F53E70];
    uint64_t v12 = *MEMORY[0x1E4F54180];
    float v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v3);
        }
        float v15 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v16 = [v15 objectForKeyedSubscript:v11];
        if (v16)
        {
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v15 objectForKeyedSubscript:v12], &rect);
          double v17 = rect.size.width <= rect.size.height ? rect.size.height : rect.size.width;
          float v18 = v17;
          if (v13 < v18)
          {
            double x = rect.origin.x;
            double y = rect.origin.y;
            double height = rect.size.height;
            double width = rect.size.width;
            float v13 = v18;
            float v9 = (void *)v16;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v4);
  }
  BOOL v19 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F531A0], 0);
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  int v20 = (void *)getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0;
  uint64_t v74 = getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0;
  if (!getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0)
  {
    *(void *)&rect.origin.double x = MEMORY[0x1E4F143A8];
    *(void *)&rect.origin.double y = 3221225472;
    *(void *)&rect.size.double width = __getkCVAFaceTracking_TrackedFacesArraySymbolLoc_block_invoke_0;
    *(void *)&rect.size.double height = &unk_1E5C24978;
    v70 = &v71;
    int v21 = (void *)AppleCVALibrary_1();
    int v22 = dlsym(v21, "kCVAFaceTracking_TrackedFacesArray");
    *(void *)(v70[1] + 24) = v22;
    getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0 = *(void *)(v70[1] + 24);
    int v20 = (void *)v72[3];
  }
  _Block_object_dispose(&v71, 8);
  if (!v20) {
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:]();
  }
  double v23 = (void *)[v19 objectForKeyedSubscript:*v20];
  CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v64.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v64.size = v24;
  int v25 = (void *)[v23 firstObject];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  int v26 = (void *)getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0;
  uint64_t v74 = getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0;
  if (!getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0)
  {
    *(void *)&rect.origin.double x = MEMORY[0x1E4F143A8];
    *(void *)&rect.origin.double y = 3221225472;
    *(void *)&rect.size.double width = __getkCVAFaceTracking_SmoothDataSymbolLoc_block_invoke_0;
    *(void *)&rect.size.double height = &unk_1E5C24978;
    v70 = &v71;
    BOOL v27 = (void *)AppleCVALibrary_1();
    int v28 = dlsym(v27, "kCVAFaceTracking_SmoothData");
    *(void *)(v70[1] + 24) = v28;
    getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0 = *(void *)(v70[1] + 24);
    int v26 = (void *)v72[3];
  }
  _Block_object_dispose(&v71, 8);
  if (!v26) {
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:]();
  }
  v29 = (void *)[v25 objectForKeyedSubscript:*v26];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  int v30 = (void *)getkCVAFaceTracking_PoseSymbolLoc_ptr;
  uint64_t v74 = getkCVAFaceTracking_PoseSymbolLoc_ptr;
  if (!getkCVAFaceTracking_PoseSymbolLoc_ptr)
  {
    *(void *)&rect.origin.double x = MEMORY[0x1E4F143A8];
    *(void *)&rect.origin.double y = 3221225472;
    *(void *)&rect.size.double width = __getkCVAFaceTracking_PoseSymbolLoc_block_invoke;
    *(void *)&rect.size.double height = &unk_1E5C24978;
    v70 = &v71;
    v31 = (void *)AppleCVALibrary_1();
    BOOL v32 = dlsym(v31, "kCVAFaceTracking_Pose");
    *(void *)(v70[1] + 24) = v32;
    getkCVAFaceTracking_PoseSymbolLoc_ptr = *(void *)(v70[1] + 24);
    int v30 = (void *)v72[3];
  }
  _Block_object_dispose(&v71, 8);
  if (!v30) {
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:]();
  }
  unint64_t v33 = (void *)[v29 objectForKeyedSubscript:*v30];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  int v34 = (void *)getkCVAFaceTracking_TranslationSymbolLoc_ptr_0;
  uint64_t v74 = getkCVAFaceTracking_TranslationSymbolLoc_ptr_0;
  if (!getkCVAFaceTracking_TranslationSymbolLoc_ptr_0)
  {
    *(void *)&rect.origin.double x = MEMORY[0x1E4F143A8];
    *(void *)&rect.origin.double y = 3221225472;
    *(void *)&rect.size.double width = __getkCVAFaceTracking_TranslationSymbolLoc_block_invoke_0;
    *(void *)&rect.size.double height = &unk_1E5C24978;
    v70 = &v71;
    BOOL v35 = (void *)AppleCVALibrary_1();
    BOOL v36 = dlsym(v35, "kCVAFaceTracking_Translation");
    *(void *)(v70[1] + 24) = v36;
    getkCVAFaceTracking_TranslationSymbolLoc_ptr_0 = *(void *)(v70[1] + 24);
    int v34 = (void *)v72[3];
  }
  _Block_object_dispose(&v71, 8);
  if (!v34) {
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.4();
  }
  v37 = (void *)[v33 objectForKeyedSubscript:*v34];
  v38 = v37;
  if (v37)
  {
    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 0), "floatValue");
    float v40 = v39;
    objc_msgSend((id)objc_msgSend(v38, "objectAtIndexedSubscript:", 1), "floatValue");
    float v42 = v41;
    objc_msgSend((id)objc_msgSend(v38, "objectAtIndexedSubscript:", 2), "floatValue");
    float v44 = v43;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    BOOL v45 = (void *)getkCVAFaceTracking_FaceIDSymbolLoc_ptr;
    uint64_t v74 = getkCVAFaceTracking_FaceIDSymbolLoc_ptr;
    if (!getkCVAFaceTracking_FaceIDSymbolLoc_ptr)
    {
      *(void *)&rect.origin.double x = MEMORY[0x1E4F143A8];
      *(void *)&rect.origin.double y = 3221225472;
      *(void *)&rect.size.double width = __getkCVAFaceTracking_FaceIDSymbolLoc_block_invoke;
      *(void *)&rect.size.double height = &unk_1E5C24978;
      v70 = &v71;
      v46 = (void *)AppleCVALibrary_1();
      v47 = dlsym(v46, "kCVAFaceTracking_FaceID");
      *(void *)(v70[1] + 24) = v47;
      getkCVAFaceTracking_FaceIDSymbolLoc_ptr = *(void *)(v70[1] + 24);
      BOOL v45 = (void *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v45) {
      -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.5();
    }
    v38 = (void *)[v25 objectForKeyedSubscript:*v45];
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    BOOL v48 = (void *)getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1;
    uint64_t v74 = getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1;
    if (!getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1)
    {
      *(void *)&rect.origin.double x = MEMORY[0x1E4F143A8];
      *(void *)&rect.origin.double y = 3221225472;
      *(void *)&rect.size.double width = __getkCVAFaceTracking_DetectedFaceRectSymbolLoc_block_invoke_1;
      *(void *)&rect.size.double height = &unk_1E5C24978;
      v70 = &v71;
      unsigned int v49 = (void *)AppleCVALibrary_1();
      v50 = dlsym(v49, "kCVAFaceTracking_DetectedFaceRect");
      *(void *)(v70[1] + 24) = v50;
      getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1 = *(void *)(v70[1] + 24);
      BOOL v48 = (void *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v48) {
      -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.6();
    }
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v25 objectForKeyedSubscript:*v48], &v64);
    float v51 = sqrtf((float)((float)(v42 * v42) + (float)(v40 * v40)) + (float)(v44 * v44)) / 10.0;
    if (!v9) {
      goto LABEL_44;
    }
LABEL_37:
    v52 = *(void **)(v63 + 96);
    if (v52)
    {
      char v53 = objc_msgSend((id)objc_msgSend(v52, "detectionID"), "isEqual:", v9);
      v54 = *(void **)(v63 + 96);
      if (v53)
      {
        if (v54)
        {
LABEL_43:
          objc_msgSend(v54, "setDetectionRect:", x, y, width, height);
          goto LABEL_44;
        }
      }
      else
      {

        *(void *)(v63 + 96) = 0;
      }
    }
    v54 = -[BWTrackedFace initWithDetectionID:]([BWTrackedFace alloc], v9);
    *(void *)(v63 + 96) = v54;
    goto LABEL_43;
  }
  float v51 = 0.0;
  if (v9) {
    goto LABEL_37;
  }
LABEL_44:
  if (v38)
  {
    v55 = *(void **)(v63 + 96);
    if (v55)
    {
      char v56 = objc_msgSend((id)objc_msgSend(v55, "trackingID"), "isEqual:", v38);
      v55 = *(void **)(v63 + 96);
      if ((v56 & 1) == 0)
      {
        [v55 detectionRect];
        v77.origin.double x = v57;
        v77.origin.double y = v58;
        v77.size.double width = v59;
        v77.size.double height = v60;
        BOOL v61 = CGRectContainsRect(v64, v77);
        v55 = *(void **)(v63 + 96);
        if (v61)
        {
          [v55 setTrackingID:v38];
          v55 = *(void **)(v63 + 96);
        }
      }
    }
    if (objc_msgSend(v38, "isEqual:", objc_msgSend(v55, "trackingID")))
    {
      *(float *)&double v62 = v51;
      [*(id *)(v63 + 96) setTrackingDistance:v62];
      objc_msgSend(*(id *)(v63 + 96), "setTrackingRect:", v64.origin.x, v64.origin.y, v64.size.width, v64.size.height);
    }
  }
  return [*(id *)(v63 + 96) distance];
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return self->_lastFocusDistance / self->_subjectTooFarFocusDistanceThreshold;
}

- (BOOL)portraitSceneMonitoringRequiresStageThresholds
{
  return self->_portraitSceneMonitoringRequiresStageThresholds;
}

- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3
{
  self->_portraitSceneMonitoringRequiresStageThresholds = a3;
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_TrackedFacesArray(void)"), @"BWSingleCameraPortraitSceneMonitor.m", 26, @"%s", dlerror());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.2()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_SmoothData(void)"), @"BWSingleCameraPortraitSceneMonitor.m", 30, @"%s", dlerror());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.3()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Pose(void)"), @"BWSingleCameraPortraitSceneMonitor.m", 32, @"%s", dlerror());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.4()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Translation(void)"), @"BWSingleCameraPortraitSceneMonitor.m", 34, @"%s", dlerror());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.5()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_FaceID(void)"), @"BWSingleCameraPortraitSceneMonitor.m", 28, @"%s", dlerror());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.6()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceRect(void)"), @"BWSingleCameraPortraitSceneMonitor.m", 36, @"%s", dlerror());
  __break(1u);
}

@end