@interface HMDCoreDataCloudTransformableLocalEvents
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (void)_addEventForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:;
@end

@implementation HMDCoreDataCloudTransformableLocalEvents

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (void)_addEventForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = [v6 entity];
  v11 = +[_MKFEvent entity];
  int v12 = [v10 isKindOfEntity:v11];

  if (v12)
  {
    v32[0] = @"trigger";
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    id v24 = 0;
    v14 = objc_msgSend(v8, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v6, v13, &v24);
    v15 = (__CFString *)v24;

    if (v14)
    {
      v16 = [v14 trigger];
      v17 = [v16 objectID];
      v31 = @"events_";
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
      [v9 addToUpdates:v7 objectID:v17 properties:v18];
    }
    else
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = v9;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        v23 = @"not found";
        *(_DWORD *)buf = 138543874;
        v26 = v22;
        if (v15) {
          v23 = v15;
        }
        __int16 v27 = 2114;
        id v28 = v6;
        __int16 v29 = 2114;
        v30 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return 1;
}

@end