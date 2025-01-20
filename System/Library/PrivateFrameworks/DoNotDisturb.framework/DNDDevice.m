@interface DNDDevice
+ (id)currentDevice;
+ (id)deviceWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)frameworkVersion;
- (BOOL)isEqual:(id)a3;
- (DNDDevice)initWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4 frameworkVersion:(id *)a5;
- (id)description;
- (unint64_t)deviceCapabilities;
- (unint64_t)deviceClass;
- (unint64_t)hash;
@end

@implementation DNDDevice

+ (id)currentDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__DNDDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, block);
  }
  v2 = (void *)currentDevice_device;
  return v2;
}

void __26__DNDDevice_currentDevice__block_invoke(uint64_t a1)
{
  int v2 = MGGetSInt32Answer();
  uint64_t v3 = DNDDeviceClassFromMGDeviceClass(v2);
  unsigned int v4 = MGGetBoolAnswer();
  if (_DNDCurrentFrameworkVersion_onceToken != -1) {
    dispatch_once(&_DNDCurrentFrameworkVersion_onceToken, &__block_literal_global_2);
  }
  long long v10 = _DNDCurrentFrameworkVersion_currentVersion;
  uint64_t v11 = qword_1EB502100;
  id v5 = objc_alloc(*(Class *)(a1 + 32));
  long long v8 = v10;
  uint64_t v9 = v11;
  uint64_t v6 = [v5 initWithClass:v3 deviceCapabilities:v4 frameworkVersion:&v8];
  v7 = (void *)currentDevice_device;
  currentDevice_device = v6;
}

+ (id)deviceWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4
{
  memset(v6, 0, sizeof(v6));
  unsigned int v4 = (void *)[objc_alloc((Class)a1) initWithClass:a3 deviceCapabilities:a4 frameworkVersion:v6];
  return v4;
}

- (DNDDevice)initWithClass:(unint64_t)a3 deviceCapabilities:(unint64_t)a4 frameworkVersion:(id *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)DNDDevice;
  result = [(DNDDevice *)&v10 init];
  if (result)
  {
    result->_deviceClass = a3;
    result->_deviceCapabilities = a4;
    long long v9 = *(_OWORD *)&a5->var0;
    result->_frameworkVersion.patchVersion = a5->var2;
    *(_OWORD *)&result->_frameworkVersion.majorVersion = v9;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDDevice *)self deviceClass];
  unint64_t v4 = [(DNDDevice *)self deviceCapabilities] ^ v3;
  [(DNDDevice *)self frameworkVersion];
  id v5 = DNDStringFromOperatingSystemVersion(v8);
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (DNDDevice *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(DNDDevice *)self deviceClass];
      if (v6 == [(DNDDevice *)v5 deviceClass]
        && (unint64_t v7 = [(DNDDevice *)self deviceCapabilities],
            v7 == [(DNDDevice *)v5 deviceCapabilities]))
      {
        [(DNDDevice *)self frameworkVersion];
        long long v8 = DNDStringFromOperatingSystemVersion(v21);
        if (v5) {
          [(DNDDevice *)v5 frameworkVersion];
        }
        else {
          memset(v20, 0, sizeof(v20));
        }
        objc_super v10 = DNDStringFromOperatingSystemVersion(v20);
        if (v8 == v10)
        {
          char v9 = 1;
        }
        else
        {
          [(DNDDevice *)self frameworkVersion];
          uint64_t v11 = DNDStringFromOperatingSystemVersion(v19);
          if (v11)
          {
            if (v5) {
              [(DNDDevice *)v5 frameworkVersion];
            }
            else {
              memset(v18, 0, sizeof(v18));
            }
            v12 = DNDStringFromOperatingSystemVersion(v18);
            if (v12)
            {
              [(DNDDevice *)self frameworkVersion];
              v13 = DNDStringFromOperatingSystemVersion(v17);
              if (v5) {
                [(DNDDevice *)v5 frameworkVersion];
              }
              else {
                memset(v16, 0, sizeof(v16));
              }
              v14 = DNDStringFromOperatingSystemVersion(v16);
              char v9 = [v13 isEqual:v14];
            }
            else
            {
              char v9 = 0;
            }
          }
          else
          {
            char v9 = 0;
          }
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = DNDStringFromDeviceClass([(DNDDevice *)self deviceClass]);
  unint64_t v6 = DNDStringFromDeviceCapabilities([(DNDDevice *)self deviceCapabilities]);
  [(DNDDevice *)self frameworkVersion];
  unint64_t v7 = DNDStringFromOperatingSystemVersion(v10);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; deviceClass: %@; deviceCapabilities: %@; frameworkVersion: %@>",
    v4,
    self,
    v5,
    v6,
  long long v8 = v7);

  return v8;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (unint64_t)deviceCapabilities
{
  return self->_deviceCapabilities;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)frameworkVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[1];
  return self;
}

@end