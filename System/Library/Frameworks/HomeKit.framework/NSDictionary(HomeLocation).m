@interface NSDictionary(HomeLocation)
- (id)hm_locationFromDataForKey:()HomeLocation;
- (id)hm_regionFromDataForKey:()HomeLocation;
@end

@implementation NSDictionary(HomeLocation)

- (id)hm_locationFromDataForKey:()HomeLocation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(a1, "hmf_dataForKey:", v4);
  if (v5)
  {
    id v14 = 0;
    v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v14];
    id v7 = v14;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = (void *)MEMORY[0x19F3A64A0]();
      id v10 = a1;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive location value from data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hm_regionFromDataForKey:()HomeLocation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(a1, "hmf_dataForKey:", v4);
  if (v5)
  {
    id v14 = 0;
    v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v14];
    id v7 = v14;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = (void *)MEMORY[0x19F3A64A0]();
      id v10 = a1;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region value from data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end