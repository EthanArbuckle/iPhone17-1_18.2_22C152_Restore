@interface HDDeviceStoreServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_deleteDevice:(id)a3 completion:(id)a4;
- (void)remote_fetchAllDevicesWithCompletion:(id)a3;
- (void)remote_fetchDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5;
- (void)remote_fetchGymkitAndBluetoothDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5;
@end

@implementation HDDeviceStoreServer

- (void)remote_fetchDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5
{
  v8 = (void (**)(id, void *, id))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(HDStandardTaskServer *)self profile];
  v12 = [v11 deviceManager];
  id v15 = 0;
  v13 = [v12 devicesWithProperty:v9 matchingValues:v10 error:&v15];

  id v14 = v15;
  v8[2](v8, v13, v14);
}

- (void)remote_fetchGymkitAndBluetoothDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  v11 = [(HDStandardTaskServer *)self profile];
  v12 = [v11 sourceManager];
  uint64_t v13 = *MEMORY[0x1E4F2BCF0];
  id v85 = 0;
  id v14 = [v12 allSourcesForBundleIdentifier:v13 error:&v85];
  id v15 = v85;

  if (v14)
  {
    v68 = self;
    v16 = [(HDStandardTaskServer *)self profile];
    v17 = [v16 sourceManager];
    uint64_t v18 = *MEMORY[0x1E4F2BD18];
    id v84 = v15;
    uint64_t v19 = [v17 allSourcesForBundleIdentifier:v18 error:&v84];
    id v20 = v84;

    v65 = (void *)v19;
    if (v19)
    {
      v62 = v10;
      id v63 = v8;
      id v64 = v9;
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v22 = v14;
      id v23 = v21;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v61 = v22;
      id v24 = v22;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v80 objects:v92 count:16];
      v26 = v68;
      if (v25)
      {
        uint64_t v27 = v25;
        uint64_t v28 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v81 != v28) {
              objc_enumerationMutation(v24);
            }
            v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * i), "persistentID"));
            [v23 addObject:v30];
          }
          uint64_t v27 = [v24 countByEnumeratingWithState:&v80 objects:v92 count:16];
        }
        while (v27);
      }

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v31 = v65;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v91 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v77;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v77 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * j), "persistentID"));
            [v23 addObject:v36];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v76 objects:v91 count:16];
        }
        while (v33);
      }

      v37 = [(HDStandardTaskServer *)v68 profile];
      v38 = [v37 dataProvenanceManager];
      v39 = [(HDStandardTaskServer *)v68 profile];
      id v75 = v20;
      v40 = [v38 deviceIDsForSourceIDs:v23 profile:v39 error:&v75];
      id v41 = v75;

      v60 = v40;
      if (v40)
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        obuint64_t j = v40;
        uint64_t v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v90, 16, v40);
        v67 = v42;
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v72;
          do
          {
            for (uint64_t k = 0; k != v44; ++k)
            {
              v47 = v41;
              if (*(void *)v72 != v45) {
                objc_enumerationMutation(obj);
              }
              uint64_t v48 = *(void *)(*((void *)&v71 + 1) + 8 * k);
              v49 = [(HDStandardTaskServer *)v26 profile];
              v50 = [v49 deviceManager];
              id v70 = v41;
              v51 = [v50 deviceForPersistentID:v48 error:&v70];
              id v41 = v70;

              if (v51)
              {
                [v67 addObject:v51];
                v26 = v68;
              }
              else
              {
                _HKInitializeLogging();
                v52 = *MEMORY[0x1E4F29F18];
                v26 = v68;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v87 = v68;
                  __int16 v88 = 2114;
                  uint64_t v89 = v48;
                  _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "%@: Failed to fetch device with ID: %{public}@", buf, 0x16u);
                }
              }
            }
            uint64_t v44 = [obj countByEnumeratingWithState:&v71 objects:v90 count:16];
          }
          while (v44);
        }
        v53 = v41;

        v54 = [(HDStandardTaskServer *)v26 profile];
        v55 = [v54 deviceManager];
        id v69 = v41;
        id v8 = v63;
        v56 = [v55 devicesWithProperty:v64 matchingValues:v63 error:&v69];
        id v41 = v69;

        if (v56)
        {
          v57 = [v56 allObjects];
          v58 = v67;
          [v67 addObjectsFromArray:v57];

          v59 = [MEMORY[0x1E4F1CAD0] setWithArray:v67];
          id v10 = v62;
          ((void (**)(id, void *, id))v62)[2](v62, v59, 0);
        }
        else
        {
          id v10 = v62;
          v62[2](v62, 0, v41);
          v58 = v67;
        }
      }
      else
      {
        id v10 = v62;
        v62[2](v62, 0, v41);
        id v8 = v63;
      }

      id v20 = v41;
      id v9 = v64;
      id v14 = v61;
    }
    else
    {
      v10[2](v10, 0, v20);
    }

    id v15 = v20;
  }
  else
  {
    v10[2](v10, 0, v15);
  }
}

- (void)remote_fetchAllDevicesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 deviceManager];
  id v9 = 0;
  v7 = [v6 allDevicesWithError:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_deleteDevice:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 deviceManager];
  id v12 = 0;
  uint64_t v10 = [v9 deleteDevice:v7 error:&v12];

  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7C40](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7C38](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AF38] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end