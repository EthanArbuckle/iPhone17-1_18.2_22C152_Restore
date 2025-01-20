@interface DROnDemandFileProviderPresenter
+ (double)presenterValiditySeconds;
+ (id)presenterPresentingURLWrapper:(id)a3 type:(id)a4 outURLWrapper:(id *)a5;
+ (void)setPresenterValiditySeconds:(double)a3;
- (BOOL)operationQueue_hasObservedEvent;
- (BOOL)shouldEvictWhenDone;
- (DROnDemandFileProviderPresenter)initWithURLWrapper:(id)a3 type:(id)a4;
- (NSURL)fileURL;
- (NSURL)folderURL;
- (NSURL)presentedItemURL;
- (id)presentedItemOperationQueue;
- (void)_operationQueue_invalidate;
- (void)beginPresenting;
- (void)relinquishPresentedItemToReader:(id)a3;
- (void)setShouldEvictWhenDone:(BOOL)a3;
@end

@implementation DROnDemandFileProviderPresenter

+ (void)setPresenterValiditySeconds:(double)a3
{
  qword_100063DC0 = *(void *)&a3;
}

+ (double)presenterValiditySeconds
{
  return *(double *)&qword_100063DC0;
}

- (DROnDemandFileProviderPresenter)initWithURLWrapper:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)DROnDemandFileProviderPresenter;
  v9 = [(DROnDemandFileProviderPresenter *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceURLWrapper, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v7 fpItem], v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      v12 = [v7 fpItem];
      v13 = [v12 filename];
    }
    else
    {
      v12 = [v7 url];
      v13 = [v12 lastPathComponent];
    }
    v14 = v13;
    v15 = sub_10000E80C(v13, (uint64_t)v8);

    v16 = +[NSString stringWithFormat:@".%@.XXXXXX", @"com.apple.DragUI"];
    v17 = NSTemporaryDirectory();
    v18 = [v17 stringByAppendingPathComponent:v16];

    [v18 getFileSystemRepresentation:v26 maxLength:1024];
    if (mkdtemp(v26))
    {
      v19 = +[NSString stringWithUTF8String:v26];
      uint64_t v20 = +[NSURL fileURLWithPath:v19 isDirectory:1];
    }
    else
    {
      uint64_t v20 = 0;
    }

    folderURL = v10->_folderURL;
    v10->_folderURL = (NSURL *)v20;

    uint64_t v22 = [(NSURL *)v10->_folderURL URLByAppendingPathComponent:v15];
    fileURL = v10->_fileURL;
    v10->_fileURL = (NSURL *)v22;
  }
  return v10;
}

- (void)beginPresenting
{
  objc_initWeak(&location, self);
  v2 = -[DROnDemandFileProviderPresenter presentedItemOperationQueue]_0();
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_10000EA04;
  id v7 = &unk_100054CA8;
  objc_copyWeak(&v8, &location);
  [v2 addOperationWithBlock:&v4];

  v3 = -[DROnDemandFileProviderPresenter presentedItemOperationQueue]_0();
  objc_msgSend(v3, "waitUntilAllOperationsAreFinished", v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)presentedItemOperationQueue
{
  if (qword_100064628 != -1) {
    dispatch_once(&qword_100064628, &stru_100054E18);
  }
  v0 = (void *)qword_100064620;
  return v0;
}

- (void)_operationQueue_invalidate
{
  if (self->_operationQueue_valid)
  {
    v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      fileURL = self->_fileURL;
      int v8 = 138412290;
      v9 = fileURL;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating file presenter at URL %@", (uint8_t *)&v8, 0xCu);
    }

    self->_operationQueue_valid = 0;
    uint64_t v5 = +[NSFileManager defaultManager];
    [v5 removeItemAtURL:self->_folderURL error:0];

    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(PBSecurityScopedURLWrapper *)self->_sourceURLWrapper fpItem],
          v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      if (self->_shouldEvictWhenDone)
      {
        id v7 = [(PBSecurityScopedURLWrapper *)self->_sourceURLWrapper url];
        FPEvictItem();
      }
    }
    +[NSFileCoordinator removeFilePresenter:self];
  }
}

+ (id)presenterPresentingURLWrapper:(id)a3 type:(id)a4 outURLWrapper:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithURLWrapper:v9 type:v8];

  id v11 = objc_alloc((Class)PBSecurityScopedURLWrapper);
  v12 = [v10 fileURL];
  id v13 = [v11 initWithURL:v12 readonly:1 extensionClass:@"com.apple.app-sandbox.read"];

  [v10 beginPresenting];
  if (a5) {
    *a5 = v13;
  }

  return v10;
}

- (NSURL)presentedItemURL
{
  return self->_fileURL;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    fileURL = self->_fileURL;
    *(_DWORD *)buf = 138412290;
    v32 = fileURL;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cloning file provider data to URL %@", buf, 0xCu);
  }

  id v7 = self->_fileURL;
  id v8 = self->_sourceURLWrapper;
  self->_operationQueue_hasObservedEvent = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(PBSecurityScopedURLWrapper *)self->_sourceURLWrapper fpItem],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id v10 = DRLogTarget();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Exporting file provider data to URL %@", buf, 0xCu);
    }

    id v11 = +[FPItemManager defaultManager];
    v12 = [(PBSecurityScopedURLWrapper *)self->_sourceURLWrapper fpItem];
    id v13 = self->_fileURL;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000F194;
    v26[3] = &unk_100054DD0;
    v28 = self;
    id v29 = v4;
    v27 = v7;
    v14 = v7;
    [v11 recursivelyExportItem:v12 toURL:v13 completionHandler:v26];

    id v15 = v29;
  }
  else
  {
    id v15 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
    v16 = [(PBSecurityScopedURLWrapper *)self->_sourceURLWrapper url];
    v17 = +[NSFileAccessIntent readingIntentWithURL:v16 options:1];

    v30 = v17;
    v18 = +[NSArray arrayWithObjects:&v30 count:1];
    v19 = -[DROnDemandFileProviderPresenter presentedItemOperationQueue]_0();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000F344;
    v21[3] = &unk_100054DF8;
    uint64_t v22 = v8;
    v23 = v7;
    v24 = self;
    id v25 = v4;
    uint64_t v20 = v7;
    [v15 coordinateAccessWithIntents:v18 queue:v19 byAccessor:v21];
  }
}

- (BOOL)shouldEvictWhenDone
{
  return self->_shouldEvictWhenDone;
}

- (void)setShouldEvictWhenDone:(BOOL)a3
{
  self->_shouldEvictWhenDone = a3;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)operationQueue_hasObservedEvent
{
  return self->_operationQueue_hasObservedEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
  objc_storeStrong((id *)&self->_sourceURLWrapper, 0);
}

@end