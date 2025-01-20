@interface HMDSecureRemoteStreamInternal
+ (id)logCategory;
- (HMDSecureRemoteStreamInternal)init;
- (HMDSecureRemoteStreamInternal)initWithType:(int64_t)a3 commitTimeout:(unint64_t)a4 clientIdleTimeout:(unint64_t)a5 serverIdleTimeout:(unint64_t)a6 sendInternalTimeout:(unint64_t)a7 sendUserTimeout:(unint64_t)a8;
- (OS_dispatch_queue)dispatchQueue;
- (double)requestTimeout;
- (id)_encodeBinaryPlist:(void *)a1;
- (id)findPeerHandler;
- (id)getLocalIdentityHandler;
- (id)internalRequestHandler;
- (id)logIdentifier;
- (id)requestHandler;
- (id)startedHandler;
- (id)stoppedHandler;
- (id)transportSendMessage;
- (int)_clientHandleCommitResponse:(id)a3 options:(id)a4;
- (int)_clientHandlePrepareResponse:(id)a3 options:(id)a4;
- (int)_clientPairVerifyExchange:(id)a3;
- (int)_clientSendCommitRequest:(id)a3;
- (int)_clientSendPrepareRequest:(id)a3;
- (int)_serverHandleCommitRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (int)_serverHandleDecryptedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (int)_serverHandlePrepareRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (int)_setupEncryption;
- (int)_updateIdleTimer;
- (void)_clientRunStateMachine;
- (void)_completeTransaction:(id)a3 response:(id)a4 options:(id)a5 status:(int)a6;
- (void)_completeUserTransaction:(id)a3 response:(id)a4 options:(id)a5 status:(int)a6;
- (void)_runStateMachine;
- (void)_sendRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_sendUserRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_serverCompletePrepareRequest:(id)a3;
- (void)_serverHandleEncryptedRequest:(id)a3 options:(id)a4;
- (void)_serverPairVerifyExchange:(id)a3 options:(id)a4;
- (void)_serverRunStateMachine;
- (void)_start;
- (void)_stop:(int)a3;
- (void)_transportReceivedMessage:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)sendRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setFindPeerHandler:(id)a3;
- (void)setGetLocalIdentityHandler:(id)a3;
- (void)setInternalRequestHandler:(id)a3;
- (void)setRequestHandler:(id)a3;
- (void)setStartedHandler:(id)a3;
- (void)setStoppedHandler:(id)a3;
- (void)setTransportSendMessage:(id)a3;
- (void)start;
- (void)stop;
- (void)transportReceivedMessage:(id)a3 options:(id)a4;
@end

@implementation HMDSecureRemoteStreamInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueue, 0);
  objc_storeStrong(&self->_transportSendMessage, 0);
  objc_storeStrong(&self->_stoppedHandler, 0);
  objc_storeStrong(&self->_startedHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong(&self->_findPeerHandler, 0);
  objc_storeStrong(&self->_getLocalIdentityHandler, 0);
  objc_storeStrong((id *)&self->_userTransactions, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_prepareRequests, 0);
  objc_storeStrong(&self->_internalRequestHandler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
}

- (void)setTransportSendMessage:(id)a3
{
}

- (id)transportSendMessage
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setStoppedHandler:(id)a3
{
}

- (id)stoppedHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setStartedHandler:(id)a3
{
}

- (id)startedHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setRequestHandler:(id)a3
{
}

- (id)requestHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setFindPeerHandler:(id)a3
{
}

- (id)findPeerHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setGetLocalIdentityHandler:(id)a3
{
}

- (id)getLocalIdentityHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setInternalRequestHandler:(id)a3
{
}

- (id)internalRequestHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 240, 1);
}

- (id)logIdentifier
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  int64_t type = self->_type;
  if (type == 2)
  {
    [NSString stringWithFormat:@"S(%@)", self->_sessionID];
    goto LABEL_5;
  }
  if (type == 1)
  {
    [NSString stringWithFormat:@"C(%@)", self->_sessionID];
LABEL_5:
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v4 = self->_sessionID;
LABEL_7:
  return v4;
}

- (void)_serverCompletePrepareRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_prepareRequests objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"timer"];
    v8 = v7;
    if (v7) {
      dispatch_source_cancel(v7);
    }
    [(NSMutableDictionary *)self->_prepareRequests removeObjectForKey:v4];
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v12;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing prepare request, tid %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (int)_serverHandleCommitRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v50 = a4;
  id v47 = a5;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  char v66 = 0;
  v49 = v8;
  double v52 = [v8 objectForKeyedSubscript:@"utid"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = 0;
    v51 = 0;
    dispatch_source_t source = 0;
    v10 = 0;
    goto LABEL_19;
  }
  v9 = [(NSMutableDictionary *)self->_prepareRequests objectForKeyedSubscript:*(void *)&v52];
  v10 = v9;
  if (!v9)
  {
    id v13 = 0;
    v51 = 0;
    dispatch_source_t source = 0;
    int v34 = -6727;
    goto LABEL_24;
  }
  v11 = [v9 objectForKeyedSubscript:@"processing"];
  char v12 = [v11 BOOLValue];

  if (v12)
  {
    id v13 = 0;
    v51 = 0;
    dispatch_source_t source = 0;
    int v34 = -6730;
    goto LABEL_24;
  }
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"processing"];
  id v13 = [v10 objectForKeyedSubscript:@"request"];
  if (!v13)
  {
    v51 = 0;
    dispatch_source_t source = 0;
    int v34 = -6762;
    goto LABEL_24;
  }
  v14 = (void *)MEMORY[0x230FBD990]();
  __int16 v15 = self;
  HMFGetOSLogHandle();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v70 = v17;
    __int16 v71 = 2112;
    double v72 = v52;
    __int16 v73 = 2112;
    double v74 = *(double *)&v49;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Received commit request, utid %@ %@", buf, 0x20u);
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)&v52];
  logRemoteMessageEvent(v13, v50, v18);

  v19 = [v10 objectForKeyedSubscript:@"timer"];
  dispatch_source_t source = v19;
  if (v19) {
    dispatch_source_cancel(v19);
  }
  v51 = [v49 objectForKeyedSubscript:@"timeout"];
  if (!v51)
  {
    uint64_t sendInternalTimeoutNanos = v15->_sendInternalTimeoutNanos;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    int v34 = -6756;
    goto LABEL_24;
  }
  uint64_t sendInternalTimeoutNanos = 1000000000 * [v51 longLongValue];
LABEL_13:
  v21 = (void *)MEMORY[0x230FBD990]();
  v22 = v15;
  HMFGetOSLogHandle();
  int64_t v23 = sendInternalTimeoutNanos - 5000000000;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v70 = v25;
    __int16 v71 = 2048;
    double v72 = (float)((float)v23 / 1000000000.0);
    __int16 v73 = 2112;
    double v74 = v52;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Starting commit response timeout of %.03f seconds for transaction: %@", buf, 0x20u);
  }
  dispatch_source_t v26 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v22->_internalQueue);
  if (v26)
  {
    v27 = v26;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke;
    handler[3] = &unk_264A2DE10;
    v64 = v65;
    handler[4] = v22;
    id v28 = *(id *)&v52;
    id v60 = v28;
    id v29 = v13;
    id v61 = v29;
    id v30 = v50;
    id v62 = v30;
    id v31 = v47;
    id v63 = v31;
    dispatch_source_set_event_handler(v27, handler);

    dispatch_source_set_cancel_handler(v27, &__block_literal_global_131_258546);
    dispatch_time_t v32 = dispatch_walltime(0, v23);
    dispatch_source_set_timer(v27, v32, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(v27);
    [v10 setObject:v27 forKeyedSubscript:@"timer"];
    userQueue = v22->_userQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_2;
    block[3] = &unk_264A2DE10;
    block[4] = v22;
    id v13 = v29;
    id v54 = v13;
    id v55 = v30;
    v58 = v65;
    id v56 = v28;
    id v57 = v31;
    dispatch_async(userQueue, block);

    int v34 = 0;
    goto LABEL_17;
  }
  int v34 = -6700;
LABEL_24:
  context = (void *)MEMORY[0x230FBD990]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F08320];
    uint64_t v39 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v40 = (void *)v39;
    v41 = @"?";
    if (v39) {
      v41 = (__CFString *)v39;
    }
    v68 = v41;
    v42 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1, v44, context);
    double v43 = [v38 errorWithDomain:*MEMORY[0x263F08410] code:v34 userInfo:v42];
    *(_DWORD *)buf = 138543874;
    v70 = v45;
    __int16 v71 = 2112;
    double v72 = v43;
    __int16 v73 = 2112;
    double v74 = *(double *)&v49;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Commit failed: %@ %@", buf, 0x20u);
  }
LABEL_17:

  _Block_object_dispose(v65, 8);
  return v34;
}

void __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      __int16 v28 = 2112;
      uint64_t v29 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Transaction, %@, timed out, sending cancelled error", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _serverCompletePrepareRequest:*(void *)(a1 + 40)];
    v24[0] = @"response";
    v22 = @"kIDSMessageResponseErrorDataKey";
    v7 = (void *)MEMORY[0x263F08910];
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08410];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorString(), *MEMORY[0x263F08320]);
    v11 = (void *)v10;
    char v12 = @"?";
    if (v10) {
      char v12 = (__CFString *)v10;
    }
    v21 = v12;
    id v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v14 = [v8 errorWithDomain:v9 code:-6723 userInfo:v13];
    __int16 v15 = [v7 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
    int64_t v23 = v15;
    id v16 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v24[1] = @"utid";
    v25[0] = v16;
    v25[1] = *(void *)(a1 + 40);
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

    v18 = objc_msgSend(*(id *)(a1 + 48), "hmf_stringForKey:", @"kIDSMessageNameKey");
    v19 = augmentResponseOptions(*(void **)(a1 + 56), v18);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
}

void __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v2 + 200);
  uint64_t v5 = *(void *)(v2 + 104);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_3;
  v8[3] = &unk_264A2DDE8;
  uint64_t v6 = *(void *)(a1 + 72);
  v8[4] = v2;
  uint64_t v12 = v6;
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v4 + 16))(v4, v3, v5, v7, v8);
}

