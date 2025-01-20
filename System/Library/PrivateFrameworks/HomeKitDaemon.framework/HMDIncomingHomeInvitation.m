@interface HMDIncomingHomeInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)homeHasCameras;
- (BOOL)refreshDisplayName;
- (HMDAccount)inviterAccount;
- (HMDIncomingHomeInvitation)initWithCoder:(id)a3;
- (HMDIncomingHomeInvitation)initWithInviterAccount:(id)a3 invitationIdentifier:(id)a4 invitationState:(int64_t)a5 homeName:(id)a6 homeUUID:(id)a7 inviterIdentity:(id)a8 expiryDate:(id)a9;
- (HMDIncomingHomeInvitation)initWithInviterAccount:(id)a3 invitationIdentifier:(id)a4 invitationState:(int64_t)a5 homeName:(id)a6 homeUUID:(id)a7 inviterIdentity:(id)a8 inviterMergeID:(id)a9 expiryDate:(id)a10;
- (HMFPairingIdentity)inviterIdentity;
- (HMRestrictedGuestHomeAccessSchedule)restrictedGuestSchedule;
- (NSDictionary)bulletinContext;
- (NSString)homeName;
- (NSString)inviterMergeID;
- (NSString)inviterUserID;
- (NSUUID)homeUUID;
- (id)describeWithFormat;
- (unint64_t)inviteePrivilege;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeHasCameras:(BOOL)a3;
- (void)setInviteePrivilege:(unint64_t)a3;
- (void)setRestrictedGuestSchedule:(id)a3;
@end

@implementation HMDIncomingHomeInvitation

- (NSDictionary)bulletinContext
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"homeIncomingInvitation";
  v2 = [(HMDHomeInvitation *)self identifier];
  v3 = [v2 UUIDString];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedGuestSchedule, 0);
  objc_storeStrong((id *)&self->_inviterMergeID, 0);
  objc_storeStrong((id *)&self->_inviterIdentity, 0);
  objc_storeStrong((id *)&self->_inviterAccount, 0);
}

- (void)setRestrictedGuestSchedule:(id)a3
{
}

- (HMRestrictedGuestHomeAccessSchedule)restrictedGuestSchedule
{
  return self->_restrictedGuestSchedule;
}

- (void)setInviteePrivilege:(unint64_t)a3
{
  self->_inviteePrivilege = a3;
}

- (unint64_t)inviteePrivilege
{
  return self->_inviteePrivilege;
}

- (void)setHomeHasCameras:(BOOL)a3
{
  self->_homeHasCameras = a3;
}

- (BOOL)homeHasCameras
{
  return self->_homeHasCameras;
}

- (NSString)inviterMergeID
{
  return self->_inviterMergeID;
}

- (HMFPairingIdentity)inviterIdentity
{
  return (HMFPairingIdentity *)objc_getProperty(self, a2, 112, 1);
}

- (HMDAccount)inviterAccount
{
  return (HMDAccount *)objc_getProperty(self, a2, 104, 1);
}

- (id)describeWithFormat
{
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = [MEMORY[0x263F089D8] string];
  v20.receiver = self;
  v20.super_class = (Class)HMDIncomingHomeInvitation;
  v5 = [(HMDHomeInvitation *)&v20 describeWithFormat];
  [v4 appendFormat:@"%@", v5];

  v6 = [(HMDHomeInvitation *)self invitationData];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [(HMDIncomingHomeInvitation *)self inviterUserID];
  v10 = [v8 inviterName];

  v11 = [(HMDIncomingHomeInvitation *)self homeName];
  v12 = [(HMDIncomingHomeInvitation *)self homeUUID];
  v13 = [v12 UUIDString];
  [v4 appendFormat:@"type = Incoming, inviter email = %@ inviter name = %@ home = %@ (%@)", v9, v10, v11, v13];

  unint64_t v14 = [(HMDIncomingHomeInvitation *)self inviteePrivilege];
  if (v14 > 5) {
    v15 = @"None";
  }
  else {
    v15 = off_264A29920[v14];
  }
  v16 = v15;
  v17 = [(HMDIncomingHomeInvitation *)self restrictedGuestSchedule];
  [v4 appendFormat:@"Privilege = %@, RG Schedule = %@", v16, v17];

  v18 = (void *)[v4 copy];
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDIncomingHomeInvitation;
  [(HMDHomeInvitation *)&v15 encodeWithCoder:v4];
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    v5 = [(HMDIncomingHomeInvitation *)self inviterIdentity];
    v6 = [v5 identifier];
    [v4 encodeObject:v6 forKey:@"pairingUsername"];

    v7 = [(HMDIncomingHomeInvitation *)self inviterIdentity];
    id v8 = [v7 publicKey];
    v9 = [v8 data];
    [v4 encodeObject:v9 forKey:@"userPublicKey"];

    v10 = [(HMDIncomingHomeInvitation *)self inviterAccount];
    [v4 encodeObject:v10 forKey:@"HM.account"];

    v11 = [(HMDIncomingHomeInvitation *)self inviterMergeID];
    [v4 encodeObject:v11 forKey:@"mergeID"];
  }
  BOOL v12 = [(HMDIncomingHomeInvitation *)self homeHasCameras];
  [v4 encodeBool:v12 forKey:*MEMORY[0x263F0CFB8]];
  BOOL v13 = [(HMDIncomingHomeInvitation *)self inviteePrivilege] == 5;
  [v4 encodeBool:v13 forKey:*MEMORY[0x263F0DC78]];
  unint64_t v14 = [(HMDIncomingHomeInvitation *)self restrictedGuestSchedule];
  [v4 encodeObject:v14 forKey:*MEMORY[0x263F0D560]];
}

