@interface HFGenericAccessoryItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (HFCharacteristicValueSource)valueSource;
- (HFGenericAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSSet)services;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)namingComponentForHomeKitObject;
- (id)serviceLikeBuilderInHome:(id)a3;
@end

@implementation HFGenericAccessoryItem

- (HFGenericAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFGenericAccessoryItem;
  v9 = [(HFGenericAccessoryItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [HFServiceLikeItemUpdateRequest alloc];
  id v7 = [(HFGenericAccessoryItem *)self accessory];
  id v8 = [(HFGenericAccessoryItem *)self valueSource];
  v9 = [MEMORY[0x263EFFA08] set];
  v10 = [(HFServiceLikeItemUpdateRequest *)v6 initWithAccessory:v7 valueSource:v8 characteristics:v9];

  if (v10)
  {
    v11 = [(HFServiceLikeItemUpdateRequest *)v10 updateWithOptions:v5];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__HFGenericAccessoryItem__subclass_updateWithOptions___block_invoke;
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
      v18 = [(HFGenericAccessoryItem *)self accessory];
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

id __54__HFGenericAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v22[4] = *MEMORY[0x263EF8340];
  v3 = [a2 standardResults];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [*(id *)(a1 + 32) accessory];
  if (objc_msgSend(v5, "hf_requiresFirmwareUpdate")) {
    v6 = @"HFServiceLongFormErrorDoesNotSupportNotifications";
  }
  else {
    v6 = @"HFServiceLongFormErrorAccessoryTypeNotSupported";
  }
  id v7 = _HFLocalizedStringWithDefaultValue(v6, v6, 1);

  id v8 = [*(id *)(a1 + 32) accessory];
  v9 = [v8 room];
  v10 = [v9 uniqueIdentifier];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v10, @"roomIdentifier");

  v21[0] = @"description";
  v11 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAccessoryNotSupported", @"HFServiceDescriptionAccessoryNotSupported", 1);
  v22[0] = v11;
  v22[1] = v7;
  v21[1] = @"longErrorDescription";
  v21[2] = @"state";
  v22[2] = &unk_26C0F5DA8;
  v21[3] = @"icon";
  uint64_t v12 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:@"HFImageIconIdentifierGeneric"];
  v22[3] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  [v4 addEntriesFromDictionary:v13];

  v14 = [*(id *)(a1 + 32) accessory];
  v15 = objc_msgSend(v14, "hf_serviceNameComponents");

  if (v15)
  {
    [v4 setObject:v15 forKeyedSubscript:@"serviceNameComponents"];
    v16 = [v15 composedString];
    if (v16) {
      [v4 setObject:v16 forKeyedSubscript:@"title"];
    }
  }
  v17 = (void *)MEMORY[0x263F58190];
  v18 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v19 = [v17 futureWithResult:v18];

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFGenericAccessoryItem *)self valueSource];
  id v5 = [(HFGenericAccessoryItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = [HFGenericAccessoryItem alloc];
  v6 = [(HFGenericAccessoryItem *)self accessory];
  id v7 = [(HFGenericAccessoryItem *)v5 initWithAccessory:v6 valueSource:v4];

  [(HFItem *)v7 copyLatestResultsFromItem:self];
  return v7;
}

- (HMHome)home
{
  v2 = [(HFGenericAccessoryItem *)self accessory];
  v3 = [v2 home];

  return (HMHome *)v3;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFGenericAccessoryItem *)self accessory];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (NSSet)services
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFGenericAccessoryItem *)self accessory];
  id v4 = [v3 services];
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFAccessoryBuilder alloc];
  v6 = [(HFGenericAccessoryItem *)self homeKitObject];
  id v7 = [(HFAccessoryBuilder *)v5 initWithExistingObject:v6 inHome:v4];

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFGenericAccessoryItem *)self accessory];
  v3 = +[HFNamingComponents namingComponentFromAccessory:v2];

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
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
    uint64_t v12 = v10;
    if (v11) {
      goto LABEL_8;
    }
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  uint64_t v12 = 0;
LABEL_8:

  v15 = (void *)[objc_alloc((Class)a1) initWithAccessory:v12 valueSource:v6];
  return v15;
}

@end