@interface HMMTRVendorMetadataFileStore
+ (id)logCategory;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (HMMTRFileManager)fileManager;
- (HMMTRVendorMetadata)metadata;
- (HMMTRVendorMetadataFileStore)initWithFileURL:(id)a3;
- (HMMTRVendorMetadataFileStore)initWithFileURL:(id)a3 uarpController:(id)a4 fileManager:(id)a5;
- (HMMTRVendorMetadataStoreDelegate)delegate;
- (NSCache)vendorMetadataCache;
- (NSMutableSet)batchedAccessories;
- (NSURL)fileURL;
- (UARPController)uarpController;
- (id)_retrieveVendorMetadataForVendorID:(id)a3 productID:(id)a4 metadata:(id)a5;
- (id)retrieveVendorMetadataForVendorID:(id)a3 productID:(id)a4;
- (id)staticMetadata;
- (id)staticMetadataFileURL;
- (void)_addProductInfoToMetadata:(id)a3 accessories:(id)a4;
- (void)_addVendorInfoToMetadata:(id)a3 accessories:(id)a4;
- (void)_prepopulateCacheForKnownAccessories:(id)a3;
- (void)_processSupportedAccessories:(id)a3;
- (void)_saveMetadata:(id)a3;
- (void)fetchCloudMetadata;
- (void)setBatchedAccessories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
@end

@implementation HMMTRVendorMetadataFileStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorMetadataCache, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_batchedAccessories, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (NSCache)vendorMetadataCache
{
  return self->_vendorMetadataCache;
}

