@interface HAP2AccessoryServerTransportBase
+ (id)new;
- (BOOL)mergeWithNewTransport:(id)a3;
- (HAP2AccessoryServerTransportBase)init;
- (HAP2AccessoryServerTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4;
- (HAP2AccessoryServerTransportCommon)underlyingTransport;
- (HAP2PropertyLock)propertyLock;
- (HAP2SerializedOperationQueue)operationQueue;
- (OS_dispatch_queue)delegateQueue;
- (double)maxRequestTimeout;
- (id)endpointForCharacteristic:(id)a3;
- (id)endpointForCharacteristics:(id)a3;
- (id)mimeTypeForCharacteristicRequests;
- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3;
- (id)queuedCloseOperation;
- (id)wellKnownEndpoint:(unint64_t)a3;
- (unint64_t)protocolFeaturesForVersion:(id)a3;
- (unint64_t)state;
- (void)_closeWithError:(void *)a3 completion:;
- (void)closeWithError:(id)a3 completion:(id)a4;
- (void)didChangeStateWithError:(id)a3;
- (void)didDisconnectWithError:(id)a3;
- (void)doCloseWithError:(id)a3 completion:(id)a4;
- (void)doOpenWithCompletion:(id)a3;
- (void)doSendRequest:(id)a3 completion:(id)a4;
- (void)doUpdateMaxRequestTimeout:(double)a3;
- (void)internalState;
- (void)openWithCompletion:(id)a3;
- (void)sendRequest:(id)a3 completion:(id)a4;
- (void)setInternalState:(void *)a1;
- (void)setMaxRequestTimeout:(double)a3;
- (void)setQueuedCloseOperation:(id *)a1;
- (void)updateMaxRequestTimeout:(double)a3;
@end

@implementation HAP2AccessoryServerTransportBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);

  objc_storeStrong((id *)&self->_queuedCloseOperation, 0);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (void)doUpdateMaxRequestTimeout:(double)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)didDisconnectWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%@ (Base) Disconnected with error: %@", (uint8_t *)&v6, 0x16u);
  }
  -[HAP2AccessoryServerTransportBase _closeWithError:completion:](self, v4, &__block_literal_global_6599);
}

- (void)_closeWithError:(void *)a3 completion:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [[HAP2AccessoryServerTransportBaseOperationClose alloc] initWithTransport:a1 desiredError:v6 completion:v5];

    __int16 v8 = [a1 propertyLock];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __63__HAP2AccessoryServerTransportBase__closeWithError_completion___block_invoke;
    v14 = &unk_1E69F46E0;
    v15 = a1;
    v16 = v7;
    id v9 = v7;
    [v8 performWritingBlock:&v11];

    uint64_t v10 = objc_msgSend(a1, "operationQueue", v11, v12, v13, v14, v15);
    [v10 addOperation:v9];
  }
}

void __63__HAP2AccessoryServerTransportBase__closeWithError_completion___block_invoke(uint64_t a1)
{
}

- (void)setQueuedCloseOperation:(id *)a1
{
  id v5 = a2;
  if (a1)
  {
    id v4 = [a1 propertyLock];
    [v4 assertOwner];

    objc_storeStrong(a1 + 2, a2);
  }
}

