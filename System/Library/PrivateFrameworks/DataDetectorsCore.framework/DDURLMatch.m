@interface DDURLMatch
- (DDURLMatch)initWithRange:(_NSRange)a3 url:(id)a4;
- (_NSRange)range;
- (id)description;
- (id)url;
- (int64_t)compare:(id)a3;
- (void)dealloc;
@end

@implementation DDURLMatch

- (id)description
{
  return (id)[NSString stringWithFormat:@"<DDURLMatch>: url <%@>, range %@", self->_url, NSStringFromRange(self->_range)];
}

- (int64_t)compare:(id)a3
{
  unint64_t v4 = [a3 range];
  NSUInteger location = self->_range.location;
  BOOL v7 = location > v4;
  if (location == v4) {
    BOOL v7 = self->_range.length > v5;
  }
  if (v7) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)url
{
  return self->_url;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DDURLMatch;
  [(DDURLMatch *)&v3 dealloc];
}

- (DDURLMatch)initWithRange:(_NSRange)a3 url:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)DDURLMatch;
  BOOL v7 = [(DDURLMatch *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
    v7->_url = (NSString *)[a4 copyWithZone:0];
  }
  return v8;
}

@end