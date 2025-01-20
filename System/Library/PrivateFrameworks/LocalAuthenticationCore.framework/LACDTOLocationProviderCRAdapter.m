@interface LACDTOLocationProviderCRAdapter
- (LACDTOLocationProviderCRAdapter)initWithWorkQueue:(id)a3;
- (NSString)description;
- (int64_t)_locationStateRawValueFromLocationEnum:(int64_t)a3;
- (void)_checkIsInFamiliarLocationWithCompletion:(id)a3;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
@end

@implementation LACDTOLocationProviderCRAdapter

- (LACDTOLocationProviderCRAdapter)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LACDTOLocationProviderCRAdapter;
  v6 = [(LACDTOLocationProviderCRAdapter *)&v14 init];
  if (v6)
  {
    if (getRTRoutineManagerClass())
    {
      uint64_t v7 = [getRTRoutineManagerClass() defaultManager];
      manager = v6->_manager;
      v6->_manager = (RTRoutineManager *)v7;
    }
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v10];
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v11;
  }
  return v6;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, LACDTOLocationState *))a3;
  if (self->_manager)
  {
    locationState = self->_locationState;
    if (locationState)
    {
      v6 = [MEMORY[0x263EFF910] now];
      BOOL v7 = [(LACDTOLocationState *)locationState isValid:v6];

      if (v7)
      {
        v8 = LACLogDTOLocation();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_locationState;
          *(_DWORD *)buf = 138543618;
          v18 = self;
          __int16 v19 = 2112;
          v20 = v9;
          _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will use cached value %@", buf, 0x16u);
        }

        v4[2](v4, self->_locationState);
        goto LABEL_13;
      }
      v12 = self->_locationState;
    }
    else
    {
      v12 = 0;
    }
    self->_locationState = 0;

    objc_initWeak((id *)buf, self);
    internalQueue = self->_internalQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke;
    v14[3] = &unk_2653B66E8;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    dispatch_async(internalQueue, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    goto LABEL_13;
  }
  v10 = LACLogDTOLocation();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[LACDTOLocationProviderCRAdapter checkIsInFamiliarLocationWithCompletion:]((uint64_t)self, v10);
  }

  uint64_t v11 = +[LACDTOLocationState nullInstance];
  v4[2](v4, v11);

LABEL_13:
}

void __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2;
    v4[3] = &unk_2653B56D8;
    objc_copyWeak(&v6, v2);
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _checkIsInFamiliarLocationWithCompletion:v4];

    objc_destroyWeak(&v6);
  }
}

void __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_3;
    block[3] = &unk_2653B55B0;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }
}

void __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_checkIsInFamiliarLocationWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogDTOLocation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  manager = self->_manager;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__LACDTOLocationProviderCRAdapter__checkIsInFamiliarLocationWithCompletion___block_invoke;
  v8[3] = &unk_2653B69E8;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  [(RTRoutineManager *)manager fetchAuthorizedLocationStatus:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __76__LACDTOLocationProviderCRAdapter__checkIsInFamiliarLocationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = LACLogDTOLocation();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1((uint64_t)WeakRetained, (uint64_t)v6, v9);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = +[LACDTOLocationState nullInstance];
      (*(void (**)(uint64_t, LACDTOLocationState *))(v10 + 16))(v10, v11);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        v15 = WeakRetained;
        _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query", (uint8_t *)&v14, 0xCu);
      }

      v12 = -[LACDTOLocationState initWithRawValue:confirmed:]([LACDTOLocationState alloc], "initWithRawValue:confirmed:", objc_msgSend(WeakRetained, "_locationStateRawValueFromLocationEnum:", objc_msgSend(v5, "eStatus")), 1);
      uint64_t v13 = (void *)WeakRetained[2];
      WeakRetained[2] = v12;
      uint64_t v11 = v12;

      (*(void (**)(void, LACDTOLocationState *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v11);
    }
  }
}

- (int64_t)_locationStateRawValueFromLocationEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_254FD0A40[a3];
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)checkIsInFamiliarLocationWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Missing required RTRoutineManager dependency", (uint8_t *)&v2, 0xCu);
}

@end