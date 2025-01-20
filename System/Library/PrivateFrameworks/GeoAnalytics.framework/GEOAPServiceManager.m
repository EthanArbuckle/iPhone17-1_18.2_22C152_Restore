@interface GEOAPServiceManager
+ (id)sharedManager;
+ (void)useProxyClass:(Class)a3;
- (BOOL)AppleInternal;
- (BOOL)directionsFeedbackAllowed;
- (BOOL)evDirectionsFeedbackAllowed;
- (BOOL)evDirectionsFeedbackAuth;
- (BOOL)evalModeEnabled;
- (BOOL)eventCollectionIsDisabledForCurrentProcess;
- (BOOL)platformDiagAndUsage;
- (BOOL)platformDiagAndUsageOrAppleInternal;
- (BOOL)usageCountCollectionIsDisabledForCurrentProcess;
- (GEOAPServiceManager)init;
- (void)dealloc;
- (void)flushEvalData;
- (void)flushUploadHistoryWithCompletion:(id)a3;
- (void)logToDiagAndUsageUnderBugId:(id)a3 filePrefix:(id)a4 logData:(id)a5;
- (void)processMapsDeletionWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)reportCuratedCollectionWasViewedWithId:(unint64_t)a3 completion:(id)a4 completionQueue:(id)a5;
- (void)reportDailySettings:(id)a3;
- (void)reportDailySettings:(id)a3 completion:(id)a4;
- (void)reportDailySettings:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)reportDailyUsageCountType:(int)a3;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5;
- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)runAggregationTasks;
- (void)setDirectionsFeedbackAllowed:(BOOL)a3;
- (void)setEvDirectionsFeedbackAllowed:(BOOL)a3;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalDataWithVisitorBlock:(id)a3;
- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5;
- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4;
- (void)showUploadCounts:(id)a3;
- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5;
- (void)toggleEVDirectionsFeedbackAllowed;
- (void)updateSharedStateType:(int)a3 state:(id)a4;
- (void)updateSharedStateType:(int)a3 state:(id)a4 completion:(id)a5 completionQueue:(id)a6;
@end

@implementation GEOAPServiceManager

uint64_t __36__GEOAPServiceManager_sharedManager__block_invoke()
{
  _MergedGlobals_2 = objc_alloc_init(GEOAPServiceManager);
  return MEMORY[0x270F9A758]();
}

- (GEOAPServiceManager)init
{
  v40.receiver = self;
  v40.super_class = (Class)GEOAPServiceManager;
  v2 = [(GEOAPServiceManager *)&v40 init];
  if (v2)
  {
    v3 = (objc_class *)qword_26B2018D8;
    if (!qword_26B2018D8)
    {
      v4 = objc_opt_class();
      [v4 useProxyClass:objc_opt_class()];
      v3 = (objc_class *)qword_26B2018D8;
    }
    v5 = (GEOAPServiceProxy *)objc_alloc_init(v3);
    proxy = v2->_proxy;
    v2->_proxy = v5;

    v2->_directionsFeedbackAllowed = 1;
    v2->_evDirectionsFeedbackAllowed = GEOConfigGetBOOL();
    uint64_t v7 = geo_isolater_create();
    configInfoIsolator = v2->_configInfoIsolator;
    v2->_configInfoIsolator = (geo_isolater *)v7;

    global_queue = (void *)geo_get_global_queue();
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __27__GEOAPServiceManager_init__block_invoke;
    v38 = &unk_265345508;
    v10 = v2;
    v39 = v10;
    uint64_t v11 = _GEOConfigAddBlockListenerForKey();
    id evDirectionsFeedbackAllowedListener = v10->_evDirectionsFeedbackAllowedListener;
    v10->_id evDirectionsFeedbackAllowedListener = (id)v11;

    v10->_evDirectionsFeedbackAuth = GEOConfigGetBOOL();
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    v32 = __27__GEOAPServiceManager_init__block_invoke_3;
    v33 = &unk_265345508;
    v13 = v10;
    v34 = v13;
    uint64_t v14 = _GEOConfigAddBlockListenerForKey();
    id evDirectionsFeedbackAuthListener = v13->_evDirectionsFeedbackAuthListener;
    v13->_id evDirectionsFeedbackAuthListener = (id)v14;

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __27__GEOAPServiceManager_init__block_invoke_5;
    v28[3] = &unk_265345508;
    v16 = v13;
    v29 = v16;
    v17 = (void (**)(void, void, void))MEMORY[0x25337B980](v28);
    v18 = (void *)MEMORY[0x263F41640];
    v17[2](v17, *MEMORY[0x263F41640], *(void *)(MEMORY[0x263F41640] + 8));
    uint64_t v19 = _GEOConfigAddBlockListenerForKey();
    id eventCollectionIsDisabledForCurrentProcessListener = v16->_eventCollectionIsDisabledForCurrentProcessListener;
    v16->_id eventCollectionIsDisabledForCurrentProcessListener = (id)v19;

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __27__GEOAPServiceManager_init__block_invoke_7;
    v26[3] = &unk_265345508;
    v21 = v16;
    v27 = v21;
    v22 = (void (**)(void, void, void))MEMORY[0x25337B980](v26);
    v22[2](v22, *v18, v18[1]);
    uint64_t v23 = _GEOConfigAddBlockListenerForKey();
    id usageCountCollectionIsDisabledForCurrentProcessListener = v21->_usageCountCollectionIsDisabledForCurrentProcessListener;
    v21->_id usageCountCollectionIsDisabledForCurrentProcessListener = (id)v23;
  }
  return v2;
}

