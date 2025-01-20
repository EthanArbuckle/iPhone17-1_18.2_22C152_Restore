@interface RemoteNotificationHandler
+ (RemoteNotificationHandler)sharedHandler;
- (APSConnection)apsConnection;
- (OS_dispatch_queue)apsQueue;
- (id)_accountMediaTypes;
- (id)_activeStoreDSIDs;
- (id)_allStoreDSIDs;
- (id)_cloudDSID;
- (id)_storeDSIDsForMediaType:(id)a3 onlyIncludeActive:(BOOL)a4;
- (void)_handleApproverNotification:(id)a3;
- (void)_handleCloudNotificationPayload:(id)a3;
- (void)_handleRequesterNotification:(id)a3 andSuppressDialog:(BOOL)a4;
- (void)_handleStoreNotificationPayload:(id)a3;
- (void)_registerCloudPublicToken:(id)a3;
- (void)_startConnection;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)handleLegacyStoreNotificationPayload:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setApsQueue:(id)a3;
- (void)start;
@end

@implementation RemoteNotificationHandler

+ (RemoteNotificationHandler)sharedHandler
{
  if (qword_100042B10 != -1) {
    dispatch_once(&qword_100042B10, &stru_100038BC8);
  }
  v2 = (void *)qword_100042B18;
  return (RemoteNotificationHandler *)v2;
}

- (void)start
{
  v3 = [(RemoteNotificationHandler *)self apsQueue];

  if (!v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AskPermission.RemoteNotificationHandler", 0);
    [(RemoteNotificationHandler *)self setApsQueue:v4];
  }
  [(RemoteNotificationHandler *)self _startConnection];
}

- (void)handleLegacyStoreNotificationPayload:(id)a3
{
  id v4 = a3;
  v5 = [(RemoteNotificationHandler *)self apsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000151EC;
  v7[3] = &unk_100038668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  id v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[APLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v8 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Received public token", (uint8_t *)&v9, 0xCu);
  }
  if (+[APDefaults APSDevelopmentEnvironment]) {
    [(RemoteNotificationHandler *)self _registerCloudPublicToken:v5];
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(RemoteNotificationHandler *)self apsQueue];
  dispatch_assert_queue_V2(v6);

  v7 = +[APLogConfig sharedDaemonConfig];
  if (!v7)
  {
    v7 = +[APLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v22 = 138543362;
    *(void *)&v22[4] = objc_opt_class();
    id v9 = *(id *)&v22[4];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Received APS notification", v22, 0xCu);
  }
  id v10 = [v5 userInfo];
  if (!v10)
  {
    v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      v13 = +[APLogConfig sharedConfig];
    }
    v14 = objc_msgSend(v13, "OSLogObject", *(_OWORD *)v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      *(_DWORD *)v22 = 138543362;
      *(void *)&v22[4] = v15;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: Notification doesn't contain payload", v22, 0xCu);
    }
    goto LABEL_18;
  }
  v11 = [v5 topic];
  unsigned int v12 = [v11 isEqualToString:@"com.icloud.askpermission"];

  if (!v12)
  {
    v17 = [v5 topic];
    unsigned int v18 = [v17 isEqualToString:@"com.apple.askpermissiond"];

    if (v18)
    {
      [(RemoteNotificationHandler *)self _handleStoreNotificationPayload:v10];
      goto LABEL_19;
    }
    v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      v13 = +[APLogConfig sharedConfig];
    }
    v14 = objc_msgSend(v13, "OSLogObject", *(void *)v22, *(void *)&v22[8]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = [v5 topic];
      *(_DWORD *)v22 = 138543618;
      *(void *)&v22[4] = v19;
      *(_WORD *)&v22[12] = 2114;
      *(void *)&v22[14] = v21;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported notification topic. Topic: %{public}@", v22, 0x16u);
    }
LABEL_18:

    goto LABEL_19;
  }
  [(RemoteNotificationHandler *)self _handleCloudNotificationPayload:v10];
LABEL_19:
}

