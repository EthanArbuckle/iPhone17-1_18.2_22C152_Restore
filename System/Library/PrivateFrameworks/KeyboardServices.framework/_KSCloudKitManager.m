@interface _KSCloudKitManager
+ (id)prepareContainerForID:(id)a3;
- (BOOL)isAccountAvailable;
- (BOOL)needsDeviceToDevice;
- (BOOL)recordZoneOperationInProgress;
- (BOOL)subscriptionOperationInProgress;
- (CKContainer)cloudKitContainer;
- (CKDatabase)cloudKitDatabase;
- (CKDatabase)publicDatabase;
- (CKRecordZone)recordZone;
- (NSString)lastKnownUserKey;
- (NSString)recordZoneKey;
- (NSString)subscriptionKey;
- (_KSCloudKitManager)init;
- (_KSCloudKitManager)initWithContainer:(id)a3 recordZoneName:(id)a4;
- (_KSCloudKitManager)initWithRecordZoneName:(id)a3;
- (_KSCloudKitManagerDelegate)delegate;
- (id)recordIDForName:(id)a3;
- (id)recordWithName:(id)a3 type:(id)a4 attributes:(id)a5;
- (id)recordWithName:(id)a3 type:(id)a4 attributes:(id)a5 encryptedFields:(id)a6;
- (id)recordWithName:(id)a3 type:(id)a4 cloudData:(id)a5 attributes:(id)a6;
- (id)recordWithName:(id)a3 type:(id)a4 cloudData:(id)a5 attributes:(id)a6 encryptedFields:(id)a7;
- (id)resolveConflicts:(id)a3;
- (void)_checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4;
- (void)_ckDeleteRecordZoneWithID:(id)a3 completionHandler:(id)a4;
- (void)_ckFetchRecordZoneWithID:(id)a3 completionHandler:(id)a4;
- (void)_ckSaveRecordZone:(id)a3 completionHandler:(id)a4;
- (void)_inconvenientOperation:(id)a3;
- (void)_submitFetchRecordsOperation:(id)a3 withPriority:(unint64_t)a4 changeToken:(id)a5 completionHandler:(id)a6 retryCount:(unint64_t)a7;
- (void)accountStatusDidChange:(id)a3;
- (void)addOperation:(id)a3;
- (void)addOperation:(id)a3 priority:(unint64_t)a4;
- (void)copyFieldsFromRecord:(id)a3 toRecord:(id)a4;
- (void)dealloc;
- (void)fetchPublicRecordsWithNames:(id)a3 completionHandler:(id)a4;
- (void)fetchRecordsWithPriority:(unint64_t)a3 changeToken:(id)a4 completionHandler:(id)a5;
- (void)fetchRecordsWithPriority:(unint64_t)a3 changeToken:(id)a4 completionHandler:(id)a5 retryCount:(unint64_t)a6;
- (void)identityUpdated:(id)a3;
- (void)isAccountAvailable;
- (void)queryAccountStatusWithCompletionHandler:(id)a3;
- (void)resetZoneWithDelete:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)setCloudKitContainer:(id)a3;
- (void)setCloudKitDatabase:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPublicDatabase:(id)a3;
- (void)setRecordZone:(id)a3;
- (void)setRecordZoneOperationInProgress:(BOOL)a3;
- (void)setSubscriptionOperationInProgress:(BOOL)a3;
- (void)setupAccountDidChange:(BOOL)a3;
- (void)setupRecordZoneWithCompletionHandler:(id)a3 ignoreDefaults:(BOOL)a4;
- (void)setupSubscription;
- (void)shouldDetectAccountChangeWithResponse:(id)a3;
- (void)updateRecords:(id)a3 deleteRecordIDs:(id)a4 withPriority:(unint64_t)a5 completionHandler:(id)a6;
- (void)updateRecords:(id)a3 deleteRecordIDs:(id)a4 withPriority:(unint64_t)a5 completionHandler:(id)a6 retryCount:(unint64_t)a7;
- (void)userIdentityWithResponse:(id)a3;
@end

@implementation _KSCloudKitManager

- (void)queryAccountStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  ckWorkQueue = self->_ckWorkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_264890A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ckWorkQueue, v7);
}

