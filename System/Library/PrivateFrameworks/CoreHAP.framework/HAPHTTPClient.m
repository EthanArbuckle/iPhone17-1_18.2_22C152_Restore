@interface HAPHTTPClient
+ (id)logCategory;
- (BOOL)_debugDelegateRespondsToSelector:(SEL)a3;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_supportsWoL;
- (BOOL)enableUAPSessionSecurityWithReadKey:(unsigned __int8)a3[32] writeKey:(unsigned __int8)a4[32] error:(id *)a5;
- (BOOL)invalidateRequested;
- (BOOL)isInvalidated;
- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6;
- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7;
- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7 dependencyFactory:(id)a8;
- (HAPHTTPClient)initWithDNSName:(id)a3 queue:(id)a4;
- (HAPHTTPClient)initWithSocketInfo:(id)a3 dnsName:(id)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7;
- (HAPHTTPClient)initWithSocketInfo:(id)a3 dnsName:(id)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7 dependencyFactory:(id)a8;
- (HAPHTTPClientDebugDelegate)debugDelegate;
- (HAPHTTPClientDelegate)delegate;
- (HAPSocketInfo)peerSocketInfo;
- (HAPSocketInfo)pendingConnectionSocketInfo;
- (HMFNetAddress)peerAddress;
- (HMFNetAddress)peerAddressEx;
- (NSError)invalidateReason;
- (NSString)dnsName;
- (NSString)peerEndpointDescription;
- (NSString)wakeAddress;
- (OS_dispatch_queue)debugDelegateQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)_connectionDestination;
- (id)_deserializeUAPJSONData:(id)a3 error:(id *)a4;
- (id)_serializeUAPJSONObject:(id)a3 error:(id *)a4;
- (id)logIdentifier;
- (int)_initializeCoreUtilsHTTPClientWithPort:(int64_t)a3 withEventsEnabled:(BOOL)a4 factory:(id)a5;
- (int)getHttpClientPeerAddress:(sockaddr_storage *)a3;
- (int64_t)port;
- (void)_handleHTTPResponseForMessage:(HTTPMessagePrivate *)a3 completionHandler:(id)a4;
- (void)_sendHTTPRequestToURL:(id)a3 withMethod:(int)a4 requestObject:(id)a5 serializationType:(unint64_t)a6 timeout:(double)a7 activity:(id)a8 completionHandler:(id)a9;
- (void)dealloc;
- (void)httpClient:(id)a3 didReceiveHTTPMessageWithHeaders:(id)a4 body:(id)a5;
- (void)httpClient:(id)a3 willSendHTTPMessageWithHeaders:(id)a4 body:(id)a5;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)sendDELETERequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6;
- (void)sendGETRequestToURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)sendPOSTRequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6;
- (void)sendPUTRequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 timeout:(double)a6 completionHandler:(id)a7;
- (void)setDebugDelegate:(id)a3;
- (void)setDebugDelegate:(id)a3 queue:(id)a4;
- (void)setDebugDelegateQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setDnsName:(id)a3;
- (void)setInvalidateReason:(id)a3;
- (void)setInvalidateRequested:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setWakeAddress:(id)a3;
@end

@implementation HAPHTTPClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConnectionSocketInfo, 0);
  objc_storeStrong((id *)&self->_wakeAddress, 0);
  objc_destroyWeak((id *)&self->_debugDelegateQueue);
  objc_destroyWeak((id *)&self->_debugDelegate);
  objc_destroyWeak((id *)&self->_delegateQueue);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidateReason, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_dnsName, 0);

  objc_storeStrong((id *)&self->_httpClient, 0);
}

- (HAPSocketInfo)pendingConnectionSocketInfo
{
  return self->_pendingConnectionSocketInfo;
}

- (void)setWakeAddress:(id)a3
{
}

- (NSString)wakeAddress
{
  return self->_wakeAddress;
}

- (void)setInvalidateRequested:(BOOL)a3
{
  self->_invalidateRequested = a3;
}

- (BOOL)invalidateRequested
{
  return self->_invalidateRequested;
}

