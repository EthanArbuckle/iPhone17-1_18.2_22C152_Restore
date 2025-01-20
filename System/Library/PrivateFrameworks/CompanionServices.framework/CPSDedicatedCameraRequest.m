@interface CPSDedicatedCameraRequest
+ (BOOL)supportsSecureCoding;
- (CPSDedicatedCameraRequest)initWithCoder:(id)a3;
- (NSString)deviceName;
- (id)description;
- (int64_t)authType;
- (int64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceType:(int64_t)a3;
@end

@implementation CPSDedicatedCameraRequest

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInteger:self->_deviceType withName:@"deviceType"];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  v5 = [v3 build];

  return v5;
}

- (int64_t)authType
{
  return 14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPSDedicatedCameraRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceName, @"deviceName", v6.receiver, v6.super_class);
  v5 = [NSNumber numberWithInteger:self->_deviceType];
  [v4 encodeObject:v5 forKey:@"deviceType"];
}

- (CPSDedicatedCameraRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSDedicatedCameraRequest;
  v5 = [(CPSAuthenticationRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    v9 = self;
    v10 = [v4 decodeObjectOfClass:v9 forKey:@"deviceType"];
    v5->_deviceType = [v10 integerValue];
  }
  return v5;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
}

@end