@interface HMMTRVendorMetadataVendor
- (BOOL)invalid;
- (BOOL)isEqual:(id)a3;
- (HMMTRVendorMetadataVendor)initWithIdentifier:(id)a3;
- (HMMTRVendorMetadataVendor)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)productsByProductID;
- (NSNumber)identifier;
- (NSSet)products;
- (NSString)appBundleID;
- (NSString)appStoreID;
- (NSString)name;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)productWithID:(id)a3;
- (id)productWithID:(id)a3 includeInvalids:(BOOL)a4;
- (unint64_t)hash;
- (void)setAppBundleID:(id)a3;
- (void)setAppStoreID:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProductsByProductID:(id)a3;
@end

@implementation HMMTRVendorMetadataVendor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productsByProductID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_appStoreID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setProductsByProductID:(id)a3
{
}

- (NSDictionary)productsByProductID
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSString)appBundleID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppStoreID:(id)a3
{
}

- (NSString)appStoreID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMMTRVendorMetadataVendor *)self identifier];
  v6 = (void *)[v4 initWithName:@"Identifier" value:v5];
  [v3 addObject:v6];

  v7 = [(HMMTRVendorMetadataVendor *)self name];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F424F8]);
    v9 = [(HMMTRVendorMetadataVendor *)self name];
    v10 = (void *)[v8 initWithName:@"Name" value:v9];
    [v3 addObject:v10];
  }
  v11 = [(HMMTRVendorMetadataVendor *)self appStoreID];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F424F8]);
    v13 = [(HMMTRVendorMetadataVendor *)self appStoreID];
    v14 = (void *)[v12 initWithName:@"App Store ID" value:v13];
    [v3 addObject:v14];
  }
  v15 = [(HMMTRVendorMetadataVendor *)self appBundleID];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x263F424F8]);
    v17 = [(HMMTRVendorMetadataVendor *)self appBundleID];
    v18 = (void *)[v16 initWithName:@"App Bundle ID" value:v17];
    [v3 addObject:v18];
  }
  v19 = [(HMMTRVendorMetadataVendor *)self products];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x263F424F8]);
    v22 = [(HMMTRVendorMetadataVendor *)self products];
    v23 = (void *)[v21 initWithName:@"Products" value:v22];
    [v3 addObject:v23];
  }
  id v24 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMMTRVendorMetadataVendor *)self invalid];
  v25 = HMFBooleanToString();
  v26 = (void *)[v24 initWithName:@"invalid" value:v25];
  [v3 addObject:v26];

  v27 = (void *)[v3 copy];
  return v27;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMTRMutableVendorMetadataVendor allocWithZone:a3];
  v5 = [(HMMTRVendorMetadataVendor *)self identifier];
  v6 = [(HMMTRVendorMetadataVendor *)v4 initWithIdentifier:v5];

  v7 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
  [(HMMTRVendorMetadataVendor *)v6 setProductsByProductID:v7];

  id v8 = [(HMMTRVendorMetadataVendor *)self name];
  [(HMMTRVendorMetadataVendor *)v6 setName:v8];

  v9 = [(HMMTRVendorMetadataVendor *)self appStoreID];
  [(HMMTRVendorMetadataVendor *)v6 setAppStoreID:v9];

  v10 = [(HMMTRVendorMetadataVendor *)self appBundleID];
  [(HMMTRVendorMetadataVendor *)v6 setAppBundleID:v10];

  [(HMMTRVendorMetadataVendor *)v6 setInvalid:[(HMMTRVendorMetadataVendor *)self invalid]];
  return v6;
}

