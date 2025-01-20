@interface IRBiomeProvider
- (IRBiomeProvider)init;
- (IRBiomeProviderInterface)biomeInterface;
- (NSMapTable)eventTypeToObservers;
- (OS_dispatch_queue)internalQueue;
- (id)createStandardBiomeInterface;
- (id)fetchLatestEventsOfEventType:(int64_t)a3 numEvents:(unint64_t)a4;
- (void)addObserver:(id)a3 forEvent:(int64_t)a4;
- (void)notifyObserversOfEvent:(int64_t)a3 withValue:(id)a4;
- (void)removeObserver:(id)a3 forEvent:(int64_t)a4;
- (void)setBiomeInterface:(id)a3;
- (void)subscribe:(int64_t)a3;
- (void)unsubscribe:(int64_t)a3;
@end

@implementation IRBiomeProvider

- (IRBiomeProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)IRBiomeProvider;
  v2 = [(IRBiomeProvider *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.intelligentroutingd.biomeProvider", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    eventTypeToObservers = v2->_eventTypeToObservers;
    v2->_eventTypeToObservers = (NSMapTable *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)subscribe:(int64_t)a3
{
  id v4 = [(IRBiomeProvider *)self biomeInterface];
  [v4 subscribeEvent:a3];
}

- (void)unsubscribe:(int64_t)a3
{
  id v4 = [(IRBiomeProvider *)self biomeInterface];
  [v4 unsubscribeEvent:a3];
}

- (void)addObserver:(id)a3 forEvent:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eventTypeToObservers = self->_eventTypeToObservers;
  objc_super v9 = [NSNumber numberWithInteger:a4];
  v10 = [(NSMapTable *)eventTypeToObservers objectForKey:v9];

  if (!v10)
  {
    v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v12 = self->_eventTypeToObservers;
    v13 = [NSNumber numberWithInteger:a4];
    [(NSMapTable *)v12 setObject:v11 forKey:v13];
  }
  v14 = self->_eventTypeToObservers;
  v15 = [NSNumber numberWithInteger:a4];
  v16 = [(NSMapTable *)v14 objectForKey:v15];
  [v16 addObject:v6];

  v17 = self->_eventTypeToObservers;
  v18 = [NSNumber numberWithInteger:a4];
  v19 = [(NSMapTable *)v17 objectForKey:v18];
  uint64_t v20 = [v19 count];

  v21 = (const void **)MEMORY[0x263F50120];
  v22 = (id *)MEMORY[0x263F50090];
  if (v20 == 1)
  {
    [(IRBiomeProvider *)self subscribe:a4];
    v23 = dispatch_get_specific(*v21);
    v24 = *v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      ((void (*)(int64_t))IRBiomeEventTypeToString)(a4);
      id v25 = objc_claimAutoreleasedReturnValue();
      int v34 = 136315650;
      v35 = "#biome-provider, ";
      __int16 v36 = 2112;
      v37 = v23;
      __int16 v38 = 2080;
      uint64_t v39 = [v25 UTF8String];
      _os_log_impl(&dword_25418E000, v24, OS_LOG_TYPE_DEFAULT, "%s[%@], subscribing to context notification event, %s", (uint8_t *)&v34, 0x20u);
    }
  }
  v26 = dispatch_get_specific(*v21);
  v27 = *v22;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    ((void (*)(int64_t))IRBiomeEventTypeToString)(a4);
    id v28 = objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 UTF8String];
    v30 = self->_eventTypeToObservers;
    v31 = [NSNumber numberWithInteger:a4];
    v32 = [(NSMapTable *)v30 objectForKey:v31];
    uint64_t v33 = [v32 count];
    int v34 = 136315906;
    v35 = "#biome-provider, ";
    __int16 v36 = 2112;
    v37 = v26;
    __int16 v38 = 2080;
    uint64_t v39 = v29;
    __int16 v40 = 2048;
    uint64_t v41 = v33;
    _os_log_impl(&dword_25418E000, v27, OS_LOG_TYPE_DEBUG, "%s[%@], added an observer to context notification event, %s, current number of observers, %lu", (uint8_t *)&v34, 0x2Au);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3 forEvent:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eventTypeToObservers = self->_eventTypeToObservers;
  objc_super v9 = [NSNumber numberWithInteger:a4];
  v10 = [(NSMapTable *)eventTypeToObservers objectForKey:v9];

  if (v10)
  {
    v11 = self->_eventTypeToObservers;
    v12 = [NSNumber numberWithInteger:a4];
    v13 = [(NSMapTable *)v11 objectForKey:v12];
    [v13 removeObject:v6];

    v14 = self->_eventTypeToObservers;
    v15 = [NSNumber numberWithInteger:a4];
    v16 = [(NSMapTable *)v14 objectForKey:v15];
    uint64_t v17 = [v16 count];

    v18 = (const void **)MEMORY[0x263F50120];
    v19 = (id *)MEMORY[0x263F50090];
    if (!v17)
    {
      uint64_t v20 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      v21 = *v19;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        ((void (*)(int64_t))IRBiomeEventTypeToString)(a4);
        id v22 = objc_claimAutoreleasedReturnValue();
        int v32 = 136315650;
        uint64_t v33 = "#biome-provider, ";
        __int16 v34 = 2112;
        v35 = v20;
        __int16 v36 = 2080;
        uint64_t v37 = [v22 UTF8String];
        _os_log_impl(&dword_25418E000, v21, OS_LOG_TYPE_DEFAULT, "%s[%@], unsubscribing to context notification event, %s", (uint8_t *)&v32, 0x20u);
      }
      [(IRBiomeProvider *)self unsubscribe:a4];
    }
    v23 = dispatch_get_specific(*v18);
    v24 = *v19;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      ((void (*)(int64_t))IRBiomeEventTypeToString)(a4);
      id v25 = objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v25 UTF8String];
      v27 = self->_eventTypeToObservers;
      id v28 = [NSNumber numberWithInteger:a4];
      uint64_t v29 = [(NSMapTable *)v27 objectForKey:v28];
      uint64_t v30 = [v29 count];
      int v32 = 136315906;
      uint64_t v33 = "#biome-provider, ";
      __int16 v34 = 2112;
      v35 = v23;
      __int16 v36 = 2080;
      uint64_t v37 = v26;
      __int16 v38 = 2048;
      uint64_t v39 = v30;
      _os_log_impl(&dword_25418E000, v24, OS_LOG_TYPE_DEBUG, "%s[%@], removed an observer to context notification event, %s, current number of observers, %lu", (uint8_t *)&v32, 0x2Au);
    }
  }
  else
  {
    v23 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v24 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      ((void (*)(int64_t))IRBiomeEventTypeToString)(a4);
      id v31 = objc_claimAutoreleasedReturnValue();
      int v32 = 136315650;
      uint64_t v33 = "#biome-provider, ";
      __int16 v34 = 2112;
      v35 = v23;
      __int16 v36 = 2080;
      uint64_t v37 = [v31 UTF8String];
      _os_log_impl(&dword_25418E000, v24, OS_LOG_TYPE_DEFAULT, "%s[%@], asked to remove an observer but no observer registered for event: %s", (uint8_t *)&v32, 0x20u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyObserversOfEvent:(int64_t)a3 withValue:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eventTypeToObservers = self->_eventTypeToObservers;
  v8 = [NSNumber numberWithInteger:a3];
  objc_super v9 = [(NSMapTable *)eventTypeToObservers objectForKey:v8];

  v10 = [[IRBiomeParameters alloc] initWithBiomeEventType:a3];
  v11 = [v6 eventBody];
  [(IRBiomeParameters *)v10 biomeEventClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    switch(a3)
    {
      case 0:
      case 3:
      case 4:
        id v28 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
        uint64_t v29 = (id)*MEMORY[0x263F50090];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          ((void (*)(int64_t))IRBiomeEventTypeToString)(a3);
          id v30 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "#biome-provider, ";
          __int16 v45 = 2112;
          v46 = v28;
          __int16 v47 = 2080;
          uint64_t v48 = [v30 UTF8String];
          _os_log_impl(&dword_25418E000, v29, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - Biome unsupported event on notify] IRBiome, can't notify clients of biome event type %s", buf, 0x20u);
        }
        -[IRBiomeProvider notifyObserversOfEvent:withValue:](v29, v28, (uint64_t *)buf);

        abort();
      case 1:
        v13 = [v6 eventBody];
        v14 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
        v15 = *MEMORY[0x263F50090];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "#biome-provider, ";
          __int16 v45 = 2112;
          v46 = v14;
          _os_log_impl(&dword_25418E000, v15, OS_LOG_TYPE_DEBUG, "%s[%@], Notify clients of a DeviceWiFi event", buf, 0x16u);
        }

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v16 = v9;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (!v17) {
          goto LABEL_29;
        }
        id v31 = v9;
        id v32 = v6;
        uint64_t v18 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v20 provider:self didUpdateDeviceWiFi:v13];
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v17);
        break;
      case 2:
        v13 = [v6 eventBody];
        id v22 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
        v23 = *MEMORY[0x263F50090];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "#biome-provider, ";
          __int16 v45 = 2112;
          v46 = v22;
          _os_log_impl(&dword_25418E000, v23, OS_LOG_TYPE_DEBUG, "%s[%@], Notify clients of a MediaRoute event", buf, 0x16u);
        }

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v16 = v9;
        uint64_t v24 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (!v24) {
          goto LABEL_29;
        }
        id v31 = v9;
        id v32 = v6;
        uint64_t v25 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v16);
            }
            v27 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              [v27 provider:self didUpdateMediaRoute:v13];
            }
          }
          uint64_t v24 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v24);
        break;
      default:
        goto LABEL_30;
    }
    objc_super v9 = v31;
    id v6 = v32;
  }
  else
  {
    v13 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v16 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      ((void (*)(int64_t))IRBiomeEventTypeToString)(a3);
      id v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "#biome-provider, ";
      __int16 v45 = 2112;
      v46 = v13;
      __int16 v47 = 2080;
      uint64_t v48 = [v21 UTF8String];
      _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Biome event missmatch] received biome event data doesn't match event type, %s", buf, 0x20u);
    }
  }
