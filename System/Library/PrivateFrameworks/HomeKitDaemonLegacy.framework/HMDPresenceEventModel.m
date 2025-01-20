@interface HMDPresenceEventModel
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
@end

@implementation HMDPresenceEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[HMDEventModel eventModelWithDictionary:v10 home:v11 eventTriggerUUID:v12 className:objc_opt_class() message:v13];
  v15 = objc_msgSend(v10, "hmf_stringForKey:", @"kPresenceEventPresence");
  [v14 setPresenceType:v15];

  v16 = [v14 presenceType];
  char v17 = [v16 isEqualToString:*MEMORY[0x1E4F2DCB0]];

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F2DCC8];
  }
  else
  {
    v19 = [v14 presenceType];
    char v20 = [v19 isEqualToString:*MEMORY[0x1E4F2DCB8]];

    if ((v20 & 1) == 0)
    {
      v31 = objc_msgSend(v10, "hmf_arrayForKey:", @"kPresenceEventUsers");
      [v14 setUsers:v31];

      goto LABEL_14;
    }
    v18 = (void *)MEMORY[0x1E4F2DCD0];
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
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v14 setUsers:v25];
  }
  v26 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Populated tracked users %@", buf, 0x16u);
  }

  id v12 = v35;
LABEL_14:
  v32 = [MEMORY[0x1E4F2EA30] activationGranularityWithDict:v10];
  v33 = [v32 number];
  [v14 setActivation:v33];

  return v14;
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDPresenceEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_30509 != -1) {
    dispatch_once(&properties_onceToken_30509, block);
  }
  v2 = (void *)properties__properties_30510;
  return v2;
}

void __35__HMDPresenceEventModel_properties__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDPresenceEventModel;
  v2 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_30510;
  properties__properties_30510 = v3;

  v5 = (void *)properties__properties_30510;
  v11[0] = @"presenceType";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v6;
  v11[1] = @"activation";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v7;
  v11[2] = @"users";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 addEntriesFromDictionary:v9];
}

@end