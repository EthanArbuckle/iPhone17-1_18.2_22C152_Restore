@interface HAP2AccessoryServerTransportBaseOperationOpen
- (HAP2AccessoryServerTransportBaseOperationOpen)initWithTransport:(id)a3 completion:(id)a4;
- (void)main;
@end

@implementation HAP2AccessoryServerTransportBaseOperationOpen

- (void).cxx_destruct
{
}

- (void)main
{
  v44[1] = *MEMORY[0x1E4F143B8];
  if (self && (v3 = self->super._transport) != 0)
  {
    val = v3;
    v4 = self;
    v5 = [(HAP2AccessoryServerTransportBase *)val operationQueue];
    [v5 assertCurrentQueue];

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__6626;
    v35 = __Block_byref_object_dispose__6627;
    id v36 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    v6 = [(HAP2AccessoryServerTransportBase *)val propertyLock];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke;
    v26[3] = &unk_1E69F1DE8;
    v26[4] = val;
    v26[5] = &v31;
    v26[6] = &v27;
    [v6 performWritingBlock:v26];

    if (v32[5])
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v7 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = val;
        _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ (Base) Not opening while a close is enqueued", (uint8_t *)&buf, 0xCu);
      }
      [(HAP2AsynchronousOperation *)v4 cancelWithError:v32[5]];
    }
    else if (v28[3] == 2)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = val;
        _os_log_debug_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%@ (Base) Already open", (uint8_t *)&buf, 0xCu);
      }
      [(HAP2AsynchronousOperation *)v4 finish];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = val;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%@ (Base) Opening", (uint8_t *)&buf, 0xCu);
      }
      [(HAP2AccessoryServerTransportBase *)val didChangeStateWithError:0];
      v10 = NSString;
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = [v10 stringWithFormat:@"%@ Open Transport", v12];

      v14 = (void *)[objc_alloc(MEMORY[0x1E4F65518]) initWithName:@"Open Transport" timeout:60.0];
      id v25 = 0;
      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F653F0]);
        v16 = [MEMORY[0x1E4F29128] UUID];
        v44[0] = v14;
        id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
        v18 = (void *)[v15 initWithIdentifier:v16 name:v13 parent:0 assertions:v17];
        id v19 = v25;
        id v25 = v18;
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v20 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = val;
          _os_log_error_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", (uint8_t *)&buf, 0xCu);
        }
        id v21 = objc_alloc(MEMORY[0x1E4F653F0]);
        v16 = [MEMORY[0x1E4F29128] UUID];
        v22 = (void *)[v21 initWithIdentifier:v16 name:v13 parent:0 options:0];
        id v17 = v25;
        id v25 = v22;
      }

      objc_initWeak(&location, val);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v38 = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_23;
      v39 = &unk_1E69F14C8;
      v40 = v4;
      v41 = val;
      id v42 = v25;
      objc_copyWeak(&v43, &location);
      [(HAP2AccessoryServerTransportBase *)val doOpenWithCompletion:&buf];
      objc_destroyWeak(&v43);

      objc_destroyWeak(&location);
      __HMFActivityScopeLeave();
    }
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    [(HAP2AsynchronousOperation *)self cancel];
  }
}

- (HAP2AccessoryServerTransportBaseOperationOpen)initWithTransport:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"%@.open", v10];
  v23.receiver = self;
  v23.super_class = (Class)HAP2AccessoryServerTransportBaseOperationOpen;
  v12 = [(HAP2AccessoryServerTransportBaseOperation *)&v23 initWithName:v11 transport:v6];

  if (v12)
  {
    uint64_t v13 = MEMORY[0x1D944E2D0](v7);
    id clientCompletion = v12->_clientCompletion;
    v12->_id clientCompletion = (id)v13;

    id v15 = [v6 delegateQueue];
    objc_initWeak(&location, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke;
    v18[3] = &unk_1E69F4270;
    objc_copyWeak(&v21, &location);
    id v16 = v15;
    id v19 = v16;
    id v20 = v7;
    [(HAP2AccessoryServerTransportBaseOperationOpen *)v12 setCompletionBlock:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[36];
    objc_setProperty_nonatomic_copy(v3, v5, 0, 288);
    if (v4)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke_2;
      v7[3] = &unk_1E69F3C68;
      id v6 = *(NSObject **)(a1 + 32);
      id v9 = *(id *)(a1 + 40);
      v8 = v3;
      dispatch_async(v6, v7);
    }
  }
}

void __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, void, void *))(v2 + 16))(v2, 0, 0, v3);

  uint64_t v4 = *(void *)(a1 + 32);

  -[HAP2AccessoryServerTransportBaseOperation setTransport:](v4);
}

@end