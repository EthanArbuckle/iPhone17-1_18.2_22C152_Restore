@interface CoreCECDeviceBasicAttributes
+ (BOOL)supportsSecureCoding;
+ (id)deviceAttributesWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8;
+ (id)deviceAttributesWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8 active:(BOOL)a9;
+ (id)deviceAttributesWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8 active:(BOOL)a9 options:(unint64_t)a10;
- (BOOL)isActiveSource;
- (BOOL)isEqual:(id)a3;
- (CoreCECDeviceBasicAttributes)initWithCoder:(id)a3;
- (CoreCECDeviceBasicAttributes)initWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8 active:(BOOL)a9 options:(unint64_t)a10;
- (NSDictionary)rcProfile;
- (id)description;
- (unint64_t)allDeviceTypes;
- (unint64_t)cecVersion;
- (unint64_t)deviceFeatures;
- (unint64_t)deviceType;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)vendorID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CoreCECDeviceBasicAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deviceAttributesWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8
{
  LOBYTE(v9) = 0;
  return (id)[a1 deviceAttributesWithPrimaryType:a3 otherTypes:a4 features:a5 rcProfile:a6 vendorID:a7 version:a8 active:v9 options:0];
}

+ (id)deviceAttributesWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8 active:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return (id)[a1 deviceAttributesWithPrimaryType:a3 otherTypes:a4 features:a5 rcProfile:a6 vendorID:a7 version:a8 active:v10 options:0];
}

+ (id)deviceAttributesWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8 active:(BOOL)a9 options:(unint64_t)a10
{
  LOBYTE(v12) = a9;
  uint64_t v10 = [[CoreCECDeviceBasicAttributes alloc] initWithPrimaryType:a3 otherTypes:a4 features:a5 rcProfile:a6 vendorID:a7 version:a8 active:v12 options:a10];
  return v10;
}

- (CoreCECDeviceBasicAttributes)initWithPrimaryType:(unint64_t)a3 otherTypes:(unint64_t)a4 features:(unint64_t)a5 rcProfile:(id)a6 vendorID:(unint64_t)a7 version:(unint64_t)a8 active:(BOOL)a9 options:(unint64_t)a10
{
  v16 = [(CoreCECDeviceBasicAttributes *)self init];
  v17 = v16;
  if (v16)
  {
    v16->_deviceType = a3;
    v16->_allDeviceTypes = (1 << (a3 - 1)) | a4;
    v16->_deviceFeatures = a5;
    uint64_t v18 = [a6 copy];
    v17->_cecVersion = a8;
    v17->_vendorID = a7;
    v17->_isActiveSource = a9;
    v17->_rcProfile = (NSDictionary *)v18;
    v17->_options = a10;
  }
  return v17;
}

