@interface NSMutableStringProxyForMutableAttributedString
- (NSMutableStringProxyForMutableAttributedString)initWithMutableAttributedString:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
@end

@implementation NSMutableStringProxyForMutableAttributedString

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMutableStringProxyForMutableAttributedString;
  [(NSMutableStringProxyForMutableAttributedString *)&v3 dealloc];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7 = [(NSAttributedString *)self->mutableAttributedString string];

  -[NSString getCharacters:range:](v7, "getCharacters:range:", a3, location, length);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
}

- (unint64_t)length
{
  v2 = [(NSAttributedString *)self->mutableAttributedString string];

  return [(NSString *)v2 length];
}

- (NSMutableStringProxyForMutableAttributedString)initWithMutableAttributedString:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSMutableStringProxyForMutableAttributedString;
  uint64_t v4 = [(NSString *)&v6 init];
  if (v4) {
    v4->mutableAttributedString = (NSMutableAttributedString *)a3;
  }
  return v4;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(NSAttributedString *)self->mutableAttributedString string];

  return [(NSString *)v4 characterAtIndex:a3];
}

@end