@interface _GCCurrentApplicationForegroundMonitor
+ (id)sharedInstance;
- (BOOL)isAppInBackground;
- (_GCCurrentApplicationForegroundMonitor)init;
- (void)CBApplicationDidBecomeActive;
- (void)CBApplicationDidBecomeActive:(id)a3;
- (void)CBApplicationWillResignActive;
- (void)CBApplicationWillResignActive:(id)a3;
- (void)addObserver:(int)a3 notifyCurrent:;
- (void)addObserver:(void *)a1;
- (void)removeObserver:(void *)a1;
@end

@implementation _GCCurrentApplicationForegroundMonitor

+ (id)sharedInstance
{
  self;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)sharedInstance_Shared;

  return v0;
}

- (_GCCurrentApplicationForegroundMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)_GCCurrentApplicationForegroundMonitor;
  v2 = [(_GCCurrentApplicationForegroundMonitor *)&v11 init];
  uint64_t v3 = objc_opt_new();
  observers = v2->_observers;
  v2->_observers = (NSMutableSet *)v3;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __46___GCCurrentApplicationForegroundMonitor_init__block_invoke;
  v9[3] = &unk_26D22A8C0;
  v5 = v2;
  v10 = v5;
  v6 = (void (**)(void))MEMORY[0x223C6E420](v9);
  if (+[NSThread isMainThread]) {
    v6[2](v6);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
  v7 = v5;

  return v7;
}

- (BOOL)isAppInBackground
{
  return atomic_load_explicit((atomic_uchar *volatile)&self->_appInBackground, memory_order_acquire) & 1;
}

- (void)addObserver:(int)a3 notifyCurrent:
{
  id v5 = a2;
  if (a1)
  {
    if (a3)
    {
      if (+[NSThread isMainThread])
      {
        -[_GCCurrentApplicationForegroundMonitor addObserver:](a1, v5);
        if ([a1 isAppInBackground]) {
          [v5 CBApplicationWillResignActive];
        }
        else {
          [v5 CBApplicationDidBecomeActive];
        }
      }
      else
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = __68___GCCurrentApplicationForegroundMonitor_addObserver_notifyCurrent___block_invoke;
        v6[3] = &unk_26D22A8E8;
        v6[4] = a1;
        id v7 = v5;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
      }
    }
    else
    {
      -[_GCCurrentApplicationForegroundMonitor addObserver:](a1, v5);
    }
  }
}

- (void)addObserver:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    uint64_t v3 = a1;
    objc_sync_enter(v3);
    [v3[1] addObject:v4];
    objc_sync_exit(v3);
  }
}

- (void)removeObserver:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    uint64_t v3 = a1;
    objc_sync_enter(v3);
    [v3[1] removeObject:v4];
    objc_sync_exit(v3);
  }
}

- (void)CBApplicationDidBecomeActive
{
  if (a1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    id v2 = a1;
    objc_sync_enter(v2);
    uint64_t v3 = (void *)[*((id *)v2 + 1) copy];
    objc_sync_exit(v2);

    id v4 = _os_activity_create(&dword_220998000, "Notify ApplicationDidBecomeActive ", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    [v2 willChangeValueForKey:@"appInBackground"];
    atomic_store(0, (unsigned __int8 *)v2 + 16);
    [v2 didChangeValueForKey:@"appInBackground"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "CBApplicationDidBecomeActive", (void)v10);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"GCApplicationDidBecomeActiveNotification" object:0 userInfo:0];

    os_activity_scope_leave(&state);
  }
}

- (void)CBApplicationWillResignActive
{
  if (a1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    id v2 = a1;
    objc_sync_enter(v2);
    uint64_t v3 = (void *)[*((id *)v2 + 1) copy];
    objc_sync_exit(v2);

    id v4 = _os_activity_create(&dword_220998000, "Notify ApplicationWillResignActive ", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    [v2 willChangeValueForKey:@"appInBackground"];
    atomic_store(1u, (unsigned __int8 *)v2 + 16);
    [v2 didChangeValueForKey:@"appInBackground"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "CBApplicationWillResignActive", (void)v10);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"GCApplicationWillResignActiveNotification" object:0 userInfo:0];

    os_activity_scope_leave(&state);
  }
}

- (void)CBApplicationDidBecomeActive:(id)a3
{
  if (+[NSThread isMainThread])
  {
    -[_GCCurrentApplicationForegroundMonitor CBApplicationDidBecomeActive](self);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71___GCCurrentApplicationForegroundMonitor_CBApplicationDidBecomeActive___block_invoke;
    block[3] = &unk_26D22A8C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)CBApplicationWillResignActive:(id)a3
{
  if (+[NSThread isMainThread])
  {
    -[_GCCurrentApplicationForegroundMonitor CBApplicationWillResignActive](self);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __72___GCCurrentApplicationForegroundMonitor_CBApplicationWillResignActive___block_invoke;
    block[3] = &unk_26D22A8C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void).cxx_destruct
{
}

@end