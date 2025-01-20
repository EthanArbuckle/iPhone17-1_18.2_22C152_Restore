@interface GCKeyboardEventHIDAdapter
@end

@implementation GCKeyboardEventHIDAdapter

void __53___GCKeyboardEventHIDAdapter_initWithSource_service___block_invoke(uint64_t a1)
{
  if (IOHIDEventGetType() == 3)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v2 || v2 == IOHIDEventGetSenderID() || IOHIDEventGetSenderID() == -1)
    {
      v3 = objc_opt_new();
      [v3 setTimestamp:IOHIDEventGetTimeStamp()];
      [v3 setUsagePage:IOHIDEventGetIntegerValue()];
      [v3 setUsage:IOHIDEventGetIntegerValue()];
      [v3 setDown:IOHIDEventGetIntegerValue()];
      [v3 setSender:IOHIDEventGetSenderID()];
      v4 = objc_getProperty(*(id *)(a1 + 40), sel_observers, 24, 1);
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

void __52___GCKeyboardEventHIDAdapter_observeKeyboardEvents___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      uint64_t v5 = [*(id *)(a1 + 32) observers];
      uint64_t v6 = (void *)[v5 mutableCopy];

      uint64_t v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setObservers:v6];
      uint64_t v8 = [*(id *)(a1 + 32) observers];
      long long v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

@end