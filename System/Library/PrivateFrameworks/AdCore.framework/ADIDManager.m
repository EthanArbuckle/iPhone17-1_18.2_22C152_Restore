@interface ADIDManager
+ (id)sharedInstance;
- (ADIDManager)init;
- (BOOL)clearDSIDRecords;
- (BOOL)loadIDs;
- (BOOL)setDSIDDicToStorage:(id)a3;
- (DSIDRecord)activeDSIDRecord;
- (NSArray)monthlyResetArray;
- (id)deviceIdentifiers;
- (id)dsidRecord:(id)a3 fromDict:(id)a4;
- (id)encryptedIDForClientType:(int64_t)a3;
- (id)getDSIDDicFromStorage;
- (id)idForClientType:(int64_t)a3;
- (id)loadFakeRecord:(id)a3;
- (id)reloadRecords:(id)a3;
- (id)retrieveDeviceIDs;
- (int64_t)PersonalizedAdsMonthResetCount;
- (void)forceReconcile:(id)a3;
- (void)logIDs:(id)a3;
- (void)reloadRecords:(id)a3 completionHandler:(id)a4;
- (void)setActiveDSIDRecord:(id)a3;
- (void)setMonthlyResetArray:(id)a3;
@end

@implementation ADIDManager

- (void)logIDs:(id)a3
{
  if (self->_activeDSIDRecord)
  {
    v4 = (objc_class *)NSString;
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v11];

    v7 = NSString;
    v8 = [(ADIDManager *)self deviceIdentifiers];
    v9 = objc_msgSend(v8, "AD_jsonString");
    v10 = [v7 stringWithFormat:@"%@ %@", v6, v9];
    _ADLog(@"iAdIDLogging", v10, 0);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__ADIDManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_1 != -1) {
    dispatch_once(&sharedInstance__onceToken_1, block);
  }
  v2 = (void *)sharedInstance__instance_1;
  return v2;
}

- (id)deviceIdentifiers
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(ADIDManager *)self idForClientType:0];
  [v3 setValue:v4 forKey:@"iAdID"];

  id v5 = [(ADIDManager *)self idForClientType:5];
  if (v5)
  {
    v6 = [(ADIDManager *)self idForClientType:5];
    [v3 setValue:v6 forKey:@"DPID"];
  }
  else
  {
    [v3 setValue:@"(null)" forKey:@"DPID"];
  }

  v7 = [(ADIDManager *)self idForClientType:4];
  [v3 setValue:v7 forKey:@"ToroID"];

  v8 = [(ADIDManager *)self idForClientType:6];
  [v3 setValue:v8 forKey:@"DeviceNewsPlusSubscriberID"];

  v9 = [(ADIDManager *)self idForClientType:2];
  [v3 setValue:v9 forKey:@"AnonymousDemandID"];

  v10 = [(ADIDManager *)self idForClientType:3];
  [v3 setValue:v10 forKey:@"ContentID"];

  uint64_t v11 = +[ADCoreSettings sharedInstance];
  if ([v11 isPersonalizedAdsEnabled]) {
    v12 = @"ON";
  }
  else {
    v12 = @"OFF";
  }
  [v3 setValue:v12 forKey:@"Personalized Ads"];

  v13 = [(ADIDManager *)self activeDSIDRecord];
  v14 = [v13 segmentData];
  if (v14)
  {
    v15 = [(ADIDManager *)self activeDSIDRecord];
    v16 = [v15 segmentData];
    [v3 setObject:v16 forKey:@"Segments"];
  }
  else
  {
    [v3 setObject:@"(null)" forKey:@"Segments"];
  }

  v17 = [(ADIDManager *)self activeDSIDRecord];
  v18 = [v17 DSID];
  if (v18)
  {
    v19 = [(ADIDManager *)self activeDSIDRecord];
    v20 = [v19 DSID];
    [v3 setObject:v20 forKey:@"DSID"];
  }
  else
  {
    [v3 setObject:@"(null)" forKey:@"DSID"];
  }

  v21 = [(ADIDManager *)self activeDSIDRecord];
  v22 = [v21 iCloudDSID];
  if (v22)
  {
    v23 = [(ADIDManager *)self activeDSIDRecord];
    v24 = [v23 iCloudDSID];
    [v3 setObject:v24 forKey:@"iCloud DSID"];
  }
  else
  {
    [v3 setObject:@"(null)" forKey:@"iCloud DSID"];
  }

  return v3;
}

