@interface HFProgrammableSwitchAccessoryItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (BOOL)actionsMayRequireDeviceUnlock;
- (BOOL)containsActions;
- (BOOL)shouldReduceOptionItemsForNotifyingCharacteristics;
- (HFCharacteristicValueSource)valueSource;
- (HFProgrammableSwitchAccessoryItem)init;
- (HFProgrammableSwitchAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSSet)services;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)namingComponentForHomeKitObject;
- (id)serviceLikeBuilderInHome:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HFProgrammableSwitchAccessoryItem

- (HFProgrammableSwitchAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFProgrammableSwitchAccessoryItem;
  v9 = [(HFProgrammableSwitchAccessoryItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
}

- (HFProgrammableSwitchAccessoryItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessory_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFProgrammableSwitchAccessoryItem.m", 38, @"%s is unavailable; use %@ instead",
    "-[HFProgrammableSwitchAccessoryItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFProgrammableSwitchAccessoryItem *)self valueSource];
  id v5 = [(HFProgrammableSwitchAccessoryItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [HFServiceLikeItemUpdateRequest alloc];
  id v7 = [(HFProgrammableSwitchAccessoryItem *)self accessory];
  id v8 = [(HFProgrammableSwitchAccessoryItem *)self valueSource];
  v9 = [MEMORY[0x263EFFA08] set];
  v10 = [(HFServiceLikeItemUpdateRequest *)v6 initWithAccessory:v7 valueSource:v8 characteristics:v9];

  if (v10)
  {
    v11 = [(HFServiceLikeItemUpdateRequest *)v10 updateWithOptions:v5];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke;
    v19[3] = &unk_26408C9A8;
    v19[4] = self;
    uint64_t v12 = [v11 flatMap:v19];
  }
  else
  {
    v13 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(a2);
      v18 = [(HFProgrammableSwitchAccessoryItem *)self accessory];
      *(_DWORD *)buf = 138412802;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v17;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "%@:%@ Failed to create HFServiceLikeItemUpdateRequest. Accessory: %@ ", buf, 0x20u);
    }
    v14 = (void *)MEMORY[0x263F58190];
    v11 = +[HFItemUpdateOutcome outcomeWithResults:MEMORY[0x263EFFA78]];
    uint64_t v12 = [v14 futureWithResult:v11];
  }
  v15 = (void *)v12;

  return v15;
}

id __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 standardResults];
  id v5 = (void *)[v4 mutableCopy];

  v6 = [v5 objectForKeyedSubscript:@"state"];
  uint64_t v7 = [v6 integerValue];

  id v8 = &HFCAPackageStateOn;
  if (v7 != 2) {
    id v8 = &HFCAPackageStateOff;
  }
  v9 = *v8;
  v10 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierProgrammableSwitch" state:v9];
  [v5 setObject:v10 forKeyedSubscript:@"icon"];

  v11 = [*(id *)(a1 + 32) accessory];
  uint64_t v12 = [v11 room];
  v13 = [v12 uniqueIdentifier];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v13, @"roomIdentifier");

  v14 = [*(id *)(a1 + 32) accessory];
  v15 = objc_msgSend(v14, "hf_serviceNameComponents");

  if (v15)
  {
    [v5 setObject:v15 forKeyedSubscript:@"serviceNameComponents"];
    v16 = [v15 composedString];
    if (v16) {
      [v5 setObject:v16 forKeyedSubscript:@"title"];
    }
    v17 = [v5 objectForKeyedSubscript:@"controlDescription"];

    if (!v17) {
      [v5 setObject:v16 forKeyedSubscript:@"controlDescription"];
    }
  }
  v18 = [v5 objectForKeyedSubscript:@"detailedControlDescription"];
  if (v18)
  {
  }
  else
  {
    v19 = [*(id *)(a1 + 32) accessory];
    v20 = [v19 home];
    int v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");

    if (v21)
    {
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x2020000000;
      uint64_t v60 = 0;
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      uint64_t v56 = 0;
      __int16 v22 = [*(id *)(a1 + 32) accessory];
      v23 = [v22 services];
      __int16 v24 = objc_msgSend(v23, "na_filter:", &__block_literal_global_27);
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_3;
      v52[3] = &unk_26408EEA8;
      v52[4] = &v53;
      v52[5] = &v57;
      objc_msgSend(v24, "na_each:", v52);

      uint64_t v31 = v58[3];
      if (v31 && v54[3])
      {
        if (v31 == 1) {
          _HFLocalizedStringWithDefaultValue(@"HFProgrammableSwitchAccessoryUnconfiguredButtonCountSingular", @"HFProgrammableSwitchAccessoryUnconfiguredButtonCountSingular", 1);
        }
        else {
        v32 = HFLocalizedStringWithFormat(@"HFProgrammableSwitchAccessoryUnconfiguredButtonCount", @"%lu", v25, v26, v27, v28, v29, v30, v58[3]);
        }
        [v5 setObject:v32 forKeyedSubscript:@"detailedControlDescription"];
      }
      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(&v57, 8);
    }
  }
  v33 = [v5 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  v34 = (void *)[v33 mutableCopy];
  v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    id v36 = [MEMORY[0x263EFF9C0] set];
  }
  v37 = v36;

  v38 = [*(id *)(a1 + 32) accessory];
  [v37 addObject:v38];

  [v5 setObject:v37 forKeyedSubscript:@"dependentHomeKitObjects"];
  v39 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v5 setObject:v39 forKeyedSubscript:@"dependentHomeKitClasses"];

  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
  v40 = [*(id *)(a1 + 32) accessory];
  v41 = [v40 home];
  uint64_t v42 = objc_msgSend(v41, "hf_remoteAccessState");

  if (v42 == 1)
  {
    v43 = @"HFServiceLongFormErrorProgrammableSwitchAccessoryIsReachableAndThereIsNoResidentDevice";
  }
  else
  {
    v44 = [*(id *)(a1 + 32) accessory];
    v45 = [v44 home];
    uint64_t v46 = objc_msgSend(v45, "hf_remoteAccessState");

    if (v46 == 3) {
      goto LABEL_27;
    }
    v43 = @"HFServiceLongFormErrorProgrammableSwitchAccessoryIsReachableAndResidentDeviceIsNotAvailable";
  }
  v47 = _HFLocalizedStringWithDefaultValue(v43, v43, 1);
  [v5 setObject:v47 forKeyedSubscript:@"longErrorDescription"];

  [v5 setObject:&unk_26C0F6168 forKeyedSubscript:@"badge"];
  [v5 setObject:&unk_26C0F6180 forKeyedSubscript:@"descriptionBadge"];