+ (id)prepareContainerForID:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFD610] containerWithIdentifier:v3];
  }
  v5 = (void *)v4;

  return v5;
}

- (void)shouldDetectAccountChangeWithResponse:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60___KSCloudKitManager_shouldDetectAccountChangeWithResponse___block_invoke;
  v6[3] = &unk_2648909D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_KSCloudKitManager *)self userIdentityWithResponse:v6];
}

- (void)userIdentityWithResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(_KSCloudKitManager *)self cloudKitContainer];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47___KSCloudKitManager_userIdentityWithResponse___block_invoke;
    v6[3] = &unk_2648908E0;
    v6[4] = self;
    id v7 = v4;
    [v5 fetchUserRecordIDWithCompletionHandler:v6];
  }
}

- (void)_checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckWorkQueue);
  id v7 = [(_KSCloudKitManager *)self cloudKitContainer];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke;
  v9[3] = &unk_264890B38;
  id v10 = v6;
  unint64_t v11 = a4;
  v9[4] = self;
  id v8 = v6;
  [v7 accountInfoWithCompletionHandler:v9];
}

- (CKContainer)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (BOOL)isAccountAvailable
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ([getCloudSettingsManagerClass() sharedCloudSettingsManager],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isEnabledForStore:@"com.apple.cloudsettings.keyboard"],
        v3,
        (v4 & 1) == 0))
  {
    v20 = KSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(v29) = 136315138;
      *(void *)((char *)&v29 + 4) = "-[_KSCloudKitManager isAccountAvailable]";
      _os_log_impl(&dword_22B2BC000, v20, OS_LOG_TYPE_INFO, "%s  iCloud sync is disabled by preferences", (uint8_t *)&v29, 0xCu);
    }

    return 0;
  }
  else
  {
    *(void *)&long long v29 = 0;
    *((void *)&v29 + 1) = &v29;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    id v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    ckWorkQueue = self->_ckWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40___KSCloudKitManager_isAccountAvailable__block_invoke;
    block[3] = &unk_264890AC0;
    block[4] = self;
    v24 = &v29;
    id v7 = v5;
    v23 = v7;
    dispatch_async(ckWorkQueue, block);
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v7, v8))
    {
      v9 = KSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_KSCloudKitManager *)v9 isAccountAvailable];
      }

      BOOL v17 = 0;
    }
    else
    {
      v18 = KSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(*((void *)&v29 + 1) + 24)];
        *(_DWORD *)buf = 136315394;
        v26 = "-[_KSCloudKitManager isAccountAvailable]";
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_22B2BC000, v18, OS_LOG_TYPE_INFO, "%s  Account status: %@", buf, 0x16u);
      }
      BOOL v17 = *(unsigned char *)(*((void *)&v29 + 1) + 24) != 0;
    }

    _Block_object_dispose(&v29, 8);
  }
  return v17;
}