- (id)idForClientType:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [v4->_activeDSIDRecord idForClientType:a3];
  v6 = (void *)[v5 copy];

  objc_sync_exit(v4);
  return v6;
}

- (DSIDRecord)activeDSIDRecord
{
  return (DSIDRecord *)objc_getProperty(self, a2, 8, 1);
}

uint64_t __29__ADIDManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_1 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (ADIDManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADIDManager;
  v2 = [(ADIDManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ADIDManager *)v2 loadIDs];
  }
  return v3;
}

- (BOOL)loadIDs
{
  v3 = +[ADCoreSettings sharedInstance];
  v4 = [v3 iTunesAccountDSID];

  if (!v4 || ![(__CFString *)v4 length])
  {

    v4 = @"0";
  }
  objc_super v5 = [NSString stringWithFormat:@"Loading the record for DSID: %@", v4];
  _ADLog(@"iAdIDLogging", v5, 0);

  v6 = [(ADIDManager *)self reloadRecords:v4];
  if (!v6)
  {
    v7 = [NSString stringWithFormat:@"No record was found for the current user (%@). Forcing a reconciliation.", v4];
    _ADLog(@"iAdInternalLogging", v7, 16);

    id v8 = [(ADIDManager *)self loadFakeRecord:v4];
    [(ADIDManager *)self forceReconcile:&__block_literal_global_2];
  }

  return v6 != 0;
}

- (id)reloadRecords:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1D25F33C0]();
  v6 = self;
  objc_sync_enter(v6);
  v7 = [(ADIDManager *)v6 getDSIDDicFromStorage];
  id v8 = (void *)[v7 mutableCopy];

  v9 = [v8 objectForKey:@"kADiAdIDManager_AppUsageVector"];

  if (v9)
  {
    [v8 removeObjectForKey:@"kADiAdIDManager_AppUsageVector"];
    v10 = NSString;
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "AD_jsonString");
    v13 = [v10 stringWithFormat:@"[%@]: Deprecated App Usage Vector detected. Rewriting the record as %@.", v11, v12];
    _ADLog(@"iAdIDLogging", v13, 0);

    v14 = (void *)[v8 copy];
    [(ADIDManager *)v6 setDSIDDicToStorage:v14];
  }
  v15 = (void *)[v8 copy];
  v16 = [(ADIDManager *)v6 dsidRecord:v4 fromDict:v15];

  objc_sync_exit(v6);
  [(ADIDManager *)v6 setActiveDSIDRecord:v16];

  v17 = [(ADIDManager *)v6 activeDSIDRecord];

  return v17;
}

- (id)getDSIDDicFromStorage
{
  unsigned int v10 = 0;
  v2 = GetKeychainPropertyListForKey(@"kADiAdIDStorageKey", (OSStatus *)&v10);
  unsigned int v3 = v10;
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    v7 = [v4 stringWithFormat:@"[%@]: Error %d reading keychain: %@", v5, v10, @"kADiAdIDStorageKey"];
    _ADLog(@"iAdIDLogging", v7, 16);
  }
  else
  {
    v7 = objc_msgSend(v2, "AD_jsonString");
    id v8 = [v4 stringWithFormat:@"[%@]: Successfully read keychain: %@", v6, v7];
    _ADLog(@"iAdIDLogging", v8, 0);
  }
  return v2;
}

