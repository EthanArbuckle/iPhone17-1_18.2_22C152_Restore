@interface HMDVendorModelEntry
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryVersion)firmwareVersion;
- (HMDVendorModelEntry)initWithManufacturer:(id)a3 model:(id)a4 appBundleID:(id)a5 appStoreID:(id)a6 firmwareVersion:(id)a7 productData:(id)a8 productDataAlternates:(id)a9;
- (NSArray)productDataAlternates;
- (NSString)appBundleID;
- (NSString)appStoreID;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)productData;
- (id)attributeDescriptions;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation HMDVendorModelEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productDataAlternates, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_appStoreID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (NSArray)productDataAlternates
{
  return self->_productDataAlternates;
}

- (NSString)productData
{
  return self->_productData;
}

- (HMDAccessoryVersion)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)appStoreID
{
  return self->_appStoreID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (unint64_t)hash
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v3 = [(HMDVendorModelEntry *)self manufacturer];
  uint64_t v4 = [v3 hash];

  uint64_t v24 = v4;
  v5 = [(HMDVendorModelEntry *)self model];
  uint64_t v6 = [v5 hash];
  v22[3] ^= v6;

  v7 = [(HMDVendorModelEntry *)self appBundleID];
  uint64_t v8 = [v7 hash];
  v22[3] ^= v8;

  v9 = [(HMDVendorModelEntry *)self appBundleID];
  uint64_t v10 = [v9 hash];
  v22[3] ^= v10;

  v11 = [(HMDVendorModelEntry *)self appStoreID];
  uint64_t v12 = [v11 hash];
  v22[3] ^= v12;

  v13 = [(HMDVendorModelEntry *)self firmwareVersion];
  uint64_t v14 = [v13 hash];
  v22[3] ^= v14;

  v15 = [(HMDVendorModelEntry *)self productData];
  uint64_t v16 = [v15 hash];
  v22[3] ^= v16;

  v17 = [(HMDVendorModelEntry *)self productDataAlternates];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __27__HMDVendorModelEntry_hash__block_invoke;
  v20[3] = &unk_1E6A171A0;
  v20[4] = &v21;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  unint64_t v18 = v22[3];
  _Block_object_dispose(&v21, 8);
  return v18;
}

uint64_t __27__HMDVendorModelEntry_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hash];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(HMDVendorModelEntry *)self manufacturer];
  uint64_t v6 = [v4 manufacturer];
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    uint64_t v8 = [(HMDVendorModelEntry *)self model];
    v9 = [v4 model];
    int64_t v7 = [v8 compare:v9];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDVendorModelEntry *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      int64_t v7 = [(HMDVendorModelEntry *)self manufacturer];
      uint64_t v8 = [(HMDVendorModelEntry *)v6 manufacturer];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(HMDVendorModelEntry *)self model];
        uint64_t v10 = [(HMDVendorModelEntry *)v6 model];
        if ([v9 isEqualToString:v10])
        {
          v11 = [(HMDVendorModelEntry *)self appBundleID];
          uint64_t v12 = [(HMDVendorModelEntry *)v6 appBundleID];
          if (HMFEqualObjects())
          {
            uint64_t v13 = [(HMDVendorModelEntry *)self appStoreID];
            uint64_t v24 = [(HMDVendorModelEntry *)v6 appStoreID];
            v25 = (void *)v13;
            if (HMFEqualObjects())
            {
              uint64_t v14 = [(HMDVendorModelEntry *)self firmwareVersion];
              v22 = [(HMDVendorModelEntry *)v6 firmwareVersion];
              uint64_t v23 = (void *)v14;
              if (HMFEqualObjects())
              {
                uint64_t v15 = [(HMDVendorModelEntry *)self productData];
                [(HMDVendorModelEntry *)v6 productData];
                uint64_t v16 = v21 = (void *)v15;
                if (HMFEqualObjects())
                {
                  v20 = [(HMDVendorModelEntry *)self productDataAlternates];
                  v19 = [(HMDVendorModelEntry *)v6 productDataAlternates];
                  char v17 = HMFEqualObjects();
                }
                else
                {
                  char v17 = 0;
                }
              }
              else
              {
                char v17 = 0;
              }
            }
            else
            {
              char v17 = 0;
            }
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  return v17;
}

- (id)attributeDescriptions
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = [(HMDVendorModelEntry *)self manufacturer];
  uint64_t v24 = (void *)[v3 initWithName:@"Manufacturer" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v23 = [(HMDVendorModelEntry *)self model];
  v22 = (void *)[v4 initWithName:@"Model" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v21 = [(HMDVendorModelEntry *)self appBundleID];
  uint64_t v6 = (void *)[v5 initWithName:@"AppBundleID" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v8 = [(HMDVendorModelEntry *)self appStoreID];
  v9 = (void *)[v7 initWithName:@"AppStoreID" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDVendorModelEntry *)self firmwareVersion];
  uint64_t v12 = (void *)[v10 initWithName:@"FirmwareVersion" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v14 = [(HMDVendorModelEntry *)self productData];
  uint64_t v15 = (void *)[v13 initWithName:@"ProductData" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  char v17 = [(HMDVendorModelEntry *)self productDataAlternates];
  unint64_t v18 = (void *)[v16 initWithName:@"ProductDataAlternates" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  return v19;
}

- (HMDVendorModelEntry)initWithManufacturer:(id)a3 model:(id)a4 appBundleID:(id)a5 appStoreID:(id)a6 firmwareVersion:(id)a7 productData:(id)a8 productDataAlternates:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HMDVendorModelEntry;
  v22 = [(HMDVendorModelEntry *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    manufacturer = v22->_manufacturer;
    v22->_manufacturer = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    model = v22->_model;
    v22->_model = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    appBundleID = v22->_appBundleID;
    v22->_appBundleID = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    appStoreID = v22->_appStoreID;
    v22->_appStoreID = (NSString *)v29;

    if (v19)
    {
      v31 = [[HMDAccessoryVersion alloc] initWithVersionString:v19];
      firmwareVersion = v22->_firmwareVersion;
      v22->_firmwareVersion = v31;
    }
    uint64_t v33 = [v20 copy];
    productData = v22->_productData;
    v22->_productData = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    productDataAlternates = v22->_productDataAlternates;
    v22->_productDataAlternates = (NSArray *)v35;
  }
  return v22;
}

@end