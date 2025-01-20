@interface HFDiscoveredAccessoryItem
- (HFCharacteristicValueSource)valueSource;
- (HFDiscoveredAccessory)discoveredAccessory;
- (HFDiscoveredAccessoryItem)init;
- (HFDiscoveredAccessoryItem)initWithDiscoveredAccessory:(id)a3;
- (HFDiscoveredAccessoryItem)initWithDiscoveredAccessory:(id)a3 valueSource:(id)a4;
- (HMHome)home;
- (NSSet)services;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)namingComponentForHomeKitObject;
@end

@implementation HFDiscoveredAccessoryItem

- (HFDiscoveredAccessoryItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithDiscoveredAccessory_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDiscoveredAccessoryItem.m", 31, @"%s is unavailable; use %@ instead",
    "-[HFDiscoveredAccessoryItem init]",
    v5);

  return 0;
}

- (HFDiscoveredAccessoryItem)initWithDiscoveredAccessory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDiscoveredAccessoryItem;
  v6 = [(HFDiscoveredAccessoryItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_discoveredAccessory, a3);
  }

  return v7;
}

- (HFDiscoveredAccessoryItem)initWithDiscoveredAccessory:(id)a3 valueSource:(id)a4
{
  id v7 = a4;
  v8 = [(HFDiscoveredAccessoryItem *)self initWithDiscoveredAccessory:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_valueSource, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFDiscoveredAccessoryItem *)self valueSource];
  id v5 = [(HFDiscoveredAccessoryItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  v3 = +[HFNamingComponents namingComponentFromDiscoveredAccessory:v2];

  return v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  id v7 = (void *)[v5 initWithDiscoveredAccessory:v6 valueSource:v4];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (HMHome)home
{
  v2 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  v3 = [v2 accessory];
  id v4 = [v3 home];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = +[HFHomeKitDispatcher sharedDispatcher];
    id v6 = [v7 home];
  }
  return (HMHome *)v6;
}

- (NSSet)services
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  id v4 = [v3 accessory];
  uint64_t v5 = [v4 services];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x263EFFA68];
  }
  v8 = [v2 setWithArray:v7];

  return (NSSet *)v8;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  id v4 = [v3 accessory];
  uint64_t v5 = objc_msgSend(v2, "na_setWithSafeObject:", v4);

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];

  if (!v4) {
    NSLog(&cfstr_Discoveredacce.isa);
  }
  uint64_t v5 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];

  if (!v5)
  {
    v27 = (void *)MEMORY[0x263F58190];
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v6 = (HFMutableItemUpdateOutcome *)objc_claimAutoreleasedReturnValue();
    v28 = [v27 futureWithError:v6];
    goto LABEL_19;
  }
  id v6 = objc_alloc_init(HFMutableItemUpdateOutcome);
  [(HFMutableItemUpdateOutcome *)v6 setObject:&unk_26C0F7AD0 forKeyedSubscript:@"state"];
  uint64_t v7 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  v8 = [v7 name];

  if (v8)
  {
    objc_super v9 = [HFServiceNameComponents alloc];
    v10 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
    v11 = [v10 name];
    v12 = [(HFServiceNameComponents *)v9 initWithRawServiceName:v11 rawRoomName:0];

    [(HFMutableItemUpdateOutcome *)v6 setObject:v12 forKeyedSubscript:@"serviceNameComponents"];
    v13 = [(HFServiceNameComponents *)v12 composedString];
    [(HFMutableItemUpdateOutcome *)v6 setObject:v13 forKeyedSubscript:@"title"];
  }
  v14 = (void *)MEMORY[0x263F1C6C8];
  v15 = [MEMORY[0x263F1C550] systemGrayColor];
  v16 = [v14 configurationWithHierarchicalColor:v15];

  v17 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2F8] scale:3];
  v18 = [v17 configurationByApplyingConfiguration:v16];
  v19 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  v20 = [v19 sharingDevice];
  int v21 = [v20 deviceActionType];

  if (v21 == 33 || v21 == 11)
  {
    v22 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
    v23 = [v22 sharingDevice];
    int v24 = [v23 deviceModelCode];

    v25 = [HFImageIconDescriptor alloc];
    if (v24 == 5) {
      v26 = HFSymbolIconIdentifierHomePodMiniSingle;
    }
    else {
      v26 = HFSymbolIconIdentifierHomePodSingle;
    }
    goto LABEL_14;
  }
  v29 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
  v30 = [v29 sharingDevice];
  int v31 = [v30 deviceActionType];

  if (v31 == 6)
  {
    v25 = [HFImageIconDescriptor alloc];
    v26 = HFSymbolIconIdentifierAppleTV;
LABEL_14:
    v32 = [(HFImageIconDescriptor *)v25 initWithSystemImageNamed:*v26 configuration:v18];
    [(HFMutableItemUpdateOutcome *)v6 setObject:v32 forKeyedSubscript:@"icon"];
  }
  v33 = [(HFItemUpdateOutcome *)v6 objectForKeyedSubscript:@"icon"];

  if (!v33)
  {
    v34 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
    v35 = [v34 category];

    if (v35)
    {
      v36 = [(HFDiscoveredAccessoryItem *)self discoveredAccessory];
      v37 = [v36 category];
      v38 = +[HFServiceIconFactory iconDescriptorForAccessoryCategory:v37];
      [(HFMutableItemUpdateOutcome *)v6 setObject:v38 forKeyedSubscript:@"icon"];
    }
  }
  v28 = [MEMORY[0x263F58190] futureWithResult:v6];

LABEL_19:
  return v28;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFDiscoveredAccessory)discoveredAccessory
{
  return self->_discoveredAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccessory, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

@end