@interface ADIDManager(Private)
+ (uint64_t)initialize;
- (BOOL)scheduleReconciliation:()Private;
- (id)init;
- (id)reconcileOperations;
- (id)save;
- (id)saveAndNotifyIfNecessary;
- (uint64_t)reconcileInProgress;
- (uint64_t)runTask:()Private;
- (uint64_t)scheduleDailyUpdate;
- (uint64_t)setReconcileOperations:()Private;
- (void)cancelPendingReconcile;
- (void)checkOnTask:()Private activity:;
- (void)deleteRecords:()Private;
- (void)finishedReconciling:()Private withError:;
- (void)handleAccountChange:()Private;
- (void)incrementMonthlyResetCount;
- (void)notifyActiveRecordChanged;
- (void)performOperationAfterReconcile:()Private;
- (void)performOperationWhenNotReconciling:()Private;
- (void)prepareForPushNotification;
- (void)reconcile:()Private;
- (void)saveDataForPCD;
- (void)setDSID:()Private completionHandler:;
- (void)updateAccountData:()Private;
@end

@implementation ADIDManager(Private)

- (void)setDSID:()Private completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  v13[4] = __Block_byref_object_dispose__0;
  id v14 = (id)[v6 copy];
  v8 = [MEMORY[0x263F24230] workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__ADIDManager_Private__setDSID_completionHandler___block_invoke;
  v10[3] = &unk_264669CA0;
  v10[4] = a1;
  v12 = v13;
  id v9 = v7;
  id v11 = v9;
  [v8 addOperationWithBlock:v10];

  _Block_object_dispose(v13, 8);
}

- (void)notifyActiveRecordChanged
{
  v0 = [NSString stringWithFormat:@"Active record changed. Posting %@", @"kADIDManager_ChangedNotification"];
  _ADLog();

  id v1 = [MEMORY[0x263F087C8] defaultCenter];
  [v1 postNotificationName:@"kADIDManager_ChangedNotification" object:*MEMORY[0x263F24130]];
}

- (void)saveDataForPCD
{
  v2 = [NSString stringWithFormat:@"Saving latest accounts data for promotedcontentd."];
  _ADLog();

  id v4 = [a1 activeDSIDRecord];
  v3 = [v4 idAccountsDictionaryRepresentation];
  ADSaveToPromotedContentKeychain();
  [a1 notifyActiveRecordChanged];
}

+ (uint64_t)initialize
{
  _reconcileRetryCount = 0;
  _reconcileOperations = (uint64_t)objc_alloc_init(MEMORY[0x263F241C8]);

  return MEMORY[0x270F9A758]();
}

- (id)init
{
  v16.receiver = a1;
  v16.super_class = (Class)&off_26D5A9AE8;
  id v1 = objc_msgSendSuper2(&v16, sel_init);
  if (v1)
  {
    v2 = (void *)_reconcileWatchdogToken;
    _reconcileWatchdogToken = 0;

    uint64_t v3 = [MEMORY[0x263EFF980] array];
    id v4 = (void *)_postReconcileOperations;
    _postReconcileOperations = v3;

    [MEMORY[0x263F24188] registerTaskDelegate:v1 forRequestID:@"com.apple.ap.adprivacyd.reconcile"];
    [MEMORY[0x263F24188] registerTaskDelegate:v1 forRequestID:@"com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"];
    v5 = [MEMORY[0x263F241C0] sharedInstance];
    int v6 = [v5 unitTesting];

    if (v6)
    {
      id v7 = [NSString stringWithFormat:@"WARNING: Check On Task has been disabled. If you see this outside of unit tests, Please file a radar..."];
      _ADLog();
    }
    else
    {
      v8 = [MEMORY[0x263F24188] sharedInstance];
      [v8 checkOnTask:@"com.apple.ap.adprivacyd.reconcile"];

      id v7 = [MEMORY[0x263F24188] sharedInstance];
      [v7 checkOnTask:@"com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"];
    }

    if (MGGetBoolAnswer())
    {
      id v9 = [MEMORY[0x263F087C8] defaultCenter];
      uint64_t v10 = *MEMORY[0x263F24130];
      id v11 = [MEMORY[0x263F08A48] mainQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __28__ADIDManager_Private__init__block_invoke;
      v14[3] = &unk_2646696E8;
      id v15 = v1;
      id v12 = (id)[v9 addObserverForName:@"ClearMonthlyResetCount" object:v10 queue:v11 usingBlock:v14];
    }
  }
  return v1;
}

- (void)prepareForPushNotification
{
  id v1 = [a1 activeDSIDRecord];
  [v1 setSegmentDataTimestamp:1];
}

- (void)deleteRecords:()Private
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263F24230] workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__ADIDManager_Private__deleteRecords___block_invoke;
    v6[3] = &unk_264669710;
    v6[4] = a1;
    id v7 = v4;
    [v5 addOperationWithBlock:v6];
  }
}

