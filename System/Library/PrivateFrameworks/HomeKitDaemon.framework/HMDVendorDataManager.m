@interface HMDVendorDataManager
+ (id)dbURL;
+ (id)logCategory;
+ (id)sharedVendorDataManager;
- (BOOL)_loadDatabaseFromDictionary:(id)a3;
- (BOOL)_loadDatabaseFromFilePath:(id)a3 fileDescription:(id)a4;
- (BOOL)_loadDatabaseFromFileURL:(id)a3 fileDescription:(id)a4;
- (BOOL)_parseDatabaseFromDictionary:(id)a3 dataVersion:(int64_t *)a4 collectionsByManufacturer:(id *)a5 entriesByProductData:(id *)a6;
- (BOOL)_parseManufacturersList:(id)a3 collectionsByManufacturer:(id *)a4 entriesByProductData:(id *)a5;
- (BOOL)databaseContainsManufacturer:(id)a3;
- (HMDVendorDataManager)init;
- (HMDVendorDataManager)initWithDefaults;
- (HMDVendorDataManager)initWithWorkQueue:(id)a3 urlSession:(id)a4 fetchTimer:(id)a5;
- (HMFTimer)fetchTimer;
- (NSDictionary)collectionsByManufacturer;
- (NSDictionary)entriesByProductData;
- (NSURL)urlForBundledInternalPlist;
- (NSURL)urlForBundledPlist;
- (NSURLSession)urlSession;
- (OS_dispatch_queue)workQueue;
- (id)_modelsStringForManufacturer:(id)a3 model:(id)a4 dictionary:(id)a5 key:(id)a6;
- (id)_parseVendorModelEntryForManufacturer:(id)a3 model:(id)a4 dictionary:(id)a5;
- (id)modelCollectionForManufacturer:(id)a3;
- (id)vendorModelEntryForManufacturer:(id)a3 model:(id)a4;
- (id)vendorModelEntryForProductData:(id)a3;
- (int64_t)dataVersion;
- (void)_fetchDataFromServer;
- (void)_handleDataFromServer:(id)a3;
- (void)_handleServerResponse:(id)a3 withData:(id)a4 error:(id)a5;
- (void)_loadDatabaseFromLocalFiles;
- (void)_start;
- (void)setCollectionsByManufacturer:(id)a3;
- (void)setDataVersion:(int64_t)a3;
- (void)setEntriesByProductData:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDVendorDataManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesByProductData, 0);
  objc_storeStrong((id *)&self->_collectionsByManufacturer, 0);
  objc_storeStrong((id *)&self->_fetchTimer, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setEntriesByProductData:(id)a3
{
}

- (NSDictionary)entriesByProductData
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCollectionsByManufacturer:(id)a3
{
}

- (NSDictionary)collectionsByManufacturer
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataVersion:(int64_t)a3
{
  self->_dataVersion = a3;
}

- (int64_t)dataVersion
{
  return self->_dataVersion;
}

- (HMFTimer)fetchTimer
{
  return self->_fetchTimer;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)timerDidFire:(id)a3
{
  v4 = [(HMDVendorDataManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMDVendorDataManager_timerDidFire___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __37__HMDVendorDataManager_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = vendorInfoFetchPeriod;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Timer fired after %.0lf sec", (uint8_t *)&v7, 0x16u);
  }
  return [*(id *)(a1 + 32) _fetchDataFromServer];
}

- (BOOL)_parseManufacturersList:(id)a3 collectionsByManufacturer:(id *)a4 entriesByProductData:(id *)a5
{
  v73 = a4;
  uint64_t v106 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  int v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  __int16 v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v100 = v10;
    __int16 v101 = 2112;
    v102 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Parsing manufacturers dictionary: %@", buf, 0x16u);
  }
  v85 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  v87 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v12 = v6;
  uint64_t v83 = [(__CFString *)v12 countByEnumeratingWithState:&v94 objects:v105 count:16];
  if (v83)
  {
    uint64_t v82 = *(void *)v95;
    v75 = v12;
    v86 = v11;
    while (2)
    {
      for (uint64_t i = 0; i != v83; ++i)
      {
        if (*(void *)v95 != v82) {
          objc_enumerationMutation(v12);
        }
        v14 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x230FBD990]();
        v16 = v14;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
        v18 = v17;

        v19 = [(__CFString *)v18 stringByTrimmingCharactersInSet:v87];

        if (![(__CFString *)v19 length])
        {
          v68 = (void *)MEMORY[0x230FBD990]();
          v69 = v8;
          v70 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            v71 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v100 = v71;
            __int16 v101 = 2112;
            v102 = v16;
            _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@Manufacturers dictionary contains invalid key: %@", buf, 0x16u);
          }

LABEL_58:

          BOOL v67 = 0;
          uint64_t v11 = v86;
          goto LABEL_59;
        }
        v20 = [(__CFString *)v19 lowercaseString];
        v88 = [(__CFString *)v85 objectForKeyedSubscript:v20];
        if (!v88)
        {
          v88 = objc_alloc_init(HMDVendorModelCollection);
          -[__CFString setObject:forKeyedSubscript:](v85, "setObject:forKeyedSubscript:");
        }
        v21 = -[__CFString hmf_dictionaryForKey:](v12, "hmf_dictionaryForKey:", v19, v73);
        v22 = v21;
        if (v21)
        {
          v23 = objc_msgSend(v21, "hmf_dictionaryForKey:", @"Models");
          v24 = v23;
          if (v23)
          {
            uint64_t v76 = i;
            v77 = v20;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            id obj = v23;
            uint64_t v25 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v91;
              v79 = v24;
              v80 = v15;
              v84 = v22;
LABEL_18:
              uint64_t v28 = 0;
              while (1)
              {
                if (*(void *)v91 != v27) {
                  objc_enumerationMutation(obj);
                }
                id v29 = *(id *)(*((void *)&v90 + 1) + 8 * v28);
                objc_opt_class();
                id v30 = (objc_opt_isKindOfClass() & 1) != 0 ? v29 : 0;
                id v31 = v30;

                v32 = [v31 stringByTrimmingCharactersInSet:v87];

                if (![v32 length]) {
                  break;
                }
                uint64_t v33 = objc_msgSend(obj, "hmf_dictionaryForKey:", v32);
                if (!v33)
                {
                  v57 = (void *)MEMORY[0x230FBD990]();
                  v61 = v8;
                  v59 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  {
                    v62 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543874;
                    v100 = v62;
                    __int16 v101 = 2112;
                    v102 = v19;
                    __int16 v103 = 2112;
                    id v104 = v32;
                    _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Manufacturer %@ contains an invalid model entry for %@", buf, 0x20u);
                  }
LABEL_46:
                  v12 = v75;
                  v24 = v79;
                  v15 = v80;
                  v22 = v84;

                  int v43 = 1;
                  uint64_t i = v76;
                  goto LABEL_47;
                }
                v34 = (void *)v33;
                v35 = v8;
                v36 = v19;
                v37 = [(HMDVendorDataManager *)v8 _parseVendorModelEntryForManufacturer:v19 model:v32 dictionary:v33];
                [(HMDVendorModelCollection *)v88 addEntry:v37];
                v38 = [v37 productData];
                if (v38)
                {
                  v39 = [v86 objectForKeyedSubscript:v38];
                  v40 = v39;
                  if (!v39 || [v39 compare:v37] == -1) {
                    [v86 setObject:v37 forKeyedSubscript:v38];
                  }
                }
                ++v28;
                v8 = v35;
                v19 = v36;
                if (v26 == v28)
                {
                  uint64_t v26 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
                  v12 = v75;
                  v24 = v79;
                  v15 = v80;
                  v22 = v84;
                  if (v26) {
                    goto LABEL_18;
                  }
                  goto LABEL_33;
                }
              }
              v57 = (void *)MEMORY[0x230FBD990]();
              v58 = v8;
              v59 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v60 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v100 = v60;
                __int16 v101 = 2112;
                v102 = v19;
                __int16 v103 = 2112;
                id v104 = v29;
                _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@ contains invalid key: %@", buf, 0x20u);
              }
              goto LABEL_46;
            }
LABEL_33:

            v41 = objc_msgSend(v22, "hmf_dictionaryForKey:", @"DefaultModel");
            uint64_t i = v76;
            if (v41)
            {
              v42 = [(HMDVendorDataManager *)v8 _parseVendorModelEntryForManufacturer:v19 model:@"DefaultModel" dictionary:v41];
              [(HMDVendorModelCollection *)v88 setDefaultEntry:v42];
            }
            int v43 = 0;
LABEL_47:
            v20 = v77;
          }
          else
          {
            v81 = v15;
            v49 = (void *)MEMORY[0x230FBD990]();
            v50 = v8;
            v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v52 = HMFGetLogIdentifier();
              [v22 objectForKeyedSubscript:@"Models"];
              v78 = v20;
              v53 = v22;
              uint64_t v54 = i;
              v56 = v55 = v19;
              *(_DWORD *)buf = 138543874;
              v100 = v52;
              __int16 v101 = 2112;
              v102 = @"Models";
              __int16 v103 = 2112;
              id v104 = v56;
              _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Manufacturers dictionary contains an invalid %@ value: %@", buf, 0x20u);

              v19 = v55;
              uint64_t i = v54;
              v22 = v53;
              v20 = v78;

              v12 = v75;
            }

            int v43 = 1;
            v24 = 0;
            v15 = v81;
          }
        }
        else
        {
          v44 = v20;
          v45 = (void *)MEMORY[0x230FBD990]();
          v46 = v8;
          v47 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v48 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v100 = v48;
            __int16 v101 = 2112;
            v102 = v19;
            _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Manufacturers dictionary contains an invalid entry for %@", buf, 0x16u);

            v12 = v75;
          }

          int v43 = 1;
          v20 = v44;
          v22 = 0;
        }

        if (v43) {
          goto LABEL_58;
        }
      }
      uint64_t v83 = [(__CFString *)v12 countByEnumeratingWithState:&v94 objects:v105 count:16];
      uint64_t v11 = v86;
      if (v83) {
        continue;
      }
      break;
    }
  }

  v63 = (void *)MEMORY[0x230FBD990]();
  v64 = v8;
  v65 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    v66 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v100 = v66;
    __int16 v101 = 2112;
    v102 = v85;
    _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_DEBUG, "%{public}@Prepared vendor model entries: %@", buf, 0x16u);
  }
  id *v73 = (id)[(__CFString *)v85 copy];
  *a5 = (id)[v11 copy];
  BOOL v67 = 1;
