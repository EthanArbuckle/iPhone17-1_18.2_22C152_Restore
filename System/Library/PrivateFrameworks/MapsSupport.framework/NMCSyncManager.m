@interface NMCSyncManager
+ (id)mapsDirectory;
+ (id)nanoRegistryDirectory;
+ (id)pinsPath;
- (NMCSyncManager)init;
- (NMCSyncManager)initWithDelegate:(id)a3;
- (NMCSyncManagerDelegate)delegate;
- (id)_containerCompletionQueue;
- (id)readPins;
- (void)_completedInitialSync;
- (void)_createNanoRegistryDirectoryIfNeeded;
- (void)completedPreparingSync;
- (void)completedSync;
- (void)notifyObservers;
- (void)preparingSync;
- (void)requestSyncUpdateWithReply:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)synchronizePreferences;
- (void)writePins:(id)a3;
@end

@implementation NMCSyncManager

+ (id)mapsDirectory
{
  v2 = +[LSBundleRecord bundleRecordWithBundleIdentifier:@"com.apple.Maps" allowPlaceholder:0 error:0];
  v3 = [v2 dataContainerURL];
  v4 = [v3 path];

  v5 = [v4 stringByAppendingPathComponent:@"Library"];
  v6 = [v5 stringByAppendingPathComponent:@"Maps"];

  return v6;
}

+ (id)nanoRegistryDirectory
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = [v2 pairingStorePath];

  v4 = [v3 stringByAppendingPathComponent:@"NanoMaps"];

  return v4;
}

+ (id)pinsPath
{
  v2 = [a1 nanoRegistryDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Pins.mapsdata"];

  return v3;
}

- (void)_createNanoRegistryDirectoryIfNeeded
{
  id v5 = +[NSFileManager defaultManager];
  v2 = [(id)objc_opt_class() nanoRegistryDirectory];
  unsigned __int8 v3 = [v5 fileExistsAtPath:v2 isDirectory:0];

  if ((v3 & 1) == 0)
  {
    v4 = [(id)objc_opt_class() nanoRegistryDirectory];
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (NMCSyncManager)init
{
  return [(NMCSyncManager *)self initWithDelegate:0];
}

- (NMCSyncManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NMCSyncManager;
  id v5 = [(NMCSyncManager *)&v24 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.mapssync"];
    coordinator = v6->_coordinator;
    v6->_coordinator = (PSYSyncCoordinator *)v7;

    [(PSYSyncCoordinator *)v6->_coordinator setDelegate:v6];
    uint64_t v9 = objc_opt_new();
    preferencesSyncManager = v6->_preferencesSyncManager;
    v6->_preferencesSyncManager = (NPSManager *)v9;

    v11 = [DrivePreferences alloc];
    id v12 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Maps"];
    v13 = [(DrivePreferences *)v11 initWithDefaults:v12];
    drivePreferences = v6->_drivePreferences;
    v6->_drivePreferences = v13;

    v15 = [CyclePreferences alloc];
    id v16 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Maps"];
    v17 = [(CyclePreferences *)v15 initWithDefaults:v16];
    cyclePreferences = v6->_cyclePreferences;
    v6->_cyclePreferences = v17;

    v19 = [TransitPreferences alloc];
    id v20 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Maps"];
    v21 = [(WatchSyncedPreferences *)v19 initWithDefaults:v20];
    transitPreferences = v6->_transitPreferences;
    v6->_transitPreferences = v21;
  }
  return v6;
}

- (id)_containerCompletionQueue
{
  if (qword_10009B7E8 != -1) {
    dispatch_once(&qword_10009B7E8, &stru_1000821E0);
  }
  v2 = (void *)qword_10009B7E0;

  return v2;
}

- (id)readPins
{
  v2 = [(id)objc_opt_class() pinsPath];
  unsigned __int8 v3 = +[NSDictionary dictionaryWithContentsOfFile:v2];

  id v4 = [v3 objectForKey:@"PinsKey"];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v12 = objc_alloc((Class)MSPPinStorage);
        id v13 = objc_msgSend(v12, "initWithData:", v11, (void)v18);
        v14 = v13;
        if (v13)
        {
          v15 = [v13 identifier];

          if (v15) {
            [v5 addObject:v14];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v16 = [v5 copy];

  return v16;
}

- (void)writePins:(id)a3
{
  unsigned __int8 v3 = [a3 arrayByApplyingSelector:"data"];
  id v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v3, @"PinsKey", &off_1000883C0, @"PinsVersionKey", 0);
  id v5 = [(id)objc_opt_class() pinsPath];
  id v8 = 0;
  unsigned __int8 v6 = objc_msgSend(v4, "_maps_writeBinaryPlist:error:", v5, &v8);
  id v7 = v8;

  if (v7 || (v6 & 1) == 0) {
    NSLog(@"Error writing pins: %@", v7);
  }
}

- (void)preparingSync
{
  unsigned __int8 v3 = sub_100053C04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138477827;
    CFStringRef v6 = @"preparingSync";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(PSYSyncCoordinator *)self->_coordinator activeSyncSession];
  [v4 reportProgress:0.33];
}

- (void)completedPreparingSync
{
  unsigned __int8 v3 = sub_100053C04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138477827;
    CFStringRef v7 = @"completedPreparingSync";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(PSYSyncCoordinator *)self->_coordinator activeSyncSession];
  [v4 reportProgress:0.66];

  int v5 = [(PSYSyncCoordinator *)self->_coordinator activeSyncSession];
  [v5 syncDidCompleteSending];
}

- (void)_completedInitialSync
{
  unsigned __int8 v3 = sub_100053C04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138477827;
    CFStringRef v7 = @"completeSync";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(PSYSyncCoordinator *)self->_coordinator activeSyncSession];
  [v4 reportProgress:1.0];

  int v5 = [(PSYSyncCoordinator *)self->_coordinator activeSyncSession];
  [v5 syncDidComplete];
}

- (void)completedSync
{
  unsigned __int8 v3 = sub_100053C04();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    waitingOnInitialSyncLock = self->_waitingOnInitialSyncLock;
    int v9 = 138478083;
    CFStringRef v10 = @"completeInternalSync";
    __int16 v11 = 2113;
    *(void *)id v12 = waitingOnInitialSyncLock;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@ (lock:%{private}@)", (uint8_t *)&v9, 0x16u);
  }

  [(NSLock *)self->_waitingOnInitialSyncLock lock];
  self->_BOOL waitingOnInternalInitialSync = 0;
  BOOL waitingOnDelegateInitialSync = self->_waitingOnDelegateInitialSync;
  [(NSLock *)self->_waitingOnInitialSyncLock unlock];
  int v6 = sub_100053C04();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = self->_waitingOnDelegateInitialSync;
    BOOL waitingOnInternalInitialSync = self->_waitingOnInternalInitialSync;
    int v9 = 138478595;
    CFStringRef v10 = @"tryCompleteSync";
    __int16 v11 = 1024;
    *(_DWORD *)id v12 = !waitingOnDelegateInitialSync;
    *(_WORD *)&v12[4] = 1024;
    *(_DWORD *)&v12[6] = v7;
    __int16 v13 = 1024;
    BOOL v14 = waitingOnInternalInitialSync;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@ (complete:%i, syncD:%i syncI:%i)", (uint8_t *)&v9, 0x1Eu);
  }

  if (!waitingOnDelegateInitialSync) {
    [(NMCSyncManager *)self _completedInitialSync];
  }
}

