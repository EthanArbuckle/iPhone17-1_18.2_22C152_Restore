@interface HMDCHIPControllerPrivateStorage
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllSDKKeyValuePairs;
- (BOOL)removeValueForSDKKey:(id)a3;
- (BOOL)setSDKKeyValuePairs:(id)a3;
- (BOOL)setValue:(id)a3 forSDKKey:(id)a4;
- (HMDCHIPControllerPrivateStorage)initWithHome:(id)a3;
- (HMDHome)home;
- (NSDictionary)debugDictionaryRepresentation;
- (NSNumber)cachedLocalControllerNodeID;
- (NSNumber)controllerNodeID;
- (id)allSDKKeyValuePairs;
- (id)attributeDescriptions;
- (id)fetchKeyValuePairForKey:(void *)a3 home:(void *)a4 context:;
- (id)fetchRequestForHome:(unint64_t)a3 maxExpectedCount:;
- (id)homeWithContext:(void *)a1;
- (id)logIdentifier;
- (id)privateDataSourceForControllerNodeID:(id)a3;
- (id)valueForSDKKey:(id)a3;
- (uint64_t)removeAllForHome:(void *)a3 context:;
- (unint64_t)hash;
- (void)setControllerNodeID:(id)a3;
@end

@implementation HMDCHIPControllerPrivateStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerNodeID, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (void)setControllerNodeID:(id)a3
{
}

- (NSNumber)controllerNodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCHIPControllerPrivateStorage *)self home];
  v5 = (void *)[v3 initWithName:@"Home" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCHIPControllerPrivateStorage *)self controllerNodeID];
  v8 = (void *)[v6 initWithName:@"Controller Node ID" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (id)logIdentifier
{
  id v3 = NSString;
  v4 = [(HMDCHIPControllerPrivateStorage *)self home];
  v5 = [v4 uuid];
  id v6 = [(HMDCHIPControllerPrivateStorage *)self controllerNodeID];
  v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(HMDCHIPControllerPrivateStorage *)self home];
  v4 = [v3 uuid];
  uint64_t v5 = [v4 hash];

  id v6 = [(HMDCHIPControllerPrivateStorage *)self controllerNodeID];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6
    && ([(HMDCHIPControllerPrivateStorage *)self home],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v6 home],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    v10 = [(HMDCHIPControllerPrivateStorage *)self controllerNodeID];
    v11 = [v6 controllerNodeID];
    char v12 = HMFEqualObjects();
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)removeAllSDKKeyValuePairs
{
  id v3 = [(HMDCHIPControllerPrivateStorage *)self home];
  id v4 = [v3 backingStore];
  uint64_t v5 = [v4 context];

  id v6 = [v5 managedObjectContext];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HMDCHIPControllerPrivateStorage_removeAllSDKKeyValuePairs__block_invoke;
  v9[3] = &unk_264A2F698;
  v9[4] = self;
  id v7 = v6;
  id v10 = v7;
  v11 = &v12;
  [v5 unsafeSynchronousBlock:v9];
  LOBYTE(v3) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v3;
}

void __60__HMDCHIPControllerPrivateStorage_removeAllSDKKeyValuePairs__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[HMDCHIPControllerPrivateStorage removeAllForHome:context:](*(void **)(a1 + 32), v3, *(void **)(a1 + 40));
  }
}

