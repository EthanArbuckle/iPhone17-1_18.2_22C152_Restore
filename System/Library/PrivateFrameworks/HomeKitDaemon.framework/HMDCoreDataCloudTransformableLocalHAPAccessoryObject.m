@interface HMDCoreDataCloudTransformableLocalHAPAccessoryObject
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
@end

@implementation HMDCoreDataCloudTransformableLocalHAPAccessoryObject

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  v37[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 entity];
  v15 = +[_MKFService entity];
  int v16 = [v14 isKindOfEntity:v15];

  if (v16)
  {
    v37[0] = @"accessory";
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
    id v29 = 0;
    v18 = objc_msgSend(v13, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v10, v17, &v29);
    v19 = (__CFString *)v29;

    if (v18)
    {
      v20 = [v18 accessory];
      v21 = [v20 objectID];
      v36 = @"services_";
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      [a1 addToUpdates:v12 objectID:v21 properties:v22];
    }
    else
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = objc_opt_class();
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        v27 = @"not found";
        *(_DWORD *)buf = 138543874;
        v31 = v26;
        if (v19) {
          v27 = v19;
        }
        __int16 v32 = 2114;
        id v33 = v10;
        __int16 v34 = 2114;
        v35 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  return 1;
}

@end