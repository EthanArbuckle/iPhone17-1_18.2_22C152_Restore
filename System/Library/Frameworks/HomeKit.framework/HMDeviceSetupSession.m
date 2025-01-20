@interface HMDeviceSetupSession
+ (id)logCategory;
+ (id)messageDestinationToHomeManager;
- (BOOL)_moveToState:(int64_t)a3;
- (BOOL)_needsClosing;
- (HMDeviceSetupSession)init;
- (HMDeviceSetupSession)initWithRole:(int64_t)a3 context:(id)a4 identifier:(id)a5 delegate:(id)a6;
- (HMDeviceSetupSession)initWithRole:(int64_t)a3 identifier:(id)a4 delegate:(id)a5;
- (HMDeviceSetupSessionDelegate)delegate;
- (NSDictionary)userInfo;
- (NSMutableArray)pendingExchangeDataRequests;
- (NSUUID)identifier;
- (_HMContext)context;
- (id)closeSetupSessionHMDHomeManagerMessage;
- (id)logIdentifier;
- (id)messageDestinationForOpenedSessions;
- (id)responseHandlerForOpenMessage;
- (id)responseHandlerForReceiveDataMessageWithCompletionHandler:(id)a3;
- (int64_t)role;
- (void)_closeWithError:(id)a3;
- (void)_handleDeviceSetupSessionReceiveDataMessage:(id)a3;
- (void)_handleOpenedSession;
- (void)cleanUpSession;
- (void)cleanUpSessionWithError:(id)a3;
- (void)close;
- (void)configure;
- (void)dealloc;
- (void)handleDeviceSetupSessionCloseMessage:(id)a3;
- (void)handleDeviceSetupSessionReceiveDataMessage:(id)a3;
- (void)handleHomeKitDaemonInterruptedNotification:(id)a3;
- (void)open;
- (void)registerForMessages;
- (void)registerForNotifications;
- (void)sendExchangeData:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)setUserInfo:(id)a3;
@end

@implementation HMDeviceSetupSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingExchangeDataRequests, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

- (NSMutableArray)pendingExchangeDataRequests
{
  return self->_pendingExchangeDataRequests;
}

- (_HMContext)context
{
  return self->_context;
}

- (int64_t)role
{
  return self->_role;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (HMDeviceSetupSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMDeviceSetupSessionDelegate *)WeakRetained;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDeviceSetupSession", buf, 0xCu);
  }
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:v4];

  v8 = [(HMDeviceSetupSession *)v4 context];
  v9 = [v8 messageDispatcher];
  [v9 deregisterReceiver:v4];

  v10.receiver = v4;
  v10.super_class = (Class)HMDeviceSetupSession;
  [(HMDeviceSetupSession *)&v10 dealloc];
}

- (id)logIdentifier
{
  v2 = [(HMDeviceSetupSession *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)setUserInfo:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDictionary *)[v6 copy];
  userInfo = self->_userInfo;
  self->_userInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)userInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)_moveToState:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDeviceSetupSession *)self context];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  unint64_t state = self->_state;
  switch(state)
  {
    case 0uLL:
      if ((unint64_t)(a3 - 2) < 2 || !a3) {
        goto LABEL_16;
      }
      BOOL v8 = a3 == 1;
      goto LABEL_9;
    case 1uLL:
      if ((unint64_t)a3 < 2) {
        goto LABEL_16;
      }
      if ((unint64_t)(a3 - 2) >= 2) {
        goto LABEL_13;
      }
      goto LABEL_19;
    case 2uLL:
      BOOL v8 = a3 == 3;
      if ((unint64_t)a3 < 3) {
        goto LABEL_16;
      }
LABEL_9:
      if (!v8) {
        goto LABEL_13;
      }
LABEL_19:
      v21 = (void *)MEMORY[0x19F3A64A0]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        v25 = HMDeviceSetupSessionStateAsString(a3);
        v26 = HMDeviceSetupSessionStateAsString(state);
        int v27 = 138543874;
        v28 = v24;
        __int16 v29 = 2112;
        v30 = v25;
        __int16 v31 = 2112;
        v32 = v26;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Moving to state: %@ from state: %@", (uint8_t *)&v27, 0x20u);
      }
      self->_unint64_t state = a3;
      BOOL result = 1;
      break;
    case 3uLL:
      if ((unint64_t)a3 < 2) {
        goto LABEL_19;
      }
      if ((unint64_t)(a3 - 2) >= 2)
      {
LABEL_13:
        v9 = (void *)MEMORY[0x19F3A64A0]();
        objc_super v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = HMFGetLogIdentifier();
          v12 = HMDeviceSetupSessionStateAsString(a3);
          uint64_t v13 = HMDeviceSetupSessionStateAsString(state);
          int v27 = 138543874;
          v28 = v11;
          __int16 v29 = 2112;
          v30 = v12;
          __int16 v31 = 2112;
          v32 = v13;
          _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMDeviceSetupSession] Failed to understand move to state: %@ from state: %@", (uint8_t *)&v27, 0x20u);
        }
      }