void __84__HMDSecureRemoteStreamInternal__serverHandleCommitRequest_options_responseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  v32[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 104));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      dispatch_source_t v26 = v13;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Transaction, %@, has already been completed", buf, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _serverCompletePrepareRequest:*(void *)(a1 + 40)];
    v31[0] = @"response";
    v31[1] = @"utid";
    uint64_t v15 = *(void *)(a1 + 40);
    v32[0] = v7;
    v32[1] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 48), "hmf_stringForKey:", @"kIDSMessageNameKey");
    v18 = augmentResponseOptions(v8, v17);
    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = v24 = v16;
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      dispatch_source_t v26 = v22;
      __int16 v27 = 2112;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@sending commit response, utid %@ %@", buf, 0x20u);

      id v16 = v24;
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (int)_serverHandlePrepareRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"utid"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = 0;
    goto LABEL_9;
  }
  id v12 = [v8 objectForKeyedSubscript:@"request"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    int v24 = -6756;
    goto LABEL_7;
  }
  id v13 = (void *)MEMORY[0x230FBD990]();
  uint64_t v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v35 = v16;
    __int16 v36 = 2112;
    v37 = v11;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Received prepare request, utid %@ %@", buf, 0x20u);
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
  logRemoteMessageEvent(v12, v9, v17);

  dispatch_source_t v18 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v14->_internalQueue);
  if (v18)
  {
    v19 = v18;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke;
    handler[3] = &unk_264A2F820;
    handler[4] = v14;
    id v20 = v11;
    id v33 = v20;
    dispatch_source_set_event_handler(v19, handler);

    dispatch_source_set_cancel_handler(v19, &__block_literal_global_124_258583);
    dispatch_time_t v21 = dispatch_walltime(0, v14->_commitTimeoutNanos);
    dispatch_source_set_timer(v19, v21, 0xFFFFFFFFFFFFFFFFLL, v14->_commitTimeoutNanos / 0xA);
    dispatch_resume(v19);
    v22 = [MEMORY[0x263EFF9A0] dictionary];
    [v22 setObject:v12 forKeyedSubscript:@"request"];
    [v22 setObject:v19 forKeyedSubscript:@"timer"];
    [(NSMutableDictionary *)v14->_prepareRequests setObject:v22 forKey:v20];
    internalQueue = v14->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke_3;
    block[3] = &unk_264A2DDC0;
    id v12 = v12;
    id v27 = v12;
    id v28 = v9;
    __int16 v29 = v14;
    id v30 = v20;
    id v31 = v10;
    dispatch_async(internalQueue, block);

    int v24 = 0;
  }
  else
  {
    int v24 = -6700;
  }
LABEL_7:

  return v24;
}

uint64_t __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serverCompletePrepareRequest:*(void *)(a1 + 40)];
}

void __85__HMDSecureRemoteStreamInternal__serverHandlePrepareRequest_options_responseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hmf_stringForKey:", @"kIDSMessageNameKey");
  uint64_t v3 = augmentResponseOptions(*(void **)(a1 + 40), v2);
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 56);
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Sending prepare response options %@, utid %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (int)_serverHandleDecryptedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [v8 objectForKeyedSubscript:@"op"];
  if ([v11 isEqual:@"prepare"])
  {
    int v12 = [(HMDSecureRemoteStreamInternal *)self _serverHandlePrepareRequest:v8 options:v9 responseHandler:v10];
  }
  else
  {
    if (![v11 isEqual:@"commit"])
    {
      int v13 = -6714;
      goto LABEL_7;
    }
    int v12 = [(HMDSecureRemoteStreamInternal *)self _serverHandleCommitRequest:v8 options:v9 responseHandler:v10];
  }
  int v13 = v12;
LABEL_7:

  return v13;
}

- (void)_serverHandleEncryptedRequest:(id)a3 options:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_sessionID)
  {
    id v8 = 0;
    goto LABEL_25;
  }
  id v8 = [v6 objectForKeyedSubscript:@"tid"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_25:
    id v13 = 0;
    id v42 = 0;
    id v20 = 0;
    uint64_t v19 = 4294960534;
    goto LABEL_18;
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v48 = v12;
    __int16 v49 = 2112;
    id v50 = v8;
    __int16 v51 = 2112;
    id v52 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received request, tid %@ %@", buf, 0x20u);
  }
  id v13 = [v6 objectForKeyedSubscript:@"edata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v14 = [v13 length];
    unint64_t v15 = v14 - 16;
    if (v14 < 0x10)
    {
      id v42 = 0;
      id v20 = 0;
      uint64_t v19 = 4294960553;
    }
    else
    {
      id v13 = v13;
      [v13 bytes];
      id v16 = [MEMORY[0x263EFF990] dataWithLength:v15];
      if (v16)
      {
        id v42 = v16;
        [v42 mutableBytes];
        cipherReadNonce = v10->_cipherReadNonce;
        uint64_t v18 = chacha20_poly1305_decrypt_all_64x64();
        if (v18)
        {
          uint64_t v19 = v18;
          id v20 = 0;
        }
        else
        {
          uint64_t v21 = 0;
          do
          {
            if (++cipherReadNonce[v21]) {
              BOOL v23 = 1;
            }
            else {
              BOOL v23 = v21 == 7;
            }
            ++v21;
          }
          while (!v23);
          id v20 = [MEMORY[0x263F08AC0] propertyListWithData:v42 options:0 format:0 error:0];
          if (v20)
          {
            v43[0] = MEMORY[0x263EF8330];
            v43[1] = 3221225472;
            v43[2] = __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke;
            v43[3] = &unk_264A2DD98;
            v43[4] = v10;
            id v8 = v8;
            id v44 = v8;
            uint64_t v19 = [(HMDSecureRemoteStreamInternal *)v10 _serverHandleDecryptedRequest:v20 options:v7 responseHandler:v43];

            if (!v19) {
              goto LABEL_23;
            }
          }
          else
          {
            uint64_t v19 = 4294960564;
          }
        }
      }
      else
      {
        id v42 = 0;
        id v20 = 0;
        uint64_t v19 = 4294960568;
      }
    }
  }
  else
  {
    id v42 = 0;
    id v20 = 0;
    uint64_t v19 = 4294960540;
  }
LABEL_18:
  id v41 = v8;
  int v24 = (void *)MEMORY[0x230FBD990]();
  v25 = self;
  dispatch_source_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = HMFGetLogIdentifier();
    id v40 = v7;
    id v27 = (void *)MEMORY[0x263F087E8];
    id v39 = v20;
    id v28 = v6;
    uint64_t v29 = *MEMORY[0x263F08410];
    uint64_t v45 = *MEMORY[0x263F08320];
    __int16 v38 = v24;
    uint64_t v30 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v31 = (void *)v30;
    dispatch_time_t v32 = @"?";
    if (v30) {
      dispatch_time_t v32 = (__CFString *)v30;
    }
    v46 = v32;
    id v33 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v36);
    uint64_t v34 = v29;
    id v6 = v28;
    id v20 = v39;
    v35 = [v27 errorWithDomain:v34 code:(int)v19 userInfo:v33];
    *(_DWORD *)buf = 138543874;
    v48 = v37;
    __int16 v49 = 2112;
    id v50 = v35;
    __int16 v51 = 2112;
    id v52 = v6;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Request failed: %@, %@", buf, 0x20u);

    id v7 = v40;
    int v24 = v38;
  }
  [(HMDSecureRemoteStreamInternal *)v25 _stop:v19];
  id v8 = v41;
LABEL_23:
}

void __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v59[4] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 104));
  id v46 = v7;
  if (v9)
  {
    if ([v9 code])
    {
      uint64_t v31 = [v9 code];
      if (!v31) {
        goto LABEL_20;
      }
      id v12 = 0;
    }
    else
    {
      id v12 = 0;
      uint64_t v31 = 4294960596;
    }
    goto LABEL_29;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v10 + 160))
  {
    id v12 = 0;
    uint64_t v31 = 4294960576;
    goto LABEL_29;
  }
  if (!*(void *)(v10 + 152) || !*(void *)(v10 + 224))
  {
    id v12 = 0;
LABEL_22:
    uint64_t v31 = 4294960534;
LABEL_29:
    dispatch_time_t v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = *(id *)(a1 + 32);
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = HMFGetLogIdentifier();
      double v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F08410];
      uint64_t v45 = v31;
      uint64_t v50 = *MEMORY[0x263F08320];
      uint64_t v36 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v37 = (void *)v36;
      __int16 v38 = @"?";
      if (v36) {
        __int16 v38 = (__CFString *)v36;
      }
      __int16 v51 = v38;
      [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v44 = v32;
      v40 = id v39 = v8;
      id v41 = [v43 errorWithDomain:v42 code:(int)v31 userInfo:v40];
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v35;
      __int16 v54 = 2112;
      id v55 = v41;
      __int16 v56 = 2112;
      id v57 = v46;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Response failed: %@, %@", buf, 0x20u);

      uint64_t v31 = v45;
      id v8 = v39;
      dispatch_time_t v32 = v44;
    }
    [*(id *)(a1 + 32) _stop:v31];
    goto LABEL_19;
  }
  if (v7)
  {
    __int16 v11 = -[HMDSecureRemoteStreamInternal _encodeBinaryPlist:]((void *)v10, v7);
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 length];
      goto LABEL_9;
    }
    goto LABEL_22;
  }
  uint64_t v13 = 0;
  id v12 = 0;
