@interface HAP2AccessoryServerControllerOperation
- (HAP2AccessoryServerControllerOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 request:(id)a7 endpoint:(id)a8 mimeType:(id)a9 timeout:(double)a10 options:(unint64_t)a11;
- (NSString)description;
- (id)controller;
- (uint64_t)_maybeRefreshSessionAfterError:(uint64_t)a1;
- (void)_cancelTimer;
- (void)_closeSessionWithCompletion:(uint64_t)a1;
- (void)_handleSendRequestError:(unsigned char *)a1;
- (void)_openTransport:(BOOL)a3;
- (void)_parseResponseData:(id)a3;
- (void)_refreshSession;
- (void)_sendRequest;
- (void)_startTimerWithInterval:(uint64_t)a1;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)setRequest:(uint64_t)a1;
- (void)setResponse:(uint64_t)a1;
- (void)timerDidFire:(id)a3;
@end

@implementation HAP2AccessoryServerControllerOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_destroyWeak((id *)&self->_controller);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (NSString)description
{
  v3 = -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.isa);
  v4 = [v3 accessoryServer];

  if (v4)
  {
    v5 = NSString;
    v6 = [v4 name];
    v7 = [v4 deviceID];
    v8 = [v5 stringWithFormat:@" [%@/%@]", v6, v7];
  }
  else
  {
    v8 = &stru_1F2C4E778;
  }
  v9 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)HAP2AccessoryServerControllerOperation;
  v10 = [(HAP2AccessoryServerControllerOperation *)&v13 description];
  v11 = [v9 stringWithFormat:@"%@%@", v10, v8];

  return (NSString *)v11;
}

- (id)controller
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 37);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%@ Timeout happened, attempting to cancel", (uint8_t *)&v5, 0xCu);
  }
  [(HAP2AccessoryServerControllerOperation *)self cancel];
}

- (void)_parseResponseData:(id)a3
{
  id v4 = a3;
  if (![(HAP2AsynchronousOperation *)self isCancelled])
  {
    if (self)
    {
      int v5 = self->_encoding;
      request = self->_request;
    }
    else
    {
      int v5 = 0;
      request = 0;
    }
    id v10 = 0;
    uint64_t v7 = request;
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

- (void)setResponse:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 360), a2);
  }
}

- (void)_sendRequest
{
  if ([(HAP2AsynchronousOperation *)self isCancelled]) {
    return;
  }
  if (self) {
    request = self->_request;
  }
  else {
    request = 0;
  }
  id v4 = [(HAP2EncodedRequest *)request serialize];
  if (self) {
    int v5 = self->_request;
  }
  else {
    int v5 = 0;
  }
  v6 = v5;
  if (![(HAP2EncodedRequest *)v6 type]) {
    goto LABEL_15;
  }
  if (self) {
    uint64_t v7 = self->_request;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = v7;
  if ([(HAP2EncodedRequest *)v8 type] == 2)
  {
LABEL_14:

LABEL_15:
LABEL_16:
    v11 = [HAP2AccessoryServerTransportRequest alloc];
    if (self)
    {
      v12 = self->_endpoint;
      objc_super v13 = self->_request;
    }
    else
    {
      v12 = 0;
      objc_super v13 = 0;
    }
    v14 = v13;
    uint64_t v15 = [(HAP2EncodedRequest *)v14 isEncrypted];
    if (self) {
      mimeType = self->_mimeType;
    }
    else {
      mimeType = 0;
    }
    uint64_t v17 = [(HAP2AccessoryServerTransportRequest *)v11 initForReadingWithEndpoint:v12 data:v4 encrypted:v15 mimeType:mimeType];
    goto LABEL_21;
  }
  if (self) {
    id v9 = self->_request;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  if ([(HAP2EncodedRequest *)v10 type] == 5)
  {

    goto LABEL_14;
  }
  if (self) {
    v21 = self->_request;
  }
  else {
    v21 = 0;
  }
  uint64_t v22 = [(HAP2EncodedRequest *)v21 type];

  if (v22 == 9) {
    goto LABEL_16;
  }
  v23 = [HAP2AccessoryServerTransportRequest alloc];
  if (self)
  {
    v12 = self->_endpoint;
    v24 = self->_request;
  }
  else
  {
    v12 = 0;
    v24 = 0;
  }
  v14 = v24;
  uint64_t v25 = [(HAP2EncodedRequest *)v14 isEncrypted];
  if (self) {
    v26 = self->_mimeType;
  }
  else {
    v26 = 0;
  }
  uint64_t v17 = [(HAP2AccessoryServerTransportRequest *)v23 initForWritingWithEndpoint:v12 data:v4 encrypted:v25 mimeType:v26];
LABEL_21:
  v18 = (void *)v17;

  if (self)
  {
    double timeout = self->_timeout;
    if (timeout > 0.0) {
      [(HAP2AccessoryServerControllerOperation *)(uint64_t)self _startTimerWithInterval:timeout];
    }
    transport = self->_transport;
  }
  else
  {
    transport = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke;
  v27[3] = &unk_1E69F10B0;
  v27[4] = self;
  [(HAP2AccessoryServerTransportCommon *)transport sendRequest:v18 completion:v27];
}

- (void)_startTimerWithInterval:(uint64_t)a1
{
  if (a1)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:a2];
    [v3 setDelegate:a1];
    id v4 = *(void **)(a1 + 288);
    *(void *)(a1 + 288) = v3;
    id v5 = v3;

    [v5 resume];
  }
}

void __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  -[HAP2AccessoryServerControllerOperation _cancelTimer](*(void *)(a1 + 32));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke_2;
  v15[3] = &unk_1E69F4708;
  uint64_t v7 = *(void *)(a1 + 32);
  id v16 = v6;
  uint64_t v17 = v7;
  id v18 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x1D944E2D0](v15);
  uint64_t v11 = -[HAP2AccessoryServerControllerOperation controller](*(id **)(a1 + 32));
  v12 = (void *)v11;
  if (v11) {
    objc_super v13 = *(void **)(v11 + 80);
  }
  else {
    objc_super v13 = 0;
  }
  id v14 = v13;
  [v14 addConcurrentBlock:v10];
}

