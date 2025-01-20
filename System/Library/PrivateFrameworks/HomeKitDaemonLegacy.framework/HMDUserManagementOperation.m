@interface HMDUserManagementOperation
+ (BOOL)supportsSecureCoding;
+ (id)addUserManagementOperationForUser:(id)a3 accessory:(id)a4 model:(id)a5;
+ (id)auditUserManagementOperationAccessory:(id)a3 model:(id)a4;
+ (id)operationWithDictionary:(id)a3 home:(id)a4;
+ (id)removeUserManagementOperationForUser:(id)a3 accessory:(id)a4 model:(id)a5;
+ (id)shortDescription;
+ (void)initialize;
- (BOOL)_isFinished;
- (BOOL)isAddOperation;
- (BOOL)isAuditOperation;
- (BOOL)isBackingOff;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isExpired;
- (BOOL)isFinished;
- (BOOL)isReady;
- (BOOL)isRemoveOperation;
- (BOOL)isValid;
- (BOOL)lastOperationFailed;
- (BOOL)mergeWithOperation:(id)a3;
- (HAPPairingIdentity)ownerPairingIdentity;
- (HMDAccessory)accessory;
- (HMDAccessoryInvitation)accessoryInvitation;
- (HMDUser)user;
- (HMDUserManagementOperation)init;
- (HMDUserManagementOperation)initWithCoder:(id)a3;
- (HMDUserManagementOperation)initWithOperationType:(unint64_t)a3 identifier:(id)a4 user:(id)a5 accessory:(id)a6 expiration:(id)a7;
- (HMDUserManagementOperationDelegate)delegate;
- (HMDUserManagementOperationManager)operationManager;
- (HMFTimer)backoffTimer;
- (HMFTimer)expirationTimer;
- (NSArray)auditUsersToBeAdded;
- (NSArray)dependencies;
- (NSDate)expirationDate;
- (NSDictionary)accessoryInvitationInformation;
- (NSString)debugDescription;
- (NSString)description;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (double)backoffInterval;
- (double)nextBackoffInterval;
- (id)_findConflictingAccessory:(id)a3;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dictionaryEncoding;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 parentUUID:(id)a4;
- (id)shortDescription;
- (id)transactionWithObjectChangeType:(unint64_t)a3 parentUUID:(id)a4;
- (int64_t)_accessoryInvitationState;
- (unint64_t)operationType;
- (unint64_t)state;
- (void)_addPairingToHAPAccessory:(id)a3 completionHandler:(id)a4;
- (void)_auditPairingsForHAPAccessory:(id)a3 completionHandler:(id)a4;
- (void)_endBackoffTimer;
- (void)_removePairingFromHAPAccessory:(id)a3 completionHandler:(id)a4;
- (void)_setupExpirationTimer;
- (void)_startBackoffTimer;
- (void)addDependency:(id)a3;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)populateModelObjectWithChangeType:(id)a3 version:(int64_t)a4;
- (void)setAccessory:(id)a3;
- (void)setAuditUsersToBeAdded:(id)a3;
- (void)setBackingOff:(BOOL)a3;
- (void)setBackoffTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setLastOperationFailed:(BOOL)a3;
- (void)setOperationManager:(id)a3;
- (void)setOwnerPairingIdentity:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)timerDidFire:(id)a3;
- (void)updateDelegate:(id)a3;
@end

@implementation HMDUserManagementOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditUsersToBeAdded, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_ownerPairingIdentity, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationManager, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
}

- (void)setAuditUsersToBeAdded:(id)a3
{
}

- (NSArray)auditUsersToBeAdded
{
  return self->_auditUsersToBeAdded;
}

- (void)setBackoffTimer:(id)a3
{
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (double)backoffInterval
{
  return self->_backoffInterval;
}

- (HMFTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setOwnerPairingIdentity:(id)a3
{
}

- (HAPPairingIdentity)ownerPairingIdentity
{
  return self->_ownerPairingIdentity;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAccessory)accessory
{
  return self->_accessory;
}

- (HMDUser)user
{
  return self->_user;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setDelegate:(id)a3
{
}

- (HMDUserManagementOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserManagementOperationDelegate *)WeakRetained;
}

- (void)populateModelObjectWithChangeType:(id)a3 version:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserManagementOperation operationType](self, "operationType"));
  [v7 setOperationType:v8];

  v9 = [(HMDUserManagementOperation *)self user];
  v10 = [v9 pairingIdentity];
  [v7 setUserPairingIdentity:v10];

  v11 = [(HMDUserManagementOperation *)self ownerPairingIdentity];
  [v7 setOwnerPairingIdentity:v11];

  v12 = [(HMDUserManagementOperation *)self accessory];
  if ([v12 conformsToProtocol:&unk_1F2E2B960]) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    v15 = [v14 pairingIdentity];
    [v7 setAccessoryPairingIdentity:v15];
  }
  v16 = [(HMDUserManagementOperation *)self expirationDate];
  [v7 setExpirationDate:v16];

  v17 = [(HMDUserManagementOperation *)self dependencies];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E4F1CA48];
    v20 = [(HMDUserManagementOperation *)self dependencies];
    v21 = objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v22 = [(HMDUserManagementOperation *)self dependencies];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v30 + 1) + 8 * v26) identifier];
          v28 = [v27 UUIDString];
          [v21 addObject:v28];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }

    v29 = (void *)[v21 copy];
    [v7 setDependencies:v29];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  v6 = [(HMDUserManagementOperation *)self modelObjectWithChangeType:a3 parentUUID:v5];

  return v6;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 parentUUID:(id)a4
{
  id v5 = [(HMDUserManagementOperation *)self transactionWithObjectChangeType:a3 parentUUID:a4];
  [(HMDUserManagementOperation *)self populateModelObjectWithChangeType:v5 version:4];
  return v5;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3 parentUUID:(id)a4
{
  id v6 = a4;
  id v7 = [HMDUserManagementOperationModel alloc];
  v8 = [(HMDUserManagementOperation *)self identifier];
  v9 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:a3 uuid:v8 parentUUID:v6];

  return v9;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserManagementOperation *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HMDUserManagementOperation_timerDidFire___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__HMDUserManagementOperation_timerDidFire___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) expirationTimer];

  if (v2 == v3)
  {
    id v6 = *(void **)(a1 + 40);
    [v6 setState:3];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) backoffTimer];

    if (v4 == v5)
    {
      id v7 = *(void **)(a1 + 40);
      [v7 _endBackoffTimer];
    }
  }
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMDUserManagementOperation *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"HM.identifier"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserManagementOperation operationType](self, "operationType"));
  [v3 setObject:v6 forKeyedSubscript:@"HM.operationType"];

  id v7 = [(HMDUserManagementOperation *)self user];
  id v8 = [v7 uuid];
  v9 = [v8 UUIDString];
  [v3 setObject:v9 forKeyedSubscript:@"HM.user"];

  v10 = [(HMDUserManagementOperation *)self accessory];
  v11 = [v10 uuid];
  v12 = [v11 UUIDString];
  [v3 setObject:v12 forKeyedSubscript:@"accessory"];

  v13 = [(HMDUserManagementOperation *)self expirationDate];
  [v3 setObject:v13 forKeyedSubscript:@"HM.expiry"];

  id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserManagementOperation state](self, "state"));
  [v3 setObject:v14 forKeyedSubscript:@"HM.state"];

  v15 = (void *)[v3 copy];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDUserManagementOperation operationType](self, "operationType"), @"HM.operationType");
    id v5 = [(HMDUserManagementOperation *)self user];
    [v4 encodeObject:v5 forKey:@"HM.user"];

    id v6 = [(HMDUserManagementOperation *)self accessory];
    [v4 encodeObject:v6 forKey:@"accessory"];

    id v7 = [(HMDUserManagementOperation *)self identifier];
    [v4 encodeObject:v7 forKey:@"HM.identifier"];

    id v8 = [(HMDUserManagementOperation *)self expirationDate];
    [v4 encodeObject:v8 forKey:@"HM.expiry"];

    v9 = [(HMDUserManagementOperation *)self ownerPairingIdentity];
    [v4 encodeObject:v9 forKey:@"HM.ownerPairingIdentity"];

    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUserManagementOperation state](self, "state") != 0, @"HM.state");
    v10 = [(HMDUserManagementOperation *)self dependencies];
    [v4 encodeObject:v10 forKey:@"kUserManagementOperationsKey"];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = (id)objc_opt_class();
      id v14 = v18;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_FAULT, "%{public}@%@ only supports NSKeyedArchiver coders", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (HMDUserManagementOperation)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    uint64_t v5 = [v4 decodeIntegerForKey:@"HM.operationType"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.expiry"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    self = [(HMDUserManagementOperation *)self initWithOperationType:v5 identifier:v9 user:v6 accessory:v7 expiration:v8];
    if (self)
    {
      self->_state = [v4 decodeBoolForKey:@"HM.state"];
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ownerPairingIdentity"];
      ownerPairingIdentity = self->_ownerPairingIdentity;
      self->_ownerPairingIdentity = v10;

      v12 = (void *)MEMORY[0x1E4F1CAD0];
      v20[0] = objc_opt_class();
      v20[1] = objc_opt_class();
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      id v14 = [v12 setWithArray:v13];

      int v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kUserManagementOperationsKey"];
      v16 = v15;
      if (v15)
      {
        __int16 v17 = (NSMutableArray *)[v15 mutableCopy];
        dependencies = self->_dependencies;
        self->_dependencies = v17;
      }
    }
  }
  return self;
}