- (void)incrementMonthlyResetCount
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-2592000.0];
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;

  uint64_t v19 = v5;
  int v6 = [a1 monthlyResetArray];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __50__ADIDManager_Private__incrementMonthlyResetCount__block_invoke;
  id v15 = &unk_264669CC8;
  v17 = v18;
  id v7 = v2;
  id v16 = v7;
  [v6 enumerateObjectsUsingBlock:&v12];

  v8 = NSNumber;
  id v9 = objc_msgSend(MEMORY[0x263EFF910], "date", v12, v13, v14, v15);
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  [v7 addObject:v10];

  id v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
  [a1 setMonthlyResetArray:v11];

  _Block_object_dispose(v18, 8);
}

- (id)save
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = [a1 activeDSIDRecord];

  if (v2)
  {
    uint64_t v3 = [a1 activeDSIDRecord];
    if (v3
      && ([a1 activeDSIDRecord],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 dirty],
          v4,
          v3,
          !v5))
    {
      v21 = 0;
    }
    else
    {
      id v6 = a1;
      objc_sync_enter(v6);
      id v7 = [v6 activeDSIDRecord];
      uint64_t v8 = [NSString stringWithFormat:@"com.apple.adprivacyd [%@ save] starting", objc_opt_class()];
      takeXPCTransaction();
      v43 = (void *)v8;
      id v9 = [MEMORY[0x263F241D8] sharedInstance];
      uint64_t v10 = [v9 getDSIDDicFromStorage];
      id v11 = (void *)[v10 mutableCopy];

      if (!v11)
      {
        id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 3);
        id v11 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"iAdIDRecordsVersion", 0);
      }
      id v14 = [v11 valueForKey:@"kADiAdIDManager_RecordsKey"];
      id v15 = (id)[v14 mutableCopy];

      if (!v15) {
        id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      id v16 = [v7 DSID];
      v17 = [v15 valueForKey:v16];

      v18 = NSString;
      uint64_t v19 = [v7 DSID];
      if (v17) {
        [v18 stringWithFormat:@"Overwriting existing DSID record for %@.", v19];
      }
      else {
      uint64_t v20 = [v18 stringWithFormat:@"Writing new record for DSID %@.", v19];
      }
      _ADLog();

      v22 = [v7 dictionaryRepresentation];
      v23 = [v7 DSID];
      [v15 setObject:v22 forKeyedSubscript:v23];

      [v11 setObject:v15 forKeyedSubscript:@"kADiAdIDManager_RecordsKey"];
      v24 = [v6 monthlyResetArray];
      v25 = (void *)[v24 copy];
      [v11 setObject:v25 forKeyedSubscript:@"kADiADIDMonthResetKey"];

      v26 = [MEMORY[0x263F241D8] sharedInstance];
      LOBYTE(v20) = [v26 setDSIDDicToStorage:v11];

      [v6 saveDataForPCD];
      v27 = NSNumber;
      v28 = [v6 monthlyResetArray];
      v29 = objc_msgSend(v27, "numberWithUnsignedLong:", objc_msgSend(v28, "count"));

      ADSaveToPromotedContentKeychain();
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"monthlyIDResetCount is %d.", objc_msgSend(v29, "intValue"));
      _ADLog();

      releaseXPCTransaction();
      if (v20)
      {
        [v7 setDirty:0];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v31 = [v7 ADIDRecords];
        v32 = [v31 allValues];

        uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v45 != v34) {
                objc_enumerationMutation(v32);
              }
              [*(id *)(*((void *)&v44 + 1) + 8 * i) setDirty:0];
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v33);
        }

        v36 = v43;
        v21 = 0;
      }
      else
      {
        v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:0 andDescription:@"Error writing DSID record to keychain."];
        if (v21)
        {
          v37 = NSString;
          v38 = [v7 DSID];
          uint64_t v39 = [v21 code];
          v40 = [v21 localizedDescription];
          v41 = [v37 stringWithFormat:@"Failed to save DSID record for %@ to keychain with error %ld: %@", v38, v39, v40];
          _ADLog();
        }
        v36 = v43;
      }

      objc_sync_exit(v6);
    }
  }
  else
  {
    v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:0, @"Aborting save, no DSID record." andDescription];
    objc_msgSend(v21, "AD_Log:", @"iAdIDLogging");
  }

  return v21;
}

