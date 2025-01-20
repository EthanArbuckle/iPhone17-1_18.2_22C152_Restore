@interface CRKFetchDevicesRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchDevicesRequest)initWithCoder:(id)a3;
- (NSArray)deviceIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIdentifiers:(id)a3;
@end

@implementation CRKFetchDevicesRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchDevicesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKFetchDevicesRequest;
  v5 = [(CATTaskRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"deviceIdentifiers"];
    deviceIdentifiers = v5->_deviceIdentifiers;
    v5->_deviceIdentifiers = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchDevicesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchDevicesRequest *)self deviceIdentifiers];
  [v4 encodeObject:v5 forKey:@"deviceIdentifiers"];
}

- (NSArray)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end