- (void)_startConnection
{
  v26[0] = @"com.icloud.askpermission";
  v26[1] = @"com.apple.askpermissiond";
  v3 = +[NSArray arrayWithObjects:v26 count:2];
  unsigned int v4 = +[APDefaults APSDevelopmentEnvironment];
  id v5 = (id *)&APSEnvironmentDevelopment;
  if (!v4) {
    id v5 = (id *)&APSEnvironmentProduction;
  }
  id v6 = *v5;
  v7 = [(RemoteNotificationHandler *)self apsConnection];

  if (v7)
  {
    id v8 = [(RemoteNotificationHandler *)self apsConnection];
    [v8 shutdown];
  }
  id v9 = objc_alloc((Class)APSConnection);
  id v10 = [(RemoteNotificationHandler *)self apsQueue];
  id v11 = [v9 initWithEnvironmentName:v6 namedDelegatePort:@"com.apple.aps.askpermission" queue:v10];
  [(RemoteNotificationHandler *)self setApsConnection:v11];

  unsigned int v12 = [(RemoteNotificationHandler *)self apsConnection];
  [v12 _setEnabledTopics:v3];

  v13 = [(RemoteNotificationHandler *)self apsConnection];
  [v13 setDelegate:self];

  v14 = [(RemoteNotificationHandler *)self apsConnection];

  uint64_t v15 = +[APLogConfig sharedDaemonConfig];
  id v16 = (void *)v15;
  if (v14)
  {
    if (!v15)
    {
      id v16 = +[APLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v6;
      id v18 = v23;
      v19 = "%{public}@: Started APS connection succesfully. Environment: %{public}@";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    if (!v15)
    {
      id v16 = +[APLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v6;
      id v18 = v23;
      v19 = "%{public}@: Failed to start APS connection. Environment: %{public}@";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_14;
    }
  }
}

- (void)_handleCloudNotificationPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(RemoteNotificationHandler *)self apsQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[APLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = (id)objc_opt_class();
    id v8 = v26;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking cloud notification", buf, 0xCu);
  }
  id v9 = [(RemoteNotificationHandler *)self _cloudDSID];
  if (v9)
  {
    id v10 = [v4 objectForKeyedSubscript:@"0"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11 && ([v9 isEqualToNumber:v11] & 1) == 0)
    {
      unsigned int v12 = +[APLogConfig sharedDaemonConfig];
      if (!v12)
      {
        unsigned int v12 = +[APLogConfig sharedConfig];
      }
      id v16 = [v12 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v18 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v26 = v18;
        id v19 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Payload request DSID doesn't match cloud DSID", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v15 = [v4 objectForKeyedSubscript:@"8"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v12 = v15;
      }
      else {
        unsigned int v12 = 0;
      }

      if (v12)
      {
        id v16 = [[FamilyRequestTask alloc] initWithDSID:v11];
        v17 = [v16 perform];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100015CEC;
        v22[3] = &unk_100038BF0;
        v22[4] = self;
        id v23 = v12;
        id v24 = v4;
        [v17 resultWithCompletion:v22];
      }
      else
      {
        id v16 = +[APLogConfig sharedDaemonConfig];
        if (!v16)
        {
          id v16 = +[APLogConfig sharedConfig];
        }
        v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v20 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v26 = v20;
          id v21 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Payload doesn't contain request identifier", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    id v11 = +[APLogConfig sharedDaemonConfig];
    if (!v11)
    {
      id v11 = +[APLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v26 = v13;
      id v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: No cloud account", buf, 0xCu);
    }
  }
}

- (void)_handleApproverNotification:(id)a3
{
  id v4 = a3;
  id v5 = [[ApproverRemoteNotificationTask alloc] initWithPayload:v4];

  id v6 = [(ApproverRemoteNotificationTask *)v5 perform];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016040;
  v7[3] = &unk_100038870;
  v7[4] = self;
  [v6 addFinishBlock:v7];
}

- (void)_handleStoreNotificationPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(RemoteNotificationHandler *)self apsQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[APLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = (id)objc_opt_class();
    id v8 = v26;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking store notification", buf, 0xCu);
  }
  id v9 = [(RemoteNotificationHandler *)self _activeStoreDSIDs];
  if ([v9 count])
  {
    id v10 = [v4 objectForKeyedSubscript:@"0"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11 && ([v9 containsObject:v11] & 1) == 0)
    {
      unsigned int v12 = +[APLogConfig sharedDaemonConfig];
      if (!v12)
      {
        unsigned int v12 = +[APLogConfig sharedConfig];
      }
      id v16 = [v12 OSLogObject];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      id v18 = objc_opt_class();
      v17 = v18;
      id v19 = [v11 stringValue];
      *(_DWORD *)buf = 138543618;
      id v26 = v18;
      __int16 v27 = 2112;
      v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Payload request DSID doesn't match store DSIDs: %@", buf, 0x16u);
    }
    else
    {
      uint64_t v15 = [v4 objectForKeyedSubscript:@"8"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v12 = v15;
      }
      else {
        unsigned int v12 = 0;
      }

      if (v12)
      {
        id v16 = [[FamilyRequestTask alloc] initWithDSID:v11];
        v17 = [v16 perform];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100016614;
        v22[3] = &unk_100038C18;
        v22[4] = self;
        id v23 = v4;
        char v24 = 0;
        [v17 resultWithCompletion:v22];
      }
      else
      {
        id v16 = +[APLogConfig sharedDaemonConfig];
        if (!v16)
        {
          id v16 = +[APLogConfig sharedConfig];
        }
        v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v20 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v26 = v20;
          id v21 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Payload doesn't contain request identifier", buf, 0xCu);
        }
      }
    }

LABEL_29:
    goto LABEL_30;
  }
  id v11 = +[APLogConfig sharedDaemonConfig];
  if (!v11)
  {
    id v11 = +[APLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v26 = v13;
    id v14 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: No store accounts", buf, 0xCu);
  }
LABEL_30:
}

- (void)_handleRequesterNotification:(id)a3 andSuppressDialog:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[RequesterRemoteNotificationTask alloc] initWithPayload:v6 andSuppressDialog:v4];

  id v8 = [(RequesterRemoteNotificationTask *)v7 perform];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016954;
  v9[3] = &unk_100038870;
  v9[4] = self;
  [v8 addFinishBlock:v9];
}

- (void)_registerCloudPublicToken:(id)a3
{
  id v4 = a3;
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = (id)objc_opt_class();
    id v7 = v18;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Registering cloud push token", buf, 0xCu);
  }
  id v8 = +[ACAccountStore ams_sharedAccountStore];
  id v9 = objc_msgSend(v8, "ams_activeiCloudAccount");
  if (v9)
  {
    id v10 = [objc_alloc((Class)FARegisterPushTokenRequest) initWithPushToken:v4];
    id v11 = [v9 username];
    [v10 setUsernameOrDSID:v11];

    unsigned int v12 = objc_msgSend(v9, "ams_password");
    [v10 setPasswordOrToken:v12];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100016D50;
    v16[3] = &unk_100038C40;
    v16[4] = self;
    [v10 startRequestWithCompletionHandler:v16];
  }
  else
  {
    id v10 = +[APLogConfig sharedDaemonConfig];
    if (!v10)
    {
      id v10 = +[APLogConfig sharedConfig];
    }
    v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v18 = v14;
      id v15 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Could not register push token, no active iCloud account", buf, 0xCu);
    }
  }
}

