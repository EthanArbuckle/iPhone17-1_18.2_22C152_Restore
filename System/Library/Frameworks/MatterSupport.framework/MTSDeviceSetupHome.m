@interface MTSDeviceSetupHome
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSDeviceSetupHome)initWithCoder:(id)a3;
- (MTSDeviceSetupHome)initWithName:(id)a3;
- (NSString)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSDeviceSetupHome

- (void).cxx_destruct
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSDeviceSetupHome *)self name];
  [v4 encodeObject:v5 forKey:@"MTSDSH.ck.name"];
}

- (MTSDeviceSetupHome)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDSH.ck.name"];
  if (v5)
  {
    v6 = [(MTSDeviceSetupHome *)self initWithName:v5];
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
      _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded name: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MTSDeviceSetupHome *)self name];
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
    v7 = [(MTSDeviceSetupHome *)self name];
    v8 = [v6 name];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (MTSDeviceSetupHome)initWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)MTSDeviceSetupHome;
    id v6 = [(MTSDeviceSetupHome *)&v12 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      name = v6->_name;
      v6->_name = (NSString *)v7;
    }
    return v6;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (MTSDeviceSetupHome *)+[MTSDeviceSetupHome supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end