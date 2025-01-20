@interface HMDApplicationVendorIDStore
+ (BOOL)supportsSecureCoding;
+ (id)sharedStore;
- (BOOL)_addVendorID:(id)a3 forApplication:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6;
- (HMDApplicationVendorIDStore)init;
- (HMDApplicationVendorIDStore)initWithCoder:(id)a3;
- (NSMutableDictionary)applicationMachUUIDMapping;
- (NSMutableDictionary)applicationVendorIdMapping;
- (OS_dispatch_queue)clientQueue;
- (id)_machUUIDsForApplication:(id)a3;
- (id)_vendorIDForApplication:(id)a3;
- (id)machUUIDsForApplication:(id)a3;
- (id)vendorIDForApplication:(id)a3;
- (void)__handleUninstalledApplication:(id)a3;
- (void)_extractVendorIDForApplication:(id)a3;
- (void)_save;
- (void)_setAndSaveVendorID:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6;
- (void)addVendorID:(id)a3 applicationBundleId:(id)a4;
- (void)addVendorID:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5;
- (void)addVendorID:(id)a3 applicationBundleId:(id)a4 spiClient:(BOOL)a5;
- (void)checkCorrectness;
- (void)encodeWithCoder:(id)a3;
- (void)removeVendorIDForApplicationBundleId:(id)a3;
@end

@implementation HMDApplicationVendorIDStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_applicationMachUUIDMapping, 0);
  objc_storeStrong((id *)&self->_applicationVendorIdMapping, 0);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableDictionary)applicationMachUUIDMapping
{
  return self->_applicationMachUUIDMapping;
}

- (NSMutableDictionary)applicationVendorIdMapping
{
  return self->_applicationVendorIdMapping;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDApplicationVendorIDStore *)self applicationVendorIdMapping];
  v5 = (void *)[v6 copy];
  [v4 encodeObject:v5 forKey:@"HM.vendorIDStore"];
}

- (HMDApplicationVendorIDStore)initWithCoder:(id)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDApplicationVendorIDStore *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HM.vendorIDStore"];

    if (v9)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = HMFGetLogIdentifier();
        int v16 = 138543618;
        v17 = v12;
        __int16 v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Retrieved application vendor ID store: %@", (uint8_t *)&v16, 0x16u);
      }
      uint64_t v13 = [v9 mutableCopy];
      applicationVendorIdMapping = v5->_applicationVendorIdMapping;
      v5->_applicationVendorIdMapping = (NSMutableDictionary *)v13;
    }
  }

  return v5;
}

- (void)__handleUninstalledApplication:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMDApplicationVendorIDStore___handleUninstalledApplication___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __62__HMDApplicationVendorIDStore___handleUninstalledApplication___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v6 = [v4 bundleIdentifier];

  v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) removeVendorIDForApplicationBundleId:v6];
    v5 = v6;
  }
}

- (id)_machUUIDsForApplication:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDApplicationVendorIDStore *)self applicationMachUUIDMapping];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
    id v8 = v7;
    if (v7)
    {
      id v6 = [v7 machOUUIDs];
      v9 = (void *)MEMORY[0x230FBD990]();
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        int v14 = 138543874;
        v15 = v11;
        __int16 v16 = 2112;
        id v17 = v4;
        __int16 v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Mach UUID mapping with application bundle ID %@ and %@", (uint8_t *)&v14, 0x20u);
      }
      v12 = [(HMDApplicationVendorIDStore *)self applicationMachUUIDMapping];
      [v12 setObject:v6 forKeyedSubscript:v4];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)machUUIDsForApplication:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__132975;
    v15 = __Block_byref_object_dispose__132976;
    id v16 = 0;
    v5 = [(HMDApplicationVendorIDStore *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__HMDApplicationVendorIDStore_machUUIDsForApplication___block_invoke;
    block[3] = &unk_264A2F698;
    v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __55__HMDApplicationVendorIDStore_machUUIDsForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _machUUIDsForApplication:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_save
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [(HMDApplicationVendorIDStore *)self applicationVendorIdMapping];
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Archiving vendor id store %@", (uint8_t *)&v7, 0x16u);
  }
  +[HMDPersistentStore archiveVendorStore:self];
}

