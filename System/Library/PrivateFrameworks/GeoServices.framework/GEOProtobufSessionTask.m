@interface GEOProtobufSessionTask
- (BOOL)completedAsCancelled;
- (BOOL)mptcpNegotiated;
- (BOOL)parsePreambleWithReader:(id)a3;
- (BOOL)parseProtocolVersionWithReader:(id)a3;
- (BOOL)parseResponseTypeWithReader:(id)a3;
- (BOOL)receivedRNFNotification;
- (GEOClientMetrics)clientMetrics;
- (GEODataURLSessionTask)dataTask;
- (GEOProtobufSessionTask)init;
- (NSError)error;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)remoteAddressAndPort;
- (PBCodable)response;
- (id)parseInnerProtobufFromData:(id)a3;
- (id)parseResponseFromResponseData:(id)a3;
- (unint64_t)incomingPayloadSize;
- (unint64_t)outgoingPayloadSize;
- (unint64_t)requestedMultipathServiceType;
- (unsigned)requestTypeCode;
- (void)_decodeResponseFromTask:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)completeWithCancelled:(void *)a3 error:(void *)a4 response:;
- (void)completeWithErrorCode:(int64_t)a3;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
- (void)dataURLSession:(id)a3 willSendRequest:(id)a4 forTask:(id)a5 completionHandler:(id)a6;
- (void)start;
@end

@implementation GEOProtobufSessionTask

- (PBCodable)response
{
  return self->_response;
}

- (NSError)error
{
  return self->_error;
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = GEOGetDataSessionProtobufLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Protobuf task %@ cancel", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(GEOProtobufSessionTask *)self dataTask];
  [v4 cancel];
}

- (BOOL)completedAsCancelled
{
  return self->_completedAsCancelled;
}

uint64_t __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(void **)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    -[GEOProtobufSessionTask completeWithCancelled:error:response:](v5, 0, v2, v4);
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) error];
    -[GEOProtobufSessionTask completeWithCancelled:error:response:](v3, 0, v6, *(void **)(a1 + 56));
  }
}

- (void)completeWithCancelled:(void *)a3 error:(void *)a4 response:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v10 = GEOGetDataSessionProtobufLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138413058;
      uint64_t v16 = a1;
      __int16 v17 = 1024;
      int v18 = a2;
      __int16 v19 = 1024;
      BOOL v20 = v8 != 0;
      __int16 v21 = 1024;
      BOOL v22 = v9 != 0;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Protobuf task %@ completed (cancelled %d, error %d, response %d)", (uint8_t *)&v15, 0x1Eu);
    }

    v11 = [(id)a1 dataTask];
    v12 = [v11 clientMetrics];
    [v9 setClientMetricsIfSupported:v12];

    *(unsigned char *)(a1 + 88) = a2;
    objc_storeStrong((id *)(a1 + 48), a3);
    objc_storeStrong((id *)(a1 + 56), a4);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      id v14 = objc_loadWeakRetained((id *)(a1 + 32));
      [v14 protobufSession:WeakRetained didCompleteTask:a1];
    }
  }
}

- (GEOClientMetrics)clientMetrics
{
  v2 = [(GEOProtobufSessionTask *)self dataTask];
  uint64_t v3 = [v2 clientMetrics];

  return (GEOClientMetrics *)v3;
}

- (void)start
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOGetDataSessionProtobufLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v25 = self;
    __int16 v26 = 1040;
    int v27 = 8;
    __int16 v28 = 2096;
    p_requestKind = &self->_requestKind;
    __int16 v30 = 1024;
    unsigned int v31 = [(GEOProtobufSessionTask *)self requestTypeCode];
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Protobuf task %@ start %{geo:DataRequestKind}.*P %#x", buf, 0x22u);
  }

  v4 = [(GEOProtobufSessionTask *)self dataTask];

  if (v4)
  {
    uint64_t v5 = self->_throttleToken;
    id v6 = +[GEOThrottlerRequester sharedRequester];
    auditToken = self->_auditToken;
    id v21 = 0;
    BOOL v22 = v5;
    char v8 = [v6 allowRequest:*(void *)&self->_requestKind forClient:auditToken throttlerToken:&v22 error:&v21];
    id v9 = v22;
    v10 = v22;

    id v11 = v21;
    if (v8)
    {
      objc_storeStrong((id *)&self->_throttleToken, v9);
      id v12 = [(GEOProtobufSessionTask *)self dataTask];
      [v12 start];
    }
    else
    {
      if (v11)
      {
        id v14 = v11;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-3];
      }
      int v15 = v14;
      uint64_t v16 = [(GEOProtobufSessionTask *)self dataTask];
      __int16 v17 = [v16 requestCounterTicket];
      [v17 requestCompleted:v15];

      delegateQueue = self->_delegateQueue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __31__GEOProtobufSessionTask_start__block_invoke_2;
      v19[3] = &unk_1E53D8998;
      v19[4] = self;
      id v20 = v15;
      id v12 = v15;
      dispatch_async(delegateQueue, v19);
    }
  }
  else
  {
    if (self) {
      v13 = self->_delegateQueue;
    }
    else {
      v13 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__GEOProtobufSessionTask_start__block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_async(v13, block);
  }
}