- (NSDictionary)accessoryInvitationInformation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDUserManagementOperation *)self identifier];
  id v4 = [v3 UUIDString];

  uint64_t v5 = [(HMDUserManagementOperation *)self accessory];
  id v6 = [v5 uuid];
  id v7 = [v6 UUIDString];

  int64_t v8 = [(HMDUserManagementOperation *)self _accessoryInvitationState];
  v9 = 0;
  if (v4 && v7)
  {
    v12[0] = @"HM.accessoryInvitationIdentifier";
    v12[1] = @"HM.accessoryInvitationAccessoryUUID";
    v13[0] = v4;
    v13[1] = v7;
    v12[2] = @"HM.accessoryInvitationState";
    v10 = [NSNumber numberWithInteger:v8];
    v13[2] = v10;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  }
  return (NSDictionary *)v9;
}

- (HMDAccessoryInvitation)accessoryInvitation
{
  int64_t v3 = [(HMDUserManagementOperation *)self _accessoryInvitationState];
  id v4 = [HMDAccessoryInvitation alloc];
  uint64_t v5 = [(HMDUserManagementOperation *)self accessory];
  id v6 = [(HMDUserManagementOperation *)self identifier];
  id v7 = [(HMDAccessoryInvitation *)v4 initWithAccessory:v5 identifier:v6 state:v3];

  return v7;
}

- (int64_t)_accessoryInvitationState
{
  int64_t result = [(HMDUserManagementOperation *)self state];
  if (result != 1)
  {
    if ((result & 0xFFFFFFFFFFFFFFFELL) == 2
      || [(HMDUserManagementOperation *)self lastOperationFailed])
    {
      return 3;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (BOOL)mergeWithOperation:(id)a3
{
  id v4 = a3;
  -[HMDUserManagementOperation setLastOperationFailed:](self, "setLastOperationFailed:", [v4 lastOperationFailed]);
  if (v4
    && ![(HMDUserManagementOperation *)self isFinished]
    && [v4 isFinished])
  {
    [(HMDUserManagementOperation *)self cancel];
  }

  return v4 != 0;
}

- (void)_auditPairingsForHAPAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  int64_t v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v6 name];
    v13 = [v6 identifier];
    *(_DWORD *)buf = 138543874;
    v39 = v11;
    __int16 v40 = 2112;
    v41 = v12;
    __int16 v42 = 2112;
    v43 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to audit pairing for accessory %@(%@)", buf, 0x20u);
  }
  id v14 = [(HMDUserManagementOperation *)v9 accessory];
  int v15 = [v14 home];

  if (!v15)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    __int16 v17 = v9;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory does not support user management", buf, 0xCu);
    }
    if (v7)
    {
      v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      v7[2](v7, v20);
    }
  }
  objc_initWeak((id *)buf, v9);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6A0F738;
  objc_copyWeak(&v37, (id *)buf);
  v21 = v7;
  v36 = v21;
  id v22 = v6;
  id v35 = v22;
  uint64_t v23 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2_219;
  v31[3] = &unk_1E6A0F788;
  objc_copyWeak(&v33, (id *)buf);
  id v24 = v23;
  id v32 = v24;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_222;
  v27[3] = &unk_1E6A18500;
  objc_copyWeak(&v30, (id *)buf);
  id v25 = v22;
  id v28 = v25;
  id v26 = v24;
  id v29 = v26;
  [v25 performOperation:7 linkType:0 operationBlock:v31 errorBlock:v27];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v11 = v9;
    if (v11)
    {
      v12 = v11;
      if (([v11 isHMError] & 1) == 0)
      {
        uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"List pairing failed." reason:0 suggestion:0 underlyingError:v12];

        v12 = (void *)v13;
      }
      id v14 = (void (**)(id, void *))a1[5];
      if (v14) {
        v14[2](v14, v12);
      }
    }
    else
    {
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = __Block_byref_object_copy__110902;
      v44[4] = __Block_byref_object_dispose__110903;
      id v45 = 0;
      dispatch_group_t v17 = dispatch_group_create();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_216;
      aBlock[3] = &unk_1E6A10A30;
      v43 = v44;
      id v18 = v17;
      __int16 v42 = v18;
      uint64_t v19 = _Block_copy(aBlock);
      if ([v8 count])
      {
        dispatch_group_enter(v18);
        id v20 = a1[4];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2;
        v36[3] = &unk_1E6A0F6E8;
        id v25 = v20;
        objc_copyWeak(&v40, a1 + 6);
        id v24 = v19;
        id v21 = v19;
        id v39 = v21;
        id v22 = v8;
        id v37 = v22;
        v38 = v18;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_3;
        v31[3] = &unk_1E6A165C8;
        objc_copyWeak(&v35, a1 + 6);
        id v32 = v22;
        id v33 = a1[4];
        id v34 = v21;
        [v25 performOperation:6 linkType:0 operationBlock:v36 errorBlock:v31];

        objc_destroyWeak(&v35);
        objc_destroyWeak(&v40);
        uint64_t v19 = v24;
      }
      uint64_t v23 = objc_msgSend(WeakRetained, "clientQueue", v24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_217;
      block[3] = &unk_1E6A0F710;
      objc_copyWeak(&v30, a1 + 6);
      id v29 = v44;
      id v27 = v7;
      id v28 = a1[5];
      dispatch_group_notify(v18, v23, block);

      objc_destroyWeak(&v30);
      _Block_object_dispose(v44, 8);

      v12 = 0;
    }
  }
  else
  {
    int v15 = (void (**)(id, void *))a1[5];
    if (v15)
    {
      v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      v15[2](v15, v16);
    }
  }
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2_219(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 server];
    if (v5)
    {
      id v6 = [WeakRetained clientQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_220;
      v15[3] = &unk_1E6A0F760;
      v15[4] = WeakRetained;
      objc_copyWeak(&v17, (id *)(a1 + 40));
      id v16 = *(id *)(a1 + 32);
      [v5 listPairingsWithCompletionQueue:v6 completionHandler:v15];

      objc_destroyWeak(&v17);
    }
    else
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = WeakRetained;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to list pairings without a reachable accessory server", buf, 0xCu);
      }
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v14);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void, void, void *))(v7 + 16))(v7, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v8);
  }
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_222(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to list pairings from accessory, %@, with error: %@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) accessory];
  v77 = [v7 home];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    uint64_t v58 = *(void *)(a1 + 40);
    v59 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = -1;
