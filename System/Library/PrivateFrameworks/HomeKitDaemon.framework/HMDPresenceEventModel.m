@interface HMDPresenceEventModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDPresenceEventModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"users_"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"users"]) {
      goto LABEL_6;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_9;
  }
  if ([v9 isEqualToString:@"guests_"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"users"])
    {
LABEL_6:
      v11 = [(HMDPresenceEventModel *)self users];
      v12 = +[HMDBackingStore cdlsFetchManagedObjectsWithUUIDStrings:v11 ofManagedObjectType:objc_opt_class()];

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)HMDPresenceEventModel;
  v12 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
LABEL_9:

  return v12;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"users"])
  {
    v11 = [MEMORY[0x263EFF980] array];
    v12 = [v8 users];
    v13 = +[HMDBackingStore cdlsModelIDStringsForManagedObjects:v12];

    [v11 addObjectsFromArray:v13];
    objc_super v14 = [v8 guests];
    v15 = +[HMDBackingStore cdlsModelIDStringsForManagedObjects:v14];

    [v11 addObjectsFromArray:v15];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDPresenceEventModel;
    v11 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }

  return v11;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"trigger";
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  v40[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = +[HMDEventModel eventModelWithDictionary:v10 home:v11 eventTriggerUUID:v12 className:objc_opt_class() message:v13];
  v15 = objc_msgSend(v10, "hmf_stringForKey:", @"kPresenceEventPresence");
  [v14 setPresenceType:v15];

  v16 = [v14 presenceType];
  char v17 = [v16 isEqualToString:*MEMORY[0x263F0D4B8]];

  if (v17)
  {
    v18 = (void *)MEMORY[0x263F0D4D0];
  }
  else
  {
    v19 = [v14 presenceType];
    char v20 = [v19 isEqualToString:*MEMORY[0x263F0D4C0]];

    if ((v20 & 1) == 0)
    {
      v31 = objc_msgSend(v10, "hmf_arrayForKey:", @"kPresenceEventUsers");
      [v14 setUsers:v31];

      goto LABEL_14;
    }
    v18 = (void *)MEMORY[0x263F0D4D8];
  }
  [v14 setPresenceType:*v18];
  id v35 = v12;
  if (v13) {
    [v13 userForHome:v11];
  }
  else {
  v21 = [v11 currentUser];
  }
  v22 = v21;
  if (v21)
  {
    v23 = [v21 uuid];
    v24 = [v23 UUIDString];
    v40[0] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
    [v14 setUsers:v25];
  }
  v26 = (void *)MEMORY[0x230FBD990]();
  id v27 = a1;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    v30 = [v14 users];
    *(_DWORD *)buf = 138543618;
    v37 = v29;
    __int16 v38 = 2112;
    v39 = v30;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Populated tracked users %@", buf, 0x16u);
  }

  id v12 = v35;
LABEL_14:
  v32 = [MEMORY[0x263F0E680] activationGranularityWithDict:v10];
  v33 = [v32 number];
  [v14 setActivation:v33];

  return v14;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDPresenceEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_43439 != -1) {
    dispatch_once(&properties_onceToken_43439, block);
  }
  v2 = (void *)properties__properties_43440;
  return v2;
}

void __35__HMDPresenceEventModel_properties__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDPresenceEventModel;
  v2 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_43440;
  properties__properties_43440 = v3;

  v5 = (void *)properties__properties_43440;
  v11[0] = @"presenceType";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v6;
  v11[1] = @"activation";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v7;
  v11[2] = @"users";
  id v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 addEntriesFromDictionary:v9];
}

@end