- (_KSCloudKitManager)initWithContainer:(id)a3 recordZoneName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)_KSCloudKitManager;
  dispatch_time_t v8 = [(_KSCloudKitManager *)&v51 init];
  if (v8)
  {
    uint64_t v9 = [(id)objc_opt_class() prepareContainerForID:v6];
    cloudKitContainer = v8->_cloudKitContainer;
    v8->_cloudKitContainer = (CKContainer *)v9;

    uint64_t v11 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v12 = [v11 bundleIdentifier];

    if (![v12 length])
    {
      uint64_t v13 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v14 = [v13 executablePath];
      uint64_t v15 = [v14 lastPathComponent];

      uint64_t v12 = (void *)v15;
    }
    [(CKContainer *)v8->_cloudKitContainer setSourceApplicationBundleIdentifier:v12];
    uint64_t v16 = [(CKContainer *)v8->_cloudKitContainer privateCloudDatabase];
    cloudKitDatabase = v8->_cloudKitDatabase;
    v8->_cloudKitDatabase = (CKDatabase *)v16;

    uint64_t v18 = [(CKContainer *)v8->_cloudKitContainer publicCloudDatabase];
    publicDatabase = v8->_publicDatabase;
    v8->_publicDatabase = (CKDatabase *)v18;

    if (v7)
    {
      uint64_t v20 = [objc_alloc(MEMORY[0x263EFD7F8]) initWithZoneName:v7];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x263EFD7F8] defaultRecordZone];
    }
    recordZone = v8->_recordZone;
    v8->_recordZone = (CKRecordZone *)v20;

    v22 = NSString;
    v23 = [(_KSCloudKitManager *)v8 recordZone];
    v24 = [v23 zoneID];
    v25 = [v24 zoneName];
    uint64_t v26 = [v22 stringWithFormat:@"%@-%@", @"KSCKDidSetupRecordZoneProd", v25];
    recordZoneKey = v8->_recordZoneKey;
    v8->_recordZoneKey = (NSString *)v26;

    v28 = NSString;
    long long v29 = [(_KSCloudKitManager *)v8 recordZone];
    uint64_t v30 = [v29 zoneID];
    char v31 = [v30 zoneName];
    uint64_t v32 = [v28 stringWithFormat:@"%@-%@", @"KSCKSubscriptionProd", v31];
    subscriptionKey = v8->_subscriptionKey;
    v8->_subscriptionKey = (NSString *)v32;

    v34 = NSString;
    v35 = [(_KSCloudKitManager *)v8 recordZone];
    v36 = [v35 zoneID];
    v37 = [v36 zoneName];
    uint64_t v38 = [v34 stringWithFormat:@"%@-%@", @"KSLastKnownUserID", v37];
    lastKnownUserKey = v8->_lastKnownUserKey;
    v8->_lastKnownUserKey = (NSString *)v38;

    v40 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v41 = dispatch_queue_create("com.apple.keyboardservices._ksCloudKitManager.cloudKitWorkQueue", v40);
    ckWorkQueue = v8->_ckWorkQueue;
    v8->_ckWorkQueue = (OS_dispatch_queue *)v41;

    v43 = [MEMORY[0x263F08A00] defaultCenter];
    [v43 addObserver:v8 selector:sel_accountStatusDidChange_ name:*MEMORY[0x263EFD478] object:0];

    if ([(_KSCloudKitManager *)v8 needsDeviceToDevice])
    {
      v44 = [MEMORY[0x263F08A00] defaultCenter];
      [v44 addObserver:v8 selector:sel_identityUpdated_ name:*MEMORY[0x263EFD4B8] object:0];
    }
    [(_KSCloudKitManager *)v8 setupAccountDidChange:0];
    v45 = objc_alloc_init(_KSRequestThrottle);
    accountChangeThrottle = v8->_accountChangeThrottle;
    v8->_accountChangeThrottle = v45;

    [(_KSRequestThrottle *)v8->_accountChangeThrottle setQueue:v8->_ckWorkQueue];
    [(_KSRequestThrottle *)v8->_accountChangeThrottle setDebugIdentifier:@"account change"];
    v47 = objc_alloc_init(_KSRequestThrottle);
    fetchZoneThrottle = v8->_fetchZoneThrottle;
    v8->_fetchZoneThrottle = v47;

    [(_KSRequestThrottle *)v8->_fetchZoneThrottle setQueue:v8->_ckWorkQueue];
    [(_KSRequestThrottle *)v8->_fetchZoneThrottle setDebugIdentifier:@"fetch zone"];
  }
  v49 = v8;

  return v49;
}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (void)setupAccountDidChange:(BOOL)a3
{
  ckWorkQueue = self->_ckWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke;
  v4[3] = &unk_264890980;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(ckWorkQueue, v4);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)needsDeviceToDevice
{
  return 0;
}

- (_KSCloudKitManager)initWithRecordZoneName:(id)a3
{
  return [(_KSCloudKitManager *)self initWithContainer:kKeyboardServicesCloudKitContainerID recordZoneName:a3];
}

