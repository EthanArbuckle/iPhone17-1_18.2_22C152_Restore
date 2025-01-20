@interface TVAppRemovalService
- (BOOL)_anyDownloadsExistAtPaths:(id)a3;
- (void)_clearPreferencesForApplicationID:(id)a3;
- (void)removeAppWithReply:(id)a3;
@end

@implementation TVAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  id v4 = a3;
  NSLog(@"Running app removal...");
  v5 = +[NSBundle mainBundle];
  id v6 = [v5 bundleIdentifier];
  [v6 UTF8String];

  v7 = (void *)tcc_identity_create();
  v8 = dispatch_group_create();
  NSLog(@"Invalidating playback keys and listening for secure invalidation complete notification");
  dispatch_group_enter(v8);
  v9 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification;
  v11 = +[NSOperationQueue currentQueue];
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100002AE0;
  v90[3] = &unk_100004288;
  v12 = v8;
  v91 = v12;
  id v13 = [v9 addObserverForName:v10 object:0 queue:v11 usingBlock:v90];

  +[VUIMediaLibraryManager setDeleteAllVideosAndKeysOnInitializationForAppRemoval:1];
  id v14 = +[VUIMediaLibraryManager defaultManager];
  v15 = &CFPreferencesCopyKeyList_ptr;
  +[MPMediaQuery setFilteringDisabled:1];
  id v16 = objc_alloc((Class)MPMediaLibrary);
  v17 = +[ICUserIdentity autoupdatingActiveAccount];
  id v18 = [v16 initWithClientIdentity:v7 userIdentity:v17];

  v19 = +[ISNetworkObserver sharedInstance];
  LOBYTE(v16) = +[ISNetworkObserver isLikelyToReachRemoteServerWithReachabilityFlags:](ISNetworkObserver, "isLikelyToReachRemoteServerWithReachabilityFlags:", [v19 networkReachabilityFlags]);

  NSLog(@"Process rentals...");
  v20 = &CFPreferencesCopyKeyList_ptr;
  if (v16)
  {
    id v21 = objc_alloc_init((Class)MPMediaQuery);
    v22 = +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_100004588);
    [v21 addFilterPredicate:v22];

    v23 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyIsRental];
    [v21 addFilterPredicate:v23];

    +[NSDate timeIntervalSinceReferenceDate];
    v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v25 = +[MPMediaPropertyPredicate predicateWithValue:v24 forProperty:MPMediaItemPropertyRentalExpirationDate comparisonType:101];
    [v21 addFilterPredicate:v25];

    NSLog(@"Rental count... %lu", [v21 _countOfItems]);
    if ([v21 _hasItems])
    {
      id v69 = v18;
      id v70 = v4;
      v71 = self;
      v73 = v12;
      v75 = v7;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v68 = v21;
      v26 = [v21 items];
      id v27 = [v26 countByEnumeratingWithState:&v86 objects:v95 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v87;
        uint64_t v30 = MPMediaItemPropertyStoreAccountID;
        uint64_t v31 = MPMediaItemPropertyStoreRentalID;
        uint64_t v77 = MPMediaItemPropertyStoreRentalID;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v87 != v29) {
              objc_enumerationMutation(v26);
            }
            v33 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            v34 = [v33 valueForProperty:v30];
            v35 = [v33 valueForProperty:v31];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v36 = v29;
                id v37 = v35;
                uint64_t v38 = v30;
                v39 = v26;
                id v40 = v34;
                id v41 = [objc_alloc((Class)SSRentalCheckinRequest) initWithAccountIdentifier:v40 rentalKeyIdentifier:v37];

                uint64_t v29 = v36;
                dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
                v84[0] = _NSConcreteStackBlock;
                v84[1] = 3221225472;
                v84[2] = sub_100002B20;
                v84[3] = &unk_1000042B0;
                dispatch_semaphore_t v85 = v42;
                v43 = v42;
                [v41 startWithConnectionResponseBlock:v84];
                dispatch_time_t v44 = dispatch_time(0, 3000000000);
                dispatch_semaphore_wait(v43, v44);

                v26 = v39;
                uint64_t v30 = v38;
                uint64_t v31 = v77;
              }
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v86 objects:v95 count:16];
        }
        while (v28);
      }

      v12 = v73;
      v7 = v75;
      id v18 = v69;
      id v4 = v70;
      self = v71;
      v15 = &CFPreferencesCopyKeyList_ptr;
      v20 = &CFPreferencesCopyKeyList_ptr;
      id v21 = v68;
    }

    v45 = MPMediaItemPropertyMediaType;
  }
  else
  {
    v45 = MPMediaItemPropertyMediaType;
  }
  NSLog(@"Process content for deletion...");
  id v46 = objc_alloc_init((Class)v15[57]);
  v47 = [v20[56] predicateWithValue:&off_100004588 forProperty:v45];
  [v46 addFilterPredicate:v47];

  v48 = [v20[56] predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  v94[0] = v48;
  v49 = [v20[56] predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyIsLocal];
  v94[1] = v49;
  v50 = +[NSArray arrayWithObjects:v94 count:2];
  v51 = +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:v50];
  [v46 addFilterPredicate:v51];

  if ([v46 _hasItems])
  {
    v74 = v12;
    v76 = v7;
    v52 = v18;
    v72 = self;
    id v53 = v4;
    id v54 = objc_alloc_init((Class)NSMutableArray);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v55 = [v46 items];
    id v56 = [v55 countByEnumeratingWithState:&v80 objects:v93 count:16];
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v81;
      uint64_t v59 = MPMediaItemPropertyFilePath;
      do
      {
        for (j = 0; j != v57; j = (char *)j + 1)
        {
          if (*(void *)v81 != v58) {
            objc_enumerationMutation(v55);
          }
          v61 = [*(id *)(*((void *)&v80 + 1) + 8 * (void)j) valueForProperty:v59];
          if ([v61 length]) {
            [v54 addObject:v61];
          }
        }
        id v57 = [v55 countByEnumeratingWithState:&v80 objects:v93 count:16];
      }
      while (v57);
    }

    v62 = [v46 items];
    id v18 = v52;
    [v52 removeItems:v62];

    id v4 = v53;
    self = v72;
    v12 = v74;
    v7 = v76;
    if ([v54 count])
    {
      do
      {
        NSLog(@"Waiting for downloads to be deleted");
        sleep(1u);
      }
      while ([(TVAppRemovalService *)v72 _anyDownloadsExistAtPaths:v54]);
      NSLog(@"Done waiting for downloads to be deleted");
    }
  }
  [(TVAppRemovalService *)self _clearPreferencesForApplicationID:@"com.apple.videos"];
  [(TVAppRemovalService *)self _clearPreferencesForApplicationID:@"com.apple.videos-preferences"];
  CFPreferencesSetAppValue(@"VideosShowCloudMediaEnabledSetting", kCFBooleanTrue, @"com.apple.mobileipod");
  CFPreferencesSetAppValue(@"VideosAllowHDREnabledSetting", 0, @"com.apple.mobileipod");
  id v63 = objc_alloc((Class)SSDownloadManager);
  v92[0] = SSDownloadKindMovie;
  v92[1] = SSDownloadKindTelevisionEpisode;
  v64 = +[NSArray arrayWithObjects:v92 count:2];
  id v65 = [v63 initWithDownloadKinds:v64];

  v66 = [v65 downloads];
  NSLog(@"Cancel downloads if needed...");
  if ([v66 count]) {
    [v65 cancelDownloads:v66 completionBlock:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002B28;
  block[3] = &unk_1000042D8;
  id v79 = v4;
  id v67 = v4;
  dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_clearPreferencesForApplicationID:(id)a3
{
  applicationID = (__CFString *)a3;
  CFArrayRef v3 = CFPreferencesCopyKeyList(applicationID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if ([(__CFArray *)v3 count]) {
    CFPreferencesSetMultiple(0, v3, applicationID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
}

- (BOOL)_anyDownloadsExistAtPaths:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    CFStringRef v7 = @"NO";
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        NSLog(@"Looking for file at path %@", v9);
        uint64_t v10 = +[NSFileManager defaultManager];
        unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

        if (v11)
        {
          NSLog(@"Found at least one download that still exists at path %@", v9);
          CFStringRef v7 = @"YES";
          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = 0;
    CFStringRef v7 = @"NO";
  }
LABEL_12:

  NSLog(@"Any downloads exist: %@", v7);
  return v12;
}

@end