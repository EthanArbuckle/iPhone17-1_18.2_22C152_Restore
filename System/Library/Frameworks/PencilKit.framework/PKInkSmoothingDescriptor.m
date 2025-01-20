@interface PKInkSmoothingDescriptor
- (PKInkSmoothingDescriptor)initWithStylusSmoothing:(double)a3 touch:(double)a4 velocity:(double)a5 angle:(double)a6 radius:(double)a7;
- (double)angleSmoothing;
- (double)radiusSmoothing;
- (double)stylusSmoothing;
- (double)touchSmoothing;
- (double)velocitySmoothing;
- (id)mutableCopy;
@end

@implementation PKInkSmoothingDescriptor

- (PKInkSmoothingDescriptor)initWithStylusSmoothing:(double)a3 touch:(double)a4 velocity:(double)a5 angle:(double)a6 radius:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)PKInkSmoothingDescriptor;
  result = [(PKInkSmoothingDescriptor *)&v13 init];
  if (result)
  {
    result->_stylusSmoothing = a3;
    result->_touchSmoothing = a4;
    result->_velocitySmoothing = a5;
    result->_angleSmoothing = a6;
    result->_radiusSmoothing = a7;
  }
  return result;
}

- (id)mutableCopy
{
  v3 = [PKInkSmoothingDescriptor alloc];
  double stylusSmoothing = self->_stylusSmoothing;
  double touchSmoothing = self->_touchSmoothing;
  double velocitySmoothing = self->_velocitySmoothing;
  double angleSmoothing = self->_angleSmoothing;
  double radiusSmoothing = self->_radiusSmoothing;

  return [(PKInkSmoothingDescriptor *)v3 initWithStylusSmoothing:stylusSmoothing touch:touchSmoothing velocity:velocitySmoothing angle:angleSmoothing radius:radiusSmoothing];
}

- (double)stylusSmoothing
{
  return self->_stylusSmoothing;
}

- (double)touchSmoothing
{
  return self->_touchSmoothing;
}

- (double)velocitySmoothing
{
  return self->_velocitySmoothing;
}

- (double)angleSmoothing
{
  return self->_angleSmoothing;
}

- (double)radiusSmoothing
{
  return self->_radiusSmoothing;
}

@end