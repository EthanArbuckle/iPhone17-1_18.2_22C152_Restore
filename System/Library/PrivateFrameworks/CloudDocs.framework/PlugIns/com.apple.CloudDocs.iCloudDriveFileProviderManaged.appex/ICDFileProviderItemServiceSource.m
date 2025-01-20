@interface ICDFileProviderItemServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDFileProviderItemServiceSource)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5;
- (NSHashTable)listeners;
- (NSOperationQueue)operationQueue;
- (NSString)domainIdentifier;
- (NSString)itemIdentifier;
- (NSString)serviceName;
- (id)makeListenerEndpointAndReturnError:(id *)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setListeners:(id)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation ICDFileProviderItemServiceSource

- (ICDFileProviderItemServiceSource)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICDFileProviderItemServiceSource;
  v12 = [(ICDFileProviderItemServiceSource *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemIdentifier, a3);
    objc_storeStrong((id *)&v13->_domainIdentifier, a4);
    objc_storeStrong((id *)&v13->_operationQueue, a5);
    uint64_t v14 = +[NSHashTable hashTableWithOptions:0];
    listeners = v13->_listeners;
    v13->_listeners = (NSHashTable *)v14;
  }
  return v13;
}

- (NSString)serviceName
{
  return (NSString *)BRItemServiceName;
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  v4 = +[NSXPCListener anonymousListener];
  [v4 setDelegate:self];
  v5 = [v4 endpoint];
  [v4 resume];
  v6 = self;
  objc_sync_enter(v6);
  [(NSHashTable *)v6->_listeners addObject:v4];
  objc_sync_exit(v6);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)BRCClientPrivilegesDescriptor);
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  id v9 = [v8 initWithAuditToken:v25];
  id v10 = BRCXPCBRItemServiceProtocolInterface();
  [v7 setExportedInterface:v10];

  id v11 = [ICDFileProviderItemServiceProxy alloc];
  v12 = [(ICDFileProviderItemServiceSource *)self itemIdentifier];
  v13 = [(ICDFileProviderItemServiceSource *)self domainIdentifier];
  uint64_t v14 = [(ICDFileProviderItemServiceSource *)self operationQueue];
  v15 = [(ICDFileProviderItemServiceProxy *)v11 initWithItemIdentifier:v12 domainIdentifier:v13 operationQueue:v14 clientPrivilegesDescriptor:v9];
  [v7 setExportedObject:v15];

  v16 = self;
  objc_sync_enter(v16);
  objc_super v17 = [(ICDFileProviderItemServiceSource *)v16 listeners];
  [v17 removeObject:v6];

  objc_sync_exit(v16);
  objc_initWeak(&location, v7);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002A18C;
  v22[3] = &unk_1000446B0;
  id v18 = v6;
  id v23 = v18;
  [v7 setInvalidationHandler:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002A208;
  v20[3] = &unk_1000446D8;
  objc_copyWeak(&v21, &location);
  [v7 setInterruptionHandler:v20];
  [v7 resume];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
  return 1;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end