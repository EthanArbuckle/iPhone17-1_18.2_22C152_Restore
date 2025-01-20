@interface DLDocumentDownloads
- (DLDocumentDownloads)init;
- (id)createDeleteOperation:(id)a3;
- (id)createErrorForCode:(int64_t)a3 description:(id)a4;
- (id)createMoveOperation:(id)a3 destinationItem:(id)a4 completionHandler:(id)a5;
- (id)createMoveOperation:(id)a3 parentItem:(id)a4 newFileName:(id)a5 completionHandler:(id)a6;
- (id)createTemporaryFolderURLAppropriateForURL:(id)a3 error:(id *)a4;
- (id)sandboxingURLWrapperForURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5;
- (void)deleteItemIgnoringResult:(id)a3;
- (void)importItemAtURL:(id)a3 toLocation:(int64_t)a4 completionHandler:(id)a5;
- (void)importItemAtURLToDocuments:(id)a3 completionHandler:(id)a4;
- (void)importItemAtURLToDownloads:(id)a3 completionHandler:(id)a4;
- (void)importPlaceholderAtURLToDownloadsDirectory:(id)a3 completionHandler:(id)a4;
- (void)namedLocationExists:(int64_t)a3 completionHandler:(id)a4;
- (void)replaceContentsOfFile:(id)a3 withFile:(id)a4 completion:(id)a5;
- (void)replacePlaceholder:(id)a3 withFinalFileURL:(id)a4 completionHandler:(id)a5;
@end

@implementation DLDocumentDownloads

- (DLDocumentDownloads)init
{
  v7.receiver = self;
  v7.super_class = (Class)DLDocumentDownloads;
  v2 = [(DLDocumentDownloads *)&v7 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 bundleIdentifier];

    v5 = +[DOCManagedPermission defaultPermission];
    [v5 setHostIdentifier:v4];
  }
  return v2;
}

- (void)importPlaceholderAtURLToDownloadsDirectory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 url];
    unsigned __int8 v9 = [v8 startAccessingSecurityScopedResource];
    v10 = objc_opt_new();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000217C;
    v15[3] = &unk_100008258;
    id v18 = v7;
    v15[4] = self;
    unsigned __int8 v19 = v9;
    id v16 = v6;
    id v17 = v8;
    id v11 = v8;
    [v10 fetchDefaultDownloadsLocationItem:v15];
  }
  else
  {
    v12 = _DocumentManagerBundle();
    v13 = [v12 localizedStringForKey:@"Invalid URL wrapper" value:@"Invalid URL wrapper" table:@"Localizable"];

    v14 = [(DLDocumentDownloads *)self createErrorForCode:-1000 description:v13];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

- (void)replacePlaceholder:(id)a3 withFinalFileURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 && v8)
  {
    v10 = [a3 url];
    id v11 = [v8 url];
    unsigned __int8 v12 = [v10 startAccessingSecurityScopedResource];
    unsigned __int8 v13 = [v11 startAccessingSecurityScopedResource];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000025D4;
    v34[3] = &unk_100008280;
    unsigned __int8 v38 = v12;
    id v14 = v10;
    unsigned __int8 v39 = v13;
    id v35 = v14;
    id v36 = v11;
    id v37 = v9;
    id v15 = v11;
    id v16 = objc_retainBlock(v34);
    id v17 = +[FPItemManager defaultManager];
    id v18 = [v8 url];
    unsigned __int8 v19 = [v18 lastPathComponent];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000269C;
    v27[3] = &unk_100008320;
    id v28 = v17;
    id v29 = v8;
    v30 = self;
    id v31 = v14;
    id v32 = v19;
    id v33 = v16;
    v20 = v16;
    id v21 = v19;
    id v22 = v14;
    id v23 = v17;
    [v23 fetchItemForURL:v22 completionHandler:v27];
  }
  else
  {
    v24 = _DocumentManagerBundle();
    v25 = [v24 localizedStringForKey:@"Invalid URL wrapper" value:@"Invalid URL wrapper" table:@"Localizable"];

    v26 = [(DLDocumentDownloads *)self createErrorForCode:-1000 description:v25];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v26);
  }
}

