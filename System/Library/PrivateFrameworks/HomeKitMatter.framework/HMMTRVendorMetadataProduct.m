@interface HMMTRVendorMetadataProduct
- (BOOL)invalid;
- (BOOL)isEqual:(id)a3;
- (HMMTRVendorMetadataProduct)initWithIdentifier:(id)a3 categoryNumber:(id)a4;
- (HMMTRVendorMetadataProduct)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)categoryNumber;
- (NSNumber)identifier;
- (NSString)model;
- (NSString)name;
- (NSURL)installationGuideURL;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setCategoryNumber:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstallationGuideURL:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HMMTRVendorMetadataProduct

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationGuideURL, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categoryNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setInstallationGuideURL:(id)a3
{
}

- (NSURL)installationGuideURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCategoryNumber:(id)a3
{
}

- (NSNumber)categoryNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
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
  v5 = [(HMMTRVendorMetadataProduct *)self identifier];
  v6 = (void *)[v4 initWithName:@"Identifier" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMMTRVendorMetadataProduct *)self categoryNumber];
  v9 = (void *)[v7 initWithName:@"Category" value:v8];
  [v3 addObject:v9];

  v10 = [(HMMTRVendorMetadataProduct *)self name];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F424F8]);
    v12 = [(HMMTRVendorMetadataProduct *)self name];
    v13 = (void *)[v11 initWithName:@"Name" value:v12];
    [v3 addObject:v13];
  }
  v14 = [(HMMTRVendorMetadataProduct *)self model];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F424F8]);
    v16 = [(HMMTRVendorMetadataProduct *)self model];
    v17 = (void *)[v15 initWithName:@"Model" value:v16];
    [v3 addObject:v17];
  }
  v18 = [(HMMTRVendorMetadataProduct *)self installationGuideURL];

  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x263F424F8]);
    v20 = [(HMMTRVendorMetadataProduct *)self installationGuideURL];
    v21 = (void *)[v19 initWithName:@"Installation Guide URL" value:v20];
    [v3 addObject:v21];
  }
  id v22 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMMTRVendorMetadataProduct *)self invalid];
  v23 = HMFBooleanToString();
  v24 = (void *)[v22 initWithName:@"invalid" value:v23];
  [v3 addObject:v24];

  v25 = (void *)[v3 copy];
  return v25;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMTRMutableVendorMetadataProduct allocWithZone:a3];
  v5 = [(HMMTRVendorMetadataProduct *)self identifier];
  v6 = [(HMMTRVendorMetadataProduct *)self categoryNumber];
  id v7 = [(HMMTRVendorMetadataProduct *)v4 initWithIdentifier:v5 categoryNumber:v6];

  v8 = [(HMMTRVendorMetadataProduct *)self name];
  [(HMMTRVendorMetadataProduct *)v7 setName:v8];

  v9 = [(HMMTRVendorMetadataProduct *)self model];
  [(HMMTRVendorMetadataProduct *)v7 setModel:v9];

  v10 = [(HMMTRVendorMetadataProduct *)self installationGuideURL];
  [(HMMTRVendorMetadataProduct *)v7 setInstallationGuideURL:v10];

  [(HMMTRVendorMetadataProduct *)v7 setInvalid:[(HMMTRVendorMetadataProduct *)self invalid]];
  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMMTRVendorMetadataProduct *)self identifier];
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
    v8 = [v6 identifier];
    v9 = [(HMMTRVendorMetadataProduct *)self identifier];
    if ([v8 isEqualToNumber:v9])
    {
      v10 = [v7 categoryNumber];
      id v11 = [(HMMTRVendorMetadataProduct *)self categoryNumber];
      if (![v10 isEqualToNumber:v11]) {
        goto LABEL_12;
      }
      v12 = [v7 name];
      v13 = [(HMMTRVendorMetadataProduct *)self name];
      int v14 = HMFEqualObjects();

      if (!v14) {
        goto LABEL_12;
      }
      id v15 = [v7 model];
      v16 = [(HMMTRVendorMetadataProduct *)self model];
      int v17 = HMFEqualObjects();

      if (v17)
      {
        v18 = [v7 installationGuideURL];
        id v19 = [(HMMTRVendorMetadataProduct *)self installationGuideURL];
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

- (NSDictionary)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMMTRVendorMetadataProduct *)self categoryNumber];
  [v3 setObject:v4 forKeyedSubscript:@"Category"];

  v5 = [(HMMTRVendorMetadataProduct *)self name];
  [v3 setObject:v5 forKeyedSubscript:@"Name"];

  id v6 = [(HMMTRVendorMetadataProduct *)self model];
  [v3 setObject:v6 forKeyedSubscript:@"Model"];

  id v7 = [(HMMTRVendorMetadataProduct *)self installationGuideURL];
  v8 = [v7 absoluteString];
  [v3 setObject:v8 forKeyedSubscript:@"InstallationGuideURL"];

  v9 = (void *)[v3 copy];
  return (NSDictionary *)v9;
}

- (HMMTRVendorMetadataProduct)initWithIdentifier:(id)a3 categoryNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    id v15 = (HMMTRVendorMetadataProduct *)_HMFPreconditionFailure();
    return [(HMMTRVendorMetadataProduct *)v15 initWithIdentifier:v17 dictionaryRepresentation:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMMTRVendorMetadataProduct;
  v9 = [(HMMTRVendorMetadataProduct *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSNumber *)v10;

    uint64_t v12 = [v8 copy];
    categoryNumber = v9->_categoryNumber;
    v9->_categoryNumber = (NSNumber *)v12;

    v9->_invalid = 0;
  }

  return v9;
}

- (HMMTRVendorMetadataProduct)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    _HMFPreconditionFailure();
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "hmf_numberForKey:", @"Category");
  if (v9)
  {
    uint64_t v10 = [(HMMTRVendorMetadataProduct *)self initWithIdentifier:v6 categoryNumber:v9];
    id v11 = (void *)[(HMMTRVendorMetadataProduct *)v10 mutableCopy];
    uint64_t v12 = objc_msgSend(v8, "hmf_stringForKey:", @"Model");
    [v11 setModel:v12];

    v13 = objc_msgSend(v8, "hmf_stringForKey:", @"Name");
    [v11 setName:v13];

    int v14 = objc_msgSend(v8, "hmf_stringForKey:", @"InstallationGuideURL");
    if (v14)
    {
      id v15 = [NSURL URLWithString:v14];
      [v11 setInstallationGuideURL:v15];
    }
    else
    {
      [v11 setInstallationGuideURL:0];
    }
    objc_super v19 = (HMMTRVendorMetadataProduct *)[v11 copy];
  }
  else
  {
    SEL v16 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v10 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v21 = 138543618;
      id v22 = v18;
      __int16 v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot find category to create vendor information from dictionary: %@", (uint8_t *)&v21, 0x16u);
    }
    objc_super v19 = 0;
  }

  return v19;
}

@end