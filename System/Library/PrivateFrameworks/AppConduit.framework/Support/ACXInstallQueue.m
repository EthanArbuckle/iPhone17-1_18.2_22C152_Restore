@interface ACXInstallQueue
- (ACXDevice)device;
- (ACXInstallQueue)initWithDevice:(id)a3;
- (ACXServerInstallOperation)currentInstallOperation;
- (ACXTimedIdentifierList)recentlyCompletedWatchAppInstalls;
- (BOOL)_onQueue_installIsPendingForWatchApp:(id)a3;
- (BOOL)_onQueue_installQueue:(id)a3 hasInstallOperationForBundleID:(id)a4;
- (BOOL)_onQueue_removeInstallOperationWithWatchBundleID:(id)a3 fromQueue:(id)a4;
- (BOOL)cancelCurrentOperation;
- (BOOL)cancelInstallForWatchAppBundleID:(id)a3;
- (BOOL)installIsPendingForWatchApp:(id)a3;
- (BOOL)isSuspended;
- (NSMutableArray)highPriorityUpdateQueue;
- (NSMutableArray)normalPriorityNewAppUpdateQueue;
- (NSMutableArray)normalPriorityUpdateQueue;
- (NSMutableArray)placeholderInstallQueue;
- (NSMutableDictionary)completions;
- (NSString)currentInstallOperationWatchBundleID;
- (OS_dispatch_queue)internalQueue;
- (OS_os_transaction)activeTransaction;
- (id)_installationSentinelFileURL;
- (id)_queueForPriority:(unint64_t)a3;
- (unint64_t)_onQueue_countPending;
- (unint64_t)_onQueue_indexOfInstallOperationWithWatchBundleID:(id)a3 inQueue:(id)a4;
- (unint64_t)_onQueue_queuePriorityForBundleID:(id)a3;
- (void)_createInstallationSentinel;
- (void)_onQueue_cancelAllPendingInstalls;
- (void)_onQueue_deQueueNextOperation;
- (void)_onQueue_removeBundleID:(id)a3 fromQueueWithPriority:(unint64_t)a4;
- (void)_onQueue_startQueue;
- (void)_onQueue_stopQueue;
- (void)_removeInstallationSentinel;
- (void)acknowledgeInstallationForWatchApp:(id)a3;
- (void)cancelAllPendingInstalls;
- (void)dealloc;
- (void)installWatchApp:(id)a3 withPriority:(unint64_t)a4 appSettings:(id)a5 provisioningProfileInfo:(id)a6 isUserInitiated:(BOOL)a7 completion:(id)a8;
- (void)installWatchAppAtURL:(id)a3 watchBundleID:(id)a4 companionAppBundleID:(id)a5 withPriority:(unint64_t)a6 appSettings:(id)a7 isPlaceholder:(BOOL)a8 isUserInitiated:(BOOL)a9 size:(int64_t)a10 requiredCapabilities:(id)a11 completion:(id)a12;
- (void)reachabilityChangedForDevice:(id)a3;
- (void)setActiveTransaction:(id)a3;
- (void)setCancelCurrentOperation:(BOOL)a3;
- (void)setCurrentInstallOperation:(id)a3;
- (void)setCurrentInstallOperationWatchBundleID:(id)a3;
- (void)setIsSuspended:(BOOL)a3;
@end

@implementation ACXInstallQueue

- (ACXInstallQueue)initWithDevice:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ACXInstallQueue;
  v6 = [(ACXInstallQueue *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = [(ACXInstallQueue *)v7 device];
    [v8 addObserver:v7];

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appconduit.InstallQueue", v9);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    placeholderInstallQueue = v7->_placeholderInstallQueue;
    v7->_placeholderInstallQueue = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    highPriorityUpdateQueue = v7->_highPriorityUpdateQueue;
    v7->_highPriorityUpdateQueue = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    normalPriorityUpdateQueue = v7->_normalPriorityUpdateQueue;
    v7->_normalPriorityUpdateQueue = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    normalPriorityNewAppUpdateQueue = v7->_normalPriorityNewAppUpdateQueue;
    v7->_normalPriorityNewAppUpdateQueue = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    completions = v7->_completions;
    v7->_completions = (NSMutableDictionary *)v20;

    v22 = [[ACXTimedIdentifierList alloc] initWithTimeout:60.0];
    recentlyCompletedWatchAppInstalls = v7->_recentlyCompletedWatchAppInstalls;
    v7->_recentlyCompletedWatchAppInstalls = v22;

    v24 = [(ACXInstallQueue *)v7 recentlyCompletedWatchAppInstalls];
    [v24 setTimeoutHandler:&stru_10008DA48];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(ACXInstallQueue *)self device];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ACXInstallQueue;
  [(ACXInstallQueue *)&v4 dealloc];
}

