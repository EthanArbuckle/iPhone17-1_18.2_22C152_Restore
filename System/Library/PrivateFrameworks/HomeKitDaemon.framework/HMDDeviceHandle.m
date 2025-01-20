@interface HMDDeviceHandle
+ (BOOL)supportsSecureCoding;
+ (id)deviceHandleForDestination:(id)a3;
+ (id)deviceHandleForDeviceIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobal;
- (BOOL)isLocal;
- (BOOL)matchesPushToken:(id)a3;
- (HMDAccountHandle)accountHandle;
- (HMDDeviceHandle)init;
- (HMDDeviceHandle)initWithCoder:(id)a3;
- (HMDDeviceHandle)initWithInternal:(id)a3;
- (NSData)pushToken;
- (NSString)destination;
- (NSUUID)identifier;
- (_HMDDeviceHandle)internal;
- (id)attributeDescriptions;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDDeviceHandle

void __39___HMDDeviceHandle_identifierNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"A08F6CA5-EC1E-4DD6-A068-377BA45247B6"];
  v1 = (void *)identifierNamespace_namespace;
  identifierNamespace_namespace = v0;
}

- (void).cxx_destruct
{
}

- (_HMDDeviceHandle)internal
{
  return self->_internal;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDDeviceHandle *)self internal];
  [v4 encodeObject:v5 forKey:@"HM.internal"];
}

- (HMDDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.internal"];

  v6 = [(HMDDeviceHandle *)self initWithInternal:v5];
  return v6;
}

- (BOOL)matchesPushToken:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDDeviceHandle *)self internal];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v7 pushToken];
    char v9 = [v8 isEqualToData:v4];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSData)pushToken
{
  v2 = [(HMDDeviceHandle *)self internal];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = [v4 pushToken];
  }
  else
  {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (NSString)destination
{
  v2 = [(HMDDeviceHandle *)self internal];
  v3 = [v2 destination];

  return (NSString *)v3;
}

- (HMDAccountHandle)accountHandle
{
  v2 = [(HMDDeviceHandle *)self internal];
  v3 = [v2 accountHandle];

  return (HMDAccountHandle *)v3;
}

- (BOOL)isGlobal
{
  v2 = [(HMDDeviceHandle *)self internal];
  char v3 = [v2 isGlobal];

  return v3;
}

- (BOOL)isLocal
{
  v2 = [(HMDDeviceHandle *)self internal];
  char v3 = [v2 isLocal];

  return v3;
}

- (NSUUID)identifier
{
  v2 = [(HMDDeviceHandle *)self internal];
  char v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDDeviceHandle *)self identifier];
  id v5 = [v4 UUIDString];
  v6 = (void *)[v3 initWithName:@"Identifier" value:v5];
  v18[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  if ([(HMDDeviceHandle *)self isGlobal]) {
    v8 = @"Global";
  }
  else {
    v8 = @"Local";
  }
  char v9 = (void *)[v7 initWithName:@"Type" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDDeviceHandle *)self internal];
  v12 = (void *)[v10 initWithName:@"Value" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = [(HMDDeviceHandle *)self accountHandle];
  v15 = (void *)[v13 initWithName:@"Account Handle" value:v14 options:1 formatter:0];
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDDeviceHandle *)self identifier];
  v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDDeviceHandle *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      id v7 = [(HMDDeviceHandle *)self internal];
      v8 = [(HMDDeviceHandle *)v6 internal];
      char v9 = [v7 isEqual:v8];
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
  v2 = [(HMDDeviceHandle *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDDeviceHandle)initWithInternal:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDDeviceHandle;
    id v5 = [(HMDDeviceHandle *)&v14 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      internal = v5->_internal;
      v5->_internal = (_HMDDeviceHandle *)v6;
    }
    v8 = v5;
    char v9 = v8;
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing internal parameter", buf, 0xCu);
    }
    char v9 = 0;
  }

  return v9;
}

- (HMDDeviceHandle)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deviceHandleForDeviceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[_HMDLocalDeviceHandle alloc] initWithDeviceIdentifier:v3];

  if (v4) {
    id v5 = [[HMDDeviceHandle alloc] initWithInternal:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)deviceHandleForDestination:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v13;
      objc_super v14 = "%{public}@Invalid destination, nil";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 12;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v19, v17);
    }
LABEL_12:

    goto LABEL_13;
  }
  id v5 = (void *)IDSCopyAddressDestinationForDestination();

  if (!v5)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      objc_super v14 = "%{public}@Invalid device destination: %@";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      uint32_t v17 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v6 = &off_264A13540;
  if (+[_HMDLocalDeviceHandle isValidDestination:v4]
    || (uint64_t v6 = off_264A13538,
        +[_HMDGlobalDeviceHandle isValidDestination:v4]))
  {
    uint64_t v7 = [objc_alloc(*v6) initWithDestination:v4];
    if (v7)
    {
      v8 = (void *)v7;
      char v9 = [[HMDDeviceHandle alloc] initWithInternal:v7];

      goto LABEL_14;
    }
  }
LABEL_13:
  char v9 = 0;
LABEL_14:

  return v9;
}

@end