@interface EMTSpan
- (BOOL)doNotTranslate;
- (EMTSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4 doNotTranslate:(BOOL)a5;
- (NSString)identifier;
- (_NSRange)range;
@end

@implementation EMTSpan

- (EMTSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4 doNotTranslate:(BOOL)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EMTSpan;
  v11 = [(EMTSpan *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_range.NSUInteger location = location;
    v12->_range.NSUInteger length = length;
    v12->_doNotTranslate = a5;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)doNotTranslate
{
  return self->_doNotTranslate;
}

- (void).cxx_destruct
{
}

@end