LABEL_16:
      v14 = (void *)MEMORY[0x19F3A64A0]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        v18 = HMDeviceSetupSessionStateAsString(a3);
        v19 = HMDeviceSetupSessionStateAsString(state);
        int v27 = 138543874;
        v28 = v17;
        __int16 v29 = 2112;
        v30 = v18;
        __int16 v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to move to state: %@ from state: %@", (uint8_t *)&v27, 0x20u);
      }
      BOOL result = 0;
      break;
    default:
      goto LABEL_13;
  }
  return result;
}

- (BOOL)_needsClosing
{
  v3 = [(HMDeviceSetupSession *)self context];
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  int64_t state = self->_state;
  if (state) {
    BOOL v6 = state == 3;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (id)responseHandlerForReceiveDataMessageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HMDeviceSetupSession_responseHandlerForReceiveDataMessageWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5944EF0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = _Block_copy(v8);

  return v6;
}

void __82__HMDeviceSetupSession_responseHandlerForReceiveDataMessageWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Receive data response with payload: %@ error: %@", buf, 0x20u);
  }
  v11 = NSNumber;
  id v12 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v5, "code", @"code"));
  v21[1] = @"domain";
  v22[0] = v13;
  uint64_t v14 = [v5 domain];
  v15 = (void *)v14;
  v16 = &stru_1EEE9DD88;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v22[1] = v16;
  id v17 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  [*(id *)(*(void *)(a1 + 32) + 24) markWithReason:@"reallySendExchangeData"];
  v18 = [v6 objectForKeyedSubscript:@"da"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendExchangeData:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = [(HMDeviceSetupSession *)self context];
  v11 = [v10 queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HMDeviceSetupSession_sendExchangeData_qualityOfService_completionHandler___block_invoke;
  v15[3] = &unk_1E5945110;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  int64_t v19 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v15);
  dispatch_async(v11, v14);
}

void __76__HMDeviceSetupSession_sendExchangeData_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    objc_super v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v13;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to send missing exchange data", buf, 0xCu);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 9013;
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 16);
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      v3 = (void *)MEMORY[0x19F3A64A0]();
      id v4 = *(id *)(a1 + 40);
      id v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = HMFGetLogIdentifier();
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v39 = v6;
        __int16 v40 = 2112;
        uint64_t v41 = v7;
        _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing exchange data: %@", buf, 0x16u);
      }
      id v8 = [[HMDeviceSetupSessionExchangeDataRequest alloc] initWithExchangeData:*(void *)(a1 + 32) qualityOfService:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
      id v9 = [*(id *)(a1 + 40) pendingExchangeDataRequests];
      [v9 addObject:v8];

      goto LABEL_17;
    }
    v30 = (void *)MEMORY[0x19F3A64A0]();
    id v31 = *(id *)(a1 + 40);
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = HMFGetLogIdentifier();
      uint64_t v34 = *(void *)(a1 + 32);
      v35 = HMDeviceSetupSessionStateAsString(*(void *)(*(void *)(a1 + 40) + 16));
      *(_DWORD *)buf = 138543874;
      v39 = v33;
      __int16 v40 = 2112;
      uint64_t v41 = v34;
      __int16 v42 = 2112;
      v43 = v35;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not Sending exchange data: %@ as the setup session is not in a state to send it %@", buf, 0x20u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 9011;
