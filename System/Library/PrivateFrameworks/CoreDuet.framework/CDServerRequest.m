@interface CDServerRequest
@end

@implementation CDServerRequest

uint64_t __82___CDServerRequest__requestForMethod_URI_queryItems_headers_body_timeoutInterval___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

@end