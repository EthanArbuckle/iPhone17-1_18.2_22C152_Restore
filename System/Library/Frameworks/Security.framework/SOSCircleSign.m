@interface SOSCircleSign
@end

@implementation SOSCircleSign

__CFData *__SOSCircleSign_block_invoke(uint64_t a1, uint64_t a2, const uint8_t *a3)
{
  SOSCircleHashGenAndPeers(*(void *)(a1 + 40), *(const __CFNumber **)(*(void *)(a1 + 48) + 24), *(const __CFSet **)(*(void *)(a1 + 48) + 32), (uint64_t)a3, *(void *)(a1 + 56));
  result = SecKeyCopyRawHashSignature(*(size_t **)(a1 + 40), a3, *(__SecKey **)(a1 + 64), *(__CFString ***)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end