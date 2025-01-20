@interface HMDBackingStoreTransactionBlock
+ (id)logCategory;
+ (void)sort:(id)a3;
- (BOOL)committed;
- (HMDBackingStore)backingStore;
- (HMDBackingStoreTransactionBlock)initWithBackingStore:(id)a3 options:(id)a4 label:(id)a5;
- (HMDBackingStoreTransactionOptions)options;
- (NSMutableArray)objects;
- (NSString)description;
- (id)logIdentifier;
- (void)add:(id)a3;
- (void)add:(id)a3 withMessage:(id)a4;
- (void)addObjects:(id)a3;
- (void)dumpDebug;
- (void)dumpDebug:(id)a3;
- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5;
- (void)run;
- (void)run:(id)a3;
- (void)runWithCoreDataBlock:(id)a3 withCompletionBlock:(id)a4;
- (void)runWithoutSave:(id)a3;
- (void)save;
- (void)save:(id)a3;
- (void)setBackingStore:(id)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setObjects:(id)a3;
@end

@implementation HMDBackingStoreTransactionBlock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (BOOL)committed
{
  return self->_committed;
}

- (void)setObjects:(id)a3
{
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setBackingStore:(id)a3
{
}

- (HMDBackingStore)backingStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backingStore);
  return (HMDBackingStore *)WeakRetained;
}

- (HMDBackingStoreTransactionOptions)options
{
  return self->_options;
}

- (id)logIdentifier
{
  return @"BackingStore";
}

- (void)dumpDebug
{
}

- (void)dumpDebug:(id)a3
{
}

- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  BOOL v26 = a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v27 = a4;
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, (os_log_type_t)v5))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [(HMDBackingStoreTransactionBlock *)v8 options];
    v12 = [v11 debugString:0];
    *(_DWORD *)buf = 138543874;
    v34 = v10;
    __int16 v35 = 2112;
    id v36 = v27;
    __int16 v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_22F52A000, v9, (os_log_type_t)v5, "%{public}@%@options: %@", buf, 0x20u);
  }
  v13 = [(HMDBackingStoreTransactionBlock *)v8 objects];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [(HMDBackingStoreTransactionBlock *)v8 objects];
    uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v20 = [v19 change];
          v21 = changeTypeAsNSString([v20 objectChangeType]);

          if (v26) {
            uint64_t v22 = [v21 isEqual:@"delete"] ^ 1;
          }
          else {
            uint64_t v22 = 0;
          }
          v23 = [NSString stringWithFormat:@"%@%@:", v27, v21];
          v24 = [v19 change];
          [v24 dumpWithVerbosity:v22 prefix:v23 logType:v5];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }
  }
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDBackingStoreTransactionBlock *)self options];
  uint64_t v5 = [(HMDBackingStoreTransactionBlock *)self objects];
  v6 = [v3 stringWithFormat:@"<HMDBackingStoreTransaction options:%@ objects:%lu>", v4, objc_msgSend(v5, "count")];

  return (NSString *)v6;
}

- (void)save
{
}

- (void)runWithCoreDataBlock:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDBackingStoreTransactionBlock *)self backingStore];
  [v8 commit:self run:1 save:1 coreDataBlock:v7 completionHandler:v6];
}

- (void)save:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDBackingStoreTransactionBlock *)self backingStore];
  uint64_t v5 = [(HMDBackingStoreTransactionBlock *)self options];
  objc_msgSend(v6, "commit:run:save:archiveInline:coreDataBlock:completionHandler:", self, 0, 1, objc_msgSend(v5, "mustSaveArchiveAtomically"), 0, v4);
}

- (void)runWithoutSave:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBackingStoreTransactionBlock *)self backingStore];
  [v5 commit:self run:1 save:0 archiveInline:1 coreDataBlock:0 completionHandler:v4];
}

- (void)run
{
}

- (void)run:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBackingStoreTransactionBlock *)self backingStore];
  [v5 commit:self run:1 save:1 coreDataBlock:0 completionHandler:v4];
}

