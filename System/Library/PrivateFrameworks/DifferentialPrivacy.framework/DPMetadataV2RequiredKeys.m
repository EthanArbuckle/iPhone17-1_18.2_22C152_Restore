@interface DPMetadataV2RequiredKeys
@end

@implementation DPMetadataV2RequiredKeys

void ___DPMetadataV2RequiredKeys_block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Version";
  v2[1] = @"DediscoTaskConfig";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)_DPMetadataV2RequiredKeys__DPMetadataRequiredKeys;
  _DPMetadataV2RequiredKeys__DPMetadataRequiredKeys = v0;
}

@end