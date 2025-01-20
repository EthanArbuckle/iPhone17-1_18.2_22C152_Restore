@interface HMDHTTPServerMessageTransport
+ (id)maximumSupportedProtocolVersion;
+ (id)shortDescription;
- (BOOL)server:(id)a3 shouldAcceptConnection:(id)a4;
- (HMDHTTPServerMessageTransport)init;
- (HMDHTTPServerMessageTransport)initWithServerIdentifier:(id)a3;
- (HMDHTTPServerMessageTransportDelegate)delegate;
- (HMFHTTPServer)server;
- (NSArray)clientConnections;
- (NSArray)devices;
- (NSDictionary)TXTRecord;
- (NSString)debugDescription;
- (NSString)description;
- (NSUUID)identifier;
- (id)_clientConnectionForDevice:(id)a3;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dumpState;
- (id)shortDescription;
- (void)__registerPingHandler;
- (void)__registerReceiveMessageHandler;
- (void)__registerSendMessageHandler;
- (void)__registerSendResponseHandler;
- (void)_stopWithError:(id)a3;
- (void)addClientConnection:(id)a3;
- (void)confirmDevice:(id)a3 completionHandler:(id)a4;
- (void)removeAllClientConnections;
- (void)removeClientConnection:(id)a3;
- (void)removeTXTRecordValueForKey:(id)a3;
- (void)sendMessage:(id)a3 toDevices:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)server:(id)a3 didCloseConnection:(id)a4;
- (void)server:(id)a3 didOpenConnection:(id)a4;
- (void)server:(id)a3 didStopWithError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTXTRecordValue:(id)a3 forKey:(id)a4;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDHTTPServerMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setDelegate:(id)a3
{
}

- (HMDHTTPServerMessageTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDHTTPServerMessageTransportDelegate *)WeakRetained;
}

- (HMFHTTPServer)server
{
  return self->_server;
}

- (id)dumpState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDHTTPServerMessageTransport *)self debugDescription];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F64E00]];

  v5 = [(HMDHTTPServerMessageTransport *)self clientConnections];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "debugDescription", (void)v16);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKeyedSubscript:@"clientConnectionStates"];
  v13 = [(HMDHTTPServerMessageTransport *)self server];
  v14 = [v13 dumpState];
  [v3 setObject:v14 forKeyedSubscript:@"server"];

  return v3;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(HMDHTTPServerMessageTransport *)self clientConnections];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 lostConnectionTimer];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          v14 = (void *)MEMORY[0x1D9452090]();
          v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            long long v16 = HMFGetLogIdentifier();
            long long v17 = [(HMDHTTPServerMessageTransport *)self shortDescription];
            *(_DWORD *)buf = 138543874;
            v25 = v16;
            __int16 v26 = 2112;
            v27 = v17;
            __int16 v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Removing unreachable client connection: %@", buf, 0x20u);
          }
          [(HMDHTTPServerMessageTransport *)self removeClientConnection:v11];
          long long v18 = [(HMDHTTPServerMessageTransport *)self delegate];
          long long v19 = [v11 device];
          [v18 server:self didRemoveDevice:v19];

          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)server:(id)a3 didCloseConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [(HMDHTTPServerMessageTransport *)self clientConnections];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v14 = [v13 connection];
        int v15 = [v14 isEqual:v7];

        if (v15)
        {
          long long v16 = (void *)MEMORY[0x1D9452090]();
          long long v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            long long v18 = HMFGetLogIdentifier();
            long long v19 = [(HMDHTTPServerMessageTransport *)self shortDescription];
            long long v20 = [v13 device];
            *(_DWORD *)buf = 138544130;
            __int16 v26 = v18;
            __int16 v27 = 2112;
            __int16 v28 = v19;
            __int16 v29 = 2112;
            id v30 = v7;
            __int16 v31 = 2112;
            v32 = v20;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Removing closed connection, %@, from device: %@", buf, 0x2Au);
          }
          [v13 setConnection:0];
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)server:(id)a3 didOpenConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [(HMDHTTPServerMessageTransport *)self shortDescription];
    int v12 = 138543874;
    int v13 = v10;
    __int16 v14 = 2112;
    int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received new connection: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (BOOL)server:(id)a3 shouldAcceptConnection:(id)a4
{
  return 1;
}