- (void)installWatchApp:(id)a3 withPriority:(unint64_t)a4 appSettings:(id)a5 provisioningProfileInfo:(id)a6 isUserInitiated:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = [(ACXInstallQueue *)self internalQueue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100036A18;
  v23[3] = &unk_10008DA70;
  id v24 = v14;
  v25 = self;
  id v28 = v17;
  unint64_t v29 = a4;
  id v26 = v15;
  id v27 = v16;
  BOOL v30 = a7;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  id v22 = v14;
  sub_100006BB8(v18, v23);
}

- (void)installWatchAppAtURL:(id)a3 watchBundleID:(id)a4 companionAppBundleID:(id)a5 withPriority:(unint64_t)a6 appSettings:(id)a7 isPlaceholder:(BOOL)a8 isUserInitiated:(BOOL)a9 size:(int64_t)a10 requiredCapabilities:(id)a11 completion:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a11;
  id v21 = a12;
  id v22 = [(ACXInstallQueue *)self internalQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100036E94;
  v31[3] = &unk_10008DA98;
  id v32 = v17;
  id v33 = v18;
  v34 = self;
  id v35 = v16;
  id v38 = v21;
  unint64_t v39 = a6;
  BOOL v41 = a9;
  id v36 = v19;
  id v37 = v20;
  BOOL v42 = a8;
  int64_t v40 = a10;
  id v23 = v20;
  id v24 = v19;
  id v25 = v16;
  id v26 = v21;
  id v27 = v18;
  id v28 = v17;
  sub_100006BB8(v22, v31);
}

