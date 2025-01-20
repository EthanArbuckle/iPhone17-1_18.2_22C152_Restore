@interface GCGamepadEventGamepadHIDAdapter
@end

@implementation GCGamepadEventGamepadHIDAdapter

void __59___GCGamepadEventGamepadHIDAdapter_initWithSource_service___block_invoke(uint64_t a1, uint64_t a2)
{
  if (IOHIDEventGetType() == 35)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4 || v4 == IOHIDEventGetSenderID() || IOHIDEventGetSenderID() == -1)
    {
      v5 = [[_GCGamepadEventHID alloc] initWithHIDEvent:a2];
      v6 = objc_getProperty(*(id *)(a1 + 40), sel_observers, 24, 1);
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

void __57___GCGamepadEventGamepadHIDAdapter_observeGamepadEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      v5 = [*(id *)(a1 + 32) observers];
      v6 = (void *)[v5 mutableCopy];

      uint64_t v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setObservers:v6];
      uint64_t v8 = [*(id *)(a1 + 32) observers];
      uint64_t v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

@end