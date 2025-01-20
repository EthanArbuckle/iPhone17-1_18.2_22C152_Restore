@interface ATConcreteMessageLink
- (ATConcreteMessageLink)initWithSocket:(id)a3;
- (ATSignatureProvider)signatureProvider;
- (ATSocket)socket;
- (BOOL)_isWriterPendingStopForforMessage:(id)a3;
- (BOOL)_sendMessage:(id)a3 error:(id *)a4;
- (BOOL)idleTimeoutEnabled;
- (BOOL)isInitialized;
- (BOOL)isOpen;
- (BOOL)open;
- (NSHashTable)observers;
- (NSString)description;
- (NSString)guid;
- (NSString)identifier;
- (double)lastActivityTime;
- (id)_getObservers;
- (int)endpointType;
- (unsigned)_nextRequestID;
- (void)_checkMessageTimeouts;
- (void)_invokeCompletionHandlerForResponseID:(unint64_t)a3 withError:(id)a4;
- (void)_prepareStreamReaderForMessage:(id)a3 withProgress:(id)a4;
- (void)_processIncomingDataRequest:(id)a3;
- (void)_processIncomingDataResponse:(id)a3;
- (void)_processIncomingMessage:(id)a3;
- (void)_processIncomingPartialResponse:(id)a3;
- (void)_processIncomingRequest:(id)a3;
- (void)_processIncomingResponse:(id)a3;
- (void)_stopWriter:(id)a3 byInjectingStreamError:(id *)a4 forMessageId:(unsigned int)a5 type:(int)a6;
- (void)addKeepAliveException;
- (void)addObserver:(id)a3;
- (void)addRequestHandler:(id)a3 forDataClass:(id)a4;
- (void)addTimeoutException;
- (void)close;
- (void)dealloc;
- (void)removeKeepAliveException;
- (void)removeObserver:(id)a3;
- (void)removeRequestHandlerForDataClass:(id)a3;
- (void)removeTimeoutException;
- (void)sendPartialResponse:(id)a3 withCompletion:(id)a4;
- (void)sendRequest:(id)a3 withCompletion:(id)a4;
- (void)sendResponse:(id)a3 withCompletion:(id)a4;
- (void)sendResponse:(id)a3 withProgress:(id)a4 completion:(id)a5;
- (void)setEndpointType:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setLastActivityTime:(double)a3;
- (void)setObservers:(id)a3;
- (void)setSignatureProvider:(id)a3;
- (void)socket:(id)a3 hasDataAvailable:(const char *)a4 length:(int64_t)a5;
- (void)socketDidClose:(id)a3;
@end

@implementation ATConcreteMessageLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_signatureProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_stopReadersAndWritersGroup, 0);
  objc_storeStrong((id *)&self->_handlerAccessQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_requestHandlersByDataClass, 0);
  objc_storeStrong((id *)&self->_requestReadersPendingStopByID, 0);
  objc_storeStrong((id *)&self->_responseWritersPendingStopByID, 0);
  objc_storeStrong((id *)&self->_requestWritersPendingStopByID, 0);
  objc_storeStrong((id *)&self->_streamReadersByID, 0);
  objc_storeStrong((id *)&self->_responseWritersByID, 0);
  objc_storeStrong((id *)&self->_requestWritersByID, 0);
  objc_storeStrong((id *)&self->_completionHandlersByResponseID, 0);
  objc_storeStrong((id *)&self->_completionHandlersByRequestID, 0);
  objc_storeStrong((id *)&self->_receivedResponsesByID, 0);
  objc_storeStrong((id *)&self->_receivedRequestsByID, 0);
  objc_storeStrong((id *)&self->_sentRequestsByID, 0);
  objc_storeStrong((id *)&self->_outputStreamsToInputStreams, 0);
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong((id *)&self->_socket, 0);
}

- (NSString)guid
{
  return self->_guid;
}

- (ATSocket)socket
{
  return self->_socket;
}

- (void)setLastActivityTime:(double)a3
{
  self->_lastActivityTime = a3;
}

- (double)lastActivityTime
{
  return self->_lastActivityTime;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setSignatureProvider:(id)a3
{
}

- (ATSignatureProvider)signatureProvider
{
  return self->_signatureProvider;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BOOL)_isWriterPendingStopForforMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 messageType];
  if (v5 > 4)
  {
    char v9 = 0;
  }
  else
  {
    if (((1 << v5) & 0x16) != 0) {
      uint64_t v6 = 104;
    }
    else {
      uint64_t v6 = 96;
    }
    v7 = *(Class *)((char *)&self->super.super.isa + v6);
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
    char v9 = [v7 containsObject:v8];
  }
  return v9;
}

- (void)_stopWriter:(id)a3 byInjectingStreamError:(id *)a4 forMessageId:(unsigned int)a5 type:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (a6 > 4)
  {
    v13 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v42 = self;
      __int16 v43 = 1024;
      int v44 = v7;
      __int16 v45 = 1024;
      LODWORD(v46) = a6;
      v14 = "%{public}@ Cannot stop writer for invalid message ID %d, type %d";
      v17 = v13;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 24;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (((1 << a6) & 0x16) != 0)
  {
    responseWritersPendingStopByID = self->_responseWritersPendingStopByID;
    v12 = [NSNumber numberWithUnsignedInt:v7];
    LOBYTE(responseWritersPendingStopByID) = [(NSMutableSet *)responseWritersPendingStopByID containsObject:v12];

    if (responseWritersPendingStopByID)
    {
      v13 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v42 = self;
        __int16 v43 = 1024;
        int v44 = v7;
        v14 = "%{public}@ Response writer for ID %d is already pending stop";
LABEL_9:
        v17 = v13;
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        uint32_t v19 = 18;
LABEL_17:
        _os_log_impl(&dword_1D9BC7000, v17, v18, v14, buf, v19);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    v20 = self->_responseWritersPendingStopByID;
    v21 = [NSNumber numberWithUnsignedInt:v7];
    [(NSMutableSet *)v20 addObject:v21];

    v22 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_responseWritersPendingStopByID;
      *(_DWORD *)buf = 138544130;
      v42 = self;
      __int16 v43 = 1024;
      int v44 = v7;
      __int16 v45 = 2048;
      v46 = a4;
      __int16 v47 = 2114;
      v48 = v23;
      _os_log_impl(&dword_1D9BC7000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping response writer for ID %d, error=%p, _requestWritersPendingStopByID=%{public}@", buf, 0x26u);
    }

    if (a4) {
      objc_msgSend(v10, "writeStreamError:", a4->var0, *(void *)&a4->var1);
    }
    dispatch_group_enter((dispatch_group_t)self->_stopReadersAndWritersGroup);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke_89;
    v32 = &unk_1E6B8C2E8;
    v33 = self;
    LODWORD(v34) = v7;
    v24 = &v29;
LABEL_24:
    objc_msgSend(v10, "stopWithCompletion:", v24, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_25;
  }
  requestWritersPendingStopByID = self->_requestWritersPendingStopByID;
  v16 = [NSNumber numberWithUnsignedInt:v7];
  LOBYTE(requestWritersPendingStopByID) = [(NSMutableSet *)requestWritersPendingStopByID containsObject:v16];

  if ((requestWritersPendingStopByID & 1) == 0)
  {
    v25 = self->_requestWritersPendingStopByID;
    v26 = [NSNumber numberWithUnsignedInt:v7];
    [(NSMutableSet *)v25 addObject:v26];

    v27 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_requestWritersPendingStopByID;
      *(_DWORD *)buf = 138544130;
      v42 = self;
      __int16 v43 = 1024;
      int v44 = v7;
      __int16 v45 = 2048;
      v46 = a4;
      __int16 v47 = 2114;
      v48 = v28;
      _os_log_impl(&dword_1D9BC7000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping request writer for ID %d, error=%p, _requestWritersPendingStopByID=%{public}@", buf, 0x26u);
    }

    if (a4) {
      objc_msgSend(v10, "writeStreamError:", a4->var0, *(void *)&a4->var1);
    }
    dispatch_group_enter((dispatch_group_t)self->_stopReadersAndWritersGroup);
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke;
    v38 = &unk_1E6B8C2E8;
    v39 = self;
    LODWORD(v40) = v7;
    v24 = &v35;
    goto LABEL_24;
  }
  v13 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = self;
    __int16 v43 = 1024;
    int v44 = v7;
    v14 = "%{public}@ Request writer for ID %d is already pending stop";
    goto LABEL_9;
  }
LABEL_18:

LABEL_25:
}

void __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 144));
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Writer for request ID %d was stopped successfully - removing from our collection", (uint8_t *)&v9, 0x12u);
  }

  unsigned int v5 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v5 removeObjectForKey:v6];

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 96);
  v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v7 removeObject:v8];

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 168));
}