LABEL_16:
    id v8 = [v15 hmPrivateErrorWithCode:v16];
    (*(void (**)(uint64_t, void, HMDeviceSetupSessionExchangeDataRequest *))(v14 + 16))(v14, 0, v8);
    goto LABEL_17;
  }
  id v17 = (void *)MEMORY[0x19F3A64A0]();
  id v18 = *(id *)(a1 + 40);
  int64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v39 = v20;
    __int16 v40 = 2112;
    uint64_t v41 = v21;
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Sending exchange data: %@", buf, 0x16u);
  }
  uint64_t v22 = *(void *)(a1 + 32);
  v36 = @"da";
  uint64_t v37 = v22;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v23 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v24 = *(void *)(a1 + 56);
  __int16 v25 = [*(id *)(a1 + 40) messageDestinationForOpenedSessions];
  id v26 = [v23 messageWithName:@"HMDSS.rc" qualityOfService:v24 destination:v25 payload:v8];

  __int16 v27 = [*(id *)(a1 + 40) responseHandlerForReceiveDataMessageWithCompletionHandler:*(void *)(a1 + 48)];
  [v26 setResponseHandler:v27];

  id v28 = [*(id *)(a1 + 40) context];
  uint64_t v29 = [v28 messageDispatcher];
  [v29 sendMessage:v26];

LABEL_17:
}

- (void)_closeWithError:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = [(HMDeviceSetupSession *)self context];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if ([(HMDeviceSetupSession *)self _moveToState:3])
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = HMFGetLogIdentifier();
      id v11 = @" due to error: ";
      *(_DWORD *)buf = 138543874;
      v55 = v10;
      if (!v4) {
        id v11 = &stru_1EEE9DD88;
      }
      __int16 v56 = 2112;
      if (v4) {
        id v12 = v4;
      }
      else {
        id v12 = &stru_1EEE9DD88;
      }
      v57 = v11;
      __int16 v58 = 2112;
      v59 = v12;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Closing session%@%@", buf, 0x20u);
    }
    id v13 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v14 = [(HMDeviceSetupSession *)v8 messageDestinationForOpenedSessions];
    v15 = [v13 messageWithName:@"HMDSS.cl" qualityOfService:9 destination:v14 payload:0];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __40__HMDeviceSetupSession__closeWithError___block_invoke;
    v50[3] = &unk_1E5943FA0;
    v50[4] = v8;
    [v15 setResponseHandler:v50];
    uint64_t v16 = [(HMDeviceSetupSession *)v8 context];
    id v17 = [v16 messageDispatcher];
    [v17 sendMessage:v15];

    [(HMFActivity *)v8->_activity markWithReason:@"HMDeviceSetupSession.closeWithError"];
    activity = v8->_activity;
    v52[0] = @"code";
    int64_t v19 = NSNumber;
    id v20 = activity;
    uint64_t v21 = objc_msgSend(v19, "numberWithInteger:", -[__CFString code](v4, "code"));
    v52[1] = @"domain";
    v53[0] = v21;
    uint64_t v22 = [(__CFString *)v4 domain];
    v23 = (void *)v22;
    if (v22) {
      uint64_t v24 = (__CFString *)v22;
    }
    else {
      uint64_t v24 = &stru_1EEE9DD88;
    }
    v53[1] = v24;
    id v25 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

    if ([(HMDeviceSetupSession *)v8 _moveToState:0])
    {
      id v26 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v27 = v8;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v55 = v29;
        __int16 v56 = 2112;
        v57 = v4;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did close with error: %@", buf, 0x16u);
      }
      v30 = [(HMDeviceSetupSession *)v27 delegate];
      [v30 setupSession:v27 didCloseWithError:v4];

      id v31 = [(HMDeviceSetupSession *)v27 pendingExchangeDataRequests];
      v32 = (void *)[v31 copy];

      uint64_t v33 = [(HMDeviceSetupSession *)v27 pendingExchangeDataRequests];
      [v33 removeAllObjects];

      uint64_t v34 = (void *)MEMORY[0x19F3A64A0]();
      v35 = v27;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        uint64_t v38 = [v32 count];
        *(_DWORD *)buf = 138543618;
        v55 = v37;
        __int16 v56 = 2048;
        v57 = (__CFString *)v38;
        _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_INFO, "%{public}@Removing %ld remaining pending requests", buf, 0x16u);
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v39 = v32;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v47 != v42) {
              objc_enumerationMutation(v39);
            }
            objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "completionHandler", (void)v46);
            uint64_t v44 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
            v45 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:9012];
            ((void (**)(void, void, void *))v44)[2](v44, 0, v45);
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v41);
      }
    }
  }
}

