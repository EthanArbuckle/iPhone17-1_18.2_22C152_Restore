@interface SecKeyCopyDigestForMessage
@end

@implementation SecKeyCopyDigestForMessage

__CFData *__SecKeyCopyDigestForMessage_block_invoke(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  CFDataGetLength(*(CFDataRef *)(a1 + 48));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  ccdigest();
  result = SecKeyRunAlgorithmAndCopyResult(*(uint64_t **)(a1 + 56), a3, *(const __CFData **)(a1 + 64), *(__CFString ***)(a1 + 72));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end