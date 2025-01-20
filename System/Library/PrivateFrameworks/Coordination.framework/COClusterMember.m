@interface COClusterMember
+ (BOOL)supportsSecureCoding;
+ (id)memberForCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMember:(id)a3;
- (BOOL)isSameDeviceAsMember:(id)a3;
- (BOOL)isStale;
- (COClusterMember)initWithCoder:(id)a3;
- (COClusterMember)initWithHomeKitIdentifier:(id)a3;
- (COClusterMember)initWithType:(unint64_t)a3 deviceMetadata:(id)a4;
- (NSDictionary)deviceMetadata;
- (RPCompanionLinkDevice)device;
- (id)IDSIdentifier;
- (id)description;
- (id)homeKitIdentifier;
- (unint64_t)hash;
- (unint64_t)memberType;
- (void)encodeWithCoder:(id)a3;
- (void)setDevice:(id)a3;
- (void)setStale:(BOOL)a3;
@end

@implementation COClusterMember

+ (id)memberForCurrentDevice
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"legacyIdentifier";
  v6[0] = &stru_26CDCB508;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v3 = [[COClusterMember alloc] initWithType:1 deviceMetadata:v2];

  return v3;
}

- (COClusterMember)initWithHomeKitIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COClusterMember;
  v5 = [(COClusterMember *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_memberType = 3;
    v12 = @"accessory";
    v7 = [v4 UUIDString];
    v13[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    deviceMetadata = v6->_deviceMetadata;
    v6->_deviceMetadata = (NSDictionary *)v8;
  }
  return v6;
}

- (COClusterMember)initWithType:(unint64_t)a3 deviceMetadata:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterMember;
  v7 = [(COClusterMember *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_memberType = a3;
    uint64_t v9 = [v6 copy];
    deviceMetadata = v8->_deviceMetadata;
    v8->_deviceMetadata = (NSDictionary *)v9;
  }
  return v8;
}

- (id)description
{
  v3 = [(COClusterMember *)self deviceMetadata];
  id v4 = [v3 description];

  v5 = [MEMORY[0x263F08708] newlineCharacterSet];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  v7 = [v6 componentsJoinedByString:&stru_26CDCB508];
  uint64_t v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  objc_super v11 = [v8 stringWithFormat:@"<%@: %p, type = %lu, metadata=%@>", v10, self, -[COClusterMember memberType](self, "memberType"), v7];

  return v11;
}

- (id)IDSIdentifier
{
  v2 = [(COClusterMember *)self deviceMetadata];
  v3 = [v2 objectForKey:@"IDS"];

  return v3;
}

- (id)homeKitIdentifier
{
  v2 = [(COClusterMember *)self deviceMetadata];
  v3 = [v2 objectForKey:@"accessory"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COClusterMember *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(COClusterMember *)self isEqualToMember:v4];
  }

  return v5;
}

- (BOOL)isEqualToMember:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(COClusterMember *)self memberType];
  if (v5 == [v4 memberType])
  {
    id v6 = [(COClusterMember *)self deviceMetadata];
    v7 = [v4 deviceMetadata];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = [(COClusterMember *)self isStale];
      int v9 = v8 ^ [v4 isStale] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)isSameDeviceAsMember:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(COClusterMember *)self deviceMetadata];
  id v6 = [v4 deviceMetadata];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(COClusterMember *)self deviceMetadata];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COClusterMember)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  if ([v4 containsValueForKey:@"deviceMetadata"])
  {
    v22 = v5;
    [v4 decodeObjectOfClasses:v8 forKey:@"deviceMetadata"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      char v13 = 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = [v9 objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
            char v13 = 0;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v11);
    }
    else
    {
      char v13 = 1;
    }

    int v18 = v13 & 1;
    unint64_t v5 = v22;
  }
  else
  {
    if (![v4 containsValueForKey:@"identifier"])
    {
      id v9 = 0;
      v19 = 0;
      goto LABEL_24;
    }
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v17 = (void *)v16;
    int v18 = v16 != 0;
    if (v16)
    {
      v27 = @"legacyIdentifier";
      uint64_t v28 = v16;
      id v9 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    }
    else
    {
      id v9 = 0;
    }
  }
  v19 = 0;
  if (v18 && v9)
  {
    self = -[COClusterMember initWithType:deviceMetadata:](self, "initWithType:deviceMetadata:", [v5 unsignedIntegerValue], v9);
    v19 = self;
  }
LABEL_24:
  v20 = v19;

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[COClusterMember memberType](self, "memberType"));
  [v8 encodeObject:v4 forKey:@"type"];
  unint64_t v5 = [(COClusterMember *)self deviceMetadata];
  [v8 encodeObject:v5 forKey:@"deviceMetadata"];

  id v6 = [(COClusterMember *)self deviceMetadata];
  uint64_t v7 = [v6 objectForKey:@"legacyIdentifier"];

  if (v7) {
    [v8 encodeObject:v7 forKey:@"identifier"];
  }
}

- (unint64_t)memberType
{
  return self->_memberType;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (void)setStale:(BOOL)a3
{
  self->_stale = a3;
}

- (NSDictionary)deviceMetadata
{
  return self->_deviceMetadata;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_deviceMetadata, 0);
}

@end