@interface FMNanoIDSManager
- (BOOL)_checkMinVersionDeviceID:(id)a3;
- (BOOL)cancelMessageWithId:(id)a3;
- (FMNanoIDSManager)initWithServiceId:(id)a3 minimumVersion:(int64_t)a4;
- (IDSService)service;
- (NSArray)devices;
- (NSMutableDictionary)outstandingRequests;
- (NSMutableDictionary)registeredRequestHandlers;
- (NSString)serviceId;
- (OS_dispatch_queue)outstandingRequestsModQueue;
- (id)_sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8 responseHandler:(id)a9;
- (id)_sendProtobuf:(id)a3 priority:(int64_t)a4 responseIdentifier:(id)a5 expectsResponse:(BOOL)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8;
- (unsigned)minVersion;
- (void)handleRequestsOfType:(unsigned __int16)a3 withHandler:(id)a4;
- (void)sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8 requestAcceptedHandler:(id)a9 responseHandler:(id)a10;
- (void)sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 requestAcceptedHandler:(id)a8 responseHandler:(id)a9;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setMinVersion:(unsigned int)a3;
- (void)setOutstandingRequests:(id)a3;
- (void)setOutstandingRequestsModQueue:(id)a3;
- (void)setRegisteredRequestHandlers:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceId:(id)a3;
- (void)start;
@end

@implementation FMNanoIDSManager

- (FMNanoIDSManager)initWithServiceId:(id)a3 minimumVersion:(int64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMNanoIDSManager;
  v8 = [(FMNanoIDSManager *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceId, a3);
    if ((unint64_t)a4 <= 4) {
      v9->_minVersion = dword_1D0EDDC58[a4];
    }
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    outstandingRequests = v9->_outstandingRequests;
    v9->_outstandingRequests = (NSMutableDictionary *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.icloud.fmcore.nano_ids_mod_queue", 0);
    outstandingRequestsModQueue = v9->_outstandingRequestsModQueue;
    v9->_outstandingRequestsModQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    registeredRequestHandlers = v9->_registeredRequestHandlers;
    v9->_registeredRequestHandlers = (NSMutableDictionary *)v14;
  }
  return v9;
}

- (void)start
{
  v3 = [(FMNanoIDSManager *)self service];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6AB90]);
    v5 = [(FMNanoIDSManager *)self serviceId];
    v6 = (void *)[v4 initWithService:v5];
    [(FMNanoIDSManager *)self setService:v6];

    id v7 = [(FMNanoIDSManager *)self service];
    [v7 addDelegate:self queue:MEMORY[0x1E4F14428]];
  }
}

- (NSArray)devices
{
  v2 = [(FMNanoIDSManager *)self service];
  v3 = [v2 devices];

  return (NSArray *)v3;
}

- (void)sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 requestAcceptedHandler:(id)a8 responseHandler:(id)a9
{
}

- (void)sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8 requestAcceptedHandler:(id)a9 responseHandler:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v22 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __147__FMNanoIDSManager_sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_requestAcceptedHandler_responseHandler___block_invoke;
  block[3] = &unk_1E689E898;
  block[4] = self;
  id v29 = v19;
  id v33 = v20;
  int64_t v34 = a5;
  id v30 = v17;
  id v31 = v18;
  double v35 = a6;
  BOOL v36 = a7;
  id v32 = v21;
  id v23 = v20;
  id v24 = v18;
  id v25 = v17;
  id v26 = v21;
  id v27 = v19;
  dispatch_async(v22, block);
}

void __147__FMNanoIDSManager_sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_requestAcceptedHandler_responseHandler___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _checkMinVersionDeviceID:*(void *)(a1 + 40)])
  {
    unint64_t v2 = *(void *)(a1 + 80);
    if (v2 > 2) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_1D0EDDC70[v2];
    }
    uint64_t v8 = [*(id *)(a1 + 32) _sendMessageWithProtobuf:*(void *)(a1 + 48) inResponseToRequest:*(void *)(a1 + 56) withPriority:v3 timeout:*(unsigned __int8 *)(a1 + 96) bypassingDuet:*(void *)(a1 + 40) deviceID:*(void *)(a1 + 64) responseHandler:*(double *)(a1 + 88)];
    uint64_t v9 = *(void *)(a1 + 72);
    if (v9 && v8) {
      (*(void (**)(void))(v9 + 16))();
    }
    MEMORY[0x1F41817F8]();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28588];
      v11[0] = @"Min Version check failed";
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      id v7 = [v5 errorWithDomain:@"com.apple.icloud.FMCore" code:0 userInfo:v6];
      (*(void (**)(uint64_t, void, void, void, void *))(v4 + 16))(v4, 0, 0, 0, v7);
    }
  }
}

