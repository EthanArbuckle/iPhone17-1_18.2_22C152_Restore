@interface AVCaptureVisionDataOutput
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxBurstDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minBurstFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDuration;
- (AVCaptureVisionDataOutput)init;
- (AVCaptureVisionDataOutputDelegate)delegate;
- (BOOL)_isPropertySupported:(id)a3;
- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3;
- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3;
- (BOOL)areRuntimeUpdatesSupported;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)isDynamicThresholdingEnabled;
- (BOOL)isDynamicThresholdingSupported;
- (BOOL)isFeatureBinningEnabled;
- (BOOL)isFeatureMatchingEnabled;
- (BOOL)isFeatureMatchingSupported;
- (BOOL)isFeatureOrientationAssignmentEnabled;
- (BOOL)isHammingDistanceThresholdSupported;
- (BOOL)isKeypointDetectionFlowTypeSupported:(unint64_t)a3;
- (BOOL)isLACCConfigAndMetadataSupported;
- (BOOL)isOrientationDistanceThresholdSupported;
- (BOOL)isSigmaDistanceThresholdSupported;
- (BOOL)isSquareDistanceDisparityFractionSupported;
- (BOOL)isSubPixelThresholdSupported;
- (NSData)laccConfigAndMetadata;
- (OS_dispatch_queue)delegateCallbackQueue;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (float)gaussianPyramidBaseOctaveDownscalingFactor;
- (float)keypointDetectionThreshold;
- (float)orientationDistanceThreshold;
- (float)sigmaDistanceThreshold;
- (float)squareDistanceDisparityFraction;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)connectionMediaTypes;
- (id)delegateOverride;
- (unint64_t)featureMatchingDescriptorSize;
- (unint64_t)gaussianPyramidOctavesCount;
- (unint64_t)hammingDistanceThreshold;
- (unint64_t)keypointDetectionFlowType;
- (unint64_t)maxKeypointsCount;
- (unint64_t)subPixelThreshold;
- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3;
- (void)_initializeClientVisiblePropertiesForSourceDevice:(id)a3;
- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_updateLocalQueue:(localQueueOpaque *)a3;
- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4;
- (void)removeConnection:(id)a3;
- (void)setDelegate:(id)a3 callbackQueue:(id)a4;
- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4;
- (void)setDynamicThresholdingEnabled:(BOOL)a3;
- (void)setFeatureBinningEnabled:(BOOL)a3;
- (void)setFeatureMatchingDescriptorSize:(unint64_t)a3;
- (void)setFeatureMatchingEnabled:(BOOL)a3;
- (void)setFeatureOrientationAssignmentEnabled:(BOOL)a3;
- (void)setGaussianPyramidBaseOctaveDownscalingFactor:(float)a3;
- (void)setGaussianPyramidOctavesCount:(unint64_t)a3;
- (void)setHammingDistanceThreshold:(unint64_t)a3;
- (void)setKeypointDetectionFlowType:(unint64_t)a3;
- (void)setKeypointDetectionThreshold:(float)a3;
- (void)setLaccConfigAndMetadata:(id)a3;
- (void)setMaxBurstDuration:(id *)a3;
- (void)setMaxKeypointsCount:(unint64_t)a3;
- (void)setMinBurstFrameDuration:(id *)a3;
- (void)setMinFrameDuration:(id *)a3;
- (void)setOrientationDistanceThreshold:(float)a3;
- (void)setRuntimeUpdates:(id)a3;
- (void)setSigmaDistanceThreshold:(float)a3;
- (void)setSquareDistanceDisparityFraction:(float)a3;
- (void)setSubPixelThreshold:(unint64_t)a3;
- (void)triggerBurst;
@end

@implementation AVCaptureVisionDataOutput

+ (void)initialize
{
}

