@interface UIKeyboardArbiterDebug
@end

@implementation UIKeyboardArbiterDebug

void __36___UIKeyboardArbiterDebug_addEntry___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(_DWORD *)(*(void *)(a1 + 32) + 16) += [*(id *)(a1 + 40) importance];
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  while (1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(int *)(v2 + 16) < 601) {
      break;
    }
    v3 = [*(id *)(v2 + 24) firstObject];
    *(_DWORD *)(*(void *)(a1 + 32) + 16) -= [v3 importance];

    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:0];
  }
  objc_sync_exit(obj);
}

uint64_t __41___UIKeyboardArbiterDebug_sharedInstance__block_invoke()
{
  qword_26AC12A98 = objc_alloc_init(_UIKeyboardArbiterDebug);
  return MEMORY[0x270F9A758]();
}

void __47___UIKeyboardArbiterDebug_addAsynchronousData___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[_UIKeyboardArbiterDebugEntryDictionaries entryWithDictionaries:a2];
  [v2 addEntry:v3];
}

void __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke_2;
        v9[3] = &unk_264721918;
        id v10 = v2;
        [v7 enumerateContents:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_sync_exit(obj);
}

uint64_t __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end