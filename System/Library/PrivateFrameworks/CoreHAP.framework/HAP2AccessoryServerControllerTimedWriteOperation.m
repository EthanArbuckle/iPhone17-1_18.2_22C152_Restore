@interface HAP2AccessoryServerControllerTimedWriteOperation
- (HAP2AccessoryServerControllerTimedWriteOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 prepareRequest:(id)a7 executeRequest:(id)a8 endpoint:(id)a9 mimeType:(id)a10 timeout:(double)a11 options:(unint64_t)a12;
- (HAP2EncodedRequest)executeRequest;
- (void)_cleanUp;
- (void)_parseExecuteResponseData:(id)a3;
- (void)_parsePrepareResponseData:(id)a3;
- (void)_parseResponseData:(id)a3;
- (void)_sendExecuteRequest;
- (void)_sendPrepareRequest;
@end

@implementation HAP2AccessoryServerControllerTimedWriteOperation

- (void).cxx_destruct
{
}

- (HAP2EncodedRequest)executeRequest
{
  return self->_executeRequest;
}

- (void)_parseExecuteResponseData:(id)a3
{
  id v4 = a3;
  if (![(HAP2AsynchronousOperation *)self isCancelled])
  {
    if (self)
    {
      v5 = self->super._encoding;
      request = self->super._request;
    }
    else
    {
      v5 = 0;
      request = 0;
    }
    v7 = request;
    id v10 = 0;
    v8 = [(HAP2AccessoryServerEncoding *)v5 responseForRequest:v7 bodyData:v4 error:&v10];
    id v9 = v10;

    if (v8)
    {
      -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)self, v8);
      [(HAP2AccessoryServerControllerOperation *)self finish];
    }
    else
    {
      [(HAP2AccessoryServerControllerOperation *)self finishWithError:v9];
    }
  }
}

- (void)_sendExecuteRequest
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(HAP2AsynchronousOperation *)self isCancelled])
  {
    v3 = [(HAP2AccessoryServerControllerTimedWriteOperation *)self executeRequest];
    -[HAP2AccessoryServerControllerOperation setRequest:]((uint64_t)self, v3);

    if (self) {
      request = self->super._request;
    }
    else {
      request = 0;
    }
    v5 = request;
    v6 = [(HAP2EncodedRequest *)v5 serialize];

    v7 = [HAP2AccessoryServerTransportRequest alloc];
    if (self)
    {
      v8 = self->super._endpoint;
      mimeType = self->super._mimeType;
    }
    else
    {
      v8 = 0;
      mimeType = 0;
    }
    id v10 = mimeType;
    id v11 = [(HAP2AccessoryServerTransportRequest *)v7 initForWritingWithEndpoint:v8 data:v6 encrypted:1 mimeType:v10];

    if (self)
    {
      double timeout = self->super._timeout;
      if (timeout > 0.0) {
        [(HAP2AccessoryServerControllerOperation *)(uint64_t)self _startTimerWithInterval:timeout];
      }
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%@ Executing timed write", buf, 0xCu);
    }
    if (self) {
      transport = self->super._transport;
    }
    else {
      transport = 0;
    }
    v15 = transport;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__HAP2AccessoryServerControllerTimedWriteOperation__sendExecuteRequest__block_invoke;
    v16[3] = &unk_1E69F10B0;
    v16[4] = self;
    [(HAP2AccessoryServerTransportCommon *)v15 sendRequest:v11 completion:v16];
  }
}

void __71__HAP2AccessoryServerControllerTimedWriteOperation__sendExecuteRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  -[HAP2AccessoryServerControllerOperation _cancelTimer](*(void *)(a1 + 32));
  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Executing timed write failed with error: %@", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) _parseExecuteResponseData:v5];
  }
}

- (void)_parsePrepareResponseData:(id)a3
{
  id v4 = a3;
  if (![(HAP2AsynchronousOperation *)self isCancelled])
  {
    if (self)
    {
      id v5 = self->super._encoding;
      request = self->super._request;
    }
    else
    {
      id v5 = 0;
      request = 0;
    }
    v7 = request;
    id v10 = 0;
    uint64_t v8 = [(HAP2AccessoryServerEncoding *)v5 responseForRequest:v7 bodyData:v4 error:&v10];
    id v9 = v10;

    if (v8) {
      [(HAP2AccessoryServerControllerTimedWriteOperation *)self _sendExecuteRequest];
    }
    else {
      [(HAP2AccessoryServerControllerOperation *)self finishWithError:v9];
    }
  }
}

- (void)_sendPrepareRequest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(HAP2AsynchronousOperation *)self isCancelled])
  {
    if (self) {
      request = self->super._request;
    }
    else {
      request = 0;
    }
    id v4 = request;
    id v5 = [(HAP2EncodedRequest *)v4 serialize];

    id v6 = [HAP2AccessoryServerTransportRequest alloc];
    if (self)
    {
      v7 = self->super._endpoint;
      mimeType = self->super._mimeType;
    }
    else
    {
      v7 = 0;
      mimeType = 0;
    }
    id v9 = mimeType;
    id v10 = [(HAP2AccessoryServerTransportRequest *)v6 initForWritingWithEndpoint:v7 data:v5 encrypted:1 mimeType:v9];

    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%@ Sending prepare timed write", buf, 0xCu);
    }
    if (self) {
      transport = self->super._transport;
    }
    else {
      transport = 0;
    }
    uint64_t v13 = transport;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__HAP2AccessoryServerControllerTimedWriteOperation__sendPrepareRequest__block_invoke;
    v14[3] = &unk_1E69F10B0;
    v14[4] = self;
    [(HAP2AccessoryServerTransportCommon *)v13 sendRequest:v10 completion:v14];
  }
}

void __71__HAP2AccessoryServerControllerTimedWriteOperation__sendPrepareRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    if ((-[HAP2AccessoryServerControllerOperation _maybeRefreshSessionAfterError:]((uint64_t)v7, v6) & 1) == 0)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138412546;
        uint64_t v11 = v9;
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Prepare timed write failed with error: %@", (uint8_t *)&v10, 0x16u);
      }
      -[HAP2AccessoryServerControllerOperation _handleSendRequestError:](*(unsigned char **)(a1 + 32), v6);
    }
  }
  else
  {
    [v7 _parsePrepareResponseData:v5];
  }
}

- (void)_cleanUp
{
  -[HAP2AccessoryServerControllerOperation _cancelTimer]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HAP2AccessoryServerControllerTimedWriteOperation;
  [(HAP2AccessoryServerControllerOperation *)&v3 _cleanUp];
}

- (void)_parseResponseData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HAP2AccessoryServerControllerTimedWriteOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 prepareRequest:(id)a7 executeRequest:(id)a8 endpoint:(id)a9 mimeType:(id)a10 timeout:(double)a11 options:(unint64_t)a12
{
  id v23 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HAP2AccessoryServerControllerTimedWriteOperation;
  v20 = [(HAP2AccessoryServerControllerOperation *)&v24 initWithName:a3 controller:a4 encoding:a5 transport:a6 request:a7 endpoint:a9 mimeType:a11 timeout:a10 options:a12];
  v21 = v20;
  if (v20) {
    objc_storeStrong((id *)&v20->_executeRequest, a8);
  }

  return v21;
}

@end