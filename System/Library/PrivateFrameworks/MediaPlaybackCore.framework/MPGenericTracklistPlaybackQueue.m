@interface MPGenericTracklistPlaybackQueue
@end

@implementation MPGenericTracklistPlaybackQueue

void __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_4;
    v4[3] = &unk_2643C4988;
    v4[4] = *(void *)(a1 + 32);
    [v3 setUniversalStoreIdentifiersWithBlock:v4];
  }
}

uint64_t __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_6(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_7;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAdamID:v3];
  [v4 setSubscriptionAdamID:*(void *)(a1 + 32)];
  [v4 setPurchasedAdamID:*(void *)(a1 + 32)];
}

void __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSubscriptionAdamID:", objc_msgSend(v2, "integerValue"));
}

@end