- (void)setDebugDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)debugDelegateQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugDelegateQueue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setDebugDelegate:(id)a3
{
}

- (HAPHTTPClientDebugDelegate)debugDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugDelegate);

  return (HAPHTTPClientDebugDelegate *)WeakRetained;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateQueue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HAPHTTPClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPHTTPClientDelegate *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setInvalidateReason:(id)a3
{
}

- (NSError)invalidateReason
{
  return self->_invalidateReason;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (HMFNetAddress)peerAddress
{
  return self->_peerAddress;
}

- (int64_t)port
{
  return self->_port;
}

- (void)setDnsName:(id)a3
{
}

- (NSString)dnsName
{
  return self->_dnsName;
}

- (id)logIdentifier
{
  v3 = [(HAPHTTPClient *)self dnsName];

  v4 = NSString;
  if (v3)
  {
    v5 = [(HAPHTTPClient *)self dnsName];
    int64_t v6 = [(HAPHTTPClient *)self port];
    v7 = [(HAPHTTPClient *)self delegate];
    v8 = [v7 identifier];
    v9 = [v4 stringWithFormat:@"dns:%@(%tu)%@", v5, v6, v8];
  }
  else
  {
    v5 = [(HAPHTTPClient *)self pendingConnectionSocketInfo];
    v7 = [v5 ipAddressString];
    int64_t v10 = [(HAPHTTPClient *)self port];
    v8 = [(HAPHTTPClient *)self delegate];
    v11 = [v8 identifier];
    v9 = [v4 stringWithFormat:@"ip:%@(%tu)%@", v7, v10, v11];
  }

  return v9;
}

- (void)httpClient:(id)a3 willSendHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    v11 = (void *)MEMORY[0x1D944E080]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Sending headers: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  if ([v10 length])
  {
    v15 = (void *)MEMORY[0x1D944E080]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Sending body: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)httpClient:(id)a3 didReceiveHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    v11 = (void *)MEMORY[0x1D944E080]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Received headers: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  if ([v10 length])
  {
    v15 = (void *)MEMORY[0x1D944E080]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Received body: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (BOOL)_debugDelegateRespondsToSelector:(SEL)a3
{
  v4 = [(HAPHTTPClient *)self debugDelegate];
  if (v4)
  {
    v5 = [(HAPHTTPClient *)self debugDelegateQueue];
    if (v5)
    {
      int64_t v6 = [(HAPHTTPClient *)self debugDelegate];
      char v7 = objc_opt_respondsToSelector();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  v4 = [(HAPHTTPClient *)self delegate];
  if (v4)
  {
    v5 = [(HAPHTTPClient *)self delegateQueue];
    if (v5)
    {
      int64_t v6 = [(HAPHTTPClient *)self delegate];
      char v7 = objc_opt_respondsToSelector();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (id)_deserializeUAPJSONData:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v18 = 0;
  int64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v18];
  id v7 = v18;
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse JSON response with error: %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1D944E080]();
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v15;
      id v16 = v15;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@Request did not return a dictionary and instead returned a %@", buf, 0x16u);
    }
    id v8 = HMErrorFromOSStatus(4294960540);
LABEL_11:

    int64_t v6 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v8 = 0;
  if (a4) {
LABEL_12:
  }
    *a4 = v8;
LABEL_13:

  return v6;
}

- (id)_serializeUAPJSONObject:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  if (![MEMORY[0x1E4F28D90] isValidJSONObject:v5])
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Object is not valid JSON: %@", buf, 0x16u);
    }
LABEL_8:
    HMErrorFromOSStatus(4294960540);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v6 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v14 = 0;
  int64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v14];
  id v7 = v14;
  if (a4) {
LABEL_9:
  }
    *a4 = v7;
LABEL_10:
  if (v7) {
    v11 = 0;
  }
  else {
    v11 = v6;
  }
  id v12 = v11;

  return v12;
}

