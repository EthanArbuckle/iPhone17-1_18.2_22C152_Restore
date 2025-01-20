@interface HMRemovedUserInfo
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMRemovedUserInfo)initWithCoder:(id)a3;
- (HMRemovedUserInfo)initWithName:(id)a3 userUUID:(id)a4 userID:(id)a5 dateRemoved:(id)a6;
- (NSArray)attributeDescriptions;
- (NSDate)dateRemoved;
- (NSString)description;
- (NSString)name;
- (NSString)shortDescription;
- (NSString)userID;
- (NSUUID)userUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMRemovedUserInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRemoved, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDate)dateRemoved
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMRemovedUserInfo *)self name];
  v6 = [MEMORY[0x1E4F65538] defaultFormatter];
  v7 = (void *)[v4 initWithName:@"name" value:v5 options:2 formatter:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMRemovedUserInfo *)self userUUID];
  v10 = (void *)[v8 initWithName:@"userUUID" value:v9];
  v22[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v12 = [(HMRemovedUserInfo *)self dateRemoved];
  v13 = (void *)[v11 initWithName:@"dateRemoved" value:v12];
  v22[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v15 = [v3 arrayWithArray:v14];

  v16 = [(HMRemovedUserInfo *)self userID];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
    v18 = [(HMRemovedUserInfo *)self userID];
    v19 = [MEMORY[0x1E4F65538] defaultFormatter];
    v20 = (void *)[v17 initWithName:@"userID" value:v18 options:2 formatter:v19];
    [v15 addObject:v20];
  }

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

- (HMRemovedUserInfo)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMRemovedUserInfoCodingKeyName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMRemovedUserInfoCodingKeyUserUUID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMRemovedUserInfoCodingKeyUserID"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMRemovedUserInfoCodingKeyDateRemoved"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v8 == 0)
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v18 = 138544130;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v5;
      __int16 v22 = 2112;
      v23 = v6;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding name: %@, userUUID: %@, dateRemoved: %@", (uint8_t *)&v18, 0x2Au);
    }
    v16 = 0;
  }
  else
  {
    v15 = [(HMRemovedUserInfo *)self initWithName:v5 userUUID:v6 userID:v7 dateRemoved:v8];
    v16 = v15;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMRemovedUserInfo *)self name];
  [v4 encodeObject:v5 forKey:@"HMRemovedUserInfoCodingKeyName"];

  v6 = [(HMRemovedUserInfo *)self userUUID];
  [v4 encodeObject:v6 forKey:@"HMRemovedUserInfoCodingKeyUserUUID"];

  v7 = [(HMRemovedUserInfo *)self userID];
  [v4 encodeObject:v7 forKey:@"HMRemovedUserInfoCodingKeyUserID"];

  id v8 = [(HMRemovedUserInfo *)self dateRemoved];
  [v4 encodeObject:v8 forKey:@"HMRemovedUserInfoCodingKeyDateRemoved"];
}

- (unint64_t)hash
{
  v3 = [(HMRemovedUserInfo *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(HMRemovedUserInfo *)self userUUID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMRemovedUserInfo *)self userID];
  uint64_t v8 = [v7 hash];
  v9 = [(HMRemovedUserInfo *)self dateRemoved];
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
  v7 = [(HMRemovedUserInfo *)self name];
  uint64_t v8 = [v6 name];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_9;
  }
  unint64_t v10 = [(HMRemovedUserInfo *)self userUUID];
  id v11 = [v6 userUUID];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_9;
  }
  v13 = [(HMRemovedUserInfo *)self userID];
  v14 = [v6 userID];
  int v15 = HMFEqualObjects();

  if (v15)
  {
    v16 = [(HMRemovedUserInfo *)self dateRemoved];
    id v17 = [v6 dateRemoved];
    char v18 = HMFEqualObjects();
  }
  else
  {
LABEL_9:
    char v18 = 0;
  }

  return v18;
}

- (HMRemovedUserInfo)initWithName:(id)a3 userUUID:(id)a4 userID:(id)a5 dateRemoved:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMRemovedUserInfo;
  v14 = [(HMRemovedUserInfo *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    userUUID = v14->_userUUID;
    v14->_userUUID = (NSUUID *)v17;

    uint64_t v19 = [v12 copy];
    userID = v14->_userID;
    v14->_userID = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    dateRemoved = v14->_dateRemoved;
    v14->_dateRemoved = (NSDate *)v21;
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