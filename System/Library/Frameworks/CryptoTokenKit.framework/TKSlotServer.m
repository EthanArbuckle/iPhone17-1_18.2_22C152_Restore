@interface TKSlotServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)clientListener;
- (NSXPCListener)registryListener;
- (TKSlotServer)initWithRegistryListener:(id)a3 clientListener:(id)a4;
- (void)addClient:(id)a3 reply:(id)a4;
- (void)addSlotRegistration:(id)a3 name:(id)a4;
- (void)dealloc;
- (void)ensureSlotWatchersRunning;
- (void)notifyDesktopUp;
- (void)removeClient:(id)a3;
- (void)removeSlotRegistration:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TKSlotServer

- (TKSlotServer)initWithRegistryListener:(id)a3 clientListener:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TKSlotServer;
  v9 = [(TKSlotServer *)&v15 init];
  if (v9)
  {
    uint64_t v10 = +[NSMutableArray array];
    clients = v9->_clients;
    v9->_clients = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    registrations = v9->_registrations;
    v9->_registrations = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_registryListener, a3);
    [(NSXPCListener *)v9->_registryListener setDelegate:v9];
    objc_storeStrong((id *)&v9->_clientListener, a4);
    [(NSXPCListener *)v9->_clientListener setDelegate:v9];
  }

  return v9;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_registryListener invalidate];
  [(NSXPCListener *)self->_clientListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKSlotServer;
  [(TKSlotServer *)&v3 dealloc];
}

- (void)start
{
  [(NSXPCListener *)self->_registryListener resume];
  clientListener = self->_clientListener;

  [(NSXPCListener *)clientListener resume];
}

- (void)stop
{
  [(NSXPCListener *)self->_registryListener invalidate];
  [(NSXPCListener *)self->_clientListener invalidate];
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_clients removeAllObjects];
  [(NSMutableArray *)obj->_registrations removeAllObjects];
  objc_sync_exit(obj);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_registryListener != v6)
  {
    if (self->_clientListener != v6
      || !+[TKSlotClient handleConnection:v7 server:self])
    {
      goto LABEL_4;
    }
LABEL_6:
    [v7 resume];
    BOOL v8 = 1;
    goto LABEL_7;
  }
  if (+[TKSlotRegistration handleConnection:v7 server:self])
  {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (void)addSlotRegistration:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  obj = (id *)&v7->super.isa;
  if (![(NSMutableArray *)v7->_registrations count]) {
    [(TKSlotServer *)v7 ensureSlotWatchersRunning];
  }
  LODWORD(v8) = 0;
LABEL_5:
  [v6 setSlotName:v35];
LABEL_6:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v10 = obj[1];
  id v11 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v42;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = [*(id *)(*((void *)&v41 + 1) + 8 * i) slotName];
        objc_super v15 = [v6 slotName];
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if (v16)
        {

          uint64_t v8 = (v8 + 1);
          if (v8)
          {
            v9 = +[NSString stringWithFormat:@"%@ %02d", v35, v8];
            [v6 setSlotName:v9];

            goto LABEL_6;
          }
          goto LABEL_5;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  [obj[1] addObject:v6];
  v17 = [v6 slotName];
  id v18 = +[NSString stringWithFormat:@"slot server registration:%@", v17];
  [v18 UTF8String];
  v19 = (void *)os_transaction_create();
  [v6 setTransaction:v19];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = obj[2];
  id v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v38;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        v25 = [v24 slotType];
        if (!v25) {
          goto LABEL_24;
        }
        v26 = [v24 slotType];
        v27 = [v6 slotType];
        unsigned int v28 = [v26 isEqualToString:v27];

        if (v28)
        {
LABEL_24:
          v29 = [v24 notification];
          v30 = [v6 slotName];
          v31 = [v6 endpoint];
          v32 = [v6 slotType];
          [v29 setSlotWithName:v30 endpoint:v31 type:v32 reply:&stru_100020860];
        }
      }
      id v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v21);
  }

  v33 = sub_10000DC3C();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v34 = [v6 slotName];
    sub_100014AB4(v34, buf, v33);
  }

  objc_sync_exit(obj);
}

- (void)notifyDesktopUp
{
  obj = self;
  objc_sync_enter(obj);
  if ([(NSMutableArray *)obj->_registrations count]) {
    [(TKSlotServer *)obj ensureSlotWatchersRunning];
  }
  objc_sync_exit(obj);
}

- (void)ensureSlotWatchersRunning
{
  v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &stru_100020880);
}

- (void)removeSlotRegistration:(id)a3
{
  id v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  v5 = sub_10000DC3C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 slotName];
    sub_100014CAC(v6, buf, v5);
  }

  [(NSMutableArray *)obj->_registrations removeObject:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = obj->_clients;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 slotType];
        if (!v12) {
          goto LABEL_10;
        }
        v13 = [v11 slotType];
        v14 = [v4 slotType];
        unsigned int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
LABEL_10:
          unsigned __int8 v16 = [v11 notification];
          v17 = [v4 slotName];
          id v18 = [v4 slotType];
          [v16 setSlotWithName:v17 endpoint:0 type:v18 reply:&stru_1000208C8];
        }
      }
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  objc_sync_exit(obj);
}

- (void)addClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  dispatch_block_t block = a4;
  id v7 = self;
  objc_sync_enter(v7);
  long long v22 = v7;
  [(NSMutableArray *)v7->_clients addObject:v6];
  id v8 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = v7->_registrations;
  id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v11);
        v13 = [v6 slotType];
        if (!v13) {
          goto LABEL_8;
        }
        v14 = [v6 slotType];
        unsigned int v15 = [v12 slotType];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
LABEL_8:
          dispatch_group_enter(v8);
          v17 = [v6 notification];
          id v18 = [v12 slotName];
          v19 = [v12 endpoint];
          long long v20 = [v12 slotType];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_10000EEE0;
          v25[3] = &unk_100020600;
          v26 = v8;
          [v17 setSlotWithName:v18 endpoint:v19 type:v20 reply:v25];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  long long v21 = dispatch_get_global_queue(25, 0);
  dispatch_group_notify(v8, v21, block);

  objc_sync_exit(v22);
}

- (void)removeClient:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_clients removeObject:v5];
  objc_sync_exit(v4);
}

- (NSXPCListener)registryListener
{
  return self->_registryListener;
}

- (NSXPCListener)clientListener
{
  return self->_clientListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientListener, 0);
  objc_storeStrong((id *)&self->_registryListener, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_registrations, 0);
}

@end