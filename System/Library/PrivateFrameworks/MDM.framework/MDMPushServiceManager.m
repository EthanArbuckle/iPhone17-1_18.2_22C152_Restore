@interface MDMPushServiceManager
- (MDMPushServiceConnection)devAPSConnection;
- (MDMPushServiceConnection)prodAPSConnection;
- (MDMPushServiceManager)initWithChannel:(unint64_t)a3;
- (NSMutableArray)observers;
- (OS_dispatch_queue)notificationQueue;
- (id)_connectionForEnvironment:(unint64_t)a3;
- (id)_staticTopics;
- (unint64_t)_environmentForConnection:(id)a3;
- (unint64_t)channel;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_setupConnectionForEnvironmentIfNeeded:(unint64_t)a3;
- (void)_startListeningForPushMessageWithTopic:(id)a3 environment:(unint64_t)a4;
- (void)_stopListeningForPushMessageWithTopic:(id)a3 environment:(unint64_t)a4;
- (void)_stopProdConnectionForEnvironmentIfNeeded:(unint64_t)a3;
- (void)_trimEnabledPushTopicsForEnvironment:(unint64_t)a3 filterBlock:(id)a4;
- (void)addPushServiceObserver:(id)a3;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)requestAppTokenForTopic:(id)a3 environment:(unint64_t)a4;
- (void)requestPublicTokenWithEnvironment:(unint64_t)a3;
- (void)setChannel:(unint64_t)a3;
- (void)setDevAPSConnection:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProdAPSConnection:(id)a3;
- (void)startListeningForDEPPushMessage;
- (void)stopListeningForAllMDMPushMessagesWithEnvironment:(unint64_t)a3;
- (void)stopListeningForDEPPushMessage;
@end

@implementation MDMPushServiceManager

- (MDMPushServiceManager)initWithChannel:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MDMPushServiceManager;
  v4 = [(MDMPushServiceManager *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_channel = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MDMPushServiceManager.worker-queue", 0);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    observers = v5->_observers;
    v5->_observers = (NSMutableArray *)v8;
  }
  return v5;
}

- (void)dealloc
{
  [(MDMPushServiceManager *)self _stopProdConnectionForEnvironmentIfNeeded:0];
  [(MDMPushServiceManager *)self _stopProdConnectionForEnvironmentIfNeeded:1];
  v3.receiver = self;
  v3.super_class = (Class)MDMPushServiceManager;
  [(MDMPushServiceManager *)&v3 dealloc];
}

- (void)addPushServiceObserver:(id)a3
{
  observers = self->_observers;
  id v4 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
  [(NSMutableArray *)observers addObject:v4];
}

- (void)requestPublicTokenWithEnvironment:(unint64_t)a3
{
  v5 = [(MDMPushServiceManager *)self notificationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke;
  v6[3] = &unk_264B9E040;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupConnectionForEnvironmentIfNeeded:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) _connectionForEnvironment:*(void *)(a1 + 40)];
  objc_super v3 = [v2 publicToken];
  id v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke_2;
    v8[3] = &unk_264B9E018;
    v8[4] = v5;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    [v5 _notifyObserversWithBlock:v8];
  }
}

uint64_t __59__MDMPushServiceManager_requestPublicTokenWithEnvironment___block_invoke_2(void *a1, void *a2)
{
  return [a2 pushServiceManager:a1[4] didReceivePublicToken:a1[5] forEnvironment:a1[6]];
}

- (void)requestAppTokenForTopic:(id)a3 environment:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(MDMPushServiceManager *)self notificationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__MDMPushServiceManager_requestAppTokenForTopic_environment___block_invoke;
  block[3] = &unk_264B9E068;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __61__MDMPushServiceManager_requestAppTokenForTopic_environment___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupConnectionForEnvironmentIfNeeded:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) _connectionForEnvironment:*(void *)(a1 + 48)];
  [v2 requestAppTokenForTopic:*(void *)(a1 + 40)];
}

- (void)stopListeningForAllMDMPushMessagesWithEnvironment:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__MDMPushServiceManager_stopListeningForAllMDMPushMessagesWithEnvironment___block_invoke;
  v3[3] = &unk_264B9E090;
  v3[4] = self;
  [(MDMPushServiceManager *)self _trimEnabledPushTopicsForEnvironment:a3 filterBlock:v3];
}