- (AVCaptureVisionDataOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVisionDataOutput;
  v2 = [(AVCaptureOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureVisionDataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
      [(AVCaptureVisionDataOutput *)v2 _initializeClientVisiblePropertiesForSourceDevice:0];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVisionDataOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
{
  id v4 = a4;
  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    id v4 = 0;
  }
  [(AVCaptureVisionDataOutput *)self willChangeValueForKey:@"delegate"];
  uint64_t v8 = 0;
  if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setClientDelegate:a3 clientCallbackQueue:v4 exceptionReason:&v8])
  {
    [(AVCaptureVisionDataOutput *)self didChangeValueForKey:@"delegate"];
  }
  else
  {
    v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureVisionDataOutput *)self didChangeValueForKey:@"delegate"];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (AVCaptureVisionDataOutputDelegate)delegate
{
  return (AVCaptureVisionDataOutputDelegate *)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientDelegate];
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientCallbackQueue];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 24);
  return self;
}

- (void)setMinFrameDuration:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:@"visn"] sourceDevice];
  v6 = v5;
  CMTimeValue var0 = a3->var0;
  CMTimeFlags var2 = a3->var2;
  CMTimeScale var1 = a3->var1;
  if (var2)
  {
    CMTimeEpoch var3 = a3->var3;
  }
  else
  {
    if (!v5)
    {
      CMTimeEpoch var3 = 0;
      CMTimeFlags var2 = 0;
      CMTimeScale var1 = 0;
      CMTimeValue var0 = 0;
      goto LABEL_17;
    }
    [v5 activeVideoMinFrameDuration];
    CMTimeEpoch var3 = v18.epoch;
    CMTimeValue var0 = v18.value;
    CMTimeFlags var2 = v18.flags;
    CMTimeScale var1 = v18.timescale;
    if ((v18.flags & 1) == 0)
    {
LABEL_17:
      internal = self->_internal;
      v18.value = var0;
      v18.timescale = var1;
      v18.flags = var2;
      v18.epoch = var3;
      CMTime minFrameDuration = (CMTime)internal->minFrameDuration;
      if (CMTimeCompare(&v18, &minFrameDuration))
      {
        v13 = self->_internal;
        long long v14 = *(_OWORD *)&a3->var0;
        v13->minFrameDuration.epoch = a3->var3;
        *(_OWORD *)&v13->minFrameDuration.value = v14;
        [(AVCaptureOutput *)self bumpChangeSeed];
      }
      return;
    }
  }
  memset(&v18, 0, sizeof(v18));
  v9 = (void *)[v6 activeFormat];
  if (v9) {
    [v9 lowestSupportedVideoFrameDuration];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  memset(&minFrameDuration, 0, sizeof(minFrameDuration));
  v10 = (void *)[v6 activeFormat];
  if (v10) {
    [v10 highestSupportedVideoFrameDuration];
  }
  else {
    memset(&minFrameDuration, 0, sizeof(minFrameDuration));
  }
  time1.timescale = var1;
  time1.flags = var2;
  time1.epoch = var3;
  CMTime time2 = v18;
  time1.value = var0;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    time1.timescale = var1;
    time1.flags = var2;
    time1.epoch = var3;
    CMTime time2 = minFrameDuration;
    time1.value = var0;
    if (CMTimeCompare(&time1, &time2) < 1) {
      goto LABEL_17;
    }
  }
  v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v11);
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minBurstFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 48);
  return self;
}

