@interface GCGamepadEventKeyboardEventAdapter
@end

@implementation GCGamepadEventKeyboardEventAdapter

void __68___GCGamepadEventKeyboardEventAdapter_initWithConfiguration_source___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  memset(v19, 0, sizeof(v19));
  unint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "gamepadElementForUsagePage:usage:", objc_msgSend(v3, "usagePage"), objc_msgSend(v3, "usage"));
  if (v4 <= 0x2E)
  {
    unint64_t v5 = v4;
    uint64_t v6 = [v3 down];
    float v7 = 0.0;
    if (v6 > 0) {
      float v7 = 1.0;
    }
    *((float *)v19 + v5) = v7;
    uint64_t v18 = 1 << v5;
    v8 = -[_GCGamepadEventImpl initWithTimeStamp:inputs:validMask:]([_GCGamepadEventImpl alloc], "initWithTimeStamp:inputs:validMask:", [v3 timestamp], v19, 1 << v5);
    v9 = objc_getProperty(*(id *)(a1 + 32), sel_observers, 24, 1);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13++) + 16))();
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

void __60___GCGamepadEventKeyboardEventAdapter_observeGamepadEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  id v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      unint64_t v5 = [*(id *)(a1 + 32) observers];
      uint64_t v6 = (void *)[v5 mutableCopy];

      float v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setObservers:v6];
      v8 = [*(id *)(a1 + 32) observers];
      v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

@end