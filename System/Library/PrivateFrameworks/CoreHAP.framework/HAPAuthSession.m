@interface HAPAuthSession
+ (id)logCategory;
- (BOOL)getToken:(id *)a3 uuid:(id *)a4;
- (HAPAuthSession)initWithRole:(int64_t)a3 instanceId:(id)a4 delegate:(id)a5;
- (HAPAuthSessionDelegate)delegate;
- (NSData)token1;
- (NSData)token2;
- (NSNumber)instanceId;
- (NSUUID)provisionUUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (int64_t)role;
- (unint64_t)currentState;
- (unsigned)currentTID;
- (void)_handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4;
- (void)_handleTokenResponse:(id)a3 withHeader:(BOOL)a4;
- (void)_handleTokenUpdateResponse:(id)a3 withHeader:(BOOL)a4;
- (void)_reportAuthFailure;
- (void)_resetSession;
- (void)_sendTokenRequest;
- (void)_sendTokenUpdateRequest:(id)a3;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4;
- (void)resetSession;
- (void)sendTokenUpdateRequest:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setCurrentTID:(unsigned __int8)a3;
- (void)setInstanceId:(id)a3;
- (void)setProvisionUUID:(id)a3;
- (void)setToken1:(id)a3;
- (void)setToken2:(id)a3;
@end

@implementation HAPAuthSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionUUID, 0);
  objc_storeStrong((id *)&self->_token2, 0);
  objc_storeStrong((id *)&self->_token1, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setProvisionUUID:(id)a3
{
}

- (NSUUID)provisionUUID
{
  return self->_provisionUUID;
}

- (void)setToken2:(id)a3
{
}

- (NSData)token2
{
  return self->_token2;
}

- (void)setToken1:(id)a3
{
}

- (NSData)token1
{
  return self->_token1;
}

- (void)setInstanceId:(id)a3
{
}

- (NSNumber)instanceId
{
  return self->_instanceId;
}

- (void)setCurrentTID:(unsigned __int8)a3
{
  self->_currentTID = a3;
}

- (unsigned)currentTID
{
  return self->_currentTID;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (int64_t)role
{
  return self->_role;
}

- (HAPAuthSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAuthSessionDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HAPAuthSession *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 identifier];

  v9 = [v3 stringWithFormat:@"%@ %@", v4, v8];

  return v9;
}

- (void)_handleTokenUpdateResponse:(id)a3 withHeader:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (+[HAPProtocolMessages parseTokenUpdateResponse:v6 expectedTID:[(HAPAuthSession *)self currentTID] withHeader:v4])
  {
    id v7 = [(HAPAuthSession *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(HAPAuthSession *)self delegate];
      v10 = [(HAPAuthSession *)self provisionUUID];
      v11 = [(HAPAuthSession *)self token1];
      [v9 authSession:self confirmUUID:v10 token:v11];
    }
    else
    {
      v16 = (void *)MEMORY[0x1D944E080]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement confirmUUID:token:", (uint8_t *)&v20, 0xCu);
      }
      [(HAPAuthSession *)v17 _resetSession];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D944E080]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v15;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing token update response", (uint8_t *)&v20, 0xCu);
    }
    [(HAPAuthSession *)v13 _reportAuthFailure];
  }
}

- (BOOL)getToken:(id *)a3 uuid:(id *)a4
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v7 = [(HAPAuthSession *)self workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__HAPAuthSession_getToken_uuid___block_invoke;
  v10[3] = &unk_1E69EFD08;
  v10[4] = self;
  v10[5] = &v21;
  v10[6] = &v15;
  v10[7] = &v11;
  dispatch_sync(v7, v10);

  if (a3) {
    *a3 = (id) v22[5];
  }
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v8;
}

void __32__HAPAuthSession_getToken_uuid___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
}

