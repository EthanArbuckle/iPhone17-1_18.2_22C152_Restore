@interface CPLEngineWrapper
- (BOOL)deactivated;
- (BOOL)inEmergencyClosing;
- (BOOL)isSystemLibrary;
- (BOOL)startWithError:(id *)a3;
- (BOOL)stopped;
- (BOOL)stopping;
- (CPLEngineLibrary)engine;
- (CPLEngineParameters)parameters;
- (CPLEngineWrapper)initWithParameters:(id)a3 engine:(id)a4 queue:(id)a5;
- (CPLEngineWrapperDelegate)delegate;
- (NSString)description;
- (NSString)libraryIdentifier;
- (NSString)mainScopeIdentifier;
- (NSURL)clientLibraryBaseURL;
- (NSURL)volumeURL;
- (OS_dispatch_queue)queue;
- (id)_deactivateMarkerURL;
- (id)ownerNameForEngineLibrary:(id)a3;
- (id)redactedDescription;
- (void)_emergencyExit;
- (void)_libraryHasBeenDeleted;
- (void)_libraryMustBeWiped:(id)a3;
- (void)_startWatchingSystemState;
- (void)_startWatchingURL:(id)a3 forPauseReason:(id)a4;
- (void)_stopWatchingSystemState;
- (void)batterySaverWatcherDidChangeState:(id)a3;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)deactivateWithCompletionHandler:(id)a3;
- (void)emergencyClose;
- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)engineLibraryDidCompleteInitialSyncOfMainScope:(id)a3;
- (void)engineLibraryNeedsInitialDownloadOfMainScope:(id)a3;
- (void)fileWatcherFileDidAppear:(id)a3;
- (void)fileWatcherFileDidDisappear:(id)a3;
- (void)pingSupervisor;
- (void)resetStoredParametersWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInEmergencyClosing:(BOOL)a3;
- (void)setVolumeURL:(id)a3;
- (void)stop;
- (void)volumeWillUnmount:(id)a3;
- (void)wipeWithReason:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLEngineWrapper

- (CPLEngineWrapper)initWithParameters:(id)a3 engine:(id)a4 queue:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  if (!v11) {
    sub_1001C51AC(v10, (uint64_t)a2, (uint64_t)self);
  }
  v13 = v12;
  v21.receiver = self;
  v21.super_class = (Class)CPLEngineWrapper;
  v14 = [(CPLEngineWrapper *)&v21 init];
  if (v14)
  {
    v15 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.cpl.enginelibrary.wrapper", v15, v13);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v16;

    v14->_stopped = 1;
    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pausedWatchers = v14->_pausedWatchers;
    v14->_pausedWatchers = v18;

    objc_storeStrong((id *)&v14->_parameters, a3);
    objc_storeStrong((id *)&v14->_engine, a4);
    [(CPLEngineLibrary *)v14->_engine setOwner:v14];
  }

  return v14;
}

- (NSURL)clientLibraryBaseURL
{
  return [(CPLEngineParameters *)self->_parameters clientLibraryBaseURL];
}

- (NSString)libraryIdentifier
{
  return [(CPLEngineParameters *)self->_parameters libraryIdentifier];
}

- (NSString)mainScopeIdentifier
{
  return [(CPLEngineParameters *)self->_parameters mainScopeIdentifier];
}