uint64_t __75__MDMPushServiceManager_stopListeningForAllMDMPushMessagesWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _staticTopics];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void)startListeningForDEPPushMessage
{
}

- (void)stopListeningForDEPPushMessage
{
}

- (id)_staticTopics
{
  if (_staticTopics_onceToken != -1) {
    dispatch_once(&_staticTopics_onceToken, &__block_literal_global_3);
  }
  id v2 = (void *)_staticTopics_set;
  return v2;
}

void __38__MDMPushServiceManager__staticTopics__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"com.apple.dep.apns";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)_staticTopics_set;
  _staticTopics_set = v2;
}

- (void)_setupConnectionForEnvironmentIfNeeded:(unint64_t)a3
{
  uint64_t v5 = -[MDMPushServiceManager _connectionForEnvironment:](self, "_connectionForEnvironment:");

  if (!v5)
  {
    unint64_t v6 = [(MDMPushServiceManager *)self channel];
    uint64_t v7 = [(MDMPushServiceManager *)self notificationQueue];
    id v8 = +[MDMPushServiceConnection connectionWithEnvironment:a3 channel:v6 queue:v7];

    [v8 setDelegate:self];
    if (a3) {
      [(MDMPushServiceManager *)self setDevAPSConnection:v8];
    }
    else {
      [(MDMPushServiceManager *)self setProdAPSConnection:v8];
    }
  }
}

- (void)_stopProdConnectionForEnvironmentIfNeeded:(unint64_t)a3
{
  uint64_t v5 = -[MDMPushServiceManager _connectionForEnvironment:](self, "_connectionForEnvironment:");
  if (v5)
  {
    id v10 = v5;
    [v5 shutdown];
    if (a3 == 1)
    {
      id v8 = [(MDMPushServiceManager *)self devAPSConnection];

      uint64_t v5 = v10;
      if (!v8) {
        goto LABEL_9;
      }
      id v9 = [(MDMPushServiceManager *)self devAPSConnection];
      [v9 shutdown];

      [(MDMPushServiceManager *)self setDevAPSConnection:0];
      goto LABEL_8;
    }
    uint64_t v5 = v10;
    if (!a3)
    {
      unint64_t v6 = [(MDMPushServiceManager *)self prodAPSConnection];

      uint64_t v5 = v10;
      if (v6)
      {
        uint64_t v7 = [(MDMPushServiceManager *)self prodAPSConnection];
        [v7 shutdown];

        [(MDMPushServiceManager *)self setProdAPSConnection:0];
LABEL_8:
        uint64_t v5 = v10;
      }
    }
  }
LABEL_9:
}

- (id)_connectionForEnvironment:(unint64_t)a3
{
  if (a3) {
    [(MDMPushServiceManager *)self devAPSConnection];
  }
  else {
  id v3 = [(MDMPushServiceManager *)self prodAPSConnection];
  }
  return v3;
}

- (unint64_t)_environmentForConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMPushServiceManager *)self prodAPSConnection];

  if (v5 == v4)
  {
    unint64_t v7 = 0;
  }
  else
  {
    id v6 = [(MDMPushServiceManager *)self devAPSConnection];
    unint64_t v7 = v6 == v4;
  }
  return v7;
}

- (void)_startListeningForPushMessageWithTopic:(id)a3 environment:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(MDMPushServiceManager *)self notificationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__MDMPushServiceManager__startListeningForPushMessageWithTopic_environment___block_invoke;
  block[3] = &unk_264B9E068;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __76__MDMPushServiceManager__startListeningForPushMessageWithTopic_environment___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupConnectionForEnvironmentIfNeeded:*(void *)(a1 + 48)];
  id v7 = [*(id *)(a1 + 32) _connectionForEnvironment:*(void *)(a1 + 48)];
  uint64_t v2 = [v7 enabledTopics];
  id v3 = (void *)[v2 mutableCopy];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;

  if (([v6 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [v6 addObject:*(void *)(a1 + 40)];
    [v7 _setEnabledTopics:v6];
  }
}

- (void)_stopListeningForPushMessageWithTopic:(id)a3 environment:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__MDMPushServiceManager__stopListeningForPushMessageWithTopic_environment___block_invoke;
  v8[3] = &unk_264B9E090;
  id v9 = v6;
  id v7 = v6;
  [(MDMPushServiceManager *)self _trimEnabledPushTopicsForEnvironment:a4 filterBlock:v8];
}

