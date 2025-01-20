@interface StoreKitMessagesManager
+ (id)sharedManager;
- (BOOL)_accountHasMessagesForBundleID:(id)a3 bundleID:(id)a4;
- (BOOL)addMessage:(id)a3 error:(id *)a4;
- (BOOL)addMessageStatus:(id)a3 forBundleID:(id)a4 accountID:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7 error:(id *)a8;
- (StoreKitMessagesManager)init;
- (id)_bundleIDsWithMessagesForAccount:(id)a3;
- (id)_bundleIDsWithMessagesInBundleIDs:(id)a3 account:(id)a4;
- (id)_removeStoreKitMessageForAccount:(id)a3 bundleID:(id)a4 type:(int64_t)a5 logKey:(id)a6;
- (id)_storeKitConnectionForBundleID:(id)a3;
- (id)databaseStore;
- (id)messageInfoForClient:(id)a3 messageType:(id)a4;
- (id)revocationsForClient:(id)a3;
- (void)_accountDidChange:(id)a3;
- (void)_displayMessageForProdAccount:(id)a3 bundleID:(id)a4;
- (void)_handleObservationsForCurrentAccount;
- (void)_presentEngagementTaskWithURL:(id)a3 client:(id)a4;
- (void)_recordPotentialMessageWithURL:(id)a3 type:(int64_t)a4 allowsDeveloperControl:(BOOL)a5 client:(id)a6;
- (void)_showMessage:(id)a3 forClient:(id)a4 messageType:(int64_t)a5 useItmsUI:(BOOL)a6;
- (void)appDidLaunchWithBundleID:(id)a3;
- (void)askToShowMessageForClient:(id)a3 message:(id)a4 pendingURL:(id)a5 connection:(id)a6;
- (void)checkForMessagesForClient:(id)a3 remoteObjectProxy:(id)a4 xpcConnection:(id)a5;
- (void)displayMessageForMessageInfo:(id)a3 client:(id)a4;
- (void)displayMessageWithType:(id)a3 forClient:(id)a4 connection:(id)a5;
- (void)handleAppInstallWithBundleIDs:(id)a3;
- (void)handleAppUninstallWithBundleIDs:(id)a3;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4;
- (void)recordMessageDisplayEventWithType:(int64_t)a3 messageType:(int64_t)a4 client:(id)a5;
- (void)revokeProductIdentifiers:(id)a3 forBundleID:(id)a4 accountID:(id)a5;
@end

@implementation StoreKitMessagesManager

- (void)checkForMessagesForClient:(id)a3 remoteObjectProxy:(id)a4 xpcConnection:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  v9 = self;
  sub_10000E308();

  swift_unknownObjectRelease();
}

- (id)messageInfoForClient:(id)a3 messageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "objc_clientType") == 3)
  {
    id v8 = &off_100373BC0;
  }
  else
  {
    v9 = [v6 account];
    objc_msgSend(v9, "ams_DSID");
    id v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      goto LABEL_11;
    }
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_10008283C;
  v29 = sub_10008284C;
  id v30 = 0;
  v10 = [(StoreKitMessagesManager *)self databaseStore];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1000830C8;
  v20 = &unk_100359FD0;
  v24 = &v25;
  v11 = v8;
  id v21 = v11;
  id v12 = v6;
  id v22 = v12;
  id v23 = v7;
  [v10 readUsingSession:&v17];

  v13 = (void *)v26[5];
  if (!v13)
  {
    if (qword_1003A0310 != -1) {
      dispatch_once(&qword_1003A0310, &stru_10035A130);
    }
    v14 = (id)qword_1003A02D0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v12, "requestBundleID", v17, v18, v19, v20, v21, v22);
      *(_DWORD *)buf = 138478083;
      v32 = v11;
      __int16 v33 = 2114;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No message in database for DSID: %{private}@, bundle ID: %{public}@", buf, 0x16u);
    }
    v13 = (void *)v26[5];
  }
  id v8 = v13;

  _Block_object_dispose(&v25, 8);
LABEL_11:

  return v8;
}

