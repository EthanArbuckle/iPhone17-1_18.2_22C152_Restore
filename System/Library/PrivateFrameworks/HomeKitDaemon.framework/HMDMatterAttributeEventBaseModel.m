@interface HMDMatterAttributeEventBaseModel
+ (Class)cd_entityClass;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7;
+ (id)properties;
- (id)dependentUUIDs;
@end

@implementation HMDMatterAttributeEventBaseModel

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v43 = a4;
  id v39 = a5;
  id v40 = a7;
  v42 = objc_msgSend(v12, "hmf_numberForKey:", *MEMORY[0x263F0C6F8]);
  v41 = objc_msgSend(v12, "hmf_numberForKey:", *MEMORY[0x263F0C5F8]);
  v13 = objc_msgSend(v12, "hmf_numberForKey:", *MEMORY[0x263F0BA78]);
  v14 = objc_msgSend(v12, "hmf_UUIDForKey:", @"kAccessoryUUID");
  v15 = [v43 accessoryWithUUID:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    v18 = [v17 matterAdapter];
    v19 = [MEMORY[0x263F10C50] attributePathWithEndpointID:v42 clusterID:v41 attributeID:v13];
    v20 = [v18 mtrAttributePaths];
    char v21 = [v20 containsObject:v19];

    if (v21)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v54 = __Block_byref_object_copy__267351;
      v55 = __Block_byref_object_dispose__267352;
      id v56 = +[HMDMatterPath PathWithAttributeID:v13 endpointID:v42 clusterID:v41];
      uint64_t v22 = [*(id *)(*(void *)&buf[8] + 40) setAccessory:v17];
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        v23 = [v18 attributePaths];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __101__HMDMatterAttributeEventBaseModel_eventModelWithDictionary_home_eventTriggerUUID_className_message___block_invoke;
        v44[3] = &unk_264A2EFB8;
        v44[4] = buf;
        objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);

        id v24 = +[HMDEventModel eventModelWithDictionary:v12 home:v43 eventTriggerUUID:v39 className:a6 message:v40];
        v25 = [*(id *)(*(void *)&buf[8] + 40) uuid];
        [v24 setMatterPathUUID:v25];
      }
      else
      {
        v34 = (void *)MEMORY[0x230FBD990](v22);
        id v35 = a1;
        HMFGetOSLogHandle();
        v36 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = HMFGetLogIdentifier();
          *(_DWORD *)v45 = 138544130;
          v46 = v37;
          __int16 v47 = 2112;
          v48 = v13;
          __int16 v49 = 2112;
          v50 = v42;
          __int16 v51 = 2112;
          v52 = v41;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to create matter path from attributeID/endpointID/clusterID %@/%@/%@", v45, 0x2Au);
        }
        id v24 = 0;
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = a1;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v54 = (uint64_t (*)(uint64_t, uint64_t))v17;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to find attribute path %@ on accessory %@", buf, 0x20u);
      }
      id v24 = 0;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = a1;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with UUID %@", buf, 0x16u);
    }
    id v24 = 0;
  }

  return v24;
}

void __101__HMDMatterAttributeEventBaseModel_eventModelWithDictionary_home_eventTriggerUUID_className_message___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HMDMatterAttributeEventBaseModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_267355 != -1) {
    dispatch_once(&properties_onceToken_267355, block);
  }
  v2 = (void *)properties__properties_267356;
  return v2;
}

void __46__HMDMatterAttributeEventBaseModel_properties__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDMatterAttributeEventBaseModel;
  v2 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_267356;
  properties__properties_267356 = v3;

  v5 = (void *)properties__properties_267356;
  v9 = @"matterPathUUID";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];
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
  v6 = [(HMDMatterAttributeEventBaseModel *)self matterPathUUID];

  if (v6)
  {
    id v7 = [(HMDMatterAttributeEventBaseModel *)self matterPathUUID];
    [v3 addObject:v7];
  }
  return v3;
}

@end