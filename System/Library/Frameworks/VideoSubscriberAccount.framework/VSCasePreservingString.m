@interface VSCasePreservingString
- (VSCasePreservingString)initWithString:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation VSCasePreservingString

- (VSCasePreservingString)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSCasePreservingString;
  v5 = [(VSCasePreservingString *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    underlyingString = v5->_underlyingString;
    v5->_underlyingString = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)length
{
  return [(NSString *)self->_underlyingString length];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_underlyingString characterAtIndex:a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (void).cxx_destruct
{
}

@end