@interface HMAccessCodeValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeValue)initWithCoder:(id)a3;
- (HMAccessCodeValue)initWithStringValue:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)stringValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessCodeValue

- (void).cxx_destruct
{
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessCodeValue *)self stringValue];
  v5 = (void *)[v3 initWithName:@"stringValue" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
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

- (HMAccessCodeValue)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeValueCodingKeyStringValue"];
  if (v5)
  {
    v6 = [(HMAccessCodeValue *)self initWithStringValue:v5];
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
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding stringValue: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessCodeValue *)self stringValue];
  [v4 encodeObject:v5 forKey:@"HMAccessCodeValueCodingKeyStringValue"];
}

- (unint64_t)hash
{
  v2 = [(HMAccessCodeValue *)self stringValue];
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
    v7 = [(HMAccessCodeValue *)self stringValue];
    v8 = [v6 stringValue];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (HMAccessCodeValue)initWithStringValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessCodeValue;
  id v5 = [(HMAccessCodeValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
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