- (void)removeVendorIDForApplicationBundleId:(id)a3
{
  id v4 = a3;
  v5 = [(HMDApplicationVendorIDStore *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HMDApplicationVendorIDStore_removeVendorIDForApplicationBundleId___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HMDApplicationVendorIDStore_removeVendorIDForApplicationBundleId___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) applicationVendorIdMapping];
    uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (v3)
    {
      int v4 = [v3 spiClient];
      v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = HMFGetOSLogHandle();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (!v4)
      {
        if (v7)
        {
          int v14 = HMFGetLogIdentifier();
          uint64_t v15 = *(void *)(a1 + 32);
          int v25 = 138543618;
          v26 = v14;
          __int16 v27 = 2112;
          uint64_t v28 = v15;
          _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing mapping for application bundle id %@", (uint8_t *)&v25, 0x16u);
        }
        id v16 = [*(id *)(a1 + 40) applicationVendorIdMapping];
        [v16 removeObjectForKey:*(void *)(a1 + 32)];

        if (isWatch())
        {
          id v17 = [v3 companionAppBundleId];

          if (v17)
          {
            __int16 v18 = [*(id *)(a1 + 40) applicationVendorIdMapping];
            v19 = [v3 companionAppBundleId];
            [v18 removeObjectForKey:v19];
          }
          else
          {
            uint64_t v20 = (void *)MEMORY[0x230FBD990]();
            id v21 = *(id *)(a1 + 40);
            v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v23 = HMFGetLogIdentifier();
              uint64_t v24 = *(void *)(a1 + 32);
              int v25 = 138543618;
              v26 = v23;
              __int16 v27 = 2112;
              uint64_t v28 = v24;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@WatchOS : Companion app does not exist for %@. Hence not removing the mapping.", (uint8_t *)&v25, 0x16u);
            }
          }
        }
        [*(id *)(a1 + 40) _save];
        goto LABEL_21;
      }
      if (v7)
      {
        id v8 = HMFGetLogIdentifier();
        int v25 = 138543362;
        v26 = v8;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@This is an internal client, do not remove it.", (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        uint64_t v13 = *(void *)(a1 + 32);
        int v25 = 138543618;
        v26 = v12;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Unknown application %@, cannot remove", (uint8_t *)&v25, 0x16u);
      }
    }

LABEL_21:

    return;
  }
  __int16 v9 = (void *)MEMORY[0x230FBD990]();
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received invalid application bundle identifier, cannot remove", (uint8_t *)&v25, 0xCu);
  }
}

- (BOOL)_addVendorID:(id)a3 forApplication:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (HMDApplicationVendorIDStoreValue *)a4;
  id v12 = a5;
  if (!v11)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v23;
      uint64_t v24 = "%{public}@Received invalid application bundle identifier";
LABEL_13:
      int v25 = v22;
      uint32_t v26 = 12;
      goto LABEL_14;
    }
LABEL_15:

    char v27 = 0;
    goto LABEL_16;
  }
  if (!v10)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v32 = 138543618;
      v33 = v23;
      __int16 v34 = 2112;
      v35 = v11;
      uint64_t v24 = "%{public}@Vendor ID provided is invalid, cannot add entry for %@";
      int v25 = v22;
      uint32_t v26 = 22;
LABEL_14:
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v32, v26);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v23;
      uint64_t v24 = "%{public}@Invalid data type";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  id v13 = v10;
  int v14 = [(HMDApplicationVendorIDStore *)self applicationVendorIdMapping];
  uint64_t v15 = [v14 objectForKey:v11];

  id v16 = [v15 vendorIdSha1];
  char v17 = [v16 isEqualToData:v13];

  if (v17)
  {
    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Already exists, do not need to proceed further.", (uint8_t *)&v32, 0xCu);
    }
  }
  else
  {
    uint64_t v29 = [[HMDApplicationVendorIDStoreValue alloc] initWithVendorIDSha1:v13 applicationBundleId:v11 companionAppBundleId:v12 spiClient:v6];

    v30 = [(HMDApplicationVendorIDStore *)self applicationVendorIdMapping];
    [v30 setObject:v29 forKeyedSubscript:v11];

    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      int v32 = 138543874;
      v33 = v31;
      __int16 v34 = 2112;
      v35 = v29;
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating new entry %@ for application bundle ID %@", (uint8_t *)&v32, 0x20u);
    }
    uint64_t v15 = v29;
  }

  char v27 = v17 ^ 1;

