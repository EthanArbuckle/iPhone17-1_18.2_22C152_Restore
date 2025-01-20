@interface IDSOTRKeyStorage
+ (id)sharedInstance;
- (BOOL)__saveStoreForDataProtectionClass:(unsigned int)a3;
- (BOOL)_isUnderFirstDataProtectionLock;
- (BOOL)isSessionStoreAvailableForDataProtectionClass:(unsigned int)a3;
- (BOOL)isUnderLock;
- (IDSOTRKeyStorage)init;
- (id)_objectForKey:(id)a3;
- (id)sessionKeyForToken:(id)a3;
- (void)_daemonWillShutdown:(id)a3;
- (void)_loadIfNeeded;
- (void)_purgeMap;
- (void)_purgeTimerFiredOnMain;
- (void)_removeObjectForKey:(id)a3;
- (void)_save;
- (void)_saveNow;
- (void)_saveTimerFiredOnMain;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)_setPurgeTimer;
- (void)_setSaveTimer;
- (void)dealloc;
- (void)loadStoreForDataProtectionClass:(unsigned int)a3;
- (void)lock;
- (void)removeSessionKeyForAllTokenFromMainQueue;
- (void)removeSessionKeyForToken:(id)a3;
- (void)storeSessionKey:(id)a3 token:(id)a4;
- (void)systemDidEnterDataProtectionLock;
- (void)systemDidLeaveDataProtectionLock;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)unlock;
@end

@implementation IDSOTRKeyStorage

+ (id)sharedInstance
{
  if (qword_100A4C4B8 != -1) {
    dispatch_once(&qword_100A4C4B8, &stru_100987A18);
  }
  v2 = (void *)qword_100A4C4C0;

  return v2;
}

- (BOOL)_isUnderFirstDataProtectionLock
{
  v2 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v3 = [v2 isUnderFirstDataProtectionLock];

  return v3;
}

- (BOOL)isUnderLock
{
  v2 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v3 = [v2 isUnderDataProtectionLock];

  return v3;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  unsigned __int8 v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device first unlocked", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSOTRKeyStorage *)self loadStoreForDataProtectionClass:0];
}

- (void)systemDidLeaveDataProtectionLock
{
  unsigned __int8 v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device unlocked", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_isClassAStoreAvailable)
  {
    if (self->_changedSinceLastSave)
    {
      [(IDSOTRKeyStorage *)self _saveNow];
      v4 = +[NSNotificationCenter defaultCenter];
      v5 = IDSDataProtectionClassStringFromDataProtectionClass();
      v6 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"__kIDSOTRKeyStorageClassKey", 0];
      [v4 postNotificationName:@"__kIDSOTRKeyStorageClassStorageIsAvailableNotification" object:self userInfo:v6];
    }
  }
  else
  {
    [(IDSOTRKeyStorage *)self loadStoreForDataProtectionClass:1];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)systemDidEnterDataProtectionLock
{
  unsigned __int8 v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device locked", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSOTRKeyStorage *)self _saveNow];
}

- (void)_save
{
  [(NSRecursiveLock *)self->_lock lock];
  unsigned __int8 v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving OTR session key store", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  v4 = [(NSMutableDictionary *)self->_sessionKeyStorage allKeys];
  v5 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (!v5)
  {

LABEL_16:
    self->_changedSinceLastSave = 0;
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)v10;
  int v7 = 1;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v4);
      }
      v7 &= [(IDSOTRKeyStorage *)self __saveStoreForDataProtectionClass:IDSDataProtectionClassFromDataProtectionClassString()];
    }
    v5 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  }
  while (v5);

  if (v7) {
    goto LABEL_16;
  }
LABEL_17:
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)__saveStoreForDataProtectionClass:(unsigned int)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  v4 = IDSDataProtectionClassStringFromDataProtectionClass();
  v5 = [(NSMutableDictionary *)self->_sessionKeyStorage objectForKey:v4];
  id v6 = [v5 count];
  if (v6) {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002999D8;
  v15[3] = &unk_100987A40;
  id v7 = v6;
  id v16 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  if ([v7 count])
  {
    v8 = JWEncodeDictionary();
  }
  else
  {
    v8 = 0;
  }
  long long v9 = +[NSString stringWithFormat:@"%@-%@", @"ids-otr-key-storage", v4];
  if (v8) {
    int v10 = IMSetKeychainDataWithProtection();
  }
  else {
    int v10 = IMRemoveKeychainData();
  }
  BOOL v11 = v10;
  long long v12 = +[IMRGLog OTRStore];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    if (v11) {
      CFStringRef v13 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    __int16 v19 = 2112;
    CFStringRef v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Saving OTR session class %@ store (Success: %@)", buf, 0x16u);
  }

  [(NSRecursiveLock *)self->_lock unlock];
  return v11;
}

