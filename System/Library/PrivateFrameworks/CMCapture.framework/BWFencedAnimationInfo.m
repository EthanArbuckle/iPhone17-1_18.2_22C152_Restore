@interface BWFencedAnimationInfo
- (BWFencedAnimationInfo)initWithFencePortSendRight:(id)a3;
- (FigCaptureMachPortSendRight)fencePortSendRight;
- (id)description;
- (int64_t)fencePortGenerationCount;
- (void)dealloc;
@end

@implementation BWFencedAnimationInfo

- (FigCaptureMachPortSendRight)fencePortSendRight
{
  return self->_fencePortSendRight;
}

- (int64_t)fencePortGenerationCount
{
  return self->_fencePortGenerationCount;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFencedAnimationInfo;
  [(BWFencedAnimationInfo *)&v3 dealloc];
}

- (BWFencedAnimationInfo)initWithFencePortSendRight:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWFencedAnimationInfo;
  v4 = [(BWFencedAnimationInfo *)&v7 init];
  if (v4)
  {
    v5 = (FigCaptureMachPortSendRight *)a3;
    v4->_fencePortSendRight = v5;
    if (v5) {
      v4->_fencePortGenerationCount = atomic_fetch_add_explicit(&sFencedAnimationFencePortGenerationCount, 1uLL, memory_order_relaxed)+ 1;
    }
  }
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"fencePort=%@, generationCount=%lld", self->_fencePortSendRight, self->_fencePortGenerationCount];
}

@end