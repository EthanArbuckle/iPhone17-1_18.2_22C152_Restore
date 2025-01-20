@interface ACXLocalAppStoreInstallQueue
- (ACXDevice)device;
- (ACXLocalAppStoreInstallQueue)initWithDevice:(id)a3;
- (ACXLocalAppStoreInstallQueueElement)currentInstall;
- (BOOL)_cancelCoordinatorForInstallWithWatchBundleID:(id)a3;
- (BOOL)_cancelCoordinatorForInstallWithWatchBundleID:(id)a3 withReason:(id)a4;
- (BOOL)_onQueue_installIsPendingForWatchApp:(id)a3;
- (BOOL)_onQueue_installQueue:(id)a3 hasInstallOperationForBundleID:(id)a4;
- (BOOL)_onQueue_removeInstallOperationWithWatchBundleID:(id)a3 fromQueue:(id)a4;
- (BOOL)_onQueue_reportExternalInstallFailureForWatchAppBundleID:(id)a3 failureReason:(id)a4;
- (BOOL)cancelCurrentOperation;
- (BOOL)cancelInstallForWatchAppBundleID:(id)a3;
- (BOOL)installIsPendingForWatchApp:(id)a3;
- (BOOL)isSuspended;
- (BOOL)reportExternalInstallFailureForWatchAppBundleID:(id)a3 failureReason:(id)a4;
- (IXGizmoInstallingAppInstallCoordinator)currentInstallCoordinator;
- (NSMutableArray)installQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_os_transaction)activeTransaction;
- (id)_installationSentinelFileURL;
- (id)_onQueue_queueElementForApp:(id)a3 isCurrentInstall:(BOOL *)a4;
- (id)currentCompletionBlock;
- (unint64_t)_onQueue_countPending;
- (unint64_t)_onQueue_indexOfInstallOperationWithWatchBundleID:(id)a3 inQueue:(id)a4;
- (void)_createInstallationSentinel;
- (void)_onQueue_clearCurrentInstallCoordinator;
- (void)_onQueue_deQueueNextOperation;
- (void)_onQueue_startQueue;
- (void)_onQueue_stopQueue;
- (void)_removeInstallationSentinel;
- (void)acknowledgeInstallationStartedForWatchApp:(id)a3;
- (void)cancelAllPendingInstalls;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)dealloc;
- (void)installWatchApp:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)reachabilityChangedForDevice:(id)a3;
- (void)setActiveTransaction:(id)a3;
- (void)setCancelCurrentOperation:(BOOL)a3;
- (void)setCurrentCompletionBlock:(id)a3;
- (void)setCurrentInstall:(id)a3;
- (void)setCurrentInstallCoordinator:(id)a3;
- (void)setIsSuspended:(BOOL)a3;
@end

@implementation ACXLocalAppStoreInstallQueue

- (ACXLocalAppStoreInstallQueue)initWithDevice:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACXLocalAppStoreInstallQueue;
  v6 = [(ACXLocalAppStoreInstallQueue *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = [(ACXLocalAppStoreInstallQueue *)v7 device];
    [v8 addObserver:v7];

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appconduit.LocalAppStoreInstallQueue", v9);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    installQueue = v7->_installQueue;
    v7->_installQueue = (NSMutableArray *)v12;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(ACXLocalAppStoreInstallQueue *)self device];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ACXLocalAppStoreInstallQueue;
  [(ACXLocalAppStoreInstallQueue *)&v4 dealloc];
}

- (void)installWatchApp:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t v10 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001CC98;
  v13[3] = &unk_10008D500;
  id v14 = v8;
  objc_super v15 = self;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  sub_100006BB8(v10, v13);
}

- (void)reachabilityChangedForDevice:(id)a3
{
  objc_super v4 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D0BC;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (BOOL)_cancelCoordinatorForInstallWithWatchBundleID:(id)a3
{
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  CFStringRef v9 = @"Canceled by user";
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v6 = +[NSError errorWithDomain:@"ACXErrorDomain" code:6 userInfo:v5];

  LOBYTE(self) = [(ACXLocalAppStoreInstallQueue *)self _cancelCoordinatorForInstallWithWatchBundleID:v4 withReason:v6];
  return (char)self;
}

- (BOOL)_cancelCoordinatorForInstallWithWatchBundleID:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v9 = 0;
  unsigned __int8 v6 = +[IXAppInstallCoordinator cancelCoordinatorForAppWithBundleID:v5 withReason:a4 client:4 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)) {
    MOLogWrite();
  }

  return v6;
}

