@interface HMDRoom
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)messageBindingsForDispatcher:(id)a3;
- (HMDApplicationData)appData;
- (HMDHome)home;
- (HMDRoom)initWithCoder:(id)a3;
- (HMDRoom)initWithName:(id)a3 uuid:(id)a4 home:(id)a5;
- (HMFMessageDispatcher)msgDispatcher;
- (NSDictionary)assistantObject;
- (NSString)name;
- (NSString)serializedIdentifier;
- (NSString)urlString;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (id)backingStoreObjects:(int64_t)a3;
- (id)dumpState;
- (id)logIdentifier;
- (id)messageDestination;
- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4;
- (void)_handleRenameRequest:(id)a3;
- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4;
- (void)_handleUpdateRoomModel:(id)a3 message:(id)a4;
- (void)_registerForMessages;
- (void)configure:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAppData:(id)a3;
- (void)setHome:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setName:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDRoom

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAppData:(id)a3
{
}

- (HMDApplicationData)appData
{
  return self->_appData;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDRoom *)self uuid];
  v5 = (void *)[v3 initWithName:@"uuid" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDRoom *)self name];
  v8 = (void *)[v6 initWithName:@"name" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (id)logIdentifier
{
  v2 = [(HMDRoom *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)backingStoreObjects:(int64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = [HMDRoomModel alloc];
  v7 = [(HMDRoom *)self uuid];
  v8 = [(HMDRoom *)self home];
  v9 = [v8 uuid];
  v10 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:1 uuid:v7 parentUUID:v9];

  v11 = [(HMDRoom *)self name];
  [(HMDRoomModel *)v10 setName:v11];

  [v5 addObject:v10];
  v12 = [(HMDRoom *)self appData];

  if (a3 >= 3 && v12)
  {
    v13 = [(HMDRoom *)self appData];
    v14 = [v13 modelObjectWithChangeType:1];
    [v5 addObject:v14];
  }
  return v5;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [(HMDRoom *)self _handleRemoveAppDataModel:v10 message:v7];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = (id)objc_opt_class();
      id v15 = v24;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v19, 0x20u);
    }
    v16 = [v7 responseHandler];

    if (v16)
    {
      v17 = [v7 responseHandler];
      v18 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      ((void (**)(void, void *, void))v17)[2](v17, v18, 0);
    }
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v9;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  if (v12)
  {
    [(HMDRoom *)self _handleUpdateRoomModel:v12 message:v10];
    id v13 = v9;
LABEL_15:

    goto LABEL_16;
  }
  id v13 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    [(HMDRoom *)self _handleUpdateAppDataModel:v15 message:v10];
    goto LABEL_15;
  }
  v16 = (void *)MEMORY[0x230FBD990]();
  v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v19 = HMFGetLogIdentifier();
    int v23 = 138543874;
    id v24 = v19;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = (id)objc_opt_class();
    id v20 = v28;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v23, 0x20u);
  }
  __int16 v21 = [v10 responseHandler];

  if (v21)
  {
    id v13 = [v10 responseHandler];
    id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, void *, void))v13 + 2))(v13, v22, 0);

    goto LABEL_15;
  }
LABEL_16:
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  v4 = [(HMDRoom *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(HMDRoom *)self home];
  [v10 encodeConditionalObject:v4 forKey:@"home"];
  v5 = [(HMDRoom *)self name];
  [v10 encodeObject:v5 forKey:@"roomName"];

  id v6 = [(HMDRoom *)self uuid];
  id v7 = [v6 UUIDString];
  [v10 encodeObject:v7 forKey:@"roomUUID"];

  LODWORD(v6) = objc_msgSend(v10, "hmd_isForXPCTransport");
  id v8 = [(HMDRoom *)self appData];
  id v9 = v8;
  if (v6) {
    [v8 encodeForXPCTransportWithCoder:v10 key:@"HM.appData"];
  }
  else {
    [v10 encodeObject:v8 forKey:@"HM.appDataRepository"];
  }
}

- (HMDRoom)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roomName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roomUUID"];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v6];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  id v9 = [(HMDRoom *)self initWithName:v5 uuid:v7 home:v8];
  if (v9)
  {
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.appDataRepository"];
    appData = v9->_appData;
    v9->_appData = (HMDApplicationData *)v10;

    [(HMDApplicationData *)v9->_appData updateParentUUIDIfNil:v7];
  }

  return v9;
}

- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4
{
  id v5 = a4;
  [(HMDRoom *)self setAppData:0];
  id v6 = [v5 transactionResult];
  [v6 markChanged];
  [v5 respondWithPayload:0];
}

- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDRoom *)self appData];

  if (v8)
  {
    id v9 = [(HMDRoom *)self appData];
    [v9 updateWithModel:v6];
  }
  else
  {
    uint64_t v10 = [HMDApplicationData alloc];
    v11 = [v6 appDataDictionary];
    id v12 = [(HMDRoom *)self uuid];
    id v13 = [(HMDApplicationData *)v10 initWithDictionary:v11 parentUUID:v12];
    [(HMDRoom *)self setAppData:v13];

    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [v6 appDataDictionary];
      int v20 = 138543618;
      __int16 v21 = v17;
      __int16 v22 = 2112;
      int v23 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);
    }
  }
  int v19 = [v7 transactionResult];
  [v19 markChanged];
  [v7 respondWithPayload:0];
}

