@interface HDDaemonConnectionManager
- (HDDaemonConnectionManager)initWithMachServiceName:(id)a3 daemon:(id)a4;
- (HDXPCListener)serviceListener;
- (NSArray)clientProcesses;
- (id)clientForListener:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)createAnonymousListenerWithLabel:(id)a3;
- (id)createListenerWithMachServiceName:(id)a3;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
- (id)processCreationHandler;
- (void)_configureListener:(uint64_t)a1;
- (void)endpointInvalidated:(id)a3;
- (void)invalidate;
- (void)invalidateAllServersForProfile:(id)a3;
- (void)resume;
- (void)setProcessCreationHandler:(id)a3;
@end

@implementation HDDaemonConnectionManager

- (HDDaemonConnectionManager)initWithMachServiceName:(id)a3 daemon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDDaemonConnectionManager;
  v8 = [(HDDaemonConnectionManager *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_daemon, v7);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    listenerQueue = v9->_listenerQueue;
    v9->_listenerQueue = (OS_dispatch_queue *)v10;

    v9->_lock._os_unfair_lock_opaque = 0;
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    endpoints = v9->_endpoints;
    v9->_endpoints = v12;

    if (v6)
    {
      uint64_t v14 = [(HDDaemonConnectionManager *)v9 createListenerWithMachServiceName:v6];
      serviceListener = v9->_serviceListener;
      v9->_serviceListener = (HDXPCListener *)v14;
    }
    else
    {
      v16 = (objc_class *)objc_opt_class();
      serviceListener = NSStringFromClass(v16);
      uint64_t v17 = [(HDDaemonConnectionManager *)v9 createAnonymousListenerWithLabel:serviceListener];
      v18 = v9->_serviceListener;
      v9->_serviceListener = (HDXPCListener *)v17;
    }
    [(HDXPCListener *)v9->_serviceListener setDelegate:v9];
  }

  return v9;
}

- (NSArray)clientProcesses
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableSet count](self->_endpoints, "count"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_endpoints;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "client", (void)v14);
        v11 = [v10 process];
        [v3 addObject:v11];
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (void)resume
{
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(HDXPCListener *)self->_serviceListener invalidate];
  os_unfair_lock_lock(&self->_lock);
  v3 = self->_endpoints;
  endpoints = self->_endpoints;
  self->_endpoints = 0;

  os_unfair_lock_unlock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = v3;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "invalidate", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)createListenerWithMachServiceName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F65DC8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithMachServiceName:v5];

  -[HDDaemonConnectionManager _configureListener:]((uint64_t)self, v6);

  return v6;
}

- (void)_configureListener:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    [v3 setClientProvider:a1];
    [v3 setQueue:*(void *)(a1 + 16)];
  }
}

- (id)createAnonymousListenerWithLabel:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F65DC8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithLabel:v5];

  -[HDDaemonConnectionManager _configureListener:]((uint64_t)self, v6);

  return v6;
}

- (void)invalidateAllServersForProfile:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)[(NSMutableSet *)self->_endpoints copy];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = [v4 profileIdentifier];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
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
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "profileIdentifier", (void)v15);
        int v14 = [v13 isEqual:v6];

        if (v14) {
          [v12 invalidate];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)endpointInvalidated:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_endpoints removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)clientForListener:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (self)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F2B9C0]);
    if (v8)
    {
      [v8 auditToken];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    uint64_t v10 = (void *)[v9 initWithAuditToken:&v17];
    os_unfair_lock_lock(&self->_lock);
    processesByAuditToken = self->_processesByAuditToken;
    if (!processesByAuditToken)
    {
      long long v12 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      long long v13 = self->_processesByAuditToken;
      self->_processesByAuditToken = v12;

      processesByAuditToken = self->_processesByAuditToken;
    }
    int v14 = -[NSMapTable objectForKey:](processesByAuditToken, "objectForKey:", v10, v17, v18);
    if (!v14)
    {
      processCreationHandler = (void (**)(id, void *, id *))self->_processCreationHandler;
      if (processCreationHandler) {
        processCreationHandler[2](processCreationHandler, v8, a5);
      }
      else {
      int v14 = [MEMORY[0x1E4F65DD8] processWithConnection:v8 error:a5];
      }
      if (v14) {
        [(NSMapTable *)self->_processesByAuditToken setObject:v14 forKey:v10];
      }
    }
    os_unfair_lock_unlock(&self->_lock);

    if (v14) {
      self = (HDDaemonConnectionManager *)[objc_alloc(MEMORY[0x1E4F65DB0]) initWithConnection:v8 process:v14];
    }
    else {
      self = 0;
    }
  }
  else
  {

    int v14 = 0;
  }

  return self;
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_daemon);
    uint64_t v10 = +[HDHealthStoreEndpoint endpointWithClient:v7 healthDaemon:v9];

    os_unfair_lock_lock(&self->_lock);
    [(NSMutableSet *)self->_endpoints addObject:v10];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 100, @"Daemon became nil");
    uint64_t v10 = 0;
  }

  return v10;
}

- (HDXPCListener)serviceListener
{
  return self->_serviceListener;
}

- (id)processCreationHandler
{
  return self->_processCreationHandler;
}

- (void)setProcessCreationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processCreationHandler, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_processesByAuditToken, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end