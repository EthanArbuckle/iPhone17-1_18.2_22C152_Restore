@interface _SpacingView
- (CGSize)intrinsicContentSize;
- (CGSize)spacingSize;
- (_SpacingView)initWithWidth:(double)a3 height:(double)a4;
@end

@implementation _SpacingView

- (_SpacingView)initWithWidth:(double)a3 height:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SpacingView;
  result = -[_SpacingView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, a3, a4);
  if (result)
  {
    result->_spacingSize.width = a3;
    result->_spacingSize.height = a4;
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_spacingSize.width;
  double height = self->_spacingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)spacingSize
{
  objc_copyStruct(v4, &self->_spacingSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

@end