- (GEODataURLSessionTask)dataTask
{
  return self->_dataTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);

  objc_storeStrong((id *)&self->_dataTask, 0);
}

void __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
    id WeakRetained = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke_2;
  v7[3] = &unk_1E53E7528;
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  [v3 protobufSession:WeakRetained willSendRequest:v6 forTask:v5 completionHandler:v7];
}

- (void)dataURLSession:(id)a3 willSendRequest:(id)a4 forTask:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    if (self) {
      delegateQueue = self->_delegateQueue;
    }
    else {
      delegateQueue = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke;
    v16[3] = &unk_1E53D94C8;
    id v17 = WeakRetained;
    int v18 = self;
    id v19 = v11;
    id v20 = v13;
    dispatch_async(delegateQueue, v16);
  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v11);
  }
}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke(uint64_t a1)
{
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (self) {
    delegateQueue = self->_delegateQueue;
  }
  else {
    delegateQueue = 0;
  }
  dispatch_assert_queue_V2(delegateQueue);
  uint64_t v7 = GEOGetDataSessionProtobufLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    int v18 = self;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Protobuf task %@ completed %@", buf, 0x16u);
  }

  if ([v5 failedDueToCancel])
  {
    if (self) {
      id v8 = self->_delegateQueue;
    }
    else {
      id v8 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = [v5 error];

    if (v9)
    {
      if (self) {
        id v10 = self->_delegateQueue;
      }
      else {
        id v10 = 0;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_2;
      v14[3] = &unk_1E53D8998;
      v14[4] = self;
      id v15 = v5;
      dispatch_async(v10, v14);
      id v11 = v15;
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_3;
      v12[3] = &unk_1E53E7500;
      v12[4] = self;
      id v13 = v5;
      [(GEOProtobufSessionTask *)self _decodeResponseFromTask:v13 completion:v12];
      id v11 = v13;
    }
  }
}

- (void)_decodeResponseFromTask:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  id v8 = [v6 receivedData];
  id v9 = GEOGetDataSessionProtobufLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = [v8 length];
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "Protobuf task %@ got data (length %{bytes}zu)", (uint8_t *)&v14, 0x16u);
  }

  if ([v8 length])
  {
    if ([v6 protocolBufferHasPreamble])
    {
      id v10 = [(GEOProtobufSessionTask *)self parseInnerProtobufFromData:v8];
    }
    else
    {
      id v10 = v8;
    }
    id v11 = v10;
    if (v10)
    {
      id v12 = [(GEOProtobufSessionTask *)self parseResponseFromResponseData:v10];
      if (v12)
      {
        id v13 = GEOGetDataSessionProtobufLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 138412290;
          id v15 = self;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "Protobuf task %@ decoded data", (uint8_t *)&v14, 0xCu);
        }

        v7[2](v7, v12, 0);
      }
      else
      {
        v7[2](v7, 0, 2);
      }
    }
    else
    {
      v7[2](v7, 0, 1);
    }
  }
  else
  {
    v7[2](v7, 0, 3);
  }
}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(NSObject **)(v6 + 40);
  }
  else {
    uint64_t v7 = 0;
  }
  dispatch_assert_queue_V2(v7);
  if (a3)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = a3;
LABEL_5:
    id v10 = [v8 errorWithDomain:@"GEOProtobufSession" code:v9 userInfo:0];
    goto LABEL_16;
  }
  if (!v5)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = 4;
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id WeakRetained = objc_loadWeakRetained((id *)(v11 + 32));
  }
  else {
    id WeakRetained = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      id v14 = objc_loadWeakRetained((id *)(v13 + 24));
    }
    else {
      id v14 = 0;
    }
    id v10 = [WeakRetained protobufSession:v14 validateResponse:v5];
  }
  else
  {
    id v10 = 0;
  }

