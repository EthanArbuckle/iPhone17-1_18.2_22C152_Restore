@interface SHMediaLibrarySyncManager
- (NSLock)syncCompletionLock;
- (NSUUID)taskID;
- (NSUUID)workerID;
- (SHMediaLibraryClient)client;
- (SHMediaLibraryController)controller;
- (SHMediaLibrarySyncDelegate)delegate;
- (SHMediaLibrarySyncManager)initWithClient:(id)a3 completionHandler:(id)a4;
- (SHWorkerDelegate)workerDelegate;
- (id)completionHandler;
- (int64_t)executionScope;
- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4;
- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5;
- (void)_libraryDidCompleteSync:(id)a3;
- (void)_libraryWillBeginSync:(id)a3;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4 controller:(id)a5;
- (void)finishSyncing;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)updateSnapshotWithAttribution:(id)a3;
@end

@implementation SHMediaLibrarySyncManager

- (SHMediaLibrarySyncManager)initWithClient:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = objc_retainBlock(a4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v8;

  v15.receiver = self;
  v15.super_class = (Class)SHMediaLibrarySyncManager;
  v10 = [(SHMediaLibrarySyncManager *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_client, a3);
    v12 = (NSLock *)objc_alloc_init((Class)NSLock);
    syncCompletionLock = v11->_syncCompletionLock;
    v11->_syncCompletionLock = v12;
  }
  return v11;
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHMediaLibrarySyncManager *)self client];
  id v9 = [v8 type];

  if (!v9)
  {
    NSErrorUserInfoKey v32 = NSDebugDescriptionErrorKey;
    CFStringRef v33 = @"Invalid client Bundle ID or Team ID";
    v23 = &v33;
    v24 = &v32;
LABEL_9:
    v26 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:1];
    v27 = +[SHError errorWithCode:400 underlyingError:0 keyOverrides:v26];

    v28 = [(SHMediaLibrarySyncManager *)self delegate];
    v29 = [v6 allItemIdentifiers];
    [v28 _library:self didProduceError:v27 failedItemIdentifiers:v29];

    v30 = [(SHMediaLibrarySyncManager *)self completionHandler];
    v30[2]();

    goto LABEL_10;
  }
  if (v9 == (id)2)
  {
    v10 = [(SHMediaLibrarySyncManager *)self client];
    v11 = [v10 credentials];
    v12 = [v11 attribution];
    v13 = [v12 containingAppBundleIdentifier];
    unsigned __int8 v14 = [v6 validateWithBundleIdentifier:v13];

    if ((v14 & 1) == 0)
    {
      v25 = sh_log_object();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to synchronize library, snapshot contains invalid changes", v31, 2u);
      }

      NSErrorUserInfoKey v34 = NSDebugDescriptionErrorKey;
      CFStringRef v35 = @"No permisison to sync media library changes";
      v23 = &v35;
      v24 = &v34;
      goto LABEL_9;
    }
  }
  objc_super v15 = [SHMediaLibraryController alloc];
  v16 = [(SHMediaLibrarySyncManager *)self client];
  v17 = [v16 credentials];
  v18 = [v17 attribution];
  v19 = [v18 containingAppBundleIdentifier];
  v20 = [(SHMediaLibrarySyncManager *)self client];
  v21 = [v20 credentials];
  v22 = -[SHMediaLibraryController initWithBundleIdentifier:clientType:](v15, "initWithBundleIdentifier:clientType:", v19, [v21 clientType]);

  [(SHMediaLibrarySyncManager *)self _synchronizeSnapshot:v6 startCondition:v7 controller:v22];
LABEL_10:
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4 controller:(id)a5
{
  objc_storeStrong((id *)&self->_controller, a5);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(SHMediaLibrarySyncManager *)self updateSnapshotWithAttribution:v11];
  v12 = [SHMediaLibraryContext alloc];

  unsigned __int8 v14 = [(SHMediaLibraryContext *)v12 initWithSnapshot:v11 startCondition:v10];
  [(SHMediaLibraryContext *)v14 setDelegate:self];
  v13 = [(SHMediaLibrarySyncManager *)self controller];
  [v13 synchronizeWithContext:v14];
}

