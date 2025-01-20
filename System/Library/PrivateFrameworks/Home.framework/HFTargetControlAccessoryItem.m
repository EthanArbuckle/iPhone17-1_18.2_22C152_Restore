@interface HFTargetControlAccessoryItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (BOOL)actionsMayRequireDeviceUnlock;
- (BOOL)containsActions;
- (BOOL)shouldReduceOptionItemsForNotifyingCharacteristics;
- (HFCharacteristicValueSource)valueSource;
- (HFTargetControlAccessoryItem)init;
- (HFTargetControlAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSSet)services;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)iconDescriptor;
- (id)namingComponentForHomeKitObject;
- (id)serviceLikeBuilderInHome:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HFTargetControlAccessoryItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "hf_homeKitObject");

  id v10 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    v12 = v10;
    if (v11) {
      goto LABEL_8;
    }
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v12 = 0;
LABEL_8:

  v15 = (void *)[objc_alloc((Class)a1) initWithAccessory:v12 valueSource:v6];
  return v15;
}

- (HFTargetControlAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFTargetControlAccessoryItem;
  v9 = [(HFTargetControlAccessoryItem *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
}

- (HFTargetControlAccessoryItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessory_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTargetControlAccessoryItem.m", 38, @"%s is unavailable; use %@ instead",
    "-[HFTargetControlAccessoryItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFTargetControlAccessoryItem *)self valueSource];
  id v5 = [(HFTargetControlAccessoryItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [HFServiceLikeItemUpdateRequest alloc];
  id v7 = [(HFTargetControlAccessoryItem *)self accessory];
  id v8 = [(HFTargetControlAccessoryItem *)self valueSource];
  v9 = [MEMORY[0x263EFFA08] set];
  id v10 = [(HFServiceLikeItemUpdateRequest *)v6 initWithAccessory:v7 valueSource:v8 characteristics:v9];

  if (v10)
  {
    v11 = [(HFServiceLikeItemUpdateRequest *)v10 updateWithOptions:v5];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __60__HFTargetControlAccessoryItem__subclass_updateWithOptions___block_invoke;
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
      v18 = [(HFTargetControlAccessoryItem *)self accessory];
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

id __60__HFTargetControlAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 standardResults];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [v4 objectForKeyedSubscript:@"state"];
  uint64_t v6 = [v5 integerValue];

  id v7 = &HFCAPackageStateOn;
  if (v6 != 2) {
    id v7 = &HFCAPackageStateOff;
  }
  id v8 = *v7;
  v9 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierRemoteControl" state:v8];
  [v4 setObject:v9 forKeyedSubscript:@"icon"];

  id v10 = [*(id *)(a1 + 32) accessory];
  v11 = [v10 room];
  uint64_t v12 = [v11 uniqueIdentifier];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v12, @"roomIdentifier");

  v13 = [*(id *)(a1 + 32) accessory];
  v14 = objc_msgSend(v13, "hf_serviceNameComponents");

  if (v14)
  {
    [v4 setObject:v14 forKeyedSubscript:@"serviceNameComponents"];
    v15 = [v14 composedString];
    if (v15) {
      [v4 setObject:v15 forKeyedSubscript:@"title"];
    }
    v16 = [v4 objectForKeyedSubscript:@"controlDescription"];

    if (!v16) {
      [v4 setObject:v15 forKeyedSubscript:@"controlDescription"];
    }
  }
  v17 = [v4 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  v18 = (void *)[v17 mutableCopy];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x263EFF9C0] set];
  }
  v21 = v20;

  __int16 v22 = [*(id *)(a1 + 32) accessory];
  [v21 addObject:v22];

  [v4 setObject:v21 forKeyedSubscript:@"dependentHomeKitObjects"];
  v23 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v4 setObject:v23 forKeyedSubscript:@"dependentHomeKitClasses"];

  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
  __int16 v24 = (void *)MEMORY[0x263F58190];
  v25 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  uint64_t v26 = [v24 futureWithResult:v25];

  return v26;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = [HFTargetControlAccessoryItem alloc];
  uint64_t v6 = [(HFTargetControlAccessoryItem *)self accessory];
  id v7 = [(HFTargetControlAccessoryItem *)v5 initWithAccessory:v6 valueSource:v4];

  [(HFItem *)v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)iconDescriptor
{
  v2 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierRemoteControl"];
  return v2;
}

- (HMHome)home
{
  v2 = [(HFTargetControlAccessoryItem *)self accessory];
  v3 = [v2 home];

  return (HMHome *)v3;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFTargetControlAccessoryItem *)self accessory];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (NSSet)services
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (BOOL)shouldReduceOptionItemsForNotifyingCharacteristics
{
  return 0;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFAccessoryBuilder alloc];
  uint64_t v6 = [(HFTargetControlAccessoryItem *)self homeKitObject];
  id v7 = [(HFAccessoryBuilder *)v5 initWithExistingObject:v6 inHome:v4];

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
  v3 = (void *)MEMORY[0x263F58190];
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFTargetControlAccessoryItem *)self accessory];
  v3 = +[HFNamingComponents namingComponentFromAccessory:v2];

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

@end