LABEL_36:
    v65 = [v59 hmErrorWithCode:v60];
    (*(void (**)(uint64_t, void, void, void *))(v58 + 16))(v58, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v65);

    goto LABEL_37;
  }
  uint64_t v68 = a1;
  if (!v77)
  {
    v61 = (void *)MEMORY[0x1D9452090]();
    id v62 = WeakRetained;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v83 = v64;
      _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_ERROR, "%{public}@Cannot manage users if accessory is not long associated with a home", buf, 0xCu);
    }
    uint64_t v58 = *(void *)(v68 + 40);
    v59 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = 12;
    goto LABEL_36;
  }
  id v66 = v6;
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v9 = [v77 users];
  v69 = [v8 arrayWithArray:v9];

  v73 = [MEMORY[0x1E4F1CA48] array];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v67 = v5;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v78 objects:v92 count:16];
  if (!v10) {
    goto LABEL_31;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v79;
  uint64_t v70 = *(void *)v79;
  do
  {
    uint64_t v13 = 0;
    uint64_t v71 = v11;
    do
    {
      if (*(void *)v79 != v12) {
        objc_enumerationMutation(obj);
      }
      __int16 v14 = *(void **)(*((void *)&v78 + 1) + 8 * v13);
      id v15 = [v77 userWithPairingIdentity:v14];
      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = WeakRetained;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        uint64_t v20 = [v15 shortDescription];
        [v14 identifier];
        id v21 = v75 = v16;
        [v14 publicKey];
        id v22 = v74 = v15;
        uint64_t v23 = [v22 data];
        [v14 permissions];
        HMFBooleanToString();
        v25 = uint64_t v24 = v13;
        *(_DWORD *)buf = 138544386;
        v83 = v19;
        __int16 v84 = 2112;
        v85 = v20;
        __int16 v86 = 2112;
        v87 = v21;
        __int16 v88 = 2112;
        v89 = v23;
        __int16 v90 = 2112;
        v91 = v25;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Found user %@ for pairing Identifier = %@, PublicKey = %@, Admin = %@", buf, 0x34u);

        id v15 = v74;
        uint64_t v13 = v24;

        uint64_t v12 = v70;
        uint64_t v16 = v75;

        uint64_t v11 = v71;
      }

      if (!v15)
      {
        __int16 v42 = (void *)MEMORY[0x1D9452090]();
        id v43 = v17;
        uint64_t v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          id v45 = HMFGetLogIdentifier();
          [v14 identifier];
          v47 = uint64_t v46 = v13;
          *(_DWORD *)buf = 138543618;
          v83 = v45;
          __int16 v84 = 2112;
          v85 = v47;
          _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unknown user, pairing must be remove %@", buf, 0x16u);

          uint64_t v13 = v46;
          id v15 = 0;
        }

        goto LABEL_28;
      }
      if ([v15 isOwner])
      {
        id v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = v17;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v30 = v29 = v15;
          [v14 identifier];
          v32 = uint64_t v31 = v13;
          *(_DWORD *)buf = 138543618;
          v83 = v30;
          __int16 v84 = 2112;
          v85 = v32;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Found owner pairing %@", buf, 0x16u);

          uint64_t v13 = v31;
          id v15 = v29;
        }

        [v69 removeObject:v15];
        if (([v14 permissions] & 1) == 0)
        {
          id v33 = (void *)MEMORY[0x1D9452090]();
          id v34 = v27;
          id v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = HMFGetLogIdentifier();
            id v37 = v14;
            v38 = v15;
            id v39 = (void *)v36;
            [v37 identifier];
            v41 = uint64_t v40 = v13;
            *(_DWORD *)buf = 138543618;
            v83 = v39;
            __int16 v84 = 2112;
            v85 = v41;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Owners pairing with admin bit is not set %@", buf, 0x16u);

            uint64_t v13 = v40;
            id v15 = v38;
          }
        }
      }
      else
      {
        char v48 = [v14 permissions];
        __int16 v42 = (void *)MEMORY[0x1D9452090]();
        id v43 = v17;
        v49 = HMFGetOSLogHandle();
        BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_INFO);
        if (v48)
        {
          if (v50)
          {
            v54 = HMFGetLogIdentifier();
            [v14 identifier];
            v55 = v14;
            v57 = v56 = v15;
            *(_DWORD *)buf = 138543618;
            v83 = v54;
            __int16 v84 = 2112;
            v85 = v57;
            _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@Must remove user pairing with admin bit is set %@", buf, 0x16u);

            id v15 = v56;
            __int16 v14 = v55;
          }
LABEL_28:

          [v73 addObject:v14];
          goto LABEL_29;
        }
        if (v50)
        {
          v51 = HMFGetLogIdentifier();
          [v14 identifier];
          v53 = v52 = v15;
          *(_DWORD *)buf = 138543618;
          v83 = v51;
          __int16 v84 = 2112;
          v85 = v53;
          _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@User pairing %@", buf, 0x16u);

          id v15 = v52;
        }

        [v69 removeObject:v15];
      }
