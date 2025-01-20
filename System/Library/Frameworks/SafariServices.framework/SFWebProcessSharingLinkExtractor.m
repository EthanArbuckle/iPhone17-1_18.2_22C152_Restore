@interface SFWebProcessSharingLinkExtractor
@end

@implementation SFWebProcessSharingLinkExtractor

void __56___SFWebProcessSharingLinkExtractor__extractSharingLink__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_extractCanonicalLinkWithInjectedObject:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _extractDominantIFrameWithInjectedObject:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __56___SFWebProcessSharingLinkExtractor__extractSharingLink__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _extractCanonicalLinkWithInjectedObject:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end