LABEL_59:

  return v67;
}

- (id)_parseVendorModelEntryForManufacturer:(id)a3 model:(id)a4 dictionary:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  __int16 v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  v32 = [(HMDVendorDataManager *)self _modelsStringForManufacturer:v8 model:v9 dictionary:v10 key:@"BundleID"];
  id v31 = [(HMDVendorDataManager *)self _modelsStringForManufacturer:v8 model:v9 dictionary:v10 key:@"StoreID"];
  id v30 = [(HMDVendorDataManager *)self _modelsStringForManufacturer:v8 model:v9 dictionary:v10 key:@"FirmwareVersion"];
  uint64_t v11 = [(HMDVendorDataManager *)self _modelsStringForManufacturer:v8 model:v9 dictionary:v10 key:@"ProductData"];
  if (v11 && !+[HMDAccessory validateProductData:v11])
  {
    context = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [v10 objectForKeyedSubscript:@"ProductData"];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v37 = v9;
      *(_WORD *)v38 = 2112;
      *(void *)&v38[2] = @"ProductData";
      *(_WORD *)&v38[10] = 2112;
      *(void *)&v38[12] = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@:%@ contains an invalid %@ value: %@", buf, 0x34u);
    }

    uint64_t v11 = 0;
  }
  v16 = [v10 objectForKeyedSubscript:@"ProductDataChangeAllowedTo"];

  if (v16)
  {
    v17 = objc_msgSend(v10, "hmf_arrayForKey:", @"ProductDataChangeAllowedTo");
    if (![v17 count]) {
      goto LABEL_13;
    }
    v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__181989;
    *(void *)v38 = __Block_byref_object_dispose__181990;
    *(void *)&v38[8] = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __79__HMDVendorDataManager__parseVendorModelEntryForManufacturer_model_dictionary___block_invoke;
    v33[3] = &unk_264A242A8;
    id v19 = v18;
    id v34 = v19;
    v35 = buf;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);
    v20 = *(void **)(*(void *)&buf[8] + 40);
    v21 = v20 ? (void *)[v20 copy] : 0;

    _Block_object_dispose(buf, 8);
    if (!v21)
    {
LABEL_13:
      contexta = (void *)MEMORY[0x230FBD990]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        uint64_t v25 = [v10 objectForKeyedSubscript:@"ProductDataChangeAllowedTo"];
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v37 = v9;
        *(_WORD *)v38 = 2112;
        *(void *)&v38[2] = @"ProductDataChangeAllowedTo";
        *(_WORD *)&v38[10] = 2112;
        *(void *)&v38[12] = v25;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@:%@ contains an invalid %@ value: %@", buf, 0x34u);
      }
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  uint64_t v26 = [[HMDVendorModelEntry alloc] initWithManufacturer:v8 model:v9 appBundleID:v32 appStoreID:v31 firmwareVersion:v30 productData:v11 productDataAlternates:v21];

  return v26;
}

