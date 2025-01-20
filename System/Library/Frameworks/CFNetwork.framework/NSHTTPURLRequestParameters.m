@interface NSHTTPURLRequestParameters
- (NSHTTPURLRequestParameters)init;
- (NSHTTPURLRequestParameters)initWithCoder:(id)a3;
- (void)dealloc;
@end

@implementation NSHTTPURLRequestParameters

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLRequestParameters;
  [(NSHTTPURLRequestParameters *)&v3 dealloc];
}

- (NSHTTPURLRequestParameters)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSHTTPURLRequestParameters;
  v4 = [(NSHTTPURLRequestParameters *)&v9 init];
  if (v4)
  {
    int v8 = 0;
    [a3 decodeValueOfObjCType:"i" at:&v8 size:4];
    if (v8 >= 2)
    {
      v4->method = (NSString *)(id)[a3 decodeObject];
      v4->fields = (NSMutableDictionary *)(id)[a3 decodeObject];
      v4->extraCookies = (NSArray *)(id)[a3 decodeObject];
      v4->data = (NSData *)(id)[a3 decodeObject];
      int v7 = 0;
      [a3 decodeValueOfObjCType:"i" at:&v7 size:4];
      v4->pageNotFoundCacheLifetime = v7;
      [a3 decodeValueOfObjCType:"B" at:&v4->shouldHandleCookies size:1];
      if (v8 == 3)
      {
        char v6 = 0;
        [a3 decodeValueOfObjCType:"B" at:&v6 size:1];
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (NSHTTPURLRequestParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLRequestParameters;
  result = [(NSHTTPURLRequestParameters *)&v3 init];
  if (result) {
    result->shouldHandleCookies = 1;
  }
  return result;
}

@end