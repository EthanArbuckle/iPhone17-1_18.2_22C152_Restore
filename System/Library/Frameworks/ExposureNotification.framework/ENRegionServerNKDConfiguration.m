@interface ENRegionServerNKDConfiguration
+ (BOOL)supportsSecureCoding;
- (ENRegion)region;
- (ENRegionServerNKDConfiguration)initWithCoder:(id)a3;
- (ENRegionServerNKDConfiguration)initWithServerResponseDictionary:(id)a3;
- (NSArray)acceptedReportTypes;
- (NSArray)travelerDownloadConfigurations;
- (NSString)healthAuthorityID;
- (NSString)testVerificationAPIKey;
- (NSURL)tekLocalDownloadBaseURL;
- (NSURL)tekLocalDownloadIndexURL;
- (NSURL)tekUploadURL;
- (NSURL)testVerificationCertificateURL;
- (NSURL)testVerificationURL;
- (double)tekPublishInterval;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENRegionServerNKDConfiguration

- (void)encodeWithCoder:(id)a3
{
  healthAuthorityID = self->_healthAuthorityID;
  id v5 = a3;
  [v5 encodeObject:healthAuthorityID forKey:@"healthAuthorityID"];
  [v5 encodeObject:self->_region forKey:@"region"];
  [v5 encodeObject:self->_tekLocalDownloadBaseURL forKey:@"tekLocalDownloadBasePath"];
  [v5 encodeObject:self->_tekLocalDownloadIndexURL forKey:@"tekLocalDownloadIndexFile"];
  [v5 encodeDouble:@"tekPublishInterval" forKey:self->_tekPublishInterval];
  [v5 encodeObject:self->_tekUploadURL forKey:@"tekUploadURL"];
  [v5 encodeObject:self->_acceptedReportTypes forKey:@"acceptedReportTypes"];
  [v5 encodeObject:self->_testVerificationAPIKey forKey:@"testVerificationAPIKey"];
  [v5 encodeObject:self->_testVerificationCertificateURL forKey:@"testVerificationCertificateURL"];
  [v5 encodeObject:self->_testVerificationURL forKey:@"testVerificationURL"];
  [v5 encodeObject:self->_travelerDownloadConfigurations forKey:@"tekTravelerDownloadURLs"];
}

