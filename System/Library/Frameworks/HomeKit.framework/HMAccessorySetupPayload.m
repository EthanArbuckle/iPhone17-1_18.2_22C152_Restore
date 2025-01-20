@interface HMAccessorySetupPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMAccessoryOwnershipToken)ownershipToken;
- (HMAccessorySetupPayload)initWithCoder:(id)a3;
- (HMAccessorySetupPayload)initWithInternalSetupPayload:(id)a3;
- (HMAccessorySetupPayload)initWithInternalSetupPayload:(id)a3 ownershipToken:(id)a4;
- (HMAccessorySetupPayload)initWithURL:(NSURL *)setupPayloadURL;
- (HMAccessorySetupPayload)initWithURL:(NSURL *)setupPayloadURL ownershipToken:(HMAccessoryOwnershipToken *)ownershipToken;
- (HMSetupAccessoryPayload)internalSetupPayload;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessorySetupPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownershipToken, 0);

  objc_storeStrong((id *)&self->_internalSetupPayload, 0);
}

- (HMAccessoryOwnershipToken)ownershipToken
{
  return (HMAccessoryOwnershipToken *)objc_getProperty(self, a2, 16, 1);
}

- (HMSetupAccessoryPayload)internalSetupPayload
{
  return (HMSetupAccessoryPayload *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessorySetupPayload)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASP.internalSetupPayload"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASP.ownershipToken"];
  if (v5)
  {
    v7 = [(HMAccessorySetupPayload *)self initWithInternalSetupPayload:v5 ownershipToken:v6];
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from internalSetupPayload: %@", (uint8_t *)&v13, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySetupPayload *)self internalSetupPayload];
  [v4 encodeObject:v5 forKey:@"HMASP.internalSetupPayload"];

  id v6 = [(HMAccessorySetupPayload *)self ownershipToken];
  [v4 encodeObject:v6 forKey:@"HMASP.ownershipToken"];
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
    v7 = [(HMAccessorySetupPayload *)self internalSetupPayload];
    v8 = [v6 internalSetupPayload];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMAccessorySetupPayload *)self ownershipToken];
      v10 = [v6 ownershipToken];
      char v11 = HMFEqualObjects();
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

- (HMAccessorySetupPayload)initWithInternalSetupPayload:(id)a3 ownershipToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessorySetupPayload;
  v9 = [(HMAccessorySetupPayload *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_internalSetupPayload, a3);
    uint64_t v11 = [v8 copy];
    ownershipToken = v10->_ownershipToken;
    v10->_ownershipToken = (HMAccessoryOwnershipToken *)v11;
  }
  return v10;
}

- (HMAccessorySetupPayload)initWithURL:(NSURL *)setupPayloadURL ownershipToken:(HMAccessoryOwnershipToken *)ownershipToken
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = setupPayloadURL;
  id v7 = ownershipToken;
  id v16 = 0;
  id v8 = [[HMSetupAccessoryPayload alloc] initWithSetupPayloadURL:v6 error:&v16];
  id v9 = v16;
  if (v8)
  {
    v10 = [(HMAccessorySetupPayload *)self initWithInternalSetupPayload:v8 ownershipToken:v7];
    uint64_t v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_super v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v6;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSetupAccessoryPayload from setup payload URL %@: %@", buf, 0x20u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (HMAccessorySetupPayload)initWithInternalSetupPayload:(id)a3
{
  return [(HMAccessorySetupPayload *)self initWithInternalSetupPayload:a3 ownershipToken:0];
}

- (HMAccessorySetupPayload)initWithURL:(NSURL *)setupPayloadURL
{
  if (setupPayloadURL)
  {
    self = [(HMAccessorySetupPayload *)self initWithURL:setupPayloadURL ownershipToken:0];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end