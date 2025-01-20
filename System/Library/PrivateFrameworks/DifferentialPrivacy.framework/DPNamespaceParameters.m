@interface DPNamespaceParameters
@end

@implementation DPNamespaceParameters

void __45___DPNamespaceParameters_parametersFromFile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v2 pathForResource:@"override.namespaceparameters" ofType:@"plist"];

  uint64_t v3 = +[_DPPListHelper loadPropertyListFromPath:*(void *)(a1 + 32) overridePath:v5 usingBlock:&__block_literal_global_1];
  v4 = (void *)parametersFromFile__allParameters;
  parametersFromFile__allParameters = v3;
}

id __45___DPNamespaceParameters_parametersFromFile___block_invoke_2()
{
  return +[_DPNamespaceParameters namespaceParametersFromDictionary:](_DPNamespaceParameters, "namespaceParametersFromDictionary:");
}

@end