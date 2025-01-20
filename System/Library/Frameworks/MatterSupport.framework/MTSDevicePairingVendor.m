@interface MTSDevicePairingVendor
+ (BOOL)supportsSecureCoding;
+ (id)UUIDFromIdentifier:(id)a3;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (MTSDevicePairingVendor)initWithCoder:(id)a3;
- (MTSDevicePairingVendor)initWithIdentifier:(id)a3 displayName:(id)a4;
- (NSArray)attributeDescriptions;
- (NSNumber)identifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)shortDescription;
- (NSUUID)uuid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSDevicePairingVendor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(MTSDevicePairingVendor *)self identifier];
  v6 = (void *)[v4 initWithName:@"Identifier" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(MTSDevicePairingVendor *)self displayName];
  v9 = (void *)[v7 initWithName:@"Display Name" value:v8];
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

- (MTSDevicePairingVendor)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPV.ck.identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPV.ck.displayName"];
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
      _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ displayName: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(MTSDevicePairingVendor *)self initWithIdentifier:v5 displayName:v6];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSDevicePairingVendor *)self identifier];
  [v4 encodeObject:v5 forKey:@"MTSDPV.ck.identifier"];

  id v6 = [(MTSDevicePairingVendor *)self displayName];
  [v4 encodeObject:v6 forKey:@"MTSDPV.ck.displayName"];
}

- (unint64_t)hash
{
  v2 = [(MTSDevicePairingVendor *)self identifier];
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
    id v7 = [(MTSDevicePairingVendor *)self identifier];
    BOOL v8 = [v6 identifier];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(MTSDevicePairingVendor *)self displayName];
      v10 = [v6 displayName];
      char v11 = [v9 isEqualToString:v10];
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

- (MTSDevicePairingVendor)initWithIdentifier:(id)a3 displayName:(id)a4
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
    return (MTSDevicePairingVendor *)+[MTSDevicePairingVendor shortDescription];
  }
  v19.receiver = self;
  v19.super_class = (Class)MTSDevicePairingVendor;
  v9 = [(MTSDevicePairingVendor *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSNumber *)v10;

    uint64_t v12 = [v8 copy];
    displayName = v9->_displayName;
    v9->_displayName = (NSString *)v12;

    uint64_t v14 = +[MTSDevicePairingVendor UUIDFromIdentifier:v6];
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

+ (id)UUIDFromIdentifier:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"E2FA5931-1351-4518-AFD4-74218FDAA7AC"];
  uint64_t v6 = [v4 integerValue];

  uint64_t v10 = v6;
  id v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&v10 length:8];
  BOOL v8 = objc_msgSend(MEMORY[0x263F08C38], "hmf_UUIDWithNamespace:data:", v5, v7);

  return v8;
}

@end