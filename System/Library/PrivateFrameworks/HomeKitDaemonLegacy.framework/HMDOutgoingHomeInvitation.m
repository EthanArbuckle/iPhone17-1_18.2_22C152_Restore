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
- (NSArray)operations;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)inviteeDestinationAddress;
- (NSUUID)messageIdentifier;
- (NSUUID)uuid;
- (id)describeWithFormat;
- (id)emptyModelObjectWithChangeType:(unint64_t)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)shortDescription;
- (void)_transactionOutgoingInvitationUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)notifyStateChangedForMessage:(id)a3;
- (void)processUserManagementOperationIdentifiers:(id)a3;
- (void)setInviteeDestinationAddress:(id)a3;
- (void)setOperationIdentifiers:(id)a3;
- (void)setUser:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateInvitationState:(int64_t)a3;
- (void)updateUserManagementOperations:(id)a3;
@end

@implementation HMDOutgoingHomeInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_inviteeDestinationAddress, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_operationIdentifiers, 0);
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v6 = [(HMDOutgoingHomeInvitation *)self emptyModelObjectWithChangeType:a3];
  v7 = [(HMDOutgoingHomeInvitation *)self user];
  v8 = [v7 dictionaryEncoding];
  [v6 setUser:v8];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeInvitation invitationState](self, "invitationState"));
  [v6 setInvitationState:v9];

  v10 = [(HMDHomeInvitation *)self endDate];
  [v6 setExpiryDate:v10];

  v11 = [(HMDOutgoingHomeInvitation *)self messageIdentifier];
  v12 = [v11 UUIDString];
  [v6 setMessageIdentifier:v12];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDOutgoingHomeInvitation responseReceived](self, "responseReceived"));
  [v6 setResponseReceived:v13];

  v14 = [(HMDOutgoingHomeInvitation *)self inviteeDestinationAddress];
  [v6 setInviteeDestinationAddress:v14];

  v15 = [(HMDOutgoingHomeInvitation *)self operationIdentifiers];
  v16 = (void *)[v15 mutableCopy];

  if (a4 <= 3)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v17 = [(HMDOutgoingHomeInvitation *)self operations];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v23 = [v22 accessory];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0 || !v23)
          {
            v25 = [v22 identifier];
            v26 = [v25 UUIDString];
            [v16 removeObject:v26];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }
  }
  if ([v16 count])
  {
    v27 = (void *)[v16 copy];
    [v6 setOperationIdentifiers:v27];
  }
  return v6;
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
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
    uint64_t v19 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Outgoing invitations have no objects to remove. Transaction UUID: %@, Parent UUID: %@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)_transactionOutgoingInvitationUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
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
    int v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      __int16 v18 = [(HMDHomeInvitation *)v15 endDate];
      uint64_t v19 = [v9 expiryDate];
      int v43 = 138543874;
      v44 = v17;
      __int16 v45 = 2112;
      uint64_t v46 = (uint64_t)v18;
      __int16 v47 = 2112;
      v48 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Expiry date is updated from: %@ to %@", (uint8_t *)&v43, 0x20u);
    }
    uint64_t v20 = [v9 expiryDate];
    [(HMDHomeInvitation *)v15 setEndDate:v20];
  }
  v21 = [v9 messageIdentifier];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F29128]);
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
  v28 = [v9 invitationState];

  if (v28)
  {
    long long v29 = [v9 invitationState];
    if ([v29 integerValue] == 2)
    {
      int64_t v30 = [(HMDHomeInvitation *)self invitationState];

      if (v30 != 2)
      {
        long long v31 = (void *)MEMORY[0x1D9452090]();
        long long v32 = self;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          uint64_t v35 = [(HMDHomeInvitation *)v32 invitationState];
          int v43 = 138543618;
          v44 = v34;
          __int16 v45 = 2048;
          uint64_t v46 = v35;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Invitation state cannot be set back to pending, maintaining current state as %lu", (uint8_t *)&v43, 0x16u);
        }
        goto LABEL_19;
      }
    }
    else
    {
    }
    v36 = [v9 invitationState];
    -[HMDOutgoingHomeInvitation updateInvitationState:](self, "updateInvitationState:", [v36 integerValue]);
  }
