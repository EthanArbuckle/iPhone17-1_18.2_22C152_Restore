@interface NSHTTPCookie
@end

@implementation NSHTTPCookie

id __62__NSHTTPCookie_AMSCookieProperties__ams_cookiesForProperties___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F18D28];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithProperties:v3];

  return v4;
}

uint64_t __62__NSHTTPCookie_AMSCookieProperties__ams_propertiesForCookies___block_invoke(uint64_t a1, void *a2)
{
  return [a2 properties];
}

uint64_t __83__NSHTTPCookie_AMSCookieProperties__ams_cookiesByMergingProperties_intoProperties___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isEquivalent:", *(void *)(a1 + 32));
}

@end