LABEL_9:
  unint64_t v14 = [MEMORY[0x263EFF990] dataWithLength:v13 + 16];
  if (!v14)
  {
    uint64_t v31 = 4294960568;
    goto LABEL_29;
  }
  unint64_t v15 = v8;
  id v16 = v14;
  [v16 mutableBytes];
  id v12 = v12;
  [v12 bytes];
  chacha20_poly1305_encrypt_all_64x64();
  uint64_t v17 = 0;
  uint64_t v18 = *(void *)(a1 + 32) + 80;
  do
  {
    if (++*(unsigned char *)(v18 + v17)) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v17 == 7;
    }
    ++v17;
  }
  while (!v20);
  v59[0] = v16;
  v58[0] = @"edata";
  v58[1] = @"sid";
  uint64_t v21 = *(void *)(a1 + 40);
  v59[1] = *(void *)(*(void *)(a1 + 32) + 152);
  v59[2] = v21;
  v58[2] = @"tid";
  v58[3] = @"type";
  v59[3] = @"response";
  v22 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
  BOOL v23 = (void *)MEMORY[0x230FBD990]();
  id v24 = *(id *)(a1 + 32);
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    dispatch_source_t v26 = HMFGetLogIdentifier();
    id v27 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = v26;
    __int16 v54 = 2112;
    id v55 = v27;
    __int16 v56 = 2112;
    id v57 = v22;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Sending response, tid %@ %@", buf, 0x20u);
  }
  uint64_t v28 = *(void *)(a1 + 32);
  uint64_t v29 = *(NSObject **)(v28 + 240);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke_122;
  block[3] = &unk_264A2F2F8;
  void block[4] = v28;
  id v48 = v22;
  id v8 = v15;
  id v49 = v15;
  id v30 = v22;
  dispatch_async(v29, block);

  [*(id *)(a1 + 32) _updateIdleTimer];
LABEL_19:

  id v7 = v46;
LABEL_20:
}

- (id)_encodeBinaryPlist:(void *)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v11 = 0;
    uint64_t v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:&v11];
    id v5 = v11;
    if (!v4)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = a1;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        id v15 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode payload as binary PList: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __71__HMDSecureRemoteStreamInternal__serverHandleEncryptedRequest_options___block_invoke_122(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1[4] + 224) + 16))(*(void *)(a1[4] + 224), a1[5], a1[6]);
}

- (void)_serverPairVerifyExchange:(id)a3 options:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  id v8 = [v6 objectForKeyedSubscript:@"op"];
  int v9 = [v8 isEqual:@"pv"];

  uint64_t v36 = v6;
  if (!v9)
  {
    id v22 = 0;
    v35 = 0;
    id v12 = 0;
    v37 = 0;
    uint64_t v14 = 4294960560;
    goto LABEL_20;
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"tid"];
  objc_opt_class();
  v37 = (void *)v11;
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    id v22 = 0;
    v35 = 0;
    id v12 = 0;
    uint64_t v14 = 4294960588;
    goto LABEL_20;
  }
  id v12 = [v6 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    id v22 = 0;
    v35 = 0;
LABEL_32:
    uint64_t v14 = 4294960540;
    goto LABEL_20;
  }
  if (self->_sessionID)
  {
    v35 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = [v6 objectForKeyedSubscript:@"sid"];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  v35 = v13;
  if ((isKindOfClass & 1) == 0)
  {
    id v22 = 0;
    goto LABEL_32;
  }
  objc_storeStrong((id *)&self->_sessionID, v13);
LABEL_8:
  if (self->_pairVerifySession) {
    goto LABEL_9;
  }
  long long v50 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  *(_OWORD *)&buf[8] = 0u;
  *(void *)buf = self;
  if (self->_findPeerHandler) {
    *(void *)&long long v49 = _pairingFindPeer;
  }
  *((void *)&v48 + 1) = _pairingCopyIdentity;
  uint64_t isKindOfClass = PairingSessionCreate();
  if (isKindOfClass)
  {
    uint64_t v14 = isKindOfClass;
    id v22 = 0;
LABEL_20:
    BOOL v23 = (void *)MEMORY[0x230FBD990](isKindOfClass);
    id v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = HMFGetLogIdentifier();
      dispatch_source_t v26 = (void *)MEMORY[0x263F087E8];
      id v34 = v7;
      uint64_t v27 = *MEMORY[0x263F08410];
      uint64_t v43 = *MEMORY[0x263F08320];
      uint64_t v28 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v29 = (void *)v28;
      id v30 = @"?";
      if (v28) {
        id v30 = (__CFString *)v28;
      }
      id v44 = v30;
      uint64_t v31 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      dispatch_time_t v32 = [v26 errorWithDomain:v27 code:(int)v14 userInfo:v31];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&long long v48 = v36;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Pair-verify failed: %@, %@", buf, 0x20u);

      id v7 = v34;
    }

    [(HMDSecureRemoteStreamInternal *)v24 _stop:v14];
    goto LABEL_25;
  }
  PairingSessionSetLogging();
LABEL_9:
  id v12 = v12;
  [v12 bytes];
  [v12 length];
  uint64_t isKindOfClass = PairingSessionExchange();
  uint64_t v14 = isKindOfClass;
  if (isKindOfClass)
  {
    id v22 = 0;
  }
  else
  {
    v45[0] = @"data";
    id v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v42 length:v41];
    v46[0] = v15;
    v46[1] = @"pv";
    v45[1] = @"op";
    v45[2] = @"sid";
    v46[2] = self->_sessionID;
    v46[3] = v37;
    v45[3] = @"tid";
    v45[4] = @"type";
    v46[4] = @"response";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];

    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      BOOL v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Sending pair-verify response %@", buf, 0x16u);
    }
    userQueue = v18->_userQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__HMDSecureRemoteStreamInternal__serverPairVerifyExchange_options___block_invoke;
    block[3] = &unk_264A2F2F8;
    void block[4] = v18;
    id v22 = v16;
    id v39 = v22;
    id v40 = v7;
    dispatch_async(userQueue, block);

    uint64_t isKindOfClass = [(HMDSecureRemoteStreamInternal *)v18 _updateIdleTimer];
    if (v42) {
      free(v42);
    }
  }
  if (v14) {
    goto LABEL_20;
  }
LABEL_25:
}

uint64_t __67__HMDSecureRemoteStreamInternal__serverPairVerifyExchange_options___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1[4] + 224) + 16))(*(void *)(a1[4] + 224), a1[5], a1[6]);
}

- (void)_serverRunStateMachine
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  while (2)
  {
    switch(self->_state)
    {
      case 0xA:
        self->_int state = 12;
        continue;
      case 0xB:
      case 0xF:
        return;
      case 0xC:
        id v3 = self;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke;
        v18[3] = &unk_264A2DD70;
        uint64_t v19 = v3;
        uint64_t v4 = v3;
        [(HMDSecureRemoteStreamInternal *)v4 setInternalRequestHandler:v18];
        self->_int state = 13;
        id v5 = v19;
        goto LABEL_9;
      case 0xD:
        if (!self->_pairVerifyDone) {
          return;
        }
        self->_int state = 14;
        continue;
      case 0xE:
        uint64_t v6 = [(HMDSecureRemoteStreamInternal *)self _setupEncryption];
        if (!v6)
        {
          id v7 = self;
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_2;
          v16[3] = &unk_264A2DD70;
          uint64_t v17 = v7;
          uint64_t v4 = v7;
          [(HMDSecureRemoteStreamInternal *)v4 setInternalRequestHandler:v16];
          self->_int state = 15;
          userQueue = v4->_userQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_3;
          block[3] = &unk_264A2F7F8;
          void block[4] = v4;
          dispatch_async(userQueue, block);
          id v5 = v17;
LABEL_9:

          continue;
        }
        uint64_t v14 = v6;
LABEL_14:
        [(HMDSecureRemoteStreamInternal *)self _stop:v14];
        return;
      default:
        int v9 = (void *)MEMORY[0x230FBD990](self, a2);
        uint64_t v10 = self;
        uint64_t v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = HMFGetLogIdentifier();
          int state = self->_state;
          *(_DWORD *)buf = 138543618;
          uint64_t v21 = v12;
          __int16 v22 = 1024;
          int v23 = state;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Bad state: %d", buf, 0x12u);
        }
        uint64_t v14 = 4294960587;
        goto LABEL_14;
    }
  }
}

uint64_t __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _serverPairVerifyExchange:a2 options:a3];
}

uint64_t __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _serverHandleEncryptedRequest:a2 options:a3];
}

void __55__HMDSecureRemoteStreamInternal__serverRunStateMachine__block_invoke_3(uint64_t a1)
{
  uint64_t v4 = (void (**)(id, void))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 208));
  if (v4)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 208);
    *(void *)(v2 + 208) = 0;

    v4[2](v4, 0);
  }
}

- (int)_clientHandleCommitResponse:(id)a3 options:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"edata"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_24;
  }
  unint64_t v9 = [v8 length];
  unint64_t v10 = v9 - 16;
  if (v9 < 0x10)
  {
    id v12 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    int v15 = -6743;
    goto LABEL_18;
  }
  [v8 bytes];
  uint64_t v11 = [MEMORY[0x263EFF990] dataWithLength:v10];
  if (!v11)
  {
    id v12 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    int v15 = -6728;
    goto LABEL_18;
  }
  id v12 = v11;
  [v12 mutableBytes];
  cipherReadNonce = self->_cipherReadNonce;
  int v14 = chacha20_poly1305_decrypt_all_64x64();
  if (v14)
  {
    int v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  uint64_t v19 = 0;
  do
  {
    if (++cipherReadNonce[v19]) {
      BOOL v21 = 1;
    }
    else {
      BOOL v21 = v19 == 7;
    }
    ++v19;
  }
  while (!v21);
  __int16 v22 = [MEMORY[0x263F08AC0] propertyListWithData:v12 options:0 format:0 error:0];
  uint64_t v16 = v22;
  if (!v22)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    int v15 = -6732;
    goto LABEL_18;
  }
  uint64_t v18 = [v22 objectForKeyedSubscript:@"utid"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = 0;
    goto LABEL_24;
  }
  uint64_t v17 = [v16 objectForKeyedSubscript:@"response"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_24:
    int v15 = -6756;
    goto LABEL_18;
  }
  uint64_t v29 = v7;
  self->_commitResponded = 1;
  int v23 = (void *)MEMORY[0x230FBD990]();
  uint64_t v24 = self;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    dispatch_source_t v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v26;
    __int16 v32 = 2112;
    id v33 = v18;
    __int16 v34 = 2112;
    v35 = v16;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Received commit response, utid %@ %@", buf, 0x20u);
  }
  id v7 = v29;
  [(HMDSecureRemoteStreamInternal *)v24 _completeUserTransaction:v18 response:v17 options:v29 status:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v18];
  logRemoteMessageEvent(v6, v29, v27);

  int v15 = 0;
