@interface BRSharingClient
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BRSharingClient)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5;
- (id)fileURL;
@end

@implementation BRSharingClient

- (BRSharingClient)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRSharingClient;
  v10 = [(BaseSharingClient *)&v13 initWithItemIdentifier:a4 operationQueue:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
  }

  return v11;
}

- (id)fileURL
{
  fileProviderExtension = self->_fileProviderExtension;
  v3 = [(BaseSharingClient *)self itemIdentifier];
  v4 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v3];

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = getSharingServiceInterface();
  [v7 setExportedInterface:v8];

  id v9 = [BRSharingProxy alloc];
  fileProviderExtension = self->_fileProviderExtension;
  v11 = [(BaseSharingClient *)self itemIdentifier];
  v12 = [(BRSharingClient *)self fileURL];
  objc_super v13 = [(BaseSharingClient *)self operationQueue];
  v14 = [(BRSharingProxy *)v9 initWithFileProviderExtension:fileProviderExtension itemIdentifier:v11 fileURL:v12 operationQueue:v13];
  [v7 setExportedObject:v14];

  v15 = self;
  objc_sync_enter(v15);
  v16 = [(BaseSharingClient *)v15 listeners];
  [v16 removeObject:v6];

  objc_sync_exit(v15);
  objc_initWeak(&location, v7);
  v17 = +[UMUserManager sharedManager];
  v18 = objc_msgSend(v17, "br_currentPersonaID");

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100011F40;
  v26[3] = &unk_1000385F8;
  id v19 = v18;
  id v27 = v19;
  id v20 = v6;
  id v28 = v20;
  [v7 setInvalidationHandler:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001237C;
  v23[3] = &unk_100038BF8;
  id v21 = v19;
  id v24 = v21;
  objc_copyWeak(&v25, &location);
  [v7 setInterruptionHandler:v23];
  [v7 resume];
  objc_destroyWeak(&v25);

  objc_destroyWeak(&location);
  return 1;
}

- (void).cxx_destruct
{
}

@end