@interface DPDataTypeParameters
@end

@implementation DPDataTypeParameters

void __44___DPDataTypeParameters_parametersFromFile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v2 pathForResource:@"override.datatypeparameters" ofType:@"plist"];

  uint64_t v3 = +[_DPPListHelper loadPropertyListFromPath:*(void *)(a1 + 32) overridePath:v5 usingBlock:&__block_literal_global_16];
  v4 = (void *)parametersFromFile__allParameters_0;
  parametersFromFile__allParameters_0 = v3;
}

id __44___DPDataTypeParameters_parametersFromFile___block_invoke_2()
{
  return +[_DPDataTypeParameters dataTypeParametersFromDictionary:](_DPDataTypeParameters, "dataTypeParametersFromDictionary:");
}

@end