void __79__HMDVendorDataManager__parseVendorModelEntryForManufacturer_model_dictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v12;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 stringByTrimmingCharactersInSet:*(void *)(a1 + 32)];

  __int16 v9 = [v8 lowercaseString];

  if (v9 && +[HMDAccessory validateProductData:v9])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    *a4 = 1;
  }
}

- (id)_modelsStringForManufacturer:(id)a3 model:(id)a4 dictionary:(id)a5 key:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_msgSend(v12, "hmf_stringForKey:", v13);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v17 = [v15 stringByTrimmingCharactersInSet:v16];

    if ([v17 length])
    {
      if (v17) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v17 = 0;
  }

LABEL_7:
  v17 = [v12 objectForKeyedSubscript:v13];

  if (v17)
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [v12 objectForKeyedSubscript:v13];
      int v24 = 138544386;
      uint64_t v25 = v21;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v13;
      __int16 v32 = 2112;
      uint64_t v33 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@:%@ contains an invalid %@ value: %@", (uint8_t *)&v24, 0x34u);
    }
    v17 = 0;
  }
LABEL_11:

  return v17;
}

- (BOOL)_parseDatabaseFromDictionary:(id)a3 dataVersion:(int64_t *)a4 collectionsByManufacturer:(id *)a5 entriesByProductData:(id *)a6
{
  v136[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = HMFUptime();
  double v13 = v12;
  uint64_t v14 = (void *)MEMORY[0x230FBD990](v11);
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v114 = v17;
    __int16 v115 = 2114;
    v116 = @"vendorDataManagerStart";
    __int16 v117 = 2112;
    v118 = @"Parsing vendor database";
    __int16 v119 = 2114;
    v120 = @"state";
    __int16 v121 = 2112;
    v122 = @"vendorDataManagerParsingData";
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  v18 = [MEMORY[0x263F499E0] sharedInstance];
  id v19 = objc_alloc(MEMORY[0x263F499F0]);
  v135 = @"state";
  v136[0] = @"vendorDataManagerParsingData";
  v20 = [NSDictionary dictionaryWithObjects:v136 forKeys:&v135 count:1];
  v21 = (void *)[v19 initWithTag:@"vendorDataManagerStart" data:v20];
  v22 = [MEMORY[0x263F424F0] currentTagProcessorList];
  [v18 submitTaggedEvent:v21 processorList:v22];

  v23 = objc_msgSend(v10, "hmf_numberForKey:", @"SchemaVersion");
  uint64_t v24 = [v23 integerValue];

  if (v24 != 1)
  {
    v35 = (void *)MEMORY[0x230FBD990]();
    v36 = v15;
    v37 = HMFGetOSLogHandle();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    uint64_t v39 = (void *)MEMORY[0x263EFFA80];
    if (v38)
    {
      v40 = HMFGetLogIdentifier();
      v41 = objc_msgSend(v10, "hmf_numberForKey:", @"SchemaVersion");
      *(_DWORD *)buf = 138545410;
      v114 = v40;
      __int16 v115 = 2114;
      v116 = @"vendorDataManagerStart";
      __int16 v117 = 2112;
      v118 = @"Error: Unsupported schema version";
      __int16 v119 = 2114;
      v120 = @"state";
      __int16 v121 = 2112;
      v122 = @"vendorDataManagerParsedData";
      __int16 v123 = 2114;
      v124 = @"success";
      __int16 v125 = 2112;
      v126 = v39;
      __int16 v127 = 2114;
      v128 = @"DataVersion";
      __int16 v129 = 2112;
      v130 = v41;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
    }
    __int16 v32 = [MEMORY[0x263F499E0] sharedInstance];
    id v42 = objc_alloc(MEMORY[0x263F499F0]);
    objc_msgSend(v10, "hmf_numberForKey:", @"SchemaVersion");
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "initWithTag:data:", @"vendorDataManagerStart", v43, @"state", @"vendorDataManagerParsedData", @"success", v39, @"DataVersion", v34);
    v45 = (void *)MEMORY[0x263F424F0];
    goto LABEL_20;
  }
  uint64_t v25 = objc_msgSend(v10, "hmf_numberForKey:", @"DataVersion");
  int64_t v26 = [v25 integerValue];

  if (v26 <= 52)
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    __int16 v28 = v15;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = HMFGetLogIdentifier();
      id v31 = objc_msgSend(v10, "hmf_numberForKey:", @"DataVersion");
      *(_DWORD *)buf = 138545922;
      v114 = v30;
      __int16 v115 = 2114;
      v116 = @"vendorDataManagerStart";
      __int16 v117 = 2112;
      v118 = @"Error: Data version is lower than minimum";
      __int16 v119 = 2114;
      v120 = @"state";
      __int16 v121 = 2112;
      v122 = @"vendorDataManagerParsedData";
      __int16 v123 = 2114;
      v124 = @"success";
      __int16 v125 = 2112;
      v126 = (void *)MEMORY[0x263EFFA80];
      __int16 v127 = 2114;
      v128 = @"DataVersion";
      __int16 v129 = 2112;
      v130 = v31;
      __int16 v131 = 2114;
      v132 = @"MinVersion";
      __int16 v133 = 2112;
      v134 = &unk_26E4725B0;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);
    }
    __int16 v32 = [MEMORY[0x263F499E0] sharedInstance];
    id v33 = objc_alloc(MEMORY[0x263F499F0]);
    objc_msgSend(v10, "hmf_numberForKey:", @"DataVersion");
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id v97 = v34;
    uint64_t v93 = MEMORY[0x263EFFA80];
