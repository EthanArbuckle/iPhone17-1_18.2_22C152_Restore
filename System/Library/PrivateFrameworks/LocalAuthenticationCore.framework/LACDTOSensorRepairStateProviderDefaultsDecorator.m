@interface LACDTOSensorRepairStateProviderDefaultsDecorator
- (LACDTOSensorRepairStateProviderDefaultsDecorator)initWithStateProvider:(id)a3 flags:(id)a4 replyQueue:(id)a5;
- (void)fetchRepairStateWithCompletion:(id)a3;
@end

@implementation LACDTOSensorRepairStateProviderDefaultsDecorator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
}

- (LACDTOSensorRepairStateProviderDefaultsDecorator)initWithStateProvider:(id)a3 flags:(id)a4 replyQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOSensorRepairStateProviderDefaultsDecorator;
  v12 = [(LACDTOSensorRepairStateProviderDefaultsDecorator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stateProvider, a3);
    objc_storeStrong((id *)&v13->_flags, a4);
    objc_storeStrong((id *)&v13->_replyQueue, a5);
  }

  return v13;
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_variant_allows_internal_security_policies()
    && ([(LACFlagsProvider *)self->_flags valueForFlagDTOSecureRepairMockRepairType], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke;
    v19[3] = &unk_2653B6740;
    v19[4] = self;
    v6 = __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke((uint64_t)v19);
    uint64_t v7 = [(LACFlagsProvider *)self->_flags valueForFlagDTOSecureRepairMockRepairTypeQueryLatency];
    v8 = (void *)v7;
    id v9 = &unk_270431FB0;
    if (v7) {
      id v9 = (void *)v7;
    }
    id v10 = v9;

    [v10 doubleValue];
    double v12 = v11;

    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke_2;
    block[3] = &unk_2653B5EB8;
    id v17 = v6;
    id v18 = v4;
    id v15 = v6;
    dispatch_after(v13, replyQueue, block);
  }
  else
  {
    [(LACDTOSensorRepairStateProvider *)self->_stateProvider fetchRepairStateWithCompletion:v4];
  }
}

LACDTOMutableSensorRepairState *__83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 16) valueForFlagDTOSecureRepairMockRepairType];
  uint64_t v2 = [v1 integerValue];

  v3 = objc_alloc_init(LACDTOMutableSensorRepairState);
  [(LACDTOMutableSensorRepairState *)v3 setRepairFlag:v2];
  return v3;
}

uint64_t __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

@end