- (id)homeWithContext:(void *)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    [v3 assertIsExecuting];
    uint64_t v5 = [a1 home];
    id v6 = [v5 uuid];
    id v7 = +[_MKFModel modelWithModelID:v6 context:v4];

    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      int v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = a1;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        v13 = [v10 home];
        uint64_t v14 = [v13 uuid];
        int v16 = 138543618;
        v17 = v12;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to find home %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (uint64_t)removeAllForHome:(void *)a3 context:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    [v6 assertIsExecuting];
    id v8 = -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](a1, v5, 0);
    int v9 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v8];
    id v20 = 0;
    id v10 = [v7 executeRequest:v9 error:&v20];
    id v11 = v20;
    uint64_t v12 = [v10 result];
    uint64_t v13 = [v12 BOOLValue];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = a1;
      int v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = v19 = v14;
        *(_DWORD *)buf = 138543618;
        v22 = v17;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all: %@", buf, 0x16u);

        uint64_t v14 = v19;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)fetchRequestForHome:(unint64_t)a3 maxExpectedCount:
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = +[_MKFMatterLocalKeyValuePair fetchRequest];
  v13[0] = @"key";
  v13[1] = @"value";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v6 setPropertiesToFetch:v7];

  id v8 = (void *)MEMORY[0x263F08A98];
  if (v5)
  {
    int v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"home", v5];
    [v6 setPredicate:v9];
  }
  else
  {
    int v9 = [a1 home];
    id v10 = [v9 uuid];
    id v11 = [v8 predicateWithFormat:@"%K.%K == %@", @"home", @"modelID", v10];
    [v6 setPredicate:v11];
  }
  if (a3 >= 0x33) {
    [v6 setFetchBatchSize:50];
  }

  return v6;
}

- (BOOL)setSDKKeyValuePairs:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCHIPControllerPrivateStorage *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  id v8 = [v7 managedObjectContext];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke;
  void v13[3] = &unk_264A2F078;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  id v10 = v4;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  v17 = &v18;
  [v11 unsafeSynchronousBlock:v13];
  LOBYTE(v6) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v6;
}

void __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke(uint64_t a1)
{
  v81[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v3)
  {
    v59 = v2;
    id v4 = [*(id *)(a1 + 48) allKeys];
    id v6 = *(void **)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    id v7 = v4;
    v58 = v3;
    id v8 = v3;
    id v9 = v5;
    id v10 = v9;
    v61 = v8;
    v60 = v7;
    if (v6)
    {
      [v9 assertIsExecuting];
      id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"ANY %K IN %@", @"key", v7];
      uint64_t v12 = -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](v6, v8, [v7 count]);
      uint64_t v13 = (void *)MEMORY[0x263F08730];
      id v14 = [v12 predicate];
      v81[0] = v14;
      v81[1] = v11;
      id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];
      id v16 = [v13 andPredicateWithSubpredicates:v15];
      [v12 setPredicate:v16];

      id v73 = 0;
      v17 = [v10 executeFetchRequest:v12 error:&v73];
      id v18 = v73;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        uint64_t v20 = (void *)MEMORY[0x230FBD990]();
        id v21 = v6;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          __int16 v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v75 = v23;
          __int16 v76 = 2112;
          uint64_t v77 = (uint64_t)v18;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch matching keys: %@", buf, 0x16u);
        }
        id v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = v21;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v27 = HMFGetLogIdentifier();
          [v12 predicate];
          v28 = id obja = v24;
          *(_DWORD *)buf = 138543618;
          v75 = v27;
          __int16 v76 = 2112;
          uint64_t v77 = (uint64_t)v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Failed predicate: %@", buf, 0x16u);

          id v24 = obja;
        }

        id v19 = [MEMORY[0x263EFF8C0] array];
        id v7 = v60;
      }
    }
    else
    {
      id v19 = 0;
    }

    v29 = v61;
    v57 = v19;
    if ([v19 count])
    {
      v30 = [MEMORY[0x263EFF9C0] setWithArray:v7];
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke_2;
      v69[3] = &unk_264A2F050;
      id v70 = v30;
      id v31 = *(id *)(a1 + 48);
      uint64_t v32 = *(void *)(a1 + 32);
      id v71 = v31;
      uint64_t v72 = v32;
      id v33 = v30;
      [v19 enumerateObjectsUsingBlock:v69];
      id v34 = [v33 allObjects];
    }
    else
    {
      id v34 = v7;
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v34;
    uint64_t v35 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v66 != v37) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          v40 = [*(id *)(a1 + 48) objectForKeyedSubscript:v39];
          v41 = (void *)MEMORY[0x230FBD990]();
          id v42 = *(id *)(a1 + 32);
          v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v75 = v44;
            __int16 v76 = 2112;
            uint64_t v77 = (uint64_t)v39;
            __int16 v78 = 2112;
            id v79 = v40;
            _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_DEBUG, "%{public}@Setting new value for '%@': %@", buf, 0x20u);

            v29 = v61;
          }

          v45 = [[_MKFMatterLocalKeyValuePair alloc] initWithContext:*(void *)(a1 + 40)];
          [(_MKFMatterLocalKeyValuePair *)v45 setHome:v29];
          [(_MKFMatterLocalKeyValuePair *)v45 setKey:v39];
          [(_MKFMatterLocalKeyValuePair *)v45 setValue:v40];
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v65 objects:v80 count:16];
      }
      while (v36);
    }

    if ([*(id *)(a1 + 40) hasChanges])
    {
      v46 = *(void **)(a1 + 56);
      id v64 = 0;
      int v47 = [v46 save:&v64];
      id v48 = v64;
      v49 = (void *)MEMORY[0x230FBD990]();
      id v50 = *(id *)(a1 + 32);
      v51 = HMFGetOSLogHandle();
      v52 = v51;
      if (v47)
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v53 = HMFGetLogIdentifier();
          uint64_t v54 = [*(id *)(a1 + 48) count];
          *(_DWORD *)buf = 138543618;
          v75 = v53;
          __int16 v76 = 2048;
          uint64_t v77 = v54;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Successfully saved %tu value(s)", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
      else
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v55 = HMFGetLogIdentifier();
          uint64_t v56 = [*(id *)(a1 + 48) count];
          *(_DWORD *)buf = 138543874;
          v75 = v55;
          __int16 v76 = 2048;
          uint64_t v77 = v56;
          __int16 v78 = 2112;
          id v79 = v48;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to save %tu value(s): %@", buf, 0x20u);
        }
      }
    }
    id v3 = v58;
    v2 = v59;
  }
}