- (id)_cloudDSID
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  v3 = objc_msgSend(v2, "ams_activeiCloudAccount");
  id v4 = objc_msgSend(v3, "ams_DSID");

  return v4;
}

- (id)_accountMediaTypes
{
  uint64_t v4 = AMSAccountMediaTypeProduction;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (id)_activeStoreDSIDs
{
  v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[APLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = (id)objc_opt_class();
    id v5 = v20;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Getting ACTIVE Store Accounts", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(RemoteNotificationHandler *)self _accountMediaTypes];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = [(RemoteNotificationHandler *)self _storeDSIDsForMediaType:*(void *)(*((void *)&v14 + 1) + 8 * i) onlyIncludeActive:1];
        [v6 addObjectsFromArray:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_allStoreDSIDs
{
  v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[APLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = (id)objc_opt_class();
    id v5 = v20;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Getting ALL Store Accounts", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(RemoteNotificationHandler *)self _accountMediaTypes];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = [(RemoteNotificationHandler *)self _storeDSIDsForMediaType:*(void *)(*((void *)&v14 + 1) + 8 * i) onlyIncludeActive:0];
        [v6 addObjectsFromArray:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_storeDSIDsForMediaType:(id)a3 onlyIncludeActive:(BOOL)a4
{
  BOOL v30 = a4;
  id v4 = a3;
  id v28 = objc_alloc_init((Class)NSMutableArray);
  id v26 = v4;
  id v5 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v4];
  id v6 = objc_msgSend(v5, "ams_iTunesAccounts");

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v29 = *(void *)v32;
    id v11 = "com.apple.AskPermission";
    *(void *)&long long v9 = 138544130;
    long long v25 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "ams_DSID", v25);
        if (os_variant_has_internal_content())
        {
          long long v15 = +[APLogConfig sharedDaemonConfig];
          if (!v15)
          {
            long long v15 = +[APLogConfig sharedConfig];
          }
          long long v16 = [v15 OSLogObject];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = v10;
            id v18 = v11;
            id v19 = v7;
            id v20 = objc_opt_class();
            id v27 = v20;
            unsigned int v21 = [v13 isActive];
            *(_DWORD *)buf = v25;
            v36 = v20;
            id v7 = v19;
            id v11 = v18;
            id v10 = v17;
            __int16 v37 = 2112;
            v38 = v26;
            __int16 v39 = 2112;
            v40 = v14;
            __int16 v41 = 1024;
            unsigned int v42 = v21;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Store: %@ - DSID: %@ - Active: %d", buf, 0x26u);
          }
        }
        if (!v30)
        {
          if (!v14) {
            goto LABEL_21;
          }
LABEL_20:
          [v28 addObject:v14];
          goto LABEL_21;
        }
        if ([v13 isActive]) {
          BOOL v22 = v14 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22) {
          goto LABEL_20;
        }
LABEL_21:
      }
      id v10 = [v7 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v10);
  }

  id v23 = +[NSArray arrayWithArray:v28];

  return v23;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (OS_dispatch_queue)apsQueue
{
  return self->_apsQueue;
}

- (void)setApsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsQueue, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

@end