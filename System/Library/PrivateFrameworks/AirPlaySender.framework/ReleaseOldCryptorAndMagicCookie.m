@interface ReleaseOldCryptorAndMagicCookie
@end

@implementation ReleaseOldCryptorAndMagicCookie

uint64_t __audioHoseManagerBuffered_ReleaseOldCryptorAndMagicCookie_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseCryptors(v2, (uint64_t)&v5);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || (uint64_t v3 = *(void *)(a1 + 40),
        long long v5 = *(_OWORD *)(a1 + 48),
        uint64_t v6 = *(void *)(a1 + 64),
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseMagicCookies(v3, (uint64_t)&v5), uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), result))
  {
    return APSLogErrorAt();
  }
  return result;
}

@end