void __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke_2(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 key];
  [a1[4] removeObject:v4];
  id v5 = [a1[5] objectForKeyedSubscript:v4];
  id v6 = [v3 value];
  int v7 = [v6 isEqual:v5];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1[6];
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      id v15 = v12;
      __int16 v16 = 2112;
      v17 = v4;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating '%@' with the same value: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543874;
      id v15 = v13;
      __int16 v16 = 2112;
      v17 = v4;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating value for '%@': %@", (uint8_t *)&v14, 0x20u);
    }
    [v3 setValue:v5];
  }
}

- (id)allSDKKeyValuePairs
{
  id v3 = [(HMDCHIPControllerPrivateStorage *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__267809;
  __int16 v16 = __Block_byref_object_dispose__267810;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HMDCHIPControllerPrivateStorage_allSDKKeyValuePairs__block_invoke;
  v9[3] = &unk_264A2F698;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  BOOL v11 = &v12;
  [v6 unsafeSynchronousBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__HMDCHIPControllerPrivateStorage_allSDKKeyValuePairs__block_invoke(id a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = (void *)*((void *)a1 + 4);
  id v4 = [*((id *)a1 + 5) managedObjectContext];
  id v5 = v4;
  if (v3)
  {
    [v4 assertIsExecuting];
    id v6 = -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](v3, 0, 0xFFFFFFFFFFFFFFFFLL);
    id v48 = 0;
    id v7 = [v5 executeFetchRequest:v6 error:&v48];
    id v8 = v48;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id obj = a1;
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = v3;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v50 = v13;
        __int16 v51 = 2112;
        id v52 = v8;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch all keys: %@", buf, 0x16u);
      }
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = v11;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = HMFGetLogIdentifier();
        __int16 v18 = [v6 predicate];
        *(_DWORD *)buf = 138543618;
        id v50 = v17;
        __int16 v51 = 2112;
        id v52 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Failed predicate: %@", buf, 0x16u);
      }
      id v9 = [MEMORY[0x263EFF8C0] array];
      a1 = obj;
    }
  }
  else
  {
    id v9 = 0;
  }

  if ([v9 count])
  {
    v40 = v2;
    id v19 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v39 = v9;
    id obja = v9;
    uint64_t v20 = [obja countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        uint64_t v23 = 0;
        uint64_t v41 = v21;
        do
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(obja);
          }
          id v24 = *(void **)(*((void *)&v44 + 1) + 8 * v23);
          id v25 = objc_msgSend(v24, "key", v39);
          v26 = [v24 value];
          v27 = (void *)MEMORY[0x230FBD990]([v19 setObject:v26 forKeyedSubscript:v25]);
          id v28 = *((id *)a1 + 4);
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            uint64_t v30 = v22;
            id v31 = v19;
            v33 = id v32 = a1;
            *(_DWORD *)buf = 138543874;
            id v50 = v33;
            __int16 v51 = 2112;
            id v52 = v25;
            __int16 v53 = 2112;
            uint64_t v54 = v26;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Found value for '%@': %@", buf, 0x20u);

            a1 = v32;
            id v19 = v31;
            uint64_t v22 = v30;
            uint64_t v21 = v41;
          }

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [obja countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v21);
    }

    uint64_t v34 = [v19 copy];
    uint64_t v35 = *(void *)(*((void *)a1 + 6) + 8);
    uint64_t v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    id v9 = v39;
    v2 = v40;
  }
  else
  {
    uint64_t v37 = *(void *)(*((void *)a1 + 6) + 8);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = MEMORY[0x263EFFA78];
  }
}

