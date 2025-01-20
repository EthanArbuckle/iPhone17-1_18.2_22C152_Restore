@interface BridgeIconCachePath
@end

@implementation BridgeIconCachePath

void ___BridgeIconCachePath_block_invoke()
{
  v0 = NSString;
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  v1 = [v4 userCachesDirectory];
  uint64_t v2 = [v0 stringWithFormat:@"%@/BridgeIconCache/", v1];
  v3 = (void *)_BridgeIconCachePath___bridgeIconCachePath;
  _BridgeIconCachePath___bridgeIconCachePath = v2;
}

@end