void __78__ATConcreteMessageLink__stopWriter_byInjectingStreamError_forMessageId_type___block_invoke_89(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 144));
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Writer for response ID %d was stopped successfully - removing from our collection", (uint8_t *)&v9, 0x12u);
  }

  unsigned int v5 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v5 removeObjectForKey:v6];

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 104);
  v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v7 removeObject:v8];

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 168));
}

- (id)_getObservers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__1524;
  uint64_t v13 = __Block_byref_object_dispose__1525;
  id v14 = 0;
  handlerAccessQueue = self->_handlerAccessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__ATConcreteMessageLink__getObservers__block_invoke;
  v8[3] = &unk_1E6B8C490;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(handlerAccessQueue, v8);
  int v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(id)v10[5] count];
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Returning %d observers", buf, 0x12u);
  }

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __38__ATConcreteMessageLink__getObservers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 128) copy];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)_sendMessage:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ATConcreteMessageLink *)self socket];
  char v8 = [v7 isOpen];

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      +[ATInternalError errorWithCode:3 format:@"underlying socket for link closed"];
      BOOL v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v16 = 0;
    }
    goto LABEL_23;
  }
  self->_lastActivityTime = CFAbsoluteTimeGetCurrent();
  if (![v6 messageType]
    || [v6 messageType] == 1
    || [v6 messageType] == 2)
  {
    uint64_t v9 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      uint64_t v10 = [v6 formattedDescription];
      *(_DWORD *)v20 = 138543618;
      *(void *)&v20[4] = self;
      *(_WORD *)&v20[12] = 2114;
      *(void *)&v20[14] = v10;
      _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ ---> %{public}@", v20, 0x16u);
    }
  }
  else
  {
    if ([v6 hasAdditionalPayload]) {
      goto LABEL_8;
    }
    uint64_t v9 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
  }

LABEL_8:
  uint64_t v11 = objc_msgSend(v6, "data", *(_OWORD *)v20, *(void *)&v20[16], v21);
  [v11 length];
  uint64_t v12 = PBDataWriterWriteBareVarint();
  uint64_t v13 = objc_opt_new();
  [v13 appendBytes:v20 length:v12];
  [v13 appendData:v11];
  id v14 = [(ATConcreteMessageLink *)self socket];
  char v15 = [v14 writeAllData:v13 error:a4];

  if (v15)
  {
    if ([v6 hasAdditionalPayload])
    {
      BOOL v16 = 1;
    }
    else
    {
      __int16 v17 = [(ATConcreteMessageLink *)self socket];
      int v18 = [v17 flush];

      BOOL v16 = v18 == 0;
      if (a4 && v18) {
        *a4 = v18;
      }
    }
  }
  else
  {
    if (a4 && !*a4)
    {
      *a4 = +[ATInternalError errorWithCode:3 format:@"failed to write message to socket"];
    }
    [(ATConcreteMessageLink *)self close];
    BOOL v16 = 0;
  }

LABEL_23:
  return v16;
}

- (void)_checkMessageTimeouts
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v70 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking for message timeouts ....", buf, 0xCu);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  int v5 = [(NSMutableDictionary *)self->_sentRequestsByID allKeys];
  id v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    *(_DWORD *)buf = 138543618;
    v70 = self;
    __int16 v71 = 2048;
    double v72 = *(double *)&v7;
    _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sentRequestIds count=%lu ....", buf, 0x16u);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_sentRequestsByID objectForKey:v12];
        [v13 timestamp];
        if (Current - v14 > 45.0)
        {
          char v15 = _ATLogCategoryFramework();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v70 = self;
            __int16 v71 = 2114;
            double v72 = *(double *)&v13;
            _os_log_impl(&dword_1D9BC7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Timing out sent request %{public}@", buf, 0x16u);
          }

          BOOL v16 = [(NSMutableDictionary *)self->_streamReadersByID objectForKey:v12];
          __int16 v17 = v16;
          if (v16)
          {
            int v18 = [v16 didEncounterErrorBlock];
            uint64_t v19 = +[ATInternalError errorWithCode:2 format:@"request timed out"];
            ((void (**)(void, void *))v18)[2](v18, v19);
          }
          [(NSMutableDictionary *)self->_sentRequestsByID removeObjectForKey:v12];
          v20 = [(NSMutableDictionary *)self->_completionHandlersByRequestID objectForKey:v12];
          if (v20)
          {
            [(NSMutableDictionary *)self->_completionHandlersByRequestID removeObjectForKey:v12];
            uint64_t v21 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = [v12 longLongValue];
              *(_DWORD *)buf = 138543618;
              v70 = self;
              __int16 v71 = 2048;
              double v72 = *(double *)&v22;
              _os_log_impl(&dword_1D9BC7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Calling completion block for timed out messgage if %lld", buf, 0x16u);
            }

            callbackQueue = self->_callbackQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke;
            block[3] = &unk_1E6B8C1A8;
            id v64 = v20;
            id v63 = v13;
            dispatch_async(callbackQueue, block);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
    }
    while (v9);
  }

  v24 = _ATLogCategoryFramework_Oversize();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    streamReadersByID = self->_streamReadersByID;
    *(_DWORD *)buf = 138543618;
    v70 = self;
    __int16 v71 = 2114;
    double v72 = *(double *)&streamReadersByID;
    _os_log_impl(&dword_1D9BC7000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping remaining readers %{public}@", buf, 0x16u);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v26 = [(NSMutableDictionary *)self->_streamReadersByID allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v80 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = [(NSMutableDictionary *)self->_streamReadersByID objectForKey:*(void *)(*((void *)&v58 + 1) + 8 * j)];
        [v31 timestamp];
        if (Current - v32 > 300.0)
        {
          queue = self->_queue;
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_76;
          v56[3] = &unk_1E6B8C468;
          id v57 = v31;
          dispatch_async(queue, v56);
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v80 count:16];
    }
    while (v28);
  }

  uint64_t v34 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = [(NSMutableDictionary *)self->_receivedRequestsByID count];
    *(_DWORD *)buf = 138543618;
    v70 = self;
    __int16 v71 = 2048;
    double v72 = *(double *)&v35;
    _os_log_impl(&dword_1D9BC7000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ _receivedRequestsByID count=%lu ....", buf, 0x16u);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v36 = self->_receivedRequestsByID;
  uint64_t v37 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v52 objects:v79 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = [(NSMutableDictionary *)self->_receivedRequestsByID objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * k)];
        [v41 timestamp];
        if (Current - v42 > 22.0)
        {
          __int16 v43 = [v41 partialResponseWithParameters:0];
          [(ATConcreteMessageLink *)self sendPartialResponse:v43 withCompletion:0];
        }
      }
      uint64_t v38 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v52 objects:v79 count:16];
    }
    while (v38);
  }

  int v44 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    double lastActivityTime = self->_lastActivityTime;
    int64_t idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
    int64_t keepAliveExceptionCount = self->_keepAliveExceptionCount;
    *(_DWORD *)buf = 138544386;
    v70 = self;
    __int16 v71 = 2048;
    double v72 = Current;
    __int16 v73 = 2048;
    double v74 = lastActivityTime;
    __int16 v75 = 1024;
    int v76 = idleTimeoutExceptionCount;
    __int16 v77 = 1024;
    int v78 = keepAliveExceptionCount;
    _os_log_impl(&dword_1D9BC7000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ now=%f, _lastActivityTime=%f, _idleTimeoutExceptionCount=%d, _keepAliveExceptionCount=%d", buf, 0x2Cu);
  }

  if (Current - self->_lastActivityTime > 45.0)
  {
    if (self->_idleTimeoutExceptionCount)
    {
      if (!self->_keepAliveExceptionCount)
      {
        v48 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D0]) initWithCommand:@"Ping" dataClass:0 parameters:0];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_80;
        v51[3] = &unk_1E6B8C2C0;
        v51[4] = self;
        [(ATConcreteMessageLink *)self sendRequest:v48 withCompletion:v51];
      }
    }
    else
    {
      uint64_t v49 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v70 = self;
        _os_log_impl(&dword_1D9BC7000, v49, OS_LOG_TYPE_ERROR, "idle timeout expired for %{public}@ - closing", buf, 0xCu);
      }

      [(ATConcreteMessageLink *)self close];
    }
  }
}

