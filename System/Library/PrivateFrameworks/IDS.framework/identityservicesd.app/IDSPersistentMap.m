@interface IDSPersistentMap
+ (id)defaultPersisterForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4;
- (BOOL)allowBackup;
- (BOOL)isLoaded;
- (BOOL)loadAndCheckStatus;
- (IDSPersistentMap)init;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 dataProtectionClass:(int64_t)a6 mergePolicy:(id)a7 migrationBlock:(id)a8;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 mergePolicy:(id)a6 writeCoalescingDelay:(double)a7 writeCoalescingLeeway:(double)a8 persister:(id)a9 migrationBlock:(id)a10 allowBackup:(BOOL)a11;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 migrationBlock:(id)a6;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7;
- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7 allowBackup:(BOOL)a8;
- (IDSPersistentMapDelegate)delegate;
- (IDSPersistentMapMergePolicy)mergePolicy;
- (IDSPersistentMapPersister)persister;
- (NSMutableDictionary)cachedMap;
- (NSSet)decodableClasses;
- (NSString)identifier;
- (OS_dispatch_queue)serialPersistQueue;
- (OS_dispatch_source)saveTimer;
- (double)writeCoalescingDelay;
- (double)writeCoalescingLeeway;
- (id)_decodeMapData:(id)a3;
- (id)_encodeMap:(id)a3;
- (id)_mapByAddingMetadataToMap:(id)a3;
- (id)_mapByStrippingMetadataFromMap:(id)a3;
- (id)_timerIdentifierFromBaseIdentifier:(id)a3;
- (id)allKeys;
- (id)allValues;
- (id)copyDictionaryRepresentation;
- (id)debugDescription;
- (id)initMemoryOnlyWithIdentifier:(id)a3;
- (id)migrationBlock;
- (id)objectForKey:(id)a3;
- (int64_t)_versionNumberForPersistedMap:(id)a3;
- (int64_t)versionNumber;
- (os_unfair_lock_s)lock;
- (unint64_t)mergePolicyType;
- (void)_performCacheModifyingBlock:(id)a3;
- (void)_performCacheReadingBlock:(id)a3;
- (void)_performLockedBlock:(id)a3;
- (void)_save;
- (void)delayedSave;
- (void)persistImmediately;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setDecodableClasses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMergePolicy:(id)a3;
- (void)setMergePolicyType:(unint64_t)a3;
- (void)setMigrationBlock:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setPersister:(id)a3;
- (void)setSaveTimer:(id)a3;
- (void)setSerialPersistQueue:(id)a3;
- (void)setWriteCoalescingDelay:(double)a3;
- (void)setWriteCoalescingLeeway:(double)a3;
@end

@implementation IDSPersistentMap

+ (id)defaultPersisterForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(IDSKeychainWrapper);
  v7 = +[IMSystemMonitor sharedInstance];
  v8 = [[IDSPersistentMapKeychainPersister alloc] initWithIdentifier:v5 keychainWrapper:v6 systemMonitor:v7];
  v9 = [[IDSPersistentMapDiskPersister alloc] initWithIdentifier:v5 dataProtectionClass:a4 keychainWrapper:v6 systemMonitor:v7];

  v10 = [[IDSPersistentMigratingPersister alloc] initWithOriginPersister:v8 destinationPersister:v9];

  return v10;
}

- (IDSPersistentMap)init
{
  v3 = +[NSSet set];
  v4 = [(IDSPersistentMap *)self initWithIdentifier:&stru_10099BE78 versionNumber:0 decodableClasses:v3 dataProtectionClass:0 mergePolicy:0 migrationBlock:&stru_100981918];

  return v4;
}