LABEL_19:
    HMDTaggedLoggingCreateDictionary();
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v33, "initWithTag:data:", @"vendorDataManagerStart", v43, @"state", @"vendorDataManagerParsedData", @"success", v93, @"DataVersion", v97);
    v45 = (void *)MEMORY[0x263F424F0];
LABEL_20:
    v53 = [v45 currentTagProcessorList];
    [(__CFString *)v32 submitTaggedEvent:v44 processorList:v53];
LABEL_21:

LABEL_22:
    BOOL v62 = 0;
    goto LABEL_23;
  }
  if (v26 < [(HMDVendorDataManager *)v15 dataVersion])
  {
    v46 = (void *)MEMORY[0x230FBD990]();
    v47 = v15;
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = HMFGetLogIdentifier();
      v50 = [NSNumber numberWithLong:v26];
      v51 = objc_msgSend(NSNumber, "numberWithLong:", -[HMDVendorDataManager dataVersion](v47, "dataVersion"));
      *(_DWORD *)buf = 138545922;
      v114 = v49;
      __int16 v115 = 2114;
      v116 = @"vendorDataManagerStart";
      __int16 v117 = 2112;
      v118 = @"Error: Data version is lower than current";
      __int16 v119 = 2114;
      v120 = @"state";
      __int16 v121 = 2112;
      v122 = @"vendorDataManagerParsedData";
      __int16 v123 = 2114;
      v124 = @"success";
      __int16 v125 = 2112;
      v126 = (void *)MEMORY[0x263EFFA80];
      __int16 v127 = 2114;
      v128 = @"DataVersion";
      __int16 v129 = 2112;
      v130 = v50;
      __int16 v131 = 2114;
      v132 = @"CurrentVersion";
      __int16 v133 = 2112;
      v134 = v51;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);
    }
    __int16 v32 = [MEMORY[0x263F499E0] sharedInstance];
    id v52 = objc_alloc(MEMORY[0x263F499F0]);
    id v34 = [NSNumber numberWithLong:v26];
    objc_msgSend(NSNumber, "numberWithLong:", -[HMDVendorDataManager dataVersion](v47, "dataVersion"));
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v94 = MEMORY[0x263EFFA80];
    v44 = HMDTaggedLoggingCreateDictionary();
    v53 = objc_msgSend(v52, "initWithTag:data:", @"vendorDataManagerStart", v44, @"state", @"vendorDataManagerParsedData", @"success", v94, @"DataVersion", v34, @"CurrentVersion", v43);
    uint64_t v54 = [MEMORY[0x263F424F0] currentTagProcessorList];
    [(__CFString *)v32 submitTaggedEvent:v53 processorList:v54];

    goto LABEL_21;
  }
  uint64_t v55 = [(HMDVendorDataManager *)v15 dataVersion];
  v56 = (void *)MEMORY[0x230FBD990]();
  v57 = v15;
  v58 = HMFGetOSLogHandle();
  v59 = v58;
  if (v26 == v55)
  {
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v60 = HMFGetLogIdentifier();
      v61 = [NSNumber numberWithLong:v26];
      *(_DWORD *)buf = 138545410;
      v114 = v60;
      __int16 v115 = 2114;
      v116 = @"vendorDataManagerStart";
      __int16 v117 = 2112;
      v118 = @"Data version is the same as current";
      __int16 v119 = 2114;
      v120 = @"state";
      __int16 v121 = 2112;
      v122 = @"vendorDataManagerParsedData";
      __int16 v123 = 2114;
      v124 = @"success";
      __int16 v125 = 2112;
      v126 = (void *)MEMORY[0x263EFFA80];
      __int16 v127 = 2114;
      v128 = @"DataVersion";
      __int16 v129 = 2112;
      v130 = v61;
      _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
    }
    __int16 v32 = [MEMORY[0x263F499E0] sharedInstance];
    id v33 = objc_alloc(MEMORY[0x263F499F0]);
    id v34 = [NSNumber numberWithLong:v26];
    id v97 = v34;
    uint64_t v93 = MEMORY[0x263EFFA80];
    goto LABEL_19;
  }
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v64 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v114 = v64;
    __int16 v115 = 2048;
    v116 = (__CFString *)v26;
    _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing data version %ld", buf, 0x16u);
  }
  uint64_t v65 = objc_msgSend(v10, "hmf_dictionaryForKey:", @"Manufacturers");
  if (!v65)
  {
    v74 = (void *)MEMORY[0x230FBD990]();
    v75 = v57;
    uint64_t v76 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v77 = HMFGetLogIdentifier();
      v78 = [v10 objectForKeyedSubscript:@"Manufacturers"];
      *(_DWORD *)buf = 138545410;
      v114 = v77;
      __int16 v115 = 2114;
      v116 = @"vendorDataManagerStart";
      __int16 v117 = 2112;
      v118 = @"Error: Data contains invalid manufacturers";
      __int16 v119 = 2114;
      v120 = @"state";
      __int16 v121 = 2112;
      v122 = @"vendorDataManagerParsedData";
      __int16 v123 = 2114;
      v124 = @"success";
      __int16 v125 = 2112;
      v126 = (void *)MEMORY[0x263EFFA80];
      __int16 v127 = 2114;
      v128 = @"Manufacturers";
      __int16 v129 = 2112;
      v130 = v78;
      _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);
    }
    id v34 = [MEMORY[0x263F499E0] sharedInstance];
    id v79 = objc_alloc(MEMORY[0x263F499F0]);
    id v43 = [v10 objectForKeyedSubscript:@"Manufacturers"];
    uint64_t v95 = MEMORY[0x263EFFA80];
    v80 = HMDTaggedLoggingCreateDictionary();
    v81 = objc_msgSend(v79, "initWithTag:data:", @"vendorDataManagerStart", v80, @"state", @"vendorDataManagerParsedData", @"success", v95, @"Manufacturers", v43);
    uint64_t v82 = [MEMORY[0x263F424F0] currentTagProcessorList];
    [v34 submitTaggedEvent:v81 processorList:v82];

    __int16 v32 = 0;
    goto LABEL_22;
  }
  __int16 v32 = (__CFString *)v65;
  id v111 = 0;
  id v112 = 0;
  BOOL v104 = [(HMDVendorDataManager *)v57 _parseManufacturersList:v65 collectionsByManufacturer:&v112 entriesByProductData:&v111];
  id v34 = v112;
  id v43 = v111;
  context = (void *)MEMORY[0x230FBD990]();
  v109 = v57;
  v66 = HMFGetOSLogHandle();
  BOOL v67 = v66;
  if (!v104)
  {
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      uint64_t v83 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544898;
      v114 = v83;
      __int16 v115 = 2114;
      v116 = @"vendorDataManagerStart";
      __int16 v117 = 2112;
      v118 = @"Error: Manufacturers failed to parse";
      __int16 v119 = 2114;
      v120 = @"state";
      __int16 v121 = 2112;
      v122 = @"vendorDataManagerParsedData";
      __int16 v123 = 2114;
      v124 = @"success";
      __int16 v125 = 2112;
      v126 = (void *)MEMORY[0x263EFFA80];
      _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
    }
    v84 = [MEMORY[0x263F499E0] sharedInstance];
    id v85 = objc_alloc(MEMORY[0x263F499F0]);
    uint64_t v96 = MEMORY[0x263EFFA80];
    v86 = HMDTaggedLoggingCreateDictionary();
    v87 = objc_msgSend(v85, "initWithTag:data:", @"vendorDataManagerStart", v86, @"state", @"vendorDataManagerParsedData", @"success", v96);
    v88 = [MEMORY[0x263F424F0] currentTagProcessorList];
    [v84 submitTaggedEvent:v87 processorList:v88];

    v89 = (void *)MEMORY[0x230FBD990]();
    long long v90 = v109;
    long long v91 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      long long v92 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v114 = v92;
      __int16 v115 = 2112;
      v116 = v32;
      _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse manufacturers: %@", buf, 0x16u);
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    uint64_t v68 = HMFGetLogIdentifier();
    __int16 v101 = NSString;
    v105 = (void *)v68;
    HMFUptime();
    v102 = objc_msgSend(v101, "stringWithFormat:", @"%.3f", v69 - v13);
    v99 = [NSNumber numberWithLong:v26];
    *(_DWORD *)buf = 138545922;
    v114 = v105;
    __int16 v115 = 2114;
    v116 = @"vendorDataManagerStart";
    __int16 v117 = 2112;
    v118 = @"Parsing succeeded";
    __int16 v119 = 2114;
    v120 = @"state";
    __int16 v121 = 2112;
    v122 = @"vendorDataManagerParsedData";
    __int16 v123 = 2114;
    v124 = @"duration";
    __int16 v125 = 2112;
    v126 = v102;
    __int16 v127 = 2114;
    v128 = @"success";
    __int16 v129 = 2112;
    v130 = (void *)MEMORY[0x263EFFA88];
    __int16 v131 = 2114;
    v132 = @"DataVersion";
    __int16 v133 = 2112;
    v134 = v99;
    _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);
  }
  v110 = [MEMORY[0x263F499E0] sharedInstance];
  id v103 = objc_alloc(MEMORY[0x263F499F0]);
  v70 = NSString;
  HMFUptime();
  uint64_t v106 = objc_msgSend(v70, "stringWithFormat:", @"%.3f", v71 - v13);
  contexta = [NSNumber numberWithLong:v26];
  uint64_t v98 = MEMORY[0x263EFFA88];
  v100 = HMDTaggedLoggingCreateDictionary();
  v72 = objc_msgSend(v103, "initWithTag:data:", @"vendorDataManagerStart", v100, @"state", @"vendorDataManagerParsedData", @"duration", v106, @"success", v98, @"DataVersion", contexta);
  v73 = [MEMORY[0x263F424F0] currentTagProcessorList];
  [v110 submitTaggedEvent:v72 processorList:v73];

  *a4 = v26;
  id v34 = v34;
  *a5 = v34;
  id v43 = v43;
  *a6 = v43;
  BOOL v62 = 1;
