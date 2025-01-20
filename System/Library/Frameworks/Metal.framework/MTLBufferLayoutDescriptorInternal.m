@interface MTLBufferLayoutDescriptorInternal
- (BOOL)isStrideDynamic;
- (MTLBufferLayoutDescriptorInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)stepFunction;
- (unint64_t)stepRate;
- (unint64_t)stride;
- (void)setStepFunction:(unint64_t)a3;
- (void)setStepRate:(unint64_t)a3;
- (void)setStride:(unint64_t)a3;
@end

@implementation MTLBufferLayoutDescriptorInternal

- (MTLBufferLayoutDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLBufferLayoutDescriptorInternal;
  result = [(MTLBufferLayoutDescriptorInternal *)&v3 init];
  if (result)
  {
    result->_stride = 0;
    result->_stepFunction = 1;
    result->_instanceStepRate = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_stride;
  *((void *)result + 2) = self->_stepFunction;
  *((void *)result + 3) = self->_instanceStepRate;
  return result;
}

- (unint64_t)stride
{
  return self->_stride;
}

- (void)setStride:(unint64_t)a3
{
  self->_stride = a3;
}

- (BOOL)isStrideDynamic
{
  return [(MTLBufferLayoutDescriptorInternal *)self stride] == -1;
}

- (unint64_t)stepFunction
{
  return self->_stepFunction;
}

- (void)setStepFunction:(unint64_t)a3
{
  self->_stepFunction = a3;
}

- (unint64_t)stepRate
{
  return self->_instanceStepRate;
}

- (void)setStepRate:(unint64_t)a3
{
  self->_instanceStepRate = a3;
}

@end