@interface HMDSParticipant
- (DSIdentifiable)identity;
- (HMDSParticipant)initWithRole:(int64_t)a3 permission:(int64_t)a4 identity:(id)a5 homeUniqueIdentifier:(id)a6;
- (NSUUID)homeUniqueIdentifier;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation HMDSParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (NSUUID)homeUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (DSIdentifiable)identity
{
  return self->_identity;
}

- (int64_t)permission
{
  return self->_permission;
}

- (int64_t)role
{
  return self->_role;
}

- (HMDSParticipant)initWithRole:(int64_t)a3 permission:(int64_t)a4 identity:(id)a5 homeUniqueIdentifier:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDSParticipant;
  v13 = [(HMDSParticipant *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_role = a3;
    v13->_permission = a4;
    objc_storeStrong((id *)&v13->_identity, a5);
    objc_storeStrong((id *)&v14->_homeUniqueIdentifier, a6);
  }

  return v14;
}

@end