LABEL_29:

      ++v13;
    }
    while (v11 != v13);
    uint64_t v11 = [obj countByEnumeratingWithState:&v78 objects:v92 count:16];
  }
  while (v11);
LABEL_31:

  (*(void (**)(void))(*(void *)(v68 + 40) + 16))();
  id v6 = v66;
  id v5 = v67;
LABEL_37:
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_216(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = [v3 server];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          uint64_t v12 = objc_msgSend(WeakRetained, "clientQueue", (void)v14);
          [v5 removePairing:v11 completionQueue:v12 completionHandler:*(void *)(a1 + 48)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_12;
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
LABEL_12:
  }
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138544130;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove pairings, %@, from accessory, %@, with error: %@", (uint8_t *)&v11, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_217(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = WeakRetained;
    [WeakRetained setAuditUsersToBeAdded:*(void *)(a1 + 32)];
    id WeakRetained = v6;
  }
  if (*(void *)(a1 + 40))
  {
    id v7 = WeakRetained;
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v4 && ([v4 isHMError] & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Remove pairing failed." reason:0 suggestion:0 underlyingError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      id v3 = (id)v5;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id WeakRetained = v7;
  }
}

- (void)_removePairingFromHAPAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = [(HMDUserManagementOperation *)self shortDescription];
    uint64_t v12 = [v6 name];
    __int16 v13 = [v6 identifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2112;
    __int16 v42 = v13;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Attempting to remove pairing from accessory %@(%@)", buf, 0x2Au);
  }
  uint64_t v14 = [(HMDUserManagementOperation *)self _findConflictingAccessory:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v15 = v14;
  }
  else {
    __int16 v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      uint64_t v20 = [(HMDUserManagementOperation *)self shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v19;
      __int16 v37 = 2112;
      v38 = v20;
      __int16 v39 = 2112;
      id v40 = v16;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@[%@] Do not remove pairing for this accessory because this looks removed and another exists '%@'", buf, 0x20u);
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6A19358;
    id v34 = v7;
    id v21 = _Block_copy(aBlock);
    id v22 = (void *)MEMORY[0x1D9452090]();
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      id v25 = [(HMDUserManagementOperation *)self shortDescription];
      id v26 = [v6 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v24;
      __int16 v37 = 2112;
      v38 = v25;
      __int16 v39 = 2112;
      id v40 = v26;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@[%@] Removing local pairing from accessory '%@'", buf, 0x20u);
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_212;
    v31[3] = &unk_1E6A0F6C0;
    void v31[4] = self;
    id v32 = v21;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_2;
    v28[3] = &unk_1E6A18F68;
    v28[4] = self;
    id v29 = v6;
    id v30 = v32;
    id v27 = v32;
    [v29 performOperation:6 linkType:0 operationBlock:v31 errorBlock:v28];
  }
}

void __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v7 = v3;
    id v4 = v3;
    uint64_t v5 = v4;
    if (v4 && ([v4 isHMError] & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Remove pairing failed." reason:0 suggestion:0 underlyingError:v5];

      uint64_t v5 = (void *)v6;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = v7;
  }
}

void __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_212(uint64_t a1, void *a2)
{
  id v9 = [a2 server];
  id v3 = [*(id *)(a1 + 32) user];
  int v4 = [v3 isCurrentUser];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 clientQueue];
    [v9 removePairingForCurrentControllerOnQueue:v6 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = [v5 user];
    id v7 = [v6 pairingIdentity];
    uint64_t v8 = [*(id *)(a1 + 32) clientQueue];
    [v9 removePairing:v7 completionQueue:v8 completionHandler:*(void *)(a1 + 40)];
  }
}

void __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = [*(id *)(a1 + 32) shortDescription];
    uint64_t v8 = [*(id *)(a1 + 32) user];
    id v9 = [v8 pairingIdentity];
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138544386;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to remove pairing, %@, from accessory, %@, with error: %@", (uint8_t *)&v11, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_addPairingToHAPAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = [(HMDUserManagementOperation *)self shortDescription];
    uint64_t v12 = [v6 name];
    __int16 v13 = [v6 identifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    __int16 v37 = v13;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Attempting to add pairing to accessory %@(%@)", buf, 0x2Au);
  }
  uint64_t v14 = [(HMDUserManagementOperation *)self _findConflictingAccessory:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v15 = v14;
  }
  else {
    __int16 v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [(HMDUserManagementOperation *)self shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      id v33 = v20;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@[%@] Do not add pairing for this accessory because it looks removed and another exists '%@'", buf, 0x20u);
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6A19358;
    id v29 = v7;
    uint64_t v21 = _Block_copy(aBlock);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_2;
    v26[3] = &unk_1E6A0F6C0;
    v26[4] = self;
    id v27 = v21;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_3;
    v23[3] = &unk_1E6A18F68;
    v23[4] = self;
    id v24 = v6;
    id v25 = v27;
    id v22 = v27;
    [v24 performOperation:5 linkType:0 operationBlock:v26 errorBlock:v23];
  }
}

void __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v7 = v3;
    id v4 = v3;
    uint64_t v5 = v4;
    if (v4 && ([v4 isHMError] & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Add pairing failed." reason:0 suggestion:0 underlyingError:v5];

      uint64_t v5 = (void *)v6;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = v7;
  }
}

void __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 user];
  unsigned int v6 = [v5 isOwner];

  id v7 = objc_alloc(MEMORY[0x1E4F5BE00]);
  uint64_t v8 = [*(id *)(a1 + 32) user];
  id v9 = [v8 pairingIdentity];
  uint64_t v10 = [v9 identifier];
  int v11 = [*(id *)(a1 + 32) user];
  uint64_t v12 = [v11 pairingIdentity];
  __int16 v13 = [v12 publicKey];
  id v16 = (id)[v7 initWithIdentifier:v10 publicKey:v13 privateKey:0 permissions:v6];

  uint64_t v14 = [v4 server];

  __int16 v15 = [*(id *)(a1 + 32) clientQueue];
  [v14 addPairing:v16 completionQueue:v15 completionHandler:*(void *)(a1 + 40)];
}

