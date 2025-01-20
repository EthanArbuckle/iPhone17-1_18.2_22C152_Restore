@interface DPMetadataV2OptionalKeys
@end

@implementation DPMetadataV2OptionalKeys

void ___DPMetadataV2OptionalKeys_block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VDAF";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)_DPMetadataV2OptionalKeys__DPMetadataOptionalKeys;
  _DPMetadataV2OptionalKeys__DPMetadataOptionalKeys = v0;
}

@end