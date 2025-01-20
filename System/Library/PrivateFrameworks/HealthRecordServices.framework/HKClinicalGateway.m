@interface HKClinicalGateway
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewerGatewayVersionOfGateway:(id)a3;
- (HKClinicalBrand)brand;
- (HKClinicalGateway)init;
- (HKClinicalGateway)initWithCoder:(id)a3;
- (HKClinicalGateway)initWithExternalID:(id)a3 title:(id)a4 subtitle:(id)a5 displayableDescription:(id)a6 phoneNumber:(id)a7 informationURL:(id)a8 passwordResetURL:(id)a9 patientPortalURL:(id)a10 signupURL:(id)a11 status:(int64_t)a12 type:(int64_t)a13 brand:(id)a14 country:(id)a15 baseURL:(id)a16 FHIRVersion:(id)a17 authSchemas:(id)a18 resourceSchemas:(id)a19 features:(id)a20 gatewayVersions:(id)a21 minCompatibleAPIVersion:(int64_t)a22;
- (HKClinicalGatewayReference)newerSupportedGatewayVersion;
- (HKFHIRVersion)FHIRVersion;
- (NSArray)authSchemas;
- (NSArray)features;
- (NSArray)gatewayVersions;
- (NSArray)resourceSchemas;
- (NSString)country;
- (NSString)description;
- (NSString)displayableDescription;
- (NSString)externalID;
- (NSString)phoneNumber;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)baseURL;
- (NSURL)informationURL;
- (NSURL)passwordResetURL;
- (NSURL)patientPortalURL;
- (NSURL)signupURL;
- (int64_t)minCompatibleAPIVersion;
- (int64_t)status;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalGateway

