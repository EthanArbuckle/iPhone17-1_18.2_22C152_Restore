@interface MTSThreadNetworkAssociation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MTSThreadNetworkAssociation)initWithCoder:(id)a3;
- (MTSThreadNetworkAssociation)initWithExtendedPANID:(id)a3;
- (NSNumber)extendedPANID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSThreadNetworkAssociation

- (void).cxx_destruct
{
}

- (NSNumber)extendedPANID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSThreadNetworkAssociation *)self extendedPANID];
  [v4 encodeObject:v5 forKey:@"MTSTNA.ck.extendedPANID"];
}

- (MTSThreadNetworkAssociation)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSTNA.ck.extendedPANID"];
  if (v5)
  {
    v6 = [(MTSThreadNetworkAssociation *)self initWithExtendedPANID:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x245697870]();
    v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded extendedPANID: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MTSThreadNetworkAssociation *)self extendedPANID];
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
    v7 = [(MTSThreadNetworkAssociation *)self extendedPANID];
    v8 = [v6 extendedPANID];
    char v9 = [v7 isEqualToNumber:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (MTSThreadNetworkAssociation)initWithExtendedPANID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSThreadNetworkAssociation;
    v7 = [(MTSThreadNetworkAssociation *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_extendedPANID, a3);
    }

    return v8;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (MTSThreadNetworkAssociation *)+[MTSThreadNetworkAssociation supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end