void __40__HMDeviceSetupSession__closeWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = HMFGetLogIdentifier();
    int v20 = 138543618;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received response for close session message with error %@", (uint8_t *)&v20, 0x16u);
  }
  id v11 = [v5 domain];
  if (![v11 isEqual:*MEMORY[0x1E4F64ED0]]) {
    goto LABEL_10;
  }
  if ([v5 code] == 14)
  {

LABEL_7:
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      id v17 = [*(id *)(a1 + 32) identifier];
      int v20 = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@close session thru HMDHomeManager. session %@", (uint8_t *)&v20, 0x16u);
    }
    id v11 = [*(id *)(a1 + 32) context];
    id v18 = [v11 messageDispatcher];
    int64_t v19 = [*(id *)(a1 + 32) closeSetupSessionHMDHomeManagerMessage];
    [v18 sendMessage:v19];

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v12 = [v5 code];

  if (v12 == 2) {
    goto LABEL_7;
  }
LABEL_11:
}

- (id)closeSetupSessionHMDHomeManagerMessage
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F654B0];
  id v4 = [(id)objc_opt_class() messageDestinationToHomeManager];
  objc_super v10 = @"id";
  id v5 = [(HMDeviceSetupSession *)self identifier];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v7 = [v3 messageWithName:@"HMDSS.cl.homeManager" qualityOfService:9 destination:v4 payload:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__HMDeviceSetupSession_closeSetupSessionHMDHomeManagerMessage__block_invoke;
  v9[3] = &unk_1E5943FA0;
  v9[4] = self;
  [v7 setResponseHandler:v9];

  return v7;
}

void __62__HMDeviceSetupSession_closeSetupSessionHMDHomeManagerMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  objc_super v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 32) identifier];
      int v17 = 138543874;
      id v18 = v11;
      __int16 v19 = 2112;
      int v20 = v12;
      __int16 v21 = 2112;
      __int16 v22 = v5;
      id v13 = "%{public}@Failed to close session thru HMDHomeManager. session %@, error %@";
      id v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v14, v15, v13, (uint8_t *)&v17, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = [*(id *)(a1 + 32) identifier];
    int v17 = 138544130;
    id v18 = v11;
    __int16 v19 = 2112;
    int v20 = @"HMDSS.cl.homeManager";
    __int16 v21 = 2112;
    __int16 v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = 0;
    id v13 = "%{public}@Received response for %@ for session %@ with error %@";
    id v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 42;
    goto LABEL_6;
  }
}

- (void)close
{
  v3 = [(HMDeviceSetupSession *)self context];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__HMDeviceSetupSession_close__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v4, v5);
}

uint64_t __29__HMDeviceSetupSession_close__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) markWithReason:@"HMDeviceSetupSession.close"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _closeWithError:0];
}