void __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 2, @"message %u timed out", [*(id *)(a1 + 32) messageID]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_76(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) didEncounterErrorBlock];
  id v2 = +[ATInternalError errorWithCode:2, @"stream reader %@ timed out", *(void *)(a1 + 32) format];
  v3[2](v3, v2);
}

void __46__ATConcreteMessageLink__checkMessageTimeouts__block_invoke_80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send ping request: error=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    [*(id *)(a1 + 32) close];
  }
}

- (void)_processIncomingDataResponse:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  receivedResponsesByID = self->_receivedResponsesByID;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
  int v7 = [(NSMutableDictionary *)receivedResponsesByID objectForKey:v6];

  if (!v7) {
    goto LABEL_8;
  }
  if (!self->_signatureProvider) {
    goto LABEL_8;
  }
  if (([v7 options] & 1) == 0) {
    goto LABEL_8;
  }
  signatureProvider = self->_signatureProvider;
  __int16 v9 = [v4 payloadSignature];
  id v10 = [v4 payload];
  uint64_t v11 = [(ATSignatureProvider *)signatureProvider verifySignature:v9 forData:v10];

  if (!v11)
  {
LABEL_8:
    responseWritersByID = self->_responseWritersByID;
    double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
    uint64_t v11 = [(NSMutableDictionary *)responseWritersByID objectForKey:v14];

    if (!v11
      || [(ATConcreteMessageLink *)self _isWriterPendingStopForforMessage:v4])
    {
      goto LABEL_24;
    }
    if ([v4 hasPayload])
    {
      char v15 = [v4 payload];
      id v35 = 0;
      char v16 = [v11 writeAllData:v15 error:&v35];
      id v17 = v35;

      if ((v16 & 1) == 0)
      {
        int v18 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v19 = [v4 messageID];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v17;
          __int16 v37 = 2048;
          double v38 = *(double *)&v11;
          __int16 v39 = 1024;
          LODWORD(v40) = v19;
          _os_log_impl(&dword_1D9BC7000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Error=%{public}@ writing to data stream, stopping %p for response=%u", buf, 0x26u);
        }

        goto LABEL_21;
      }
    }
    else
    {
      id v17 = 0;
    }
    if ([v4 additionalPayload])
    {
LABEL_23:

      goto LABEL_24;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [v11 timestamp];
    double v22 = v21;
    v23 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      double v24 = Current - v22;
      uint64_t v25 = [v11 bytesWritten];
      double v26 = (double)(unint64_t)[v11 bytesWritten] / v24;
      int v27 = [v4 messageID];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v25;
      __int16 v37 = 2048;
      double v38 = v24;
      __int16 v39 = 2048;
      double v40 = v26;
      __int16 v41 = 1024;
      int v42 = v27;
      _os_log_impl(&dword_1D9BC7000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished streaming %llu bytes in %.2f seconds (%.2f b/s) for response %u", buf, 0x30u);
    }

    if ([v4 hasStreamError])
    {
      *(void *)&buf[8] = 0;
      uint64_t v28 = [v4 streamError];
      *(void *)buf = [v28 domainCode];
      uint64_t v29 = [v4 streamError];
      *(_DWORD *)&buf[8] = [v29 code];

      uint64_t v30 = [v4 messageID];
      uint64_t v31 = [v4 messageType];
      double v32 = buf;
      v33 = self;
      uint64_t v34 = v11;
LABEL_22:
      [(ATConcreteMessageLink *)v33 _stopWriter:v34 byInjectingStreamError:v32 forMessageId:v30 type:v31];
      goto LABEL_23;
    }
LABEL_21:
    uint64_t v30 = [v4 messageID];
    uint64_t v31 = [v4 messageType];
    v33 = self;
    uint64_t v34 = v11;
    double v32 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1D9BC7000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to verify payload signature: %{public}@", buf, 0x16u);
  }

  [(ATConcreteMessageLink *)self close];
LABEL_24:
}

- (void)_processIncomingPartialResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sentRequestsByID = self->_sentRequestsByID;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
  int v7 = [(NSMutableDictionary *)sentRequestsByID objectForKey:v6];

  if (v7)
  {
    [v7 setTimestamp:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    uint64_t v8 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      id v10 = self;
      __int16 v11 = 1024;
      int v12 = [v4 messageID];
      _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Received incoming partial response for unknown message ID %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)_processIncomingResponse:(id)a3
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 formattedDescription];
    *(_DWORD *)buf = 138543618;
    v33 = self;
    __int16 v34 = 2114;
    *(void *)id v35 = v6;
    _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <--- %{public}@", buf, 0x16u);
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D8]) initWithATPMessage:v4];
  sentRequestsByID = self->_sentRequestsByID;
  int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
  id v10 = [(NSMutableDictionary *)sentRequestsByID objectForKey:v9];

  if (v10)
  {
    __int16 v11 = self->_sentRequestsByID;
    int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
    [(NSMutableDictionary *)v11 removeObjectForKey:v12];

    receivedResponsesByID = self->_receivedResponsesByID;
    double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
    [(NSMutableDictionary *)receivedResponsesByID setObject:v7 forKey:v14];

    if ([v4 additionalPayload])
    {
      char v15 = (void *)[objc_alloc(MEMORY[0x1E4F77A10]) initWithQueue:self->_queue];
      objc_msgSend(v15, "setCompressed:", (objc_msgSend(v7, "options") >> 1) & 1);
      char v16 = [v15 inputStream];
      [v7 setDataStream:v16];

      responseWritersByID = self->_responseWritersByID;
      int v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
      [(NSMutableDictionary *)responseWritersByID setObject:v15 forKey:v18];

      [v15 start];
      int v19 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = [v4 messageID];
        int v21 = [v15 isCompressed];
        *(_DWORD *)buf = 138543874;
        v33 = self;
        __int16 v34 = 1024;
        *(_DWORD *)id v35 = v20;
        v35[2] = 1024;
        *(_DWORD *)&v35[3] = v21;
        _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Opened data stream for response ID %d, isCompressed=%{BOOL}u", buf, 0x18u);
      }
    }
    completionHandlersByRequestID = self->_completionHandlersByRequestID;
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "messageID"));
    double v24 = [(NSMutableDictionary *)completionHandlersByRequestID objectForKey:v23];

    if (v24)
    {
      uint64_t v25 = self->_completionHandlersByRequestID;
      double v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "messageID"));
      [(NSMutableDictionary *)v25 removeObjectForKey:v26];

      callbackQueue = self->_callbackQueue;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __50__ATConcreteMessageLink__processIncomingResponse___block_invoke;
      v29[3] = &unk_1E6B8C1A8;
      double v24 = v24;
      uint64_t v31 = v24;
      id v30 = v7;
      dispatch_async(callbackQueue, v29);
    }
  }
  else
  {
    double v24 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [v7 messageID];
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 1024;
      *(_DWORD *)id v35 = v28;
      _os_log_impl(&dword_1D9BC7000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Received incoming response for unknown message ID %d", buf, 0x12u);
    }
  }
}

