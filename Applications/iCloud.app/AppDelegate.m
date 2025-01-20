@interface AppDelegate
- (BOOL)_canBeAcceptedOnWatch:(id)a3;
- (BOOL)_handleURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6;
- (BOOL)_shouldLaunchAcceptFlowForShareURL:(id)a3;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)handleUniversalLinkInUserActivity:(id)a3;
- (BOOL)handleUniversalLinkInUserActivity:(id)a3 unitTestOverrides:(id)a4;
- (BOOL)isInitialized;
- (CKContainer)testContainer;
- (NSMutableDictionary)activeVettingURLToVettingAcceptor;
- (NSMutableSet)activeSharingURLs;
- (OS_dispatch_queue)acceptQueue;
- (ShareAcceptor)shareAcceptor;
- (UIWindow)window;
- (id)_decodeURL:(id)a3;
- (void)_acceptShareWithAcceptor:(id)a3;
- (void)_synchronouslyAcceptShareWithAcceptor:(id)a3;
- (void)acceptShareWithMetadata:(id)a3 shareURL:(id)a4;
- (void)acceptShareWithURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6;
- (void)initOnce;
- (void)injectTestTargetContainer:(id)a3;
- (void)setAcceptQueue:(id)a3;
- (void)setActiveSharingURLs:(id)a3;
- (void)setActiveVettingURLToVettingAcceptor:(id)a3;
- (void)setIsInitialized:(BOOL)a3;
- (void)setShareAcceptor:(id)a3;
- (void)setTestContainer:(id)a3;
- (void)setWindow:(id)a3;
- (void)vetURL:(id)a3;
@end

@implementation AppDelegate

- (BOOL)_shouldLaunchAcceptFlowForShareURL:(id)a3
{
  uint64_t v3 = qword_10002A7B0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10002A7B0, &stru_100024BD0);
  }
  v5 = (void *)qword_10002A7B8;
  v6 = [v4 CKURLSlug];

  v7 = [v6 lowercaseString];
  LOBYTE(v5) = [v5 containsObject:v7];

  return (char)v5;
}

- (void)initOnce
{
  v2 = self;
  objc_sync_enter(v2);
  if (![(AppDelegate *)v2 isInitialized])
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v3 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      int v9 = 134217984;
      v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing iCloud sharing AppDelegate: %p", (uint8_t *)&v9, 0xCu);
    }
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cloudkit.sharebear.acceptqueue", v5);
    [(AppDelegate *)v2 setAcceptQueue:v6];

    id v7 = objc_alloc_init((Class)NSMutableSet);
    [(AppDelegate *)v2 setActiveSharingURLs:v7];

    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [(AppDelegate *)v2 setActiveVettingURLToVettingAcceptor:v8];

    [(AppDelegate *)v2 setIsInitialized:1];
  }
  objc_sync_exit(v2);
}

- (void)injectTestTargetContainer:(id)a3
{
  if (__sTestOverridesAvailable) {
    [(AppDelegate *)self setTestContainer:a3];
  }
}

- (OS_dispatch_queue)acceptQueue
{
  [(AppDelegate *)self initOnce];
  acceptQueue = self->_acceptQueue;

  return acceptQueue;
}

- (NSMutableSet)activeSharingURLs
{
  [(AppDelegate *)self initOnce];
  activeSharingURLs = self->_activeSharingURLs;

  return activeSharingURLs;
}

- (NSMutableDictionary)activeVettingURLToVettingAcceptor
{
  [(AppDelegate *)self initOnce];
  activeVettingURLToVettingAcceptor = self->_activeVettingURLToVettingAcceptor;

  return activeVettingURLToVettingAcceptor;
}

- (void)_synchronouslyAcceptShareWithAcceptor:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  dispatch_queue_t v6 = [(AppDelegate *)self acceptQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014AEC;
  v9[3] = &unk_100024C20;
  id v10 = v4;
  dispatch_semaphore_t v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v9);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_acceptShareWithAcceptor:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [v4 url];
  dispatch_queue_t v6 = [(AppDelegate *)self activeSharingURLs];
  unsigned __int8 v7 = [v6 CKSynchronizedAddIfAbsent:v5];

  if (v7)
  {
    id v8 = +[UIApplication sharedApplication];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100015010;
    v24[3] = &unk_100024670;
    id v9 = v4;
    id v25 = v9;
    [v9 setBackgroundTaskID:[v8 beginBackgroundTaskWithName:@"com.apple.cloudkit.ShareBear.handleShareURL" expirationHandler:v24]];

    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v10 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      dispatch_semaphore_t v11 = v10;
      id v12 = [v9 backgroundTaskID];
      *(_DWORD *)buf = 134217984;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Started background task of handling share URL, taskID is %lu", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    v13 = [(AppDelegate *)self acceptQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100015100;
    v18[3] = &unk_100024C98;
    id v19 = v9;
    id v20 = v5;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, (id *)buf);
    dispatch_async(v13, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v16 = [v5 CKURLThroughSlug];
      v17 = [v5 CKPathAfterSlug];
      *(_DWORD *)buf = 138543874;
      id v27 = v16;
      __int16 v28 = 2160;
      uint64_t v29 = 1752392040;
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Sharing URL is already being handled, ignoring: %{public}@%{mask.hash}@", buf, 0x20u);
    }
  }
}

