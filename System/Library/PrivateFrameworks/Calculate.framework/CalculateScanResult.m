@interface CalculateScanResult
+ (id)resultWithRange:(_NSRange)a3;
- (CalculateScanResult)initWithRange:(_NSRange)a3;
- (_NSRange)range;
- (void)setRange:(_NSRange)a3;
@end

@implementation CalculateScanResult

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CalculateScanResult)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)CalculateScanResult;
  _NSRange result = [(CalculateScanResult *)&v6 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
  }
  return result;
}

+ (id)resultWithRange:(_NSRange)a3
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", a3.location, a3.length);
  return v3;
}

@end