uint64_t __50__ATConcreteMessageLink__processIncomingResponse___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_processIncomingDataRequest:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 formattedDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <--- %{public}@", buf, 0x16u);
  }
  receivedRequestsByID = self->_receivedRequestsByID;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
  int v9 = [(NSMutableDictionary *)receivedRequestsByID objectForKey:v8];

  if (!v9) {
    goto LABEL_10;
  }
  if (!self->_signatureProvider) {
    goto LABEL_10;
  }
  if (([v9 options] & 1) == 0) {
    goto LABEL_10;
  }
  signatureProvider = self->_signatureProvider;
  __int16 v11 = [v4 payloadSignature];
  int v12 = [v4 payload];
  uint64_t v13 = [(ATSignatureProvider *)signatureProvider verifySignature:v11 forData:v12];

  if (!v13)
  {
LABEL_10:
    requestWritersByID = self->_requestWritersByID;
    char v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "messageID"));
    uint64_t v13 = [(NSMutableDictionary *)requestWritersByID objectForKey:v16];

    if (!v13
      || [(ATConcreteMessageLink *)self _isWriterPendingStopForforMessage:v4])
    {
      goto LABEL_26;
    }
    if ([v4 hasPayload])
    {
      id v17 = [v4 payload];
      id v37 = 0;
      char v18 = [v13 writeAllData:v17 error:&v37];
      id v19 = v37;

      if ((v18 & 1) == 0)
      {
        int v20 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v21 = [v4 messageID];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v19;
          __int16 v39 = 2048;
          double v40 = *(double *)&v13;
          __int16 v41 = 1024;
          LODWORD(v42) = v21;
          _os_log_impl(&dword_1D9BC7000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Error=%{public}@ writing to data stream, stopping %p for request=%u", buf, 0x26u);
        }

        goto LABEL_23;
      }
    }
    else
    {
      id v19 = 0;
    }
    if ([v4 additionalPayload])
    {
LABEL_25:

      goto LABEL_26;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [v13 timestamp];
    double v24 = v23;
    uint64_t v25 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = Current - v24;
      uint64_t v27 = [v13 bytesWritten];
      double v28 = (double)(unint64_t)[v13 bytesWritten] / v26;
      int v29 = [v4 messageID];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v27;
      __int16 v39 = 2048;
      double v40 = v26;
      __int16 v41 = 2048;
      double v42 = v28;
      __int16 v43 = 1024;
      int v44 = v29;
      _os_log_impl(&dword_1D9BC7000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished streaming %llu bytes in %.2f seconds (%.2f b/s) for request %u", buf, 0x30u);
    }

    if ([v4 hasStreamError])
    {
      *(void *)&buf[8] = 0;
      id v30 = [v4 streamError];
      *(void *)buf = [v30 domainCode];
      uint64_t v31 = [v4 streamError];
      *(_DWORD *)&buf[8] = [v31 code];

      uint64_t v32 = [v4 messageID];
      uint64_t v33 = [v4 messageType];
      __int16 v34 = buf;
      id v35 = self;
      uint64_t v36 = v13;
LABEL_24:
      [(ATConcreteMessageLink *)v35 _stopWriter:v36 byInjectingStreamError:v34 forMessageId:v32 type:v33];
      goto LABEL_25;
    }
LABEL_23:
    uint64_t v32 = [v4 messageID];
    uint64_t v33 = [v4 messageType];
    id v35 = self;
    uint64_t v36 = v13;
    __int16 v34 = 0;
    goto LABEL_24;
  }
  double v14 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1D9BC7000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to verify payload signature: %{public}@", buf, 0x16u);
  }

  [(ATConcreteMessageLink *)self close];
LABEL_26:
}

- (void)_processIncomingRequest:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 formattedDescription];
    *(_DWORD *)buf = 138543618;
    id v37 = self;
    __int16 v38 = 2114;
    *(void *)__int16 v39 = v6;
    _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <--- %{public}@", buf, 0x16u);
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D0]) initWithATPMessage:v4];
  [v7 setTimestamp:CFAbsoluteTimeGetCurrent()];
  receivedRequestsByID = self->_receivedRequestsByID;
  int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
  [(NSMutableDictionary *)receivedRequestsByID setObject:v7 forKey:v9];

  requestHandlersByDataClass = self->_requestHandlersByDataClass;
  __int16 v11 = [v7 dataClass];
  int v12 = [(NSMutableDictionary *)requestHandlersByDataClass objectForKey:v11];

  if (v12)
  {
    if ([v4 additionalPayload])
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F77A10]) initWithQueue:self->_queue];
      objc_msgSend(v13, "setCompressed:", (objc_msgSend(v7, "options") >> 1) & 1);
      [v13 start];
      double v14 = [v13 inputStream];
      [v7 setDataStream:v14];

      requestWritersByID = self->_requestWritersByID;
      char v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "messageID"));
      [(NSMutableDictionary *)requestWritersByID setObject:v13 forKey:v16];

      id v17 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [v4 messageID];
        int v19 = [v13 isCompressed];
        *(_DWORD *)buf = 138543874;
        id v37 = self;
        __int16 v38 = 1024;
        *(_DWORD *)__int16 v39 = v18;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v19;
        _os_log_impl(&dword_1D9BC7000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Opened data stream for request ID %d, isCompressed=%{BOOL}u", buf, 0x18u);
      }
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_67;
    v32[3] = &unk_1E6B8C298;
    id v33 = v12;
    __int16 v34 = self;
    int v20 = (void (**)(void, void))MEMORY[0x1E016C2E0](v32);
    int v21 = v20;
    if (self->_initialized)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_2;
      block[3] = &unk_1E6B8C1A8;
      uint64_t v31 = v20;
      id v30 = v7;
      dispatch_async(callbackQueue, block);
    }
    else
    {
      ((void (**)(void, void *))v20)[2](v20, v7);
    }
  }
  else
  {
    double v23 = [v7 command];
    int v24 = [v23 isEqualToString:@"Ping"];

    if (v24)
    {
      uint64_t v25 = [v7 responseWithError:0 parameters:0];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __49__ATConcreteMessageLink__processIncomingRequest___block_invoke;
      v35[3] = &unk_1E6B8C3C8;
      v35[4] = self;
      [(ATConcreteMessageLink *)self sendResponse:v25 withCompletion:v35];
    }
    else
    {
      double v26 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [v7 dataClass];
        *(_DWORD *)buf = 138543618;
        id v37 = self;
        __int16 v38 = 2114;
        *(void *)__int16 v39 = v27;
        _os_log_impl(&dword_1D9BC7000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping message for unhandled dataclass %{public}@", buf, 0x16u);
      }
      uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:0];
      double v28 = [v7 responseWithError:v25 parameters:0];
      [(ATConcreteMessageLink *)self sendResponse:v28 withCompletion:&__block_literal_global_1529];
    }
  }
}

void __49__ATConcreteMessageLink__processIncomingRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to send ping response. error=%{public}@", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(a1 + 32) close];
  }
}

uint64_t __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_67(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) messageLink:*(void *)(a1 + 40) didReceiveRequest:a2];
}

uint64_t __49__ATConcreteMessageLink__processIncomingRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_processIncomingMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ATConcreteMessageLink__processIncomingMessage___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__ATConcreteMessageLink__processIncomingMessage___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 208);
  if (!v2) {
    goto LABEL_18;
  }
  id v3 = [*(id *)(a1 + 40) paramsSignature];
  id v4 = [*(id *)(a1 + 40) parameters];
  uint64_t v5 = [v2 verifySignature:v3 forData:v4];

  if (v5)
  {
    id v6 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      char v15 = v5;
      _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to verify params signature: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 32) close];
  }
  else
  {
LABEL_18:
    id v8 = (void *)MEMORY[0x1E016C0E0]();
    int v9 = [*(id *)(a1 + 40) messageType];
    switch(v9)
    {
      case 0:
        [*(id *)(a1 + 32) _processIncomingRequest:*(void *)(a1 + 40)];
        break;
      case 1:
        [*(id *)(a1 + 32) _processIncomingResponse:*(void *)(a1 + 40)];
        break;
      case 2:
        [*(id *)(a1 + 32) _processIncomingPartialResponse:*(void *)(a1 + 40)];
        break;
      case 3:
        [*(id *)(a1 + 32) _processIncomingDataRequest:*(void *)(a1 + 40)];
        break;
      case 4:
        [*(id *)(a1 + 32) _processIncomingDataResponse:*(void *)(a1 + 40)];
        break;
      default:
        uint64_t v10 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          int v12 = 138543618;
          uint64_t v13 = v11;
          __int16 v14 = 1024;
          LODWORD(v15) = v9;
          _os_log_impl(&dword_1D9BC7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Received message with unknown type %d", (uint8_t *)&v12, 0x12u);
        }

        break;
    }
  }
}

- (void)_invokeCompletionHandlerForResponseID:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  completionHandlersByResponseID = self->_completionHandlersByResponseID;
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  int v9 = [(NSMutableDictionary *)completionHandlersByResponseID objectForKey:v8];

  if (v9)
  {
    uint64_t v10 = self->_completionHandlersByResponseID;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v10 removeObjectForKey:v11];

    callbackQueue = self->_callbackQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__ATConcreteMessageLink__invokeCompletionHandlerForResponseID_withError___block_invoke;
    v13[3] = &unk_1E6B8C1A8;
    id v15 = v9;
    id v14 = v6;
    dispatch_async(callbackQueue, v13);
  }
}

