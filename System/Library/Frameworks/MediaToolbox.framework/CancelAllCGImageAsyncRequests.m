@interface CancelAllCGImageAsyncRequests
@end

@implementation CancelAllCGImageAsyncRequests

CFTypeRef __surrogateAIG_CancelAllCGImageAsyncRequests_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 40) + 24);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end