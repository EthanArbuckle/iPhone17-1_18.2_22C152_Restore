@interface IDSFirewallStore
+ (id)sharedInstance;
- (BOOL)addEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6;
- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4;
- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4 isDonated:(BOOL)a5;
- (BOOL)removeAllEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5;
- (BOOL)removeAllEntriesWithCategory:(unsigned int)a3;
- (BOOL)removeEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6;
- (BOOL)removeEntriesWithCategory:(unsigned int)a3 isDonated:(BOOL)a4;
- (IDSFirewallStore)init;
- (IDSFirewallStore)initWithFilePath:(id)a3;
- (NSMutableDictionary)recentlyBlockedHandles;
- (NSString)filePath;
- (OS_dispatch_queue)ivarQueue;
- (OS_dispatch_source)databaseCloseTimer;
- (double)databaseLastUpdateTime;
- (id)_createFirewallRecordsFromSQLRecords:(__CFArray *)a3;
- (id)blockedEntriesForCategory:(unsigned int)a3;
- (id)getAllAllowedEntriesForCategory:(unsigned int)a3;
- (id)getDonatedAllowedEntriesForCategory:(unsigned int)a3;
- (unint64_t)_currentLocalTime;
- (unint64_t)initialProcessTime;
- (unint64_t)initialServerTime;
- (void)_performInitialHousekeeping;
- (void)_registerSysdiagnoseBlock;
- (void)_runCleanupWithExpirationInterval:(double)a3;
- (void)_setDatabaseCloseTimerOnIvarQueue;
- (void)_startCleanupTimer;
- (void)addToBlockedList:(id)a3 forCategory:(unsigned int)a4;
- (void)closeDatabase;
- (void)runCleanupWithExpirationInterval:(double)a3;
- (void)setDatabaseCloseTimer:(id)a3;
- (void)setDatabaseLastUpdateTime:(double)a3;
- (void)setFilePath:(id)a3;
- (void)setInitialProcessTime:(unint64_t)a3;
- (void)setInitialServerTime:(unint64_t)a3;
- (void)setIvarQueue:(id)a3;
- (void)setRecentlyBlockedHandles:(id)a3;
@end

@implementation IDSFirewallStore

- (void)closeDatabase
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004560;
  v4[3] = &unk_10097E4D0;
  v4[4] = self;
  sub_1000048E8(v4, self->_filePath);
}

+ (id)sharedInstance
{
  if (qword_100A4C9A8 != -1) {
    dispatch_once(&qword_100A4C9A8, &stru_10098C6E0);
  }
  v2 = (void *)qword_100A4C9B0;

  return v2;
}

- (IDSFirewallStore)init
{
  return [(IDSFirewallStore *)self initWithFilePath:0];
}

- (IDSFirewallStore)initWithFilePath:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSFirewallStore;
  v5 = [(IDSFirewallStore *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(IDSFirewallStore *)v5 setFilePath:v4];
    v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS Firewall System Starting Up", v16, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v10 = dispatch_queue_create("IDSFirewallStore", v9);
    ivarQueue = v6->_ivarQueue;
    v6->_ivarQueue = (OS_dispatch_queue *)v10;

    v6->_initialProcessTime = mach_continuous_time();
    [(id)IMWeakLinkClass() serverTime];
    v6->_initialServerTime = (unint64_t)v12;
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    recentlyBlockedHandles = v6->_recentlyBlockedHandles;
    v6->_recentlyBlockedHandles = v13;

    [(IDSFirewallStore *)v6 _performInitialHousekeeping];
    [(IDSFirewallStore *)v6 _startCleanupTimer];
    [(IDSFirewallStore *)v6 _registerSysdiagnoseBlock];
  }
  return v6;
}

- (BOOL)addEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v17 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if ([(IDSFirewallStore *)self isAllowed:v15 category:v7 isDonated:v6])
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1003EF668;
          v23[3] = &unk_10098C708;
          v23[4] = self;
          v23[5] = v15;
          int v24 = v7;
          BOOL v25 = v6;
          sub_1000048E8(v23, self->_filePath);
        }
        else
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1003EF720;
          v18[3] = &unk_10098C730;
          v18[4] = self;
          id v19 = v17;
          uint64_t v20 = v15;
          int v21 = v7;
          BOOL v22 = v6;
          sub_1000048E8(v18, self->_filePath);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  return 1;
}

- (BOOL)removeEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5 isDonated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v10 && [v10 count])
  {
    unsigned int v28 = a5;
    long long v29 = self;
    BOOL v30 = a6;
    id v31 = v11;
    id v12 = objc_alloc_init((Class)NSMutableSet);
    id v13 = objc_alloc_init((Class)NSMutableSet);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v20 = [v19 uri];
          int v21 = [v20 prefixedURI];

          if (v21) {
            [v12 addObject:v21];
          }
          BOOL v22 = [v19 mergeID];

          if (v22)
          {
            v23 = [v19 mergeID];
            [v13 addObject:v23];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v16);
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1003EFAFC;
    v32[3] = &unk_10098C708;
    unsigned int v35 = v28;
    BOOL v36 = v30;
    id v33 = v12;
    id v34 = v13;
    filePath = v29->_filePath;
    id v25 = v13;
    id v26 = v12;
    sub_1000048E8(v32, filePath);

    id v11 = v31;
  }

  return 1;
}