- (void)server:(id)a3 didStopWithError:(id)a4
{
}

- (void)__registerPingHandler
{
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES 'GET'"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"path == '/ping'"];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F65450]) initWithMethodPredicate:v3 URLPredicate:v4 matchBlock:0];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __54__HMDHTTPServerMessageTransport___registerPingHandler__block_invoke;
  uint64_t v10 = &unk_1E6A0EF98;
  objc_copyWeak(&v11, &location);
  [v5 setRequestBlock:&v7];
  id v6 = [(HMDHTTPServerMessageTransport *)self server];
  [v6 registerRequestHandler:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__HMDHTTPServerMessageTransport___registerPingHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [WeakRetained shortDescription];
    int v15 = 138543874;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /ping request from connection: %@", (uint8_t *)&v15, 0x20u);
  }
  int v12 = [v5 responseWithStatusCode:200];
  int v13 = (void *)[v12 mutableCopy];

  __int16 v14 = [@"success" dataUsingEncoding:4];
  [v13 setBody:v14];

  [v6 sendResponse:v13 completionHandler:0];
}

- (void)__registerSendMessageHandler
{
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES 'POST'"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"path == '/sendMessage'"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F65450]) initWithMethodPredicate:v3 URLPredicate:v4 matchBlock:0];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke;
  uint64_t v10 = &unk_1E6A0EF98;
  objc_copyWeak(&v11, &location);
  [v5 setRequestBlock:&v7];
  id v6 = [(HMDHTTPServerMessageTransport *)self server];
  [v6 registerRequestHandler:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = [WeakRetained shortDescription];
    *(_DWORD *)buf = 138544130;
    v46 = v11;
    __int16 v47 = 2112;
    v48 = v12;
    __int16 v49 = 2112;
    id v50 = v5;
    __int16 v51 = 2112;
    id v52 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /sendMessage request, %@, from connection: %@", buf, 0x2Au);
  }
  id v44 = 0;
  char v13 = _validateClientRequest(v5, &v44);
  id v14 = v44;
  if (v13)
  {
    int v15 = [v5 body];
    BOOL v16 = [v15 length] == 0;

    if (v16)
    {
      __int16 v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = WeakRetained;
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = HMFGetLogIdentifier();
        id v30 = [v27 shortDescription];
        *(_DWORD *)buf = 138543618;
        v46 = v29;
        __int16 v47 = 2112;
        v48 = v30;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received invalid request body payload", buf, 0x16u);
      }
      uint64_t v18 = [v5 responseWithStatusCode:400];
      [v6 sendResponse:v18 completionHandler:0];
    }
    else
    {
      __int16 v17 = [v5 headerFields];
      uint64_t v18 = objc_msgSend(v17, "hmf_UUIDForKey:", @"Client-Identifier");

      v38 = [[HMDHTTPDevice alloc] initWithIdentifier:v18];
      __int16 v19 = [v5 headerFields];
      id v20 = objc_msgSend(v19, "hmf_stringForKey:", @"Protocol-Version");

      if (v20) {
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v20];
      }
      else {
        uint64_t v21 = 0;
      }

      __int16 v31 = (void *)MEMORY[0x1E4F28F98];
      v32 = [v5 body];
      v33 = [v31 propertyListWithData:v32 options:0 format:0 error:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v34 = v33;
      }
      else {
        uint64_t v34 = 0;
      }
      id v35 = v34;

      v36 = [WeakRetained delegate];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke_167;
      v39[3] = &unk_1E6A0EFC0;
      objc_copyWeak(&v43, v7);
      id v37 = v21;
      id v40 = v37;
      id v41 = v5;
      id v42 = v6;
      [v36 server:WeakRetained didReceiveMessage:v35 fromDevice:v38 completionHandler:v39];

      objc_destroyWeak(&v43);
    }
  }
  else
  {
    long long v22 = (void *)MEMORY[0x1D9452090]();
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      v25 = [WeakRetained shortDescription];
      *(_DWORD *)buf = 138543874;
      v46 = v24;
      __int16 v47 = 2112;
      v48 = v25;
      __int16 v49 = 2112;
      id v50 = v14;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@[%@] %@", buf, 0x20u);
    }
    uint64_t v18 = [v5 responseWithStatusCode:400];
    [v6 sendResponse:v18 completionHandler:0];
  }
}

