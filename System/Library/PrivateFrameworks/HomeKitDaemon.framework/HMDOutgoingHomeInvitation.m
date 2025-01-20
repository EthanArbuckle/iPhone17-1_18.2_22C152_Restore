@interface HMDOutgoingHomeInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isComplete;
- (BOOL)refreshDisplayName;
- (BOOL)responseReceived;
- (HMDOutgoingHomeInvitation)initWithCoder:(id)a3;
- (HMDOutgoingHomeInvitation)initWithInvitee:(id)a3 invitationState:(int64_t)a4 forHome:(id)a5 expiryDate:(id)a6 messageIdentifier:(id)a7;
- (HMDOutgoingHomeInvitation)initWithUUID:(id)a3 invitee:(id)a4 invitationState:(int64_t)a5 forHome:(id)a6 expiryDate:(id)a7 messageIdentifier:(id)a8;
- (HMDUser)user;
- (NSArray)accessoryInvitationsInformation;
- (NSArray)operationIdentifiers;
- (NSArray)uuidsOfAllowedAccessories;
- (NSDate)dateSent;
- (NSNumber)announceAccessLevel;
- (NSString)accessCode;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)inviteeDestinationAddress;
- (NSUUID)messageIdentifier;
- (NSUUID)pendingUserUUID;
- (NSUUID)uuid;
- (id)describeWithFormat;
- (id)emptyModelObjectWithChangeType:(unint64_t)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)shortDescription;
- (void)_transactionOutgoingInvitationUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)notifyStateChangedForMessage:(id)a3;
- (void)setAccessCode:(id)a3;
- (void)setAnnounceAccessLevel:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setInviteeDestinationAddress:(id)a3;
- (void)setOperationIdentifiers:(id)a3;
- (void)setPendingUserUUID:(id)a3;
- (void)setUser:(id)a3;
- (void)setUuidsOfAllowedAccessories:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateInvitationState:(int64_t)a3;
@end

@implementation HMDOutgoingHomeInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUserUUID, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_announceAccessLevel, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_uuidsOfAllowedAccessories, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_inviteeDestinationAddress, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_operationIdentifiers, 0);
}

- (void)setPendingUserUUID:(id)a3
{
}

- (NSUUID)pendingUserUUID
{
  return self->_pendingUserUUID;
}

- (void)setAccessCode:(id)a3
{
}

- (NSString)accessCode
{
  return self->_accessCode;
}

- (void)setAnnounceAccessLevel:(id)a3
{
}

- (NSNumber)announceAccessLevel
{
  return self->_announceAccessLevel;
}

- (void)setDateSent:(id)a3
{
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setUuidsOfAllowedAccessories:(id)a3
{
}

- (NSArray)uuidsOfAllowedAccessories
{
  return self->_uuidsOfAllowedAccessories;
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setInviteeDestinationAddress:(id)a3
{
}

- (NSString)inviteeDestinationAddress
{
  return self->_inviteeDestinationAddress;
}

- (void)setUser:(id)a3
{
}

- (HMDUser)user
{
  return self->_user;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  v5 = -[HMDOutgoingHomeInvitation emptyModelObjectWithChangeType:](self, "emptyModelObjectWithChangeType:", a3, a4);
  v6 = [(HMDOutgoingHomeInvitation *)self user];
  v7 = [v6 dictionaryEncoding];
  [v5 setUser:v7];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeInvitation invitationState](self, "invitationState"));
  [v5 setInvitationState:v8];

  v9 = [(HMDHomeInvitation *)self endDate];
  [v5 setExpiryDate:v9];

  v10 = [(HMDOutgoingHomeInvitation *)self messageIdentifier];
  v11 = [v10 UUIDString];
  [v5 setMessageIdentifier:v11];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDOutgoingHomeInvitation responseReceived](self, "responseReceived"));
  [v5 setResponseReceived:v12];

  v13 = [(HMDOutgoingHomeInvitation *)self inviteeDestinationAddress];
  [v5 setInviteeDestinationAddress:v13];

  v14 = [(HMDHomeInvitation *)self idsInvitationUUID];
  [v5 setIdsInvitationUUID:v14];

  v15 = NSNumber;
  v16 = [(HMDOutgoingHomeInvitation *)self user];
  v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "announceAccessLevel"));
  [v5 setAnnounceAccessLevel:v17];

  v18 = [(HMDOutgoingHomeInvitation *)self user];
  v19 = [v18 accessCode];
  [v5 setAccessCode:v19];

  v20 = [(HMDOutgoingHomeInvitation *)self user];
  v21 = [v20 uuid];
  [v5 setPendingUserUUID:v21];

  v22 = [(HMDOutgoingHomeInvitation *)self user];
  v23 = [v22 restrictedGuestAccessSettings];
  v24 = [v23 uuidsOfAllowedAccessories];
  [v5 setUuidsOfAllowedAccessories:v24];

  return v5;
}