- (BOOL)removeValueForSDKKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCHIPControllerPrivateStorage *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  id v8 = [v7 managedObjectContext];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__HMDCHIPControllerPrivateStorage_removeValueForSDKKey___block_invoke;
  void v13[3] = &unk_264A2F078;
  v13[4] = self;
  id v9 = v4;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v17 = &v18;
  id v11 = v7;
  id v16 = v11;
  [v11 unsafeSynchronousBlock:v13];
  LOBYTE(v6) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v6;
}

void __56__HMDCHIPControllerPrivateStorage_removeValueForSDKKey___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = -[HMDCHIPControllerPrivateStorage fetchKeyValuePairForKey:home:context:](*(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(void **)(a1 + 48));
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [v3 value];
      *(_DWORD *)buf = 138543874;
      v26 = v8;
      __int16 v27 = 2112;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Removing value for '%@': %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) deleteObject:v3];
    id v11 = *(void **)(a1 + 56);
    id v24 = 0;
    int v12 = [v11 save:&v24];
    id v13 = v24;
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    id v17 = v16;
    if (v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully removed value for '%@'", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v26 = v22;
        __int16 v27 = 2112;
        uint64_t v28 = v23;
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove value for '%@': %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@No value for '%@'", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (id)fetchKeyValuePairForKey:(void *)a3 home:(void *)a4 context:
{
  v37[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a1)
  {
    [v9 assertIsExecuting];
    id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"key", v7];
    int v12 = -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](a1, v8, 1uLL);
    id v13 = (void *)MEMORY[0x263F08730];
    id v14 = [v12 predicate];
    v37[0] = v14;
    v37[1] = v11;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    id v16 = [v13 andPredicateWithSubpredicates:v15];
    [v12 setPredicate:v16];

    id v32 = 0;
    id v17 = [v10 executeFetchRequest:v12 error:&v32];
    id v18 = v32;
    if (v17)
    {
      a1 = [v17 firstObject];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = a1;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v22 = v30 = v19;
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v22;
        __int16 v35 = 2112;
        id v36 = v18;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch single key: %@", buf, 0x16u);

        uint64_t v19 = v30;
      }

      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = v20;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v26 = __int16 v29 = v23;
        [v12 predicate];
        v27 = id v31 = v7;
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v26;
        __int16 v35 = 2112;
        id v36 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Failed predicate: %@", buf, 0x16u);

        id v7 = v31;
        uint64_t v23 = v29;
      }

      a1 = 0;
    }
  }
  return a1;
}

