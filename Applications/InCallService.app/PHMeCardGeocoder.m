@interface PHMeCardGeocoder
- (BOOL)_isNetworkAvailable;
- (BOOL)_unschedulePerformGeocodesWakeTaskIfEarlierThan:(id)a3;
- (BOOL)isActivelyUsing;
- (CNContactStore)contactStore;
- (NSArray)currentValidLocations;
- (NSDate)lastScheduledTime;
- (NSMutableArray)addresses;
- (OS_dispatch_queue)workQueue;
- (PCPersistentTimer)networkPreferencesTimeoutTimer;
- (PHMeCardGeocoder)initWithCall:(id)a3;
- (id)_dateOfOldestAddress;
- (void)_doWork;
- (void)_networkPreferencesLoaded;
- (void)_rebuildAddressArray;
- (void)_saveGeoCache;
- (void)_scheduleLongTermRebuild;
- (void)_scheduleNextGeocode;
- (void)_schedulePerformGeocodesTaskWithStartWakeTime:(id)a3 dropDeadDelay:(int64_t)a4;
- (void)_unscheduleLongTermRebuild;
- (void)dealloc;
- (void)handleCNContactStoreDidChangeNotification:(id)a3;
- (void)scheduleImmediateGeocode;
- (void)scheduleNextGeocode;
- (void)setActivelyUsing:(BOOL)a3;
- (void)setAddresses:(id)a3;
- (void)setLastScheduledTime:(id)a3;
@end

@implementation PHMeCardGeocoder

- (PHMeCardGeocoder)initWithCall:(id)a3
{
  id v4 = a3;
  if (+[EKAlarm areLocationsAvailable])
  {
    v30.receiver = self;
    v30.super_class = (Class)PHMeCardGeocoder;
    v5 = [(PHMeCardGeocoder *)&v30 init];
    if (!v5)
    {
LABEL_15:
      self = v5;
      v23 = self;
      goto LABEL_16;
    }
    v6 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v4];
    v7 = (CNContactStore *)[objc_alloc((Class)CNContactStore) initWithConfiguration:v6];
    contactStore = v5->_contactStore;
    v5->_contactStore = v7;

    dispatch_queue_t v9 = dispatch_queue_create("MPTelephonyManager.MeCardCacheQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v9;

    id v11 = [objc_alloc((Class)NSData) initWithContentsOfFile:@"/var/mobile/Library/Phone/MeCard.geocache"];
    if (!v11)
    {
LABEL_14:
      v24 = +[NSNotificationCenter defaultCenter];
      [v24 addObserver:v5 selector:"handleCNContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
      objc_initWeak((id *)buf, v5);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000966E4;
      block[3] = &unk_1002CDCA8;
      objc_copyWeak(&v28, (id *)buf);
      v27 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);

      goto LABEL_15;
    }
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    id v29 = 0;
    uint64_t v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v11 error:&v29];
    v15 = (NSMutableArray *)v29;
    addresses = v5->_addresses;
    v5->_addresses = (NSMutableArray *)v14;

    v17 = v5->_addresses;
    v18 = sub_1000D5130();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v20 = v5->_addresses;
        *(_DWORD *)buf = 138412290;
        v32 = v20;
        v21 = "Unarchived addresses: %@";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
    }
    else if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v32 = v15;
      v21 = "[WARN] Error unarchiving addresses: %@";
      goto LABEL_12;
    }

    goto LABEL_14;
  }
  v22 = sub_1000D5130();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device type doesn't allow location-based reminders, so +[PHMeCardGeocoder sharedMeCardGeocoder] will return nil", buf, 2u);
  }

  v23 = 0;
LABEL_16:

  return v23;
}