- (_KSCloudKitManager)init
{
  return [(_KSCloudKitManager *)self initWithRecordZoneName:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_KSCloudKitManager;
  [(_KSCloudKitManager *)&v4 dealloc];
}

- (void)accountStatusDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v4 = KSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_time_t v8 = "-[_KSCloudKitManager accountStatusDidChange:]";
    _os_log_impl(&dword_22B2BC000, v4, OS_LOG_TYPE_INFO, "%s  Received account change from cloudkit", buf, 0xCu);
  }

  accountChangeThrottle = self->_accountChangeThrottle;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45___KSCloudKitManager_accountStatusDidChange___block_invoke;
  v6[3] = &unk_2648909A8;
  v6[4] = self;
  [(_KSRequestThrottle *)accountChangeThrottle postRequest:v6];
}

- (void)identityUpdated:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"KSCloudKitIdentitiesDidChange" object:self];
}

- (void)setupRecordZoneWithCompletionHandler:(id)a3 ignoreDefaults:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x263EFFA40]);
  dispatch_time_t v8 = +[_KSUtilities userDefaultsSuiteName];
  uint64_t v9 = (void *)[v7 initWithSuiteName:v8];

  uint64_t v10 = [(_KSCloudKitManager *)self recordZoneKey];
  int v11 = [v9 BOOLForKey:v10];

  if (a4 || !v11)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke;
    v19[3] = &unk_264890B88;
    v19[4] = self;
    id v20 = v9;
    id v12 = v6;
    id v21 = v12;
    uint64_t v13 = (void *)MEMORY[0x230F45010](v19);
    ckWorkQueue = self->_ckWorkQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_3;
    v16[3] = &unk_264890C00;
    v16[4] = self;
    id v17 = v13;
    id v18 = v12;
    id v15 = v13;
    dispatch_async(ckWorkQueue, v16);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)resetZoneWithDelete:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x263EFFA40]);
  dispatch_time_t v8 = +[_KSUtilities userDefaultsSuiteName];
  uint64_t v9 = (void *)[v7 initWithSuiteName:v8];

  ckWorkQueue = self->_ckWorkQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke;
  v13[3] = &unk_264890C50;
  v13[4] = self;
  id v14 = v9;
  id v15 = v6;
  unint64_t v16 = a3;
  id v11 = v6;
  id v12 = v9;
  dispatch_async(ckWorkQueue, v13);
}

- (id)recordWithName:(id)a3 type:(id)a4 cloudData:(id)a5 attributes:(id)a6 encryptedFields:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v13 error:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithCoder:v16];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke;
  v23[3] = &unk_264890C78;
  id v18 = v17;
  id v24 = v18;
  [v14 enumerateKeysAndObjectsUsingBlock:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke_2;
  v21[3] = &unk_264890C78;
  id v19 = v18;
  id v22 = v19;
  [v15 enumerateKeysAndObjectsUsingBlock:v21];

  return v19;
}

- (id)recordWithName:(id)a3 type:(id)a4 cloudData:(id)a5 attributes:(id)a6
{
  return [(_KSCloudKitManager *)self recordWithName:a3 type:a4 cloudData:a5 attributes:a6 encryptedFields:0];
}

- (id)recordWithName:(id)a3 type:(id)a4 attributes:(id)a5 encryptedFields:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x263EFD7E8]);
  id v15 = [(_KSCloudKitManager *)self recordZone];
  unint64_t v16 = [v15 zoneID];
  id v17 = (void *)[v14 initWithRecordName:v10 zoneID:v16];

  id v18 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:v11 recordID:v17];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke;
  v24[3] = &unk_264890C78;
  id v19 = v18;
  id v25 = v19;
  [v12 enumerateKeysAndObjectsUsingBlock:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke_2;
  v22[3] = &unk_264890C78;
  id v20 = v19;
  id v23 = v20;
  [v13 enumerateKeysAndObjectsUsingBlock:v22];

  return v20;
}

- (id)recordWithName:(id)a3 type:(id)a4 attributes:(id)a5
{
  return [(_KSCloudKitManager *)self recordWithName:a3 type:a4 attributes:a5 encryptedFields:0];
}

- (id)recordIDForName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFD7E8]);
  id v6 = [(_KSCloudKitManager *)self recordZone];
  id v7 = [v6 zoneID];
  dispatch_time_t v8 = (void *)[v5 initWithRecordName:v4 zoneID:v7];

  return v8;
}

- (void)addOperation:(id)a3
{
}

