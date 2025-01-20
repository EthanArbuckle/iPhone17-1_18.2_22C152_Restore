@interface VCIDRSchedulerStream
+ (id)schedulerStreamWithKeyFrameInterval:(unsigned int)a3 framerate:(unsigned int)a4 weightFactor:(unsigned int)a5;
- (VCIDRSchedulerStream)initWithKeyFrameInterval:(unsigned int)a3 framerate:(unsigned int)a4 weightFactor:(unsigned int)a5;
- (id)description;
- (int64_t)compareWeightFactor:(id)a3;
- (unsigned)framePosition;
- (unsigned)framerate;
- (unsigned)framesPerIdrPeriod;
- (unsigned)keyFrameInterval;
- (unsigned)weightFactor;
- (void)setFramePosition:(unsigned int)a3;
- (void)setFramerate:(unsigned int)a3;
- (void)setFramesPerIdrPeriod:(unsigned int)a3;
- (void)setKeyFrameInterval:(unsigned int)a3;
- (void)setWeightFactor:(unsigned int)a3;
@end

@implementation VCIDRSchedulerStream

+ (id)schedulerStreamWithKeyFrameInterval:(unsigned int)a3 framerate:(unsigned int)a4 weightFactor:(unsigned int)a5
{
  v5 = [[VCIDRSchedulerStream alloc] initWithKeyFrameInterval:*(void *)&a3 framerate:*(void *)&a4 weightFactor:*(void *)&a5];

  return v5;
}

- (VCIDRSchedulerStream)initWithKeyFrameInterval:(unsigned int)a3 framerate:(unsigned int)a4 weightFactor:(unsigned int)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCIDRSchedulerStream;
  result = [(VCIDRSchedulerStream *)&v9 init];
  if (result)
  {
    result->_keyFrameInterval = a3;
    result->_framerate = a4;
    result->_weightFactor = a5;
  }
  return result;
}

- (int64_t)compareWeightFactor:(id)a3
{
  unsigned int weightFactor = self->_weightFactor;
  if (weightFactor > [a3 weightFactor]) {
    return -1;
  }
  unsigned int v7 = self->_weightFactor;
  return v7 != [a3 weightFactor];
}

- (id)description
{
  id result = (id)[NSString stringWithFormat:@"Stream: KeyInterval=%d, framerate=%d, weightFactor:%d", self->_keyFrameInterval, self->_framerate, self->_weightFactor];
  if (self->_framesPerIdrPeriod) {
    return (id)objc_msgSend(result, "stringByAppendingFormat:", @" => FramesPerPeriod:%d FramePosition:%d", self->_framesPerIdrPeriod, self->_framePosition);
  }
  return result;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (unsigned)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unsigned int)a3
{
  self->_framerate = a3;
}

- (unsigned)weightFactor
{
  return self->_weightFactor;
}

- (void)setWeightFactor:(unsigned int)a3
{
  self->_unsigned int weightFactor = a3;
}

- (unsigned)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unsigned int)a3
{
  self->_framePosition = a3;
}

- (unsigned)framesPerIdrPeriod
{
  return self->_framesPerIdrPeriod;
}

- (void)setFramesPerIdrPeriod:(unsigned int)a3
{
  self->_framesPerIdrPeriod = a3;
}

@end