- (void)setMinBurstFrameDuration:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:@"visn"] sourceDevice];
  v6 = v5;
  CMTimeValue var0 = a3->var0;
  CMTimeFlags var2 = a3->var2;
  CMTimeScale var1 = a3->var1;
  if (var2)
  {
    CMTimeEpoch var3 = a3->var3;
  }
  else
  {
    if (!v5)
    {
      CMTimeEpoch var3 = 0;
      CMTimeFlags var2 = 0;
      CMTimeScale var1 = 0;
      CMTimeValue var0 = 0;
      goto LABEL_17;
    }
    [v5 activeVideoMinFrameDuration];
    CMTimeEpoch var3 = v17.epoch;
    CMTimeValue var0 = v17.value;
    CMTimeFlags var2 = v17.flags;
    CMTimeScale var1 = v17.timescale;
    if ((v17.flags & 1) == 0)
    {
LABEL_17:
      internal = self->_internal;
      v17.value = var0;
      v17.timescale = var1;
      v17.flags = var2;
      v17.epoch = var3;
      CMTime minBurstFrameDuration = (CMTime)internal->minBurstFrameDuration;
      if (CMTimeCompare(&v17, &minBurstFrameDuration))
      {
        v13 = self->_internal;
        v13->minBurstFrameDuration.value = var0;
        v13->minBurstFrameDuration.timescale = var1;
        v13->minBurstFrameDuration.flags = var2;
        v13->minBurstFrameDuration.epoch = var3;
        [(AVCaptureOutput *)self bumpChangeSeed];
      }
      return;
    }
  }
  memset(&v17, 0, sizeof(v17));
  v9 = (void *)[v6 activeFormat];
  if (v9) {
    [v9 lowestSupportedVideoFrameDuration];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  memset(&minBurstFrameDuration, 0, sizeof(minBurstFrameDuration));
  v10 = (void *)[v6 activeFormat];
  if (v10) {
    [v10 highestSupportedVideoFrameDuration];
  }
  else {
    memset(&minBurstFrameDuration, 0, sizeof(minBurstFrameDuration));
  }
  time1.timescale = var1;
  time1.flags = var2;
  time1.epoch = var3;
  CMTime time2 = v17;
  time1.value = var0;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    time1.timescale = var1;
    time1.flags = var2;
    time1.epoch = var3;
    CMTime time2 = minBurstFrameDuration;
    time1.value = var0;
    if (CMTimeCompare(&time1, &time2) < 1) {
      goto LABEL_17;
    }
  }
  v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v11);
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxBurstDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 72);
  return self;
}

- (void)setMaxBurstDuration:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CMTimeValue var0 = a3->var0;
  CMTimeFlags var2 = a3->var2;
  CMTimeScale var1 = a3->var1;
  if (var2)
  {
    CMTimeEpoch var3 = a3->var3;
  }
  else
  {
    CMTimeMake(&time1, 2, 1);
    CMTimeValue var0 = time1.value;
    CMTimeFlags var2 = time1.flags;
    CMTimeScale var1 = time1.timescale;
    CMTimeEpoch var3 = time1.epoch;
  }
  if ((var2 & 0x1D) == 1
    && (time1.value = var0,
        time1.timescale = var1,
        time1.flags = var2,
        time1.epoch = var3,
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
        CMTimeCompare(&time1, &time2) > 0))
  {
    internal = self->_internal;
    time1.value = var0;
    time1.timescale = var1;
    time1.flags = var2;
    time1.epoch = var3;
    CMTime time2 = (CMTime)internal->maxBurstDuration;
    if (CMTimeCompare(&time1, &time2))
    {
      v7 = self->_internal;
      v7->maxBurstDuration.value = var0;
      v7->maxBurstDuration.timescale = var1;
      v7->maxBurstDuration.flags = var2;
      v7->maxBurstDuration.epoch = var3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (unint64_t)gaussianPyramidOctavesCount
{
  return self->_internal->gaussianPyramidOctavesCount;
}

- (void)setGaussianPyramidOctavesCount:(unint64_t)a3
{
  if (a3)
  {
    internal = self->_internal;
    if (internal->gaussianPyramidOctavesCount != a3)
    {
      internal->gaussianPyramidOctavesCount = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    id v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
}

- (float)gaussianPyramidBaseOctaveDownscalingFactor
{
  return self->_internal->gaussianPyramidBaseOctaveDownscalingFactor;
}

- (void)setGaussianPyramidBaseOctaveDownscalingFactor:(float)a3
{
  if (a3 >= 1.0)
  {
    internal = self->_internal;
    if (internal->gaussianPyramidBaseOctaveDownscalingFactor != a3)
    {
      internal->gaussianPyramidBaseOctaveDownscalingFactor = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
}

- (unint64_t)maxKeypointsCount
{
  return self->_internal->maxKeypointsCount;
}

- (void)setMaxKeypointsCount:(unint64_t)a3
{
  if (a3)
  {
    internal = self->_internal;
    if (internal->maxKeypointsCount != a3)
    {
      internal->maxKeypointsCount = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    id v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
}

- (BOOL)isFeatureBinningEnabled
{
  return self->_internal->featureBinningEnabled;
}

- (void)setFeatureBinningEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal->featureBinningEnabled != a3)
  {
    internal->featureBinningEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (BOOL)isFeatureOrientationAssignmentEnabled
{
  return self->_internal->featureOrientationAssignmentEnabled;
}

- (void)setFeatureOrientationAssignmentEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal->featureOrientationAssignmentEnabled != a3)
  {
    internal->featureOrientationAssignmentEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (BOOL)isDynamicThresholdingSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F524F8]];
}

- (BOOL)isDynamicThresholdingEnabled
{
  return self->_internal->dynamicThresholdingEnabled;
}

- (void)setDynamicThresholdingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureVisionDataOutput *)self isDynamicThresholdingSupported])
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->dynamicThresholdingEnabled != v3)
    {
      internal->dynamicThresholdingEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isKeypointDetectionFlowTypeSupported:(unint64_t)a3
{
  return !a3 || [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52510]];
}

- (unint64_t)keypointDetectionFlowType
{
  return self->_internal->keypointDetectionFlowType;
}

- (void)setKeypointDetectionFlowType:(unint64_t)a3
{
  if (a3
    && ![(AVCaptureVisionDataOutput *)self isKeypointDetectionFlowTypeSupported:a3])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->keypointDetectionFlowType != a3)
    {
      internal->keypointDetectionFlowType = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isSubPixelThresholdSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52538]];
}

