@interface NSString
+ (NSString)stringWithUnichar:(unsigned __int16)a3;
- (_NSRange)lineFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (_NSRange)paragraphFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (_NSRange)sentenceFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (_NSRange)wordFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (id)wordStringFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
@end

@implementation NSString

+ (NSString)stringWithUnichar:(unsigned __int16)a3
{
  unsigned __int16 v5 = a3;
  id v3 = [objc_allocWithZone((Class)NSString) initWithCharacters:&v5 length:1];

  return (NSString *)v3;
}

- (_NSRange)sentenceFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert();
  }

  id v7 = [(NSString *)self ax_sentenceFromPosition:a3 inDirection:a4 != 1];
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)paragraphFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert();
  }

  id v7 = [(NSString *)self ax_paragraphFromPosition:a3 inDirection:a4 != 1];
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)lineFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert();
  }

  id v7 = [(NSString *)self ax_lineFromPosition:a3 inDirection:a4 != 1];
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)wordFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert();
  }

  id v7 = [(NSString *)self ax_wordFromPosition:a3 inDirection:a4 != 1];
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (id)wordStringFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2)
  {
    int64_t v10 = a4;
    _AXAssert();
  }
  id v8 = -[NSString ax_wordFromPosition:inDirection:](self, "ax_wordFromPosition:inDirection:", a3, a4 != 1, v10);

  return -[NSString substringWithRange:](self, "substringWithRange:", v8, v7);
}

@end