- (void)_networkPreferencesLoaded
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096944;
  block[3] = &unk_1002CD518;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  [(PCPersistentTimer *)self->_networkPreferencesTimeoutTimer invalidate];
  [(PHMeCardGeocoder *)self _unschedulePerformGeocodesWakeTaskIfEarlierThan:0];
  [(PHMeCardGeocoder *)self _unscheduleLongTermRebuild];
  workQueue = self->_workQueue;
  if (workQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100096B40;
    block[3] = &unk_1002CD518;
    void block[4] = self;
    dispatch_sync(workQueue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PHMeCardGeocoder;
  [(PHMeCardGeocoder *)&v6 dealloc];
}

- (BOOL)_isNetworkAvailable
{
  *(void *)&address.sa_data[6] = 0;
  *(void *)&address.sa_len = 528;
  v2 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  if (v2)
  {
    v3 = v2;
    SCNetworkReachabilityFlags flags = 0;
    if (SCNetworkReachabilityGetFlags(v2, &flags))
    {
      id v4 = sub_1000D5130();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SCNetworkReachabilityFlags v9 = flags;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reachability flags: %d", buf, 8u);
      }

      BOOL v5 = (flags >> 1) & 1;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
    CFRelease(v3);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)scheduleImmediateGeocode
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "-scheduleImmediateGeocode", buf, 2u);
  }

  unsigned int v4 = [(PHMeCardGeocoder *)self _isNetworkAvailable];
  BOOL v5 = sub_1000D5130();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network is available...doing work", buf, 2u);
    }

    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100096E88;
    block[3] = &unk_1002CD518;
    void block[4] = self;
    dispatch_async(workQueue, block);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network is not available, deferring work until it is...", buf, 2u);
    }

    [(PHMeCardGeocoder *)self scheduleNextGeocode];
  }
}

- (void)scheduleNextGeocode
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "-scheduleNextGeocode", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096F50;
  block[3] = &unk_1002CD518;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_saveGeoCache
{
  v3 = +[NSFileManager defaultManager];
  [v3 makeDirectoriesInPath:@"/var/mobile/Library/Phone/" mode:509];

  addresses = self->_addresses;
  id v8 = 0;
  BOOL v5 = +[NSKeyedArchiver archivedDataWithRootObject:addresses requiringSecureCoding:1 error:&v8];
  id v6 = v8;
  if (v5)
  {
    [v5 writeToFile:@"/var/mobile/Library/Phone/MeCard.geocache" atomically:1];
  }
  else
  {
    v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001EB498((uint64_t)v6, v7);
    }
  }
}

- (void)_doWork
{
  if (![(PHMeCardGeocoder *)self _isNetworkAvailable])
  {
    v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No network was availble.  Scheduling wake timer.", buf, 2u);
    }

LABEL_22:
    [(PHMeCardGeocoder *)self _scheduleNextGeocode];
    goto LABEL_24;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = self->_addresses;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {

    goto LABEL_24;
  }
  id v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v3);
      }
      SCNetworkReachabilityFlags v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([v9 state] == 2
        || ([v9 nextGeocodeAttempt],
            v10 = objc_claimAutoreleasedReturnValue(),
            [v10 timeIntervalSinceNow],
            double v12 = v11,
            v10,
            v12 > 0.0))
      {
        v13 = sub_1000D5130();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deferring geocode...", buf, 2u);
        }

        char v6 = 1;
      }
      else
      {
        uint64_t v14 = sub_1000D5130();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempting geocode...", buf, 2u);
        }

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000972C0;
        v16[3] = &unk_1002CF988;
        v16[4] = self;
        [v9 attemptGeocodeWithCompletionBlock:v16];
      }
    }
    id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v5);

  if (v6) {
    goto LABEL_22;
  }
LABEL_24:
  [(PHMeCardGeocoder *)self _saveGeoCache];
}

