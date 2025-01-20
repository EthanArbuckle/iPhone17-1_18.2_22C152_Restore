@interface HFAccessoryBuilderItem
- (HFAccessoryBuilder)accessoryBuilder;
- (HFAccessoryBuilderItem)init;
- (HFAccessoryBuilderItem)initWithAccessoryBuilder:(id)a3 valueSource:(id)a4;
- (HFCharacteristicValueSource)valueSource;
- (HFHomeKitObject)homeKitObject;
- (HFServiceLikeItem)accessoryItem;
- (HMHome)home;
- (NSSet)services;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)namingComponentForHomeKitObject;
- (void)setAccessoryBuilder:(id)a3;
- (void)setAccessoryItem:(id)a3;
@end

@implementation HFAccessoryBuilderItem

- (HFAccessoryBuilderItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessoryBuilder_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryBuilderItem.m", 32, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryBuilderItem init]",
    v5);

  return 0;
}

- (HFAccessoryBuilderItem)initWithAccessoryBuilder:(id)a3 valueSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HFAccessoryBuilderItem;
  v8 = [(HFAccessoryBuilderItem *)&v28 init];
  v9 = v8;
  if (v8)
  {
    [(HFAccessoryBuilderItem *)v8 setAccessoryBuilder:v6];
    v10 = [v6 accessory];
    int v11 = objc_msgSend(v10, "hf_isProgrammableSwitch");

    if (v11)
    {
      v12 = HFProgrammableSwitchAccessoryItem;
    }
    else
    {
      v16 = [v6 accessory];
      int v17 = objc_msgSend(v16, "hf_isCamera");

      if (v17)
      {
        v18 = [HFCameraItem alloc];
        v14 = [v6 accessory];
        v15 = [v14 cameraProfiles];
        v19 = [v15 firstObject];
        v20 = [(HFAccessoryProfileItem *)v18 initWithProfile:v19 valueSource:v7];
        [(HFAccessoryBuilderItem *)v9 setAccessoryItem:v20];

        goto LABEL_11;
      }
      v21 = [v6 accessory];
      int v22 = objc_msgSend(v21, "hf_isRemoteControl");

      if (v22)
      {
        v12 = HFTargetControlAccessoryItem;
      }
      else
      {
        v23 = [v6 accessory];
        v24 = [v23 mediaProfile];

        if (v24)
        {
          v25 = [HFMediaAccessoryItem alloc];
          v14 = [v6 accessory];
          v15 = [v14 mediaProfile];
          v26 = [(HFMediaAccessoryItem *)v25 initWithValueSource:v7 mediaProfileContainer:v15];
          [(HFAccessoryBuilderItem *)v9 setAccessoryItem:v26];

          goto LABEL_11;
        }
        v12 = HFAccessoryItem;
      }
    }
    id v13 = [v12 alloc];
    v14 = [v6 accessory];
    v15 = (void *)[v13 initWithAccessory:v14 valueSource:v7];
    [(HFAccessoryBuilderItem *)v9 setAccessoryItem:v15];
LABEL_11:
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFAccessoryBuilderItem *)self valueSource];
  id v5 = [(HFAccessoryBuilderItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HFAccessoryBuilderItem *)self accessoryBuilder];
  id v7 = (void *)[v5 initWithAccessoryBuilder:v6 valueSource:v4];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryBuilderItem *)self accessoryItem];
  id v6 = [v5 updateWithOptions:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HFAccessoryBuilderItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408E470;
  v9[4] = self;
  id v7 = [v6 flatMap:v9];

  return v7;
}

id __54__HFAccessoryBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 results];
  id v4 = +[HFItemUpdateOutcome outcomeWithResults:v3];

  id v5 = [*(id *)(a1 + 32) accessoryBuilder];
  id v6 = [v5 room];

  id v7 = [HFServiceNameComponents alloc];
  v8 = [*(id *)(a1 + 32) accessoryBuilder];
  v9 = [v8 name];
  v10 = [v6 name];
  int v11 = [(HFServiceNameComponents *)v7 initWithRawServiceName:v9 rawRoomName:v10];

  if (v11)
  {
    [v4 setObject:v11 forKeyedSubscript:@"serviceNameComponents"];
    v12 = [(HFServiceNameComponents *)v11 composedString];
    if (v12) {
      [v4 setObject:v12 forKeyedSubscript:@"title"];
    }
  }
  id v13 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v13;
}

- (HFHomeKitObject)homeKitObject
{
  v2 = [(HFAccessoryBuilderItem *)self accessoryItem];
  v3 = [v2 homeKitObject];

  return (HFHomeKitObject *)v3;
}

- (NSSet)services
{
  v2 = [(HFAccessoryBuilderItem *)self accessoryItem];
  v3 = [v2 services];

  return (NSSet *)v3;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFAccessoryBuilderItem *)self accessoryBuilder];
  id v4 = [v3 accessory];
  id v5 = [v2 setWithObject:v4];

  return v5;
}

- (HFCharacteristicValueSource)valueSource
{
  v2 = [(HFAccessoryBuilderItem *)self accessoryItem];
  v3 = [v2 valueSource];

  return (HFCharacteristicValueSource *)v3;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFAccessoryBuilderItem *)self accessoryItem];
  v3 = [v2 homeKitObject];
  id v4 = +[HFNamingComponents namingComponentFromHomeKitObject:v3];

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (HFAccessoryBuilder)accessoryBuilder
{
  return self->_accessoryBuilder;
}

- (void)setAccessoryBuilder:(id)a3
{
}

- (HFServiceLikeItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_accessoryBuilder, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end