LABEL_29:

LABEL_30:
  os_unfair_lock_unlock(lock);
}

- (id)fetchLatestEventsOfEventType:(int64_t)a3 numEvents:(unint64_t)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(IRBiomeProvider *)self biomeInterface];
  objc_super v9 = [v8 fetchLatestEventsOfEventType:a3 numEvents:a4];

  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)createStandardBiomeInterface
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [[IRBiomeBridge alloc] initWithBiomeProvider:self targetQueue:self->_internalQueue];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (IRBiomeProviderInterface)biomeInterface
{
  return self->_biomeInterface;
}

- (void)setBiomeInterface:(id)a3
{
}

- (NSMapTable)eventTypeToObservers
{
  return self->_eventTypeToObservers;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_eventTypeToObservers, 0);

  objc_storeStrong((id *)&self->_biomeInterface, 0);
}

- (void)notifyObserversOfEvent:(uint64_t *)a3 withValue:.cold.1(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];

  uint64_t v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  *a3 = v5;
  id v6 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v7 = 136316162;
    v8 = "#biome-provider, ";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2080;
    v12 = "/Library/Caches/com.apple.xbs/Sources/IntelligentRouting/IntelligentRoutingDaemon/DataProviders/Biome/IRBiomeProvider.m";
    __int16 v13 = 1024;
    int v14 = 138;
    __int16 v15 = 2080;
    v16 = "-[IRBiomeProvider notifyObserversOfEvent:withValue:]";
    _os_log_impl(&dword_25418E000, v6, OS_LOG_TYPE_INFO, "%s[%@], %s:%d: assertion failure in %s", (uint8_t *)&v7, 0x30u);
  }
}

@end