- (void)addOperation:(id)a3 priority:(unint64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  if (a4)
  {
    if (qos_class_self() <= QOS_CLASS_BACKGROUND) {
      uint64_t v7 = 9;
    }
    else {
      uint64_t v7 = 17;
    }
    [v10 setQualityOfService:v7];
    if (a4 != 2 || qos_class_self() < 0x16) {
      goto LABEL_10;
    }
  }
  else
  {
    [v6 setQualityOfService:17];
  }
  dispatch_time_t v8 = [v10 configuration];
  [v8 setDiscretionaryNetworkBehavior:0];

LABEL_10:
  uint64_t v9 = [(_KSCloudKitManager *)self cloudKitDatabase];
  [v9 addOperation:v10];
}

- (void)setupSubscription
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v4 = +[_KSUtilities userDefaultsSuiteName];
  id v5 = (void *)[v3 initWithSuiteName:v4];

  id v6 = [(_KSCloudKitManager *)self subscriptionKey];
  int v7 = [v5 BOOLForKey:v6];

  if (v7)
  {
    dispatch_time_t v8 = KSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[_KSCloudKitManager setupSubscription]";
      _os_log_impl(&dword_22B2BC000, v8, OS_LOG_TYPE_INFO, "%s  already subsribed for zone change", buf, 0xCu);
    }
  }
  else
  {
    ckWorkQueue = self->_ckWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39___KSCloudKitManager_setupSubscription__block_invoke;
    block[3] = &unk_264890CC8;
    block[4] = self;
    id v11 = @"KSTextReplacementSubscription";
    id v12 = v5;
    dispatch_async(ckWorkQueue, block);
  }
}

- (void)updateRecords:(id)a3 deleteRecordIDs:(id)a4 withPriority:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  ckWorkQueue = self->_ckWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler___block_invoke;
  block[3] = &unk_264890CF0;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(ckWorkQueue, block);
}

- (void)updateRecords:(id)a3 deleteRecordIDs:(id)a4 withPriority:(unint64_t)a5 completionHandler:(id)a6 retryCount:(unint64_t)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void, id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckWorkQueue);
  if (a7 == 2)
  {
    id v15 = KSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]";
      _os_log_impl(&dword_22B2BC000, v15, OS_LOG_TYPE_INFO, "%s  hit max retry limit, not updating records", buf, 0xCu);
    }

    id v16 = [MEMORY[0x263F087E8] errorWithDomain:KSCKErrorDomain code:1 userInfo:0];
    v14[2](v14, 0, v12, v16);
  }
  else
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x263EFD748]) initWithRecordsToSave:v12 recordIDsToDelete:v13];
    [v16 setSavePolicy:0];
    id v17 = [MEMORY[0x263EFF980] array];
    id v18 = [MEMORY[0x263EFF980] array];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke;
    v30[3] = &unk_264890D18;
    id v19 = v17;
    id v31 = v19;
    id v20 = v18;
    id v32 = v20;
    [v16 setPerRecordCompletionBlock:v30];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_127;
    v23[3] = &unk_264890DB8;
    void v23[4] = self;
    id v24 = v12;
    unint64_t v28 = a5;
    id v26 = v19;
    __int16 v27 = v14;
    unint64_t v29 = a7;
    id v25 = v20;
    id v21 = v19;
    id v22 = v20;
    [v16 setModifyRecordsCompletionBlock:v23];
    [(_KSCloudKitManager *)self addOperation:v16 priority:a5];
  }
}

- (id)resolveConflicts:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    uint64_t v7 = *MEMORY[0x263EFD4F8];
    uint64_t v8 = *MEMORY[0x263EFD4F0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:v7];
        id v12 = [v10 objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v13 = [v11 objectForKey:@"timestamp"];
          uint64_t v14 = [v12 objectForKey:@"timestamp"];
          id v15 = (void *)v14;
          if (!(v13 | v14) || ([(id)v14 timeIntervalSinceDate:v13], v16 > 2.0)) {
            [(_KSCloudKitManager *)self copyFieldsFromRecord:v12 toRecord:v11];
          }
          [v20 addObject:v11];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  return v20;
}

