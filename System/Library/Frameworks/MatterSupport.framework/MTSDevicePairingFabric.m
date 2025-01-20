@interface MTSDevicePairingFabric
+ (BOOL)supportsSecureCoding;
+ (id)UUIDFromIdentifier:(id)a3 ecosystem:(id)a4;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (MTSDevicePairingEcosystem)ecosystem;
- (MTSDevicePairingFabric)initWithCoder:(id)a3;
- (MTSDevicePairingFabric)initWithIdentifier:(id)a3 displayName:(id)a4 ecosystem:(id)a5;
- (MTSDevicePairingFabric)initWithIdentifier:(id)a3 index:(id)a4 displayName:(id)a5 ecosystem:(id)a6;
- (NSArray)attributeDescriptions;
- (NSNumber)identifier;
- (NSNumber)index;
- (NSString)description;
- (NSString)displayName;
- (NSString)shortDescription;
- (NSUUID)uuid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSDevicePairingFabric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecosystem, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MTSDevicePairingEcosystem)ecosystem
{
  return (MTSDevicePairingEcosystem *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
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
  v5 = [(MTSDevicePairingFabric *)self identifier];
  v6 = (void *)[v4 initWithName:@"Identifier" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(MTSDevicePairingFabric *)self index];
  v9 = (void *)[v7 initWithName:@"Index" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(MTSDevicePairingFabric *)self displayName];
  v12 = (void *)[v10 initWithName:@"Display Name" value:v11];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = [(MTSDevicePairingFabric *)self ecosystem];
  v15 = (void *)[v13 initWithName:@"Ecosystem" value:v14];
  [v3 addObject:v15];

  v16 = (void *)[v3 copy];

  return (NSArray *)v16;
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

- (MTSDevicePairingFabric)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPF.ck.identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPF.ck.index"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPF.ck.displayName"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDPF.ck.ecosystem"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0 || v8 == 0)
  {
    id v13 = (void *)MEMORY[0x245697870]();
    v16 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v19 = 138544386;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2112;
      v24 = v6;
      __int16 v25 = 2112;
      v26 = v7;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_2450FD000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ index: %@ displayName: %@ ecosystem: %@", (uint8_t *)&v19, 0x34u);
    }
    v17 = 0;
  }
  else
  {
    v16 = [(MTSDevicePairingFabric *)self initWithIdentifier:v5 index:v6 displayName:v7 ecosystem:v8];
    v17 = v16;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSDevicePairingFabric *)self identifier];
  [v4 encodeObject:v5 forKey:@"MTSDPF.ck.identifier"];

  v6 = [(MTSDevicePairingFabric *)self index];
  [v4 encodeObject:v6 forKey:@"MTSDPF.ck.index"];

  id v7 = [(MTSDevicePairingFabric *)self displayName];
  [v4 encodeObject:v7 forKey:@"MTSDPF.ck.displayName"];

  id v8 = [(MTSDevicePairingFabric *)self ecosystem];
  [v4 encodeObject:v8 forKey:@"MTSDPF.ck.ecosystem"];
}

- (unint64_t)hash
{
  v2 = [(MTSDevicePairingFabric *)self identifier];
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
    id v7 = [(MTSDevicePairingFabric *)self identifier];
    id v8 = [v6 identifier];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(MTSDevicePairingFabric *)self index];
      BOOL v10 = [v6 index];
      if ([v9 isEqualToNumber:v10])
      {
        v11 = [(MTSDevicePairingFabric *)self displayName];
        v12 = [v6 displayName];
        if ([v11 isEqualToString:v12])
        {
          v16 = [(MTSDevicePairingFabric *)self ecosystem];
          id v13 = [v6 ecosystem];
          char v14 = [v16 isEqual:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (MTSDevicePairingFabric)initWithIdentifier:(id)a3 displayName:(id)a4 ecosystem:(id)a5
{
  return [(MTSDevicePairingFabric *)self initWithIdentifier:a3 index:&unk_26F9D5098 displayName:a4 ecosystem:a5];
}

- (MTSDevicePairingFabric)initWithIdentifier:(id)a3 index:(id)a4 displayName:(id)a5 ecosystem:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  char v14 = v13;
  if (!v13)
  {
LABEL_11:
    __int16 v27 = (void *)_HMFPreconditionFailure();
    return (MTSDevicePairingFabric *)+[MTSDevicePairingFabric shortDescription];
  }
  v29.receiver = self;
  v29.super_class = (Class)MTSDevicePairingFabric;
  v15 = [(MTSDevicePairingFabric *)&v29 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSNumber *)v16;

    uint64_t v18 = [v11 copy];
    index = v15->_index;
    v15->_index = (NSNumber *)v18;

    uint64_t v20 = [v12 copy];
    displayName = v15->_displayName;
    v15->_displayName = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    ecosystem = v15->_ecosystem;
    v15->_ecosystem = (MTSDevicePairingEcosystem *)v22;

    uint64_t v24 = +[MTSDevicePairingFabric UUIDFromIdentifier:v10 ecosystem:v14];
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v24;
  }
  return v15;
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

+ (id)UUIDFromIdentifier:(id)a3 ecosystem:(id)a4
{
  id v5 = a4;
  uint64_t v11 = [a3 integerValue];
  id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&v11 length:8];
  id v7 = (void *)MEMORY[0x263F08C38];
  id v8 = [v5 uuid];

  v9 = objc_msgSend(v7, "hmf_UUIDWithNamespace:data:", v8, v6);

  return v9;
}

@end