- (id)revocationsForClient:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "objc_clientType") == 3)
  {
    v5 = +[OctaneManager testAccountID];
    if (v5)
    {
LABEL_3:
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x3032000000;
      v37 = sub_10008283C;
      v38 = sub_10008284C;
      id v39 = 0;
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = sub_10008283C;
      v32 = sub_10008284C;
      id v33 = 0;
      id v6 = [(StoreKitMessagesManager *)self databaseStore];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10008315C;
      v24[3] = &unk_100359FF8;
      uint64_t v27 = &v28;
      id v7 = v5;
      id v25 = v7;
      id v8 = v4;
      id v26 = v8;
      [v6 readUsingSession:v24];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000831EC;
      v21[3] = &unk_10035A020;
      id v9 = v7;
      id v22 = v9;
      id v10 = v8;
      id v23 = v10;
      [v6 modifyUsingTransaction:v21];
      if ([(id)v29[5] count])
      {
        id v11 = objc_alloc_init((Class)NSMutableArray);
        id v12 = (void *)v35[5];
        v35[5] = (uint64_t)v11;

        v13 = (void *)v29[5];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10008324C;
        v20[3] = &unk_10035A048;
        v20[4] = &v34;
        [v13 enumerateObjectsUsingBlock:v20];
      }
      else
      {
        if (qword_1003A0310 != -1) {
          dispatch_once(&qword_1003A0310, &stru_10035A130);
        }
        v17 = (id)qword_1003A02D0;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v10 requestBundleID];
          *(_DWORD *)buf = 138478083;
          id v41 = v9;
          __int16 v42 = 2114;
          v43 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No revocations in database for DSID: %{private}@, bundleID: %{public}@", buf, 0x16u);
        }
      }
      id v16 = (id)v35[5];

      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v34, 8);

      goto LABEL_17;
    }
  }
  else
  {
    v14 = [v4 account];
    v5 = objc_msgSend(v14, "ams_DSID");

    if (v5) {
      goto LABEL_3;
    }
  }
  if (qword_1003A0310 != -1) {
    dispatch_once(&qword_1003A0310, &stru_10035A130);
  }
  v15 = (void *)qword_1003A02D0;
  if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
    sub_100007028(v15, v4);
  }
  id v16 = 0;
LABEL_17:

  return v16;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082160;
  block[3] = &unk_1003572F0;
  block[4] = a1;
  if (qword_1003A02C0 != -1) {
    dispatch_once(&qword_1003A02C0, block);
  }
  v2 = (void *)qword_1003A02B8;

  return v2;
}

- (StoreKitMessagesManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)StoreKitMessagesManager;
  v2 = [(StoreKitMessagesManager *)&v21 init];
  if (v2)
  {
    if (qword_1003A0310 != -1) {
      dispatch_once(&qword_1003A0310, &stru_10035A130);
    }
    v3 = qword_1003A02C8;
    if (os_log_type_enabled((os_log_t)qword_1003A02C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering StoreKit Messages push consumer", buf, 2u);
    }
    id v4 = +[PushService sharedInstance];
    [v4 registerConsumer:v2 forActionType:30];

    v5 = +[PushService sharedInstance];
    [v5 registerConsumer:v2 forActionType:32];

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.StoreKit.ShowMessages", v6);
    showMessageQueue = v2->_showMessageQueue;
    v2->_showMessageQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appstored.StoreKit.MessageAccountObserver", v9);
    accountObserverQueue = v2->_accountObserverQueue;
    v2->_accountObserverQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc_init(StoreKitAppLaunchObserver);
    observer = v2->_observer;
    v2->_observer = v12;

    [(StoreKitAppLaunchObserver *)v2->_observer setDelegate:v2];
    v14 = +[NSNotificationCenter defaultCenter];
    v15 = +[ActiveAccountObserver sharedInstance];
    [v14 addObserver:v2 selector:"_accountDidChange:" name:@"AccountStorePrimaryAccountDidChange" object:v15];

    id v16 = v2->_accountObserverQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000823EC;
    block[3] = &unk_100358170;
    v19 = v2;
    dispatch_async(v16, block);
  }
  return v2;
}