- (void)_sendTokenUpdateRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned __int8 v17 = 0;
  v5 = [(HAPAuthSession *)self instanceId];
  id v6 = +[HAPProtocolMessages constructTokenUpdateRequest:v5 token:v4 outTID:&v17];

  if (!v6)
  {
    v9 = (void *)MEMORY[0x1D944E080]();
    v10 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      v16 = "%{public}@Failed constructing token request";
LABEL_10:
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    }
LABEL_11:

    [(HAPAuthSession *)v10 _reportAuthFailure];
    goto LABEL_12;
  }
  [(HAPAuthSession *)self setToken1:v4];
  [(HAPAuthSession *)self setCurrentTID:v17];
  [(HAPAuthSession *)self setCurrentState:8];
  id v7 = [(HAPAuthSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  v9 = (void *)MEMORY[0x1D944E080]();
  v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  v12 = v11;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      v16 = "%{public}@[HAPAuthSession] Delegate does not implement sendAuthExchangeData:";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Update Request: %@", buf, 0x16u);
  }
  char v14 = [(HAPAuthSession *)v10 delegate];
  [v14 authSession:v10 sendAuthExchangeData:v6];

LABEL_12:
}

- (void)sendTokenUpdateRequest:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAuthSession *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__HAPAuthSession_sendTokenUpdateRequest___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__HAPAuthSession_sendTokenUpdateRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendTokenUpdateRequest:*(void *)(a1 + 40)];
}

- (void)_handleTokenResponse:(id)a3 withHeader:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    uint64_t v11 = @"No";
    *(_DWORD *)buf = 138543874;
    v28 = v10;
    __int16 v29 = 2112;
    if (v4) {
      uint64_t v11 = @"Yes";
    }
    id v30 = v6;
    __int16 v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Response: %@ withHeader: %@", buf, 0x20u);
  }
  id v25 = 0;
  id v26 = 0;
  BOOL v12 = +[HAPProtocolMessages parseTokenResponse:v6 expectedTID:[(HAPAuthSession *)v8 currentTID] withHeader:v4 outToken:&v26 outUUID:&v25];
  id v13 = v26;
  id v14 = v25;
  if (!v12)
  {
    __int16 v20 = (void *)MEMORY[0x1D944E080]();
    uint64_t v21 = v8;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      v24 = "%{public}@Failed to parse token response";
LABEL_12:
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    }
LABEL_13:

    [(HAPAuthSession *)v21 _reportAuthFailure];
    goto LABEL_14;
  }
  [(HAPAuthSession *)v8 setCurrentState:5];
  [(HAPAuthSession *)v8 setToken1:v13];
  [(HAPAuthSession *)v8 setProvisionUUID:v14];
  uint64_t v15 = [(HAPAuthSession *)v8 delegate];
  char v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
    __int16 v20 = (void *)MEMORY[0x1D944E080]();
    uint64_t v21 = v8;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      v24 = "%{public}@Delegate does not implement validateUUID:token:";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  unsigned __int8 v17 = [(HAPAuthSession *)v8 delegate];
  v18 = [(HAPAuthSession *)v8 provisionUUID];
  v19 = [(HAPAuthSession *)v8 token1];
  [v17 authSession:v8 validateUUID:v18 token:v19];

LABEL_14:
}

- (void)_sendTokenRequest
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v21 = 0;
  v3 = [(HAPAuthSession *)self instanceId];
  BOOL v4 = +[HAPProtocolMessages constructTokenRequest:v3 outTID:&v21];

  if (!v4)
  {
    BOOL v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v15;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed constructing token request", buf, 0xCu);
    }
    char v16 = v13;
    goto LABEL_12;
  }
  [(HAPAuthSession *)self setCurrentState:4];
  v5 = (void *)MEMORY[0x1D944E080]([(HAPAuthSession *)self setCurrentTID:v21]);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Request: %@", buf, 0x16u);
  }
  v9 = [(HAPAuthSession *)v6 delegate];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v17 = (void *)MEMORY[0x1D944E080]();
    v18 = v6;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v20;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement sendAuthExchangeData:", buf, 0xCu);
    }
    char v16 = v18;
LABEL_12:
    [(HAPAuthSession *)v16 _reportAuthFailure];
    goto LABEL_13;
  }
  uint64_t v11 = [(HAPAuthSession *)v6 delegate];
  [v11 authSession:v6 sendAuthExchangeData:v4];

LABEL_13:
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  v5 = [(HAPAuthSession *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HAPAuthSession_continueAuthAfterValidation___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __46__HAPAuthSession_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v13 = [*(id *)(a1 + 32) delegate];
      id v6 = *(void **)(a1 + 32);
      BOOL v7 = [v6 provisionUUID];
      id v8 = [*(id *)(a1 + 32) token1];
      [v13 authSession:v6 authenticateUUID:v7 token:v8];
    }
    else
    {
      v9 = (void *)MEMORY[0x1D944E080]();
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        BOOL v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v12;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authenticateUUID:token1:token2:", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _reportAuthFailure];
    }
  }
  else
  {
    [v3 _reportAuthFailure];
  }
}

