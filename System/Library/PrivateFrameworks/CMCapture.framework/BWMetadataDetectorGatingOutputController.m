@interface BWMetadataDetectorGatingOutputController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionPTS;
- (BOOL)forceSynchronizedControllersToRunDetectionImmediately;
- (BOOL)isHandlingFirstBufferAfterSceneChange;
- (BOOL)isSmartCameraSceneConfident;
- (BOOL)lowPowerModeEnabled;
- (BOOL)sceneLikelyToHaveCodes;
- (BOOL)sceneMotionEstimatesSupported;
- (BOOL)shouldApplySceneMotion;
- (BOOL)shouldEmitBuffer;
- (BOOL)shouldEmitFirstBufferAfterSceneChange;
- (BOOL)shouldRunDetection;
- (BOOL)synchronizeWithOtherControllers;
- (BOOL)usesSceneClassifierToGateDetection;
- (BWMetadataDetectorGatingOutputController)initWithOutput:(id)a3 name:(id)a4 sceneStabilityMonitor:(id)a5 detectorAvailableGroup:(id)a6;
- (BWNodeOutput)nodeOutput;
- (FigCaptureLogSmartCameraGating)logger;
- (int64_t)lastDetectedCodesCount;
- (unsigned)_newOutputSampleBufferWithPixelBuffer:(opaqueCMSampleBuffer *)a3 inputSampleBuffer:(int)a4 appliedPrimaryCaptureRect:;
- (void)_updateSceneLikelyToHaveCodes;
- (void)dealloc;
- (void)emitPixelBuffer:(__CVBuffer *)a3 inputSampleBuffer:(opaqueCMSampleBuffer *)a4 appliedPrimaryCaptureRect:(BOOL)a5;
- (void)enableDetectionFrameRateControllingWithRamp:(id)a3 startIndex:(char)a4;
- (void)node:(id)a3 didEmitCodesCount:(int64_t)a4 emittedIdentifiers:(id)a5 originalPTS:(id *)a6;
- (void)prepareToEmitBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setForceSynchronizedControllersToRunDetectionImmediately:(BOOL)a3;
- (void)setLastDetectedCodesCount:(int64_t)a3;
- (void)setLastDetectedCodesCount:(int64_t)a3 originalPTS:(id *)a4;
- (void)setLastDetectionPTS:(id *)a3;
- (void)setLogger:(id)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setSceneMotionEstimatesSupported:(BOOL)a3;
- (void)setShouldEmitFirstBufferAfterSceneChange:(BOOL)a3;
- (void)setSmartCameraSceneConfident:(BOOL)a3;
- (void)setSynchronizeWithOtherControllers:(BOOL)a3;
- (void)setUsesSceneClassifierToGateDetection:(BOOL)a3;
@end

@implementation BWMetadataDetectorGatingOutputController

- (FigCaptureLogSmartCameraGating)logger
{
  return self->_logger;
}

- (BOOL)shouldApplySceneMotion
{
  return self->_shouldApplySceneMotion;
}

- (void)setUsesSceneClassifierToGateDetection:(BOOL)a3
{
  self->_usesSceneClassifierToGateDetection = a3;
}

- (void)setLogger:(id)a3
{
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (BWMetadataDetectorGatingOutputController)initWithOutput:(id)a3 name:(id)a4 sceneStabilityMonitor:(id)a5 detectorAvailableGroup:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)BWMetadataDetectorGatingOutputController;
  v10 = [(BWMetadataDetectorGatingOutputController *)&v16 init];
  if (v10)
  {
    *((void *)v10 + 2) = a3;
    *((void *)v10 + 1) = [a4 copy];
    *((void *)v10 + 12) = a5;
    *((_DWORD *)v10 + 43) = 0;
    uint64_t v11 = MEMORY[0x1E4F1F9F8];
    long long v12 = *MEMORY[0x1E4F1F9F8];
    *((_OWORD *)v10 + 2) = *MEMORY[0x1E4F1F9F8];
    uint64_t v13 = *(void *)(v11 + 16);
    *((void *)v10 + 6) = v13;
    *(_OWORD *)(v10 + 56) = v12;
    *((void *)v10 + 9) = v13;
    uint64_t v14 = MEMORY[0x1E4F1FA48];
    *((_OWORD *)v10 + 9) = *MEMORY[0x1E4F1FA48];
    *((void *)v10 + 20) = *(void *)(v14 + 16);
    v10[129] = 1;
    *((void *)v10 + 15) = a6;
  }
  return (BWMetadataDetectorGatingOutputController *)v10;
}

- (void)setSynchronizeWithOtherControllers:(BOOL)a3
{
  self->_synchronizeWithOtherControllers = a3;
}

- (BOOL)usesSceneClassifierToGateDetection
{
  return self->_usesSceneClassifierToGateDetection;
}

