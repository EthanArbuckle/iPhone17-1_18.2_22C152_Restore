@interface CATObserverManager
@end

@implementation CATObserverManager

void __41___CATObserverManager_initWithOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained notifyObserversOperationDidProgress:v2];
}

uint64_t __35___CATObserverManager_addObserver___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) events];
    uint64_t v3 = result;
  }
  else
  {
    uint64_t v3 = 15;
  }
  if (*(int *)(*(void *)(a1 + 40) + 16) >= 3)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [*(id *)(a1 + 32) operationDidStart:*(void *)(a1 + 48)];
    }
    if (*(int *)(*(void *)(a1 + 40) + 16) < 5)
    {
      if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0) {
        return result;
      }
      goto LABEL_12;
    }
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [*(id *)(a1 + 32) operationDidFinish:*(void *)(a1 + 48)];
    }
    v3 &= 0xFFFFFFFFFFFFFFF0;
  }
  if (!v3) {
    return result;
  }
LABEL_12:
  v4 = *(void **)(*(void *)(a1 + 40) + 8);
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    v4 = *(void **)(*(void *)(a1 + 40) + 8);
  }
  uint64_t v8 = *(void *)(a1 + 32);

  return [v4 addObject:v8];
}

void __38___CATObserverManager_removeObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[1] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __41___CATObserverManager_operationDidStart___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 3;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 operationDidStart:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __44___CATObserverManager_operationDidProgress___block_invoke(uint64_t a1)
{
}

void __42___CATObserverManager_operationDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObserver:forKeyPath:context:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 5;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 operationDidFinish:*(void *)(a1 + 40)];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = 0;
}

@end