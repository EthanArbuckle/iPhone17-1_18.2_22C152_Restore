@interface BDSUbiquityStatusMonitor
- (BDSICloudIdentityToken)currentUbiquityIdentityToken;
- (BDSICloudIdentityToken)lastArchivedNonNilUbiquityIdentityToken;
- (BDSICloudIdentityToken)lastArchivedUbiquityIdentityToken;
- (BDSICloudIdentityToken)ubiquityIdentityToken;
- (BDSUbiquityStatusChangeObserving)coordinatingObserver;
- (BDSUbiquityStatusMonitor)init;
- (BOOL)archivedCloudDriveOptedIn;
- (BOOL)dq_isICloudDriveEnabled;
- (BOOL)isICloudDriveEnabled;
- (BOOL)lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch;
- (NSHashTable)observers;
- (NSString)containerIdentifier;
- (NSURL)containerURL;
- (NSURL)documentsURL;
- (OS_dispatch_queue)containerQueue;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)notifyQueue;
- (id)description;
- (void)_notifyObserversForChangesWithCurrentToken:(id)a3 lastToken:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)dq_archiveCurrentUbiquityIdentityToken;
- (void)dq_refreshUbiquityAvailabilityStatus;
- (void)p_ubiquityIdentityDidChange:(id)a3;
- (void)registerCoordinatingObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)restartObserving;
- (void)setArchivedCloudDriveOptedIn:(BOOL)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setContainerQueue:(id)a3;
- (void)setContainerURL:(id)a3;
- (void)setCoordinatingObserver:(id)a3;
- (void)setCurrentUbiquityIdentityToken:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDocumentsURL:(id)a3;
- (void)setLastArchivedNonNilUbiquityIdentityToken:(id)a3;
- (void)setLastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3;
- (void)setLastArchivedUbiquityIdentityToken:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation BDSUbiquityStatusMonitor

- (BDSUbiquityStatusMonitor)init
{
  v22.receiver = self;
  v22.super_class = (Class)BDSUbiquityStatusMonitor;
  v2 = [(BDSUbiquityStatusMonitor *)&v22 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.iBooks.BDSUbiquityStatusMonitor.containerQueue", v5);
    containerQueue = v2->_containerQueue;
    v2->_containerQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iBooks.BDSUbiquityStatusMonitor.dispatchQueue", v8);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iBooks.BDSUbiquityStatusMonitor.notifyQueue", v11);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v12;

    v14 = +[NSUserDefaults standardUserDefaults];
    v15 = [v14 valueForKey:@"nonNilUbiquityIdentityToken"];
    v2->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch = v15 != 0;

    v2->_archivedCloudDriveOptedIn = +[BDSSyncUserDefaults isICloudDriveSyncOptedIn];
    v16 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E84C;
    block[3] = &unk_10025F700;
    v17 = v2;
    v21 = v17;
    dispatch_async(v16, block);
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v17 selector:"p_ubiquityIdentityDidChange:" name:NSUbiquityIdentityDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BDSUbiquityStatusMonitor;
  [(BDSUbiquityStatusMonitor *)&v4 dealloc];
}

- (BDSICloudIdentityToken)ubiquityIdentityToken
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10000E9D4;
  v11 = sub_10000E9E4;
  id v12 = 0;
  uint64_t v3 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E9EC;
  v6[3] = &unk_10025F960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BDSICloudIdentityToken *)v4;
}

- (BOOL)dq_isICloudDriveEnabled
{
  v2 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
  dispatch_assert_queue_V2(v2);

  unsigned int v3 = +[BDSSyncUserDefaults isICloudDriveSyncOptedIn];
  if (v3)
  {
    CFStringRef v4 = @"NO";
    if (+[BDSSyncUserDefaults isCloudKitSyncOptedIn])
    {
      BOOL v5 = +[BDSSyncUserDefaults isGlobalICloudDriveSyncOptedIn];
      if (v5) {
        CFStringRef v4 = @"YES";
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
    CFStringRef v4 = @"NO";
  }
  dispatch_queue_t v6 = sub_10000D100();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v8 = @"YES";
    if (v3) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    int v10 = 138412802;
    CFStringRef v11 = v9;
    __int16 v12 = 2112;
    if (!v5) {
      CFStringRef v8 = @"NO";
    }
    CFStringRef v13 = v4;
    __int16 v14 = 2112;
    CFStringRef v15 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "BDSUbiquityStatusMonitor: dq_isICloudDriveEnabled: isICloudDriveSyncOptedIn = %@, globalICloudDrive = %@, isICloudDriveEnabled = %@", (uint8_t *)&v10, 0x20u);
  }

  return v5;
}

- (BOOL)isICloudDriveEnabled
{
  v2 = self;
  unsigned int v3 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  CFStringRef v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  CFStringRef v4 = [(BDSUbiquityStatusMonitor *)v2 dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EC80;
  v6[3] = &unk_10025F960;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000ED6C;
    v6[3] = &unk_10025F988;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000EE78;
    v6[3] = &unk_10025F988;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)registerCoordinatingObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000EFC4;
    v6[3] = &unk_10025F988;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)restartObserving
{
  unsigned int v3 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F054;
  block[3] = &unk_10025F700;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)dq_archiveCurrentUbiquityIdentityToken
{
  unsigned int v3 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSUserDefaults standardUserDefaults];
  BOOL v5 = [(BDSUbiquityStatusMonitor *)self currentUbiquityIdentityToken];
  dispatch_queue_t v6 = [v5 token];
  [v4 setObject:v6 forKey:@"ubiquityIdentityToken"];

  id v7 = [(BDSUbiquityStatusMonitor *)self currentUbiquityIdentityToken];

  if (v7)
  {
    CFStringRef v8 = +[NSUserDefaults standardUserDefaults];
    uint64_t v9 = [(BDSUbiquityStatusMonitor *)self currentUbiquityIdentityToken];
    char v10 = [v9 token];
    [v8 setObject:v10 forKey:@"nonNilUbiquityIdentityToken"];
  }
  id v11 = +[NSUserDefaults standardUserDefaults];
  [v11 synchronize];
}