LABEL_18:

  return v15;
}

- (int)_clientSendCommitRequest:(id)a3
{
  v54[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"utid"];
  if (v5)
  {
    id v6 = [NSNumber numberWithDouble:(double)self->_sendInternalTimeoutNanos / 1000000000.0];
    v53[0] = @"op";
    v53[1] = @"utid";
    v54[0] = @"commit";
    v54[1] = v5;
    v53[2] = @"timeout";
    v54[2] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];
    id v8 = -[HMDSecureRemoteStreamInternal _encodeBinaryPlist:](self, v7);
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 length];
      uint64_t v11 = [MEMORY[0x263EFF990] dataWithLength:v10 + 16];
      if (v11)
      {
        id v40 = v6;
        id v12 = v11;
        [v12 mutableBytes];
        cipherWriteNonce = self->_cipherWriteNonce;
        id v9 = v9;
        [v9 bytes];
        uint64_t v14 = chacha20_poly1305_encrypt_all_64x64();
        uint64_t v15 = 0;
        do
        {
          if (++cipherWriteNonce[v15]) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = v15 == 7;
          }
          ++v15;
        }
        while (!v17);
        uint64_t v18 = (void *)MEMORY[0x230FBD990](v14);
        uint64_t v19 = self;
        BOOL v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          BOOL v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          long long v48 = v21;
          __int16 v49 = 2112;
          long long v50 = v5;
          __int16 v51 = 2112;
          id v52 = v7;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Sending commit request, utid %@ %@", buf, 0x20u);
        }
        uint64_t v45 = @"edata";
        id v46 = v12;
        __int16 v22 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        int v23 = [v4 objectForKeyedSubscript:@"options"];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __58__HMDSecureRemoteStreamInternal__clientSendCommitRequest___block_invoke;
        v42[3] = &unk_264A2DD48;
        v42[4] = v19;
        [(HMDSecureRemoteStreamInternal *)v19 _sendRequest:v22 options:v23 responseHandler:v42];

        int v24 = 0;
        id v6 = v40;
        goto LABEL_13;
      }
      int v24 = -6728;
    }
    else
    {
      int v24 = -6732;
    }
  }
  else
  {
    id v9 = 0;
    id v6 = 0;
    id v7 = 0;
    int v24 = -6762;
  }
  dispatch_source_t v26 = (void *)MEMORY[0x230FBD990]();
  uint64_t v27 = self;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    __int16 v38 = HMFGetLogIdentifier();
    uint64_t v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08410];
    uint64_t v41 = v6;
    uint64_t v43 = *MEMORY[0x263F08320];
    uint64_t v29 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v37 = (void *)v29;
    id v30 = @"?";
    if (v29) {
      id v30 = (__CFString *)v29;
    }
    id v44 = v30;
    [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v39 = v26;
    id v31 = v4;
    v33 = __int16 v32 = v7;
    __int16 v34 = [v36 errorWithDomain:v35 code:v24 userInfo:v33];
    *(_DWORD *)buf = 138543618;
    long long v48 = v38;
    __int16 v49 = 2112;
    long long v50 = v34;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Send commit request failed: %@", buf, 0x16u);

    id v6 = v41;
    id v7 = v32;
    id v4 = v31;
    dispatch_source_t v26 = v39;
  }
LABEL_13:

  return v24;
}

void __58__HMDSecureRemoteStreamInternal__clientSendCommitRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  if (![v9 code])
  {
    uint64_t v11 = 4294960596;
    goto LABEL_7;
  }
  uint64_t v11 = [v10 code];
  if (!v11)
  {
LABEL_4:
    uint64_t v11 = [*(id *)(a1 + 32) _clientHandleCommitResponse:v7 options:v8];
    if (!v11)
    {
      [*(id *)(a1 + 32) _runStateMachine];
      goto LABEL_13;
    }
  }
LABEL_7:
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __int16 v22 = HMFGetLogIdentifier();
    int v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08410];
    int v24 = v12;
    uint64_t v25 = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v16 = (void *)v15;
    BOOL v17 = @"?";
    if (v15) {
      BOOL v17 = (__CFString *)v15;
    }
    dispatch_source_t v26 = v17;
    uint64_t v18 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1, v20);
    uint64_t v19 = [v23 errorWithDomain:v21 code:(int)v11 userInfo:v18];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v22;
    __int16 v29 = 2112;
    id v30 = v19;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Commit response failed: %@", buf, 0x16u);

    id v12 = v24;
  }

  if (v11 != -6752) {
    [*(id *)(a1 + 32) _stop:v11];
  }
LABEL_13:
}

- (int)_clientHandlePrepareResponse:(id)a3 options:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"edata"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = 0;
    int v13 = -6756;
    goto LABEL_18;
  }
  unint64_t v9 = [v8 length];
  if (v9 < 0x10)
  {
    id v12 = 0;
    int v13 = -6743;
    goto LABEL_18;
  }
  unint64_t v10 = v9;
  [v8 bytes];
  if (v10 == 16)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263EFF990] dataWithLength:v10 - 16];
    if (!v11)
    {
      id v12 = 0;
      int v13 = -6728;
      goto LABEL_18;
    }
  }
  cipherReadNonce = self->_cipherReadNonce;
  id v12 = v11;
  [v12 mutableBytes];
  int v15 = chacha20_poly1305_decrypt_all_64x64();
  if (v15)
  {
    int v13 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      if (++cipherReadNonce[v16]) {
        BOOL v18 = 1;
      }
      else {
        BOOL v18 = v16 == 7;
      }
      ++v16;
    }
    while (!v18);
    self->_prepareResponded = 1;
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      __int16 v22 = HMFGetLogIdentifier();
      int v25 = 138543362;
      dispatch_source_t v26 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Received prepare response", (uint8_t *)&v25, 0xCu);
    }
    int v23 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
    logRemoteMessageEvent(v6, v7, v23);

    int v13 = 0;
  }
LABEL_18:

  return v13;
}

- (int)_clientSendPrepareRequest:(id)a3
{
  void v53[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"utid"];
  if (!v5)
  {
    id v10 = 0;
    id v8 = 0;
    id v7 = 0;
LABEL_17:
    int v25 = -6762;
    goto LABEL_20;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"request"];
  id v7 = (void *)v6;
  if (!v6)
  {
    id v10 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  v52[0] = @"op";
  v52[1] = @"request";
  v53[0] = @"prepare";
  v53[1] = v6;
  v52[2] = @"utid";
  v53[2] = v5;
  id v8 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
  unint64_t v9 = -[HMDSecureRemoteStreamInternal _encodeBinaryPlist:](self, v8);
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 length];
    id v12 = [MEMORY[0x263EFF990] dataWithLength:v11 + 16];
    if (v12)
    {
      id v13 = v12;
      [v13 mutableBytes];
      cipherWriteNonce = self->_cipherWriteNonce;
      id v10 = v10;
      [v10 bytes];
      uint64_t v15 = chacha20_poly1305_encrypt_all_64x64();
      uint64_t v16 = 0;
      do
      {
        if (++cipherWriteNonce[v16]) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v16 == 7;
        }
        ++v16;
      }
      while (!v18);
      uint64_t v19 = (void *)MEMORY[0x230FBD990](v15);
      uint64_t v20 = self;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v47 = v22;
        __int16 v48 = 2112;
        __int16 v49 = v5;
        __int16 v50 = 2112;
        __int16 v51 = v8;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Sending prepare request, utid %@ %@", buf, 0x20u);
      }
      id v44 = @"edata";
      id v45 = v13;
      int v23 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      int v24 = [v4 objectForKeyedSubscript:@"options"];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __59__HMDSecureRemoteStreamInternal__clientSendPrepareRequest___block_invoke;
      v41[3] = &unk_264A2DD48;
      v41[4] = v20;
      [(HMDSecureRemoteStreamInternal *)v20 _sendRequest:v23 options:v24 responseHandler:v41];

      int v25 = 0;
      goto LABEL_14;
    }
    int v25 = -6728;
  }
  else
  {
    int v25 = -6732;
  }
LABEL_20:
  uint64_t v27 = (void *)MEMORY[0x230FBD990]();
  uint64_t v28 = self;
  __int16 v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    __int16 v38 = HMFGetLogIdentifier();
    uint64_t v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08410];
    id v39 = v27;
    uint64_t v42 = *MEMORY[0x263F08320];
    uint64_t v30 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v37 = (void *)v30;
    uint64_t v31 = @"?";
    if (v30) {
      uint64_t v31 = (__CFString *)v30;
    }
    uint64_t v43 = v31;
    [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v40 = v7;
    v33 = __int16 v32 = v8;
    __int16 v34 = [v36 errorWithDomain:v35 code:v25 userInfo:v33];
    *(_DWORD *)buf = 138543618;
    id v47 = v38;
    __int16 v48 = 2112;
    __int16 v49 = v34;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Send prepare request failed: %@", buf, 0x16u);

    uint64_t v27 = v39;
    id v8 = v32;
    id v7 = v40;
  }
LABEL_14:

  return v25;
}

void __59__HMDSecureRemoteStreamInternal__clientSendPrepareRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  if (![v9 code])
  {
    uint64_t v11 = 4294960596;
    goto LABEL_7;
  }
  uint64_t v11 = [v10 code];
  if (!v11)
  {
LABEL_4:
    uint64_t v11 = [*(id *)(a1 + 32) _clientHandlePrepareResponse:v7 options:v8];
    if (!v11)
    {
      [*(id *)(a1 + 32) _runStateMachine];
      goto LABEL_13;
    }
  }