void __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    unsigned int v6 = HMFGetLogIdentifier();
    id v7 = [*(id *)(a1 + 32) shortDescription];
    uint64_t v8 = [*(id *)(a1 + 32) user];
    id v9 = [v8 pairingIdentity];
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138544386;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to add pairing, %@, to accessory, %@, with error: %@", (uint8_t *)&v11, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_findConflictingAccessory:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 home];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(HMDUserManagementOperation *)self operationManager];
    uint64_t v8 = [v7 homeManager];
    id v9 = [v4 identifier];
    uint64_t v10 = [v8 accessoriesMatchingIdentifier:v9];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v10;
    id v6 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v11);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          __int16 v15 = objc_msgSend(v4, "uuid", (void)v19);
          id v16 = [v14 uuid];
          int v17 = [v15 isEqual:v16];

          if (!v17)
          {
            id v6 = v14;
            goto LABEL_13;
          }
        }
        id v6 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

- (void)executeWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDUserManagementOperation *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isFinished])
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = HMFGetLogIdentifier();
      uint64_t v5 = [*(id *)(a1 + 32) shortDescription];
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v51 = v4;
      __int16 v52 = 2112;
      v53 = v5;
      __int16 v54 = 2112;
      uint64_t v55 = v6;
      _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempt to execute already completed user operation: %@", buf, 0x20u);
    }
    id v7 = *(NSObject **)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 48);
      if (v8)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_175;
        block[3] = &unk_1E6A186E0;
        id v49 = v8;
        dispatch_async(v7, block);
        id v9 = v49;
LABEL_37:

        return;
      }
    }
    return;
  }
  if (([*(id *)(a1 + 32) isValid] & 1) == 0)
  {
    int v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      long long v20 = [*(id *)(a1 + 32) shortDescription];
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v51 = v19;
      __int16 v52 = 2112;
      v53 = v20;
      __int16 v54 = 2112;
      uint64_t v55 = v21;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempt to execute invalid operation: %@", buf, 0x20u);
    }
    long long v22 = *(NSObject **)(a1 + 40);
    if (v22)
    {
      uint64_t v23 = *(void **)(a1 + 48);
      if (v23)
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_180;
        v46[3] = &unk_1E6A186E0;
        id v47 = v23;
        dispatch_async(v22, v46);
        id v9 = v47;
        goto LABEL_37;
      }
    }
    return;
  }
  if (![*(id *)(a1 + 32) isExpired])
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    __int16 v39 = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_2;
    id v40 = &unk_1E6A18F68;
    uint64_t v24 = *(void **)(a1 + 40);
    uint64_t v41 = *(void *)(a1 + 32);
    id v42 = v24;
    id v43 = *(id *)(a1 + 48);
    id v25 = (void (**)(void *, id))_Block_copy(&v37);
    objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 1, v37, v38, v39, v40, v41);
    id v26 = [*(id *)(a1 + 32) accessory];
    int v27 = [v26 supportsUserManagement];

    if (!v27) {
      goto LABEL_35;
    }
    id v28 = [*(id *)(a1 + 32) accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }
    id v30 = v29;

    uint64_t v31 = *(void **)(a1 + 32);
    if (v30)
    {
      uint64_t v32 = [v31 operationType];
      switch(v32)
      {
        case 3:
          [*(id *)(a1 + 32) _auditPairingsForHAPAccessory:v30 completionHandler:v25];
          break;
        case 2:
          [*(id *)(a1 + 32) _removePairingFromHAPAccessory:v30 completionHandler:v25];
          break;
        case 1:
          [*(id *)(a1 + 32) _addPairingToHAPAccessory:v30 completionHandler:v25];
          break;
      }
      goto LABEL_36;
    }
    id v33 = [v31 accessory];
    __int16 v34 = [v33 conformsToProtocol:&unk_1F2E2B960] ? v33 : 0;
    id v30 = v34;

    if (v30)
    {
      uint64_t v35 = [*(id *)(a1 + 32) operationType];
      if (v35 == 2)
      {
        __int16 v36 = [*(id *)(a1 + 32) user];
        [v30 removeUser:v36 completionHandler:v25];
        goto LABEL_42;
      }
      if (v35 == 1)
      {
        __int16 v36 = [*(id *)(a1 + 32) user];
        [v30 addUser:v36 completionHandler:v25];
LABEL_42:
      }
    }
    else
    {
LABEL_35:
      id v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      v25[2](v25, v30);
    }
LABEL_36:

    id v9 = v42;
    goto LABEL_37;
  }
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [*(id *)(a1 + 32) shortDescription];
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v51 = v12;
    __int16 v52 = 2112;
    v53 = v13;
    __int16 v54 = 2112;
    uint64_t v55 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempt to execute expired operation: %@", buf, 0x20u);
  }
  __int16 v15 = *(NSObject **)(a1 + 40);
  if (v15)
  {
    id v16 = *(void **)(a1 + 48);
    if (v16)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_184;
      v44[3] = &unk_1E6A186E0;
      id v45 = v16;
      dispatch_async(v15, v44);
      id v9 = v45;
      goto LABEL_37;
    }
  }
}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_175(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:58, @"Invalid user management operation, complete", 0, 0 description reason suggestion];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_180(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27 description:@"Invalid user management operation" reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_184(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27, @"Invalid user management operation, expired", 0, 0 description reason suggestion];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = 1;
  }
  else
  {
    [v4 setState:1];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = 0;
  }
  [v4 setLastOperationFailed:v5];
  [*(id *)(a1 + 32) _startBackoffTimer];
  [*(id *)(a1 + 32) setExecuting:0];
  uint64_t v6 = *(NSObject **)(a1 + 40);
  if (v6)
  {
    id v7 = *(void **)(a1 + 48);
    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_3;
      v8[3] = &unk_1E6A19530;
      id v10 = v7;
      id v9 = v3;
      dispatch_async(v6, v8);
    }
  }
}

uint64_t __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)cancel
{
  id v3 = [(HMDUserManagementOperation *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HMDUserManagementOperation_cancel__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__HMDUserManagementOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFinished];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setState:2];
  }
  return result;
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_dependencies addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (NSArray)dependencies
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_dependencies copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)_endBackoffTimer
{
  [(HMDUserManagementOperation *)self setBackoffTimer:0];
  [(HMDUserManagementOperation *)self setBackingOff:0];
  id v3 = [(HMDUserManagementOperation *)self operationManager];
  [v3 operationStoppedBackingOff:self];
}