void *__56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = -[HAP2AccessoryServerTransportBase queuedCloseOperation](*(id **)(a1 + 40));
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2) {
    -[HAP2AccessoryServerTransportBase setQueuedCloseOperation:](*(id **)(a1 + 40), 0);
  }
  if ((unint64_t)-[HAP2AccessoryServerTransportBase internalState](*(void **)(a1 + 40)) - 1 <= 1) {
    -[HAP2AccessoryServerTransportBase setInternalState:](*(void **)(a1 + 40), 3);
  }
  result = -[HAP2AccessoryServerTransportBase internalState](*(void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_29(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v9 = hap2Log_accessory;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_error_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%@ (Base) Failed to close: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v11;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%@ (Base) Closed", buf, 0xCu);
  }
  uint64_t v12 = [*(id *)(a1 + 32) propertyLock];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_30;
  v27[3] = &unk_1E69F4330;
  v27[4] = *(void *)(a1 + 32);
  [v12 performWritingBlock:v27];

  v13 = *(void **)(a1 + 40);
  if (v13) {
    v13 = (void *)v13[37];
  }
  v15 = v13;
  v16 = *(void **)(a1 + 40);
  if (v16) {
    objc_setProperty_nonatomic_copy(v16, v14, 0, 296);
  }
  v17 = [*(id *)(a1 + 32) delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_2;
  block[3] = &unk_1E69F3600;
  v18 = v15;
  id v25 = v18;
  char v26 = a2;
  id v19 = v7;
  id v23 = v19;
  id v20 = v8;
  id v24 = v20;
  dispatch_async(v17, block);

  [*(id *)(a1 + 32) didChangeStateWithError:v20];
  v21 = *(void **)(a1 + 40);
  if (v8) {
    [v21 finishWithError:v20];
  }
  else {
    [v21 finish];
  }
}

void __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_30(uint64_t a1)
{
}

uint64_t __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setInternalState:(void *)a1
{
  if (a1)
  {
    id v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    id v5 = [a1 propertyLock];
    [v5 assertOwner];

    a1[1] = a2;
  }
}

- (id)queuedCloseOperation
{
  if (a1)
  {
    v2 = a1;
    v3 = [a1 propertyLock];
    [v3 assertOwner];

    a1 = (id *)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)internalState
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [result propertyLock];
    [v2 assertOwner];

    return (void *)v1[1];
  }
  return result;
}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  uint64_t v10 = NSString;
  uint64_t v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)doSendRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  uint64_t v10 = NSString;
  uint64_t v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)doOpenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)didChangeStateWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)updateMaxRequestTimeout:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v6 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling max request timeout change: %f", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__6626;
  v16 = __Block_byref_object_dispose__6627;
  id v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__HAP2AccessoryServerTransportBase_updateMaxRequestTimeout___block_invoke;
  v13[3] = &unk_1E69F2DF0;
  *(double *)&v13[6] = a3;
  v13[4] = self;
  v13[5] = buf;
  id v7 = (void *)MEMORY[0x1D944E2D0](v13);
  id v8 = [HAP2AsynchronousBlockOperation alloc];
  uint64_t v9 = NSStringFromSelector(a2);
  uint64_t v10 = [(HAP2AsynchronousBlockOperation *)v8 initWithName:v9 block:v7];
  uint64_t v11 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v10;

  uint64_t v12 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v12 addOperation:*(void *)(*(void *)&buf[8] + 40)];

  _Block_object_dispose(buf, 8);
}

uint64_t __60__HAP2AccessoryServerTransportBase_updateMaxRequestTimeout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) doUpdateMaxRequestTimeout:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) setMaxRequestTimeout:*(double *)(a1 + 48)];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 finish];
}

- (BOOL)mergeWithNewTransport:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)mimeTypeForCharacteristicRequests
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)endpointForCharacteristics:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)endpointForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)wellKnownEndpoint:(unint64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (unint64_t)protocolFeaturesForVersion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling close", (uint8_t *)&v9, 0xCu);
  }
  -[HAP2AccessoryServerTransportBase _closeWithError:completion:](self, v7, v6);
}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling send for request %@", (uint8_t *)&v11, 0x16u);
  }
  int v9 = [[HAP2AccessoryServerTransportBaseOperationSendRequest alloc] initWithTransport:self request:v6 completion:v7];

  id v10 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v10 addOperation:v9];
}

uint64_t __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[HAP2AccessoryServerTransportBase queuedCloseOperation](*(id **)(a1 + 32));
  if (v2)
  {
    id v3 = *(id *)(v2 + 288);
    id v4 = v3;
    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    if (!v3) {
  }
    }
  else
  {
    switch((unint64_t)-[HAP2AccessoryServerTransportBase internalState](*(void **)(a1 + 32)))
    {
      case 0uLL:
      case 1uLL:
      case 3uLL:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        break;
      case 2uLL:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        break;
      default:
        break;
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)id v17 = 138412290;
      *(void *)&v17[4] = v9;
      _os_log_debug_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%@ (Base) Operation was canceled", v17, 0xCu);
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v10 = hap2Log_accessory;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        if (v12) {
          uint64_t v12 = *(void *)(v12 + 288);
        }
        *(_DWORD *)id v17 = 138412546;
        *(void *)&v17[4] = v11;
        *(_WORD *)&v17[12] = 2112;
        *(void *)&v17[14] = v12;
        __int16 v13 = v10;
        _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%@ (Base) Received response for request %@", v17, 0x16u);
      }
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14)
      {
        objc_storeStrong((id *)(v14 + 296), a2);
        uint64_t v15 = *(void **)(a1 + 32);
      }
      else
      {
        uint64_t v15 = 0;
      }
      objc_msgSend(v15, "finish", *(_OWORD *)v17, *(void *)&v17[16], v18);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)id v17 = 138412546;
        *(void *)&v17[4] = v16;
        *(_WORD *)&v17[12] = 2112;
        *(void *)&v17[14] = v7;
        _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ (Base) Failed to send: %@", v17, 0x16u);
      }
      [*(id *)(a1 + 32) finishWithError:v7];
    }
  }
}

