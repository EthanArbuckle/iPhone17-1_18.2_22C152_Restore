@interface HMIVideoRetimer
- (HMIVideoRetimer)init;
- (HMIVideoRetimerDelegate)delegate;
- (void)dealloc;
- (void)flushWithNextSamplePTS:(id *)a3;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMIVideoRetimer

- (HMIVideoRetimer)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoRetimer;
  result = [(HMIVideoRetimer *)&v3 init];
  if (result) {
    result->_lastSample = 0;
  }
  return result;
}

- (void)dealloc
{
  lastSample = self->_lastSample;
  if (lastSample) {
    CFRelease(lastSample);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMIVideoRetimer;
  [(HMIVideoRetimer *)&v4 dealloc];
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (HMICMSampleBufferGetMediaType(a3) == 1986618469)
  {
    CMSampleBufferRef sampleBufferOut = 0;
    if (self->_lastSample)
    {
      memset(&v13, 0, sizeof(v13));
      CMSampleBufferGetPresentationTimeStamp(&v13, a3);
      memset(&v12, 0, sizeof(v12));
      CMSampleBufferGetPresentationTimeStamp(&v12, self->_lastSample);
      memset(&v11, 0, 24);
      v11.decodeTimeStamp = v12;
      v11.presentationTimeStamp = v12;
      CMTime lhs = v13;
      CMTime v9 = v12;
      CMTimeSubtract(&v11.duration, &lhs, &v9);
      CMSampleBufferCreateCopyWithNewTiming(0, self->_lastSample, 1, &v11, &sampleBufferOut);
      v5 = [(HMIVideoRetimer *)self delegate];
      [v5 retimer:self didRetimeSampleBuffer:sampleBufferOut];

      CFRelease(sampleBufferOut);
      CFRelease(self->_lastSample);
    }
    self->_lastSample = (opaqueCMSampleBuffer *)CFRetain(a3);
  }
  else
  {
    v6 = (HMIVideoRetimer *)_HMFPreconditionFailure();
    [(HMIVideoRetimer *)v6 flushWithNextSamplePTS:v8];
  }
}

- (void)flushWithNextSamplePTS:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  lastSample = self->_lastSample;
  if (lastSample)
  {
    memset(&v14, 0, sizeof(v14));
    CMSampleBufferGetPresentationTimeStamp(&v14, lastSample);
    time1.duration = v14;
    CMTime time2 = *(CMTime *)a3;
    if (CMTimeCompare(&time1.duration, &time2) <= 0)
    {
      *(_OWORD *)&time1.decodeTimeStamp.value = *(_OWORD *)&v14.value;
      *(_OWORD *)&time1.presentationTimeStamp.value = *(_OWORD *)&v14.value;
      *(_OWORD *)&time2.value = *(_OWORD *)&a3->var0;
      time1.decodeTimeStamp.epoch = v14.epoch;
      time1.presentationTimeStamp.epoch = v14.epoch;
      v11.epoch = v14.epoch;
      CMSampleBufferRef sampleBufferOut = 0;
      memset(&time1, 0, 24);
      time2.epoch = a3->var3;
      *(_OWORD *)&v11.value = *(_OWORD *)&v14.value;
      CMTimeSubtract(&time1.duration, &time2, &v11);
      CMSampleBufferCreateCopyWithNewTiming(0, self->_lastSample, 1, &time1, &sampleBufferOut);
      v10 = [(HMIVideoRetimer *)self delegate];
      [v10 retimer:self didRetimeSampleBuffer:sampleBufferOut];

      CFRelease(sampleBufferOut);
    }
    else
    {
      v6 = (void *)MEMORY[0x22A641C70]();
      SEL v7 = self;
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        CMTime v9 = HMFGetLogIdentifier();
        LODWORD(time1.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&time1.duration.value + 4) = (CMTimeValue)v9;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Dropping frame, lastSamplePTS > nextSamplePTS.", (uint8_t *)&time1, 0xCu);
      }
    }
    CFRelease(self->_lastSample);
    self->_lastSample = 0;
  }
}

- (HMIVideoRetimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoRetimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end