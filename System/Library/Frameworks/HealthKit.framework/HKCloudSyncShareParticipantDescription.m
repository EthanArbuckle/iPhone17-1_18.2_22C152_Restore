@interface HKCloudSyncShareParticipantDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncShareParticipantDescription)initWithCoder:(id)a3;
- (HKCloudSyncShareParticipantDescription)initWithIdentity:(id)a3 role:(id)a4 acceptanceStatus:(id)a5 permission:(id)a6;
- (NSString)acceptanceStatus;
- (NSString)identity;
- (NSString)permission;
- (NSString)role;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncShareParticipantDescription

- (HKCloudSyncShareParticipantDescription)initWithIdentity:(id)a3 role:(id)a4 acceptanceStatus:(id)a5 permission:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKCloudSyncShareParticipantDescription;
  v14 = [(HKCloudSyncShareParticipantDescription *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identity = v14->_identity;
    v14->_identity = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    role = v14->_role;
    v14->_role = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    acceptanceStatus = v14->_acceptanceStatus;
    v14->_acceptanceStatus = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    permission = v14->_permission;
    v14->_permission = (NSString *)v21;
  }
  return v14;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Identity: %@, Role: %@, Status: %@, Permission: %@", self->_identity, self->_role, self->_acceptanceStatus, self->_permission];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identity = self->_identity;
  id v5 = a3;
  [v5 encodeObject:identity forKey:@"Identity"];
  [v5 encodeObject:self->_role forKey:@"Role"];
  [v5 encodeObject:self->_acceptanceStatus forKey:@"AcceptanceStatus"];
  [v5 encodeObject:self->_permission forKey:@"Permission"];
}

- (HKCloudSyncShareParticipantDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Role"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AcceptanceStatus"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Permission"];

  v9 = [(HKCloudSyncShareParticipantDescription *)self initWithIdentity:v5 role:v6 acceptanceStatus:v7 permission:v8];
  return v9;
}

- (NSString)identity
{
  return self->_identity;
}

- (NSString)role
{
  return self->_role;
}

- (NSString)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (NSString)permission
{
  return self->_permission;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permission, 0);
  objc_storeStrong((id *)&self->_acceptanceStatus, 0);
  objc_storeStrong((id *)&self->_role, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end