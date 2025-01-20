@interface CTRemoteDeviceList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTRemoteDeviceList)initWithCoder:(id)a3;
- (NSMutableArray)devices;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation CTRemoteDeviceList

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTRemoteDeviceList *)self devices];
  [v3 appendFormat:@", devices=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTRemoteDeviceList *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTRemoteDeviceList *)self devices];
      v6 = [(CTRemoteDeviceList *)v4 devices];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        v7 = [(CTRemoteDeviceList *)self devices];
        v8 = [(CTRemoteDeviceList *)v4 devices];
        char v9 = [v7 isEqual:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTRemoteDeviceList *)self devices];
  [v4 encodeObject:v5 forKey:@"devices"];
}

- (CTRemoteDeviceList)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTRemoteDeviceList;
  id v5 = [(CTRemoteDeviceList *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"devices"];
    devices = v5->_devices;
    v5->_devices = (NSMutableArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end