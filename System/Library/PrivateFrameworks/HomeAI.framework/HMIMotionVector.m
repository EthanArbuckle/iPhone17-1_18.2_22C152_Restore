@interface HMIMotionVector
- (CGPoint)midpoint;
- (CGPoint)origin;
- (CGPoint)target;
- (CGRect)boundingBox;
- (CGVector)motion;
- (Class)eventClass;
- (HMIMotionVector)initWithOrigin:(CGPoint)a3 motion:(CGVector)a4;
- (double)distance;
- (void)setEventClass:(Class)a3;
@end

@implementation HMIMotionVector

- (HMIMotionVector)initWithOrigin:(CGPoint)a3 motion:(CGVector)a4
{
  CGFloat dy = a4.dy;
  CGFloat dx = a4.dx;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)HMIMotionVector;
  v8 = [(HMIMotionVector *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_origin.CGFloat x = x;
    v8->_origin.CGFloat y = y;
    v8->_motion.CGFloat dx = dx;
    v8->_motion.CGFloat dy = dy;
    Class eventClass = v8->_eventClass;
    v8->_Class eventClass = 0;
  }
  return v9;
}

- (CGPoint)target
{
  double v2 = self->_origin.x + self->_motion.dx;
  double v3 = self->_origin.y + self->_motion.dy;
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)midpoint
{
  __asm { FMOV            V2.2D, #0.5 }
  float64x2_t v7 = vaddq_f64((float64x2_t)self->_origin, vmulq_f64((float64x2_t)self->_motion, _Q2));
  double v8 = v7.f64[1];
  result.CGFloat x = v7.f64[0];
  result.CGFloat y = v8;
  return result;
}

- (double)distance
{
  return hypot(self->_motion.dx, self->_motion.dy);
}

- (CGRect)boundingBox
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  [(HMIMotionVector *)self target];
  double v5 = v4 - x;
  double v7 = v6 - y;
  double v8 = x;
  double v9 = y;
  return CGRectStandardize(*(CGRect *)&v8);
}

- (CGPoint)origin
{
  objc_copyStruct(v4, &self->_origin, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGVector)motion
{
  objc_copyStruct(v4, &self->_motion, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat dy = v3;
  result.CGFloat dx = v2;
  return result;
}

- (Class)eventClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventClass:(Class)a3
{
}

- (void).cxx_destruct
{
}

@end