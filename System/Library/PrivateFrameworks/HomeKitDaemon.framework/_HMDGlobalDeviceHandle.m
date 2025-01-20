@interface _HMDGlobalDeviceHandle
+ (BOOL)isValidDestination:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobal;
- (HMDAccountHandle)accountHandle;
- (NSData)pushToken;
- (_HMDGlobalDeviceHandle)initWithCoder:(id)a3;
- (_HMDGlobalDeviceHandle)initWithDestination:(id)a3;
- (_HMDGlobalDeviceHandle)initWithPushToken:(id)a3 accountHandle:(id)a4;
- (id)description;
- (id)destination;
- (id)privateDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDGlobalDeviceHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_HMDGlobalDeviceHandle;
  id v4 = a3;
  [(_HMDDeviceHandle *)&v7 encodeWithCoder:v4];
  v5 = [(_HMDGlobalDeviceHandle *)self pushToken];
  [v4 encodeObject:v5 forKey:@"HM.token"];

  v6 = [(_HMDGlobalDeviceHandle *)self accountHandle];
  [v4 encodeObject:v6 forKey:@"HM.account"];
}

- (_HMDGlobalDeviceHandle)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.token"];
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)_HMDGlobalDeviceHandle;
    v6 = [(_HMDDeviceHandle *)&v16 initWithCoder:v4];
    objc_super v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_pushToken, v5);
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.account"];
      accountHandle = v7->_accountHandle;
      v7->_accountHandle = (HMDAccountHandle *)v8;
    }
    v10 = v7;
    v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = @"HM.token";
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing required object for key '%@'", buf, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)destination
{
  v3 = [(_HMDGlobalDeviceHandle *)self pushToken];
  id v4 = [(_HMDGlobalDeviceHandle *)self accountHandle];
  v5 = [v4 URI];
  v6 = [v5 prefixedURI];
  objc_super v7 = (void *)MEMORY[0x230FBC270](v3, v6);

  return v7;
}

- (BOOL)isGlobal
{
  return 1;
}

- (id)privateDescription
{
  v3 = [MEMORY[0x263F42610] defaultFormatter];
  id v4 = [(_HMDGlobalDeviceHandle *)self description];
  v5 = [v3 privateStringForObjectValue:v4];

  return v5;
}

- (id)description
{
  v2 = [(_HMDGlobalDeviceHandle *)self pushToken];
  v3 = objc_msgSend(v2, "hmf_hexadecimalStringWithOptions:", 0);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMDGlobalDeviceHandle *)a3;
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
    v6 = v5;
    if (v6)
    {
      objc_super v7 = [(_HMDGlobalDeviceHandle *)self pushToken];
      uint64_t v8 = [(_HMDGlobalDeviceHandle *)v6 pushToken];
      char v9 = [v7 isEqualToData:v8];
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
  v2 = [(_HMDGlobalDeviceHandle *)self pushToken];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (_HMDGlobalDeviceHandle)initWithDestination:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v28 = 0;
    id v29 = 0;
    id v26 = 0;
    id v27 = 0;
    char v6 = __parseGlobalDestination(v4, &v29, &v28, &v27, &v26);
    id v7 = v29;
    id v8 = v28;
    id v9 = v27;
    id v10 = v26;
    if (v6)
    {
      v25.receiver = self;
      v25.super_class = (Class)_HMDGlobalDeviceHandle;
      v11 = [(_HMDDeviceHandle *)&v25 initWithIdentifier:v7];
      if (v11)
      {
        uint64_t v12 = [v8 copy];
        pushToken = v11->_pushToken;
        v11->_pushToken = (NSData *)v12;

        uint64_t v14 = [v9 copy];
        accountHandle = v11->_accountHandle;
        v11->_accountHandle = (HMDAccountHandle *)v14;
      }
      objc_super v16 = v11;
      v17 = v16;
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x230FBD990]();
      objc_super v16 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        __int16 v32 = 2112;
        v33 = v5;
        __int16 v34 = 2112;
        id v35 = v10;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse destination, %@, with error: %@", buf, 0x20u);
      }
      v17 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    objc_super v16 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Missing destination parameter", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (_HMDGlobalDeviceHandle)initWithPushToken:(id)a3 accountHandle:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [v7 URI];
    id v10 = [v9 prefixedURI];
    v11 = (void *)MEMORY[0x230FBC270](v6, v10);

    uint64_t v12 = [(_HMDGlobalDeviceHandle *)self initWithDestination:v11];
    v13 = v12;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_super v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      __int16 v19 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Missing push token parameter", (uint8_t *)&v18, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isValidDestination:(id)a3
{
  return __parseGlobalDestination(a3, 0, 0, 0, 0);
}

@end