- (BOOL)setValue:(id)a3 forSDKKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCHIPControllerPrivateStorage *)self home];
  id v9 = [v8 backingStore];
  id v10 = [v9 context];

  id v11 = [v10 managedObjectContext];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__HMDCHIPControllerPrivateStorage_setValue_forSDKKey___block_invoke;
  v17[3] = &unk_264A2F028;
  v17[4] = self;
  id v12 = v11;
  id v18 = v12;
  id v13 = v7;
  id v19 = v13;
  id v14 = v6;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  uint64_t v22 = &v23;
  [v15 unsafeSynchronousBlock:v17];
  LOBYTE(v10) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)v10;
}

void __54__HMDCHIPControllerPrivateStorage_setValue_forSDKKey___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v3)
  {
    -[HMDCHIPControllerPrivateStorage fetchKeyValuePairForKey:home:context:](*(void **)(a1 + 32), *(void **)(a1 + 48), v3, *(void **)(a1 + 40));
    id v4 = (_MKFMatterLocalKeyValuePair *)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v4)
    {
      id v6 = [(_MKFMatterLocalKeyValuePair *)v4 value];
      int v7 = [v6 isEqual:*(void *)(a1 + 56)];

      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v7)
      {
        if (v11)
        {
          id v12 = HMFGetLogIdentifier();
          uint64_t v13 = *(void *)(a1 + 48);
          id v14 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          long long v44 = v12;
          __int16 v45 = 2112;
          uint64_t v46 = v13;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating '%@' with the same value: %@", buf, 0x20u);
        }
        id v15 = v5;
        goto LABEL_29;
      }
      if (v11)
      {
        uint64_t v22 = HMFGetLogIdentifier();
        uint64_t v23 = *(void *)(a1 + 48);
        id v24 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        long long v44 = v22;
        __int16 v45 = 2112;
        uint64_t v46 = v23;
        __int16 v47 = 2112;
        id v48 = v24;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating value for '%@': %@", buf, 0x20u);
      }
      [(_MKFMatterLocalKeyValuePair *)v5 setValue:*(void *)(a1 + 56)];
      id v15 = v5;
    }
    else
    {
      id v15 = [[_MKFMatterLocalKeyValuePair alloc] initWithContext:*(void *)(a1 + 40)];
      [(_MKFMatterLocalKeyValuePair *)v15 setHome:v3];
      [(_MKFMatterLocalKeyValuePair *)v15 setKey:*(void *)(a1 + 48)];
      id v16 = (void *)MEMORY[0x230FBD990]([(_MKFMatterLocalKeyValuePair *)v15 setValue:*(void *)(a1 + 56)]);
      id v17 = *(id *)(a1 + 32);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = HMFGetLogIdentifier();
        uint64_t v20 = *(void *)(a1 + 48);
        id v21 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        long long v44 = v19;
        __int16 v45 = 2112;
        uint64_t v46 = v20;
        __int16 v47 = 2112;
        id v48 = v21;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Setting new value for '%@': %@", buf, 0x20u);
      }
    }
    uint64_t v25 = *(void **)(a1 + 64);
    id v42 = 0;
    int v26 = [v25 save:&v42];
    id v27 = v42;
    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 32);
    id v30 = HMFGetOSLogHandle();
    id v31 = v30;
    if (v26)
    {
      BOOL v32 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
      if (v5)
      {
        if (v32)
        {
          id v33 = HMFGetLogIdentifier();
          uint64_t v34 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          long long v44 = v33;
          __int16 v45 = 2112;
          uint64_t v46 = v34;
          __int16 v35 = "%{public}@Successfully updated value for '%@'";
LABEL_22:
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x16u);
        }
      }
      else if (v32)
      {
        id v33 = HMFGetLogIdentifier();
        uint64_t v40 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        long long v44 = v33;
        __int16 v45 = 2112;
        uint64_t v46 = v40;
        __int16 v35 = "%{public}@Successfully saved new value for '%@'";
        goto LABEL_22;
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
    BOOL v36 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v36)
      {
        uint64_t v37 = HMFGetLogIdentifier();
        uint64_t v38 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        long long v44 = v37;
        __int16 v45 = 2112;
        uint64_t v46 = v38;
        __int16 v47 = 2112;
        id v48 = v27;
        id v39 = "%{public}@Failed to update value for '%@': %@";
LABEL_26:
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, v39, buf, 0x20u);
      }
    }
    else if (v36)
    {
      uint64_t v37 = HMFGetLogIdentifier();
      uint64_t v41 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      long long v44 = v37;
      __int16 v45 = 2112;
      uint64_t v46 = v41;
      __int16 v47 = 2112;
      id v48 = v27;
      id v39 = "%{public}@Failed to save new value for '%@': %@";
      goto LABEL_26;
    }

    goto LABEL_28;
  }
