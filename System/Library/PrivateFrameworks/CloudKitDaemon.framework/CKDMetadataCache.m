@interface CKDMetadataCache
+ (id)cacheDatabaseSchema;
+ (id)dbFileName;
+ (id)sharedCache;
- (CKDMetadataCache)initWithCacheDir:(id)a3;
- (OS_dispatch_queue)cacheQueue;
- (id)appContainerAccountMetadataForAppContainerAccountTuple:(id)a3;
- (id)applicationMetadataForApplicationID:(id)a3;
- (id)cachedDSIDForAccountID:(id)a3;
- (id)containerServerInfoForContainerID:(id)a3 accountID:(id)a4;
- (id)dateOfLastTokenUpdate;
- (id)globalConfiguration;
- (id)inlock_applicationMetadataForApplicationID:(id)a3;
- (id)inlock_containerServerInfoForContainerID:(id)a3 accountID:(id)a4;
- (id)knownAppContainerAccountTuples;
- (id)knownAppContainerAccountTuplesForAccountID:(id)a3;
- (id)knownAppContainerTuples;
- (id)knownApplicationIDs;
- (id)knownContainerizedApplicationIDs;
- (id)publicKeyOfType:(id)a3 withIdentifier:(id)a4;
- (id)pushTokenForAppContainerAccountTuple:(id)a3 filterOldTokens:(BOOL)a4;
- (void)expungeAllData;
- (void)expungeDataForAccountID:(id)a3;
- (void)expungeOldData;
- (void)expungeStaleAccountIDs;
- (void)inlock_expungeDataForAccountID:(id)a3;
- (void)inlock_setDateOfLastTokenUpdate:(id)a3;
- (void)removeContainerID:(id)a3;
- (void)removeKnownApplicationID:(id)a3;
- (void)setAppContainerAccountMetadata:(id)a3 forAppContainerAccountTuple:(id)a4;
- (void)setApplicationMetadata:(id)a3 forApplicationID:(id)a4;
- (void)setCacheQueue:(id)a3;
- (void)setCachedDSID:(id)a3 forAccountID:(id)a4;
- (void)setContainerServerInfo:(id)a3 forContainerID:(id)a4 accountID:(id)a5;
- (void)setDateOfLastTokenUpdate:(id)a3;
- (void)setGlobalConfiguration:(id)a3;
- (void)setPublicKey:(id)a3 ofType:(id)a4 withIdentifier:(id)a5;
- (void)setPushToken:(id)a3 forAppContainerAccountTuple:(id)a4;
- (void)willCreateDatabase;
@end

@implementation CKDMetadataCache