- (unint64_t)hash
{
  v2 = [(HMMTRVendorMetadataVendor *)self identifier];
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
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 identifier];
    v9 = [(HMMTRVendorMetadataVendor *)self identifier];
    if ([v8 isEqualToNumber:v9])
    {
      v10 = [v7 productsByProductID];
      v11 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
      if (![v10 isEqualToDictionary:v11]) {
        goto LABEL_12;
      }
      id v12 = [v7 name];
      v13 = [(HMMTRVendorMetadataVendor *)self name];
      int v14 = HMFEqualObjects();

      if (!v14) {
        goto LABEL_12;
      }
      v15 = [v7 appStoreID];
      id v16 = [(HMMTRVendorMetadataVendor *)self appStoreID];
      int v17 = HMFEqualObjects();

      if (v17)
      {
        v18 = [v7 appBundleID];
        v19 = [(HMMTRVendorMetadataVendor *)self appBundleID];
        char v20 = HMFEqualObjects();
      }
      else
      {
LABEL_12:
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (id)productWithID:(id)a3 includeInvalids:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (![v8 invalid] || v4)
  {
    v10 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
    v9 = [v10 objectForKeyedSubscript:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)productWithID:(id)a3
{
  return [(HMMTRVendorMetadataVendor *)self productWithID:a3 includeInvalids:0];
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = [(HMMTRVendorMetadataVendor *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"Name"];

  v5 = [(HMMTRVendorMetadataVendor *)self appStoreID];
  [v3 setObject:v5 forKeyedSubscript:@"AppStoreID"];

  id v6 = [(HMMTRVendorMetadataVendor *)self appBundleID];
  [v3 setObject:v6 forKeyedSubscript:@"AppBundleID"];

  v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = [(HMMTRVendorMetadataVendor *)self products];
  v9 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = [(HMMTRVendorMetadataVendor *)self products];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v16 = [v15 dictionaryRepresentation];
        int v17 = [v15 identifier];
        v18 = [v17 stringValue];
        [v9 setObject:v16 forKeyedSubscript:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [v3 setObject:v9 forKeyedSubscript:@"Products"];
  v19 = (void *)[v3 copy];

  return (NSDictionary *)v19;
}

- (NSSet)products
{
  v2 = (void *)MEMORY[0x263EFFA08];
  unint64_t v3 = [(HMMTRVendorMetadataVendor *)self productsByProductID];
  BOOL v4 = [v3 allValues];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (HMMTRVendorMetadataVendor)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)HMMTRVendorMetadataVendor;
    id v6 = [(HMMTRVendorMetadataVendor *)&v15 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSNumber *)v7;

      productsByProductID = v6->_productsByProductID;
      v6->_productsByProductID = (NSDictionary *)MEMORY[0x263EFFA78];

      v6->_invalid = 0;
    }

    return v6;
  }
  else
  {
    uint64_t v11 = (HMMTRVendorMetadataVendor *)_HMFPreconditionFailure();
    return [(HMMTRVendorMetadataVendor *)v11 initWithIdentifier:v13 dictionaryRepresentation:v14];
  }
}

- (HMMTRVendorMetadataVendor)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_24:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_24;
  }
  v9 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"Products");
  if (v9)
  {
    id v39 = v6;
    v41 = [(HMMTRVendorMetadataVendor *)self initWithIdentifier:v6];
    v10 = (void *)[(HMMTRVendorMetadataVendor *)v41 mutableCopy];
    uint64_t v11 = objc_msgSend(v8, "hmf_stringForKey:", @"Name");
    [v10 setName:v11];

    SEL v12 = objc_msgSend(v8, "hmf_stringForKey:", @"AppStoreID");
    [v10 setAppStoreID:v12];

    v38 = v8;
    id v13 = objc_msgSend(v8, "hmf_stringForKey:", @"AppBundleID");
    [v10 setAppBundleID:v13];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v37 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      v40 = v10;
      do
      {
        uint64_t v18 = 0;
        uint64_t v42 = v16;
        do
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v43 + 1) + 8 * v18);
          char v20 = (void *)MEMORY[0x2533B64D0]();
          long long v21 = objc_msgSend(v14, "hmf_dictionaryForKey:", v19);
          if (v21)
          {
            long long v22 = [HMMTRVendorMetadataProduct alloc];
            long long v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "integerValue"));
            long long v24 = [(HMMTRVendorMetadataProduct *)v22 initWithIdentifier:v23 dictionaryRepresentation:v21];

            if (v24) {
              [v10 addProduct:v24];
            }
          }
          else
          {
            uint64_t v25 = v17;
            uint64_t v26 = (void *)MEMORY[0x2533B64D0]();
            v27 = v41;
            v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = HMFGetLogIdentifier();
              v30 = [v14 objectForKeyedSubscript:v19];
              *(_DWORD *)buf = 138543618;
              v49 = v29;
              __int16 v50 = 2112;
              v51 = v30;
              _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Ignoring product value that is not a dictionary: %@", buf, 0x16u);

              v10 = v40;
            }

            uint64_t v17 = v25;
            uint64_t v16 = v42;
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v16);
    }

    v31 = (HMMTRVendorMetadataVendor *)[v10 copy];
    v32 = v41;
    id v8 = v38;
    id v6 = v39;
    v9 = v37;
  }
  else
  {
    v33 = (void *)MEMORY[0x2533B64D0]();
    v32 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v35;
      __int16 v50 = 2112;
      v51 = v8;
      _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_ERROR, "%{public}@Could not find products in vendor dictionary representation: %@", buf, 0x16u);
    }
    v31 = 0;
  }

  return v31;
}

@end