LABEL_7:
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __int16 v22 = HMFGetLogIdentifier();
    int v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08410];
    int v24 = v12;
    uint64_t v25 = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v16 = (void *)v15;
    BOOL v17 = @"?";
    if (v15) {
      BOOL v17 = (__CFString *)v15;
    }
    dispatch_source_t v26 = v17;
    BOOL v18 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1, v20);
    uint64_t v19 = [v23 errorWithDomain:v21 code:(int)v11 userInfo:v18];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v22;
    __int16 v29 = 2112;
    uint64_t v30 = v19;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Prepare response failed: %@", buf, 0x16u);

    id v12 = v24;
  }

  if (v11 != -6752) {
    [*(id *)(a1 + 32) _stop:v11];
  }
LABEL_13:
}

- (int)_clientPairVerifyExchange:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v25 = 0;
  dispatch_source_t v26 = 0;
  if (!self->_pairVerifySession)
  {
    long long v34 = 0u;
    long long v33 = 0u;
    long long v32 = 0u;
    *(_OWORD *)&buf[8] = 0u;
    *(void *)buf = self;
    if (self->_findPeerHandler) {
      *(void *)&long long v33 = _pairingFindPeer;
    }
    *((void *)&v32 + 1) = _pairingCopyIdentity;
    int v9 = PairingSessionCreate();
    if (v9)
    {
      int v6 = v9;
      goto LABEL_10;
    }
    PairingSessionSetLogging();
  }
  id v5 = v4;
  [v5 bytes];
  [v5 length];
  int v6 = PairingSessionExchange();
  if (!v6)
  {
    if (!self->_pairVerifyDone)
    {
      v29[0] = @"data";
      id v7 = [MEMORY[0x263EFF8F8] dataWithBytes:v26 length:v25];
      v29[1] = @"op";
      v30[0] = v7;
      v30[1] = @"pv";
      id v8 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      void v24[2] = __59__HMDSecureRemoteStreamInternal__clientPairVerifyExchange___block_invoke;
      v24[3] = &unk_264A2DD48;
      v24[4] = self;
      [(HMDSecureRemoteStreamInternal *)self _sendRequest:v8 options:0 responseHandler:v24];
    }
    int v6 = 0;
  }
LABEL_10:
  if (v26) {
    free(v26);
  }
  if (v6)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v22 = MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08410];
      uint64_t v27 = *MEMORY[0x263F08320];
      uint64_t v15 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v16 = (void *)v15;
      BOOL v17 = @"?";
      if (v15) {
        BOOL v17 = (__CFString *)v15;
      }
      uint64_t v28 = v17;
      objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v22);
      v19 = id v18 = v4;
      uint64_t v20 = [v23 errorWithDomain:v14 code:v6 userInfo:v19];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Pair-verify failed: %@", buf, 0x16u);

      id v4 = v18;
    }
  }

  return v6;
}

void __59__HMDSecureRemoteStreamInternal__clientPairVerifyExchange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    if ([v9 code])
    {
      uint64_t v13 = [v10 code];
      uint64_t v11 = 0;
      if (!v13) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v13 = 4294960596;
    }
  }
  else
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [*(id *)(a1 + 32) _clientPairVerifyExchange:v11];
      if (!v12)
      {
        [*(id *)(a1 + 32) _runStateMachine];
        goto LABEL_12;
      }
      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v13 = 4294960540;
    }
  }
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    int v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08410];
    id v26 = v8;
    uint64_t v27 = *MEMORY[0x263F08320];
    uint64_t v25 = v14;
    uint64_t v17 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v18 = (void *)v17;
    uint64_t v19 = @"?";
    if (v17) {
      uint64_t v19 = (__CFString *)v17;
    }
    uint64_t v28 = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v21 = [v24 errorWithDomain:v22 code:(int)v13 userInfo:v20];
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v23;
    __int16 v31 = 2112;
    long long v32 = v21;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Pair-verify response failed: %@", buf, 0x16u);

    id v8 = v26;
    uint64_t v14 = v25;
  }
  if (v13 != -6752) {
    [*(id *)(a1 + 32) _stop:v13];
  }
LABEL_12:
}

- (void)_clientRunStateMachine
{
  uint64_t v2 = self;
  uint64_t v17 = *MEMORY[0x263EF8340];
  while (2)
  {
    switch(v2->_state)
    {
      case 0:
        v2->_int state = 2;
        continue;
      case 1:
        return;
      case 2:
        self = (HMDSecureRemoteStreamInternal *)[(HMDSecureRemoteStreamInternal *)v2 _clientPairVerifyExchange:0];
        if (self) {
          goto LABEL_20;
        }
        v2->_int state = 3;
        continue;
      case 3:
        if (!v2->_pairVerifyDone) {
          return;
        }
        v2->_int state = 4;
        continue;
      case 4:
        self = (HMDSecureRemoteStreamInternal *)[(HMDSecureRemoteStreamInternal *)v2 _setupEncryption];
        if (!self)
        {
          userQueue = v2->_userQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __55__HMDSecureRemoteStreamInternal__clientRunStateMachine__block_invoke;
          block[3] = &unk_264A2F7F8;
          void block[4] = v2;
          dispatch_async(userQueue, block);
LABEL_19:
          v2->_int state = 5;
          continue;
        }
LABEL_20:
        uint64_t v5 = (uint64_t)self;
LABEL_24:
        [(HMDSecureRemoteStreamInternal *)v2 _stop:v5];
        return;
      case 5:
        self = (HMDSecureRemoteStreamInternal *)[(NSMutableArray *)v2->_userTransactions count];
        if (!self) {
          return;
        }
        v2->_int state = 6;
        continue;
      case 6:
        v2->_prepareResponded = 0;
        id v4 = [(NSMutableArray *)v2->_userTransactions firstObject];
        uint64_t v5 = [(HMDSecureRemoteStreamInternal *)v2 _clientSendPrepareRequest:v4];

        if (v5) {
          goto LABEL_24;
        }
        v2->_int state = 7;
        continue;
      case 7:
        if (!v2->_prepareResponded) {
          return;
        }
        v2->_int state = 8;
        continue;
      case 8:
        v2->_commitResponded = 0;
        int v6 = [(NSMutableArray *)v2->_userTransactions firstObject];
        uint64_t v5 = [(HMDSecureRemoteStreamInternal *)v2 _clientSendCommitRequest:v6];

        if (v5) {
          goto LABEL_24;
        }
        v2->_int state = 9;
        continue;
      case 9:
        if (v2->_commitResponded) {
          goto LABEL_19;
        }
        return;
      default:
        id v7 = (void *)MEMORY[0x230FBD990](self, a2);
        id v8 = v2;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = HMFGetLogIdentifier();
          int state = v2->_state;
          *(_DWORD *)buf = 138543618;
          uint64_t v14 = v10;
          __int16 v15 = 1024;
          int v16 = state;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Bad state: %d", buf, 0x12u);
        }
        uint64_t v5 = 4294960587;
        goto LABEL_24;
    }
  }
}

void __55__HMDSecureRemoteStreamInternal__clientRunStateMachine__block_invoke(uint64_t a1)
{
  id v4 = (void (**)(id, void))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 208));
  if (v4)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 208);
    *(void *)(v2 + 208) = 0;

    v4[2](v4, 0);
  }
}

- (void)_transportReceivedMessage:(id)a3 options:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v40 = v11;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Transport received message %@", buf, 0x16u);
  }
  if (!v9->_started)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    int v21 = -6703;
    goto LABEL_19;
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"sid"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v9->_sessionID && !objc_msgSend(v12, "isEqual:"))
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
LABEL_28:
    int v21 = -6708;
    goto LABEL_19;
  }
  uint64_t v13 = [v6 objectForKeyedSubscript:@"tid"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = 0;
    goto LABEL_28;
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"type"];
  if ([v14 isEqual:@"request"])
  {
    __int16 v15 = [(NSMutableDictionary *)v9->_transactions objectForKeyedSubscript:v13];

    if (v15) {
      goto LABEL_24;
    }
    internalRequestHandler = (void (**)(id, id, id))v9->_internalRequestHandler;
    if (internalRequestHandler)
    {
      internalRequestHandler[2](internalRequestHandler, v6, v7);
LABEL_17:
      [(HMDSecureRemoteStreamInternal *)v9 _runStateMachine];
      goto LABEL_24;
    }
    int v21 = -6714;
  }
  else if ([v14 isEqual:@"response"])
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v9;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      uint64_t v20 = v35 = v7;
      *(_DWORD *)buf = 138543874;
      id v40 = v20;
      __int16 v41 = 2112;
      id v42 = v13;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Received response, tid %@, %@", buf, 0x20u);

      id v7 = v35;
    }

    if (v9->_sessionID)
    {
      [(HMDSecureRemoteStreamInternal *)v18 _completeTransaction:v13 response:v6 options:v7 status:0];
      goto LABEL_17;
    }
    int v21 = -6736;
  }
  else
  {
    int v21 = -6702;
  }
LABEL_19:
  uint64_t v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = v9;
  int v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    long long v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = (void *)v25;
    uint64_t v31 = *MEMORY[0x263F08410];
    uint64_t v36 = v22;
    uint64_t v37 = *MEMORY[0x263F08320];
    id v26 = v7;
    uint64_t v27 = [NSString stringWithUTF8String:DebugGetErrorString()];
    long long v34 = (void *)v27;
    uint64_t v28 = @"?";
    if (v27) {
      uint64_t v28 = (__CFString *)v27;
    }
    __int16 v38 = v28;
    __int16 v29 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v30 = [v32 errorWithDomain:v31 code:v21 userInfo:v29];
    *(_DWORD *)buf = 138543874;
    id v40 = v33;
    __int16 v41 = 2112;
    id v42 = v30;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Transport message error: %@, %@", buf, 0x20u);

    id v7 = v26;
    uint64_t v22 = v36;
  }
LABEL_24:
}

- (void)transportReceivedMessage:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMDSecureRemoteStreamInternal_transportReceivedMessage_options___block_invoke;
  block[3] = &unk_264A2F2F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __66__HMDSecureRemoteStreamInternal_transportReceivedMessage_options___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v1 _transportReceivedMessage:v2 options:v3];
}

