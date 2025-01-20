@interface HMAccessCodeModificationResponseValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeModificationResponseValue)initWithAccessoryUUID:(id)a3 accessoryAccessCodeValue:(id)a4 accessCodeValue:(id)a5 operationType:(int64_t)a6 error:(id)a7;
- (HMAccessCodeModificationResponseValue)initWithCoder:(id)a3;
- (HMAccessCodeValue)accessCodeValue;
- (HMAccessoryAccessCodeValue)accessoryAccessCodeValue;
- (NSArray)attributeDescriptions;
- (NSError)error;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (int64_t)operationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessCodeValue:(id)a3;
- (void)setAccessoryAccessCodeValue:(id)a3;
- (void)setError:(id)a3;
@end

@implementation HMAccessCodeModificationResponseValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodeValue, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)setAccessCodeValue:(id)a3
{
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessoryAccessCodeValue:(id)a3
{
}

- (HMAccessoryAccessCodeValue)accessoryAccessCodeValue
{
  return (HMAccessoryAccessCodeValue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v19 = [(HMAccessCodeModificationResponseValue *)self accessoryUUID];
  v4 = (void *)[v3 initWithName:@"accessoryUUID" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMAccessCodeModificationResponseValue *)self accessoryAccessCodeValue];
  v7 = (void *)[v5 initWithName:@"accessoryAccessCodeValue" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMAccessCodeModificationResponseValue *)self accessCodeValue];
  v10 = (void *)[v8 initWithName:@"accessCodeValue" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessCodeModificationResponseValue operationType](self, "operationType"));
  v13 = (void *)[v11 initWithName:@"operationType" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  v15 = [(HMAccessCodeModificationResponseValue *)self error];
  v16 = (void *)[v14 initWithName:@"error" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];

  return (NSArray *)v17;
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

- (HMAccessCodeModificationResponseValue)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeModificationResponseValueCodingKeyAccessoryUUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeModificationResponseValueCodingKeyAccessoryAccessCodeValue"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeModificationResponseValueCodingKeyAccessCodeValue"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeModificationResponseValueCodingKeyOperationType"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeModificationResponseValueCodingKeyError"];
  if (v5 && v8)
  {
    v10 = -[HMAccessCodeModificationResponseValue initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:](self, "initWithAccessoryUUID:accessoryAccessCodeValue:accessCodeValue:operationType:error:", v5, v6, v7, [v8 integerValue], v9);
    id v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543874;
      v17 = v14;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@, operationType: %@", (uint8_t *)&v16, 0x20u);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessCodeModificationResponseValue *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMAccessCodeModificationResponseValueCodingKeyAccessoryUUID"];

  v6 = [(HMAccessCodeModificationResponseValue *)self accessoryAccessCodeValue];
  [v4 encodeObject:v6 forKey:@"HMAccessCodeModificationResponseValueCodingKeyAccessoryAccessCodeValue"];

  v7 = [(HMAccessCodeModificationResponseValue *)self accessCodeValue];
  [v4 encodeObject:v7 forKey:@"HMAccessCodeModificationResponseValueCodingKeyAccessCodeValue"];

  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessCodeModificationResponseValue operationType](self, "operationType"));
  [v4 encodeObject:v8 forKey:@"HMAccessCodeModificationResponseValueCodingKeyOperationType"];

  id v9 = [(HMAccessCodeModificationResponseValue *)self error];
  [v4 encodeObject:v9 forKey:@"HMAccessCodeModificationResponseValueCodingKeyError"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessCodeModificationResponseValue *)self accessoryUUID];
  uint64_t v4 = [v3 hash];
  id v5 = [(HMAccessCodeModificationResponseValue *)self accessoryAccessCodeValue];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMAccessCodeModificationResponseValue *)self accessCodeValue];
  uint64_t v8 = [v7 hash];
  int64_t v9 = v6 ^ v8 ^ [(HMAccessCodeModificationResponseValue *)self operationType];
  v10 = [(HMAccessCodeModificationResponseValue *)self error];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
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
    v7 = [(HMAccessCodeModificationResponseValue *)self accessoryUUID];
    uint64_t v8 = [v6 accessoryUUID];
    if (![v7 isEqual:v8]) {
      goto LABEL_10;
    }
    int64_t v9 = [(HMAccessCodeModificationResponseValue *)self accessoryAccessCodeValue];
    v10 = [v6 accessoryAccessCodeValue];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_10;
    }
    v12 = [(HMAccessCodeModificationResponseValue *)self accessCodeValue];
    v13 = [v6 accessCodeValue];
    int v14 = HMFEqualObjects();

    if (!v14) {
      goto LABEL_10;
    }
    int64_t v15 = [(HMAccessCodeModificationResponseValue *)self operationType];
    if (v15 == [v6 operationType])
    {
      int v16 = [(HMAccessCodeModificationResponseValue *)self error];
      v17 = [v6 error];
      char v18 = HMFEqualObjects();
    }
    else
    {
LABEL_10:
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (HMAccessCodeModificationResponseValue)initWithAccessoryUUID:(id)a3 accessoryAccessCodeValue:(id)a4 accessCodeValue:(id)a5 operationType:(int64_t)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HMAccessCodeModificationResponseValue;
  int v16 = [(HMAccessCodeModificationResponseValue *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    accessoryUUID = v16->_accessoryUUID;
    v16->_accessoryUUID = (NSUUID *)v17;

    uint64_t v19 = [v13 copy];
    accessoryAccessCodeValue = v16->_accessoryAccessCodeValue;
    v16->_accessoryAccessCodeValue = (HMAccessoryAccessCodeValue *)v19;

    uint64_t v21 = [v14 copy];
    accessCodeValue = v16->_accessCodeValue;
    v16->_accessCodeValue = (HMAccessCodeValue *)v21;

    v16->_operationType = a6;
    objc_storeStrong((id *)&v16->_error, a7);
  }

  return v16;
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