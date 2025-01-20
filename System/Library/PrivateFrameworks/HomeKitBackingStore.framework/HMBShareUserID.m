@interface HMBShareUserID
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (CKRecordID)userRecordID;
- (HMBShareUserID)initWithCoder:(id)a3;
- (HMBShareUserID)initWithUserRecordID:(id)a3;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMBShareUserID

- (void).cxx_destruct
{
}

- (CKRecordID)userRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMBShareUserID *)self userRecordID];
  [v4 encodeObject:v5 forKey:@"HMBShareUserID.CodingKey.UserRecordID"];
}

- (HMBShareUserID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBShareUserID.CodingKey.UserRecordID"];

  if (v5)
  {
    self = [(HMBShareUserID *)self initWithUserRecordID:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(HMBShareUserID *)self userRecordID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMBShareUserID *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(HMBShareUserID *)self userRecordID];
      v7 = [(HMBShareUserID *)v5 userRecordID];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBShareUserID *)self userRecordID];
  id v5 = (void *)[v3 initWithName:@"userRecordID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMBShareUserID *)self userRecordID];
  id v3 = [v2 recordName];

  return v3;
}

- (HMBShareUserID)initWithUserRecordID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMBShareUserID;
    v7 = [(HMBShareUserID *)&v12 init];
    char v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_userRecordID, a3);
    }

    return v8;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (HMBShareUserID *)+[HMBShareUserID supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1) {
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_2077);
  }
  v2 = (void *)logCategory__hmf_once_v1;
  return v2;
}

uint64_t __29__HMBShareUserID_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1;
  logCategory__hmf_once_uint64_t v1 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end