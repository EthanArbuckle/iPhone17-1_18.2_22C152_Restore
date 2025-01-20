@interface DPKeyProperties
@end

@implementation DPKeyProperties

void __30___DPKeyProperties_initialize__block_invoke()
{
  v6[18] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1F37A03D0;
  v5[1] = &unk_1F37A03E8;
  v6[0] = @"OneBitHistogram";
  v6[1] = @"MultiBitHistogram";
  v5[2] = &unk_1F37A0400;
  v5[3] = &unk_1F37A0418;
  v6[2] = @"CompressedMultiBitHistogram";
  v6[3] = @"CountMedianSketch";
  v5[4] = &unk_1F37A0430;
  v5[5] = &unk_1F37A0448;
  v6[4] = @"HadamardCountMedianSketch";
  v6[5] = @"StatisticsMean";
  v5[6] = &unk_1F37A0460;
  v5[7] = &unk_1F37A0478;
  v6[6] = @"PrefixTrie";
  v6[7] = @"Prio";
  v5[8] = &unk_1F37A0490;
  v5[9] = &unk_1F37A04A8;
  v6[8] = @"PrioCountMinSketch";
  v6[9] = @"OneHotEncoding";
  v5[10] = &unk_1F37A04C0;
  v5[11] = &unk_1F37A04D8;
  v6[10] = @"PrioPlusPlus";
  v6[11] = @"PrioPlusPlusMetrics";
  v5[12] = &unk_1F37A04F0;
  v5[13] = &unk_1F37A0508;
  v6[12] = @"PrioPlusPlusMetadata";
  v6[13] = @"PrioPiRappor";
  v5[14] = &unk_1F37A0520;
  v5[15] = &unk_1F37A0538;
  v6[14] = @"Prio3SumVectorField64MultiproofHmacSha256Aes128";
  v6[15] = @"PINEResults";
  v5[16] = &unk_1F37A0550;
  v5[17] = &unk_1F37A0568;
  v6[16] = @"PINEMetrics";
  v6[17] = @"PINEMetadata";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:18];
  v1 = (void *)kAlgorithmStringsMap;
  kAlgorithmStringsMap = v0;

  v2 = (void *)kDataAlgorithmsMap;
  kDataAlgorithmsMap = (uint64_t)&unk_1F37A05F8;

  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F37A0650];
  v4 = (void *)kAlgorithmsWithEpsilon;
  kAlgorithmsWithEpsilon = v3;
}

void __39___DPKeyProperties_propertiesFromFile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v2 pathForResource:@"override.keyproperties" ofType:@"plist"];

  uint64_t v3 = +[_DPPListHelper loadPropertyListFromPath:*(void *)(a1 + 32) overridePath:v5 usingBlock:&__block_literal_global_213];
  v4 = (void *)allKeyProperties;
  allKeyProperties = v3;
}

_DPKeyProperties *__39___DPKeyProperties_propertiesFromFile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_DPKeyProperties keyPropertiesWithName:a2 fromDictionary:a3];
}

@end