@interface BCCloudKitController
+ (BCCloudKitController)sharedInstance;
+ (id)databaseFolderURLForConfiguration:(id)a3;
+ (id)instanceForCKNotification:(id)a3;
+ (id)p_createDatabaseArchiveDirectoryForConfiguration:(id)a3;
+ (id)p_privateDatabaseArchiveURLForConfiguration:(id)a3;
+ (id)secureSharedInstance;
+ (void)deleteCloudDataWithCompletion:(id)a3;
+ (void)registerForSecureNotifications;
- (BCCloudKitController)initWithConfiguration:(id)a3;
- (BCCloudKitDatabaseController)privateCloudDatabaseController;
- (BCCloudKitTransactionManager)transactionManager;
- (BCContainerConfiguration)configuration;
- (BOOL)didChangeContainer;
- (BOOL)enableCloudSync;
- (BOOL)gettingAccountInfo;
- (BOOL)serviceMode;
- (BUCoalescingCallBlock)coalescedAttachment;
- (BUCoalescingCallBlock)coalescedChangeAttachment;
- (CKContainer)container;
- (NSMutableArray)pendingGetAccountInfoCompletionBlocks;
- (NSMutableArray)pendingRequestUpdateAttachmentCompletionBlocks;
- (NSString)currentUserIDName;
- (OS_dispatch_queue)accessQueue;
- (int64_t)currentStatus;
- (void)_attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4;
- (void)_reestablishSyncEngineSalt;
- (void)_reestablishSyncEngineSaltIfNeeded;
- (void)_updateAccountCacheWithCompletionBlock:(id)a3;
- (void)applicationDidBecomeActive;
- (void)aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment:(BOOL)a3;
- (void)aq_requestUpdateAttachment;
- (void)aq_requestUpdateAttachmentWithCompletion:(id)a3;
- (void)aq_setGettingAccountInfo:(BOOL)a3 willRetryUpdateAttachment:(BOOL)a4;
- (void)attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4;
- (void)handleRemoteCKNotification:(id)a3;
- (void)handleRemoteNotification:(id)a3;
- (void)p_accountChanged:(id)a3;
- (void)p_accountReallyChangedWithCompletion:(id)a3;
- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocks;
- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:(BOOL)a3 reachable:(BOOL)a4;
- (void)p_getAccountInfo;
- (void)p_getAccountInfoWithCompletion:(id)a3;
- (void)p_getNecessaryAccountInfoFromContainer:(id)a3 completion:(id)a4;
- (void)p_identityChanged:(id)a3;
- (void)p_testAccountChanged:(id)a3;
- (void)p_updateAttachment;
- (void)requestUpdateAttachmentWithCompletion:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setCoalescedAttachment:(id)a3;
- (void)setCoalescedChangeAttachment:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentStatus:(int64_t)a3;
- (void)setCurrentUserIDName:(id)a3;
- (void)setDidChangeContainer:(BOOL)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setEnableCloudSync:(BOOL)a3 serviceMode:(BOOL)a4;
- (void)setGettingAccountInfo:(BOOL)a3;
- (void)setPrivateCloudDatabaseController:(id)a3;
- (void)setServiceMode:(BOOL)a3;
- (void)setTransactionManager:(id)a3;
@end

@implementation BCCloudKitController

+ (BCCloudKitController)sharedInstance
{
  if (qword_100297540 != -1) {
    dispatch_once(&qword_100297540, &stru_10025FD70);
  }
  v2 = (void *)qword_100297538;
  return (BCCloudKitController *)v2;
}

+ (id)secureSharedInstance
{
  if (qword_100297550 != -1) {
    dispatch_once(&qword_100297550, &stru_10025FD90);
  }
  v2 = (void *)qword_100297548;
  return v2;
}