- (void)_handleHTTPResponseForMessage:(HTTPMessagePrivate *)a3 completionHandler:(id)a4
{
  int64_t v6 = (void (**)(id, void, uint64_t, uint64_t, void *))a4;
  id v7 = [MEMORY[0x1E4F653F0] currentActivity];
  [v7 markWithReason:@"Received response"];
  id v8 = [(HAPHTTPClient *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10) {
    [v10 incrementHAPIPHTTPResponsesCount];
  }
  uint64_t var21 = a3->var21;
  if (var21)
  {
    id v12 = 0;
    uint64_t var12 = 1000;
  }
  else
  {
    uint64_t var12 = a3->var2.var12;
    if ((var12 - 200) >= 0x64)
    {
      id v12 = 0;
      uint64_t var21 = (var12 + 200000);
    }
    else if (a3->var7)
    {
      if (a3->var6)
      {
        id v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
        uint64_t v15 = HTTPGetHeaderField();
        if (v15) {
          uint64_t var21 = v15;
        }
        else {
          uint64_t var21 = 4294960569;
        }
      }
      else
      {
        id v12 = 0;
        uint64_t var21 = 4294960559;
      }
    }
    else
    {
      id v12 = 0;
      uint64_t var21 = 0;
    }
  }
  CFRelease(a3);
  id v14 = HMErrorFromOSStatus(var21);
  objc_msgSend(v7, "markWithReason:", @"Completed request", v16);
  if ([(HAPHTTPClient *)self _supportsWoL])
  {
    [v14 domain];

    [v14 code];
  }
  v6[2](v6, 0, 4, var12, v14);
}

- (void)_sendHTTPRequestToURL:(id)a3 withMethod:(int)a4 requestObject:(id)a5 serializationType:(unint64_t)a6 timeout:(double)a7 activity:(id)a8 completionHandler:(id)a9
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v46 = a5;
  id v17 = a8;
  id v18 = a9;
  uint64_t v59 = 0;
  uint64_t v19 = [(HAPHTTPClient *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v45 = v20;

  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke;
  block[3] = &unk_1E69F2400;
  id v21 = v17;
  id v54 = v21;
  v55 = self;
  v57 = v58;
  id v22 = v18;
  id v56 = v22;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke_2;
  v50[3] = &unk_1E69F2428;
  v52 = v58;
  id v44 = v23;
  id v51 = v44;
  v47 = (void *)MEMORY[0x1D944E2D0](v50);
  id v24 = 0;
  uint64_t inited = 4294960591;
  id v26 = 0;
  if (!v16 || !v22) {
    goto LABEL_20;
  }
  uint64_t inited = HTTPMessageCreate();
  if (inited)
  {
LABEL_19:
    id v24 = 0;
    id v26 = 0;
    goto LABEL_20;
  }
  HTTPMessageSetCompletionBlock();
  uint64_t v27 = v59;
  *(_DWORD *)(v59 + 9640) = 15;
  double v28 = 30.0;
  if (a7 > 0.0) {
    double v28 = a7;
  }
  *(_DWORD *)(v27 + 9644) = (int)v28;
  switch(a4)
  {
    case 1:
      *(_DWORD *)((char *)v49 + 3) = 0;
      unsigned __int16 v29 = 17735;
      goto LABEL_12;
    case 2:
      *(_DWORD *)((char *)v49 + 3) = 84;
      int v30 = 1414745936;
      goto LABEL_18;
    case 3:
      *(_DWORD *)((char *)v49 + 3) = 0;
      unsigned __int16 v29 = 21840;
LABEL_12:
      int v30 = v29 | 0x540000;
      goto LABEL_18;
    case 4:
      *(_DWORD *)((char *)v49 + 3) = 4543557;
      int v30 = 1162626372;
LABEL_18:
      v49[0] = v30;
      [v16 UTF8String];
      uint64_t inited = HTTPHeader_InitRequest();
      if (inited) {
        goto LABEL_19;
      }
      v37 = [(HAPHTTPClient *)self dnsName];
      uint64_t v38 = [v37 rangeOfString:@".%" options:4];

      [(HAPHTTPClient *)self dnsName];
      if (v38 == 0x7FFFFFFFFFFFFFFFLL) {
        v39 = {;
      }
      }
      else {
        v40 = {;
      }
        v39 = objc_msgSend(v40, "substringWithRange:", 0, v38);
      }
      id v24 = v39;
      uint64_t v43 = [v24 UTF8String];
      HTTPHeader_SetField();
      if (!v46 || a6 != 1)
      {
        if (v46 && a6 == 2)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
LABEL_42:
            id v42 = v46;
            objc_msgSend(v42, "bytes", v43);
            [v42 length];
            uint64_t inited = HTTPMessageSetBody();
            id v26 = 0;
            if (inited) {
              goto LABEL_20;
            }
LABEL_45:
            objc_msgSend(v21, "markWithReason:", @"Sending request", v43);
            uint64_t inited = [(HAPCoreUtilsHTTPClient *)self->_httpClient sendMessage:v59];
            if (!inited)
            {
              [v45 incrementHAPIPHTTPRequestsCount];
              v32 = 0;
              goto LABEL_26;
            }
            goto LABEL_20;
          }
        }
        else
        {
          if (!v46 || a6 != 3)
          {
            id v26 = 0;
            if (!v46) {
              goto LABEL_45;
            }
LABEL_16:
            uint64_t inited = 4294960591;
            goto LABEL_20;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_42;
          }
        }
LABEL_15:
        id v26 = 0;
        goto LABEL_16;
      }
      id v48 = 0;
      -[HAPHTTPClient _serializeUAPJSONObject:error:](self, "_serializeUAPJSONObject:error:", v46, &v48, v43);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v41 = v48;
      if (v41)
      {
        id v31 = v41;
        v32 = v31;
        goto LABEL_21;
      }
      id v26 = v26;
      [v26 bytes];
      [v26 length];
      uint64_t inited = HTTPMessageSetBody();
      if (!inited) {
        goto LABEL_45;
      }
LABEL_20:
      HMErrorFromOSStatus(inited);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = 0;
LABEL_21:
      if ([(HAPHTTPClient *)self _supportsWoL])
      {
        id v33 = v21;
        [v31 domain];

        [v31 code];
      }
      v34 = (void *)MEMORY[0x1D944E080]();
      HMFGetOSLogHandle();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v61 = v36;
        __int16 v62 = 2112;
        id v63 = v31;
        __int16 v64 = 2112;
        id v65 = v16;
        _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%{public}@[HAP HTTP Client] Encountered error %@ for sending HTTP request to %@", buf, 0x20u);
      }
      (*((void (**)(id, void, uint64_t, uint64_t, id))v22 + 2))(v22, 0, 4, 1000, v31);
      [v21 end];
      [v21 invalidate];

LABEL_26:
      _Block_object_dispose(v58, 8);

      return;
    default:
      id v24 = 0;
      goto LABEL_15;
  }
}