- (void)_handleUpdateRoomModel:(id)a3 message:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDRoom *)self uuid];
  id v9 = [(HMDRoom *)self home];
  uint64_t v10 = [v9 roomForEntireHome];
  v11 = [v10 uuid];
  int v12 = [v8 isEqual:v11];

  if (!v12)
  {
    int v20 = [v6 name];
    __int16 v21 = objc_msgSend(v20, "hm_truncatedNameString");

    if (v21 && [v21 length])
    {
      __int16 v22 = [(HMDRoom *)self home];
      if (v22)
      {
        int v23 = [(HMDRoom *)self name];
        [(HMDRoom *)self setName:v21];
        uint64_t v24 = [v7 transactionResult];
        [v24 markChanged];
        [v24 markSaveToAssistant];
        if ((HMFEqualObjects() & 1) == 0)
        {
          v31 = @"kRoomOldNameKey";
          v32 = v23;
          __int16 v25 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          logAndPostNotification(@"HMDRoomNameUpdatedNotification", self, v25);
        }
        [v7 respondWithPayload:0];
      }
      else
      {
        uint64_t v29 = [v7 responseHandler];
        v30 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        ((void (**)(void, void *, void))v29)[2](v29, v30, 0);
      }
    }
    else
    {
      id v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:20 userInfo:0];
      __int16 v27 = [v7 responseHandler];
      ((void (**)(void, void *, void))v27)[2](v27, v26, 0);
    }
    goto LABEL_18;
  }
  id v13 = [v7 name];
  int v14 = HMFEqualObjects();

  id v15 = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  v17 = HMFGetOSLogHandle();
  v18 = v17;
  if (!v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v34 = v28;
      __int16 v35 = 2112;
      id v36 = v7;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      v40 = &unk_26E4721A8;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update name for the default room %@, %@, errorCode: %@", buf, 0x2Au);
    }
    __int16 v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:29 userInfo:0];
    [v7 respondWithError:v21];
LABEL_18:

    goto LABEL_19;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v34 = v19;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Always return success for transaction update during replay and lookup", buf, 0xCu);
  }
  [v7 respondWithSuccess];
LABEL_19:
}

- (void)_handleRenameRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kRoomName"];
  unint64_t v6 = HMMaxLengthForNaming();
  if ([v5 length] <= v6)
  {
    int v12 = [(HMDRoom *)self home];
    id v13 = [(HMDRoom *)self name];
    v11 = [v12 replaceName:v13 withNewName:v5];

    if (!v11)
    {
      v18 = [(HMDRoom *)self home];
      int v19 = [HMDRoomModel alloc];
      int v20 = [(HMDRoom *)self uuid];
      __int16 v21 = [v18 uuid];
      __int16 v22 = [(HMDBackingStoreModelObject *)v19 initWithObjectChangeType:2 uuid:v20 parentUUID:v21];

      [(HMDRoomModel *)v22 setName:v5];
      int v23 = [v18 backingStore];
      uint64_t v24 = [v4 name];
      __int16 v25 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      id v26 = [v23 transaction:v24 options:v25];

      [v26 add:v22 withMessage:v4];
      [v26 run];

      v11 = 0;
      goto LABEL_10;
    }
    int v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v27 = 138543618;
      id v28 = v17;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@New name does not conform to the HomeKit naming standard: %@", (uint8_t *)&v27, 0x16u);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", (uint8_t *)&v27, 0xCu);
    }
    v11 = [MEMORY[0x263F087E8] hmErrorWithCode:46];
  }
  [v4 respondWithError:v11];
LABEL_10:
}

- (void)_registerForMessages
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDRoom *)self home];
  id v4 = [v3 administratorHandler];
  id v5 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v8[0] = v5;
  unint64_t v6 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v8[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v4 registerForMessage:@"kRenameRoomRequestKey" receiver:self policies:v7 selector:sel__handleRenameRequest_];
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dumpState
{
  id v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  id v4 = NSString;
  id v5 = [(HMDRoom *)self name];
  id v6 = [(HMDRoom *)self uuid];
  id v7 = [v6 UUIDString];
  id v8 = [(HMDRoom *)self urlString];
  id v9 = [v4 stringWithFormat:@"name: %@  uuid: %@, assistantIdentifier: %@", v5, v7, v8];

  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F41FA8]];
  uint64_t v10 = [(HMDRoom *)self appData];
  v11 = [v10 dumpState];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x263F41E98]];

  return v3;
}

- (NSString)serializedIdentifier
{
  id v3 = NSString;
  id v4 = [(HMDRoom *)self home];
  id v5 = [v4 uuid];
  id v6 = [v5 UUIDString];
  id v7 = [(HMDRoom *)self uuid];
  id v8 = [v7 UUIDString];
  id v9 = [v3 stringWithFormat:@"%@/%@", v6, v8];

  return (NSString *)v9;
}

