@interface PKInkAnimationDescriptor
- (PKInkAnimationDescriptor)initWithDuration:(double)a3 sizeDelta:(double)a4;
- (double)duration;
- (double)sizeDelta;
- (id)mutableCopy;
- (void)setDuration:(double)a3;
- (void)setSizeDelta:(double)a3;
@end

@implementation PKInkAnimationDescriptor

- (PKInkAnimationDescriptor)initWithDuration:(double)a3 sizeDelta:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKInkAnimationDescriptor;
  result = [(PKInkAnimationDescriptor *)&v7 init];
  if (result)
  {
    result->_duration = a3;
    result->_sizeDelta = a4;
  }
  return result;
}

- (id)mutableCopy
{
  v3 = [PKInkAnimationDescriptor alloc];
  double duration = self->_duration;
  double sizeDelta = self->_sizeDelta;

  return [(PKInkAnimationDescriptor *)v3 initWithDuration:duration sizeDelta:sizeDelta];
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (double)sizeDelta
{
  return self->_sizeDelta;
}

- (void)setSizeDelta:(double)a3
{
  self->_double sizeDelta = a3;
}

@end