- (id)inlock_applicationMetadataForApplicationID:(id)a3
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60 = @"applicationID";
  v61[0] = v4;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v61, &v60, 1);
  v8 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v7, (uint64_t)v6);
  v59[0] = @"adopterProcessType";
  v59[1] = @"applicationContainerPath";
  v59[2] = @"clientSDKVersion";
  v59[3] = @"containingBundleID";
  v59[4] = @"entitlements";
  v59[5] = @"isMainBundleAppleExecutable";
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v59, 6);
  v13 = objc_msgSend_v1(v8, v11, v12);
  v16 = objc_msgSend_v2(v8, v14, v15);
  v18 = objc_msgSend_select_from_where_bindings_(self, v17, (uint64_t)v10, @"AppBundle", v13, v16);

  if (objc_msgSend_count(v18, v19, v20))
  {
    v22 = objc_msgSend_objectAtIndexedSubscript_(v18, v21, 0);
    v24 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"adopterProcessType");
    uint64_t v58 = objc_msgSend_integerValue(v24, v25, v26);

    v28 = objc_msgSend_objectForKeyedSubscript_(v22, v27, @"applicationContainerPath");
    v57 = objc_msgSend_CKNilIfLengthZero(v28, v29, v30);

    v32 = objc_msgSend_objectForKeyedSubscript_(v22, v31, @"clientSDKVersion");
    uint64_t v56 = objc_msgSend_integerValue(v32, v33, v34);

    v36 = objc_msgSend_objectForKeyedSubscript_(v22, v35, @"isMainBundleAppleExecutable");
    uint64_t v39 = objc_msgSend_BOOLValue(v36, v37, v38);

    v41 = objc_msgSend_objectForKeyedSubscript_(v22, v40, @"containingBundleID");
    v44 = objc_msgSend_CKNilIfLengthZero(v41, v42, v43);

    id v45 = objc_alloc(MEMORY[0x1E4F1A008]);
    objc_msgSend_objectForKeyedSubscript_(v22, v46, @"entitlements");
    v48 = id v47 = v4;
    v50 = v6;
    v51 = objc_msgSend_initWithSqliteRepresentation_(v45, v49, (uint64_t)v48);

    id v4 = v47;
    v52 = [CKDApplicationMetadata alloc];
    isClientMainBundleAppleExecutable = objc_msgSend_initWithAdopterProcessType_containingBundleID_applicationContainerPath_entitlements_clientSDKVersion_isClientMainBundleAppleExecutable_(v52, v53, v58, v44, v57, v51, v56, v39);

    v6 = v50;
  }
  else
  {
    isClientMainBundleAppleExecutable = objc_opt_new();
  }

  return isClientMainBundleAppleExecutable;
}

- (void)setAppContainerAccountMetadata:(id)a3 forAppContainerAccountTuple:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_cacheQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D0B5C8;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(v10, block);
}

- (void)setApplicationMetadata:(id)a3 forApplicationID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_cacheQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D042BC;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(v10, block);
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

+ (id)sharedCache
{
  v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, a1, @"CKDMetadataCache.m", 221, @"Use -initWithDeviceContext:");

  return 0;
}

+ (id)cacheDatabaseSchema
{
  return @"create table if not exists PushTokens (\n    applicationID             text,\n    containerID               text,\n    personaID                 text,\n    accountID                 text,\n    apsToken                  blob,\n    apsEnvironment            text,\n    expirationDate            real,\n    unique (applicationID, containerID, personaID, accountID) on conflict replace\n);\ncreate table if not exists AppBundle (\n    applicationID               text,\n    adopterProcessType          integer,\n    applicationContainerPath    text,\n    clientSDKVersion            integer,\n    containingBundleID          text,\n    entitlements                text,\n    isMainBundleAppleExecutable integer,\n    unique (applicationID) on conflict replace\n);\ncreate table if not exists ContainerServerInfo (\n    containerID                 text primary key,\n    publicCloudDBURL            text,\n    publicShareServiceURL       text,\n    publicDeviceServiceURL      text,\n    publicCodeServiceURL        text,\n    publicMetricsServiceURL     text,\n    scopedUserID                text,\n    orgAdminUserID              text,\n    accountID                   text,\n    unique (containerID, accountID) on conflict replace\n);\n create table if not exists AppContainerAccount (\n    applicationID               text,\n    containerID                 text,\n    personaID                   text,\n    accountID                   text,\n    containerOptions            text,\n    tokenRegistered             integer,\n    unique (applicationID, containerID, personaID, accountID) on conflict replace\n);\ncreate table if not exists ServerConfiguration (\n     valuesData            blob,\n     expiry                real\n);\ncreate table if not exists VerifiedPublicKey (\n     keyType          text,\n     keyID            text,\n     publicKey        blob,\n     keyVersion       integer,\n     keyExpiration    integer,\n     keyCert          blob,\n     protectionSource text,\n     unique (keyType, keyID) on conflict replace\n);\ncreate table if not exists DSIDMap (\n     accountID        text primary key,\n     DSID             text\n);\n";
}

+ (id)dbFileName
{
  return @"CloudKitMetadata";
}