- (BOOL)isSystemLibrary
{
  v2 = [(CPLEngineParameters *)self->_parameters libraryIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  return v3;
}

- (BOOL)startWithError:(id *)a3
{
  id v5 = [(CPLEngineWrapper *)self clientLibraryBaseURL];
  unsigned int v6 = open((const char *)[v5 fileSystemRepresentation], 0x8000);

  if ((v6 & 0x80000000) == 0)
  {
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v6, 1uLL, (dispatch_queue_t)self->_queue);
    watchCPLLibrarySource = self->_watchCPLLibrarySource;
    self->_watchCPLLibrarySource = v7;

    v9 = self->_watchCPLLibrarySource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000106C4;
    handler[3] = &unk_100275EA0;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    id v10 = self->_watchCPLLibrarySource;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000106E0;
    v26[3] = &unk_100275EA0;
    v26[4] = self;
    dispatch_source_set_cancel_handler(v10, v26);
    dispatch_resume((dispatch_object_t)self->_watchCPLLibrarySource);
    if (!_CPLSilentLogging)
    {
      id v11 = sub_100010670();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_watchCPLLibrarySource;
        *(_DWORD *)buf = 138412802;
        v29 = self;
        __int16 v30 = 1024;
        *(_DWORD *)v31 = v6;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Started watching %@ (fd: %i / source: %@)", buf, 0x1Cu);
      }
    }
    id v13 = 0;
LABEL_18:
    if (self->_volumeURL)
    {
      v20 = [[CPLDaemonDiskArbitration alloc] initWithVolumeURL:self->_volumeURL queue:self->_queue];
      diskArb = self->_diskArb;
      self->_diskArb = v20;

      [(CPLDaemonDiskArbitration *)self->_diskArb addVolumeUnmountObserver:self];
    }
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:self selector:"_libraryMustBeWiped:" name:CPLLibraryMustBeWipedNotificationName object:self->_engine];

    engine = self->_engine;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100010798;
    v25[3] = &unk_100276328;
    v25[4] = self;
    [(CPLEngineLibrary *)engine openWithCompletionHandler:v25];
    BOOL v18 = 1;
    goto LABEL_21;
  }
  v14 = [(CPLEngineWrapper *)self clientLibraryBaseURL];
  id v13 = +[CPLErrors posixErrorForURL:v14];

  v15 = +[NSFileManager defaultManager];
  unsigned int v16 = [v15 cplIsFileDoesNotExistError:v13];

  if (!v16)
  {
    if (!_CPLSilentLogging)
    {
      v19 = sub_100010670();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2112;
        *(void *)v31 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to watch %@: %@", buf, 0x16u);
      }
    }
    goto LABEL_18;
  }
  if (!_CPLSilentLogging)
  {
    v17 = sub_100010670();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ was deleted before we even knew it", buf, 0xCu);
    }
  }
  if (a3)
  {
    id v13 = v13;
    BOOL v18 = 0;
    *a3 = v13;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_21:

  return v18;
}

- (void)_emergencyExit
{
  [(CPLEngineWrapper *)self emergencyClose];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained) {
    exit(0);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  [v4 wrapperEmergencyExit:self];
}

- (void)_libraryHasBeenDeleted
{
  if (!_CPLSilentLogging)
  {
    unsigned __int8 v3 = sub_100010670();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      unsigned int v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@ has been deleted - dropping stored parameters and exiting now.", (uint8_t *)&v5, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wrapperShouldBeDropped:self];

  [(CPLEngineWrapper *)self _emergencyExit];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  int v5 = [(CPLEngineWrapper *)self libraryIdentifier];
  unsigned int v6 = [(CPLEngineWrapper *)self clientLibraryBaseURL];
  v7 = [v6 path];
  v8 = [v7 stringByAbbreviatingWithTildeInPath];
  unsigned int v9 = [(CPLEngineWrapper *)self inEmergencyClosing];
  id v10 = "";
  if (v9) {
    id v10 = " (emergency closing)";
  }
  id v11 = [v3 initWithFormat:@"<%@ for %@ at %@%s>", v4, v5, v8, v10];

  return (NSString *)v11;
}

- (id)redactedDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  int v5 = [(CPLEngineWrapper *)self libraryIdentifier];
  unsigned int v6 = [(CPLEngineWrapper *)self inEmergencyClosing];
  v7 = "";
  if (v6) {
    v7 = " (emergency closing)";
  }
  id v8 = [v3 initWithFormat:@"<%@ for %@ %s>", v4, v5, v7];

  return v8;
}

- (void)stop
{
  self->_stopping = 1;
  [(CPLEngineWrapper *)self _stopWatchingSystemState];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010D2C;
  block[3] = &unk_100275EA0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)queue, block);
  engine = self->_engine;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010E20;
  v6[3] = &unk_100276328;
  v6[4] = self;
  [(CPLEngineLibrary *)engine closeAndDeactivate:0 completionHandler:v6];
}

