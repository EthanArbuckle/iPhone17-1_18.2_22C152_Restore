@interface VSServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSArray)entitlementNames;
- (NSMutableSet)connectionHandlers;
- (NSXPCInterface)exportedInterface;
- (VSServiceListener)init;
- (id)exportedObject;
- (void)_addConnectionHandler:(id)a3;
- (void)_removeConnectionHandler:(id)a3;
- (void)setConnectionHandlers:(id)a3;
- (void)setEntitlementNames:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
@end

@implementation VSServiceListener

- (VSServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSServiceListener;
  v2 = [(VSServiceListener *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connectionHandlers = v2->_connectionHandlers;
    v2->_connectionHandlers = v3;
  }
  return v2;
}

- (void)_addConnectionHandler:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(VSServiceListener *)v4 connectionHandlers];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)_removeConnectionHandler:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(VSServiceListener *)v4 connectionHandlers];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v5;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Received request to open connection %@", buf, 0xCu);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v23 = self;
  v7 = [(VSServiceListener *)self entitlementNames];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = [v5 valueForEntitlement:v12];
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v13 BOOLValue])
        {
          v17 = VSDefaultLogObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v12;
            _os_log_impl(&dword_1DA674000, v17, OS_LOG_TYPE_DEFAULT, "Will accept connection due to %@ entitlement.", buf, 0xCu);
          }

          v18 = [(VSServiceListener *)v23 exportedInterface];
          [v5 setExportedInterface:v18];

          v19 = [(VSServiceListener *)v23 exportedObject];
          [v5 setExportedObject:v19];

          v20 = objc_alloc_init(VSServiceConnectionHandler);
          [(VSServiceConnectionHandler *)v20 setDelegate:v23];
          [(VSServiceConnectionHandler *)v20 setConnection:v5];
          [(VSServiceListener *)v23 _addConnectionHandler:v20];

          v21 = VSDefaultLogObject();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v5;
            _os_log_impl(&dword_1DA674000, v21, OS_LOG_TYPE_DEFAULT, "Will accept connection %@", buf, 0xCu);
          }

          [v5 resume];
          BOOL v16 = 1;
          goto LABEL_22;
        }
        v14 = VSDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v12;
          __int16 v30 = 2112;
          v31 = v13;
          _os_log_impl(&dword_1DA674000, v14, OS_LOG_TYPE_DEFAULT, "Value for %@ entitlement (%@) was inadequate.", buf, 0x16u);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v15 = VSErrorLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[VSServiceListener listener:shouldAcceptNewConnection:]((uint64_t)v5, v15);
  }

  BOOL v16 = 0;
LABEL_22:

  return v16;
}

- (NSArray)entitlementNames
{
  return self->_entitlementNames;
}

- (void)setEntitlementNames:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
}

- (NSMutableSet)connectionHandlers
{
  return self->_connectionHandlers;
}

- (void)setConnectionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandlers, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);

  objc_storeStrong((id *)&self->_entitlementNames, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Will NOT accept connection %@", (uint8_t *)&v2, 0xCu);
}

@end