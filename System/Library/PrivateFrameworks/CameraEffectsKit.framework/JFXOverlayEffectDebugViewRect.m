@interface JFXOverlayEffectDebugViewRect
- (BOOL)ignoreTransform;
- (CGRect)frame;
- (UIColor)borderColor;
- (double)borderWidth;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoreTransform:(BOOL)a3;
@end

@implementation JFXOverlayEffectDebugViewRect

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (BOOL)ignoreTransform
{
  return self->_ignoreTransform;
}

- (void)setIgnoreTransform:(BOOL)a3
{
  self->_ignoreTransform = a3;
}

- (void).cxx_destruct
{
}

@end