@interface IDSCloudKitKeyTransparencyStore
- (BOOL)cachedManateeAvailability;
- (BOOL)initializeKVS;
- (CKContainer)container;
- (CKRecordZone)cachedRecordZone;
- (CUTUnsafePromise)currentDeviceRecordsPromise;
- (IDSCloudKitKeyTransparencyDeviceRecord)lastSuccessfulUpsertDeviceRecord;
- (IDSCloudKitKeyTransparencyStore)initWithContainer:(id)a3 serverBag:(id)a4 kvStore:(id)a5 queue:(id)a6;
- (IDSCloudKitKeyTransparencyStore)initWithQueue:(id)a3;
- (IDSServerBag)serverBag;
- (NSUbiquitousKeyValueStore)kvStore;
- (OS_dispatch_queue)queue;
- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5;
- (id)_cloudKitRecordForDeviceRecord:(id)a3;
- (id)_deviceRecordForCloudKitRecord:(id)a3;
- (id)_no_timeout_no_cache_fetchKeyTransparencyDeviceRecords;
- (id)_recordIDForDeviceRecord:(id)a3;
- (id)_recordType;
- (id)_zoneID;
- (id)database;
- (id)fetchAllEntries;
- (id)fetchEntryForKey:(id)a3;
- (id)forceKVSSync;
- (void)_copyDeviceRecord:(id)a3 toCloudKitRecordRef:(id *)a4;
- (void)_createZoneIfNeededUsingTimeIntervalForRequest:(double)a3 isNonDiscretionary:(BOOL)a4 completion:(id)a5;
- (void)_no_timeout_fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)_no_timeout_nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)_no_timeout_upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6;
- (void)_no_timeout_verifyEncryptionPrerequisitesWithCompletion:(id)a3;
- (void)deleteKeyTransparencyDeviceRecordsForPushToken:(id)a3 completion:(id)a4;
- (void)fetchAccountEligibilityForDeviceToDeviceEncryptionWithCompletion:(id)a3;
- (void)fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)handleKVSUpdate:(id)a3;
- (void)insertDictionary:(id)a3 forKey:(id)a4;
- (void)nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3;
- (void)removeAllEntries;
- (void)removeEntryForKey:(id)a3;
- (void)setCachedManateeAvailability:(BOOL)a3;
- (void)setCachedRecordZone:(id)a3;
- (void)setCurrentDeviceRecordsPromise:(id)a3;
- (void)setKvStore:(id)a3;
- (void)setLastSuccessfulUpsertDeviceRecord:(id)a3;
- (void)setupContainerCache;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6;
@end

@implementation IDSCloudKitKeyTransparencyStore

- (IDSCloudKitKeyTransparencyStore)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v6 = [v5 isUnderFirstDataProtectionLock];

  if (v6)
  {
    v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We are under first data protection lock, we cannot initialize KVS.", v15, 2u);
    }

    v8 = +[TransparencyAnalytics logger];
    v9 = +[NSError errorWithDomain:@"IDSCloudKitKeyTransparencyStoreErrorDomain" code:-5002 userInfo:0];
    [v8 logResultForEvent:@"IDSKTKVSCreationMetric" hardFailure:0 result:v9];

    id v10 = 0;
  }
  else
  {
    id v10 = [objc_alloc((Class)NSUbiquitousKeyValueStore) initWithStoreIdentifier:@"com.apple.private.ids.kt-kvs" type:2];
    v11 = +[TransparencyAnalytics logger];
    [v11 logSuccessForEventNamed:@"IDSKTKVSCreationMetric"];
  }
  v12 = +[IDSServerBag sharedInstanceForBagType:0];
  v13 = [(IDSCloudKitKeyTransparencyStore *)self initWithContainer:0 serverBag:v12 kvStore:v10 queue:v4];

  return v13;
}

- (IDSCloudKitKeyTransparencyStore)initWithContainer:(id)a3 serverBag:(id)a4 kvStore:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IDSCloudKitKeyTransparencyStore;
  v15 = [(IDSCloudKitKeyTransparencyStore *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_container, a3);
    objc_storeStrong((id *)&v16->_serverBag, a4);
    objc_storeStrong((id *)&v16->_kvStore, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
    if (v16->_kvStore)
    {
      v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:v16 selector:"handleKVSUpdate:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:v16->_kvStore];
    }
    v18 = +[IMSystemMonitor sharedInstance];
    [v18 addListener:v16];

    [(IDSCloudKitKeyTransparencyStore *)v16 setupContainerCache];
  }

  return v16;
}