- (void)setShouldEmitFirstBufferAfterSceneChange:(BOOL)a3
{
  self->_shouldEmitFirstBufferAfterSceneChange = a3;
}

- (void)setSceneMotionEstimatesSupported:(BOOL)a3
{
  self->_sceneMotionEstimatesSupported = a3;
}

- (void)enableDetectionFrameRateControllingWithRamp:(id)a3 startIndex:(char)a4
{
  self->_detectionFrameRateRamp = (NSArray *)a3;
  self->_detectionFrameRateRampStartIndex = a4;
  self->_detectionFrameRateRampIndex = a4;
}

- (BOOL)shouldEmitBuffer
{
  BOOL v3 = self->_sceneMotionEstimatesSupported
    && [(BWSceneStabilityMonitor *)self->_sceneStabilityMonitor processedSceneMotion];
  if ([(BWMetadataDetectorGatingOutputController *)self shouldRunDetection]
    || [(BWMetadataDetectorGatingOutputController *)self shouldEmitFirstBufferAfterSceneChange]&& [(BWMetadataDetectorGatingOutputController *)self isHandlingFirstBufferAfterSceneChange])
  {
    return 1;
  }
  return v3;
}

- (BOOL)shouldEmitFirstBufferAfterSceneChange
{
  return self->_shouldEmitFirstBufferAfterSceneChange;
}

- (void)prepareToEmitBuffer:(opaqueCMSampleBuffer *)a3
{
  p_currentPTS = (CMTime *)&self->_currentPTS;
  BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&lhs);
  self->_currentPTS = ($95D729B680665BEAEFA1D6FCA8238556)lhs;
  self->_isHandlingFirstBufferAfterSceneChange = 0;
  os_unfair_lock_lock(&self->_lock);
  BOOL sceneLikelyToHaveCodes = self->_sceneLikelyToHaveCodes;
  if (!self->_emittedFirstBufferAfterSceneChange)
  {
    self->_isHandlingFirstBufferAfterSceneChange = 1;
    self->_firstBufferAfterSceneChangeHasCodes = sceneLikelyToHaveCodes;
    self->_emittedFirstBufferAfterSceneChange = 1;
  }
  uint64_t detectionFrameRateRampIndex = self->_detectionFrameRateRampIndex;
  CMTime lhs = *p_currentPTS;
  CMTime rhs = (CMTime)self->_detectedCodesLastSeenPTS;
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTimeMakeWithSeconds(&time2, 0.667, 1000);
  int32_t v7 = CMTimeCompare(&time1, &time2);
  os_unfair_lock_unlock(&self->_lock);
  int v8 = !self->_usesSceneClassifierToGateDetection || sceneLikelyToHaveCodes;
  memset(&lhs, 0, sizeof(lhs));
  CMTimeMakeWithSeconds(&lhs, 0.0667, 1000);
  if (v7 < 0)
  {
    CMTime time = lhs;
    CMTimeMultiplyByRatio(&rhs, &time, 1, 3);
    CMTime lhs = rhs;
  }
  memset(&rhs, 0, sizeof(rhs));
  sceneStabilityMonitor = self->_sceneStabilityMonitor;
  if (sceneStabilityMonitor) {
    [(BWSceneStabilityMonitor *)sceneStabilityMonitor stableStartTime];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CMTime time = *p_currentPTS;
  CMTimeSubtract(&rhs, &time, &v19);
  if (self->_isHandlingFirstBufferAfterSceneChange)
  {
    BOOL v10 = 1;
  }
  else
  {
    CMTime time = rhs;
    CMTime v18 = lhs;
    BOOL v10 = CMTimeCompare(&time, &v18) > 0;
  }
  int v11 = v10 & v8;
  detectionFrameRateRamp = self->_detectionFrameRateRamp;
  if (detectionFrameRateRamp)
  {
    if (self->_currentPTS.flags & 1) != 0 && (self->_lastDetectionPTS.flags)
    {
      memset(&time, 0, sizeof(time));
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](detectionFrameRateRamp, "objectAtIndexedSubscript:", detectionFrameRateRampIndex), "doubleValue");
      CMTimeMakeWithSeconds(&time, 1.0 / v13, 1000);
      CMTime v18 = *p_currentPTS;
      $95D729B680665BEAEFA1D6FCA8238556 lastDetectionPTS = self->_lastDetectionPTS;
      CMTimeSubtract(&v17, &v18, (CMTime *)&lastDetectionPTS);
      CMTime v18 = time;
      if (CMTimeCompare(&v17, &v18) <= 0) {
        int v11 = 0;
      }
    }
  }
  self->_shouldRunDetection = v11;
  if (v11 && dispatch_group_wait((dispatch_group_t)self->_detectorAvailableGroup, 0)) {
    self->_shouldRunDetection = 0;
  }
  BOOL sceneMotionEstimatesSupported = self->_sceneMotionEstimatesSupported;
  if (sceneMotionEstimatesSupported)
  {
    if (self->_lowPowerModeEnabled) {
      BOOL sceneMotionEstimatesSupported = 0;
    }
    else {
      BOOL sceneMotionEstimatesSupported = self->_shouldRunDetection || v7 < 0;
    }
  }
  self->_shouldApplySceneMotion = sceneMotionEstimatesSupported;
}