+ (void)useProxyClass:(Class)a3
{
  v4 = &unk_270164B88;
  if (_MergedGlobals_2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      __int16 v10 = 0;
      v5 = &_os_log_internal;
      v6 = "Assertion failed: !_sharedManager";
      uint64_t v7 = (uint8_t *)&v10;
LABEL_10:
      _os_log_fault_impl(&dword_24FE56000, v5, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
LABEL_11:
    __break(1u);
    return;
  }
  id v8 = v4;
  if (([(objc_class *)a3 conformsToProtocol:v4] & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v5 = &_os_log_internal;
      v6 = "Assertion failed: [proxyClass conformsToProtocol:protocol]";
      uint64_t v7 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  qword_26B2018D8 = (uint64_t)a3;
}

- (void)reportDailyUsageCountType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  GEOApplicationIdentifierOrProcessName();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(GEOAPServiceManager *)self reportDailyUsageCountType:v3 usageString:0 usageBool:0 appId:v5];
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v15 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void))a7;
  if ([(GEOAPServiceManager *)self usageCountCollectionIsDisabledForCurrentProcess])
  {
    if (v14) {
      v14[2](v14, 0);
    }
  }
  else
  {
    [(GEOAPServiceProxy *)self->_proxy reportDailyUsageCountType:v10 usageString:v15 usageBool:v12 appId:v13 completion:v14];
  }
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6
{
}

uint64_t __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sharedManager
{
  if (qword_26B2018E0 != -1) {
    dispatch_once(&qword_26B2018E0, &__block_literal_global_1);
  }
  v2 = (void *)_MergedGlobals_2;
  return v2;
}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = a7;
  v18 = (void (**)(void))a8;
  if (![(GEOAPServiceManager *)self usageCountCollectionIsDisabledForCurrentProcess])
  {
    proxy = self->_proxy;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke_2;
    v21[3] = &unk_265345580;
    uint64_t v23 = v18;
    v22 = v17;
    [(GEOAPServiceProxy *)proxy reportDailyUsageCountType:v12 usageString:v14 usageBool:v15 appId:v16 completion:v21];

    uint64_t v19 = v23;
LABEL_6:

    goto LABEL_7;
  }
  if (v18)
  {
    if (!v17)
    {
      v18[2](v18);
      goto LABEL_7;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke;
    block[3] = &unk_265345558;
    v25 = v18;
    dispatch_async(v17, block);
    uint64_t v19 = v25;
    goto LABEL_6;
  }
LABEL_7:
}

void __27__GEOAPServiceManager_init__block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  geo_isolate_sync();
}

uint64_t __27__GEOAPServiceManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = GEOConfigGetBOOL();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

void __27__GEOAPServiceManager_init__block_invoke_3(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  geo_isolate_sync();
}

uint64_t __27__GEOAPServiceManager_init__block_invoke_4(uint64_t a1)
{
  uint64_t result = GEOConfigGetBOOL();
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = result;
  return result;
}

