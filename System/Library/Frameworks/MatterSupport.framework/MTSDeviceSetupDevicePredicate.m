@interface MTSDeviceSetupDevicePredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSDeviceSetupDevicePredicate)initWithCoder:(id)a3;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)serialNumber;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProductID:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation MTSDeviceSetupDevicePredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSDeviceSetupDevicePredicate *)self uuid];
  [v4 encodeObject:v5 forKey:@"MTSDSDP.uuid"];

  v6 = [(MTSDeviceSetupDevicePredicate *)self serialNumber];
  [v4 encodeObject:v6 forKey:@"MTSDSDP.serialNumber"];

  v7 = [(MTSDeviceSetupDevicePredicate *)self productID];
  [v4 encodeObject:v7 forKey:@"MTSDSDP.productID"];

  id v8 = [(MTSDeviceSetupDevicePredicate *)self vendorID];
  [v4 encodeObject:v8 forKey:@"MTSDSDP.vendorID"];
}

- (MTSDeviceSetupDevicePredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDSDP.uuid"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDSDP.serialNumber"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDSDP.productID"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDSDP.vendorID"];

  v9 = [(MTSDeviceSetupDevicePredicate *)self init];
  [(MTSDeviceSetupDevicePredicate *)v9 setUuid:v5];
  [(MTSDeviceSetupDevicePredicate *)v9 setSerialNumber:v6];
  [(MTSDeviceSetupDevicePredicate *)v9 setProductID:v7];
  [(MTSDeviceSetupDevicePredicate *)v9 setVendorID:v8];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(MTSDeviceSetupDevicePredicate *)self uuid];
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
  if (!v6) {
    goto LABEL_9;
  }
  v7 = [(MTSDeviceSetupDevicePredicate *)self uuid];
  id v8 = [v6 uuid];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_9;
  }
  v10 = [(MTSDeviceSetupDevicePredicate *)self serialNumber];
  v11 = [v6 serialNumber];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_9;
  }
  v13 = [(MTSDeviceSetupDevicePredicate *)self vendorID];
  v14 = [v6 vendorID];
  int v15 = HMFEqualObjects();

  if (v15)
  {
    v16 = [(MTSDeviceSetupDevicePredicate *)self productID];
    v17 = [v6 productID];
    char v18 = HMFEqualObjects();
  }
  else
  {
LABEL_9:
    char v18 = 0;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MTSDeviceSetupDevicePredicate);
  v5 = [(MTSDeviceSetupDevicePredicate *)self uuid];
  [(MTSDeviceSetupDevicePredicate *)v4 setUuid:v5];

  id v6 = [(MTSDeviceSetupDevicePredicate *)self serialNumber];
  [(MTSDeviceSetupDevicePredicate *)v4 setSerialNumber:v6];

  v7 = [(MTSDeviceSetupDevicePredicate *)self vendorID];
  [(MTSDeviceSetupDevicePredicate *)v4 setVendorID:v7];

  id v8 = [(MTSDeviceSetupDevicePredicate *)self productID];
  [(MTSDeviceSetupDevicePredicate *)v4 setProductID:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end