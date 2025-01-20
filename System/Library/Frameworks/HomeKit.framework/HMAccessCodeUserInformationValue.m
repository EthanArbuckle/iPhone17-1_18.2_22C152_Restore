@interface HMAccessCodeUserInformationValue
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessCodeUserInformationValue)initWithCoder:(id)a3;
- (HMAccessCodeUserInformationValue)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4 userUUID:(id)a5 removedUserInfo:(id)a6;
- (HMRemovedUserInfo)removedUserInfo;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)simpleLabel;
- (NSUUID)labelIdentifier;
- (NSUUID)userUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessCodeUserInformationValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedUserInfo, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_labelIdentifier, 0);

  objc_storeStrong((id *)&self->_simpleLabel, 0);
}

- (HMRemovedUserInfo)removedUserInfo
{
  return (HMRemovedUserInfo *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)labelIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)simpleLabel
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessCodeUserInformationValue *)self simpleLabel];
  v5 = [MEMORY[0x1E4F65538] defaultFormatter];
  v6 = (void *)[v3 initWithName:@"simpleLabel" value:v4 options:2 formatter:v5];
  v18[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMAccessCodeUserInformationValue *)self labelIdentifier];
  v9 = (void *)[v7 initWithName:@"labelIdentifier" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMAccessCodeUserInformationValue *)self userUUID];
  v12 = (void *)[v10 initWithName:@"userUUID" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMAccessCodeUserInformationValue *)self removedUserInfo];
  v15 = (void *)[v13 initWithName:@"removedUserInfo" value:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  return (NSArray *)v16;
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

- (HMAccessCodeUserInformationValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeUserInformationValueCodingKeySimpleLabel"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeUserInformationValueCodingKeyLabelUUID"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeUserInformationValueCodingKeyUserUUID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessCodeUserInformationValueCodingKeyRemovedUserInfo"];

  v9 = [(HMAccessCodeUserInformationValue *)self initWithSimpleLabel:v5 labelIdentifier:v6 userUUID:v7 removedUserInfo:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessCodeUserInformationValue *)self simpleLabel];
  [v4 encodeObject:v5 forKey:@"HMAccessCodeUserInformationValueCodingKeySimpleLabel"];

  v6 = [(HMAccessCodeUserInformationValue *)self labelIdentifier];
  [v4 encodeObject:v6 forKey:@"HMAccessCodeUserInformationValueCodingKeyLabelUUID"];

  id v7 = [(HMAccessCodeUserInformationValue *)self userUUID];
  [v4 encodeObject:v7 forKey:@"HMAccessCodeUserInformationValueCodingKeyUserUUID"];

  id v8 = [(HMAccessCodeUserInformationValue *)self removedUserInfo];
  [v4 encodeObject:v8 forKey:@"HMAccessCodeUserInformationValueCodingKeyRemovedUserInfo"];
}

- (unint64_t)hash
{
  id v3 = [(HMAccessCodeUserInformationValue *)self simpleLabel];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessCodeUserInformationValue *)self labelIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(HMAccessCodeUserInformationValue *)self userUUID];
  uint64_t v8 = [v7 hash];
  v9 = [(HMAccessCodeUserInformationValue *)self removedUserInfo];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
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
  if (!v6) {
    goto LABEL_9;
  }
  id v7 = [(HMAccessCodeUserInformationValue *)self simpleLabel];
  uint64_t v8 = [v6 simpleLabel];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_9;
  }
  unint64_t v10 = [(HMAccessCodeUserInformationValue *)self labelIdentifier];
  v11 = [v6 labelIdentifier];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_9;
  }
  id v13 = [(HMAccessCodeUserInformationValue *)self userUUID];
  v14 = [v6 userUUID];
  int v15 = HMFEqualObjects();

  if (v15)
  {
    v16 = [(HMAccessCodeUserInformationValue *)self removedUserInfo];
    v17 = [v6 removedUserInfo];
    char v18 = HMFEqualObjects();
  }
  else
  {
LABEL_9:
    char v18 = 0;
  }

  return v18;
}

- (HMAccessCodeUserInformationValue)initWithSimpleLabel:(id)a3 labelIdentifier:(id)a4 userUUID:(id)a5 removedUserInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMAccessCodeUserInformationValue;
  v14 = [(HMAccessCodeUserInformationValue *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    simpleLabel = v14->_simpleLabel;
    v14->_simpleLabel = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    labelIdentifier = v14->_labelIdentifier;
    v14->_labelIdentifier = (NSUUID *)v17;

    uint64_t v19 = [v12 copy];
    userUUID = v14->_userUUID;
    v14->_userUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v14->_removedUserInfo, a6);
  }

  return v14;
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