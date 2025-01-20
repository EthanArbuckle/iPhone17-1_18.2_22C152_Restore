@interface HFDemoModeAccessoryItem
+ (id)accessoryItemForAccessory:(id)a3;
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (BOOL)isContainedWithinItemGroup;
- (BOOL)isItemGroup;
- (BOOL)isMediaSystemDemoType;
- (HFCharacteristicValueSource)valueSource;
- (HFDemoModeAccessoryItem)initWithAccessory:(id)a3;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSDictionary)configInfo;
- (NSSet)services;
- (id)_iconDescriptor;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hf_serviceNameComponents;
- (id)namingComponentForHomeKitObject;
- (id)serviceLikeBuilderInHome:(id)a3;
- (unint64_t)numberOfItemsContainedWithinGroup;
- (void)setAccessory:(id)a3;
- (void)setConfigInfo:(id)a3;
@end

@implementation HFDemoModeAccessoryItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "hf_homeKitObject");

  id v8 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    v10 = v8;
    if (v9) {
      goto LABEL_8;
    }
    v11 = [MEMORY[0x263F08690] currentHandler];
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v11 handleFailureInFunction:v12, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
  }
  v10 = 0;
LABEL_8:

  v13 = (void *)[objc_alloc((Class)a1) initWithAccessory:v10];
  return v13;
}

+ (id)accessoryItemForAccessory:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAccessory:v3];

  return v4;
}

- (HFCharacteristicValueSource)valueSource
{
  v2 = +[HFDemoModeAccessoryManager sharedManager];
  id v3 = [v2 valueSource];

  return (HFCharacteristicValueSource *)v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFDemoModeAccessoryItem *)self accessory];
  uint64_t v6 = (void *)[v4 initWithAccessory:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(HFDemoModeAccessoryItem *)self valueSource];
  id v5 = [(HFDemoModeAccessoryItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFDemoModeAccessoryBuilder alloc];
  uint64_t v6 = [(HFDemoModeAccessoryItem *)self accessory];
  v7 = [(HFDemoModeAccessoryBuilder *)v5 initWithExistingObject:v6 inHome:v4];

  return v7;
}

- (HFDemoModeAccessoryItem)initWithAccessory:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDemoModeAccessoryItem;
  id v5 = [(HFDemoModeAccessoryItem *)&v9 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    id v7 = [(HFItem *)v6 updateWithOptions:MEMORY[0x263EFFA78]];
  }

  return v6;
}

- (id)hf_serviceNameComponents
{
  id v3 = [(HFDemoModeAccessoryItem *)self accessory];
  id v4 = [v3 name];

  id v5 = [(HFDemoModeAccessoryItem *)self accessory];
  uint64_t v6 = [v5 room];
  id v7 = [v6 name];

  id v8 = [[HFServiceNameComponents alloc] initWithRawServiceName:v4 rawRoomName:v7];
  return v8;
}

- (BOOL)isItemGroup
{
  return 0;
}

- (BOOL)isContainedWithinItemGroup
{
  return 0;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  return 1;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = [HFDemoModeMediaControlItem alloc];
  id v5 = [(HFDemoModeMediaControlItem *)v4 initWithDisplayResults:MEMORY[0x263EFFA78]];
  uint64_t v6 = [(HFDemoModeAccessoryItem *)self accessory];
  [(HFDemoModeMediaControlItem *)v5 setAccessory:v6];

  id v7 = [MEMORY[0x263EFFA08] setWithObject:v5];
  if ([(HFDemoModeAccessoryItem *)self isMediaSystemDemoType])
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] set];

    id v7 = (void *)v8;
  }
  objc_super v9 = [HFMutableItemUpdateOutcome alloc];
  v10 = [(HFItemUpdateOutcome *)v9 initWithResults:MEMORY[0x263EFFA78]];
  v11 = [(HFDemoModeAccessoryItem *)self hf_serviceNameComponents];
  [(HFMutableItemUpdateOutcome *)v10 setObject:v7 forKeyedSubscript:@"childItems"];
  [(HFMutableItemUpdateOutcome *)v10 setObject:v11 forKeyedSubscript:@"serviceNameComponents"];
  v12 = [(HFDemoModeAccessoryItem *)self _iconDescriptor];
  [(HFMutableItemUpdateOutcome *)v10 setObject:v12 forKeyedSubscript:@"icon"];
  if ([v12 isSystemImage])
  {
    v13 = [v12 imageIdentifier];
    [(HFMutableItemUpdateOutcome *)v10 setObject:v13 forKeyedSubscript:@"iconNames"];
  }
  v14 = [v11 rawServiceName];
  [(HFMutableItemUpdateOutcome *)v10 setObject:v14 forKeyedSubscript:@"controlDescription"];

  v15 = [(HFDemoModeAccessoryItem *)self accessory];
  v16 = [v15 room];
  v17 = [v16 uniqueIdentifier];
  [(HFMutableItemUpdateOutcome *)v10 setObject:v17 forKeyedSubscript:@"roomIdentifier"];

  v18 = [(HFDemoModeAccessoryItem *)self accessory];
  v19 = [v18 applicationData];
  v20 = [v19 objectForKeyedSubscript:@"primaryDisplayState"];

  objc_opt_class();
  id v21 = v20;
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  uint64_t v24 = [v23 integerValue];
  BOOL v25 = [(HFDemoModeAccessoryItem *)self isMediaSystemDemoType];
  if (v24 == 2)
  {
    [(HFMutableItemUpdateOutcome *)v10 setObject:&unk_26C0F7260 forKeyedSubscript:@"state"];
    [(HFMutableItemUpdateOutcome *)v10 setObject:&unk_26C0F7260 forKeyedSubscript:@"value"];
    v26 = @"HFCharacteristicValuePowerStateOn";
    v27 = @"HFMediaAccessoryStateDescriptionPlaying";
  }
  else
  {
    [(HFMutableItemUpdateOutcome *)v10 setObject:&unk_26C0F7278 forKeyedSubscript:@"state"];
    [(HFMutableItemUpdateOutcome *)v10 setObject:&unk_26C0F7278 forKeyedSubscript:@"value"];
    v26 = @"HFCharacteristicValuePowerStateOff";
    v27 = @"HFMediaAccessoryStateDescriptionPaused";
  }
  if (v25) {
    v28 = v27;
  }
  else {
    v28 = v26;
  }
  v29 = _HFLocalizedStringWithDefaultValue(v28, v28, 1);
  [(HFMutableItemUpdateOutcome *)v10 setObject:v29 forKeyedSubscript:@"description"];

  v30 = [MEMORY[0x263F58190] futureWithResult:v10];

  return v30;
}

