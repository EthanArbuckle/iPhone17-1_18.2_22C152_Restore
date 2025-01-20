@interface NLDataInstanceLocator
- (NLDataInstanceLocator)initWithInstanceIndex:(unint64_t)a3 rangeOfCharacters:(_NSRange)a4 rangeOfTokens:(_NSRange)a5;
- (_NSRange)rangeOfCharacters;
- (_NSRange)rangeOfTokens;
- (id)description;
- (unint64_t)instanceIndex;
@end

@implementation NLDataInstanceLocator

- (NLDataInstanceLocator)initWithInstanceIndex:(unint64_t)a3 rangeOfCharacters:(_NSRange)a4 rangeOfTokens:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)NLDataInstanceLocator;
  result = [(NLDataInstanceLocator *)&v11 init];
  if (result)
  {
    result->_instanceIndex = a3;
    result->_rangeOfCharacters.NSUInteger location = v8;
    result->_rangeOfCharacters.NSUInteger length = v7;
    result->_rangeOfTokens.NSUInteger location = location;
    result->_rangeOfTokens.NSUInteger length = length;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(NLDataInstanceLocator *)self instanceIndex];
  v10.NSUInteger location = [(NLDataInstanceLocator *)self rangeOfCharacters];
  v5 = NSStringFromRange(v10);
  v11.NSUInteger location = [(NLDataInstanceLocator *)self rangeOfTokens];
  v6 = NSStringFromRange(v11);
  NSUInteger v7 = [v3 stringWithFormat:@"%llu[%@/%@]", v4, v5, v6];

  return v7;
}

- (unint64_t)instanceIndex
{
  return self->_instanceIndex;
}

- (_NSRange)rangeOfCharacters
{
  NSUInteger length = self->_rangeOfCharacters.length;
  NSUInteger location = self->_rangeOfCharacters.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)rangeOfTokens
{
  NSUInteger length = self->_rangeOfTokens.length;
  NSUInteger location = self->_rangeOfTokens.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end