- (void)reachabilityChangedForDevice:(id)a3
{
  objc_super v4 = [(ACXInstallQueue *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037200;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (BOOL)cancelInstallForWatchAppBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(ACXInstallQueue *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000374A4;
  block[3] = &unk_10008CA68;
  block[4] = self;
  id v9 = v4;
  dispatch_queue_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_onQueue_cancelAllPendingInstalls
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    unint64_t v10 = [(ACXInstallQueue *)self _onQueue_countPending];
    MOLogWrite();
  }
  v3 = [(ACXInstallQueue *)self currentInstallOperation];

  if (v3)
  {
    id v4 = [(ACXInstallQueue *)self currentInstallOperation];
    [v4 cancel];

    [(ACXInstallQueue *)self setCancelCurrentOperation:1];
  }
  id v5 = [(ACXInstallQueue *)self placeholderInstallQueue];
  [v5 removeAllObjects];

  id v6 = [(ACXInstallQueue *)self highPriorityUpdateQueue];
  [v6 removeAllObjects];

  v7 = [(ACXInstallQueue *)self normalPriorityUpdateQueue];
  [v7 removeAllObjects];

  v8 = [(ACXInstallQueue *)self normalPriorityNewAppUpdateQueue];
  [v8 removeAllObjects];

  id v9 = [(ACXInstallQueue *)self completions];
  [v9 enumerateKeysAndObjectsUsingBlock:&stru_10008DAD8];

  id v11 = [(ACXInstallQueue *)self completions];
  [v11 removeAllObjects];
}

- (void)cancelAllPendingInstalls
{
  v3 = [(ACXInstallQueue *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037B04;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (unint64_t)_onQueue_countPending
{
  v3 = [(ACXInstallQueue *)self placeholderInstallQueue];
  id v4 = (char *)[v3 count];
  id v5 = [(ACXInstallQueue *)self highPriorityUpdateQueue];
  id v6 = &v4[(void)[v5 count]];
  v7 = [(ACXInstallQueue *)self normalPriorityUpdateQueue];
  id v8 = [v7 count];
  id v9 = [(ACXInstallQueue *)self normalPriorityNewAppUpdateQueue];
  unint64_t v10 = &v6[(unint64_t)[v9 count] + (void)v8];

  return (unint64_t)v10;
}

- (void)_onQueue_startQueue
{
  if ([(ACXInstallQueue *)self isSuspended]) {
    sub_10005BC64();
  }
  [(ACXInstallQueue *)self activeTransaction];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_10005BC90();
  }
  v3 = (void *)os_transaction_create();
  [(ACXInstallQueue *)self setActiveTransaction:v3];

  [(ACXInstallQueue *)self _createInstallationSentinel];

  [(ACXInstallQueue *)self _onQueue_deQueueNextOperation];
}

- (void)_onQueue_stopQueue
{
  v3 = [(ACXInstallQueue *)self activeTransaction];
  if (!v3) {
    sub_10005BCBC();
  }

  [(ACXInstallQueue *)self setActiveTransaction:0];
  [(ACXInstallQueue *)self _removeInstallationSentinel];
  id v4 = [(ACXInstallQueue *)self currentInstallOperation];
  if (!v4) {
    sub_10005BCE8();
  }

  [(ACXInstallQueue *)self setCurrentInstallOperation:0];
  [(ACXInstallQueue *)self setCurrentInstallOperationWatchBundleID:0];

  [(ACXInstallQueue *)self setCancelCurrentOperation:0];
}

- (void)_onQueue_deQueueNextOperation
{
  v3 = [(ACXInstallQueue *)self placeholderInstallQueue];
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(ACXInstallQueue *)self placeholderInstallQueue];
  }
  else
  {
    id v6 = [(ACXInstallQueue *)self highPriorityUpdateQueue];
    id v7 = [v6 count];

    if (v7)
    {
      uint64_t v5 = [(ACXInstallQueue *)self highPriorityUpdateQueue];
    }
    else
    {
      id v8 = [(ACXInstallQueue *)self normalPriorityUpdateQueue];
      id v9 = [v8 count];

      if (v9)
      {
        uint64_t v5 = [(ACXInstallQueue *)self normalPriorityUpdateQueue];
      }
      else
      {
        unint64_t v10 = [(ACXInstallQueue *)self normalPriorityNewAppUpdateQueue];
        id v11 = [v10 count];

        if (!v11)
        {
          uint64_t v12 = 0;
          goto LABEL_10;
        }
        uint64_t v5 = [(ACXInstallQueue *)self normalPriorityNewAppUpdateQueue];
      }
    }
  }
  uint64_t v12 = (void *)v5;
LABEL_10:
  uint64_t v13 = [(ACXInstallQueue *)self device];
  char v14 = [v13 nrDevice];
  BOOL v15 = sub_100051AF8(v14);

  if (v15 && v12)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [(ACXInstallQueue *)self _onQueue_cancelAllPendingInstalls];
    goto LABEL_42;
  }
  if ([(ACXInstallQueue *)self isSuspended] && v12)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [(ACXInstallQueue *)self _onQueue_stopQueue];
    goto LABEL_42;
  }
  if (v12)
  {
    id v16 = [v12 objectAtIndex:0];
    [v12 removeObjectAtIndex:0];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      v50 = [v16 bundleID];
      unint64_t v51 = [(ACXInstallQueue *)self _onQueue_countPending];
      MOLogWrite();
    }
    -[ACXInstallQueue setCancelCurrentOperation:](self, "setCancelCurrentOperation:", 0, v50, v51);
    id v17 = [v16 bundleID];
    [(ACXInstallQueue *)self setCurrentInstallOperationWatchBundleID:v17];

    id v18 = [v16 installType];
    if (v18 == (id)2)
    {
      id v19 = [v16 appURL];
      id v20 = [v16 bundleID];
      id v21 = [v16 companionBundleID];
      id v24 = [v16 appSize];
      id v22 = [(ACXInstallQueue *)self device];
      id v25 = [v22 usesLegacySocketService];
      id v26 = v19;
      id v27 = v20;
      id v28 = v21;
      uint64_t v29 = 0;
    }
    else
    {
      if (v18 != (id)1)
      {
        if (v18)
        {
LABEL_39:
          v31 = [v16 provisioningProfileInfo];
          id v32 = [(ACXInstallQueue *)self currentInstallOperation];
          [v32 setProvisioningProfiles:v31];

          id v33 = [v16 appPreferences];
          v34 = [(ACXInstallQueue *)self currentInstallOperation];
          [v34 setAppSettingsDict:v33];

          id v35 = [v16 isUserInitiated];
          id v36 = [(ACXInstallQueue *)self currentInstallOperation];
          [v36 setIsUserInitiated:v35];

          id v37 = [v16 requiredCapabilities];
          id v38 = [(ACXInstallQueue *)self currentInstallOperation];
          [v38 setRequiredDeviceCapabilities:v37];

          unint64_t v39 = [(ACXInstallQueue *)self currentInstallOperation];
          [v39 setInstallPlaceholder:v4 != 0];

          if (!v4)
          {
            objc_initWeak(&location, self);
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_1000383C8;
            v56[3] = &unk_10008DB00;
            id v57 = v16;
            objc_copyWeak(&v58, &location);
            int64_t v40 = [(ACXInstallQueue *)self currentInstallOperation];
            [v40 setProgressBlock:v56];

            objc_destroyWeak(&v58);
            objc_destroyWeak(&location);
          }
          BOOL v41 = v4 != 0;
          BOOL v42 = [(ACXInstallQueue *)self completions];
          v43 = [v16 bundleID];
          v44 = [v42 objectForKeyedSubscript:v43];

          v45 = [(ACXInstallQueue *)self completions];
          v46 = [v16 bundleID];
          [v45 removeObjectForKey:v46];

          v47 = [(ACXInstallQueue *)self currentInstallOperation];
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_100038574;
          v52[3] = &unk_10008DB50;
          BOOL v55 = v41;
          v52[4] = self;
          id v53 = v16;
          id v54 = v44;
          id v48 = v44;
          id v49 = v16;
          [v47 beginWithCompletionBlock:v52];

          goto LABEL_42;
        }
        id v19 = [v16 companionBundleID];
        id v20 = [v16 bundleID];
        id v21 = [(ACXInstallQueue *)self device];
        id v22 = +[ACXServerInstallOperation installOperationForCompanionAppBundleIdentifier:watchAppBundleIdentifier:targetUsesLegacySocketService:](ACXServerInstallOperation, "installOperationForCompanionAppBundleIdentifier:watchAppBundleIdentifier:targetUsesLegacySocketService:", v19, v20, [v21 usesLegacySocketService]);
        [(ACXInstallQueue *)self setCurrentInstallOperation:v22];
LABEL_38:

        goto LABEL_39;
      }
      id v19 = [v16 appURL];
      id v20 = [v16 bundleID];
      id v21 = [v16 companionBundleID];
      id v24 = [v16 appSize];
      id v22 = [(ACXInstallQueue *)self device];
      id v25 = [v22 usesLegacySocketService];
      id v26 = v19;
      id v27 = v20;
      id v28 = v21;
      uint64_t v29 = 1;
    }
    BOOL v30 = +[ACXServerInstallOperation installOperationForURL:v26 watchAppBundleIdentifier:v27 companionAppBundleID:v28 isPlaceholder:v29 size:v24 targetUsesLegacySocketService:v25];
    [(ACXInstallQueue *)self setCurrentInstallOperation:v30];

    goto LABEL_38;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  [(ACXInstallQueue *)self _onQueue_stopQueue];
  id v23 = [(ACXInstallQueue *)self completions];
  if ([v23 count]) {
    sub_10005BD14();
  }

LABEL_42:
}