- (void)openWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling open", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [[HAP2AccessoryServerTransportBaseOperationOpen alloc] initWithTransport:self completion:v4];

  id v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v7 addOperation:v6];
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[HAP2AccessoryServerTransportBase queuedCloseOperation](*(id **)(a1 + 32));
  id v7 = (id)v2;
  if (v2)
  {
    id v3 = *(id *)(v2 + 288);
    id v4 = v3;
    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    if (!v3) {
  }
    }
  else
  {
    id v5 = -[HAP2AccessoryServerTransportBase internalState](*(void **)(a1 + 32));
    if ((unint64_t)v5 <= 3 && v5 != (void *)2) {
      -[HAP2AccessoryServerTransportBase setInternalState:](*(void **)(a1 + 32), 1);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[HAP2AccessoryServerTransportBase internalState](*(void **)(a1 + 32));
  }
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_23(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      char v26 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v39 = v26;
      _os_log_debug_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%@ (Base) Operation was canceled", buf, 0xCu);
    }
    [*(id *)(a1 + 48) invalidate];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v11 = [WeakRetained operationQueue];
    [v11 assertCurrentQueue];

    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      uint64_t v12 = (void *)v12[36];
    }
    uint64_t v14 = v12;
    uint64_t v15 = *(void **)(a1 + 32);
    if (v15) {
      objc_setProperty_nonatomic_copy(v15, v13, 0, 288);
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v16 = hap2Log_accessory;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v39 = WeakRetained;
        __int16 v40 = 2112;
        id v41 = v8;
        _os_log_error_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%@ (Base) Failed to open: %@", buf, 0x16u);
      }
      id v17 = [WeakRetained propertyLock];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_24;
      v37[3] = &unk_1E69F4330;
      v37[4] = WeakRetained;
      [v17 performWritingBlock:v37];

      [WeakRetained didChangeStateWithError:v8];
      uint64_t v18 = [WeakRetained propertyLock];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2;
      v36[3] = &unk_1E69F4330;
      v36[4] = WeakRetained;
      [v18 performWritingBlock:v36];

      id v19 = [WeakRetained delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_3;
      block[3] = &unk_1E69F3600;
      id v34 = v14;
      char v35 = a2;
      id v32 = v7;
      id v20 = v8;
      id v33 = v20;
      v21 = v14;
      dispatch_async(v19, block);

      [WeakRetained didChangeStateWithError:v20];
      [*(id *)(a1 + 32) finishWithError:v20];
      [*(id *)(a1 + 48) invalidate];

      v22 = v34;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = WeakRetained;
        _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEFAULT, "%@ (Base) Opened", buf, 0xCu);
      }
      id v23 = [WeakRetained propertyLock];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_25;
      v30[3] = &unk_1E69F4330;
      v30[4] = WeakRetained;
      [v23 performWritingBlock:v30];

      id v24 = [WeakRetained delegateQueue];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2_26;
      v27[3] = &unk_1E69F3C68;
      id v29 = v14;
      id v28 = v7;
      id v25 = v14;
      dispatch_async(v24, v27);

      [WeakRetained didChangeStateWithError:0];
      [*(id *)(a1 + 32) finish];
      [*(id *)(a1 + 48) invalidate];

      v22 = v29;
    }
  }
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_24(uint64_t a1)
{
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2(uint64_t a1)
{
}

uint64_t __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_25(uint64_t a1)
{
}

uint64_t __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0);
}

- (HAP2AccessoryServerTransportCommon)underlyingTransport
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setMaxRequestTimeout:(double)a3
{
  id v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  id v6 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HAP2AccessoryServerTransportBase_setMaxRequestTimeout___block_invoke;
  v7[3] = &unk_1E69F3A58;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  [v6 performWritingBlock:v7];
}

double __57__HAP2AccessoryServerTransportBase_setMaxRequestTimeout___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (double)maxRequestTimeout
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HAP2AccessoryServerTransportBase_maxRequestTimeout__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __53__HAP2AccessoryServerTransportBase_maxRequestTimeout__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 24);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)state
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__HAP2AccessoryServerTransportBase_state__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__41__HAP2AccessoryServerTransportBase_state__block_invoke(uint64_t a1)
{
  double result = -[HAP2AccessoryServerTransportBase internalState](*(void **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (HAP2AccessoryServerTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAP2AccessoryServerTransportBase;
  uint64_t v9 = [(HAP2AccessoryServerTransportBase *)&v17 init];
  if (v9)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    __int16 v13 = [v10 stringWithFormat:@"%@.propertyLock", v12];

    uint64_t v14 = +[HAP2PropertyLock lockWithName:v13];
    propertyLock = v9->_propertyLock;
    v9->_propertyLock = (HAP2PropertyLock *)v14;

    objc_storeStrong((id *)&v9->_operationQueue, a3);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v9->_internalState = 0;
  }
  return v9;
}

- (HAP2AccessoryServerTransportBase)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end