LABEL_30:
}

- (id)valueForSDKKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCHIPControllerPrivateStorage *)self home];
  id v6 = [v5 backingStore];
  int v7 = [v6 context];

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__267809;
  uint64_t v20 = __Block_byref_object_dispose__267810;
  id v21 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__HMDCHIPControllerPrivateStorage_valueForSDKKey___block_invoke;
  v12[3] = &unk_264A2F000;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [v9 unsafeSynchronousBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __50__HMDCHIPControllerPrivateStorage_valueForSDKKey___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) managedObjectContext];
  id v6 = -[HMDCHIPControllerPrivateStorage fetchKeyValuePairForKey:home:context:](v3, v4, 0, v5);

  if (v6)
  {
    uint64_t v7 = [v6 value];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v20 = 138543874;
      id v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      uint64_t v16 = "%{public}@Found value for '%@': %@";
      id v17 = v12;
      uint32_t v18 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v20, v18);
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      int v20 = 138543618;
      id v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v19;
      uint64_t v16 = "%{public}@No value for '%@'";
      id v17 = v12;
      uint32_t v18 = 22;
      goto LABEL_6;
    }
  }
}

- (NSNumber)cachedLocalControllerNodeID
{
  id v3 = [(HMDCHIPControllerPrivateStorage *)self controllerNodeID];

  if (!v3)
  {
    if (self)
    {
      uint64_t v10 = 0;
      id v11 = &v10;
      uint64_t v12 = 0x3032000000;
      id v13 = __Block_byref_object_copy__267809;
      uint64_t v14 = __Block_byref_object_dispose__267810;
      id v15 = 0;
      id v4 = [(HMDCHIPControllerPrivateStorage *)self home];
      id v5 = [v4 backingStore];
      id v6 = [v5 context];

      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __52__HMDCHIPControllerPrivateStorage__fetchLocalNodeID__block_invoke;
      v9[3] = &unk_264A2F0A0;
      v9[4] = self;
      void v9[5] = &v10;
      [v6 unsafeSynchronousBlock:v9];
      id v7 = (id)v11[5];

      _Block_object_dispose(&v10, 8);
    }
    else
    {
      id v7 = 0;
    }
    [(HMDCHIPControllerPrivateStorage *)self setControllerNodeID:v7];
  }
  return [(HMDCHIPControllerPrivateStorage *)self controllerNodeID];
}