- (HKClinicalGateway)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalGateway)initWithExternalID:(id)a3 title:(id)a4 subtitle:(id)a5 displayableDescription:(id)a6 phoneNumber:(id)a7 informationURL:(id)a8 passwordResetURL:(id)a9 patientPortalURL:(id)a10 signupURL:(id)a11 status:(int64_t)a12 type:(int64_t)a13 brand:(id)a14 country:(id)a15 baseURL:(id)a16 FHIRVersion:(id)a17 authSchemas:(id)a18 resourceSchemas:(id)a19 features:(id)a20 gatewayVersions:(id)a21 minCompatibleAPIVersion:(int64_t)a22
{
  id v80 = a3;
  id v79 = a4;
  id v78 = a5;
  id v77 = a6;
  id v76 = a7;
  id v75 = a8;
  id v74 = a9;
  id v73 = a10;
  id v72 = a11;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  v81.receiver = self;
  v81.super_class = (Class)HKClinicalGateway;
  v35 = [(HKClinicalGateway *)&v81 init];
  if (v35)
  {
    uint64_t v36 = [v80 copy];
    externalID = v35->_externalID;
    v35->_externalID = (NSString *)v36;

    uint64_t v38 = [v79 copy];
    title = v35->_title;
    v35->_title = (NSString *)v38;

    uint64_t v40 = [v78 copy];
    subtitle = v35->_subtitle;
    v35->_subtitle = (NSString *)v40;

    uint64_t v42 = [v77 copy];
    displayableDescription = v35->_displayableDescription;
    v35->_displayableDescription = (NSString *)v42;

    uint64_t v44 = [v76 copy];
    phoneNumber = v35->_phoneNumber;
    v35->_phoneNumber = (NSString *)v44;

    uint64_t v46 = [v75 copy];
    informationURL = v35->_informationURL;
    v35->_informationURL = (NSURL *)v46;

    uint64_t v48 = [v74 copy];
    passwordResetURL = v35->_passwordResetURL;
    v35->_passwordResetURL = (NSURL *)v48;

    uint64_t v50 = [v73 copy];
    patientPortalURL = v35->_patientPortalURL;
    v35->_patientPortalURL = (NSURL *)v50;

    uint64_t v52 = [v72 copy];
    signupURL = v35->_signupURL;
    v35->_signupURL = (NSURL *)v52;

    v35->_status = a12;
    v35->_type = a13;
    uint64_t v54 = [v27 copy];
    brand = v35->_brand;
    v35->_brand = (HKClinicalBrand *)v54;

    uint64_t v56 = [v28 copy];
    country = v35->_country;
    v35->_country = (NSString *)v56;

    uint64_t v58 = [v29 copy];
    baseURL = v35->_baseURL;
    v35->_baseURL = (NSURL *)v58;

    uint64_t v60 = [v30 copy];
    FHIRVersion = v35->_FHIRVersion;
    v35->_FHIRVersion = (HKFHIRVersion *)v60;

    uint64_t v62 = [v31 copy];
    authSchemas = v35->_authSchemas;
    v35->_authSchemas = (NSArray *)v62;

    uint64_t v64 = [v32 copy];
    resourceSchemas = v35->_resourceSchemas;
    v35->_resourceSchemas = (NSArray *)v64;

    uint64_t v66 = [v33 copy];
    features = v35->_features;
    v35->_features = (NSArray *)v66;

    uint64_t v68 = [v34 copy];
    gatewayVersions = v35->_gatewayVersions;
    v35->_gatewayVersions = (NSArray *)v68;

    v35->_minCompatibleAPIVersion = a22;
  }

  return v35;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKClinicalGateway *)self externalID];
  v6 = [(HKClinicalGateway *)self title];
  v7 = [(HKClinicalGateway *)self subtitle];
  v8 = [(HKClinicalGateway *)self displayableDescription];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p externalID: %@; title: \"%@\"; subtitle: \"%@\"; description: \"%@\"; MCAV: %zd; status: %zd;>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    [(HKClinicalGateway *)self minCompatibleAPIVersion],
    [(HKClinicalGateway *)self status],
  v9 = 0);

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKClinicalGateway *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if ([(HKClinicalGateway *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(HKClinicalGateway *)self externalID];
    v7 = [(HKClinicalGateway *)v5 externalID];
    if (v6 == v7)
    {
      char v11 = 1;
    }
    else
    {
      v8 = [(HKClinicalGateway *)v5 externalID];
      if (v8)
      {
        v9 = [(HKClinicalGateway *)self externalID];
        v10 = [(HKClinicalGateway *)v5 externalID];
        char v11 = [v9 isEqualToString:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(HKClinicalGateway *)self externalID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HKClinicalGatewayReference)newerSupportedGatewayVersion
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKProviderServiceMaximumCompatibleAPIVersion();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int64_t minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
  v5 = self->_gatewayVersions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        char v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "minCompatibleAPIVersion", (void)v14) <= v3
          && [v11 minCompatibleAPIVersion] > minCompatibleAPIVersion)
        {
          id v12 = v11;

          v8 = v12;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return (HKClinicalGatewayReference *)v8;
}

- (BOOL)isNewerGatewayVersionOfGateway:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = (HKClinicalGateway *)a3;
  if (!v5)
  {
    long long v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKClinicalGateway.m", 124, @"Invalid parameter not satisfying: %@", @"otherGateway" object file lineNumber description];
  }
  if (self == v5)
  {
    BOOL v15 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = self->_gatewayVersions;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [v11 gatewayID];
          v13 = [(HKClinicalGateway *)v5 externalID];
          char v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            BOOL v15 = [v11 minCompatibleAPIVersion] < self->_minCompatibleAPIVersion;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 0;
LABEL_14:
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  objc_msgSend(v21, "encodeInteger:forKey:", -[HKClinicalGateway status](self, "status"), @"status");
  objc_msgSend(v21, "encodeInteger:forKey:", -[HKClinicalGateway type](self, "type"), @"type");
  uint64_t v4 = [(HKClinicalGateway *)self brand];
  [v21 encodeObject:v4 forKey:@"brand"];

  v5 = [(HKClinicalGateway *)self displayableDescription];
  [v21 encodeObject:v5 forKey:@"displayableDescription"];

  uint64_t v6 = [(HKClinicalGateway *)self externalID];
  [v21 encodeObject:v6 forKey:@"externalID"];

  uint64_t v7 = [(HKClinicalGateway *)self informationURL];
  [v21 encodeObject:v7 forKey:@"info"];

  uint64_t v8 = [(HKClinicalGateway *)self passwordResetURL];
  [v21 encodeObject:v8 forKey:@"forgot"];

  uint64_t v9 = [(HKClinicalGateway *)self patientPortalURL];
  [v21 encodeObject:v9 forKey:@"patientportal"];

  v10 = [(HKClinicalGateway *)self phoneNumber];
  [v21 encodeObject:v10 forKey:@"phoneNumber"];

  char v11 = [(HKClinicalGateway *)self country];
  [v21 encodeObject:v11 forKey:@"country"];

  id v12 = [(HKClinicalGateway *)self signupURL];
  [v21 encodeObject:v12 forKey:@"signup"];

  v13 = [(HKClinicalGateway *)self subtitle];
  [v21 encodeObject:v13 forKey:@"subtitle"];

  char v14 = [(HKClinicalGateway *)self title];
  [v21 encodeObject:v14 forKey:@"title"];

  BOOL v15 = [(HKClinicalGateway *)self baseURL];
  [v21 encodeObject:v15 forKey:@"baseURL"];

  long long v16 = [(HKClinicalGateway *)self FHIRVersion];
  [v21 encodeObject:v16 forKey:@"FHIRVersion"];

  long long v17 = [(HKClinicalGateway *)self authSchemas];
  [v21 encodeObject:v17 forKey:@"authSchemas"];

  long long v18 = [(HKClinicalGateway *)self resourceSchemas];
  [v21 encodeObject:v18 forKey:@"resourceSchemas"];

  long long v19 = [(HKClinicalGateway *)self features];
  [v21 encodeObject:v19 forKey:@"features"];

  long long v20 = [(HKClinicalGateway *)self gatewayVersions];
  [v21 encodeObject:v20 forKey:@"gatewayVersions"];

  objc_msgSend(v21, "encodeInteger:forKey:", -[HKClinicalGateway minCompatibleAPIVersion](self, "minCompatibleAPIVersion"), @"minCompatibleAPIVersion");
}

- (HKClinicalGateway)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brand"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalID"];
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
      if (v7)
      {
        uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
        if (v8)
        {
          uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
          if (v9)
          {
            uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRVersion"];
            char v11 = (void *)v10;
            if (v10)
            {
              id v31 = (void *)v10;
              uint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
              v37 = [v4 decodeObjectOfClasses:v12 forKey:@"authSchemas"];
              id v30 = (void *)v12;
              uint64_t v36 = [v4 decodeObjectOfClasses:v12 forKey:@"resourceSchemas"];
              id v34 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
              v35 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
              uint64_t v13 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
              uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"gatewayVersions"];
              id v32 = v9;
              id v33 = (void *)v13;
              if ([v4 containsValueForKey:@"status"]
                && [v4 containsValueForKey:@"type"]
                && ([v4 containsValueForKey:@"minCompatibleAPIVersion"] & 1) != 0)
              {
                id v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
                id v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayableDescription"];
                v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
                v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"info"];
                id v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"forgot"];
                v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"patientportal"];
                v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signup"];
                uint64_t v23 = [v4 decodeIntegerForKey:@"status"];
                uint64_t v15 = [v4 decodeIntegerForKey:@"type"];
                uint64_t v16 = [v4 decodeIntegerForKey:@"minCompatibleAPIVersion"];
                uint64_t v21 = v14;
                long long v17 = v9;
                long long v18 = (void *)v14;
                char v11 = v31;
                self = objc_retain(-[HKClinicalGateway initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:](self, "initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:", v6, v7, v29, v28, v25, v24, v27, v26, v22, v23, v15, v5, v8, v17,
                           v31,
                           v37,
                           v36,
                           v35,
                           v21,
                           v16));

                long long v19 = self;
              }
              else
              {
                long long v18 = (void *)v14;
                objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
                long long v19 = 0;
                char v11 = v31;
              }

              uint64_t v9 = v32;
            }
            else
            {
              objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
              long long v19 = 0;
            }
          }
          else
          {
            objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
            long long v19 = 0;
          }
        }
        else
        {
          objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
          long long v19 = 0;
        }
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        long long v19 = 0;
      }
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      long long v19 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    long long v19 = 0;
  }

  return v19;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)displayableDescription
{
  return self->_displayableDescription;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)informationURL
{
  return self->_informationURL;
}

- (NSURL)passwordResetURL
{
  return self->_passwordResetURL;
}

- (NSURL)patientPortalURL
{
  return self->_patientPortalURL;
}

- (NSURL)signupURL
{
  return self->_signupURL;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)type
{
  return self->_type;
}

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (NSString)country
{
  return self->_country;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (NSArray)authSchemas
{
  return self->_authSchemas;
}

- (NSArray)resourceSchemas
{
  return self->_resourceSchemas;
}

- (NSArray)features
{
  return self->_features;
}

- (NSArray)gatewayVersions
{
  return self->_gatewayVersions;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayVersions, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_resourceSchemas, 0);
  objc_storeStrong((id *)&self->_authSchemas, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_signupURL, 0);
  objc_storeStrong((id *)&self->_patientPortalURL, 0);
  objc_storeStrong((id *)&self->_passwordResetURL, 0);
  objc_storeStrong((id *)&self->_informationURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_displayableDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_externalID, 0);
}

@end