- (HMDIncomingHomeInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.invitationData"];
  v24.receiver = self;
  v24.super_class = (Class)HMDIncomingHomeInvitation;
  v6 = [(HMDHomeInvitation *)&v24 initWithCoder:v4 invitationData:v5];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F425F0]);
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userPublicKey"];
    v9 = (void *)[v7 initWithPairingKeyData:v8];

    id v10 = objc_alloc(MEMORY[0x263F425E8]);
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingUsername"];
    uint64_t v12 = [v10 initWithIdentifier:v11 publicKey:v9 privateKey:0];
    inviterIdentity = v6->_inviterIdentity;
    v6->_inviterIdentity = (HMFPairingIdentity *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mergeID"];
    inviterMergeID = v6->_inviterMergeID;
    v6->_inviterMergeID = (NSString *)v14;

    if ([v4 containsValueForKey:@"HM.account"])
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.account"];
      inviterAccount = v6->_inviterAccount;
      v6->_inviterAccount = (HMDAccount *)v16;
    }
    else
    {
      v18 = +[HMDAccountHandleFormatter defaultFormatter];
      v19 = [v5 inviterUserID];
      inviterAccount = [v18 accountHandleFromString:v19];

      objc_super v20 = +[HMDAccountRegistry sharedRegistry];
      uint64_t v21 = [v20 accountForHandle:inviterAccount];
      v22 = v6->_inviterAccount;
      v6->_inviterAccount = (HMDAccount *)v21;
    }
    [(HMDIncomingHomeInvitation *)v6 refreshDisplayName];
  }
  return v6;
}

- (BOOL)refreshDisplayName
{
  v3 = [(HMDHomeInvitation *)self invitationData];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [(HMDIncomingHomeInvitation *)self inviterAccount];
    id v7 = [v6 name];

    id v8 = [v5 inviterName];
    char v9 = HMFEqualObjects();
    if ((v9 & 1) == 0) {
      [v5 setInviterName:v7];
    }
    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)inviterUserID
{
  v2 = [(HMDHomeInvitation *)self invitationData];
  v3 = [v2 inviterUserID];

  return (NSString *)v3;
}

- (NSUUID)homeUUID
{
  v2 = [(HMDHomeInvitation *)self invitationData];
  v3 = [v2 homeUUID];

  return (NSUUID *)v3;
}

- (NSString)homeName
{
  v2 = [(HMDHomeInvitation *)self invitationData];
  v3 = [v2 homeName];

  return (NSString *)v3;
}

- (HMDIncomingHomeInvitation)initWithInviterAccount:(id)a3 invitationIdentifier:(id)a4 invitationState:(int64_t)a5 homeName:(id)a6 homeUUID:(id)a7 inviterIdentity:(id)a8 inviterMergeID:(id)a9 expiryDate:(id)a10
{
  id v14 = a3;
  id v35 = a8;
  id v33 = a9;
  id v15 = a10;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  v19 = [v14 name];
  id v20 = objc_alloc(MEMORY[0x263F0E410]);
  v37 = v14;
  uint64_t v21 = [v14 handles];
  v22 = [v21 firstObject];
  v23 = [v22 remoteDestinationString];
  objc_super v24 = (void *)[v20 initWithInviterUserID:v23 invitationIdentifier:v18 inviterName:v19 invitationState:a5 homeName:v17 homeUUID:v16 expiryDate:v15];

  v38.receiver = self;
  v38.super_class = (Class)HMDIncomingHomeInvitation;
  v25 = [(HMDHomeInvitation *)&v38 initWithInvitationData:v24 forHome:0];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_inviterAccount, a3);
    uint64_t v27 = [v35 copy];
    inviterIdentity = v26->_inviterIdentity;
    v26->_inviterIdentity = (HMFPairingIdentity *)v27;

    uint64_t v29 = [v33 copy];
    inviterMergeID = v26->_inviterMergeID;
    v26->_inviterMergeID = (NSString *)v29;
  }
  return v26;
}

- (HMDIncomingHomeInvitation)initWithInviterAccount:(id)a3 invitationIdentifier:(id)a4 invitationState:(int64_t)a5 homeName:(id)a6 homeUUID:(id)a7 inviterIdentity:(id)a8 expiryDate:(id)a9
{
  return [(HMDIncomingHomeInvitation *)self initWithInviterAccount:a3 invitationIdentifier:a4 invitationState:a5 homeName:a6 homeUUID:a7 inviterIdentity:a8 inviterMergeID:0 expiryDate:a9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end