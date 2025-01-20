@interface ACCUserNotificationManager
+ (id)sharedManager;
- (ACCUserNotificationManager)init;
- (NSMutableDictionary)completionHandlers;
- (NSMutableSet)userNotifications;
- (NSRecursiveLock)lock;
- (OS_dispatch_queue)queue;
- (id)userNotificationWithUUID:(id)a3;
- (void)dismissNotification:(id)a3;
- (void)dismissNotificationWithIdentifier:(id)a3;
- (void)dismissNotificationsWithGroupIdentifier:(id)a3;
- (void)dismisssAllNotifications;
- (void)presentNotification:(id)a3 completionHandler:(id)a4;
- (void)removeUserNotification:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setLock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUserNotifications:(id)a3;
@end

@implementation ACCUserNotificationManager

- (ACCUserNotificationManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)ACCUserNotificationManager;
  v2 = [(ACCUserNotificationManager *)&v14 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSMutableSet set];
    userNotifications = v2->_userNotifications;
    v2->_userNotifications = (NSMutableSet *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableDictionary *)v9;

    v11 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v11;
  }
  return v2;
}

- (void)presentNotification:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 identifier];

    if (v8)
    {
      uint64_t v9 = [v6 identifier];
      [(ACCUserNotificationManager *)self dismissNotificationWithIdentifier:v9];
    }
    v10 = [(ACCUserNotificationManager *)self lock];
    [v10 lock];

    v11 = [(ACCUserNotificationManager *)self userNotifications];
    [v11 addObject:v6];

    if (v7)
    {
      v12 = [(ACCUserNotificationManager *)self completionHandlers];
      id v13 = objc_retainBlock(v7);
      objc_super v14 = [v6 uuid];
      [v12 setObject:v13 forKey:v14];
    }
    v15 = [(ACCUserNotificationManager *)self lock];
    [v15 unlock];

    [v6 createBackingUserNotification];
    v16 = [v6 userNotificationCFDict];

    if (v16)
    {
      unsigned int v17 = [v6 type] - 1;
      if (v17 > 2) {
        CFOptionFlags v18 = 3;
      }
      else {
        CFOptionFlags v18 = qword_1001B8778[v17];
      }
      SInt32 error = 0;
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
      CFDictionaryRef v19 = [v6 userNotificationCFDict];
      CFUserNotificationRef v20 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v18, &error, v19);

      unint64_t v38 = (unint64_t)v20;
      if (error || !v36[3])
      {
        v21 = [(ACCUserNotificationManager *)self lock];
        [v21 lock];

        [v6 setUserNotificationCF:0];
        v22 = [(ACCUserNotificationManager *)self lock];
        [v22 unlock];

        v23 = (const void *)v36[3];
        if (v23)
        {
          CFRelease(v23);
          v36[3] = 0;
        }
      }
      else
      {
        v24 = [(ACCUserNotificationManager *)self lock];
        [v24 lock];

        [v6 setUserNotificationCF:v36[3]];
        v25 = [(ACCUserNotificationManager *)self lock];
        [v25 unlock];

        [v6 timeout];
        if (v26 > 0.0)
        {
          [v6 timeout];
          dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke;
          block[3] = &unk_100215968;
          block[4] = self;
          id v34 = v6;
          dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);
        }
        v29 = [(ACCUserNotificationManager *)self queue];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke_2;
        v30[3] = &unk_100215918;
        v32 = &v35;
        v30[4] = self;
        id v31 = v6;
        dispatch_async(v29, v30);
      }
      _Block_object_dispose(&v35, 8);
    }
  }
}

id __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissNotification:*(void *)(a1 + 40)];
}

void __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke_2(uint64_t a1)
{
  CFOptionFlags responseFlags = 3;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0.0, &responseFlags);
  CFOptionFlags v2 = responseFlags;
  v3 = [*(id *)(a1 + 32) lock];
  [v3 lock];

  id v4 = [*(id *)(a1 + 32) completionHandlers];
  dispatch_queue_t v5 = [*(id *)(a1 + 40) uuid];
  id v6 = [v4 objectForKey:v5];

  [*(id *)(a1 + 40) setUserNotificationCF:0];
  id v7 = [*(id *)(a1 + 32) lock];
  [v7 unlock];

  if (v6)
  {
    if (v2 == 1) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = 2;
    }
    if (v2) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    v6[2](v6, v9);
  }
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  [*(id *)(a1 + 32) removeUserNotification:*(void *)(a1 + 40)];
}

- (void)dismissNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    dispatch_queue_t v5 = [(ACCUserNotificationManager *)self lock];
    [v5 lock];

    id v6 = (__CFUserNotification *)[v10 userNotificationCF];
    if (v6)
    {
      id v7 = v6;
      CFRetain(v6);
      unsigned int v8 = [(ACCUserNotificationManager *)self lock];
      [v8 unlock];

      CFUserNotificationCancel(v7);
      CFRelease(v7);
    }
    else
    {
      uint64_t v9 = [(ACCUserNotificationManager *)self lock];
      [v9 unlock];
    }
    id v4 = v10;
  }
}

- (void)dismissNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = [(ACCUserNotificationManager *)self lock];
    [v5 lock];

    id v6 = +[NSMutableSet set];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [(ACCUserNotificationManager *)self userNotifications];
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v13 = [v12 identifier];
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          -[ACCUserNotificationManager dismissNotification:](self, "dismissNotification:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21);
        }
        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }

    CFUserNotificationRef v20 = [(ACCUserNotificationManager *)self lock];
    [v20 unlock];
  }
}

- (void)dismissNotificationsWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = [(ACCUserNotificationManager *)self lock];
    [v5 lock];

    id v6 = +[NSMutableSet set];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [(ACCUserNotificationManager *)self userNotifications];
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v13 = [v12 groupIdentifier];
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          -[ACCUserNotificationManager dismissNotification:](self, "dismissNotification:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21);
        }
        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }

    CFUserNotificationRef v20 = [(ACCUserNotificationManager *)self lock];
    [v20 unlock];
  }
}

- (void)dismisssAllNotifications
{
  v3 = [(ACCUserNotificationManager *)self lock];
  [v3 lock];

  id v4 = [(ACCUserNotificationManager *)self userNotifications];
  id v5 = [v4 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ACCUserNotificationManager dismissNotification:](self, "dismissNotification:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v11 = [(ACCUserNotificationManager *)self lock];
  [v11 unlock];
}

- (id)userNotificationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCUserNotificationManager *)self lock];
  [v5 lock];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(ACCUserNotificationManager *)self userNotifications];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 uuid];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v13 = [(ACCUserNotificationManager *)self lock];
  [v13 unlock];

  return v7;
}

- (void)removeUserNotification:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(ACCUserNotificationManager *)self lock];
    [v5 lock];

    id v6 = [(ACCUserNotificationManager *)self userNotifications];
    [v6 removeObject:v4];

    id v7 = [(ACCUserNotificationManager *)self completionHandlers];
    uint64_t v8 = [v4 uuid];
    [v7 removeObjectForKey:v8];

    [v4 setUserNotificationCF:0];
    id v9 = [(ACCUserNotificationManager *)self lock];
    [v9 unlock];
  }
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__ACCUserNotificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_5 != -1) {
    dispatch_once(&sharedManager_once_5, block);
  }
  CFOptionFlags v2 = (void *)sharedManager_sharedInstance_5;

  return v2;
}

uint64_t __43__ACCUserNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_5 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)userNotifications
{
  return self->_userNotifications;
}

- (void)setUserNotifications:(id)a3
{
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_userNotifications, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end