- (id)databaseStore
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = (StoreKitMessagesDatabaseStore *)objc_loadWeakRetained((id *)&v2->_databaseStore);
  if (!WeakRetained)
  {
    id v4 = +[Environment sharedInstance];
    v5 = [v4 userDatabase];
    WeakRetained = [(SQLiteDatabaseStore *)[StoreKitMessagesDatabaseStore alloc] initWithDatabase:v5];
    objc_storeWeak((id *)&v2->_databaseStore, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (BOOL)addMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10008283C;
  id v33 = sub_10008284C;
  id v34 = 0;
  if (v6)
  {
    dispatch_queue_t v7 = [(StoreKitMessagesManager *)self databaseStore];
    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_100082854;
    id v26 = &unk_100359FA8;
    id v8 = v6;
    id v27 = v8;
    uint64_t v28 = &v29;
    [v7 modifyUsingTransaction:&v23];

    if (v30[5])
    {
      if (qword_1003A0310 != -1) {
        dispatch_once(&qword_1003A0310, &stru_10035A130);
      }
      id v9 = (id)qword_1003A02D0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v30[5];
        uint64_t v18 = objc_msgSend(v8, "userID", v23, v24, v25, v26);
        v19 = [v8 bundleID];
        *(_DWORD *)buf = 138543875;
        uint64_t v36 = v17;
        __int16 v37 = 2113;
        v38 = v18;
        __int16 v39 = 2114;
        v40 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error inserting message info: %{public}@ for DSID: %{private}@, bundle ID: %{public}@", buf, 0x20u);
      }
    }
    dispatch_queue_t v10 = v27;
  }
  else
  {
    id v11 = objc_alloc((Class)NSError);
    id v12 = [v11 initWithDomain:ASDErrorDomain code:740 userInfo:0];
    dispatch_queue_t v10 = (void *)v30[5];
    v30[5] = (uint64_t)v12;
  }

  v13 = v30;
  if (a4 && v30[5])
  {
    if (qword_1003A0310 != -1) {
      dispatch_once(&qword_1003A0310, &stru_10035A130);
    }
    v14 = (id)qword_1003A02D0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v30[5];
      objc_super v21 = [v6 userID];
      id v22 = [v6 bundleID];
      *(_DWORD *)buf = 138543875;
      uint64_t v36 = v20;
      __int16 v37 = 2113;
      v38 = v21;
      __int16 v39 = 2114;
      v40 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error inserting message info: %{public}@ for DSID: %{private}@, bundle ID: %{public}@", buf, 0x20u);
    }
    *a4 = (id) v30[5];
    v13 = v30;
  }
  BOOL v15 = v13[5] != 0;
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)addMessageStatus:(id)a3 forBundleID:(id)a4 accountID:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [[StoreKitMessageInfo alloc] initWithUserID:v14 bundleID:v15 status:v16 allowDeveloperControl:v10 messageType:a7];

  LOBYTE(a8) = [(StoreKitMessagesManager *)self addMessage:v17 error:a8];
  return (char)a8;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 accountID];
  if ([v7 actionType] == (id)30)
  {
    id v9 = [v7 valueForUserInfoKey:@"2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v10 = [v7 valueForUserInfoKey:@"9"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = v10;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = objc_alloc_init((Class)NSNumberFormatter);
          [v13 setNumberStyle:1];
          uint64_t v30 = [v13 numberFromString:v10];
        }
        else
        {
          uint64_t v30 = &off_100373BC0;
        }
      }
      id v15 = [v7 valueForUserInfoKey:@"11"];

      if (v15 && (objc_opt_respondsToSelector() & 1) != 0) {
        uint64_t v16 = (uint64_t)[v15 BOOLValue];
      }
      else {
        uint64_t v16 = 1;
      }
      uint64_t v17 = [v7 valueForUserInfoKey:@"12"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = (uint64_t)[v17 integerValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = objc_alloc_init((Class)NSNumberFormatter);
          [v19 setNumberStyle:1];
          uint64_t v20 = [v19 numberFromString:v17];
          objc_super v21 = v20;
          if (v20) {
            uint64_t v18 = (uint64_t)[v20 integerValue];
          }
          else {
            uint64_t v18 = 2;
          }
        }
        else
        {
          uint64_t v18 = 2;
        }
      }
      if (qword_1003A0310 != -1) {
        dispatch_once(&qword_1003A0310, &stru_10035A130);
      }
      id v22 = qword_1003A02D0;
      if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v23 = @"false";
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = self;
        if (v16) {
          CFStringRef v23 = @"true";
        }
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        v48 = v8;
        *(_WORD *)v49 = 2112;
        *(void *)&v49[2] = v30;
        *(_WORD *)&v49[10] = 2112;
        *(void *)&v49[12] = v23;
        __int16 v50 = 2048;
        uint64_t v51 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Received StoreKit message for bundleID: %@ accountID: %@ status: %@ allowDeveloperControl: %@ type: %ld", buf, 0x3Eu);
      }
      uint64_t v24 = [[StoreKitMessageInfo alloc] initWithUserID:v8 bundleID:v9 status:v30 allowDeveloperControl:v16 messageType:v18];
      if (v24)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v48 = sub_10008283C;
        *(void *)v49 = sub_10008284C;
        *(void *)&v49[8] = 0;
        id v25 = [(StoreKitMessagesManager *)self databaseStore];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100082FFC;
        v35[3] = &unk_100359FA8;
        uint64_t v36 = v24;
        __int16 v37 = buf;
        [v25 modifyUsingTransaction:v35];

        if (*(void *)(*(void *)&buf[8] + 40))
        {
          if (qword_1003A0310 != -1) {
            dispatch_once(&qword_1003A0310, &stru_10035A130);
          }
          id v26 = qword_1003A02D0;
          if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)__int16 v39 = 138544130;
            uint64_t v40 = v27;
            __int16 v41 = 2112;
            __int16 v42 = v8;
            __int16 v43 = 2112;
            id v44 = v9;
            __int16 v45 = 2112;
            v46 = v30;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error inserting message info: %{public}@ for DSID: %@, bundle ID: %@, status: %@", v39, 0x2Au);
          }
        }
        else if (v9)
        {
          observer = self->_observer;
          id v38 = v9;
          uint64_t v29 = +[NSArray arrayWithObjects:&v38 count:1];
          [(StoreKitAppLaunchObserver *)observer observeAppLaunchForBundleIDs:v29];
        }
        _Block_object_dispose(buf, 8);
      }
      id v9 = v17;
    }
    else
    {
      if (qword_1003A0310 != -1) {
        dispatch_once(&qword_1003A0310, &stru_10035A130);
      }
      if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
        sub_1002C94D8();
      }
    }
