@interface _MKMultiPartStringComponent
- (NSAttributedString)attributedString;
- (_MKMultiPartStringComponent)initWithAttributedString:(id)a3 range:(_NSRange)a4;
- (_NSRange)originalRange;
- (_NSRange)range;
- (id)description;
- (void)setRange:(_NSRange)a3;
@end

@implementation _MKMultiPartStringComponent

- (_MKMultiPartStringComponent)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKMultiPartStringComponent;
  v8 = [(_MKMultiPartStringComponent *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_originalRange.NSUInteger location = location;
    v8->_originalRange.NSUInteger length = length;
    v8->_range = v8->_originalRange;
    uint64_t v10 = [v7 copy];
    attributedString = v9->_attributedString;
    v9->_attributedString = (NSAttributedString *)v10;
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  attributedString = self->_attributedString;
  v6 = NSStringFromRange(self->_originalRange);
  id v7 = NSStringFromRange(self->_range);
  v8 = [v3 stringWithFormat:@"<_%@: %p \n%@\noriginalRange = %@\ncurrentRange = %@\n>", v4, self, attributedString, v6, v7];

  return v8;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (_NSRange)originalRange
{
  NSUInteger length = self->_originalRange.length;
  NSUInteger location = self->_originalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
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

- (void).cxx_destruct
{
}

@end