- (void)emergencyClose
{
  if (![(CPLEngineWrapper *)self inEmergencyClosing])
  {
    if (!_CPLSilentLogging)
    {
      dispatch_time_t v3 = sub_100010670();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 138412290;
        int v5 = self;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing %@ in emergency", (uint8_t *)&v4, 0xCu);
      }
    }
    [(CPLEngineWrapper *)self setInEmergencyClosing:1];
    [(CPLEngineLibrary *)self->_engine emergencyClose];
  }
}

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  engine = self->_engine;
  if (engine)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000111F4;
    v7[3] = &unk_1002766A8;
    v7[4] = self;
    id v8 = v4;
    [(CPLEngineLibrary *)engine closeAndDeactivate:1 completionHandler:v7];
  }
}

- (void)wipeWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  engine = self->_engine;
  id v8 = a3;
  unsigned int v9 = [(CPLEngineLibrary *)engine store];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011428;
  v11[3] = &unk_100276288;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 wipeStoreAtNextOpeningWithReason:v8 completionBlock:v11];
}

- (void)resetStoredParametersWithCompletionHandler:(id)a3
{
  self->_deactivated = 1;
  p_delegate = &self->_delegate;
  id v6 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained wrapperShouldBeDropped:self];

  v6[2]();
}

- (void)pingSupervisor
{
  id v2 = [(CPLEngineLibrary *)self->_engine supervisor];
  [v2 ping];
}

- (id)_deactivateMarkerURL
{
  id v2 = [(CPLEngineLibrary *)self->_engine store];
  dispatch_time_t v3 = [v2 platformObject];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 deactivateMarkerURL];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_startWatchingURL:(id)a3 forPauseReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)CPLFileWatcher);
  unsigned int v9 = [(CPLEngineWrapper *)self libraryIdentifier];
  id v10 = [v8 initWithFileURL:v7 name:v6 ownerIdentifier:v9 delegate:self queue:self->_queue];

  [(NSMutableSet *)self->_unpausedWatchers addObject:v10];
  [v10 startWatching];
}

- (void)_startWatchingSystemState
{
  dispatch_time_t v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  pausedWatchers = self->_pausedWatchers;
  self->_pausedWatchers = v3;

  int v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  unpausedWatchers = self->_unpausedWatchers;
  self->_unpausedWatchers = v5;

  id v7 = [(CPLEngineWrapper *)self clientLibraryBaseURL];
  if (!_CPLSilentLogging)
  {
    id v8 = sub_100010670();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(CPLEngineWrapper *)self libraryIdentifier];
      id v10 = [v7 path];
      id v11 = [v10 stringByAbbreviatingWithTildeInPath];
      int v19 = 138543618;
      v20 = v9;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will watch markers for %{public}@ in %@", (uint8_t *)&v19, 0x16u);
    }
  }
  id v12 = [v7 URLByAppendingPathComponent:@"pauseSyncMarker" isDirectory:0];
  [(CPLEngineWrapper *)self _startWatchingURL:v12 forPauseReason:@"test pause marker"];
  id v13 = [v7 URLByAppendingPathComponent:@"pauseICloudPhotos" isDirectory:0];
  [(CPLEngineWrapper *)self _startWatchingURL:v13 forPauseReason:@"user pause marker"];
  v14 = [(CPLEngineWrapper *)self _deactivateMarkerURL];
  if (v14) {
    [(CPLEngineWrapper *)self _startWatchingURL:v14 forPauseReason:@"deactivation marker"];
  }
  v15 = (PFCameraViewfinderSessionWatcher *)[objc_alloc((Class)PFCameraViewfinderSessionWatcher) initWithDispatchQueue:self->_queue delegate:self];
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v15;

  [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher startWatching];
  [(CPLEngineWrapper *)self cameraWatcherDidChangeState:self->_cameraWatcher];
  v17 = [[CPLBatterySaverWatcher alloc] initWithDispatchQueue:self->_queue delegate:self];
  batterySaverWatcher = self->_batterySaverWatcher;
  self->_batterySaverWatcher = v17;

  [(CPLBatterySaverWatcher *)self->_batterySaverWatcher startWatching];
}

