@interface DPAlgorithmParameters
@end

@implementation DPAlgorithmParameters

void __45___DPAlgorithmParameters_parametersFromFile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v2 pathForResource:@"override.algorithmparameters" ofType:@"plist"];

  uint64_t v3 = +[_DPPListHelper loadPropertyListFromPath:*(void *)(a1 + 32) overridePath:v5 usingBlock:&__block_literal_global_8];
  v4 = (void *)allParameters;
  allParameters = v3;
}

id __45___DPAlgorithmParameters_parametersFromFile___block_invoke_2()
{
  return +[_DPAlgorithmParameters algorithmParametersFromDictionary:](_DPAlgorithmParameters, "algorithmParametersFromDictionary:");
}

@end