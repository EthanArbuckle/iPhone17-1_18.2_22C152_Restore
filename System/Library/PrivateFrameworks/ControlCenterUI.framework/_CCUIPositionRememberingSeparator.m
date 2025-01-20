@interface _CCUIPositionRememberingSeparator
- (CGRect)cachedExpandedRect;
- (void)setCachedExpandedRect:(CGRect)a3;
@end

@implementation _CCUIPositionRememberingSeparator

- (CGRect)cachedExpandedRect
{
  double x = self->_cachedExpandedRect.origin.x;
  double y = self->_cachedExpandedRect.origin.y;
  double width = self->_cachedExpandedRect.size.width;
  double height = self->_cachedExpandedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->_cachedExpandedRect = a3;
}

@end