- (CKDMetadataCache)initWithCacheDir:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKDMetadataCache;
  v3 = [(CKDSQLiteCache *)&v11 initWithCacheDir:a3];
  v5 = v3;
  if (v3)
  {
    objc_msgSend_setUserVersion_(v3, v4, 3873022576);
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cloudkit.metadatacache", v6);
    cacheQueue = v5->_cacheQueue;
    v5->_cacheQueue = (OS_dispatch_queue *)v7;

    objc_msgSend_setObjectClassPrefix_(v5, v9, @"CKD");
  }
  return v5;
}

- (void)expungeAllData
{
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C504238C;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)expungeOldData
{
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C5042688;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)inlock_expungeDataForAccountID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C5042840;
  v8[3] = &unk_1E64F6E60;
  id v9 = v4;
  id v5 = v4;
  id v7 = (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, v6, (uint64_t)v8, &unk_1F2044D10);
}

- (void)expungeDataForAccountID:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C5042A90;
  v9[3] = &unk_1E64F0948;
  id v10 = v4;
  objc_super v11 = self;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (void)expungeStaleAccountIDs
{
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C5042BF8;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (id)pushTokenForAppContainerAccountTuple:(id)a3 filterOldTokens:(BOOL)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1C50430D0;
  v22 = sub_1C50430E0;
  id v23 = 0;
  id v9 = objc_msgSend_cacheQueue(self, v7, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C50430E8;
  v13[3] = &unk_1E64F8D08;
  BOOL v17 = a4;
  id v14 = v6;
  id v15 = self;
  v16 = &v18;
  id v10 = v6;
  dispatch_sync(v9, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)setPushToken:(id)a3 forAppContainerAccountTuple:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_cacheQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C50434DC;
  block[3] = &unk_1E64F0120;
  id v14 = v7;
  id v15 = self;
  id v16 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(v10, block);
}

- (id)knownAppContainerAccountTuplesForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = sub_1C50430D0;
  uint64_t v18 = sub_1C50430E0;
  id v19 = 0;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C50439D4;
  block[3] = &unk_1E64F28C8;
  void block[4] = self;
  id v12 = v4;
  v13 = &v14;
  id v8 = v4;
  dispatch_sync(v7, block);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)knownAppContainerTuples
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C50430D0;
  id v12 = sub_1C50430E0;
  id v13 = 0;
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C5043DFC;
  v7[3] = &unk_1E64F43D0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)knownAppContainerAccountTuples
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C50430D0;
  id v12 = sub_1C50430E0;
  id v13 = 0;
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C5044150;
  v7[3] = &unk_1E64F43D0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)appContainerAccountMetadataForAppContainerAccountTuple:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1C50430D0;
  id v19 = sub_1C50430E0;
  id v20 = 0;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C5044510;
  block[3] = &unk_1E64F28C8;
  id v12 = v4;
  id v13 = self;
  uint64_t v14 = &v15;
  id v8 = v4;
  dispatch_sync(v7, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)dateOfLastTokenUpdate
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C50430D0;
  id v12 = sub_1C50430E0;
  id v13 = 0;
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C50448F4;
  v7[3] = &unk_1E64F1BC0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)inlock_setDateOfLastTokenUpdate:(id)a3
{
}