LABEL_47:

    goto LABEL_48;
  }
  if ([v7 actionType] == (id)32)
  {
    id v11 = [v7 getRevokedProductsMap];
    id v9 = v11;
    if (v11)
    {
      id v12 = [v11 allKeys];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100083050;
      v31[3] = &unk_100359D70;
      id v9 = v9;
      id v32 = v9;
      id v33 = self;
      id v34 = v8;
      [v12 enumerateObjectsUsingBlock:v31];
    }
    else
    {
      if (qword_1003A0310 != -1) {
        dispatch_once(&qword_1003A0310, &stru_10035A130);
      }
      id v14 = qword_1003A02D0;
      if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
        sub_1002C9540(v14);
      }
    }
    goto LABEL_47;
  }
LABEL_48:
}

- (void)revokeProductIdentifiers:(id)a3 forBundleID:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(StoreKitMessagesManager *)self databaseStore];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000833FC;
  v17[3] = &unk_10035A098;
  id v12 = v8;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  [v11 modifyUsingTransaction:v17];

  id v15 = +[OctaneManager testAccountID];
  LODWORD(v9) = [v13 isEqualToNumber:v15];

  if (v9)
  {
    uint64_t v16 = +[StoreKitServiceConnection octaneConnectionForBundleID:v14];
    [v16 checkForMessages];
  }
}

- (void)appDidLaunchWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(StoreKitMessagesManager *)self _storeKitConnectionForBundleID:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 client];
    unsigned int v8 = objc_msgSend(v7, "objc_clientType");

    if (v8 == 1) {
      [v6 checkForMessages];
    }
  }
  else
  {
    accountObserverQueue = self->_accountObserverQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008374C;
    v10[3] = &unk_1003580D0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(accountObserverQueue, v10);
  }
}