- (ENRegionServerNKDConfiguration)initWithServerResponseDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)ENRegionServerNKDConfiguration;
  id v5 = [(ENRegionServerNKDConfiguration *)&v55 init];
  if (!v5)
  {
    v42 = 0;
    goto LABEL_46;
  }
  int v54 = 0;
  CFDictionaryGetTypeID();
  v6 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  uint64_t v7 = CFDictionaryGetTypedValue();
  healthAuthorityID = v5->_healthAuthorityID;
  v5->_healthAuthorityID = (NSString *)v7;

  v9 = +[ENRegion regionFromServerResponseDictionary:v4];
  v10 = v9;
  if (!v9)
  {
    v42 = 0;
    goto LABEL_45;
  }
  uint64_t v11 = [v9 copy];
  region = v5->_region;
  v5->_region = (ENRegion *)v11;

  CFStringGetTypeID();
  v13 = CFDictionaryGetTypedValue();
  if (v54)
  {
    v42 = 0;
    goto LABEL_44;
  }
  v14 = [NSURL URLWithString:v13];
  if (!v14)
  {
    v42 = 0;
    goto LABEL_43;
  }
  objc_storeStrong((id *)&v5->_tekLocalDownloadBaseURL, v14);
  CFStringGetTypeID();
  v15 = CFDictionaryGetTypedValue();
  v16 = [NSURL URLWithString:v15];
  if (!v16)
  {
    v42 = 0;
    goto LABEL_42;
  }
  v49 = v16;
  objc_storeStrong((id *)&v5->_tekLocalDownloadIndexURL, v16);
  v5->_tekPublishInterval = (double)(3600 * CFDictionaryGetInt64Ranged());
  CFStringGetTypeID();
  v17 = CFDictionaryGetTypedValue();
  if (v17)
  {
    uint64_t v18 = [NSURL URLWithString:v17];
    if (!v18)
    {
      v42 = 0;
      goto LABEL_41;
    }
    tekUploadURL = v5->_tekUploadURL;
    v5->_tekUploadURL = (NSURL *)v18;
  }
  v47 = v14;
  v48 = v13;

  char Int64Ranged = CFDictionaryGetInt64Ranged();
  if (v54) {
    char v21 = 0;
  }
  else {
    char v21 = Int64Ranged;
  }
  v22 = [MEMORY[0x263EFF980] arrayWithObject:&unk_26C60D2B8];
  v17 = v22;
  if ((v21 & 2) != 0)
  {
    [v22 addObject:&unk_26C60D2D0];
    if ((v21 & 4) == 0)
    {
LABEL_14:
      if ((v21 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v21 & 4) == 0)
  {
    goto LABEL_14;
  }
  [v17 addObject:&unk_26C60D2E8];
  if ((v21 & 8) != 0) {
LABEL_15:
  }
    [v17 addObject:&unk_26C60D300];
LABEL_16:
  v46 = v15;
  if ((v21 & 0x10) != 0) {
    [v17 addObject:&unk_26C60D318];
  }
  uint64_t v23 = [v17 copy];
  acceptedReportTypes = v5->_acceptedReportTypes;
  v5->_acceptedReportTypes = (NSArray *)v23;

  CFStringGetTypeID();
  uint64_t v25 = CFDictionaryGetTypedValue();
  testVerificationAPIKey = v5->_testVerificationAPIKey;
  v5->_testVerificationAPIKey = (NSString *)v25;

  CFStringGetTypeID();
  v27 = CFDictionaryGetTypedValue();
  if (v27)
  {
    uint64_t v28 = [NSURL URLWithString:v27];
    if (!v28) {
      goto LABEL_47;
    }
    testVerificationCertificateURL = v5->_testVerificationCertificateURL;
    v5->_testVerificationCertificateURL = (NSURL *)v28;
  }
  CFStringGetTypeID();
  v27 = CFDictionaryGetTypedValue();
  if (!v27)
  {
LABEL_24:

    CFArrayGetTypeID();
    v32 = CFDictionaryGetTypedValue();
    v27 = v32;
    if (v54)
    {
      travelerDownloadConfigurations = v5->_travelerDownloadConfigurations;
      v5->_travelerDownloadConfigurations = (NSArray *)MEMORY[0x263EFFA68];
    }
    else
    {
      v44 = v6;
      id v45 = v4;
      travelerDownloadConfigurations = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v32, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v34 = v27;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v51 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = [[ENRegionTravelerServerDownloadConfiguration alloc] initWithServerResponseDictionary:*(void *)(*((void *)&v50 + 1) + 8 * i)];
            if (v39) {
              [travelerDownloadConfigurations addObject:v39];
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v36);
      }

      uint64_t v40 = [travelerDownloadConfigurations copy];
      v41 = v5->_travelerDownloadConfigurations;
      v5->_travelerDownloadConfigurations = (NSArray *)v40;

      v6 = v44;
      id v4 = v45;
    }

    v42 = v5;
    goto LABEL_40;
  }
  uint64_t v30 = [NSURL URLWithString:v27];
  if (v30)
  {
    testVerificationURL = v5->_testVerificationURL;
    v5->_testVerificationURL = (NSURL *)v30;

    goto LABEL_24;
  }
LABEL_47:
  v42 = 0;
LABEL_40:
  v14 = v47;
  v13 = v48;

  v15 = v46;
LABEL_41:

  v16 = v49;
LABEL_42:

LABEL_43:
LABEL_44:

LABEL_45:
LABEL_46:

  return v42;
}