+ (void)registerForSecureNotifications
{
  v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BCCloudKitController - registerForSecureNotifications", buf, 2u);
  }

  v4 = +[BCCloudKitSecureConfiguration configuration];
  v5 = [BCCloudKitDatabaseController alloc];
  v6 = objc_msgSend(a1, "p_privateDatabaseArchiveURLForConfiguration:", v4);
  v7 = [(BCCloudKitDatabaseController *)v5 initWithConfiguration:v4 archiveURL:v6];

  if (![(BCCloudKitDatabaseController *)v7 hasSubscription])
  {
    id v8 = [v4 queueIdentifier];
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001C648;
    v13[3] = &unk_10025FE48;
    id v14 = v4;
    dispatch_queue_t v15 = v11;
    id v17 = a1;
    v16 = v7;
    v12 = v11;
    dispatch_async(v12, v13);
  }
}

+ (id)instanceForCKNotification:(id)a3
{
  v3 = [a3 containerIdentifier];
  v4 = +[BCCloudKitController sharedInstance];
  v5 = +[BCCloudKitSecureConfiguration configuration];
  v6 = [v4 configuration];
  v7 = [v6 containerIdentifier];
  unsigned int v8 = [v3 isEqualToString:v7];

  if (v8)
  {
    id v9 = v4;
LABEL_5:
    v12 = v9;
    goto LABEL_7;
  }
  v10 = [v5 containerIdentifier];
  unsigned int v11 = [v3 isEqualToString:v10];

  if (v11)
  {
    id v9 = +[BCCloudKitController secureSharedInstance];
    goto LABEL_5;
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (BCCloudKitController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BCCloudKitController;
  v5 = [(BCCloudKitController *)&v42 init];
  v6 = v5;
  if (v5)
  {
    [(BCCloudKitController *)v5 setConfiguration:v4];
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingGetAccountInfoCompletionBlocks = v6->_pendingGetAccountInfoCompletionBlocks;
    v6->_pendingGetAccountInfoCompletionBlocks = v7;

    id v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingRequestUpdateAttachmentCompletionBlocks = v6->_pendingRequestUpdateAttachmentCompletionBlocks;
    v6->_pendingRequestUpdateAttachmentCompletionBlocks = v9;

    v6->_currentStatus = 0;
    id v11 = [v4 queueIdentifier];
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);

    objc_storeStrong((id *)&v6->_accessQueue, v14);
    dispatch_queue_t v15 = +[NSNotificationCenter defaultCenter];
    v16 = +[NSDistributedNotificationCenter defaultCenter];
    [v16 addObserver:v6 selector:"p_testAccountChanged:" name:@"com.apple.BDSService.BCCloudAccountChanged" object:0];

    [v15 addObserver:v6 selector:"p_accountChanged:" name:CKAccountChangedNotification object:0];
    [v15 addObserver:v6 selector:"p_identityChanged:" name:CKIdentityUpdateNotification object:0];
    id v17 = [BCCloudKitDatabaseController alloc];
    v18 = objc_msgSend((id)objc_opt_class(), "p_privateDatabaseArchiveURLForConfiguration:", v4);
    v19 = [(BCCloudKitDatabaseController *)v17 initWithConfiguration:v4 archiveURL:v18];
    privateCloudDatabaseController = v6->_privateCloudDatabaseController;
    v6->_privateCloudDatabaseController = v19;

    v21 = v6->_privateCloudDatabaseController;
    v22 = [v4 containerIdentifier];
    BOOL v23 = [(BCCloudKitController *)v6 serviceMode];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10001D1C4;
    v40[3] = &unk_10025FE70;
    v24 = v6;
    v41 = v24;
    [(BCCloudKitDatabaseController *)v21 willAttachToContainer:v22 serviceMode:v23 completion:v40];

    objc_initWeak(&location, v24);
    id v25 = objc_alloc((Class)BUCoalescingCallBlock);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001D1D0;
    v37[3] = &unk_10025FC90;
    objc_copyWeak(&v38, &location);
    id v26 = [v25 initWithNotifyBlock:v37 notifyTimeout:10 blockDescription:@"_coalescedAttachment in BCCloudKitController" notifyTimeoutBlock:&stru_10025FED8];
    id v27 = v24[7];
    v24[7] = v26;

    [v24[7] setCoalescingDelay:2.0];
    id v28 = objc_alloc((Class)BUCoalescingCallBlock);
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_10001D440;
    v35 = &unk_10025FC90;
    objc_copyWeak(&v36, &location);
    id v29 = [v28 initWithNotifyBlock:&v32 notifyTimeout:45 blockDescription:@"_coalescedChangeAttachment in BCCloudKitController" notifyTimeoutBlock:&stru_10025FF48];
    id v30 = v24[8];
    v24[8] = v29;

    objc_msgSend(v24[8], "setCoalescingDelay:", 5.0, v32, v33, v34, v35);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)setEnableCloudSync:(BOOL)a3 serviceMode:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [(BCCloudKitController *)self configuration];
    uint64_t v9 = [v8 containerIdentifier];
    v10 = (void *)v9;
    CFStringRef v11 = @"NO";
    if (v5) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v9;
    CFStringRef v20 = v12;
    __int16 v19 = 2114;
    if (v4) {
      CFStringRef v11 = @"YES";
    }
    __int16 v21 = 2114;
    CFStringRef v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) #enableCloudSync setEnableCloudSync %{public}@ serviceMode:%{public}@", buf, 0x20u);
  }
  v13 = [(BCCloudKitController *)self accessQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D978;
  v14[3] = &unk_10025FF70;
  v14[4] = self;
  BOOL v15 = v4;
  BOOL v16 = v5;
  dispatch_async(v13, v14);
}