- (BOOL)_unschedulePerformGeocodesWakeTaskIfEarlierThan:(id)a3
{
  id v4 = a3;
  id v5 = [(PHMeCardGeocoder *)self lastScheduledTime];

  if (!v5)
  {
    double v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No existing job, so nothing to unschedule", (uint8_t *)&v15, 2u);
    }

    goto LABEL_12;
  }
  if (!v4)
  {
    id v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unscheduling previous job since nil date was passed in", (uint8_t *)&v15, 2u);
    }
    goto LABEL_11;
  }
  char v6 = [(PHMeCardGeocoder *)self lastScheduledTime];
  id v7 = [v6 compare:v4];

  id v8 = sub_1000D5130();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)1)
  {
    if (v9)
    {
      v10 = [(PHMeCardGeocoder *)self lastScheduledTime];
      int v15 = 138412546;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unscheduling previous job with date %@ since we need to fire at %@ which is earlier", (uint8_t *)&v15, 0x16u);
    }
LABEL_11:

    xpc_activity_unregister("com.apple.MobilePhone.PHMeCardGeocoder.WakeAndDoWork");
LABEL_12:
    [(PHMeCardGeocoder *)self setLastScheduledTime:0];
    BOOL v12 = 1;
    goto LABEL_13;
  }
  if (v9)
  {
    uint64_t v14 = [(PHMeCardGeocoder *)self lastScheduledTime];
    int v15 = 138412546;
    v16 = v14;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Won't unschedule previous job with date %@ since we need to fire at %@ which is later", (uint8_t *)&v15, 0x16u);
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)_schedulePerformGeocodesTaskWithStartWakeTime:(id)a3 dropDeadDelay:(int64_t)a4
{
  id v6 = a3;
  [(PHMeCardGeocoder *)self setLastScheduledTime:v6];
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  [v6 timeIntervalSinceNow];
  double v9 = v8;

  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, (uint64_t)v9);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, a4);
  v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "com.apple.MobilePhone.PHMeCardGeocoder.WakeAndDoWork";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Got background task agent callback for job: %s", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000977E4;
  handler[3] = &unk_1002CF9B0;
  handler[4] = self;
  xpc_activity_register("com.apple.MobilePhone.PHMeCardGeocoder.WakeAndDoWork", v7, handler);
}

- (void)_scheduleNextGeocode
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = self->_addresses;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v4)
  {

LABEL_22:
    -[PHMeCardGeocoder _unschedulePerformGeocodesWakeTaskIfEarlierThan:](self, "_unschedulePerformGeocodesWakeTaskIfEarlierThan:", 0, (void)v23);
    id v7 = 0;
    goto LABEL_32;
  }
  id v5 = v4;
  char v6 = 0;
  id v7 = 0;
  uint64_t v8 = *(void *)v24;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      unsigned __int8 v11 = [v10 checkGeocodeAfterDateForSanity:[v23]];
      BOOL v12 = [v10 nextGeocodeAttempt];
      v13 = v12;
      if (v12)
      {
        if (v7)
        {
          uint64_t v14 = [v7 earlierDate:v12];

          id v7 = (id)v14;
        }
        else
        {
          id v7 = v12;
        }
      }
      v6 |= v11;
    }
    id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
  }
  while (v5);

  if (v6)
  {
    int v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updated geocode-after date on one or more addresses, saving", buf, 2u);
    }

    [(PHMeCardGeocoder *)self _saveGeoCache];
  }
  if (!v7) {
    goto LABEL_22;
  }
  v16 = sub_1000D5130();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [v7 timeIntervalSinceNow];
    *(_DWORD *)buf = 138412546;
    id v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Next wake time %@ has time interval since now: %f", buf, 0x16u);
  }

  [v7 timeIntervalSinceNow];
  if (v18 <= 3600.0)
  {
    [v7 timeIntervalSinceNow];
    if (v20 <= 0.0)
    {
      if ([(PHMeCardGeocoder *)self _isNetworkAvailable])
      {
        uint64_t v21 = +[NSDate date];

        uint64_t v19 = 1800;
        id v7 = (id)v21;
      }
      else
      {
        uint64_t v19 = 21600;
      }
    }
    else
    {
      uint64_t v19 = 300;
    }
  }
  else
  {
    uint64_t v19 = 3600;
  }
  v22 = sub_1000D5130();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Scheduling next wake time between %@ and %lld seconds laster", buf, 0x16u);
  }

  if ([(PHMeCardGeocoder *)self _unschedulePerformGeocodesWakeTaskIfEarlierThan:v7])
  {
    [(PHMeCardGeocoder *)self _schedulePerformGeocodesTaskWithStartWakeTime:v7 dropDeadDelay:v19];
  }
