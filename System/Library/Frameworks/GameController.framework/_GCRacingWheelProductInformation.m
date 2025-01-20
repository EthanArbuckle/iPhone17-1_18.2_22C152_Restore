@interface _GCRacingWheelProductInformation
+ (BOOL)supportsSecureCoding;
- (NSObject)identifier;
- (NSString)productCategory;
- (NSString)vendorName;
- (_GCRacingWheelProductInformation)init;
- (_GCRacingWheelProductInformation)initWithCoder:(id)a3;
- (_GCRacingWheelProductInformation)initWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setProductCategory:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation _GCRacingWheelProductInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCRacingWheelProductInformation)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCRacingWheelProductInformation;
  v5 = [(_GCRacingWheelProductInformation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (_GCRacingWheelProductInformation)init
{
  v3 = +[NSUUID UUID];
  id v4 = [(_GCRacingWheelProductInformation *)self initWithIdentifier:v3];

  return v4;
}

- (_GCRacingWheelProductInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCRacingWheelProductInformation;
  v5 = [(_GCRacingWheelProductInformation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productCategory"];
    productCategory = v5->_productCategory;
    v5->_productCategory = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorName"];
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_GCRacingWheelProductInformation *)self vendorName];
  [v4 encodeObject:v5 forKey:@"vendorName"];

  uint64_t v6 = [(_GCRacingWheelProductInformation *)self productCategory];
  [v4 encodeObject:v6 forKey:@"productCategory"];

  id v7 = [(_GCRacingWheelProductInformation *)self identifier];
  [v4 encodeObject:v7 forKey:@"identifier"];
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

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end