- (id)_sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8 responseHandler:(id)a9
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  uint64_t v20 = [(FMNanoIDSManager *)self _sendProtobuf:v16 priority:a5 responseIdentifier:v17 expectsResponse:v19 != 0 bypassingDuet:v11 deviceID:v18];
  id v21 = (void *)v20;
  if (v19 && v20)
  {
    v22 = objc_alloc_init(FMNanoIDSRequest);
    id v23 = (void *)[v19 copy];
    [(FMNanoIDSRequest *)v22 setResponseHandler:v23];

    [(FMNanoIDSRequest *)v22 setIdsMessageID:v21];
    id v24 = &off_1D0EDD000;
    if (a6 <= 0.0)
    {
      id v27 = 0;
    }
    else
    {
      objc_initWeak(&location, self);
      id v25 = [FMDispatchTimer alloc];
      id v26 = dispatch_get_global_queue(0, 0);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke;
      v34[3] = &unk_1E689E8C0;
      objc_copyWeak(&v37, &location);
      id v35 = v21;
      id v36 = v19;
      id v27 = [(FMDispatchTimer *)v25 initWithQueue:v26 timeout:v34 completion:a6];

      [(FMNanoIDSRequest *)v22 setTimer:v27];
      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
      id v24 = &off_1D0EDD000;
    }
    v28 = [(FMNanoIDSManager *)self outstandingRequestsModQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = *((void *)v24 + 383);
    block[2] = __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke_2;
    block[3] = &unk_1E689E8E8;
    block[4] = self;
    id v32 = v21;
    id v33 = v22;
    id v29 = v22;
    dispatch_sync(v28, block);

    [(FMDispatchTimer *)v27 start];
  }

  return v21;
}

void __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained cancelMessageWithId:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void, uint64_t, void, void))(v2 + 16))(v2, 0, 1, 0, 0);
  }
}

void __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) outstandingRequests];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)cancelMessageWithId:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1D0EC4000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling message with ID %@", buf, 0xCu);
  }

  v6 = [(FMNanoIDSManager *)self outstandingRequests];
  id v7 = [v6 objectForKeyedSubscript:v4];

  uint64_t v8 = [v7 timer];
  [v8 cancel];

  uint64_t v9 = LogCategory_Unspecified();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"YES";
    if (!v7) {
      uint64_t v10 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1D0EC4000, v9, OS_LOG_TYPE_DEFAULT, "Did find outstanding message to cancel with ID %@ : %@", buf, 0x16u);
  }

  BOOL v11 = [(FMNanoIDSManager *)self service];
  id v18 = 0;
  [v11 cancelIdentifier:v4 error:&v18];
  id v12 = v18;

  v13 = [(FMNanoIDSManager *)self outstandingRequestsModQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FMNanoIDSManager_cancelMessageWithId___block_invoke;
  block[3] = &unk_1E689E690;
  block[4] = self;
  id v17 = v4;
  id v14 = v4;
  dispatch_sync(v13, block);

  return v7 != 0;
}

void __40__FMNanoIDSManager_cancelMessageWithId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outstandingRequests];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)handleRequestsOfType:(unsigned __int16)a3 withHandler:(id)a4
{
  uint64_t v4 = a3;
  id v9 = (id)[a4 copy];
  v6 = (void *)MEMORY[0x1D25F2CB0]();
  id v7 = [(FMNanoIDSManager *)self registeredRequestHandlers];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v4];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  *(void *)&v37[5] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v13 = [v12 incomingResponseIdentifier];
  id v14 = LogCategory_Unspecified();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v37[0] = [v10 type];
    LOWORD(v37[1]) = 2112;
    *(void *)((char *)&v37[1] + 2) = v13;
    _os_log_impl(&dword_1D0EC4000, v14, OS_LOG_TYPE_DEFAULT, "Received request of type %d with message ID %@", buf, 0x12u);
  }

  if (!v13)
  {
    __int16 v21 = [(FMNanoIDSManager *)self registeredRequestHandlers];
    v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", objc_msgSend(v10, "type"));
    id v16 = [v21 objectForKeyedSubscript:v22];

    if (v16)
    {
      uint64_t v23 = dispatch_get_global_queue(21, 0);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke_45;
      v29[3] = &unk_1E689E910;
      id v33 = v16;
      v29[4] = self;
      id v30 = v10;
      id v31 = v12;
      id v32 = v11;
      dispatch_async(v23, v29);

      id v24 = v33;
    }
    else
    {
      id v24 = LogCategory_Unspecified();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = [v10 type];
        *(_DWORD *)buf = 67109120;
        v37[0] = v28;
        id v25 = "No handler found for request of type %d. Ignoring the request...";
        id v26 = v24;
        uint32_t v27 = 8;
        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v15 = [(FMNanoIDSManager *)self outstandingRequests];
  id v16 = [v15 objectForKeyedSubscript:v13];

  if (!v16)
  {
    id v24 = LogCategory_Unspecified();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v37 = v13;
      id v25 = "No outstanding request with message ID %@";
      id v26 = v24;
      uint32_t v27 = 12;
LABEL_14:
      _os_log_impl(&dword_1D0EC4000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  id v17 = [v16 timer];
  [v17 cancel];

  id v18 = [(FMNanoIDSManager *)self outstandingRequestsModQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
  block[3] = &unk_1E689E690;
  block[4] = self;
  id v35 = v13;
  dispatch_sync(v18, block);

  id v19 = [v16 responseHandler];

  if (v19)
  {
    id v20 = [v16 responseHandler];
    ((void (**)(void, id, void, id, void))v20)[2](v20, v10, 0, v11, 0);
  }
LABEL_16:
}

void __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outstandingRequests];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke_45(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) outgoingResponseIdentifier];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, void))(v2 + 16))(v2, v3, v4, v5, *(void *)(a1 + 56));
}

