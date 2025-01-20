@interface HKClinicalProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isSupported;
- (HKClinicalBrand)brand;
- (HKClinicalProvider)init;
- (HKClinicalProvider)initWithCoder:(id)a3;
- (HKClinicalProvider)initWithExternalID:(id)a3 title:(id)a4 subtitle:(id)a5 location:(id)a6 informationURL:(id)a7 brand:(id)a8 gateways:(id)a9;
- (NSArray)gateways;
- (NSString)description;
- (NSString)externalID;
- (NSString)location;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)informationURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalProvider

- (HKClinicalProvider)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalProvider)initWithExternalID:(id)a3 title:(id)a4 subtitle:(id)a5 location:(id)a6 informationURL:(id)a7 brand:(id)a8 gateways:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HKClinicalProvider;
  v22 = [(HKClinicalProvider *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    externalID = v22->_externalID;
    v22->_externalID = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    title = v22->_title;
    v22->_title = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    subtitle = v22->_subtitle;
    v22->_subtitle = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    location = v22->_location;
    v22->_location = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    informationURL = v22->_informationURL;
    v22->_informationURL = (NSURL *)v31;

    uint64_t v33 = [v20 copy];
    brand = v22->_brand;
    v22->_brand = (HKClinicalBrand *)v33;

    if (v21)
    {
      uint64_t v35 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v21 copyItems:1];
      gateways = v22->_gateways;
      v22->_gateways = (NSArray *)v35;
    }
  }

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(HKClinicalProvider *)self title];
  v6 = [(HKClinicalProvider *)self subtitle];
  v7 = [(HKClinicalProvider *)self externalID];
  v8 = [(HKClinicalProvider *)self gateways];
  v9 = objc_msgSend(v3, "initWithFormat:", @"<%@:%p; title: %@; subtitle: %@; external-id: %@; gateway-count: %ld;>",
                 v4,
                 self,
                 v5,
                 v6,
                 v7,
                 [v8 count]);

  return (NSString *)v9;
}

- (BOOL)isSupported
{
  v2 = [(HKClinicalProvider *)self gateways];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKClinicalProvider *)self brand];
  [v4 encodeObject:v5 forKey:@"brand"];

  v6 = [(HKClinicalProvider *)self externalID];
  [v4 encodeObject:v6 forKey:@"externalID"];

  v7 = [(HKClinicalProvider *)self gateways];
  [v4 encodeObject:v7 forKey:@"gateways"];

  v8 = [(HKClinicalProvider *)self informationURL];
  [v4 encodeObject:v8 forKey:@"infoURL"];

  v9 = [(HKClinicalProvider *)self title];
  [v4 encodeObject:v9 forKey:@"title"];

  v10 = [(HKClinicalProvider *)self subtitle];
  [v4 encodeObject:v10 forKey:@"subtitle"];

  id v11 = [(HKClinicalProvider *)self location];
  [v4 encodeObject:v11 forKey:@"location"];
}

- (HKClinicalProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalID"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v15 = 0;
  }
  else
  {
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"infoURL"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brand"];
    v14 = [v4 decodeObjectOfClasses:v5 forKey:@"gateways"];
    self = [(HKClinicalProvider *)self initWithExternalID:v6 title:v8 subtitle:v10 location:v11 informationURL:v12 brand:v13 gateways:v14];

    id v15 = self;
  }

  return v15;
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

- (NSString)location
{
  return self->_location;
}

- (NSURL)informationURL
{
  return self->_informationURL;
}

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (NSArray)gateways
{
  return self->_gateways;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gateways, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_informationURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_externalID, 0);
}

@end