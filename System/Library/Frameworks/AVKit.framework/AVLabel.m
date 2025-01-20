@interface AVLabel
- (CGRect)contentIntersection;
- (void)setContentIntersection:(CGRect)a3;
@end

@implementation AVLabel

- (CGRect)contentIntersection
{
  double x = self->_contentIntersection.origin.x;
  double y = self->_contentIntersection.origin.y;
  double width = self->_contentIntersection.size.width;
  double height = self->_contentIntersection.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.CGFloat x = x;
    p_contentIntersection->origin.CGFloat y = y;
    p_contentIntersection->size.CGFloat width = width;
    p_contentIntersection->size.CGFloat height = height;
    [(AVLabel *)self bounds];
    unint64_t v11 = (unint64_t)(COERCE__INT64(fabs(v9 * v10)) - 0x10000000000000) >> 53;
    BOOL v12 = COERCE__INT64(v9 * v10) < 0 || v11 > 0x3FE;
    BOOL v13 = v12 && (unint64_t)(COERCE__INT64(v9 * v10) - 1) > 0xFFFFFFFFFFFFELL;
    BOOL v14 = !v13 && p_contentIntersection->size.height * p_contentIntersection->size.width / (v9 * v10) > 0.8;
    if (self->_labelIsOverVideo != v14)
    {
      self->_labelIsOverVideo = v14;
      uint64_t v15 = 2 * self->_labelIsOverVideo;
      [(AVLabel *)self setOverrideUserInterfaceStyle:v15];
    }
  }
}

@end