- (id)initMemoryOnlyWithIdentifier:(id)a3
{
  LOBYTE(v4) = 0;
  return [(IDSPersistentMap *)self initWithIdentifier:a3 versionNumber:0 decodableClasses:0 mergePolicy:0 writeCoalescingDelay:0 writeCoalescingLeeway:0 persister:0.0 migrationBlock:0.0 allowBackup:v4];
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 migrationBlock:(id)a6
{
  return [(IDSPersistentMap *)self initWithIdentifier:a3 versionNumber:a4 decodableClasses:a5 dataProtectionClass:0 mergePolicy:0 migrationBlock:a6];
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7 allowBackup:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(IDSPersistentMap *)self initWithIdentifier:a3 versionNumber:a4 decodableClasses:a5 mergePolicy:0 writeCoalescingDelay:a6 writeCoalescingLeeway:a7 persister:5.0 migrationBlock:1.0 allowBackup:v9];
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 persister:(id)a6 migrationBlock:(id)a7
{
  LOBYTE(v8) = 1;
  return [(IDSPersistentMap *)self initWithIdentifier:a3 versionNumber:a4 decodableClasses:a5 mergePolicy:0 writeCoalescingDelay:a6 writeCoalescingLeeway:a7 persister:5.0 migrationBlock:1.0 allowBackup:v8];
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 dataProtectionClass:(int64_t)a6 mergePolicy:(id)a7 migrationBlock:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a3;
  v18 = [(id)objc_opt_class() defaultPersisterForIdentifier:v17 dataProtectionClass:a6];
  LOBYTE(v21) = 1;
  v19 = [(IDSPersistentMap *)self initWithIdentifier:v17 versionNumber:a4 decodableClasses:v16 mergePolicy:v15 writeCoalescingDelay:v18 writeCoalescingLeeway:v14 persister:5.0 migrationBlock:1.0 allowBackup:v21];

  return v19;
}

- (IDSPersistentMap)initWithIdentifier:(id)a3 versionNumber:(int64_t)a4 decodableClasses:(id)a5 mergePolicy:(id)a6 writeCoalescingDelay:(double)a7 writeCoalescingLeeway:(double)a8 persister:(id)a9 migrationBlock:(id)a10 allowBackup:(BOOL)a11
{
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  id v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)IDSPersistentMap;
  v24 = [(IDSPersistentMap *)&v40 init];
  if (v24)
  {
    v25 = (NSString *)[v19 copy];
    identifier = v24->_identifier;
    v24->_identifier = v25;

    v24->_versionNumber = a4;
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    v27 = +[NSArray arrayWithObjects:v41 count:3];
    uint64_t v28 = [v20 setByAddingObjectsFromArray:v27];
    decodableClasses = v24->_decodableClasses;
    v24->_decodableClasses = (NSSet *)v28;

    v24->_writeCoalescingDelay = a7;
    v24->_writeCoalescingLeeway = a8;
    id v30 = [v23 copy];
    id migrationBlock = v24->_migrationBlock;
    v24->_id migrationBlock = v30;

    objc_storeStrong((id *)&v24->_persister, a9);
    if (v21)
    {
      if ([v21 policy] == (id)2) {
        objc_storeStrong((id *)&v24->_mergePolicy, a6);
      }
      id v32 = [v21 policy];
    }
    else
    {
      id v32 = 0;
    }
    v24->_mergePolicyType = (unint64_t)v32;
    v24->_lock._os_unfair_lock_opaque = 0;
    v33 = +[NSString stringWithFormat:@"com.apple.ids.persistent-map.%@.persist", v19];
    v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v35 = dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_BACKGROUND, 0);

    id v36 = v33;
    dispatch_queue_t v37 = dispatch_queue_create((const char *)[v36 UTF8String], v35);
    serialPersistQueue = v24->_serialPersistQueue;
    v24->_serialPersistQueue = (OS_dispatch_queue *)v37;

    v24->_isLoaded = 0;
    v24->_allowBackup = a11;
  }
  return v24;
}

- (id)debugDescription
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1000D51A4;
  v12 = sub_1000D51B4;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D51BC;
  v7[3] = &unk_100980390;
  v7[4] = self;
  v7[5] = &v8;
  [(IDSPersistentMap *)self _performLockedBlock:v7];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; identifier = %@; cachedMap = %@; persister = %@>",
    v4,
    self,
    self->_identifier,
    v9[5],
  id v5 = self->_persister);

  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)objectForKey:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1000D51A4;
  id v14 = sub_1000D51B4;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D5330;
  v6[3] = &unk_100981940;
  uint64_t v9 = &v10;
  v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(IDSPersistentMap *)v7 _performCacheReadingBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || !v7) {
    sub_10070EE70();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D544C;
  v10[3] = &unk_10097E418;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IDSPersistentMap *)self _performCacheModifyingBlock:v10];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_10070EE9C();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D54FC;
  v6[3] = &unk_10097E440;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(IDSPersistentMap *)self _performCacheModifyingBlock:v6];
}

- (void)_performCacheModifyingBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D559C;
  v4[3] = &unk_1009814F8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(IDSPersistentMap *)v5 _performLockedBlock:v4];
}

- (void)_performCacheReadingBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D57C8;
  v4[3] = &unk_1009814F8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(IDSPersistentMap *)v5 _performLockedBlock:v4];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!v6) {
    sub_10070EEC8();
  }
  id v7 = v6;
  if (v8) {
    [(IDSPersistentMap *)self setObject:v8 forKey:v6];
  }
  else {
    [(IDSPersistentMap *)self removeObjectForKey:v6];
  }
}