- (void)acceptShareWithURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v15 = [[ShareAcceptor alloc] initWithCloudKitURL:v12 invitationToken:v11 isSourceICS:v6 unitTestOverrides:v10];

  if (__sTestOverridesAvailable)
  {
    v13 = [(AppDelegate *)self testContainer];

    if (v13)
    {
      v14 = [(AppDelegate *)self testContainer];
      [(ShareAcceptor *)v15 setTestTargetContainer:v14];
    }
    [(ShareAcceptor *)v15 setShouldTerminateAfterFetchingMetadata:1];
  }
  [(AppDelegate *)self setShareAcceptor:v15];
  if (__sTestOverridesAvailable) {
    [(AppDelegate *)self _synchronouslyAcceptShareWithAcceptor:v15];
  }
  else {
    [(AppDelegate *)self _acceptShareWithAcceptor:v15];
  }
}

- (void)acceptShareWithMetadata:(id)a3 shareURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ShareAcceptor alloc] initWithShareMetadata:v7 shareURL:v6];

  [(AppDelegate *)self _acceptShareWithAcceptor:v8];
}

- (void)vetURL:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [[VettingAcceptor alloc] initWithCloudKitURL:v4];
  id v6 = [(AppDelegate *)self activeVettingURLToVettingAcceptor];
  unsigned __int8 v7 = [v6 CKSynchronizedSetIfAbsentObject:v5 forKey:v4];

  if (v7)
  {
    id v8 = +[UIApplication sharedApplication];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000159AC;
    v21[3] = &unk_100024670;
    id v9 = v5;
    id v22 = v9;
    -[VettingAcceptor setBackgroundTaskID:](v9, "setBackgroundTaskID:", [v8 beginBackgroundTaskWithName:@"com.apple.cloudkit.ShareBear.handleVettingURL" expirationHandler:v21]);

    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v10 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      id v12 = [(VettingAcceptor *)v9 backgroundTaskID];
      *(_DWORD *)buf = 134217984;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Started background task of handling vetting URL, taskID is %lu", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    v13 = [(AppDelegate *)self acceptQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100015A9C;
    v15[3] = &unk_100024C98;
    v16 = v9;
    objc_copyWeak(&v18, &location);
    id v17 = v4;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_async(v13, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v14 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Vetting URL is already being handled, ignoring: %@", buf, 0xCu);
    }
  }
}

- (BOOL)_handleURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(AppDelegate *)self _shouldLaunchAcceptFlowForShareURL:v10])
  {
    LOBYTE(v13) = 1;
    v14 = +[NSURLComponents componentsWithURL:v10 resolvingAgainstBaseURL:1];
    [v14 setScheme:kCKURLComponentsScheme];
    v15 = [v14 URL];
    [(AppDelegate *)self acceptShareWithURL:v15 invitationToken:v11 isSourceICS:v7 unitTestOverrides:v12];
  }
  else
  {
    v16 = [v10 CKURLSlug];
    unsigned int v13 = [v16 isEqualToString:kCKVettingURLSlug];

    if (v13)
    {
      [(AppDelegate *)self vetURL:v10];
      LOBYTE(v13) = 1;
    }
  }

  return v13;
}

- (BOOL)_canBeAcceptedOnWatch:(id)a3
{
  uint64_t v3 = [a3 CKURLSlug];
  id v4 = [v3 lowercaseString];

  if ([v4 isEqualToString:kCKRemindersShareURLSlug]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:kCKGenericShareURLSlug];
  }

  return v5;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "ShareBear/AppDelegate/openURL", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  [(AppDelegate *)self _handleURL:v9 invitationToken:0 isSourceICS:0 unitTestOverrides:0];
  os_activity_scope_leave(&v13);

  return 1;
}