- (CKContainer)container
{
  container = self->_container;
  if (container)
  {
    v3 = container;
  }
  else
  {
    if (qword_100A4A700 != -1) {
      dispatch_once(&qword_100A4A700, &stru_100982FA8);
    }
    id v4 = (void *)qword_100A4A6F8;
    if (!qword_100A4A6F8)
    {
      v5 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_100711750();
      }

      id v4 = (void *)qword_100A4A6F8;
    }
    v3 = [v4 containerWithIdentifier:@"com.apple.private.ids.kt"];
  }

  return v3;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  if (!self->_kvStore)
  {
    v3 = (NSUbiquitousKeyValueStore *)[objc_alloc((Class)NSUbiquitousKeyValueStore) initWithStoreIdentifier:@"com.apple.private.ids.kt-kvs" type:2];
    kvStore = self->_kvStore;
    self->_kvStore = v3;

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"handleKVSUpdate:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:self->_kvStore];
  }
}

- (id)database
{
  v2 = [(IDSCloudKitKeyTransparencyStore *)self container];
  v3 = [v2 privateCloudDatabase];

  return v3;
}

- (id)_zoneID
{
  if (qword_100A4A720 != -1) {
    dispatch_once(&qword_100A4A720, &stru_100982FE8);
  }
  v2 = (void *)qword_100A4A718;
  if (!qword_100A4A718)
  {
    v3 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1007117D4();
    }

    v2 = (void *)qword_100A4A718;
  }
  id v4 = objc_alloc((Class)v2);
  if (qword_100A4A6F0 != -1) {
    dispatch_once(&qword_100A4A6F0, &stru_100982F88);
  }
  id v5 = [v4 initWithZoneName:@"IDSKeyTransparencyDataZone" ownerName:qword_100A4A6E8];

  return v5;
}

- (id)_recordType
{
  return @"IDSKeyTransparencyDeviceRecord";
}

- (id)_recordIDForDeviceRecord:(id)a3
{
  id v4 = a3;
  if (qword_100A4A710 != -1) {
    dispatch_once(&qword_100A4A710, &stru_100982FC8);
  }
  id v5 = (void *)qword_100A4A708;
  if (!qword_100A4A708)
  {
    unsigned __int8 v6 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100711858();
    }

    id v5 = (void *)qword_100A4A708;
  }
  id v7 = objc_alloc((Class)v5);
  v8 = [v4 recordID];
  v9 = [(IDSCloudKitKeyTransparencyStore *)self _zoneID];
  id v10 = [v7 initWithRecordName:v8 zoneID:v9];

  return v10;
}

- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v10 = v9;
    if (v7) {
      [v9 setObject:v7 forKeyedSubscript:NSDebugDescriptionErrorKey];
    }
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:NSUnderlyingErrorKey];
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [objc_alloc((Class)NSError) initWithDomain:@"IDSCloudKitKeyTransparencyStoreErrorDomain" code:a3 userInfo:v10];

  return v11;
}

- (id)_deviceRecordForCloudKitRecord:(id)a3
{
  id v3 = a3;
  id v4 = [v3 encryptedValues];
  id v5 = [v4 objectForKeyedSubscript:@"IDSKTDevice"];

  uint64_t v6 = [v3 objectForKeyedSubscript:@"IDSKTMetadata"];
  unint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    unint64_t v8 = [IDSCloudKitKeyTransparencyDeviceRecord alloc];
    id v9 = [v3 recordID];
    id v10 = [v9 recordName];
    id v11 = [(IDSCloudKitKeyTransparencyDeviceRecord *)v8 initWithDeviceData:v5 deviceMetadata:v7 recordID:v10];
  }
  else
  {
    id v12 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      id v15 = v3;
      __int16 v16 = 2112;
      v17 = v5;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to convert CloudKit record to device record {cloudKitRecord: %@, deviceData: %@, deviceMetadata: %@}", (uint8_t *)&v14, 0x20u);
    }

    id v11 = 0;
  }

  return v11;
}

- (id)_cloudKitRecordForDeviceRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 deviceData];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [v4 deviceMetadata],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    if (qword_100A4A730 != -1) {
      dispatch_once(&qword_100A4A730, &stru_100983008);
    }
    unint64_t v8 = (void *)qword_100A4A728;
    if (!qword_100A4A728)
    {
      id v9 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_100711948();
      }

      unint64_t v8 = (void *)qword_100A4A728;
    }
    id v10 = objc_alloc((Class)v8);
    id v11 = [(IDSCloudKitKeyTransparencyStore *)self _recordType];
    id v12 = [(IDSCloudKitKeyTransparencyStore *)self _recordIDForDeviceRecord:v4];
    id v13 = [v10 initWithRecordType:v11 recordID:v12];

    v22 = v13;
    [(IDSCloudKitKeyTransparencyStore *)self _copyDeviceRecord:v4 toCloudKitRecordRef:&v22];
    int v14 = v22;
  }
  else
  {
    id v13 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1007118DC((uint64_t)v4, v13, v15, v16, v17, v18, v19, v20);
    }
    int v14 = 0;
  }

  return v14;
}

- (void)_copyDeviceRecord:(id)a3 toCloudKitRecordRef:(id *)a4
{
  if (a4)
  {
    id v9 = *a4;
    id v5 = a3;
    uint64_t v6 = [v5 deviceData];
    unint64_t v7 = [v9 encryptedValues];
    [v7 setObject:v6 forKeyedSubscript:@"IDSKTDevice"];

    unint64_t v8 = [v5 deviceMetadata];

    [v9 setObject:v8 forKeyedSubscript:@"IDSKTMetadata"];
    [v9 setObject:&off_1009D10B0 forKeyedSubscript:@"IDSKTState"];
  }
}

- (void)_createZoneIfNeededUsingTimeIntervalForRequest:(double)a3 isNonDiscretionary:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  unint64_t v8 = (void (**)(id, void))a5;
  id v9 = [(IDSCloudKitKeyTransparencyStore *)self cachedRecordZone];

  if (v9)
  {
    id v10 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(IDSCloudKitKeyTransparencyStore *)self cachedRecordZone];
      *(_DWORD *)buf = 138412290;
      id v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cached record zone exists -- continuing without zone fetch {cachedRecordZone: %@}", buf, 0xCu);
    }
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    id v12 = [(IDSCloudKitKeyTransparencyStore *)self _zoneID];
    if (qword_100A4A750 != -1) {
      dispatch_once(&qword_100A4A750, &stru_100983048);
    }
    id v13 = (void *)qword_100A4A748;
    if (!qword_100A4A748)
    {
      int v14 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_1007119CC();
      }

      id v13 = (void *)qword_100A4A748;
    }
    id v15 = objc_alloc((Class)v13);
    v34 = v12;
    uint64_t v16 = +[NSArray arrayWithObjects:&v34 count:1];
    id v17 = [v15 initWithRecordZoneIDs:v16];

    uint64_t v18 = [(IDSCloudKitKeyTransparencyStore *)self container];
    uint64_t v19 = [v17 configuration];
    [v19 setContainer:v18];

    if (v5)
    {
      uint64_t v20 = [v17 configuration];
      [v20 setDiscretionaryNetworkBehavior:0];
    }
    v21 = [v17 configuration];
    [v21 setTimeoutIntervalForRequest:a3];

    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_10011D3F8;
    v28 = &unk_100982B00;
    v29 = self;
    id v22 = v12;
    id v30 = v22;
    BOOL v33 = v5;
    double v32 = a3;
    v31 = v8;
    [v17 setFetchRecordZonesCompletionBlock:&v25];
    v23 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting CloudKit zone fetch {operation: %@}", buf, 0xCu);
    }

    v24 = [(IDSCloudKitKeyTransparencyStore *)self database];
    [v24 addOperation:v17];
  }
}

- (void)setupContainerCache
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10011DCE8;
  v2[3] = &unk_100982B28;
  v2[4] = self;
  [(IDSCloudKitKeyTransparencyStore *)self _no_timeout_verifyEncryptionPrerequisitesWithCompletion:v2];
}