LABEL_16:
  return v27;
}

- (void)_setAndSaveVendorID:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6
{
  if ([(HMDApplicationVendorIDStore *)self _addVendorID:a3 forApplication:a4 companionAppBundleId:a5 spiClient:a6])
  {
    [(HMDApplicationVendorIDStore *)self _save];
  }
}

- (void)addVendorID:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDApplicationVendorIDStore *)self clientQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_companionAppBundleId___block_invoke;
  v15[3] = &unk_264A2E610;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __84__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_companionAppBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAndSaveVendorID:*(void *)(a1 + 40) applicationBundleId:*(void *)(a1 + 48) companionAppBundleId:*(void *)(a1 + 56) spiClient:0];
}

- (void)addVendorID:(id)a3 applicationBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDApplicationVendorIDStore *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDApplicationVendorIDStore_addVendorID_applicationBundleId___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __63__HMDApplicationVendorIDStore_addVendorID_applicationBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAndSaveVendorID:*(void *)(a1 + 40) applicationBundleId:*(void *)(a1 + 48) companionAppBundleId:0 spiClient:0];
}

- (void)addVendorID:(id)a3 applicationBundleId:(id)a4 spiClient:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDApplicationVendorIDStore *)self clientQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_spiClient___block_invoke;
  v13[3] = &unk_264A2B1D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __73__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_spiClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAndSaveVendorID:*(void *)(a1 + 40) applicationBundleId:*(void *)(a1 + 48) companionAppBundleId:0 spiClient:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_extractVendorIDForApplication:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v13 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v13];
  id v6 = v13;
  if (v5)
  {
    id v7 = [v5 deviceIdentifierForVendor];
    id v8 = [v7 UUIDString];
    id v9 = objc_msgSend(v8, "hm_generateSHA1");

    [(HMDApplicationVendorIDStore *)self _setAndSaveVendorID:v9 applicationBundleId:v4 companionAppBundleId:0 spiClient:0];
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Bundle ID: %@ cannot be extracted (or cannot determine): %@", buf, 0x20u);
    }
  }
}

- (id)_vendorIDForApplication:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDApplicationVendorIDStore *)self applicationVendorIdMapping];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    if (isWatch())
    {
      id v6 = 0;
    }
    else
    {
      [(HMDApplicationVendorIDStore *)self _extractVendorIDForApplication:v4];
      id v7 = [(HMDApplicationVendorIDStore *)self applicationVendorIdMapping];
      id v6 = [v7 objectForKey:v4];

      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        id v11 = [v6 vendorIdSha1];
        int v14 = 138543874;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v4;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@There is no vendor id for %@, newly extracted vendor id is %@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
  id v12 = [v6 vendorIdSha1];

  return v12;
}

