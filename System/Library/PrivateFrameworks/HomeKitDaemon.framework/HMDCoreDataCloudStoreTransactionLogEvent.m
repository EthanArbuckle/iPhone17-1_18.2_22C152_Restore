@interface HMDCoreDataCloudStoreTransactionLogEvent
+ (id)eventForUpdates:(id)a3 inserts:(id)a4 deletes:(id)a5 transactionAuthor:(id)a6;
+ (void)countMKFCKEntitiesInChangeSet:(id)a3 entitiesCount:(id)a4;
+ (void)trimChangeSetForUnchangedValues:(id)a3;
- (HMDCoreDataCloudStoreTransactionLogEvent)initWithChangeSet:(id)a3 transactionAuthor:(id)a4;
- (NSCountedSet)reasons;
- (NSString)transactionAuthor;
@end

@implementation HMDCoreDataCloudStoreTransactionLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
}

- (NSCountedSet)reasons
{
  return self->_reasons;
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (HMDCoreDataCloudStoreTransactionLogEvent)initWithChangeSet:(id)a3 transactionAuthor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCoreDataCloudStoreTransactionLogEvent;
  v9 = [(HMMLogEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reasons, a3);
    objc_storeStrong((id *)&v10->_transactionAuthor, a4);
  }

  return v10;
}

+ (id)eventForUpdates:(id)a3 inserts:(id)a4 deletes:(id)a5 transactionAuthor:(id)a6
{
  id v9 = a6;
  v10 = (objc_class *)MEMORY[0x263F08760];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  v15 = (void *)[v13 mutableCopy];

  [(id)objc_opt_class() trimChangeSetForUnchangedValues:v15];
  [(id)objc_opt_class() countMKFCKEntitiesInChangeSet:v15 entitiesCount:v14];
  [(id)objc_opt_class() countMKFCKEntitiesInChangeSet:v12 entitiesCount:v14];

  [(id)objc_opt_class() countMKFCKEntitiesInChangeSet:v11 entitiesCount:v14];
  if ([v14 count]) {
    v16 = [[HMDCoreDataCloudStoreTransactionLogEvent alloc] initWithChangeSet:v14 transactionAuthor:v9];
  }
  else {
    v16 = 0;
  }

  return v16;
}

+ (void)countMKFCKEntitiesInChangeSet:(id)a3 entitiesCount:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v25 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v27;
    *(void *)&long long v9 = 138543362;
    long long v23 = v9;
    id v24 = a1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "entity", v23);
        id v14 = [v13 name];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v14)
        {
          [v25 addObject:v14];
          goto LABEL_16;
        }
        v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = a1;
        v17 = HMFGetOSLogHandle();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        if (v14)
        {
          if (v18)
          {
            v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v31 = v19;
            __int16 v32 = 2112;
            v33 = v14;
            v20 = v17;
            v21 = "%{public}@NSManagedObject not of type MKFCKModel, name: %@";
            uint32_t v22 = 22;
LABEL_14:
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);

            a1 = v24;
          }
        }
        else if (v18)
        {
          v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v23;
          v31 = v19;
          v20 = v17;
          v21 = "%{public}@NSManagedObject entity has no name";
          uint32_t v22 = 12;
          goto LABEL_14;
        }

LABEL_16:
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v10);
  }
}

+ (void)trimChangeSetForUnchangedValues:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 138543618;
    long long v22 = v8;
    id v23 = a1;
    uint64_t v24 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPersistentChangedValues", v22) & 1) == 0)
        {
          id v13 = (void *)MEMORY[0x230FBD990]([v5 addObject:v12]);
          id v14 = a1;
          v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = HMFGetLogIdentifier();
            v17 = [v12 entity];
            [v17 name];
            uint64_t v18 = v9;
            id v19 = v6;
            v21 = v20 = v5;
            *(_DWORD *)buf = v22;
            v30 = v16;
            __int16 v31 = 2112;
            __int16 v32 = v21;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Trimmed: NSManagedObject %@ has no changes to process", buf, 0x16u);

            v5 = v20;
            id v6 = v19;
            uint64_t v9 = v18;

            a1 = v23;
            uint64_t v10 = v24;
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v9);
  }

  [v6 minusSet:v5];
}

@end