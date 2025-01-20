@interface AXSpeakingRange
- (AXUIElement)element;
- (_NSRange)range;
- (id)description;
- (void)setElement:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation AXSpeakingRange

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)AXSpeakingRange;
  v3 = [(AXSpeakingRange *)&v8 description];
  v4 = [(AXSpeakingRange *)self element];
  v10.location = (NSUInteger)[(AXSpeakingRange *)self range];
  v5 = NSStringFromRange(v10);
  v6 = [v3 stringByAppendingFormat:@" - %@, %@", v4, v5];

  return v6;
}

- (AXUIElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
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

- (void).cxx_destruct
{
}

@end