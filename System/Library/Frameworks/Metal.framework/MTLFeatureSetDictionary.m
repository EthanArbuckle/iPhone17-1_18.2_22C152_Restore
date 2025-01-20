@interface MTLFeatureSetDictionary
@end

@implementation MTLFeatureSetDictionary

uint64_t ___MTLFeatureSetDictionary_block_invoke()
{
  v2[19] = *MEMORY[0x1E4F143B8];
  v1[0] = @"MTLFeatureSet_iOS_GPUFamily1_v1";
  v1[1] = @"MTLFeatureSet_iOS_GPUFamily2_v1";
  v2[0] = &unk_1ECB14F28;
  v2[1] = &unk_1ECB14F40;
  v1[2] = @"MTLFeatureSet_iOS_GPUFamily1_v2";
  v1[3] = @"MTLFeatureSet_iOS_GPUFamily2_v2";
  v2[2] = &unk_1ECB14F58;
  v2[3] = &unk_1ECB14F70;
  v1[4] = @"MTLFeatureSet_iOS_GPUFamily3_v1";
  v1[5] = @"MTLFeatureSet_iOS_GPUFamily1_v3";
  v2[4] = &unk_1ECB14F88;
  v2[5] = &unk_1ECB14FA0;
  v1[6] = @"MTLFeatureSet_iOS_GPUFamily2_v3";
  v1[7] = @"MTLFeatureSet_iOS_GPUFamily3_v2";
  v2[6] = &unk_1ECB14FB8;
  v2[7] = &unk_1ECB14FD0;
  v1[8] = @"MTLFeatureSet_iOS_GPUFamily1_v4";
  v1[9] = @"MTLFeatureSet_iOS_GPUFamily2_v4";
  v2[8] = &unk_1ECB14FE8;
  v2[9] = &unk_1ECB15000;
  v1[10] = @"MTLFeatureSet_iOS_GPUFamily3_v3";
  v1[11] = @"MTLFeatureSet_iOS_GPUFamily4_v1";
  v2[10] = &unk_1ECB15018;
  v2[11] = &unk_1ECB15030;
  v1[12] = @"MTLFeatureSet_iOS_GPUFamily1_v5";
  v1[13] = @"MTLFeatureSet_iOS_GPUFamily2_v5";
  v2[12] = &unk_1ECB15048;
  v2[13] = &unk_1ECB15060;
  v1[14] = @"MTLFeatureSet_iOS_GPUFamily3_v4";
  v1[15] = @"MTLFeatureSet_iOS_GPUFamily4_v2";
  v2[14] = &unk_1ECB15078;
  v2[15] = &unk_1ECB15090;
  v1[16] = @"MTLFeatureSet_iOS_GPUFamily5_v1";
  v1[17] = @"MTLFeatureSet_iOS_GPUFamily6_v1";
  v2[16] = &unk_1ECB150A8;
  v2[17] = &unk_1ECB150C0;
  v1[18] = @"MTLFeatureSet_iOS_GPUFamily7_v1";
  v2[18] = &unk_1ECB150D8;
  uint64_t result = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:v1 count:19];
  _MTLFeatureSetDictionary::featureSetDictionary = result;
  return result;
}

@end