- (void)requestUpdateAttachmentWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCCloudKitController *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DA98;
  v7[3] = &unk_10025FF28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)aq_requestUpdateAttachment
{
}

- (void)aq_requestUpdateAttachmentWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [(BCCloudKitController *)self pendingRequestUpdateAttachmentCompletionBlocks];
    id v6 = objc_retainBlock(v4);

    [v5 addObject:v6];
  }
  id v7 = [(BCCloudKitController *)self coalescedAttachment];
  [v7 signalWithCompletion:&stru_10025FF90];
}

- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocks
{
  v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(BCCloudKitController *)self configuration];
    BOOL v5 = [v4 containerIdentifier];
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_flushPendingRequestUpdateAttachmentCompletionBlocks", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v6 = [(BCCloudKitController *)self privateCloudDatabaseController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DCE0;
  v7[3] = &unk_10025FFE0;
  objc_copyWeak(&v8, (id *)buf);
  v7[4] = self;
  [v6 getAttached:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:(BOOL)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(BCCloudKitController *)self configuration];
    uint64_t v9 = [v8 containerIdentifier];
    *(_DWORD *)buf = 138543874;
    v31 = v9;
    __int16 v32 = 2048;
    unint64_t v33 = v5;
    __int16 v34 = 2048;
    BOOL v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:%lu reachable:%lu", buf, 0x20u);
  }
  v10 = [(BCCloudKitController *)self accessQueue];
  dispatch_assert_queue_V2(v10);

  CFStringRef v11 = [(BCCloudKitController *)self pendingRequestUpdateAttachmentCompletionBlocks];
  id v12 = [v11 copy];

  v13 = [(BCCloudKitController *)self pendingRequestUpdateAttachmentCompletionBlocks];
  [v13 removeAllObjects];

  if ([v12 count])
  {
    dispatch_queue_t v14 = sub_1000083A0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = [(BCCloudKitController *)self configuration];
      BOOL v16 = [v15 containerIdentifier];
      id v17 = [v12 count];
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      __int16 v32 = 2048;
      unint64_t v33 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - Calling %lu requestUpdateAttachment completion block(s)", buf, 0x16u);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v12;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        CFStringRef v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = objc_retainBlock(*(id *)(*((void *)&v25 + 1) + 8 * (void)v22));
          v24 = v23;
          if (v23) {
            (*((void (**)(id, BOOL, BOOL))v23 + 2))(v23, v5, v4);
          }

          CFStringRef v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v20);
    }
  }
}