void __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (+[HMDHTTPMessageTransport protocolVersionSupportsExtendedMessages:*(void *)(a1 + 32)])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    [v7 setObject:v5 forKeyedSubscript:@"p"];
    if (v6)
    {
      uint64_t v8 = [v6 domain];
      int v9 = [v8 isEqualToString:@"com.apple.HomeKit.Messaging.HTTP"];

      if (v9) {
        uint64_t v10 = [v6 code];
      }
      else {
        uint64_t v10 = 200;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    __int16 v19 = [NSNumber numberWithInteger:v10];
    [v7 setObject:v19 forKeyedSubscript:@"s"];

    id v11 = (id)[v7 copy];
    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
    id v11 = v5;
    if (!v11)
    {
LABEL_15:
      int v12 = 0;
      uint64_t v14 = 200;
      goto LABEL_16;
    }
  }
  id v31 = 0;
  int v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:100 options:0 error:&v31];
  id v13 = v31;
  if (v12)
  {
    uint64_t v14 = 200;
  }
  else
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      [WeakRetained shortDescription];
      uint64_t v18 = v29 = v15;
      *(_DWORD *)buf = 138543874;
      v33 = v17;
      __int16 v34 = 2112;
      id v35 = v18;
      __int16 v36 = 2112;
      id v37 = v13;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to serialize response message with error: %@", buf, 0x20u);

      int v15 = v29;
    }

    uint64_t v14 = 400;
  }

LABEL_16:
  id v20 = [*(id *)(a1 + 40) responseWithStatusCode:v14];
  uint64_t v21 = (void *)[v20 mutableCopy];

  long long v22 = +[HMDHTTPMessageTransport protocolVersion];
  long long v23 = [v22 versionString];
  [v21 setHeaderValue:v23 forHeaderKey:@"Protocol-Version"];

  if (v14 == 200) {
    uint64_t v24 = [v21 setBody:v12];
  }
  v25 = (void *)MEMORY[0x1D9452090](v24);
  __int16 v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    id v27 = HMFGetLogIdentifier();
    __int16 v28 = [WeakRetained shortDescription];
    *(_DWORD *)buf = 138543874;
    v33 = v27;
    __int16 v34 = 2112;
    id v35 = v28;
    __int16 v36 = 2112;
    id v37 = v21;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Sending response: %@", buf, 0x20u);
  }
  [*(id *)(a1 + 48) sendResponse:v21 completionHandler:0];
}

- (void)__registerSendResponseHandler
{
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES 'PUT'"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"path == '/sendResponse'"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F65450]) initWithMethodPredicate:v3 URLPredicate:v4 matchBlock:0];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke;
  uint64_t v10 = &unk_1E6A0EF98;
  objc_copyWeak(&v11, &location);
  [v5 setRequestBlock:&v7];
  id v6 = [(HMDHTTPServerMessageTransport *)self server];
  [v6 registerRequestHandler:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = [WeakRetained shortDescription];
    *(_DWORD *)buf = 138544130;
    v62 = v11;
    __int16 v63 = 2112;
    v64 = v12;
    __int16 v65 = 2112;
    id v66 = v5;
    __int16 v67 = 2112;
    id v68 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /sendResponse request, %@, from connection: %@", buf, 0x2Au);
  }
  id v60 = 0;
  char v13 = _validateClientRequest(v5, &v60);
  id v14 = v60;
  if ((v13 & 1) == 0)
  {
    __int16 v28 = (void *)MEMORY[0x1D9452090]();
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      id v31 = [WeakRetained shortDescription];
      *(_DWORD *)buf = 138543874;
      v62 = v30;
      __int16 v63 = 2112;
      v64 = v31;
      __int16 v65 = 2112;
      id v66 = v14;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%@] %@", buf, 0x20u);
    }
    goto LABEL_20;
  }
  int v15 = [v5 headerFields];
  BOOL v16 = objc_msgSend(v15, "hmf_UUIDForKey:", @"Transaction-Identifier");

  if (!v16)
  {
    __int16 v28 = (void *)MEMORY[0x1D9452090]();
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      v33 = [WeakRetained shortDescription];
      *(_DWORD *)buf = 138543618;
      v62 = v32;
      __int16 v63 = 2112;
      v64 = v33;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing the message transaction identifier", buf, 0x16u);
    }