LABEL_19:
  v37 = [v9 operationIdentifiers];

  if (v37)
  {
    v38 = [v9 operationIdentifiers];
    [(HMDOutgoingHomeInvitation *)self processUserManagementOperationIdentifiers:v38];
  }
  else
  {
    v39 = [v9 operations];

    if (!v39) {
      goto LABEL_24;
    }
    v38 = [v9 operations];
    [(HMDOutgoingHomeInvitation *)self updateUserManagementOperations:v38];
  }

LABEL_24:
  v40 = [v10 transactionResult];
  [v40 markChanged];
  v41 = [v10 responseHandler];

  if (v41)
  {
    v42 = [v10 responseHandler];
    v42[2](v42, 0, 0);
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

- (void)processUserManagementOperationIdentifiers:(id)a3
{
  id v11 = a3;
  v4 = [(HMDHomeInvitation *)self home];
  v5 = [v4 homeManager];
  char v6 = [v5 operationsWithIdentifiers:v11 outOperations:0];

  if (v6)
  {
    [(HMDOutgoingHomeInvitation *)self setOperationIdentifiers:v11];
  }
  else
  {
    id v7 = [v4 backingStore];
    id v8 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v9 = [v7 transaction:@"kInviteAcceptedKey" options:v8];

    id v10 = [(HMDOutgoingHomeInvitation *)self modelObjectWithChangeType:3 version:4];
    [v9 add:v10];

    [v9 run];
  }
}

- (void)updateUserManagementOperations:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  char v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v41 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Migrating operations to models", buf, 0xCu);
  }
  id v9 = [(HMDHomeInvitation *)v6 home];
  id v10 = [v9 homeManager];
  id v11 = [v10 backingStore];
  v12 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  v13 = [v11 transaction:@"kUserManagementOperationAddedKey" options:v12];

  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = +[HMDUserManagementOperation operationWithDictionary:*(void *)(*((void *)&v36 + 1) + 8 * i) home:v9];
        uint64_t v20 = v19;
        if (v19 && ([v19 isFinished] & 1) == 0)
        {
          v21 = [v20 identifier];
          id v22 = [v21 UUIDString];
          [v35 addObject:v22];

          v23 = [v20 modelObjectWithChangeType:1];
          [v13 add:v23];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v16);
  }

  v24 = (void *)MEMORY[0x1D9452090]();
  v25 = v6;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v41 = v27;
    __int16 v42 = 2112;
    int v43 = v35;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Migrating operations with identifiers: %@", buf, 0x16u);
  }
  [v13 run];
  v28 = [HMDOutgoingHomeInvitationModel alloc];
  long long v29 = [(HMDHomeInvitation *)v25 identifier];
  int64_t v30 = [v9 uuid];
  long long v31 = [(HMDBackingStoreModelObject *)v28 initWithObjectChangeType:2 uuid:v29 parentUUID:v30];

  [(HMDOutgoingHomeInvitationModel *)v31 setOperations:0];
  [(HMDOutgoingHomeInvitationModel *)v31 setOperationIdentifiers:v35];
  long long v32 = [v9 backingStore];
  v33 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  uint64_t v34 = [v32 transaction:@"kUserManagementOperationAddedKey" options:v33];

  [v34 add:v31];
  [v34 run];
}

