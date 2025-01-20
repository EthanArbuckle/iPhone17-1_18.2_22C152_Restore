@interface AppleIDAuthenticationCopyMyInfo
@end

@implementation AppleIDAuthenticationCopyMyInfo

intptr_t ___AppleIDAuthenticationCopyMyInfo_block_invoke(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = cf;
  if (a3 && *(void *)(a1 + 40))
  {
    CFRetain(a3);
    **(void **)(a1 + 40) = a3;
  }
  v6 = *(NSObject **)(a1 + 48);

  return dispatch_semaphore_signal(v6);
}

@end