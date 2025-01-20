@interface HFAccessoryProfileItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (HFAccessoryProfileItem)init;
- (HFAccessoryProfileItem)initWithProfile:(id)a3 valueSource:(id)a4;
- (HFCharacteristicValueSource)valueSource;
- (HMAccessory)accessory;
- (HMAccessoryProfile)profile;
- (HMHome)home;
- (NSSet)services;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)namingComponentForHomeKitObject;
- (id)profiles;
- (id)serviceLikeBuilderInHome:(id)a3;
@end

@implementation HFAccessoryProfileItem

id __54__HFAccessoryProfileItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 standardResults];
  v4 = (void *)[v3 mutableCopy];

  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [*(id *)(a1 + 32) profile];
  v7 = [*(id *)(a1 + 32) profile];
  v8 = [v7 accessory];
  v9 = objc_msgSend(v5, "setWithObjects:", v6, v8, 0);
  [v4 setObject:v9 forKeyedSubscript:@"dependentHomeKitObjects"];

  v10 = [*(id *)(a1 + 32) profile];
  v11 = objc_msgSend(v10, "hf_parentRoom");
  v12 = [v11 uniqueIdentifier];
  [v4 setObject:v12 forKeyedSubscript:@"roomIdentifier"];

  v13 = [*(id *)(a1 + 32) accessory];
  v14 = [v13 name];
  [v4 setObject:v14 forKeyedSubscript:@"title"];

  v15 = [*(id *)(a1 + 32) profile];
  v16 = objc_msgSend(v15, "hf_iconDescriptor");
  [v4 setObject:v16 forKeyedSubscript:@"icon"];

  v17 = [*(id *)(a1 + 32) profile];
  v18 = [v17 accessory];
  v19 = objc_msgSend(v18, "hf_serviceNameComponents");
  [v4 setObject:v19 forKeyedSubscript:@"serviceNameComponents"];

  v20 = (void *)MEMORY[0x263F58190];
  v21 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v22 = [v20 futureWithResult:v21];

  return v22;
}

- (HMAccessoryProfile)profile
{
  return self->_profile;
}

- (HMAccessory)accessory
{
  v2 = [(HFAccessoryProfileItem *)self profile];
  v3 = [v2 accessory];

  return (HMAccessory *)v3;
}

- (HFAccessoryProfileItem)initWithProfile:(id)a3 valueSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFAccessoryProfileItem;
  v9 = [(HFAccessoryProfileItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [HFServiceLikeItemUpdateRequest alloc];
  id v7 = [(HFAccessoryProfileItem *)self profile];
  id v8 = [v7 accessory];
  v9 = [(HFAccessoryProfileItem *)self valueSource];
  v10 = [MEMORY[0x263EFFA08] set];
  v11 = [(HFServiceLikeItemUpdateRequest *)v6 initWithAccessory:v8 valueSource:v9 characteristics:v10];

  if (v11)
  {
    objc_super v12 = [(HFServiceLikeItemUpdateRequest *)v11 updateWithOptions:v5];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __54__HFAccessoryProfileItem__subclass_updateWithOptions___block_invoke;
    v20[3] = &unk_26408C9A8;
    v20[4] = self;
    uint64_t v13 = [v12 flatMap:v20];
  }
  else
  {
    v14 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = [(HFAccessoryProfileItem *)self profile];
      *(_DWORD *)buf = 138412802;
      v22 = self;
      __int16 v23 = 2112;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "%@:%@ Failed to create HFServiceLikeItemUpdateRequest. Profile: %@ ", buf, 0x20u);
    }
    v15 = (void *)MEMORY[0x263F58190];
    objc_super v12 = +[HFItemUpdateOutcome outcomeWithResults:MEMORY[0x263EFFA78]];
    uint64_t v13 = [v15 futureWithResult:v12];
  }
  v16 = (void *)v13;

  return v16;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFAccessoryProfileItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithProfile_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryProfileItem.m", 36, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryProfileItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFAccessoryProfileItem *)self valueSource];
  id v5 = [(HFAccessoryProfileItem *)self copyWithValueSource:v4];

  return v5;
}

- (HMHome)home
{
  v2 = [(HFAccessoryProfileItem *)self profile];
  v3 = [v2 accessory];
  v4 = [v3 home];

  return (HMHome *)v4;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFAccessoryProfileItem *)self profile];
  v4 = [v3 accessory];
  id v5 = [v2 setWithObject:v4];

  return v5;
}

- (id)profiles
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFAccessoryProfileItem *)self profile];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFAccessoryProfileItem *)self profile];
  v3 = [v2 accessory];
  v4 = +[HFNamingComponents namingComponentFromAccessory:v3];

  return v4;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFAccessoryBuilder alloc];
  v6 = [(HFAccessoryProfileItem *)self profile];
  id v7 = [v6 accessory];
  id v8 = [(HFAccessoryBuilder *)v5 initWithExistingObject:v7 inHome:v4];

  return v8;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFAccessoryProfileItem *)self profile];
  id v7 = (void *)[v5 initWithProfile:v6 valueSource:v4];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (NSSet)services
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFAccessoryProfileItem *)self profile];
  id v4 = [v3 services];
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

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
    objc_super v12 = v10;
    if (v11) {
      goto LABEL_8;
    }
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  objc_super v12 = 0;
LABEL_8:

  v15 = (void *)[objc_alloc((Class)a1) initWithProfile:v12 valueSource:v6];
  return v15;
}

@end