- (void)handleAppInstallWithBundleIDs:(id)a3
{
  id v8 = a3;
  id v4 = +[ActiveAccountObserver activeAccount];
  v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "ams_DSID");

    if (v6)
    {
      id v7 = [(StoreKitMessagesManager *)self _bundleIDsWithMessagesInBundleIDs:v8 account:v5];
      [(StoreKitAppLaunchObserver *)self->_observer observeAppLaunchForBundleIDs:v7];
    }
  }
}

- (void)handleAppUninstallWithBundleIDs:(id)a3
{
}

- (id)_bundleIDsWithMessagesForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10008283C;
  uint64_t v16 = sub_10008284C;
  id v17 = objc_alloc_init((Class)NSArray);
  v5 = objc_msgSend(v4, "ams_DSID");

  if (v5)
  {
    id v6 = [(StoreKitMessagesManager *)self databaseStore];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000839E0;
    v9[3] = &unk_10035A0C0;
    id v11 = &v12;
    id v10 = v4;
    [v6 readUsingSession:v9];
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)_accountHasMessagesForBundleID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v8 = objc_msgSend(v6, "ams_DSID");

  if (v8)
  {
    id v9 = [(StoreKitMessagesManager *)self databaseStore];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100083BA4;
    v12[3] = &unk_100359FF8;
    id v15 = &v16;
    id v13 = v6;
    id v14 = v7;
    [v9 readUsingSession:v12];
  }
  char v10 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)_bundleIDsWithMessagesInBundleIDs:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = sub_10008283C;
  id v20 = sub_10008284C;
  id v21 = objc_alloc_init((Class)NSArray);
  id v8 = objc_msgSend(v7, "ams_DSID");

  if (v8)
  {
    id v9 = [(StoreKitMessagesManager *)self databaseStore];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100083DB4;
    v12[3] = &unk_100359FF8;
    id v15 = &v16;
    id v13 = v6;
    id v14 = v7;
    [v9 readUsingSession:v12];
  }
  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)_storeKitConnectionForBundleID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_10008283C;
    id v14 = sub_10008284C;
    id v15 = 0;
    id v4 = +[StoreKitServiceConnection allConnections];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100083FE0;
    v7[3] = &unk_10035A0E8;
    id v8 = v3;
    id v9 = &v10;
    [v4 enumerateObjectsUsingBlock:v7];

    id v5 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (qword_1003A0310 != -1) {
      dispatch_once(&qword_1003A0310, &stru_10035A130);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
      sub_1002C9584();
    }
    id v5 = 0;
  }

  return v5;
}

- (void)_displayMessageForProdAccount:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v7 error:0];
    if (v8)
    {
      id v9 = [_TtC9storekitd6Client alloc];
      uint64_t v10 = [v8 URL];
      id v11 = [(Client *)v9 initWithURL:v10 overridesDictionary:0];

      if (v11 && [(Client *)v11 objc_clientType] == 1)
      {
        uint64_t v12 = [(StoreKitMessagesManager *)self messageInfoForClient:v11 messageType:0];
        id v13 = +[StoreKitMessagesManager sharedManager];
        [v13 displayMessageForMessageInfo:v12 client:v11];
      }
      else
      {
        if (qword_1003A0310 != -1) {
          dispatch_once(&qword_1003A0310, &stru_10035A130);
        }
        if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
          sub_1002C9654();
        }
      }
    }
    else
    {
      if (qword_1003A0310 != -1) {
        dispatch_once(&qword_1003A0310, &stru_10035A130);
      }
      if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
        sub_1002C95EC();
      }
    }
  }
  else
  {
    if (qword_1003A0310 != -1) {
      dispatch_once(&qword_1003A0310, &stru_10035A130);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
      sub_1002C9584();
    }
  }
}

