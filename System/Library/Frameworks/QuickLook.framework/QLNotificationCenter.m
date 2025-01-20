@interface QLNotificationCenter
+ (id)sharedInstance;
- (BOOL)_tryPostingNotificationName:(id)a3 userInfo:(id)a4;
- (QLNotificationCenter)init;
- (int64_t)_indexOfObserver:(id)a3;
- (void)_bufferNotificationName:(id)a3 userInfo:(id)a4;
- (void)_sendEnqueuedNotifications;
- (void)postNotificationName:(id)a3 userInfo:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setRemoteNotificationCenter:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation QLNotificationCenter

- (QLNotificationCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)QLNotificationCenter;
  v2 = [(QLNotificationCenter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bufferedNotifications = v2->_bufferedNotifications;
    v2->_bufferedNotifications = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  v2 = (void *)_QLNotificationCenterSharedInstance;
  if (!_QLNotificationCenterSharedInstance)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__QLNotificationCenter_sharedInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedInstance_onceToken != -1) {
      dispatch_once(&sharedInstance_onceToken, block);
    }
    v2 = (void *)_QLNotificationCenterSharedInstance;
  }

  return v2;
}

uint64_t __38__QLNotificationCenter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _QLNotificationCenterSharedInstance;
  _QLNotificationCenterSharedInstance = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (![(QLNotificationCenter *)v7 _tryPostingNotificationName:v10 userInfo:v6])
  {
    objc_super v8 = (void *)[v10 copy];
    v9 = (void *)[v6 copy];
    [(QLNotificationCenter *)v7 _bufferNotificationName:v8 userInfo:v9];
  }
  objc_sync_exit(v7);
}

- (BOOL)_tryPostingNotificationName:(id)a3 userInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSPointerArray *)v8->_observers count];
  remoteNotificationCenter = v8->_remoteNotificationCenter;
  if (v9)
  {
    if (!remoteNotificationCenter)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v11 = v8->_observers;
      uint64_t v12 = [(NSPointerArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "notification:userInfo:", v6, v7, (void)v17);
          }
          uint64_t v12 = [(NSPointerArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }

      goto LABEL_13;
    }
  }
  else if (!remoteNotificationCenter)
  {
    BOOL v15 = 0;
    goto LABEL_14;
  }
  [(QLNotificationCenterProtocol *)remoteNotificationCenter postNotificationName:v6 userInfo:v7];
LABEL_13:
  BOOL v15 = 1;
LABEL_14:
  objc_sync_exit(v8);

  return v15;
}

- (void)_bufferNotificationName:(id)a3 userInfo:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  objc_sync_enter(v8);
  bufferedNotifications = v8->_bufferedNotifications;
  v12[0] = @"_notificationName";
  v12[1] = @"_userInfo";
  v13[0] = v6;
  id v10 = v7;
  if (!v7)
  {
    id v10 = [MEMORY[0x263EFF9D0] null];
  }
  v13[1] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [(NSMutableArray *)bufferedNotifications addObject:v11];

  if (!v7) {
  objc_sync_exit(v8);
  }
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ([(QLNotificationCenter *)v4 _indexOfObserver:v5] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSPointerArray *)v4->_observers addPointer:v5];
    [(QLNotificationCenter *)v4 _sendEnqueuedNotifications];
  }
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(QLNotificationCenter *)v4 _indexOfObserver:v6];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSPointerArray *)v4->_observers removePointerAtIndex:v5];
    [(NSPointerArray *)v4->_observers compact];
  }
  objc_sync_exit(v4);
}

- (void)setRemoteNotificationCenter:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_remoteNotificationCenter, a3);
  if (v5->_remoteNotificationCenter) {
    [(QLNotificationCenter *)v5 _sendEnqueuedNotifications];
  }
  objc_sync_exit(v5);
}

- (int64_t)_indexOfObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (void *)[(NSPointerArray *)v5->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(id *)(*((void *)&v14 + 1) + 8 * v10) == v4)
        {
          int64_t v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  objc_sync_exit(v5);
  return v12;
}

- (void)_sendEnqueuedNotifications
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ([(NSMutableArray *)v2->_bufferedNotifications count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = (void *)[(NSMutableArray *)v2->_bufferedNotifications copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v8 = [v7 objectForKeyedSubscript:@"_notificationName"];
          uint64_t v9 = [v7 objectForKeyedSubscript:@"_userInfo"];
          BOOL v10 = [(QLNotificationCenter *)v2 _tryPostingNotificationName:v8 userInfo:v9];

          if (v10) {
            [(NSMutableArray *)v2->_bufferedNotifications removeObject:v7];
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedNotifications, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_remoteNotificationCenter, 0);
}

@end