- (void)_startBackoffTimer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(HMDUserManagementOperation *)self isFinished])
  {
    uint64_t v3 = [(HMDUserManagementOperation *)self nextBackoffInterval];
    double v5 = v4;
    uint64_t v6 = (void *)MEMORY[0x1D9452090](v3);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [(HMDUserManagementOperation *)self shortDescription];
      int v11 = 138543874;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      double v16 = v5;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Starting operation backoff timer with expiration interval of %f seconds", (uint8_t *)&v11, 0x20u);
    }
    [(HMDUserManagementOperation *)self setBackingOff:1];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v5];
    [(HMDUserManagementOperation *)self setBackoffTimer:v10];
    [v10 setDelegate:self];
    [v10 resume];
  }
}

- (double)nextBackoffInterval
{
  [(HMDUserManagementOperation *)self backoffInterval];
  self->_backoffInterval = fmin(result * 3.0, 5400.0);
  return result;
}

- (void)setBackingOff:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_backingOff = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isBackingOff
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_backingOff;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOperationManager:(id)a3
{
  double v4 = (HMDUserManagementOperationManager *)a3;
  os_unfair_lock_lock_with_options();
  operationManager = self->_operationManager;
  self->_operationManager = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDUserManagementOperationManager)operationManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v4 = self->_operationManager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateDelegate:(id)a3
{
  id v6 = a3;
  if (([(HMDUserManagementOperation *)self isAddOperation]
     || [(HMDUserManagementOperation *)self isAuditOperation])
    && ([(HMDUserManagementOperation *)self accessory],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 home],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    [(HMDUserManagementOperation *)self setDelegate:v5];
  }
  else
  {
    [(HMDUserManagementOperation *)self setDelegate:v6];
  }
}

- (void)setLastOperationFailed:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_lastOperationFailed = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)lastOperationFailed
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_lastOperationFailed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  if (state != a3)
  {
    if (state)
    {
      uint64_t v8 = (void *)MEMORY[0x1D9452090](v6);
      HMFGetOSLogHandle();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        int v11 = [(HMDUserManagementOperation *)self shortDescription];
        unint64_t v12 = self->_state;
        *(_DWORD *)buf = 138544130;
        id v19 = v10;
        __int16 v20 = 2112;
        uint64_t v21 = v11;
        __int16 v22 = 2048;
        unint64_t v23 = v12;
        __int16 v24 = 2048;
        unint64_t v25 = a3;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Invalid state change from %tu to %tu", buf, 0x2Au);
      }
    }
    else
    {
      self->_unint64_t state = a3;
      if ([(HMDUserManagementOperation *)self _isFinished])
      {
        __int16 v13 = [(HMDUserManagementOperation *)self delegate];

        if (v13)
        {
          uint64_t v14 = [(HMDUserManagementOperation *)self clientQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __39__HMDUserManagementOperation_setState___block_invoke;
          block[3] = &unk_1E6A19B30;
          void block[4] = self;
          dispatch_async(v14, block);
        }
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        __int16 v15 = [(HMDUserManagementOperation *)self clientQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __39__HMDUserManagementOperation_setState___block_invoke_2;
        v16[3] = &unk_1E6A19B30;
        v16[4] = self;
        dispatch_async(v15, v16);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

void __39__HMDUserManagementOperation_setState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 userManagementOperationDidFinish:*(void *)(a1 + 32)];
}

void __39__HMDUserManagementOperation_setState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operationManager];
  [v2 operationCancelled:*(void *)(a1 + 32)];
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)isExpired
{
  if ([(HMDUserManagementOperation *)self state] == 3) {
    return 1;
  }
  uint64_t v3 = [(HMDUserManagementOperation *)self expirationDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  if (v5 < 0.0)
  {
    [(HMDUserManagementOperation *)self setState:3];
    return 1;
  }
  return 0;
}

- (BOOL)isReady
{
  id v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(HMDUserManagementOperation *)self isExecuting])
  {
    uint64_t v3 = (void *)MEMORY[0x1D9452090]();
    double v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = HMFGetLogIdentifier();
      uint64_t v6 = [(HMDUserManagementOperation *)v2 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v33 = v5;
      __int16 v34 = 2112;
      uint64_t v35 = v6;
      id v7 = "%{public}@[%@] Operation is currently executing";
LABEL_24:
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, v7, buf, 0x16u);

LABEL_25:
    }
  }
  else if ([(HMDUserManagementOperation *)v2 isFinished])
  {
    uint64_t v3 = (void *)MEMORY[0x1D9452090]();
    double v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = HMFGetLogIdentifier();
      uint64_t v6 = [(HMDUserManagementOperation *)v2 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v33 = v5;
      __int16 v34 = 2112;
      uint64_t v35 = v6;
      id v7 = "%{public}@[%@] Operation is finished";
      goto LABEL_24;
    }
  }
  else
  {
    if (![(HMDUserManagementOperation *)v2 isBackingOff])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v8 = [(HMDUserManagementOperation *)v2 dependencies];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v9)
      {
        uint64_t v11 = v9;
        char v12 = 0;
        uint64_t v13 = *(void *)v29;
        *(void *)&long long v10 = 138543874;
        long long v27 = v10;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v8);
            }
            __int16 v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isFinished", v27) & 1) == 0)
            {
              double v16 = (void *)MEMORY[0x1D9452090]();
              uint64_t v17 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                uint64_t v18 = HMFGetLogIdentifier();
                [(HMDUserManagementOperation *)v2 shortDescription];
                v20 = id v19 = v2;
                *(_DWORD *)buf = v27;
                id v33 = v18;
                __int16 v34 = 2112;
                uint64_t v35 = v20;
                __int16 v36 = 2112;
                uint64_t v37 = v15;
                _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@[%@] Operation has unfinished dependency operation %@", buf, 0x20u);

                id v2 = v19;
              }

              char v12 = 1;
            }
          }
          uint64_t v11 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
        }
        while (v11);

        if (v12)
        {
          uint64_t v3 = (void *)MEMORY[0x1D9452090]();
          double v4 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            double v5 = HMFGetLogIdentifier();
            uint64_t v6 = [(HMDUserManagementOperation *)v2 shortDescription];
            *(_DWORD *)buf = 138543618;
            id v33 = v5;
            __int16 v34 = 2112;
            uint64_t v35 = v6;
            id v7 = "%{public}@[%@] Operation has unfinished dependency operations";
            goto LABEL_24;
          }
          goto LABEL_26;
        }
      }
      else
      {
      }
      __int16 v22 = [(HMDUserManagementOperation *)v2 accessory];
      char v23 = [v22 isReachable];

      if (v23) {
        return 1;
      }
      uint64_t v3 = (void *)MEMORY[0x1D9452090]();
      double v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        double v5 = HMFGetLogIdentifier();
        __int16 v24 = [(HMDUserManagementOperation *)v2 shortDescription];
        unint64_t v25 = [(HMDUserManagementOperation *)v2 accessory];
        uint64_t v26 = [v25 name];
        *(_DWORD *)buf = 138543874;
        id v33 = v5;
        __int16 v34 = 2112;
        uint64_t v35 = v24;
        __int16 v36 = 2112;
        uint64_t v37 = v26;
        _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] Operation accessory '%@' is unreachable", buf, 0x20u);

        goto LABEL_25;
      }
      goto LABEL_26;
    }
    uint64_t v3 = (void *)MEMORY[0x1D9452090]();
    double v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = HMFGetLogIdentifier();
      uint64_t v6 = [(HMDUserManagementOperation *)v2 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v33 = v5;
      __int16 v34 = 2112;
      uint64_t v35 = v6;
      id v7 = "%{public}@[%@] Operation is currently in backoff";
      goto LABEL_24;
    }
  }
