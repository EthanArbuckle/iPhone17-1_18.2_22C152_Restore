@interface CFHTTPServerSetDispatchQueue
@end

@implementation CFHTTPServerSetDispatchQueue

void ___CFHTTPServerSetDispatchQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  HTTPServerBase::schedule(a2 + 8, *(NSObject **)(a1 + 32));
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

@end