- (void)_completeTransaction:(id)a3 response:(id)a4 options:(id)a5 status:(int)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = [(NSMutableDictionary *)self->_transactions objectForKeyedSubscript:v10];
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  __int16 v15 = self;
  int v16 = HMFGetOSLogHandle();
  uint64_t v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v44 = v14;
      id v46 = v11;
      id v48 = v12;
      HMFGetLogIdentifier();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        id v42 = (void *)MEMORY[0x263F087E8];
        uint64_t v40 = *MEMORY[0x263F08410];
        uint64_t v52 = *MEMORY[0x263F08320];
        uint64_t v19 = [NSString stringWithUTF8String:DebugGetErrorString()];
        uint64_t v11 = (__CFString *)v19;
        uint64_t v20 = @"?";
        if (v19) {
          uint64_t v20 = (__CFString *)v19;
        }
        uint64_t v53 = v20;
        uint64_t v21 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        uint64_t v22 = v42;
        __int16 v41 = (void *)v21;
        id v23 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v40, a6);
      }
      else
      {
        id v23 = 0;
      }
      id v26 = &stru_26E2EB898;
      *(_DWORD *)buf = 138544130;
      if (v46) {
        id v26 = v46;
      }
      id v55 = v18;
      __int16 v56 = 2112;
      id v57 = v10;
      __int16 v58 = 2112;
      v59 = v23;
      __int16 v60 = 2112;
      id v61 = v26;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Completed request, tid %@, status %@\n%@", buf, 0x2Au);
      if (a6)
      {
      }
      uint64_t v11 = v46;
      id v12 = v48;
      uint64_t v14 = v44;
    }

    uint64_t v27 = [v13 objectForKeyedSubscript:@"timer"];
    uint64_t v28 = v27;
    if (v27) {
      dispatch_source_cancel(v27);
    }
    [(NSMutableDictionary *)self->_transactions removeObjectForKey:v10];
    __int16 v29 = [v13 objectForKeyedSubscript:@"responseHandler"];
    if (v29)
    {
      uint64_t v30 = objc_msgSend(v13, "hmf_dictionaryForKey:", @"options");
      uint64_t v31 = objc_msgSend(v30, "hmf_stringForKey:", @"kRemoteMessageAttributedMessageNameKey");
      long long v32 = augmentResponseOptions(v12, v31);
      if (a6)
      {
        uint64_t v45 = (void *)MEMORY[0x263F087E8];
        uint64_t v43 = *MEMORY[0x263F08410];
        id v49 = v12;
        uint64_t v33 = a6;
        uint64_t v50 = *MEMORY[0x263F08320];
        id v47 = v30;
        long long v34 = v11;
        uint64_t v35 = [NSString stringWithUTF8String:DebugGetErrorString()];
        uint64_t v36 = (void *)v35;
        uint64_t v37 = @"?";
        if (v35) {
          uint64_t v37 = (__CFString *)v35;
        }
        __int16 v51 = v37;
        __int16 v38 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        id v39 = [v45 errorWithDomain:v43 code:v33 userInfo:v38];
        ((void (**)(void, __CFString *, void *, void *))v29)[2](v29, v34, v32, v39);

        id v12 = v49;
        uint64_t v11 = v34;
        uint64_t v30 = v47;
      }
      else
      {
        ((void (**)(void, __CFString *, void *, void))v29)[2](v29, v11, v32, 0);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = id v24 = v12;
      *(_DWORD *)buf = 138543618;
      id v55 = v25;
      __int16 v56 = 2112;
      id v57 = v10;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing, tid %@", buf, 0x16u);

      id v12 = v24;
    }
  }
}

- (void)_sendRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  v47[3] = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F08C38] UUID];
  uint64_t v11 = [v10 UUIDString];

  dispatch_source_t v12 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue);
  if (v12)
  {
    id v13 = v12;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke;
    handler[3] = &unk_264A2F820;
    handler[4] = self;
    id v14 = v11;
    id v39 = v14;
    dispatch_source_set_event_handler(v13, handler);

    dispatch_source_set_cancel_handler(v13, &__block_literal_global_80);
    dispatch_time_t v15 = dispatch_walltime(0, self->_sendInternalTimeoutNanos);
    dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, self->_sendInternalTimeoutNanos / 0xA);
    dispatch_resume(v13);
    int v16 = (void *)[v9 copy];
    uint64_t v17 = v16;
    id v18 = (id)MEMORY[0x263EFFA78];
    if (v8) {
      id v18 = v8;
    }
    v47[0] = v18;
    v46[0] = @"options";
    v46[1] = @"responseHandler";
    uint64_t v19 = _Block_copy(v16);
    v46[2] = @"timer";
    v47[1] = v19;
    v47[2] = v13;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];

    uint64_t v30 = (void *)v20;
    [(NSMutableDictionary *)self->_transactions setObject:v20 forKey:v14];
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v31];
    [v21 setObject:self->_sessionID forKeyedSubscript:@"sid"];
    [v21 setObject:v14 forKeyedSubscript:@"tid"];
    uint64_t v22 = (void *)MEMORY[0x230FBD990]([v21 setObject:@"request" forKeyedSubscript:@"type"]);
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = id v29 = v8;
      *(_DWORD *)buf = 138543874;
      __int16 v41 = v25;
      __int16 v42 = 2112;
      id v43 = v14;
      __int16 v44 = 2112;
      uint64_t v45 = v21;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Sending request, tid %@\n%@", buf, 0x20u);

      id v8 = v29;
    }

    userQueue = v23->_userQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_90;
    block[3] = &unk_264A2F2F8;
    void block[4] = v23;
    id v36 = v21;
    id v37 = v8;
    id v27 = v21;
    dispatch_async(userQueue, block);

    [(HMDSecureRemoteStreamInternal *)v23 _updateIdleTimer];
  }
  else
  {
    internalQueue = self->_internalQueue;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_2_91;
    void v32[3] = &unk_264A2DCF8;
    id v33 = v9;
    int v34 = -6700;
    dispatch_async(internalQueue, v32);
    uint64_t v17 = v33;
  }
}

uint64_t __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeTransaction:*(void *)(a1 + 40) response:0 options:0 status:4294960574];
}

uint64_t __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_90(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1[4] + 224) + 16))(*(void *)(a1[4] + 224), a1[5], a1[6]);
}

void __70__HMDSecureRemoteStreamInternal__sendRequest_options_responseHandler___block_invoke_2_91(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(int *)(a1 + 40);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F08410];
    uint64_t v12 = *MEMORY[0x263F08320];
    uint64_t v5 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v6 = (void *)v5;
    id v7 = @"?";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    v13[0] = v7;
    id v8 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v1 + 16);
    id v9 = [v3 errorWithDomain:v4 code:v2 userInfo:v8];
    (*(void (**)(uint64_t, void, void, void *))(v1 + 16))(v1, 0, 0, v9);
  }
  else
  {
    id v10 = *(void (**)(uint64_t, void, void, void))(v1 + 16);
    uint64_t v11 = *(void *)(a1 + 32);
    v10(v11, 0, 0, 0);
  }
}

- (void)_completeUserTransaction:(id)a3 response:(id)a4 options:(id)a5 status:(int)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v11 = a3;
  uint64_t v12 = (__CFString *)a4;
  id v43 = a5;
  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  dispatch_time_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = v12;
    HMFGetLogIdentifier();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      __int16 v41 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08410];
      uint64_t v49 = *MEMORY[0x263F08320];
      uint64_t v18 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v12 = (__CFString *)v18;
      uint64_t v19 = @"?";
      if (v18) {
        uint64_t v19 = (__CFString *)v18;
      }
      uint64_t v50 = v19;
      id v6 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      uint64_t v20 = [v41 errorWithDomain:v40 code:a6 userInfo:v6];
    }
    else
    {
      uint64_t v20 = 0;
    }
    uint64_t v21 = &stru_26E2EB898;
    *(_DWORD *)buf = 138544130;
    if (v16) {
      uint64_t v21 = v16;
    }
    id v52 = v17;
    __int16 v53 = 2112;
    id v54 = v11;
    __int16 v55 = 2112;
    __int16 v56 = v20;
    __int16 v57 = 2112;
    __int16 v58 = v21;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Completed user request, utid %@, status %@\n%@", buf, 0x2Au);
    if (a6)
    {
    }
    uint64_t v12 = v16;
  }

  uint64_t v22 = [(NSMutableArray *)v14->_userTransactions count];
  if (!v22)
  {
    uint64_t v25 = 0;
LABEL_24:
    id v36 = (void *)MEMORY[0x230FBD990]();
    id v37 = v14;
    __int16 v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v52 = v39;
      __int16 v53 = 2112;
      id v54 = v11;
      __int16 v55 = 2112;
      __int16 v56 = v12;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Missing, utid %@ for response %@", buf, 0x20u);
    }
    goto LABEL_27;
  }
  uint64_t v23 = v22;
  int v42 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  while (1)
  {
    id v26 = v25;
    uint64_t v25 = [(NSMutableArray *)v14->_userTransactions objectAtIndexedSubscript:v24];

    id v27 = [v25 objectForKeyedSubscript:@"utid"];
    char v28 = [v27 isEqual:v11];

    if (v28) {
      break;
    }
    if (v23 == ++v24) {
      goto LABEL_24;
    }
  }
  id v29 = v25;
  uint64_t v25 = v29;
  if (!v29) {
    goto LABEL_24;
  }
  uint64_t v30 = v12;
  id v31 = [v29 objectForKeyedSubscript:@"timer"];
  long long v32 = v31;
  if (v31) {
    dispatch_source_cancel(v31);
  }
  id v33 = [v25 objectForKeyedSubscript:@"responseHandler"];
  int v34 = v33;
  if (v33)
  {
    userQueue = v14->_userQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__HMDSecureRemoteStreamInternal__completeUserTransaction_response_options_status___block_invoke;
    block[3] = &unk_264A2DD20;
    id v47 = v33;
    uint64_t v45 = v30;
    id v46 = v43;
    int v48 = v42;
    dispatch_async(userQueue, block);
  }
  [(NSMutableArray *)v14->_userTransactions removeObjectAtIndex:v24];

  uint64_t v12 = v30;
