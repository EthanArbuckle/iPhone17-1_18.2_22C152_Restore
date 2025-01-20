@interface HMFObjectCacheNSString
+ (id)hmf_cachedInstanceForString:(id)a3;
+ (id)hmf_setOfCachedInstancesForStrings:(id)a3;
@end

@implementation HMFObjectCacheNSString

+ (id)hmf_cachedInstanceForString:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x19F3A87A0]();
  if (!v3)
  {
    id v8 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x19F3A87A0]();
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier(0);
      v12 = objc_opt_class();
      id v13 = v12;
      int v18 = 138544130;
      v19 = v11;
      __int16 v20 = 2112;
      id v21 = v3;
      __int16 v22 = 2112;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = (id)objc_opt_class();
      id v14 = v25;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ mismatches cache class %@:", (uint8_t *)&v18, 0x2Au);
    }
    goto LABEL_15;
  }
  if (([v3 conformsToProtocol:&unk_1EEF25490] & 1) == 0)
  {
    v9 = (void *)MEMORY[0x19F3A87A0]();
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier(0);
      int v18 = 138543874;
      v19 = v15;
      __int16 v20 = 2112;
      id v21 = v3;
      __int16 v22 = 2112;
      id v23 = (id)objc_opt_class();
      id v16 = v23;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Object %@ of class %@ does not conform to NSCopying protocol", (uint8_t *)&v18, 0x20u);
    }
LABEL_15:

    id v8 = v3;
    goto LABEL_16;
  }
  os_unfair_lock_lock_with_options();
  v5 = (void *)qword_1EB4EED80;
  if (!qword_1EB4EED80)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:6 capacity:0];
    v7 = (void *)qword_1EB4EED80;
    qword_1EB4EED80 = v6;

    v5 = (void *)qword_1EB4EED80;
  }
  id v8 = [v5 member:v3];
  if (!v8)
  {
    id v8 = (id)[v3 copy];
    [(id)qword_1EB4EED80 addObject:v8];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_67);
LABEL_16:

  return v8;
}

+ (id)hmf_setOfCachedInstancesForStrings:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA80];
    id v4 = a3;
    v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__HMFObjectCacheNSString_CollectionSupport__hmf_setOfCachedInstancesForStrings___block_invoke;
    v9[3] = &unk_1E59586B0;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v9];

    v7 = (void *)[v6 copy];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __80__HMFObjectCacheNSString_CollectionSupport__hmf_setOfCachedInstancesForStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[HMFObjectCacheNSString hmf_cachedInstanceForString:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

@end