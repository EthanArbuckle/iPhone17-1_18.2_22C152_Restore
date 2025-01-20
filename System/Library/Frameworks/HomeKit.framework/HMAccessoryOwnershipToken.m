@interface HMAccessoryOwnershipToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMAccessoryOwnershipToken)initWithCoder:(id)a3;
- (HMAccessoryOwnershipToken)initWithData:(NSData *)data;
- (NSData)internalData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessoryOwnershipToken

- (void).cxx_destruct
{
}

- (NSData)internalData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryOwnershipToken)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAOT.internalData"];
  if (v5)
  {
    v6 = [(HMAccessoryOwnershipToken *)self initWithData:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from internalData: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessoryOwnershipToken *)self internalData];
  [v4 encodeObject:v5 forKey:@"HMAOT.internalData"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessoryOwnershipToken *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMAccessoryOwnershipToken *)self internalData];
      v8 = [(HMAccessoryOwnershipToken *)v6 internalData];
      char v9 = [v7 isEqualToData:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMAccessoryOwnershipToken)initWithData:(NSData *)data
{
  id v4 = data;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryOwnershipToken;
  id v5 = [(HMAccessoryOwnershipToken *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSData *)v4 copy];
    internalData = v5->_internalData;
    v5->_internalData = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end