uint64_t __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) _handleHTTPResponseForMessage:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) completionHandler:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) end];
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

uint64_t __117__HAPHTTPClient__sendHTTPRequestToURL_withMethod_requestObject_serializationType_timeout_activity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendDELETERequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v15 = NSString;
  id v16 = MEMORY[0x1D944D460](self, a2);
  id v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 501];
  id v18 = (void *)[v14 initWithName:v17];

  [(HAPHTTPClient *)self _sendHTTPRequestToURL:v11 withMethod:4 requestObject:v12 serializationType:a5 timeout:v18 activity:v13 completionHandler:0.0];
  __HMFActivityScopeLeave();
}

- (void)sendPOSTRequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v15 = NSString;
  id v16 = MEMORY[0x1D944D460](self, a2);
  id v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 481];
  id v18 = (void *)[v14 initWithName:v17];

  [(HAPHTTPClient *)self _sendHTTPRequestToURL:v11 withMethod:2 requestObject:v12 serializationType:a5 timeout:v18 activity:v13 completionHandler:0.0];
  __HMFActivityScopeLeave();
}

- (void)sendPUTRequestToURL:(id)a3 withRequestObject:(id)a4 serializationType:(unint64_t)a5 timeout:(double)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v17 = NSString;
  id v18 = MEMORY[0x1D944D460](self, a2);
  uint64_t v19 = [v17 stringWithFormat:@"%@, %s:%ld", v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 461];
  v20 = (void *)[v16 initWithName:v19];

  [(HAPHTTPClient *)self _sendHTTPRequestToURL:v13 withMethod:3 requestObject:v14 serializationType:a5 timeout:v20 activity:v15 completionHandler:a6];
  __HMFActivityScopeLeave();
}

