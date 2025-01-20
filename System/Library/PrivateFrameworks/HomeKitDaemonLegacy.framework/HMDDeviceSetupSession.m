@interface HMDDeviceSetupSession
+ (BOOL)isRoleSupported:(int64_t)a3;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpen;
- (HMAccessoryCategory)accessoryCategory;
- (HMDDeviceSetupSession)init;
- (HMDDeviceSetupSession)initWithIdentifier:(id)a3 role:(int64_t)a4 homeManager:(id)a5;
- (HMDDeviceSetupSession)initWithIdentifier:(id)a3 role:(int64_t)a4 homeManager:(id)a5 upSecondsFactory:(id)a6 userDefaults:(id)a7;
- (HMDDeviceSetupSessionDelegate)delegate;
- (HMDDeviceSetupSessionInternal)internal;
- (HMDHomeManager)homeManager;
- (NSError)sessionError;
- (NSString)accessoryIDSIdentifier;
- (NSString)category;
- (NSString)setupClientBundleID;
- (NSUUID)accessoryUUID;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (id)logIdentifier;
- (id)messageDestination;
- (id)messageDispatcher;
- (id)setupTrackingInfo;
- (id)upSecondsFactory;
- (int64_t)role;
- (unint64_t)endTime;
- (unint64_t)hash;
- (unint64_t)startTime;
- (void)__registerForMessages;
- (void)_closeWithError:(id)a3;
- (void)_handleClose:(id)a3;
- (void)_handleReceiveData:(id)a3;
- (void)_sendRequestData:(id)a3;
- (void)close:(id)a3;
- (void)open;
- (void)setAccessoryCategory:(id)a3;
- (void)setAccessoryIDSIdentifier:(id)a3;
- (void)setAccessoryUUID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndTime:(unint64_t)a3;
- (void)setOpen:(BOOL)a3;
- (void)setSessionError:(id)a3;
- (void)setSetupClientBundleID:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)updateAccessoryUUIDAndNotifyDelegate:(id)a3 accessoryIDSIdentifier:(id)a4 accessoryCategory:(id)a5;
@end

@implementation HMDDeviceSetupSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upSecondsFactory, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_sessionError, 0);
  objc_storeStrong((id *)&self->_setupClientBundleID, 0);
  objc_storeStrong((id *)&self->_accessoryIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (id)upSecondsFactory
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (HMDDeviceSetupSessionInternal)internal
{
  return self->_internal;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDDeviceSetupSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDDeviceSetupSessionDelegate *)WeakRetained;
}