- (void)_stopWatchingSystemState
{
  dispatch_time_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CPLLibraryMustBeWipedNotificationName object:self->_engine];

  watchCPLLibrarySource = self->_watchCPLLibrarySource;
  if (watchCPLLibrarySource)
  {
    dispatch_source_cancel(watchCPLLibrarySource);
    int v5 = self->_watchCPLLibrarySource;
    self->_watchCPLLibrarySource = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = self->_pausedWatchers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * (void)v10) stopWatching];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = self->_unpausedWatchers;
  id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v15), "stopWatching", (void)v21);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  pausedWatchers = self->_pausedWatchers;
  self->_pausedWatchers = 0;

  unpausedWatchers = self->_unpausedWatchers;
  self->_unpausedWatchers = 0;

  [(CPLBatterySaverWatcher *)self->_batterySaverWatcher stopWatching];
  batterySaverWatcher = self->_batterySaverWatcher;
  self->_batterySaverWatcher = 0;

  [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher stopWatching];
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = 0;

  [(CPLDaemonDiskArbitration *)self->_diskArb removeVolumeUnmountObserver:self];
  [(CPLDaemonDiskArbitration *)self->_diskArb stop];
  diskArb = self->_diskArb;
  self->_diskArb = 0;
}

- (void)_libraryMustBeWiped:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011CF0;
  v7[3] = &unk_100275EA0;
  v7[4] = self;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D4C;
  block[3] = &unk_100275DF8;
  id v9 = v4;
  int v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011EC8;
  v11[3] = &unk_100276288;
  v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D4C;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012058;
  v11[3] = &unk_100276288;
  v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D4C;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (id)ownerNameForEngineLibrary:(id)a3
{
  dispatch_time_t v3 = +[NSProcessInfo processInfo];
  id v4 = [v3 processName];

  return v4;
}

- (void)engineLibraryNeedsInitialDownloadOfMainScope:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001238C;
  v7[3] = &unk_100275EA0;
  v7[4] = self;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D4C;
  block[3] = &unk_100275DF8;
  id v9 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (void)engineLibraryDidCompleteInitialSyncOfMainScope:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000124D0;
  v7[3] = &unk_100275EA0;
  v7[4] = self;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D4C;
  block[3] = &unk_100275DF8;
  id v9 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (void)volumeWillUnmount:(id)a3
{
  id v4 = (CPLDaemonDiskArbitration *)a3;
  if (self->_diskArb == v4)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_100010670();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        id v7 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Volume for %@ will unmount. Requesting emergency exit", (uint8_t *)&v6, 0xCu);
      }
    }
    [(CPLEngineWrapper *)self _emergencyExit];
  }
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  id v4 = (PFCameraViewfinderSessionWatcher *)a3;
  id v5 = v4;
  if (!self->_deactivated && !self->_stopping && !self->_stopped && self->_cameraWatcher == v4)
  {
    if ([(PFCameraViewfinderSessionWatcher *)v4 isCameraRunning])
    {
      if (!self->_disabledEngineBecauseOfCamera)
      {
        self->_disabledEngineBecauseOfCamera = 1;
        if (!_CPLSilentLogging)
        {
          int v6 = sub_100010670();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 138412290;
            id v12 = self;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Camera for %@ is running - disabling background synchronization", (uint8_t *)&v11, 0xCu);
          }
        }
        id v7 = [(CPLEngineLibrary *)self->_engine scheduler];
        [v7 disableSynchronizationWithReason:@"camera"];

        id v8 = [(CPLEngineLibrary *)self->_engine supervisor];
        [v8 pause];
LABEL_18:
      }
    }
    else if (self->_disabledEngineBecauseOfCamera)
    {
      self->_disabledEngineBecauseOfCamera = 0;
      if (!_CPLSilentLogging)
      {
        id v9 = sub_100010670();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412290;
          id v12 = self;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Camera for %@ is not running - re-enabling background synchronization", (uint8_t *)&v11, 0xCu);
        }
      }
      dispatch_block_t v10 = [(CPLEngineLibrary *)self->_engine scheduler];
      [v10 enableSynchronizationWithReason:@"camera"];

      id v8 = [(CPLEngineLibrary *)self->_engine supervisor];
      [v8 resume];
      goto LABEL_18;
    }
  }
}