- (void)sendGETRequestToURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v12 = NSString;
  id v13 = MEMORY[0x1D944D460](self, a2);
  id v14 = [v12 stringWithFormat:@"%@, %s:%ld", v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAPHTTPClient.m", 440];
  id v15 = (void *)[v11 initWithName:v14];

  [(HAPHTTPClient *)self _sendHTTPRequestToURL:v9 withMethod:1 requestObject:0 serializationType:0 timeout:v15 activity:v10 completionHandler:a4];
  __HMFActivityScopeLeave();
}

- (void)invalidate
{
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  [(HAPHTTPClient *)self setInvalidateRequested:1];
  [(HAPHTTPClient *)self setInvalidateReason:v4];

  [(HAPCoreUtilsHTTPClient *)self->_httpClient invalidate];
  httpClient = self->_httpClient;
  self->_httpClient = 0;
}

- (BOOL)enableUAPSessionSecurityWithReadKey:(unsigned __int8)a3[32] writeKey:(unsigned __int8)a4[32] error:(id *)a5
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  uint64_t v7 = NetTransportChaCha20Poly1305Configure();
  if (!v7)
  {
    [(HAPCoreUtilsHTTPClient *)self->_httpClient setTransportDelegate:v9];
    if (!a5) {
      return v7 == 0;
    }
    goto LABEL_3;
  }
  if (a5)
  {
LABEL_3:
    HMErrorFromOSStatus(v7);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 == 0;
}

- (BOOL)_supportsWoL
{
  v2 = [(HAPHTTPClient *)self wakeAddress];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_connectionDestination
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HAPHTTPClient *)self dnsName];
  id v4 = [(HAPHTTPClient *)self wakeAddress];
  if (v4)
  {
    id v5 = [NSString stringWithFormat:@"wake://%@%s%@", v4, "\x1E", v3];
  }
  else
  {
    int64_t v6 = [(HAPHTTPClient *)self pendingConnectionSocketInfo];
    uint64_t v7 = [v6 ipAddressStringWithScope];

    id v8 = v3;
    if (v7)
    {
      id v9 = (void *)MEMORY[0x1D944E080]();
      uint64_t v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v15 = v12;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Creating socket connection using address with scope %@", buf, 0x16u);
      }
      id v8 = v7;
    }
    id v5 = v8;
  }

  return v5;
}

- (int)_initializeCoreUtilsHTTPClientWithPort:(int64_t)a3 withEventsEnabled:(BOOL)a4 factory:(id)a5
{
  BOOL v5 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(HAPHTTPClient *)self _connectionDestination];
  if (!v9) {
    goto LABEL_15;
  }
  if (self->_httpClient)
  {
LABEL_13:
    int v20 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = [(HAPHTTPClient *)self queue];
  id v11 = [v8 createHTTPClientWithQueue:v10];
  httpClient = self->_httpClient;
  self->_httpClient = v11;

  id v13 = self->_httpClient;
  if (!v13)
  {
LABEL_15:
    int v20 = -6718;
    goto LABEL_14;
  }
  [(HAPCoreUtilsHTTPClient *)v13 setProperty:@"ipv6DelayNanos" value:&unk_1F2C80A90];
  if (v5) {
    uint64_t v14 = 24592;
  }
  else {
    uint64_t v14 = 24576;
  }
  [(HAPCoreUtilsHTTPClient *)self->_httpClient setFlags:v14 mask:v14];
  id v15 = (void *)MEMORY[0x1D944E080]([(HAPCoreUtilsHTTPClient *)self->_httpClient setTimeoutInSeconds:30]);
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    uint64_t v19 = [NSNumber numberWithInteger:a3];
    *(_DWORD *)buf = 138543874;
    id v26 = v18;
    __int16 v27 = 2112;
    double v28 = v9;
    __int16 v29 = 2112;
    int v30 = v19;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Setting destination to %@:%@", buf, 0x20u);
  }
  int v20 = -[HAPCoreUtilsHTTPClient setDestination:port:](self->_httpClient, "setDestination:port:", [v9 UTF8String], a3);
  if (!v20)
  {
    v24[2] = 0;
    id v21 = [MEMORY[0x1E4F65570] systemInfo];
    uint64_t v22 = [v21 productVariant];

    if (v22 == 3) {
      [(HAPHTTPClient *)v16 setDebugDelegate:v16 queue:v16->_queue];
    }
    v24[3] = _HandleEvent_f;
    v24[0] = v16;
    v24[1] = _Invalidated_f;
    v24[4] = _HandleSocketEvent_f;
    [(HAPCoreUtilsHTTPClient *)self->_httpClient setDelegate:v24];
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

- (void)setDebugDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  [(HAPHTTPClient *)self setDebugDelegate:a3];
  [(HAPHTTPClient *)self setDebugDelegateQueue:v6];

  v7[2] = _HandleDidReceiveMessage_f;
  v7[0] = self;
  v7[1] = _HandleWillSendMessage_f;
  [(HAPCoreUtilsHTTPClient *)self->_httpClient setDebugDelegate:v7];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  [(HAPHTTPClient *)self setDelegate:a3];
  [(HAPHTTPClient *)self setDelegateQueue:v6];
}

