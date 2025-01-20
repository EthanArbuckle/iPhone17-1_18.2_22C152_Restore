@interface HFServiceBuilderItem
- (HFCharacteristicValueSource)valueSource;
- (HFHomeKitObject)homeKitObject;
- (HFServiceBuilder)serviceBuilder;
- (HFServiceBuilderItem)init;
- (HFServiceBuilderItem)initWithServiceBuilder:(id)a3;
- (HFServiceBuilderItem)initWithServiceBuilder:(id)a3 valueSource:(id)a4;
- (HFServiceItem)serviceItem;
- (HMHome)home;
- (NSSet)services;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)namingComponentForHomeKitObject;
@end

@implementation HFServiceBuilderItem

- (HFServiceBuilderItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithServiceBuilder_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFServiceBuilderItem.m", 30, @"%s is unavailable; use %@ instead",
    "-[HFServiceBuilderItem init]",
    v5);

  return 0;
}

- (HFServiceBuilderItem)initWithServiceBuilder:(id)a3
{
  id v4 = a3;
  v5 = [v4 home];
  v6 = objc_msgSend(v5, "hf_characteristicValueManager");
  v7 = [(HFServiceBuilderItem *)self initWithServiceBuilder:v4 valueSource:v6];

  return v7;
}

- (HFServiceBuilderItem)initWithServiceBuilder:(id)a3 valueSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceBuilderItem;
  v9 = [(HFServiceBuilderItem *)&v14 init];
  if (v9)
  {
    v10 = [v7 service];
    uint64_t v11 = +[HFServiceItem serviceItemForService:v10 valueSource:v8];
    serviceItem = v9->_serviceItem;
    v9->_serviceItem = (HFServiceItem *)v11;

    objc_storeStrong((id *)&v9->_serviceBuilder, a3);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(HFServiceBuilderItem *)self valueSource];
  id v5 = [(HFServiceBuilderItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFServiceBuilderItem *)self serviceBuilder];
  id v7 = (void *)[v5 initWithServiceBuilder:v6 valueSource:v4];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HFServiceBuilderItem *)self serviceItem];
  v6 = [v5 updateWithOptions:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HFServiceBuilderItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408E470;
  v9[4] = self;
  id v7 = [v6 flatMap:v9];

  return v7;
}

id __52__HFServiceBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 results];
  id v4 = +[HFItemUpdateOutcome outcomeWithResults:v3];

  id v5 = [*(id *)(a1 + 32) serviceBuilder];
  v6 = [v5 room];

  id v7 = [HFServiceNameComponents alloc];
  id v8 = [*(id *)(a1 + 32) serviceBuilder];
  v9 = [v8 name];
  v10 = [v6 name];
  uint64_t v11 = [(HFServiceNameComponents *)v7 initWithRawServiceName:v9 rawRoomName:v10];

  if (v11)
  {
    [v4 setObject:v11 forKeyedSubscript:@"serviceNameComponents"];
    v12 = [(HFServiceNameComponents *)v11 composedString];
    if (v12) {
      [v4 setObject:v12 forKeyedSubscript:@"title"];
    }
  }
  v13 = [v4 objectForKeyedSubscript:@"icon"];

  if (!v13)
  {
    objc_super v14 = [*(id *)(a1 + 32) serviceBuilder];
    v15 = [v14 iconDescriptor];
    [v4 setObject:v15 forKeyedSubscript:@"icon"];
  }
  v16 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v16;
}

- (HFHomeKitObject)homeKitObject
{
  v2 = [(HFServiceBuilderItem *)self serviceItem];
  v3 = [v2 homeKitObject];

  return (HFHomeKitObject *)v3;
}

- (NSSet)services
{
  v2 = [(HFServiceBuilderItem *)self serviceItem];
  v3 = [v2 services];

  return (NSSet *)v3;
}

- (HFCharacteristicValueSource)valueSource
{
  v2 = [(HFServiceBuilderItem *)self serviceItem];
  v3 = [v2 valueSource];

  return (HFCharacteristicValueSource *)v3;
}

- (id)accessories
{
  v2 = [(HFServiceBuilderItem *)self serviceItem];
  v3 = [v2 accessories];

  return v3;
}

- (HMHome)home
{
  v2 = [(HFServiceBuilderItem *)self serviceItem];
  v3 = [v2 home];

  return (HMHome *)v3;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFServiceBuilderItem *)self serviceItem];
  v3 = [v2 homeKitObject];
  id v4 = +[HFNamingComponents namingComponentFromHomeKitObject:v3];

  return v4;
}

- (HFServiceBuilder)serviceBuilder
{
  return self->_serviceBuilder;
}

- (HFServiceItem)serviceItem
{
  return self->_serviceItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceItem, 0);
  objc_storeStrong((id *)&self->_serviceBuilder, 0);
}

@end