- (void)fileWatcherFileDidAppear:(id)a3
{
  id v4 = a3;
  if (!self->_deactivated
    && !self->_stopping
    && !self->_stopped
    && [(NSMutableSet *)self->_unpausedWatchers containsObject:v4])
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_100010670();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        id v10 = v4;
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ for %@ is present - disabling background synchronization", (uint8_t *)&v9, 0x16u);
      }
    }
    [(NSMutableSet *)self->_pausedWatchers addObject:v4];
    [(NSMutableSet *)self->_unpausedWatchers removeObject:v4];
    int v6 = [(CPLEngineLibrary *)self->_engine scheduler];
    id v7 = [v4 name];
    [v6 disableSynchronizationWithReason:v7];

    id v8 = [(CPLEngineLibrary *)self->_engine supervisor];
    [v8 pause];
  }
}

- (void)fileWatcherFileDidDisappear:(id)a3
{
  id v4 = a3;
  if (!self->_deactivated
    && !self->_stopping
    && !self->_stopped
    && [(NSMutableSet *)self->_pausedWatchers containsObject:v4])
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_100010670();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        id v10 = v4;
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ for %@ is absent - re-enabling background synchronization", (uint8_t *)&v9, 0x16u);
      }
    }
    [(NSMutableSet *)self->_unpausedWatchers addObject:v4];
    [(NSMutableSet *)self->_pausedWatchers removeObject:v4];
    int v6 = [(CPLEngineLibrary *)self->_engine scheduler];
    id v7 = [v4 name];
    [v6 enableSynchronizationWithReason:v7];

    id v8 = [(CPLEngineLibrary *)self->_engine supervisor];
    [v8 resume];
  }
}

- (void)batterySaverWatcherDidChangeState:(id)a3
{
  id v4 = (CPLBatterySaverWatcher *)a3;
  id v5 = v4;
  if (!self->_deactivated && !self->_stopping && !self->_stopped && self->_batterySaverWatcher == v4)
  {
    if ([(CPLBatterySaverWatcher *)v4 inBatterySaverMode])
    {
      if (!_CPLSilentLogging)
      {
        int v6 = sub_100010670();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Low Power Mode enabled - stopping CPL Override", buf, 2u);
        }
      }
      id v7 = [(CPLEngineWrapper *)self engine];
      id v8 = [v7 systemMonitor];
      [v8 stopOverridingSystemBudgetsForClient:18487];

LABEL_14:
      goto LABEL_15;
    }
    if (!_CPLSilentLogging)
    {
      id v7 = sub_100010670();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Low Power Mode disabled", v9, 2u);
      }
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (CPLEngineParameters)parameters
{
  return self->_parameters;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPLEngineLibrary)engine
{
  return self->_engine;
}

- (NSURL)volumeURL
{
  return self->_volumeURL;
}

- (void)setVolumeURL:(id)a3
{
}

- (CPLEngineWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLEngineWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)inEmergencyClosing
{
  return self->_inEmergencyClosing;
}

- (void)setInEmergencyClosing:(BOOL)a3
{
  self->_inEmergencyClosing = a3;
}

- (BOOL)stopping
{
  return self->_stopping;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (BOOL)deactivated
{
  return self->_deactivated;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeURL, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_unpausedWatchers, 0);
  objc_storeStrong((id *)&self->_pausedWatchers, 0);
  objc_storeStrong((id *)&self->_batterySaverWatcher, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_diskArb, 0);
  objc_storeStrong((id *)&self->_watchCPLLibrarySource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end