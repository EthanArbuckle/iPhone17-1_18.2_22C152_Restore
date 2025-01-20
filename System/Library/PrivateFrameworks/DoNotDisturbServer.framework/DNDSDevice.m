@interface DNDSDevice
+ (id)currentDevice;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)_initWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4 identifier:(id)a5 frameworkVersion:(id *)a6;
- (id)description;
- (unint64_t)hash;
@end

@implementation DNDSDevice

+ (id)currentDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__DNDSDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, block);
  }
  v2 = (void *)currentDevice_device;
  return v2;
}

void __27__DNDSDevice_currentDevice__block_invoke(uint64_t a1)
{
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___DNDSDevice;
  v2 = objc_msgSendSuper2(&v10, sel_currentDevice);
  v3 = (void *)IDSCopyLocalDeviceUniqueID();
  id v4 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v5 = [v2 deviceClass];
  uint64_t v6 = [v2 deviceCapabilities];
  if (v2) {
    [v2 frameworkVersion];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  uint64_t v7 = [v4 _initWithClass:v5 deviceCapabilities:v6 identifier:v3 frameworkVersion:v9];
  v8 = (void *)currentDevice_device;
  currentDevice_device = v7;
}

- (id)_initWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4 identifier:(id)a5 frameworkVersion:(id *)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DNDSDevice;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v15 = *a6;
  v11 = [(DNDDevice *)&v16 initWithClass:a3 deviceCapabilities:a4 frameworkVersion:&v15];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;
  }
  return v11;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)DNDSDevice;
  unint64_t v3 = [(DNDDevice *)&v7 hash];
  id v4 = [(DNDSDevice *)self identifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSDevice *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDSDevice;
      if ([(DNDDevice *)&v14 isEqual:v5])
      {
        uint64_t v6 = [(DNDSDevice *)self identifier];
        objc_super v7 = [(DNDSDevice *)v5 identifier];
        if (v6 == v7)
        {
          char v12 = 1;
        }
        else
        {
          v8 = [(DNDSDevice *)self identifier];
          if (v8)
          {
            v9 = [(DNDSDevice *)v5 identifier];
            if (v9)
            {
              id v10 = [(DNDSDevice *)self identifier];
              v11 = [(DNDSDevice *)v5 identifier];
              char v12 = [v10 isEqual:v11];
            }
            else
            {
              char v12 = 0;
            }
          }
          else
          {
            char v12 = 0;
          }
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(DNDDevice *)self deviceClass];
  unint64_t v5 = DNDStringFromDeviceClass();
  [(DNDDevice *)self deviceCapabilities];
  uint64_t v6 = DNDStringFromDeviceCapabilities();
  objc_super v7 = [(DNDSDevice *)self identifier];
  [(DNDDevice *)self frameworkVersion];
  v8 = DNDStringFromOperatingSystemVersion();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; deviceClass: %@; deviceCapabilities: %@; identifier: %@; frameworkVersion: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  v9 = v8);

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end