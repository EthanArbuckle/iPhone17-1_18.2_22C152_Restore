@interface _HKCFGNode
- (_HKCFGNode)initWithRangeOfString:(_NSRange)a3;
- (_NSRange)rangeOfString;
- (id)evaluate;
- (void)setRangeOfString:(_NSRange)a3;
@end

@implementation _HKCFGNode

- (_HKCFGNode)initWithRangeOfString:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)_HKCFGNode;
  result = [(_HKCFGNode *)&v6 init];
  if (result)
  {
    result->_rangeOfString.NSUInteger location = location;
    result->_rangeOfString.NSUInteger length = length;
  }
  return result;
}

- (_NSRange)rangeOfString
{
  NSUInteger length = self->_rangeOfString.length;
  NSUInteger location = self->_rangeOfString.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeOfString:(_NSRange)a3
{
  self->_rangeOfString = a3;
}

- (id)evaluate
{
  return 0;
}

@end