- (void)fetchAccountEligibilityForDeviceToDeviceEncryptionWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Determining account eligibility for device-to-device encryption", buf, 2u);
  }

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  *(void *)buf = 0;
  uint64_t v19 = buf;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10011DFEC;
  id v22 = sub_10011DFFC;
  id v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10011E004;
  v17[3] = &unk_100982BA0;
  v17[4] = self;
  v17[5] = v24;
  v17[6] = buf;
  unint64_t v7 = objc_retainBlock(v17);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011E21C;
  v13[3] = &unk_100982BF0;
  v13[4] = self;
  id v15 = buf;
  id v8 = v4;
  id v14 = v8;
  uint64_t v16 = v24;
  id v9 = objc_retainBlock(v13);
  id v10 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  double v11 = sub_100123044(v10, @"ck-kt-account-timeout", 30.0);

  id v12 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v26 = 134217984;
    double v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting device-to-device encryption eligibility task with timeout {timeoutInSeconds: %f}", v26, 0xCu);
  }

  dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
  im_dispatch_async_with_timeout();

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v24, 8);
}

- (void)_no_timeout_verifyEncryptionPrerequisitesWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting CloudKit container account info fetch", buf, 2u);
  }

  unint64_t v7 = [(IDSCloudKitKeyTransparencyStore *)self container];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10011E538;
  v9[3] = &unk_100982C38;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 accountInfoWithCompletionHandler:v9];
}

- (void)upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v13 = a6;
  id v14 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Upserting trusted device record { deviceRecord: %@ }, { recordsToModify: %@ }, { recordsToDelete: %@ }", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v40 = sub_10011DFEC;
  v41 = sub_10011DFFC;
  id v42 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10011EAC8;
  v32[3] = &unk_100982CB0;
  v32[4] = self;
  id v16 = v10;
  id v33 = v16;
  id v17 = v11;
  id v34 = v17;
  uint64_t v18 = v12;
  v35 = v18;
  id v36 = buf;
  uint64_t v19 = objc_retainBlock(v32);
  char v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  double v27 = sub_10011ECD8;
  v28 = &unk_100982D00;
  v29 = self;
  v31 = buf;
  id v20 = v13;
  id v30 = v20;
  v21 = objc_retainBlock(&v25);
  id v22 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  double v23 = sub_100123044(v22, @"ck-kt-upsert-timeout", 80.0);

  v24 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v37 = 134217984;
    double v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Starting trusted device upsert task with timeout {timeoutInSeconds: %f}", v37, 0xCu);
  }

  dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
  im_dispatch_async_with_timeout();

  _Block_object_dispose(buf, 8);
}

- (void)_no_timeout_upsertKeyTransparencyDeviceRecord:(id)a3 recordsToModify:(id)a4 recordsToDelete:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = [(IDSCloudKitKeyTransparencyStore *)self lastSuccessfulUpsertDeviceRecord];
  unsigned int v16 = [v15 isEqual:v10];

  id v17 = +[IDSFoundationLog KeyTransparency];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Last known successful upsert device record is identical to the current request -- short-circuiting without performing upsert {deviceRecord: %@}", buf, 0xCu);
    }

    if (v13) {
      v13[2](v13, 0);
    }
  }
  else
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Verifying encryption prerequisites for trusted device record upsert", buf, 2u);
    }

    uint64_t v19 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
    double v20 = sub_100123044(v19, @"ck-kt-time-interval-for-requests", 60.0);

    v21 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
    unsigned __int8 v22 = sub_1001230B0(v21, (id)1);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10011F14C;
    v23[3] = &unk_100982DE8;
    double v27 = v13;
    v23[4] = self;
    double v28 = v20;
    unsigned __int8 v29 = v22;
    id v24 = v10;
    id v25 = v11;
    id v26 = v12;
    [(IDSCloudKitKeyTransparencyStore *)self _no_timeout_verifyEncryptionPrerequisitesWithCompletion:v23];
  }
}