LABEL_27:
}

void __82__HMDSecureRemoteStreamInternal__completeUserTransaction_response_options_status___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(int *)(a1 + 56);
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F08410];
    uint64_t v14 = *MEMORY[0x263F08320];
    uint64_t v7 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v8 = (void *)v7;
    id v9 = @"?";
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    v15[0] = v9;
    id v10 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, v1 + 16);
    id v11 = [v5 errorWithDomain:v6 code:v4 userInfo:v10];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v1 + 16))(v1, v3, v2, v11);
  }
  else
  {
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v1 + 16);
    uint64_t v13 = *(void *)(a1 + 48);
    v12(v13, v3, v2, 0);
  }
}

- (void)_sendUserRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  v55[5] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_started)
  {
    id v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v11 UUIDString];

    uint64_t v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue);
    if (v13)
    {
      uint64_t v14 = v13;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke;
      handler[3] = &unk_264A2F7F8;
      handler[4] = self;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_source_set_cancel_handler(v14, &__block_literal_global_62_258659);
      dispatch_time_t v15 = dispatch_walltime(0, self->_sendUserTimeoutNanos);
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, self->_sendUserTimeoutNanos / 0xA);
      dispatch_resume(v14);
      int v16 = (void *)[v10 copy];
      id v17 = v16;
      userTransactions = self->_userTransactions;
      v54[0] = @"options";
      v54[1] = @"request";
      id v19 = (id)MEMORY[0x263EFFA78];
      if (v9) {
        id v19 = v9;
      }
      v55[0] = v19;
      v55[1] = v8;
      v54[2] = @"responseHandler";
      uint64_t v20 = _Block_copy(v16);
      v55[2] = v20;
      v55[3] = v14;
      v54[3] = @"timer";
      v54[4] = @"utid";
      v55[4] = v12;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
      [(NSMutableArray *)userTransactions addObject:v21];

      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v49 = v25;
        __int16 v50 = 2112;
        __int16 v51 = v12;
        __int16 v52 = 2112;
        id v53 = v8;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Scheduled user request, utid %@\n%@", buf, 0x20u);
      }
      [(HMDSecureRemoteStreamInternal *)v23 _runStateMachine];

      goto LABEL_8;
    }
    int v26 = -6700;
  }
  else
  {
    uint64_t v12 = 0;
    int v26 = -6703;
  }
  id v27 = (void *)MEMORY[0x230FBD990]();
  char v28 = self;
  id v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = HMFGetLogIdentifier();
    id v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08410];
    __int16 v41 = v27;
    uint64_t v31 = v26;
    uint64_t v46 = *MEMORY[0x263F08320];
    uint64_t v32 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v33 = (void *)v32;
    int v34 = @"?";
    if (v32) {
      int v34 = (__CFString *)v32;
    }
    id v47 = v34;
    [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v35 = int v40 = v26;
    id v36 = [v39 errorWithDomain:v38 code:v31 userInfo:v35];
    *(_DWORD *)buf = 138543618;
    uint64_t v49 = v30;
    __int16 v50 = 2112;
    __int16 v51 = v36;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Send user request failed: %@", buf, 0x16u);

    id v27 = v41;
    int v26 = v40;
  }
  userQueue = v28->_userQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke_75;
  block[3] = &unk_264A2DCF8;
  id v43 = v10;
  int v44 = v26;
  dispatch_async(userQueue, block);
  uint64_t v14 = v43;
LABEL_8:
}

uint64_t __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop:4294960574];
}

void __74__HMDSecureRemoteStreamInternal__sendUserRequest_options_responseHandler___block_invoke_75(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(int *)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F08410];
    uint64_t v12 = *MEMORY[0x263F08320];
    uint64_t v5 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v6 = (void *)v5;
    uint64_t v7 = @"?";
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    v13[0] = v7;
    id v8 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v1 + 16);
    id v9 = [v3 errorWithDomain:v4 code:v2 userInfo:v8];
    (*(void (**)(uint64_t, void, void, void *))(v1 + 16))(v1, 0, 0, v9);
  }
  else
  {
    id v10 = *(void (**)(uint64_t, void, void, void))(v1 + 16);
    uint64_t v11 = *(void *)(a1 + 32);
    v10(v11, 0, 0, 0);
  }
}

- (void)sendRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __69__HMDSecureRemoteStreamInternal_sendRequest_options_responseHandler___block_invoke;
  v15[3] = &unk_264A2EE30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

uint64_t __69__HMDSecureRemoteStreamInternal_sendRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendUserRequest:*(void *)(a1 + 40) options:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
}

- (int)_updateIdleTimer
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  idleTimer = self->_idleTimer;
  uint64_t v4 = idleTimer;
  if (idleTimer)
  {
LABEL_4:
    if (self->_type == 1) {
      id v8 = &OBJC_IVAR___HMDSecureRemoteStreamInternal__clientIdleTimeoutNanos;
    }
    else {
      id v8 = &OBJC_IVAR___HMDSecureRemoteStreamInternal__serverIdleTimeoutNanos;
    }
    unint64_t v9 = *(unint64_t *)((char *)&self->super.super.isa + *v8);
    dispatch_time_t v10 = dispatch_walltime(0, v9);
    dispatch_source_set_timer(v4, v10, 0xFFFFFFFFFFFFFFFFLL, v9 / 0xA);
    if (!idleTimer) {
      dispatch_resume((dispatch_object_t)self->_idleTimer);
    }
    return 0;
  }
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue);
  uint64_t v6 = self->_idleTimer;
  self->_idleTimer = v5;

  uint64_t v7 = self->_idleTimer;
  if (v7)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __49__HMDSecureRemoteStreamInternal__updateIdleTimer__block_invoke;
    handler[3] = &unk_264A2F7F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_cancel_handler((dispatch_source_t)self->_idleTimer, &__block_literal_global_60_258663);
    uint64_t v4 = self->_idleTimer;
    goto LABEL_4;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    dispatch_time_t v15 = HMFGetLogIdentifier();
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v24 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v19 = (void *)v18;
    uint64_t v20 = @"?";
    if (v18) {
      uint64_t v20 = (__CFString *)v18;
    }
    uint64_t v25 = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v22 = [v16 errorWithDomain:v17 code:-6700 userInfo:v21];
    *(_DWORD *)buf = 138543618;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v22;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@idle timer failed: %@", buf, 0x16u);
  }
  return -6700;
}

uint64_t __49__HMDSecureRemoteStreamInternal__updateIdleTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop:4294960574];
}

- (int)_setupEncryption
{
  if (!self->_pairVerifySession) {
    return -6745;
  }
  int v3 = PairingSessionDeriveKey();
  if (!v3)
  {
    int v3 = PairingSessionDeriveKey();
    if (!v3)
    {
      *(void *)self->_cipherReadNonce = 0;
      *(void *)self->_cipherWriteNonce = 0;
    }
  }
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  return v3;
}

- (void)_runStateMachine
{
  if (self->_type == 1) {
    [(HMDSecureRemoteStreamInternal *)self _clientRunStateMachine];
  }
  else {
    [(HMDSecureRemoteStreamInternal *)self _serverRunStateMachine];
  }
}

- (void)_stop:(int)a3
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v77 = *MEMORY[0x263EF8340];
  BOOL started = self->_started;
  if (self->_started)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    unint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        id v53 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F08410];
        uint64_t v71 = *MEMORY[0x263F08320];
        uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
        int v3 = (void *)v11;
        id v12 = @"?";
        if (v11) {
          id v12 = (__CFString *)v11;
        }
        double v72 = v12;
        uint64_t v4 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        id v13 = [v53 errorWithDomain:v52 code:(int)v5 userInfo:v4];
      }
      else
      {
        id v13 = 0;
      }
      *(_DWORD *)buf = 138543618;
      id v74 = v10;
      __int16 v75 = 2112;
      v76 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Stopping: %@", buf, 0x16u);
      if (v5)
      {
      }
    }
  }
  self->_BOOL started = 0;
  if (self->_type == 1) {
    int v14 = 1;
  }
  else {
    int v14 = 11;
  }
  self->_int state = v14;
  userQueue = self->_userQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__HMDSecureRemoteStreamInternal__stop___block_invoke;
  block[3] = &unk_264A2DCD0;
  void block[4] = self;
  int v66 = v5;
  dispatch_async(userQueue, block);
  id v16 = self->_userQueue;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __39__HMDSecureRemoteStreamInternal__stop___block_invoke_2;
  v63[3] = &unk_264A2DCD0;
  v63[4] = self;
  int v64 = v5;
  dispatch_async(v16, v63);
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    uint64_t v18 = idleTimer;
    dispatch_source_cancel(v18);
    id v19 = self->_idleTimer;
    self->_idleTimer = 0;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v20 = [(NSMutableDictionary *)self->_prepareRequests allKeys];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id v23 = 0;
    int v3 = *(void **)v60;
    do
    {
      uint64_t v24 = 0;
      uint64_t v25 = v23;
      do
      {
        if (*(void **)v60 != v3) {
          objc_enumerationMutation(v20);
        }
        id v23 = *(id *)(*((void *)&v59 + 1) + 8 * v24);

        [(HMDSecureRemoteStreamInternal *)self _serverCompletePrepareRequest:v23];
        ++v24;
        uint64_t v25 = v23;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v22);
  }
  prepareRequests = self->_prepareRequests;
  self->_prepareRequests = 0;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v27 = [(NSMutableDictionary *)self->_transactions allKeys];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    id v30 = 0;
    int v3 = *(void **)v56;
    do
    {
      uint64_t v31 = 0;
      uint64_t v32 = v30;
      do
      {
        if (*(void **)v56 != v3) {
          objc_enumerationMutation(v27);
        }
        id v30 = *(id *)(*((void *)&v55 + 1) + 8 * v31);

        [(HMDSecureRemoteStreamInternal *)self _completeTransaction:v30 response:0 options:0 status:4294960544];
        ++v31;
        uint64_t v32 = v30;
      }
      while (v29 != v31);
      uint64_t v29 = [v27 countByEnumeratingWithState:&v55 objects:v69 count:16];
    }
    while (v29);
  }
  transactions = self->_transactions;
  self->_transactions = 0;

  uint64_t v34 = 176;
  uint64_t v35 = [(NSMutableArray *)self->_userTransactions firstObject];
  if (v35)
  {
    id v36 = (void *)v35;
    do
    {
      id v37 = [v36 objectForKeyedSubscript:@"utid"];
      [(HMDSecureRemoteStreamInternal *)self _completeUserTransaction:v37 response:0 options:0 status:v5];

      uint64_t v38 = [(NSMutableArray *)self->_userTransactions firstObject];

      id v36 = (void *)v38;
    }
    while (v38);
  }
  userTransactions = self->_userTransactions;
  self->_userTransactions = 0;

  memset_s(self->_cipherReadKey, 0x20uLL, 0, 0x20uLL);
  memset_s(self->_cipherWriteKey, 0x20uLL, 0, 0x20uLL);
  id internalRequestHandler = self->_internalRequestHandler;
  self->_id internalRequestHandler = 0;

  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  self->_pairVerifyDone = 0;
  sessionID = self->_sessionID;
  self->_sessionID = 0;

  if (started)
  {
    id v43 = (void *)MEMORY[0x230FBD990]();
    int v44 = self;
    uint64_t v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        id v47 = (void *)MEMORY[0x263F087E8];
        uint64_t v48 = *MEMORY[0x263F08410];
        uint64_t v67 = *MEMORY[0x263F08320];
        uint64_t v49 = [NSString stringWithUTF8String:DebugGetErrorString()];
        uint64_t v34 = v49;
        __int16 v50 = @"?";
        if (v49) {
          __int16 v50 = (__CFString *)v49;
        }
        v68 = v50;
        int v3 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        __int16 v51 = [v47 errorWithDomain:v48 code:(int)v5 userInfo:v3];
      }
      else
      {
        __int16 v51 = 0;
      }
      *(_DWORD *)buf = 138543618;
      id v74 = v46;
      __int16 v75 = 2112;
      v76 = v51;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_DEBUG, "%{public}@Stopped: %@", buf, 0x16u);
      if (v5)
      {
      }
    }
  }
}