- (unint64_t)_onQueue_indexOfInstallOperationWithWatchBundleID:(id)a3 inQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [v6 objectAtIndexedSubscript:v7];
      id v9 = [v8 bundleID];
      unsigned __int8 v10 = [v9 isEqualToString:v5];

      if (v10) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)_onQueue_installQueue:(id)a3 hasInstallOperationForBundleID:(id)a4
{
  return [(ACXInstallQueue *)self _onQueue_indexOfInstallOperationWithWatchBundleID:a4 inQueue:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_onQueue_removeInstallOperationWithWatchBundleID:(id)a3 fromQueue:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ACXInstallQueue *)self _onQueue_indexOfInstallOperationWithWatchBundleID:a3 inQueue:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 removeObjectAtIndex:v7];
  }

  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_onQueue_queuePriorityForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXInstallQueue *)self highPriorityUpdateQueue];
  unsigned __int8 v6 = [(ACXInstallQueue *)self _onQueue_installQueue:v5 hasInstallOperationForBundleID:v4];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else
  {
    id v8 = [(ACXInstallQueue *)self normalPriorityUpdateQueue];
    unsigned __int8 v9 = [(ACXInstallQueue *)self _onQueue_installQueue:v8 hasInstallOperationForBundleID:v4];

    if (v9)
    {
      unint64_t v7 = 2;
    }
    else
    {
      unsigned __int8 v10 = [(ACXInstallQueue *)self normalPriorityNewAppUpdateQueue];
      unsigned int v11 = [(ACXInstallQueue *)self _onQueue_installQueue:v10 hasInstallOperationForBundleID:v4];

      if (v11) {
        unint64_t v7 = 3;
      }
      else {
        unint64_t v7 = 0;
      }
    }
  }

  return v7;
}

