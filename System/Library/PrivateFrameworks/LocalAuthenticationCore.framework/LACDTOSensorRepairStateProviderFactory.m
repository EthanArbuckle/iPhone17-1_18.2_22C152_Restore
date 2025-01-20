@interface LACDTOSensorRepairStateProviderFactory
+ (id)repairStateProviderWithReplyQueue:(id)a3 flags:(id)a4;
@end

@implementation LACDTOSensorRepairStateProviderFactory

+ (id)repairStateProviderWithReplyQueue:(id)a3 flags:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [LACDTOSensorRepairStateProviderTaskDecorator alloc];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke;
  v16 = &unk_2653B6670;
  id v17 = v5;
  id v18 = v6;
  id v8 = v6;
  id v9 = v5;
  v10 = __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke((uint64_t)&v13);
  v11 = -[LACDTOSensorRepairStateProviderTaskDecorator initWithProvider:replyQueue:](v7, "initWithProvider:replyQueue:", v10, v9, v13, v14, v15, v16);

  return v11;
}

LACDTOSensorRepairStateProviderDefaultsDecorator *__82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke(uint64_t a1)
{
  v2 = [LACDTOSensorRepairStateProviderDefaultsDecorator alloc];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke_2;
  v6[3] = &unk_2653B6648;
  id v7 = *(id *)(a1 + 32);
  v3 = __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke_2((uint64_t)v6);
  v4 = [(LACDTOSensorRepairStateProviderDefaultsDecorator *)v2 initWithStateProvider:v3 flags:*(void *)(a1 + 40) replyQueue:*(void *)(a1 + 32)];

  return v4;
}

LACDTOSensorRepairStateProviderCRAdapter *__82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke_2(uint64_t a1)
{
  v1 = [[LACDTOSensorRepairStateProviderCRAdapter alloc] initWithReplyQueue:*(void *)(a1 + 32)];
  return v1;
}

@end