- (id)allKeys
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000D51A4;
  id v9 = sub_1000D51B4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D5994;
  v4[3] = &unk_100980390;
  void v4[4] = self;
  v4[5] = &v5;
  [(IDSPersistentMap *)self _performCacheReadingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)allValues
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000D51A4;
  id v9 = sub_1000D51B4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D5AE4;
  v4[3] = &unk_100980390;
  void v4[4] = self;
  v4[5] = &v5;
  [(IDSPersistentMap *)self _performCacheReadingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)removeAllObjects
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000D5BA0;
  v2[3] = &unk_10097E4D0;
  v2[4] = self;
  [(IDSPersistentMap *)self _performCacheModifyingBlock:v2];
}

- (id)copyDictionaryRepresentation
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000D51A4;
  id v9 = sub_1000D51B4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D5C9C;
  v4[3] = &unk_100980390;
  void v4[4] = self;
  v4[5] = &v5;
  [(IDSPersistentMap *)self _performCacheReadingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)loadAndCheckStatus
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_isLoaded)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = identifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading cache with identifier %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v33 = self->_identifier;
    _IDSLogV();
  }
  if ([(IDSPersistentMapPersister *)self->_persister isAvailable])
  {
    id v6 = [(IDSPersistentMapPersister *)self->_persister data];
    uint64_t v7 = [(IDSPersistentMap *)self _decodeMapData:v6];
    int64_t v8 = [(IDSPersistentMap *)self _versionNumberForPersistedMap:v7];
    id v9 = [(IDSPersistentMap *)self _mapByStrippingMetadataFromMap:v7];
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  => Loaded cache has %ld keys", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v34 = [v9 count];
      _IDSLogV();
    }
    if (v8 < self->_versionNumber
      && (id v12 = (void (**)(id, void *, int64_t))self->_migrationBlock) != 0)
    {
      v12[2](v12, v9, v8);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id migrationBlock = self->_migrationBlock;
      self->_id migrationBlock = 0;
    }
    else
    {
      id v13 = objc_msgSend(v9, "mutableCopy", v34);
    }
    unint64_t mergePolicyType = self->_mergePolicyType;
    cachedMap = self->_cachedMap;
    id v19 = self->_mergePolicy;
    id v20 = cachedMap;
    id v21 = v13;
    id v22 = v21;
    if (mergePolicyType == 2)
    {
      id v23 = [(IDSPersistentMapMergePolicy *)v19 processedDictionaryForDisk:v21 andMemory:v20];
    }
    else
    {
      if (mergePolicyType == 1)
      {
        v24 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v21];
        v25 = v24;
        if (v20) {
          [(NSMutableDictionary *)v24 addEntriesFromDictionary:v20];
        }
        goto LABEL_34;
      }
      if (mergePolicyType)
      {
        v25 = 0;
LABEL_34:

        v26 = self->_cachedMap;
        self->_cachedMap = v25;

        mergePolicy = self->_mergePolicy;
        self->_mergePolicy = 0;

        if (!self->_cachedMap)
        {
          uint64_t v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v29 = self->_cachedMap;
          self->_cachedMap = v28;
        }
        [(IDSPersistentMap *)self delayedSave];
        self->_isLoaded = 1;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

        if (WeakRetained)
        {
          *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
          objc_initWeak((id *)buf, self);
          serialPersistQueue = self->_serialPersistQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000D61F0;
          block[3] = &unk_100981968;
          objc_copyWeak(&v36, (id *)buf);
          block[4] = self;
          dispatch_async(serialPersistQueue, block);
          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)buf);
        }

        LOBYTE(v3) = self->_isLoaded;
        return v3;
      }
      if (v21) {
        id v23 = (NSMutableDictionary *)[v21 mutableCopy];
      }
      else {
        id v23 = (NSMutableDictionary *)[(NSMutableDictionary *)v20 mutableCopy];
      }
    }
    v25 = v23;
    goto LABEL_34;
  }
  id v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    persister = self->_persister;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = persister;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "  => Underlying persister %@ is unavailable; not loading!",
      buf,
      0xCu);
  }

  int v3 = os_log_shim_legacy_logging_enabled();
  if (v3)
  {
    int v3 = _IDSShouldLog();
    if (v3)
    {
      _IDSLogV();
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)persistImmediately
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000D62C4;
  v2[3] = &unk_10097E4D0;
  v2[4] = self;
  [(IDSPersistentMap *)self _performLockedBlock:v2];
}

- (void)delayedSave
{
  os_unfair_lock_assert_owner(&self->_lock);
  saveTimer = self->_saveTimer;
  if (saveTimer)
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_writeCoalescingDelay * 1000000000.0));
    uint64_t v5 = (unint64_t)(self->_writeCoalescingLeeway * 1000000000.0);
    dispatch_source_set_timer(saveTimer, v4, 0xFFFFFFFFFFFFFFFFLL, v5);
  }
  else
  {
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_serialPersistQueue);
    uint64_t v7 = self->_saveTimer;
    self->_saveTimer = v6;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, self->_saveTimer);
    int64_t v8 = self->_saveTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000D6750;
    handler[3] = &unk_100981990;
    objc_copyWeak(&v12, &from);
    handler[4] = self;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v8, handler);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    id v9 = self->_saveTimer;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(self->_writeCoalescingDelay * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_writeCoalescingLeeway * 1000000000.0));
    dispatch_activate((dispatch_object_t)self->_saveTimer);
  }
}

