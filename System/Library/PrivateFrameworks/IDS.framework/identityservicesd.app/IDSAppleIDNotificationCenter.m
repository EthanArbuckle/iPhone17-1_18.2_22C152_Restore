@interface IDSAppleIDNotificationCenter
+ (IDSAppleIDNotificationCenter)sharedInstance;
- (CUTDeferredTaskQueue)processAvailableNotificationsTask;
- (CUTDeferredTaskQueue)processUsageNotificationsTask;
- (IDSAppleIDNotificationCenter)init;
- (id)_localizedServicesAccessStringForDevice:(id)a3 serviceMessage:(id)a4;
- (id)_localizedServicesUsageStringForDevice:(id)a3 useSingular:(BOOL)a4;
- (void)_noteNewAvailableNotification:(id)a3;
- (void)_noteNewUsageNotification:(id)a3;
- (void)_postAvailableNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 serviceTypes:(id)a7 blockMap:(id)a8;
- (void)_postUsageNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 deviceModel:(id)a7 deviceCapabilities:(id)a8 serviceTypes:(id)a9;
- (void)_processAvailableNotifications;
- (void)_processUsageNotifications;
- (void)addAvailableNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 serviceType:(id)a7 completionBlock:(id)a8;
- (void)addUsageNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 hardwareVersion:(id)a7 deviceCapabilities:(id)a8 serviceType:(id)a9;
- (void)reportDailyNotificationMetrics;
@end

@implementation IDSAppleIDNotificationCenter

+ (IDSAppleIDNotificationCenter)sharedInstance
{
  if (qword_100A4AA00 != -1) {
    dispatch_once(&qword_100A4AA00, &stru_100984ED8);
  }
  v2 = (void *)qword_100A4AA08;

  return (IDSAppleIDNotificationCenter *)v2;
}

- (IDSAppleIDNotificationCenter)init
{
  v21.receiver = self;
  v21.super_class = (Class)IDSAppleIDNotificationCenter;
  v2 = [(IDSAppleIDNotificationCenter *)&v21 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    availableNotifications = v2->_availableNotifications;
    v2->_availableNotifications = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    usageNotifications = v2->_usageNotifications;
    v2->_usageNotifications = v5;

    id v7 = objc_alloc((Class)CUTDeferredTaskQueue);
    v8 = im_primary_queue();
    v9 = (CUTDeferredTaskQueue *)[v7 initWithCapacity:1 queue:v8 block:&stru_100984F18];
    processAvailableNotificationsTask = v2->_processAvailableNotificationsTask;
    v2->_processAvailableNotificationsTask = v9;

    id v11 = objc_alloc((Class)CUTDeferredTaskQueue);
    v12 = im_primary_queue();
    v13 = (CUTDeferredTaskQueue *)[v11 initWithCapacity:1 queue:v12 block:&stru_100984F38];
    processUsageNotificationsTask = v2->_processUsageNotificationsTask;
    v2->_processUsageNotificationsTask = v13;

    v15 = [IDSPersistentMap alloc];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v16 = +[NSArray arrayWithObjects:v22 count:2];
    v17 = +[NSSet setWithArray:v16];
    v18 = [(IDSPersistentMap *)v15 initWithIdentifier:@"com.apple.identityservices.dailyDeviceAddedNotificationData" versionNumber:0 decodableClasses:v17 migrationBlock:0];
    dailyMetricsData = v2->_dailyMetricsData;
    v2->_dailyMetricsData = v18;
  }
  return v2;
}