- (BOOL)cancelInstallForWatchAppBundleID:(id)a3
{
  id v4 = a3;
  NSErrorUserInfoKey v8 = sub_100007574((uint64_t)"-[ACXLocalAppStoreInstallQueue cancelInstallForWatchAppBundleID:]", 160, @"ACXErrorDomain", 6, @"Cancelled", v5, v6, v7, v10);
  LOBYTE(self) = [(ACXLocalAppStoreInstallQueue *)self reportExternalInstallFailureForWatchAppBundleID:v4 failureReason:v8];

  return (char)self;
}

- (BOOL)_onQueue_reportExternalInstallFailureForWatchAppBundleID:(id)a3 failureReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSErrorUserInfoKey v8 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(ACXLocalAppStoreInstallQueue *)self currentInstall];
  uint64_t v10 = [v9 app];
  id v11 = [v10 bundleIdentifier];

  if (v11 && [v11 isEqualToString:v6])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v26 = v6;
      id v27 = v7;
      MOLogWrite();
    }
    id v12 = [(ACXLocalAppStoreInstallQueue *)self currentCompletionBlock];
    if (v12)
    {
      qos_class_t v13 = qos_class_self();
      id v14 = dispatch_get_global_queue(v13, 0);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10001D7EC;
      v31[3] = &unk_10008CCC8;
      id v33 = v12;
      id v32 = v7;
      sub_100006BB8(v14, v31);

      [(ACXLocalAppStoreInstallQueue *)self setCurrentCompletionBlock:0];
    }
    [(ACXLocalAppStoreInstallQueue *)self _cancelCoordinatorForInstallWithWatchBundleID:v6 withReason:v7];
    objc_super v15 = [(ACXLocalAppStoreInstallQueue *)self currentInstallCoordinator];

    if (v15)
    {
      [(ACXLocalAppStoreInstallQueue *)self _onQueue_clearCurrentInstallCoordinator];
      [(ACXLocalAppStoreInstallQueue *)self _onQueue_deQueueNextOperation];
    }
    else
    {
      [(ACXLocalAppStoreInstallQueue *)self setCancelCurrentOperation:1];
    }
LABEL_17:

    BOOL v18 = 1;
    goto LABEL_18;
  }
  id v16 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
  unint64_t v17 = [(ACXLocalAppStoreInstallQueue *)self _onQueue_indexOfInstallOperationWithWatchBundleID:v6 inQueue:v16];

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
    id v12 = [v19 objectAtIndexedSubscript:v17];

    v20 = [v12 completion];
    qos_class_t v21 = qos_class_self();
    v22 = dispatch_get_global_queue(v21, 0);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001D800;
    v28[3] = &unk_10008CCC8;
    id v23 = v20;
    id v30 = v23;
    id v29 = v7;
    sub_100006BB8(v22, v28);

    v24 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
    [v24 removeObjectAtIndex:v17];

    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }

    goto LABEL_17;
  }
  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (BOOL)reportExternalInstallFailureForWatchAppBundleID:(id)a3 failureReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  NSErrorUserInfoKey v8 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D93C;
  v12[3] = &unk_10008D4D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  objc_super v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (void)cancelAllPendingInstalls
{
  v3 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D9FC;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_clearCurrentInstallCoordinator
{
  v3 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACXLocalAppStoreInstallQueue *)self currentInstallCoordinator];
  [v4 setObserver:0];

  [(ACXLocalAppStoreInstallQueue *)self setCurrentInstallCoordinator:0];
}

- (unint64_t)_onQueue_countPending
{
  v2 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)_onQueue_startQueue
{
  if ([(ACXLocalAppStoreInstallQueue *)self isSuspended]) {
    sub_10005B9F0();
  }
  [(ACXLocalAppStoreInstallQueue *)self activeTransaction];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_10005BA1C();
  }
  id v3 = (void *)os_transaction_create();
  [(ACXLocalAppStoreInstallQueue *)self setActiveTransaction:v3];

  [(ACXLocalAppStoreInstallQueue *)self _createInstallationSentinel];

  [(ACXLocalAppStoreInstallQueue *)self _onQueue_deQueueNextOperation];
}