- (NSString)peerEndpointDescription
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  int v6 = 0;
  int v2 = [(HAPCoreUtilsHTTPClient *)self->_httpClient getPeerAddress:v5 maxLength:28 outLength:0];
  BOOL v3 = 0;
  if (!v2)
  {
    if (SockAddrToString())
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = [NSString stringWithCString:v7 encoding:1];
    }
  }

  return (NSString *)v3;
}

- (HAPSocketInfo)peerSocketInfo
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  if ([(HAPHTTPClient *)self getHttpClientPeerAddress:v4]) {
    int v2 = 0;
  }
  else {
    int v2 = [[HAPSocketInfo alloc] initWithSocket:v4];
  }

  return v2;
}

- (HMFNetAddress)peerAddressEx
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, sizeof(v18));
  int v3 = [(HAPHTTPClient *)self getHttpClientPeerAddress:v18];
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = (void *)MEMORY[0x1D944E080]();
    int v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      httpClient = v6->_httpClient;
      int v12 = 138543874;
      id v13 = v8;
      __int16 v14 = 1024;
      int v15 = v4;
      __int16 v16 = 2048;
      id v17 = httpClient;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@[IP Accessory Server HTTP Client] Failed to get peer address %d client ref %p", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F654B8]) initWithSocketAddress:v18];
  }

  return (HMFNetAddress *)v10;
}

- (int)getHttpClientPeerAddress:(sockaddr_storage *)a3
{
  *(void *)&long long v3 = 0xDEDEDEDEDEDEDEDELL;
  *((void *)&v3 + 1) = 0xDEDEDEDEDEDEDEDELL;
  *(_OWORD *)&a3->__ss_pad2[80] = v3;
  *(_OWORD *)&a3->__ss_pad2[96] = v3;
  *(_OWORD *)&a3->__ss_pad2[48] = v3;
  *(_OWORD *)&a3->__ss_pad2[64] = v3;
  *(_OWORD *)&a3->__ss_pad2[16] = v3;
  *(_OWORD *)&a3->__ss_pad2[32] = v3;
  *(_OWORD *)&a3->ss_len = v3;
  *(_OWORD *)a3->__ss_pad2 = v3;
  return -[HAPCoreUtilsHTTPClient getPeerAddress:maxLength:outLength:](self->_httpClient, "getPeerAddress:maxLength:outLength:");
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_httpClient)
  {
    long long v3 = (void *)MEMORY[0x1D944E080]();
    int v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      dnsName = self->_dnsName;
      *(_DWORD *)buf = 138543618;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = dnsName;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@[IP Accessory Server HTTP Client %@] HTTPClient not invalidated - invalidating....", buf, 0x16u);
    }
    [(HAPHTTPClient *)self invalidate];
  }
  v7.receiver = self;
  v7.super_class = (Class)HAPHTTPClient;
  [(HAPHTTPClient *)&v7 dealloc];
}