- (void)setDateOfLastTokenUpdate:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C5044A08;
  v9[3] = &unk_1E64F0948;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (id)applicationMetadataForApplicationID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1C50430D0;
  uint64_t v18 = sub_1C50430E0;
  id v19 = 0;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C5044B58;
  block[3] = &unk_1E64F30F0;
  id v12 = v4;
  id v13 = &v14;
  void block[4] = self;
  id v8 = v4;
  dispatch_sync(v7, block);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)knownApplicationIDs
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C50430D0;
  id v12 = sub_1C50430E0;
  id v13 = 0;
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C5044E54;
  v7[3] = &unk_1E64F43D0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)knownContainerizedApplicationIDs
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C50430D0;
  id v12 = sub_1C50430E0;
  id v13 = 0;
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C50450C8;
  v7[3] = &unk_1E64F43D0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)removeKnownApplicationID:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C5045308;
  v9[3] = &unk_1E64F0948;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (id)globalConfiguration
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C50430D0;
  id v12 = sub_1C50430E0;
  id v13 = 0;
  id v4 = objc_msgSend_cacheQueue(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C50455B0;
  v7[3] = &unk_1E64F43D0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)setGlobalConfiguration:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = sub_1C5045708;
  id v20 = &unk_1E64F0948;
  v21 = self;
  id v22 = v4;
  id v8 = v4;
  dispatch_sync(v7, &v17);

  id v11 = objc_msgSend_deviceContext(self, v9, v10, v17, v18, v19, v20, v21);
  uint64_t v14 = objc_msgSend_tokenRegistrationScheduler(v11, v12, v13);
  objc_msgSend_tokenRefreshChanged(v14, v15, v16);
}

- (id)publicKeyOfType:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v11 = v8;
  if (!v7 || !v8)
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKDMetadataCache.m", 695, @"Must specify both key type and key identifier");
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1C50430D0;
  v29 = sub_1C50430E0;
  id v30 = 0;
  id v12 = objc_msgSend_cacheQueue(self, v9, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C50459D8;
  block[3] = &unk_1E64F8D58;
  id v20 = v7;
  id v21 = v11;
  id v23 = &v25;
  SEL v24 = a2;
  id v22 = self;
  id v13 = v11;
  id v14 = v7;
  dispatch_sync(v12, block);

  id v15 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v15;
}

- (void)setPublicKey:(id)a3 ofType:(id)a4 withIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v14 = v11;
  if (!v10 || !v11)
  {
    id v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKDMetadataCache.m", 721, @"Must specify both key type and key identifier");
  }
  id v15 = objc_msgSend_cacheQueue(self, v12, v13);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C5045DDC;
  v21[3] = &unk_1E64F0DF0;
  v21[4] = self;
  id v22 = v9;
  id v23 = v10;
  id v24 = v14;
  id v16 = v14;
  id v17 = v10;
  id v18 = v9;
  dispatch_sync(v15, v21);
}

