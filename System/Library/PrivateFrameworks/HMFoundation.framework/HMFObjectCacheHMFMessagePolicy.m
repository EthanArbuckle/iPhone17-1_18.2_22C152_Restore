@interface HMFObjectCacheHMFMessagePolicy
+ (id)cachedInstanceForMessagePolicy:(id)a3;
@end

@implementation HMFObjectCacheHMFMessagePolicy

+ (id)cachedInstanceForMessagePolicy:(id)a3
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
  v5 = (void *)qword_1EB4EE9A8;
  if (!qword_1EB4EE9A8)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:6 capacity:0];
    v7 = (void *)qword_1EB4EE9A8;
    qword_1EB4EE9A8 = v6;

    v5 = (void *)qword_1EB4EE9A8;
  }
  id v8 = [v5 member:v3];
  if (!v8)
  {
    id v8 = (id)[v3 copy];
    [(id)qword_1EB4EE9A8 addObject:v8];
  }
  os_unfair_lock_unlock(&_MergedGlobals_11);
LABEL_16:

  return v8;
}

@end