- (void)notifyObservers
{
  id v3 = [(NMCSyncManager *)self delegate];
  [v3 syncManagerDidUpdate:self];
}

- (void)requestSyncUpdateWithReply:(id)a3
{
  id v5 = a3;
  [(NMCSyncManager *)self notifyObservers];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)synchronizePreferences
{
  preferencesSyncManager = self->_preferencesSyncManager;
  id v4 = +[NSSet setWithObjects:@"DistanceUnits", @"HasShownNavModeAdvisory2020", 0];
  [(NPSManager *)preferencesSyncManager synchronizeUserDefaultsDomain:@"com.apple.Maps" keys:v4 container:@"com.apple.Maps"];

  [(DrivePreferences *)self->_drivePreferences loadValuesFromDefaults];
  [(WatchSyncedPreferences *)self->_drivePreferences synchronize];
  [(CyclePreferences *)self->_cyclePreferences loadValuesFromDefaults];
  [(WatchSyncedPreferences *)self->_cyclePreferences synchronize];
  [(TransitPreferences *)self->_transitPreferences loadValuesFromDefaults];
  transitPreferences = self->_transitPreferences;

  [(WatchSyncedPreferences *)transitPreferences synchronize];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  preferencesSyncManager = self->_preferencesSyncManager;
  uint64_t v6 = GEODefaultsDomain();
  BOOL v7 = NMGetGEOUserDefaultStringKeysForWatchSync();
  id v8 = +[NSSet setWithArray:v7];
  [(NPSManager *)preferencesSyncManager synchronizeUserDefaultsDomain:v6 keys:v8 container:0];

  int v9 = self->_preferencesSyncManager;
  CFStringRef v10 = +[NSSet setWithObjects:@"DistanceUnits", @"HasShownNavModeAdvisory2020", 0];
  [(NPSManager *)v9 synchronizeUserDefaultsDomain:@"com.apple.Maps" keys:v10 container:@"com.apple.Maps"];

  __int16 v11 = (NSLock *)objc_alloc_init((Class)NSLock);
  waitingOnInitialSyncLock = self->_waitingOnInitialSyncLock;
  self->_waitingOnInitialSyncLock = v11;

  __int16 v13 = sub_100053C04();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    BOOL v14 = self->_waitingOnInitialSyncLock;
    *(_DWORD *)buf = 138478083;
    CFStringRef v23 = @"beginSync";
    __int16 v24 = 2113;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@ (lock:%{private}@)", buf, 0x16u);
  }

  self->_BOOL waitingOnInternalInitialSync = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    self->_BOOL waitingOnDelegateInitialSync = 1;
    id v16 = sub_100053C04();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_waitingOnInitialSyncLock;
      *(_DWORD *)buf = 138478083;
      CFStringRef v23 = @"beginDelegateSync";
      __int16 v24 = 2113;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@ (lock:%{private}@)", buf, 0x16u);
    }

    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100032A74;
    v21[3] = &unk_100082208;
    v21[4] = self;
    [v18 syncManager:self didRequestInitialSync:v21];
  }
  else
  {
    self->_BOOL waitingOnDelegateInitialSync = 0;
  }
  long long v19 = sub_100053C04();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    long long v20 = self->_waitingOnInitialSyncLock;
    *(_DWORD *)buf = 138478083;
    CFStringRef v23 = @"beginInternalSync";
    __int16 v24 = 2113;
    v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "com.apple.pairedsync.mapssync sync:%{private}@ (lock:%{private}@)", buf, 0x16u);
  }

  [(NMCSyncManager *)self setNeedsFullSync];
}

- (NMCSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NMCSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waitingOnInitialSyncLock, 0);
  objc_storeStrong((id *)&self->_transitPreferences, 0);
  objc_storeStrong((id *)&self->_cyclePreferences, 0);
  objc_storeStrong((id *)&self->_drivePreferences, 0);
  objc_storeStrong((id *)&self->_preferencesSyncManager, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end