- (void)_onQueue_stopQueue
{
  id v3 = [(ACXLocalAppStoreInstallQueue *)self activeTransaction];
  if (!v3) {
    sub_10005BA48();
  }

  [(ACXLocalAppStoreInstallQueue *)self setActiveTransaction:0];
  [(ACXLocalAppStoreInstallQueue *)self _removeInstallationSentinel];
  id v4 = [(ACXLocalAppStoreInstallQueue *)self currentInstall];
  if (!v4) {
    sub_10005BA74();
  }

  [(ACXLocalAppStoreInstallQueue *)self setCurrentInstall:0];
  [(ACXLocalAppStoreInstallQueue *)self _onQueue_clearCurrentInstallCoordinator];

  [(ACXLocalAppStoreInstallQueue *)self setCancelCurrentOperation:0];
}

- (void)_onQueue_deQueueNextOperation
{
  id v3 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
  id v4 = [v3 count];

  if (!v4)
  {
    [(ACXLocalAppStoreInstallQueue *)self isSuspended];
    goto LABEL_19;
  }
  id v28 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
  if (![(ACXLocalAppStoreInstallQueue *)self isSuspended] || !v28)
  {
    if (v28)
    {
      uint64_t v5 = [v28 objectAtIndex:0];
      [v28 removeObjectAtIndex:0];
      id v6 = [v5 app];
      id v7 = [v6 bundleIdentifier];

      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        v25 = v7;
        unint64_t v27 = [(ACXLocalAppStoreInstallQueue *)self _onQueue_countPending];
        MOLogWrite();
      }
      -[ACXLocalAppStoreInstallQueue setCancelCurrentOperation:](self, "setCancelCurrentOperation:", 0, v25, v27);
      [(ACXLocalAppStoreInstallQueue *)self setCurrentInstall:v5];
      [(ACXLocalAppStoreInstallQueue *)self _onQueue_clearCurrentInstallCoordinator];
      NSErrorUserInfoKey v8 = [(ACXLocalAppStoreInstallQueue *)self currentInstall];
      id v9 = [v8 completion];
      [(ACXLocalAppStoreInstallQueue *)self setCurrentCompletionBlock:v9];

      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v26 = v7;
        MOLogWrite();
      }
      id v10 = objc_msgSend(v5, "app", v26);
      id v11 = [v10 storeMetadata];

      if (v11)
      {
        [v11 setSoftwareVersionBundleID:v7];
        id v13 = +[ASDWatchAppMetadata metadataFromStoreMetadata:v11];
        if (v13)
        {
          id v15 = v13;
          objc_msgSend(v13, "setUserInitiated:", objc_msgSend(v5, "isUserInitiated"));
          uint64_t v16 = (void *)os_transaction_create();
          unint64_t v17 = [(ACXLocalAppStoreInstallQueue *)self device];
          uint64_t v18 = [v17 nrDevice];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10001E2C8;
          v32[3] = &unk_10008D568;
          id v33 = v16;
          v34 = self;
          id v35 = v7;
          id v36 = v5;
          id v19 = v16;
          +[ASDInstallApps installApp:v15 onPairedDevice:v18 withCompletionHandler:v32];

LABEL_29:
          return;
        }
        sub_100007710((uint64_t)"-[ACXLocalAppStoreInstallQueue _onQueue_deQueueNextOperation]", 318, @"ACXErrorDomain", 1, 0, 0, @"Failed to instantiate ASDWatchAppMetadata with MIStoreMetadata %@ for %@", v14, (uint64_t)v11);
      }
      else
      {
        sub_100007710((uint64_t)"-[ACXLocalAppStoreInstallQueue _onQueue_deQueueNextOperation]", 309, @"ACXErrorDomain", 51, 0, 0, @"Failed to load metadata for app %@", v12, (uint64_t)v7);
      v20 = };
      qos_class_t v21 = [(ACXLocalAppStoreInstallQueue *)self currentCompletionBlock];
      [(ACXLocalAppStoreInstallQueue *)self setCurrentCompletionBlock:0];
      qos_class_t v22 = qos_class_self();
      id v23 = dispatch_get_global_queue(v22, 0);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10001E758;
      v29[3] = &unk_10008CCC8;
      id v30 = v20;
      id v31 = v21;
      id v15 = v20;
      id v24 = v21;
      sub_100006BB8(v23, v29);

      [(ACXLocalAppStoreInstallQueue *)self _onQueue_deQueueNextOperation];
      goto LABEL_29;
    }