- (void)_handleObservationsForCurrentAccount
{
  id v3 = +[ActiveAccountObserver activeAccount];
  if (v3)
  {
    id v6 = v3;
    id v4 = objc_msgSend(v3, "ams_DSID");

    id v3 = v6;
    if (v4)
    {
      id v5 = [(StoreKitMessagesManager *)self _bundleIDsWithMessagesForAccount:v6];
      [(StoreKitAppLaunchObserver *)self->_observer observeAppLaunchForBundleIDs:v5];

      id v3 = v6;
    }
  }
}

- (void)_presentEngagementTaskWithURL:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003A0310 != -1) {
    dispatch_once(&qword_1003A0310, &stru_10035A130);
  }
  id v8 = qword_1003A02D0;
  if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = self;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Opening message URL: %{public}@", buf, 0x16u);
  }
  id v9 = [v7 account];
  id v10 = objc_alloc_init((Class)AMSEngagementRequest);
  [v10 setURL:v6];
  if (v9) {
    [v10 setAccount:v9];
  }
  v21[0] = @"refApp";
  id v11 = [v7 requestBundleID];
  v21[1] = @"app";
  v22[0] = v11;
  v22[1] = @"com.apple.AppStore";
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v10 setMetricsOverlay:v12];

  id v13 = [objc_alloc((Class)AMSSystemEngagementTask) initWithRequest:v10];
  id v14 = [v7 processInfo];
  [v13 setClientInfo:v14];

  id v15 = [v7 bag];
  [v13 setBag:v15];

  showMessageQueue = self->_showMessageQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100084590;
  v18[3] = &unk_1003580D0;
  id v19 = v13;
  id v20 = self;
  id v17 = v13;
  dispatch_async(showMessageQueue, v18);
}

- (void)_accountDidChange:(id)a3
{
  [(StoreKitAppLaunchObserver *)self->_observer stopObserving];
  accountObserverQueue = self->_accountObserverQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084824;
  block[3] = &unk_100358170;
  void block[4] = self;
  dispatch_async(accountObserverQueue, block);
}

- (void)_recordPotentialMessageWithURL:(id)a3 type:(int64_t)a4 allowsDeveloperControl:(BOOL)a5 client:(id)a6
{
  if (a3)
  {
    if (a5) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 4;
    }
    [(StoreKitMessagesManager *)self recordMessageDisplayEventWithType:v6 messageType:a4 client:a6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_accountObserverQueue, 0);
  objc_storeStrong((id *)&self->_showMessageQueue, 0);

  objc_destroyWeak((id *)&self->_databaseStore);
}

- (void)_showMessage:(id)a3 forClient:(id)a4 messageType:(int64_t)a5 useItmsUI:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = +[NSNumber numberWithInteger:a5];
  id v13 = [(StoreKitMessagesManager *)self messageInfoForClient:v11 messageType:v12];

  if (v13)
  {
    id v14 = [v11 account];
    if (objc_msgSend(v11, "objc_clientType") != 3)
    {
      if (v6)
      {
        id v15 = +[NSURLComponents componentsWithURL:v10 resolvingAgainstBaseURL:0];
        [v15 setScheme:@"itms-ui"];
        uint64_t v16 = [v15 URL];
        if (v16)
        {
          if (qword_1003A0310 != -1) {
            dispatch_once(&qword_1003A0310, &stru_10035A130);
          }
          id v17 = qword_1003A02D0;
          if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 138543618;
            uint64_t v27 = self;
            __int16 v28 = 2114;
            uint64_t v29 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Opening message URL: %{public}@", (uint8_t *)&v26, 0x16u);
          }
          uint64_t v18 = +[LSApplicationWorkspace defaultWorkspace];
          [v18 openSensitiveURL:v16 withOptions:&__NSDictionary0__struct];
        }
        else
        {
          if (qword_1003A0310 != -1) {
            dispatch_once(&qword_1003A0310, &stru_10035A130);
          }
          if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
            sub_1002C97A0();
          }
        }

LABEL_25:
        if (objc_msgSend(v11, "objc_clientType") == 3)
        {
          id v20 = &off_100373BC0;
        }
        else
        {
          objc_msgSend(v14, "ams_DSID");
          id v20 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            ASDErrorWithDescription();
            id v22 = (StoreKitMessagesManager *)objc_claimAutoreleasedReturnValue();
            if (v22) {
              goto LABEL_29;
            }
            goto LABEL_33;
          }
        }
        id v21 = [v11 requestBundleID];
        id v22 = [(StoreKitMessagesManager *)self _removeStoreKitMessageForAccount:v20 bundleID:v21 type:a5 logKey:0];

        if (v22)
        {
LABEL_29:
          if (qword_1003A0310 != -1) {
            dispatch_once(&qword_1003A0310, &stru_10035A130);
          }
          CFStringRef v23 = (void *)qword_1003A02D0;
          if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = v23;
            __int16 v25 = [v11 requestBundleID];
            int v26 = 138543874;
            uint64_t v27 = v22;
            __int16 v28 = 2112;
            uint64_t v29 = v20;
            __int16 v30 = 2112;
            uint64_t v31 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error removing message info: %{public}@ for DSID: %@, bundle ID: %@", (uint8_t *)&v26, 0x20u);
          }
        }