void __27__GEOAPServiceManager_init__block_invoke_5(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = GEOConfigGetArray();
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = GEOApplicationIdentifierOrProcessName();
          BOOL v9 = [v8 caseInsensitiveCompare:v7] == 0;
          *((unsigned char *)v16 + 24) = v9;

          if (*((unsigned char *)v16 + 24)) {
            break;
          }
        }
        if (v4 == ++v6)
        {
          uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
          if (v4) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  id v10 = *(id *)(a1 + 32);
  geo_isolate_sync_data();

  _Block_object_dispose(&v15, 8);
}

uint64_t __27__GEOAPServiceManager_init__block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 11) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

void __27__GEOAPServiceManager_init__block_invoke_7(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = GEOConfigGetArray();
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = GEOApplicationIdentifierOrProcessName();
          BOOL v9 = [v8 caseInsensitiveCompare:v7] == 0;
          *((unsigned char *)v16 + 24) = v9;

          if (*((unsigned char *)v16 + 24)) {
            break;
          }
        }
        if (v4 == ++v6)
        {
          uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
          if (v4) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  id v10 = *(id *)(a1 + 32);
  geo_isolate_sync_data();

  _Block_object_dispose(&v15, 8);
}

uint64_t __27__GEOAPServiceManager_init__block_invoke_8(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 12) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)GEOAPServiceManager;
  [(GEOAPServiceManager *)&v3 dealloc];
}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  long long v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    long long v11 = dispatch_get_global_queue(21, 0);
  }
  if (GEOConfigGetBOOL())
  {
    if (v12) {
      dispatch_async(v11, v12);
    }
  }
  else
  {
    proxy = self->_proxy;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__GEOAPServiceManager_reportLogMsg_uploadBatchId_completionQueue_completion___block_invoke;
    v14[3] = &unk_265345530;
    id v16 = v12;
    uint64_t v15 = v11;
    [(GEOAPServiceProxy *)proxy reportLogMsg:v10 uploadBatchId:a4 completion:v14];
  }
}

void __77__GEOAPServiceManager_reportLogMsg_uploadBatchId_completionQueue_completion___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  if (v1) {
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), v1);
  }
}

void __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void (***)(void))(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    if (v5)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke_3;
      block[3] = &unk_265345558;
      uint64_t v7 = v4;
      dispatch_async(v5, block);
    }
    else
    {
      v4[2]();
    }
  }
}

uint64_t __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportDailySettings:(id)a3
{
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
}

- (void)reportDailySettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  proxy = self->_proxy;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__GEOAPServiceManager_reportDailySettings_completionQueue_completion___block_invoke;
  v13[3] = &unk_265345580;
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  [(GEOAPServiceProxy *)proxy reportDailySettings:a3 completion:v13];
}

void __70__GEOAPServiceManager_reportDailySettings_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void (***)(void))(a1 + 40);
  if (v4)
  {
    id v6 = v3;
    uint64_t v5 = *(NSObject **)(a1 + 32);
    if (v5) {
      dispatch_async(v5, v4);
    }
    else {
      v4[2](v4);
    }
    id v3 = v6;
  }
}

- (void)flushEvalData
{
}

- (void)runAggregationTasks
{
}

- (void)setEvalMode:(BOOL)a3
{
}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
}

- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5
{
}

- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5
{
}

- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4
{
}

- (void)flushUploadHistoryWithCompletion:(id)a3
{
}

- (void)showUploadCounts:(id)a3
{
}

- (BOOL)evalModeEnabled
{
  return 0;
}

- (BOOL)AppleInternal
{
  v2 = [MEMORY[0x263F41B90] sharedPlatform];
  char v3 = [v2 isInternalInstall];

  return v3;
}

