@interface MPCPreferredShuffleIdentifierSetFromStorePlatformPayload
@end

@implementation MPCPreferredShuffleIdentifierSetFromStorePlatformPayload

uint64_t ___MPCPreferredShuffleIdentifierSetFromStorePlatformPayload_block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = ___MPCPreferredShuffleIdentifierSetFromStorePlatformPayload_block_invoke_2;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

uint64_t ___MPCPreferredShuffleIdentifierSetFromStorePlatformPayload_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSubscriptionAdamID:*(void *)(a1 + 32)];
}

@end