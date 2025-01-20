@interface ICDSharingClient
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDSharingClient)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5;
- (id)fileURL;
@end

@implementation ICDSharingClient

- (ICDSharingClient)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICDSharingClient;
  v10 = [(BaseSharingClient *)&v13 initWithItemIdentifier:a4 operationQueue:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_fileProviderExtension, a3);
  }

  return v11;
}

- (id)fileURL
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100021390;
  v18 = sub_1000213A0;
  id v19 = 0;
  v3 = dispatch_group_create();
  v4 = +[NSFileProviderManager br_sharedProviderManagerWithDomainID:0];
  if (!v4)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10002C338();
    }
  }
  dispatch_group_enter(v3);
  v7 = [(BaseSharingClient *)self itemIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000213A8;
  v11[3] = &unk_100045210;
  v11[4] = self;
  objc_super v13 = &v14;
  v8 = v3;
  v12 = v8;
  [v4 getUserVisibleURLForItemIdentifier:v7 completionHandler:v11];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = getSharingServiceInterface();
  [v7 setExportedInterface:v8];

  id v9 = [ICDSharingProxy alloc];
  fileProviderExtension = self->_fileProviderExtension;
  v11 = [(BaseSharingClient *)self itemIdentifier];
  v12 = [(BaseSharingClient *)self operationQueue];
  objc_super v13 = [(ICDSharingProxy *)v9 initWithFileProviderExtension:fileProviderExtension itemIdentifier:v11 fileURL:0 operationQueue:v12];
  [v7 setExportedObject:v13];

  uint64_t v14 = self;
  objc_sync_enter(v14);
  v15 = [(BaseSharingClient *)v14 listeners];
  [v15 removeObject:v6];

  objc_sync_exit(v14);
  objc_initWeak(&location, v7);
  uint64_t v16 = +[UMUserManager sharedManager];
  v17 = objc_msgSend(v16, "br_currentPersonaID");

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000216E8;
  v25[3] = &unk_1000448D0;
  id v18 = v17;
  id v26 = v18;
  id v19 = v6;
  id v27 = v19;
  [v7 setInvalidationHandler:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100021B24;
  v22[3] = &unk_100044918;
  id v20 = v18;
  id v23 = v20;
  objc_copyWeak(&v24, &location);
  [v7 setInterruptionHandler:v22];
  [v7 resume];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
  return 1;
}

- (void).cxx_destruct
{
}

@end