- (void)copyFieldsFromRecord:(id)a3 toRecord:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [v5 valuesByKey];
  uint64_t v8 = [v7 allKeys];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
        uint64_t v13 = [v5 valuesByKey];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];
        id v15 = [v6 valuesByKey];
        [v15 setObject:v14 forKeyedSubscript:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v16 = objc_msgSend(v5, "encryptedValuesByKey", 0);
  id v17 = [v16 allKeys];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * v20);
        long long v22 = [v5 encryptedValuesByKey];
        long long v23 = [v22 objectForKeyedSubscript:v21];
        long long v24 = [v6 encryptedValuesByKey];
        [v24 setObject:v23 forKeyedSubscript:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)fetchRecordsWithPriority:(unint64_t)a3 changeToken:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchRecordsWithPriority:(unint64_t)a3 changeToken:(id)a4 completionHandler:(id)a5 retryCount:(unint64_t)a6
{
  v38[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  long long v28 = v10;
  unint64_t v29 = a6;
  id v26 = a5;
  unint64_t v27 = a3;
  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v11 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = v11;
LABEL_6:
  id v13 = objc_alloc_init(MEMORY[0x263EFD6C8]);
  [v13 setPreviousServerChangeToken:v12];
  id v14 = objc_alloc(MEMORY[0x263EFD6B8]);
  id v15 = [(_KSCloudKitManager *)self recordZone];
  double v16 = [v15 zoneID];
  v38[0] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  uint64_t v18 = [(_KSCloudKitManager *)self recordZone];
  uint64_t v19 = [v18 zoneID];
  v36 = v19;
  id v37 = v13;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  uint64_t v21 = (void *)[v14 initWithRecordZoneIDs:v17 optionsByRecordZoneID:v20];

  ckWorkQueue = self->_ckWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88___KSCloudKitManager_fetchRecordsWithPriority_changeToken_completionHandler_retryCount___block_invoke;
  block[3] = &unk_264890D68;
  block[4] = self;
  id v31 = v21;
  id v32 = v28;
  id v33 = v26;
  unint64_t v34 = v27;
  unint64_t v35 = v29;
  id v23 = v26;
  id v24 = v28;
  id v25 = v21;
  dispatch_async(ckWorkQueue, block);
}

- (void)_submitFetchRecordsOperation:(id)a3 withPriority:(unint64_t)a4 changeToken:(id)a5 completionHandler:(id)a6 retryCount:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ckWorkQueue);
  id v15 = [MEMORY[0x263EFF980] array];
  double v16 = [MEMORY[0x263EFF980] array];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  id v17 = v13;
  id v43 = v17;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke;
  v40[3] = &unk_264890DE0;
  id v18 = v15;
  id v41 = v18;
  [v12 setRecordChangedBlock:v40];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  void v38[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2;
  v38[3] = &unk_264890E08;
  id v19 = v16;
  id v39 = v19;
  [v12 setRecordWithIDWasDeletedBlock:v38];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3;
  v33[3] = &unk_264890E58;
  v33[4] = self;
  id v37 = v42;
  id v20 = v18;
  id v34 = v20;
  id v21 = v19;
  id v35 = v21;
  id v22 = v14;
  id v36 = v22;
  [v12 setRecordZoneChangeTokensUpdatedBlock:v33];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139;
  v26[3] = &unk_264890F70;
  v26[4] = self;
  long long v30 = v42;
  unint64_t v31 = a7;
  unint64_t v32 = a4;
  id v23 = v22;
  id v29 = v23;
  id v24 = v20;
  id v27 = v24;
  id v25 = v21;
  id v28 = v25;
  [v12 setRecordZoneFetchCompletionBlock:v26];
  [(_KSCloudKitManager *)self addOperation:v12 priority:a4];

  _Block_object_dispose(v42, 8);
}

- (void)fetchPublicRecordsWithNames:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ckWorkQueue = self->_ckWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke;
  block[3] = &unk_264890FC0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(ckWorkQueue, block);
}

- (void)_inconvenientOperation:(id)a3
{
  id v4 = a3;
  [v4 setQueuePriority:-4];
  [(_KSCloudKitManager *)self addOperation:v4 priority:0];
}

