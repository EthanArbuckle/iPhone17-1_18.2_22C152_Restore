@interface NSHTTPCookieInternal_Data
- (HTTPCookie)_inner;
- (NSHTTPCookieInternal_Data)init;
- (id)_initWithCookie:(id)a3 partition:(id)a4;
- (id)_initWithCookie:(id)a3 partition:(id)a4 accessTime:(double)a5;
- (id)_initWithHeader:(const CompactCookieHeader *)a3;
- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4;
- (void)dealloc;
@end

@implementation NSHTTPCookieInternal_Data

- (HTTPCookie)_inner
{
  return (HTTPCookie *)self->_fromData;
}

- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4
{
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)NSHTTPCookieInternal_Data;
    v6 = [(NSHTTPCookieInternal *)&v13 init];
    if (v6)
    {
      v7 = (void *)[a3 mutableCopy];
      if (!a4 && [a3 objectForKey:0x1EC0A19A8]) {
        [v7 setObject:0 forKeyedSubscript:0x1EC0A19A8];
      }
      uint64_t v8 = [a3 objectForKeyedSubscript:@"Domain"];
      if (v8)
      {
        v9 = (void *)v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 hasPrefix:@"."]) {
          uint64_t v10 = MEMORY[0x1E4F1CC28];
        }
        else {
          uint64_t v10 = MEMORY[0x1E4F1CC38];
        }
        [v7 setObject:v10 forKeyedSubscript:0x1EC0A19A8];
      }
      id v11 = v7;
      operator new();
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  fromData = self->_fromData;
  if (fromData)
  {
    (*((void (**)(CompactHTTPCookieWithData *, SEL))fromData->var0 + 1))(fromData, a2);
    self->_fromData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSHTTPCookieInternal_Data;
  [(NSHTTPCookieInternal_Data *)&v4 dealloc];
}

- (id)_initWithHeader:(const CompactCookieHeader *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NSHTTPCookieInternal_Data;
  if ([(NSHTTPCookieInternal *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (id)_initWithCookie:(id)a3 partition:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NSHTTPCookieInternal_Data;
  if ([(NSHTTPCookieInternal *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (id)_initWithCookie:(id)a3 partition:(id)a4 accessTime:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookieInternal_Data;
  if ([(NSHTTPCookieInternal *)&v6 init]) {
    operator new();
  }
  return 0;
}

- (NSHTTPCookieInternal_Data)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieInternal_Data;
  return [(NSHTTPCookieInternal *)&v3 init];
}

@end