- (void)_cancelTimer
{
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 288);
    if (v1)
    {
      *(void *)(a1 + 288) = 0;
      id v2 = v1;

      [v2 suspend];
    }
  }
}

void __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(id **)(a1 + 40);
  if (v3)
  {
    id v4 = -[HAP2AccessoryServerControllerOperation controller](v2);
    if (v4)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v5 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        objc_super v13 = v4;
        _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Forcing session expired", (uint8_t *)&v12, 0xCu);
      }
      -[HAP2AccessoryServerController setSessionStartTime:]((uint64_t)v4, 1);
    }

    if ((-[HAP2AccessoryServerControllerOperation _maybeRefreshSessionAfterError:](*(void *)(a1 + 40), *(void **)(a1 + 32)) & 1) == 0)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v6 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        id v8 = *(void **)(a1 + 40);
        if (v8) {
          uint64_t v9 = v8[44];
        }
        else {
          uint64_t v9 = 0;
        }
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 138412802;
        objc_super v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        uint64_t v11 = v6;
        _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to send request %@: %@", (uint8_t *)&v12, 0x20u);
      }
      -[HAP2AccessoryServerControllerOperation _handleSendRequestError:](*(unsigned char **)(a1 + 40), *(void **)(a1 + 32));
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    [v2 _parseResponseData:v7];
  }
}

- (uint64_t)_maybeRefreshSessionAfterError:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)(a1 + 344) & 2) != 0)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v6 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    int v19 = 138412290;
    uint64_t v20 = a1;
    uint64_t v7 = "%@ Session refresh not allowed for this operation";
    id v8 = v6;
    goto LABEL_12;
  }
  if (*(unsigned char *)(a1 + 280))
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138412290;
      uint64_t v20 = a1;
      _os_log_debug_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%@ Session refresh already attempted once, not attempting again", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_13;
  }
  id v10 = v3;
  uint64_t v11 = [v10 userInfo];
  int v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v13 = v12;
  }
  else {
    objc_super v13 = 0;
  }
  id v14 = v13;

  uint64_t v15 = [v10 domain];
  int v16 = [v15 isEqualToString:@"HAPErrorDomain"];

  BOOL v17 = v16 && ([v10 code] == 17 || objc_msgSend(v10, "code") == 8 && objc_msgSend(v14, "code") == 1);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v18 = hap2Log_accessory;
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    int v19 = 138412290;
    uint64_t v20 = a1;
    uint64_t v7 = "%@ Session refresh wouldn't help with this error, not attempting";
    id v8 = v18;