- (void)setOperationIdentifiers:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  operationIdentifiers = self->_operationIdentifiers;
  self->_operationIdentifiers = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)operationIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_operationIdentifiers copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)operations
{
  v3 = [(HMDHomeInvitation *)self home];
  id v4 = [v3 homeManager];
  v5 = [(HMDOutgoingHomeInvitation *)self operationIdentifiers];
  id v8 = 0;
  [v4 operationsWithIdentifiers:v5 outOperations:&v8];
  id v6 = v8;

  return (NSArray *)v6;
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
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(HMDHomeInvitation *)self invitationData];
  v26[0] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v7 = encodeRootObject();

  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  id v9 = [(HMDOutgoingHomeInvitation *)self accessoryInvitationsInformation];
  if (v9)
  {
    v24[0] = @"kInvitationIdentifierKey";
    id v10 = [(HMDHomeInvitation *)self identifier];
    id v11 = [v10 UUIDString];
    v24[1] = @"kAccessoryInvitationsKey";
    v25[0] = v11;
    v25[1] = v9;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v8 addObject:v12];
  }
  v13 = encodeRootObject();
  v22[0] = @"kInvitationsDataKey";
  v22[1] = @"kAccessoryInvitationsDataKey";
  v23[0] = v7;
  v23[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  uint64_t v15 = [v4 identifier];

  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F29128] UUID];
  }
  uint64_t v17 = v16;

  __int16 v18 = [MEMORY[0x1E4F65480] entitledMessageWithName:@"kUserInvitationsUpdatedNotificationKey" identifier:v17 messagePayload:v14];
  uint64_t v19 = [(HMDHomeInvitation *)self home];
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
  v3 = [MEMORY[0x1E4F28E78] string];
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HMDOutgoingHomeInvitation;
  [(HMDHomeInvitation *)&v43 encodeWithCoder:v4];
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    int64_t v5 = (void *)MEMORY[0x1E4F1CA48];
    objc_super v6 = [(HMDOutgoingHomeInvitation *)self operations];
    id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = [(HMDOutgoingHomeInvitation *)self operations];
    id v9 = (void *)[v8 copy];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) accessoryInvitation];
          if (v14) {
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v11);
    }

    [v4 encodeObject:v7 forKey:@"HM.accessoryInvitations"];
  }
  uint64_t v15 = [(HMDOutgoingHomeInvitation *)self user];
  int v16 = [v15 isRemoteGateway];

  uint64_t v17 = [(HMDOutgoingHomeInvitation *)self user];
  if (v16) {
    __int16 v18 = @"HM.residentDevice";
  }
  else {
    __int16 v18 = @"HM.user";
  }
  [v4 encodeObject:v17 forKey:v18];

  uint64_t v19 = [(HMDOutgoingHomeInvitation *)self operations];
  if (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    uint64_t v20 = objc_msgSend(v4, "hmd_supportedFeatures");
    char v21 = [v20 containsObject:&unk_1F2DC7510];

    if ((v21 & 1) == 0)
    {
      uint64_t v34 = self;
      id v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v19;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            long long v29 = [v28 accessory];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0 && v29) {
              [v22 addObject:v28];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v25);
      }

      uint64_t v19 = (void *)[v22 copy];
      self = v34;
    }
  }
  [v4 encodeObject:v19 forKey:@"kUserManagementOperationsKey"];
  long long v31 = [(HMDOutgoingHomeInvitation *)self operationIdentifiers];
  [v4 encodeObject:v31 forKey:@"kUserManagementOperationIdentifiersKey"];

  long long v32 = [(HMDOutgoingHomeInvitation *)self inviteeDestinationAddress];

  if (v32)
  {
    v33 = [(HMDOutgoingHomeInvitation *)self inviteeDestinationAddress];
    [v4 encodeObject:v33 forKey:@"HM.inviteeDestinationAddress"];
  }
}

