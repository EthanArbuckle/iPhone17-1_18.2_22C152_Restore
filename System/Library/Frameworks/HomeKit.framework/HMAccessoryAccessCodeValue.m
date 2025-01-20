@interface HMAccessoryAccessCodeValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)hasRestrictions;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeValue)accessCodeValue;
- (HMAccessoryAccessCodeValue)initWithAccessoryUUID:(id)a3 accessCodeValue:(id)a4 uniqueIdentifier:(id)a5 hasRestrictions:(BOOL)a6;
- (HMAccessoryAccessCodeValue)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSNumber)uniqueIdentifier;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessoryAccessCodeValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (BOOL)hasRestrictions
{
  return self->_hasRestrictions;
}

- (NSNumber)uniqueIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessoryAccessCodeValue *)self accessoryUUID];
  v5 = (void *)[v3 initWithName:@"accessoryUUID" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessoryAccessCodeValue *)self accessCodeValue];
  v8 = (void *)[v6 initWithName:@"accessCodeValue" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMAccessoryAccessCodeValue *)self uniqueIdentifier];
  v11 = (void *)[v9 initWithName:@"uniqueIdentifier" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMAccessoryAccessCodeValue hasRestrictions](self, "hasRestrictions"));
  v14 = (void *)[v12 initWithName:@"hasRestrictions" value:v13];
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

- (HMAccessoryAccessCodeValue)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeValueCodingKeyAccessoryUUID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeValueCodingKeyAccessCodeValue"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeValueCodingKeyUniqueIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAccessCodeValueCodingKeyHasRestrictions"];
  id v9 = v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0 || v8 == 0)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v16 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v19 = 138544386;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2112;
      v24 = v6;
      __int16 v25 = 2112;
      v26 = v7;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding accessoryUUID: %@, accessCodeValue: %@, uniqueIdentifier: %@, hasRestrictions: %@,", (uint8_t *)&v19, 0x34u);
    }
    v17 = 0;
  }
  else
  {
    v16 = -[HMAccessoryAccessCodeValue initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:](self, "initWithAccessoryUUID:accessCodeValue:uniqueIdentifier:hasRestrictions:", v5, v6, v7, [v8 BOOLValue]);
    v17 = v16;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessoryAccessCodeValue *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"HMAccessoryAccessCodeValueCodingKeyAccessoryUUID"];

  id v6 = [(HMAccessoryAccessCodeValue *)self accessCodeValue];
  [v4 encodeObject:v6 forKey:@"HMAccessoryAccessCodeValueCodingKeyAccessCodeValue"];

  v7 = [(HMAccessoryAccessCodeValue *)self uniqueIdentifier];
  [v4 encodeObject:v7 forKey:@"HMAccessoryAccessCodeValueCodingKeyUniqueIdentifier"];

  objc_msgSend(NSNumber, "numberWithBool:", -[HMAccessoryAccessCodeValue hasRestrictions](self, "hasRestrictions"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"HMAccessoryAccessCodeValueCodingKeyHasRestrictions"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessoryAccessCodeValue *)self accessoryUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessoryAccessCodeValue *)self accessCodeValue];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMAccessoryAccessCodeValue *)self uniqueIdentifier];
  uint64_t v8 = v6 ^ [v7 hash];
  unint64_t v9 = v8 ^ [(HMAccessoryAccessCodeValue *)self hasRestrictions];

  return v9;
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
    v7 = [(HMAccessoryAccessCodeValue *)self accessoryUUID];
    uint64_t v8 = [v6 accessoryUUID];
    if ([v7 isEqual:v8])
    {
      unint64_t v9 = [(HMAccessoryAccessCodeValue *)self accessCodeValue];
      BOOL v10 = [v6 accessCodeValue];
      if ([v9 isEqual:v10])
      {
        v11 = [(HMAccessoryAccessCodeValue *)self uniqueIdentifier];
        id v12 = [v6 uniqueIdentifier];
        if ([v11 isEqual:v12])
        {
          BOOL v13 = [(HMAccessoryAccessCodeValue *)self hasRestrictions];
          int v14 = v13 ^ [v6 hasRestrictions] ^ 1;
        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (HMAccessoryAccessCodeValue)initWithAccessoryUUID:(id)a3 accessCodeValue:(id)a4 uniqueIdentifier:(id)a5 hasRestrictions:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMAccessoryAccessCodeValue;
  BOOL v13 = [(HMAccessoryAccessCodeValue *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    accessoryUUID = v13->_accessoryUUID;
    v13->_accessoryUUID = (NSUUID *)v14;

    uint64_t v16 = [v11 copy];
    accessCodeValue = v13->_accessCodeValue;
    v13->_accessCodeValue = (HMAccessCodeValue *)v16;

    uint64_t v18 = [v12 copy];
    uniqueIdentifier = v13->_uniqueIdentifier;
    v13->_uniqueIdentifier = (NSNumber *)v18;

    v13->_hasRestrictions = a6;
  }

  return v13;
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