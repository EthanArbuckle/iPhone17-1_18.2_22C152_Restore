@interface MTSDevicePairingEcosystem
+ (BOOL)supportsSecureCoding;
+ (id)UUIDFromRootPublicKey:(id)a3 vendor:(id)a4;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (MTSDevicePairingEcosystem)initWithCoder:(id)a3;
- (MTSDevicePairingEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4;
- (MTSDevicePairingVendor)vendor;
- (NSArray)attributeDescriptions;
- (NSData)rootPublicKey;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)uuid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSDevicePairingEcosystem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MTSDevicePairingVendor)vendor
{
  return (MTSDevicePairingVendor *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(MTSDevicePairingEcosystem *)self rootPublicKey];
  v6 = (void *)[v4 initWithName:@"Root Public Key" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(MTSDevicePairingEcosystem *)self vendor];
  v9 = (void *)[v7 initWithName:@"Vendor" value:v8];
  [v3 addObject:v9];

  v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (MTSDevicePairingEcosystem)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPE.ck.rootPublicKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPE.ck.vendor"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x245697870]();
    v12 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded rootPublicKey: %@ vendor: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(MTSDevicePairingEcosystem *)self initWithRootPublicKey:v5 vendor:v6];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSDevicePairingEcosystem *)self rootPublicKey];
  [v4 encodeObject:v5 forKey:@"MTSDPE.ck.rootPublicKey"];

  id v6 = [(MTSDevicePairingEcosystem *)self vendor];
  [v4 encodeObject:v6 forKey:@"MTSDPE.ck.vendor"];
}

- (unint64_t)hash
{
  v2 = [(MTSDevicePairingEcosystem *)self rootPublicKey];
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
  if (v6)
  {
    id v7 = [(MTSDevicePairingEcosystem *)self rootPublicKey];
    BOOL v8 = [v6 rootPublicKey];
    if ([v7 isEqualToData:v8])
    {
      v9 = [(MTSDevicePairingEcosystem *)self vendor];
      v10 = [v6 vendor];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (MTSDevicePairingEcosystem)initWithRootPublicKey:(id)a3 vendor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  BOOL v8 = v7;
  if (!v7)
  {
LABEL_7:
    __int16 v17 = (void *)_HMFPreconditionFailure();
    return (MTSDevicePairingEcosystem *)+[MTSDevicePairingEcosystem shortDescription];
  }
  v19.receiver = self;
  v19.super_class = (Class)MTSDevicePairingEcosystem;
  v9 = [(MTSDevicePairingEcosystem *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    rootPublicKey = v9->_rootPublicKey;
    v9->_rootPublicKey = (NSData *)v10;

    uint64_t v12 = [v8 copy];
    vendor = v9->_vendor;
    v9->_vendor = (MTSDevicePairingVendor *)v12;

    uint64_t v14 = +[MTSDevicePairingEcosystem UUIDFromRootPublicKey:v6 vendor:v8];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v14;
  }
  return v9;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)UUIDFromRootPublicKey:(id)a3 vendor:(id)a4
{
  v5 = (void *)MEMORY[0x263F08C38];
  id v6 = a3;
  id v7 = [a4 uuid];
  BOOL v8 = objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v7, v6);

  return v8;
}

@end