- (id)saveAndNotifyIfNecessary
{
  id v2 = [a1 activeDSIDRecord];
  int v3 = [v2 shouldSendNotification];

  uint64_t v4 = [a1 save];
  if (!v4 && v3)
  {
    [a1 notifyActiveRecordChanged];
    int v5 = [a1 activeDSIDRecord];
    [v5 setNotificationRequired:0];
  }

  return v4;
}

- (void)performOperationWhenNotReconciling:()Private
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  if (_reconcileInProgress == 1)
  {
    int v5 = (void *)_postReconcileOperations;
    id v6 = (void *)MEMORY[0x223CA6810](v7);
    [v5 addObject:v6];
  }
  else
  {
    id v6 = [MEMORY[0x263F24230] workQueue];
    [v6 addOperationWithBlock:v7];
  }

  objc_sync_exit(v4);
}

- (void)performOperationAfterReconcile:()Private
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  int v5 = (void *)_postReconcileOperations;
  id v6 = (void *)MEMORY[0x223CA6810](v7);
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)finishedReconciling:()Private withError:
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v43 = a3;
  id v44 = a4;
  id v6 = a1;
  objc_sync_enter(v6);
  _reconcileInProgress = 0;
  objc_sync_exit(v6);

  id v7 = [v6 activeDSIDRecord];
  uint64_t v8 = [v7 DSID];

  long long v45 = [v6 saveAndNotifyIfNecessary];
  if (v45)
  {
    id v9 = [NSString stringWithFormat:@"[%@] Error %ld saving the record to the keychain. We will retry...", objc_opt_class(), objc_msgSend(v45, "code")];
    _ADLog();

LABEL_5:
    ++_reconcileRetryCount;
    double v16 = (double)RequestRetryDelay();
    goto LABEL_6;
  }
  uint64_t v10 = NSString;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = v11;
  if (v44)
  {
    uint64_t v13 = [v44 code];
    id v14 = [v44 localizedDescription];
    id v15 = [v10 stringWithFormat:@"[%@]: Error %ld reconciling DSID record: %@", v12, v13, v14];
    _ADLog();

    [v6 logIDs:@"IDs after failed reconcile:"];
    goto LABEL_5;
  }
  v35 = [v10 stringWithFormat:@"[%@]: Successfully reconciled DSID record for DSID %@", v11, v8];
  _ADLog();

  [v6 logIDs:@"Final reconciled IDs:"];
  _reconcileRetryCount = 0;
  v36 = [v6 activeDSIDRecord];
  int v37 = [v36 segmentDataTimestamp];
  v38 = [MEMORY[0x263F241C0] sharedInstance];
  int v39 = [v38 segmentRetrievalInterval];
  v40 = [MEMORY[0x263EFF910] date];
  int v41 = v39 + v37 - objc_msgSend(v40, "AD_toServerTime");

  if (v41 < 0)
  {
    v42 = [MEMORY[0x263F241C0] sharedInstance];
    int v41 = [v42 segmentRetrievalInterval];
  }
  double v16 = (double)v41;
LABEL_6:
  [v6 scheduleReconciliation:v16];
  if (v8)
  {
    v17 = [MEMORY[0x263F241C0] sharedInstance];
    v18 = [v17 iTunesAccountDSID];
    char v19 = [v18 isEqualToString:v8];

    if ((v19 & 1) == 0)
    {
      uint64_t v20 = NSString;
      uint64_t v21 = objc_opt_class();
      v22 = [MEMORY[0x263F241C0] sharedInstance];
      v23 = [v22 iTunesAccountDSID];
      v24 = [v20 stringWithFormat:@"[%@]: DSID changed from %@ to %@ during reconcile process. Posting handleAccountChange to work queue.", v21, v8, v23];
      _ADLog();

      v25 = [MEMORY[0x263F24230] workQueue];
      [v25 addOperationWithBlock:&__block_literal_global_2];
    }
  }
  if (v43) {
    v43[2]();
  }
  [(id)_reconcileOperations reset];
  releaseXPCTransaction();
  v26 = [MEMORY[0x263F24260] sharedInstance];
  [v26 removeWatchdogWithToken:_reconcileWatchdogToken];

  id v27 = v6;
  objc_sync_enter(v27);
  if ([(id)_postReconcileOperations count])
  {
    v28 = [NSString stringWithFormat:@"Running post-reconcile operations"];
    _ADLog();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v29 = (id)_postReconcileOperations;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v47 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v34 = [MEMORY[0x263F24230] workQueue];
        [v34 addOperationWithBlock:v33];
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v30);
  }

  if ([(id)_postReconcileOperations count]) {
    [(id)_postReconcileOperations removeAllObjects];
  }
  objc_sync_exit(v27);
}

