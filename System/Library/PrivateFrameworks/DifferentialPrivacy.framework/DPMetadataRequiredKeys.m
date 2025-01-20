@interface DPMetadataRequiredKeys
@end

@implementation DPMetadataRequiredKeys

void ___DPMetadataRequiredKeys_block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VersionHash";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)_DPMetadataRequiredKeys__DPMetadataRequiredKeys;
  _DPMetadataRequiredKeys__DPMetadataRequiredKeys = v0;
}

@end