- (HMDOutgoingHomeInvitation)initWithCoder:(id)a3
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.invitationData"];
  objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  id v8 = [v6 setWithArray:v7];
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kUserManagementOperationsKey"];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  uint64_t v12 = [v10 setWithArray:v11];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"kUserManagementOperationIdentifiersKey"];

  v41.receiver = self;
  v41.super_class = (Class)HMDOutgoingHomeInvitation;
  id v14 = [(HMDHomeInvitation *)&v41 initWithCoder:v4 invitationData:v5];
  if (v14)
  {
    if ([v4 containsValueForKey:@"HM.residentDevice"])
    {
      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.residentDevice"];
      user = v14->_user;
      v14->_user = (HMDUser *)v15;
    }
    else
    {
      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];
      __int16 v18 = v14->_user;
      v14->_user = (HMDUser *)v17;

      user = [(HMDUser *)v14->_user displayName];
      uint64_t v19 = [v5 inviteeName];
      char v20 = [user isEqual:v19];

      if ((v20 & 1) == 0) {
        [v5 setInviteeName:user];
      }
    }

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.inviteeDestinationAddress"];
    inviteeDestinationAddress = v14->_inviteeDestinationAddress;
    v14->_inviteeDestinationAddress = (NSString *)v21;

    if (v13)
    {
      id v23 = v13;
      operationIdentifiers = v14->_operationIdentifiers;
      v14->_operationIdentifiers = v23;
LABEL_17:

      goto LABEL_18;
    }
    if (v9)
    {
      long long v36 = v5;
      operationIdentifiers = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v35 = v9;
      id v25 = v9;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v38;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v38 != v28) {
              objc_enumerationMutation(v25);
            }
            int64_t v30 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v29), "identifier", v35);
            long long v31 = [v30 UUIDString];
            [operationIdentifiers addObject:v31];

            ++v29;
          }
          while (v27 != v29);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v27);
      }

      uint64_t v32 = [operationIdentifiers allObjects];
      v33 = v14->_operationIdentifiers;
      v14->_operationIdentifiers = (NSArray *)v32;

      id v9 = v35;
      int64_t v5 = v36;
      goto LABEL_17;
    }
  }
LABEL_18:

  return v14;
}

- (NSArray)accessoryInvitationsInformation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(HMDOutgoingHomeInvitation *)self operations];
  int64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v6 = [(HMDOutgoingHomeInvitation *)self operations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) accessoryInvitationInformation];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(HMDOutgoingHomeInvitation *)self updateInvitationState:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(HMDOutgoingHomeInvitation *)self operations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)isComplete
{
  if ([(HMDOutgoingHomeInvitation *)self responseReceived]
    && [(HMDHomeInvitation *)self isAccepted]
    && ![(HMDHomeInvitation *)self isDeclined])
  {
    uint64_t v5 = [(HMDOutgoingHomeInvitation *)self operationIdentifiers];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = [(HMDHomeInvitation *)self home];
      long long v8 = [v7 homeManager];
      long long v9 = [(HMDOutgoingHomeInvitation *)self operationIdentifiers];
      int v3 = [v8 operationsWithIdentifiers:v9 outOperations:0] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
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
  int v3 = NSString;
  uint64_t v4 = [(HMDOutgoingHomeInvitation *)self shortDescription];
  uint64_t v5 = [(HMDHomeInvitation *)self identifier];
  uint64_t v6 = [(HMDOutgoingHomeInvitation *)self user];
  int64_t v7 = [(HMDHomeInvitation *)self invitationState];
  long long v8 = [(HMDOutgoingHomeInvitation *)self operations];
  long long v9 = [v3 stringWithFormat:@"<%@, Identifier = %@, Invitee = %@, State = %tu, Operations = %@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HMDHomeInvitation *)self identifier];
  uint64_t v6 = [(HMDOutgoingHomeInvitation *)self user];
  int64_t v7 = [(HMDHomeInvitation *)self invitationState];
  long long v8 = [(HMDOutgoingHomeInvitation *)self operations];
  long long v9 = [v3 stringWithFormat:@"<%@ %p, Identifier = %@, Invitee = %@, State = %tu, Operations = %@>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)shortDescription
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HMDHomeInvitation *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (HMDOutgoingHomeInvitation)initWithUUID:(id)a3 invitee:(id)a4 invitationState:(int64_t)a5 forHome:(id)a6 expiryDate:(id)a7 messageIdentifier:(id)a8
{
  id v15 = a4;
  obuint64_t j = a8;
  id v27 = a8;
  long long v16 = (objc_class *)MEMORY[0x1E4F2E9D8];
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  id v20 = [v16 alloc];
  uint64_t v21 = [v15 userID];
  id v22 = [v15 displayName];
  id v23 = (void *)[v20 initWithUUID:v19 inviteeUserID:v21 inviteeName:v22 invitationState:a5 expiryDate:v17];

  v28.receiver = self;
  v28.super_class = (Class)HMDOutgoingHomeInvitation;
  uint64_t v24 = [(HMDHomeInvitation *)&v28 initWithInvitationData:v23 forHome:v18];

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