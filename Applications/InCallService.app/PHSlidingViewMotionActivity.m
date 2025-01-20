@interface PHSlidingViewMotionActivity
- (BOOL)isMounted;
- (PHSlidingViewMotionActivity)initWithIsMounted:(BOOL)a3 probability:(double)a4;
- (double)mountedProbability;
- (void)setIsMounted:(BOOL)a3;
- (void)setMountedProbability:(double)a3;
@end

@implementation PHSlidingViewMotionActivity

- (PHSlidingViewMotionActivity)initWithIsMounted:(BOOL)a3 probability:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHSlidingViewMotionActivity;
  result = [(PHSlidingViewMotionActivity *)&v7 init];
  if (result)
  {
    result->_isMounted = a3;
    result->_mountedProbability = a4;
  }
  return result;
}

- (BOOL)isMounted
{
  return self->_isMounted;
}

- (void)setIsMounted:(BOOL)a3
{
  self->_isMounted = a3;
}

- (double)mountedProbability
{
  return self->_mountedProbability;
}

- (void)setMountedProbability:(double)a3
{
  self->_mountedProbability = a3;
}

@end