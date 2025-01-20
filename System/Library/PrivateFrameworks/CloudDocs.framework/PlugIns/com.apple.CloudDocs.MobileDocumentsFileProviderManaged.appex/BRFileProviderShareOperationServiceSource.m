@interface BRFileProviderShareOperationServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BRFileProviderShareOperationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5;
@end

@implementation BRFileProviderShareOperationServiceSource

- (BRFileProviderShareOperationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRFileProviderShareOperationServiceSource;
  v10 = [(BaseFileProviderShareOperationServiceSource *)&v13 initWithItemIdentifier:a4 operationQueue:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
  }

  return v11;
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
  v10 = BRCXPCSharingOperationInterface();
  [v7 setExportedInterface:v10];

  v11 = [BRFileProviderShareOperationProxy alloc];
  fileProviderExtension = self->_fileProviderExtension;
  objc_super v13 = [(BaseFileProviderShareOperationServiceSource *)self itemIdentifier];
  v14 = [(BaseFileProviderShareOperationServiceSource *)self operationQueue];
  v15 = [(BRFileProviderShareOperationProxy *)v11 initWithFileProviderExtension:fileProviderExtension itemIdentifier:v13 operationQueue:v14 clientPrivilegesDescriptor:v9];
  [v7 setExportedObject:v15];

  v16 = self;
  objc_sync_enter(v16);
  v17 = [(BaseFileProviderShareOperationServiceSource *)v16 listeners];
  [v17 removeObject:v6];

  objc_sync_exit(v16);
  objc_initWeak(&location, v7);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000227F4;
  v22[3] = &unk_1000387E0;
  id v18 = v6;
  id v23 = v18;
  [v7 setInvalidationHandler:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100022870;
  v20[3] = &unk_100038880;
  objc_copyWeak(&v21, &location);
  [v7 setInterruptionHandler:v20];
  [v7 resume];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
  return 1;
}

- (void).cxx_destruct
{
}

@end