- (HMMTRFileManager)fileManager
{
  return (HMMTRFileManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBatchedAccessories:(id)a3
{
}

- (NSMutableSet)batchedAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (UARPController)uarpController
{
  return (UARPController *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x2533B64D0]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    uint64_t v14 = [v8 count];
    v15 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    v30 = v13;
    __int16 v31 = 2048;
    uint64_t v32 = v14;
    __int16 v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Received batched supported accessories, number of entries: %lu, isComplete: %@", buf, 0x20u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * v20);
        v22 = [(HMMTRVendorMetadataFileStore *)v11 batchedAccessories];
        [v22 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  if (v5)
  {
    v23 = [(HMMTRVendorMetadataFileStore *)v11 batchedAccessories];
    [(HMMTRVendorMetadataFileStore *)v11 _processSupportedAccessories:v23];

    [(HMMTRVendorMetadataFileStore *)v11 setBatchedAccessories:0];
  }
}

- (void)_processSupportedAccessories:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x2533B64D0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = [v4 count];
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing all supported accessories, number of entries: %lu", (uint8_t *)&v14, 0x16u);
  }
  if ([v4 count])
  {
    id v9 = objc_alloc_init(HMMTRMutableVendorMetadata);
    [(HMMTRVendorMetadataFileStore *)v6 _addVendorInfoToMetadata:v9 accessories:v4];
    [(HMMTRVendorMetadataFileStore *)v6 _addProductInfoToMetadata:v9 accessories:v4];
    [(HMMTRVendorMetadataFileStore *)v6 _saveMetadata:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x2533B64D0]();
    v11 = v6;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@No vendor/product information available", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_addProductInfoToMetadata:(id)a3 accessories:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = a4;
  uint64_t v49 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v49)
  {
    uint64_t v8 = *(void *)v51;
    *(void *)&long long v7 = 138543874;
    long long v43 = v7;
    v44 = v6;
    v45 = self;
    uint64_t v46 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "hardwareID", v43);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
        id v13 = v12;

        if (v13)
        {
          int v14 = [v13 metadata];
          if (v14)
          {
            v15 = [v10 productNumber];
            char v16 = [v15 isEqualToString:@"0000"];

            if ((v16 & 1) == 0)
            {
              v47 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "vendorID"));
              uint64_t v17 = objc_msgSend(v6, "vendorWithID:");
              uint64_t v18 = (void *)[v17 mutableCopy];

              if (v18)
              {
                uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "productID"));
                uint64_t v20 = +[HMMTRProtocolMap protocolMap];
                uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "accessoryCategoryNumber"));
                v54 = v21;
                v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
                v23 = [v20 categoriesForDeviceTypes:v22];

                if (v23)
                {
                  uint64_t v24 = [v23 firstObject];
                  if (v24) {
                    long long v25 = (void *)v24;
                  }
                  else {
                    long long v25 = &unk_2702B50D0;
                  }
                }
                else
                {
                  long long v25 = &unk_2702B50D0;
                }
                v39 = [(HMMTRVendorMetadataProduct *)[HMMTRMutableVendorMetadataProduct alloc] initWithIdentifier:v19 categoryNumber:v25];
                v40 = [v14 accessoryMarketingName];
                [(HMMTRVendorMetadataProduct *)v39 setName:v40];

                v41 = [v14 accessoryMarketingName];
                [(HMMTRVendorMetadataProduct *)v39 setModel:v41];

                v42 = [v14 accessoryInstallationGuideURL];
                [(HMMTRVendorMetadataProduct *)v39 setInstallationGuideURL:v42];

                [v18 addProduct:v39];
                id v6 = v44;
                [v44 addVendor:v18];

                self = v45;
              }
              else
              {
                uint64_t v35 = (void *)MEMORY[0x2533B64D0]();
                v36 = self;
                v37 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  v38 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v43;
                  v56 = v38;
                  __int16 v57 = 2112;
                  id v58 = v47;
                  __int16 v59 = 2112;
                  v60 = v10;
                  _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Vendor %@ not found for product record %@", buf, 0x20u);

                  self = v45;
                }
              }

              uint64_t v8 = v46;
            }
          }
          else
          {
            __int16 v31 = (void *)MEMORY[0x2533B64D0]();
            uint64_t v32 = self;
            __int16 v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v56 = v34;
              __int16 v57 = 2112;
              id v58 = v13;
              _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find metadata on chip device information: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          long long v26 = (void *)MEMORY[0x2533B64D0]();
          long long v27 = self;
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = HMFGetLogIdentifier();
            v30 = [v10 hardwareID];
            *(_DWORD *)buf = 138543618;
            v56 = v29;
            __int16 v57 = 2112;
            id v58 = v30;
            _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Received supported accessory with unexpected hardwareID: %@", buf, 0x16u);

            uint64_t v8 = v46;
          }
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v49);
  }
}

- (void)_addVendorInfoToMetadata:(id)a3 accessories:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v30 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v11 = [v10 hardwareID];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
        id v13 = v12;

        if (v13)
        {
          int v14 = [v13 metadata];
          if (v14)
          {
            v15 = [v10 productNumber];
            int v16 = [v15 isEqualToString:@"0000"];

            if (v16)
            {
              uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "vendorID"));
              uint64_t v18 = [v30 vendorWithID:v17];
              uint64_t v19 = (HMMTRMutableVendorMetadataVendor *)[v18 mutableCopy];

              if (!v19)
              {
                uint64_t v19 = [(HMMTRVendorMetadataVendor *)[HMMTRMutableVendorMetadataVendor alloc] initWithIdentifier:v17];
                uint64_t v20 = [v14 vendorName];
                [(HMMTRVendorMetadataVendor *)v19 setName:v20];

                [v30 addVendor:v19];
              }
            }
          }
          else
          {
            long long v26 = (void *)MEMORY[0x2533B64D0]();
            long long v27 = self;
            v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v37 = v29;
              __int16 v38 = 2112;
              id v39 = v13;
              _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find metadata on chip device information: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v21 = (void *)MEMORY[0x2533B64D0]();
          v22 = self;
          v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = HMFGetLogIdentifier();
            long long v25 = [v10 hardwareID];
            *(_DWORD *)buf = 138543618;
            v37 = v24;
            __int16 v38 = 2112;
            id v39 = v25;
            _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Received supported vendor record with unexpected hardwareID: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v7);
  }
}

