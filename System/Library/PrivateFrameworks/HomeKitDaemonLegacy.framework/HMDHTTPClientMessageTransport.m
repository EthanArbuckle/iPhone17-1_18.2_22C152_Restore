@interface HMDHTTPClientMessageTransport
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isReachable;
- (BOOL)isRunning;
- (HMDHTTPClientMessageTransport)init;
- (HMDHTTPClientMessageTransport)initWithIdentifier:(id)a3 netService:(id)a4;
- (HMDHTTPClientMessageTransportDelegate)delegate;
- (HMDHTTPDevice)remoteDevice;
- (HMFHTTPClient)client;
- (HMFNetService)netService;
- (NSString)debugDescription;
- (NSString)description;
- (NSUUID)identifier;
- (NSUUID)sessionIdentifier;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dumpState;
- (id)logIdentifier;
- (id)shortDescription;
- (void)_receiveMessage;
- (void)_sendResponseMessage:(id)a3 forTransactionIdentifier:(id)a4;
- (void)_stopWithError:(id)a3;
- (void)client:(id)a3 didRequestPingWithCompletionHandler:(id)a4;
- (void)clientDidBecomeUnreachable:(id)a3;
- (void)dealloc;
- (void)netService:(id)a3 didUpdateTXTRecord:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)sendPingWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation HMDHTTPClientMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

- (HMFHTTPClient)client
{
  return self->_client;
}

- (HMDHTTPDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (HMFNetService)netService
{
  return self->_netService;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setDelegate:(id)a3
{
}

- (HMDHTTPClientMessageTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDHTTPClientMessageTransportDelegate *)WeakRetained;
}

- (id)dumpState
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDHTTPClientMessageTransport *)self debugDescription];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F64E00]];

  v5 = [(HMDHTTPClientMessageTransport *)self client];
  v6 = [v5 debugDescription];
  [v3 setObject:v6 forKeyedSubscript:@"client"];

  v7 = [(HMDHTTPClientMessageTransport *)self netService];
  v8 = [v7 debugDescription];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F64E38]];

  return v3;
}

- (void)netService:(id)a3 didUpdateTXTRecord:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "hmd_sessionIdentifier");
  if (v8)
  {
    os_unfair_lock_lock_with_options();
    if (HMFEqualObjects())
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      BOOL v9 = self->_sessionIdentifier == 0;
      objc_storeStrong((id *)&self->_sessionIdentifier, v8);
      os_unfair_lock_unlock(&self->_lock);
      if (!v9)
      {
        v10 = (void *)MEMORY[0x1D9452090]();
        v11 = self;
        v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = HMFGetLogIdentifier();
          int v14 = 138543362;
          v15 = v13;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification session changed, resetting", (uint8_t *)&v14, 0xCu);
        }
        __HMDHTTPClientMessageTransportReset(v11);
      }
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMDHTTPClientMessageTransport *)self remoteDevice];
  v3 = [v2 identifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)clientDidBecomeUnreachable:(id)a3
{
  id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication failure." reason:@"The server is no longer reachable" suggestion:0];
  [(HMDHTTPClientMessageTransport *)self _stopWithError:v4];
}

- (void)client:(id)a3 didRequestPingWithCompletionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HMDHTTPClientMessageTransport_client_didRequestPingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19358;
  id v8 = v5;
  id v6 = v5;
  [(HMDHTTPClientMessageTransport *)self sendPingWithCompletionHandler:v7];
}

uint64_t __76__HMDHTTPClientMessageTransport_client_didRequestPingWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (HMFNetService *)a4;
  id v11 = a5;
  if (self->_netService == v10)
  {
    v12 = NSStringFromSelector(sel_port);
    int v13 = [v9 isEqualToString:v12];

    if (v13)
    {
      int v14 = objc_msgSend(v11, "hmf_numberForKey:", *MEMORY[0x1E4F284E0]);
      v15 = objc_msgSend(v11, "hmf_numberForKey:", *MEMORY[0x1E4F284C8]);
      if ((HMFEqualObjects() & 1) == 0 && [v14 integerValue] != -1)
      {
        uint64_t v16 = (void *)MEMORY[0x1D9452090]();
        v17 = self;
        v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = HMFGetLogIdentifier();
          int v20 = 138543874;
          v21 = v19;
          __int16 v22 = 2112;
          v23 = v14;
          __int16 v24 = 2112;
          v25 = v15;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Port change from '%@' to '%@'", (uint8_t *)&v20, 0x20u);
        }
        __HMDHTTPClientMessageTransportReset(v17);
      }
    }
  }
}

