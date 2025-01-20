@interface HMHAPMetadata
+ (id)encodeProtobufWithVersion:(id)a3 characteristics:(id)a4 services:(id)a5 categories:(id)a6;
+ (id)getSharedInstance;
- (BOOL)applyProtoBufData:(id)a3;
- (BOOL)shouldNotCacheCharacteristicOfType:(id)a3;
- (NSDictionary)hapCategoryMap;
- (NSDictionary)hapChrMap;
- (NSDictionary)hapSvcMap;
- (NSNumber)version;
- (id)categoryForCategoryUUIDString:(id)a3;
- (id)categoryForIdentifier:(id)a3;
- (id)characteristicTypeDescription:(id)a3;
- (id)serviceTypeDescription:(id)a3;
- (void)setHapCategoryMap:(id)a3;
- (void)setHapChrMap:(id)a3;
- (void)setHapSvcMap:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation HMHAPMetadata

+ (id)getSharedInstance
{
  if (getSharedInstance_onceToken != -1) {
    dispatch_once(&getSharedInstance_onceToken, &__block_literal_global_33452);
  }
  v2 = (void *)getSharedInstance_sharedInstance;

  return v2;
}

- (id)categoryForCategoryUUIDString:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(HMHAPMetadata *)self hapCategoryMap];
  v6 = [v5 allValues];

  v7 = (void *)[v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v10 uuidStr];
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          v13 = [HMAccessoryCategory alloc];
          v14 = [v10 uuidStr];
          v15 = [v10 catDescription];
          v16 = [(HMAccessoryCategory *)v13 initWithType:v14 name:v15];

          v7 = +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:v16];

          goto LABEL_11;
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSDictionary)hapCategoryMap
{
  return self->_hapCategoryMap;
}

- (BOOL)applyProtoBufData:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  context = (void *)MEMORY[0x19F3A64A0]();
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  v52 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "length"));
    *(_DWORD *)buf = 138543618;
    v73 = v6;
    __int16 v74 = 2112;
    v75 = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Unpacking [%@] bytes of metadata", buf, 0x16u);
  }
  v53 = [[HMPBMetadata alloc] initWithData:v51];
  if (v53)
  {
    p_lock = &v52->_lock;
    os_unfair_lock_lock_with_options();
    if ([(NSNumber *)v52->_version integerValue] >= v53->_version)
    {
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:");
      version = v52->_version;
      v52->_version = (NSNumber *)v9;

      os_unfair_lock_unlock(p_lock);
      v56 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](v53->_hapCharacteristics, "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v11 = v53->_hapCharacteristics;
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v65 objects:v71 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v66;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v66 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v65 + 1) + 8 * v14);
            v16 = objc_alloc_init(HMHAPMetadataCharacteristic);
            v17 = v16;
            if (v15)
            {
              id v18 = *(id *)(v15 + 16);
              [(HMHAPMetadataCharacteristic *)v17 setUuidStr:v18];

              long long v19 = *(void **)(v15 + 8);
            }
            else
            {
              [(HMHAPMetadataCharacteristic *)v16 setUuidStr:0];
              long long v19 = 0;
            }
            id v20 = v19;
            [(HMHAPMetadataCharacteristic *)v17 setChrDescription:v20];

            long long v21 = [(HMHAPMetadataCharacteristic *)v17 uuidStr];
            [v56 setObject:v17 forKey:v21];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v22 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v65 objects:v71 count:16];
          uint64_t v12 = v22;
        }
        while (v22);
      }

      [(HMHAPMetadata *)v52 setHapChrMap:v56];
      v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](v53->_hapServices, "count"));
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v23 = v53->_hapServices;
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v62;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v62 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v61 + 1) + 8 * v26);
            v28 = objc_alloc_init(HMHAPMetadataService);
            v29 = v28;
            if (v27)
            {
              id v30 = *(id *)(v27 + 16);
              [(HMHAPMetadataService *)v29 setUuidStr:v30];

              v31 = *(void **)(v27 + 8);
            }
            else
            {
              [(HMHAPMetadataService *)v28 setUuidStr:0];
              v31 = 0;
            }
            id v32 = v31;
            [(HMHAPMetadataService *)v29 setSvcDescription:v32];

            v33 = [(HMHAPMetadataService *)v29 uuidStr];
            [v55 setObject:v29 forKey:v33];

            ++v26;
          }
          while (v24 != v26);
          uint64_t v34 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v61 objects:v70 count:16];
          uint64_t v24 = v34;
        }
        while (v34);
      }

      [(HMHAPMetadata *)v52 setHapSvcMap:v55];
      v35 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](v53->_hapCategories, "count"));
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      obj = v53->_hapCategories;
      uint64_t v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v58;
        do
        {
          uint64_t v38 = 0;
          do
          {
            if (*(void *)v58 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = *(void *)(*((void *)&v57 + 1) + 8 * v38);
            v40 = objc_alloc_init(HMHAPMetadataCategory);
            if (v39)
            {
              v41 = [NSNumber numberWithInt:*(unsigned int *)(v39 + 16)];
              [(HMHAPMetadataCategory *)v40 setIdentifier:v41];

              v42 = *(void **)(v39 + 24);
            }
            else
            {
              v47 = [NSNumber numberWithInt:0];
              [(HMHAPMetadataCategory *)v40 setIdentifier:v47];

              v42 = 0;
            }
            id v43 = v42;
            [(HMHAPMetadataCategory *)v40 setUuidStr:v43];

            if (v39) {
              v44 = *(void **)(v39 + 8);
            }
            else {
              v44 = 0;
            }
            id v45 = v44;
            [(HMHAPMetadataCategory *)v40 setCatDescription:v45];

            v46 = [(HMHAPMetadataCategory *)v40 identifier];
            [v35 setObject:v40 forKey:v46];

            ++v38;
          }
          while (v36 != v38);
          uint64_t v48 = [(NSMutableArray *)obj countByEnumeratingWithState:&v57 objects:v69 count:16];
          uint64_t v36 = v48;
        }
        while (v48);
      }

      [(HMHAPMetadata *)v52 setHapCategoryMap:v35];
    }
  }

  return 0;
}