LABEL_23:

  return v62;
}

- (void)_handleDataFromServer:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v38 = 0;
  v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:&v38];
  id v6 = v38;
  if (v5)
  {
    id v36 = 0;
    uint64_t v37 = 0;
    id v35 = 0;
    BOOL v7 = [(HMDVendorDataManager *)self _parseDatabaseFromDictionary:v5 dataVersion:&v37 collectionsByManufacturer:&v36 entriesByProductData:&v35];
    id v8 = v36;
    id v9 = v35;
    id v10 = v9;
    if (v7)
    {
      id v32 = v9;
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      double v12 = self;
      double v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v42 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully parsed database from server, saving to disk", buf, 0xCu);
      }
      [v4 writeToFile:@"/var/mobile/Library/homed/vendor-database" atomically:1];
      v15 = [MEMORY[0x263EFF9C0] set];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __46__HMDVendorDataManager__handleDataFromServer___block_invoke;
      v33[3] = &unk_264A24280;
      void v33[4] = v12;
      id v16 = v15;
      id v34 = v16;
      [v8 enumerateKeysAndObjectsUsingBlock:v33];
      v17 = (void *)MEMORY[0x263EFFA08];
      v18 = [v8 allKeys];
      id v19 = [v17 setWithArray:v18];

      v20 = (void *)MEMORY[0x263EFF9C0];
      v21 = [(HMDVendorDataManager *)v12 collectionsByManufacturer];
      v22 = [v21 allKeys];
      v23 = [v20 setWithArray:v22];

      [v23 minusSet:v19];
      if ([v23 count])
      {
        uint64_t v24 = [v23 allObjects];
        [v16 addObjectsFromArray:v24];
      }
      [(HMDVendorDataManager *)v12 setDataVersion:v37];
      [(HMDVendorDataManager *)v12 setCollectionsByManufacturer:v8];
      id v10 = v32;
      [(HMDVendorDataManager *)v12 setEntriesByProductData:v32];
      if ([v16 count])
      {
        uint64_t v39 = @"ChangedManufacturer";
        uint64_t v25 = [v16 allObjects];
        v40 = v25;
        int64_t v26 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

        id v27 = [MEMORY[0x263F08A00] defaultCenter];
        [v27 postNotificationName:@"kHMDVendorInfoUpdatedNotification" object:v12 userInfo:v26];

        id v10 = v32;
      }
    }
  }
  else
  {
    __int16 v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = self;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v42 = v31;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Error while deserializing plist from server data: %@", buf, 0x16u);
    }
  }
}