- (void)_loadIfNeeded
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_sessionKeyStorage)
  {
    uint64_t v3 = 0;
    do
    {
      [(IDSOTRKeyStorage *)self loadStoreForDataProtectionClass:v3];
      uint64_t v3 = (v3 + 1);
    }
    while (v3 != 3);
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)loadStoreForDataProtectionClass:(unsigned int)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  int v30 = 0;
  if (a3 == 1)
  {
    if ([(IDSOTRKeyStorage *)self isUnderLock])
    {
      v5 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is under data protection lock, not loading class A session keys", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
      self->_isClassAStoreAvailable = 0;
      [(NSRecursiveLock *)self->_lock unlock];
      return;
    }
    if (self->_isClassAStoreAvailable)
    {
      id v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Class A store is already loaded ignoring...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
LABEL_67:
      [(NSRecursiveLock *)self->_lock unlock];
      return;
    }
    goto LABEL_25;
  }
  if (a3 == 2)
  {
    if (self->_isClassDStoreAvailable)
    {
      v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Class D store is already loaded ignoring...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      goto LABEL_67;
    }
    int v9 = 0;
    int v8 = 1;
    goto LABEL_26;
  }
  if (a3)
  {
LABEL_25:
    int v8 = 0;
    int v9 = 0;
LABEL_26:
    int v10 = IDSDataProtectionClassStringFromDataProtectionClass();
    uint64_t v29 = 0;
    BOOL v11 = +[NSString stringWithFormat:@"%@-%@", @"ids-otr-key-storage", v10];
    IMGetKeychainData();
    id v12 = 0;

    CFStringRef v13 = JWDecodeDictionary();
    if ([v13 count])
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10029A304;
      v27[3] = &unk_100987A40;
      id v14 = objc_alloc_init((Class)NSMutableDictionary);
      id v28 = v14;
      [v13 enumerateKeysAndObjectsUsingBlock:v27];
      if (!self->_sessionKeyStorage)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        sessionKeyStorage = self->_sessionKeyStorage;
        self->_sessionKeyStorage = Mutable;
      }
      if (v10 && v14)
      {
        [(NSMutableDictionary *)self->_sessionKeyStorage setObject:v14 forKey:v10];
        v17 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v10;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Loaded stored class %@ session store", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v25 = v10;
          _IDSLogV();
        }
      }
      else
      {
        CFStringRef v20 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v14;
          __int16 v33 = 2112;
          v34 = v10;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Missing session key dictionary %@ or data protection string %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          id v25 = v14;
          v26 = v10;
          _IDSLogTransport();
        }
      }
    }
    else
    {
      __int16 v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Did not find class %@ store to load", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v25 = v10;
        _IDSLogV();
      }
    }
    if (((v9 | v8) & 1) != 0 || a3 == 1)
    {
      uint64_t v21 = 72;
      if (v9) {
        uint64_t v21 = 73;
      }
      if (a3 == 1) {
        uint64_t v21 = 74;
      }
      *((unsigned char *)&self->super.isa + v21) = 1;
    }
    v22 = +[NSNotificationCenter defaultCenter];
    v23 = +[NSDictionary dictionaryWithObjectsAndKeys:v10, @"__kIDSOTRKeyStorageClassKey", 0];
    [v22 postNotificationName:@"__kIDSOTRKeyStorageClassStorageIsAvailableNotification" object:self userInfo:v23];

    [(NSRecursiveLock *)self->_lock unlock];
    return;
  }
  if (![(IDSOTRKeyStorage *)self _isUnderFirstDataProtectionLock])
  {
    if (self->_isClassCStoreAvailable)
    {
      v24 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Class C store is already loaded ignoring...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      goto LABEL_67;
    }
    int v8 = 0;
    int v9 = 1;
    goto LABEL_26;
  }
  id v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is under first data protection lock, not loading class C session keys", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  self->_isClassCStoreAvailable = 0;
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)isSessionStoreAvailableForDataProtectionClass:(unsigned int)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSOTRKeyStorage *)self _loadIfNeeded];
  BOOL v5 = a3 <= 2 && *((unsigned char *)&self->super.isa + qword_1007947E8[a3]) != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v5;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_sessionKeyStorage)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sessionKeyStorage = self->_sessionKeyStorage;
    self->_sessionKeyStorage = Mutable;
  }
  int v10 = sub_10029A664(v7);
  if ([v10 length])
  {
    BOOL v11 = +[IDSDServiceController sharedInstance];
    id v12 = [v11 serviceWithPushTopic:v10];
    [v12 dataProtectionClass];

    CFStringRef v13 = IDSDataProtectionClassStringFromDataProtectionClass();
    id v14 = [(NSMutableDictionary *)self->_sessionKeyStorage objectForKey:v13];
    if (!v14) {
      id v14 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    [v14 setObject:v6 forKey:v7];
    [(NSMutableDictionary *)self->_sessionKeyStorage setObject:v14 forKey:v13];
    self->_changedSinceLastSave = 1;
  }
  else
  {
    v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = @"OTRStore";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Missing service in token, can't store session key", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      CFStringRef v16 = @"OTRStore";
      _IDSLogTransport();
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)_objectForKey:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_sessionKeyStorage count])
  {
    BOOL v5 = sub_10029A664(v4);
    if ([v5 length])
    {
      id v6 = +[IDSDServiceController sharedInstance];
      id v7 = [v6 serviceWithPushTopic:v5];
      [v7 dataProtectionClass];

      int v8 = IDSDataProtectionClassStringFromDataProtectionClass();
      int v9 = [(NSMutableDictionary *)self->_sessionKeyStorage objectForKey:v8];
      int v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = [v9 objectForKey:v4];
        *(_DWORD *)buf = 134218242;
        CFStringRef v18 = v11;
        __int16 v19 = 2112;
        CFStringRef v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found session key %p for topic %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v15 = [v9 objectForKey:v4];
        CFStringRef v16 = v5;
        _IDSLogV();
      }
      id v12 = objc_msgSend(v9, "objectForKey:", v4, v15, v16);
    }
    else
    {
      CFStringRef v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v18 = @"OTRStore";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ - Missing service in token, can't retrieve session key", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_removeObjectForKey:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  if ([(NSMutableDictionary *)self->_sessionKeyStorage count])
  {
    BOOL v5 = sub_10029A664(v4);
    if ([v5 length])
    {
      id v6 = +[IDSDServiceController sharedInstance];
      id v7 = [v6 serviceWithPushTopic:v5];
      [v7 dataProtectionClass];

      int v8 = IDSDataProtectionClassStringFromDataProtectionClass();
      int v9 = [(NSMutableDictionary *)self->_sessionKeyStorage objectForKey:v8];
      [v9 removeObjectForKey:v4];
      if (![v9 count]) {
        [(NSMutableDictionary *)self->_sessionKeyStorage removeObjectForKey:v8];
      }
      self->_changedSinceLastSave = 1;
      [(NSRecursiveLock *)self->_lock unlock];
    }
    else
    {
      int v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v13 = @"OTRStore";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ - Missing service in token, can't remove session key", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        CFStringRef v11 = @"OTRStore";
        _IDSLogTransport();
      }
      [(NSRecursiveLock *)self->_lock unlock];
    }
  }
  else
  {
    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (IDSOTRKeyStorage)init
{
  v30.receiver = self;
  v30.super_class = (Class)IDSOTRKeyStorage;
  v2 = [(IDSOTRKeyStorage *)&v30 init];
  if (v2)
  {
    uint64_t v3 = +[IMSystemMonitor sharedInstance];
    [v3 setActive:1];

    id v4 = +[IMSystemMonitor sharedInstance];
    [v4 setWatchesDataProtectionLockState:1];

    BOOL v5 = +[IMSystemMonitor sharedInstance];
    [v5 addListener:v2];

    id v6 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v6;

    v2->_isClassAStoreAvailable = 0;
    *(_WORD *)&v2->_isClassDStoreAvailable = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10029B028;
    v27[3] = &unk_100981000;
    objc_copyWeak(&v28, &location);
    id v8 = [v27 copy];
    id saveCancelBlock = v2->_saveCancelBlock;
    v2->_id saveCancelBlock = v8;

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10029B07C;
    v24[3] = &unk_100981968;
    objc_copyWeak(&v26, &location);
    int v10 = v2;
    id v25 = v10;
    id v11 = [v24 copy];
    id saveEnqueueBlock = v10->_saveEnqueueBlock;
    v10->_id saveEnqueueBlock = v11;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10029B144;
    v22[3] = &unk_100981000;
    objc_copyWeak(&v23, &location);
    id v13 = [v22 copy];
    id purgeCancelBlock = v10->_purgeCancelBlock;
    v10->_id purgeCancelBlock = v13;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10029B198;
    v19[3] = &unk_100981968;
    objc_copyWeak(&v21, &location);
    v15 = v10;
    CFStringRef v20 = v15;
    id v16 = [v19 copy];
    id purgeEnqueueBlock = v15->_purgeEnqueueBlock;
    v15->_id purgeEnqueueBlock = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_saveTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029B2F0;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_purgeTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029B380;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)dealloc
{
  uint64_t v3 = +[IMSystemMonitor sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSOTRKeyStorage;
  [(IDSOTRKeyStorage *)&v4 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)_daemonWillShutdown:(id)a3
{
  if (self->_saveTimer) {
    [(IDSOTRKeyStorage *)self _save];
  }
}

- (id)sessionKeyForToken:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = 0;
    goto LABEL_15;
  }
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSOTRKeyStorage *)self _loadIfNeeded];
  BOOL v5 = [(IDSOTRKeyStorage *)self _objectForKey:v4];
  if (v5)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found session key for token: %@", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No session key for token: %@", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0) {
      goto LABEL_14;
    }
  }
  id v9 = v4;
  _IDSLogV();