- (BOOL)removeAllEntries:(id)a3 forImpactedServices:(id)a4 category:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 count])
  {
    id v26 = self;
    unsigned int v27 = a5;
    id v28 = v9;
    id v10 = objc_alloc_init((Class)NSMutableSet);
    id v11 = objc_alloc_init((Class)NSMutableSet);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "uri", v26);
          id v19 = [v18 prefixedURI];

          if (v19) {
            [v10 addObject:v19];
          }
          uint64_t v20 = [v17 mergeID];

          if (v20)
          {
            int v21 = [v17 mergeID];
            [v11 addObject:v21];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v14);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1003EFDB8;
    v29[3] = &unk_100980E48;
    unsigned int v32 = v27;
    id v30 = v10;
    id v31 = v11;
    filePath = v26->_filePath;
    id v23 = v11;
    id v24 = v10;
    sub_1000048E8(v29, filePath);

    id v9 = v28;
  }

  return 1;
}

- (BOOL)removeAllEntriesWithCategory:(unsigned int)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003EFE90;
  v4[3] = &unk_1009817F0;
  unsigned int v5 = a3;
  sub_1000048E8(v4, self->_filePath);
  return 1;
}

- (BOOL)removeEntriesWithCategory:(unsigned int)a3 isDonated:(BOOL)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003EFF10;
  v5[3] = &unk_10098C750;
  unsigned int v6 = a3;
  BOOL v7 = a4;
  sub_1000048E8(v5, self->_filePath);
  return 1;
}

- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4 isDonated:(BOOL)a5
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003F0018;
  v11[3] = &unk_10098C778;
  id v13 = &v16;
  id v8 = a3;
  id v12 = v8;
  unsigned int v14 = a4;
  BOOL v15 = a5;
  sub_1000048E8(v11, self->_filePath);
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)isAllowed:(id)a3 category:(unsigned int)a4
{
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003F0200;
  v14[3] = &unk_10098C7A0;
  uint64_t v16 = &v18;
  id v6 = a3;
  id v15 = v6;
  unsigned int v17 = a4;
  sub_1000048E8(v14, self->_filePath);
  if (!*((unsigned char *)v19 + 24))
  {
    BOOL v7 = [v6 mergeID];

    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1003F0264;
      v10[3] = &unk_10098C7A0;
      id v12 = &v18;
      id v11 = v6;
      unsigned int v13 = a4;
      sub_1000048E8(v10, self->_filePath);
    }
  }
  char v8 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)getAllAllowedEntriesForCategory:(unsigned int)a3
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1003F03A8;
  id v11 = sub_1003F03B8;
  id v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003F03C0;
  v5[3] = &unk_10098C7A0;
  unsigned int v6 = a3;
  void v5[4] = self;
  v5[5] = &v7;
  sub_1000048E8(v5, self->_filePath);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (id)getDonatedAllowedEntriesForCategory:(unsigned int)a3
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1003F03A8;
  id v11 = sub_1003F03B8;
  id v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003F0520;
  v5[3] = &unk_10098C7A0;
  unsigned int v6 = a3;
  void v5[4] = self;
  v5[5] = &v7;
  sub_1000048E8(v5, self->_filePath);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (id)blockedEntriesForCategory:(unsigned int)a3
{
  recentlyBlockedHandles = self->_recentlyBlockedHandles;
  id v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  unsigned int v5 = [(NSMutableDictionary *)recentlyBlockedHandles objectForKey:v4];
  unsigned int v6 = v5;
  if (!v5) {
    unsigned int v5 = &__NSArray0__struct;
  }
  id v7 = v5;

  return v7;
}

- (id)_createFirewallRecordsFromSQLRecords:(__CFArray *)a3
{
  id v18 = objc_alloc_init((Class)NSMutableArray);
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    if (Count << 32 >= 1)
    {
      CFIndex v5 = 0;
      uint64_t v19 = (int)Count;
      do
      {
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(a3, v5);
        int v8 = CFArrayGetCount(ValueAtIndex);
        uint64_t v9 = CFArrayGetValueAtIndex(ValueAtIndex, 0);
        id v10 = CFArrayGetValueAtIndex(ValueAtIndex, 1);
        id v11 = CFArrayGetValueAtIndex(ValueAtIndex, 2);
        id v12 = 0;
        if (v8 == 4)
        {
          id v12 = CFArrayGetValueAtIndex(ValueAtIndex, 3);
        }
        id v13 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:v9];
        id v14 = objc_alloc((Class)IDSFirewallEntry);
        [v10 doubleValue];
        id v15 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
        id v16 = [v14 initWithURI:v13 andLastSeenDate:v15];

        if (v16)
        {
          if (v12) {
            [v16 setMergeID:v12];
          }
          objc_msgSend(v16, "setIsDonated:", objc_msgSend(v11, "BOOLValue", v18));
          [v18 addObject:v16];
        }

        ++v5;
      }
      while (v19 != v5);
    }
    CFRelease(a3);
  }

  return v18;
}

