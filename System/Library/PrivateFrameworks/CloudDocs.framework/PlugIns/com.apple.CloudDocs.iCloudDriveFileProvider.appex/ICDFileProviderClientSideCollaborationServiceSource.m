@interface ICDFileProviderClientSideCollaborationServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDFileProviderClientSideCollaborationServiceSource)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5;
- (NSString)serviceName;
- (id)makeListenerEndpointAndReturnError:(id *)a3;
@end

@implementation ICDFileProviderClientSideCollaborationServiceSource

- (ICDFileProviderClientSideCollaborationServiceSource)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICDFileProviderClientSideCollaborationServiceSource;
  v12 = [(ICDFileProviderClientSideCollaborationServiceSource *)&v17 init];
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
  return (NSString *)ICDClientSideCollaborationServiceName;
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
    memset(v20, 0, sizeof(v20));
  }
  id v9 = [v8 initWithAuditToken:v20];
  id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICDFileProviderClientSideCollaborationProtocol];
  [v7 setExportedInterface:v10];

  id v11 = [[ICDFileProviderClientSideCollaborationServiceProxy alloc] initWithItemIdentifier:self->_itemIdentifier domainIdentifier:self->_domainIdentifier operationQueue:self->_operationQueue clientPrivilegesDescriptor:v9];
  [v7 setExportedObject:v11];

  v12 = self;
  objc_sync_enter(v12);
  [(NSHashTable *)v12->_listeners removeObject:v6];
  objc_sync_exit(v12);

  objc_initWeak(&location, v7);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100007980;
  v17[3] = &unk_1000446B0;
  id v13 = v6;
  id v18 = v13;
  [v7 setInvalidationHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000079FC;
  v15[3] = &unk_1000446D8;
  objc_copyWeak(&v16, &location);
  [v7 setInterruptionHandler:v15];
  [v7 resume];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end