- (void)sendPingWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F654A8]);
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = [(HMDHTTPClientMessageTransport *)self client];
  id v8 = [v7 baseURL];
  id v9 = [v6 URLWithString:@"/ping" relativeToURL:v8];
  v10 = (void *)[v5 initWithURL:v9 method:@"GET" body:0 timeoutInterval:5.0];

  id v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Sending ping request: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v12);
  v15 = [(HMDHTTPClientMessageTransport *)v12 client];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__HMDHTTPClientMessageTransport_sendPingWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E6A19330;
  objc_copyWeak(&v19, (id *)buf);
  id v16 = v4;
  id v18 = v16;
  [v15 sendRequest:v10 completionHandler:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __63__HMDHTTPClientMessageTransport_sendPingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received response to ping with error: %@", (uint8_t *)&v17, 0x16u);
  }
  if (v6)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = v9;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to ping server", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
  }
}

- (void)sendMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v33 = 0;
  v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:100 options:0 error:&v33];
  id v11 = v33;
  if (v10)
  {
    if (a4 <= 0.0) {
      a4 = 60.0;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F654A8]);
    id v13 = (void *)MEMORY[0x1E4F1CB10];
    int v14 = [(HMDHTTPClientMessageTransport *)self client];
    v15 = [v14 baseURL];
    uint64_t v16 = [v13 URLWithString:@"/sendMessage" relativeToURL:v15];
    int v17 = (void *)[v12 initWithURL:v16 method:@"POST" body:v10 timeoutInterval:a4];

    id v18 = [(HMDHTTPClientMessageTransport *)self identifier];
    __int16 v19 = [v18 UUIDString];
    [v17 setHeaderValue:v19 forHeaderKey:@"Client-Identifier"];

    id v20 = +[HMDHTTPMessageTransport protocolVersion];
    uint64_t v21 = [v20 versionString];
    [v17 setHeaderValue:v21 forHeaderKey:@"Protocol-Version"];

    __int16 v22 = (void *)MEMORY[0x1D9452090]();
    v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      __int16 v36 = 2112;
      id v37 = v17;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Sending message request: %@", buf, 0x16u);
    }
    uint64_t v26 = [(HMDHTTPClientMessageTransport *)v23 client];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71__HMDHTTPClientMessageTransport_sendMessage_timeout_completionHandler___block_invoke;
    v31[3] = &unk_1E6A19308;
    v31[4] = v23;
    id v32 = v9;
    [v26 sendRequest:v17 completionHandler:v31];
  }
  else
  {
    v27 = (void *)MEMORY[0x1D9452090]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v30;
      __int16 v36 = 2112;
      id v37 = v11;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize response message with error: %@", buf, 0x16u);
    }
    if (v9) {
      (*((void (**)(id, void, id))v9 + 2))(v9, 0, v11);
    }
  }
}

void __71__HMDHTTPClientMessageTransport_sendMessage_timeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v50 = v10;
    __int16 v51 = 2112;
    id v52 = v5;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received response to /sendMessage: %@", buf, 0x16u);
  }
  if (!v6)
  {
    uint64_t v16 = [v5 body];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x1E4F28F98];
      __int16 v19 = [v5 body];
      id v48 = 0;
      id v20 = [v18 propertyListWithData:v19 options:0 format:0 error:&v48];
      id v21 = v48;

      if (v20)
      {
        id v22 = v20;
        objc_opt_class();
        int v23 = objc_opt_isKindOfClass() & 1;
        if (v23) {
          uint64_t v24 = v22;
        }
        else {
          uint64_t v24 = 0;
        }
        id v25 = v24;

        if (v23)
        {
          uint64_t v26 = [v5 headerFields];
          v27 = objc_msgSend(v26, "hmf_stringForKey:", @"Protocol-Version");

          if (v27) {
            v28 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v27];
          }
          else {
            v28 = 0;
          }

          if (+[HMDHTTPMessageTransport protocolVersionSupportsExtendedMessages:v28])
          {
            objc_msgSend(v22, "hmf_dictionaryForKey:", @"p");
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v22, "hmf_numberForKey:", @"s");
            v30 = objc_msgSend(MEMORY[0x1E4F28C58], "hmd_HTTPMessageTransportErrorWithCode:", objc_msgSend(v45, "unsignedIntegerValue"));
          }
          else
          {
            id v29 = v22;
            v30 = 0;
          }