LABEL_27:
  v48 = (void *)MEMORY[0x263F58190];
  v49 = +[HFItemUpdateOutcome outcomeWithResults:v5];
  v50 = [v48 futureWithResult:v49];

  return v50;
}

uint64_t __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F0E708];
  id v3 = a2;
  v4 = objc_msgSend(v2, "hf_programmableSwitchServiceTypes");
  id v5 = [v3 serviceType];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

void __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v3 = [a2 characteristics];
  v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_15_1);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_5;
  v5[3] = &unk_26408EE80;
  v5[4] = *(void *)(a1 + 40);
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 characteristicType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0C208]];

  return v3;
}

void __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = objc_msgSend(v3, "hf_programmableSwitchValidValueSet");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(v4, "sortedValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(v3, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", *(void *)(*((void *)&v11 + 1) + 8 * v9));

        if (v10)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
LABEL_11:
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = [HFProgrammableSwitchAccessoryItem alloc];
  uint64_t v6 = [(HFProgrammableSwitchAccessoryItem *)self accessory];
  uint64_t v7 = [(HFProgrammableSwitchAccessoryItem *)v5 initWithAccessory:v6 valueSource:v4];

  [(HFItem *)v7 copyLatestResultsFromItem:self];
  return v7;
}

- (HMHome)home
{
  v2 = [(HFProgrammableSwitchAccessoryItem *)self accessory];
  id v3 = [v2 home];

  return (HMHome *)v3;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFProgrammableSwitchAccessoryItem *)self accessory];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (NSSet)services
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFProgrammableSwitchAccessoryItem *)self accessory];
  id v4 = [v3 services];
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_41);
  uint64_t v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

uint64_t __45__HFProgrammableSwitchAccessoryItem_services__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

- (BOOL)shouldReduceOptionItemsForNotifyingCharacteristics
{
  return 0;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFAccessoryBuilder alloc];
  uint64_t v6 = [(HFProgrammableSwitchAccessoryItem *)self homeKitObject];
  uint64_t v7 = [(HFAccessoryBuilder *)v5 initWithExistingObject:v6 inHome:v4];

  return v7;
}

- (BOOL)containsActions
{
  return 0;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v3 = (void *)MEMORY[0x263F58190];
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFProgrammableSwitchAccessoryItem *)self accessory];
  id v3 = +[HFNamingComponents namingComponentFromAccessory:v2];

  return v3;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "hf_homeKitObject");

  id v10 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      long long v11 = v10;
    }
    else {
      long long v11 = 0;
    }
    long long v12 = v10;
    if (v11) {
      goto LABEL_8;
    }
    long long v13 = [MEMORY[0x263F08690] currentHandler];
    long long v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  long long v12 = 0;
LABEL_8:

  v15 = (void *)[objc_alloc((Class)a1) initWithAccessory:v12 valueSource:v6];
  return v15;
}

@end