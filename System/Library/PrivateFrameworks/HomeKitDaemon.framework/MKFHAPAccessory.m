@interface MKFHAPAccessory
@end

@implementation MKFHAPAccessory

void __32___MKFHAPAccessory_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v8_165176;
  homeRelation__hmf_once_v8_165176 = v0;
}

void __66___MKFHAPAccessory_maybeFixUpCharacteristicWriteActionsInContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 service];

  if (!v4)
  {
    v5 = +[_MKFCharacteristic fetchRequest];
    v6 = (void *)MEMORY[0x263F08A98];
    v7 = [v3 characteristicID];
    v8 = [v6 predicateWithFormat:@"(%K == %@) AND (%K.%K == %@)", @"instanceID", v7, *(void *)(a1 + 32), @"accessory", *(void *)(a1 + 40)];
    [v5 setPredicate:v8];

    v9 = *(void **)(a1 + 48);
    id v28 = 0;
    v10 = [v9 executeFetchRequest:v5 error:&v28];
    id v11 = v28;
    if (v10)
    {
      v12 = [v10 firstObject];
      v13 = v12;
      if (v12)
      {
        v14 = [v12 service];
        v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = *(id *)(a1 + 40);
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v30 = v18;
          __int16 v31 = 2112;
          id v32 = v14;
          __int16 v33 = 2112;
          id v34 = v3;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Assigning matching service %@ to action: %@", buf, 0x20u);
        }
        v19 = [v13 service];
        [v3 setService:v19];
      }
      else
      {
        v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = *(id *)(a1 + 40);
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v30 = v27;
          __int16 v31 = 2112;
          id v32 = v3;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@No matching characteristic for action: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = *(id *)(a1 + 40);
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristics: %@", buf, 0x16u);
      }
    }
  }
}

id __39___MKFHAPAccessory_hasRGCapableService__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  id v3 = [v2 UUIDString];

  return v3;
}

@end