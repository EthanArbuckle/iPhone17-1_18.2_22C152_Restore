@interface HMDHomeLockNotificationContextResolutionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDHomeLockNotificationContextResolutionResult)initWithCoder:(id)a3;
- (HMDHomeLockNotificationContextResolutionResult)initWithUserUUID:(id)a3 label:(id)a4 labelIdentifier:(id)a5;
- (NSString)label;
- (NSUUID)labelIdentifier;
- (NSUUID)userUUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDHomeLockNotificationContextResolutionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

- (NSUUID)labelIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDHomeLockNotificationContextResolutionResult *)self userUUID];
  v5 = (void *)[v3 initWithName:@"UserUUID" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDHomeLockNotificationContextResolutionResult *)self label];
  v8 = [MEMORY[0x1E4F65538] defaultFormatter];
  v9 = (void *)[v6 initWithName:@"Label" value:v7 options:2 formatter:v8];
  v16[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDHomeLockNotificationContextResolutionResult *)self labelIdentifier];
  v12 = [MEMORY[0x1E4F65538] defaultFormatter];
  v13 = (void *)[v10 initWithName:@"LabelIdentifier" value:v11 options:2 formatter:v12];
  v16[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomeLockNotificationContextResolutionResult *)self userUUID];
  [v4 encodeObject:v5 forKey:@"HMDHomeLockNotificationContextResolutionResultUserUUIDCodingKey"];

  id v6 = [(HMDHomeLockNotificationContextResolutionResult *)self label];
  [v4 encodeObject:v6 forKey:@"HMDHomeLockNotificationContextResolutionResultLabelCodingKey"];

  id v7 = [(HMDHomeLockNotificationContextResolutionResult *)self labelIdentifier];
  [v4 encodeObject:v7 forKey:@"HMDHomeLockNotificationContextResolutionResultLabelIdentifierCodingKey"];
}

- (HMDHomeLockNotificationContextResolutionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDHomeLockNotificationContextResolutionResultUserUUIDCodingKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDHomeLockNotificationContextResolutionResultLabelCodingKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDHomeLockNotificationContextResolutionResultLabelIdentifierCodingKey"];

  if (v5 | v6)
  {
    self = [(HMDHomeLockNotificationContextResolutionResult *)self initWithUserUUID:v5 label:v6 labelIdentifier:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = [(HMDHomeLockNotificationContextResolutionResult *)self userUUID];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(HMDHomeLockNotificationContextResolutionResult *)self label];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(HMDHomeLockNotificationContextResolutionResult *)self labelIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
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
  id v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  unint64_t v8 = [v6 userUUID];
  v9 = [(HMDHomeLockNotificationContextResolutionResult *)self userUUID];
  int v10 = HMFEqualObjects();

  if (!v10) {
    goto LABEL_8;
  }
  v11 = [v7 label];
  v12 = [(HMDHomeLockNotificationContextResolutionResult *)self label];
  int v13 = HMFEqualObjects();

  if (v13)
  {
    v14 = [v7 labelIdentifier];
    v15 = [(HMDHomeLockNotificationContextResolutionResult *)self labelIdentifier];
    char v16 = HMFEqualObjects();
  }
  else
  {
LABEL_8:
    char v16 = 0;
  }

  return v16;
}

- (HMDHomeLockNotificationContextResolutionResult)initWithUserUUID:(id)a3 label:(id)a4 labelIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLockNotificationContextResolutionResult;
  v12 = [(HMDHomeLockNotificationContextResolutionResult *)&v15 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userUUID, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    objc_storeStrong((id *)&v13->_labelIdentifier, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end