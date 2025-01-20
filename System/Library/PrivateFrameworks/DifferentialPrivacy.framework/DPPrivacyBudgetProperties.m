@interface DPPrivacyBudgetProperties
@end

@implementation DPPrivacyBudgetProperties

void __55___DPPrivacyBudgetProperties_budgetPropertiesFromFile___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v2 pathForResource:@"override.budgetproperties" ofType:@"plist"];

  uint64_t v3 = +[_DPPListHelper loadPropertyListFromPath:*(void *)(a1 + 32) overridePath:v5 usingBlock:&__block_literal_global_7];
  v4 = (void *)gAllBudgetProperties;
  gAllBudgetProperties = v3;
}

_DPPrivacyBudgetProperties *__55___DPPrivacyBudgetProperties_budgetPropertiesFromFile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_DPPrivacyBudgetProperties budgetPropertiesWithName:a2 fromDictionary:a3];
}

@end