- (ENRegionServerNKDConfiguration)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tekLocalDownloadBasePath"];
  if (obj)
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tekLocalDownloadIndexFile"];
    if (v5)
    {
      v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
      if (v6)
      {
        uint64_t v7 = (void *)MEMORY[0x263EFFA08];
        v37[0] = objc_opt_class();
        v37[1] = objc_opt_class();
        v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
        v9 = [v7 setWithArray:v8];

        v10 = [v4 decodeObjectOfClasses:v9 forKey:@"tekTravelerDownloadURLs"];
        if (v10)
        {
          uint64_t v11 = (void *)MEMORY[0x263EFFA08];
          v36[0] = objc_opt_class();
          v36[1] = objc_opt_class();
          v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
          uint64_t v13 = [v11 setWithArray:v12];

          uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"acceptedReportTypes"];
          v15 = (void *)v14;
          if (v14) {
            v16 = (void *)v14;
          }
          else {
            v16 = &unk_26C60D438;
          }
          id v17 = v16;

          v35.receiver = self;
          v35.super_class = (Class)ENRegionServerNKDConfiguration;
          uint64_t v18 = [(ENRegionServerNKDConfiguration *)&v35 init];
          if (v18)
          {
            uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"healthAuthorityID"];
            healthAuthorityID = v18->_healthAuthorityID;
            v18->_healthAuthorityID = (NSString *)v19;

            objc_storeStrong((id *)&v18->_region, v6);
            objc_storeStrong((id *)&v18->_tekLocalDownloadBaseURL, obj);
            objc_storeStrong((id *)&v18->_tekLocalDownloadIndexURL, v5);
            [v4 decodeDoubleForKey:@"tekPublishInterval"];
            v18->_tekPublishInterval = v21;
            uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tekUploadURL"];
            tekUploadURL = v18->_tekUploadURL;
            v18->_tekUploadURL = (NSURL *)v22;

            objc_storeStrong((id *)&v18->_acceptedReportTypes, v16);
            uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testVerificationAPIKey"];
            testVerificationAPIKey = v18->_testVerificationAPIKey;
            v18->_testVerificationAPIKey = (NSString *)v24;

            uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testVerificationCertificateURL"];
            testVerificationCertificateURL = v18->_testVerificationCertificateURL;
            v18->_testVerificationCertificateURL = (NSURL *)v26;

            uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testVerificationURL"];
            testVerificationURL = v18->_testVerificationURL;
            v18->_testVerificationURL = (NSURL *)v28;

            uint64_t v30 = [v10 copy];
            travelerDownloadConfigurations = v18->_travelerDownloadConfigurations;
            v18->_travelerDownloadConfigurations = (NSArray *)v30;
          }
          self = v18;

          v32 = self;
          v9 = (void *)v13;
        }
        else
        {
          v32 = 0;
        }
      }
      else
      {
        v32 = 0;
      }
    }
    else
    {
      v32 = 0;
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSURL)tekLocalDownloadBaseURL
{
  return self->_tekLocalDownloadBaseURL;
}

- (NSURL)tekLocalDownloadIndexURL
{
  return self->_tekLocalDownloadIndexURL;
}

- (double)tekPublishInterval
{
  return self->_tekPublishInterval;
}

- (NSURL)tekUploadURL
{
  return self->_tekUploadURL;
}

- (NSString)healthAuthorityID
{
  return self->_healthAuthorityID;
}

- (NSArray)acceptedReportTypes
{
  return self->_acceptedReportTypes;
}

- (NSString)testVerificationAPIKey
{
  return self->_testVerificationAPIKey;
}

- (NSURL)testVerificationCertificateURL
{
  return self->_testVerificationCertificateURL;
}

- (NSURL)testVerificationURL
{
  return self->_testVerificationURL;
}

- (NSArray)travelerDownloadConfigurations
{
  return self->_travelerDownloadConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelerDownloadConfigurations, 0);
  objc_storeStrong((id *)&self->_testVerificationURL, 0);
  objc_storeStrong((id *)&self->_testVerificationCertificateURL, 0);
  objc_storeStrong((id *)&self->_testVerificationAPIKey, 0);
  objc_storeStrong((id *)&self->_acceptedReportTypes, 0);
  objc_storeStrong((id *)&self->_healthAuthorityID, 0);
  objc_storeStrong((id *)&self->_tekUploadURL, 0);
  objc_storeStrong((id *)&self->_tekLocalDownloadIndexURL, 0);
  objc_storeStrong((id *)&self->_tekLocalDownloadBaseURL, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end