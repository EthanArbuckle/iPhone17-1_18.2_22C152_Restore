@interface HMIVideoFrameSelector
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetInterval;
- (BOOL)enabled;
- (BOOL)resetReferences;
- (HMIVideoFrameSelector)initWithConfiguration:(id)a3 workQueue:(id)a4;
- (HMIVideoFrameSelectorDelegate)delegate;
- (__CFArray)references;
- (os_unfair_lock_s)lock;
- (unint64_t)maxReferences;
- (void)dealloc;
- (void)flush;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMaxReferences:(unint64_t)a3;
- (void)setReferenceInterval:(id *)a3;
- (void)setResetReferences:(BOOL)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation HMIVideoFrameSelector

- (HMIVideoFrameSelector)initWithConfiguration:(id)a3 workQueue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HMIVideoFrameSelector;
  v4 = [(HMIVideoAnalyzerProcessingNode *)&v9 initWithConfiguration:a3 workQueue:a4];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    CMTimeMake(&v8, 3, 10);
    long long v6 = *(_OWORD *)&v8.value;
    v5->_targetInterval.epoch = v8.epoch;
    *(_OWORD *)&v5->_targetInterval.value = v6;
    v5->_enabled = 1;
    v5->_resetReferences = 0;
    v5->_references = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    [(HMIVideoFrameSelector *)v5 setSampleRate:3.0];
  }
  return v5;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_enabled)
  {
    if (self->_resetReferences)
    {
      self->_resetReferences = 0;
      CFArrayRemoveAllValues(self->_references);
    }
    CMTime referenceInterval = (CMTime)self->_referenceInterval;
    unint64_t maxReferences = self->_maxReferences;
    os_unfair_lock_unlock(p_lock);
    memset(&v17, 0, sizeof(v17));
    CMSampleBufferGetPresentationTimeStamp(&v17, a3);
    v7 = [(HMIVideoFrameSelector *)self delegate];
    if (CFArrayGetCount(self->_references) < 1) {
      goto LABEL_7;
    }
    ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(self->_references, 0);
    memset(&v23, 0, 24);
    CMSampleBufferGetPresentationTimeStamp(&v23.start, ValueAtIndex);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v23.start.value;
    lhs.start.epoch = v23.start.epoch;
    CMTime rhs = (CMTime)self->_targetInterval;
    CMTimeAdd(&time2, &lhs.start, &rhs);
    lhs.start = v17;
    if (CMTimeCompare(&lhs.start, &time2) < 0)
    {
LABEL_7:
      CFTypeRef v9 = 0;
    }
    else
    {
      CFTypeRef v9 = CFRetain(ValueAtIndex);
      CFArrayRemoveValueAtIndex(self->_references, 0);
    }
    memset(&v23, 0, sizeof(v23));
    HMICMSampleBufferGetPresentationTimeRange(a3, &v23);
    memset(&rhs, 0, sizeof(rhs));
    CMTimeRange lhs = v23;
    CMTimeRangeGetEnd(&v21, &lhs);
    lhs.start = referenceInterval;
    uint64_t v10 = CMTimeDivide();
    lhs.start = rhs;
    long long v15 = *MEMORY[0x263F010E0];
    *(_OWORD *)&v19.value = *MEMORY[0x263F010E0];
    CMTimeEpoch v11 = *(void *)(MEMORY[0x263F010E0] + 16);
    v19.epoch = v11;
    uint64_t v12 = v10 - (CMTimeCompare(&lhs.start, &v19) == 0);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v23.start.value;
    lhs.start.epoch = v23.start.epoch;
    CMTime v19 = referenceInterval;
    if (CMTimeDivide() < v12
      || (lhs.start = rhs, *(_OWORD *)&v19.value = v15, v19.epoch = v11, !CMTimeCompare(&lhs.start, &v19)))
    {
      v13 = (const void *)objc_msgSend(v7, "frameSelector:prepareFrame:", self, a3, v15);
      if (v13)
      {
        v14 = v13;
        CFArrayAppendValue(self->_references, v13);
        CFRelease(v14);
      }
    }
    while (CFArrayGetCount(self->_references) > maxReferences)
      CFArrayRemoveValueAtIndex(self->_references, 0);
    if (v9)
    {
      [v7 frameSelector:self didSelectFrame:a3 reference:v9];
      CFRelease(v9);
    }
    else
    {
      [v7 frameSelector:self didSkipFrame:a3];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)flush
{
}

- (void)dealloc
{
  CFRelease(self->_references);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoFrameSelector;
  [(HMIVideoFrameSelector *)&v3 dealloc];
}

- (void)setSampleRate:(double)a3
{
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&time1, 1.0 / a3, 1000000);
  CMTimeMake(&time2, 86400, 1);
  CMTimeMinimum(&v13, &time1, &time2);
  os_unfair_lock_lock_with_options();
  p_CMTime referenceInterval = &self->_referenceInterval;
  CMTime lhs = v13;
  CMTime rhs = (CMTime)self->_referenceInterval;
  self->_resetReferences = CMTimeCompare(&lhs, &rhs) > 0;
  self->_CMTime referenceInterval = ($95D729B680665BEAEFA1D6FCA8238556)v13;
  self->_enabled = a3 > 0.0;
  CMTime lhs = (CMTime)self->_targetInterval;
  CMTime rhs = (CMTime)self->_referenceInterval;
  CMTimeAdd(&v8, &lhs, &rhs);
  CMTime lhs = (CMTime)self->_referenceInterval;
  if (CMTimeDivide() <= 14)
  {
    CMTime lhs = (CMTime)self->_targetInterval;
    *(_OWORD *)&rhs.value = *(_OWORD *)&p_referenceInterval->value;
    rhs.epoch = self->_referenceInterval.epoch;
    CMTimeAdd(&v7, &lhs, &rhs);
    *(_OWORD *)&lhs.value = *(_OWORD *)&p_referenceInterval->value;
    lhs.epoch = self->_referenceInterval.epoch;
    unint64_t v6 = CMTimeDivide() + 1;
  }
  else
  {
    unint64_t v6 = 15;
  }
  self->_unint64_t maxReferences = v6;
  os_unfair_lock_unlock(&self->_lock);
}

- (HMIVideoFrameSelectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoFrameSelectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetInterval
{
  objc_copyStruct(retstr, &self->_targetInterval, 24, 1, 0);
  return result;
}

- (__CFArray)references
{
  return self->_references;
}

- (unint64_t)maxReferences
{
  return self->_maxReferences;
}

- (void)setMaxReferences:(unint64_t)a3
{
  self->_unint64_t maxReferences = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)resetReferences
{
  return self->_resetReferences;
}

- (void)setResetReferences:(BOOL)a3
{
  self->_resetReferences = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceInterval
{
  objc_copyStruct(retstr, &self->_referenceInterval, 24, 1, 0);
  return result;
}

- (void)setReferenceInterval:(id *)a3
{
}

- (void).cxx_destruct
{
}

@end