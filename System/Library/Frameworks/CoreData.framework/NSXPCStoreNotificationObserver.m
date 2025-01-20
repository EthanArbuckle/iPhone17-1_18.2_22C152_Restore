@interface NSXPCStoreNotificationObserver
- (id)initForObservationWithName:(id)a3 store:(id)a4;
- (id)setStore:(id *)result;
- (void)dealloc;
@end

@implementation NSXPCStoreNotificationObserver

- (id)initForObservationWithName:(id)a3 store:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)NSXPCStoreNotificationObserver;
  v6 = [(NSXPCStoreNotificationObserver *)&v22 init];
  v7 = v6;
  if (v6)
  {
    v6->_token = -1;
    v6->_storeID = (NSString *)objc_msgSend((id)objc_msgSend(a4, "identifier"), "copy");
    objc_storeWeak((id *)&v7->_psc, (id)[a4 persistentStoreCoordinator]);
    v8 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"com.apple.CoreData.%@.%p", a3, v7), "UTF8String"];
    v7->_queue = (OS_dispatch_queue *)dispatch_queue_create(v8, MEMORY[0x1E4F14430]);
    objc_initWeak(&location, v7);
    v9 = (const char *)[a3 fileSystemRepresentation];
    queue = v7->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __67__NSXPCStoreNotificationObserver_initForObservationWithName_store___block_invoke;
    handler[3] = &unk_1E544C008;
    handler[4] = v7;
    objc_copyWeak(&v20, &location);
    uint64_t v11 = notify_register_dispatch(v9, &v7->_token, queue, handler);
    if (v11)
    {
      _NSCoreDataLog(1, @" Failed to setup notification listener: %d", v12, v13, v14, v15, v16, v17, v11);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      return 0;
    }
    else
    {
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  return v7;
}

id __67__NSXPCStoreNotificationObserver_initForObservationWithName_store___block_invoke(uint64_t a1, int a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    uint64_t v8 = Weak[4];
    id v9 = (id)[WeakRetained persistentStoreForIdentifier:v8];
    uint64_t v16 = v9;
    if (WeakRetained && v9)
    {
      _NSCoreDataLog(8, @"Remote Change Notification - posting NSRemotePersistentStoreDidChangeNotification for store  %@ ", v10, v11, v12, v13, v14, v15, v8);
      [v5 postNotificationName:@"NSRemotePersistentStoreDidChangeNotification" object:v16];
      uint64_t state64 = 0;
      notify_get_state(a2, &state64);
      _NSCoreDataLog(8, @"Remote Change Notification - PSC to post notification for store  %@ with state %ld", v17, v18, v19, v20, v21, v22, v8);
      -[NSPersistentStoreCoordinator _postStoreRemoteChangeNotificationsForStore:andState:]((uint64_t)WeakRetained, v16, state64);
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  [v4 drain];
  return 0;
}

- (void)dealloc
{
  int token = self->_token;
  if (token != -1)
  {
    notify_cancel(token);
    self->_int token = -1;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  objc_storeWeak((id *)&self->_psc, 0);

  self->_storeID = 0;
  v5.receiver = self;
  v5.super_class = (Class)NSXPCStoreNotificationObserver;
  [(NSXPCStoreNotificationObserver *)&v5 dealloc];
}

- (id)setStore:(id *)result
{
  if (result)
  {
    v3 = result;
    objc_sync_enter(result);

    v3[4] = (id)objc_msgSend((id)objc_msgSend(a2, "identifier"), "copy");
    return (id *)objc_sync_exit(v3);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end