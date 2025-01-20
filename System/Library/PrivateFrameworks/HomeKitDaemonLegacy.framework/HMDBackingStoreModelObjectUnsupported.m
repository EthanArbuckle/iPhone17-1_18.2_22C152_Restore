@interface HMDBackingStoreModelObjectUnsupported
- (void)dumpDebug;
- (void)dumpDebug:(id)a3;
- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5;
@end

@implementation HMDBackingStoreModelObjectUnsupported

- (void)dumpDebug
{
}

- (void)dumpDebug:(id)a3
{
}

- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28E78] string];
  v9 = [(HMDBackingStoreModelObject *)self bsoType];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  char v12 = [v9 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    v13 = NSString;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [(HMDBackingStoreModelObject *)self bsoType];
    uint64_t v17 = [v13 stringWithFormat:@"%@/%@", v15, v16];

    v9 = (void *)v17;
  }
  os_log_type_t type = a5;
  v41 = v9;
  [v8 appendFormat:@"%@values: (%@)", v7, v9];
  v18 = [(HMDBackingStoreModelObject *)self uuid];
  v19 = [v18 UUIDString];
  [v8 appendFormat:@"\n  uuid: %@", v19];

  v20 = [(HMDBackingStoreModelObject *)self parentUUID];
  v21 = [v20 UUIDString];
  [v8 appendFormat:@"\n  parent: %@", v21];

  v22 = [(HMDBackingStoreModelObject *)self bsoDataVersion];
  [v8 appendFormat:@"\n  version: %@", v22];

  uint64_t v23 = [(HMDBackingStoreModelObject *)self bsoIgnoredBefore];
  v24 = (void *)v23;
  v25 = self;
  if (v23) {
    [v8 appendFormat:@"\n  ignore before: %@", v23];
  }
  v40 = v24;
  v44 = v8;
  char v43 = shouldLogPrivateInformation();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v26 = [(NSMutableDictionary *)self->super._reserved allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (([v31 hasPrefix:@"_"] & 1) == 0)
        {
          uint64_t v32 = [(NSMutableDictionary *)v25->super._reserved valueForKey:v31];
          if (v32)
          {
            v33 = (void *)v32;
            if (v43)
            {
              v34 = +[HMDBackingStoreModelObject formatValue:v32];
            }
            else
            {
              v34 = @"...";
              v35 = @"...";
            }

            [v44 appendFormat:@"\n  %@ (read-only) (unsupported): %@", v31, v34, v40];
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v28);
  }

  v36 = (void *)MEMORY[0x1D9452090]();
  v37 = v25;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, type))
  {
    v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v50 = v39;
    __int16 v51 = 2112;
    v52 = v44;
    _os_log_impl(&dword_1D49D5000, v38, type, "%{public}@HMDBackingStoreModelObjectUnsupported %@", buf, 0x16u);
  }
}

@end