void __39__HMDSecureRemoteStreamInternal__stop___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void (**)(void *, void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 208));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 208);
    *(void *)(v3 + 208) = 0;

    uint64_t v5 = *(int *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = *MEMORY[0x263F08410];
      uint64_t v13 = *MEMORY[0x263F08320];
      uint64_t v8 = [NSString stringWithUTF8String:DebugGetErrorString()];
      unint64_t v9 = (void *)v8;
      id v10 = @"?";
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      v14[0] = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v12 = [v6 errorWithDomain:v7 code:v5 userInfo:v11];
      v2[2](v2, v12);
    }
    else
    {
      v2[2](v2, 0);
    }
  }
}

void __39__HMDSecureRemoteStreamInternal__stop___block_invoke_2(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void (**)(void *, void))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 216));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 216);
    *(void *)(v3 + 216) = 0;

    int v5 = *(_DWORD *)(a1 + 40);
    if (v5) {
      BOOL v6 = v5 == -6752;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      v2[2](v2, 0);
    }
    else
    {
      uint64_t v7 = v5;
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08410];
      uint64_t v15 = *MEMORY[0x263F08320];
      uint64_t v10 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v11 = (void *)v10;
      id v12 = @"?";
      if (v10) {
        id v12 = (__CFString *)v10;
      }
      v16[0] = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      int v14 = [v8 errorWithDomain:v9 code:v7 userInfo:v13];
      ((void (**)(void *, void *))v2)[2](v2, v14);
    }
  }
}

- (void)stop
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMDSecureRemoteStreamInternal_stop__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __37__HMDSecureRemoteStreamInternal_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop:4294960544];
}

- (void)_start
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  BOOL started = self->_started;
  if (!self->_started)
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    int v5 = self;
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Starting", buf, 0xCu);
    }
    self->_BOOL started = 1;
  }
  int state = self->_state;
  if (state == 11 || state == 1)
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Start failed, attempt to restart session", buf, 0xCu);
    }
    uint64_t v14 = 4294960593;
    goto LABEL_13;
  }
  if (!self->_transportSendMessage) {
    goto LABEL_38;
  }
  sessionID = self->_sessionID;
  self->_sessionID = 0;

  int64_t type = self->_type;
  if (type == 2)
  {
    if (self->_requestHandler)
    {
      int v31 = 10;
      goto LABEL_25;
    }
LABEL_38:
    uint64_t v14 = 4294960551;
    goto LABEL_13;
  }
  if (type != 1)
  {
    uint64_t v14 = 4294960591;
    goto LABEL_13;
  }
  uint64_t v28 = [MEMORY[0x263F08C38] UUID];
  uint64_t v29 = [v28 UUIDString];
  id v30 = self->_sessionID;
  self->_sessionID = v29;

  int v31 = 0;
LABEL_25:
  self->_int state = v31;
  if (!self->_prepareRequests)
  {
    uint64_t v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    prepareRequests = self->_prepareRequests;
    self->_prepareRequests = v32;
  }
  if (!self->_transactions)
  {
    uint64_t v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    transactions = self->_transactions;
    self->_transactions = v34;
  }
  if (!self->_userTransactions)
  {
    id v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    userTransactions = self->_userTransactions;
    self->_userTransactions = v36;
  }
  uint64_t v14 = [(HMDSecureRemoteStreamInternal *)self _updateIdleTimer];
  if (!v14)
  {
    if (!started)
    {
      uint64_t v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = self;
      int v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        __int16 v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v41;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Started", buf, 0xCu);
      }
    }
    [(HMDSecureRemoteStreamInternal *)self _runStateMachine];
    return;
  }
LABEL_13:
  uint64_t v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08410];
    uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorString(), *MEMORY[0x263F08320]);
    uint64_t v22 = (void *)v21;
    id v23 = @"?";
    if (v21) {
      id v23 = (__CFString *)v21;
    }
    id v43 = v23;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v25 = [v19 errorWithDomain:v20 code:(int)v14 userInfo:v24];
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = v18;
    __int16 v46 = 2112;
    id v47 = v25;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Start failed: %@", buf, 0x16u);
  }
  [(HMDSecureRemoteStreamInternal *)v16 _stop:v14];
}

- (void)start
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HMDSecureRemoteStreamInternal_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __38__HMDSecureRemoteStreamInternal_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (double)requestTimeout
{
  return (double)self->_sendInternalTimeoutNanos / 1000000000.0;
}

- (void)dealloc
{
  internalQueue = self->_internalQueue;
  if (internalQueue)
  {
    self->_internalQueue = 0;
  }
  id requestHandler = self->_requestHandler;
  self->_id requestHandler = 0;

  id startedHandler = self->_startedHandler;
  self->_id startedHandler = 0;

  id stoppedHandler = self->_stoppedHandler;
  self->_id stoppedHandler = 0;

  id transportSendMessage = self->_transportSendMessage;
  self->_id transportSendMessage = 0;

  userQueue = self->_userQueue;
  if (userQueue)
  {
    self->_userQueue = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)HMDSecureRemoteStreamInternal;
  [(HMDSecureRemoteStreamInternal *)&v9 dealloc];
}

- (HMDSecureRemoteStreamInternal)initWithType:(int64_t)a3 commitTimeout:(unint64_t)a4 clientIdleTimeout:(unint64_t)a5 serverIdleTimeout:(unint64_t)a6 sendInternalTimeout:(unint64_t)a7 sendUserTimeout:(unint64_t)a8
{
  v27.receiver = self;
  v27.super_class = (Class)HMDSecureRemoteStreamInternal;
  uint64_t v14 = [(HMDSecureRemoteStreamInternal *)&v27 init];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      int v16 = 10;
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v25 = 0;
    goto LABEL_11;
  }
  int v16 = 0;
LABEL_6:
  v14->_int state = v16;
  v14->_int64_t type = a3;
  if (initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_t0 != -1) {
    dispatch_once(&initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_t0, &__block_literal_global_258679);
  }
  uint64_t v17 = NSString;
  uint64_t v18 = (id)initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_v1;
  objc_msgSend(v17, "stringWithFormat:", @"HMDSecureRemoteStream.Internal.%tu", -[HMDSecureRemoteStreamInternal hash](v15, "hash"));
  id v19 = objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (const char *)[v19 UTF8String];
  uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v22 = dispatch_queue_create_with_target_V2(v20, v21, v18);
  internalQueue = v15->_internalQueue;
  v15->_internalQueue = (OS_dispatch_queue *)v22;

  uint64_t v24 = v15->_internalQueue;
  if (!v24) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v15->_userQueue, MEMORY[0x263EF83A0]);
  v15->_commitTimeoutNanos = a4;
  v15->_clientIdleTimeoutNanos = a5;
  v15->_serverIdleTimeoutNanos = a6;
  v15->_uint64_t sendInternalTimeoutNanos = a7;
  v15->_sendUserTimeoutNanos = a8;
  uint64_t v25 = v15;
LABEL_11:

  return v25;
}

void __132__HMDSecureRemoteStreamInternal_initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("HMDSecureRemoteStream.Internal");
  uint64_t v1 = (void *)initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_v1;
  initWithType_commitTimeout_clientIdleTimeout_serverIdleTimeout_sendInternalTimeout_sendUserTimeout___hmf_once_uint64_t v1 = (uint64_t)v0;
}

- (HMDSecureRemoteStreamInternal)init
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t49_258692 != -1) {
    dispatch_once(&logCategory__hmf_once_t49_258692, &__block_literal_global_133_258693);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v50_258694;
  return v2;
}

void __44__HMDSecureRemoteStreamInternal_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v50_258694;
  logCategory__hmf_once_v50_258694 = v0;
}

@end