- (void)replaceContentsOfFile:(id)a3 withFile:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, void))a5;
  v10 = +[NSFileManager defaultManager];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  unsigned __int8 v39 = sub_100002F48;
  v40 = sub_100002F58;
  id v41 = 0;
  id obj = 0;
  id v11 = [v10 URLForDirectory:99 inDomain:1 appropriateForURL:v7 create:1 error:&obj];
  objc_storeStrong(&v41, obj);
  if (!v37[5])
  {
    unsigned __int8 v13 = [v8 lastPathComponent];
    id v14 = [v11 URLByAppendingPathComponent:v13];

    unsigned int v15 = [v8 startAccessingSecurityScopedResource];
    id v16 = (id *)(v37 + 5);
    id v34 = (id)v37[5];
    id v17 = [v10 copyItemAtURL:v8 toURL:v14 error:&v34];
    objc_storeStrong(v16, v34);
    if (!v17 || v37[5])
    {
      id v18 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        id v18 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100005814();
      }
      v9[2](v9, v17, v37[5]);
      if (v15) {
        [v8 stopAccessingSecurityScopedResource];
      }
LABEL_28:

      goto LABEL_29;
    }
    if (v15) {
      [v8 stopAccessingSecurityScopedResource];
    }
    id v19 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
    unsigned int v24 = [v7 startAccessingSecurityScopedResource];
    unsigned int v20 = [v14 startAccessingSecurityScopedResource];
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    id v21 = (id *)(v37 + 5);
    id v29 = (id)v37[5];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100002F60;
    v25[3] = &unk_100008348;
    v27 = &v30;
    id v22 = v14;
    id v26 = v22;
    id v28 = &v36;
    [v19 coordinateWritingItemAtURL:v7 options:0 error:&v29 byAccessor:v25];
    objc_storeStrong(v21, v29);
    if (!v37[5]) {
      goto LABEL_21;
    }
    id v23 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v23 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_1000057AC();
      if (!v9) {
        goto LABEL_23;
      }
    }
    else
    {
LABEL_21:
      if (!v9)
      {
LABEL_23:
        if (v24) {
          [v7 stopAccessingSecurityScopedResource];
        }
        if (v20) {
          [v22 stopAccessingSecurityScopedResource];
        }

        _Block_object_dispose(&v30, 8);
        goto LABEL_28;
      }
    }
    v9[2](v9, (id)*((unsigned __int8 *)v31 + 24), v37[5]);
    goto LABEL_23;
  }
  unsigned __int8 v12 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    unsigned __int8 v12 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_100005814();
    if (!v9) {
      goto LABEL_29;
    }
    goto LABEL_6;
  }
  if (v9) {
LABEL_6:
  }
    v9[2](v9, 0, v37[5]);
LABEL_29:

  _Block_object_dispose(&v36, 8);
}

- (id)createMoveOperation:(id)a3 parentItem:(id)a4 newFileName:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc((Class)FPMoveOperation);
  id v29 = v10;
  unsigned int v15 = +[NSArray arrayWithObjects:&v29 count:1];
  id v16 = [v14 initWithItems:v15 destinationFolder:v11];

  id v27 = v10;
  id v28 = v12;
  id v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v16 setTargetFilenamesByItem:v17];

  [v16 setShouldBounceOnCollision:1];
  [v16 setLastUsageUpdatePolicy:2];
  objc_initWeak(&location, v16);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000326C;
  v21[3] = &unk_100008398;
  objc_copyWeak(&v25, &location);
  id v18 = v10;
  id v22 = v18;
  id v23 = self;
  id v19 = v13;
  id v24 = v19;
  [v16 setActionCompletionBlock:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v16;
}

- (id)createMoveOperation:(id)a3 destinationItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 url];
  id v12 = objc_alloc((Class)FPMoveOperation);
  id v24 = v11;
  id v13 = +[NSArray arrayWithObjects:&v24 count:1];
  id v14 = [v12 initWithURLs:v13 destinationFolder:v9];

  [v14 setLastUsageUpdatePolicy:2];
  [v14 setShouldBounceOnCollision:1];
  objc_initWeak(&location, v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000364C;
  v18[3] = &unk_100008398;
  objc_copyWeak(&v22, &location);
  id v15 = v11;
  id v19 = v15;
  unsigned int v20 = self;
  id v16 = v10;
  id v21 = v16;
  [v14 setActionCompletionBlock:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v14;
}

- (id)createDeleteOperation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)FPDeleteOperation);
  id v8 = v3;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];

  id v6 = [v4 initWithItems:v5];
  [v6 setActionCompletionBlock:&stru_1000083D8];
  return v6;
}