- (void)setCategory:(id)a3
{
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setSessionError:(id)a3
{
}

- (NSError)sessionError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setSetupClientBundleID:(id)a3
{
}

- (NSString)setupClientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccessoryIDSIdentifier:(id)a3
{
}

- (NSString)accessoryIDSIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessoryCategory:(id)a3
{
}

- (HMAccessoryCategory)accessoryCategory
{
  return (HMAccessoryCategory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (id)setupTrackingInfo
{
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v14 = [HMDDeviceSetupTrackingInfo alloc];
  v16 = [(HMDDeviceSetupSession *)self identifier];
  v3 = (void *)[v16 copy];
  unint64_t v4 = [(HMDDeviceSetupSession *)self startTime];
  unint64_t v5 = [(HMDDeviceSetupSession *)self endTime];
  int64_t v6 = [(HMDDeviceSetupSession *)self role];
  v7 = [(HMDDeviceSetupSession *)self accessoryUUID];
  v8 = (void *)[v7 copy];
  v9 = [(HMDDeviceSetupSession *)self accessoryCategory];
  v10 = [(HMDDeviceSetupSession *)self accessoryIDSIdentifier];
  v11 = [(HMDDeviceSetupSession *)self setupClientBundleID];
  v12 = [(HMDDeviceSetupTrackingInfo *)v14 initWithIdentifier:v3 startTime:v4 endTime:v5 role:v6 accessoryUUID:v8 accessoryCategory:v9 accessoryIDSIdentifier:v10 setupClientBundleID:v11];

  os_unfair_lock_unlock(lock);
  return v12;
}

- (id)logIdentifier
{
  v2 = [(HMDDeviceSetupSession *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_sendRequestData:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMFActivity *)self->_activity markWithReason:@"Sending data"];
  [(HMFActivity *)self->_activity markWithReason:@"HMDDeviceSetupSession.sendRequestData"];
  uint64_t v18 = *MEMORY[0x1E4F2D0D8];
  v19[0] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  int64_t v6 = [MEMORY[0x1E4F65480] entitledMessageWithName:*MEMORY[0x1E4F2D0F8] messagePayload:v5];
  v7 = [(HMDDeviceSetupSession *)self messageDispatcher];
  v8 = [(HMDDeviceSetupSession *)self messageDestination];
  v9 = [v8 target];
  [v7 sendMessage:v6 target:v9];

  v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = HMFGetLogIdentifier();
    int v14 = 138543618;
    v15 = v13;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Sending data : %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)_handleReceiveData:(id)a3
{
  id v4 = a3;
  activity = self->_activity;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HMDDeviceSetupSession__handleReceiveData___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HMFActivity *)activity performBlock:v7];
}

void __44__HMDDeviceSetupSession__handleReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]([*(id *)(*(void *)(a1 + 32) + 8) markWithReason:@"Received data"]);
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v44 = v5;
    __int16 v45 = 2112;
    id v46 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received receive data request : %@", buf, 0x16u);
  }
  uint64_t v7 = *MEMORY[0x1E4F2D0D8];
  id v8 = [*(id *)(a1 + 40) dataForKey:*MEMORY[0x1E4F2D0D8]];
  if (v8)
  {
    v9 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_lock_with_options();
    v10 = [*(id *)(a1 + 40) clientIdentifier];
    [*(id *)(a1 + 32) setSetupClientBundleID:v10];

    os_unfair_lock_unlock(v9);
    v11 = [*(id *)(a1 + 32) internal];
    id v39 = 0;
    id v40 = 0;
    id v37 = 0;
    id v38 = 0;
    char v12 = [v11 processSessionData:v8 outAccessoryUUID:&v40 outAccessoryCategory:&v39 outAccessoryIDSIdentifier:&v38 error:&v37];
    id v36 = v40;
    id v13 = v39;
    id v14 = v38;
    id v15 = v37;

    if (v12)
    {
      [*(id *)(a1 + 32) updateAccessoryUUIDAndNotifyDelegate:v36 accessoryIDSIdentifier:v14 accessoryCategory:v13];
      __int16 v16 = [*(id *)(a1 + 32) internal];
      v17 = [v16 sessionData];

      if (v17)
      {
        uint64_t v41 = v7;
        v42 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      }
      else
      {
        uint64_t v18 = 0;
      }
      [*(id *)(a1 + 40) respondWithPayload:v18];
      v29 = [*(id *)(a1 + 32) internal];
      BOOL v30 = [v29 state] == 3;

      if (v30)
      {
        context = (void *)MEMORY[0x1D9452090]();
        id v31 = *(id *)(a1 + 32);
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v34 = HMFGetLogIdentifier();
          [*(id *)(a1 + 32) isOpen];
          v33 = HMFBooleanToString();
          *(_DWORD *)buf = 138543618;
          v44 = v34;
          __int16 v45 = 2112;
          id v46 = v33;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Going to close the session as the state is now complete: [isOpen : %@]", buf, 0x16u);
        }
        [*(id *)(a1 + 32) _closeWithError:0];
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = *(id *)(a1 + 32);
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v44 = v27;
        __int16 v45 = 2112;
        id v46 = v15;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to process session data with error: %@", buf, 0x16u);
      }
      v28 = [*(id *)(a1 + 40) responseHandler];

      if (!v28) {
        goto LABEL_21;
      }
      uint64_t v18 = [*(id *)(a1 + 40) responseHandler];
      ((void (**)(void, id, void))v18)[2](v18, v15, 0);
    }

LABEL_21:
    goto LABEL_22;
  }
  v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = *(id *)(a1 + 32);
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v44 = v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Missing session data", buf, 0xCu);
  }
  v23 = *(void **)(a1 + 40);
  id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
  [v23 respondWithError:v15];
LABEL_22:
}

- (void)close:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Called to close session", buf, 0xCu);
  }
  v9 = [(HMDDeviceSetupSession *)v6 clientQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__HMDDeviceSetupSession_close___block_invoke;
  v11[3] = &unk_1E6A197C8;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

uint64_t __31__HMDDeviceSetupSession_close___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleClose:*(void *)(a1 + 40)];
}