- (void)_prepopulateCacheForKnownAccessories:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMMTRVendorMetadataFileStore *)self delegate];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __69__HMMTRVendorMetadataFileStore__prepopulateCacheForKnownAccessories___block_invoke;
  int v14 = &unk_2653756B0;
  v15 = self;
  id v16 = v4;
  id v6 = v4;
  [v5 forAllPairedMatterServersFetchVidPid:&v11];

  id v7 = -[HMMTRVendorMetadataFileStore _retrieveVendorMetadataForVendorID:productID:metadata:](self, "_retrieveVendorMetadataForVendorID:productID:metadata:", &unk_2702B5070, 0, v6, v11, v12, v13, v14, v15);
  id v8 = [(HMMTRVendorMetadataFileStore *)self _retrieveVendorMetadataForVendorID:&unk_2702B5088 productID:0 metadata:v6];
  id v9 = [(HMMTRVendorMetadataFileStore *)self _retrieveVendorMetadataForVendorID:&unk_2702B50A0 productID:0 metadata:v6];
  id v10 = [(HMMTRVendorMetadataFileStore *)self _retrieveVendorMetadataForVendorID:&unk_2702B50B8 productID:0 metadata:v6];
}

id *__69__HMMTRVendorMetadataFileStore__prepopulateCacheForKnownAccessories___block_invoke(id *result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return (id *)(id)[result[4] _retrieveVendorMetadataForVendorID:a2 productID:a3 metadata:result[5]];
    }
  }
  return result;
}

- (void)_saveMetadata:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMMTRVendorMetadataFileStore *)self fileManager];
  id v6 = [v4 dictionaryRepresentation];
  id v7 = [(HMMTRVendorMetadataFileStore *)self fileURL];
  id v19 = 0;
  int v8 = [v5 writeDictionary:v6 toURL:v7 error:&v19];
  id v9 = v19;

  id v10 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      v15 = [(HMMTRVendorMetadataFileStore *)v11 fileURL];
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully saved metadata to %@", buf, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    id v16 = [(HMMTRVendorMetadataFileStore *)v11 vendorMetadataCache];
    [v16 removeAllObjects];

    os_unfair_lock_unlock(&v11->_lock);
    [(HMMTRVendorMetadataFileStore *)v11 _prepopulateCacheForKnownAccessories:v4];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [(HMMTRVendorMetadataFileStore *)v11 fileURL];
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      v23 = v18;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to write vendor metadata to %@: %@", buf, 0x20u);
    }
  }
}

- (id)staticMetadata
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(HMMTRVendorMetadataFileStore *)self fileManager];
  id v4 = [(HMMTRVendorMetadataFileStore *)self staticMetadataFileURL];
  id v21 = 0;
  BOOL v5 = [v3 dictionaryWithContentsOfURL:v4 error:&v21];
  id v6 = v21;

  if (v5)
  {
    id v7 = [[HMMTRVendorMetadata alloc] initWithDictionaryRepresentation:v5];
    int v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v16 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v23 = v19;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode local vendor metadata from dictionary representation", buf, 0xCu);
      }
      id v9 = objc_alloc_init(HMMTRVendorMetadata);
    }
    v15 = v9;
  }
  else
  {
    id v10 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = [(HMMTRVendorMetadataFileStore *)v11 staticMetadataFileURL];
      *(_DWORD *)buf = 138543874;
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v14;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to load local vendor metadata at file URL %@: %@", buf, 0x20u);
    }
    v15 = objc_alloc_init(HMMTRVendorMetadata);
  }

  return v15;
}