- (HMHome)home
{
  v2 = [(HFDemoModeAccessoryItem *)self accessory];
  id v3 = [v2 home];

  return (HMHome *)v3;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFDemoModeAccessoryItem *)self accessory];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (NSSet)services
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (BOOL)isMediaSystemDemoType
{
  if (qword_26AB2E708 != -1) {
    dispatch_once(&qword_26AB2E708, &__block_literal_global_160);
  }
  id v3 = [(HFDemoModeAccessoryItem *)self accessory];
  id v4 = [v3 applicationData];
  id v5 = [v4 objectForKeyedSubscript:@"type"];

  LOBYTE(v3) = [(id)_MergedGlobals_3_2 containsObject:v5];
  return (char)v3;
}

void __48__HFDemoModeAccessoryItem_isMediaSystemDemoType__block_invoke()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"HomePod";
  v2[1] = @"HomePodMini";
  v2[2] = @"MediaSystem-HomePod";
  v2[3] = @"MediaSystem-HomePodMini";
  v2[4] = @"AppleTV";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  v1 = (void *)_MergedGlobals_3_2;
  _MergedGlobals_3_2 = v0;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFDemoModeAccessoryItem *)self accessory];
  id v3 = +[HFNamingComponents namingComponentFromHomeKitObject:v2];

  return v3;
}

- (id)_iconDescriptor
{
  id v3 = (void *)MEMORY[0x263F1C6C8];
  id v4 = [MEMORY[0x263F1C550] systemGrayColor];
  id v5 = [v3 configurationWithHierarchicalColor:v4];

  uint64_t v6 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2F8] scale:3];
  id v7 = [v6 configurationByApplyingConfiguration:v5];
  uint64_t v8 = [(HFDemoModeAccessoryItem *)self accessory];
  objc_super v9 = [v8 applicationData];
  v10 = [v9 objectForKeyedSubscript:@"type"];

  if ([v10 isEqualToString:@"AppleTV"])
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = @"appletv.fill";
LABEL_11:
    v13 = [(HFImageIconDescriptor *)v11 initWithSystemImageNamed:v12 configuration:v7];
    goto LABEL_12;
  }
  if ([v10 isEqualToString:@"HomePod"])
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = @"homepod.fill";
    goto LABEL_11;
  }
  if ([v10 isEqualToString:@"HomePodMini"])
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = @"homepodmini.fill";
    goto LABEL_11;
  }
  if ([v10 isEqualToString:@"MediaSystem-HomePod"])
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = @"homepod.2.fill";
    goto LABEL_11;
  }
  if ([v10 isEqualToString:@"MediaSystem-HomePodMini"])
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = @"homepodmini.2.fill";
    goto LABEL_11;
  }
  v15 = [(HFDemoModeAccessoryItem *)self accessory];
  v16 = [v15 applicationData];
  v17 = [v16 dictionary];
  v13 = +[HFDemoModeAccessoryManager imageIconDescriptorFromDictionary:v17];

LABEL_12:
  return v13;
}

- (HMAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (NSDictionary)configInfo
{
  return self->_configInfo;
}

- (void)setConfigInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configInfo, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

@end