- (void)cleanUpSessionWithError:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [(HMDeviceSetupSession *)self context];
  id v6 = [v5 queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__HMDeviceSetupSession_cleanUpSessionWithError___block_invoke;
  v9[3] = &unk_1E5945628;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v9);
  dispatch_async(v6, v8);
}

uint64_t __48__HMDeviceSetupSession_cleanUpSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) markWithReason:@"HMDeviceSetupSession.cleanUpSession"];
  uint64_t result = [*(id *)(a1 + 32) _needsClosing];
  if (result)
  {
    v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = *(id *)(a1 + 32);
    dispatch_block_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = *(__CFString **)(a1 + 40);
      dispatch_block_t v8 = @" with error: ";
      int v9 = 138543874;
      id v10 = v6;
      if (!v7)
      {
        dispatch_block_t v8 = &stru_1EEE9DD88;
        id v7 = &stru_1EEE9DD88;
      }
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Closing session due to clean up%@%@", (uint8_t *)&v9, 0x20u);
    }
    return [*(id *)(a1 + 32) _closeWithError:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)cleanUpSession
{
}

- (id)messageDestinationForOpenedSessions
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMDeviceSetupSession *)self identifier];
  dispatch_block_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_handleOpenedSession
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDeviceSetupSession *)self context];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  if ([(HMDeviceSetupSession *)self _moveToState:2])
  {
    dispatch_block_t v5 = [(HMDeviceSetupSession *)self delegate];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    dispatch_block_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v9;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did open session with delegate: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [v5 setupSessionDidOpen:v7];
    }
    id v10 = [(HMDeviceSetupSession *)v7 pendingExchangeDataRequests];
    __int16 v11 = (void *)[v10 copy];

    uint64_t v12 = [(HMDeviceSetupSession *)v7 pendingExchangeDataRequests];
    [v12 removeAllObjects];

    __int16 v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = v7;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint32_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v11 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v16;
      __int16 v34 = 2048;
      uint64_t v35 = v17;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Processing %ld pending requests", buf, 0x16u);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          __int16 v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend(v23, "exchangeData", (void)v27);
          uint64_t v25 = [v23 qos];
          id v26 = [v23 completionHandler];
          [(HMDeviceSetupSession *)v14 sendExchangeData:v24 qualityOfService:v25 completionHandler:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

- (id)responseHandlerForOpenMessage
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke;
  v4[3] = &unk_1E5943F78;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_block_t v8 = (void *)MEMORY[0x19F3A64A0]();
    int v9 = (id *)WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v30 = v11;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      id v34 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Received response for open message with payload: %@ error: %@", buf, 0x20u);
    }
    id v12 = v9[3];
    v27[0] = @"errorCode";
    __int16 v13 = NSNumber;
    id v14 = v12;
    uint64_t v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v5, "code"));
    v28[0] = v15;
    v27[1] = @"domain";
    uint64_t v16 = [v5 domain];
    uint64_t v17 = (void *)v16;
    id v18 = &stru_1EEE9DD88;
    if (v16) {
      id v18 = (__CFString *)v16;
    }
    v28[1] = v18;
    v27[2] = @"role";
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "role"));
    v28[2] = v19;
    id v20 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

    [v9[3] markWithReason:@"HMDeviceSetupSession.open.responseHandler"];
    uint64_t v21 = [v9 context];
    __int16 v22 = [v21 queue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke_115;
    v24[3] = &unk_1E5945628;
    id v25 = v5;
    id v26 = v9;
    dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v24);
    dispatch_async(v22, v23);
  }
}

uint64_t __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke_115(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "_closeWithError:");
  }
  else {
    return [v1 _handleOpenedSession];
  }
}

