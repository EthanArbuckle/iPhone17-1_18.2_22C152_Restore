@interface HMDCharacteristicWriteActionModel
+ (id)properties;
- (id)dependentUUIDs;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDCharacteristicWriteActionModel

- (id)dependentUUIDs
{
  v15.receiver = self;
  v15.super_class = (Class)HMDCharacteristicWriteActionModel;
  v3 = [(HMDBackingStoreModelObject *)&v15 dependentUUIDs];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v5)
  {
    v6 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v4 addObject:v6];
  }
  v7 = [(HMDCharacteristicWriteActionModel *)self accessory];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    v9 = [(HMDCharacteristicWriteActionModel *)self accessory];
    v10 = (void *)[v8 initWithUUIDString:v9];

    [v4 addObject:v10];
    v11 = [(HMDCharacteristicWriteActionModel *)self serviceID];

    if (v11)
    {
      v12 = [(HMDCharacteristicWriteActionModel *)self serviceID];
      v13 = +[HMDService generateUUIDWithAccessoryUUID:v10 serviceID:v12];

      [v4 addObject:v13];
    }
  }
  return v4;
}

- (void)loadModelWithActionInformation:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicWriteActionModel;
  id v4 = a3;
  [(HMDActionModel *)&v11 loadModelWithActionInformation:v4];
  v5 = objc_msgSend(v4, "hmf_stringForKey:", @"kAccessoryUUID", v11.receiver, v11.super_class);
  [(HMDCharacteristicWriteActionModel *)self setAccessory:v5];

  v6 = objc_msgSend(v4, "hmf_numberForKey:", @"kServiceInstanceID");
  v7 = HAPInstanceIDFromValue();
  [(HMDCharacteristicWriteActionModel *)self setServiceID:v7];

  id v8 = objc_msgSend(v4, "hmf_numberForKey:", @"kCharacteristicInstanceID");
  v9 = HAPInstanceIDFromValue();
  [(HMDCharacteristicWriteActionModel *)self setCharacteristicID:v9];

  v10 = [v4 objectForKeyedSubscript:@"kCharacteristicValue"];

  [(HMDCharacteristicWriteActionModel *)self setTargetValue:v10];
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDCharacteristicWriteActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_120604 != -1) {
    dispatch_once(&properties_onceToken_120604, block);
  }
  v2 = (void *)properties__properties_120605;
  return v2;
}

void __47__HMDCharacteristicWriteActionModel_properties__block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicWriteActionModel;
  v1 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)properties__properties_120605;
  properties__properties_120605 = v2;

  id v4 = (void *)properties__properties_120605;
  v11[0] = @"accessory";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v5;
  v11[1] = @"serviceID";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v6;
  v11[2] = @"characteristicID";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v7;
  v11[3] = @"targetValue";
  id v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  [v4 addEntriesFromDictionary:v9];
}

@end