- (BOOL)shouldRunDetection
{
  return self->_shouldRunDetection;
}

- (BOOL)isHandlingFirstBufferAfterSceneChange
{
  return self->_isHandlingFirstBufferAfterSceneChange;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMetadataDetectorGatingOutputController;
  [(BWMetadataDetectorGatingOutputController *)&v3 dealloc];
}

- (void)setSmartCameraSceneConfident:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isSmartCameraSceneConfident != v3)
  {
    self->_isSmartCameraSceneConfident = v3;
    -[BWMetadataDetectorGatingOutputController _updateSceneLikelyToHaveCodes]((uint64_t)self);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_updateSceneLikelyToHaveCodes
{
  if (!a1) {
    return;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 172));
  if (!*(unsigned char *)(a1 + 24)) {
    return;
  }
  if (*(unsigned char *)(a1 + 130))
  {
    if (*(unsigned char *)(a1 + 128)) {
      return;
    }
    *(_WORD *)(a1 + 128) = 1;
LABEL_9:
    v4 = *(void **)(a1 + 112);
    [v4 logGateOpened];
    return;
  }
  uint64_t v2 = *(void *)(a1 + 136);
  int v3 = v2 > 0;
  if (*(unsigned __int8 *)(a1 + 128) == v3) {
    return;
  }
  *(_WORD *)(a1 + 128) = v3;
  if (v2 >= 1) {
    goto LABEL_9;
  }
  v5 = *(void **)(a1 + 112);
  [v5 logGateClosed];
}

- (BOOL)isSmartCameraSceneConfident
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isSmartCameraSceneConfident;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLastDetectedCodesCount:(int64_t)a3 originalPTS:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lastDetectedCodesCount = self->_lastDetectedCodesCount;
  if (lastDetectedCodesCount != a3)
  {
    if (lastDetectedCodesCount < a3 && self->_synchronizeWithOtherControllers) {
      self->_forceSynchronizedControllersToRunDetectionImmediately = 1;
    }
    self->_int64_t lastDetectedCodesCount = a3;
    -[BWMetadataDetectorGatingOutputController _updateSceneLikelyToHaveCodes]((uint64_t)self);
    a3 = self->_lastDetectedCodesCount;
  }
  if (a3 >= 1)
  {
    self->_uint64_t detectionFrameRateRampIndex = 0;
    long long v10 = *(_OWORD *)&a4->var0;
    self->_detectedCodesLastSeenPTS.epoch = a4->var3;
    *(_OWORD *)&self->_detectedCodesLastSeenPTS.value = v10;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)lastDetectedCodesCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lastDetectedCodesCount = self->_lastDetectedCodesCount;
  os_unfair_lock_unlock(p_lock);
  return lastDetectedCodesCount;
}