- (id)emptyModelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDOutgoingHomeInvitationModel alloc];
  v6 = [(HMDHomeInvitation *)self identifier];
  v7 = [(HMDHomeInvitation *)self home];
  v8 = [v7 uuid];
  v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v6 uuid];
    v13 = [v6 parentUUID];
    int v14 = 138543874;
    v15 = v11;
    __int16 v16 = 2112;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Outgoing invitations have no objects to remove. Transaction UUID: %@, Parent UUID: %@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)_transactionOutgoingInvitationUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 user];

  if (v11)
  {
    v12 = [v9 user];
    [(HMDOutgoingHomeInvitation *)self updateUser:v12];
  }
  v13 = [v9 expiryDate];

  if (v13)
  {
    int v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      __int16 v18 = [(HMDHomeInvitation *)v15 endDate];
      v19 = [v9 expiryDate];
      int v52 = 138543874;
      v53 = v17;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v18;
      __int16 v56 = 2112;
      v57 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Expiry date is updated from: %@ to %@", (uint8_t *)&v52, 0x20u);
    }
    uint64_t v20 = [v9 expiryDate];
    [(HMDHomeInvitation *)v15 setEndDate:v20];
  }
  v21 = [v9 messageIdentifier];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x263F08C38]);
    v23 = [v9 messageIdentifier];
    v24 = (NSUUID *)[v22 initWithUUIDString:v23];
    messageIdentifier = self->_messageIdentifier;
    self->_messageIdentifier = v24;
  }
  v26 = [v9 inviteeDestinationAddress];

  if (v26)
  {
    v27 = [v9 inviteeDestinationAddress];
    [(HMDOutgoingHomeInvitation *)self setInviteeDestinationAddress:v27];
  }
  v28 = [v9 idsInvitationUUID];

  if (v28)
  {
    v29 = [v9 idsInvitationUUID];
    [(HMDHomeInvitation *)self setIdsInvitationUUID:v29];
  }
  v30 = [v9 dateSent];

  if (v30)
  {
    v31 = [v9 dateSent];
    [(HMDOutgoingHomeInvitation *)self setDateSent:v31];
  }
  v32 = [v9 accessCode];

  if (v32)
  {
    v33 = [v9 accessCode];
    [(HMDOutgoingHomeInvitation *)self setAccessCode:v33];
  }
  v34 = [v9 announceAccessLevel];

  if (v34)
  {
    v35 = [v9 announceAccessLevel];
    [(HMDOutgoingHomeInvitation *)self setAnnounceAccessLevel:v35];
  }
  v36 = [v9 pendingUserUUID];

  if (v36)
  {
    v37 = [v9 pendingUserUUID];
    [(HMDOutgoingHomeInvitation *)self setPendingUserUUID:v37];
  }
  v38 = [v9 invitationState];

  if (v38)
  {
    v39 = [v9 invitationState];
    if ([v39 integerValue] == 2)
    {
      int64_t v40 = [(HMDHomeInvitation *)self invitationState];

      if (v40 != 2)
      {
        v41 = (void *)MEMORY[0x230FBD990]();
        v42 = self;
        v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = HMFGetLogIdentifier();
          uint64_t v45 = [(HMDHomeInvitation *)v42 invitationState];
          int v52 = 138543618;
          v53 = v44;
          __int16 v54 = 2048;
          uint64_t v55 = v45;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Invitation state cannot be set back to pending, maintaining current state as %lu", (uint8_t *)&v52, 0x16u);
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    v46 = [v9 invitationState];
    -[HMDOutgoingHomeInvitation updateInvitationState:](self, "updateInvitationState:", [v46 integerValue]);
  }
LABEL_29:
  v47 = [v9 uuidsOfAllowedAccessories];

  if (v47)
  {
    v48 = [v9 uuidsOfAllowedAccessories];
    [(HMDOutgoingHomeInvitation *)self setUuidsOfAllowedAccessories:v48];
  }
  v49 = [v10 transactionResult];
  [v49 markChanged];
  v50 = [v10 responseHandler];

  if (v50)
  {
    v51 = [v10 responseHandler];
    v51[2](v51, 0, 0);
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v10;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (v9) {
    [(HMDOutgoingHomeInvitation *)self _transactionOutgoingInvitationUpdated:0 newValues:v9 message:v7];
  }
}

- (void)setOperationIdentifiers:(id)a3
{
  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  operationIdentifiers = self->_operationIdentifiers;
  self->_operationIdentifiers = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)operationIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSArray *)self->_operationIdentifiers copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)updateInvitationState:(int64_t)a3
{
  int64_t v5 = [(HMDHomeInvitation *)self invitationState];
  v6.receiver = self;
  v6.super_class = (Class)HMDOutgoingHomeInvitation;
  [(HMDHomeInvitation *)&v6 updateInvitationState:a3];
  if ([(HMDHomeInvitation *)self invitationState] != v5) {
    [(HMDOutgoingHomeInvitation *)self notifyStateChangedForMessage:0];
  }
}