LABEL_32:
          uint64_t v46 = *(void *)(a1 + 40);
          if (v46) {
            (*(void (**)(uint64_t, id, void *))(v46 + 16))(v46, v29, v30);
          }
          goto LABEL_34;
        }
        __int16 v36 = (void *)MEMORY[0x1D9452090]();
        id v37 = *(id *)(a1 + 32);
        uint64_t v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v47 = HMFGetLogIdentifier();
          v39 = [*(id *)(a1 + 32) shortDescription];
          v40 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v50 = v47;
          __int16 v51 = 2112;
          id v52 = v39;
          __int16 v53 = 2112;
          v54 = v40;
          id v41 = v21;
          v42 = v36;
          id v43 = v40;
          _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@[%@ Invalid message class type: %@", buf, 0x20u);

          __int16 v36 = v42;
          id v21 = v41;
        }
        if (*(void *)(a1 + 40))
        {
          v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:22 description:@"Invalid class." reason:@"Invalid message class." suggestion:0];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        v31 = (void *)MEMORY[0x1D9452090]();
        id v32 = *(id *)(a1 + 32);
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v50 = v34;
          __int16 v51 = 2112;
          id v52 = v21;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize message payload with error: %@", buf, 0x16u);
        }
        uint64_t v35 = *(void *)(a1 + 40);
        if (v35) {
          (*(void (**)(uint64_t, void, id))(v35 + 16))(v35, 0, v21);
        }
      }

      id v29 = 0;
      v30 = 0;
LABEL_34:

      goto LABEL_35;
    }
    id v29 = 0;
    v30 = 0;
    goto LABEL_32;
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v50 = v14;
    __int16 v51 = 2112;
    id v52 = v6;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message with error: %@", buf, 0x16u);
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v6);
  }
LABEL_35:
}

- (void)_sendResponseMessage:(id)a3 forTransactionIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v27 = 0;
    id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:&v27];
    id v9 = v27;
    if (!v8)
    {
      v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v29 = v13;
        __int16 v30 = 2112;
        id v31 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize response message with error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F654A8]);
  uint64_t v15 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v16 = [(HMDHTTPClientMessageTransport *)self client];
  uint64_t v17 = [v16 baseURL];
  id v18 = [v15 URLWithString:@"/sendResponse" relativeToURL:v17];
  __int16 v19 = (void *)[v14 initWithURL:v18 method:@"PUT" body:v8 timeoutInterval:60.0];

  id v20 = [(HMDHTTPClientMessageTransport *)self identifier];
  id v21 = [v20 UUIDString];
  [v19 setHeaderValue:v21 forHeaderKey:@"Client-Identifier"];

  id v22 = [v7 UUIDString];
  [v19 setHeaderValue:v22 forHeaderKey:@"Transaction-Identifier"];

  int v23 = [(HMDHTTPClientMessageTransport *)self client];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__HMDHTTPClientMessageTransport__sendResponseMessage_forTransactionIdentifier___block_invoke;
  v25[3] = &unk_1E6A192E0;
  v25[4] = self;
  id v26 = v7;
  id v24 = v7;
  [v23 sendRequest:v19 completionHandler:v25];
}

void __79__HMDHTTPClientMessageTransport__sendResponseMessage_forTransactionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138543874;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      id v13 = "%{public}@Failed to send response for transaction, %@, with error: %@";
      id v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = 138543618;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    id v13 = "%{public}@Successfully sent response for transaction: %@";
    id v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    uint32_t v16 = 22;
    goto LABEL_6;
  }
}