LABEL_26:

  return 0;
}

- (BOOL)isCancelled
{
  return [(HMDUserManagementOperation *)self state] == 2;
}

- (BOOL)_isFinished
{
  return self->_state - 1 < 3;
}

- (BOOL)isFinished
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(HMDUserManagementOperation *)v2 _isFinished];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_executing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isExecuting
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isValid
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(HMDUserManagementOperation *)self isAuditOperation])
  {
    uint64_t v3 = [(HMDUserManagementOperation *)self accessory];
    double v4 = [v3 home];

    if (v4)
    {
      BOOL v5 = 1;
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v19 = self;
    double v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)long long v27 = 138543362;
    *(void *)&void v27[4] = v17;
    uint64_t v18 = "%{public}@Cannot audit accessory if not contained in home";
    goto LABEL_13;
  }
  uint64_t v6 = [(HMDUserManagementOperation *)self user];
  id v7 = [v6 pairingUsername];
  BOOL v5 = v7 != 0;

  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long v27 = 138543362;
      *(void *)&void v27[4] = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Missing user's identifier", v27, 0xCu);
    }
  }
  char v12 = [(HMDUserManagementOperation *)self user];
  uint64_t v13 = [v12 publicKey];

  if (!v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    __int16 v15 = self;
    double v16 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      BOOL v5 = 0;
      goto LABEL_15;
    }
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)long long v27 = 138543362;
    *(void *)&void v27[4] = v17;
    uint64_t v18 = "%{public}@Missing user's public key";
LABEL_13:
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, v18, v27, 0xCu);

    goto LABEL_14;
  }
LABEL_15:
  __int16 v20 = [(HMDUserManagementOperation *)self accessory];
  char v21 = [v20 isPrimary];

  if ((v21 & 1) == 0)
  {
    __int16 v22 = (void *)MEMORY[0x1D9452090]();
    char v23 = self;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      unint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)long long v27 = 138543362;
      *(void *)&void v27[4] = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Accessory is not primary", v27, 0xCu);
    }
    return 0;
  }
  return v5;
}

- (BOOL)isAuditOperation
{
  return [(HMDUserManagementOperation *)self operationType] == 3;
}

- (BOOL)isRemoveOperation
{
  return [(HMDUserManagementOperation *)self operationType] == 2;
}

- (BOOL)isAddOperation
{
  return [(HMDUserManagementOperation *)self operationType] == 1;
}

