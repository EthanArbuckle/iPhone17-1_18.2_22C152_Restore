@interface HMDAppleMediaAccessoryModel
+ (id)appleMediaAccessoryModelWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
+ (id)homePodAccessoryModelWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
+ (id)properties;
- (id)_initWithObjectChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
@end

@implementation HMDAppleMediaAccessoryModel

- (id)_initWithObjectChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAppleMediaAccessoryModel;
  return [(HMDBackingStoreModelObject *)&v6 initWithObjectChangeType:a3 uuid:a4 parentUUID:a5];
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HMDAppleMediaAccessoryModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_92444 != -1) {
    dispatch_once(&properties_onceToken_92444, block);
  }
  v2 = (void *)properties__properties_92445;
  return v2;
}

void __41__HMDAppleMediaAccessoryModel_properties__block_invoke(uint64_t a1)
{
  v65[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v41.receiver = *(id *)(a1 + 32);
  v41.super_class = (Class)&OBJC_METACLASS___HMDAppleMediaAccessoryModel;
  v2 = objc_msgSendSuper2(&v41, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_92445;
  properties__properties_92445 = v3;

  v5 = (void *)properties__properties_92445;
  v64 = @"deviceUUID";
  objc_super v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v65[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
  [v5 addEntriesFromDictionary:v7];

  v8 = (void *)properties__properties_92445;
  v62 = @"device";
  v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v63 = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  [v8 addEntriesFromDictionary:v10];

  v11 = (void *)properties__properties_92445;
  v60 = @"pairingIdentity";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v61 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  [v11 addEntriesFromDictionary:v13];

  v14 = (void *)properties__properties_92445;
  v58 = @"loggedInAccount";
  v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v59 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  [v14 addEntriesFromDictionary:v16];

  v17 = (void *)properties__properties_92445;
  v56 = @"softwareVersion";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v57 = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  [v17 addEntriesFromDictionary:v19];

  v20 = (void *)properties__properties_92445;
  v54 = @"wifiNetworkInfo";
  v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v55 = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  [v20 addEntriesFromDictionary:v22];

  v23 = (void *)properties__properties_92445;
  v52 = @"appleMediaAccessoryChangeTag";
  v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v53 = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  [v23 addEntriesFromDictionary:v25];

  v26 = (void *)properties__properties_92445;
  v50 = @"supportedStereoPairVersions";
  v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v51 = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  [v26 addEntriesFromDictionary:v28];

  v29 = (void *)properties__properties_92445;
  v48 = @"preferredMediaUserUUID";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v49 = v30;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  [v29 addEntriesFromDictionary:v31];

  v32 = (void *)properties__properties_92445;
  v46 = @"preferredUserSelectionType";
  v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v47 = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  [v32 addEntriesFromDictionary:v34];

  v35 = (void *)properties__properties_92445;
  v44 = @"productColor";
  v36 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v45 = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  [v35 addEntriesFromDictionary:v37];

  v38 = (void *)properties__properties_92445;
  v42 = @"idsIdentifier";
  v39 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v43 = v39;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  [v38 addEntriesFromDictionary:v40];
}

+ (id)homePodAccessoryModelWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithObjectChangeType:a3 uuid:v8 parentUUID:v7];

  return v9;
}

+ (id)appleMediaAccessoryModelWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithObjectChangeType:a3 uuid:v8 parentUUID:v7];

  return v9;
}

@end