- (unint64_t)subPixelThreshold
{
  return self->_internal->subPixelThreshold;
}

- (void)setSubPixelThreshold:(unint64_t)a3
{
  if (a3 && ![(AVCaptureVisionDataOutput *)self isSubPixelThresholdSupported])
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->subPixelThreshold != a3)
    {
      internal->subPixelThreshold = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isFeatureMatchingSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52500]];
}

- (BOOL)isFeatureMatchingEnabled
{
  return self->_internal->featureMatchingEnabled;
}

- (void)setFeatureMatchingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCaptureVisionDataOutput *)self isFeatureMatchingSupported])
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->featureMatchingEnabled != v3)
    {
      internal->featureMatchingEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (unint64_t)featureMatchingDescriptorSize
{
  return self->_internal->featureMatchingDescriptorSize;
}

- (void)setFeatureMatchingDescriptorSize:(unint64_t)a3
{
  if (a3 && ![(AVCaptureVisionDataOutput *)self isFeatureMatchingSupported])
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->featureMatchingDescriptorSize != a3)
    {
      internal->featureMatchingDescriptorSize = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isOrientationDistanceThresholdSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52520]];
}

- (float)orientationDistanceThreshold
{
  return self->_internal->orientationDistanceThreshold;
}

- (void)setOrientationDistanceThreshold:(float)a3
{
  if (a3 == 0.0
    || [(AVCaptureVisionDataOutput *)self isOrientationDistanceThresholdSupported])
  {
    internal = self->_internal;
    if (internal->orientationDistanceThreshold != a3)
    {
      internal->orientationDistanceThreshold = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (BOOL)isSigmaDistanceThresholdSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52528]];
}

- (float)sigmaDistanceThreshold
{
  return self->_internal->sigmaDistanceThreshold;
}

- (void)setSigmaDistanceThreshold:(float)a3
{
  if (a3 == 0.0
    || [(AVCaptureVisionDataOutput *)self isSigmaDistanceThresholdSupported])
  {
    internal = self->_internal;
    if (internal->sigmaDistanceThreshold != a3)
    {
      internal->sigmaDistanceThreshold = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (BOOL)isSquareDistanceDisparityFractionSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52530]];
}