- (void)deleteKeyTransparencyDeviceRecordsForPushToken:(id)a3 completion:(id)a4
{
  unint64_t v7 = (void (**)(id, void *))a4;
  BOOL v5 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v7)
  {
    uint64_t v6 = [(IDSCloudKitKeyTransparencyStore *)self _clientErrorWithCode:-2000 debugDescription:@"Key transparency device record delete is not implemented" underlyingError:0];
    v7[2](v7, v6);
  }
}

- (void)nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Nuking key transparency device records", buf, 2u);
  }

  *(void *)buf = 0;
  BOOL v18 = buf;
  uint64_t v19 = 0x3032000000;
  double v20 = sub_10011DFEC;
  v21 = sub_10011DFFC;
  id v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10011FE30;
  v16[3] = &unk_1009824A0;
  v16[4] = self;
  v16[5] = buf;
  unint64_t v7 = objc_retainBlock(v16);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011FFEC;
  v13[3] = &unk_100982D00;
  v13[4] = self;
  id v15 = buf;
  id v8 = v4;
  id v14 = v8;
  id v9 = objc_retainBlock(v13);
  id v10 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  double v11 = sub_100123044(v10, @"ck-kt-nuke-timeout", 80.0);

  id v12 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)double v23 = 134217984;
    double v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting key transparency device record nuke task with timeout {timeoutInSeconds: %f}", v23, 0xCu);
  }

  dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
  im_dispatch_async_with_timeout();

  _Block_object_dispose(buf, 8);
}

- (void)_no_timeout_nukeKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  double v7 = sub_100123044(v6, @"ck-kt-time-interval-for-requests", 60.0);

  id v8 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  unsigned int v9 = sub_1001230B0(v8, (id)1);

  id v10 = [(IDSCloudKitKeyTransparencyStore *)self _zoneID];
  double v11 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleting zone {zoneID: %@}", buf, 0xCu);
  }

  id v12 = objc_alloc((Class)sub_10011D938());
  double v24 = v10;
  id v13 = +[NSArray arrayWithObjects:&v24 count:1];
  id v14 = [v12 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v13];

  id v15 = [(IDSCloudKitKeyTransparencyStore *)self container];
  unsigned int v16 = [v14 configuration];
  [v16 setContainer:v15];

  if (v9)
  {
    id v17 = [v14 configuration];
    [v17 setDiscretionaryNetworkBehavior:0];
  }
  BOOL v18 = [v14 configuration];
  [v18 setTimeoutIntervalForRequest:v7];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001204C8;
  v22[3] = &unk_100982AB0;
  v22[4] = self;
  id v19 = v4;
  id v23 = v19;
  [v14 setModifyRecordZonesCompletionBlock:v22];
  double v20 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting CloudKit operation to delete KT zone {operation: %@}", buf, 0xCu);
  }

  v21 = [(IDSCloudKitKeyTransparencyStore *)self database];
  [v21 addOperation:v14];
}

