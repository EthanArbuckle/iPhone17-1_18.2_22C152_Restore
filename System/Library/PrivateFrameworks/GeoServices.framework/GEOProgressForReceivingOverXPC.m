@interface GEOProgressForReceivingOverXPC
@end

@implementation GEOProgressForReceivingOverXPC

void __52___GEOProgressForReceivingOverXPC_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleEvent:v3];
}

void __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14578])
  {
    v4 = (_xpc_connection_s *)v3;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke_2;
    handler[3] = &unk_1E53DF960;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    xpc_connection_set_event_handler(v4, handler);
    xpc_connection_set_target_queue(v4, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_activate(v4);
    objc_destroyWeak(&v6);
  }
}

void __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleEvent:v3];
}

void __41___GEOProgressForReceivingOverXPC_cancel__block_invoke(uint64_t a1)
{
}

@end