- (void)setForceSynchronizedControllersToRunDetectionImmediately:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_forceSynchronizedControllersToRunDetectionImmediately = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)forceSynchronizedControllersToRunDetectionImmediately
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_forceSynchronizedControllersToRunDetectionImmediately;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)emitPixelBuffer:(__CVBuffer *)a3 inputSampleBuffer:(opaqueCMSampleBuffer *)a4 appliedPrimaryCaptureRect:(BOOL)a5
{
  v6 = -[BWMetadataDetectorGatingOutputController _newOutputSampleBufferWithPixelBuffer:inputSampleBuffer:appliedPrimaryCaptureRect:]((unsigned __int8 *)self, a3, a4, a5);
  if (v6)
  {
    int32_t v7 = v6;
    [(BWNodeOutput *)self->_nodeOutput emitSampleBuffer:v6];
    BOOL shouldRunDetection = self->_shouldRunDetection;
    if (self->_shouldRunDetection)
    {
      *(_OWORD *)&self->_lastDetectionPTS.value = *(_OWORD *)&self->_currentPTS.value;
      self->_lastDetectionPTS.epoch = self->_currentPTS.epoch;
    }
    os_unfair_lock_lock(&self->_lock);
    memset(&v15, 0, sizeof(v15));
    sceneStabilityMonitor = self->_sceneStabilityMonitor;
    if (sceneStabilityMonitor) {
      [(BWSceneStabilityMonitor *)sceneStabilityMonitor unstableStartTime];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    CMTime lhs = (CMTime)self->_currentPTS;
    CMTimeSubtract(&v15, &lhs, &rhs);
    if ((self->_lowPowerModeEnabled || [(BWSceneStabilityMonitor *)self->_sceneStabilityMonitor isStable])
      && ([(BWSceneStabilityMonitor *)self->_sceneStabilityMonitor isStable]
       || (CMTimeMake(&time2, 300, 1000), CMTime lhs = v15, CMTimeCompare(&lhs, &time2) < 1))
      && (shouldRunDetection || !self->_isHandlingFirstBufferAfterSceneChange)
      && ![(BWSceneStabilityMonitor *)self->_sceneStabilityMonitor isAFCompleted])
    {
      if (!shouldRunDetection) {
        goto LABEL_16;
      }
      ++self->_detectionFrameRateRampIndex;
      if ([(NSArray *)self->_detectionFrameRateRamp count] - 1 < self->_detectionFrameRateRampIndex) {
        [(NSArray *)self->_detectionFrameRateRamp count];
      }
      NSUInteger v11 = [(NSArray *)self->_detectionFrameRateRamp count];
      unint64_t detectionFrameRateRampIndex = self->_detectionFrameRateRampIndex;
      if (v11 - 1 < detectionFrameRateRampIndex) {
        LOBYTE(detectionFrameRateRampIndex) = [(NSArray *)self->_detectionFrameRateRamp count] - 1;
      }
    }
    else
    {
      LOBYTE(detectionFrameRateRampIndex) = self->_detectionFrameRateRampStartIndex;
    }
    self->_unint64_t detectionFrameRateRampIndex = detectionFrameRateRampIndex;
LABEL_16:
    os_unfair_lock_unlock(&self->_lock);
    CFRelease(v7);
  }
}

- (unsigned)_newOutputSampleBufferWithPixelBuffer:(opaqueCMSampleBuffer *)a3 inputSampleBuffer:(int)a4 appliedPrimaryCaptureRect:
{
  if (result)
  {
    v5 = result;
    CFTypeRef cf = 0;
    CMAttachmentBearerRef target = 0;
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, a2, &cf, (CMSampleBufferRef *)&target))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      if (a4) {
        CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530D0], 0, 1u);
      }
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530F8], (CFTypeRef)[NSNumber numberWithBool:v5[104]], 1u);
      if (v5[104]) {
        CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53000], *((CFTypeRef *)v5 + 15), 1u);
      }
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53140], (CFTypeRef)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*((id *)v5 + 12), "isStable")), 1u);
      if (v5[26] && [*((id *)v5 + 12) processedSceneMotion])
      {
        CMAttachmentBearerRef v6 = target;
        CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F53128];
        int v8 = NSNumber;
        [*((id *)v5 + 12) sceneMotionOffsetX];
        CMSetAttachment(v6, v7, (CFTypeRef)objc_msgSend(v8, "numberWithFloat:"), 1u);
        CMAttachmentBearerRef v9 = target;
        CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53130];
        NSUInteger v11 = NSNumber;
        [*((id *)v5 + 12) sceneMotionOffsetY];
        CMSetAttachment(v9, v10, (CFTypeRef)objc_msgSend(v11, "numberWithFloat:"), 1u);
      }
      if (v5[106]) {
        CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53120], (CFTypeRef)[NSNumber numberWithBool:v5[107]], 1u);
      }
    }
    if (cf) {
      CFRelease(cf);
    }
    return (unsigned __int8 *)target;
  }
  return result;
}

- (void)node:(id)a3 didEmitCodesCount:(int64_t)a4 emittedIdentifiers:(id)a5 originalPTS:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a6;
  [(BWMetadataDetectorGatingOutputController *)self setLastDetectedCodesCount:a4 originalPTS:&v10];
  os_unfair_lock_lock(&self->_lock);
  BOOL isSmartCameraSceneConfident = self->_isSmartCameraSceneConfident;
  os_unfair_lock_unlock(&self->_lock);
  [(FigCaptureLogSmartCameraGating *)self->_logger logSmartCamIsConfident:isSmartCameraSceneConfident presentedIdentifiers:a5 presentedCount:a4];
}

- (BWNodeOutput)nodeOutput
{
  return self->_nodeOutput;
}

- (BOOL)sceneMotionEstimatesSupported
{
  return self->_sceneMotionEstimatesSupported;
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (BOOL)synchronizeWithOtherControllers
{
  return self->_synchronizeWithOtherControllers;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionPTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setLastDetectionPTS:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastDetectionPTS.epoch = a3->var3;
  *(_OWORD *)&self->_lastDetectionPTS.value = v3;
}

- (BOOL)sceneLikelyToHaveCodes
{
  return self->_sceneLikelyToHaveCodes;
}

- (void)setLastDetectedCodesCount:(int64_t)a3
{
  self->_int64_t lastDetectedCodesCount = a3;
}

@end