@interface EMTAlternativeSelectionSpan
- (EMTAlternativeSelectionSpan)initWithSource:(_NSRange)a3 projection:(_NSRange)a4 alternatives:(id)a5;
- (NSArray)alternatives;
- (_NSRange)projection;
- (_NSRange)source;
@end

@implementation EMTAlternativeSelectionSpan

- (EMTAlternativeSelectionSpan)initWithSource:(_NSRange)a3 projection:(_NSRange)a4 alternatives:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v8 = a3.length;
  NSUInteger v9 = a3.location;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMTAlternativeSelectionSpan;
  v12 = [(EMTAlternativeSelectionSpan *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_source.NSUInteger location = v9;
    v12->_source.NSUInteger length = v8;
    v12->_projection.NSUInteger location = location;
    v12->_projection.NSUInteger length = length;
    objc_storeStrong((id *)&v12->_alternatives, a5);
  }

  return v13;
}

- (_NSRange)source
{
  NSUInteger length = self->_source.length;
  NSUInteger location = self->_source.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)projection
{
  NSUInteger length = self->_projection.length;
  NSUInteger location = self->_projection.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void).cxx_destruct
{
}

@end