- (void)_postAvailableNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 serviceTypes:(id)a7 blockMap:(id)a8
{
  id v50 = a3;
  id v52 = a4;
  id v13 = a5;
  id v14 = a6;
  id v54 = a7;
  id v49 = a8;
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v16 = v14;
  id obj = v13;
  id v55 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v76;
    uint64_t v48 = kFZAppBundleIdentifier;
    v17 = IMRGLog_ptr;
    v56 = v14;
    do
    {
      for (id i = 0; i != v55; id i = v40 + 1)
      {
        if (*(void *)v76 != v53) {
          objc_enumerationMutation(obj);
        }
        v61 = (char *)i;
        uint64_t v66 = *(void *)(*((void *)&v75 + 1) + 8 * i);
        int IsEmail = IMStringIsEmail();
        id v19 = objc_alloc_init((Class)NSMutableSet);
        id v20 = objc_alloc_init((Class)NSMutableSet);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v21 = v54;
        v22 = (char *)[v21 countByEnumeratingWithState:&v71 objects:v79 count:16];
        if (v22)
        {
          v23 = v22;
          uint64_t v24 = *(void *)v72;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(void *)v72 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = _UIStringForIDSRegistrationServiceType();
              if ([v26 length])
              {
                [v19 addObject:v26];
                v27 = sub_1001BD7EC(v26, v15);
                [v20 addObject:v27];

                v17 = IMRGLog_ptr;
              }
            }
            v23 = (char *)[v21 countByEnumeratingWithState:&v71 objects:v79 count:16];
          }
          while (v23);
        }

        v28 = [v20 allObjects];
        v59 = [v19 allObjects];
        CFStringRef v29 = @"%@";
        if ((unint64_t)[v59 count] >= 2)
        {
          IMLocalizedStringFromTableInBundle();
          CFStringRef v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        v30 = v17[73];
        v31 = objc_msgSend(v28, "__imFirstObject");
        v60 = v28;
        [v28 lastObject];
        v33 = v32 = v17;
        v58 = (__CFString *)v29;
        v65 = objc_msgSend(v30, "stringWithFormat:", v29, v31, v33);

        v64 = IMLocalizedStringFromTableInBundle();
        v63 = IMLocalizedStringFromTableInBundle();
        v34 = IMFormattedDisplayStringForID();
        v62 = [v34 stringWithLTREmbedding];

        v16 = v56;
        if (IsEmail)
        {
          v35 = IMLocalizedStringFromTableInBundle();
          id v36 = [v56 length];
          v37 = v32[73];
          v17 = v32;
          if (v36)
          {
            v38 = IMLocalizedStringFromTableInBundle();
            v47 = v56;
          }
          else
          {
            v38 = IMLocalizedStringFromTableInBundle();
          }
          v41 = objc_msgSend(v37, "stringWithFormat:", v38, v52, v47);
          v40 = v61;
        }
        else
        {
          v38 = +[IDSRegistrationController registeredPhoneNumbers];
          if ([v38 count] && objc_msgSend(v38, "containsObject:", v66))
          {
            v39 = +[IMRGLog registration];
            v40 = v61;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "** This is for my phone, ignoring", buf, 2u);
            }
            v35 = 0;
            v41 = 0;
          }
          else
          {
            v35 = IMLocalizedStringFromTableInBundle();
            v40 = v61;
            if ([v56 length])
            {
              v39 = IMLocalizedStringFromTableInBundle();
              v47 = v56;
            }
            else
            {
              v39 = IMLocalizedStringFromTableInBundle();
            }
            v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v39, v52, v47);
          }

          v17 = IMRGLog_ptr;
        }

        v42 = 0;
        if (v35 && v41)
        {
          v43 = objc_msgSend(v17[73], "stringWithFormat:", v35, v62, v65);
          v42 = +[IMUserNotification userNotificationWithIdentifier:@"ServerAlerts" title:v43 message:v41 defaultButton:v64 alternateButton:0 otherButton:v63];

          if (v42)
          {
            if (!IMGetCachedDomainBoolForKey()
              || (+[IMLockdownManager sharedInstance],
                  v44 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v45 = [v44 isInternalInstall],
                  v44,
                  (v45 & 1) == 0))
            {
              [v42 setRepresentedApplicationBundle:v48];
              v46 = +[IMUserNotificationCenter sharedInstance];
              v67[0] = _NSConcreteStackBlock;
              v67[1] = 3221225472;
              v67[2] = sub_1001BD8A8;
              v67[3] = &unk_100984F60;
              v67[4] = v66;
              id v68 = v50;
              id v69 = v49;
              [v46 addUserNotification:v42 listener:0 completionHandler:v67];
            }
            v16 = v56;
          }
          v17 = IMRGLog_ptr;
        }
      }
      id v55 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v55);
  }
}