- (void)_receiveMessage
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(HMDHTTPClientMessageTransport *)self isRunning])
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Send long-polled /receiveMessage", buf, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F654A8]);
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    id v9 = [(HMDHTTPClientMessageTransport *)v4 client];
    v10 = [v9 baseURL];
    id v11 = [v8 URLWithString:@"/receiveMessage" relativeToURL:v10];
    uint64_t v12 = (void *)[v7 initWithURL:v11 method:@"GET" body:0 timeoutInterval:3600.0];

    id v13 = [(HMDHTTPClientMessageTransport *)v4 identifier];
    id v14 = [v13 UUIDString];
    [v12 setHeaderValue:v14 forHeaderKey:@"Client-Identifier"];

    os_log_type_t v15 = [MEMORY[0x1E4F1C9C8] date];
    uint32_t v16 = [(HMDHTTPClientMessageTransport *)v4 client];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke;
    v18[3] = &unk_1E6A192E0;
    v18[4] = v4;
    id v19 = v15;
    id v17 = v15;
    [v16 sendRequest:v12 completionHandler:v18];
  }
}

void __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v10;
    __int16 v47 = 2112;
    id v48 = v5;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received a response to /receiveMessage: %@", buf, 0x16u);
  }
  if (!v6)
  {
    os_log_type_t v15 = [v5 headerFields];
    uint32_t v16 = objc_msgSend(v15, "hmf_UUIDForKey:", @"Transaction-Identifier");

    if (v16)
    {
      id v17 = (void *)MEMORY[0x1E4F28F98];
      int v18 = [v5 body];
      id v44 = 0;
      id v19 = [v17 propertyListWithData:v18 options:0 format:0 error:&v44];
      id v20 = v44;

      if (v19)
      {
        id v21 = v19;
        objc_opt_class();
        int v22 = objc_opt_isKindOfClass() & 1;
        if (v22) {
          id v23 = v21;
        }
        else {
          id v23 = 0;
        }
        id v24 = v23;

        if (v22)
        {
          id v25 = [*(id *)(a1 + 32) delegate];
          uint64_t v26 = *(void *)(a1 + 32);
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke_42;
          v42[3] = &unk_1E6A192B8;
          v42[4] = v26;
          id v43 = v16;
          [v25 client:v26 didReceiveMessage:v21 completionHandler:v42];
        }
        else
        {
          context = (void *)MEMORY[0x1D9452090]();
          id v35 = *(id *)(a1 + 32);
          __int16 v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v37 = v40 = v24;
            uint64_t v38 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            uint64_t v46 = v37;
            __int16 v47 = 2112;
            id v48 = v38;
            id v39 = v38;
            _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid message class type: %@", buf, 0x16u);

            id v24 = v40;
          }
        }
      }
      else
      {
        id v31 = (void *)MEMORY[0x1D9452090]();
        id v32 = *(id *)(a1 + 32);
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v34;
          __int16 v47 = 2112;
          id v48 = v20;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize message payload with error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = *(id *)(a1 + 32);
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v46 = v30;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Missing the message transaction identifier", buf, 0xCu);
      }
    }

    id v14 = *(void **)(a1 + 32);
    goto LABEL_25;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceDate:*(void *)(a1 + 40)];
  double v13 = v12;

  id v14 = *(void **)(a1 + 32);
  if (v13 > 60.0)
  {
LABEL_25:
    [v14 _receiveMessage];
    goto LABEL_26;
  }
  [v14 _stopWithError:v6];
LABEL_26:
}

uint64_t __48__HMDHTTPClientMessageTransport__receiveMessage__block_invoke_42(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sendResponseMessage:a2 forTransactionIdentifier:*(void *)(a1 + 40)];
}

- (void)_stopWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHTTPClientMessageTransport *)self client];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543618;
      double v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping the client with error: %@", (uint8_t *)&v12, 0x16u);
    }
    [(HMDHTTPClientMessageTransport *)v7 setRunning:0];
    v10 = [(HMDHTTPClientMessageTransport *)v7 client];
    [v10 cancelPendingRequests];

    id v11 = [(HMDHTTPClientMessageTransport *)v7 delegate];
    [v11 client:v7 didStopWithError:v4];
  }
}

- (void)stop
{
}

