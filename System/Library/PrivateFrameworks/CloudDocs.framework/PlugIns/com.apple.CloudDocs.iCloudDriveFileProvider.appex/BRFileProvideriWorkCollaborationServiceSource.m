@interface BRFileProvideriWorkCollaborationServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BRFileProvideriWorkCollaborationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5;
@end

@implementation BRFileProvideriWorkCollaborationServiceSource

- (BRFileProvideriWorkCollaborationServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRFileProvideriWorkCollaborationServiceSource;
  v10 = [(BaseFileProvideriWorkCollaborationServiceSource *)&v15 initWithItemIdentifier:a4 operationQueue:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
    uint64_t v12 = +[NSHashTable hashTableWithOptions:0];
    listeners = v11->_listeners;
    v11->_listeners = (NSHashTable *)v12;
  }
  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BaseFileProvideriWorkCollaboration];
  [v7 setExportedInterface:v8];

  id v9 = [BRFileProvideriWorkCollaborationProxy alloc];
  fileProviderExtension = self->_fileProviderExtension;
  v11 = [(BaseFileProvideriWorkCollaborationServiceSource *)self itemIdentifier];
  uint64_t v12 = [(BaseFileProvideriWorkCollaborationServiceSource *)self operationQueue];
  v13 = [(BRFileProvideriWorkCollaborationProxy *)v9 initWithFileProviderExtension:fileProviderExtension itemIdentifier:v11 operationQueue:v12];
  [v7 setExportedObject:v13];

  v14 = self;
  objc_sync_enter(v14);
  [(NSHashTable *)v14->_listeners removeObject:v6];
  objc_sync_exit(v14);

  objc_initWeak(&location, v7);
  objc_super v15 = +[UMUserManager sharedManager];
  v16 = objc_msgSend(v15, "br_currentPersonaID");

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001F1A0;
  v24[3] = &unk_100044880;
  id v17 = v16;
  id v25 = v17;
  id v18 = v6;
  id v26 = v18;
  [v7 setInvalidationHandler:v24];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001F5DC;
  v21[3] = &unk_100045068;
  id v19 = v17;
  id v22 = v19;
  objc_copyWeak(&v23, &location);
  [v7 setInterruptionHandler:v21];
  [v7 resume];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_fileProviderExtension, 0);
}

@end