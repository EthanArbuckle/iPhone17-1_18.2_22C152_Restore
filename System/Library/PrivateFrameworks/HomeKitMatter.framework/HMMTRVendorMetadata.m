@interface HMMTRVendorMetadata
- (BOOL)isEqual:(id)a3;
- (HMMTRVendorMetadata)init;
- (HMMTRVendorMetadata)initWithDictionaryRepresentation:(id)a3;
- (HMMTRVendorMetadata)initWithVersion:(id)a3 schemaVersion:(id)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)vendorsByVendorID;
- (NSNumber)schemaVersion;
- (NSNumber)version;
- (NSSet)vendors;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)vendorWithID:(id)a3;
- (unint64_t)hash;
- (void)setVendorsByVendorID:(id)a3;
@end

@implementation HMMTRVendorMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorsByVendorID, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setVendorsByVendorID:(id)a3
{
}

- (NSDictionary)vendorsByVendorID
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)schemaVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMMTRVendorMetadata *)self version];
  v6 = (void *)[v4 initWithName:@"Version" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMMTRVendorMetadata *)self schemaVersion];
  v9 = (void *)[v7 initWithName:@"Schema Version" value:v8];
  [v3 addObject:v9];

  v10 = [(HMMTRVendorMetadata *)self vendors];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F424F8]);
    v13 = [(HMMTRVendorMetadata *)self vendors];
    v14 = (void *)[v12 initWithName:@"Vendors" value:v13];
    [v3 addObject:v14];
  }
  v15 = (void *)[v3 copy];

  return v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMTRMutableVendorMetadata allocWithZone:a3];
  v5 = [(HMMTRVendorMetadata *)self version];
  v6 = [(HMMTRVendorMetadata *)self schemaVersion];
  id v7 = [(HMMTRVendorMetadata *)v4 initWithVersion:v5 schemaVersion:v6];

  v8 = [(HMMTRVendorMetadata *)self vendorsByVendorID];
  [(HMMTRVendorMetadata *)v7 setVendorsByVendorID:v8];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMMTRVendorMetadata *)self vendorsByVendorID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 version];
    v9 = [(HMMTRVendorMetadata *)self version];
    if ([v8 isEqualToNumber:v9])
    {
      v10 = [v7 schemaVersion];
      uint64_t v11 = [(HMMTRVendorMetadata *)self schemaVersion];
      if ([v10 isEqualToNumber:v11])
      {
        id v12 = [v7 vendorsByVendorID];
        v13 = [(HMMTRVendorMetadata *)self vendorsByVendorID];
        char v14 = [v12 isEqualToDictionary:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)vendorWithID:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRVendorMetadata *)self vendorsByVendorID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMMTRVendorMetadata *)self version];
  [v3 setObject:v4 forKeyedSubscript:@"Version"];

  v5 = [(HMMTRVendorMetadata *)self schemaVersion];
  [v3 setObject:v5 forKeyedSubscript:@"SchemaVersion"];

  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = [(HMMTRVendorMetadata *)self vendors];
  v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(HMMTRVendorMetadata *)self vendors];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v14 dictionaryRepresentation];
        v16 = [v14 identifier];
        v17 = [v16 stringValue];
        [v8 setObject:v15 forKeyedSubscript:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [v3 setObject:v8 forKeyedSubscript:@"Vendors"];
  v18 = (void *)[v3 copy];

  return (NSDictionary *)v18;
}

- (NSSet)vendors
{
  v2 = (void *)MEMORY[0x263EFFA08];
  unint64_t v3 = [(HMMTRVendorMetadata *)self vendorsByVendorID];
  id v4 = [v3 allValues];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (HMMTRVendorMetadata)initWithVersion:(id)a3 schemaVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    char v14 = (HMMTRVendorMetadata *)_HMFPreconditionFailure();
    return [(HMMTRVendorMetadata *)v14 init];
  }
  v16.receiver = self;
  v16.super_class = (Class)HMMTRVendorMetadata;
  uint64_t v10 = [(HMMTRVendorMetadata *)&v16 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_version, a3);
    objc_storeStrong((id *)&v11->_schemaVersion, a4);
    vendorsByVendorID = v11->_vendorsByVendorID;
    v11->_vendorsByVendorID = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v11;
}

- (HMMTRVendorMetadata)init
{
  return [(HMMTRVendorMetadata *)self initWithVersion:&unk_2702B5CE8 schemaVersion:&unk_2702B5CE8];
}

- (HMMTRVendorMetadata)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v6 = objc_msgSend(v4, "hmf_numberForKey:", @"Version");
  if (v6)
  {
    id v7 = objc_msgSend(v5, "hmf_numberForKey:", @"SchemaVersion");
    if (v7)
    {
      uint64_t v8 = objc_msgSend(v5, "hmf_dictionaryForKey:", @"Vendors");
      v42 = (void *)v8;
      if (v8)
      {
        v9 = (void *)v8;
        v40 = v6;
        v41 = v5;
        v39 = v7;
        v44 = [(HMMTRVendorMetadata *)self initWithVersion:v6 schemaVersion:v7];
        uint64_t v10 = (void *)[(HMMTRVendorMetadata *)v44 mutableCopy];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v47;
          v43 = v10;
          do
          {
            uint64_t v15 = 0;
            uint64_t v45 = v13;
            do
            {
              if (*(void *)v47 != v14) {
                objc_enumerationMutation(v11);
              }
              objc_super v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
              v17 = (void *)MEMORY[0x2533B64D0]();
              v18 = objc_msgSend(v11, "hmf_dictionaryForKey:", v16);
              if (v18)
              {
                v19 = [HMMTRVendorMetadataVendor alloc];
                long long v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
                long long v21 = [(HMMTRVendorMetadataVendor *)v19 initWithIdentifier:v20 dictionaryRepresentation:v18];

                if (v21) {
                  [v10 addVendor:v21];
                }
              }
              else
              {
                uint64_t v22 = v14;
                long long v23 = (void *)MEMORY[0x2533B64D0]();
                v24 = v44;
                uint64_t v25 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v26 = HMFGetLogIdentifier();
                  v27 = [v11 objectForKeyedSubscript:v16];
                  *(_DWORD *)buf = 138543618;
                  v52 = v26;
                  __int16 v53 = 2112;
                  v54 = v27;
                  _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Ignoring vendor value that is not a dictionary: %@", buf, 0x16u);

                  uint64_t v10 = v43;
                }

                uint64_t v14 = v22;
                uint64_t v13 = v45;
              }

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
          }
          while (v13);
        }

        v28 = (HMMTRVendorMetadata *)[v10 copy];
        id v6 = v40;
        v5 = v41;
        id v7 = v39;
      }
      else
      {
        v35 = (void *)MEMORY[0x2533B64D0]();
        v44 = self;
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v52 = v37;
          __int16 v53 = 2112;
          v54 = v5;
          _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find vendors in vendor metadata dictionary: %@", buf, 0x16u);
        }
        v28 = 0;
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x2533B64D0]();
      v44 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v52 = v34;
        __int16 v53 = 2112;
        v54 = v5;
        _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find schema version in vendor metadata dictionary: %@", buf, 0x16u);
      }
      v28 = 0;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x2533B64D0]();
    v44 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v31;
      __int16 v53 = 2112;
      v54 = v5;
      _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not find version in vendor metadata dictionary: %@", buf, 0x16u);
    }
    v28 = 0;
  }

  return v28;
}

@end