- (void)p_updateAttachment
{
  objc_initWeak(&location, self);
  v3 = sub_10000CE18();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(BCCloudKitController *)self configuration];
    BOOL v5 = [v4 containerIdentifier];
    *(_DWORD *)buf = 138543362;
    CFStringRef v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - p_updateAttachment", buf, 0xCu);
  }
  id v6 = [(BCCloudKitController *)self privateCloudDatabaseController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E288;
  v7[3] = &unk_10025FFE0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v6 getAttached:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BCCloudKitController sharedInstance];
  id v6 = [v5 configuration];
  id v7 = [a1 databaseFolderURLForConfiguration:v6];

  id v8 = +[NSFileManager defaultManager];
  id v17 = 0;
  [v8 removeItemAtURL:v7 error:&v17];
  id v9 = v17;

  v10 = +[BCCloudKitController secureSharedInstance];
  CFStringRef v11 = [v10 configuration];
  id v12 = [a1 databaseFolderURLForConfiguration:v11];

  v13 = +[NSFileManager defaultManager];
  id v16 = v9;
  [v13 removeItemAtURL:v12 error:&v16];
  id v14 = v16;

  BOOL v15 = (void (**)(id, BOOL, id))objc_retainBlock(v4);
  if (v15) {
    v15[2](v15, v14 == 0, v14);
  }
}

+ (id)databaseFolderURLForConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = +[BDSAppGroupContainer documentsURL];
  BOOL v5 = [v3 dbArchiveFolderName];

  id v6 = [v4 URLByAppendingPathComponent:v5];
  id v7 = [v6 path];

  if (v7) {
    id v8 = [objc_alloc((Class)NSURL) initFileURLWithPath:v7 isDirectory:1];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)p_createDatabaseArchiveDirectoryForConfiguration:(id)a3
{
  id v3 = [a1 databaseFolderURLForConfiguration:a3];
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    unsigned int v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];

    id v6 = 0;
    if (v5) {
      id v6 = v3;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)p_privateDatabaseArchiveURLForConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_msgSend(a1, "p_createDatabaseArchiveDirectoryForConfiguration:", v4);
  if (v5)
  {
    id v6 = [v4 dbArchiveFilename];
    id v7 = [v4 dbArchiveExtension];
    id v8 = [v6 stringByAppendingPathExtension:v7];

    id v9 = [v5 URLByAppendingPathComponent:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)p_getNecessaryAccountInfoFromContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCloudKitController *)self configuration];
  unsigned __int8 v9 = [v8 requiresDeviceToDeviceEncryption];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001ED58;
  v12[3] = &unk_100260080;
  unsigned __int8 v15 = v9;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v11 accountStatusWithCompletionHandler:v12];
}

- (void)p_getAccountInfo
{
}

- (void)p_getAccountInfoWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BCCloudKitController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000083A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(BCCloudKitController *)self configuration];
    id v8 = [v7 containerIdentifier];
    *(_DWORD *)buf = 138543362;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_getAccountInfo", buf, 0xCu);
  }
  if (v4)
  {
    unsigned __int8 v9 = [(BCCloudKitController *)self pendingGetAccountInfoCompletionBlocks];
    id v10 = objc_retainBlock(v4);
    [v9 addObject:v10];
  }
  if (![(BCCloudKitController *)self gettingAccountInfo])
  {
    [(BCCloudKitController *)self setGettingAccountInfo:1];
    id v11 = sub_10000CE18();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(BCCloudKitController *)self configuration];
      id v13 = [v12 containerIdentifier];
      *(_DWORD *)buf = 138543362;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - getAccountInfo self.gettingAccountInfo=YES", buf, 0xCu);
    }
    id v14 = [(BCCloudKitController *)self configuration];
    unsigned __int8 v15 = [v14 containerIdentifier];
    id v16 = +[CKContainer containerWithIdentifier:v15];

    id v17 = [(BCCloudKitController *)self configuration];
    id v18 = [v17 appBundleIdentifier];
    [v16 setSourceApplicationBundleIdentifier:v18];

    [(BCCloudKitController *)self setContainer:v16];
    if (v16)
    {
      objc_initWeak((id *)buf, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001F1E8;
      v19[3] = &unk_100260120;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v16;
      [(BCCloudKitController *)self p_getNecessaryAccountInfoFromContainer:v20 completion:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(BCCloudKitController *)self setGettingAccountInfo:0];
    }
  }
}