- (float)squareDistanceDisparityFraction
{
  return self->_internal->squareDistanceDisparityFraction;
}

- (void)setSquareDistanceDisparityFraction:(float)a3
{
  if (a3 == 0.0
    || [(AVCaptureVisionDataOutput *)self isSquareDistanceDisparityFractionSupported])
  {
    internal = self->_internal;
    if (internal->squareDistanceDisparityFraction != a3)
    {
      internal->squareDistanceDisparityFraction = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (BOOL)isHammingDistanceThresholdSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52508]];
}

- (unint64_t)hammingDistanceThreshold
{
  return self->_internal->hammingDistanceThreshold;
}

- (void)setHammingDistanceThreshold:(unint64_t)a3
{
  if (a3
    && ![(AVCaptureVisionDataOutput *)self isHammingDistanceThresholdSupported])
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->hammingDistanceThreshold != a3)
    {
      internal->hammingDistanceThreshold = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isLACCConfigAndMetadataSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52518]];
}

- (NSData)laccConfigAndMetadata
{
  return self->_internal->laccConfigAndMetadata;
}

- (void)setLaccConfigAndMetadata:(id)a3
{
  if (a3 && ![(AVCaptureVisionDataOutput *)self isLACCConfigAndMetadataSupported])
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else if (self->_internal->laccConfigAndMetadata != a3 && (objc_msgSend(a3, "isEqualToData:") & 1) == 0)
  {

    self->_internal->laccConfigAndMetadata = (NSData *)[a3 copy];
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (float)keypointDetectionThreshold
{
  return self->_internal->keypointDetectionThreshold;
}

- (void)setKeypointDetectionThreshold:(float)a3
{
  internal = self->_internal;
  if (internal->keypointDetectionThreshold != a3)
  {
    internal->keypointDetectionThreshold = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__AVCaptureVisionDataOutput_setKeypointDetectionThreshold___block_invoke;
    v4[3] = &unk_1E5A73430;
    v4[4] = self;
    float v5 = a3;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v4];
  }
}

uint64_t __59__AVCaptureVisionDataOutput_setKeypointDetectionThreshold___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    LODWORD(v5) = *(_DWORD *)(v3 + 40);
    uint64_t v6 = [NSNumber numberWithFloat:v5];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v9 = *(void *)(VTable + 16);
    result = VTable + 16;
    uint64_t v8 = v9;
    uint64_t v10 = v9 ? v8 : 0;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8);
    if (v11)
    {
      uint64_t v12 = *MEMORY[0x1E4F51918];
      return v11(a2, v4, v12, v6);
    }
  }
  return result;
}

- (BOOL)areRuntimeUpdatesSupported
{
  return [(AVCaptureVisionDataOutput *)self _isPropertySupported:*MEMORY[0x1E4F52458]];
}

- (void)setRuntimeUpdates:(id)a3
{
  if ([(AVCaptureVisionDataOutput *)self areRuntimeUpdatesSupported])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__AVCaptureVisionDataOutput_setRuntimeUpdates___block_invoke;
    v6[3] = &unk_1E5A731B8;
    v6[4] = self;
    v6[5] = a3;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v6];
  }
  else
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

uint64_t __47__AVCaptureVisionDataOutput_setRuntimeUpdates___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    result = VTable + 16;
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F51920];
      return v10(a2, v4, v11, v5);
    }
  }
  return result;
}

- (void)triggerBurst
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__AVCaptureVisionDataOutput_triggerBurst__block_invoke;
  v2[3] = &unk_1E5A73458;
  v2[4] = self;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v2];
}