void __46__HMDVendorDataManager__handleDataFromServer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) collectionsByManufacturer];
  BOOL v7 = [v6 objectForKeyedSubscript:v8];

  if (!v7 || ([v7 isEqual:v5] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)_handleServerResponse:(id)a3 withData:(id)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDVendorDataManager *)self fetchTimer];
  [v11 kick];

  if (v10)
  {
    double v12 = (void *)MEMORY[0x230FBD990]();
    double v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v26 = 138543618;
      id v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v10;
      id v16 = "%{public}@Failed to get the vendor info with error: %@";
      v17 = v14;
      uint32_t v18 = 22;
LABEL_9:
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v26, v18);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v12 = (void *)MEMORY[0x230FBD990]();
    double v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v15;
      id v16 = "%{public}@Failed to receive HTTP response";
      v17 = v14;
      uint32_t v18 = 12;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  id v19 = v8;
  uint64_t v20 = [v19 statusCode];
  if (v20 == 200)
  {
    [(HMDVendorDataManager *)self _handleDataFromServer:v9];
  }
  else
  {
    uint64_t v21 = v20;
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      int v26 = 138543618;
      id v27 = v25;
      __int16 v28 = 2048;
      uint64_t v29 = v21;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received status code %ld from vendor info request", (uint8_t *)&v26, 0x16u);
    }
  }

LABEL_11:
}

- (void)_fetchDataFromServer
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089E0]);
  id v4 = [(id)objc_opt_class() dbURL];
  id v5 = (void *)[v3 initWithURL:v4];

  [v5 setHTTPMethod:@"GET"];
  id v6 = [(HMDVendorDataManager *)self urlSession];
  uint64_t v7 = [v6 configuration];
  id v8 = [(id)v7 URLCache];
  id v9 = [v8 cachedResponseForRequest:v5];

  id v10 = [v9 response];
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if (v7)
  {
    uint64_t v11 = [v9 response];
    double v12 = (void *)MEMORY[0x230FBD990]();
    double v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      id v31 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Found a cached vendor info response: %@", buf, 0x16u);
    }
  }
  objc_initWeak(&location, self);
  id v16 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"ManufacturerDB.fetch" parent:0 options:1];
  v17 = [(HMDVendorDataManager *)self urlSession];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __44__HMDVendorDataManager__fetchDataFromServer__block_invoke;
  v24[3] = &unk_264A24258;
  objc_copyWeak(&v26, &location);
  id v18 = v16;
  id v25 = v18;
  id v19 = [v17 dataTaskWithRequest:v5 completionHandler:v24];

  uint64_t v20 = (void *)MEMORY[0x230FBD990]();
  uint64_t v21 = self;
  HMFGetOSLogHandle();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v23;
    __int16 v30 = 2112;
    id v31 = v19;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", buf, 0x16u);
  }
  [v19 resume];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __44__HMDVendorDataManager__fetchDataFromServer__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    double v12 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__HMDVendorDataManager__fetchDataFromServer__block_invoke_2;
    block[3] = &unk_264A2E908;
    id v14 = *(id *)(a1 + 32);
    v15 = v11;
    id v16 = v8;
    id v17 = v7;
    id v18 = v9;
    dispatch_async(v12, block);
  }
}

uint64_t __44__HMDVendorDataManager__fetchDataFromServer__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) _handleServerResponse:*(void *)(a1 + 48) withData:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) end];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

- (void)_start
{
  id v3 = [(HMDVendorDataManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HMDVendorDataManager__start__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __30__HMDVendorDataManager__start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) fetchTimer];
  [v6 resume];

  return [*(id *)(a1 + 32) _fetchDataFromServer];
}