LABEL_12:
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v19, 0xCu);
LABEL_13:
    a1 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    uint64_t v20 = a1;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%@ Refreshing session due to error: %@", (uint8_t *)&v19, 0x16u);
  }
  -[HAP2AccessoryServerControllerOperation _refreshSession](a1);
  a1 = 1;
LABEL_14:

  return a1;
}

- (void)_handleSendRequestError:(unsigned char *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ((a1[344] & 1) != 0
      && [v3 code] == 17
      && ([v4 domain],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isEqualToString:@"HAPErrorDomain"],
          v5,
          v6))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v7 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = a1;
        _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ Allowing expired session to stay open", buf, 0xCu);
      }
      [a1 finishWithError:v4];
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __66__HAP2AccessoryServerControllerOperation__handleSendRequestError___block_invoke;
      v8[3] = &unk_1E69F46E0;
      v8[4] = a1;
      id v9 = v4;
      -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:]((uint64_t)a1, v8);
    }
  }
}

uint64_t __66__HAP2AccessoryServerControllerOperation__handleSendRequestError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

- (void)_closeSessionWithCompletion:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 296));
    id v5 = WeakRetained;
    if (WeakRetained) {
      int v6 = (void *)*((void *)WeakRetained + 10);
    }
    else {
      int v6 = 0;
    }
    id v7 = v6;
    [v7 assertCurrentQueue];

    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = a1;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ Closing session", buf, 0xCu);
    }
    id v9 = *(void **)(a1 + 312);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke;
    v10[3] = &unk_1E69F3400;
    v10[4] = a1;
    id v11 = v3;
    [v9 closeWithError:0 completion:v10];
  }
}

void __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke_2;
  id v11 = &unk_1E69F3C68;
  id v2 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v2;
  id v3 = (void *)MEMORY[0x1D944E2D0](&v8);
  uint64_t v4 = -[HAP2AccessoryServerControllerOperation controller](*(id **)(a1 + 32));
  id v5 = (void *)v4;
  if (v4) {
    int v6 = *(void **)(v4 + 80);
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;
  objc_msgSend(v7, "addConcurrentBlock:", v3, v8, v9, v10, v11, v12);
}

uint64_t __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%@ Session closed", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_refreshSession
{
  if (a1)
  {
    *(unsigned char *)(a1 + 280) = 1;
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __57__HAP2AccessoryServerControllerOperation__refreshSession__block_invoke;
    v1[3] = &unk_1E69F4330;
    v1[4] = a1;
    -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:](a1, v1);
  }
}

uint64_t __57__HAP2AccessoryServerControllerOperation__refreshSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openTransport:0];
}

- (void)_openTransport:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(HAP2AsynchronousOperation *)self isCancelled]) {
    return;
  }
  if (self)
  {
    unint64_t options = self->_options;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_controller);
    if (options)
    {
LABEL_14:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke;
      v14[3] = &unk_1E69F0928;
      v14[4] = self;
      -[HAP2AccessoryServerController openTransportWithResume:completion:](WeakRetained, a3, v14);

      return;
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  char v7 = -[HAP2AccessoryServerController isSessionExpired]((uint64_t)WeakRetained);

  if ((v7 & 1) == 0)
  {
    -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.isa);
    id WeakRetained = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (self)
  {
    if ((self->_options & 2) != 0)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v11 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int v16 = self;
        _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%@ Session has expired and operation is not allowed to refresh", buf, 0xCu);
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = 1;
      goto LABEL_20;
    }
    if (self->_attemptedSessionRefresh)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int v16 = self;
        _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Session refresh has already been attempted", buf, 0xCu);
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = 8;
LABEL_20:
      uint64_t v12 = [v9 hapErrorWithCode:v10];
      [(HAP2AccessoryServerControllerOperation *)self finishWithError:v12];

      return;
    }
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v13 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v16 = self;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "%@ Session has expired, refreshing", buf, 0xCu);
  }
  -[HAP2AccessoryServerControllerOperation _refreshSession]((uint64_t)self);
}