LABEL_14:
  [(NSRecursiveLock *)self->_lock unlock];
LABEL_15:

  return v5;
}

- (void)_saveNow
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving now", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v4 = im_primary_queue();
  dispatch_async(v4, self->_saveCancelBlock);

  [(IDSOTRKeyStorage *)self _save];
}

- (void)_setSaveTimer
{
  uint64_t v3 = im_primary_queue();
  dispatch_async(v3, self->_saveEnqueueBlock);
}

- (void)_purgeMap
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "*** Purging OTR session cache", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_setPurgeTimer
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = 0x4072C00000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting purge timer for %f seconds from now", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v4 = im_primary_queue();
  dispatch_async(v4, self->_purgeEnqueueBlock);
}

- (void)storeSessionKey:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Storing session key for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v9 = v7;
      _IDSLogV();
    }
    if (objc_msgSend(v6, "length", v9))
    {
      [(IDSOTRKeyStorage *)self _loadIfNeeded];
      [(NSRecursiveLock *)self->_lock lock];
      [(IDSOTRKeyStorage *)self _setObject:v6 forKey:v7];
      [(NSRecursiveLock *)self->_lock unlock];
      [(IDSOTRKeyStorage *)self _setSaveTimer];
    }
    else
    {
      [(IDSOTRKeyStorage *)self removeSessionKeyForToken:v7];
    }
  }
}