- (void)_loadDatabaseFromLocalFiles
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__HMDVendorDataManager__loadDatabaseFromLocalFiles__block_invoke;
  v2[3] = &unk_264A2F7F8;
  v2[4] = self;
  [MEMORY[0x263F424F0] activityWithName:@"ManufacturerDB.load" parent:0 options:1 block:v2];
}

void __51__HMDVendorDataManager__loadDatabaseFromLocalFiles__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"allowVendorDataOverride"];
  if ([v3 BOOLValue])
  {
    char v4 = [*(id *)(a1 + 32) _loadDatabaseFromFilePath:@"/var/mobile/Library/homed/vendor-database-local" fileDescription:@"side-loaded"];

    if (v4) {
      return;
    }
  }
  else
  {
  }
  if (([*(id *)(a1 + 32) _loadDatabaseFromFilePath:@"/var/mobile/Library/homed/vendor-database" fileDescription:@"cached"] & 1) == 0)
  {
    id v5 = [MEMORY[0x263F42608] sharedPreferences];
    id v6 = [v5 preferenceForKey:@"allowVendorDataOverride"];
    int v7 = [v6 BOOLValue];

    int v8 = *(void **)(a1 + 32);
    if (v7)
    {
      id v9 = [v8 urlForBundledInternalPlist];
      uint64_t v10 = @"bundled internal";
    }
    else
    {
      id v9 = [v8 urlForBundledPlist];
      uint64_t v10 = @"bundled";
    }
    char v11 = [v8 _loadDatabaseFromFileURL:v9 fileDescription:v10];

    if ((v11 & 1) == 0)
    {
      double v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 32);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        int v16 = 138543362;
        id v17 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to read any local database files", (uint8_t *)&v16, 0xCu);
      }
      [*(id *)(a1 + 32) setDataVersion:0];
      [*(id *)(a1 + 32) setCollectionsByManufacturer:MEMORY[0x263EFFA78]];
    }
  }
}

- (BOOL)_loadDatabaseFromFilePath:(id)a3 fileDescription:(id)a4
{
  id v6 = NSURL;
  id v7 = a4;
  int v8 = [v6 fileURLWithPath:a3 isDirectory:0];
  LOBYTE(self) = [(HMDVendorDataManager *)self _loadDatabaseFromFileURL:v8 fileDescription:v7];

  return (char)self;
}

- (BOOL)_loadDatabaseFromFileURL:(id)a3 fileDescription:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v25 = 0;
  int v8 = [NSDictionary dictionaryWithContentsOfURL:v6 error:&v25];
  id v9 = v25;
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  char v11 = self;
  double v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (!v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v9;
      uint64_t v21 = "%{public}@Failed to read %@ plist file on disk: %@";
      v22 = v13;
      uint32_t v23 = 32;
LABEL_12:
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Read data from %@ plist file on disk", buf, 0x16u);
  }
  BOOL v15 = [(HMDVendorDataManager *)v11 _loadDatabaseFromDictionary:v8];
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  int v16 = v11;
  id v17 = HMFGetOSLogHandle();
  id v13 = v17;
  if (!v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v7;
      uint64_t v21 = "%{public}@Failed to parse %@ plist file on disk";
      v22 = v13;
      uint32_t v23 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v27 = v18;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded database from %@ plist file on disk", buf, 0x16u);
  }
  BOOL v19 = 1;
LABEL_14:

  return v19;
}

- (BOOL)_loadDatabaseFromDictionary:(id)a3
{
  id v9 = 0;
  uint64_t v10 = 0;
  id v8 = 0;
  BOOL v4 = [(HMDVendorDataManager *)self _parseDatabaseFromDictionary:a3 dataVersion:&v10 collectionsByManufacturer:&v9 entriesByProductData:&v8];
  id v5 = v9;
  id v6 = v8;
  if (v4)
  {
    [(HMDVendorDataManager *)self setDataVersion:v10];
    [(HMDVendorDataManager *)self setCollectionsByManufacturer:v5];
    [(HMDVendorDataManager *)self setEntriesByProductData:v6];
  }

  return v4;
}

- (NSURL)urlForBundledInternalPlist
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"ManufacturerDatabase-local" withExtension:@"plist"];

  return (NSURL *)v3;
}

- (NSURL)urlForBundledPlist
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"ManufacturerDatabase" withExtension:@"plist"];

  return (NSURL *)v3;
}

