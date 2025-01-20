@interface GEOProgressForSendingOverXPC
@end

@implementation GEOProgressForSendingOverXPC

void __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x18C1213B0]();
  if (v4 == MEMORY[0x1E4F145A8])
  {
    if (v3 == (id)MEMORY[0x1E4F14528])
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;
    }
  }
  else if (v4 == MEMORY[0x1E4F14578])
  {
    v5 = (_xpc_connection_s *)v3;
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(v6 + 8) + 40);
    if (v7)
    {
      [*(id *)(v7 + 152) addObject:v5];
      uint64_t v6 = *(void *)(a1 + 40);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke_2;
    handler[3] = &unk_1E53E4870;
    handler[4] = v6;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_set_target_queue(v5, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_activate(v5);
    v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v13[0] = v5;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v8 _broadcastOverXPCConnections:v9];
  }
}

void __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x18C1213B0](a2);
  if (a2 == MEMORY[0x1E4F14528] && v4 == MEMORY[0x1E4F145A8])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _connectionDidInvalidate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __67___GEOProgressForSendingOverXPC_initWithMirroredProgress_endpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x18C1213B0](a2);
  if (a2 == MEMORY[0x1E4F14528] && v4 == MEMORY[0x1E4F145A8])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _connectionDidInvalidate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __40___GEOProgressForSendingOverXPC__update__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __39___GEOProgressForSendingOverXPC_cancel__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(_xpc_connection_s **)(v2 + 128);
  if (v3)
  {
    xpc_connection_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(v2 + 152);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_connection_cancel(*(xpc_connection_t *)(*((void *)&v12 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 128);
  *(void *)(v9 + 128) = 0;

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "removeAllObjects", (void)v12);
}

uint64_t __57___GEOProgressForSendingOverXPC__connectionDidInvalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end