- (void)updateAccountData:()Private
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  int v5 = [a1 activeDSIDRecord];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ADIDManager_Private__updateAccountData___block_invoke;
  v7[3] = &unk_264669D40;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = a1;
  id v8 = v6;
  [v5 retrieveSegmentDataFromiTunes:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)reconcile:()Private
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  if (_reconcileInProgress == 1)
  {
    id v6 = [NSString stringWithFormat:@"[%@]: DSID record reconcile already in progress.", objc_opt_class()];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:1 andDescription:v6];
    objc_msgSend(v7, "AD_Log:", @"iAdIDLogging");
    if (v4) {
      v4[2](v4, v7);
    }

    objc_sync_exit(v5);
  }
  else
  {
    _reconcileInProgress = 1;
    objc_sync_exit(v5);

    id v8 = [MEMORY[0x263F24260] sharedInstance];
    uint64_t v9 = [v8 createNewWatchdog:@"Reconcile in progress" withTimer:1800];
    uint64_t v10 = (void *)_reconcileWatchdogToken;
    _reconcileWatchdogToken = v9;

    uint64_t v11 = [NSString stringWithFormat:@"com.apple.adprivacyd [%@ reconcile]", objc_opt_class()];
    uint64_t v12 = (void *)_reconcileReason;
    _reconcileReason = v11;

    takeXPCTransaction();
    uint64_t v13 = +[ADAdTrackingSchedulingManager sharedInstance];
    [v13 refreshConfiguration:0];

    id v14 = [MEMORY[0x263F241C0] sharedInstance];
    id v15 = [v14 iTunesAccountDSID];

    if (!v15 || ![(__CFString *)v15 length])
    {

      id v15 = @"0";
    }
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__0;
    v23[4] = __Block_byref_object_dispose__0;
    id v24 = 0;
    objc_initWeak(&location, v5);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __34__ADIDManager_Private__reconcile___block_invoke;
    v17[3] = &unk_264669D90;
    objc_copyWeak(&v21, &location);
    char v19 = v4;
    double v16 = v15;
    v18 = v16;
    uint64_t v20 = v23;
    [v5 setDSID:v16 completionHandler:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(v23, 8);
  }
}

- (void)handleAccountChange:()Private
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F24230] workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ADIDManager_Private__handleAccountChange___block_invoke;
  v7[3] = &unk_264669710;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)cancelPendingReconcile
{
  id v0 = [MEMORY[0x263F24188] sharedInstance];
  [v0 cancelBackgroundTask:@"com.apple.ap.adprivacyd.reconcile"];
}

- (BOOL)scheduleReconciliation:()Private
{
  uint64_t v3 = _reconcileRetryCount;
  if (_reconcileRetryCount >= 4)
  {
    v18 = [NSString stringWithFormat:@"[%@]: Not rescheduling reconcile, MAX_RETRY_COUNT of %d exceeded.", objc_opt_class(), 3];
    _ADLog();

    _reconcileRetryCount = 0;
    id v5 = [MEMORY[0x263F241C0] sharedInstance];
    objc_msgSend(a1, "scheduleReconciliation:", (double)(int)objc_msgSend(v5, "segmentRetrievalInterval"));
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F24180]) initWithID:@"com.apple.ap.adprivacyd.reconcile"];
    [v5 setPropertyAsInteger:@"kBackgroundTaskProperty_RetryCount" value:_reconcileRetryCount];
    [v5 setDelay:(uint64_t)a2];
    [v5 setRequireClassCData:1];
    [v5 setRequireBuddyComplete:1];
    id v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = (int)((double)(int)objc_msgSend(v6, "AD_toServerTime") + a2);
    id v8 = [a1 activeDSIDRecord];
    [v8 setNextReconcileTimestamp:v7];

    uint64_t v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v5 delay];
    uint64_t v12 = (void *)MEMORY[0x263EFF910];
    uint64_t v13 = [a1 activeDSIDRecord];
    id v14 = objc_msgSend(v12, "AD_dateFromServerTime:", objc_msgSend(v13, "nextReconcileTimestamp"));
    id v15 = objc_msgSend(v14, "AD_localDateTimeAsString");
    double v16 = [v9 stringWithFormat:@"[%@]: Rescheduling DSID record reconcile to run again in %lld seconds (%@).", v10, v11, v15];
    _ADLog();

    v17 = [MEMORY[0x263F24188] sharedInstance];
    [v17 addBackgroundTask:v5];
  }
  return v3 < 4;
}

