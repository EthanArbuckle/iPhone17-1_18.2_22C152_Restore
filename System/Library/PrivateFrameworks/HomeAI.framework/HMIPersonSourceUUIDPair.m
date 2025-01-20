@interface HMIPersonSourceUUIDPair
+ (BOOL)supportsSecureCoding;
+ (id)personSourceUUIDPairFromPersonLink:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMIPersonSourceUUIDPair)initWithCoder:(id)a3;
- (HMIPersonSourceUUIDPair)initWithPersonUUID:(id)a3 sourceUUID:(id)a4;
- (HMIPersonSourceUUIDPair)initWithUUIDPairString:(id)a3;
- (NSString)UUIDPairString;
- (NSUUID)personUUID;
- (NSUUID)sourceUUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIPersonSourceUUIDPair

- (HMIPersonSourceUUIDPair)initWithPersonUUID:(id)a3 sourceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIPersonSourceUUIDPair;
  v8 = [(HMIPersonSourceUUIDPair *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    personUUID = v8->_personUUID;
    v8->_personUUID = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    sourceUUID = v8->_sourceUUID;
    v8->_sourceUUID = (NSUUID *)v11;
  }
  return v8;
}

- (HMIPersonSourceUUIDPair)initWithUUIDPairString:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"_"];
  if ([v4 count] == 2)
  {
    id v5 = objc_alloc(MEMORY[0x263F08C38]);
    id v6 = [v4 firstObject];
    id v7 = (void *)[v5 initWithUUIDString:v6];

    id v8 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v9 = [v4 lastObject];
    v10 = (void *)[v8 initWithUUIDString:v9];

    uint64_t v11 = 0;
    if (v7 && v10)
    {
      self = [(HMIPersonSourceUUIDPair *)self initWithPersonUUID:v7 sourceUUID:v10];
      uint64_t v11 = self;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSString)UUIDPairString
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [(HMIPersonSourceUUIDPair *)self personUUID];
  v4 = [v3 UUIDString];
  v10[0] = v4;
  id v5 = [(HMIPersonSourceUUIDPair *)self sourceUUID];
  id v6 = [v5 UUIDString];
  v10[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  id v8 = [v7 componentsJoinedByString:@"_"];

  return (NSString *)v8;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMIPersonSourceUUIDPair *)self personUUID];
  id v5 = (void *)[v3 initWithName:@"personUUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  id v7 = [(HMIPersonSourceUUIDPair *)self sourceUUID];
  id v8 = (void *)[v6 initWithName:@"sourceUUID" value:v7];
  v11[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

+ (id)personSourceUUIDPairFromPersonLink:(id)a3
{
  id v3 = a3;
  v4 = [HMIPersonSourceUUIDPair alloc];
  id v5 = [v3 personUUID];
  id v6 = [v3 personManagerUUID];

  id v7 = [(HMIPersonSourceUUIDPair *)v4 initWithPersonUUID:v5 sourceUUID:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMIPersonSourceUUIDPair *)self personUUID];
    id v8 = [v6 personUUID];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(HMIPersonSourceUUIDPair *)self sourceUUID];
      v10 = [v6 sourceUUID];
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

- (unint64_t)hash
{
  v2 = [(HMIPersonSourceUUIDPair *)self personUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMIPersonSourceUUIDPair *)self personUUID];
  [v4 encodeObject:v5 forKey:@"HMIPSUP.ck.p"];

  id v6 = [(HMIPersonSourceUUIDPair *)self sourceUUID];
  [v4 encodeObject:v6 forKey:@"HMIPSUP.ck.s"];
}

- (HMIPersonSourceUUIDPair)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIPSUP.ck.p"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIPSUP.ck.s"];
  id v7 = (void *)v6;
  if (!v5)
  {
    v10 = (void *)MEMORY[0x22A641C70]();
    id v8 = self;
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      v13 = "%{public}@Could not initialize from decoded personUUID: %@";
LABEL_8:
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x16u);
    }
LABEL_9:

    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    v10 = (void *)MEMORY[0x22A641C70]();
    id v8 = self;
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      v13 = "%{public}@Could not initialize from decoded sourceUUID: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v8 = [(HMIPersonSourceUUIDPair *)self initWithPersonUUID:v5 sourceUUID:v6];
  uint64_t v9 = v8;
LABEL_10:

  return v9;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end