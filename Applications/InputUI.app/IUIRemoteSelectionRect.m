@interface IUIRemoteSelectionRect
+ (id)rectWithCGRect:(CGRect)a3 isVertical:(BOOL)a4;
- (BOOL)isVertical;
- (CGRect)rect;
- (IUIRemoteSelectionRect)initWithCGRect:(CGRect)a3 isVertical:(BOOL)a4;
@end

@implementation IUIRemoteSelectionRect

- (IUIRemoteSelectionRect)initWithCGRect:(CGRect)a3 isVertical:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)IUIRemoteSelectionRect;
  result = [(IUIRemoteSelectionRect *)&v10 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
    result->_isVertical = a4;
  }
  return result;
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

- (BOOL)isVertical
{
  return self->_isVertical;
}

+ (id)rectWithCGRect:(CGRect)a3 isVertical:(BOOL)a4
{
  id v4 = [objc_alloc((Class)a1) initWithCGRect:a4 isVertical:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];

  return v4;
}

@end