- (id)staticMetadataFileURL
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"vendor-metadata" withExtension:@"plist"];

  if (v3)
  {
    return v3;
  }
  else
  {
    BOOL v5 = (HMMTRVendorMetadataFileStore *)_HMFPreconditionFailure();
    return [(HMMTRVendorMetadataFileStore *)v5 _retrieveVendorMetadataForVendorID:v7 productID:v8 metadata:v9];
  }
}

- (id)_retrieveVendorMetadataForVendorID:(id)a3 productID:(id)a4 metadata:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v63 = a4;
  id v62 = a5;
  if (v8)
  {
    id v9 = [(HMMTRVendorMetadataFileStore *)self vendorMetadataCache];
    uint64_t v10 = [v9 objectForKey:@"vendor-metadata"];

    id v11 = v62;
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if (v10)
    {
      uint64_t v12 = (void *)v10;
    }
    else
    {
      if (!v11)
      {
        id v11 = [(HMMTRVendorMetadataFileStore *)self metadata];
      }
      uint64_t v18 = [HMMTRMutableVendorMetadata alloc];
      id v19 = [v11 version];
      uint64_t v20 = [v11 schemaVersion];
      uint64_t v21 = [(HMMTRVendorMetadata *)v18 initWithVersion:v19 schemaVersion:v20];

      __int16 v22 = [(HMMTRVendorMetadataFileStore *)self vendorMetadataCache];
      [v22 setObject:v21 forKey:@"vendor-metadata"];

      uint64_t v12 = (void *)v21;
    }
    v60 = v12;
    uint64_t v23 = [v12 vendorWithID:v8];
    if (v23)
    {
      v61 = 0;
      __int16 v24 = (HMMTRMutableVendorMetadataVendor *)v23;
    }
    else
    {
      __int16 v24 = [(HMMTRVendorMetadataVendor *)[HMMTRMutableVendorMetadataVendor alloc] initWithIdentifier:v8];
      if (!v11)
      {
        id v11 = [(HMMTRVendorMetadataFileStore *)self metadata];
      }
      v61 = [v11 vendorWithID:v8];
      if (v61)
      {
        id v25 = v24;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v26 = v25;
        }
        else {
          __int16 v26 = 0;
        }
        id v27 = v26;

        [(HMMTRMutableVendorMetadataVendor *)v27 copyVendorDetailsFromVendor:v61];
      }
      else
      {
        [(HMMTRVendorMetadataVendor *)v24 setInvalid:1];
      }
      [v60 addVendor:v24];
    }
    if ([(HMMTRVendorMetadataVendor *)v24 invalid])
    {
      uint64_t v28 = (void *)MEMORY[0x2533B64D0]();
      v29 = self;
      HMFGetOSLogHandle();
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        long long v34 = HMFBooleanToString();
        *(_DWORD *)buf = 138544898;
        id v65 = v31;
        __int16 v66 = 2112;
        id v67 = v8;
        __int16 v68 = 2112;
        id v69 = v63;
        __int16 v70 = 2112;
        id v71 = v32;
        __int16 v72 = 2112;
        id v73 = v33;
        __int16 v74 = 2112;
        v75 = v34;
        __int16 v76 = 2112;
        v77 = v24;
        _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_DEBUG, "%{public}@retrieveVendorMetadataForVendorID:%@ productID:%@ (newMetadata:%@,vendor(cacheMiss:%@,metadataMiss:%@)) -> returning metadata: %@", buf, 0x48u);
      }
      uint64_t v17 = 0;
    }
    else
    {
      if (v63)
      {
        uint64_t v35 = [(HMMTRVendorMetadataVendor *)v24 productWithID:v63 includeInvalids:1];
        if (v35)
        {
          __int16 v57 = (HMMTRMutableVendorMetadataProduct *)v35;
        }
        else
        {
          if (!v61)
          {
            if (!v11)
            {
              id v11 = [(HMMTRVendorMetadataFileStore *)self metadata];
            }
            v61 = [v11 vendorWithID:v8];
          }
          long long v43 = [v61 productWithID:v63];
          v44 = v43;
          if (v43)
          {
            __int16 v57 = (HMMTRMutableVendorMetadataProduct *)[v43 copy];
          }
          else
          {
            __int16 v57 = [(HMMTRVendorMetadataProduct *)[HMMTRMutableVendorMetadataProduct alloc] initWithIdentifier:v63 categoryNumber:&unk_2702B5058];
            [(HMMTRVendorMetadataProduct *)v57 setInvalid:1];
          }
          v45 = v24;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v46 = v45;
          }
          else {
            uint64_t v46 = 0;
          }
          v47 = v46;

          [(HMMTRMutableVendorMetadataVendor *)v47 addProduct:v57];
        }
        os_unfair_lock_unlock(lock);
        os_unfair_lock_t locka = (os_unfair_lock_t)MEMORY[0x2533B64D0]();
        v48 = self;
        uint64_t v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v56 = HMFGetLogIdentifier();
          long long v50 = HMFBooleanToString();
          long long v51 = HMFBooleanToString();
          long long v52 = HMFBooleanToString();
          HMFBooleanToString();
          long long v53 = (HMMTRMutableVendorMetadataVendor *)objc_claimAutoreleasedReturnValue();
          v54 = HMFBooleanToString();
          *(_DWORD *)buf = 138545410;
          id v65 = v56;
          __int16 v66 = 2112;
          id v67 = v8;
          __int16 v68 = 2112;
          id v69 = v63;
          __int16 v70 = 2112;
          id v71 = v50;
          __int16 v72 = 2112;
          id v73 = v51;
          __int16 v74 = 2112;
          v75 = v52;
          __int16 v76 = 2112;
          v77 = v53;
          __int16 v78 = 2112;
          v79 = v54;
          __int16 v80 = 2112;
          v81 = v24;
          _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_DEBUG, "%{public}@retrieveVendorMetadataForVendorID:%@ productID:%@ (newMetadata:%@,vendor(cacheMiss:%@,metadataMiss:%@),product(cacheMiss:%@,metadataMiss:%@)) -> returning metadata: %@", buf, 0x5Cu);
        }
        uint64_t v17 = v24;

        goto LABEL_46;
      }
      v36 = (void *)MEMORY[0x2533B64D0]();
      v37 = self;
      HMFGetOSLogHandle();
      __int16 v38 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = HMFBooleanToString();
        *(_DWORD *)buf = 138544898;
        id v65 = v39;
        __int16 v66 = 2112;
        id v67 = v8;
        __int16 v68 = 2112;
        id v69 = 0;
        __int16 v70 = 2112;
        id v71 = v40;
        __int16 v72 = 2112;
        id v73 = v41;
        __int16 v74 = 2112;
        v75 = v42;
        __int16 v76 = 2112;
        v77 = v24;
        _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_DEBUG, "%{public}@retrieveVendorMetadataForVendorID:%@ productID:%@ (newMetadata:%@,vendor(cacheMiss:%@,metadataMiss:%@)) -> returning metadata: %@", buf, 0x48u);
      }
      uint64_t v17 = v24;
    }
    os_unfair_lock_unlock(lock);