- (void)open
{
  id v3 = [(HMDeviceSetupSession *)self context];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__HMDeviceSetupSession_open__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __28__HMDeviceSetupSession_open__block_invoke(uint64_t a1)
{
  v33[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _moveToState:1])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = (void *)v2[3];
    v32[0] = @"identifier";
    id v4 = v3;
    dispatch_block_t v5 = [v2 identifier];
    id v6 = HMDailyRotatedUUID(v5);
    uint64_t v7 = [v6 UUIDString];
    dispatch_block_t v8 = (void *)v7;
    if (v7) {
      int v9 = (__CFString *)v7;
    }
    else {
      int v9 = @"no identifier";
    }
    v32[1] = @"role";
    v33[0] = v9;
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "role"));
    v33[1] = v10;
    id v11 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

    v30[0] = @"id";
    id v12 = [*(id *)(a1 + 32) identifier];
    __int16 v13 = [v12 UUIDString];
    v30[1] = @"ro";
    v31[0] = v13;
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "role"));
    v31[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v28 = 138543362;
      long long v29 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Sending device setup session open message", (uint8_t *)&v28, 0xCu);
    }
    id v20 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v21 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v22 = [v21 qualityOfService];
    dispatch_block_t v23 = [(id)objc_opt_class() messageDestinationToHomeManager];
    uint64_t v24 = [v20 messageWithName:@"HMDSS.op" qualityOfService:v22 destination:v23 payload:v15];

    id v25 = [*(id *)(a1 + 32) responseHandlerForOpenMessage];
    [v24 setResponseHandler:v25];

    [v24 setActivity:*(void *)(*(void *)(a1 + 32) + 24)];
    id v26 = [*(id *)(a1 + 32) context];
    long long v27 = [v26 messageDispatcher];
    [v27 sendMessage:v24];
  }
}

- (void)handleHomeKitDaemonInterruptedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_block_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    dispatch_block_t v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling homed interrupted notification: %@", (uint8_t *)&v10, 0x16u);
  }
  int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  [(HMDeviceSetupSession *)v6 cleanUpSessionWithError:v9];
}

- (void)registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleHomeKitDaemonInterruptedNotification_ name:@"kHomeKitDaemonInterruptedNotification" object:0];
}

- (void)_handleDeviceSetupSessionReceiveDataMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_block_t v5 = [(HMDeviceSetupSession *)self context];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [v4 dataForKey:@"da"];
  if (v7)
  {
    dispatch_block_t v8 = [(HMDeviceSetupSession *)self delegate];
    int v9 = (void *)MEMORY[0x19F3A64A0]();
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive exchange data: %@ delegate: %@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, v10);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke;
    v17[3] = &unk_1E5943F50;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v4;
    [v8 setupSession:v10 didReceiveExchangeData:v7 completionHandler:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get exchange data for message: %@", buf, 0x16u);
    }
    dispatch_block_t v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [v4 respondWithError:v8];
    [(HMDeviceSetupSession *)v14 cleanUpSessionWithError:v8];
  }
}

void __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    dispatch_block_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Notifying client of did receive exchange data resulted in error: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) qualityOfService];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke_82;
  v13[3] = &unk_1E5943F28;
  v13[4] = WeakRetained;
  [WeakRetained sendExchangeData:v5 qualityOfService:v12 completionHandler:v13];
}

void __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Sending exchange data resulted in error: %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6) {
    [*(id *)(a1 + 32) cleanUpSessionWithError:v6];
  }
}

- (void)handleDeviceSetupSessionReceiveDataMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Handling device setup session receive data message: %@", buf, 0x16u);
  }
  int v10 = [(HMDeviceSetupSession *)v6 context];
  int v11 = [v10 queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HMDeviceSetupSession_handleDeviceSetupSessionReceiveDataMessage___block_invoke;
  v14[3] = &unk_1E5945628;
  v14[4] = v6;
  id v15 = v4;
  id v12 = v4;
  dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v14);
  dispatch_async(v11, v13);
}

uint64_t __67__HMDeviceSetupSession_handleDeviceSetupSessionReceiveDataMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDeviceSetupSessionReceiveDataMessage:*(void *)(a1 + 40)];
}

- (void)handleDeviceSetupSessionCloseMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 shortDescription];
    int v12 = 138543618;
    dispatch_block_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Handling device setup session close message: %@", (uint8_t *)&v12, 0x16u);
  }
  int v10 = [v4 dictionaryForKey:@"ui"];
  if (v10) {
    [(HMDeviceSetupSession *)v6 setUserInfo:v10];
  }
  int v11 = [v4 errorForKey:@"er"];
  [(HMDeviceSetupSession *)v6 cleanUpSessionWithError:v11];
}

- (void)registerForMessages
{
  id v3 = [(HMDeviceSetupSession *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMDSS.rc" receiver:self selector:sel_handleDeviceSetupSessionReceiveDataMessage_];

  id v6 = [(HMDeviceSetupSession *)self context];
  id v5 = [v6 messageDispatcher];
  [v5 registerForMessage:@"HMDSS.cl" receiver:self selector:sel_handleDeviceSetupSessionCloseMessage_];
}

- (void)configure
{
  [(HMDeviceSetupSession *)self registerForMessages];

  [(HMDeviceSetupSession *)self registerForNotifications];
}

- (HMDeviceSetupSession)initWithRole:(int64_t)a3 context:(id)a4 identifier:(id)a5 delegate:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ((unint64_t)a3 >= 2) {
    _HMFPreconditionFailure();
  }
  id v15 = v14;
  if (v12 && v14)
  {
    v36.receiver = self;
    v36.super_class = (Class)HMDeviceSetupSession;
    uint64_t v16 = [(HMDeviceSetupSession *)&v36 init];
    id v17 = v16;
    if (v16)
    {
      v16->_lock._os_unfair_lock_opaque = 0;
      v16->_int64_t state = 0;
      v16->_role = a3;
      objc_storeWeak((id *)&v16->_delegate, v15);
      uint64_t v18 = [v13 copy];
      identifier = v17->_identifier;
      v17->_identifier = (NSUUID *)v18;

      objc_storeStrong((id *)&v17->_context, a4);
      id v20 = objc_alloc(MEMORY[0x1E4F653F0]);
      uint64_t v21 = NSString;
      __int16 v22 = MEMORY[0x19F3A5D00](v17, a2);
      id v23 = [v21 stringWithFormat:@"%@, %s:%ld", v22, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/DeviceSetup/HMDeviceSetupSession.m", 212];
      uint64_t v24 = [v20 initWithName:v23];
      activity = v17->_activity;
      v17->_activity = (HMFActivity *)v24;

      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionary];
      userInfo = v17->_userInfo;
      v17->_userInfo = (NSDictionary *)v26;

      uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
      pendingExchangeDataRequests = v17->_pendingExchangeDataRequests;
      v17->_pendingExchangeDataRequests = (NSMutableArray *)v28;
    }
    self = v17;
    long long v30 = self;
  }
  else
  {
    __int16 v31 = (void *)MEMORY[0x19F3A64A0]();
    id v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = HMFGetLogIdentifier();
      id v34 = [NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = v33;
      __int16 v39 = 2112;
      uint64_t v40 = v34;
      __int16 v41 = 2112;
      id v42 = v12;
      __int16 v43 = 2112;
      uint64_t v44 = v15;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@[HMDeviceSetupSession] Invalid init parameters role: %@ context: %@ delegate: %@", buf, 0x2Au);
    }
    long long v30 = 0;
  }

  return v30;
}

- (HMDeviceSetupSession)initWithRole:(int64_t)a3 identifier:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int v10 = [[_HMContext alloc] initWithName:@"com.apple.HomeKit.DeviceSetupSession"];
  int v11 = [(HMDeviceSetupSession *)self initWithRole:a3 context:v10 identifier:v9 delegate:v8];

  return v11;
}

- (HMDeviceSetupSession)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_51463 != -1) {
    dispatch_once(&logCategory__hmf_once_t31_51463, &__block_literal_global_51464);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v32_51465;

  return v2;
}

uint64_t __35__HMDeviceSetupSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v32_51465;
  logCategory__hmf_once_v32_51465 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)messageDestinationToHomeManager
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v2];

  return v3;
}

@end