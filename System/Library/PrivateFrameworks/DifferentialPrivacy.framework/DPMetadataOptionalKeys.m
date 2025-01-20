@interface DPMetadataOptionalKeys
@end

@implementation DPMetadataOptionalKeys

void ___DPMetadataOptionalKeys_block_invoke()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"CountryCode";
  v2[1] = @"State";
  v2[2] = @"AlgorithmParameters";
  v2[3] = @"EnhancedDifferentialPrivacyParameters";
  v2[4] = @"AllowedDataTypes";
  v2[5] = @"DonationID";
  v2[6] = @"VDAF";
  v2[7] = @"DediscoTaskConfig";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  v1 = (void *)_DPMetadataOptionalKeys__DPMetadataOptionalKeys;
  _DPMetadataOptionalKeys__DPMetadataOptionalKeys = v0;
}

@end