- (void)setActiveDSIDRecord:(id)a3
{
}

- (id)dsidRecord:(id)a3 fromDict:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    id v8 = [v7 valueForKey:@"iAdIDRecordsVersion"];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
    uint64_t v10 = [v8 compare:v9];

    if (v10)
    {
      uint64_t v11 = [NSString stringWithFormat:@"Invalid version key %@", v8];
      _ADLog(@"ToroLogging", v11, 16);
    }
    v12 = [v7 valueForKey:@"kADiADIDMonthResetKey"];
    monthlyResetArray = self->_monthlyResetArray;
    self->_monthlyResetArray = v12;

    v14 = [v7 valueForKey:@"kADiAdIDManager_RecordsKey"];

    if (v14)
    {
      v15 = [v14 valueForKey:v6];
      if (v15) {
        v16 = [[DSIDRecord alloc] initWithDSID:v6 serializedRecord:v15 version:3];
      }
      else {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)forceReconcile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D25F33C0]();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ap.adprivacyd.idmanager" options:4096];
  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F27196D8];
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  id v7 = [v5 remoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__ADIDManager_AdCore__forceReconcile___block_invoke;
  v10[3] = &unk_1E68A0778;
  id v8 = v3;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 forceReconcile:v10];
}

uint64_t __38__ADIDManager_AdCore__forceReconcile___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

void __30__ADIDManager_AdCore__loadIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithFormat:@"Reconciliation should be done. Waiting for the 'kADIDManager_ChangedNotification' notification to reload the keychain. Error: %@", a2];
  _ADLog(@"iAdInternalLogging", v2, 0);
}

- (id)loadFakeRecord:(id)a3
{
  v61[3] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v4 = [NSString stringWithFormat:@"Loading fake records for DSID %@", v40];
  _ADLog(@"iAdStateLogging", v4, 0);

  uint64_t v5 = [@"BAAAAAAD" length];
  obj = self;
  objc_sync_enter(obj);
  v60[0] = @"iAdIDRecordsVersion";
  v60[1] = @"kADiADIDMonthResetKey";
  v61[0] = @"3";
  v61[1] = MEMORY[0x1E4F1CBF0];
  v60[2] = @"kADiAdIDManager_RecordsKey";
  id v58 = v40;
  v56 = @"kADDSIDRecord_iAdIDRecordsKey";
  v54[0] = @"0";
  v52 = @"kADiAdIDRecord_iAdIDKey";
  v39 = [MEMORY[0x1E4F29128] UUID];
  v38 = [v39 UUIDString];
  v37 = objc_msgSend(v38, "stringByReplacingCharactersInRange:withString:", 0, v5, @"BAAAAAAD");
  v53 = v37;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  v55[0] = v36;
  v54[1] = @"1";
  v50 = @"kADiAdIDRecord_iAdIDKey";
  v35 = [MEMORY[0x1E4F29128] UUID];
  v34 = [v35 UUIDString];
  v33 = objc_msgSend(v34, "stringByReplacingCharactersInRange:withString:", 0, v5, @"BAAAAAAD");
  v51 = v33;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v55[1] = v32;
  v54[2] = @"2";
  v48 = @"kADiAdIDRecord_iAdIDKey";
  v31 = [MEMORY[0x1E4F29128] UUID];
  v30 = [v31 UUIDString];
  v29 = objc_msgSend(v30, "stringByReplacingCharactersInRange:withString:", 0, v5, @"BAAAAAAD");
  v49 = v29;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v55[2] = v28;
  v54[3] = @"3";
  v46 = @"kADiAdIDRecord_iAdIDKey";
  v27 = [MEMORY[0x1E4F29128] UUID];
  v26 = [v27 UUIDString];
  v25 = objc_msgSend(v26, "stringByReplacingCharactersInRange:withString:", 0, v5, @"BAAAAAAD");
  v47 = v25;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  v55[3] = v24;
  v54[4] = @"4";
  v44 = @"kADiAdIDRecord_iAdIDKey";
  v23 = [MEMORY[0x1E4F29128] UUID];
  v22 = [v23 UUIDString];
  v21 = objc_msgSend(v22, "stringByReplacingCharactersInRange:withString:", 0, v5, @"BAAAAAAD");
  v45 = v21;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v55[4] = v6;
  v54[5] = @"6";
  v42 = @"kADiAdIDRecord_iAdIDKey";
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  id v9 = objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", 0, v5, @"BAAAAAAD");
  v43 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v55[5] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:6];
  v57 = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v59 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  v61[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];

  v15 = [(ADIDManager *)obj dsidRecord:v40 fromDict:v14];
  [(ADIDManager *)obj setActiveDSIDRecord:v15];

  objc_sync_exit(obj);
  v16 = NSString;
  v17 = [(ADIDManager *)obj activeDSIDRecord];
  v18 = [v16 stringWithFormat:@"Fake record has been loaded: %@", v17];
  _ADLog(@"iAdStateLogging", v18, 0);

  v19 = [(ADIDManager *)obj activeDSIDRecord];

  return v19;
}

