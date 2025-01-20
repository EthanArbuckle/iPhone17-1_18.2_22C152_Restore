@interface HMDAccessoryMetricVendorDetails
+ (unint64_t)maximumDifferentiationNumber;
- (HMDAccessoryMetricVendorDetails)initWithAccessory:(id)a3;
- (HMDAccessoryMetricVendorDetails)initWithProductData:(id)a3 manufacturer:(id)a4 model:(id)a5 firmwareVersion:(id)a6 category:(id)a7 differentiationNumber:(id)a8;
- (NSNumber)differentiationNumber;
- (NSString)category;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)productData;
- (id)attributeDescriptions;
@end

@implementation HMDAccessoryMetricVendorDetails

- (NSString)model
{
  return self->_model;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (HMDAccessoryMetricVendorDetails)initWithAccessory:(id)a3
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
  v7 = [v6 home];
  v8 = [v7 homeManager];

  v55 = v4;
  v56 = v8;
  v54 = v6;
  if ([v6 communicationProtocol] == 2)
  {
    v9 = [v6 matterVendorID];

    if (v9)
    {
      v10 = [v8 chipDataSource];
      v11 = [v10 vendorMetadataStore];
      v12 = [v6 matterVendorID];
      v13 = [v6 matterProductID];
      v14 = [v11 retrieveVendorMetadataForVendorID:v12 productID:v13];

      v15 = [v6 matterProductID];
      v16 = [v14 productWithID:v15];

      v17 = [v14 name];
      v50 = v16;
      v18 = [v16 name];
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v14 = 0;
      v50 = 0;
    }
    v23 = [v6 matterVendorID];

    if (v23) {
      BOOL v24 = v14 == 0;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24)
    {
      v25 = [v6 matterVendorID];
      uint64_t v26 = [v25 stringValue];

      v17 = (void *)v26;
    }
    v27 = [v6 matterProductID];

    if (v27 && !v50)
    {
      v28 = [v6 matterProductID];
      uint64_t v29 = [v28 stringValue];

      v18 = (void *)v29;
    }
    v53 = [v4 firmwareVersion];
    v30 = [v53 versionString];
    v31 = [v6 category];
    v32 = [v31 categoryType];
    v33 = NSNumber;
    v34 = [v4 uuid];
    v35 = objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "hash") % (unint64_t)objc_msgSend((id)objc_opt_class(), "maximumDifferentiationNumber"));
    v36 = self;
    v37 = v17;
    v38 = [(HMDAccessoryMetricVendorDetails *)v36 initWithProductData:0 manufacturer:v17 model:v18 firmwareVersion:v30 category:v32 differentiationNumber:v35];
    v39 = v50;
  }
  else
  {
    id v19 = [v4 vendorInfo];
    v20 = [v4 productData];
    v21 = v20;
    if (v19)
    {
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = [v19 productData];
      }
    }
    else
    {
      anonymizeUnknownVendorString(v20);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v51 = v22;

    id v40 = v4;
    id v52 = v19;
    if (v19)
    {
      v14 = [v19 manufacturer];

      v39 = [v19 model];
    }
    else
    {
      v41 = +[HMDVendorDataManager sharedVendorDataManager];
      v42 = [v40 manufacturer];
      char v43 = [v41 databaseContainsManufacturer:v42];

      v44 = [v40 manufacturer];
      v14 = v44;
      if ((v43 & 1) == 0)
      {
        uint64_t v45 = anonymizeUnknownVendorString(v44);

        v14 = (void *)v45;
      }

      v46 = [v40 model];
      v39 = anonymizeUnknownVendorString(v46);
    }
    v53 = [v40 firmwareVersion];
    v30 = [v53 versionString];
    v31 = [v40 category];
    v32 = [v31 categoryType];
    v47 = NSNumber;
    v34 = [v40 uuid];
    v35 = objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v34, "hash") % (unint64_t)objc_msgSend((id)objc_opt_class(), "maximumDifferentiationNumber"));
    v18 = v51;
    v38 = [(HMDAccessoryMetricVendorDetails *)self initWithProductData:v51 manufacturer:v14 model:v39 firmwareVersion:v30 category:v32 differentiationNumber:v35];
    v37 = v52;
  }
  v48 = v38;

  return v48;
}

- (HMDAccessoryMetricVendorDetails)initWithProductData:(id)a3 manufacturer:(id)a4 model:(id)a5 firmwareVersion:(id)a6 category:(id)a7 differentiationNumber:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDAccessoryMetricVendorDetails;
  v18 = [(HMDAccessoryMetricVendorDetails *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_productData, a3);
    objc_storeStrong((id *)&v19->_manufacturer, a4);
    objc_storeStrong((id *)&v19->_model, a5);
    objc_storeStrong((id *)&v19->_firmwareVersion, a6);
    objc_storeStrong((id *)&v19->_category, a7);
    objc_storeStrong((id *)&v19->_differentiationNumber, a8);
  }

  return v19;
}

+ (unint64_t)maximumDifferentiationNumber
{
  return 64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_differentiationNumber, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_productData, 0);
}

- (NSNumber)differentiationNumber
{
  return self->_differentiationNumber;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)productData
{
  return self->_productData;
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v19 = [(HMDAccessoryMetricVendorDetails *)self manufacturer];
  id v4 = (void *)[v3 initWithName:@"manufacturer" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v6 = [(HMDAccessoryMetricVendorDetails *)self model];
  v7 = (void *)[v5 initWithName:@"model" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMDAccessoryMetricVendorDetails *)self firmwareVersion];
  v10 = (void *)[v8 initWithName:@"firmwareVersion" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v12 = [(HMDAccessoryMetricVendorDetails *)self category];
  v13 = (void *)[v11 initWithName:@"category" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v15 = [(HMDAccessoryMetricVendorDetails *)self differentiationNumber];
  id v16 = (void *)[v14 initWithName:@"differentiationNumber" value:v15];
  v20[4] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];

  return v17;
}

@end