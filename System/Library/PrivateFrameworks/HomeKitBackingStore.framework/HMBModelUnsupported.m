@interface HMBModelUnsupported
- (id)debugString:(BOOL)a3;
- (void)dumpDebug;
- (void)dumpDebug:(id)a3;
@end

@implementation HMBModelUnsupported

- (void)dumpDebug
{
}

- (void)dumpDebug:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(HMBModelUnsupported *)self debugString:0];
  v5 = [v4 componentsSeparatedByString:@"\n"];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D944CB30]();
        v12 = self;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v22 = v14;
          __int16 v23 = 2112;
          id v24 = v15;
          __int16 v25 = 2112;
          uint64_t v26 = v10;
          _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@%@%@", buf, 0x20u);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v7);
  }
}

- (id)debugString:(BOOL)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F28E78], "string", a3);
  v5 = [(HMBModel *)self hmbCanonicalType];
  BOOL v6 = [(HMBModel *)self hmbCanonicalTypeInferred];
  uint64_t v7 = &stru_1F2C3E4E0;
  if (v6) {
    uint64_t v7 = @" (inferred)";
  }
  [v4 appendFormat:@"values: (%@%@)", v5, v7];

  uint64_t v8 = [(HMBModel *)self hmbModelID];
  v9 = [v8 UUIDString];
  [v4 appendFormat:@"\n  uuid: %@", v9];

  uint64_t v10 = [(HMBModel *)self hmbParentModelID];
  v11 = [v10 UUIDString];
  [v4 appendFormat:@"\n  parent: %@", v11];

  v12 = [(HMBModel *)self hmbDataVersion];
  id v25 = v4;
  [v4 appendFormat:@"\n  version: %@", v12];

  BOOL v13 = +[HMBModel hmbShouldLogPrivateInformation];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v14 = [(HMBModel *)self hmbReserved];
  id v15 = [v14 allKeys];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v20 hasPrefix:@"_"] & 1) == 0)
        {
          v21 = [(HMBModel *)self hmbReserved];
          v22 = [v21 valueForKey:v20];

          if (v22)
          {
            __int16 v23 = @"...";
            if (v13)
            {
              __int16 v23 = +[HMBModel formattedStringForValue:v22];
            }

            [v25 appendFormat:@"\n  %@ (read-only) (unsupported): %@", v20, v23];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  return v25;
}

@end