- (void)notifyStateChangedForMessage:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(HMDHomeInvitation *)self invitationData];
  v26[0] = v5;
  objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v7 = encodeRootObject();

  id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  id v9 = [(HMDOutgoingHomeInvitation *)self accessoryInvitationsInformation];
  if (v9)
  {
    v24[0] = @"kInvitationIdentifierKey";
    id v10 = [(HMDHomeInvitation *)self identifier];
    v11 = [v10 UUIDString];
    v24[1] = @"kAccessoryInvitationsKey";
    v25[0] = v11;
    v25[1] = v9;
    v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v8 addObject:v12];
  }
  v13 = encodeRootObject();
  v22[0] = @"kInvitationsDataKey";
  v22[1] = @"kAccessoryInvitationsDataKey";
  v23[0] = v7;
  v23[1] = v13;
  int v14 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v15 = [v4 identifier];

  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = [MEMORY[0x263F08C38] UUID];
  }
  v17 = v16;

  __int16 v18 = [MEMORY[0x263F42568] entitledMessageWithName:@"kUserInvitationsUpdatedNotificationKey" identifier:v17 messagePayload:v14];
  v19 = [(HMDHomeInvitation *)self home];
  uint64_t v20 = [v19 msgDispatcher];
  v21 = [v19 uuid];
  [v20 sendMessage:v18 target:v21];
}

- (BOOL)refreshDisplayName
{
  v3 = [(HMDOutgoingHomeInvitation *)self user];
  int v4 = [v3 refreshDisplayName];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(HMDHomeInvitation *)self invitationData];
  objc_opt_class();
  objc_super v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v5 : 0;
  id v7 = v6;

  if (!v7) {
    return 0;
  }
  id v8 = [(HMDOutgoingHomeInvitation *)self user];
  id v9 = [v8 displayName];
  [v7 setInviteeName:v9];

  return 1;
}

- (id)describeWithFormat
{
  v3 = [MEMORY[0x263F089D8] string];
  v10.receiver = self;
  v10.super_class = (Class)HMDOutgoingHomeInvitation;
  int v4 = [(HMDHomeInvitation *)&v10 describeWithFormat];
  [v3 appendFormat:@"%@", v4];

  int64_t v5 = [(HMDOutgoingHomeInvitation *)self user];
  objc_super v6 = [v5 userID];
  id v7 = [(HMDOutgoingHomeInvitation *)self user];
  id v8 = [v7 displayName];
  [v3 appendFormat:@"type = Outgoing, invitee email = %@ invitee name = %@", v6, v8];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDOutgoingHomeInvitation;
  [(HMDHomeInvitation *)&v16 encodeWithCoder:v4];
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    int64_t v5 = (void *)MEMORY[0x263EFF980];
    objc_super v6 = [(HMDHomeInvitation *)self operations];
    id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    [v4 encodeObject:v7 forKey:@"HM.accessoryInvitations"];
  }
  id v8 = [(HMDOutgoingHomeInvitation *)self user];
  int v9 = [v8 isRemoteGateway];

  objc_super v10 = [(HMDOutgoingHomeInvitation *)self user];
  if (v9) {
    v11 = @"HM.residentDevice";
  }
  else {
    v11 = @"HM.user";
  }
  [v4 encodeObject:v10 forKey:v11];

  v12 = [(HMDOutgoingHomeInvitation *)self inviteeDestinationAddress];

  if (v12)
  {
    v13 = [(HMDOutgoingHomeInvitation *)self inviteeDestinationAddress];
    [v4 encodeObject:v13 forKey:@"HM.inviteeDestinationAddress"];
  }
  int v14 = [(HMDOutgoingHomeInvitation *)self user];
  v15 = [v14 restrictedGuestAccessSettings];
  [v4 encodeObject:v15 forKey:*MEMORY[0x263F0D568]];
}

