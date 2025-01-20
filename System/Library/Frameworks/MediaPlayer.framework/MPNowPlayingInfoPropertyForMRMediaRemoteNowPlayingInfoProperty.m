@interface MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty
@end

@implementation MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty

void ___MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = _MPNowPlayingInfoPropertyToMRMediaRemoteNowPlayingInfoPropertyMapping();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty_block_invoke_2;
  v5[3] = &unk_1E57F76F0;
  id v6 = v0;
  id v2 = v0;
  [v1 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v3 = [v2 copy];
  v4 = (void *)_MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty___reversePropertyMapping;
  _MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty___reversePropertyMapping = v3;
}

uint64_t ___MPNowPlayingInfoPropertyForMRMediaRemoteNowPlayingInfoProperty_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKey:a3];
}

@end