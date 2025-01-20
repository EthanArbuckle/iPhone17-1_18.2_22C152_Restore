@interface WKUITextSelectionRect
+ (id)selectionRectWithCGRect:(CGRect)a3;
- (CGRect)rect;
- (WKUITextSelectionRect)initWithCGRect:(CGRect)a3;
@end

@implementation WKUITextSelectionRect

+ (id)selectionRectWithCGRect:(CGRect)a3
{
  v3 = -[WKUITextSelectionRect initWithCGRect:]([WKUITextSelectionRect alloc], "initWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return v3;
}

- (WKUITextSelectionRect)initWithCGRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)WKUITextSelectionRect;
  result = [(WKUITextSelectionRect *)&v8 init];
  if (result)
  {
    result->_selectionRect.origin.CGFloat x = x;
    result->_selectionRect.origin.CGFloat y = y;
    result->_selectionRect.size.CGFloat width = width;
    result->_selectionRect.size.CGFloat height = height;
  }
  return result;
}

- (CGRect)rect
{
  double x = self->_selectionRect.origin.x;
  double y = self->_selectionRect.origin.y;
  double width = self->_selectionRect.size.width;
  double height = self->_selectionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end