- (void)_ckFetchRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  fetchZoneThrottle = self->_fetchZoneThrottle;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke;
  v11[3] = &unk_264891010;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [(_KSRequestThrottle *)fetchZoneThrottle postRequest:v11];
}

- (void)_ckSaveRecordZone:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFD740]);
  v19[0] = v6;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v8 initWithRecordZonesToSave:v9 recordZoneIDsToDelete:0];

  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __58___KSCloudKitManager__ckSaveRecordZone_completionHandler___block_invoke;
  double v16 = &unk_264891038;
  id v17 = v6;
  id v18 = v7;
  id v11 = v6;
  id v12 = v7;
  [v10 setModifyRecordZonesCompletionBlock:&v13];
  -[_KSCloudKitManager _inconvenientOperation:](self, "_inconvenientOperation:", v10, v13, v14, v15, v16);
}

- (void)_ckDeleteRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFD740]);
  v19[0] = v6;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v8 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v9];

  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __66___KSCloudKitManager__ckDeleteRecordZoneWithID_completionHandler___block_invoke;
  double v16 = &unk_264891038;
  id v17 = v6;
  id v18 = v7;
  id v11 = v6;
  id v12 = v7;
  [v10 setModifyRecordZonesCompletionBlock:&v13];
  -[_KSCloudKitManager _inconvenientOperation:](self, "_inconvenientOperation:", v10, v13, v14, v15, v16);
}

- (void)setRecordZone:(id)a3
{
}

- (_KSCloudKitManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_KSCloudKitManagerDelegate *)WeakRetained;
}

- (void)setCloudKitContainer:(id)a3
{
}

- (CKDatabase)cloudKitDatabase
{
  return self->_cloudKitDatabase;
}

- (void)setCloudKitDatabase:(id)a3
{
}

- (CKDatabase)publicDatabase
{
  return self->_publicDatabase;
}

- (void)setPublicDatabase:(id)a3
{
}

- (NSString)recordZoneKey
{
  return self->_recordZoneKey;
}

- (NSString)subscriptionKey
{
  return self->_subscriptionKey;
}

- (NSString)lastKnownUserKey
{
  return self->_lastKnownUserKey;
}

- (BOOL)recordZoneOperationInProgress
{
  return self->_recordZoneOperationInProgress;
}

- (void)setRecordZoneOperationInProgress:(BOOL)a3
{
  self->_recordZoneOperationInProgress = a3;
}

- (BOOL)subscriptionOperationInProgress
{
  return self->_subscriptionOperationInProgress;
}

- (void)setSubscriptionOperationInProgress:(BOOL)a3
{
  self->_subscriptionOperationInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownUserKey, 0);
  objc_storeStrong((id *)&self->_subscriptionKey, 0);
  objc_storeStrong((id *)&self->_recordZoneKey, 0);
  objc_storeStrong((id *)&self->_publicDatabase, 0);
  objc_storeStrong((id *)&self->_cloudKitDatabase, 0);
  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_fetchZoneThrottle, 0);
  objc_storeStrong((id *)&self->_accountChangeThrottle, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_ckWorkQueue, 0);
}

- (void)isAccountAvailable
{
}

- (void)recordWithName:type:cloudData:attributes:encryptedFields:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _DWORD *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_3(&dword_22B2BC000, "%s  ERROR creating record: %@; %@", v5, v6);
}

- (void)recordWithName:type:attributes:encryptedFields:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _DWORD *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_3(&dword_22B2BC000, "%s  >>> ERROR creating record: %@; %@", v5, v6);
}

- (void)recordIDForName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _DWORD *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_3(&dword_22B2BC000, "%s  >>> ERROR creating recordID: %@; %@", v5, v6);
}

- (void)copyFieldsFromRecord:toRecord:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _DWORD *v2 = 136315650;
  OUTLINED_FUNCTION_0(v3, v4, (uint64_t)v2);
  OUTLINED_FUNCTION_3(&dword_22B2BC000, "%s  >>> ERROR copying local to  cloud CKRecord: %@; %@", v5, v6);
}

- (void)fetchRecordsWithPriority:(uint64_t)a3 changeToken:(uint64_t)a4 completionHandler:(uint64_t)a5 retryCount:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end