- (id)_decodeURL:(id)a3
{
  id v32 = a3;
  uint64_t v3 = +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:");
  id v4 = [v3 percentEncodedQuery];
  unsigned __int8 v5 = [v4 componentsSeparatedByString:@"&"];
  if (![v5 count])
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v19 = ck_log_facility_ck;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 138412290;
    id v40 = v32;
    id v20 = "URL %@ does not have any query items. This is probably a stingray share";
    goto LABEL_26;
  }
  uint64_t v29 = v4;
  __int16 v30 = v3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v31 = v5;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    while (2)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)v10) componentsSeparatedByString:@"="];
        if ([v11 count] == (id)2)
        {
          id v12 = [v11 objectAtIndexedSubscript:0];
          os_activity_scope_state_s v13 = [v12 stringByRemovingPercentEncoding];

          v14 = [v11 objectAtIndexedSubscript:1];
          v15 = [v14 stringByRemovingPercentEncoding];

          v16 = [v15 stringByRemovingPercentEncoding];
          if (([v16 isEqualToString:v15] & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            id v17 = ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v32;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Token from URL %@ is doubly encoded", buf, 0xCu);
            }
            id v18 = v16;

            v15 = v18;
          }
          if ([v13 isEqualToString:@"token"])
          {
            id v22 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v15 options:0];
            v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
            id v33 = 0;
            id v21 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v23 fromData:v22 error:&v33];
            id v24 = v33;

            __int16 v28 = v22;
            if (v24)
            {
              id v4 = v29;
              uint64_t v3 = v30;
              if (ck_log_initialization_predicate != -1) {
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              }
              id v25 = ck_log_facility_ck;
              if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v40 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to unarchive device to device invitation token: %@", buf, 0xCu);
              }

              id v21 = 0;
            }
            else
            {
              id v4 = v29;
              uint64_t v3 = v30;
              if (ck_log_initialization_predicate != -1) {
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              }
              v26 = ck_log_facility_ck;
              if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v40 = v32;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Successfully unarchived token from URL: %@", buf, 0xCu);
              }
            }

            unsigned __int8 v5 = v31;
            goto LABEL_39;
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v4 = v29;
  uint64_t v3 = v30;
  id v19 = ck_log_facility_ck;
  unsigned __int8 v5 = v31;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v32;
    id v20 = "Did not get any token from URL %@";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
  }
LABEL_27:
  id v21 = 0;
LABEL_39:

  return v21;
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3
{
  return [(AppDelegate *)self handleUniversalLinkInUserActivity:a3 unitTestOverrides:0];
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3 unitTestOverrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 activityType];
  unsigned __int8 v9 = [v8 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v9)
  {
    id v10 = [v6 webpageURL];
    if (v10)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      uint64_t v29 = _os_activity_create((void *)&_mh_execute_header, "ShareBear/AppDelegate/handleUniversalLinkInUserActivity", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v29, &state);
      id v11 = [(AppDelegate *)self _decodeURL:v10];
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v12 = ck_log_facility_ck;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        os_activity_scope_state_s v13 = v11;
        v14 = [v10 CKURLThroughSlug];
        v15 = [v10 CKPathAfterSlug];
        *(_DWORD *)buf = 138544130;
        id v32 = v14;
        __int16 v33 = 2160;
        uint64_t v34 = 1752392040;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v15;
        __int16 v37 = 2112;
        v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Handler called for CK sharing/vetting URL: %{public}@%{mask.hash}@, invitationToken %@", buf, 0x2Au);

        id v11 = v13;
      }

      v16 = [v6 valueForKey:@"_sourceApplication"];
      id v17 = [v6 valueForKeyPath:@"_originatingProcess.bundleIdentifier"];
      if ([v16 isEqualToString:@"com.apple.InCallService"]) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = (uint64_t)[v17 isEqualToString:@"com.apple.InCallService"];
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v22 = ck_log_facility_ck;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v28 = v11;
        v23 = [v10 CKURLThroughSlug];
        uint64_t v24 = [v10 CKPathAfterSlug];
        id v25 = (void *)v24;
        CFStringRef v26 = @"NO";
        *(_DWORD *)buf = 138544642;
        __int16 v33 = 2160;
        id v32 = v23;
        if (v18) {
          CFStringRef v26 = @"YES";
        }
        uint64_t v34 = 1752392040;
        __int16 v35 = 2112;
        uint64_t v36 = v24;
        __int16 v37 = 2112;
        v38 = v16;
        __int16 v39 = 2112;
        id v40 = v17;
        __int16 v41 = 2112;
        CFStringRef v42 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "URL: %{public}@%{mask.hash}@, sourceApplication %@, bundleID %@, isSourceICS: %@", buf, 0x3Eu);

        id v11 = v28;
      }

      BOOL v20 = [(AppDelegate *)self _handleURL:v10 invitationToken:v11 isSourceICS:v18 unitTestOverrides:v7];
      os_activity_scope_leave(&state);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v21 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unexpected: webpageURL is nil", buf, 2u);
      }
      BOOL v20 = 0;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v19 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "activityType is not NSUserActivityTypeBrowsingWeb - ignoring", buf, 2u);
    }
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return [(AppDelegate *)self handleUniversalLinkInUserActivity:a4];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (void)setAcceptQueue:(id)a3
{
}

- (void)setActiveSharingURLs:(id)a3
{
}

- (void)setActiveVettingURLToVettingAcceptor:(id)a3
{
}

- (ShareAcceptor)shareAcceptor
{
  return self->_shareAcceptor;
}

- (void)setShareAcceptor:(id)a3
{
}

- (CKContainer)testContainer
{
  return self->_testContainer;
}

- (void)setTestContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testContainer, 0);
  objc_storeStrong((id *)&self->_shareAcceptor, 0);
  objc_storeStrong((id *)&self->_activeVettingURLToVettingAcceptor, 0);
  objc_storeStrong((id *)&self->_activeSharingURLs, 0);
  objc_storeStrong((id *)&self->_acceptQueue, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end