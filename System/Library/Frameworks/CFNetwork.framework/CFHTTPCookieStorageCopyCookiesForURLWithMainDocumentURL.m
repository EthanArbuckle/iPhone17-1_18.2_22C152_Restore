@interface CFHTTPCookieStorageCopyCookiesForURLWithMainDocumentURL
@end

@implementation CFHTTPCookieStorageCopyCookiesForURLWithMainDocumentURL

intptr_t ___CFHTTPCookieStorageCopyCookiesForURLWithMainDocumentURL_block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

@end