- (id)inlock_containerServerInfoForContainerID:(id)a3 accountID:(id)a4
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v9 = v7;
  v67[0] = @"containerID";
  v67[1] = @"accountID";
  id v10 = &stru_1F2044F30;
  if (v7) {
    id v10 = v7;
  }
  v68[0] = v6;
  v68[1] = v10;
  id v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v68, v67, 2);
  uint64_t v13 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v12, (uint64_t)v11);
  v66[0] = @"publicCloudDBURL";
  v66[1] = @"publicShareServiceURL";
  v66[2] = @"publicDeviceServiceURL";
  v66[3] = @"publicCodeServiceURL";
  v66[4] = @"publicMetricsServiceURL";
  v66[5] = @"scopedUserID";
  v66[6] = @"orgAdminUserID";
  id v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v66, 7);
  id v18 = objc_msgSend_v1(v13, v16, v17);
  id v21 = objc_msgSend_v2(v13, v19, v20);
  id v23 = objc_msgSend_select_from_where_bindings_(self, v22, (uint64_t)v15, @"ContainerServerInfo", v18, v21);

  if (objc_msgSend_count(v23, v24, v25))
  {
    uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v23, v26, 0);
    v28 = objc_opt_new();
    id v30 = objc_msgSend_objectForKeyedSubscript_(v27, v29, @"publicCloudDBURL");
    if (objc_msgSend_length(v30, v31, v32))
    {
      uint64_t v34 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v33, (uint64_t)v30);
      objc_msgSend_setPublicCloudDBURL_(v28, v35, (uint64_t)v34);
    }
    v36 = objc_msgSend_objectForKeyedSubscript_(v27, v33, @"publicShareServiceURL");

    if (objc_msgSend_length(v36, v37, v38))
    {
      v40 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v39, (uint64_t)v36);
      objc_msgSend_setPublicShareServiceURL_(v28, v41, (uint64_t)v40);
    }
    v42 = objc_msgSend_objectForKeyedSubscript_(v27, v39, @"publicDeviceServiceURL");

    if (objc_msgSend_length(v42, v43, v44))
    {
      v46 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v45, (uint64_t)v42);
      objc_msgSend_setPublicDeviceServiceURL_(v28, v47, (uint64_t)v46);
    }
    v48 = objc_msgSend_objectForKeyedSubscript_(v27, v45, @"publicCodeServiceURL");

    if (objc_msgSend_length(v48, v49, v50))
    {
      v52 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v51, (uint64_t)v48);
      objc_msgSend_setPublicCodeServiceURL_(v28, v53, (uint64_t)v52);
    }
    v54 = objc_msgSend_objectForKeyedSubscript_(v27, v51, @"publicMetricsServiceURL");

    if (objc_msgSend_length(v54, v55, v56))
    {
      uint64_t v58 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v57, (uint64_t)v54);
      objc_msgSend_setPublicMetricsServiceURL_(v28, v59, (uint64_t)v58);
    }
    v60 = objc_msgSend_objectForKeyedSubscript_(v27, v57, @"scopedUserID");
    objc_msgSend_setContainerScopedUserID_(v28, v61, (uint64_t)v60);

    v63 = objc_msgSend_objectForKeyedSubscript_(v27, v62, @"orgAdminUserID");
    objc_msgSend_setOrgAdminUserID_(v28, v64, (uint64_t)v63);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)containerServerInfoForContainerID:(id)a3 accountID:(id)a4
{
  id v7 = a3;
  id v10 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_1C50430D0;
  uint64_t v26 = sub_1C50430E0;
  id v27 = 0;
  if (!v7)
  {
    id v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CKDMetadataCache.m", 795, @"Unexpectedly-nil containerID");
  }
  id v11 = objc_msgSend_cacheQueue(self, v8, v9);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C50466D0;
  v18[3] = &unk_1E64F5190;
  v18[4] = self;
  id v19 = v7;
  id v20 = v10;
  id v21 = &v22;
  id v12 = v10;
  id v13 = v7;
  dispatch_sync(v11, v18);

  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (void)setContainerServerInfo:(id)a3 forContainerID:(id)a4 accountID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (!v10)
  {
    id v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKDMetadataCache.m", 805, @"Unexpectedly-nil containerID");
  }
  id v14 = objc_msgSend_cacheQueue(self, v11, v12);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C5046864;
  v20[3] = &unk_1E64F0DF0;
  v20[4] = self;
  id v21 = v9;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v14, v20);
}

- (void)removeContainerID:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C5046E7C;
  v9[3] = &unk_1E64F0948;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (void)setCachedDSID:(id)a3 forAccountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_cacheQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C5047160;
  block[3] = &unk_1E64F0120;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(v10, block);
}

- (id)cachedDSIDForAccountID:(id)a3
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1C50430D0;
  id v19 = sub_1C50430E0;
  id v20 = 0;
  if (v6)
  {
    id v7 = objc_msgSend_cacheQueue(self, v4, v5);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C50474C0;
    block[3] = &unk_1E64F28C8;
    id v12 = v6;
    id v13 = self;
    id v14 = &v15;
    dispatch_sync(v7, block);

    id v8 = (void *)v16[5];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)willCreateDatabase
{
  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_processType(v12, v3, v4) && objc_msgSend_isSystemInstalledBinary(v12, v5, v6))
  {
    id v9 = objc_msgSend_sharedClient(CKDPDSClient, v7, v8);
    objc_msgSend_unregisterAllTokens(v9, v10, v11);
  }
}

- (void)setCacheQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end