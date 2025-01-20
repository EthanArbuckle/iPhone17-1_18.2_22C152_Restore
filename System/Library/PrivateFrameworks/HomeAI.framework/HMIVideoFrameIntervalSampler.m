@interface HMIVideoFrameIntervalSampler
- (HMIVideoFrameIntervalSampler)initWithFrameRate:(float)a3;
- (HMIVideoFrameIntervalSampler)initWithInterval:(id *)a3;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation HMIVideoFrameIntervalSampler

- (HMIVideoFrameIntervalSampler)initWithFrameRate:(float)a3
{
  CMTimeMakeWithSeconds(&v5, (float)(1.0 / a3), 1000);
  return [(HMIVideoFrameIntervalSampler *)self initWithInterval:&v5];
}

- (HMIVideoFrameIntervalSampler)initWithInterval:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMIVideoFrameIntervalSampler;
  result = [(HMIVideoFrameIntervalSampler *)&v7 init];
  if (result)
  {
    int64_t var3 = a3->var3;
    *(_OWORD *)&result->_interval.value = *(_OWORD *)&a3->var0;
    result->_interval.epoch = var3;
    v6 = (_OWORD *)MEMORY[0x263F01090];
    result->_firstPTS.epoch = *(void *)(MEMORY[0x263F01090] + 16);
    *(_OWORD *)&result->_firstPTS.value = *v6;
    result->_lastIndex = -1;
  }
  return result;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  memset(&v14, 0, sizeof(v14));
  CMSampleBufferGetPresentationTimeStamp(&v14, a3);
  if ((v14.flags & 1) == 0)
  {
    id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Sample buffer has an invalid PTS." userInfo:0];
    objc_exception_throw(v10);
  }
  p_firstPTS = &self->_firstPTS;
  if ((self->_firstPTS.flags & 1) == 0)
  {
    *(_OWORD *)&p_firstPTS->value = *(_OWORD *)&v14.value;
    self->_firstPTS.epoch = v14.epoch;
  }
  CMTime lhs = v14;
  *(_OWORD *)&v11.value = *(_OWORD *)&p_firstPTS->value;
  v11.epoch = self->_firstPTS.epoch;
  CMTimeSubtract(&v13, &lhs, &v11);
  CMTime lhs = (CMTime)self->_interval;
  int64_t v6 = CMTimeDivide();
  int64_t lastIndex = self->_lastIndex;
  v8 = [(HMIVideoFrameSampler *)self delegate];
  v9 = v8;
  if (v6 <= lastIndex)
  {
    if (objc_opt_respondsToSelector()) {
      [v9 frameSampler:self didDropFrame:a3];
    }
  }
  else
  {
    [v8 frameSampler:self didSampleFrame:a3];

    self->_int64_t lastIndex = v6;
  }
}

@end