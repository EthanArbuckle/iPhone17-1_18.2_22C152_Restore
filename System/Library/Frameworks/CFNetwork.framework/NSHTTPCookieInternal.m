@interface NSHTTPCookieInternal
- (BOOL)isEqual:(id)a3;
- (NSHTTPCookieInternal)init;
@end

@implementation NSHTTPCookieInternal

- (NSHTTPCookieInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieInternal;
  return [(NSHTTPCookieInternal *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = [(NSHTTPCookieInternal *)self _inner];
  uint64_t v5 = [a3 _inner];
  if (!(v4 | v5)) {
    return 1;
  }
  uint64_t v7 = v5;
  BOOL result = 0;
  if (v4 && v7)
  {
    v8 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 32);
    return v8(v4);
  }
  return result;
}

@end