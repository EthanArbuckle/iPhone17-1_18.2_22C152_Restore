@interface HMAccessCodeConstraints
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeConstraints)initWithAllowedCharacterSets:(unint64_t)a3 minimumLength:(int64_t)a4 maximumLength:(int64_t)a5 maximumAllowedAccessCodes:(int64_t)a6;
- (HMAccessCodeConstraints)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (int64_t)maximumAllowedAccessCodes;
- (int64_t)maximumLength;
- (int64_t)minimumLength;
- (unint64_t)allowedCharacterSets;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessCodeConstraints

- (int64_t)maximumAllowedAccessCodes
{
  return self->_maximumAllowedAccessCodes;
}

- (int64_t)maximumLength
{
  return self->_maximumLength;
}

- (int64_t)minimumLength
{
  return self->_minimumLength;
}

- (unint64_t)allowedCharacterSets
{
  return self->_allowedCharacterSets;
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAccessCodeConstraints allowedCharacterSets](self, "allowedCharacterSets"));
  v5 = (void *)[v3 initWithName:@"allowedCharacterSets" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessCodeConstraints minimumLength](self, "minimumLength"));
  v8 = (void *)[v6 initWithName:@"minimumLength" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessCodeConstraints maximumLength](self, "maximumLength"));
  v11 = (void *)[v9 initWithName:@"maximumLength" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessCodeConstraints maximumAllowedAccessCodes](self, "maximumAllowedAccessCodes"));
  v14 = (void *)[v12 initWithName:@"maximumAllowedAccessCodes" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return (NSArray *)v15;
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

- (HMAccessCodeConstraints)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HMAccessCodeConstraintsCodingKeyAllowedCharacterSets"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMAccessCodeConstraintsCodingKeyMinimumLength"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"HMAccessCodeConstraintsCodingKeyMaximumLength"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"HMAccessCodeConstraintsCodingKeyMaximumAllowedAccessCodes"];
  if [v4 containsValueForKey:@"HMAccessCodeConstraintsCodingKeyAllowedCharacterSets"]&& objc_msgSend(v4, "containsValueForKey:", @"HMAccessCodeConstraintsCodingKeyMinimumLength")&& objc_msgSend(v4, "containsValueForKey:", @"HMAccessCodeConstraintsCodingKeyMaximumLength")&& (objc_msgSend(v4, "containsValueForKey:", @"HMAccessCodeConstraintsCodingKeyMaximumAllowedAccessCodes"))
  {
    id v9 = [(HMAccessCodeConstraints *)self initWithAllowedCharacterSets:v5 minimumLength:v6 maximumLength:v7 maximumAllowedAccessCodes:v8];
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138544386;
      v16 = v13;
      __int16 v17 = 2048;
      uint64_t v18 = v5;
      __int16 v19 = 2048;
      uint64_t v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding allowedCharacterSets: %ld, minimumLength:%ld, maximumLength:%ld maximumAllowedAccessCodes:%ld", (uint8_t *)&v15, 0x34u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints allowedCharacterSets](self, "allowedCharacterSets"), @"HMAccessCodeConstraintsCodingKeyAllowedCharacterSets");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints minimumLength](self, "minimumLength"), @"HMAccessCodeConstraintsCodingKeyMinimumLength");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints maximumLength](self, "maximumLength"), @"HMAccessCodeConstraintsCodingKeyMaximumLength");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMAccessCodeConstraints maximumAllowedAccessCodes](self, "maximumAllowedAccessCodes"), @"HMAccessCodeConstraintsCodingKeyMaximumAllowedAccessCodes");
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMAccessCodeConstraints *)self allowedCharacterSets];
  int64_t v4 = [(HMAccessCodeConstraints *)self minimumLength] ^ v3;
  int64_t v5 = [(HMAccessCodeConstraints *)self maximumLength];
  return v4 ^ v5 ^ [(HMAccessCodeConstraints *)self maximumAllowedAccessCodes];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (unint64_t v7 = [(HMAccessCodeConstraints *)self allowedCharacterSets],
        v7 == [v6 allowedCharacterSets])
    && (int64_t v8 = -[HMAccessCodeConstraints minimumLength](self, "minimumLength"), v8 == [v6 minimumLength])
    && (int64_t v9 = -[HMAccessCodeConstraints maximumLength](self, "maximumLength"), v9 == [v6 maximumLength]))
  {
    int64_t v10 = [(HMAccessCodeConstraints *)self maximumAllowedAccessCodes];
    BOOL v11 = v10 == [v6 maximumAllowedAccessCodes];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (HMAccessCodeConstraints)initWithAllowedCharacterSets:(unint64_t)a3 minimumLength:(int64_t)a4 maximumLength:(int64_t)a5 maximumAllowedAccessCodes:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HMAccessCodeConstraints;
  result = [(HMAccessCodeConstraints *)&v11 init];
  if (result)
  {
    result->_allowedCharacterSets = a3;
    result->_minimumLength = a4;
    result->_maximumLength = a5;
    result->_maximumAllowedAccessCodes = a6;
  }
  return result;
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