LABEL_16:
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    __int16 v16 = *(NSObject **)(v15 + 40);
  }
  else {
    __int16 v16 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_4;
  v19[3] = &unk_1E53D8AF8;
  v19[4] = v15;
  id v20 = v10;
  id v21 = *(id *)(a1 + 40);
  id v22 = v5;
  id v17 = v5;
  id v18 = v10;
  dispatch_async(v16, v19);
}

- (id)parseResponseFromResponseData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F94090];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];
  uint64_t v7 = [v5 length];

  if (v7)
  {
    if (self)
    {
      if ([(objc_class *)self->_responseClass isValid:v6])
      {
        responseClass = self->_responseClass;
LABEL_5:
        id v9 = objc_alloc_init(responseClass);
        [v9 readFrom:v6];
        goto LABEL_10;
      }
    }
    else
    {
      char v10 = [0 isValid:v6];
      responseClass = 0;
      if (v10) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v11 = GEOGetDataSessionProtobufLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v13[0] = 68157954;
    v13[1] = 8;
    __int16 v14 = 2098;
    p_requestKind = &self->_requestKind;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_FAULT, "Failed to decode protobuf response for %{public, geo:DataRequestKind}.*P", (uint8_t *)v13, 0x12u);
  }

  id v9 = 0;
LABEL_10:

  return v9;
}

- (id)parseInnerProtobufFromData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F94090];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

  if ([(GEOProtobufSessionTask *)self parsePreambleWithReader:v6])
  {
    uint64_t v7 = [v6 readProtoBuffer];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      char v10 = GEOGetDataSessionProtobufLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v12[0] = 68157954;
        v12[1] = 8;
        __int16 v13 = 2098;
        p_requestKind = &self->_requestKind;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "Failed to decode inner protobuf for %{public, geo:DataRequestKind}.*P", (uint8_t *)v12, 0x12u);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)parsePreambleWithReader:(id)a3
{
  id v4 = a3;
  if ([(GEOProtobufSessionTask *)self parseProtocolVersionWithReader:v4]) {
    BOOL v5 = [(GEOProtobufSessionTask *)self parseResponseTypeWithReader:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)parseResponseTypeWithReader:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 readBigEndianFixed32];
  int v6 = [v4 hasError];

  if (v6)
  {
    uint64_t v7 = GEOGetDataSessionProtobufLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v12 = 68157954;
      int v13 = 8;
      __int16 v14 = 2098;
      *(void *)uint64_t v15 = &self->_requestKind;
      id v8 = "Failed to decode response type in protobuf for %{public, geo:DataRequestKind}.*P";
      id v9 = v7;
      uint32_t v10 = 18;
LABEL_8:
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    if (v5 == [(GEOProtobufSessionTask *)self requestTypeCode]) {
      return 1;
    }
    uint64_t v7 = GEOGetDataSessionProtobufLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v12 = 67109890;
      int v13 = v5;
      __int16 v14 = 1024;
      *(_DWORD *)uint64_t v15 = [(GEOProtobufSessionTask *)self requestTypeCode];
      *(_WORD *)&v15[4] = 1040;
      *(_DWORD *)&v15[6] = 8;
      __int16 v16 = 2098;
      p_requestKind = &self->_requestKind;
      id v8 = "Incorrect response type %u (expected %u) in protobuf for %{public, geo:DataRequestKind}.*P";
      id v9 = v7;
      uint32_t v10 = 30;
      goto LABEL_8;
    }
  }

  return 0;
}

- (BOOL)parseProtocolVersionWithReader:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 readBigEndianFixed16];
  int v6 = [v4 hasError];

  if (v6)
  {
    uint64_t v7 = GEOGetDataSessionProtobufLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v12 = 68157954;
      int v13 = 8;
      __int16 v14 = 2098;
      *(void *)uint64_t v15 = &self->_requestKind;
      id v8 = "Failed to decode protocol version in protobuf for %{public, geo:DataRequestKind}.*P";
      id v9 = v7;
      uint32_t v10 = 18;
LABEL_8:
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    if (v5 == 1) {
      return 1;
    }
    uint64_t v7 = GEOGetDataSessionProtobufLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v12 = 67109890;
      int v13 = v5;
      __int16 v14 = 1024;
      *(_DWORD *)uint64_t v15 = 1;
      *(_WORD *)&v15[4] = 1040;
      *(_DWORD *)&v15[6] = 8;
      __int16 v16 = 2098;
      p_requestKind = &self->_requestKind;
      id v8 = "Incorrect protocol version %u (expected %u) in protobuf for %{public, geo:DataRequestKind}.*P";
      id v9 = v7;
      uint32_t v10 = 30;
      goto LABEL_8;
    }
  }

  return 0;
}