LABEL_20:

    uint64_t v18 = 0;
    uint64_t v26 = 400;
LABEL_34:

    goto LABEL_35;
  }
  __int16 v17 = [v5 headerFields];
  v55 = objc_msgSend(v17, "hmf_UUIDForKey:", @"Client-Identifier");

  if (v55)
  {
    v54 = [[HMDHTTPDevice alloc] initWithIdentifier:v55];
    uint64_t v53 = [WeakRetained _clientConnectionForDevice:v54];
    uint64_t v18 = [v53 removeCompletionHandlerForTransactionIdentifier:v16];
    __int16 v19 = [v5 body];
    id v20 = (id)[v19 length];

    if (v20)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28F98];
      long long v22 = [v5 body];
      id v59 = 0;
      id v52 = [v21 propertyListWithData:v22 options:0 format:0 error:&v59];
      id v51 = v59;

      if (v52)
      {
        id v20 = v52;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          uint64_t v24 = v20;
        }
        else {
          uint64_t v24 = 0;
        }
        id v25 = v24;

        if (isKindOfClass)
        {

          goto LABEL_13;
        }
        uint64_t v38 = (void *)MEMORY[0x1D9452090]();
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v50 = HMFGetLogIdentifier();
          v48 = [WeakRetained shortDescription];
          id v41 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v62 = v50;
          __int16 v63 = 2112;
          v64 = v48;
          __int16 v65 = 2112;
          id v66 = v41;
          id v42 = v38;
          id v43 = v41;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@ Invalid message class type: %@", buf, 0x20u);

          uint64_t v38 = v42;
        }
      }
      else
      {
        uint64_t v38 = (void *)MEMORY[0x1D9452090]();
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          __int16 v49 = HMFGetLogIdentifier();
          id v40 = [WeakRetained shortDescription];
          *(_DWORD *)buf = 138543874;
          v62 = v49;
          __int16 v63 = 2112;
          v64 = v40;
          __int16 v65 = 2112;
          id v66 = v51;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to deserialize message payload with error: %@", buf, 0x20u);
        }
      }

      id v20 = 0;
      uint64_t v26 = 400;
      id v27 = v51;
      goto LABEL_30;
    }
LABEL_13:
    if (!v18)
    {
      uint64_t v26 = 200;
LABEL_31:

      goto LABEL_32;
    }
    ((void (**)(void, id, void))v18)[2](v18, v20, 0);
    uint64_t v26 = 200;
    id v27 = v18;
    uint64_t v18 = 0;
LABEL_30:

    goto LABEL_31;
  }
  __int16 v34 = (void *)MEMORY[0x1D9452090]();
  id v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    __int16 v36 = HMFGetLogIdentifier();
    id v37 = [WeakRetained shortDescription];
    *(_DWORD *)buf = 138543618;
    v62 = v36;
    __int16 v63 = 2112;
    v64 = v37;
    _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing the message client identifier", buf, 0x16u);
  }
  uint64_t v18 = 0;
  uint64_t v26 = 400;
LABEL_32:

  if (v18)
  {
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication Failure" reason:@"The response message was invalid." suggestion:0];
    ((void (**)(void, void, id))v18)[2](v18, 0, v14);
    goto LABEL_34;
  }