- (id)encryptedIDForClientType:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v4->_activeDSIDRecord encryptedIDForClientType:a3];
  id v6 = (void *)[v5 copy];

  objc_sync_exit(v4);
  return v6;
}

- (int64_t)PersonalizedAdsMonthResetCount
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(NSArray *)v2->_monthlyResetArray count];
  objc_sync_exit(v2);

  return v3;
}

- (void)reloadRecords:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ADServer workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__ADIDManager_reloadRecords_completionHandler___block_invoke;
  v11[3] = &unk_1E68A0A78;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

void __47__ADIDManager_reloadRecords_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reloadRecords:*(void *)(a1 + 40)];
  id v4 = (id)[v2 copy];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)retrieveDeviceIDs
{
  id v2 = [(ADIDManager *)self deviceIdentifiers];
  uint64_t v3 = (void *)[v2 copy];

  id v4 = NSString;
  uint64_t v5 = objc_msgSend(v3, "AD_jsonStringWithPrettyPrint:", 1);
  id v6 = [v4 stringWithFormat:@"Device IDs:%@\n", v5];
  _ADLog(@"iAdIDLogging", v6, 1);

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AdPlatforms"];
  if ([v7 BOOLForKey:@"AutomationLoggingEnabled"]) {
    objc_msgSend(v3, "AD_jsonStringWithPrettyPrint:", 1);
  }
  else {
  id v8 = [v3 descriptionInStringsFileFormat];
  }

  return v8;
}

- (NSArray)monthlyResetArray
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMonthlyResetArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlyResetArray, 0);
  objc_storeStrong((id *)&self->_activeDSIDRecord, 0);
}

- (BOOL)setDSIDDicToStorage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 copy];
  uint64_t v5 = SetKeychainPropertyListForKey(@"kADiAdIDStorageKey", (uint64_t)v4);

  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = v7;
  if (v5)
  {
    id v9 = [v6 stringWithFormat:@"[%@]: Error %d storing keychain: %@", v7, v5, @"kADiAdIDStorageKey"];
    _ADLog(@"iAdIDLogging", v9, 16);
  }
  else
  {
    id v9 = objc_msgSend(v3, "AD_jsonString");
    id v10 = [v6 stringWithFormat:@"[%@]: Successfully stored disd to keychain: %@", v8, v9];
    _ADLog(@"iAdIDLogging", v10, 0);
  }
  return v5 == 0;
}

- (BOOL)clearDSIDRecords
{
  uint64_t v2 = ADWriteDataToKeychain(@"kADiAdIDStorageKey", 0);
  if (v2)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Error resetting records: %d", v2);
    _ADLog(@"iAdInternalLogging", v3, 16);
  }
  return v2 == 0;
}

@end