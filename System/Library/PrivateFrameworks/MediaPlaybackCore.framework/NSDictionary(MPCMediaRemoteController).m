@interface NSDictionary(MPCMediaRemoteController)
- (id)allCommandInfos;
- (void)commandInfoForCommand:()MPCMediaRemoteController;
@end

@implementation NSDictionary(MPCMediaRemoteController)

- (void)commandInfoForCommand:()MPCMediaRemoteController
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v3 = [a1 objectForKeyedSubscript:v2];

  return v3;
}

- (id)allCommandInfos
{
  v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__NSDictionary_MPCMediaRemoteController__allCommandInfos__block_invoke;
  v5[3] = &unk_2643C55F8;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

@end