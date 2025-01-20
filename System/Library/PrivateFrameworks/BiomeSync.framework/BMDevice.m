@interface BMDevice
+ (BOOL)supportsSecureCoding;
- (BMDevice)initWithCoder:(id)a3;
- (BMDevice)initWithDeviceIdentifier:(id)a3 idsDeviceIdentifier:(id)a4 name:(id)a5 model:(id)a6 platform:(int64_t)a7;
- (NSString)deviceIdentifier;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (id)description;
- (int64_t)platform;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDevice

- (BMDevice)initWithDeviceIdentifier:(id)a3 idsDeviceIdentifier:(id)a4 name:(id)a5 model:(id)a6 platform:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMDevice;
  v17 = [(BMDevice *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deviceIdentifier, a3);
    objc_storeStrong((id *)&v18->_idsDeviceIdentifier, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_model, a6);
    v18->_platform = a7;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(BMDevice *)self deviceIdentifier];
  [v8 encodeObject:v4 forKey:@"deviceIdentifier"];

  v5 = [(BMDevice *)self idsDeviceIdentifier];
  [v8 encodeObject:v5 forKey:@"idsDeviceIdentifier"];

  v6 = [(BMDevice *)self name];
  [v8 encodeObject:v6 forKey:@"name"];

  v7 = [(BMDevice *)self model];
  [v8 encodeObject:v7 forKey:@"model"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[BMDevice platform](self, "platform"), @"platform");
}

- (BMDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsDeviceIdentifier"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    if (v8)
    {
      self = -[BMDevice initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:](self, "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v5, v6, v7, v8, [v4 decodeIntegerForKey:@"platform"]);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  v2 = NSString;
  deviceIdentifier = self->_deviceIdentifier;
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  model = self->_model;
  v6 = [NSNumber numberWithInteger:self->_platform];
  v7 = [v2 stringWithFormat:@"identifier: %@ idsIdentifier: %@ model: %@ platform: %@", deviceIdentifier, idsDeviceIdentifier, model, v6];

  return v7;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (int64_t)platform
{
  return self->_platform;
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end