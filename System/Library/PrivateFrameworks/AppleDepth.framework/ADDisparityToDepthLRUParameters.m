@interface ADDisparityToDepthLRUParameters
- (ADDisparityToDepthLRUParameters)init;
- (float)threshold;
- (unint64_t)capacity;
- (void)setCapacity:(unint64_t)a3;
- (void)setThreshold:(float)a3;
@end

@implementation ADDisparityToDepthLRUParameters

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (ADDisparityToDepthLRUParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADDisparityToDepthLRUParameters;
  result = [(ADDisparityToDepthLRUParameters *)&v3 init];
  if (result)
  {
    result->_capacity = 900;
    result->_threshold = 0.1;
  }
  return result;
}

@end