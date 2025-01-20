@interface HAP2AccessoryServerTransportBaseOperationSendRequest
- (HAP2AccessoryServerTransportBaseOperationSendRequest)initWithTransport:(id)a3 request:(id)a4 completion:(id)a5;
- (void)main;
@end

@implementation HAP2AccessoryServerTransportBaseOperationSendRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCompletion, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)main
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self && (v3 = self->super._transport) != 0)
  {
    v18 = v3;
    v4 = self;
    v5 = [(HAP2AccessoryServerTransportBase *)v18 operationQueue];
    [v5 assertCurrentQueue];

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6626;
    v28 = __Block_byref_object_dispose__6627;
    id v29 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v6 = [(HAP2AccessoryServerTransportBase *)v18 propertyLock];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke;
    v19[3] = &unk_1E69F1DE8;
    v19[4] = v18;
    v19[5] = &v24;
    v19[6] = &v20;
    [v6 performReadingBlock:v19];

    if (v25[5])
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v7 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ (Base) Not sending while a close is enqueued", buf, 0xCu);
      }
      -[HAP2AsynchronousOperation cancelWithError:](v4, "cancelWithError:", v25[5], v18);
    }
    else
    {
      if (*((unsigned char *)v21 + 24))
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v8 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          request = v4->_request;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = request;
          v10 = v8;
          _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%@ (Base) Sending request %@", buf, 0x16u);
        }
        v11 = v4->_request;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke_27;
        v35 = &unk_1E69F14F0;
        v12 = v4;
        v36 = v12;
        v37 = v18;
        [(HAP2AccessoryServerTransportBase *)v18 doSendRequest:v11 completion:buf];

        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v13 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        {
          v16 = v12->_request;
          *(_DWORD *)v30 = 138412546;
          v31 = v18;
          __int16 v32 = 2112;
          v33 = v16;
          v17 = v13;
          _os_log_debug_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%@ (Base) Sent request %@", v30, 0x16u);
        }
        v14 = v36;
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v15 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v18;
          _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%@ (Base) Cannot send when not open", buf, 0xCu);
        }
        v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hapErrorWithCode:", 19, v18);
        [(HAP2AsynchronousOperation *)v4 cancelWithError:v14];
      }
    }
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    [(HAP2AsynchronousOperation *)self cancel];
  }
}

- (HAP2AccessoryServerTransportBaseOperationSendRequest)initWithTransport:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v11 stringWithFormat:@"%@.sendRequest", v13];
  v26.receiver = self;
  v26.super_class = (Class)HAP2AccessoryServerTransportBaseOperationSendRequest;
  v15 = [(HAP2AccessoryServerTransportBaseOperation *)&v26 initWithName:v14 transport:v8];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_request, a4);
    uint64_t v16 = MEMORY[0x1D944E2D0](v10);
    id clientCompletion = v15->_clientCompletion;
    v15->_id clientCompletion = (id)v16;

    v18 = [v8 delegateQueue];
    objc_initWeak(&location, v15);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke;
    v21[3] = &unk_1E69F4270;
    objc_copyWeak(&v24, &location);
    id v19 = v18;
    id v22 = v19;
    id v23 = v10;
    [(HAP2AccessoryServerTransportBaseOperationSendRequest *)v15 setCompletionBlock:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v15;
}

void __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[38];
    objc_setProperty_nonatomic_copy(v3, v5, 0, 304);
    if (v4)
    {
      v6 = *(NSObject **)(a1 + 32);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke_2;
      v7[3] = &unk_1E69F3C68;
      id v8 = v3;
      id v9 = *(id *)(a1 + 40);
      dispatch_async(v6, v7);
    }
  }
}

void __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    SEL v5 = [v3 error];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    if (v3) {
      uint64_t v6 = v3[37];
    }
    else {
      uint64_t v6 = 0;
    }
    (*(void (**)(void, uint64_t, void))(v4 + 16))(*(void *)(a1 + 40), v6, 0);
  }
  uint64_t v7 = *(void *)(a1 + 32);

  -[HAP2AccessoryServerTransportBaseOperation setTransport:](v7);
}

@end