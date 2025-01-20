@interface CalDistributedNotificationCenter
+ (id)defaultCenter;
+ (void)_addHandler:(id)a3 toObserver:(id)a4;
+ (void)_clearHandlersForObserver:(id)a3;
+ (void)_handleNotification:(id)a3;
+ (void)_removeHandler:(id)a3 fromObserver:(id)a4;
+ (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5;
+ (void)removeObserver:(id)a3;
+ (void)removeObserver:(id)a3 name:(id)a4;
- (CalDistributedNotificationCenter)init;
- (NSMutableDictionary)handlers;
- (void)setHandlers:(id)a3;
@end

@implementation CalDistributedNotificationCenter

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)defaultCenter_center;

  return v2;
}

uint64_t __49__CalDistributedNotificationCenter_defaultCenter__block_invoke()
{
  defaultCenter_center = objc_alloc_init(CalDistributedNotificationCenter);

  return MEMORY[0x1F41817F8]();
}

- (CalDistributedNotificationCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalDistributedNotificationCenter;
  v2 = [(CalDistributedNotificationCenter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  name = (__CFString *)a5;
  id v8 = a3;
  v9 = +[CalDistributedNotificationCenter defaultCenter];
  v10 = [[CalDistributedNotificationHandler alloc] initWithObserver:v8 selector:a4];
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  [a1 _addHandler:v10 toObserver:v8];

  v11 = [v9 handlers];
  v12 = [v11 objectForKeyedSubscript:name];
  if (!v12)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
    [v11 setObject:v12 forKeyedSubscript:name];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, +[CalDistributedNotificationCenter defaultCenter], (CFNotificationCallback)_notificationCallback, name, 0, (CFNotificationSuspensionBehavior)0);
  }
  [v12 addObject:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
}

+ (void)removeObserver:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[CalDistributedNotificationCenter defaultCenter];
  context = (void *)MEMORY[0x192FD85E0]();
  center = CFNotificationCenterGetDarwinNotifyCenter();
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  [a1 _clearHandlersForObserver:v4];
  v24 = v5;
  [v5 handlers];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v29 = long long v41 = 0u;
  obuint64_t j = [v29 allKeys];
  uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v7 = *(const __CFString **)(*((void *)&v38 + 1) + 8 * i);
        id v8 = [v29 objectForKeyedSubscript:v7];
        v9 = objc_opt_new();
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v10 = [v8 allObjects];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v35 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              id v16 = [v15 observer];
              if (v16) {
                BOOL v17 = v16 == v4;
              }
              else {
                BOOL v17 = 1;
              }
              if (v17) {
                [v9 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v12);
        }

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v18 = v9;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v31;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v18);
              }
              [v8 removeObject:*(void *)(*((void *)&v30 + 1) + 8 * k)];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v20);
        }

        if (![v8 count])
        {
          [v29 removeObjectForKey:v7];
          CFNotificationCenterRemoveObserver(center, +[CalDistributedNotificationCenter defaultCenter], v7, 0);
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v28);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
}

+ (void)removeObserver:(id)a3 name:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFStringRef v7 = (__CFString *)a4;
  id v8 = +[CalDistributedNotificationCenter defaultCenter];
  context = (void *)MEMORY[0x192FD85E0]();
  center = CFNotificationCenterGetDarwinNotifyCenter();
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  v29 = v8;
  v9 = [v8 handlers];
  long long v30 = v7;
  v10 = [v9 objectForKeyedSubscript:v7];
  uint64_t v11 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v12 = [v10 allObjects];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend(v17, "observer", center, context);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18) {
          BOOL v19 = v18 == v6;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          [a1 _removeHandler:v17 fromObserver:v6];
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = v11;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(v10, "removeObject:", *(void *)(*((void *)&v31 + 1) + 8 * j), center);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  v25 = [v10 allObjects];
  uint64_t v26 = [v25 count];

  if (!v26)
  {
    [v9 removeObjectForKey:v30];
    CFNotificationCenterRemoveObserver(center, v29, v30, 0);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
}

+ (void)_handleNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__CFString *)a3;
  id v4 = +[CalDistributedNotificationCenter defaultCenter];
  os_unfair_lock_lock((os_unfair_lock_t)&handlersLock);
  v5 = [v4 handlers];
  id v6 = [v5 objectForKeyedSubscript:v3];

  if (!v6) {
    goto LABEL_13;
  }
  CFStringRef v7 = [v6 allObjects];
  if (![v7 count])
  {
    uint64_t v13 = [v4 handlers];
    [v13 removeObjectForKey:v3];

    goto LABEL_13;
  }
  if (!v7)
  {
LABEL_13:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v4, v3, 0);

    os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
    goto LABEL_14;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&handlersLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "handleNotification:", v3, (void)v15);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

LABEL_14:
}

+ (void)_addHandler:(id)a3 toObserver:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&handlersLock);
  id v6 = objc_getAssociatedObject(v5, &handlersForObserverKey);
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    objc_setAssociatedObject(v5, &handlersForObserverKey, v6, (void *)1);
  }
  [v6 addObject:v7];
}

+ (void)_removeHandler:(id)a3 fromObserver:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&handlersLock);
  id v7 = objc_getAssociatedObject(v6, &handlersForObserverKey);
  id v8 = v7;
  if (v7)
  {
    [v7 removeObject:v9];
    if (![v8 count]) {
      [a1 _clearHandlersForObserver:v6];
    }
  }
}

+ (void)_clearHandlersForObserver:(id)a3
{
  id object = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&handlersLock);
  objc_setAssociatedObject(object, &handlersForObserverKey, 0, (void *)1);
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end