- (void)addObjects:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HMDBackingStoreTransactionBlock *)self add:*(void *)(*((void *)&v9 + 1) + 8 * v8++) withMessage:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)add:(id)a3 withMessage:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 uuid];

  if (!v8)
  {
    uint64_t v39 = (void *)MEMORY[0x263EFF940];
    uint64_t v40 = *MEMORY[0x263EFF498];
    v41 = NSString;
    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    v44 = [v6 bsoType];
    v45 = [v41 stringWithFormat:@"UUID for a transaction object (%@ / %@) must be set before adding to a transaction.", v43, v44];
    id v46 = [v39 exceptionWithName:v40 reason:v45 userInfo:0];

    objc_exception_throw(v46);
  }
  if ([(HMDBackingStoreTransactionBlock *)self committed])
  {
    long long v9 = (void *)MEMORY[0x230FBD990]();
    long long v10 = self;
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v56 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@adding to a committed transaction block probably indicates a bad state.", buf, 0xCu);
    }
  }
  else
  {
    id v47 = v7;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v13 = [(HMDBackingStoreTransactionBlock *)self objects];
    uint64_t v50 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v50)
    {
      uint64_t v14 = *(void *)v52;
      id v48 = v6;
      uint64_t v49 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v13);
          }
          uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v17 = [v16 change];
          v18 = [v17 uuid];
          v19 = [v6 uuid];
          int v20 = [v18 isEqual:v19];

          if (v20)
          {
            v21 = (void *)MEMORY[0x230FBD990]();
            uint64_t v22 = self;
            v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = HMFGetLogIdentifier();
              [(HMDBackingStoreTransactionBlock *)v22 options];
              v25 = v13;
              v27 = BOOL v26 = self;
              long long v28 = [v27 label];
              *(_DWORD *)buf = 138543618;
              v56 = v24;
              __int16 v57 = 2112;
              v58 = v28;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Just got request to add duplicate model object to transaction %@! (Both will be processed):", buf, 0x16u);

              self = v26;
              v13 = v25;
              id v6 = v48;
            }
            long long v29 = [v16 change];
            long long v30 = NSString;
            long long v31 = [v16 change];
            v32 = changeTypeAsNSString([v31 objectChangeType]);
            v33 = [v30 stringWithFormat:@"previous (%@)", v32];
            [v29 dumpWithVerbosity:1 prefix:v33 logType:16];

            v34 = NSString;
            __int16 v35 = changeTypeAsNSString([v6 objectChangeType]);
            id v36 = [v34 stringWithFormat:@"new (%@)", v35];
            [v6 dumpWithVerbosity:1 prefix:v36 logType:16];

            uint64_t v14 = v49;
          }
        }
        uint64_t v50 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v50);
    }

    __int16 v37 = [(HMDBackingStoreTransactionBlock *)self objects];
    id v7 = v47;
    v38 = [[HMDBackingStoreTransactionItem alloc] initWithChange:v6 message:v47];
    [v37 addObject:v38];
  }
}

- (void)add:(id)a3
{
}

- (HMDBackingStoreTransactionBlock)initWithBackingStore:(id)a3 options:(id)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = (__CFString *)a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDBackingStoreTransactionBlock;
  long long v11 = [(HMDBackingStoreTransactionBlock *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    objects = v11->_objects;
    v11->_objects = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_options, a4);
    objc_storeWeak((id *)&v11->_backingStore, v8);
    v11->_committed = 0;
    if (v10) {
      uint64_t v14 = v10;
    }
    else {
      uint64_t v14 = @"anonymous";
    }
    [v9 setLabel:v14];
    uint64_t v15 = v11;
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_216443 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_216443, &__block_literal_global_216444);
  }
  v2 = (void *)logCategory__hmf_once_v5_216445;
  return v2;
}

void __46__HMDBackingStoreTransactionBlock_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_216445;
  logCategory__hmf_once_v5_216445 = v0;
}

+ (void)sort:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "change", (void)v16);
          uint64_t v13 = [v12 objectChangeType];

          if (v13 == 3) {
            uint64_t v14 = v4;
          }
          else {
            uint64_t v14 = v5;
          }
          [v14 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    __sort(v4);
    __sort(v5);
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    [v15 addObjectsFromArray:v4];
    [v15 addObjectsFromArray:v5];
    [v6 setArray:v15];
  }
}

@end