LABEL_32:
}

- (void)_unscheduleLongTermRebuild
{
}

- (id)_dateOfOldestAddress
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_addresses;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v3)
  {

LABEL_14:
    id v5 = +[NSDate date];
    goto LABEL_15;
  }
  id v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v13;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) lastGeocodeAttempt:v12];
      double v9 = v8;
      if (v5)
      {
        uint64_t v10 = [v8 earlierDate:v5];

        id v5 = (void *)v10;
      }
      else
      {
        id v5 = v8;
      }
    }
    id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (void)_scheduleLongTermRebuild
{
  [(PHMeCardGeocoder *)self _unscheduleLongTermRebuild];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  id v4 = [(PHMeCardGeocoder *)self _dateOfOldestAddress];
  id v5 = [v4 dateByAddingTimeInterval:2592000.0];

  uint64_t v6 = +[NSDate date];
  if ([v5 compare:v6] == (id)-1)
  {
    uint64_t v7 = [v6 dateByAddingTimeInterval:86400.0];

    id v5 = (void *)v7;
  }
  [v5 timeIntervalSinceNow];
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, (uint64_t)v8);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, 147600);
  double v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scheduling a wake-and-rebuild for at %@ with a one day grace period", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100097F2C;
  handler[3] = &unk_1002CF9B0;
  handler[4] = self;
  xpc_activity_register("com.apple.MobilePhone.PHMeCardGeocoder.RebuildEverything", v3, handler);
}