- (void)setGettingAccountInfo:(BOOL)a3
{
  self->_gettingAccountInfo = a3;
  if (!a3)
  {
    id v4 = [(BCCloudKitController *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FBDC;
    block[3] = &unk_10025F700;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)aq_setGettingAccountInfo:(BOOL)a3 willRetryUpdateAttachment:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(BCCloudKitController *)self accessQueue];
  dispatch_assert_queue_V2(v7);

  self->_gettingAccountInfo = a3;
  if (!a3)
  {
    [(BCCloudKitController *)self aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment:v4];
  }
}

- (void)aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(BCCloudKitController *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BCCloudKitController *)self pendingGetAccountInfoCompletionBlocks];
  id v7 = [v6 copy];

  id v8 = [(BCCloudKitController *)self pendingGetAccountInfoCompletionBlocks];
  [v8 removeAllObjects];

  if ([v7 count])
  {
    unsigned __int8 v9 = sub_1000083A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(BCCloudKitController *)self configuration];
      id v11 = [v10 containerIdentifier];
      *(_DWORD *)buf = 138543874;
      long long v25 = v11;
      __int16 v26 = 2048;
      id v27 = [v7 count];
      __int16 v28 = 1024;
      BOOL v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - Calling %lu getAccountInfo completion block(s), willRetryUpdateAttachment: %d", buf, 0x1Cu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_retainBlock(*(id *)(*((void *)&v19 + 1) + 8 * (void)v16));
          id v18 = v17;
          if (v17) {
            (*((void (**)(id, BOOL))v17 + 2))(v17, v3);
          }

          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

- (void)applicationDidBecomeActive
{
  BOOL v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = [(BCCloudKitController *)self configuration];
    unsigned int v5 = [v4 containerIdentifier];
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - applicationDidBecomeActive", buf, 0xCu);
  }
  id v6 = [(BCCloudKitController *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FF98;
  block[3] = &unk_10025F700;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)handleRemoteNotification:(id)a3
{
  id v4 = +[CKNotification notificationFromRemoteNotificationDictionary:a3];
  [(BCCloudKitController *)self handleRemoteCKNotification:v4];
}

- (void)handleRemoteCKNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BCCloudKitController *)self container];
    id v7 = [v6 containerIdentifier];
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) handleRemoteNotification:", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [v4 subscriptionID];

  id v9 = [v8 copy];
  [(BCCloudKitController *)self _attachOrSignalFetchChangesTransaction:v9 reason:@"handleRemoteNotification"];
}

- (void)_attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(BCCloudKitController *)self privateCloudDatabaseController];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100020314;
  v14[3] = &unk_100260148;
  objc_copyWeak(&v17, &location);
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  [v8 getAttached:v14];

  id v11 = [(BCCloudKitController *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002051C;
  block[3] = &unk_1002600A8;
  objc_copyWeak(&v13, &location);
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(BCCloudKitController *)self privateCloudDatabaseController];
  id v8 = [v7 subscriptionID];
  unsigned int v9 = [v8 isEqualToString:v10];

  if (v9) {
    [(BCCloudKitController *)self _attachOrSignalFetchChangesTransaction:v10 reason:v6];
  }
}

- (void)_updateAccountCacheWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10000CE18();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001E4ED8(self, v5);
  }

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  objc_initWeak(&location, self);
  id v6 = [(BCCloudKitController *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002076C;
  block[3] = &unk_100260210;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v10 = v13;
  void block[4] = self;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(v13, 8);
}

- (void)p_testAccountChanged:(id)a3
{
  id v4 = +[BULogUtilities shared];
  unsigned int v5 = [v4 verboseLoggingEnabled];

  id v6 = sub_1000083A0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7) {
      sub_1001E531C(self);
    }
  }
  else if (v7)
  {
    sub_1001E53B8(self);
  }

  id v8 = +[BULogUtilities shared];
  unsigned int v9 = [v8 verboseLoggingEnabled];

  if (v9)
  {
    id v10 = sub_10000CD80();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "\"\\\"p_testAccountChanged CloudkitLogging Enabled!\\\"\"", v13, 2u);
    }
  }
  id v11 = sub_1000083A0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1001E5280(self);
  }

  id v12 = [(BCCloudKitController *)self coalescedChangeAttachment];
  [v12 signalWithCompletion:&stru_100260230];
}