uint64_t __41__AVCaptureVisionDataOutput_triggerBurst__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(result + 32) sinkID];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v6 = *(void *)(VTable + 16);
    result = VTable + 16;
    uint64_t v5 = v6;
    uint64_t v7 = v6 ? v5 : 0;
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 152);
    if (v8)
    {
      return v8(a2, v3);
    }
  }
  return result;
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"visn";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"visn"))
  {
    uint64_t v7 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v7 = 2;
LABEL_5:
    uint64_t v8 = (void *)AVCaptureOutputConnectionFailureReasonString(v7, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v8;
    return result;
  }
  return 1;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureVisionDataOutput;
  id v6 = [(AVCaptureOutput *)&v8 addConnection:a3 error:a4];
  if (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"visn")) {
    -[AVCaptureVisionDataOutput _initializeClientVisiblePropertiesForSourceDevice:](self, "_initializeClientVisiblePropertiesForSourceDevice:", [v6 sourceDevice]);
  }
  return v6;
}

- (void)removeConnection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureVisionDataOutput;
  [(AVCaptureOutput *)&v4 removeConnection:a3];
  [(AVCaptureVisionDataOutput *)self _initializeClientVisiblePropertiesForSourceDevice:0];
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 0;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 0;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:vsndo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:vsndo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVisionDataOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vsndo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:vsndo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3];
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVisionDataOutput;
  [(AVCaptureOutput *)&v6 detachSafelyFromFigCaptureSession:a3];
}

- (id)delegateOverride
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverride];
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverrideCallbackQueue];
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    id v7 = 0;
  }
  else {
    id v7 = a4;
  }
  uint64_t v9 = 0;
  if (![(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setDelegateOverride:a3 delegateOverrideCallbackQueue:v7 exceptionReason:&v9])
  {
    objc_super v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  if ([a3 isVisionDataDeliverySupported]) {
    [(AVCaptureVisionDataOutput *)self _initializeClientVisiblePropertiesForSourceDevice:a4];
  }
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVisionDataOutput;
  [(AVCaptureOutput *)&v7 handleChangedActiveFormat:a3 forDevice:a4];
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518B8]])
    {
      uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F518A8]];
      [(AVCaptureVisionDataOutput *)self _updateRemoteQueue:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518B0]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51658]];
      [(AVCaptureVisionDataOutput *)self _updateLocalQueue:v8];
    }
  }
}

- (void)_initializeClientVisiblePropertiesForSourceDevice:(id)a3
{
  objc_msgSend(-[AVCaptureOutput session](self, "session"), "beginConfiguration");
  long long v21 = 0uLL;
  uint64_t v22 = 0;
  if (a3) {
    [a3 activeVideoMinFrameDuration];
  }
  long long v19 = v21;
  uint64_t v20 = v22;
  [(AVCaptureVisionDataOutput *)self setMinFrameDuration:&v19];
  long long v17 = v21;
  uint64_t v18 = v22;
  [(AVCaptureVisionDataOutput *)self setMinBurstFrameDuration:&v17];
  CMTimeMake(&v16, 2, 1);
  CMTime v15 = v16;
  [(AVCaptureVisionDataOutput *)self setMaxBurstDuration:&v15];
  [(AVCaptureVisionDataOutput *)self setGaussianPyramidOctavesCount:4];
  LODWORD(v5) = 2.0;
  [(AVCaptureVisionDataOutput *)self setGaussianPyramidBaseOctaveDownscalingFactor:v5];
  [(AVCaptureVisionDataOutput *)self setMaxKeypointsCount:5000];
  [(AVCaptureVisionDataOutput *)self setFeatureBinningEnabled:0];
  [(AVCaptureVisionDataOutput *)self setFeatureOrientationAssignmentEnabled:1];
  LODWORD(v6) = 1110704128;
  [(AVCaptureVisionDataOutput *)self setKeypointDetectionThreshold:v6];
  [(AVCaptureVisionDataOutput *)self setDynamicThresholdingEnabled:0];
  [(AVCaptureVisionDataOutput *)self setKeypointDetectionFlowType:[(AVCaptureVisionDataOutput *)self isKeypointDetectionFlowTypeSupported:1]];
  if ([(AVCaptureVisionDataOutput *)self isSubPixelThresholdSupported]) {
    uint64_t v7 = 9;
  }
  else {
    uint64_t v7 = 0;
  }
  [(AVCaptureVisionDataOutput *)self setSubPixelThreshold:v7];
  [(AVCaptureVisionDataOutput *)self setFeatureMatchingEnabled:0];
  [(AVCaptureVisionDataOutput *)self setFeatureMatchingDescriptorSize:[(AVCaptureVisionDataOutput *)self isFeatureMatchingSupported]];
  BOOL v8 = [(AVCaptureVisionDataOutput *)self isOrientationDistanceThresholdSupported];
  LODWORD(v9) = 20.0;
  if (!v8) {
    *(float *)&double v9 = 0.0;
  }
  [(AVCaptureVisionDataOutput *)self setOrientationDistanceThreshold:v9];
  BOOL v10 = [(AVCaptureVisionDataOutput *)self isSigmaDistanceThresholdSupported];
  LODWORD(v11) = 0.5;
  if (!v10) {
    *(float *)&double v11 = 0.0;
  }
  [(AVCaptureVisionDataOutput *)self setSigmaDistanceThreshold:v11];
  BOOL v12 = [(AVCaptureVisionDataOutput *)self isSquareDistanceDisparityFractionSupported];
  LODWORD(v13) = 1045220557;
  if (!v12) {
    *(float *)&double v13 = 0.0;
  }
  [(AVCaptureVisionDataOutput *)self setSquareDistanceDisparityFraction:v13];
  if ([(AVCaptureVisionDataOutput *)self isHammingDistanceThresholdSupported]) {
    uint64_t v14 = 180;
  }
  else {
    uint64_t v14 = 0;
  }
  [(AVCaptureVisionDataOutput *)self setHammingDistanceThreshold:v14];
  objc_msgSend(-[AVCaptureOutput session](self, "session"), "commitConfiguration");
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  double v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)[MessageReceiver copy]);
}