uint64_t __73__ATConcreteMessageLink__invokeCompletionHandlerForResponseID_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_prepareStreamReaderForMessage:(id)a3 withProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F77A08]);
  int v9 = [v6 dataStream];
  uint64_t v10 = (void *)[v8 initWithInputStream:v9 queue:self->_queue];

  objc_msgSend(v10, "setMaximumBufferSize:", -[ATSocket suggestedBufferSize](self->_socket, "suggestedBufferSize"));
  objc_msgSend(v10, "setCompress:", (objc_msgSend(v6, "options") >> 1) & 1);
  unint64_t v11 = [v6 messageID];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 1;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke;
  v29[3] = &unk_1E6B8C1F8;
  objc_copyWeak(&v34, &from);
  objc_copyWeak(v35, &location);
  uint64_t v32 = v40;
  id v12 = v6;
  id v30 = v12;
  id v33 = v38;
  v35[1] = (id)v11;
  id v13 = v7;
  id v31 = v13;
  [v10 setDidReadDataBlock:v29];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_57;
  v24[3] = &unk_1E6B8C248;
  objc_copyWeak(v28, &from);
  double v26 = v40;
  v28[1] = (id)v11;
  id v14 = v12;
  id v25 = v14;
  uint64_t v27 = v38;
  [v10 setDidEncounterErrorBlock:v24];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  int v20 = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_2;
  int v21 = &unk_1E6B8C270;
  objc_copyWeak(v23, &from);
  v23[1] = (id)v11;
  id v15 = v14;
  id v22 = v15;
  [v10 setDidFinishReadingBlock:&v18];
  streamReadersByID = self->_streamReadersByID;
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11, v18, v19, v20, v21);
  [(NSMutableDictionary *)streamReadersByID setObject:v10 forKey:v17];

  [v10 start];
  objc_destroyWeak(v23);

  objc_destroyWeak(v28);
  objc_destroyWeak(v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 64));
  dispatch_assert_queue_V2(WeakRetained[18]);
  id v5 = objc_loadWeakRetained((id *)(a1 + 72));
  if (v5 && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = [*(id *)(a1 + 32) ATPMessageWithPayloadData:v3];
    [v6 setAdditionalPayload:1];
    if (WeakRetained[26] && [v3 length] && (objc_msgSend(*(id *)(a1 + 32), "options") & 1) != 0)
    {
      dispatch_queue_t v7 = WeakRetained[26];
      id v17 = 0;
      id v8 = [v7 createSignature:&v17 forData:v3];
      int v9 = v17;
      if (v8)
      {
        uint64_t v10 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v19 = WeakRetained;
          __int16 v20 = 2114;
          *(void *)int v21 = v8;
          _os_log_impl(&dword_1D9BC7000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create signature for payload data: %{public}@", buf, 0x16u);
        }

        goto LABEL_18;
      }
      [v6 setPayloadSignature:v9];
    }
    id v16 = 0;
    char v12 = [(dispatch_queue_t *)WeakRetained _sendMessage:v6 error:&v16];
    id v8 = v16;
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, [v3 length]);
      }
      goto LABEL_19;
    }
    int v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = WeakRetained;
      __int16 v20 = 1024;
      *(_DWORD *)int v21 = v14;
      v21[2] = 2114;
      *(void *)&v21[3] = v8;
      _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send data for message ID %d: %{public}@", buf, 0x1Cu);
    }
LABEL_18:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v15 = [v5 didEncounterErrorBlock];
    ((void (**)(void, id))v15)[2](v15, v8);

LABEL_19:
    goto LABEL_20;
  }
  id v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = WeakRetained;
    __int16 v20 = 1024;
    *(_DWORD *)int v21 = v11;
    _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Not processing message id %d", buf, 0x12u);
  }
LABEL_20:
}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 56));
  dispatch_assert_queue_V2(WeakRetained[18]);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  id v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    id v33 = WeakRetained;
    __int16 v34 = 1024;
    *(_DWORD *)id v35 = v6;
    *(_WORD *)&v35[4] = 2114;
    *(void *)&v35[6] = v3;
    _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Did encounter error reading input stream for message ID %d: %{public}@", buf, 0x1Cu);
  }

  dispatch_queue_t v7 = *(void **)(a1 + 32);
  id v8 = [MEMORY[0x1E4F1C9B8] data];
  int v9 = [v7 ATPMessageWithPayloadData:v8];

  uint64_t v10 = objc_alloc_init(ATPError);
  [v9 setStreamError:v10];

  uint64_t v11 = [v3 code];
  char v12 = [v9 streamError];
  [v12 setCode:v11];

  uint64_t v13 = [v9 streamError];
  [v13 setDomainCode:-1];

  id v31 = 0;
  LODWORD(v12) = [(dispatch_queue_t *)WeakRetained _sendMessage:v9 error:&v31];
  id v14 = v31;
  [(dispatch_queue_t *)WeakRetained _invokeCompletionHandlerForResponseID:*(void *)(a1 + 64) withError:v14];
  if (v12 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    dispatch_queue_t v17 = WeakRetained[14];
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    LOBYTE(v17) = [v17 containsObject:v18];

    if ((v17 & 1) == 0)
    {
      uint64_t v19 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        id v33 = WeakRetained;
        __int16 v34 = 1024;
        *(_DWORD *)id v35 = v20;
        _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing stop for message %d", buf, 0x12u);
      }

      dispatch_queue_t v21 = WeakRetained[14];
      id v22 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
      [v21 addObject:v22];

      dispatch_queue_t v23 = WeakRetained[11];
      int v24 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
      id v25 = [v23 objectForKey:v24];

      if (v25)
      {
        dispatch_group_enter(WeakRetained[21]);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        id v28[2] = __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_59;
        v28[3] = &unk_1E6B8C220;
        double v26 = WeakRetained;
        uint64_t v27 = *(void *)(a1 + 64);
        int v29 = v26;
        uint64_t v30 = v27;
        [v25 stopWithCompletion:v28];
      }
    }
  }
  else
  {
    id v15 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138543874;
      id v33 = WeakRetained;
      __int16 v34 = 2114;
      *(void *)id v35 = v14;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = v16;
      _os_log_impl(&dword_1D9BC7000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send message: %{public}@, shouldCloseMessageLink %d", buf, 0x1Cu);
    }

    [(dispatch_queue_t *)WeakRetained close];
  }
}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[18]);
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    id v15 = WeakRetained;
    __int16 v16 = 1024;
    LODWORD(v17) = v4;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Did finish reading input stream for message ID %d", buf, 0x12u);
  }

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] data];
  dispatch_queue_t v7 = [v5 ATPMessageWithPayloadData:v6];

  id v13 = 0;
  char v8 = [(dispatch_queue_t *)WeakRetained _sendMessage:v7 error:&v13];
  id v9 = v13;
  [(dispatch_queue_t *)WeakRetained _invokeCompletionHandlerForResponseID:*(void *)(a1 + 48) withError:v9];
  dispatch_queue_t v10 = WeakRetained[11];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v10 removeObjectForKey:v11];

  if ((v8 & 1) == 0)
  {
    char v12 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = WeakRetained;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl(&dword_1D9BC7000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send message: %{public}@", buf, 0x16u);
    }

    [(dispatch_queue_t *)WeakRetained close];
  }
}

void __69__ATConcreteMessageLink__prepareStreamReaderForMessage_withProgress___block_invoke_59(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 144));
  id v2 = *(void **)(*(void *)(a1 + 32) + 112);
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v2 removeObject:v3];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 88);
  id v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v4 removeObjectForKey:v5];

  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 168);

  dispatch_group_leave(v6);
}

- (unsigned)_nextRequestID
{
  return atomic_fetch_add_explicit((atomic_uint *volatile)&self->_nextMessageID, 1u, memory_order_relaxed) + 1;
}

- (void)socket:(id)a3 hasDataAvailable:(const char *)a4 length:(int64_t)a5
{
  id v9 = a3;
  self->_double lastActivityTime = CFAbsoluteTimeGetCurrent();
  char v8 = (void *)MEMORY[0x1E016C0E0]();
  [(ATMessageParser *)self->_parser processData:a4 length:a5];
}

- (void)socketDidClose:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Underlying socket closed", (uint8_t *)&v5, 0xCu);
  }

  [(ATConcreteMessageLink *)self close];
}

- (void)removeKeepAliveException
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t keepAliveExceptionCount = self->_keepAliveExceptionCount;
  if (keepAliveExceptionCount <= 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ATConcreteMessageLink.m" lineNumber:525 description:@"keep-alive exception already at 0!"];

    int64_t keepAliveExceptionCount = self->_keepAliveExceptionCount;
  }
  self->_int64_t keepAliveExceptionCount = keepAliveExceptionCount - 1;
  uint64_t v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = self->_keepAliveExceptionCount;
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing keepAliveException - count %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)addKeepAliveException
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ++self->_keepAliveExceptionCount;
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t keepAliveExceptionCount = self->_keepAliveExceptionCount;
    int v5 = 138543618;
    uint64_t v6 = self;
    __int16 v7 = 1024;
    int v8 = keepAliveExceptionCount;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding keepAliveException - count %d", (uint8_t *)&v5, 0x12u);
  }
}

- (BOOL)idleTimeoutEnabled
{
  return self->_idleTimeoutExceptionCount == 0;
}