- (void)setHapSvcMap:(id)a3
{
}

- (void)setHapChrMap:(id)a3
{
}

- (void)setHapCategoryMap:(id)a3
{
}

- (id)serviceTypeDescription:(id)a3
{
  id v4 = a3;
  v5 = [(HMHAPMetadata *)self hapSvcMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 svcDescription];
  uint64_t v8 = v7;
  if (!v7) {
    v7 = @"Custom";
  }
  uint64_t v9 = v7;

  return v9;
}

- (NSDictionary)hapSvcMap
{
  return self->_hapSvcMap;
}

+ (id)encodeProtobufWithVersion:(id)a3 characteristics:(id)a4 services:(id)a5 categories:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v44 = a5;
  id v42 = a6;
  v11 = objc_alloc_init(HMPBMetadata);
  v41 = v9;
  int v12 = [v9 intValue];
  if (v11)
  {
    *(unsigned char *)&v11->_has |= 1u;
    v11->_version = v12;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v56 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v18 = objc_alloc_init(HMPBMetadataCharacteristic);
        long long v19 = [v17 uuidStr];
        if (v18) {
          objc_storeStrong((id *)&v18->_uuidStr, v19);
        }

        id v20 = [v17 chrDescription];
        if (v18) {
          objc_storeStrong((id *)&v18->_chrDescription, v20);
        }

        -[HMPBMetadata addHapCharacteristics:]((uint64_t)v11, v18);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v14);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v45 = v44;
  uint64_t v21 = [v45 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(v45);
        }
        uint64_t v25 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        uint64_t v26 = objc_alloc_init(HMPBMetadataService);
        uint64_t v27 = [v25 uuidStr];
        if (v26) {
          objc_storeStrong((id *)&v26->_uuidStr, v27);
        }

        v28 = [v25 svcDescription];
        if (v26) {
          objc_storeStrong((id *)&v26->_svcDescription, v28);
        }

        -[HMPBMetadata addHapServices:]((uint64_t)v11, v26);
      }
      uint64_t v22 = [v45 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v22);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v43 = v42;
  uint64_t v29 = [v43 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v43);
        }
        v33 = *(void **)(*((void *)&v47 + 1) + 8 * k);
        uint64_t v34 = objc_alloc_init(HMPBMetadataCategory);
        v35 = [v33 uuidStr];
        if (v34) {
          objc_storeStrong((id *)&v34->_uuidStr, v35);
        }

        uint64_t v36 = [v33 catDescription];
        if (v34) {
          objc_storeStrong((id *)&v34->_catDescription, v36);
        }

        uint64_t v37 = [v33 identifier];
        int v38 = [v37 intValue];
        if (v34)
        {
          *(unsigned char *)&v34->_has |= 1u;
          v34->_identifier = v38;
        }

        -[HMPBMetadata addHapCategories:]((uint64_t)v11, v34);
      }
      uint64_t v30 = [v43 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v30);
  }

  uint64_t v39 = [(HMPBMetadata *)v11 data];

  return v39;
}

uint64_t __34__HMHAPMetadata_getSharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMHAPMetadata);
  uint64_t v1 = getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapCategoryMap, 0);
  objc_storeStrong((id *)&self->_hapSvcMap, 0);
  objc_storeStrong((id *)&self->_hapChrMap, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (NSDictionary)hapChrMap
{
  return self->_hapChrMap;
}

- (BOOL)shouldNotCacheCharacteristicOfType:(id)a3
{
  uint64_t v3 = shouldNotCacheCharacteristicOfType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldNotCacheCharacteristicOfType__onceToken, &__block_literal_global_104);
  }
  char v5 = [(id)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes containsObject:v4];

  return v5;
}

void __52__HMHAPMetadata_shouldNotCacheCharacteristicOfType___block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"00000073-0000-1000-8000-0026BB765291";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes;
  shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes = v0;
}

- (id)categoryForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(HMHAPMetadata *)self hapCategoryMap],
        char v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v4],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = [HMAccessoryCategory alloc];
    uint64_t v8 = [v6 uuidStr];
    id v9 = [v6 catDescription];
    id v10 = [(HMAccessoryCategory *)v7 initWithType:v8 name:v9];
  }
  else
  {
    id v10 = [(HMHAPMetadata *)self categoryForCategoryUUIDString:@"0FBA259B-05AC-46F2-875F-204ABB6D9FE7"];
  }
  v11 = +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:v10];

  return v11;
}

- (id)characteristicTypeDescription:(id)a3
{
  id v4 = a3;
  char v5 = [(HMHAPMetadata *)self hapChrMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 chrDescription];
  uint64_t v8 = v7;
  if (!v7) {
    v7 = @"Custom";
  }
  id v9 = v7;

  return v9;
}

- (void)setVersion:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)version
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_version;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

@end