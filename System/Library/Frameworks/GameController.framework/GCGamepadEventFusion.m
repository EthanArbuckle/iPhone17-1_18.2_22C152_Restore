@interface GCGamepadEventFusion
@end

@implementation GCGamepadEventFusion

void __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(v5 + 8);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke_2;
  v19[3] = &unk_26D22CAD0;
  uint64_t v21 = v5;
  uint64_t v22 = v6;
  id v8 = v4;
  id v20 = v8;
  [v7 enumerateElementsForSourceAtIndex:v6 withBlock:v19];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 216) + 8 * *(void *)(a1 + 40)), a2);
  v9 = -[_GCGamepadEventImpl initWithTimeStamp:inputs:validMask:]([_GCGamepadEventImpl alloc], "initWithTimeStamp:inputs:validMask:", [v8 timestamp], *(void *)(a1 + 32) + 24, *(void *)(*(void *)(a1 + 32) + 16));
  v10 = objc_getProperty(*(id *)(a1 + 32), sel_observers, 232, 1);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

void __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 1) {
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 216) + 8 * *(void *)(a1 + 48));
    int v6 = [v5 hasValidValueForElement:a2];
    int v7 = [*(id *)(a1 + 32) hasValidValueForElement:a2];
    [v5 floatValueForElement:a2];
    float v9 = v8;
    [*(id *)(a1 + 32) floatValueForElement:a2];
    float v11 = v10;

    if (v6 != v7 || v9 != v11)
    {
LABEL_7:
      int v13 = [*(id *)(a1 + 32) hasValidValueForElement:a2];
      uint64_t v14 = 1 << a2;
      uint64_t v15 = *(void *)(a1 + 40);
      if (v13) {
        uint64_t v16 = *(void *)(v15 + 16) | v14;
      }
      else {
        uint64_t v16 = *(void *)(v15 + 16) & ~v14;
      }
      *(void *)(v15 + 16) = v16;
      [*(id *)(a1 + 32) floatValueForElement:a2];
      *(_DWORD *)(*(void *)(a1 + 40) + 4 * a2 + 24) = v17;
    }
  }
}

void __46___GCGamepadEventFusion_observeGamepadEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      id v5 = [*(id *)(a1 + 32) observers];
      int v6 = (void *)[v5 mutableCopy];

      int v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setObservers:v6];
      float v8 = [*(id *)(a1 + 32) observers];
      float v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

@end