- (HMDOutgoingHomeInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.invitationData"];
  v20.receiver = self;
  v20.super_class = (Class)HMDOutgoingHomeInvitation;
  objc_super v6 = [(HMDHomeInvitation *)&v20 initWithCoder:v4 invitationData:v5];
  if (v6)
  {
    if ([v4 containsValueForKey:@"HM.residentDevice"])
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.residentDevice"];
      user = v6->_user;
      v6->_user = (HMDUser *)v7;
    }
    else
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];
      objc_super v10 = v6->_user;
      v6->_user = (HMDUser *)v9;

      user = [(HMDUser *)v6->_user displayName];
      v11 = [v5 inviteeName];
      char v12 = [user isEqual:v11];

      if ((v12 & 1) == 0) {
        [v5 setInviteeName:user];
      }
    }

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.inviteeDestinationAddress"];
    inviteeDestinationAddress = v6->_inviteeDestinationAddress;
    v6->_inviteeDestinationAddress = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D568]];
    [(HMDUser *)v6->_user setRestrictedGuestAccessSettings:v15];

    objc_super v16 = [(HMDUser *)v6->_user restrictedGuestAccessSettings];
    uint64_t v17 = [v16 uuidsOfAllowedAccessories];
    uuidsOfAllowedAccessories = v6->_uuidsOfAllowedAccessories;
    v6->_uuidsOfAllowedAccessories = (NSArray *)v17;
  }
  return v6;
}

- (NSArray)accessoryInvitationsInformation
{
  v2 = (void *)MEMORY[0x263EFF980];
  v3 = [(HMDHomeInvitation *)self operations];
  id v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  return (NSArray *)v4;
}

- (void)cancel
{
}

- (BOOL)isComplete
{
  BOOL v3 = [(HMDOutgoingHomeInvitation *)self responseReceived];
  if (v3)
  {
    BOOL v3 = [(HMDHomeInvitation *)self isAccepted];
    if (v3) {
      LOBYTE(v3) = ![(HMDHomeInvitation *)self isDeclined];
    }
  }
  return v3;
}

- (BOOL)responseReceived
{
  if ([(HMDHomeInvitation *)self isAccepted]) {
    return 1;
  }
  return [(HMDHomeInvitation *)self isDeclined];
}

- (NSString)description
{
  BOOL v3 = NSString;
  id v4 = [(HMDOutgoingHomeInvitation *)self shortDescription];
  int64_t v5 = [(HMDHomeInvitation *)self identifier];
  objc_super v6 = [(HMDOutgoingHomeInvitation *)self user];
  int64_t v7 = [(HMDHomeInvitation *)self invitationState];
  id v8 = [(HMDHomeInvitation *)self operations];
  uint64_t v9 = [v3 stringWithFormat:@"<%@, Identifier = %@, Invitee = %@, State = %tu, Operations = %@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(HMDHomeInvitation *)self identifier];
  objc_super v6 = [(HMDOutgoingHomeInvitation *)self user];
  int64_t v7 = [(HMDHomeInvitation *)self invitationState];
  id v8 = [(HMDHomeInvitation *)self operations];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ %p, Identifier = %@, Invitee = %@, State = %tu, Operations = %@>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(HMDHomeInvitation *)self identifier];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (HMDOutgoingHomeInvitation)initWithUUID:(id)a3 invitee:(id)a4 invitationState:(int64_t)a5 forHome:(id)a6 expiryDate:(id)a7 messageIdentifier:(id)a8
{
  id v15 = a4;
  id obj = a8;
  id v27 = a8;
  objc_super v16 = (objc_class *)MEMORY[0x263F0E610];
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  id v20 = [v16 alloc];
  v21 = [v15 userID];
  id v22 = [v15 displayName];
  v23 = (void *)[v20 initWithUUID:v19 inviteeUserID:v21 inviteeName:v22 invitationState:a5 expiryDate:v17];

  v28.receiver = self;
  v28.super_class = (Class)HMDOutgoingHomeInvitation;
  v24 = [(HMDHomeInvitation *)&v28 initWithInvitationData:v23 forHome:v18];

  if (v24)
  {
    objc_storeStrong((id *)&v24->_user, a4);
    objc_storeStrong((id *)&v24->_messageIdentifier, obj);
  }

  return v24;
}

- (HMDOutgoingHomeInvitation)initWithInvitee:(id)a3 invitationState:(int64_t)a4 forHome:(id)a5 expiryDate:(id)a6 messageIdentifier:(id)a7
{
  return [(HMDOutgoingHomeInvitation *)self initWithUUID:0 invitee:a3 invitationState:a4 forHome:a5 expiryDate:a6 messageIdentifier:a7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end