@interface BWDockKitFocusDetection
- (BWDockKitFocusDetection)initWithIdentifier:(int64_t)a3 rect:(CGRect)a4;
- (CGRect)rect;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)identifier;
- (void)setIdentifier:(int64_t)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation BWDockKitFocusDetection

- (BWDockKitFocusDetection)initWithIdentifier:(int64_t)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)BWDockKitFocusDetection;
  result = [(BWDockKitFocusDetection *)&v10 init];
  if (result)
  {
    result->_identifier = a3;
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(BWDockKitFocusDetection *)self identifier];
  [(BWDockKitFocusDetection *)self rect];
  return (id)objc_msgSend(v4, "initWithIdentifier:rect:", v5);
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
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

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

@end