@interface HMDAppleMediaAccessoryModel
+ (Class)cd_entityClass;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
@end

@implementation HMDAppleMediaAccessoryModel

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqual:@"deviceUUID"])
  {
    v11 = [v8 device];
    v12 = [v11 identifier];
    uint64_t v13 = [v12 UUIDString];
    v14 = (void *)v13;
    v15 = (void *)*MEMORY[0x263EFFD08];
    if (v13) {
      v15 = (void *)v13;
    }
    v16 = v15;
    goto LABEL_8;
  }
  if ([v9 isEqual:@"device"])
  {
    v17 = [v8 device];
    v18 = [v17 identifier];

    if (v18)
    {
      v11 = +[HMDAccountRegistry sharedRegistry];
      v12 = [v8 device];
      v14 = [v12 identifier];
      v16 = [v11 deviceForIdentifier:v14];
LABEL_8:
      v19 = v16;

LABEL_9:
      goto LABEL_10;
    }
  }
  else
  {
    if (![v9 isEqual:@"deviceAddress"])
    {
      v23.receiver = self;
      v23.super_class = (Class)HMDAppleMediaAccessoryModel;
      v19 = [(HMDAccessoryTransaction *)&v23 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
      goto LABEL_10;
    }
    v19 = [v8 idsIdentifier];
    if (!v19) {
      goto LABEL_10;
    }
    v21 = [v8 idsDestination];

    if (v21)
    {
      v22 = [HMDDeviceAddress alloc];
      v11 = [v8 idsIdentifier];
      v12 = [v8 idsDestination];
      v19 = [(HMDDeviceAddress *)v22 initWithIDSIdentifier:v11 idsDestination:v12];
      goto LABEL_9;
    }
  }
  v19 = 0;
LABEL_10:

  return v19;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HMDAppleMediaAccessoryModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_136390 != -1) {
    dispatch_once(&properties_onceToken_136390, block);
  }
  v2 = (void *)properties__properties_136391;
  return v2;
}

void __41__HMDAppleMediaAccessoryModel_properties__block_invoke(uint64_t a1)
{
  v85[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v53.receiver = *(id *)(a1 + 32);
  v53.super_class = (Class)&OBJC_METACLASS___HMDAppleMediaAccessoryModel;
  v2 = objc_msgSendSuper2(&v53, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_136391;
  properties__properties_136391 = v3;

  v5 = (void *)properties__properties_136391;
  v84 = @"deviceUUID";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v85[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v85 forKeys:&v84 count:1];
  [v5 addEntriesFromDictionary:v7];

  id v8 = (void *)properties__properties_136391;
  v82 = @"device";
  id v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v83 = v9;
  id v10 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
  [v8 addEntriesFromDictionary:v10];

  v11 = (void *)properties__properties_136391;
  v80 = @"pairingIdentity";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v81 = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
  [v11 addEntriesFromDictionary:v13];

  v14 = (void *)properties__properties_136391;
  v78 = @"loggedInAccount";
  v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v79 = v15;
  v16 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  [v14 addEntriesFromDictionary:v16];

  v17 = (void *)properties__properties_136391;
  v76 = @"softwareVersion";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v77 = v18;
  v19 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  [v17 addEntriesFromDictionary:v19];

  v20 = (void *)properties__properties_136391;
  v74 = @"variant";
  v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v75 = v21;
  v22 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  [v20 addEntriesFromDictionary:v22];

  objc_super v23 = (void *)properties__properties_136391;
  v72 = @"accessoryCapabilities";
  v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v73 = v24;
  v25 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  [v23 addEntriesFromDictionary:v25];

  v26 = (void *)properties__properties_136391;
  v70 = @"deviceAddress";
  v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v71 = v27;
  v28 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
  [v26 addEntriesFromDictionary:v28];

  v29 = (void *)properties__properties_136391;
  v68 = @"deviceIRKData";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v69 = v30;
  v31 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  [v29 addEntriesFromDictionary:v31];

  v32 = (void *)properties__properties_136391;
  v66 = @"wifiNetworkInfo";
  v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v67 = v33;
  v34 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
  [v32 addEntriesFromDictionary:v34];

  v35 = (void *)properties__properties_136391;
  v64 = @"appleMediaAccessoryChangeTag";
  v36 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v65 = v36;
  v37 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  [v35 addEntriesFromDictionary:v37];

  v38 = (void *)properties__properties_136391;
  v62 = @"supportedStereoPairVersions";
  v39 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v63 = v39;
  v40 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  [v38 addEntriesFromDictionary:v40];

  v41 = (void *)properties__properties_136391;
  v60 = @"preferredMediaUserUUID";
  v42 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v61 = v42;
  v43 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  [v41 addEntriesFromDictionary:v43];

  v44 = (void *)properties__properties_136391;
  v58 = @"preferredUserSelectionType";
  v45 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v59 = v45;
  v46 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  [v44 addEntriesFromDictionary:v46];

  v47 = (void *)properties__properties_136391;
  v56 = @"productColor";
  v48 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v57 = v48;
  v49 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  [v47 addEntriesFromDictionary:v49];

  v50 = (void *)properties__properties_136391;
  v54 = @"idsIdentifier";
  v51 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v55 = v51;
  v52 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  [v50 addEntriesFromDictionary:v52];
}

@end