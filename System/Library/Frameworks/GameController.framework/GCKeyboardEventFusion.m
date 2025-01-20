@interface GCKeyboardEventFusion
@end

@implementation GCKeyboardEventFusion

void __42___GCKeyboardEventFusion_initWithSources___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_getProperty(*(id *)(a1 + 32), sel_observers, 16, 1);
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

void __48___GCKeyboardEventFusion_observeKeyboardEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  id v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
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