- (void)importItemAtURL:(id)a3 toLocation:(int64_t)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v9 = a5;
  if (a4 == 2)
  {
    [(DLDocumentDownloads *)self importItemAtURLToDocuments:v11 completionHandler:v9];
  }
  else if (a4 == 1)
  {
    [(DLDocumentDownloads *)self importItemAtURLToDownloads:v11 completionHandler:v9];
  }
  else
  {
    id v10 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DLDocumentDownloads.m", 328, @"Unexpected _DOCFileDestination %ld", a4);
  }
}

- (void)importItemAtURLToDownloads:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 url];
    unsigned __int8 v9 = [v8 startAccessingSecurityScopedResource];

    id v10 = objc_opt_new();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100003BD0;
    v14[3] = &unk_100008400;
    id v16 = v7;
    v14[4] = self;
    id v15 = v6;
    unsigned __int8 v17 = v9;
    [v10 fetchDefaultDownloadsLocationItem:v14];
  }
  else
  {
    id v11 = _DocumentManagerBundle();
    id v12 = [v11 localizedStringForKey:@"Invalid URL wrapper" value:@"Invalid URL wrapper" table:@"Localizable"];

    id v13 = [(DLDocumentDownloads *)self createErrorForCode:-1000 description:v12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

- (void)importItemAtURLToDocuments:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 url];
    unsigned __int8 v9 = [v8 startAccessingSecurityScopedResource];

    id v10 = +[FPItemManager defaultManager];
    int v11 = FPIsCloudDocsWithFPFSEnabled();
    id v12 = (id *)&DOCDocumentSourceIdentifierICloudFPFS;
    if (!v11) {
      id v12 = (id *)&DOCDocumentSourceIdentifierICloudFPv2;
    }
    id v13 = *v12;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100003F88;
    v19[3] = &unk_100008428;
    v19[4] = self;
    id v20 = v6;
    unsigned __int8 v25 = v9;
    id v21 = v10;
    id v22 = @"Documents";
    id v23 = v13;
    id v24 = v7;
    id v14 = v13;
    id v15 = v10;
    objc_msgSend(v15, "_doc_fetchFolderNamed:inDomain:completionHandler:", @"Documents", v14, v19);
  }
  else
  {
    id v16 = _DocumentManagerBundle();
    unsigned __int8 v17 = [v16 localizedStringForKey:@"Invalid URL wrapper" value:@"Invalid URL wrapper" table:@"Localizable"];

    id v18 = [(DLDocumentDownloads *)self createErrorForCode:-1000 description:v17];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v18);
  }
}

- (void)namedLocationExists:(int64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  if (a3 != 2)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"DLDocumentDownloads.m", 400, @"Invalid parameter not satisfying: %@", @"location == _DOCFileDestinationDocuments" object file lineNumber description];
  }
  id v8 = +[FPItemManager defaultManager];
  int v9 = FPIsCloudDocsWithFPFSEnabled();
  id v10 = (id *)&DOCDocumentSourceIdentifierICloudFPFS;
  if (!v9) {
    id v10 = (id *)&DOCDocumentSourceIdentifierICloudFPv2;
  }
  id v11 = *v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000042B4;
  v15[3] = &unk_100008450;
  id v16 = @"Documents";
  id v17 = v11;
  id v18 = v7;
  id v12 = v7;
  id v13 = v11;
  objc_msgSend(v8, "_doc_folderNamed:existsInDomain:completionHandler:", @"Documents", v13, v15);
}

- (void)deleteItemIgnoringResult:(id)a3
{
  id v4 = [(DLDocumentDownloads *)self createDeleteOperation:a3];
  id v3 = +[FPItemManager defaultManager];
  [v3 scheduleAction:v4];
}

- (id)createErrorForCode:(int64_t)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  id v11 = v5;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  id v8 = [v6 initWithDomain:@"com.apple.DocumentManager.DocumentDownloads" code:a3 userInfo:v7];
  return v8;
}

- (id)sandboxingURLWrapperForURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 checkPromisedItemIsReachableAndReturnError:a5])
  {
    id v8 = +[FPSandboxingURLWrapper wrapperWithURL:v7 readonly:v6 error:a5];
  }
  else
  {
    int v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      int v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error while trying to reveal a document at a URL: The resource is not reachable.", v11, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)createTemporaryFolderURLAppropriateForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = +[NSFileManager defaultManager];
  id v7 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:a4];

  if (!v7)
  {
    id v8 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v8 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005AAC();
    }
  }
  return v7;
}

@end