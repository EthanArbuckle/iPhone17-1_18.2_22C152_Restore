@interface INExtensionContextIntentResponseObserver
- (INExtensionContextIntentResponseObserver)init;
- (NSMapTable)remoteObservers;
- (void)_intentResponseDidUpdate:(id)a3;
- (void)setObserver:(id)a3 forConnection:(id)a4;
@end

@implementation INExtensionContextIntentResponseObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObservers, 0);

  objc_storeStrong((id *)&self->_remoteObserver, 0);
}

- (NSMapTable)remoteObservers
{
  return self->_remoteObservers;
}

- (void)_intentResponseDidUpdate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[INCache sharedCache];
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = objc_msgSend(v3, "_intents_cacheableObjects");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v11 cacheIdentifier];
        v13 = [v4 cacheableObjectForIdentifier:v12];

        if (v13) {
          v14 = v13;
        }
        else {
          v14 = v11;
        }
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke;
  v17[3] = &unk_1E551DB10;
  v17[4] = self;
  id v18 = v3;
  id v15 = v3;
  +[INSerializedCacheItem serializeCacheableObjects:v5 completion:v17];
}

void __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) remoteObservers];
  v5 = [v4 objectEnumerator];
  v6 = [v5 allObjects];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke_2;
  v8[3] = &unk_1E551DAE8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    v4 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      int v7 = 136315394;
      uint64_t v8 = "-[INExtensionContextIntentResponseObserver _intentResponseDidUpdate:]_block_invoke_2";
      __int16 v9 = 2048;
      uint64_t v10 = [v5 count];
      _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Sending %tu serialized cache items.", (uint8_t *)&v7, 0x16u);
    }
    [v3 intentResponseDidUpdate:*(void *)(a1 + 40) withSerializedCacheItems:*(void *)(a1 + 32)];
  }
  else
  {
    [v3 intentResponseDidUpdate:*(void *)(a1 + 40)];
  }
}

- (void)setObserver:(id)a3 forConnection:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = [(INExtensionContextIntentResponseObserver *)self remoteObservers];
  uint64_t v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (INExtensionContextIntentResponseObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)INExtensionContextIntentResponseObserver;
  v2 = [(INExtensionContextIntentResponseObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    remoteObservers = v2->_remoteObservers;
    v2->_remoteObservers = (NSMapTable *)v3;
  }
  return v2;
}

@end