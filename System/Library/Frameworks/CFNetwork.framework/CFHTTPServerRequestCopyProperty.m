@interface CFHTTPServerRequestCopyProperty
@end

@implementation CFHTTPServerRequestCopyProperty

CFStringRef ___CFHTTPServerRequestCopyProperty_block_invoke(uint64_t a1, HTTPServerRequest *this)
{
  CFStringRef result = HTTPServerRequest::copyProperty(this, *(CFStringRef *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end