LABEL_46:

    goto LABEL_47;
  }
  id v13 = (void *)MEMORY[0x2533B64D0]();
  int v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v65 = v16;
    __int16 v66 = 2112;
    id v67 = 0;
    __int16 v68 = 2112;
    id v69 = v63;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_DEBUG, "%{public}@retrieveVendorMetadataForVendorID:%@ productID:%@ -> nil vendor, returning nil", buf, 0x20u);
  }
  uint64_t v17 = 0;
LABEL_47:

  return v17;
}

- (id)retrieveVendorMetadataForVendorID:(id)a3 productID:(id)a4
{
  return [(HMMTRVendorMetadataFileStore *)self _retrieveVendorMetadataForVendorID:a3 productID:a4 metadata:0];
}

- (void)fetchCloudMetadata
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    SEL v6 = HMFGetLogIdentifier();
    int v21 = 138543362;
    __int16 v22 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud metadata by requesting supported accessories from UARP controller", (uint8_t *)&v21, 0xCu);
  }
  id v7 = [(HMMTRVendorMetadataFileStore *)v4 batchedAccessories];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = v4;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMMTRVendorMetadataFileStore *)v9 batchedAccessories];
      uint64_t v13 = [v12 count];
      int v21 = 138543618;
      __int16 v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v13;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Unexpected, found %lu batched accessories. Previous batch may not be complete", (uint8_t *)&v21, 0x16u);
    }
    [(HMMTRVendorMetadataFileStore *)v9 setBatchedAccessories:0];
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(HMMTRVendorMetadataFileStore *)v4 setBatchedAccessories:v14];

  v15 = [(HMMTRVendorMetadataFileStore *)v4 uarpController];
  char v16 = [v15 getBatchedSupportedAccessories:0 assetLocationType:15];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v18 = v4;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      __int16 v22 = v20;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to request supported accessories from UARP controller", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (HMMTRVendorMetadata)metadata
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(HMMTRVendorMetadataFileStore *)self fileManager];
  id v4 = [(HMMTRVendorMetadataFileStore *)self fileURL];
  BOOL v5 = [v3 dictionaryWithContentsOfURL:v4 error:0];

  if (v5)
  {
    SEL v6 = [[HMMTRVendorMetadata alloc] initWithDictionaryRepresentation:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x2533B64D0]();
      id v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v15 = 138543362;
        char v16 = v13;
        _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode vendor metadata from dictionary representation", (uint8_t *)&v15, 0xCu);
      }
      id v8 = objc_alloc_init(HMMTRVendorMetadata);
    }
    id v9 = v8;
  }
  else
  {
    id v9 = [(HMMTRVendorMetadataFileStore *)self staticMetadata];
  }

  return (HMMTRVendorMetadata *)v9;
}