- (void)p_accountChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10000CE18();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001E5454(self);
  }

  id v6 = [(BCCloudKitController *)self coalescedChangeAttachment];
  [v6 signalWithCompletion:&stru_100260250];
}

- (void)p_accountReallyChangedWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BCCloudKitController *)self configuration];
    BOOL v7 = [v6 containerIdentifier];
    id v8 = [(BCCloudKitController *)self currentUserIDName];
    *(_DWORD *)buf = 138543874;
    long long v19 = v7;
    __int16 v20 = 2112;
    long long v21 = v8;
    __int16 v22 = 2048;
    int64_t v23 = [(BCCloudKitController *)self currentStatus];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "p_accountChanged (%{public}@) account=%@ status=%ld", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
  CFStringRef v17 = @"Account changed";
  unsigned int v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v10 = +[NSError errorWithDomain:@"BDSCloudKitClientError" code:2001 userInfo:v9];

  id v11 = [(BCCloudKitController *)self privateCloudDatabaseController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000215B8;
  void v13[3] = &unk_10025FE98;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v4;
  id v14 = v12;
  [v11 detachWithError:v10 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)p_identityChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000083A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BCCloudKitController *)self configuration];
    BOOL v7 = [v6 containerIdentifier];
    *(_DWORD *)buf = 138543362;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "p_identityChanged (%{public}@)", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = +[NSError errorWithDomain:@"BDSCloudKitClientError" code:2005 userInfo:0];
  unsigned int v9 = [(BCCloudKitController *)self privateCloudDatabaseController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000218F0;
  v10[3] = &unk_10025F9F8;
  objc_copyWeak(&v11, (id *)buf);
  v10[4] = self;
  [v9 detachWithError:v8 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_reestablishSyncEngineSalt
{
  id v2 = +[BDSSyncEngine shared];
  [v2 reestablishSalt];
}

- (void)_reestablishSyncEngineSaltIfNeeded
{
  id v2 = +[BDSSyncEngine shared];
  [v2 reestablishSaltIfNeeded];
}

- (BCCloudKitTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (void)setTransactionManager:(id)a3
{
}

- (BCCloudKitDatabaseController)privateCloudDatabaseController
{
  return (BCCloudKitDatabaseController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrivateCloudDatabaseController:(id)a3
{
}

- (BOOL)didChangeContainer
{
  return self->_didChangeContainer;
}

- (void)setDidChangeContainer:(BOOL)a3
{
  self->_didChangeContainer = a3;
}

- (BCContainerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)gettingAccountInfo
{
  return self->_gettingAccountInfo;
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  self->_enableCloudSync = a3;
}

- (BOOL)serviceMode
{
  return self->_serviceMode;
}

- (void)setServiceMode:(BOOL)a3
{
  self->_serviceMode = a3;
}

- (BUCoalescingCallBlock)coalescedAttachment
{
  return self->_coalescedAttachment;
}

- (void)setCoalescedAttachment:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedChangeAttachment
{
  return self->_coalescedChangeAttachment;
}

- (void)setCoalescedChangeAttachment:(id)a3
{
}

- (NSMutableArray)pendingGetAccountInfoCompletionBlocks
{
  return self->_pendingGetAccountInfoCompletionBlocks;
}

- (NSMutableArray)pendingRequestUpdateAttachmentCompletionBlocks
{
  return self->_pendingRequestUpdateAttachmentCompletionBlocks;
}

- (NSString)currentUserIDName
{
  return self->_currentUserIDName;
}

- (void)setCurrentUserIDName:(id)a3
{
}

- (int64_t)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(int64_t)a3
{
  self->_currentStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserIDName, 0);
  objc_storeStrong((id *)&self->_pendingRequestUpdateAttachmentCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingGetAccountInfoCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_coalescedChangeAttachment, 0);
  objc_storeStrong((id *)&self->_coalescedAttachment, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabaseController, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
}

@end