- (id)vendorIDForApplication:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__132975;
    id v15 = __Block_byref_object_dispose__132976;
    id v16 = 0;
    v5 = [(HMDApplicationVendorIDStore *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HMDApplicationVendorIDStore_vendorIDForApplication___block_invoke;
    block[3] = &unk_264A2F698;
    id v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __54__HMDApplicationVendorIDStore_vendorIDForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _vendorIDForApplication:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)checkCorrectness
{
  uint64_t v3 = [(HMDApplicationVendorIDStore *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HMDApplicationVendorIDStore_checkCorrectness__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__HMDApplicationVendorIDStore_checkCorrectness__block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [*(id *)(a1 + 32) applicationVendorIdMapping];
  uint64_t v3 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  uint64_t v32 = a1;
  v33 = v2;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v39;
    *(void *)&long long v4 = 138544130;
    long long v31 = v4;
    uint64_t v34 = *(void *)v39;
    do
    {
      uint64_t v7 = 0;
      uint64_t v35 = v5;
      do
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 32), "applicationVendorIdMapping", v31);
        id v10 = [v9 objectForKeyedSubscript:v8];

        if (([v10 spiClient] & 1) == 0)
        {
          if (!isWatch()
            || ([v10 companionAppBundleId],
                uint64_t v11 = objc_claimAutoreleasedReturnValue(),
                v11,
                v11))
          {
            id v12 = objc_alloc(MEMORY[0x263F01878]);
            id v37 = 0;
            uint64_t v13 = (void *)[v12 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v37];
            id v14 = v37;
            if (v13)
            {
              id v15 = [v13 deviceIdentifierForVendor];
              uint64_t v16 = [v15 UUIDString];
              id v17 = objc_msgSend((id)v16, "hm_generateSHA1");

              __int16 v18 = [v10 vendorIdSha1];
              LOBYTE(v16) = [v17 isEqualToData:v18];

              if ((v16 & 1) == 0)
              {
                id v19 = (void *)MEMORY[0x230FBD990]();
                uint64_t v20 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  id v21 = HMFGetLogIdentifier();
                  v22 = [v10 vendorIdSha1];
                  *(_DWORD *)buf = v31;
                  v43 = v21;
                  __int16 v44 = 2112;
                  v45 = v22;
                  __int16 v46 = 2112;
                  id v47 = v17;
                  __int16 v48 = 2112;
                  v49 = v8;
                  _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Vendor IDs are mismatching (Known: %@, Now: %@) for bundle ID: %@", buf, 0x2Au);

                  uint64_t v2 = v33;
                  a1 = v32;
                }

                [v2 addObject:v8];
                if (isWatch())
                {
                  v23 = [v10 companionAppBundleId];
                  [v33 addObject:v23];

                  uint64_t v2 = v33;
                }
              }
              uint64_t v6 = v34;
LABEL_20:

              uint64_t v5 = v35;
            }
            else
            {
              uint64_t v24 = (void *)MEMORY[0x230FBD990]();
              int v25 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                uint32_t v26 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v43 = v26;
                __int16 v44 = 2112;
                v45 = v8;
                __int16 v46 = 2112;
                id v47 = v14;
                _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Bundle ID: %@ does not exist (or cannot determine) anymore, removing it from the store: %@", buf, 0x20u);

                uint64_t v5 = v35;
              }

              [v2 addObject:v8];
              uint64_t v6 = v34;
              if (isWatch())
              {
                id v17 = [v10 companionAppBundleId];
                [v2 addObject:v17];
                goto LABEL_20;
              }
            }
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    char v27 = (void *)MEMORY[0x230FBD990]();
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v29;
      __int16 v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing the entries for bundle IDs: %@ from the store", buf, 0x16u);
    }
    v30 = [*(id *)(v32 + 32) applicationVendorIdMapping];
    [v30 removeObjectsForKeys:v33];

    uint64_t v2 = v33;
    [*(id *)(v32 + 32) _save];
  }
}

- (HMDApplicationVendorIDStore)init
{
  v14.receiver = self;
  v14.super_class = (Class)HMDApplicationVendorIDStore;
  uint64_t v2 = [(HMDApplicationVendorIDStore *)&v14 init];
  if (v2)
  {
    HMDispatchQueueNameString();
    id v3 = objc_claimAutoreleasedReturnValue();
    long long v4 = (const char *)[v3 UTF8String];
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    applicationVendorIdMapping = v2->_applicationVendorIdMapping;
    v2->_applicationVendorIdMapping = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    applicationMachUUIDMapping = v2->_applicationMachUUIDMapping;
    v2->_applicationMachUUIDMapping = (NSMutableDictionary *)v10;

    id v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v2 selector:sel___handleUninstalledApplication_ name:@"HMDApplicationUninstalledNotification" object:0];
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_133002);
  }
  uint64_t v2 = (void *)store;
  return v2;
}

uint64_t __42__HMDApplicationVendorIDStore_sharedStore__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = +[HMDPersistentStore unarchiveVendorStore];
  v1 = (void *)store;
  store = v0;

  uint64_t v2 = (void *)store;
  if (!store)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    long long v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@No archived vendor ID store, creating a new one", (uint8_t *)&v9, 0xCu);
    }
    dispatch_queue_t v6 = objc_alloc_init(HMDApplicationVendorIDStore);
    uint64_t v7 = (void *)store;
    store = (uint64_t)v6;

    uint64_t v2 = (void *)store;
  }
  return [v2 checkCorrectness];
}

@end