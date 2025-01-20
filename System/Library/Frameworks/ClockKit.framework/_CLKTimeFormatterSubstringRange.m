@interface _CLKTimeFormatterSubstringRange
+ (_CLKTimeFormatterSubstringRange)rangeWithRange:(_NSRange)a3;
- (_CLKTimeFormatterSubstringRange)initWithRange:(_NSRange)a3;
- (_NSRange)range;
- (id)substringFromString:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation _CLKTimeFormatterSubstringRange

+ (_CLKTimeFormatterSubstringRange)rangeWithRange:(_NSRange)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);

  return (_CLKTimeFormatterSubstringRange *)v3;
}

- (_CLKTimeFormatterSubstringRange)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)_CLKTimeFormatterSubstringRange;
  result = [(_CLKTimeFormatterSubstringRange *)&v6 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
  }
  return result;
}

- (id)substringFromString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v7 = self->_range.length + location, v7 > [v4 length]))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "substringWithRange:", self->_range.location, self->_range.length);
  }

  return v8;
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

@end