- (void)configure:(id)a3 queue:(id)a4
{
  id v6 = a4;
  [(HMDRoom *)self setMsgDispatcher:a3];
  [(HMDRoom *)self setWorkQueue:v6];

  [(HMDRoom *)self _registerForMessages];
}

- (void)dealloc
{
  id v3 = [(HMDRoom *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDRoom *)self home];
  id v5 = [v4 administratorHandler];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDRoom;
  [(HMDRoom *)&v6 dealloc];
}

- (HMDRoom)initWithName:(id)a3 uuid:(id)a4 home:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDRoom;
  v11 = [(HMDRoom *)&v23 init];
  if (v11)
  {
    int v12 = objc_msgSend(v8, "hm_truncatedNameString");
    uint64_t v13 = [v12 copy];
    name = v11->_name;
    v11->_name = (NSString *)v13;

    if (v9)
    {
      uint64_t v15 = [v9 copy];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x263F08C38] UUID];
    }
    v16 = (void *)v15;
    uint64_t v17 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSUUID:", v15);
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v17;

    int v19 = spiClientIdentifierForUUID(v11->_uuid);
    uint64_t v20 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSUUID:", v19);
    spiClientIdentifier = v11->_spiClientIdentifier;
    v11->_spiClientIdentifier = (NSUUID *)v20;

    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_home, v10);
  }
  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_148826 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_148826, &__block_literal_global_148827);
  }
  v2 = (void *)logCategory__hmf_once_v13_148828;
  return v2;
}

void __22__HMDRoom_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13_148828;
  logCategory__hmf_once_v13_148828 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)messageBindingsForDispatcher:(id)a3
{
  void v11[3] = *MEMORY[0x263EF8340];
  id v3 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v11[0] = v3;
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v11[1] = v4;
  id v5 = objc_opt_new();
  v11[2] = v5;
  objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];

  id v7 = HMF_MESSAGE_BINDING();
  id v10 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];

  return v8;
}

- (NSDictionary)assistantObject
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = [(HMDRoom *)self home];
  if (self)
  {
    id v4 = [(HMDRoom *)self name];
    id v5 = v4;
    if (v4 && v3)
    {
      objc_super v6 = [v3 name];

      if (v6)
      {
        id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
        v52[0] = *MEMORY[0x263F655D8];
        v51[0] = @"objectType";
        v51[1] = @"objectName";
        id v8 = [(HMDRoom *)self name];
        v52[1] = v8;
        v51[2] = @"objectIdentifier";
        id v9 = [(HMDRoom *)self urlString];
        v52[2] = v9;
        v51[3] = @"objectHome";
        id v10 = [v3 name];
        v52[3] = v10;
        v51[4] = @"objectHomeIdentifier";
        v11 = [v3 urlString];
        v51[5] = @"objectReference";
        v52[4] = v11;
        v52[5] = self;
        int v12 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
        __int16 v35 = (void *)[v7 initWithDictionary:v12];

        uint64_t v13 = [MEMORY[0x263EFF980] array];
        int v14 = [MEMORY[0x263EFF980] array];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v36 = v3;
        uint64_t v15 = [v3 zones];
        v16 = (void *)[v15 copy];

        id obj = v16;
        uint64_t v39 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v39)
        {
          uint64_t v38 = *(void *)v46;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v46 != v38) {
                objc_enumerationMutation(obj);
              }
              uint64_t v40 = v17;
              v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              int v19 = objc_msgSend(v18, "roomUUIDs", v35);
              uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v42;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v42 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                    __int16 v25 = [(HMDRoom *)self uuid];
                    LODWORD(v24) = objc_msgSend(v25, "hmf_isEqualToUUIDString:", v24);

                    if (v24)
                    {
                      id v26 = [v18 name];
                      [v13 addObject:v26];

                      int v27 = [v18 urlString];
                      [v14 addObject:v27];
                    }
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
                }
                while (v21);
              }

              uint64_t v17 = v40 + 1;
            }
            while (v40 + 1 != v39);
            uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v39);
        }

        id v28 = v35;
        if ([v13 count])
        {
          [v35 setObject:v13 forKey:@"objectZones"];
          [v35 setObject:v14 forKey:@"objectZoneIdentifiers"];
        }
        __int16 v29 = objc_msgSend(v35, "copy", v35);

        id v3 = v36;
        goto LABEL_28;
      }
    }
    else
    {
    }
  }
  v30 = (void *)MEMORY[0x230FBD990]();
  uint64_t v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = HMFGetLogIdentifier();
    v33 = [(HMDRoom *)self name];
    *(_DWORD *)buf = 138543874;
    v54 = v32;
    __int16 v55 = 2112;
    v56 = v33;
    __int16 v57 = 2112;
    v58 = v3;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of room is nil: name %@  home %@", buf, 0x20u);
  }
  __int16 v29 = 0;
LABEL_28:

  return (NSDictionary *)v29;
}

- (NSString)urlString
{
  v2 = [(HMDRoom *)self uuid];
  id v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

@end