- (void)p_ubiquityIdentityDidChange:(id)a3
{
  id v4 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F4F0;
  block[3] = &unk_10025F700;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_notifyObserversForChangesWithCurrentToken:(id)a3 lastToken:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [(BDSUbiquityStatusMonitor *)self observers];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          CFStringRef v13 = [(BDSUbiquityStatusMonitor *)self notifyQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000F94C;
          block[3] = &unk_10025F770;
          id v22 = v16;
          id v23 = v6;
          uint64_t v24 = v12;
          dispatch_async(v13, block);
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  __int16 v14 = [(BDSUbiquityStatusMonitor *)self coordinatingObserver];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFStringRef v15 = [(BDSUbiquityStatusMonitor *)self notifyQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000FA0C;
    v17[3] = &unk_10025F770;
    id v18 = v16;
    id v19 = v6;
    id v20 = v14;
    dispatch_async(v15, v17);
  }
}

- (void)dq_refreshUbiquityAvailabilityStatus
{
  unsigned int v3 = [(BDSUbiquityStatusMonitor *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[BDSICloudIdentityToken tokenForCurrentIdentityIfICloudDriveEnabled];
  currentUbiquityIdentityToken = self->_currentUbiquityIdentityToken;
  self->_currentUbiquityIdentityToken = v4;

  id v6 = [BDSICloudIdentityToken alloc];
  id v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v7 valueForKey:@"ubiquityIdentityToken"];
  id v9 = [(BDSICloudIdentityToken *)v6 initFromArchive:v8];
  lastArchivedUbiquityIdentityToken = self->_lastArchivedUbiquityIdentityToken;
  self->_lastArchivedUbiquityIdentityToken = v9;

  id v11 = sub_10000D100();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [(BDSUbiquityStatusMonitor *)self containerIdentifier];
    CFStringRef v13 = self->_currentUbiquityIdentityToken;
    __int16 v14 = self->_lastArchivedUbiquityIdentityToken;
    *(_DWORD *)buf = 138412802;
    id v23 = v12;
    __int16 v24 = 2112;
    long long v25 = v13;
    __int16 v26 = 2112;
    long long v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BDSUbiquityStatusMonitor: dq_refreshUbiquityAvailabilityStatus container:%@ current::%@ oldToken:%@", buf, 0x20u);
  }
  CFStringRef v15 = self->_currentUbiquityIdentityToken;
  id v16 = [(BDSUbiquityStatusMonitor *)self containerQueue];
  v17 = v16;
  if (v15)
  {
    id v18 = v21;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    id v19 = sub_10000FCD4;
  }
  else
  {
    id v18 = v20;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    id v19 = sub_1000102F8;
  }
  v18[2] = v19;
  v18[3] = &unk_10025F700;
  v18[4] = self;
  dispatch_async(v16, v18);
}

- (NSURL)containerURL
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000E9D4;
  id v11 = sub_10000E9E4;
  id v12 = 0;
  unsigned int v3 = [(BDSUbiquityStatusMonitor *)self containerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010498;
  v6[3] = &unk_10025F960;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

- (NSURL)documentsURL
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000E9D4;
  id v11 = sub_10000E9E4;
  id v12 = 0;
  unsigned int v3 = [(BDSUbiquityStatusMonitor *)self containerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000105C8;
  v6[3] = &unk_10025F960;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

- (id)description
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(BDSUbiquityStatusMonitor *)self isICloudDriveEnabled]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  id v6 = [(BDSUbiquityStatusMonitor *)self containerURL];
  uint64_t v7 = [(BDSUbiquityStatusMonitor *)self documentsURL];
  id v8 = +[NSString stringWithFormat:@"<%@(%p) iCloudDrive=%@ containerURL='%@' documentsURL='%@'", v4, self, v5, v6, v7];

  return v8;
}

- (void)setContainerURL:(id)a3
{
}

- (void)setDocumentsURL:(id)a3
{
}

- (BDSICloudIdentityToken)lastArchivedUbiquityIdentityToken
{
  return self->_lastArchivedUbiquityIdentityToken;
}

- (void)setLastArchivedUbiquityIdentityToken:(id)a3
{
}

- (BDSICloudIdentityToken)lastArchivedNonNilUbiquityIdentityToken
{
  return self->_lastArchivedNonNilUbiquityIdentityToken;
}

- (void)setLastArchivedNonNilUbiquityIdentityToken:(id)a3
{
}

- (BDSICloudIdentityToken)currentUbiquityIdentityToken
{
  return self->_currentUbiquityIdentityToken;
}

- (void)setCurrentUbiquityIdentityToken:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (BOOL)archivedCloudDriveOptedIn
{
  return self->_archivedCloudDriveOptedIn;
}

- (void)setArchivedCloudDriveOptedIn:(BOOL)a3
{
  self->_archivedCloudDriveOptedIn = a3;
}

- (BOOL)lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch
{
  return self->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch;
}

- (void)setLastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3
{
  self->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)containerQueue
{
  return self->_containerQueue;
}

- (void)setContainerQueue:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BDSUbiquityStatusChangeObserving)coordinatingObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinatingObserver);
  return (BDSUbiquityStatusChangeObserving *)WeakRetained;
}

- (void)setCoordinatingObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinatingObserver);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_containerQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_currentUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedNonNilUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_documentsURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
}

@end