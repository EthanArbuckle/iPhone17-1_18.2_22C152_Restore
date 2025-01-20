@interface LKLogEventController
+ (id)loginDetailsPredicate;
- (BOOL)_isKeychainLog:(id)a3;
- (BOOL)_needToParseSecurityLogs;
- (BOOL)streamingLogs;
- (LKLogEventController)init;
- (LKSwitchOperation)switchOperation;
- (NSDate)logEnumarationEndTime;
- (NSMutableArray)switchOperationsMutableArray;
- (NSMutableDictionary)mutableKeychainItemsAddedByActivityID;
- (OS_dispatch_semaphore)dynamicdsema;
- (id)logEventHandler;
- (id)loginDetailsWithStartDate:(id)a3 logArchivePath:(id)a4;
- (void)_handleKeychainItemEventFromLogEvent:(id)a3;
- (void)_parseBuddLog:(id)a3;
- (void)_parseKeychainLog:(id)a3;
- (void)_parseSpringBoardLog:(id)a3;
- (void)_parseUserManagementFrameworkLog:(id)a3;
- (void)enumurateLogEventsSynchronouslyFromDate:(id)a3 predicate:(id)a4 logEventHandler:(id)a5;
- (void)enumuratePersistentLogsSynchronouslyFromDate:(id)a3 logArchivePath:(id)a4 predicate:(id)a5 logEventHandler:(id)a6;
- (void)setDynamicdsema:(id)a3;
- (void)setLogEnumarationEndTime:(id)a3;
- (void)setLogEventHandler:(id)a3;
- (void)setMutableKeychainItemsAddedByActivityID:(id)a3;
- (void)setStreamingLogs:(BOOL)a3;
- (void)setSwitchOperation:(id)a3;
- (void)setSwitchOperationsMutableArray:(id)a3;
@end

@implementation LKLogEventController

+ (id)loginDetailsPredicate
{
  if (loginDetailsPredicate_onceToken != -1) {
    dispatch_once(&loginDetailsPredicate_onceToken, &__block_literal_global);
  }
  v2 = (void *)loginDetailsPredicate_predicate;
  return v2;
}

void __45__LKLogEventController_loginDetailsPredicate__block_invoke()
{
  v8[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F08730];
  v1 = [MEMORY[0x263F08A98] predicateWithFormat:@"((senderImagePath contains \"UserManagement\""];
  v8[0] = v1;
  v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"((senderImagePath contains \"Security\""];
  v8[1] = v2;
  v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"((subsystem contains \"com.apple.purplebuddy\""];
  v8[2] = v3;
  v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"((subsystem contains \"com.apple.FrontBoard\""];
  v8[3] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v0 orPredicateWithSubpredicates:v5];
  v7 = (void *)loginDetailsPredicate_predicate;
  loginDetailsPredicate_predicate = v6;
}

- (LKLogEventController)init
{
  v11.receiver = self;
  v11.super_class = (Class)LKLogEventController;
  v2 = [(LKLogEventController *)&v11 init];
  if (v2)
  {
    LKRegisterLoginKitLogging();
    uint64_t v3 = objc_opt_new();
    switchOperationsMutableArray = v2->_switchOperationsMutableArray;
    v2->_switchOperationsMutableArray = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    switchOperation = v2->_switchOperation;
    v2->_switchOperation = (LKSwitchOperation *)v5;

    uint64_t v7 = objc_opt_new();
    mutableKeychainItemsAddedByActivityID = v2->_mutableKeychainItemsAddedByActivityID;
    v2->_mutableKeychainItemsAddedByActivityID = (NSMutableDictionary *)v7;

    id logEventHandler = v2->_logEventHandler;
    v2->_id logEventHandler = 0;
  }
  return v2;
}

- (id)logEventHandler
{
  id logEventHandler = self->_logEventHandler;
  if (!logEventHandler)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__LKLogEventController_logEventHandler__block_invoke;
    v8[3] = &unk_2645FC1A8;
    objc_copyWeak(&v9, &location);
    v4 = (void *)MEMORY[0x223C96140](v8);
    id v5 = self->_logEventHandler;
    self->_id logEventHandler = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id logEventHandler = self->_logEventHandler;
  }
  uint64_t v6 = (void *)MEMORY[0x223C96140](logEventHandler, a2);
  return v6;
}

