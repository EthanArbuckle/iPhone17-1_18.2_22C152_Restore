@interface FileProviderValidationServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FileProviderValidationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4;
- (NSString)serviceName;
- (id)makeListenerEndpointAndReturnError:(id *)a3;
- (void)validation_allowValidation:(id)a3;
- (void)validation_evictDocumentWithCompletionHandler:(id)a3;
- (void)validation_shareDocumentWithCompletionHandler:(id)a3;
@end

@implementation FileProviderValidationServiceSource

- (FileProviderValidationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FileProviderValidationServiceSource;
  v9 = [(FileProviderValidationServiceSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemIdentifier, a4);
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
    uint64_t v11 = +[NSHashTable hashTableWithOptions:0];
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v11;
  }
  return v10;
}

- (NSString)serviceName
{
  return (NSString *)off_100ACA660;
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
  id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NSFileProviderValidationServiceV1];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  v9 = self;
  objc_sync_enter(v9);
  [(NSHashTable *)v9->_listeners removeObject:v6];
  objc_sync_exit(v9);

  id location = 0;
  objc_initWeak(&location, v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002E068;
  v14[3] = &unk_100A66F18;
  id v10 = v6;
  id v15 = v10;
  [v7 setInvalidationHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E070;
  v12[3] = &unk_100A66F40;
  objc_copyWeak(&v13, &location);
  [v7 setInterruptionHandler:v12];
  [v7 resume];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return 1;
}

- (void)validation_evictDocumentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)validation_shareDocumentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)validation_allowValidation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);

  objc_storeStrong((id *)&self->_fileProviderExtension, 0);
}

@end