@interface HAP2AccessoryServerTransportBaseOperationClose
- (HAP2AccessoryServerTransportBaseOperationClose)initWithTransport:(id)a3 desiredError:(id)a4 completion:(id)a5;
- (void)main;
@end

@implementation HAP2AccessoryServerTransportBaseOperationClose

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCompletion, 0);

  objc_storeStrong((id *)&self->_desiredError, 0);
}

- (void)main
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self && (v3 = self->super._transport) != 0)
  {
    v11 = v3;
    v4 = self;
    v5 = [(HAP2AccessoryServerTransportBase *)v11 operationQueue];
    [v5 assertCurrentQueue];

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v6 = [(HAP2AccessoryServerTransportBase *)v11 propertyLock];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke;
    v16 = &unk_1E69F26B0;
    v7 = v4;
    v17 = v7;
    v18 = v11;
    v19 = &v20;
    [v6 performWritingBlock:&v13];

    if (v21[3])
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%@ (Base) Closing", (uint8_t *)&buf, 0xCu);
      }
      -[HAP2AccessoryServerTransportBase didChangeStateWithError:](v11, "didChangeStateWithError:", 0, v11, v13, v14, v15, v16);
      id v9 = v7[36];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v25 = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_29;
      v26 = &unk_1E69F1518;
      id v27 = v12;
      v28 = v7;
      [v12 doCloseWithError:v9 completion:&buf];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v10 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_debug_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%@ (Base) Already closed", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend(v7, "finish", v11, v13, v14, v15, v16);
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    [(HAP2AsynchronousOperation *)self cancel];
  }
}

- (HAP2AccessoryServerTransportBaseOperationClose)initWithTransport:(id)a3 desiredError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = NSString;
  id v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  uint64_t v14 = [v11 stringWithFormat:@"%@.close", v13];
  v26.receiver = self;
  v26.super_class = (Class)HAP2AccessoryServerTransportBaseOperationClose;
  v15 = [(HAP2AccessoryServerTransportBaseOperation *)&v26 initWithName:v14 transport:v8];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_desiredError, a4);
    uint64_t v16 = MEMORY[0x1D944E2D0](v10);
    id clientCompletion = v15->_clientCompletion;
    v15->_id clientCompletion = (id)v16;

    v18 = [v8 delegateQueue];
    objc_initWeak(&location, v15);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke;
    v21[3] = &unk_1E69F4270;
    objc_copyWeak(&v24, &location);
    id v19 = v18;
    id v22 = v19;
    id v23 = v10;
    [(HAP2AccessoryServerTransportBaseOperationClose *)v15 setCompletionBlock:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v15;
}

void __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[37];
    objc_setProperty_nonatomic_copy(v3, v5, 0, 296);
    if (v4)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke_2;
      v7[3] = &unk_1E69F3C68;
      v6 = *(NSObject **)(a1 + 32);
      id v9 = *(id *)(a1 + 40);
      id v8 = v3;
      dispatch_async(v6, v7);
    }
  }
}

void __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, void, void *))(v2 + 16))(v2, 0, 0, v3);

  uint64_t v4 = *(void *)(a1 + 32);

  -[HAP2AccessoryServerTransportBaseOperation setTransport:](v4);
}

@end