- (void)fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching key transparency device records", buf, 2u);
  }

  *(void *)buf = 0;
  v21 = buf;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_10011DFEC;
  double v24 = sub_10011DFFC;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10011DFEC;
  v18[4] = sub_10011DFFC;
  id v19 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100120AA4;
  v17[3] = &unk_100982BA0;
  v17[4] = self;
  v17[5] = buf;
  v17[6] = v18;
  double v7 = objc_retainBlock(v17);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100120CA8;
  v13[3] = &unk_100982BF0;
  v13[4] = self;
  id v15 = v18;
  id v8 = v4;
  id v14 = v8;
  unsigned int v16 = buf;
  unsigned int v9 = objc_retainBlock(v13);
  id v10 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  double v11 = sub_100123044(v10, @"ck-kt-fetch-timeout", 120.0);

  id v12 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v26 = 134217984;
    double v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting key transparency device record fetch task with timeout {timeoutInSeconds: %f}", v26, 0xCu);
  }

  dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
  im_dispatch_async_with_timeout();

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_no_timeout_fetchKeyTransparencyDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(IDSCloudKitKeyTransparencyStore *)self currentDeviceRecordsPromise];
  if (v6
    && (double v7 = (void *)v6,
        [(IDSCloudKitKeyTransparencyStore *)self serverBag],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = sub_1001230B0(v8, (id)1),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [(IDSCloudKitKeyTransparencyStore *)self currentDeviceRecordsPromise];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cache hit for key transparency device records {promise: %@}", buf, 0xCu);
    }
  }
  else
  {
    id v12 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(IDSCloudKitKeyTransparencyStore *)self currentDeviceRecordsPromise];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cache miss for key transparency device records -- starting fetch {promise: %@}", buf, 0xCu);
    }
    id v14 = [(IDSCloudKitKeyTransparencyStore *)self _no_timeout_no_cache_fetchKeyTransparencyDeviceRecords];
    [(IDSCloudKitKeyTransparencyStore *)self setCurrentDeviceRecordsPromise:v14];

    id v15 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [(IDSCloudKitKeyTransparencyStore *)self currentDeviceRecordsPromise];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updated cached promise for key transparency device records {promise: %@}", buf, 0xCu);
    }
    id v17 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
    double v18 = sub_100123044(v17, @"ck-kt-cache-ttl", 30.0);

    id v19 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = [(IDSCloudKitKeyTransparencyStore *)self currentDeviceRecordsPromise];
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v29 = v20;
      __int16 v30 = 2048;
      double v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting timer to clean up cached promise for key transparency device records {promise: %@, cleanUpDelay: %f}", buf, 0x16u);
    }
    dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
    uint64_t v22 = [(IDSCloudKitKeyTransparencyStore *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012127C;
    block[3] = &unk_10097E4D0;
    block[4] = self;
    dispatch_after(v21, v22, block);
  }
  id v23 = [(IDSCloudKitKeyTransparencyStore *)self currentDeviceRecordsPromise];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100121350;
  v25[3] = &unk_100982E78;
  v25[4] = self;
  id v26 = v4;
  id v24 = v4;
  [v23 registerResultBlock:v25];
}

- (id)_no_timeout_no_cache_fetchKeyTransparencyDeviceRecords
{
  id v3 = [(IDSCloudKitKeyTransparencyStore *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Verifying encryption prerequisites for trusted device records fetch", buf, 2u);
  }

  id v5 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
  uint64_t v6 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  double v7 = sub_100123044(v6, @"ck-kt-time-interval-for-requests", 60.0);

  id v8 = [(IDSCloudKitKeyTransparencyStore *)self serverBag];
  unsigned __int8 v9 = sub_1001230B0(v8, 0);

  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1001215AC;
  unsigned int v16 = &unk_100982F68;
  id v17 = v5;
  double v18 = self;
  double v19 = v7;
  unsigned __int8 v20 = v9;
  id v10 = v5;
  [(IDSCloudKitKeyTransparencyStore *)self _no_timeout_verifyEncryptionPrerequisitesWithCompletion:&v13];
  double v11 = objc_msgSend(v10, "promise", v13, v14, v15, v16);

  return v11;
}

- (void)handleKVSUpdate:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey];
  id v5 = [v4 integerValue];
  if ((unint64_t)v5 < 2) {
    goto LABEL_4;
  }
  if (v5 == (id)2)
  {
    double v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received KVS Quota Violation Notification.", buf, 2u);
    }

    uint64_t v6 = +[TransparencyAnalytics logger];
    CFStringRef v10 = @"KVSErrorDomain";
    CFStringRef v11 = @"KVSErrorCode";
    CFStringRef v13 = @"IDSCloudKitKeyTransparencyStoreErrorDomain";
    uint64_t v14 = &off_1009D10C8;
    CFStringRef v12 = @"KTVersion";
    id v8 = _IDSKeyTransparencyVersionNumber();
    id v15 = v8;
    unsigned __int8 v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v10 count:3];
    [v6 logHardFailureForEventNamed:@"IDSKTKVSQuotaViolation", v9, v10, v11, v12, v13, v14 withAttributes];

    goto LABEL_9;
  }
  if (v5 == (id)3)
  {
LABEL_4:
    uint64_t v6 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received KVS update notification. {Reason: %@}", buf, 0xCu);
    }
LABEL_9:
  }
}

- (void)insertDictionary:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Inserting KVS entry {key: %@, value: %@}", (uint8_t *)&v11, 0x16u);
  }

  unsigned __int8 v9 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v9)
  {
    CFStringRef v10 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];
    [v10 setDictionary:v6 forKey:v7];
  }
  else
  {
    CFStringRef v10 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100711FD8();
    }
  }
}

