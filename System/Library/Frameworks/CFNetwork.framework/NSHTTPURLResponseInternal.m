@interface NSHTTPURLResponseInternal
- (NSHTTPURLResponseInternal)initWithCoder:(id)a3;
- (void)dealloc;
@end

@implementation NSHTTPURLResponseInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLResponseInternal;
  [(NSHTTPURLResponseInternal *)&v3 dealloc];
}

- (NSHTTPURLResponseInternal)initWithCoder:(id)a3
{
  CFDictionaryRef v5 = (const __CFDictionary *)[a3 decodeObject];
  int v8 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v8 size:4];
  ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(0, v8, 0, @"HTTP/1.1");
  if (v5 && [(__CFDictionary *)v5 count]) {
    _CFHTTPMessageSetMultipleHeaderFields((__CFHTTPMessage *)ResponseNoParser, v5);
  }

  return (NSHTTPURLResponseInternal *)ResponseNoParser;
}

@end