- (void)_handleClose:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D9452090]([(HMFActivity *)self->_activity begin]);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    [(HMDDeviceSetupSession *)v6 isOpen];
    v9 = HMFBooleanToString();
    int v11 = 138543874;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received close request : %@, [isOpen = %@]", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [v4 errorForKey:*MEMORY[0x1E4F2D0E0]];
  [(HMDDeviceSetupSession *)v6 _closeWithError:v10];
  [v4 respondWithPayload:0];
  [(HMFActivity *)self->_activity end];
}

- (void)_closeWithError:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    [(HMDDeviceSetupSession *)v6 isOpen];
    v9 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v8;
    __int16 v42 = 2112;
    id v43 = v9;
    __int16 v44 = 2112;
    id v45 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@CloseWithError: [isOpen: %@] [error: %@]", buf, 0x20u);
  }
  if ([(HMDDeviceSetupSession *)v6 isOpen])
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = v6;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v13;
      __int16 v42 = 2112;
      id v43 = v4;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Closing the session with error:%@", buf, 0x16u);
    }
    [(HMFActivity *)v11->_activity markWithReason:@"Closing"];
    activity = v11->_activity;
    id v38 = @"errorCode";
    __int16 v15 = NSNumber;
    __int16 v16 = activity;
    uint64_t v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v4, "code"));
    id v39 = v17;
    id v18 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

    [(HMFActivity *)v11->_activity markWithReason:@"HMDDeviceSetupSession.close"];
    [(HMDDeviceSetupSession *)v11 setOpen:0];
    if (v4)
    {
      v19 = encodeRootObjectForIncomingXPCMessage(v4, 0);
      uint64_t v36 = *MEMORY[0x1E4F2D0E0];
      id v37 = v19;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    }
    else
    {
      v21 = [(HMDDeviceSetupSession *)v11 internal];
      v22 = [v21 userInfo];

      if (!v22)
      {
        id v20 = 0;
        goto LABEL_11;
      }
      v19 = [(HMDDeviceSetupSession *)v11 internal];
      v23 = [v19 userInfo];
      v35 = v23;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    }
LABEL_11:
    os_unfair_lock_lock_with_options();
    [(HMDDeviceSetupSession *)v11 setSessionError:v4];
    v24 = [(HMDDeviceSetupSession *)v11 upSecondsFactory];
    [(HMDDeviceSetupSession *)v11 setEndTime:v24[2]()];

    os_unfair_lock_unlock(&v11->_lock);
    id v25 = [MEMORY[0x1E4F65480] entitledMessageWithName:*MEMORY[0x1E4F2D0D0] messagePayload:v20];
    v26 = [(HMDDeviceSetupSession *)v11 messageDispatcher];
    v27 = [(HMDDeviceSetupSession *)v11 messageDestination];
    v28 = [v27 target];
    [v26 sendMessage:v25 target:v28];

    v29 = (void *)MEMORY[0x1D9452090]();
    BOOL v30 = v11;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v32;
      __int16 v42 = 2112;
      id v43 = v4;
      __int16 v44 = 2112;
      id v45 = v25;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Going to call the delegate with error:%@, Also sending the close message to client: %@", buf, 0x20u);
    }
    v33 = [(HMDDeviceSetupSession *)v30 delegate];
    [v33 setupSession:v30 didCloseWithError:v4];
  }
}

- (void)updateAccessoryUUIDAndNotifyDelegate:(id)a3 accessoryIDSIdentifier:(id)a4 accessoryCategory:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock_with_options();
  if (v17)
  {
    id v10 = [(HMDDeviceSetupSession *)self accessoryUUID];
    char v11 = objc_msgSend(v17, "hmf_isEqualToUUID:", v10);

    id v12 = (void *)[v17 copy];
    [(HMDDeviceSetupSession *)self setAccessoryUUID:v12];
    char v13 = v11 ^ 1;

    if (!v8) {
      goto LABEL_3;
    }
LABEL_6:
    id v14 = (void *)[v8 copy];
    [(HMDDeviceSetupSession *)self setAccessoryIDSIdentifier:v14];

    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  char v13 = 0;
  if (v8) {
    goto LABEL_6;
  }
LABEL_3:
  if (v9)
  {
LABEL_7:
    __int16 v15 = (void *)[v9 copy];
    [(HMDDeviceSetupSession *)self setAccessoryCategory:v15];
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    __int16 v16 = [(HMDDeviceSetupSession *)self delegate];
    [v16 setupSession:self didReceiveAccessoryWithUUID:v17];
  }
}