void __39__LKLogEventController_logEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained streamingLogs]
      && ([v3 date],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [v5 logEnumarationEndTime],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v6 compare:v7],
          v7,
          v6,
          v8 == 1))
    {
      id v9 = [v5 dynamicdsema];

      if (v9)
      {
        v10 = LKLogDefault;
        if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_2221A9000, v10, OS_LOG_TYPE_DEFAULT, "LoginDetails: Login Ended", v12, 2u);
        }
        objc_super v11 = [v5 dynamicdsema];
        dispatch_semaphore_signal(v11);
      }
    }
    else
    {
      if ([v3 loggedByFramework:@"UserManagement"])
      {
        [v5 _parseUserManagementFrameworkLog:v3];
      }
      else if ([v3 loggedByProcess:@"budd"])
      {
        [v5 _parseBuddLog:v3];
      }
      else if ([v3 loggedByProcess:@"SpringBoard"])
      {
        [v5 _parseSpringBoardLog:v3];
      }
      if ([v5 _needToParseSecurityLogs]
        && [v5 _isKeychainLog:v3])
      {
        [v5 _parseKeychainLog:v3];
      }
    }
  }
}

- (void)_parseBuddLog:(id)a3
{
  id v4 = a3;
  if ([v4 containsMessage:@"Buddy: Starting EMCS Recovery..."])
  {
    id v5 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2221A9000, v5, OS_LOG_TYPE_DEFAULT, "LoginDetails: EMCS Recovery started", buf, 2u);
    }
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [v4 date];
    [v6 setStartTime:v7];

    uint64_t v8 = [(LKLogEventController *)self switchOperation];
    [v8 setRecoverEMCSOperation:v6];
    goto LABEL_10;
  }
  if ([v4 containsMessage:@"Buddy: EMCS recovery completed"])
  {
    id v9 = [(LKLogEventController *)self switchOperation];
    uint64_t v6 = [v9 recoverEMCSOperation];

    v10 = LKLogDefault;
    BOOL v11 = os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v11)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2221A9000, v10, OS_LOG_TYPE_DEFAULT, "We should have a start of recover EMCS recovery. We shouldn't end up here.", v14, 2u);
      }
      goto LABEL_11;
    }
    if (v11)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2221A9000, v10, OS_LOG_TYPE_DEFAULT, "LoginDetails: EMCS Recovery ended", v15, 2u);
    }
    v12 = [v4 date];
    [v6 setEndTime:v12];

    uint64_t v8 = [v6 endTime];
    v13 = [v6 startTime];
    [v8 timeIntervalSinceDate:v13];
    objc_msgSend(v6, "setDuration:");

LABEL_10:
LABEL_11:
  }
}

- (void)_parseSpringBoardLog:(id)a3
{
  id v23 = a3;
  if (![v23 containsMessage:@"Startup transition completed."]) {
    goto LABEL_9;
  }
  id v4 = [v23 date];
  id v5 = [(LKLogEventController *)self switchOperation];
  [v5 setEndTime:v4];

  uint64_t v6 = [(LKLogEventController *)self switchOperation];
  uint64_t v7 = [v6 endTime];
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [(LKLogEventController *)self switchOperation];
  v10 = [v9 startTime];

  if (v10)
  {
    uint64_t v6 = [(LKLogEventController *)self switchOperation];
    BOOL v11 = [v6 endTime];
    v12 = [(LKLogEventController *)self switchOperation];
    v13 = [v12 startTime];
    [v11 timeIntervalSinceDate:v13];
    double v15 = v14;
    v16 = [(LKLogEventController *)self switchOperation];
    [v16 setDuration:v15];

LABEL_5:
  }
  v17 = [(LKLogEventController *)self switchOperation];
  uint64_t v18 = [v17 switchType];

  if (v18)
  {
    v19 = [(LKLogEventController *)self switchOperationsMutableArray];
    v20 = [(LKLogEventController *)self switchOperation];
    v21 = [v20 dictionary];
    [v19 addObject:v21];
  }
  v22 = objc_opt_new();
  [(LKLogEventController *)self setSwitchOperation:v22];

LABEL_9:
  MEMORY[0x270F9A758]();
}

- (void)_parseUserManagementFrameworkLog:(id)a3
{
  id v15 = a3;
  if ([v15 containsMessage:@"switch to user"])
  {
    id v4 = [v15 date];
    id v5 = [(LKLogEventController *)self switchOperation];
    [v5 setStartTime:v4];

    uint64_t v6 = [(LKLogEventController *)self switchOperation];
    uint64_t v7 = v6;
    uint64_t v8 = 1;
  }
  else if ([v15 containsMessage:@"direct switch to User"])
  {
    id v9 = [v15 date];
    v10 = [(LKLogEventController *)self switchOperation];
    [v10 setStartTime:v9];

    uint64_t v6 = [(LKLogEventController *)self switchOperation];
    uint64_t v7 = v6;
    uint64_t v8 = 3;
  }
  else if ([v15 containsMessage:@"Logout to LoginSession Screen"])
  {
    BOOL v11 = [v15 date];
    v12 = [(LKLogEventController *)self switchOperation];
    [v12 setStartTime:v11];

    uint64_t v6 = [(LKLogEventController *)self switchOperation];
    uint64_t v7 = v6;
    uint64_t v8 = 2;
  }
  else
  {
    if (![v15 containsMessage:@"switch to login screen"]) {
      goto LABEL_10;
    }
    v13 = [v15 date];
    double v14 = [(LKLogEventController *)self switchOperation];
    [v14 setStartTime:v13];

    uint64_t v6 = [(LKLogEventController *)self switchOperation];
    uint64_t v7 = v6;
    uint64_t v8 = 4;
  }
  [v6 setSwitchType:v8];

LABEL_10:
}