- (void)_postUsageNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 deviceModel:(id)a7 deviceCapabilities:(id)a8 serviceTypes:(id)a9
{
  id v81 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a9;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  id v16 = objc_alloc_init((Class)NSMutableArray);
  id v17 = objc_alloc_init((Class)NSMutableArray);
  id v83 = objc_alloc_init((Class)NSMutableArray);
  long long v78 = self;
  v84 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v18 = v12;
  id v19 = [v18 countByEnumeratingWithState:&v90 objects:v97 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v91;
    do
    {
      for (id i = 0; i != v20; id i = (char *)i + 1)
      {
        if (*(void *)v91 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v90 + 1) + 8 * i);
        if (IMStringIsEmail()) {
          uint64_t v24 = v15;
        }
        else {
          uint64_t v24 = v16;
        }
        [v24 addObject:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v90 objects:v97 count:16];
    }
    while (v20);
  }

  v82 = +[IMDeviceSupport marketingNameForModel:v13];
  v79 = v13;
  id v80 = v18;
  if ([v82 isEqualToString:@"Mac"]
    && [v13 rangeOfString:@"Mac"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v25 = [v13 rangeOfString:@"Browser"];

    CFStringRef v26 = @"browser";
    if (v25 == (id)0x7FFFFFFFFFFFFFFFLL) {
      CFStringRef v26 = @"device";
    }
    v82 = (void *)v26;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v27 = v14;
  v28 = (char *)[v27 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v28)
  {
    CFStringRef v29 = v28;
    uint64_t v30 = *(void *)v87;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(void *)v87 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = _UIStringForIDSRegistrationServiceType();
        if ([v32 length]
          && ([v17 containsObject:v32] & 1) == 0
          && (([v32 isEqualToIgnoringCase:@"iMessage"] & 1) != 0
           || [v32 isEqualToIgnoringCase:@"FaceTime"]))
        {
          [v17 addObject:v32];
          v33 = sub_1001BD7EC(v32, v84);
          [v83 addObject:v33];
        }
      }
      CFStringRef v29 = (char *)[v27 countByEnumeratingWithState:&v86 objects:v96 count:16];
    }
    while (v29);
  }

  v34 = v80;
  if (([v15 count] || objc_msgSend(v16, "count")) && objc_msgSend(v17, "count"))
  {
    id v35 = [v15 count];
    id v36 = [v16 count];
    if (v35 || v36)
    {
      IMLocalizedStringFromTableInBundle();
    }
    id v37 = [v17 count];
    if (v37 == (id)3)
    {
      CFStringRef v39 = @"iCloud, iMessage, and FaceTime";
      goto LABEL_47;
    }
    if (v37 == (id)2)
    {
      v40 = [v17 objectAtIndex:0];
      unsigned int v41 = [v40 isEqualToString:@"iCloud"];

      if (v41)
      {
        v42 = v17;
        uint64_t v43 = 1;
      }
      else
      {
        v44 = [v17 objectAtIndex:1];
        unsigned int v45 = [v44 isEqualToString:@"iCloud"];

        if (!v45)
        {
          v46 = [v17 objectAtIndex:0];
          unsigned int v47 = [v46 isEqualToString:@"iMessage"];

          v38 = [v17 objectAtIndex:v47 != 0];
          +[NSString stringWithFormat:@"iMessage and %@", v38];
          goto LABEL_46;
        }
        v42 = v17;
        uint64_t v43 = 0;
      }
      v38 = [v42 objectAtIndex:v43];
      +[NSString stringWithFormat:@"iCloud and %@", v38];
    }
    else
    {
      if (v37 != (id)1)
      {
        CFStringRef v39 = 0;
        goto LABEL_47;
      }
      v38 = [v17 objectAtIndex:0];
      +[NSString stringWithFormat:@"%@", v38];
    }
LABEL_46:
    CFStringRef v39 = (const __CFString *)objc_claimAutoreleasedReturnValue();

LABEL_47:
    uint64_t v48 = [IDSSystemAccountAdapter alloc];
    id v49 = im_primary_queue();
    id v50 = [(IDSSystemAccountAdapter *)v48 initWithQueue:v49];

    id v85 = 0;
    v51 = [(IDSSystemAccountAdapter *)v50 iCloudSystemAccountWithError:&v85];
    id v52 = v85;
    uint64_t v53 = [v51 username];
    long long v74 = v52;
    long long v75 = v50;
    long long v73 = v51;
    long long v77 = (void *)v53;
    if (v81 && v53) {
      [v81 isEqualToString:v53];
    }
    uint64_t v54 = IMLocalizedStringFromTableInBundle();
    uint64_t v55 = IMLocalizedStringFromTableInBundle();
    long long v76 = (__CFString *)v39;
    uint64_t v56 = [(IDSAppleIDNotificationCenter *)v78 _localizedServicesAccessStringForDevice:v82 serviceMessage:v39];
    id v69 = objc_alloc_init((Class)IMWeakLinkClass());
    id v57 = objc_alloc_init((Class)IMWeakLinkClass());
    long long v71 = (void *)v55;
    [v57 setTitle:v55];
    long long v72 = (void *)v54;
    v70 = (void *)v56;
    v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v56, v54);
    [v57 setMessage:v58];

    [v57 setAction:0];
    uint64_t v59 = IDSDailyAccountAddedNotificationMetricTotalKey;
    v60 = [(IDSPersistentMap *)v78->_dailyMetricsData objectForKey:IDSDailyAccountAddedNotificationMetricTotalKey];
    [v60 doubleValue];
    uint64_t v62 = (uint64_t)v61;

    v63 = [(IDSPersistentMap *)v78->_dailyMetricsData objectForKey:IDSDailyAccountAddedNotificationMetricDuplicateKey];
    [v63 doubleValue];

    dailyMetricsData = v78->_dailyMetricsData;
    uint64_t v65 = v62 + 1;
    uint64_t v66 = +[NSNumber numberWithInteger:v62 + 1];
    [(IDSPersistentMap *)dailyMetricsData setObject:v66 forKey:v59];

    v67 = +[IMRGLog registration];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = +[NSNumber numberWithInteger:v65];
      *(_DWORD *)buf = 138412290;
      v95 = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Posting new device notification. Number of notifications posted today: %@", buf, 0xCu);
    }
    [v69 postAccountUserNotificationWith:v57 completion:&stru_100984F80];

    v34 = v80;
  }
}