- (void)open
{
  id v3 = self->_activity;
  [(HMFActivity *)v3 begin];
  id v4 = [(HMDDeviceSetupSession *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMDDeviceSetupSession_open__block_invoke;
  v6[3] = &unk_1E6A197C8;
  v6[4] = self;
  uint64_t v7 = v3;
  unint64_t v5 = v3;
  dispatch_async(v4, v6);
}

void __29__HMDDeviceSetupSession_open__block_invoke(uint64_t a1)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) homeManager];
  id v3 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 40) markWithReason:@"Opening"]);
  id v4 = *(id *)(a1 + 32);
  unint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v50 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Opening", buf, 0xCu);
  }
  uint64_t v7 = *(void **)(a1 + 40);
  v53 = @"HomeManagerUUID";
  id v8 = v7;
  id v9 = [v2 uuid];
  id v10 = HMDailyRotatedUUID();
  uint64_t v11 = [v10 UUIDString];
  id v12 = (void *)v11;
  char v13 = @"no uuid";
  if (v11) {
    char v13 = (__CFString *)v11;
  }
  v54[0] = v13;
  id v14 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];

  [*(id *)(a1 + 40) markWithReason:@"HMDDeviceSetupSession.open"];
  [*(id *)(a1 + 32) setOpen:1];
  if ([*(id *)(a1 + 32) role])
  {
LABEL_6:
    [*(id *)(a1 + 40) end];
    goto LABEL_25;
  }
  __int16 v15 = [v2 cloudDataSyncStateFilter];
  int v16 = [v15 decryptionFailed];

  if (!v16)
  {
    v22 = [*(id *)(a1 + 32) internal];
    id v47 = 0;
    id v48 = 0;
    id v45 = 0;
    id v46 = 0;
    char v23 = [v22 processSessionData:0 outAccessoryUUID:&v48 outAccessoryCategory:&v47 outAccessoryIDSIdentifier:&v46 error:&v45];
    id v24 = v48;
    id v25 = v47;
    id v26 = v46;
    id v27 = v45;

    if (v23)
    {
      [*(id *)(a1 + 32) updateAccessoryUUIDAndNotifyDelegate:v24 accessoryIDSIdentifier:v26 accessoryCategory:v25];
      v28 = [*(id *)(a1 + 32) internal];
      uint64_t v29 = [v28 state];

      BOOL v30 = *(void **)(a1 + 32);
      if (v29 != 3)
      {
        uint64_t v36 = [v30 internal];
        id v37 = [v36 sessionData];

        if (v37)
        {
          [*(id *)(a1 + 32) _sendRequestData:v37];
          int v35 = 0;
        }
        else
        {
          id v38 = (void *)MEMORY[0x1D9452090]();
          id v39 = *(id *)(a1 + 32);
          id v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            uint64_t v41 = v44 = v38;
            *(_DWORD *)buf = 138543362;
            v50 = v41;
            _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Missing session data", buf, 0xCu);

            id v38 = v44;
          }

          __int16 v42 = *(void **)(a1 + 32);
          id v43 = [MEMORY[0x1E4F28C58] hmErrorWithCode:56];
          [v42 _closeWithError:v43];

          int v35 = 1;
        }

LABEL_24:
        if (v35) {
          goto LABEL_25;
        }
        goto LABEL_6;
      }
      [v30 _closeWithError:0];
    }
    else
    {
      id v31 = (void *)MEMORY[0x1D9452090]();
      id v32 = *(id *)(a1 + 32);
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v50 = v34;
        __int16 v51 = 2112;
        id v52 = v27;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send initial session data with error: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _closeWithError:v27];
      [*(id *)(a1 + 32) updateAccessoryUUIDAndNotifyDelegate:v24 accessoryIDSIdentifier:v26 accessoryCategory:v25];
    }
    int v35 = 1;
    goto LABEL_24;
  }
  id v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = *(id *)(a1 + 32);
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v50 = v20;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Not supported if cloud decryption has failed", buf, 0xCu);
  }
  v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:77];
  [*(id *)(a1 + 32) _closeWithError:v21];

LABEL_25:
}

- (void)__registerForMessages
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDDeviceSetupSession *)self messageDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  uint64_t v5 = *MEMORY[0x1E4F2D0D0];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 registerForMessage:v5 receiver:self policies:v6 selector:sel__handleClose_];

  uint64_t v7 = *MEMORY[0x1E4F2D0F8];
  id v9 = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [v3 registerForMessage:v7 receiver:self policies:v8 selector:sel__handleReceiveData_];
}