- (void)removeTimeoutException
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
  if (idleTimeoutExceptionCount <= 0)
  {
    __int16 v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ATConcreteMessageLink.m" lineNumber:510 description:@"timeout exception already at 0!"];

    int64_t idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
  }
  self->_int64_t idleTimeoutExceptionCount = idleTimeoutExceptionCount - 1;
  uint64_t v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = self->_idleTimeoutExceptionCount;
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing idleTimeoutException - count %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)addTimeoutException
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ++self->_idleTimeoutExceptionCount;
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t idleTimeoutExceptionCount = self->_idleTimeoutExceptionCount;
    int v5 = 138543618;
    uint64_t v6 = self;
    __int16 v7 = 1024;
    int v8 = idleTimeoutExceptionCount;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding idleTimeoutException - count %d", (uint8_t *)&v5, 0x12u);
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ATConcreteMessageLink *)self endpointType];
  BOOL v7 = [(ATConcreteMessageLink *)self isOpen];
  int v8 = [(ATConcreteMessageLink *)self identifier];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, type=%d, open=%d identifier=%@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (void)sendPartialResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke;
  block[3] = &unk_1E6B8C640;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (*((unsigned char *)v2 + 185))
  {
    id v3 = (void *)v2[5];
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1[5], "messageID"));
    int v5 = [v3 objectForKey:v4];

    if (v5)
    {
      id v6 = [a1[5] ATPMessage];
      id v7 = v6;
      id v8 = (id)*((void *)a1[4] + 26);
      if (v8
        && (id v27 = 0,
            [v6 parameters],
            id v9 = objc_claimAutoreleasedReturnValue(),
            [v8 createSignature:&v27 forData:v9],
            id v10 = (id)objc_claimAutoreleasedReturnValue(),
            id v8 = v27,
            v9,
            v10))
      {
        int v11 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = a1[4];
          *(_DWORD *)buf = 138543618;
          id v29 = v12;
          __int16 v30 = 2114;
          id v31 = v10;
          _os_log_impl(&dword_1D9BC7000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to sign response params: %{public}@", buf, 0x16u);
        }

        [a1[4] close];
      }
      else
      {
        [v7 setParamsSignature:v8];
        id v17 = a1[4];
        id v26 = 0;
        [v17 _sendMessage:v7 error:&v26];
        id v10 = v26;
      }
      uint64_t v18 = *((void *)a1[4] + 19);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      id v23[2] = __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke_44;
      v23[3] = &unk_1E6B8C1A8;
      id v19 = a1[6];
      id v24 = v10;
      id v25 = v19;
      id v20 = v10;
      dispatch_async(v18, v23);
    }
    else
    {
      id v7 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = a1[4];
        int v22 = [a1[5] messageID];
        *(_DWORD *)buf = 138543618;
        id v29 = v21;
        __int16 v30 = 1024;
        LODWORD(v31) = v22;
        _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Received outgoing response for unknown message ID %d", buf, 0x12u);
      }
    }

    goto LABEL_17;
  }
  id v13 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = a1[4];
    id v15 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v29 = v14;
    __int16 v30 = 2114;
    id v31 = v15;
    _os_log_impl(&dword_1D9BC7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Not sending partial response %{public}@ as the link is closed", buf, 0x16u);
  }

  __int16 v16 = (void (**)(id, void *))a1[6];
  if (v16)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:8 userInfo:0];
    v16[2](v16, v5);
LABEL_17:
  }
}

uint64_t __60__ATConcreteMessageLink_sendPartialResponse_withCompletion___block_invoke_44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)sendResponse:(id)a3 withProgress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke;
  v15[3] = &unk_1E6B8C1D0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 185))
  {
    id v3 = *(void **)(v2 + 40);
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
    int v5 = [v3 objectForKey:v4];

    if (v5)
    {
      id v6 = *(void **)(a1 + 48);
      if (v6)
      {
        id v7 = *(void **)(*(void *)(a1 + 32) + 64);
        id v8 = (void *)[v6 copy];
        id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
        [v7 setObject:v8 forKey:v9];
      }
      id v10 = [*(id *)(a1 + 40) ATPMessage];
      int v11 = [*(id *)(a1 + 40) dataStream];

      if (v11)
      {
        [*(id *)(a1 + 32) _prepareStreamReaderForMessage:*(void *)(a1 + 40) withProgress:*(void *)(a1 + 56)];
        id v12 = [MEMORY[0x1E4F1C9B8] data];
        [v10 setPayload:v12];

        [v10 setAdditionalPayload:1];
      }
      id v13 = *(id *)(*(void *)(a1 + 32) + 208);
      if (v13
        && (id v41 = 0,
            [v10 parameters],
            id v14 = objc_claimAutoreleasedReturnValue(),
            [v13 createSignature:&v41 forData:v14],
            id v15 = (id)objc_claimAutoreleasedReturnValue(),
            id v13 = v41,
            v14,
            v15))
      {
        id v16 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v43 = v17;
          __int16 v44 = 2114;
          id v45 = v15;
          _os_log_impl(&dword_1D9BC7000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to sign response params: %{public}@", buf, 0x16u);
        }

        [*(id *)(a1 + 32) close];
      }
      else
      {
        [v10 setParamsSignature:v13];
        int v22 = *(void **)(a1 + 32);
        id v40 = 0;
        char v23 = [v22 _sendMessage:v10 error:&v40];
        id v15 = v40;
        if ((v23 & 1) == 0)
        {
          id v24 = _ATLogCategoryFramework();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = *(void *)(a1 + 32);
            id v26 = [v10 formattedDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v43 = v25;
            __int16 v44 = 2114;
            id v45 = v26;
            __int16 v46 = 2114;
            id v47 = v15;
            _os_log_impl(&dword_1D9BC7000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send response %{public}@. err=%{public}@", buf, 0x20u);
          }
        }
      }
      id v27 = *(void **)(*(void *)(a1 + 32) + 40);
      double v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
      [v27 removeObjectForKey:v28];

      id v29 = [*(id *)(a1 + 40) dataStream];

      if (!v29 || v15)
      {
        __int16 v30 = *(void **)(*(void *)(a1 + 32) + 64);
        id v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
        [v30 removeObjectForKey:v31];

        uint64_t v32 = *(NSObject **)(*(void *)(a1 + 32) + 152);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke_43;
        v37[3] = &unk_1E6B8C1A8;
        id v39 = *(id *)(a1 + 48);
        id v38 = v15;
        dispatch_async(v32, v37);
      }
    }
    else
    {
      id v33 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = *(void *)(a1 + 32);
        int v35 = [*(id *)(a1 + 40) messageID];
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v34;
        __int16 v44 = 1024;
        LODWORD(v45) = v35;
        _os_log_impl(&dword_1D9BC7000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Received outgoing response for unknown message ID %d", buf, 0x12u);
      }

      uint64_t v36 = *(void *)(a1 + 48);
      if (!v36)
      {
        int v5 = 0;
        goto LABEL_29;
      }
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:23 userInfo:0];
      (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v10);
    }

LABEL_29:
    return;
  }
  id v18 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v19;
    __int16 v44 = 2114;
    id v45 = v20;
    _os_log_impl(&dword_1D9BC7000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Not sending response %{public}@ as the link is closed", buf, 0x16u);
  }

  uint64_t v21 = *(void *)(a1 + 48);
  if (v21)
  {
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:8 userInfo:0];
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v5);
    goto LABEL_29;
  }
}

