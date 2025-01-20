@interface GCProductInformation
+ (BOOL)supportsSecureCoding;
- (GCProductInformation)init;
- (GCProductInformation)initWithCoder:(id)a3;
- (GCProductInformation)initWithIdentifier:(id)a3;
- (NSDictionary)miscellaneous;
- (NSNumber)isAttachedToDevice;
- (NSObject)identifier;
- (NSString)anonymizedIdentifier;
- (NSString)detailedProductCategory;
- (NSString)productCategory;
- (NSString)vendorName;
- (void)encodeWithCoder:(id)a3;
- (void)setAnonymizedIdentifier:(id)a3;
- (void)setAttachedToDevice:(id)a3;
- (void)setDetailedProductCategory:(id)a3;
- (void)setMiscellaneous:(id)a3;
- (void)setProductCategory:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation GCProductInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)detailedProductCategory
{
  detailedProductCategory = self->_detailedProductCategory;
  if (detailedProductCategory)
  {
    v3 = detailedProductCategory;
  }
  else
  {
    v3 = [(GCProductInformation *)self productCategory];
  }

  return v3;
}

- (GCProductInformation)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCProductInformation;
  v5 = [(GCProductInformation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (GCProductInformation)init
{
  v3 = +[NSUUID UUID];
  id v4 = [(GCProductInformation *)self initWithIdentifier:v3];

  return v4;
}

- (GCProductInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GCProductInformation;
  v5 = [(GCProductInformation *)&v25 init];
  if (v5)
  {
    uint64_t v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productCategory"];
    productCategory = v5->_productCategory;
    v5->_productCategory = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detailedProductCategory"];
    detailedProductCategory = v5->_detailedProductCategory;
    v5->_detailedProductCategory = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorName"];
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachedToDevice"];
    attachedToDevice = v5->_attachedToDevice;
    v5->_attachedToDevice = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anonymizedIdentifier"];
    anonymizedIdentifier = v5->_anonymizedIdentifier;
    v5->_anonymizedIdentifier = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"miscellaneous"];
    miscellaneous = v5->_miscellaneous;
    v5->_miscellaneous = (NSDictionary *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GCProductInformation *)self isAttachedToDevice];
  [v4 encodeObject:v5 forKey:@"attachedToDevice"];

  uint64_t v6 = [(GCProductInformation *)self vendorName];
  [v4 encodeObject:v6 forKey:@"vendorName"];

  uint64_t v7 = [(GCProductInformation *)self productCategory];
  [v4 encodeObject:v7 forKey:@"productCategory"];

  v8 = [(GCProductInformation *)self detailedProductCategory];
  [v4 encodeObject:v8 forKey:@"detailedProductCategory"];

  uint64_t v9 = [(GCProductInformation *)self identifier];
  [v4 encodeObject:v9 forKey:@"identifier"];

  v10 = [(GCProductInformation *)self anonymizedIdentifier];
  [v4 encodeObject:v10 forKey:@"anonymizedIdentifier"];

  id v11 = [(GCProductInformation *)self miscellaneous];
  [v4 encodeObject:v11 forKey:@"miscellaneous"];
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setProductCategory:(id)a3
{
}

- (void)setDetailedProductCategory:(id)a3
{
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (NSString)anonymizedIdentifier
{
  return self->_anonymizedIdentifier;
}

- (void)setAnonymizedIdentifier:(id)a3
{
}

- (NSNumber)isAttachedToDevice
{
  return self->_attachedToDevice;
}

- (void)setAttachedToDevice:(id)a3
{
}

- (NSDictionary)miscellaneous
{
  return self->_miscellaneous;
}

- (void)setMiscellaneous:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscellaneous, 0);
  objc_storeStrong((id *)&self->_attachedToDevice, 0);
  objc_storeStrong((id *)&self->_anonymizedIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_detailedProductCategory, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end