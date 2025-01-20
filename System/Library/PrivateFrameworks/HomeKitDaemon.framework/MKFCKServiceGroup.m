@interface MKFCKServiceGroup
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (id)_fetchServiceDetailsWithLocalModel:(void *)a1;
@end

@implementation MKFCKServiceGroup

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7 = a3;
  if ([(MKFCKModel *)self copyPropertiesIntoLocalModel:v7 context:a5])
  {
    id v8 = v7;
    v9 = v8;
    if (self)
    {
      uint64_t v10 = [(MKFCKServiceGroup *)self services];
      v11 = (void *)v10;
      v12 = (void *)MEMORY[0x263EFFA68];
      if (v10) {
        v12 = (void *)v10;
      }
      id v13 = v12;

      v14 = -[MKFCKServiceGroup _fetchServiceDetailsWithLocalModel:](v9);
      if ((arraysEqualIgnoringOrder(v14, v13) & 1) == 0)
      {
        id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v18 = MEMORY[0x263EF8330];
        uint64_t v19 = 3221225472;
        v20 = __50__MKFCKServiceGroup_importServicesIntoLocalModel___block_invoke;
        v21 = &unk_264A2F140;
        v22 = self;
        id v23 = v15;
        id v16 = v15;
        objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v18);
        objc_msgSend(v9, "setServices_:", v16, v18, v19, v20, v21, v22);
      }
      self = [(MKFCKServiceGroup *)self applicationData];
      +[_MKFApplicationData setAppDataDictionary:self forContainer:v9];

      LOBYTE(self) = 1;
    }
    else
    {
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (id)_fetchServiceDetailsWithLocalModel:(void *)a1
{
  v26[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v2 setName:@"a"];
  [v2 setExpressionResultType:1100];
  v3 = [MEMORY[0x263F087F0] expressionForKeyPath:@"accessory.modelID"];
  [v2 setExpression:v3];

  id v4 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v4 setName:@"i"];
  [v4 setExpressionResultType:300];
  v5 = [MEMORY[0x263F087F0] expressionForKeyPath:@"instanceID"];
  [v4 setExpression:v5];

  v6 = +[_MKFService fetchRequest];
  id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ in %K", v1, @"serviceGroups_"];
  [v6 setPredicate:v7];

  v26[0] = v2;
  v26[1] = v4;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  [v6 setPropertiesToFetch:v8];

  [v6 setResultType:2];
  id v19 = 0;
  v9 = [v6 execute:&v19];
  id v10 = v19;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = objc_opt_class();
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      objc_msgSend(v1, "hmd_debugIdentifier");
      id v16 = v18 = v12;
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      __int16 v22 = 2112;
      id v23 = v16;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch service details for %@: %{public}@", buf, 0x20u);

      v12 = v18;
    }
  }

  return v9;
}

void __50__MKFCKServiceGroup_importServicesIntoLocalModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v49 = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = v4;
  if (v3)
  {
    v6 = [v4 objectForKeyedSubscript:@"a"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    v9 = [v5 objectForKeyedSubscript:@"i"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v8) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      v14 = objc_opt_class();
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v38 = v16;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v5;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid service details: %@", buf, 0x16u);
      }
      context = 0;
    }
    else
    {
      v17 = +[_MKFService fetchRequest];
      uint64_t v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"accessory.modelID", v8, @"instanceID", v11];
      [v17 setPredicate:v18];

      [v17 setFetchLimit:2];
      id v36 = 0;
      id v19 = [v17 execute:&v36];
      id v20 = v36;
      v21 = v20;
      if (v19)
      {
        if ([v19 count] != 1)
        {
          contexta = (void *)MEMORY[0x230FBD990]();
          __int16 v22 = objc_opt_class();
          id v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v24 = v31 = v21;
            uint64_t v30 = [v19 count];
            id v25 = objc_msgSend(v3, "hmd_debugIdentifier");
            *(_DWORD *)buf = 138544642;
            v38 = v24;
            __int16 v39 = 2048;
            uint64_t v40 = v30;
            __int16 v41 = 2160;
            uint64_t v42 = 1752392040;
            __int16 v43 = 2112;
            id v44 = v8;
            __int16 v45 = 2112;
            id v46 = v11;
            __int16 v47 = 2112;
            v48 = v25;
            _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Warning: Found %tu local services %{mask.hash}@/%@ for %@", buf, 0x3Eu);

            v21 = v31;
          }
        }
        context = [v19 firstObject];
      }
      else
      {
        contextb = (void *)MEMORY[0x230FBD990]();
        v26 = objc_opt_class();
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = uint64_t v32 = v2;
          v29 = objc_msgSend(v3, "hmd_debugIdentifier");
          *(_DWORD *)buf = 138544642;
          v38 = v28;
          __int16 v39 = 2160;
          uint64_t v40 = 1752392040;
          __int16 v41 = 2112;
          uint64_t v42 = (uint64_t)v8;
          __int16 v43 = 2112;
          id v44 = v11;
          __int16 v45 = 2112;
          id v46 = v29;
          __int16 v47 = 2114;
          v48 = v21;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local service %{mask.hash}@/%@ for %@: %{public}@", buf, 0x3Eu);

          uint64_t v2 = v32;
        }

        context = 0;
      }
    }
    if (context)
    {
      objc_msgSend(*(id *)(v2 + 40), "addObject:");
      goto LABEL_30;
    }
  }
  else
  {
  }
  context = 0;
LABEL_30:
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7 = a3;
  BOOL v8 = [(MKFCKModel *)self copyPropertiesFromLocalModel:v7 context:a5];
  if (self) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = -[MKFCKServiceGroup _fetchServiceDetailsWithLocalModel:](v7);
    id v11 = [(MKFCKServiceGroup *)self services];
    char v12 = arraysEqualIgnoringOrder(v11, v10);

    if ((v12 & 1) == 0) {
      [(MKFCKServiceGroup *)self setServices:v10];
    }

    id v13 = +[_MKFApplicationData appDataDictionaryForContainer:v7];
    v14 = [(MKFCKServiceGroup *)self applicationData];
    char v15 = HMFEqualObjects();

    if ((v15 & 1) == 0) {
      [(MKFCKServiceGroup *)self setApplicationData:v13];
    }
  }
  return v9;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKServiceGroup"];
}

@end