- (void)removeSessionKeyForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing session key for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v6 = v4;
      _IDSLogV();
    }
    [(IDSOTRKeyStorage *)self _loadIfNeeded];
    [(NSRecursiveLock *)self->_lock lock];
    [(IDSOTRKeyStorage *)self _removeObjectForKey:v4];
    [(NSRecursiveLock *)self->_lock unlock];
    [(IDSOTRKeyStorage *)self _setSaveTimer];
  }
}

- (void)removeSessionKeyForAllTokenFromMainQueue
{
  uint64_t v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "removeSessionKeyForAllTokenFromMainQueue", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  [(NSRecursiveLock *)self->_lock lock];
  [(NSMutableDictionary *)self->_sessionKeyStorage removeAllObjects];
  sessionKeyStorage = self->_sessionKeyStorage;
  self->_sessionKeyStorage = 0;

  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up keychain", v10, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v6 = im_primary_queue();
  dispatch_async(v6, self->_saveCancelBlock);

  unsigned int v7 = [(IDSOTRKeyStorage *)self __saveStoreForDataProtectionClass:1];
  unsigned int v8 = [(IDSOTRKeyStorage *)self __saveStoreForDataProtectionClass:0];
  unsigned __int8 v9 = [(IDSOTRKeyStorage *)self __saveStoreForDataProtectionClass:2];
  if (!v7 || !v8 || (v9 & 1) == 0) {
    self->_changedSinceLastSave = 1;
  }
  self->_isClassAStoreAvailable = 0;
  *(_WORD *)&self->_isClassDStoreAvailable = 0;
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purgeEnqueueBlock, 0);
  objc_storeStrong(&self->_purgeCancelBlock, 0);
  objc_storeStrong(&self->_saveEnqueueBlock, 0);
  objc_storeStrong(&self->_saveCancelBlock, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_sessionKeyStorage, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end