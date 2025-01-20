@interface MPMRInitPropertyPlaybackPositionMap
@end

@implementation MPMRInitPropertyPlaybackPositionMap

void *___MPMRInitPropertyPlaybackPositionMap_block_invoke_3_189()
{
  return &unk_1EE6ECF98;
}

uint64_t ___MPMRInitPropertyPlaybackPositionMap_block_invoke_2_186()
{
  return 0;
}

void *___MPMRInitPropertyPlaybackPositionMap_block_invoke_183()
{
  return &unk_1EE6EE3C0;
}

void *___MPMRInitPropertyPlaybackPositionMap_block_invoke_4()
{
  return &unk_1EE6EE3C0;
}

uint64_t ___MPMRInitPropertyPlaybackPositionMap_block_invoke_3()
{
  return MEMORY[0x1E4F1CC28];
}

id ___MPMRInitPropertyPlaybackPositionMap_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 deviceSpecificUserInfo];
  v4 = [v3 objectForKeyedSubscript:@"rembok"];
  v5 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

@end