- (void)_libraryWillBeginSync:(id)a3
{
  id v4 = [(SHMediaLibrarySyncManager *)self delegate];
  [v4 _libraryWillBeginSync:self];
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(SHMediaLibrarySyncManager *)self client];
  id v8 = [v7 type];

  if (v8 == (id)2)
  {
    id v10 = [(SHMediaLibrarySyncManager *)self client];
    id v11 = [v10 credentials];
    v12 = [v11 attribution];
    v13 = [v12 containingAppBundleIdentifier];
    id v9 = +[SHMediaLibrarySnapshot remapSnapshot:v6 withBundleIdentifier:v13];

    if (!v9) {
      goto LABEL_9;
    }
LABEL_6:
    if ([v9 hasChanges])
    {
      unsigned __int8 v14 = +[NSDistributedNotificationCenter defaultCenter];
      [v14 postNotificationName:SHMediaLibrarySyncDidChangeNotification object:0];

      objc_super v15 = [(SHMediaLibrarySyncManager *)self delegate];
      [v15 _library:v16 didChangeWithSnapshot:v9];
    }
    goto LABEL_9;
  }
  if (v8 != (id)1)
  {
    id v9 = 0;
    goto LABEL_9;
  }
  id v9 = [v6 copy];
  if (v9) {
    goto LABEL_6;
  }
LABEL_9:
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = [(SHMediaLibrarySyncManager *)self client];
  id v9 = [v8 type];

  if (v9 == (id)1 || v9 == (id)2 && objc_msgSend(v13, "sh_isMediaLibraryPublicError"))
  {
    uint64_t v10 = +[SHError remapErrorToClientError:v13];
    if (v10)
    {
      id v11 = (void *)v10;
      v12 = [(SHMediaLibrarySyncManager *)self delegate];
      [v12 _library:self didProduceError:v11 failedItemIdentifiers:v7];
    }
  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  id v4 = a3;
  v5 = [(SHMediaLibrarySyncManager *)self delegate];
  [v5 _libraryDidCompleteSync:self];

  id v6 = v4;
  id v7 = sh_log_object();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SHMediaLibrarySyncManager *)self completionHandler];
    id v9 = objc_retainBlock(v8);
    int v10 = 138412546;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling completion handler %@ on library controller %@", (uint8_t *)&v10, 0x16u);
  }
  [(SHMediaLibrarySyncManager *)self finishSyncing];
  [(SHMediaLibrarySyncManager *)self shutdownWorker];
}

- (void)finishSyncing
{
  v3 = [(SHMediaLibrarySyncManager *)self syncCompletionLock];
  [v3 lock];

  id v4 = [(SHMediaLibrarySyncManager *)self completionHandler];

  if (v4)
  {
    v5 = [(SHMediaLibrarySyncManager *)self completionHandler];
    v5[2]();

    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  id v7 = [(SHMediaLibrarySyncManager *)self syncCompletionLock];
  [v7 unlock];
}

- (void)shutdownWorker
{
  controller = self->_controller;
  self->_controller = 0;

  id v4 = [(SHMediaLibrarySyncManager *)self workerDelegate];
  [v4 finishedWorker:self];

  [(SHMediaLibrarySyncManager *)self finishSyncing];
}

- (void)updateSnapshotWithAttribution:(id)a3
{
  id v3 = a3;
  id v4 = [v3 changes];
  id v5 = [v4 count];

  if (v5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = [v3 changes];
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        __int16 v12 = [v11 libraryItem];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v11 changeType];

          if (v13 == (id)3) {
            continue;
          }
          __int16 v12 = [v11 libraryItem];
          unsigned __int8 v14 = [v12 providerIdentifier];

          if (!v14)
          {
            objc_super v15 = [(SHMediaLibrarySyncManager *)self client];
            id v16 = [v15 credentials];
            v17 = [v16 attribution];
            v18 = [v17 containingAppBundleIdentifier];
            [v12 setProviderIdentifier:v18];

            v19 = [(SHMediaLibrarySyncManager *)self client];
            v20 = [v19 credentials];
            v21 = [v20 attribution];
            v22 = [v21 productName];
            [v12 setProviderName:v22];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v8)
      {
LABEL_14:

        break;
      }
    }
  }
}

- (NSUUID)workerID
{
  workerID = self->_workerID;
  if (!workerID)
  {
    id v4 = +[NSUUID UUID];
    id v5 = self->_workerID;
    self->_workerID = v4;

    workerID = self->_workerID;
  }

  return workerID;
}

- (NSUUID)taskID
{
  taskID = self->_taskID;
  if (!taskID)
  {
    id v4 = +[NSUUID UUID];
    id v5 = self->_taskID;
    self->_taskID = v4;

    taskID = self->_taskID;
  }

  return taskID;
}

- (int64_t)executionScope
{
  return 0;
}

- (SHMediaLibrarySyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMediaLibrarySyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHWorkerDelegate)workerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workerDelegate);

  return (SHWorkerDelegate *)WeakRetained;
}

- (void)setWorkerDelegate:(id)a3
{
}

- (SHMediaLibraryClient)client
{
  return self->_client;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSLock)syncCompletionLock
{
  return self->_syncCompletionLock;
}

- (SHMediaLibraryController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_syncCompletionLock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_workerID, 0);
  objc_destroyWeak((id *)&self->_workerDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end