uint64_t __62__ATConcreteMessageLink_sendResponse_withProgress_completion___block_invoke_43(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke;
  block[3] = &unk_1E6B8C640;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[185])
  {
    objc_msgSend(*(id *)(a1 + 40), "setMessageID:", objc_msgSend(v2, "_nextRequestID"));
    id v3 = [*(id *)(a1 + 40) ATPMessage];
    uint64_t v4 = [*(id *)(a1 + 40) dataStream];

    if (v4)
    {
      [*(id *)(a1 + 32) _prepareStreamReaderForMessage:*(void *)(a1 + 40) withProgress:0];
      int v5 = [MEMORY[0x1E4F1C9B8] data];
      [v3 setPayload:v5];

      [v3 setAdditionalPayload:1];
    }
    id v6 = *(id *)(*(void *)(a1 + 32) + 208);
    if (v6
      && (id v32 = 0,
          [v3 parameters],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v6 createSignature:&v32 forData:v7],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          id v6 = v32,
          v7,
          v8))
    {
      id v9 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v10;
        __int16 v35 = 2114;
        id v36 = v8;
        _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to sign request params: %{public}@", buf, 0x16u);
      }

      [*(id *)(a1 + 32) close];
    }
    else
    {
      [v3 setParamsSignature:v6];
      [*(id *)(a1 + 40) setTimestamp:CFAbsoluteTimeGetCurrent()];
      int v11 = *(void **)(a1 + 32);
      id v31 = 0;
      char v12 = [v11 _sendMessage:v3 error:&v31];
      id v8 = v31;
      if (v12)
      {
        id v13 = *(void **)(a1 + 48);
        if (v13)
        {
          id v14 = *(void **)(*(void *)(a1 + 32) + 56);
          id v15 = (void *)[v13 copy];
          id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
          [v14 setObject:v15 forKey:v16];
        }
        uint64_t v17 = *(void **)(a1 + 40);
        id v18 = *(void **)(*(void *)(a1 + 32) + 32);
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v17, "messageID"));
        [v18 setObject:v17 forKey:v19];
      }
      else
      {
        uint64_t v19 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          uint64_t v25 = [v3 formattedDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v24;
          __int16 v35 = 2114;
          id v36 = v25;
          __int16 v37 = 2114;
          id v38 = v8;
          _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send request %{public}@. err=%{public}@", buf, 0x20u);
        }
      }

      if (!v8) {
        goto LABEL_22;
      }
    }
    id v26 = *(void **)(a1 + 48);
    if (v26)
    {
      id v27 = *(NSObject **)(*(void *)(a1 + 32) + 152);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      id v28[2] = __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke_42;
      v28[3] = &unk_1E6B8C1A8;
      id v30 = v26;
      id v8 = v8;
      id v29 = v8;
      dispatch_async(v27, v28);
    }
LABEL_22:

    goto LABEL_23;
  }
  id v20 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    int v22 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v21;
    __int16 v35 = 2114;
    id v36 = v22;
    _os_log_impl(&dword_1D9BC7000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Not sending request %{public}@ as the link is closed", buf, 0x16u);
  }

  uint64_t v23 = *(void *)(a1 + 48);
  if (v23)
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:8 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v3);
LABEL_23:
  }
}

uint64_t __52__ATConcreteMessageLink_sendRequest_withCompletion___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_initialized)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ATConcreteMessageLink.m" lineNumber:340 description:@"we should not be initializing twice"];
  }
  self->_initialized = v3;
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v5 = [(ATConcreteMessageLink *)self _getObservers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v10 messageLinkWasInitialized:self];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  handlerAccessQueue = self->_handlerAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ATConcreteMessageLink_removeObserver___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(handlerAccessQueue, v7);
}

void __40__ATConcreteMessageLink_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 128) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed observer %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  handlerAccessQueue = self->_handlerAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ATConcreteMessageLink_addObserver___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(handlerAccessQueue, v7);
}

void __37__ATConcreteMessageLink_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 128) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Added observer %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)removeRequestHandlerForDataClass:(id)a3
{
  id v4 = a3;
  handlerAccessQueue = self->_handlerAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ATConcreteMessageLink_removeRequestHandlerForDataClass___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(handlerAccessQueue, v7);
}

void __58__ATConcreteMessageLink_removeRequestHandlerForDataClass___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 120) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Removed request for dataclass %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerAccessQueue = self->_handlerAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ATConcreteMessageLink_addRequestHandler_forDataClass___block_invoke;
  block[3] = &unk_1E6B8C500;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(handlerAccessQueue, block);
}

void __56__ATConcreteMessageLink_addRequestHandler_forDataClass___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1[4] + 120) setObject:a1[5] forKey:a1[6]];
  uint64_t v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered request handler %{public}@ for dataclass %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ATConcreteMessageLink_close__block_invoke;
  block[3] = &unk_1E6B8C468;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __30__ATConcreteMessageLink_close__block_invoke(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 136);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 136);
    *(void *)(v4 + 136) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v6 = *(unsigned __int8 *)(v2 + 185);
  uint64_t v7 = _ATLogCategoryFramework();
  __int16 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v83 = v9;
      _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing ...", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 185) = 0;
    if ([*(id *)(*(void *)(a1 + 32) + 32) count]
      || [*(id *)(*(void *)(a1 + 32) + 40) count])
    {
      __int16 v10 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = [*(id *)(v11 + 32) count];
        uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 40) count];
        *(_DWORD *)buf = 138543874;
        uint64_t v83 = v11;
        __int16 v84 = 2048;
        uint64_t v85 = v12;
        __int16 v86 = 2048;
        uint64_t v87 = v13;
        _os_log_impl(&dword_1D9BC7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Abandoning %lu sent and %lu received messages", buf, 0x20u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeDelegate:");
    if ([*(id *)(*(void *)(a1 + 32) + 8) isOpen]) {
      [*(id *)(*(void *)(a1 + 32) + 8) close];
    }
    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = *(void **)(v14 + 8);
    *(void *)(v14 + 8) = 0;

    long long v16 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(v17 + 88);
      *(_DWORD *)buf = 138543618;
      uint64_t v83 = v17;
      __int16 v84 = 2114;
      uint64_t v85 = v18;
      _os_log_impl(&dword_1D9BC7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ _streamReadersByID=%{public}@", buf, 0x16u);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v19 = 88;
    id v20 = [*(id *)(*(void *)(a1 + 32) + 88) allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v75 objects:v81 count:16];
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v76;
      unint64_t v25 = 0x1EA8CF000uLL;
      *(void *)&long long v22 = 138543618;
      long long v61 = v22;
      do
      {
        uint64_t v26 = 0;
        uint64_t v62 = v23;
        do
        {
          if (*(void *)v76 != v24) {
            objc_enumerationMutation(v20);
          }
          id v27 = *(void **)(*((void *)&v75 + 1) + 8 * v26);
          uint64_t v28 = *(int *)(v25 + 3588);
          if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + v28), "containsObject:", v27, v61) & 1) == 0)
          {
            id v29 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = v24;
              unint64_t v31 = v25;
              id v32 = v20;
              uint64_t v33 = v19;
              uint64_t v34 = *(void *)(a1 + 32);
              int v35 = [v27 integerValue];
              *(_DWORD *)buf = v61;
              uint64_t v83 = v34;
              uint64_t v19 = v33;
              id v20 = v32;
              unint64_t v25 = v31;
              uint64_t v24 = v30;
              uint64_t v23 = v62;
              __int16 v84 = 1024;
              LODWORD(v85) = v35;
              _os_log_impl(&dword_1D9BC7000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing stop for message %d", buf, 0x12u);
            }

            id v36 = [*(id *)(*(void *)(a1 + 32) + v19) objectForKey:v27];
            if (v36)
            {
              [*(id *)(*(void *)(a1 + 32) + v28) addObject:v27];
              dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 168));
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = __30__ATConcreteMessageLink_close__block_invoke_23;
              v74[3] = &unk_1E6B8C5A0;
              v74[4] = *(void *)(a1 + 32);
              v74[5] = v27;
              [v36 stopWithCompletion:v74];
            }
          }
          ++v26;
        }
        while (v23 != v26);
        uint64_t v23 = [v20 countByEnumeratingWithState:&v75 objects:v81 count:16];
      }
      while (v23);
    }

    long long v73 = xmmword_1D9BECEB0;
    __int16 v37 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = *(void *)(a1 + 32);
      uint64_t v39 = *(void *)(v38 + 72);
      *(_DWORD *)buf = 138543618;
      uint64_t v83 = v38;
      __int16 v84 = 2114;
      uint64_t v85 = v39;
      _os_log_impl(&dword_1D9BC7000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ _requestWritersByID=%{public}@", buf, 0x16u);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v40 = [*(id *)(*(void *)(a1 + 32) + 72) allKeys];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v70 != v43) {
            objc_enumerationMutation(v40);
          }
          id v45 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          __int16 v46 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v45];
          objc_msgSend(*(id *)(a1 + 32), "_stopWriter:byInjectingStreamError:forMessageId:type:", v46, &v73, objc_msgSend(v45, "unsignedIntValue"), 0);
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v69 objects:v80 count:16];
      }
      while (v42);
    }

    id v47 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = *(void *)(a1 + 32);
      uint64_t v49 = *(void *)(v48 + 80);
      *(_DWORD *)buf = 138543618;
      uint64_t v83 = v48;
      __int16 v84 = 2114;
      uint64_t v85 = v49;
      _os_log_impl(&dword_1D9BC7000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ _responseWritersByID=%{public}@", buf, 0x16u);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v50 = [*(id *)(*(void *)(a1 + 32) + 80) allKeys];
    uint64_t v51 = [v50 countByEnumeratingWithState:&v65 objects:v79 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v66 != v53) {
            objc_enumerationMutation(v50);
          }
          long long v55 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          v56 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v55];
          objc_msgSend(*(id *)(a1 + 32), "_stopWriter:byInjectingStreamError:forMessageId:type:", v56, &v73, objc_msgSend(v55, "unsignedIntValue"), 1);
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v65 objects:v79 count:16];
      }
      while (v52);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v57 = *(void *)(a1 + 32);
    long long v58 = *(NSObject **)(v57 + 168);
    long long v59 = *(NSObject **)(v57 + 144);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__ATConcreteMessageLink_close__block_invoke_24;
    block[3] = &unk_1E6B8C180;
    void block[4] = v57;
    objc_copyWeak(&v64, (id *)buf);
    dispatch_group_notify(v58, v59, block);
    objc_destroyWeak(&v64);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v60 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v83 = v60;
      _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_ERROR, "%{public}@ is already closed", buf, 0xCu);
    }
  }
}

