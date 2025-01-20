@interface HMDSParticipantObject
+ (id)homeParticipantObjectWithAccessCode:(id)a3;
+ (id)homeParticipantObjectWithOutgoingInvitation:(id)a3;
+ (id)homeParticipantObjectWithUser:(id)a3;
- (HMDSParticipantObject)initWithUser:(id)a3 accessCode:(id)a4 outgoingInvitation:(id)a5;
- (HMHomeAccessCode)accessCode;
- (HMOutgoingHomeInvitation)outgoingInvitation;
- (HMUser)user;
@end

@implementation HMDSParticipantObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingInvitation, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

- (HMOutgoingHomeInvitation)outgoingInvitation
{
  return (HMOutgoingHomeInvitation *)objc_getProperty(self, a2, 24, 1);
}

- (HMHomeAccessCode)accessCode
{
  return (HMHomeAccessCode *)objc_getProperty(self, a2, 16, 1);
}

- (HMUser)user
{
  return (HMUser *)objc_getProperty(self, a2, 8, 1);
}

- (HMDSParticipantObject)initWithUser:(id)a3 accessCode:(id)a4 outgoingInvitation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSParticipantObject;
  v12 = [(HMDSParticipantObject *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_user, a3);
    objc_storeStrong((id *)&v13->_accessCode, a4);
    objc_storeStrong((id *)&v13->_outgoingInvitation, a5);
  }

  return v13;
}

+ (id)homeParticipantObjectWithOutgoingInvitation:(id)a3
{
  id v3 = a3;
  v4 = [[HMDSParticipantObject alloc] initWithUser:0 accessCode:0 outgoingInvitation:v3];

  return v4;
}

+ (id)homeParticipantObjectWithAccessCode:(id)a3
{
  id v3 = a3;
  v4 = [[HMDSParticipantObject alloc] initWithUser:0 accessCode:v3 outgoingInvitation:0];

  return v4;
}

+ (id)homeParticipantObjectWithUser:(id)a3
{
  id v3 = a3;
  v4 = [[HMDSParticipantObject alloc] initWithUser:v3 accessCode:0 outgoingInvitation:0];

  return v4;
}

@end