- (void)_rebuildAddressArray
{
  xpc_object_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Rebuilding me card cache...", buf, 2u);
  }

  if (!self->_addresses)
  {
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    addresses = self->_addresses;
    self->_addresses = v4;
  }
  v41 = (_PHMeCardGeocoderAddress *)[objc_alloc((Class)NSMutableArray) initWithArray:self->_addresses];
  uint64_t v6 = [(PHMeCardGeocoder *)self contactStore];
  uint64_t v7 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v66[0] = v7;
  v66[1] = CNContactPostalAddressesKey;
  v66[2] = CNContactTypeKey;
  double v8 = +[NSArray arrayWithObjects:v66 count:3];
  id v60 = 0;
  [v6 _ios_meContactWithKeysToFetch:v8 error:&v60];
  double v9 = (_PHMeCardGeocoderAddress *)objc_claimAutoreleasedReturnValue();
  id v10 = v60;

  obj = sub_1000D5130();
  BOOL v11 = os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT);
  long long v12 = "RIncomingCallTextViewAdapterWrapper\"";
  v43 = v9;
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v65 = v9;
      _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_DEFAULT, "Found Me contact card %@.", buf, 0xCu);
    }

    [(_PHMeCardGeocoderAddress *)v9 postalAddresses];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obj = long long v59 = 0u;
    id v46 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v46)
    {
      id v40 = v10;
      uint64_t v45 = *(void *)v57;
      v44 = self;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v57 != v45) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(_PHMeCardGeocoderAddress **)(*((void *)&v56 + 1) + 8 * (void)v13);
          long long v15 = sub_1000D5130();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Considering postal address labeled value %@.", buf, 0xCu);
          }

          v16 = [(_PHMeCardGeocoderAddress *)v14 label];
          if (([v16 isEqualToString:CNLabelHome] & 1) != 0
            || [v16 isEqualToString:CNLabelWork])
          {
            v47 = v16;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            uint64_t v17 = self->_addresses;
            id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v52 objects:v62 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v53;
LABEL_19:
              uint64_t v21 = 0;
              while (1)
              {
                if (*(void *)v53 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = *(_PHMeCardGeocoderAddress **)(*((void *)&v52 + 1) + 8 * v21);
                long long v23 = [(_PHMeCardGeocoderAddress *)v22 labeledValue];
                long long v24 = [v23 value];

                long long v25 = [(_PHMeCardGeocoderAddress *)v14 value];
                unsigned int v26 = [v24 isEqual:v25];

                if (v26) {
                  break;
                }

                if (v19 == (id)++v21)
                {
                  id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v52 objects:v62 count:16];
                  if (v19) {
                    goto LABEL_19;
                  }
                  goto LABEL_30;
                }
              }
              if ([(_PHMeCardGeocoderAddress *)v22 expired])
              {
                v27 = sub_1000D5130();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Existing address is expired, ignoring: %@", buf, 0xCu);
                }

                goto LABEL_30;
              }
              id v28 = v22;

              if (!v28) {
                goto LABEL_31;
              }
              v31 = sub_1000D5130();
              v16 = v47;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v65 = v28;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Found existing address, repurposing: %@", buf, 0xCu);
              }

              [(_PHMeCardGeocoderAddress *)v41 removeObject:v28];
              self = v44;
            }
            else
            {
LABEL_30:

LABEL_31:
              v16 = v47;
              EKUILabeledDisplayStringForContact();
              id v28 = (_PHMeCardGeocoderAddress *)objc_claimAutoreleasedReturnValue();
              __int16 v29 = [[_PHMeCardGeocoderAddress alloc] initWithLabeledValue:v14 entityID:v28];
              uint64_t v30 = sub_1000D5130();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v65 = v29;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Totally new address encountered, adding: %@", buf, 0xCu);
              }

              self = v44;
              [(NSMutableArray *)v44->_addresses addObject:v29];
            }
          }

          long long v13 = (char *)v13 + 1;
        }
        while (v13 != v46);
        id v32 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
        id v46 = v32;
      }
      while (v32);
      id v10 = v40;
      long long v12 = "@\"PRIncomingCallTextViewAdapterWrapper\"" + 3;
    }
  }
  else if (v11)
  {
    v33 = [(PHMeCardGeocoder *)self contactStore];
    *(_DWORD *)buf = 138412290;
    v65 = v33;
    _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_DEFAULT, "Could not retrieve a Me card using contact store %@.", buf, 0xCu);
  }
  v34 = sub_1000D5130();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v12 + 92);
    v65 = v41;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Removing unused addresses: %@", buf, 0xCu);
  }

  [(NSMutableArray *)self->_addresses removeObjectsInArray:v41];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v35 = v41;
  id v36 = [(_PHMeCardGeocoderAddress *)v35 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v35);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * i) cancelGeocode:v40];
      }
      id v37 = [(_PHMeCardGeocoderAddress *)v35 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v37);
  }

  [(PHMeCardGeocoder *)self _doWork];
  [(PHMeCardGeocoder *)self _scheduleLongTermRebuild];
}

- (NSArray)currentValidLocations
{
  xpc_object_t v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_addresses;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) locationDictionary:(void)v12];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = +[NSArray arrayWithArray:v3];

  return (NSArray *)v10;
}

- (BOOL)isActivelyUsing
{
  v2 = +[_PHMeCardGeocoderPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 isActivelyUsing];

  return v3;
}

- (void)setActivelyUsing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHMeCardGeocoder *)self isActivelyUsing] != a3)
  {
    id v5 = +[_PHMeCardGeocoderPreferences sharedPreferences];
    [v5 setActivelyUsing:v3];

    if (v3)
    {
      id v6 = sub_1000D5130();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Since we're actively using geocoder, scheduling quicker start times for geocoding", buf, 2u);
      }

      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100098928;
      block[3] = &unk_1002CD518;
      void block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    double v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    long long v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }
  double v9 = [(PHMeCardGeocoder *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098C28;
  block[3] = &unk_1002CD518;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (PCPersistentTimer)networkPreferencesTimeoutTimer
{
  return self->_networkPreferencesTimeoutTimer;
}

- (NSDate)lastScheduledTime
{
  return self->_lastScheduledTime;
}

- (void)setLastScheduledTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScheduledTime, 0);
  objc_storeStrong((id *)&self->_networkPreferencesTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end