- (id)_sendProtobuf:(id)a3 priority:(int64_t)a4 responseIdentifier:(id)a5 expectsResponse:(BOOL)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  id v18 = v17;
  if (v15) {
    [v17 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F6A9D8]];
  }
  if (v10) {
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A998]];
  }
  if (v9) {
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6A968]];
  }
  if (v16) {
    id v19 = v16;
  }
  else {
    id v19 = (id)*MEMORY[0x1E4F6ADA8];
  }
  id v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v19];
  __int16 v21 = [(FMNanoIDSManager *)self service];
  id v30 = 0;
  id v31 = 0;
  char v22 = [v21 sendProtobuf:v14 toDestinations:v20 priority:a4 options:v18 identifier:&v31 error:&v30];
  id v23 = v31;
  id v24 = v30;

  id v25 = LogCategory_Unspecified();
  id v26 = v25;
  if ((v22 & 1) != 0 || !v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [v14 type];
      *(_DWORD *)buf = 138412802;
      id v33 = v20;
      __int16 v34 = 1024;
      int v35 = v28;
      __int16 v36 = 2112;
      id v37 = v23;
      _os_log_impl(&dword_1D0EC4000, v26, OS_LOG_TYPE_DEFAULT, "Sent message to %@ of type %d with id %@", buf, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int v27 = [v14 type];
    *(_DWORD *)buf = 138412802;
    id v33 = v20;
    __int16 v34 = 1024;
    int v35 = v27;
    __int16 v36 = 2112;
    id v37 = v24;
    _os_log_error_impl(&dword_1D0EC4000, v26, OS_LOG_TYPE_ERROR, "Error sending the message to %@ of type %d : %@", buf, 0x1Cu);
  }

  return v23;
}

- (BOOL)_checkMinVersionDeviceID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  if (v4)
  {
    id v5 = [(FMNanoIDSManager *)self devices];
    v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FMNanoIDSManager _checkMinVersionDeviceID:](v6);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke;
    v17[3] = &unk_1E689E938;
    id v18 = v4;
    id v19 = &v20;
    [v5 enumerateObjectsUsingBlock:v17];
    id v7 = v18;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F79EF0] sharedInstance];
    uint64_t v8 = [v5 getActivePairedDevice];
    id v7 = (void *)v21[5];
    v21[5] = v8;
  }

  if (v21[5])
  {
    unsigned int v9 = NRWatchOSVersionForRemoteDevice();
    if (v9 >= [(FMNanoIDSManager *)self minVersion])
    {
      BOOL v15 = 1;
      goto LABEL_15;
    }
    BOOL v10 = LogCategory_Unspecified();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [(FMNanoIDSManager *)self minVersion];
      *(_DWORD *)buf = 67109376;
      unsigned int v27 = v9;
      __int16 v28 = 1024;
      unsigned int v29 = v11;
      id v12 = "Paired device version %X is older the minuimum supported version %X";
      v13 = v10;
      uint32_t v14 = 14;
LABEL_12:
      _os_log_impl(&dword_1D0EC4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    BOOL v10 = LogCategory_Unspecified();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v12 = "No paired device version found";
      v13 = v10;
      uint32_t v14 = 2;
      goto LABEL_12;
    }
  }

  BOOL v15 = 0;
LABEL_15:
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = (void *)IDSCopyIDForDevice();
  uint64_t v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke_cold_1((uint64_t)v7, a1, v8);
  }

  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    unsigned int v9 = [MEMORY[0x1E4F79EF0] sharedInstance];
    uint64_t v10 = [v9 deviceForIDSDevice:v6];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
}

- (unsigned)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(unsigned int)a3
{
  self->_minVersion = a3;
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
}

- (NSMutableDictionary)registeredRequestHandlers
{
  return self->_registeredRequestHandlers;
}

- (void)setRegisteredRequestHandlers:(id)a3
{
}

- (OS_dispatch_queue)outstandingRequestsModQueue
{
  return self->_outstandingRequestsModQueue;
}

- (void)setOutstandingRequestsModQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequestsModQueue, 0);
  objc_storeStrong((id *)&self->_registeredRequestHandlers, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_checkMinVersionDeviceID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "Scanning through paired IDS devices to validate min version.", v1, 2u);
}

void __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "Comparing %@ to %@ IDS identifiers", (uint8_t *)&v4, 0x16u);
}

@end