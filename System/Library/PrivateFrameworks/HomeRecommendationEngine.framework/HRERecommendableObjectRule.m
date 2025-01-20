@interface HRERecommendableObjectRule
+ (id)_types:(id)a3 notMatchedByObjects:(id)a4;
- (BOOL)passesWithHomeObjects:(id)a3;
@end

@implementation HRERecommendableObjectRule

- (BOOL)passesWithHomeObjects:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HRERule.m", 23, @"%s is an abstract method that must be overriden by subclass %@", "-[HRERecommendableObjectRule passesWithHomeObjects:]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)_types:(id)a3 notMatchedByObjects:(id)a4
{
  id v5 = a4;
  v6 = (void *)[a3 mutableCopy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HRERecommendableObjectRule__types_notMatchedByObjects___block_invoke;
  v9[3] = &unk_264CF3DF8;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

uint64_t __57__HRERecommendableObjectRule__types_notMatchedByObjects___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(a2, "hre_matchingTypes");
  [v5 minusSet:v6];

  uint64_t result = [*(id *)(a1 + 32) count];
  *a3 = result == 0;
  return result;
}

@end