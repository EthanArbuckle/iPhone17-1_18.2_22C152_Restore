@interface ENUITextRange
+ (id)rangeWithRange:(_NSRange)a3;
- (BOOL)isEmpty;
- (_NSRange)range;
- (id)end;
- (id)start;
- (void)setRange:(_NSRange)a3;
@end

@implementation ENUITextRange

+ (id)rangeWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = objc_alloc_init(ENUITextRange);
  -[ENUITextRange setRange:](v5, "setRange:", location, length);

  return v5;
}

- (id)start
{
  return +[ENUITextPosition positionWithLocation:self->_range.location];
}

- (id)end
{
  return +[ENUITextPosition positionWithLocation:self->_range.length + self->_range.location];
}

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end