@interface MPLocalMediaQueryRemotePlaybackQueue
@end

@implementation MPLocalMediaQueryRemotePlaybackQueue

uint64_t __100__MPLocalMediaQueryRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __100__MPLocalMediaQueryRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2;
  v4[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 setLibraryIdentifiersWithDatabaseID:v2 block:v4];
}

uint64_t __100__MPLocalMediaQueryRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

@end