LABEL_35:
  id v44 = [v5 responseWithStatusCode:v26];
  v45 = (void *)[v44 mutableCopy];

  v46 = [@"Dummy Body" dataUsingEncoding:4];
  [v45 setBody:v46];

  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke_160;
  v56[3] = &unk_1E6A17758;
  objc_copyWeak(&v58, v7);
  id v47 = v5;
  id v57 = v47;
  [v6 sendResponse:v45 completionHandler:v56];

  objc_destroyWeak(&v58);
}

void __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke_160(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = [WeakRetained shortDescription];
      uint64_t v10 = *(void *)(a1 + 32);
      int v16 = 138544130;
      __int16 v17 = v8;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      id v23 = v3;
      id v11 = "%{public}@[%@] Failed to response to /sendResponse request, %@, with error: %@";
      int v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = [WeakRetained shortDescription];
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138543874;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    id v11 = "%{public}@[%@] Successfully sent response to /sendResponse request: %@";
    int v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    uint32_t v14 = 32;
    goto LABEL_6;
  }
}

- (void)__registerReceiveMessageHandler
{
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES 'GET'"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"path == '/receiveMessage'"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F65450]) initWithMethodPredicate:v3 URLPredicate:v4 matchBlock:0];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __64__HMDHTTPServerMessageTransport___registerReceiveMessageHandler__block_invoke;
  uint64_t v10 = &unk_1E6A0EF98;
  objc_copyWeak(&v11, &location);
  [v5 setRequestBlock:&v7];
  id v6 = [(HMDHTTPServerMessageTransport *)self server];
  [v6 registerRequestHandler:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __64__HMDHTTPServerMessageTransport___registerReceiveMessageHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [WeakRetained shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v10;
    __int16 v31 = 2112;
    v32 = v11;
    __int16 v33 = 2112;
    __int16 v34 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /receiveMessage request from connection: %@", buf, 0x20u);
  }
  id v28 = 0;
  char v12 = _validateClientRequest(v5, &v28);
  os_log_type_t v13 = (HMDHTTPDevice *)v28;
  if (v12)
  {
    uint32_t v14 = [v5 headerFields];
    uint64_t v15 = objc_msgSend(v14, "hmf_UUIDForKey:", @"Client-Identifier");

    int v16 = [[HMDHTTPDevice alloc] initWithIdentifier:v15];
    __int16 v17 = [WeakRetained _clientConnectionForDevice:v16];
    if (!v17)
    {
      __int16 v17 = [[_HMDHTTPServerClientConnection alloc] initWithDevice:v16];
      if (v17)
      {
        __int16 v18 = (void *)MEMORY[0x1D9452090]();
        __int16 v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          __int16 v20 = HMFGetLogIdentifier();
          [WeakRetained shortDescription];
          uint64_t v21 = v27 = v18;
          *(_DWORD *)buf = 138543874;
          id v30 = v20;
          __int16 v31 = 2112;
          v32 = v21;
          __int16 v33 = 2112;
          __int16 v34 = v16;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received new connection from device: %@", buf, 0x20u);

          __int16 v18 = v27;
        }

        [(_HMDHTTPServerClientConnection *)v17 setConnection:v6];
        [WeakRetained addClientConnection:v17];
        __int16 v22 = [WeakRetained delegate];
        [v22 server:WeakRetained didAddDevice:v16];
      }
    }
    -[_HMDHTTPServerClientConnection setConnection:](v17, "setConnection:", v6, v27);
    [(_HMDHTTPServerClientConnection *)v17 queueRequest:v5];
  }
  else
  {
    id v23 = (void *)MEMORY[0x1D9452090]();
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      uint64_t v26 = [WeakRetained shortDescription];
      *(_DWORD *)buf = 138543874;
      id v30 = v25;
      __int16 v31 = 2112;
      v32 = v26;
      __int16 v33 = 2112;
      __int16 v34 = v13;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%@] %@", buf, 0x20u);
    }
    uint64_t v15 = [v5 responseWithStatusCode:400];
    [(HMDHTTPDevice *)v6 sendResponse:v15 completionHandler:0];
  }
}

