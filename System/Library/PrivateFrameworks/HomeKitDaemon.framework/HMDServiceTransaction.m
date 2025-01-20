@interface HMDServiceTransaction
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)cd_createMKFCharacteristicFromDictionary:(id)a3 context:(id)a4;
+ (id)cd_modelTypeForCharacteristicFormat:(id)a3;
+ (id)properties;
- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4;
- (NSString)lastSeenConfiguredNameLocal;
- (OS_dispatch_group)configurationTracker;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (void)setConfigurationTracker:(id)a3;
- (void)setLastSeenConfiguredNameLocal:(id)a3;
@end

@implementation HMDServiceTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationTracker, 0);
  objc_storeStrong((id *)&self->_lastSeenConfiguredNameLocal, 0);
}

- (void)setConfigurationTracker:(id)a3
{
}

- (OS_dispatch_group)configurationTracker
{
  return self->_configurationTracker;
}

- (void)setLastSeenConfiguredNameLocal:(id)a3
{
}

- (NSString)lastSeenConfiguredNameLocal
{
  return self->_lastSeenConfiguredNameLocal;
}

+ (id)properties
{
  if (properties_onceToken_108543 != -1) {
    dispatch_once(&properties_onceToken_108543, &__block_literal_global_561);
  }
  v2 = (void *)properties__properties_108544;
  return v2;
}

void __35__HMDServiceTransaction_properties__block_invoke()
{
  v24[21] = *MEMORY[0x263EF8340];
  v23[0] = @"instanceID";
  v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[0] = v22;
  v23[1] = @"name";
  v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[1] = v21;
  v23[2] = @"providedName";
  v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[2] = v20;
  v23[3] = @"serviceType";
  v19 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[3] = v19;
  v23[4] = @"associatedServiceType";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[4] = v18;
  v23[5] = @"serviceSubtype";
  v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[5] = v17;
  v23[6] = @"labelIndex";
  v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[6] = v16;
  v23[7] = @"labelNamespace";
  v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[7] = v15;
  v23[8] = @"configurationState";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[8] = v14;
  v23[9] = @"linkedServices";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[9] = v13;
  v23[10] = @"hidden";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[10] = v12;
  v23[11] = @"primary";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[11] = v11;
  v23[12] = @"characteristics";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[12] = v0;
  v23[13] = @"expectedConfiguredName";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[13] = v1;
  v23[14] = @"lastKnownDiscoveryMode";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[14] = v2;
  v23[15] = @"lastKnownOperatingState";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[15] = v3;
  v23[16] = @"lastKnownOperatingStateAbnormalReasons";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[16] = v4;
  v23[17] = @"mediaSourceIdentifier";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[17] = v5;
  v23[18] = @"mediaSourceDisplayOrder";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[18] = v6;
  v23[19] = @"serviceProperties";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[19] = v7;
  v23[20] = @"matterEndpointID";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v24[20] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:21];
  v10 = (void *)properties__properties_108544;
  properties__properties_108544 = v9;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"serviceType"])
  {
    v11 = @"serviceType";
LABEL_7:
    uint64_t v12 = [(HMDBackingStoreModelObject *)self cd_uuidValueFromStringModelObjectField:v11];
LABEL_8:
    v13 = (void *)v12;
    goto LABEL_9;
  }
  if ([v9 isEqualToString:@"serviceSubtype"])
  {
    v11 = @"serviceSubtype";
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"associatedServiceType"])
  {
    v11 = @"associatedServiceType";
    goto LABEL_7;
  }
  if (![v9 isEqualToString:@"characteristics_"])
  {
    v35.receiver = self;
    v35.super_class = (Class)HMDServiceTransaction;
    uint64_t v12 = [(HMDBackingStoreModelObject *)&v35 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
    goto LABEL_8;
  }
  if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"characteristics"])
  {
    v15 = [(HMDBackingStoreModelObject *)self managedObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if (!v17) {
      _HMFPreconditionFailure();
    }
    v18 = (void *)MEMORY[0x263EFF9C0];
    v19 = [(HMDServiceTransaction *)self characteristics];
    v20 = objc_msgSend(v18, "setWithCapacity:", objc_msgSend(v19, "count"));

    v21 = [(HMDServiceTransaction *)self characteristics];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
    v38[3] = &unk_264A2F0F0;
    id v22 = v17;
    id v39 = v22;
    id v23 = v10;
    id v40 = v23;
    v41 = self;
    id v24 = v20;
    id v42 = v24;
    objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v38);

    v25 = [v22 characteristics];
    v26 = (void *)[v25 mutableCopy];

    [v26 minusSet:v24];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke_2;
    v36[3] = &unk_264A2BD70;
    id v37 = v23;
    v27 = (void *)MEMORY[0x230FBD990](objc_msgSend(v26, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36));
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      v34 = v27;
      v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      [v22 name];
      v32 = id v33 = v22;
      *(_DWORD *)buf = 138543874;
      v44 = v30;
      __int16 v45 = 2112;
      v46 = v31;
      __int16 v47 = 2112;
      v48 = v32;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Converted %@ characteristics into MKFCharacteristic for MKFService %@", buf, 0x20u);

      id v22 = v33;
      v27 = v34;
    }
    v13 = (void *)[v24 copy];
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

