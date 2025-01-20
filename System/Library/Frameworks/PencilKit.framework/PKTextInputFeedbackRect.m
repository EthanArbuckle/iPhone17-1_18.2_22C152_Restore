@interface PKTextInputFeedbackRect
+ (PKTextInputFeedbackRect)rectWithFrame:(CGFloat)a3;
- (CGRect)rect;
@end

@implementation PKTextInputFeedbackRect

+ (PKTextInputFeedbackRect)rectWithFrame:(CGFloat)a3
{
  self;
  v8 = objc_alloc_init(PKTextInputFeedbackRect);
  v8->_rect.origin.x = a1;
  v8->_rect.origin.y = a2;
  v8->_rect.size.width = a3;
  v8->_rect.size.height = a4;

  return v8;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end