- (void)removeEntryForKey:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing KVS entry {key: %@}", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v6)
  {
    id v7 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];
    [v7 removeObjectForKey:v4];
  }
  else
  {
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100711FD8();
    }
  }
}

- (id)fetchEntryForKey:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching KVS entry. {key: %@}", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v6)
  {
    id v7 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];
    int v8 = [v7 objectForKey:v4];
  }
  else
  {
    id v7 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100711FD8();
    }
    int v8 = &__NSDictionary0__struct;
  }

  return v8;
}

- (id)fetchAllEntries
{
  id v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching all entries from KVS.", v8, 2u);
  }

  id v4 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v4)
  {
    id v5 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];
    id v6 = [v5 dictionaryRepresentation];
  }
  else
  {
    id v5 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100711FD8();
    }
    id v6 = &__NSDictionary0__struct;
  }

  return v6;
}

- (void)removeAllEntries
{
  id v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wiping all entries from KVS.", buf, 2u);
  }

  id v4 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v4)
  {
    id v5 = [(IDSCloudKitKeyTransparencyStore *)self fetchAllEntries];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          id v11 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];
          [v11 removeObjectForKey:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100711FD8();
    }
  }
}

- (id)forceKVSSync
{
  id v3 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to force sync KVS.", buf, 2u);
  }

  id v4 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v4)
  {
    if (!+[IMUserDefaults shouldForceFailKTKVSSync]
      || !CUTIsInternalInstall())
    {
      id v9 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
      uint64_t v10 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];
      long long v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      id v17 = sub_100122CC0;
      double v18 = &unk_100981B98;
      id v19 = v9;
      unsigned __int8 v20 = self;
      id v11 = v9;
      [v10 synchronizeWithCompletionHandler:&v15];

      long long v12 = objc_msgSend(v11, "promise", v15, v16, v17, v18);

      goto LABEL_14;
    }
    id v5 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Default set to force fail sync KVS.", buf, 2u);
    }

    CFStringRef v6 = @"Force failing sync KVS.";
    id v7 = self;
    uint64_t v8 = -7000;
  }
  else
  {
    long long v13 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100711FD8();
    }

    CFStringRef v6 = @"KVS not yet loaded.";
    id v7 = self;
    uint64_t v8 = -5003;
  }
  id v11 = [(IDSCloudKitKeyTransparencyStore *)v7 _clientErrorWithCode:v8 debugDescription:v6 underlyingError:0];
  long long v12 = +[CUTUnsafePromise failedPromiseWithError:v11];
LABEL_14:

  return v12;
}

- (BOOL)initializeKVS
{
  id v3 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v3) {
    return 1;
  }
  id v4 = [objc_alloc((Class)NSUbiquitousKeyValueStore) initWithStoreIdentifier:@"com.apple.private.ids.kt-kvs" type:2];
  [(IDSCloudKitKeyTransparencyStore *)self setKvStore:v4];

  id v5 = [(IDSCloudKitKeyTransparencyStore *)self kvStore];

  if (v5)
  {
    CFStringRef v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"handleKVSUpdate:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:self->_kvStore];

    return 1;
  }
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)cachedManateeAvailability
{
  return self->_cachedManateeAvailability;
}

- (void)setCachedManateeAvailability:(BOOL)a3
{
  self->_cachedManateeAvailability = a3;
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (CKRecordZone)cachedRecordZone
{
  return self->_cachedRecordZone;
}

- (void)setCachedRecordZone:(id)a3
{
}

- (IDSCloudKitKeyTransparencyDeviceRecord)lastSuccessfulUpsertDeviceRecord
{
  return self->_lastSuccessfulUpsertDeviceRecord;
}

- (void)setLastSuccessfulUpsertDeviceRecord:(id)a3
{
}

- (CUTUnsafePromise)currentDeviceRecordsPromise
{
  return self->_currentDeviceRecordsPromise;
}

- (void)setCurrentDeviceRecordsPromise:(id)a3
{
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_storeStrong((id *)&self->_currentDeviceRecordsPromise, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulUpsertDeviceRecord, 0);
  objc_storeStrong((id *)&self->_cachedRecordZone, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end