- (id)_localizedServicesAccessStringForDevice:(id)a3 serviceMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  if (([v5 isEqualToString:@"Mac"] & 1) != 0
    || ([v5 isEqualToString:@"browser"] & 1) != 0)
  {
    CFStringRef v8 = @"A %@ now has access to %@. %%@";
  }
  else
  {
    CFStringRef v8 = @"A %@ now has access to %@. %%@";
    if (([v5 isEqualToString:@"device"] & 1) == 0
      && ![v5 isEqualToString:@"HomePod"])
    {
      CFStringRef v8 = @"An %@ now has access to %@. %%@";
    }
  }
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5, v6);
  v10 = IMLocalizedStringFromTableInBundle();

  return v10;
}

- (id)_localizedServicesUsageStringForDevice:(id)a3 useSingular:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v7 = @"are";
  if (v4) {
    CFStringRef v7 = @"is";
  }
  CFStringRef v8 = +[NSString stringWithFormat:@"Your %%@ %@ now being used for %%@ on a new %@.", v7, v5];

  v9 = IMLocalizedStringFromTableInBundle();

  return v9;
}

- (void)_processAvailableNotifications
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_availableNotifications;
  id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (id i = 0; i != v16; id i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v4 = [v3 sessions];
        id v5 = [v4 allObjects];
        id v6 = [v3 appleID];
        CFStringRef v7 = [v3 aliases];
        CFStringRef v8 = [v7 allObjects];
        v9 = [v3 deviceName];
        v10 = [v3 serviceTypes];
        id v11 = [v10 allObjects];
        id v12 = [v3 sessionToBlockMap];
        [(IDSAppleIDNotificationCenter *)self _postAvailableNotificationForSessions:v5 appleID:v6 aliases:v8 deviceName:v9 serviceTypes:v11 blockMap:v12];
      }
      id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v16);
  }

  [(NSMutableArray *)self->_availableNotifications removeAllObjects];
}

