@interface _IDSActivityMonitorXPCConnector
+ (id)weakSharedInstance;
- (IDSXPCDaemonController)daemonController;
- (IDSXPCDaemonController)syncDaemonController;
- (NSMutableDictionary)listenersByActivity;
- (_IDSActivityMonitorXPCConnector)initWithSyncDaemonControllerBuilder:(id)a3 daemonControllerBuilder:(id)a4;
- (id)daemonControllerBuilder;
- (id)syncDaemonControllerBuilder;
- (void)_handleInterruption;
- (void)_updateActivity:(id)a3 isSupported:(BOOL)a4;
- (void)addListener:(id)a3 forTopic:(id)a4;
- (void)dealloc;
- (void)handleIncomingUpdate:(id)a3 onActivity:(id)a4 completion:(id)a5;
- (void)performAction:(id)a3 errorHandler:(id)a4;
- (void)performSyncAction:(id)a3;
- (void)removeListener:(id)a3 forTopic:(id)a4;
- (void)setDaemonController:(id)a3;
- (void)setDaemonControllerBuilder:(id)a3;
- (void)setListenersByActivity:(id)a3;
- (void)setSyncDaemonController:(id)a3;
- (void)setSyncDaemonControllerBuilder:(id)a3;
@end

@implementation _IDSActivityMonitorXPCConnector

+ (id)weakSharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&qword_1E92DE218);

  if (WeakRetained)
  {
    v4 = (_IDSActivityMonitorXPCConnector *)objc_loadWeakRetained(&qword_1E92DE218);
  }
  else
  {
    v4 = [[_IDSActivityMonitorXPCConnector alloc] initWithSyncDaemonControllerBuilder:&unk_1EE2469C8 daemonControllerBuilder:&unk_1EE245F48];
    objc_storeWeak(&qword_1E92DE218, v4);
  }
  objc_sync_exit(v2);

  return v4;
}

- (_IDSActivityMonitorXPCConnector)initWithSyncDaemonControllerBuilder:(id)a3 daemonControllerBuilder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_IDSActivityMonitorXPCConnector;
  v8 = [(_IDSActivityMonitorXPCConnector *)&v14 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x192FE03B0](v7);
    id daemonControllerBuilder = v8->_daemonControllerBuilder;
    v8->_id daemonControllerBuilder = (id)v9;

    uint64_t v11 = MEMORY[0x192FE03B0](v6);
    id syncDaemonControllerBuilder = v8->_syncDaemonControllerBuilder;
    v8->_id syncDaemonControllerBuilder = (id)v11;
  }
  return v8;
}

- (void)dealloc
{
  [(IDSXPCDaemonController *)self->_daemonController removeInterruptionHandlerForTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)_IDSActivityMonitorXPCConnector;
  [(_IDSActivityMonitorXPCConnector *)&v3 dealloc];
}

- (void)performSyncAction:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  syncDaemonController = self->_syncDaemonController;
  if (!syncDaemonController)
  {
    id syncDaemonControllerBuilder = (void (**)(id, void *))self->_syncDaemonControllerBuilder;
    id v7 = +[IDSInternalQueueController sharedInstance];
    v8 = [v7 queue];
    syncDaemonControllerBuilder[2](syncDaemonControllerBuilder, v8);
    uint64_t v9 = (IDSXPCDaemonController *)objc_claimAutoreleasedReturnValue();
    v10 = self->_syncDaemonController;
    self->_syncDaemonController = v9;

    syncDaemonController = self->_syncDaemonController;
  }
  uint64_t v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = sub_1919187D0;
  v17[3] = sub_191918608;
  id v18 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191A244B0;
  v15[3] = &unk_1E572A9D8;
  v15[4] = &v16;
  uint64_t v11 = [(IDSXPCDaemonController *)syncDaemonController activityMonitorCollaboratorWithErrorHandler:v15];
  if (*(void *)(v17[0] + 40))
  {
    v12 = self->_syncDaemonController;
    self->_syncDaemonController = 0;

    v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A45A0C((uint64_t)v17, v13);
    }

    uint64_t v11 = 0;
    uint64_t v14 = *(void *)(v17[0] + 40);
  }
  else
  {
    uint64_t v14 = 0;
  }
  v4[2](v4, v11, v14);

  _Block_object_dispose(&v16, 8);
}

