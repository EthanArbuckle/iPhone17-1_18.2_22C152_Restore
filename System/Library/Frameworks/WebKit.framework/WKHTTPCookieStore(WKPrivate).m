@interface WKHTTPCookieStore(WKPrivate)
- (uint64_t)_flushCookiesToDiskWithCompletionHandler:()WKPrivate;
- (uint64_t)_getCookiesForURL:()WKPrivate completionHandler:;
- (uint64_t)_setCookieAcceptPolicy:()WKPrivate completionHandler:;
@end

@implementation WKHTTPCookieStore(WKPrivate)

- (uint64_t)_getCookiesForURL:()WKPrivate completionHandler:
{
  uint64_t v2 = *(void *)(a1 + 8);
  id v3 = coreCookiesToNSCookies(a2);
  v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

- (uint64_t)_setCookieAcceptPolicy:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_flushCookiesToDiskWithCompletionHandler:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

@end