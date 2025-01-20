@interface HMDCharacteristicEventBaseModel
+ (Class)cd_entityClass;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7 checkForSupport:(BOOL)a8 outCharateristic:(id *)a9;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
@end

@implementation HMDCharacteristicEventBaseModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"service"])
  {
    BOOL v11 = [(HMDBackingStoreModelObject *)self propertyWasSet:@"accessory"];
    BOOL v12 = [(HMDBackingStoreModelObject *)self propertyWasSet:@"serviceID"];
    if (v11 || v12)
    {
      if (!v11 || !v12)
      {
        v19 = (HMDCharacteristicEventBaseModel *)_HMFPreconditionFailure();
        return [(HMDCharacteristicEventBaseModel *)v19 cd_generateValueForModelObjectFromManagedObject:v21 modelObjectField:v22 modelFieldInfo:v23];
      }
      v14 = [(HMDCharacteristicEventBaseModel *)self accessory];
      uint64_t v15 = [(HMDCharacteristicEventBaseModel *)self serviceID];
      v16 = (void *)v15;
      if (v14 && v15)
      {
        uint64_t v17 = +[HMDHAPAccessoryTransaction cd_getMKFServiceFromAccessoryUUID:v14 serviceInstanceId:v15];
      }
      else
      {
        uint64_t v17 = [MEMORY[0x263EFF9D0] null];
      }
      v13 = (void *)v17;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HMDCharacteristicEventBaseModel;
    v13 = [(HMDBackingStoreModelObject *)&v24 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v13;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"accessory"])
  {
    BOOL v11 = [v8 service];
    BOOL v12 = [v11 accessory];
    v13 = [v12 modelID];
    uint64_t v14 = [v13 UUIDString];
    uint64_t v15 = (void *)v14;
    v16 = (void *)*MEMORY[0x263EFFD08];
    if (v14) {
      v16 = (void *)v14;
    }
    id v17 = v16;

LABEL_9:
LABEL_10:

    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"serviceID"])
  {
    BOOL v11 = [v8 service];
    BOOL v12 = [v11 instanceID];
    uint64_t v18 = HAPInstanceIDFromValue();
    v13 = (void *)v18;
    v19 = (void *)*MEMORY[0x263EFFD08];
    if (v18) {
      v19 = (void *)v18;
    }
    id v17 = v19;
    goto LABEL_9;
  }
  if ([v9 isEqualToString:@"characteristicID"])
  {
    BOOL v11 = [v8 characteristicID];
    uint64_t v21 = HAPInstanceIDFromValue();
    BOOL v12 = (void *)v21;
    id v22 = (void *)*MEMORY[0x263EFFD08];
    if (v21) {
      id v22 = (void *)v21;
    }
    id v17 = v22;
    goto LABEL_10;
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicEventBaseModel;
  id v17 = [(HMDBackingStoreModelObject *)&v23 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
LABEL_11:

  return v17;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7 checkForSupport:(BOOL)a8 outCharateristic:(id *)a9
{
  BOOL v9 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = objc_msgSend(v13, "hmf_numberForKey:", @"kServiceInstanceID");
  uint64_t v18 = HAPInstanceIDFromValue();

  v19 = objc_msgSend(v13, "hmf_numberForKey:", @"kCharacteristicInstanceID");
  SEL v20 = HAPInstanceIDFromValue();

  uint64_t v21 = objc_msgSend(v13, "hmf_UUIDForKey:", @"kAccessoryUUID");
  id v33 = 0;
  LOBYTE(v30) = 1;
  id v22 = +[HMDCharacteristicEventBase lookForCharacteristicByAccessoryUUID:v21 serviceID:v18 characteristicID:v20 inHome:v14 checkForSupport:v9 outError:&v33 shouldLog:v30];
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
    uint64_t v18 = v31;
    [v24 setServiceID:v31];
    [v24 setCharacteristicID:v20];
  }
  return v24;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HMDCharacteristicEventBaseModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_184571 != -1) {
    dispatch_once(&properties_onceToken_184571, block);
  }
  v2 = (void *)properties__properties_184572;
  return v2;
}

void __45__HMDCharacteristicEventBaseModel_properties__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicEventBaseModel;
  v2 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_184572;
  properties__properties_184572 = v3;

  v5 = (void *)properties__properties_184572;
  v11[0] = @"accessory";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v6;
  v11[1] = @"serviceID";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v7;
  v11[2] = @"characteristicID";
  id v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v8;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 addEntriesFromDictionary:v9];
}

- (id)dependentUUIDs
{
  uint64_t v3 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  v6 = [(HMDCharacteristicEventBaseModel *)self serviceID];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    id v8 = [(HMDCharacteristicEventBaseModel *)self accessory];
    BOOL v9 = (void *)[v7 initWithUUIDString:v8];
    objc_super v10 = [(HMDCharacteristicEventBaseModel *)self serviceID];
    BOOL v11 = +[HMDService generateUUIDWithAccessoryUUID:v9 serviceID:v10];

    [v3 addObject:v11];
  }
  return v3;
}

@end