void __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(id *a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 objectForKeyedSubscript:@"characteristicInstanceID"];
  v4 = objc_msgSend(a1[4], "pr_findCharacteristicWithInstanceID:", v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "pr_updateWithDictionary:", v10);
    v7 = [v6 managedObjectContext];

    if (!v7) {
      [a1[5] insertObject:v6];
    }
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_class(), "cd_createMKFCharacteristicFromDictionary:context:", v10, a1[5]);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v4;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    [v9 setService:a1[4]];
    if (!v9) {
      goto LABEL_12;
    }
  }
  [a1[7] addObject:v4];

LABEL_12:
}

uint64_t __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v9 isEqualToString:@"primary"] & 1) != 0
    || ([v9 isEqualToString:@"hidden"] & 1) != 0)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"instanceID"])
  {
    uint64_t v12 = [v8 instanceID];
    uint64_t v13 = HAPInstanceIDFromValue();
LABEL_11:
    id v11 = (id)v13;
LABEL_12:

    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"serviceType"])
  {
    v14 = [v8 serviceType];
LABEL_10:
    uint64_t v12 = v14;
    uint64_t v13 = [v14 UUIDString];
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"serviceSubtype"])
  {
    v14 = [v8 serviceSubtype];
    goto LABEL_10;
  }
  if ([v9 isEqualToString:@"associatedServiceType"])
  {
    uint64_t v12 = [v8 associatedServiceType];
    uint64_t v16 = [v12 UUIDString];
    id v17 = (void *)v16;
    v18 = (void *)*MEMORY[0x263EFFD08];
    if (v16) {
      v18 = (void *)v16;
    }
    id v11 = v18;

    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"characteristics"])
  {
    v19 = (void *)MEMORY[0x263EFF980];
    v20 = [v8 characteristics];
    v21 = objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));

    id v22 = [v8 characteristics];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __115__HMDServiceTransaction_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke;
    v25[3] = &unk_264A2BD70;
    id v26 = v21;
    id v23 = v21;
    objc_msgSend(v22, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

    id v11 = (id)[v23 copy];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HMDServiceTransaction;
    id v11 = [(HMDBackingStoreModelObject *)&v24 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }
LABEL_13:

  return v11;
}

void __115__HMDServiceTransaction_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pr_dictionaryRepresentation");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDServiceTransaction;
  BOOL v7 = [(HMDBackingStoreModelObject *)&v11 cd_updateManagedObjectInContext:v6 error:a4];
  if (v7)
  {
    id v8 = [(HMDBackingStoreModelObject *)self managedObject];
    if ([v8 hasPersistentChangedValues])
    {
      id v9 = [v8 accessory];
      [v9 maybeFixUpCharacteristicWriteActionsInContext:v6];
    }
  }

  return v7;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"accessory";
}

+ (id)cd_createMKFCharacteristicFromDictionary:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [v6 objectForKeyedSubscript:@"characteristicMetadata"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"metadataFormat"];
  id v9 = (void *)v8;
  id v10 = @"unknown";
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  objc_super v11 = v10;

  uint64_t v12 = objc_msgSend((id)objc_opt_class(), "cd_modelTypeForCharacteristicFormat:", v11);

  uint64_t v13 = [(objc_class *)+[HMCContext managedObjectClassFromProtocol:v12] entity];
  v14 = (void *)[objc_alloc(MEMORY[0x263EFF280]) initWithEntity:v13 insertIntoManagedObjectContext:v5];

  v15 = [v6 objectForKeyedSubscript:@"characteristicInstanceID"];
  [v14 setInstanceID:v15];

  objc_msgSend(v14, "pr_updateWithDictionary:", v6);
  id v16 = v14;
  if ([v16 conformsToProtocol:&unk_26E4EA688]) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  return v18;
}

+ (id)cd_modelTypeForCharacteristicFormat:(id)a3
{
  uint64_t v3 = HAPCharacteristicFormatFromString();
  v4 = &unk_26E4EA688;
  if ((unint64_t)(v3 - 1) <= 0xE)
  {
    id v5 = *off_264A2BD90[v3 - 1];

    v4 = v5;
  }
  return v4;
}

@end