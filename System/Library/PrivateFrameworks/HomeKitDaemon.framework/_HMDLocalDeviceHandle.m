@interface _HMDLocalDeviceHandle
+ (BOOL)isValidDestination:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (NSUUID)deviceIdentifier;
- (_HMDLocalDeviceHandle)initWithCoder:(id)a3;
- (_HMDLocalDeviceHandle)initWithDestination:(id)a3;
- (_HMDLocalDeviceHandle)initWithDeviceIdentifier:(id)a3;
- (id)description;
- (id)destination;
- (id)privateDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDLocalDeviceHandle

- (void).cxx_destruct
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HMDLocalDeviceHandle;
  id v4 = a3;
  [(_HMDDeviceHandle *)&v6 encodeWithCoder:v4];
  v5 = [(_HMDLocalDeviceHandle *)self deviceIdentifier];
  [v4 encodeObject:v5 forKey:@"HM.deviceID"];
}

- (_HMDLocalDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDLocalDeviceHandle;
  v5 = [(_HMDDeviceHandle *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.deviceID"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSUUID *)v6;
  }
  return v5;
}

- (id)destination
{
  v2 = [(_HMDLocalDeviceHandle *)self deviceIdentifier];
  v3 = [v2 UUIDString];
  id v4 = [@"device:" stringByAppendingString:v3];

  return v4;
}

- (BOOL)isLocal
{
  return 1;
}

- (id)privateDescription
{
  v3 = [MEMORY[0x263F42610] defaultFormatter];
  id v4 = [(_HMDLocalDeviceHandle *)self description];
  v5 = [v3 privateStringForObjectValue:v4];

  return v5;
}

- (id)description
{
  v2 = [(_HMDLocalDeviceHandle *)self deviceIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMDLocalDeviceHandle *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      v7 = [(_HMDLocalDeviceHandle *)self deviceIdentifier];
      v8 = [(_HMDLocalDeviceHandle *)v6 deviceIdentifier];
      char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(_HMDLocalDeviceHandle *)self deviceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (_HMDLocalDeviceHandle)initWithDestination:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v25 = 0;
    uint64_t v6 = __parseLocalDestination(v4, &v25);
    id v7 = v25;
    if (v6)
    {
      id v8 = objc_alloc(MEMORY[0x263F08C38]);
      char v9 = +[_HMDDeviceHandle identifierNamespace];
      v10 = [v5 dataUsingEncoding:4];
      v11 = (void *)[v8 initWithNamespace:v9 data:v10];

      v24.receiver = self;
      v24.super_class = (Class)_HMDLocalDeviceHandle;
      v12 = [(_HMDDeviceHandle *)&v24 initWithIdentifier:v11];
      if (v12)
      {
        uint64_t v13 = [v6 copy];
        deviceIdentifier = v12->_deviceIdentifier;
        v12->_deviceIdentifier = (NSUUID *)v13;
      }
      v15 = v12;

      v16 = v15;
    }
    else
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v27 = v22;
        __int16 v28 = 2112;
        v29 = v5;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse destination, %@, with error: %@", buf, 0x20u);
      }
      v16 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing destination parameter", buf, 0xCu);
    }
    v16 = 0;
  }

  return v16;
}

- (_HMDLocalDeviceHandle)initWithDeviceIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 UUIDString];
    id v7 = [@"device:" stringByAppendingString:v6];

    id v8 = [(_HMDLocalDeviceHandle *)self initWithDestination:v7];
    char v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing device identifier parameter", (uint8_t *)&v14, 0xCu);
    }
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isValidDestination:(id)a3
{
  unint64_t v3 = __parseLocalDestination(a3, 0);
  BOOL v4 = v3 != 0;

  return v4;
}

@end