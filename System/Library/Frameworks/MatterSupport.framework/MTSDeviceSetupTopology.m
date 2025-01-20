@interface MTSDeviceSetupTopology
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSDeviceSetupTopology)initWithCoder:(id)a3;
- (MTSDeviceSetupTopology)initWithHomes:(id)a3;
- (NSArray)homes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSDeviceSetupTopology

- (void).cxx_destruct
{
}

- (NSArray)homes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSDeviceSetupTopology *)self homes];
  [v4 encodeObject:v5 forKey:@"MTSDST.homes"];
}

- (MTSDeviceSetupTopology)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"MTSDST.homes"];
  if (v5)
  {
    v6 = [(MTSDeviceSetupTopology *)self initWithHomes:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x245697870]();
    v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded homes: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MTSDeviceSetupTopology *)self homes];
  unint64_t v3 = [v2 hash];

  return v3;
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
    v7 = [(MTSDeviceSetupTopology *)self homes];
    v8 = [v6 homes];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (MTSDeviceSetupTopology)initWithHomes:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)MTSDeviceSetupTopology;
    id v6 = [(MTSDeviceSetupTopology *)&v12 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      homes = v6->_homes;
      v6->_homes = (NSArray *)v7;
    }
    return v6;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (MTSDeviceSetupTopology *)+[MTSDeviceSetupTopology supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end