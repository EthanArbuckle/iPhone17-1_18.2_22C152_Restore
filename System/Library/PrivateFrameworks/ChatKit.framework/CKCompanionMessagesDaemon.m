@interface CKCompanionMessagesDaemon
+ (id)sharedDaemon;
- (BOOL)syncDeviceSalt;
- (CKCompanionMessagesDaemon)init;
- (void)registerForActivities;
- (void)registerForDeviceSaltSyncActivity;
- (void)registerForResponseKitSyncActivity;
- (void)requestDynamicDictionariesRemoval;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncResponseKitData:(id)a3;
- (void)systemDidLeaveDataProtectionLock;
- (void)triggerWRCannedRepliesStoreDowngradeIfNeeded;
@end

@implementation CKCompanionMessagesDaemon

+ (id)sharedDaemon
{
  if (qword_100011BC8 != -1) {
    dispatch_once(&qword_100011BC8, &stru_10000C3C0);
  }
  v2 = (void *)qword_100011BC0;

  return v2;
}

- (CKCompanionMessagesDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKCompanionMessagesDaemon;
  v2 = [(CKCompanionMessagesDaemon *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(CKCompanionIDSService);
    service = v2->_service;
    v2->_service = v3;

    uint64_t v5 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.quickboard"];
    syncCoordinator = v2->_syncCoordinator;
    v2->_syncCoordinator = (PSYSyncCoordinator *)v5;

    [(PSYSyncCoordinator *)v2->_syncCoordinator setDelegate:v2];
    v7 = +[IMUnlockMonitor sharedInstance];
    [v7 addListener:v2];
  }
  return v2;
}

- (void)registerForActivities
{
  [(CKCompanionMessagesDaemon *)self registerForDeviceSaltSyncActivity];

  [(CKCompanionMessagesDaemon *)self registerForResponseKitSyncActivity];
}

- (void)registerForDeviceSaltSyncActivity
{
}

- (BOOL)syncDeviceSalt
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10000626C;
  v21 = sub_10000627C;
  id v22 = 0;
  v3 = +[IMTextInputCryptographer sharedCryptographer];
  v4 = [v3 dispatchQueue];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100006284;
  v14 = &unk_10000C408;
  v16 = &v17;
  id v5 = v3;
  id v15 = v5;
  dispatch_sync(v4, &v11);

  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_msgSend((id)v18[5], "length", v11, v12, v13, v14);
      CFStringRef v8 = @"NO";
      if (!v7) {
        CFStringRef v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "deviceSalt empty: %@", buf, 0xCu);
    }
  }
  if (v18[5])
  {
    -[CKCompanionIDSService sendDeviceSalt:](self->_service, "sendDeviceSalt:");
    BOOL v9 = v18[5] != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (void)registerForResponseKitSyncActivity
{
}

- (void)syncResponseKitData:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = +[NSFileManager defaultManager];
  v6 = sub_1000076E0();
  id v7 = [v6 path];
  unsigned int v8 = [v5 fileExistsAtPath:v7];

  if (v8)
  {
    BOOL v9 = sub_100007780(1);
    if (v9)
    {
      v10 = v9;
      v11 = [v9 URLByAppendingPathComponent:@"ResponseKit.zip"];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100006870;
      v19[3] = &unk_10000C478;
      v19[4] = self;
      id v20 = v11;
      v21 = v4;
      id v12 = v11;
      v13 = objc_retainBlock(v19);
      id v14 = objc_alloc((Class)IMFileCopier);
      id v15 = [v12 path];
      id v16 = [v14 initWithInputURL:v6 outputURL:v12 identifier:v15 operation:0 completionBlock:v13 queue:&_dispatch_main_q];

      [v16 start];
      goto LABEL_14;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "failed to create temporary path for zip", buf, 2u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No ResponseKit data yet; nothing to sync",
        buf,
        2u);
    }
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_14:
}

- (void)requestDynamicDictionariesRemoval
{
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v9 = [v8 isUnderDataProtectionLock];

  if (v9)
  {
    BOOL waitingForUnlockToSyncDeviceSalt = self->_waitingForUnlockToSyncDeviceSalt;
    int v11 = IMOSLoggingEnabled();
    if (!waitingForUnlockToSyncDeviceSalt)
    {
      if (v11)
      {
        id v14 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Waiting for unlock", buf, 2u);
        }
      }
      self->_BOOL waitingForUnlockToSyncDeviceSalt = 1;
      id v15 = (OS_os_transaction *)os_transaction_create();
      waitingForUnlockToSyncDeviceSaltTransaction = self->_waitingForUnlockToSyncDeviceSaltTransaction;
      self->_waitingForUnlockToSyncDeviceSaltTransaction = v15;

      id v12 = +[IMSystemMonitor sharedInstance];
      [v12 setActive:1];
      goto LABEL_16;
    }
    if (v11)
    {
      id v12 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Already awaiting unlock", buf, 2u);
      }
LABEL_16:
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Unlocked, syncing device salt", buf, 2u);
      }
    }
    [(CKCompanionMessagesDaemon *)self syncDeviceSalt];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006BA8;
  v17[3] = &unk_10000C450;
  v17[4] = self;
  [(CKCompanionMessagesDaemon *)self syncResponseKitData:v17];
  [(CKCompanionMessagesDaemon *)self triggerWRCannedRepliesStoreDowngradeIfNeeded];
}

- (void)systemDidLeaveDataProtectionLock
{
  if (self->_waitingForUnlockToSyncDeviceSalt)
  {
    unsigned int v3 = [(CKCompanionMessagesDaemon *)self syncDeviceSalt];
    int v4 = IMOSLoggingEnabled();
    if (v3)
    {
      if (v4)
      {
        id v5 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          __int16 v11 = 0;
          id v6 = "Unlocked. Finished syncing device salt for PairedSync";
          id v7 = (uint8_t *)&v11;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v4)
    {
      id v5 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        id v6 = "Unlocked. Failed to read device salt, or one hasn't been created yet";
        id v7 = (uint8_t *)&v10;
        goto LABEL_9;
      }
LABEL_10:
    }
    self->_BOOL waitingForUnlockToSyncDeviceSalt = 0;
    waitingForUnlockToSyncDeviceSaltTransaction = self->_waitingForUnlockToSyncDeviceSaltTransaction;
    self->_waitingForUnlockToSyncDeviceSaltTransaction = 0;

    unsigned __int8 v9 = +[IMSystemMonitor sharedInstance];
    [v9 setActive:0];
  }
}

- (void)triggerWRCannedRepliesStoreDowngradeIfNeeded
{
  id v2 = [objc_alloc((Class)WRCannedRepliesStore) initWithCategory:1];
  id v3 = [v2 repliesForLanguage:0];

  id v5 = [objc_alloc((Class)WRCannedRepliesStore) initWithCategory:2];
  id v4 = [v5 repliesForLanguage:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForUnlockToSyncDeviceSaltTransaction, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end