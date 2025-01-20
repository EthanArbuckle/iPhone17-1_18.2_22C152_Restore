@interface HMSiriEndpointProfileAssistant
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
+ (id)uniqueIdentifierNamespace;
- (BOOL)isSiriAssistant;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMSiriEndpointProfileAssistant)initWithCoder:(id)a3;
- (HMSiriEndpointProfileAssistant)initWithIdentifier:(id)a3 name:(id)a4 active:(int64_t)a5;
- (NSNumber)identifier;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)uniqueIdentifier;
- (int64_t)active;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(int64_t)a3;
- (void)setName:(id)a3;
@end

@implementation HMSiriEndpointProfileAssistant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setActive:(int64_t)a3
{
  self->_active = a3;
}

- (int64_t)active
{
  return self->_active;
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (BOOL)mergeFromNewObject:(id)a3
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
  v7 = v6;
  if (v6)
  {
    v8 = [v6 name];
    v9 = [(HMSiriEndpointProfileAssistant *)self name];
    char v10 = HMFEqualObjects();

    if ((v10 & 1) == 0)
    {
      v11 = [v7 name];
      [(HMSiriEndpointProfileAssistant *)self setName:v11];
    }
    uint64_t v12 = [v7 active];
    if (v12 == [(HMSiriEndpointProfileAssistant *)self active])
    {
      char v13 = v10 ^ 1;
    }
    else
    {
      -[HMSiriEndpointProfileAssistant setActive:](self, "setActive:", [v7 active]);
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMSiriEndpointProfileAssistant)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMSiriEndpointProfileAssistant *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sepa-identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSNumber *)v6;

    v8 = v5->_identifier;
    if (v8)
    {
      v9 = [(NSNumber *)v8 stringValue];
      v21[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

      v11 = (void *)MEMORY[0x1E4F29128];
      uint64_t v12 = [(id)objc_opt_class() uniqueIdentifierNamespace];
      uint64_t v13 = objc_msgSend(v11, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v12, 0, v10);
      uniqueIdentifier = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSUUID *)v13;
    }
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sepa-name"];
    name = v5->_name;
    v5->_name = (NSString *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sepa-active"];
    v18 = v17;
    if (v17) {
      uint64_t v19 = [v17 integerValue];
    }
    else {
      uint64_t v19 = -1;
    }
    v5->_active = v19;
  }
  return v5;
}

- (BOOL)isSiriAssistant
{
  v2 = [(HMSiriEndpointProfileAssistant *)self identifier];
  char v3 = HMFEqualObjects();

  return v3;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMSiriEndpointProfileAssistant)initWithIdentifier:(id)a3 name:(id)a4 active:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMSiriEndpointProfileAssistant;
  id v10 = [(HMSiriEndpointProfileAssistant *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSNumber *)v11;

    uint64_t v13 = [v9 copy];
    name = v10->_name;
    v10->_name = (NSString *)v13;

    v10->_active = a5;
  }

  return v10;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_62459 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_62459, &__block_literal_global_33);
  }
  v2 = (void *)logCategory__hmf_once_v4_62460;

  return v2;
}

uint64_t __45__HMSiriEndpointProfileAssistant_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_62460;
  logCategory__hmf_once_v4_62460 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)uniqueIdentifierNamespace
{
  if (uniqueIdentifierNamespace_onceToken != -1) {
    dispatch_once(&uniqueIdentifierNamespace_onceToken, &__block_literal_global_62464);
  }
  v2 = (void *)uniqueIdentifierNamespace_namespace;

  return v2;
}

uint64_t __59__HMSiriEndpointProfileAssistant_uniqueIdentifierNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C9A7AF26-1C3D-43A8-894B-E130BF03C2F1"];
  uint64_t v1 = uniqueIdentifierNamespace_namespace;
  uniqueIdentifierNamespace_namespace = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end