@interface HKClinicalProviderSearchResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupported;
- (HKClinicalBrand)brand;
- (HKClinicalProviderSearchResult)initWithCoder:(id)a3;
- (HKClinicalProviderSearchResult)initWithExternalID:(id)a3 batchID:(id)a4 title:(id)a5 subtitle:(id)a6 location:(id)a7 supported:(BOOL)a8 countryCode:(id)a9 brand:(id)a10 minCompatibleAPIVersion:(int64_t)a11;
- (NSString)batchID;
- (NSString)countryCode;
- (NSString)externalID;
- (NSString)location;
- (NSString)subtitle;
- (NSString)title;
- (id)informationURL;
- (int64_t)minCompatibleAPIVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalProviderSearchResult

- (HKClinicalProviderSearchResult)initWithExternalID:(id)a3 batchID:(id)a4 title:(id)a5 subtitle:(id)a6 location:(id)a7 supported:(BOOL)a8 countryCode:(id)a9 brand:(id)a10 minCompatibleAPIVersion:(int64_t)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)HKClinicalProviderSearchResult;
  v24 = [(HKClinicalProviderSearchResult *)&v40 init];
  if (v24)
  {
    uint64_t v25 = [v17 copy];
    externalID = v24->_externalID;
    v24->_externalID = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    batchID = v24->_batchID;
    v24->_batchID = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    title = v24->_title;
    v24->_title = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    location = v24->_location;
    v24->_location = (NSString *)v33;

    v24->_supported = a8;
    uint64_t v35 = [v22 copy];
    countryCode = v24->_countryCode;
    v24->_countryCode = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    brand = v24->_brand;
    v24->_brand = (HKClinicalBrand *)v37;

    v24->_minCompatibleAPIVersion = a11;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HKClinicalProviderSearchResult *)self externalID];
    v6 = [v4 externalID];
    if (v5 == v6)
    {
      char v10 = 1;
    }
    else
    {
      v7 = [v4 externalID];
      if (v7)
      {
        v8 = [(HKClinicalProviderSearchResult *)self externalID];
        v9 = [v4 externalID];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(HKClinicalProviderSearchResult *)self externalID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(HKClinicalProviderSearchResult *)self externalID];
  [v11 encodeObject:v4 forKey:@"externalID"];

  v5 = [(HKClinicalProviderSearchResult *)self batchID];
  [v11 encodeObject:v5 forKey:@"batchID"];

  v6 = [(HKClinicalProviderSearchResult *)self title];
  [v11 encodeObject:v6 forKey:@"title"];

  v7 = [(HKClinicalProviderSearchResult *)self subtitle];
  [v11 encodeObject:v7 forKey:@"subtitle"];

  v8 = [(HKClinicalProviderSearchResult *)self location];
  [v11 encodeObject:v8 forKey:@"location"];

  objc_msgSend(v11, "encodeBool:forKey:", -[HKClinicalProviderSearchResult isSupported](self, "isSupported"), @"supported");
  v9 = [(HKClinicalProviderSearchResult *)self countryCode];
  [v11 encodeObject:v9 forKey:@"countryCode"];

  char v10 = [(HKClinicalProviderSearchResult *)self brand];
  [v11 encodeObject:v10 forKey:@"brand"];

  objc_msgSend(v11, "encodeInt64:forKey:", -[HKClinicalProviderSearchResult minCompatibleAPIVersion](self, "minCompatibleAPIVersion"), @"minCompatibleApiVersion");
}

- (HKClinicalProviderSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batchID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v12 = v10 || v7 == 0 || v8 == 0;
  if (!v12
    && [v4 containsValueForKey:@"supported"]
    && ([v4 containsValueForKey:@"minCompatibleApiVersion"] & 1) != 0)
  {
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    uint64_t v15 = [v4 decodeBoolForKey:@"supported"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brand"];
    self = -[HKClinicalProviderSearchResult initWithExternalID:batchID:title:subtitle:location:supported:countryCode:brand:minCompatibleAPIVersion:](self, "initWithExternalID:batchID:title:subtitle:location:supported:countryCode:brand:minCompatibleAPIVersion:", v5, v6, v7, v13, v14, v15, v9, v16, (int)[v4 decodeIntForKey:@"minCompatibleApiVersion"]);

    id v17 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v17 = 0;
  }

  return v17;
}

- (id)informationURL
{
  return 0;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)batchID
{
  return self->_batchID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)location
{
  return self->_location;
}

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_batchID, 0);

  objc_storeStrong((id *)&self->_externalID, 0);
}

@end