- (void)_processUsageNotifications
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = self->_usageNotifications;
  id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (id i = 0; i != v16; id i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v17 = [v3 sessions];
        BOOL v4 = [v17 allObjects];
        id v5 = [v3 appleID];
        id v6 = [v3 aliases];
        CFStringRef v7 = [v6 allObjects];
        CFStringRef v8 = [v3 deviceName];
        v9 = [v3 deviceModel];
        v10 = [v3 deviceCapabilities];
        id v11 = [v3 serviceTypes];
        id v12 = [v11 allObjects];
        [(IDSAppleIDNotificationCenter *)self _postUsageNotificationForSessions:v4 appleID:v5 aliases:v7 deviceName:v8 deviceModel:v9 deviceCapabilities:v10 serviceTypes:v12];
      }
      id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v16);
  }

  [(NSMutableArray *)self->_usageNotifications removeAllObjects];
}

- (void)_noteNewAvailableNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CUTDeferredTaskQueue *)self->_processAvailableNotificationsTask cancelPendingExecutions];
    [(CUTDeferredTaskQueue *)self->_processAvailableNotificationsTask enqueueExecutionWithTarget:self afterDelay:5.0];
    if (([(NSMutableArray *)self->_availableNotifications containsObjectIdenticalTo:v4] & 1) == 0)[(NSMutableArray *)self->_availableNotifications addObject:v4]; {
  }
    }
}

- (void)_noteNewUsageNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CUTDeferredTaskQueue *)self->_processUsageNotificationsTask cancelPendingExecutions];
    [(CUTDeferredTaskQueue *)self->_processUsageNotificationsTask enqueueExecutionWithTarget:self afterDelay:5.0];
    if (([(NSMutableArray *)self->_usageNotifications containsObjectIdenticalTo:v4] & 1) == 0)[(NSMutableArray *)self->_usageNotifications addObject:v4]; {
  }
    }
}

- (void)addAvailableNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 serviceType:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  long long v20 = +[IDSPairingManager sharedInstance];
  unsigned int v21 = [v20 isCurrentDeviceTinkerConfiguredWatch];

  v22 = +[FTDeviceSupport sharedInstance];
  id v23 = [v22 deviceType];

  if (v23 != (id)6 || v21 != 0)
  {
    id v25 = +[IMLockdownManager sharedInstance];
    unsigned int v26 = [v25 isInternalInstall];

    if (v26 && IMGetDomainBoolForKey())
    {
      _IMWarn();
      goto LABEL_23;
    }
    if (!v16) {
      goto LABEL_23;
    }
    id v40 = v17;
    id v41 = v15;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    CFStringRef v39 = self;
    id v27 = self->_availableNotifications;
    id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v28)
    {
      id v29 = v28;
      id v37 = v18;
      id v38 = v14;
      uint64_t v30 = 0;
      uint64_t v31 = *(void *)v43;
      do
      {
        for (id i = 0; i != v29; id i = (char *)i + 1)
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v34 = [v33 aliases];
          unsigned int v35 = [v34 containsObject:v16];

          if (v35)
          {
            id v36 = v33;

            uint64_t v30 = v36;
          }
        }
        id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v29);

      id v18 = v37;
      id v14 = v38;
      id v17 = v40;
      id v15 = v41;
      if (v30) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v30 = objc_alloc_init(IDSAppleIDNotification);
    [(IDSAppleIDNotification *)v30 setAppleID:v15];
    [(IDSAppleIDNotification *)v30 setDeviceName:v17];
    [(IDSAppleIDNotification *)v30 addAlias:v16];