- (void)setDelegate:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMMTRVendorMetadataStoreDelegate)delegate
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMMTRVendorMetadataStoreDelegate *)WeakRetained;
}

- (HMMTRVendorMetadataFileStore)initWithFileURL:(id)a3 uarpController:(id)a4 fileManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  uint64_t v12 = v11;
  if (!v11)
  {
LABEL_9:
    id v19 = (HMMTRVendorMetadataFileStore *)_HMFPreconditionFailure();
    return [(HMMTRVendorMetadataFileStore *)v19 initWithFileURL:v21];
  }
  v22.receiver = self;
  v22.super_class = (Class)HMMTRVendorMetadataFileStore;
  uint64_t v13 = [(HMMTRVendorMetadataFileStore *)&v22 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fileURL, a3);
    objc_storeStrong((id *)&v14->_uarpController, a4);
    [(UARPController *)v14->_uarpController setDelegate:v14];
    batchedAccessories = v14->_batchedAccessories;
    v14->_batchedAccessories = 0;

    uint64_t v16 = objc_opt_new();
    vendorMetadataCache = v14->_vendorMetadataCache;
    v14->_vendorMetadataCache = (NSCache *)v16;

    objc_storeStrong((id *)&v14->_fileManager, a5);
  }

  return v14;
}

- (HMMTRVendorMetadataFileStore)initWithFileURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F38328];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(HMMTRFileManager);
  id v8 = [(HMMTRVendorMetadataFileStore *)self initWithFileURL:v5 uarpController:v6 fileManager:v7];

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25 != -1) {
    dispatch_once(&logCategory__hmf_once_t25, &__block_literal_global_703);
  }
  v2 = (void *)logCategory__hmf_once_v26;
  return v2;
}

uint64_t __43__HMMTRVendorMetadataFileStore_logCategory__block_invoke()
{
  logCategory__hmf_once___int16 v26 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end