uint64_t __75__MDMPushServiceManager__stopListeningForPushMessageWithTopic_environment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)] ^ 1;
}

- (void)_trimEnabledPushTopicsForEnvironment:(unint64_t)a3 filterBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(MDMPushServiceManager *)self notificationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke;
  block[3] = &unk_264B9E0E0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _connectionForEnvironment:*(void *)(a1 + 48)];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 enabledTopics];
    id v5 = (void *)[v4 mutableCopy];

    id v6 = (void *)MEMORY[0x263F08A98];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke_2;
    v8[3] = &unk_264B9E0B8;
    id v9 = *(id *)(a1 + 40);
    id v7 = [v6 predicateWithBlock:v8];
    [v5 filterUsingPredicate:v7];

    [v3 _setEnabledTopics:v5];
  }
}

uint64_t __74__MDMPushServiceManager__trimEnabledPushTopicsForEnvironment_filterBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(MDMPushServiceManager *)self observers];
  id v6 = (void *)[v5 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "nonretainedObjectValue", (void)v15);
        if (v13)
        {
          v4[2](v4, v13);
        }
        else
        {
          v14 = [(MDMPushServiceManager *)self observers];
          [v14 removeObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    long long v16 = "-[MDMPushServiceManager connection:didReceivePublicToken:]";
    _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  uint64_t v9 = [(MDMPushServiceManager *)self notificationQueue];
  dispatch_assert_queue_V2(v9);

  unint64_t v10 = [(MDMPushServiceManager *)self _environmentForConnection:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__MDMPushServiceManager_connection_didReceivePublicToken___block_invoke;
  v12[3] = &unk_264B9E018;
  v12[4] = self;
  id v13 = v6;
  unint64_t v14 = v10;
  id v11 = v6;
  [(MDMPushServiceManager *)self _notifyObserversWithBlock:v12];
}

uint64_t __58__MDMPushServiceManager_connection_didReceivePublicToken___block_invoke(void *a1, void *a2)
{
  return [a2 pushServiceManager:a1[4] didReceivePublicToken:a1[5] forEnvironment:a1[6]];
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[MDMPushServiceManager connection:didReceiveToken:forTopic:identifier:]";
    _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  id v13 = [(MDMPushServiceManager *)self notificationQueue];
  dispatch_assert_queue_V2(v13);

  unint64_t v14 = [(MDMPushServiceManager *)self _environmentForConnection:v11];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__MDMPushServiceManager_connection_didReceiveToken_forTopic_identifier___block_invoke;
  v17[3] = &unk_264B9E108;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  unint64_t v20 = v14;
  id v15 = v10;
  id v16 = v9;
  [(MDMPushServiceManager *)self _notifyObserversWithBlock:v17];
}

void __72__MDMPushServiceManager_connection_didReceiveToken_forTopic_identifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 pushServiceManager:a1[4] didReceiveAppToken:a1[5] forTopic:a1[6] environment:a1[7]];
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[MDMPushServiceManager connection:didReceiveMessageForTopic:userInfo:]";
    _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  v12 = [(MDMPushServiceManager *)self notificationQueue];
  dispatch_assert_queue_V2(v12);

  unint64_t v13 = [(MDMPushServiceManager *)self _environmentForConnection:v10];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__MDMPushServiceManager_connection_didReceiveMessageForTopic_userInfo___block_invoke;
  v16[3] = &unk_264B9E108;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = v13;
  id v14 = v9;
  id v15 = v8;
  [(MDMPushServiceManager *)self _notifyObserversWithBlock:v16];
}

uint64_t __71__MDMPushServiceManager_connection_didReceiveMessageForTopic_userInfo___block_invoke(void *a1, void *a2)
{
  return [a2 pushServiceManager:a1[4] didReceiveMessageForTopic:a1[5] userInfo:a1[6] environment:a1[7]];
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (MDMPushServiceConnection)prodAPSConnection
{
  return self->_prodAPSConnection;
}

- (void)setProdAPSConnection:(id)a3
{
}

- (MDMPushServiceConnection)devAPSConnection
{
  return self->_devAPSConnection;
}

- (void)setDevAPSConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devAPSConnection, 0);
  objc_storeStrong((id *)&self->_prodAPSConnection, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end