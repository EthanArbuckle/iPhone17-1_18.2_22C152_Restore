@interface LSRemotePlaceholderEnumerator
@end

@implementation LSRemotePlaceholderEnumerator

BOOL __87___LSRemotePlaceholderEnumerator__applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke(uint64_t a1, uint64_t a2, LSContext *a3, uint64_t a4)
{
  int v7 = *(_DWORD *)(a4 + 168);
  if (v7 != [*(id *)(a1 + 32) bundleClass]) {
    return 0;
  }
  v8 = *(const LSBundleData **)(*(void *)(a1 + 32) + 96);

  return evaluateBundleNoIOCommon(a3, a4, v8);
}

@end