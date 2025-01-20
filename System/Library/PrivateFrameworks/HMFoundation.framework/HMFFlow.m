@interface HMFFlow
+ (BOOL)supportsSecureCoding;
+ (id)internalOnlyInitializer;
+ (id)untrackedPlaceholderFlow;
- (BOOL)isEqual:(id)a3;
- (HMFFlow)init;
- (HMFFlow)initWithCoder:(id)a3;
- (HMFFlow)initWithUUID:(id)a3;
- (NSUUID)UUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFFlow

+ (id)untrackedPlaceholderFlow
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)internalOnlyInitializer
{
  v2 = objc_opt_new();
  return v2;
}

- (HMFFlow)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [(HMFFlow *)self initWithUUID:v3];

  return v4;
}

- (HMFFlow)initWithUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFFlow;
  v5 = [(HMFFlow *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;
  }
  return v5;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
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
  v7 = [(HMFFlow *)self UUID];
  v8 = [v6 UUID];

  LOBYTE(v6) = [v7 isEqual:v8];
  return (char)v6;
}

- (unint64_t)hash
{
  v2 = [(HMFFlow *)self UUID];
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
  id v5 = [(HMFFlow *)self UUID];
  [v4 encodeObject:v5 forKey:@"HMFFlowUUIDCodingKey"];
}

- (HMFFlow)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFFlowUUIDCodingKey"];
  if (v5)
  {
    id v6 = [(HMFFlow *)self initWithUUID:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = self;
    objc_super v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier(v6);
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding UUID", (uint8_t *)&v12, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

@end