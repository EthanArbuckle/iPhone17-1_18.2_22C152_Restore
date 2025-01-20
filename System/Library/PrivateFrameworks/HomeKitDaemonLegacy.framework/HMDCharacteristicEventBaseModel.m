@interface HMDCharacteristicEventBaseModel
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7 checkForSupport:(BOOL)a8 outCharateristic:(id *)a9;
+ (id)properties;
- (id)dependentUUIDs;
@end

@implementation HMDCharacteristicEventBaseModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7 checkForSupport:(BOOL)a8 outCharateristic:(id *)a9
{
  BOOL v9 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = objc_msgSend(v13, "hmf_numberForKey:", @"kServiceInstanceID");
  v18 = HAPInstanceIDFromValue();

  v19 = objc_msgSend(v13, "hmf_numberForKey:", @"kCharacteristicInstanceID");
  v20 = HAPInstanceIDFromValue();

  v21 = objc_msgSend(v13, "hmf_UUIDForKey:", @"kAccessoryUUID");
  id v33 = 0;
  LOBYTE(v30) = 1;
  v22 = +[HMDCharacteristicEventBase lookForCharacteristicByAccessoryUUID:v21 serviceID:v18 characteristicID:v20 inHome:v14 checkForSupport:v9 outError:&v33 shouldLog:v30];
  id v23 = v33;
  id v24 = 0;
  if (!v23)
  {
    v31 = v18;
    if (a9) {
      *a9 = v22;
    }
    id v24 = +[HMDEventModel eventModelWithDictionary:v13 home:v14 eventTriggerUUID:v15 className:a6 message:v16];
    [v21 UUIDString];
    id v25 = v14;
    id v26 = v16;
    v28 = id v27 = v15;
    [v24 setAccessory:v28];

    id v15 = v27;
    id v16 = v26;
    id v14 = v25;
    v18 = v31;
    [v24 setServiceID:v31];
    [v24 setCharacteristicID:v20];
  }
  return v24;
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDCharacteristicEventBaseModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_128330 != -1) {
    dispatch_once(&properties_onceToken_128330, block);
  }
  v2 = (void *)properties__properties_128331;
  return v2;
}

void __45__HMDCharacteristicEventBaseModel_properties__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicEventBaseModel;
  v2 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_128331;
  properties__properties_128331 = v3;

  v5 = (void *)properties__properties_128331;
  v11[0] = @"accessory";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v6;
  v11[1] = @"serviceID";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v7;
  v11[2] = @"characteristicID";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 addEntriesFromDictionary:v9];
}

- (id)dependentUUIDs
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  v6 = [(HMDCharacteristicEventBaseModel *)self serviceID];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F29128]);
    v8 = [(HMDCharacteristicEventBaseModel *)self accessory];
    BOOL v9 = (void *)[v7 initWithUUIDString:v8];
    objc_super v10 = [(HMDCharacteristicEventBaseModel *)self serviceID];
    v11 = +[HMDService generateUUIDWithAccessoryUUID:v9 serviceID:v10];

    [v3 addObject:v11];
  }
  return v3;
}

@end