- (uint64_t)scheduleDailyUpdate
{
  id v0 = (void *)[objc_alloc(MEMORY[0x263F24180]) initWithID:@"com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"];
  [v0 setGracePeriod:300];
  id v1 = [NSString stringWithCString:*MEMORY[0x263EF8290] encoding:4];
  [v0 setPriority:v1];

  [v0 setAllowBattery:1];
  [v0 setDelay:86400];
  [v0 setIsRepeating:0];
  [v0 setRequireSleep:1];
  [v0 setRequireClassCData:1];
  [v0 setRequiresNetworkConnectivity:0];
  [v0 setRequireBuddyComplete:1];
  id v2 = [NSString stringWithFormat:@"[%@]: Rescheduling deviceNewsPlusSubscriberID rotation to run again in %lld seconds.", objc_opt_class(), objc_msgSend(v0, "delay")];
  _ADLog();

  uint64_t v3 = [MEMORY[0x263F24188] sharedInstance];
  [v3 addBackgroundTask:v0];

  return 1;
}

- (uint64_t)runTask:()Private
{
  id v4 = a3;
  id v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 requestIdentifier];
  id v8 = [v5 stringWithFormat:@"[%@]: Received request to run background task %@.", v6, v7];
  _ADLog();

  uint64_t v9 = [v4 requestIdentifier];
  LODWORD(v6) = [v9 isEqualToString:@"com.apple.ap.adprivacyd.reconcile"];

  if (v6)
  {
    if (([v4 continueTask] & 1) == 0)
    {
      uint64_t v10 = [NSString stringWithFormat:@"[%@] ERROR: Unable to mark the task as being continue. Please file a radar...", objc_opt_class()];
      _ADLog();
    }
    uint64_t v11 = [MEMORY[0x263F24230] workQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __32__ADIDManager_Private__runTask___block_invoke;
    v19[3] = &unk_264669AA8;
    v19[4] = a1;
    id v20 = v4;
    [v11 addOperationWithBlock:v19];

    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v13 = [v4 requestIdentifier];
    int v14 = [v13 isEqualToString:@"com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"];

    if (v14)
    {
      id v15 = [NSString stringWithFormat:@"[%@]: Rotate deviceNewsPlusSubscriberID", objc_opt_class()];
      _ADLog();

      double v16 = [a1 activeDSIDRecord];
      uint64_t v12 = [v16 resetDeviceNewsPlusSubscriberIDIfNeeded];

      if (v12) {
        id v17 = (id)[a1 save];
      }
      [a1 scheduleDailyUpdate];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

  return v12;
}

- (void)checkOnTask:()Private activity:
{
  id v11 = a3;
  uint64_t v6 = a4;
  if (([v11 isEqualToString:@"com.apple.ap.adprivacyd.reconcile"] & 1) != 0
    || [v11 isEqualToString:@"com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"])
  {
    xpc_object_t v7 = xpc_activity_copy_criteria(v6);
    if (!v7)
    {
      if ([v11 isEqualToString:@"com.apple.ap.adprivacyd.reconcile"])
      {
        uint64_t v9 = [NSString stringWithFormat:@"[%@]: Checking in on task %@ - PLIST Launch", objc_opt_class(), v11];
        _ADLog();

        [a1 scheduleReconciliation:0.0];
        goto LABEL_5;
      }
      if ([v11 isEqualToString:@"com.apple.ap.adprivacyd.rotateDeviceNewsPlusSubscriberID"])
      {
        uint64_t v10 = [NSString stringWithFormat:@"[%@]: Checking in on task %@ - PLIST Launch", objc_opt_class(), v11];
        _ADLog();

        [a1 scheduleDailyUpdate];
        goto LABEL_5;
      }
    }
    id v8 = [NSString stringWithFormat:@"[%@]: Reconcile task %@ already scheduled: %@", objc_opt_class(), v11, v7];
    _ADLog();

LABEL_5:
  }
}

- (uint64_t)reconcileInProgress
{
  id v1 = a1;
  objc_sync_enter(v1);
  uint64_t v2 = _reconcileInProgress;
  objc_sync_exit(v1);

  return v2;
}

- (id)reconcileOperations
{
  return (id)_reconcileOperations;
}

- (uint64_t)setReconcileOperations:()Private
{
  _reconcileOperations = [a3 copy];

  return MEMORY[0x270F9A758]();
}

@end