void __48__AVCaptureVisionDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  double v6 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v7 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v7)
  {
    BOOL v8 = v7;
    if (a2 == -16665)
    {
      [*(id *)(v7[2] + 8) releaseRemoteQueueReceiver];
    }
    else if (!a2)
    {
      [v7 _handleRemoteQueueOperation:a3];
    }
  }
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureVisionDataOutput *)self _processSampleBuffer:a3->var4.var4.var0];
  }
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  double v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AVCaptureVisionDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E5A730B8;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)[v6 copy]);
}

void __47__AVCaptureVisionDataOutput__updateLocalQueue___block_invoke(uint64_t a1, long long *a2)
{
  objc_super v4 = (void *)MEMORY[0x1A62348E0]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v5)
  {
    double v6 = v5;
    long long v7 = *a2;
    int v8 = *((_DWORD *)a2 + 4);
    [v5 _handleLocalQueueMessage:&v7];
  }
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureVisionDataOutput *)self _processSampleBuffer:*(void *)(&a3->var0 + 1)];
  }
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper activeDelegate];
  id v6 = [(NSArray *)[(AVCaptureOutput *)self connections] firstObject];
  if ([v6 isLive]
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, a3);
    if (ImageBuffer)
    {
      if (objc_opt_respondsToSelector())
      {
        CFTypeRef v8 = CMGetAttachment(a3, @"VisionDataCameraIntrinsicMatrix", 0);
        if (v8) {
          CMSetAttachment(ImageBuffer, @"VisionDataCameraIntrinsicMatrix", v8, 1u);
        }
        CMTime v10 = v11;
        [v5 visionDataOutput:self didOutputVisionDataPixelBuffer:ImageBuffer timestamp:&v10 connection:v6];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      int64_t v9 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:a3];
      CMTime v10 = v11;
      [v5 visionDataOutput:self didDropVisionDataPixelBufferForTimestamp:&v10 connection:v6 reason:v9];
    }
  }
}

- (BOOL)_isPropertySupported:(id)a3
{
  objc_super v4 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", @"visn"), "sourceDevice"), "supportedVisionDataProperties");

  return [v4 containsObject:a3];
}

@end