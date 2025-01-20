@interface HMDCharacteristicWriteActionModel
+ (Class)cd_entityClass;
+ (id)properties;
- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDCharacteristicWriteActionModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"accessory"])
  {
    if (![v9 isEqualToString:@"service"])
    {
      v25.receiver = self;
      v25.super_class = (Class)HMDCharacteristicWriteActionModel;
      v17 = [(HMDBackingStoreModelObject *)&v25 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
      goto LABEL_22;
    }
    BOOL v12 = [(HMDBackingStoreModelObject *)self propertyWasSet:@"accessory"];
    BOOL v13 = [(HMDBackingStoreModelObject *)self propertyWasSet:@"serviceID"];
    if (v12 || v13)
    {
      if (v12 && v13)
      {
        v11 = [(HMDCharacteristicWriteActionModel *)self accessory];
        uint64_t v14 = [(HMDCharacteristicWriteActionModel *)self serviceID];
        v15 = (void *)v14;
        if (v11 && v14)
        {
          uint64_t v16 = +[HMDHAPAccessoryTransaction cd_getMKFServiceFromAccessoryUUID:v11 serviceInstanceId:v14];
        }
        else
        {
          uint64_t v16 = [MEMORY[0x263EFF9D0] null];
        }
        v17 = (void *)v16;

        goto LABEL_21;
      }
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        v22 = HMFBooleanToString();
        v23 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        v27 = v21;
        __int16 v28 = 2112;
        v29 = v19;
        __int16 v30 = 2112;
        v31 = v22;
        __int16 v32 = 2112;
        v33 = v23;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@: Cannot resolve service (haveAccessoryUUID=%@, haveServiceID=%@)", buf, 0x2Au);
      }
    }
LABEL_18:
    v17 = 0;
    goto LABEL_22;
  }
  if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"accessory"]) {
    goto LABEL_18;
  }
  v11 = [(HMDCharacteristicWriteActionModel *)self accessory];
  if (v11) {
    +[HMDHAPAccessoryTransaction cd_getMKFHAPAccessoryFromAccessory:v11];
  }
  else {
  v17 = [MEMORY[0x263EFF9D0] null];
  }
LABEL_21:

LABEL_22:
  return v17;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"accessory"])
  {
    v11 = [v8 accessory];

    if (v11)
    {
      BOOL v12 = [v8 accessory];
      BOOL v13 = [v12 modelID];
      id v14 = [v13 UUIDString];
LABEL_12:
      id v18 = v14;
LABEL_17:

      goto LABEL_18;
    }
    BOOL v12 = [v8 service];
    BOOL v13 = [v12 accessory];
    uint64_t v16 = [v13 modelID];
    uint64_t v21 = [v16 UUIDString];
    v22 = (void *)v21;
    v23 = (void *)*MEMORY[0x263EFFD08];
    if (v21) {
      v23 = (void *)v21;
    }
    id v18 = v23;

LABEL_16:
    goto LABEL_17;
  }
  if ([v9 isEqualToString:@"serviceID"])
  {
    BOOL v12 = [v8 service];
    BOOL v13 = [v12 instanceID];
    uint64_t v15 = HAPInstanceIDFromValue();
    uint64_t v16 = (void *)v15;
    v17 = (void *)*MEMORY[0x263EFFD08];
    if (v15) {
      v17 = (void *)v15;
    }
    id v18 = v17;
    goto LABEL_16;
  }
  if ([v9 isEqualToString:@"characteristicID"])
  {
    BOOL v12 = [v8 characteristicID];
    uint64_t v19 = HAPInstanceIDFromValue();
    BOOL v13 = (void *)v19;
    v20 = (void *)*MEMORY[0x263EFFD08];
    if (v19) {
      v20 = (void *)v19;
    }
    id v14 = v20;
    goto LABEL_12;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDCharacteristicWriteActionModel;
  id v18 = [(HMDBackingStoreModelObject *)&v25 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
LABEL_18:

  return v18;
}

- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCharacteristicWriteActionModel;
  BOOL v7 = [(HMDBackingStoreModelObject *)&v12 cd_updateManagedObjectInContext:v6 error:a4];
  if (v7)
  {
    id v8 = [(HMDBackingStoreModelObject *)self managedObject];
    if ([v8 hasPersistentChangedValues])
    {
      id v9 = [v8 service];
      id v10 = [v9 accessory];
      [v10 maybeFixUpCharacteristicWriteActionsInContext:v6];
    }
  }

  return v7;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

- (id)dependentUUIDs
{
  v15.receiver = self;
  v15.super_class = (Class)HMDCharacteristicWriteActionModel;
  v3 = [(HMDBackingStoreModelObject *)&v15 dependentUUIDs];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v5)
  {
    id v6 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v4 addObject:v6];
  }
  BOOL v7 = [(HMDCharacteristicWriteActionModel *)self accessory];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F08C38]);
    id v9 = [(HMDCharacteristicWriteActionModel *)self accessory];
    id v10 = (void *)[v8 initWithUUIDString:v9];

    [v4 addObject:v10];
    v11 = [(HMDCharacteristicWriteActionModel *)self serviceID];

    if (v11)
    {
      objc_super v12 = [(HMDCharacteristicWriteActionModel *)self serviceID];
      BOOL v13 = +[HMDService generateUUIDWithAccessoryUUID:v10 serviceID:v12];

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

  id v6 = objc_msgSend(v4, "hmf_numberForKey:", @"kServiceInstanceID");
  BOOL v7 = HAPInstanceIDFromValue();
  [(HMDCharacteristicWriteActionModel *)self setServiceID:v7];

  id v8 = objc_msgSend(v4, "hmf_numberForKey:", @"kCharacteristicInstanceID");
  id v9 = HAPInstanceIDFromValue();
  [(HMDCharacteristicWriteActionModel *)self setCharacteristicID:v9];

  id v10 = [v4 objectForKeyedSubscript:@"kCharacteristicValue"];

  [(HMDCharacteristicWriteActionModel *)self setTargetValue:v10];
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HMDCharacteristicWriteActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_175112 != -1) {
    dispatch_once(&properties_onceToken_175112, block);
  }
  v2 = (void *)properties__properties_175113;
  return v2;
}

void __47__HMDCharacteristicWriteActionModel_properties__block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x263EF8340];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicWriteActionModel;
  v1 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)properties__properties_175113;
  properties__properties_175113 = v2;

  id v4 = (void *)properties__properties_175113;
  v11[0] = @"accessory";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v5;
  v11[1] = @"serviceID";
  id v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v6;
  v11[2] = @"characteristicID";
  BOOL v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v7;
  v11[3] = @"targetValue";
  id v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[3] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  [v4 addEntriesFromDictionary:v9];
}

@end