- (id)messageDispatcher
{
  v2 = [(HMDDeviceSetupSession *)self homeManager];
  id v3 = [v2 messageDispatcher];

  return v3;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMDDeviceSetupSession *)self identifier];
  uint64_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (int64_t)role
{
  v2 = [(HMDDeviceSetupSession *)self internal];
  int64_t v3 = [(id)objc_opt_class() role];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDDeviceSetupSession *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMDDeviceSetupSession *)self identifier];
      id v8 = [(HMDDeviceSetupSession *)v6 identifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDDeviceSetupSession *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDDeviceSetupSession)initWithIdentifier:(id)a3 role:(int64_t)a4 homeManager:(id)a5 upSecondsFactory:(id)a6 userDefaults:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    int v35 = (void *)MEMORY[0x1D9452090]();
    uint64_t v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v45 = v37;
      id v38 = "%{public}@Identifier is a required parameter";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, v38, buf, 0xCu);
    }
LABEL_11:

    id v39 = 0;
    goto LABEL_15;
  }
  if (!v13)
  {
    int v35 = (void *)MEMORY[0x1D9452090]();
    uint64_t v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v45 = v37;
      id v38 = "%{public}@Home manager is a required parameter";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v43.receiver = self;
  v43.super_class = (Class)HMDDeviceSetupSession;
  int v16 = [(HMDDeviceSetupSession *)&v43 init];
  id v17 = v16;
  if (v16)
  {
    v16->_lock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSUUID *)v18;

    objc_storeWeak((id *)&v17->_homeManager, v13);
    HMDispatchQueueNameString();
    id v20 = objc_claimAutoreleasedReturnValue();
    v21 = (const char *)[v20 UTF8String];
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    clientQueue = v17->_clientQueue;
    v17->_clientQueue = (OS_dispatch_queue *)v23;

    id v25 = objc_alloc(MEMORY[0x1E4F653F0]);
    id v26 = NSString;
    id v27 = [(NSUUID *)v17->_identifier UUIDString];
    v28 = [v26 stringWithFormat:@"Device Setup Session (%@)", v27];
    uint64_t v29 = [v13 setupActivity];
    uint64_t v30 = [v25 initWithName:v28 parent:v29];
    activity = v17->_activity;
    v17->_activity = (HMFActivity *)v30;

    id v32 = _Block_copy(v14);
    id upSecondsFactory = v17->_upSecondsFactory;
    v17->_id upSecondsFactory = v32;

    if (a4) {
      uint64_t v34 = [[HMDDeviceSetupServerSession alloc] initWithHomeManager:v13 userDefaults:v15];
    }
    else {
      uint64_t v34 = [[HMDDeviceSetupClientSession alloc] initWithHomeManager:v13 userDefaults:v15 sessionIdentifier:v12];
    }
    internal = v17->_internal;
    v17->_internal = &v34->super;

    uint64_t v41 = [(HMDDeviceSetupSession *)v17 upSecondsFactory];
    v17->_startTime = v41[2]();

    [(HMDDeviceSetupSession *)v17 __registerForMessages];
    [(HMDDeviceSetupSession *)v17 open];
  }
  self = v17;
  id v39 = self;
LABEL_15:

  return v39;
}

- (HMDDeviceSetupSession)initWithIdentifier:(id)a3 role:(int64_t)a4 homeManager:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CB18];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v8 standardUserDefaults];
  id v12 = [(HMDDeviceSetupSession *)self initWithIdentifier:v10 role:a4 homeManager:v9 upSecondsFactory:&__block_literal_global_26360 userDefaults:v11];

  return v12;
}

__uint64_t __61__HMDDeviceSetupSession_initWithIdentifier_role_homeManager___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
}

- (HMDDeviceSetupSession)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1) {
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global_81);
  }
  v2 = (void *)logCategory__hmf_once_v21;
  return v2;
}

uint64_t __36__HMDDeviceSetupSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v21;
  logCategory__hmf_once_v21 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isRoleSupported:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v3 = off_1E6A03440;
    return [(__objc2_class *)*v3 isSupported];
  }
  if (a3 == 1)
  {
    uint64_t v3 = off_1E6A03448;
    return [(__objc2_class *)*v3 isSupported];
  }
  return 0;
}

@end