- (CoreCECDeviceBasicAttributes)initWithCoder:(id)a3
{
  v4 = [(CoreCECDeviceBasicAttributes *)self init];
  if (v4)
  {
    v4->_deviceType = [a3 decodeIntegerForKey:@"deviceType"];
    v4->_allDeviceTypes = [a3 decodeIntegerForKey:@"allDeviceTypes"];
    v4->_deviceFeatures = [a3 decodeIntegerForKey:@"deviceFeatures"];
    v4->_rcProfile = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(+[CoreCECTypesInternal defaultTypes](CoreCECTypesInternal, "defaultTypes"), "rcProfileClasses"), @"rcProfile"), "copy");
    v4->_vendorID = [a3 decodeIntegerForKey:@"vendorID"];
    v4->_cecVersion = [a3 decodeIntegerForKey:@"cecVersion"];
    v4->_isActiveSource = [a3 decodeBoolForKey:@"isActiveSource"];
    v4->_options = [a3 decodeIntegerForKey:@"options"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_deviceType forKey:@"deviceType"];
  [a3 encodeInteger:self->_cecVersion forKey:@"cecVersion"];
  [a3 encodeInteger:self->_vendorID forKey:@"vendorID"];
  [a3 encodeInteger:self->_allDeviceTypes forKey:@"allDeviceTypes"];
  [a3 encodeInteger:self->_deviceFeatures forKey:@"deviceFeatures"];
  [a3 encodeObject:self->_rcProfile forKey:@"rcProfile"];
  [a3 encodeBool:self->_isActiveSource forKey:@"isActiveSource"];
  unint64_t options = self->_options;
  [a3 encodeInteger:options forKey:@"options"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECDeviceBasicAttributes;
  [(CoreCECDeviceBasicAttributes *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CoreCECDeviceBasicAttributes;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreCECDeviceBasicAttributes description](&v7, sel_description));
  objc_msgSend(v3, "appendFormat:", @" Type: %@;",
    CoreCECDeviceTypeString([(CoreCECDeviceBasicAttributes *)self deviceType]));
  objc_msgSend(v3, "appendFormat:", @" CEC: %@;",
    CoreCECVersionString([(CoreCECDeviceBasicAttributes *)self cecVersion]));
  objc_msgSend(v3, "appendFormat:", @" Vendor: %@;",
    CoreCECVendorIDString([(CoreCECDeviceBasicAttributes *)self vendorID]));
  objc_msgSend(v3, "appendFormat:", @" All Device Types: 0x%02X;",
    [(CoreCECDeviceBasicAttributes *)self allDeviceTypes]);
  objc_msgSend(v3, "appendFormat:", @" Features: 0x%08lX;",
    [(CoreCECDeviceBasicAttributes *)self deviceFeatures]);
  objc_msgSend(v3, "appendFormat:", @" RCProfile: %@;",
    CoreCECRCProfileString([(CoreCECDeviceBasicAttributes *)self rcProfile]));
  BOOL v4 = [(CoreCECDeviceBasicAttributes *)self isActiveSource];
  v5 = @"NO";
  if (v4) {
    v5 = @"YES";
  }
  [v3 appendFormat:@" IsActiveSource: %@;", v5];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(CoreCECDeviceBasicAttributes *)self deviceType];
  if (v5 != [a3 deviceType]) {
    return 0;
  }
  unint64_t v6 = [(CoreCECDeviceBasicAttributes *)self cecVersion];
  if (v6 != [a3 cecVersion]) {
    return 0;
  }
  unint64_t v7 = [(CoreCECDeviceBasicAttributes *)self vendorID];
  if (v7 != [a3 vendorID]) {
    return 0;
  }
  unint64_t v8 = [(CoreCECDeviceBasicAttributes *)self allDeviceTypes];
  if (v8 != [a3 allDeviceTypes]) {
    return 0;
  }
  unint64_t v9 = [(CoreCECDeviceBasicAttributes *)self deviceFeatures];
  if (v9 != [a3 deviceFeatures]) {
    return 0;
  }
  uint64_t v10 = [(CoreCECDeviceBasicAttributes *)self rcProfile];
  uint64_t v11 = [a3 rcProfile];
  return [(NSDictionary *)v10 isEqual:v11];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)[(CoreCECDeviceBasicAttributes *)self rcProfile] hash];
  unint64_t v4 = [(CoreCECDeviceBasicAttributes *)self deviceType];
  unint64_t v5 = v4 ^ [(CoreCECDeviceBasicAttributes *)self cecVersion] ^ v3;
  unint64_t v6 = [(CoreCECDeviceBasicAttributes *)self vendorID];
  unint64_t v7 = v6 ^ [(CoreCECDeviceBasicAttributes *)self allDeviceTypes];
  return v5 ^ v7 ^ [(CoreCECDeviceBasicAttributes *)self deviceFeatures];
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)cecVersion
{
  return self->_cecVersion;
}

- (unint64_t)vendorID
{
  return self->_vendorID;
}

- (unint64_t)allDeviceTypes
{
  return self->_allDeviceTypes;
}

- (unint64_t)deviceFeatures
{
  return self->_deviceFeatures;
}

- (NSDictionary)rcProfile
{
  return self->_rcProfile;
}

- (BOOL)isActiveSource
{
  return self->_isActiveSource;
}

- (unint64_t)options
{
  return self->_options;
}

@end