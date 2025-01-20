@interface CFURLCacheCopyResponseForRequest
@end

@implementation CFURLCacheCopyResponseForRequest

intptr_t ____CFURLCacheCopyResponseForRequest_block_invoke(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFTypeRef v3 = CFRetain(cf);
  }
  else {
    CFTypeRef v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

@end