LABEL_19:
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [(ACXLocalAppStoreInstallQueue *)self _onQueue_stopQueue];
    id v28 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
    if ([v28 count]) {
      sub_10005BAA0();
    }
    goto LABEL_23;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  [(ACXLocalAppStoreInstallQueue *)self _onQueue_stopQueue];
LABEL_23:
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
      NSErrorUserInfoKey v8 = [v6 objectAtIndexedSubscript:v7];
      id v9 = [v8 app];
      id v10 = [v9 bundleIdentifier];
      unsigned __int8 v11 = [v10 isEqualToString:v5];

      if (v11) {
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
  return [(ACXLocalAppStoreInstallQueue *)self _onQueue_indexOfInstallOperationWithWatchBundleID:a4 inQueue:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_onQueue_removeInstallOperationWithWatchBundleID:(id)a3 fromQueue:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ACXLocalAppStoreInstallQueue *)self _onQueue_indexOfInstallOperationWithWatchBundleID:a3 inQueue:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 removeObjectAtIndex:v7];
  }

  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_createInstallationSentinel
{
  v2 = [(ACXLocalAppStoreInstallQueue *)self _installationSentinelFileURL];
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
  id v3 = [(ACXLocalAppStoreInstallQueue *)self _installationSentinelFileURL];
  [v4 removeItemAtURL:v3 error:0];
}

- (id)_installationSentinelFileURL
{
  v2 = sub_100007CEC();
  id v3 = [v2 URLByAppendingPathComponent:@"local_appstore_install_in_progress" isDirectory:0];

  return v3;
}

- (id)_onQueue_queueElementForApp:(id)a3 isCurrentInstall:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = [(ACXLocalAppStoreInstallQueue *)self currentInstall];
  NSErrorUserInfoKey v8 = [v7 app];
  id v9 = [v8 bundleIdentifier];
  unsigned int v10 = [v9 isEqualToString:v6];

  if (v10)
  {
    if (a4) {
      *a4 = 1;
    }
    id v11 = [(ACXLocalAppStoreInstallQueue *)self currentInstall];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v18 = [v17 app];
          id v19 = [v18 bundleIdentifier];
          unsigned int v20 = [v19 isEqualToString:v6];

          if (v20)
          {
            if (a4) {
              *a4 = 0;
            }
            id v11 = v17;

            goto LABEL_17;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v11 = 0;
  }
LABEL_17:

  return v11;
}

- (BOOL)_onQueue_installIsPendingForWatchApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXLocalAppStoreInstallQueue *)self currentInstall];
  id v6 = [v5 app];
  unint64_t v7 = [v6 bundleIdentifier];
  unsigned __int8 v8 = [v7 isEqualToString:v4];

  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    unsigned int v10 = [(ACXLocalAppStoreInstallQueue *)self installQueue];
    BOOL v9 = [(ACXLocalAppStoreInstallQueue *)self _onQueue_indexOfInstallOperationWithWatchBundleID:v4 inQueue:v10] != 0x7FFFFFFFFFFFFFFFLL;
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
  id v5 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EDF8;
  block[3] = &unk_10008CA18;
  id v9 = v4;
  unsigned int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)acknowledgeInstallationStartedForWatchApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EEE4;
  v7[3] = &unk_10008CC28;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  sub_100006BB8(v5, v7);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [(ACXLocalAppStoreInstallQueue *)self internalQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001F114;
  v13[3] = &unk_10008CF30;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

- (ACXDevice)device
{
  return self->_device;
}

- (NSMutableArray)installQueue
{
  return self->_installQueue;
}

- (ACXLocalAppStoreInstallQueueElement)currentInstall
{
  return self->_currentInstall;
}

- (void)setCurrentInstall:(id)a3
{
}

- (IXGizmoInstallingAppInstallCoordinator)currentInstallCoordinator
{
  return self->_currentInstallCoordinator;
}

- (void)setCurrentInstallCoordinator:(id)a3
{
}

- (id)currentCompletionBlock
{
  return self->_currentCompletionBlock;
}

- (void)setCurrentCompletionBlock:(id)a3
{
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
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong(&self->_currentCompletionBlock, 0);
  objc_storeStrong((id *)&self->_currentInstallCoordinator, 0);
  objc_storeStrong((id *)&self->_currentInstall, 0);
  objc_storeStrong((id *)&self->_installQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end