- (void)performAction:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  daemonController = self->_daemonController;
  if (!daemonController)
  {
    id daemonControllerBuilder = (void (**)(id, void *))self->_daemonControllerBuilder;
    v10 = +[IDSInternalQueueController sharedInstance];
    uint64_t v11 = [v10 queue];
    daemonControllerBuilder[2](daemonControllerBuilder, v11);
    v12 = (IDSXPCDaemonController *)objc_claimAutoreleasedReturnValue();
    v13 = self->_daemonController;
    self->_daemonController = v12;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v14 = self->_daemonController;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_191A24690;
    v20[3] = &unk_1E57295B8;
    objc_copyWeak(&v21, &location);
    [(IDSXPCDaemonController *)v14 addInterruptionHandler:v20 forTarget:self];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    daemonController = self->_daemonController;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_191A246D0;
  v17[3] = &unk_1E572A398;
  id v18 = v7;
  id v19 = v6;
  id v15 = v6;
  id v16 = v7;
  [(IDSXPCDaemonController *)daemonController performTask:v17];
}

- (void)addListener:(id)a3 forTopic:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  listenersByActivity = self->_listenersByActivity;
  if (!listenersByActivity)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_listenersByActivity;
    self->_listenersByActivity = v8;

    listenersByActivity = self->_listenersByActivity;
  }
  v10 = [(NSMutableDictionary *)listenersByActivity objectForKeyedSubscript:v6];
  if (!v10)
  {
    uint64_t v11 = self->_listenersByActivity;
    v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v6];
  }
  [v10 addObject:v12];
  if ([v10 count] == 1) {
    [(_IDSActivityMonitorXPCConnector *)self _updateActivity:v6 isSupported:1];
  }
}

- (void)removeListener:(id)a3 forTopic:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_listenersByActivity objectForKeyedSubscript:v6];
  v8 = v7;
  if (v7 && [v7 containsObject:v10])
  {
    if ([v8 count] == 1)
    {
      [(NSMutableDictionary *)self->_listenersByActivity setObject:0 forKeyedSubscript:v6];
      [(_IDSActivityMonitorXPCConnector *)self _updateActivity:v6 isSupported:0];
    }
    else
    {
      [v8 removeObject:v10];
    }
    if (![(NSMutableDictionary *)self->_listenersByActivity count])
    {
      listenersByActivity = self->_listenersByActivity;
      self->_listenersByActivity = 0;
    }
  }
}

- (void)_handleInterruption
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_listenersByActivity;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[_IDSActivityMonitorXPCConnector _updateActivity:isSupported:](self, "_updateActivity:isSupported:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), 1, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateActivity:(id)a3 isSupported:(BOOL)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A24BC0;
  v8[3] = &unk_1E572D958;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a4;
  id v7 = v6;
  id v9 = v7;
  [(_IDSActivityMonitorXPCConnector *)self performAction:v8 errorHandler:&unk_1EE245D28];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)handleIncomingUpdate:(id)a3 onActivity:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v8 = a4;
  dispatch_block_t block = a5;
  id v9 = [(_IDSActivityMonitorXPCConnector *)self listenersByActivity];
  id v10 = [v9 objectForKeyedSubscript:v8];
  BOOL v11 = [v10 allObjects];

  id v12 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
        dispatch_group_enter(v12);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = sub_191A24E54;
        v23[3] = &unk_1E5729000;
        v24 = v12;
        [v18 handleIncomingUpdate:v22 onActivity:v8 completion:v23];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  id v19 = +[IDSInternalQueueController sharedInstance];
  v20 = [v19 queue];
  dispatch_group_notify(v12, v20, block);
}

- (NSMutableDictionary)listenersByActivity
{
  return self->_listenersByActivity;
}

- (void)setListenersByActivity:(id)a3
{
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
}

- (IDSXPCDaemonController)syncDaemonController
{
  return self->_syncDaemonController;
}

- (void)setSyncDaemonController:(id)a3
{
}

- (id)syncDaemonControllerBuilder
{
  return self->_syncDaemonControllerBuilder;
}

- (void)setSyncDaemonControllerBuilder:(id)a3
{
}

- (id)daemonControllerBuilder
{
  return self->_daemonControllerBuilder;
}

- (void)setDaemonControllerBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_daemonControllerBuilder, 0);
  objc_storeStrong(&self->_syncDaemonControllerBuilder, 0);
  objc_storeStrong((id *)&self->_syncDaemonController, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);

  objc_storeStrong((id *)&self->_listenersByActivity, 0);
}

@end