- (BOOL)databaseContainsManufacturer:(id)a3
{
  id v3 = [(HMDVendorDataManager *)self modelCollectionForManufacturer:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)vendorModelEntryForProductData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  id v6 = [v4 whitespaceCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  id v8 = [v7 lowercaseString];

  if (+[HMDAccessory validateProductData:v8])
  {
    id v9 = [(HMDVendorDataManager *)self entriesByProductData];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];
  }
  else
  {
    char v11 = (void *)MEMORY[0x230FBD990]();
    double v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      BOOL v19 = v8;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid product data: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)vendorModelEntryForManufacturer:(id)a3 model:(id)a4
{
  id v6 = a4;
  id v7 = [(HMDVendorDataManager *)self modelCollectionForManufacturer:a3];
  id v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v9 = [v6 stringByTrimmingCharactersInSet:v8];

  uint64_t v10 = [v7 lookupModel:v9];

  return v10;
}

- (id)modelCollectionForManufacturer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v7 = [v5 stringByTrimmingCharactersInSet:v6];
    id v8 = [v7 lowercaseString];

    id v9 = [(HMDVendorDataManager *)self collectionsByManufacturer];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (HMDVendorDataManager)initWithDefaults
{
  v55[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = HMFUptime();
  double v5 = v4;
  id v6 = (void *)MEMORY[0x230FBD990](v3);
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    v41 = v9;
    __int16 v42 = 2114;
    __int16 v43 = @"vendorDataManagerStart";
    __int16 v44 = 2112;
    uint64_t v45 = @"Vendor Data Manager loading";
    __int16 v46 = 2114;
    v47 = @"state";
    __int16 v48 = 2112;
    v49 = @"start";
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\"", buf, 0x34u);
  }
  uint64_t v10 = [MEMORY[0x263F499E0] sharedInstance];
  id v11 = objc_alloc(MEMORY[0x263F499F0]);
  uint64_t v54 = @"state";
  v55[0] = @"start";
  double v12 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
  id v13 = (void *)[v11 initWithTag:@"vendorDataManagerStart" data:v12];
  id v14 = [MEMORY[0x263F424F0] currentTagProcessorList];
  [v10 submitTaggedEvent:v13 processorList:v14];

  HMDispatchQueueNameString();
  id v15 = objc_claimAutoreleasedReturnValue();
  int v16 = (const char *)[v15 UTF8String];
  id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v18 = dispatch_queue_create(v16, v17);

  BOOL v19 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v19 setHTTPCookieAcceptPolicy:1];
  [v19 setHTTPCookieStorage:0];
  [v19 setHTTPShouldSetCookies:0];
  [v19 setURLCredentialStorage:0];
  uint64_t v20 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v19];
  id v21 = objc_alloc(MEMORY[0x263F42658]);
  v22 = (void *)[v21 initWithTimeInterval:5 options:*(double *)&vendorInfoFetchPeriod];
  uint32_t v23 = [(HMDVendorDataManager *)v7 initWithWorkQueue:v18 urlSession:v20 fetchTimer:v22];
  uint64_t v24 = (void *)MEMORY[0x230FBD990]([(HMDVendorDataManager *)v23 _loadDatabaseFromLocalFiles]);
  id v25 = v23;
  id v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = HMFGetLogIdentifier();
    __int16 v28 = NSString;
    HMFUptime();
    __int16 v30 = objc_msgSend(v28, "stringWithFormat:", @"%.3f", v29 - v5);
    *(_DWORD *)buf = 138544898;
    v41 = v27;
    __int16 v42 = 2114;
    __int16 v43 = @"vendorDataManagerDone";
    __int16 v44 = 2112;
    uint64_t v45 = @"Vendor Data Manager loaded";
    __int16 v46 = 2114;
    v47 = @"state";
    __int16 v48 = 2112;
    v49 = @"end";
    __int16 v50 = 2114;
    v51 = @"duration";
    __int16 v52 = 2112;
    v53 = v30;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);
  }
  id v31 = [MEMORY[0x263F499E0] sharedInstance];
  id v32 = objc_alloc(MEMORY[0x263F499F0]);
  id v33 = NSString;
  HMFUptime();
  id v35 = objc_msgSend(v33, "stringWithFormat:", @"%.3f", v34 - v5);
  id v36 = HMDTaggedLoggingCreateDictionary();
  uint64_t v37 = objc_msgSend(v32, "initWithTag:data:", @"vendorDataManagerDone", v36, @"state", @"end", @"duration", v35);
  id v38 = [MEMORY[0x263F424F0] currentTagProcessorList];
  [v31 submitTaggedEvent:v37 processorList:v38];

  return v25;
}

- (HMDVendorDataManager)initWithWorkQueue:(id)a3 urlSession:(id)a4 fetchTimer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDVendorDataManager;
  double v12 = [(HMDVendorDataManager *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_urlSession, a4);
    objc_storeStrong((id *)&v13->_fetchTimer, a5);
    [v11 setDelegate:v13];
  }

  return v13;
}

- (HMDVendorDataManager)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  double v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_182153 != -1) {
    dispatch_once(&logCategory__hmf_once_t39_182153, &__block_literal_global_169_182154);
  }
  v2 = (void *)logCategory__hmf_once_v40_182155;
  return v2;
}

void __35__HMDVendorDataManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v40_182155;
  logCategory__hmf_once_v40_182155 = v0;
}

+ (id)dbURL
{
  if (dbURL_onceToken != -1) {
    dispatch_once(&dbURL_onceToken, &__block_literal_global_66);
  }
  v2 = (void *)dbURL_url;
  return v2;
}

void __29__HMDVendorDataManager_dbURL__block_invoke()
{
  if (isInternalBuild())
  {
    id v0 = (id)vendorInfoDatabaseServerURLOverride;
    if ([v0 length])
    {
      uint64_t v1 = [NSURL URLWithString:v0];
      v2 = (void *)dbURL_url;
      dbURL_url = v1;
    }
  }
  if (!dbURL_url)
  {
    uint64_t v3 = NSString;
    id v4 = (id)homeKitConfigurationPath;
    double v5 = [v3 stringWithFormat:@"%@%@", v4, @"/v1/ManufacturerDatabase.plist"];

    id v6 = (objc_class *)MEMORY[0x263F08BA0];
    id v11 = v5;
    id v7 = objc_alloc_init(v6);
    [v7 setScheme:@"https"];
    [v7 setHost:appleConfigurationServer];
    [v7 setPath:v11];

    id v8 = [v7 URL];
    uint64_t v9 = [v8 copy];

    id v10 = (void *)dbURL_url;
    dbURL_url = v9;
  }
}

+ (id)sharedVendorDataManager
{
  if (sharedVendorDataManager_onceToken != -1) {
    dispatch_once(&sharedVendorDataManager_onceToken, &__block_literal_global_182166);
  }
  v2 = (void *)sharedVendorDataManager_sharedInstance;
  return v2;
}

uint64_t __47__HMDVendorDataManager_sharedVendorDataManager__block_invoke()
{
  id v0 = [[HMDVendorDataManager alloc] initWithDefaults];
  uint64_t v1 = (void *)sharedVendorDataManager_sharedInstance;
  sharedVendorDataManager_sharedInstance = (uint64_t)v0;

  v2 = (void *)sharedVendorDataManager_sharedInstance;
  return [v2 _start];
}

@end