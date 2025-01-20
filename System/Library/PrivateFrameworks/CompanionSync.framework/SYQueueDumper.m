@interface SYQueueDumper
+ (void)registerQueue:(id)a3;
@end

@implementation SYQueueDumper

_DWORD *__31__SYQueueDumper_registerQueue___block_invoke_2()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x21D4B1560]();
  [(id)queues compact];
  v1 = [(id)queues allObjects];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  v3 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend((id)queues, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "debugDescription", (void)v13);
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];
  v11 = malloc_type_malloc([v10 length] + 200, 0xB75F1D13uLL);
  _DWORD *v11 = 1;
  v11[1] = [v10 length];
  __strlcpy_chk();
  objc_msgSend(v10, "getBytes:range:", v11 + 50, 0, objc_msgSend(v10, "length"));

  return v11;
}

+ (void)registerQueue:(id)a3
{
  id v3 = a3;
  if (registerQueue__onceToken != -1) {
    dispatch_once(&registerQueue__onceToken, &__block_literal_global_18);
  }
  id v4 = dumperQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SYQueueDumper_registerQueue___block_invoke_3;
  block[3] = &unk_264422AB0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

uint64_t __31__SYQueueDumper_registerQueue___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  v1 = (void *)queues;
  queues = v0;

  dispatch_queue_t v2 = dispatch_queue_create("QueueDumper", 0);
  id v3 = (void *)dumperQueue;
  dumperQueue = (uint64_t)v2;

  return os_state_add_handler();
}

uint64_t __31__SYQueueDumper_registerQueue___block_invoke_3(uint64_t a1)
{
  for (unint64_t i = 0; i < [(id)queues count]; ++i)
  {
    if ([(id)queues pointerAtIndex:i] == *(void *)(a1 + 32)) {
      break;
    }
  }
  uint64_t result = [(id)queues count];
  if (i == result)
  {
    id v4 = (void *)queues;
    uint64_t v5 = *(void *)(a1 + 32);
    return [v4 addPointer:v5];
  }
  return result;
}

@end