LABEL_22:
    [(IDSAppleIDNotification *)v30 addServiceType:v18];
    [(IDSAppleIDNotification *)v30 addSession:v14];
    [(IDSAppleIDNotification *)v30 addCompletionBlock:v19 forSession:v14];
    [(IDSAppleIDNotificationCenter *)v39 _noteNewAvailableNotification:v30];
  }
LABEL_23:
}

- (void)addUsageNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 hardwareVersion:(id)a7 deviceCapabilities:(id)a8 serviceType:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v40 = a7;
  id v41 = a8;
  id v19 = a9;
  long long v20 = +[IDSPairingManager sharedInstance];
  unsigned int v21 = [v20 isCurrentDeviceTinkerConfiguredWatch];

  v22 = +[FTDeviceSupport sharedInstance];
  id v23 = [v22 deviceType];

  if (v23 != (id)6 || v21)
  {
    uint64_t v24 = +[IMLockdownManager sharedInstance];
    unsigned int v25 = [v24 isInternalInstall];

    if (v25 && IMGetDomainBoolForKey())
    {
      _IMWarn();
      goto LABEL_20;
    }
    id v38 = self;
    id v39 = v16;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    unsigned int v26 = self->_usageNotifications;
    id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v27)
    {
      id v28 = v27;
      id v36 = v17;
      id v37 = v15;
      id v29 = 0;
      uint64_t v30 = *(void *)v43;
      do
      {
        for (id i = 0; i != v28; id i = (char *)i + 1)
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(v26);
          }
          v32 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v33 = [v32 deviceName];
          unsigned int v34 = [v33 isEqualToString:v18];

          if (v34)
          {
            unsigned int v35 = v32;

            id v29 = v35;
          }
        }
        id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v28);

      id v17 = v36;
      id v15 = v37;
      id v16 = v39;
      if (v29) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v29 = objc_alloc_init(IDSAppleIDNotification);
    [(IDSAppleIDNotification *)v29 setAppleID:v16];
    [(IDSAppleIDNotification *)v29 setDeviceName:v18];
    [(IDSAppleIDNotification *)v29 setDeviceModel:v40];
LABEL_19:
    [(IDSAppleIDNotification *)v29 addAlias:v17];
    [(IDSAppleIDNotification *)v29 addServiceType:v19];
    [(IDSAppleIDNotification *)v29 addSession:v15];
    [(IDSAppleIDNotification *)v29 setDeviceCapabilities:v41];
    [(IDSAppleIDNotificationCenter *)v38 _noteNewUsageNotification:v29];
  }
LABEL_20:
}

- (void)reportDailyNotificationMetrics
{
  id v9 = [(IDSPersistentMap *)self->_dailyMetricsData copyDictionaryRepresentation];
  uint64_t v3 = IDSDailyAccountAddedNotificationMetricTotalKey;
  id v4 = [v9 objectForKey:IDSDailyAccountAddedNotificationMetricTotalKey];
  uint64_t v5 = IDSDailyAccountAddedNotificationMetricDuplicateKey;
  id v6 = [v9 objectForKey:IDSDailyAccountAddedNotificationMetricDuplicateKey];
  id v7 = [objc_alloc((Class)IDSDailyAccountAddedNotificationsMetric) initWithNotificationsPostedToday:v4 duplicateNotificationPostedToday:v6];
  CFStringRef v8 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v8 logMetric:v7];

  [(IDSPersistentMap *)self->_dailyMetricsData setObject:&off_1009D17E8 forKey:v3];
  [(IDSPersistentMap *)self->_dailyMetricsData setObject:&off_1009D17E8 forKey:v5];
}

- (CUTDeferredTaskQueue)processAvailableNotificationsTask
{
  return self->_processAvailableNotificationsTask;
}

- (CUTDeferredTaskQueue)processUsageNotificationsTask
{
  return self->_processUsageNotificationsTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processUsageNotificationsTask, 0);
  objc_storeStrong((id *)&self->_processAvailableNotificationsTask, 0);
  objc_storeStrong((id *)&self->_dailyMetricsData, 0);
  objc_storeStrong((id *)&self->_usageNotifications, 0);

  objc_storeStrong((id *)&self->_availableNotifications, 0);
}

@end