- (void)addToBlockedList:(id)a3 forCategory:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  recentlyBlockedHandles = self->_recentlyBlockedHandles;
  id v7 = +[NSNumber numberWithUnsignedInt:v4];
  id v8 = [(NSMutableDictionary *)recentlyBlockedHandles objectForKey:v7];

  if (!v8) {
    id v8 = objc_alloc_init((Class)NSMutableSet);
  }
  [v8 addObject:v11];
  uint64_t v9 = self->_recentlyBlockedHandles;
  id v10 = +[NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)v9 setObject:v8 forKey:v10];
}

- (void)runCleanupWithExpirationInterval:(double)a3
{
}

- (unint64_t)_currentLocalTime
{
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  if (mach_timebase_info(&info))
  {
    id v3 = +[NSDate date];
    [v3 timeIntervalSince1970];
    unint64_t v5 = (unint64_t)v4;
  }
  else
  {
    uint64_t v6 = mach_continuous_time();
    unint64_t v7 = [(IDSFirewallStore *)self initialProcessTime];
    unint64_t v8 = (v6 - v7) * info.numer / info.denom;
    return [(IDSFirewallStore *)self initialServerTime] + v8 / 0x3B9ACA00;
  }
  return v5;
}

- (void)_performInitialHousekeeping
{
}

- (void)_registerSysdiagnoseBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003F0C40;
  v3[3] = &unk_100981DF0;
  objc_copyWeak(&v4, &location);
  v2 = im_primary_queue();
  sub_1003319E8(v3, @"IDS-Firewall-DB", (uint64_t)v2);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_setDatabaseCloseTimerOnIvarQueue
{
  sub_1001C0EB0();
  self->_databaseLastUpdateTime = CFAbsoluteTimeGetCurrent();
  if (!self->_databaseCloseTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_ivarQueue);
    databaseCloseTimer = self->_databaseCloseTimer;
    self->_databaseCloseTimer = v3;

    unint64_t v5 = self->_databaseCloseTimer;
    dispatch_time_t v6 = dispatch_time(0, 0x8BB2C90000);
    dispatch_source_set_timer(v5, v6, 0x7FFFFFFFFFFFFFFFuLL, 0xDF8474CCCuLL);
    unint64_t v7 = self->_databaseCloseTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000C6A4;
    handler[3] = &unk_10097E4D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_databaseCloseTimer);
  }
}

- (void)_startCleanupTimer
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Scheduling Cleanup Timer", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_ivarQueue);
  unint64_t v5 = (void *)qword_100A4C9B8;
  qword_100A4C9B8 = (uint64_t)v4;

  dispatch_time_t v6 = qword_100A4C9B8;
  if (qword_100A4C9B8)
  {
    dispatch_time_t v7 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v6, v7, 0x14F46B04000uLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1003F1230;
    handler[3] = &unk_10097E4D0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)qword_100A4C9B8, handler);
    dispatch_resume((dispatch_object_t)qword_100A4C9B8);
  }
}

- (void)_runCleanupWithExpirationInterval:(double)a3
{
  unint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Scheduling timer called", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003F136C;
  v6[3] = &unk_10097EDD8;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1000048E8(v6, self->_filePath);
}

- (unint64_t)initialProcessTime
{
  return self->_initialProcessTime;
}

- (void)setInitialProcessTime:(unint64_t)a3
{
  self->_initialProcessTime = a3;
}

- (unint64_t)initialServerTime
{
  return self->_initialServerTime;
}

- (void)setInitialServerTime:(unint64_t)a3
{
  self->_initialServerTime = a3;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
}

- (OS_dispatch_source)databaseCloseTimer
{
  return self->_databaseCloseTimer;
}

- (void)setDatabaseCloseTimer:(id)a3
{
}

- (double)databaseLastUpdateTime
{
  return self->_databaseLastUpdateTime;
}

- (void)setDatabaseLastUpdateTime:(double)a3
{
  self->_databaseLastUpdateTime = a3;
}

- (NSMutableDictionary)recentlyBlockedHandles
{
  return self->_recentlyBlockedHandles;
}

- (void)setRecentlyBlockedHandles:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_recentlyBlockedHandles, 0);
  objc_storeStrong((id *)&self->_databaseCloseTimer, 0);

  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

@end