LABEL_33:

        goto LABEL_34;
      }
      if (!v14)
      {
        if (qword_1003A0310 != -1) {
          dispatch_once(&qword_1003A0310, &stru_10035A130);
        }
        id v19 = (void *)qword_1003A02D0;
        if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
          sub_1002C9808(v19, v11);
        }
      }
    }
    [(StoreKitMessagesManager *)self _presentEngagementTaskWithURL:v10 client:v11];
    goto LABEL_25;
  }
  if (qword_1003A0310 != -1) {
    dispatch_once(&qword_1003A0310, &stru_10035A130);
  }
  if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR)) {
    sub_1002C9738();
  }
LABEL_34:
}

- (id)_removeStoreKitMessageForAccount:(id)a3 bundleID:(id)a4 type:(int64_t)a5 logKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = sub_10008283C;
  uint64_t v29 = sub_10008284C;
  id v30 = 0;
  if (qword_1003A0310 != -1) {
    dispatch_once(&qword_1003A0310, &stru_10035A130);
  }
  id v13 = qword_1003A02D0;
  if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v32 = v12;
    __int16 v33 = 2114;
    id v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Removing message info for %{public}@", buf, 0x16u);
  }
  if (v10 && v11)
  {
    id v14 = [(StoreKitMessagesManager *)self databaseStore];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100084FAC;
    v20[3] = &unk_10035A110;
    id v21 = v10;
    id v22 = v11;
    CFStringRef v23 = &v25;
    int64_t v24 = a5;
    [v14 modifyUsingTransaction:v20];
  }
  id v15 = (void *)v26[5];
  if (v15)
  {
    if (qword_1003A0310 != -1) {
      dispatch_once(&qword_1003A0310, &stru_10035A130);
    }
    uint64_t v16 = qword_1003A02D0;
    if (os_log_type_enabled((os_log_t)qword_1003A02D0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v26[5];
      *(_DWORD *)buf = 138543874;
      id v32 = v12;
      __int16 v33 = 2114;
      id v34 = v11;
      __int16 v35 = 2114;
      uint64_t v36 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to remove message info for %{public}@: %{public}@", buf, 0x20u);
    }
    id v15 = (void *)v26[5];
  }
  id v17 = v15;
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void)recordMessageDisplayEventWithType:(int64_t)a3 messageType:(int64_t)a4 client:(id)a5
{
  id v9 = a5;
  id v10 = self;
  sub_10012F75C(a3, a4, a5);
}

- (void)displayMessageWithType:(id)a3 forClient:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_10012F8F8();
}

- (void)askToShowMessageForClient:(id)a3 message:(id)a4 pendingURL:(id)a5 connection:(id)a6
{
  uint64_t v11 = sub_10001E6FC((uint64_t *)&unk_10039B760);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for URL();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v14 = type metadata accessor for URL();
    uint64_t v15 = 1;
  }
  sub_10001B5DC((uint64_t)v13, v15, 1, v14);
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  uint64_t v19 = self;
  sub_10013154C();

  sub_10001E6B0((uint64_t)v13, (uint64_t *)&unk_10039B760);
}

- (void)displayMessageForMessageInfo:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10013268C();
}

@end