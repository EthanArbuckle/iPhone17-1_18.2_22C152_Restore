@interface HMDCoreDataCloudTransformMergePolicy
+ (id)logCategory;
- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4;
- (HMDCoreDataCloudTransformMergePolicy)init;
@end

@implementation HMDCoreDataCloudTransformMergePolicy

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v13 = [v12 sourceObject];
        int v14 = [v13 isDeleted];

        if (v14)
        {
          v15 = [v12 sourceObject];
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v9);
  }

  v16 = self;
  v38.receiver = self;
  v38.super_class = (Class)HMDCoreDataCloudTransformMergePolicy;
  unsigned int v17 = [(NSMergePolicy *)&v38 resolveOptimisticLockingVersionConflicts:v7 error:a4];
  BOOL v18 = v17;
  if (v17)
  {
    char v30 = v17;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v31 = v6;
    obuint64_t j = v6;
    uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          v24 = [v23 managedObjectContext];
          [v24 refreshObject:v23 mergeChanges:0];
          v25 = (void *)MEMORY[0x230FBD990]([v24 deleteObject:v23]);
          v26 = v16;
          v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v44 = v28;
            __int16 v45 = 2112;
            v46 = v23;
            _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Delete trumps other changes for %@", buf, 0x16u);

            v16 = self;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
      }
      while (v20);
    }

    v6 = v31;
    BOOL v18 = v30;
  }

  return v18;
}

- (HMDCoreDataCloudTransformMergePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDCoreDataCloudTransformMergePolicy;
  return [(NSMergePolicy *)&v3 initWithMergeType:1];
}

+ (id)logCategory
{
  return +[HMDCoreDataCloudTransform logCategory];
}

@end