- (BOOL)platformDiagAndUsage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
  id v9 = getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
  if (!getDiagnosticLogSubmissionEnabledSymbolLoc_ptr)
  {
    char v3 = (void *)CrashReporterSupportLibrary();
    v7[3] = (uint64_t)dlsym(v3, "DiagnosticLogSubmissionEnabled");
    getDiagnosticLogSubmissionEnabledSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    uint64_t v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

- (BOOL)platformDiagAndUsageOrAppleInternal
{
  if ([(GEOAPServiceManager *)self platformDiagAndUsage]) {
    return 1;
  }
  return [(GEOAPServiceManager *)self AppleInternal];
}

- (void)logToDiagAndUsageUnderBugId:(id)a3 filePrefix:(id)a4 logData:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__GEOAPServiceManager_logToDiagAndUsageUnderBugId_filePrefix_logData___block_invoke;
  v18[3] = &unk_2653455A8;
  id v10 = v9;
  id v19 = v10;
  id v11 = v7;
  id v12 = v8;
  long long v13 = v18;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v14 = getOSAWriteLogForSubmissionSymbolLoc_ptr;
  v28 = getOSAWriteLogForSubmissionSymbolLoc_ptr;
  if (!getOSAWriteLogForSubmissionSymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getOSAWriteLogForSubmissionSymbolLoc_block_invoke;
    uint64_t v23 = &unk_265345620;
    v24 = &v25;
    id v15 = (void *)CrashReporterSupportLibrary();
    id v16 = dlsym(v15, "OSAWriteLogForSubmission");
    *(void *)(v24[1] + 24) = v16;
    getOSAWriteLogForSubmissionSymbolLoc_ptr = *(_UNKNOWN **)(v24[1] + 24);
    id v14 = (void *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v14)
  {
    dlerror();
    uint64_t v17 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v25, 8);
    _Unwind_Resume(v17);
  }
  ((void (*)(id, id, void, void, void *))v14)(v11, v12, 0, 0, v13);
}

uint64_t __70__GEOAPServiceManager_logToDiagAndUsageUnderBugId_filePrefix_logData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32) error:0];
}

- (BOOL)evDirectionsFeedbackAuth
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __47__GEOAPServiceManager_evDirectionsFeedbackAuth__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 10);
  return result;
}

- (BOOL)evDirectionsFeedbackAllowed
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __50__GEOAPServiceManager_evDirectionsFeedbackAllowed__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 10)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(v1 + 8);
  }
  return result;
}

- (void)setEvDirectionsFeedbackAllowed:(BOOL)a3
{
}

uint64_t __54__GEOAPServiceManager_setEvDirectionsFeedbackAllowed___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 40);
  return GEOConfigSetBOOL();
}

- (void)toggleEVDirectionsFeedbackAllowed
{
}

uint64_t __56__GEOAPServiceManager_toggleEVDirectionsFeedbackAllowed__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) ^= 1u;
  return GEOConfigSetBOOL();
}

- (BOOL)eventCollectionIsDisabledForCurrentProcess
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync_data();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __65__GEOAPServiceManager_eventCollectionIsDisabledForCurrentProcess__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 11);
  return result;
}

- (BOOL)usageCountCollectionIsDisabledForCurrentProcess
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync_data();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __70__GEOAPServiceManager_usageCountCollectionIsDisabledForCurrentProcess__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 12);
  return result;
}

- (BOOL)directionsFeedbackAllowed
{
  return self->_directionsFeedbackAllowed;
}

- (void)setDirectionsFeedbackAllowed:(BOOL)a3
{
  self->_directionsFeedbackAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_usageCountCollectionIsDisabledForCurrentProcessListener, 0);
  objc_storeStrong(&self->_eventCollectionIsDisabledForCurrentProcessListener, 0);
  objc_storeStrong(&self->_evDirectionsFeedbackAuthListener, 0);
  objc_storeStrong(&self->_evDirectionsFeedbackAllowedListener, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_configInfoIsolator, 0);
}

- (void)updateSharedStateType:(int)a3 state:(id)a4
{
}

- (void)updateSharedStateType:(int)a3 state:(id)a4 completion:(id)a5 completionQueue:(id)a6
{
  id v11 = a4;
  id v8 = a5;
  id v9 = a6;
  global_queue = v9;
  if (v8)
  {
    if (!v9) {
      global_queue = geo_get_global_queue();
    }
    dispatch_async(global_queue, v8);
  }
}

- (void)reportCuratedCollectionWasViewedWithId:(unint64_t)a3 completion:(id)a4 completionQueue:(id)a5
{
  dispatch_block_t block = a4;
  uint64_t v6 = a5;
  char v7 = block;
  id v8 = v6;
  if (block)
  {
    if (!v6)
    {
      uint64_t global_queue = geo_get_global_queue();
      char v7 = block;
      id v8 = global_queue;
    }
    dispatch_async(v8, v7);
  }
}

- (void)processMapsDeletionWithCompletionQueue:(id)a3 completion:(id)a4
{
}

@end