- (void)_parseKeychainLog:(id)a3
{
  id v12 = a3;
  if ([v12 containsMessage:@"SecItemAdd_ios"])
  {
    [(LKLogEventController *)self _handleKeychainItemEventFromLogEvent:v12];
    goto LABEL_11;
  }
  if ([v12 containsMessage:@"inserted <"])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "activityIdentifier"));
    id v5 = [(LKLogEventController *)self mutableKeychainItemsAddedByActivityID];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v7 = [v12 composedMessage];
    if (([v7 containsString:@"vwht=null"] & 1) == 0)
    {
      uint64_t v8 = [v12 composedMessage];
      int v9 = [v8 containsString:@"sysb=null"];

      if (!v9)
      {
LABEL_9:
        BOOL v11 = [(LKLogEventController *)self mutableKeychainItemsAddedByActivityID];
        [v11 setObject:0 forKeyedSubscript:v4];

        goto LABEL_10;
      }
      v10 = [v12 composedMessage];
      [v6 setKeychainItemAdded:v10];

      uint64_t v7 = [(LKLogEventController *)self switchOperation];
      [v7 addKeychainItemAdditionEvent:v6];
    }

    goto LABEL_9;
  }
LABEL_11:
}

- (BOOL)_isKeychainLog:(id)a3
{
  id v3 = a3;
  if ([v3 loggedByProcess:@"securityd"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 loggedByFramework:@"Security"];
  }

  return v4;
}

- (BOOL)_needToParseSecurityLogs
{
  id v5 = [(LKLogEventController *)self switchOperation];
  uint64_t v6 = [v5 recoverEMCSOperation];
  if (v6)
  {
    v2 = [(LKLogEventController *)self switchOperation];
    id v3 = [v2 recoverEMCSOperation];
    uint64_t v7 = [v3 endTime];
    if (v7)
    {
      BOOL v8 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  int v9 = [(LKLogEventController *)self switchOperation];
  if ([v9 switchType] == 2)
  {
    BOOL v8 = 1;
  }
  else
  {
    v10 = [(LKLogEventController *)self switchOperation];
    BOOL v8 = [v10 switchType] == 3;
  }
  if (v6)
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)_handleKeychainItemEventFromLogEvent:(id)a3
{
  id v4 = a3;
  id v15 = +[LKLogKeychainItemAdditionEvent eventFromLKLogEvent:v4];
  id v5 = [(LKLogEventController *)self mutableKeychainItemsAddedByActivityID];
  uint64_t v6 = NSNumber;
  unint64_t v7 = [v4 activityIdentifier];

  *(float *)&double v8 = (float)v7;
  int v9 = [v6 numberWithFloat:v8];
  [v5 setObject:v15 forKeyedSubscript:v9];

  v10 = [(LKLogEventController *)self switchOperation];
  BOOL v11 = [v10 recoverEMCSOperation];

  if (v11)
  {
    uint64_t v12 = [v11 startTime];
    if (v12)
    {
      v13 = (void *)v12;
      double v14 = [v11 endTime];

      if (!v14) {
        objc_msgSend(v11, "setRecoveredKeychainItemCount:", objc_msgSend(v11, "recoveredKeychainItemCount") + 1);
      }
    }
  }
}

- (void)enumurateLogEventsSynchronouslyFromDate:(id)a3 predicate:(id)a4 logEventHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [MEMORY[0x263F52748] localStore];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke;
  v22[3] = &unk_2645FC1D0;
  v22[4] = &v23;
  [v11 prepareWithCompletionHandler:v22];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  [(LKLogEventController *)self setDynamicdsema:v12];

  [(LKLogEventController *)self setStreamingLogs:1];
  id v13 = objc_alloc(MEMORY[0x263F52750]);
  uint64_t v14 = [v13 initWithSource:v24[5]];
  id v15 = (void *)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream;
  enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream = v14;

  [(id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream setFlags:21];
  [(id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream setFilterPredicate:v9];
  v16 = (void *)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_2;
  v20[3] = &unk_2645FC1F8;
  id v17 = v10;
  id v21 = v17;
  [v16 setEventHandler:v20];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_3;
  v19[3] = &unk_2645FC220;
  v19[4] = self;
  [(id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream setInvalidationHandler:v19];
  [(id)enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler__stream activateStreamFromDate:v8];
  uint64_t v18 = [(LKLogEventController *)self dynamicdsema];
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v23, 8);
}

void __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = a2;
    id v9 = (id)objc_opt_new();
    id v4 = [v3 process];
    [v9 setProcess:v4];

    id v5 = [v3 date];
    [v9 setDate:v5];

    uint64_t v6 = [v3 composedMessage];
    [v9 setComposedMessage:v6];

    unint64_t v7 = [v3 sender];
    [v9 setSenderImagePath:v7];

    uint64_t v8 = [v3 activityIdentifier];
    [v9 setActivityIdentifier:v8];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __90__LKLogEventController_enumurateLogEventsSynchronouslyFromDate_predicate_logEventHandler___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) dynamicdsema];
  dispatch_semaphore_signal(v1);
}