- (id)_clientConnectionForDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMDHTTPServerMessageTransport *)self clientConnections];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 device];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)sendMessage:(id)a3 toDevices:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  char v12 = (void (**)(id, void, void *))a6;
  long long v13 = [v11 anyObject];
  long long v14 = [(HMDHTTPServerMessageTransport *)self _clientConnectionForDevice:v13];
  long long v15 = v14;
  if (v14)
  {
    double v16 = 60.0;
    if (a5 > 0.0) {
      double v16 = a5;
    }
    [v14 sendMessage:v10 timeout:v12 completionHandler:v16];
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      __int16 v20 = [(HMDHTTPServerMessageTransport *)self shortDescription];
      int v22 = 138543874;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to send message to device, %@, the device is not currently connected", (uint8_t *)&v22, 0x20u);
    }
    if (v12)
    {
      uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication Failure." reason:@"The device is not currently connected." suggestion:0];
      v12[2](v12, 0, v21);
    }
  }
}

- (void)confirmDevice:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDHTTPServerMessageTransport *)self _clientConnectionForDevice:v6];
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__HMDHTTPServerMessageTransport_confirmDevice_completionHandler___block_invoke;
    v13[3] = &unk_1E6A0EF70;
    id v14 = v7;
    [v8 sendMessage:MEMORY[0x1E4F1CC08] timeout:v13 completionHandler:10.0];
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      double v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@The device, %@, is not currently connected", buf, 0x16u);
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

uint64_t __65__HMDHTTPServerMessageTransport_confirmDevice_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)_stopWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHTTPServerMessageTransport *)self server];
  [v5 stop];

  [(HMDHTTPServerMessageTransport *)self removeAllClientConnections];
  id v6 = [(HMDHTTPServerMessageTransport *)self delegate];
  [v6 server:self didStopWithError:v4];
}

- (void)stop
{
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUIDString];
    int v16 = 138543618;
    __int16 v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Starting with session identifier: %@", (uint8_t *)&v16, 0x16u);
  }
  id v11 = [(HMDHTTPServerMessageTransport *)v7 server];
  char v12 = [v11 netService];
  long long v13 = [v5 UUIDString];
  id v14 = [v13 dataUsingEncoding:4];
  [v12 setTXTRecordValue:v14 forKey:@"si"];

  long long v15 = [(HMDHTTPServerMessageTransport *)v7 server];
  [v15 startWithCompletionHandler:v4];
}

- (void)removeTXTRecordValueForKey:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDHTTPServerMessageTransport *)self server];
  id v5 = [v6 netService];
  [v5 removeTXTRecordValueForKey:v4];
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMDHTTPServerMessageTransport *)self server];
  uint64_t v8 = [v9 netService];
  [v8 setTXTRecordValue:v7 forKey:v6];
}

- (NSDictionary)TXTRecord
{
  v2 = [(HMDHTTPServerMessageTransport *)self server];
  id v3 = [v2 netService];
  id v4 = [v3 TXTRecord];

  return (NSDictionary *)v4;
}

- (void)removeAllClientConnections
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_clientConnections copy];
  [(NSMutableArray *)self->_clientConnections removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "invalidate", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeClientConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_clientConnections removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    [v4 invalidate];
  }
}

- (void)addClientConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_clientConnections addObject:v6];
    id v5 = [v6 lostConnectionTimer];
    [v5 setDelegate:self];

    os_unfair_lock_unlock(&self->_lock);
    id v4 = v6;
  }
}

- (NSArray)clientConnections
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_clientConnections copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)devices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDHTTPServerMessageTransport *)self clientConnections];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isConnected", (void)v13))
        {
          long long v10 = [v9 device];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  long long v11 = (void *)[v3 copy];
  return (NSArray *)v11;
}

