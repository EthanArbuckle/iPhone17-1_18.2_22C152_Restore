@interface SOSCircleCopyNextGenSignatureWithPeerAdded
@end

@implementation SOSCircleCopyNextGenSignatureWithPeerAdded

__CFData *__SOSCircleCopyNextGenSignatureWithPeerAdded_block_invoke(uint64_t a1, uint64_t a2, const uint8_t *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = *(const void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  MutableCopy = CFSetCreateMutableCopy(0, 0, *(CFSetRef *)(v6 + 32));
  CFSetAddValue(MutableCopy, v7);
  CFNumberRef v10 = sosGenerationCreateOrIncrement(*(const __CFNumber **)(v6 + 24));
  SOSCircleHashGenAndPeers(v5, v10, MutableCopy, (uint64_t)a3, v8);
  if (v10) {
    CFRelease(v10);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  result = SecKeyCopyRawHashSignature(*(size_t **)(a1 + 40), a3, *(__SecKey **)(a1 + 72), *(__CFString ***)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end