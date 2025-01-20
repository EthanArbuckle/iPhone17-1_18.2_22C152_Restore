@interface BRLTTokenRange
- (BRLTTokenRange)initWithRange:(_NSRange)a3 token:(int64_t)a4;
- (_NSRange)range;
- (int64_t)token;
- (void)setRange:(_NSRange)a3;
- (void)setToken:(int64_t)a3;
@end

@implementation BRLTTokenRange

- (BRLTTokenRange)initWithRange:(_NSRange)a3 token:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)BRLTTokenRange;
  result = [(BRLTTokenRange *)&v8 init];
  result->_range.NSUInteger location = location;
  result->_range.NSUInteger length = length;
  result->_token = a4;
  return result;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int64_t)token
{
  return self->_token;
}

- (void)setToken:(int64_t)a3
{
  self->_token = a3;
}

@end