- (void)_handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  switch([(HAPAuthSession *)self currentState])
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 9uLL:
      BOOL v7 = (void *)MEMORY[0x1D944E080]();
      id v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        int v11 = 138543618;
        BOOL v12 = v10;
        __int16 v13 = 2048;
        uint64_t v14 = [(HAPAuthSession *)v8 currentState];
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unhandled state: %tu", (uint8_t *)&v11, 0x16u);
      }
      break;
    case 1uLL:
      [(HAPAuthSession *)self _sendTokenRequest];
      break;
    case 4uLL:
      [(HAPAuthSession *)self _handleTokenResponse:v6 withHeader:v4];
      break;
    case 8uLL:
      [(HAPAuthSession *)self _handleTokenUpdateResponse:v6 withHeader:v4];
      break;
    default:
      break;
  }
}

- (void)handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(HAPAuthSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HAPAuthSession_handleAuthExchangeData_withHeader___block_invoke;
  block[3] = &unk_1E69F2938;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __52__HAPAuthSession_handleAuthExchangeData_withHeader___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthExchangeData:*(void *)(a1 + 40) withHeader:*(unsigned __int8 *)(a1 + 48)];
}

- (void)resetSession
{
  v3 = [(HAPAuthSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__HAPAuthSession_resetSession__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __30__HAPAuthSession_resetSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetSession];
}

- (void)_reportAuthFailure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(HAPAuthSession *)self _resetSession];
  v3 = [(HAPAuthSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v10 = [(HAPAuthSession *)self delegate];
    char v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:17 userInfo:0];
    [v10 authSession:self authComplete:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    BOOL v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v12 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authComplete:", buf, 0xCu);
    }
  }
}

- (void)_resetSession
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(HAPAuthSession *)self setToken2:0];
  [(HAPAuthSession *)self setToken1:0];
  int64_t v3 = [(HAPAuthSession *)self role];
  if (v3 == 1)
  {
    char v4 = self;
    uint64_t v5 = 2;
    goto LABEL_5;
  }
  if (!v3)
  {
    char v4 = self;
    uint64_t v5 = 1;
LABEL_5:
    [(HAPAuthSession *)v4 setCurrentState:v5];
    return;
  }
  id v6 = (void *)MEMORY[0x1D944E080]();
  BOOL v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543618;
    BOOL v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = [(HAPAuthSession *)v7 role];
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalid auth session role: %tu", (uint8_t *)&v10, 0x16u);
  }
}

- (HAPAuthSession)initWithRole:(int64_t)a3 instanceId:(id)a4 delegate:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 conformsToProtocol:&unk_1F2C84098])
    {
      v29.receiver = self;
      v29.super_class = (Class)HAPAuthSession;
      __int16 v12 = [(HAPAuthSession *)&v29 init];
      uint64_t v13 = v12;
      if (v12)
      {
        uint64_t v14 = (const char *)HAPDispatchQueueName(v12, 0);
        uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
        workQueue = v13->_workQueue;
        v13->_workQueue = (OS_dispatch_queue *)v16;

        v13->_role = a3;
        objc_storeStrong((id *)&v13->_instanceId, a4);
        objc_storeWeak((id *)&v13->_delegate, v11);
        v13->_currentState = 0;
        [(HAPAuthSession *)v13 _resetSession];
      }
      v18 = v13;
    }
    else
    {
      __int16 v24 = (void *)MEMORY[0x1D944E080]();
      id v25 = self;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v31 = v27;
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Delegate must confirm to the HAPAuthSessionDelegate protocol", buf, 0xCu);
      }
      v18 = v25;
    }
    __int16 v20 = v18;
    uint64_t v23 = v18;
  }
  else
  {
    v19 = (void *)MEMORY[0x1D944E080]();
    __int16 v20 = self;
    unsigned __int8 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v22;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required.", buf, 0xCu);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17 != -1) {
    dispatch_once(&logCategory__hmf_once_t17, &__block_literal_global_32);
  }
  int v2 = (void *)logCategory__hmf_once_v18;

  return v2;
}

uint64_t __29__HAPAuthSession_logCategory__block_invoke()
{
  logCategory__hmf_once_v18 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end