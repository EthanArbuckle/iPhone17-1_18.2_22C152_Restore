@interface _CUISubrangeData
- (_CUISubrangeData)initWithData:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation _CUISubrangeData

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUISubrangeData;
  [(_CUISubrangeData *)&v3 dealloc];
}

- (_CUISubrangeData)initWithData:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)_CUISubrangeData;
  v7 = [(_CUISubrangeData *)&v9 init];
  if (v7)
  {
    v7->_data = (NSData *)a3;
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
  }
  return v7;
}

- (const)bytes
{
  return (char *)[(NSData *)self->_data bytes] + self->_range.location;
}

- (unint64_t)length
{
  return self->_range.length;
}

@end