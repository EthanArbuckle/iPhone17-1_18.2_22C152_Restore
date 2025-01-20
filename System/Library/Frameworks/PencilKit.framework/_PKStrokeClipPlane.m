@interface _PKStrokeClipPlane
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClipPlane:(id)a3;
- (CGPoint)normal;
- (CGPoint)origin;
- (_PKStrokeClipPlane)initWithOrigin:(CGPoint)a3 normal:(CGPoint)a4;
- (double)distanceToPoint:(CGPoint)a3;
@end

@implementation _PKStrokeClipPlane

- (_PKStrokeClipPlane)initWithOrigin:(CGPoint)a3 normal:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_PKStrokeClipPlane;
  result = [(_PKStrokeClipPlane *)&v9 init];
  if (result)
  {
    result->_origin.CGFloat x = v7;
    result->_origin.CGFloat y = v6;
    result->_normal.CGFloat x = x;
    result->_normal.CGFloat y = y;
  }
  return result;
}

- (double)distanceToPoint:(CGPoint)a3
{
  return (a3.y - self->_origin.y) * self->_normal.y + (a3.x - self->_origin.x) * self->_normal.x;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_PKStrokeClipPlane *)self isEqualToClipPlane:v4];

  return v5;
}

- (BOOL)isEqualToClipPlane:(id)a3
{
  id v4 = (char *)a3;
  if (v4
    && (float64x2_t v5 = (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL),
        int32x2_t v6 = vmovn_s64(vcgtq_f64(v5, vabdq_f64((float64x2_t)self->_origin, *(float64x2_t *)(v4 + 8)))),
        (v6.i32[0] & v6.i32[1] & 1) != 0))
  {
    int32x2_t v7 = vmovn_s64(vcgtq_f64(v5, vabdq_f64((float64x2_t)self->_normal, *(float64x2_t *)(v4 + 24))));
    char v8 = v7.i8[0] & v7.i8[4];
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)normal
{
  double x = self->_normal.x;
  double y = self->_normal.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end