- (NSString)description
{
  return (NSString *)[(HMDHTTPServerMessageTransport *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDHTTPServerMessageTransport *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  uint64_t v5 = NSString;
  uint64_t v6 = [(id)objc_opt_class() shortDescription];
  uint64_t v7 = [(HMDHTTPServerMessageTransport *)self identifier];
  uint64_t v8 = [v7 UUIDString];
  long long v9 = (void *)v8;
  if (a3)
  {
    long long v10 = objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    long long v11 = [v5 stringWithFormat:@"<%@ %@, Identifier = %@>", v6, v9, v10];
  }
  else
  {
    long long v11 = [v5 stringWithFormat:@"<%@ %@, Identifier = %@>", v6, v8, &stru_1F2C9F1A8];
  }

  return v11;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [(HMDHTTPServerMessageTransport *)self identifier];
  uint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (HMDHTTPServerMessageTransport)initWithServerIdentifier:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v30.receiver = self;
    v30.super_class = (Class)HMDHTTPServerMessageTransport;
    uint64_t v5 = [(HMDHTTPServerMessageTransport *)&v30 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      clientConnections = v5->_clientConnections;
      v5->_clientConnections = (NSMutableArray *)v8;

      id v10 = objc_alloc(MEMORY[0x1E4F65458]);
      long long v11 = [(HMDHTTPServerMessageTransport *)v5 identifier];
      long long v12 = [v11 UUIDString];
      uint64_t v13 = [v10 initWithServiceType:@"_homekit._tcp." name:v12 port:0 options:7];
      server = v5->_server;
      v5->_server = (HMFHTTPServer *)v13;

      long long v15 = [(HMDHTTPServerMessageTransport *)v5 server];
      [v15 setDelegate:v5];

      long long v16 = [(HMDHTTPServerMessageTransport *)v5 server];
      [v16 setConnectionIdleTimeout:3600.0];

      if (isInternalBuild())
      {
        __int16 v17 = [(HMDHTTPServerMessageTransport *)v5 server];
        uint64_t v18 = [v17 netService];

        uint64_t v19 = deviceName();
        uint64_t v20 = [v19 dataUsingEncoding:4];
        [v18 setTXTRecordValue:v20 forKey:@"Name"];

        uint64_t v21 = +[HMDHomeKitVersion currentVersion];
        int v22 = [v21 versionString];
        id v23 = [v22 dataUsingEncoding:4];
        [v18 setTXTRecordValue:v23 forKey:@"sw"];
      }
      [(HMDHTTPServerMessageTransport *)v5 __registerReceiveMessageHandler];
      [(HMDHTTPServerMessageTransport *)v5 __registerSendResponseHandler];
      [(HMDHTTPServerMessageTransport *)v5 __registerSendMessageHandler];
      [(HMDHTTPServerMessageTransport *)v5 __registerPingHandler];
    }
    self = v5;
    __int16 v24 = self;
  }
  else
  {
    id v25 = (void *)MEMORY[0x1D9452090]();
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      uint64_t v28 = +[HMDHTTPServerMessageTransport description];
      *(_DWORD *)buf = 138543618;
      v32 = v27;
      __int16 v33 = 2112;
      __int16 v34 = v28;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%@] A valid identifier is required", buf, 0x16u);
    }
    __int16 v24 = 0;
  }

  return v24;
}

- (HMDHTTPServerMessageTransport)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)maximumSupportedProtocolVersion
{
  if (maximumSupportedProtocolVersion_onceToken != -1) {
    dispatch_once(&maximumSupportedProtocolVersion_onceToken, &__block_literal_global_102466);
  }
  v2 = (void *)maximumSupportedProtocolVersion_maximumSupportedProtocolVersion;
  return v2;
}

uint64_t __64__HMDHTTPServerMessageTransport_maximumSupportedProtocolVersion__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F65590]) initWithMajorVersion:2 minorVersion:0 updateVersion:0];
  uint64_t v1 = maximumSupportedProtocolVersion_maximumSupportedProtocolVersion;
  maximumSupportedProtocolVersion_maximumSupportedProtocolVersion = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end