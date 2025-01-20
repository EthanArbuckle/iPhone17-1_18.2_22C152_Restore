@interface HMDXPCiCloudSwitchMessagePolicy
+ (id)policyWithBundleIdentifiers:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDXPCiCloudSwitchMessagePolicy)initWithBundleIdentifiers:(id)a3;
- (NSSet)bundleIdentifiers;
- (unint64_t)hash;
@end

@implementation HMDXPCiCloudSwitchMessagePolicy

- (void).cxx_destruct
{
}

- (NSSet)bundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMDXPCiCloudSwitchMessagePolicy *)self bundleIdentifiers];
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
    v7 = [(HMDXPCiCloudSwitchMessagePolicy *)self bundleIdentifiers];
    v8 = [v6 bundleIdentifiers];
    char v9 = [v7 isEqualToSet:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (HMDXPCiCloudSwitchMessagePolicy)initWithBundleIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDXPCiCloudSwitchMessagePolicy;
  v5 = [(HMDXPCiCloudSwitchMessagePolicy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSSet *)v6;
  }
  return v5;
}

+ (id)policyWithBundleIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifiers:v4];

  return v5;
}

@end