- (HAPHTTPClient)initWithSocketInfo:(id)a3 dnsName:(id)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPHTTPClient;
  __int16 v16 = [(HAPHTTPClient *)&v21 init];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = objc_alloc_init(HAPHTTPClientDependencyFactory);
    uint64_t v19 = [(HAPHTTPClient *)v17 initWithSocketInfo:v12 dnsName:v13 eventsEnabled:v9 queue:v14 wakeAddress:v15 dependencyFactory:v18];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (HAPHTTPClient)initWithSocketInfo:(id)a3 dnsName:(id)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7 dependencyFactory:(id)a8
{
  BOOL v12 = a5;
  id v15 = (HAPSocketInfo *)a3;
  __int16 v16 = (NSString *)a4;
  id v17 = a6;
  uint64_t v18 = (NSString *)a7;
  id v19 = a8;
  dispatch_queue_t v20 = v17;
  if (!v17)
  {
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.HAPHTTPClient", v8);
  }
  objc_storeStrong((id *)&self->_queue, v20);
  if (!v17)
  {
  }
  self->_invalidated = 0;
  objc_super v21 = [(HAPSocketInfo *)v15 port];
  self->_port = (int)[v21 intValue];

  wakeAddress = self->_wakeAddress;
  self->_wakeAddress = v18;
  dispatch_block_t v23 = v18;

  invalidateReason = self->_invalidateReason;
  self->_invalidateReason = 0;

  pendingConnectionSocketInfo = self->_pendingConnectionSocketInfo;
  self->_pendingConnectionSocketInfo = v15;
  id v26 = v15;

  dnsName = self->_dnsName;
  self->_dnsName = v16;

  int v28 = [(HAPHTTPClient *)self _initializeCoreUtilsHTTPClientWithPort:self->_port withEventsEnabled:v12 factory:v19];
  __int16 v29 = 0;
  if (!v28) {
    __int16 v29 = self;
  }

  return v29;
}

- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7 dependencyFactory:(id)a8
{
  BOOL v11 = a5;
  id v13 = a3;
  id v15 = a3;
  __int16 v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HAPHTTPClient;
  id v19 = [(HAPHTTPClient *)&v26 init];
  dispatch_queue_t v20 = v19;
  if (!v19) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v19->_dnsName, v13);
  v20->_port = a4;
  dispatch_queue_t v21 = v16;
  if (!v16)
  {
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.HAPHTTPClient", v13);
  }
  objc_storeStrong((id *)&v20->_queue, v21);
  if (!v16)
  {
  }
  v20->_invalidated = 0;
  objc_storeStrong((id *)&v20->_wakeAddress, a7);
  invalidateReason = v20->_invalidateReason;
  v20->_invalidateReason = 0;

  int v23 = [(HAPHTTPClient *)v20 _initializeCoreUtilsHTTPClientWithPort:a4 withEventsEnabled:v11 factory:v18];
  id v24 = 0;
  if (!v23) {
LABEL_7:
  }
    id v24 = v20;

  return v24;
}

- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6 wakeAddress:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = objc_alloc_init(HAPHTTPClientDependencyFactory);
  __int16 v16 = [(HAPHTTPClient *)self initWithDNSName:v14 port:a4 eventsEnabled:v8 queue:v13 wakeAddress:v12 dependencyFactory:v15];

  return v16;
}

- (HAPHTTPClient)initWithDNSName:(id)a3 port:(int64_t)a4 eventsEnabled:(BOOL)a5 queue:(id)a6
{
  return [(HAPHTTPClient *)self initWithDNSName:a3 port:a4 eventsEnabled:a5 queue:a6 wakeAddress:0];
}

- (HAPHTTPClient)initWithDNSName:(id)a3 queue:(id)a4
{
  return [(HAPHTTPClient *)self initWithDNSName:a3 port:0 eventsEnabled:1 queue:a4];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1) {
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_13151);
  }
  int v2 = (void *)logCategory__hmf_once_v23;

  return v2;
}

uint64_t __28__HAPHTTPClient_logCategory__block_invoke()
{
  logCategory__hmf_once_int v23 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end