- (unsigned)requestTypeCode
{
  return self->_requestTypeCode;
}

- (GEOProtobufSessionTask)init
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = [(GEOProtobufSessionTask *)self dataTask];
  int v5 = [v3 stringWithFormat:@"<PBT %p> {%@}", self, v4];

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  if (self) {
    uint64_t requestKind = (uint64_t)self->_requestKind;
  }
  else {
    uint64_t requestKind = 0;
  }
  int v5 = GEODataRequestKindAsString(requestKind);
  [v3 appendFormat:@" kind: %@", v5];

  objc_msgSend(v3, "appendFormat:", @" requestType: %x", -[GEOProtobufSessionTask requestTypeCode](self, "requestTypeCode"));
  int v6 = [(GEOProtobufSessionTask *)self dataTask];
  uint64_t v7 = objc_opt_class();
  id v8 = [(GEOProtobufSessionTask *)self dataTask];
  [v3 appendFormat:@" data task: <%@: %p>", v7, v8];

  id v9 = [(GEOProtobufSessionTask *)self response];

  if (v9)
  {
    uint32_t v10 = [(GEOProtobufSessionTask *)self response];
    uint64_t v11 = objc_opt_class();
    int v12 = [(GEOProtobufSessionTask *)self response];
    [v3 appendFormat:@" response: <%@: %p>", v11, v12];
  }
  else
  {
    if (self) {
      Class responseClass = self->_responseClass;
    }
    else {
      Class responseClass = 0;
    }
    [v3 appendFormat:@" response class: %@", responseClass];
  }
  __int16 v14 = [(GEOProtobufSessionTask *)self error];

  if (v14)
  {
    uint64_t v15 = [(GEOProtobufSessionTask *)self error];
    __int16 v16 = [v15 domain];
    id v17 = [(GEOProtobufSessionTask *)self error];
    [v3 appendFormat:@" error: %@ (%u)", v16, objc_msgSend(v17, "code")];

    uint64_t v18 = [(GEOProtobufSessionTask *)self error];
    __int16 v19 = [v18 localizedDescription];

    if (v19)
    {
      [v3 appendString:@" \""];
      id v20 = [(GEOProtobufSessionTask *)self error];
      id v21 = [v20 localizedDescription];
      [v3 appendString:v21];

      [v3 appendString:@"\""];
    }
  }

  return (NSString *)v3;
}

void __31__GEOProtobufSessionTask_start__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"No data task"];
  -[GEOProtobufSessionTask completeWithCancelled:error:response:](*(void *)(a1 + 32), 0, v2, 0);
}

void __31__GEOProtobufSessionTask_start__block_invoke_2(uint64_t a1)
{
}

- (unint64_t)outgoingPayloadSize
{
  id v2 = [(GEOProtobufSessionTask *)self dataTask];
  unint64_t v3 = [v2 outgoingPayloadSize];

  return v3;
}

- (unint64_t)incomingPayloadSize
{
  id v2 = [(GEOProtobufSessionTask *)self dataTask];
  unint64_t v3 = [v2 incomingPayloadSize];

  return v3;
}

- (NSString)remoteAddressAndPort
{
  id v2 = [(GEOProtobufSessionTask *)self dataTask];
  unint64_t v3 = [v2 remoteAddressAndPort];

  return (NSString *)v3;
}

- (unint64_t)requestedMultipathServiceType
{
  id v2 = [(GEOProtobufSessionTask *)self dataTask];
  unint64_t v3 = [v2 requestedMultipathServiceType];

  return v3;
}

- (BOOL)mptcpNegotiated
{
  id v2 = [(GEOProtobufSessionTask *)self dataTask];
  char v3 = [v2 mptcpNegotiated];

  return v3;
}

- (BOOL)receivedRNFNotification
{
  id v2 = [(GEOProtobufSessionTask *)self dataTask];
  char v3 = [v2 receivedRNFNotification];

  return v3;
}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) error];
  -[GEOProtobufSessionTask completeWithCancelled:error:response:](v1, 0, v2, 0);
}

- (void)completeWithErrorCode:(int64_t)a3
{
  id v4 = self;
  if (self) {
    self = (GEOProtobufSessionTask *)self->_delegateQueue;
  }
  dispatch_assert_queue_V2(&self->super);
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GEOProtobufSession" code:a3 userInfo:0];
  -[GEOProtobufSessionTask completeWithCancelled:error:response:]((uint64_t)v4, 0, v5, 0);
}

@end