- (void)startWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  if ([(HMDHTTPClientMessageTransport *)self isReachable])
  {
    if (![(HMDHTTPClientMessageTransport *)self isRunning])
    {
      [(HMDHTTPClientMessageTransport *)self setRunning:1];
      [(HMDHTTPClientMessageTransport *)self _receiveMessage];
      id v4 = [(HMDHTTPClientMessageTransport *)self netService];
      [v4 resolveWithTimeout:0 completionHandler:0.0];
    }
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication Failure." reason:@"The server is unreachable." suggestion:0];
  }
  if (v6) {
    v6[2](v6, v5);
  }
}

- (BOOL)isReachable
{
  v2 = [(HMDHTTPClientMessageTransport *)self client];
  char v3 = [v2 isReachable];

  return v3;
}

- (void)setRunning:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_running = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isRunning
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_running;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSUUID)sessionIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_sessionIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)description
{
  return (NSString *)[(HMDHTTPClientMessageTransport *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDHTTPClientMessageTransport *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSString;
  id v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = &stru_1F2C9F1A8;
  }
  id v8 = [(HMDHTTPClientMessageTransport *)self netService];
  id v9 = [v8 name];
  v10 = [(HMDHTTPClientMessageTransport *)self sessionIdentifier];
  id v11 = [v10 UUIDString];
  [(HMDHTTPClientMessageTransport *)self isReachable];
  int v12 = HMFBooleanToString();
  [(HMDHTTPClientMessageTransport *)self isRunning];
  double v13 = HMFBooleanToString();
  __int16 v14 = [v5 stringWithFormat:@"<%@%@, Identifier = %@, Session Identifier = %@, Reachable = %@, Running = %@>", v6, v7, v9, v11, v12, v13];

  if (v3) {
  return v14;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDHTTPClientMessageTransport *)self netService];
  id v6 = [v5 name];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (void)dealloc
{
  netService = self->_netService;
  id v4 = NSStringFromSelector(sel_port);
  [(HMFNetService *)netService removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)HMDHTTPClientMessageTransport;
  [(HMDHTTPClientMessageTransport *)&v5 dealloc];
}

- (HMDHTTPClientMessageTransport)initWithIdentifier:(id)a3 netService:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v26 = (void *)MEMORY[0x1D9452090]();
    id v24 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v28;
      id v29 = "%{public}@The identifier is required";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
    }
LABEL_11:

    id v25 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    uint64_t v26 = (void *)MEMORY[0x1D9452090]();
    id v24 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v28;
      id v29 = "%{public}@The netService is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDHTTPClientMessageTransport;
  id v9 = [(HMDHTTPClientMessageTransport *)&v31 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_netService, a4);
    [v8 setDelegate:v9];
    int v12 = NSStringFromSelector(sel_port);
    [v8 addObserver:v9 forKeyPath:v12 options:3 context:0];

    double v13 = [HMDHTTPDevice alloc];
    id v14 = objc_alloc(MEMORY[0x1E4F29128]);
    id v15 = [v8 name];
    uint64_t v16 = (void *)[v14 initWithUUIDString:v15];
    uint64_t v17 = [(HMDHTTPDevice *)v13 initWithIdentifier:v16];
    remoteDevice = v9->_remoteDevice;
    v9->_remoteDevice = (HMDHTTPDevice *)v17;

    uint64_t v19 = objc_msgSend(v8, "hmd_sessionIdentifier");
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSUUID *)v19;

    id v21 = [MEMORY[0x1E4F65448] defaultConfiguration];
    [v21 setRequiresEncryption:1];
    [v21 setAllowsAnonymousConnection:1];
    [v21 setAllowsCellularAccess:0];
    [v21 setSupportsWakeOnLAN:1];
    [v21 setMonitorsReachability:1];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F65440]) initWithService:v8 configuration:v21];
    client = v9->_client;
    v9->_client = (HMFHTTPClient *)v22;

    [(HMFHTTPClient *)v9->_client setDelegate:v9];
  }
  id v24 = v9;
  id v25 = v24;
LABEL_12:

  return v25;
}

- (HMDHTTPClientMessageTransport)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_187000 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_187000, &__block_literal_global_187001);
  }
  v2 = (void *)logCategory__hmf_once_v28_187002;
  return v2;
}

uint64_t __44__HMDHTTPClientMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v28_187002;
  logCategory__hmf_once_v28_187002 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end