void __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = -[HAP2AccessoryServerControllerOperation controller](*(id **)(a1 + 32));
  char v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = *(void **)(v6 + 80);
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  [v9 assertCurrentQueue];

  uint64_t v10 = *(void **)(a1 + 32);
  if (!v5)
  {
    [v10 _sendRequest];
    goto LABEL_28;
  }
  if ((-[HAP2AccessoryServerControllerOperation _maybeRefreshSessionAfterError:]((uint64_t)v10, v5) & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v5;
    id v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 userInfo];
      uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v16 = v15;
      }
      else {
        int v16 = 0;
      }
      id v17 = v16;

      if (a2)
      {
        uint64_t v18 = [v13 domain];
        if (![v18 isEqualToString:@"HAPErrorDomain"]) {
          goto LABEL_21;
        }
        if ([v13 code] == 19)
        {

LABEL_16:
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          uint64_t v20 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v11;
            _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEFAULT, "%@ Failed to connect - will try the next IP address for the accessory", buf, 0xCu);
          }
          *(void *)v26 = MEMORY[0x1E4F143A8];
          *(void *)&v26[8] = 3221225472;
          *(void *)&v26[16] = __71__HAP2AccessoryServerControllerOperation__retryNextIPAddress_rtnError___block_invoke;
          v27 = &unk_1E69F4330;
          uint64_t v28 = v11;
          -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:](v11, v26);

          goto LABEL_28;
        }
        if ([v13 code] == 8)
        {
          uint64_t v19 = [v17 code];

          if (v19 == 24) {
            goto LABEL_16;
          }
        }
        else
        {
LABEL_21:
        }
      }
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v21 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)v26 = 138412546;
      *(void *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2112;
      *(void *)&v26[14] = v13;
      _os_log_error_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%@ Open failed: %@", v26, 0x16u);
    }
    uint64_t v22 = *(void *)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke_9;
    v24[3] = &unk_1E69F46E0;
    v24[4] = v22;
    id v25 = v13;
    -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:](v22, v24);
  }
LABEL_28:
}

uint64_t __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

uint64_t __71__HAP2AccessoryServerControllerOperation__retryNextIPAddress_rtnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openTransport:1];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  [(HAP2AccessoryServerControllerOperation *)self _cleanUp];
  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerControllerOperation;
  [(HAP2AsynchronousOperation *)&v5 cancelWithError:v4];
}

- (void)cancel
{
  [(HAP2AccessoryServerControllerOperation *)self _cleanUp];
  v3.receiver = self;
  v3.super_class = (Class)HAP2AccessoryServerControllerOperation;
  [(HAP2AsynchronousOperation *)&v3 cancel];
}

- (void)finishWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  objc_super v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%@ Finishing: %@", buf, 0x16u);
  }
  [(HAP2AccessoryServerControllerOperation *)self _cleanUp];
  v6.receiver = self;
  v6.super_class = (Class)HAP2AccessoryServerControllerOperation;
  [(HAP2AsynchronousOperation *)&v6 finishWithError:v4];
}

- (void)finish
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  objc_super v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v6 = self;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%@ Finishing", buf, 0xCu);
  }
  [(HAP2AccessoryServerControllerOperation *)self _cleanUp];
  v4.receiver = self;
  v4.super_class = (Class)HAP2AccessoryServerControllerOperation;
  [(HAP2AsynchronousOperation *)&v4 finish];
}

- (void)main
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  objc_super v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    objc_super v5 = self;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEFAULT, "%@ Starting", (uint8_t *)&v4, 0xCu);
  }
  [(HAP2AccessoryServerControllerOperation *)self _openTransport:0];
}

- (HAP2AccessoryServerControllerOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 request:(id)a7 endpoint:(id)a8 mimeType:(id)a9 timeout:(double)a10 options:(unint64_t)a11
{
  id v18 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v19 = a8;
  id v20 = a9;
  v27.receiver = self;
  v27.super_class = (Class)HAP2AccessoryServerControllerOperation;
  __int16 v21 = [(HAP2AsynchronousOperation *)&v27 initWithName:a3];
  uint64_t v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_controller, v18);
    objc_storeStrong((id *)&v22->_encoding, a5);
    objc_storeStrong((id *)&v22->_transport, a6);
    objc_storeStrong((id *)&v22->_request, a7);
    objc_storeStrong((id *)&v22->_endpoint, a8);
    objc_storeStrong((id *)&v22->_mimeType, a9);
    v22->_double timeout = a10;
    v22->_unint64_t options = a11;
  }

  return v22;
}

- (void)setRequest:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 352), a2);
  }
}

@end