void __52__HMDCHIPControllerPrivateStorage__fetchLocalNodeID__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = [*(id *)(a1 + 32) home];
  id v4 = [v3 uuid];
  id v5 = +[HMCContext findHomeWithModelID:v4];

  if (v5)
  {
    uint64_t v6 = [v5 matterControllerNodeID];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFHome for : %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)privateDataSourceForControllerNodeID:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || [v4 isEqualToNumber:&unk_26E473C18])
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize controller's private storage as node ID is invalid (%@)", buf, 0x16u);
    }
    goto LABEL_6;
  }
  id v11 = v5;
  uint64_t v12 = v11;
  if (self)
  {
    uint64_t v13 = [(HMDCHIPControllerPrivateStorage *)self home];
    uint64_t v14 = [v13 backingStore];
    id v15 = [(id)v14 context];

    __int16 v16 = [v15 managedObjectContext];
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __56__HMDCHIPControllerPrivateStorage__setControllerNodeID___block_invoke;
    id v27 = &unk_264A2F078;
    uint64_t v28 = self;
    id v17 = v16;
    id v29 = v17;
    id v18 = v12;
    id v30 = v18;
    BOOL v32 = &v22;
    id v19 = v15;
    id v31 = v19;
    [v19 unsafeSynchronousBlock:buf];
    LOBYTE(v14) = *((unsigned char *)v23 + 24) == 0;

    _Block_object_dispose(&v22, 8);
    if (v14)
    {
LABEL_6:
      self = 0;
      goto LABEL_7;
    }
    [(HMDCHIPControllerPrivateStorage *)self setControllerNodeID:v18];
    int v20 = [HMDCHIPControllerPrivateDataSource alloc];
    id v21 = [(HMDCHIPControllerPrivateStorage *)self home];
    self = [(HMDCHIPControllerPrivateDataSource *)v20 initWithHome:v21 nodeID:v18];
  }
  else
  {
  }
LABEL_7:

  return self;
}

void __56__HMDCHIPControllerPrivateStorage__setControllerNodeID___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 matterControllerNodeID];
    int v6 = HMFEqualObjects();

    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    id v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v11 = HMFGetLogIdentifier();
        uint64_t v12 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        char v25 = v11;
        __int16 v26 = 2112;
        id v27 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating controller node id with the same value: %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        uint64_t v14 = [v4 matterControllerNodeID];
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        char v25 = v13;
        __int16 v26 = 2112;
        id v27 = v14;
        __int16 v28 = 2112;
        uint64_t v29 = v15;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting private storage as the controller node id has changed: %@ -> %@", buf, 0x20u);
      }
      if (-[HMDCHIPControllerPrivateStorage removeAllForHome:context:](*(void **)(a1 + 32), v4, *(void **)(a1 + 40)))
      {
        [v4 setMatterControllerNodeID:*(void *)(a1 + 48)];
        __int16 v16 = *(void **)(a1 + 56);
        id v23 = 0;
        char v17 = [v16 save:&v23];
        id v18 = v23;
        if (v17)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        }
        else
        {
          id v19 = (void *)MEMORY[0x230FBD990]();
          id v20 = *(id *)(a1 + 32);
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            char v25 = v22;
            __int16 v26 = 2112;
            id v27 = v18;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to save controller node id: %@", buf, 0x16u);
          }
        }
      }
    }
  }
}

- (NSDictionary)debugDictionaryRepresentation
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"Home UUID";
  id v3 = [(HMDCHIPControllerPrivateStorage *)self home];
  id v4 = [v3 uuid];
  v9[1] = @"Controller Node ID";
  v10[0] = v4;
  id v5 = [(HMDCHIPControllerPrivateStorage *)self controllerNodeID];
  int v6 = v5;
  if (!v5)
  {
    int v6 = [MEMORY[0x263EFF9D0] null];
  }
  v10[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  return (NSDictionary *)v7;
}

- (HMDCHIPControllerPrivateStorage)initWithHome:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDCHIPControllerPrivateStorage;
    int v6 = [(HMDCHIPControllerPrivateStorage *)&v11 init];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeWeak((id *)&v6->_home, v5);
    }

    return v7;
  }
  else
  {
    id v9 = (void *)_HMFPreconditionFailure();
    return (HMDCHIPControllerPrivateStorage *)+[HMDCHIPControllerPrivateStorage logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_267851 != -1) {
    dispatch_once(&logCategory__hmf_once_t33_267851, &__block_literal_global_267852);
  }
  v2 = (void *)logCategory__hmf_once_v34_267853;
  return v2;
}

void __46__HMDCHIPControllerPrivateStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v34_267853;
  logCategory__hmf_once_v34_267853 = v0;
}

@end