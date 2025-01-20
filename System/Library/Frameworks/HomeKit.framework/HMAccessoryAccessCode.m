@interface HMAccessoryAccessCode
+ (HMAccessoryAccessCode)accessoryAccessCodeWithValue:(id)a3 accessory:(id)a4;
+ (id)shortDescription;
- (BOOL)hasRestrictions;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeValue)accessCodeValue;
- (HMAccessory)accessory;
- (HMAccessoryAccessCode)initWithAccessory:(id)a3 accessCodeValue:(id)a4 uniqueIdentifier:(id)a5 hasRestrictions:(BOOL)a6;
- (NSArray)attributeDescriptions;
- (NSNumber)uniqueIdentifier;
- (NSString)description;
- (NSString)shortDescription;
- (id)createAccessoryAccessCodeValue;
- (unint64_t)hash;
@end

@implementation HMAccessoryAccessCode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
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

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessoryAccessCode *)self accessory];
  v5 = (void *)[v3 initWithName:@"accessory" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessoryAccessCode *)self accessCodeValue];
  v8 = (void *)[v6 initWithName:@"accessCodeValue" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMAccessoryAccessCode *)self uniqueIdentifier];
  v11 = (void *)[v9 initWithName:@"uniqueIdentifier" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMAccessoryAccessCode hasRestrictions](self, "hasRestrictions"));
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

- (unint64_t)hash
{
  id v3 = [(HMAccessoryAccessCode *)self accessory];
  v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v4 hash];
  id v6 = [(HMAccessoryAccessCode *)self accessCodeValue];
  uint64_t v7 = [v6 hash];
  v8 = [(HMAccessoryAccessCode *)self uniqueIdentifier];
  uint64_t v9 = v7 ^ [v8 hash] ^ v5;
  unint64_t v10 = v9 ^ [(HMAccessoryAccessCode *)self hasRestrictions];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = [(HMAccessoryAccessCode *)self accessory];
  v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [v6 accessory];
  unint64_t v10 = [v9 uniqueIdentifier];
  int v11 = HMFEqualObjects();

  if (!v11) {
    goto LABEL_9;
  }
  id v12 = [(HMAccessoryAccessCode *)self accessCodeValue];
  v13 = [v6 accessCodeValue];
  int v14 = HMFEqualObjects();

  if (v14)
  {
    v15 = [(HMAccessoryAccessCode *)self uniqueIdentifier];
    v16 = [v6 uniqueIdentifier];
    if (v15 == v16)
    {
      BOOL v19 = [(HMAccessoryAccessCode *)self hasRestrictions];
      int v17 = v19 ^ [v6 hasRestrictions] ^ 1;
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (id)createAccessoryAccessCodeValue
{
  id v3 = [HMAccessoryAccessCodeValue alloc];
  id v4 = [(HMAccessoryAccessCode *)self accessory];
  uint64_t v5 = [v4 uuid];
  id v6 = [(HMAccessoryAccessCode *)self accessCodeValue];
  uint64_t v7 = [(HMAccessoryAccessCode *)self uniqueIdentifier];
  v8 = [(HMAccessoryAccessCodeValue *)v3 initWithAccessoryUUID:v5 accessCodeValue:v6 uniqueIdentifier:v7 hasRestrictions:[(HMAccessoryAccessCode *)self hasRestrictions]];

  return v8;
}

- (HMAccessoryAccessCode)initWithAccessory:(id)a3 accessCodeValue:(id)a4 uniqueIdentifier:(id)a5 hasRestrictions:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessoryAccessCode;
  int v14 = [(HMAccessoryAccessCode *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a3);
    uint64_t v16 = [v12 copy];
    accessCodeValue = v15->_accessCodeValue;
    v15->_accessCodeValue = (HMAccessCodeValue *)v16;

    objc_storeStrong((id *)&v15->_uniqueIdentifier, a5);
    v15->_hasRestrictions = a6;
  }

  return v15;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (HMAccessoryAccessCode)accessoryAccessCodeWithValue:(id)a3 accessory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [HMAccessoryAccessCode alloc];
  v8 = [v6 accessCodeValue];
  uint64_t v9 = [v6 uniqueIdentifier];
  uint64_t v10 = [v6 hasRestrictions];

  id v11 = [(HMAccessoryAccessCode *)v7 initWithAccessory:v5 accessCodeValue:v8 uniqueIdentifier:v9 hasRestrictions:v10];

  return v11;
}

@end