@interface HREContextActionRecommendation
- (BOOL)containsMeaningfulChanges;
- (HFIconDescriptor)iconDescriptor;
- (HREActionVarianceCollection)allowedVariance;
- (HREContextActionRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4;
- (NSMutableSet)_actions;
- (NSString)name;
- (id)copyWithActionFilter:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilder;
- (id)executeActions;
- (void)addAction:(id)a3;
- (void)addAction:(id)a3 allowEditingExistingActions:(BOOL)a4;
- (void)addActions:(id)a3;
- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4;
- (void)removeAction:(id)a3;
- (void)removeActions:(id)a3;
- (void)setAllowedVariance:(id)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setName:(id)a3;
- (void)set_actions:(id)a3;
@end

@implementation HREContextActionRecommendation

- (HREContextActionRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HREContextActionRecommendation;
  v4 = [(HRERecommendation *)&v7 initWithHome:a3 uniqueIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    [(HREContextActionRecommendation *)v4 set_actions:v5];
  }
  return v4;
}

- (void)addAction:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(HREContextActionRecommendation *)self actions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if ([v11 canUpdateWithActionBuilder:v5]) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v11;

    if (!v12) {
      goto LABEL_12;
    }
    [v12 updateWithActionBuilder:v5];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v12 = [(HREContextActionRecommendation *)self _actions];
    [v12 addObject:v5];
  }
}

- (void)addAction:(id)a3
{
}

- (void)addActions:(id)a3
{
}

- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__HREContextActionRecommendation_addActions_allowEditingExistingActions___block_invoke;
  v4[3] = &unk_264CF3CC8;
  v4[4] = self;
  BOOL v5 = a4;
  objc_msgSend(a3, "na_each:", v4);
}

uint64_t __73__HREContextActionRecommendation_addActions_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAction:a2 allowEditingExistingActions:*(unsigned __int8 *)(a1 + 40)];
}

- (void)removeAction:(id)a3
{
  id v4 = a3;
  id v5 = [(HREContextActionRecommendation *)self _actions];
  [v5 removeObject:v4];
}

- (void)removeActions:(id)a3
{
  id v4 = a3;
  id v5 = [(HREContextActionRecommendation *)self _actions];
  [v5 minusSet:v4];
}

- (BOOL)containsMeaningfulChanges
{
  v2 = [(HREContextActionRecommendation *)self actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)descriptionBuilder
{
  v12.receiver = self;
  v12.super_class = (Class)HREContextActionRecommendation;
  BOOL v3 = [(HRERecommendation *)&v12 descriptionBuilder];
  id v4 = [(HREContextActionRecommendation *)self name];
  [v3 appendString:v4 withName:@"name"];

  id v5 = [(HREContextActionRecommendation *)self iconDescriptor];
  id v6 = (id)[v3 appendObject:v5 withName:@"iconDescriptor"];

  uint64_t v7 = (void *)MEMORY[0x263F47AB8];
  uint64_t v8 = [(HREContextActionRecommendation *)self _actions];
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = objc_msgSend(v7, "hre_sortActionBuilders:", v9);

  [v3 appendArraySection:v10 withName:@"actions" skipIfEmpty:1];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HREContextActionRecommendation;
  id v4 = [(HRERecommendation *)&v11 copyWithZone:a3];
  id v5 = [(HREContextActionRecommendation *)self name];
  id v6 = (void *)[v5 copy];
  [v4 setName:v6];

  uint64_t v7 = [(HREContextActionRecommendation *)self iconDescriptor];
  [v4 setIconDescriptor:v7];

  uint64_t v8 = [(HREContextActionRecommendation *)self _actions];
  uint64_t v9 = (void *)[v8 mutableCopy];
  objc_msgSend(v4, "set_actions:", v9);

  return v4;
}

- (id)executeActions
{
  BOOL v3 = [(HRERecommendation *)self home];
  id v4 = objc_msgSend(v3, "hf_characteristicValueManager");

  id v5 = [(HREContextActionRecommendation *)self actions];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_7);

  uint64_t v7 = (void *)MEMORY[0x263F58190];
  uint64_t v8 = [v6 allObjects];
  uint64_t v9 = [v7 combineAllFutures:v8];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __48__HREContextActionRecommendation_executeActions__block_invoke_2;
  v17 = &unk_264CF42F0;
  id v18 = v4;
  v19 = self;
  id v10 = v4;
  objc_super v11 = [v9 flatMap:&v14];
  objc_super v12 = objc_msgSend(v11, "flatMap:", &__block_literal_global_25, v14, v15, v16, v17);

  return v12;
}

uint64_t __48__HREContextActionRecommendation_executeActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 performValidation];
}

id __48__HREContextActionRecommendation_executeActions__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) beginTransactionWithReason:@"HREContextActionRecommendationCharacteristicTransactionReason"];
  v2 = [*(id *)(a1 + 40) actions];
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_19);
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_22_0);

  id v5 = [*(id *)(a1 + 32) executeActions:v4];
  [*(id *)(a1 + 32) commitTransactionWithReason:@"HREContextActionRecommendationCharacteristicTransactionReason"];

  return v5;
}

uint64_t __48__HREContextActionRecommendation_executeActions__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 createNewAction];
}

BOOL __48__HREContextActionRecommendation_executeActions__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

uint64_t __48__HREContextActionRecommendation_executeActions__block_invoke_5()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (id)copyWithActionFilter:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(HREContextActionRecommendation *)self copy];
  id v6 = [v5 _actions];
  uint64_t v7 = objc_msgSend(v6, "na_map:", v4);

  uint64_t v8 = (void *)[v7 mutableCopy];
  objc_msgSend(v5, "set_actions:", v8);

  return v5;
}

- (HREActionVarianceCollection)allowedVariance
{
  return self->allowedVariance;
}

- (void)setAllowedVariance:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
}

- (NSMutableSet)_actions
{
  return self->__actions;
}

- (void)set_actions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__actions, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->allowedVariance, 0);
}

@end