- (void)_save
{
  int v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    id v5 = [(NSMutableDictionary *)self->_cachedMap count];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = identifier;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving cache with identifier %@ => Will save cache to disk with %ld keys", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = self->_identifier;
    id v13 = [(NSMutableDictionary *)self->_cachedMap count];
    _IDSLogV();
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v24 = sub_1000D51A4;
  v25 = sub_1000D51B4;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1000D51A4;
  id v19 = sub_1000D51B4;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D6CD0;
  v14[3] = &unk_1009819B8;
  v14[4] = self;
  v14[5] = buf;
  v14[6] = &v15;
  -[IDSPersistentMap _performLockedBlock:](self, "_performLockedBlock:", v14, v11, v13);
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "  => Encoding...", v21, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v7 = [(IDSPersistentMap *)self _encodeMap:v16[5]];
    int64_t v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 length];
      *(_DWORD *)id v21 = 134217984;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "  => Done encoding: %ld bytes", v21, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v12 = [v7 length];
      _IDSLogV();
    }
  }
  else
  {
    dispatch_time_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  => Skipping encoding, empty", v21, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v7 = 0;
  }
  -[IDSPersistentMapPersister saveData:allowBackup:](self->_persister, "saveData:allowBackup:", v7, self->_allowBackup, v12);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(buf, 8);
}

- (id)_decodeMapData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    decodableClasses = self->_decodableClasses;
    v9[0] = 0;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:decodableClasses fromData:v4 error:v9];
    id v7 = v9[0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (id)_encodeMap:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v8 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:0 error:&v8];
    id v5 = v8;
    if (v5)
    {
      id v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error during Decoding %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_timerIdentifierFromBaseIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"com.apple.identityservices.%@", a3];
}

- (id)_mapByAddingMetadataToMap:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:v4 forKey:@"ids-persistent-map"];

  id v6 = [[IDSPersistentMapMetadata alloc] initWithVersionNumber:self->_versionNumber];
  [v5 setObject:v6 forKey:@"ids-persistent-map-metadata"];

  return v5;
}

- (id)_mapByStrippingMetadataFromMap:(id)a3
{
  return [a3 objectForKey:@"ids-persistent-map"];
}

- (int64_t)_versionNumberForPersistedMap:(id)a3
{
  id v3 = [a3 objectForKey:@"ids-persistent-map-metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [v3 versionNumber];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)_performLockedBlock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (IDSPersistentMapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSPersistentMapDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)versionNumber
{
  return self->_versionNumber;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_dispatch_queue)serialPersistQueue
{
  return self->_serialPersistQueue;
}

- (void)setSerialPersistQueue:(id)a3
{
}

- (OS_dispatch_source)saveTimer
{
  return self->_saveTimer;
}

- (void)setSaveTimer:(id)a3
{
}

- (double)writeCoalescingDelay
{
  return self->_writeCoalescingDelay;
}

- (void)setWriteCoalescingDelay:(double)a3
{
  self->_writeCoalescingDelay = a3;
}

- (double)writeCoalescingLeeway
{
  return self->_writeCoalescingLeeway;
}

- (void)setWriteCoalescingLeeway:(double)a3
{
  self->_writeCoalescingLeeway = a3;
}

- (id)migrationBlock
{
  return self->_migrationBlock;
}

- (void)setMigrationBlock:(id)a3
{
}

- (IDSPersistentMapPersister)persister
{
  return self->_persister;
}

- (void)setPersister:(id)a3
{
}

- (NSSet)decodableClasses
{
  return self->_decodableClasses;
}

- (void)setDecodableClasses:(id)a3
{
}

- (NSMutableDictionary)cachedMap
{
  return self->_cachedMap;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (unint64_t)mergePolicyType
{
  return self->_mergePolicyType;
}

- (void)setMergePolicyType:(unint64_t)a3
{
  self->_unint64_t mergePolicyType = a3;
}

- (IDSPersistentMapMergePolicy)mergePolicy
{
  return self->_mergePolicy;
}

- (void)setMergePolicy:(id)a3
{
}

- (BOOL)allowBackup
{
  return self->_allowBackup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergePolicy, 0);
  objc_storeStrong((id *)&self->_cachedMap, 0);
  objc_storeStrong((id *)&self->_decodableClasses, 0);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong(&self->_migrationBlock, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_serialPersistQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end