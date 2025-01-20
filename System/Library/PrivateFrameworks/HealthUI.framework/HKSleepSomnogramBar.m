@interface HKSleepSomnogramBar
- (CGRect)barRect;
- (HKSleepSomnogramBar)initWithBarRect:(CGRect)a3;
- (double)bottom;
- (double)horizontalMidpoint;
- (double)left;
- (double)right;
- (double)top;
@end

@implementation HKSleepSomnogramBar

- (HKSleepSomnogramBar)initWithBarRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)HKSleepSomnogramBar;
  result = [(HKSleepSomnogramBar *)&v8 init];
  if (result)
  {
    result->_barRect.origin.double y = y;
    result->_barRect.size.double width = width;
    result->_barRect.size.double height = height;
    result->_top = y;
    result->_bottom = y + height;
    result->_left = x;
    result->_right = x + width;
    result->_horizontalMidpoint = x + width * 0.5;
    result->_barRect.origin.CGFloat x = x;
  }
  return result;
}

- (CGRect)barRect
{
  double x = self->_barRect.origin.x;
  double y = self->_barRect.origin.y;
  double width = self->_barRect.size.width;
  double height = self->_barRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)top
{
  return self->_top;
}

- (double)bottom
{
  return self->_bottom;
}

- (double)left
{
  return self->_left;
}

- (double)right
{
  return self->_right;
}

- (double)horizontalMidpoint
{
  return self->_horizontalMidpoint;
}

@end