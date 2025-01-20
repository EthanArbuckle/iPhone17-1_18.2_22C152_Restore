@interface HMDCoreDataCloudTransformableLocalApplicationData
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
@end

@implementation HMDCoreDataCloudTransformableLocalApplicationData

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 entity];
  v15 = +[_MKFApplicationData entity];
  int v16 = [v14 isKindOfEntity:v15];

  if (v16)
  {
    id v43 = 0;
    v17 = [v13 existingObjectWithID:v10 error:&v43];
    v18 = (__CFString *)v43;
    if (v17)
    {
      v19 = [v17 home];

      if (v19)
      {
        v20 = [v17 home];
        v21 = [v20 objectID];
        v49 = @"applicationData";
        v22 = (void *)MEMORY[0x263EFF8C0];
        v23 = &v49;
LABEL_17:
        v35 = [v22 arrayWithObjects:v23 count:1];
        [a1 addToUpdates:v12 objectID:v21 properties:v35];

        goto LABEL_18;
      }
      v32 = [v17 actionSet];

      if (v32)
      {
        v20 = [v17 actionSet];
        v21 = [v20 objectID];
        v48 = @"applicationData";
        v22 = (void *)MEMORY[0x263EFF8C0];
        v23 = &v48;
        goto LABEL_17;
      }
      v33 = [v17 room];

      if (v33)
      {
        v20 = [v17 room];
        v21 = [v20 objectID];
        v47 = @"applicationData";
        v22 = (void *)MEMORY[0x263EFF8C0];
        v23 = &v47;
        goto LABEL_17;
      }
      v34 = [v17 accessory];

      if (v34)
      {
        v20 = [v17 accessory];
        v21 = [v20 objectID];
        v46 = @"applicationData";
        v22 = (void *)MEMORY[0x263EFF8C0];
        v23 = &v46;
        goto LABEL_17;
      }
      v37 = [v17 service];

      if (v37)
      {
        v42 = [v17 service];
        v38 = [v42 accessory];
        v39 = [v38 objectID];
        v45 = @"services_";
        v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
        [a1 addToUpdates:v12 objectID:v39 properties:v40];

        goto LABEL_18;
      }
      v41 = [v17 serviceGroup];

      if (v41)
      {
        v20 = [v17 serviceGroup];
        v21 = [v20 objectID];
        v44 = @"applicationData";
        v22 = (void *)MEMORY[0x263EFF8C0];
        v23 = &v44;
        goto LABEL_17;
      }
      v24 = (void *)MEMORY[0x230FBD990]();
      v25 = objc_opt_class();
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v51 = v27;
        __int16 v52 = 2114;
        id v53 = v10;
        v29 = "%{public}@Failed to determine app data container for object with objectID %{public}@";
        v30 = v26;
        uint32_t v31 = 22;
LABEL_9:
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x230FBD990]();
      v25 = objc_opt_class();
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        v28 = @"not found";
        *(_DWORD *)buf = 138543874;
        v51 = v27;
        if (v18) {
          v28 = v18;
        }
        __int16 v52 = 2114;
        id v53 = v10;
        __int16 v54 = 2114;
        v55 = v28;
        v29 = "%{public}@Failed to fetch object with objectID %{public}@: %{public}@";
        v30 = v26;
        uint32_t v31 = 32;
        goto LABEL_9;
      }
    }

LABEL_18:
  }
  return 1;
}

@end