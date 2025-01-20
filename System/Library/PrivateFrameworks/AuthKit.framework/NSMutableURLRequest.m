@interface NSMutableURLRequest
@end

@implementation NSMutableURLRequest

uint64_t __64__NSMutableURLRequest_AuthKit__ak_addProxiedAttestationHeaders___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

@end