- (id)_queueForPriority:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      v3 = [(ACXInstallQueue *)self normalPriorityNewAppUpdateQueue];
      break;
    case 2uLL:
      v3 = [(ACXInstallQueue *)self normalPriorityUpdateQueue];
      break;
    case 1uLL:
      v3 = [(ACXInstallQueue *)self highPriorityUpdateQueue];
      break;
    default:
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      v3 = 0;
      break;
  }

  return v3;
}

- (void)_onQueue_removeBundleID:(id)a3 fromQueueWithPriority:(unint64_t)a4
{
  id v7 = a3;
  unsigned __int8 v6 = [(ACXInstallQueue *)self _queueForPriority:a4];
  if (v6) {
    [(ACXInstallQueue *)self _onQueue_removeInstallOperationWithWatchBundleID:v7 fromQueue:v6];
  }
}

- (void)_createInstallationSentinel
{
  v2 = [(ACXInstallQueue *)self _installationSentinelFileURL];
  id v4 = 0;
  [&stru_10008F348 writeToURL:v2 atomically:1 encoding:4 error:&v4];
  id v3 = v4;
  if (v3)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
LABEL_7:
    }
      MOLogWrite();
  }
  else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    goto LABEL_7;
  }
}

- (void)_removeInstallationSentinel
{
  id v4 = +[NSFileManager defaultManager];
  id v3 = [(ACXInstallQueue *)self _installationSentinelFileURL];
  [v4 removeItemAtURL:v3 error:0];
}

- (id)_installationSentinelFileURL
{
  v2 = sub_100007CEC();
  id v3 = [v2 URLByAppendingPathComponent:@"install_in_progress" isDirectory:0];

  return v3;
}

- (BOOL)_onQueue_installIsPendingForWatchApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXInstallQueue *)self currentInstallOperationWatchBundleID];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) != 0
    || ([(ACXInstallQueue *)self completions],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v4],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    unsigned __int8 v10 = [(ACXInstallQueue *)self recentlyCompletedWatchAppInstalls];
    unsigned __int8 v9 = [v10 containsIdentifier:v4];
  }
  return v9;
}

- (BOOL)installIsPendingForWatchApp:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(ACXInstallQueue *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038FC0;
  block[3] = &unk_10008CA18;
  id v9 = v4;
  unsigned __int8 v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)acknowledgeInstallationForWatchApp:(id)a3
{
  id v6 = a3;
  id v4 = [(ACXInstallQueue *)self recentlyCompletedWatchAppInstalls];
  unsigned int v5 = [v4 removeIdentifier:v6];

  if (v5 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)) {
    MOLogWrite();
  }
}

- (ACXDevice)device
{
  return self->_device;
}

- (NSMutableArray)placeholderInstallQueue
{
  return self->_placeholderInstallQueue;
}

- (NSMutableArray)highPriorityUpdateQueue
{
  return self->_highPriorityUpdateQueue;
}

- (NSMutableArray)normalPriorityUpdateQueue
{
  return self->_normalPriorityUpdateQueue;
}

- (NSMutableArray)normalPriorityNewAppUpdateQueue
{
  return self->_normalPriorityNewAppUpdateQueue;
}

- (ACXServerInstallOperation)currentInstallOperation
{
  return self->_currentInstallOperation;
}

- (void)setCurrentInstallOperation:(id)a3
{
}

- (NSString)currentInstallOperationWatchBundleID
{
  return self->_currentInstallOperationWatchBundleID;
}

- (void)setCurrentInstallOperationWatchBundleID:(id)a3
{
}

- (NSMutableDictionary)completions
{
  return self->_completions;
}

- (OS_os_transaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
}

- (BOOL)cancelCurrentOperation
{
  return self->_cancelCurrentOperation;
}

- (void)setCancelCurrentOperation:(BOOL)a3
{
  self->_cancelCurrentOperation = a3;
}

- (ACXTimedIdentifierList)recentlyCompletedWatchAppInstalls
{
  return self->_recentlyCompletedWatchAppInstalls;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_recentlyCompletedWatchAppInstalls, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_currentInstallOperationWatchBundleID, 0);
  objc_storeStrong((id *)&self->_currentInstallOperation, 0);
  objc_storeStrong((id *)&self->_normalPriorityNewAppUpdateQueue, 0);
  objc_storeStrong((id *)&self->_normalPriorityUpdateQueue, 0);
  objc_storeStrong((id *)&self->_highPriorityUpdateQueue, 0);
  objc_storeStrong((id *)&self->_placeholderInstallQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end