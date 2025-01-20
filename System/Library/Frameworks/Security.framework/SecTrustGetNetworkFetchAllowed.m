@interface SecTrustGetNetworkFetchAllowed
@end

@implementation SecTrustGetNetworkFetchAllowed

__CFArray *__SecTrustGetNetworkFetchAllowed_block_invoke(uint64_t a1)
{
  result = SecTrustCopyOptionsFromPolicies(*(const __CFArray **)(*(void *)(a1 + 40) + 32));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end