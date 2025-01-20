@interface HFAssociatedServiceTypeOptionItemProvider
+ (id)_allItemsForService:(id)a3 serviceType:(id)a4;
+ (id)_itemForService:(id)a3 associatedServiceType:(id)a4;
- (HFAssociatedServiceTypeOptionItemProvider)initWithItems:(id)a3;
- (HFAssociatedServiceTypeOptionItemProvider)initWithService:(id)a3 serviceType:(id)a4 home:(id)a5;
- (HFAssociatedServiceTypeOptionItemProvider)initWithServiceType:(id)a3 home:(id)a4;
- (HMHome)home;
- (HMService)service;
- (NSString)serviceType;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFAssociatedServiceTypeOptionItemProvider

- (HFAssociatedServiceTypeOptionItemProvider)initWithItems:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithServiceType_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAssociatedServiceTypeOptionItemProvider.m", 33, @"%s is unavailable; use %@ instead",
    "-[HFAssociatedServiceTypeOptionItemProvider initWithItems:]",
    v6);

  return 0;
}

- (HFAssociatedServiceTypeOptionItemProvider)initWithServiceType:(id)a3 home:(id)a4
{
  return [(HFAssociatedServiceTypeOptionItemProvider *)self initWithService:0 serviceType:a3 home:a4];
}

- (HFAssociatedServiceTypeOptionItemProvider)initWithService:(id)a3 serviceType:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(id)objc_opt_class() _allItemsForService:v9 serviceType:v10];
  v15.receiver = self;
  v15.super_class = (Class)HFAssociatedServiceTypeOptionItemProvider;
  v13 = [(HFStaticItemProvider *)&v15 initWithItems:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a5);
    objc_storeStrong((id *)&v13->_serviceType, a4);
    objc_storeStrong((id *)&v13->_service, a3);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFAssociatedServiceTypeOptionItemProvider *)self service];
  v6 = [(HFAssociatedServiceTypeOptionItemProvider *)self serviceType];
  v7 = [(HFAssociatedServiceTypeOptionItemProvider *)self home];
  v8 = (void *)[v4 initWithService:v5 serviceType:v6 home:v7];

  return v8;
}

+ (id)_allItemsForService:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  v7 = +[HFAssociatedServiceTypeFactory associatedServiceTypesSetFor:a4];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __77__HFAssociatedServiceTypeOptionItemProvider__allItemsForService_serviceType___block_invoke;
  v17 = &unk_264097E10;
  id v19 = a1;
  id v8 = v6;
  id v18 = v8;
  id v9 = objc_msgSend(v7, "na_map:", &v14);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFFA08], "set", v14, v15, v16, v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

uint64_t __77__HFAssociatedServiceTypeOptionItemProvider__allItemsForService_serviceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _itemForService:*(void *)(a1 + 32) associatedServiceType:a2];
}

+ (id)_itemForService:(id)a3 associatedServiceType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x263F0E708], "hf_userFriendlyLocalizedCapitalizedDescription:", v6);
  id v8 = [v5 serviceSubtype];
  id v9 = +[HFServiceIconFactory defaultIconDescriptorForServiceType:v6 serviceSubtype:v8];

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    NSLog(&cfstr_MissingTitleOr.isa, v6);
    v12 = 0;
  }
  else
  {
    id v11 = [HFAssociatedServiceTypeOptionItem alloc];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __83__HFAssociatedServiceTypeOptionItemProvider__itemForService_associatedServiceType___block_invoke;
    v14[3] = &unk_264097E38;
    id v15 = v7;
    id v16 = v9;
    id v17 = v6;
    id v18 = v5;
    v12 = [(HFStaticItem *)v11 initWithResultsBlock:v14];
  }
  return v12;
}

id __83__HFAssociatedServiceTypeOptionItemProvider__itemForService_associatedServiceType___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v2 = *(_OWORD *)(a1 + 32);
  v13[0] = @"title";
  v13[1] = @"icon";
  long long v14 = v2;
  v13[2] = @"associatedServiceType";
  uint64_t v15 = *(void *)(a1 + 48);
  v3 = [NSDictionary dictionaryWithObjects:&v14 forKeys:v13 count:3];
  id v4 = (void *)[v3 mutableCopy];

  if (*(void *)(a1 + 56))
  {
    id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
    [v4 setObject:v5 forKeyedSubscript:@"dependentHomeKitObjects"];

    id v6 = [*(id *)(a1 + 56) associatedServiceType];

    v7 = *(void **)(a1 + 56);
    if (v6) {
      [v7 associatedServiceType];
    }
    else {
    id v8 = [v7 serviceType];
    }
    uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 48)];

    BOOL v10 = [NSNumber numberWithBool:v9];
    [v4 setObject:v10 forKeyedSubscript:@"selected"];
  }
  id v11 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v11;
}

- (HMHome)home
{
  return self->_home;
}

- (HMService)service
{
  return self->_service;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end