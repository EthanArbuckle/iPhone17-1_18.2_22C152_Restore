@interface HMAccessoryAccessCodeFetchResponseValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessoryAccessCodeFetchResponseValue)initWithAccessoryUUID:(id)a3 accessoryAccessCodeValues:(id)a4 error:(id)a5;
- (HMAccessoryAccessCodeFetchResponseValue)initWithCoder:(id)a3;
- (NSArray)accessoryAccessCodeValues;
- (NSArray)attributeDescriptions;
- (NSError)error;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation HMAccessoryAccessCodeFetchResponseValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodeValues, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)accessoryAccessCodeValues
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessoryAccessCodeFetchResponseValue *)self accessoryUUID];
  v5 = (void *)[v3 initWithName:@"accessoryUUID" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessoryAccessCodeFetchResponseValue *)self accessoryAccessCodeValues];
  v8 = (void *)[v6 initWithName:@"accessoryAccessCodeValues" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMAccessoryAccessCodeFetchResponseValue *)self error];
  v11 = (void *)[v9 initWithName:@"error" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return (NSArray *)v12;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMAccessoryAccessCodeFetchResponseValue)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryUUID"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v8 = [v6 setWithArray:v7];
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryAccessCodeValues"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeFetchResponseValueCodingKeyError"];
  if (v5)
  {
    v11 = [(HMAccessoryAccessCodeFetchResponseValue *)self initWithAccessoryUUID:v5 accessoryAccessCodeValues:v9 error:v10];
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@", (uint8_t *)&v17, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessoryAccessCodeFetchResponseValue *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryUUID"];

  id v6 = [(HMAccessoryAccessCodeFetchResponseValue *)self accessoryAccessCodeValues];
  [v4 encodeObject:v6 forKey:@"HMAccessoryAccessCodeFetchResponseValueCodingKeyAccessoryAccessCodeValues"];

  id v7 = [(HMAccessoryAccessCodeFetchResponseValue *)self error];
  [v4 encodeObject:v7 forKey:@"HMAccessoryAccessCodeFetchResponseValueCodingKeyError"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessoryAccessCodeFetchResponseValue *)self accessoryUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessoryAccessCodeFetchResponseValue *)self accessoryAccessCodeValues];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(HMAccessoryAccessCodeFetchResponseValue *)self error];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
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
    id v7 = [(HMAccessoryAccessCodeFetchResponseValue *)self accessoryUUID];
    unint64_t v8 = [v6 accessoryUUID];
    if ([v7 isEqual:v8]
      && ([(HMAccessoryAccessCodeFetchResponseValue *)self accessoryAccessCodeValues],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v6 accessoryAccessCodeValues],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      v12 = [(HMAccessoryAccessCodeFetchResponseValue *)self error];
      v13 = [v6 error];
      char v14 = HMFEqualObjects();
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

- (HMAccessoryAccessCodeFetchResponseValue)initWithAccessoryUUID:(id)a3 accessoryAccessCodeValues:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryAccessCodeFetchResponseValue;
  int v11 = [(HMAccessoryAccessCodeFetchResponseValue *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    accessoryUUID = v11->_accessoryUUID;
    v11->_accessoryUUID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    accessoryAccessCodeValues = v11->_accessoryAccessCodeValues;
    v11->_accessoryAccessCodeValues = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_error, a5);
  }

  return v11;
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

@end