- (NSString)description
{
  return (NSString *)[(HMDUserManagementOperation *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDUserManagementOperation *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = NSString;
  __int16 v20 = [(HMDUserManagementOperation *)self shortDescription];
  BOOL v19 = v3;
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v5 = &stru_1F2C9F1A8;
  }
  unint64_t v6 = [(HMDUserManagementOperation *)self operationType] - 1;
  if (v6 > 2) {
    id v7 = @"unknown";
  }
  else {
    id v7 = off_1E6A0F7A8[v6];
  }
  [(HMDUserManagementOperation *)self isFinished];
  uint64_t v8 = HMFBooleanToString();
  [(HMDUserManagementOperation *)self isReady];
  uint64_t v9 = HMFBooleanToString();
  [(HMDUserManagementOperation *)self isExecuting];
  long long v10 = HMFBooleanToString();
  [(HMDUserManagementOperation *)self isCancelled];
  uint64_t v11 = HMFBooleanToString();
  [(HMDUserManagementOperation *)self isExpired];
  char v12 = HMFBooleanToString();
  uint64_t v13 = [(HMDUserManagementOperation *)self expirationDate];
  uint64_t v14 = [(HMDUserManagementOperation *)self user];
  __int16 v15 = [(HMDUserManagementOperation *)self accessory];
  double v16 = [v18 stringWithFormat:@"<%@%@, Operation Type = %@, Finished = %@, Ready = %@, Executing = %@, Cancelled = %@, Expired = %@, Expiration Date = %@, User = %@, Accessory = %@>", v20, v5, v7, v8, v9, v10, v11, v12, v13, v14, v15];

  if (v19) {
  return v16;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  double v4 = [(id)objc_opt_class() shortDescription];
  BOOL v5 = [(HMDUserManagementOperation *)self identifier];
  unint64_t v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (void)_setupExpirationTimer
{
  if (![(HMDUserManagementOperation *)self state])
  {
    BOOL v3 = [(HMDUserManagementOperation *)self expirationDate];
    double v4 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:v4];
    double v6 = v5;

    if (v6 <= 0.0)
    {
      [(HMDUserManagementOperation *)self setState:3];
    }
    else
    {
      id v7 = (HMFTimer *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v6];
      expirationTimer = self->_expirationTimer;
      self->_expirationTimer = v7;

      uint64_t v9 = [(HMDUserManagementOperation *)self expirationTimer];
      [v9 setDelegate:self];

      id v10 = [(HMDUserManagementOperation *)self expirationTimer];
      [v10 resume];
    }
  }
}

- (HMDUserManagementOperation)initWithOperationType:(unint64_t)a3 identifier:(id)a4 user:(id)a5 accessory:(id)a6 expiration:(id)a7
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v41.receiver = self;
  v41.super_class = (Class)HMDUserManagementOperation;
  double v16 = [(HMDUserManagementOperation *)&v41 init];
  if (!v16) {
    goto LABEL_14;
  }
  id v39 = v15;
  id v40 = v13;
  if (v12)
  {
    uint64_t v17 = (NSUUID *)v12;
    identifier = v16->_identifier;
    v16->_identifier = v17;
  }
  else if (a3 && v13 && v14)
  {
    if (a3 > 3) {
      BOOL v19 = @"unknown";
    }
    else {
      BOOL v19 = off_1E6A0F7A8[a3 - 1];
    }
    identifier = objc_msgSend(v14, "uuid", MEMORY[0x1E4F29128]);
    v46[0] = v19;
    char v21 = [v13 uuid];
    uint64_t v38 = [v21 UUIDString];
    v46[1] = v38;
    __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    uint64_t v23 = objc_msgSend(v37, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", identifier, 0, v22);
    __int16 v24 = v16->_identifier;
    v16->_identifier = (NSUUID *)v23;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v20;
  }

  HMDispatchQueueNameString();
  id v25 = objc_claimAutoreleasedReturnValue();
  uint64_t v26 = (const char *)[v25 UTF8String];
  long long v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v28 = dispatch_queue_create(v26, v27);
  clientQueue = v16->_clientQueue;
  v16->_clientQueue = (OS_dispatch_queue *)v28;

  v16->_operationType = a3;
  objc_storeStrong((id *)&v16->_user, a5);
  objc_storeStrong((id *)&v16->_accessory, a6);
  objc_storeStrong((id *)&v16->_expirationDate, a7);
  v16->_backoffInterval = 10.0;
  v16->_lastOperationFailed = 0;
  if ([(HMDUserManagementOperation *)v16 isValid])
  {
    [(HMDUserManagementOperation *)v16 _setupExpirationTimer];
    id v15 = v39;
    id v13 = v40;
LABEL_14:
    long long v30 = v16;
    goto LABEL_18;
  }
  long long v31 = (void *)MEMORY[0x1D9452090]();
  uint64_t v32 = HMFGetOSLogHandle();
  id v15 = v39;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = HMFGetLogIdentifier();
    __int16 v34 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v43 = v33;
    __int16 v44 = 2112;
    id v45 = v34;
    id v35 = v34;
    _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Invalid operation, returning nil", buf, 0x16u);
  }
  long long v30 = 0;
  id v13 = v40;
LABEL_18:

  return v30;
}

- (HMDUserManagementOperation)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  double v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  double v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)operationWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "hmf_numberForKey:", @"HM.operationType");
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 integerValue];
    if (v7)
    {
LABEL_3:
      uint64_t v11 = objc_msgSend(v6, "hmf_UUIDForKey:", @"HM.user");
      id v12 = [v7 userWithUUID:v11];
      if (v12)
      {
        id v13 = objc_msgSend(v6, "hmf_UUIDForKey:", @"accessory");
        id v14 = [v7 accessoryWithUUID:v13];
        if (v14)
        {
          id v15 = objc_msgSend(v6, "hmf_dateForKey:", @"HM.expiry");
          if (!v15)
          {
            double v16 = [MEMORY[0x1E4F65530] sharedPreferences];
            id v33 = [v16 preferenceForKey:@"userManagementOperationExpiryTime"];

            uint64_t v17 = (void *)MEMORY[0x1E4F1C9C8];
            uint64_t v18 = [v33 numberValue];
            [v18 doubleValue];
            id v15 = objc_msgSend(v17, "dateWithTimeIntervalSinceNow:");
          }
          BOOL v19 = [[HMDUserManagementOperation alloc] initWithOperationType:v10 identifier:0 user:v12 accessory:v14 expiration:v15];
          [(HMDUserManagementOperation *)v19 setDelegate:v7];
        }
        else
        {
          dispatch_queue_t v28 = (void *)MEMORY[0x1D9452090]();
          id v29 = a1;
          long long v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            long long v31 = v34 = v28;
            *(_DWORD *)buf = 138543618;
            __int16 v36 = v31;
            __int16 v37 = 2112;
            uint64_t v38 = v11;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user management operation from dictionary because accessory cannot be found, %@", buf, 0x16u);

            dispatch_queue_t v28 = v34;
          }

          BOOL v19 = 0;
        }
      }
      else
      {
        __int16 v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = a1;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          long long v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v36 = v27;
          __int16 v37 = 2112;
          uint64_t v38 = v11;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user management operation from dictionary because user cannot be found, %@", buf, 0x16u);
        }
        BOOL v19 = 0;
      }

      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v10 = 1;
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = (void *)MEMORY[0x1D9452090]();
  id v21 = a1;
  __int16 v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v23;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user management operation from dictionary because home is not given", buf, 0xCu);
  }
  BOOL v19 = 0;
LABEL_20:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)removeUserManagementOperationForUser:(id)a3 accessory:(id)a4 model:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 uuid];
  uint64_t v11 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v12 = [v11 preferenceForKey:@"userManagementOperationExpiryTime"];

  id v13 = (void *)MEMORY[0x1E4F1C9C8];
  id v14 = [v12 numberValue];
  [v14 doubleValue];
  id v15 = objc_msgSend(v13, "dateWithTimeIntervalSinceNow:");

  if (v7)
  {
    double v16 = [v7 expirationDate];

    if (v16)
    {
      uint64_t v17 = [v7 expirationDate];

      id v15 = (void *)v17;
    }
  }
  uint64_t v18 = [[HMDUserManagementOperation alloc] initWithOperationType:2 identifier:v10 user:v9 accessory:v8 expiration:v15];

  return v18;
}

+ (id)addUserManagementOperationForUser:(id)a3 accessory:(id)a4 model:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 uuid];
  uint64_t v11 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v12 = [v11 preferenceForKey:@"userManagementOperationExpiryTime"];

  id v13 = (void *)MEMORY[0x1E4F1C9C8];
  id v14 = [v12 numberValue];
  [v14 doubleValue];
  id v15 = objc_msgSend(v13, "dateWithTimeIntervalSinceNow:");

  if (v7)
  {
    double v16 = [v7 expirationDate];

    if (v16)
    {
      uint64_t v17 = [v7 expirationDate];

      id v15 = (void *)v17;
    }
  }
  uint64_t v18 = [[HMDUserManagementOperation alloc] initWithOperationType:1 identifier:v10 user:v9 accessory:v8 expiration:v15];

  return v18;
}

+ (id)auditUserManagementOperationAccessory:(id)a3 model:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 uuid];
  id v8 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v9 = [v8 preferenceForKey:@"userManagementOperationAuditExpiryTime"];

  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v11 = [v9 numberValue];
  [v11 doubleValue];
  id v12 = objc_msgSend(v10, "dateWithTimeIntervalSinceNow:");

  if (v5)
  {
    id v13 = [v5 expirationDate];

    if (v13)
    {
      uint64_t v14 = [v5 expirationDate];

      id v12 = (void *)v14;
    }
  }
  id v15 = [[HMDUserManagementOperation alloc] initWithOperationType:3 identifier:v7 user:0 accessory:v6 expiration:v12];

  return v15;
}

+ (void)initialize
{
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DCB888 forPreferenceKey:@"userManagementOperationExpiryTime"];
  id v2 = (void *)MEMORY[0x1E4F65530];
  [v2 setDefaultValue:&unk_1F2DCB898 forPreferenceKey:@"userManagementOperationAuditExpiryTime"];
}

@end