- (void)enumuratePersistentLogsSynchronouslyFromDate:(id)a3 logArchivePath:(id)a4 predicate:(id)a5 logEventHandler:(id)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setLogArchive:v11];

  id v14 = objc_alloc(MEMORY[0x263F08730]);
  v20[0] = v10;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v16 = (void *)[v14 initWithType:1 subpredicates:v15];
  [v13 setPredicate:v16];

  [v13 setOptions:3];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __110__LKLogEventController_enumuratePersistentLogsSynchronouslyFromDate_logArchivePath_predicate_logEventHandler___block_invoke;
  v18[3] = &unk_2645FC248;
  id v19 = v9;
  id v17 = v9;
  [v13 enumerateFromStartDate:v12 toEndDate:0 withBlock:v18];
}

uint64_t __110__LKLogEventController_enumuratePersistentLogsSynchronouslyFromDate_logArchivePath_predicate_logEventHandler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = a2;
    id v4 = objc_opt_new();
    id v5 = [v3 process];
    [v4 setProcess:v5];

    uint64_t v6 = [v3 timestamp];
    [v4 setDate:v6];

    unint64_t v7 = [v3 eventMessage];
    [v4 setComposedMessage:v7];

    uint64_t v8 = [v3 sender];
    [v4 setSenderImagePath:v8];

    uint64_t v9 = [v3 activityID];
    [v4 setActivityIdentifier:v9];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return 1;
}

- (id)loginDetailsWithStartDate:(id)a3 logArchivePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = [(id)objc_opt_class() loginDetailsPredicate];
    uint64_t v9 = [(LKLogEventController *)self logEventHandler];
    [(LKLogEventController *)self enumuratePersistentLogsSynchronouslyFromDate:v7 logArchivePath:v6 predicate:v8 logEventHandler:v9];
  }
  else
  {
    id v10 = objc_opt_new();
    [(LKLogEventController *)self setLogEnumarationEndTime:v10];

    uint64_t v8 = [(id)objc_opt_class() loginDetailsPredicate];
    uint64_t v9 = [(LKLogEventController *)self logEventHandler];
    [(LKLogEventController *)self enumurateLogEventsSynchronouslyFromDate:v7 predicate:v8 logEventHandler:v9];
  }

  id v11 = [(LKLogEventController *)self switchOperationsMutableArray];
  id v12 = (void *)[v11 copy];

  return v12;
}

- (NSMutableArray)switchOperationsMutableArray
{
  return self->_switchOperationsMutableArray;
}

- (void)setSwitchOperationsMutableArray:(id)a3
{
}

- (NSMutableDictionary)mutableKeychainItemsAddedByActivityID
{
  return self->_mutableKeychainItemsAddedByActivityID;
}

- (void)setMutableKeychainItemsAddedByActivityID:(id)a3
{
}

- (LKSwitchOperation)switchOperation
{
  return self->_switchOperation;
}

- (void)setSwitchOperation:(id)a3
{
}

- (OS_dispatch_semaphore)dynamicdsema
{
  return self->_dynamicdsema;
}

- (void)setDynamicdsema:(id)a3
{
}

- (NSDate)logEnumarationEndTime
{
  return self->_logEnumarationEndTime;
}

- (void)setLogEnumarationEndTime:(id)a3
{
}

- (BOOL)streamingLogs
{
  return self->_streamingLogs;
}

- (void)setStreamingLogs:(BOOL)a3
{
  self->_streamingLogs = a3;
}

- (void)setLogEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logEventHandler, 0);
  objc_storeStrong((id *)&self->_logEnumarationEndTime, 0);
  objc_storeStrong((id *)&self->_dynamicdsema, 0);
  objc_storeStrong((id *)&self->_switchOperation, 0);
  objc_storeStrong((id *)&self->_mutableKeychainItemsAddedByActivityID, 0);
  objc_storeStrong((id *)&self->_switchOperationsMutableArray, 0);
}

@end