void __30__ATConcreteMessageLink_close__block_invoke_23(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 144));
  [*(id *)(*(void *)(a1 + 32) + 112) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 168);

  dispatch_group_leave(v2);
}

void __30__ATConcreteMessageLink_close__block_invoke_24(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        __int16 v8 = *(NSObject **)(*(void *)(a1 + 32) + 152);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __30__ATConcreteMessageLink_close__block_invoke_2;
        block[3] = &unk_1E6B8C158;
        void block[4] = v7;
        dispatch_async(v8, block);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v4);
  }
  uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "allValues", 64);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        long long v15 = *(NSObject **)(*(void *)(a1 + 32) + 152);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __30__ATConcreteMessageLink_close__block_invoke_3;
        v36[3] = &unk_1E6B8C158;
        v36[4] = v14;
        dispatch_async(v15, v36);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v11);
  }
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + v30) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  long long v16 = [*(id *)(a1 + 32) _getObservers];
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(NSObject **)(v17 + 160);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  id v35[2] = __30__ATConcreteMessageLink_close__block_invoke_4;
  v35[3] = &unk_1E6B8C468;
  v35[4] = v17;
  dispatch_sync(v18, v35);
  uint64_t v19 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v48 = v20;
    _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ All stream readers and writers have been stopped", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v16;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v31 + 1) + 8 * k);
        if (objc_opt_respondsToSelector()) {
          [v27 messageLinkWasClosed:WeakRetained];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v46 count:16];
    }
    while (v24);
  }

  uint64_t v28 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v48 = v29;
    _os_log_impl(&dword_1D9BC7000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Wrapped up ...", buf, 0xCu);
  }
}

void __30__ATConcreteMessageLink_close__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[ATInternalError errorWithCode:3 format:@"message link closed"];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __30__ATConcreteMessageLink_close__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[ATInternalError errorWithCode:3 format:@"message link closed"];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __30__ATConcreteMessageLink_close__block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 128) removeAllObjects];
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);

  return [v2 removeAllObjects];
}

- (BOOL)open
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__ATConcreteMessageLink_open__block_invoke;
  v5[3] = &unk_1E6B8C490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__ATConcreteMessageLink_open__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) open];
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      uint64_t v5 = "without error";
    }
    else {
      uint64_t v5 = "with error";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v3;
    __int16 v30 = 2114;
    uint64_t v31 = v4;
    __int16 v32 = 2080;
    long long v33 = v5;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Opened socket %{public}@ %s", buf, 0x20u);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 185) = 1;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = [*(id *)(a1 + 32) _getObservers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 messageLinkWasOpened:*(void *)(a1 + 32)];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 144));
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 136);
    *(void *)(v13 + 136) = v12;

    long long v15 = *(NSObject **)(*(void *)(a1 + 32) + 136);
    dispatch_time_t v16 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v15, v16, 0x37E11D600uLL, 0x3B9ACA00uLL);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(NSObject **)(v17 + 136);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29__ATConcreteMessageLink_open__block_invoke_21;
    handler[3] = &unk_1E6B8C468;
    handler[4] = v17;
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 136));
  }
  else
  {
    uint64_t v19 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(v20 + 8);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v20;
      __int16 v30 = 2114;
      uint64_t v31 = v21;
      _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to open socket %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __29__ATConcreteMessageLink_open__block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkMessageTimeouts];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ getting dealloced", buf, 0xCu);
  }

  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    dispatch_source_cancel(requestTimeoutTimer);
    uint64_t v5 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;
  }
  socket = self->_socket;
  if (socket)
  {
    [(ATSocket *)socket removeDelegate:self];
    if ([(ATSocket *)self->_socket isOpen]) {
      [(ATSocket *)self->_socket close];
    }
    uint64_t v7 = self->_socket;
    self->_socket = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ATConcreteMessageLink;
  [(ATConcreteMessageLink *)&v8 dealloc];
}

- (ATConcreteMessageLink)initWithSocket:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2 object:self file:@"ATConcreteMessageLink.m" lineNumber:117 description:@"socket is nil"];
  }
  v56.receiver = self;
  v56.super_class = (Class)ATConcreteMessageLink;
  uint64_t v7 = [(ATMessageLink *)&v56 init];
  if (v7)
  {
    objc_super v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    guid = v7->_guid;
    v7->_guid = (NSString *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.amp.AirTraffic.ATFoundation.ATConcreteMessageLink.queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.amp.AirTraffic.ATFoundation.ATConcreteMessageLink.handlerAccess", 0);
    handlerAccessQueue = v7->_handlerAccessQueue;
    v7->_handlerAccessQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.amp.AirTraffic.ATFoundation.ATConcreteMessageLink.callBack", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:0];
    outputStreamsToInputStreams = v7->_outputStreamsToInputStreams;
    v7->_outputStreamsToInputStreams = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    requestWritersByID = v7->_requestWritersByID;
    v7->_requestWritersByID = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    responseWritersByID = v7->_responseWritersByID;
    v7->_responseWritersByID = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    streamReadersByID = v7->_streamReadersByID;
    v7->_streamReadersByID = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
    requestWritersPendingStopByID = v7->_requestWritersPendingStopByID;
    v7->_requestWritersPendingStopByID = (NSMutableSet *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA80] set];
    responseWritersPendingStopByID = v7->_responseWritersPendingStopByID;
    v7->_responseWritersPendingStopByID = (NSMutableSet *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA80] set];
    requestReadersPendingStopByID = v7->_requestReadersPendingStopByID;
    v7->_requestReadersPendingStopByID = (NSMutableSet *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
    sentRequestsByID = v7->_sentRequestsByID;
    v7->_sentRequestsByID = (NSMutableDictionary *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
    receivedRequestsByID = v7->_receivedRequestsByID;
    v7->_receivedRequestsByID = (NSMutableDictionary *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
    completionHandlersByRequestID = v7->_completionHandlersByRequestID;
    v7->_completionHandlersByRequestID = (NSMutableDictionary *)v35;

    uint64_t v37 = [MEMORY[0x1E4F1CA60] dictionary];
    completionHandlersByResponseID = v7->_completionHandlersByResponseID;
    v7->_completionHandlersByResponseID = (NSMutableDictionary *)v37;

    uint64_t v39 = [MEMORY[0x1E4F1CA60] dictionary];
    requestHandlersByDataClass = v7->_requestHandlersByDataClass;
    v7->_requestHandlersByDataClass = (NSMutableDictionary *)v39;

    dispatch_group_t v41 = dispatch_group_create();
    stopReadersAndWritersGroup = v7->_stopReadersAndWritersGroup;
    v7->_stopReadersAndWritersGroup = (OS_dispatch_group *)v41;

    long long v43 = [[ATMessageParser alloc] initWithMessageClass:objc_opt_class()];
    parser = v7->_parser;
    v7->_parser = v43;

    objc_initWeak(&location, v7);
    long long v45 = v7->_parser;
    uint64_t v50 = MEMORY[0x1E4F143A8];
    uint64_t v51 = 3221225472;
    uint64_t v52 = __40__ATConcreteMessageLink_initWithSocket___block_invoke;
    uint64_t v53 = &unk_1E6B8C130;
    objc_copyWeak(&v54, &location);
    [(ATMessageParser *)v45 setObjectParsedBlock:&v50];
    uint64_t v46 = objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v50, v51, v52, v53);
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v46;

    objc_storeStrong((id *)&v7->_socket, a3);
    [v6 addDelegate:v7];
    v7->_endpointType = 0;
    v7->_double lastActivityTime = CFAbsoluteTimeGetCurrent();
    v7->_int64_t idleTimeoutExceptionCount = 0;
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __40__ATConcreteMessageLink_initWithSocket___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _processIncomingMessage:v3];
}

@end