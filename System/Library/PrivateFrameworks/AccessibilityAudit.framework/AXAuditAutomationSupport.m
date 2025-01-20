@interface AXAuditAutomationSupport
+ (__AXUIElement)createAXElementForAuditIssue:(id)a3;
+ (id)_currentTimestamp;
+ (id)longDescriptionForAuditIssue:(id)a3;
+ (id)sharedManager;
+ (id)shortDescriptionForAuditIssue:(id)a3;
- (AXAuditAutomationDelegate)delegate;
- (AXAuditAutomationSupport)init;
- (AXAuditThrottler)_screenChangedThrottler;
- (AXAuditer)_auditor;
- (BOOL)_initializeAXObserverIfNeeded;
- (BOOL)_registeredForNotifications;
- (BOOL)_runningContinuousAudit;
- (BOOL)runContinuousAudit;
- (BOOL)runningSingleAudit;
- (NSArray)auditTypes;
- (NSArray)auditWarningsToCapture;
- (NSArray)auditWarningsToIgnore;
- (NSArray)elementIdentifiersToIgnore;
- (NSString)_auditTimestamp;
- (OS_dispatch_queue)_auditQueue;
- (OS_dispatch_queue)_backgroudQueue;
- (__AXObserver)_axEventObserver;
- (id)_accessibilityNotificationsForContinuousAudit;
- (id)_completionBlock;
- (id)_setupWarningsFromAuditTypes;
- (id)fetchScreenshot;
- (id)screenshotHighlightingIssue:(id)a3;
- (int)targetPid;
- (int64_t)_singleAuditPendingCount;
- (void)_captureScreenshot;
- (void)_informDelegateOfResults:(id)a3 error:(id)a4;
- (void)_registerForAXNotifications:(BOOL)a3;
- (void)_runAudit;
- (void)_runNextAuditIfNeeded;
- (void)_screenChangedNotification;
- (void)_screenChangedThrottled;
- (void)_sendResultsToDelegate:(id)a3;
- (void)_setupAudit;
- (void)_startContinuousAudit;
- (void)_stopContinuousAudit;
- (void)auditer:(id)a3 didCompleteWithResults:(id)a4;
- (void)setAuditTypes:(id)a3;
- (void)setAuditWarningsToCapture:(id)a3;
- (void)setAuditWarningsToIgnore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementIdentifiersToIgnore:(id)a3;
- (void)setRunContinuousAudit:(BOOL)a3;
- (void)setTargetPid:(int)a3;
- (void)set_auditQueue:(id)a3;
- (void)set_auditTimestamp:(id)a3;
- (void)set_auditor:(id)a3;
- (void)set_axEventObserver:(__AXObserver *)a3;
- (void)set_backgroudQueue:(id)a3;
- (void)set_completionBlock:(id)a3;
- (void)set_registeredForNotifications:(BOOL)a3;
- (void)set_runningContinuousAudit:(BOOL)a3;
- (void)set_screenChangedThrottler:(id)a3;
- (void)set_singleAuditPendingCount:(int64_t)a3;
- (void)startAuditWithCompletionBlock:(id)a3;
- (void)startContinuousAudit;
- (void)startSingleAudit;
- (void)stopContinuousAudit;
@end

@implementation AXAuditAutomationSupport

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__AXAuditAutomationSupport_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_6 != -1) {
    dispatch_once(&sharedManager_onceToken_6, block);
  }
  v2 = (void *)sharedManager_instance_6;

  return v2;
}

uint64_t __41__AXAuditAutomationSupport_sharedManager__block_invoke()
{
  sharedManager_instance_6 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (id)shortDescriptionForAuditIssue:(id)a3
{
  id v3 = a3;
  v4 = +[AXAuditIssueDescriptionManager sharedManager];
  v5 = [v4 shortTitleForAuditIssue:v3];

  return v5;
}

+ (id)longDescriptionForAuditIssue:(id)a3
{
  id v3 = a3;
  v4 = +[AXAuditIssueDescriptionManager sharedManager];
  v5 = [v4 longDescriptionForAuditIssue:v3];

  return v5;
}

+ (__AXUIElement)createAXElementForAuditIssue:(id)a3
{
  id v3 = [a3 auditElement];
  v4 = (__AXUIElement *)[v3 createAxElementRefForXCTest];

  return v4;
}

- (AXAuditAutomationSupport)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXAuditAutomationSupport;
  v2 = [(AXAuditAutomationSupport *)&v11 init];
  if (v2)
  {
    id v3 = +[AXAuditPluginManager sharedManager];
    [v3 loadAuditBundles];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.axAudit.automation", 0);
    auditQueue = v2->__auditQueue;
    v2->__auditQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.accessibilityAudit.automation.background", 0);
    backgroudQueue = v2->__backgroudQueue;
    v2->__backgroudQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[AXAuditThrottler throttlerWithInterval:v2 target:sel__screenChangedThrottled selector:v2->__backgroudQueue queue:1 alwaysReschedule:1.75];
    screenChangedThrottler = v2->__screenChangedThrottler;
    v2->__screenChangedThrottler = (AXAuditThrottler *)v8;
  }
  return v2;
}

+ (id)_currentTimestamp
{
  v2 = objc_opt_new();
  id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
  dispatch_queue_t v4 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v2 setTimeZone:v4];

  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v5 = [v2 stringFromDate:v3];

  return v5;
}

- (void)_setupAudit
{
  id v3 = objc_opt_new();
  [(AXAuditAutomationSupport *)self set_auditor:v3];

  dispatch_queue_t v4 = [(AXAuditAutomationSupport *)self _auditor];
  [v4 setDelegate:self];

  v5 = +[AXAuditAutomationSupport _currentTimestamp];
  [(AXAuditAutomationSupport *)self set_auditTimestamp:v5];

  uint64_t v6 = [(AXAuditAutomationSupport *)self targetPid];
  v7 = [(AXAuditAutomationSupport *)self _auditor];
  [v7 setTargetPid:v6];

  id v8 = +[AXAuditScreenshotManager sharedManager];
  [v8 clear];
}

- (void)_runAudit
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(AXAuditAutomationSupport *)self targetPid])
  {
    AXAuditCurrentApplications();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v35;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        int v9 = AXAuditPidForElement(v8);
        if ([(AXAuditAutomationSupport *)self targetPid] == v9) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v10 = v8;

      if (v10) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_10:
    }
  }
  objc_msgSend(MEMORY[0x263F087E8], "_axAudit_error:description:", -902, @"Invalid target app %i", -[AXAuditAutomationSupport targetPid](self, "targetPid"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    [(AXAuditAutomationSupport *)self _informDelegateOfResults:0 error:v10];
  }
  else
  {
LABEL_14:
    id v27 = v10;
    [(AXAuditAutomationSupport *)self _setupAudit];
    objc_super v11 = [(AXAuditAutomationSupport *)self _completionBlock];

    if (v11)
    {
      id v12 = +[AXAuditPluginManager sharedManager];
      v13 = [(AXAuditAutomationSupport *)self _auditQueue];
      v14 = [(AXAuditAutomationSupport *)self _auditor];
      [v14 setAuditQueue:v13];
    }
    v15 = [MEMORY[0x263EFF9C0] set];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v16 = [(AXAuditAutomationSupport *)self auditTypes];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v22 = [(AXAuditAutomationSupport *)self _auditor];
          v23 = [v22 allSupportedAuditTypes];
          int v24 = [v23 containsObject:v21];

          if (v24) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v18);
    }

    v25 = [(AXAuditAutomationSupport *)self _auditQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__AXAuditAutomationSupport__runAudit__block_invoke;
    block[3] = &unk_26520D2E0;
    block[4] = self;
    id v29 = v15;
    id v26 = v15;
    dispatch_async(v25, block);

    id v10 = v27;
  }
}

void __37__AXAuditAutomationSupport__runAudit__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _captureScreenshot];
  id v3 = [*(id *)(a1 + 32) _auditor];
  v2 = [*(id *)(a1 + 40) allObjects];
  [v3 startWithAuditTypes:v2];
}

- (id)_setupWarningsFromAuditTypes
{
  return 0;
}

- (void)startAuditWithCompletionBlock:(id)a3
{
  [(AXAuditAutomationSupport *)self set_completionBlock:a3];
  uint64_t v4 = [(AXAuditAutomationSupport *)self _setupWarningsFromAuditTypes];
  id v5 = (id)v4;
  if (v4) {
    [(AXAuditAutomationSupport *)self _informDelegateOfResults:0 error:v4];
  }
  else {
    [(AXAuditAutomationSupport *)self startSingleAudit];
  }
}

- (void)_informDelegateOfResults:(id)a3 error:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXAuditAutomationSupport *)self delegate];

  if (v8)
  {
    int v9 = [(AXAuditAutomationSupport *)self delegate];
    [v9 automationSupport:self didFindResults:v6 success:v7 == 0];
  }
  id v10 = [(AXAuditAutomationSupport *)self _completionBlock];

  if (v10)
  {
    id v24 = v7;
    objc_super v11 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v25 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v18 = objc_msgSend(v17, "allIssues", v24);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v27;
            do
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v27 != v21) {
                  objc_enumerationMutation(v18);
                }
                [v11 addObject:*(void *)(*((void *)&v26 + 1) + 8 * v22++)];
              }
              while (v20 != v22);
              uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v20);
          }

          ++v16;
        }
        while (v16 != v14);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v14);
    }

    v23 = [(AXAuditAutomationSupport *)self _completionBlock];
    id v7 = v24;
    ((void (**)(void, void *, id))v23)[2](v23, v11, v24);

    [(AXAuditAutomationSupport *)self set_completionBlock:0];
    id v6 = v25;
  }
}

- (void)_runNextAuditIfNeeded
{
  if ([(AXAuditAutomationSupport *)self _singleAuditPendingCount] < 1)
  {
    if ([(AXAuditAutomationSupport *)self _runningContinuousAudit])
    {
      [(AXAuditAutomationSupport *)self _startContinuousAudit];
    }
  }
  else
  {
    [(AXAuditAutomationSupport *)self _runAudit];
  }
}

- (void)_startContinuousAudit
{
  if (![(AXAuditAutomationSupport *)self _registeredForNotifications])
  {
    [(AXAuditAutomationSupport *)self _runAudit];
    [(AXAuditAutomationSupport *)self _registerForAXNotifications:1];
  }
}

- (void)_stopContinuousAudit
{
}

- (void)startSingleAudit
{
  BOOL v3 = [(AXAuditAutomationSupport *)self runningContinuousAudit];
  [(AXAuditAutomationSupport *)self set_singleAuditPendingCount:[(AXAuditAutomationSupport *)self _singleAuditPendingCount] + 1];
  if (!v3)
  {
    [(AXAuditAutomationSupport *)self _runNextAuditIfNeeded];
  }
}

- (BOOL)runningSingleAudit
{
  return [(AXAuditAutomationSupport *)self _singleAuditPendingCount] > 0;
}

- (void)startContinuousAudit
{
  [(AXAuditAutomationSupport *)self set_runningContinuousAudit:1];

  [(AXAuditAutomationSupport *)self _runNextAuditIfNeeded];
}

- (void)stopContinuousAudit
{
  if ([(AXAuditAutomationSupport *)self _runningContinuousAudit])
  {
    [(AXAuditAutomationSupport *)self set_runningContinuousAudit:0];
    [(AXAuditAutomationSupport *)self _stopContinuousAudit];
  }
}

- (id)screenshotHighlightingIssue:(id)a3
{
  return 0;
}

- (void)_captureScreenshot
{
  id v6 = [(AXAuditAutomationSupport *)self _auditTimestamp];
  v2 = +[AXAuditPluginManager sharedManager];
  BOOL v3 = [v2 platformPlugin];
  uint64_t v4 = objc_msgSend(v3, "screenshotInfoForTransportWithFrame:", 0.0, 0.0, 0.0, 0.0);

  if (v4)
  {
    id v5 = +[AXAuditScreenshotManager sharedManager];
    [v5 addScreenshotWithInfo:v4 timestamp:v6 completion:&__block_literal_global_23];
  }
}

- (id)fetchScreenshot
{
  v2 = +[AXAuditPluginManager sharedManager];
  BOOL v3 = [v2 platformPlugin];
  uint64_t v4 = objc_msgSend(v3, "screenshotInfoForTransportWithFrame:", 0.0, 0.0, 0.0, 0.0);

  return v4;
}

- (int64_t)_singleAuditPendingCount
{
  return self->__singleAuditPendingCount;
}

- (void)auditer:(id)a3 didCompleteWithResults:(id)a4
{
  id v5 = a4;
  id v6 = [(AXAuditAutomationSupport *)self _completionBlock];

  if (v6)
  {
    id v7 = [(AXAuditAutomationSupport *)self _auditTimestamp];
    updateTimestampOfResults(v5, v7);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke;
    block[3] = &unk_26520D308;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    [(AXAuditAutomationSupport *)self _sendResultsToDelegate:v5];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke_2;
    v8[3] = &unk_26520D2E0;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

uint64_t __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _singleAuditPendingCount];
  if (result >= 1)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 _singleAuditPendingCount] - 1;
    return objc_msgSend(v3, "set_singleAuditPendingCount:", v4);
  }
  return result;
}

void __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_auditor:", 0);
  if ([*(id *)(a1 + 32) _singleAuditPendingCount] > 0
    || [*(id *)(a1 + 32) _runningContinuousAudit])
  {
    v2 = [*(id *)(a1 + 32) delegate];

    if (v2)
    {
      BOOL v3 = *(void **)(a1 + 40);
      uint64_t v4 = [*(id *)(a1 + 32) _auditTimestamp];
      updateTimestampOfResults(v3, v4);

      if ([*(id *)(a1 + 32) _singleAuditPendingCount] >= 1) {
        objc_msgSend(*(id *)(a1 + 32), "set_singleAuditPendingCount:", objc_msgSend(*(id *)(a1 + 32), "_singleAuditPendingCount") - 1);
      }
      [*(id *)(a1 + 32) _sendResultsToDelegate:*(void *)(a1 + 40)];
      if (([*(id *)(a1 + 32) _runningContinuousAudit] & 1) == 0)
      {
        id v5 = *(void **)(a1 + 32);
        [v5 _runNextAuditIfNeeded];
      }
    }
  }
}

- (void)_sendResultsToDelegate:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AXAuditAutomationSupport *)self auditWarningsToCapture];
  uint64_t v6 = [v5 count];

  id v7 = [(AXAuditAutomationSupport *)self elementIdentifiersToIgnore];
  uint64_t v39 = [v7 count];
  uint64_t v40 = v6;

  if (v6 | v39)
  {
    v38 = self;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v28 = v4;
    id obj = v4;
    uint64_t v31 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (!v31) {
      goto LABEL_38;
    }
    uint64_t v30 = *(void *)v50;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v50 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v8;
        id v9 = *(void **)(*((void *)&v49 + 1) + 8 * v8);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v33 = [v9 caseResults];
        uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v35)
        {
          uint64_t v34 = *(void *)v46;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v46 != v34) {
                objc_enumerationMutation(v33);
              }
              uint64_t v36 = *(void **)(*((void *)&v45 + 1) + 8 * v10);
              uint64_t v37 = v10;
              objc_super v11 = [v36 auditIssues];
              id v12 = objc_opt_new();
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              id v13 = v11;
              uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v53 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v42;
                do
                {
                  for (uint64_t i = 0; i != v15; ++i)
                  {
                    if (*(void *)v42 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                    if (v40)
                    {
                      uint64_t v19 = [*(id *)(*((void *)&v41 + 1) + 8 * i) issueClassification];
                      uint64_t v20 = [NSNumber numberWithLong:v19];
                      uint64_t v21 = [(AXAuditAutomationSupport *)v38 auditWarningsToCapture];
                      int v22 = [v21 containsObject:v20];

                      if (v22) {
                        BOOL v23 = v39 == 0;
                      }
                      else {
                        BOOL v23 = 1;
                      }
                      if (v23)
                      {
                        if (v22) {
                          goto LABEL_31;
                        }
                        continue;
                      }
                    }
                    else if (!v39)
                    {
                      goto LABEL_31;
                    }
                    id v24 = [v18 auditElement];
                    id v25 = [v24 accessibilityIdentifier];
                    if (![v25 length])
                    {

LABEL_31:
                      [v12 addObject:v18];
                      continue;
                    }
                    long long v26 = [(AXAuditAutomationSupport *)v38 elementIdentifiersToIgnore];
                    char v27 = [v26 containsObject:v25];

                    if ((v27 & 1) == 0) {
                      goto LABEL_31;
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v53 count:16];
                }
                while (v15);
              }

              [v36 setAuditIssues:v12];
              uint64_t v10 = v37 + 1;
            }
            while (v37 + 1 != v35);
            uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v35);
        }

        uint64_t v8 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (!v31)
      {
LABEL_38:

        [(AXAuditAutomationSupport *)v38 _informDelegateOfResults:obj error:0];
        id v4 = v28;
        goto LABEL_39;
      }
    }
  }
  [(AXAuditAutomationSupport *)self _informDelegateOfResults:v4 error:0];
LABEL_39:
}

- (void)_screenChangedThrottled
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AXAuditAutomationSupport__screenChangedThrottled__block_invoke;
  block[3] = &unk_26520D308;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__AXAuditAutomationSupport__screenChangedThrottled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runNextContinuousAudit];
}

- (void)setAuditWarningsToIgnore:(id)a3
{
  objc_storeStrong((id *)&self->_auditWarningsToIgnore, a3);
  id v5 = a3;
  uint64_t v6 = +[AXAuditIssueDescriptionManager allAuditIssueClassificationCodes];
  id v8 = (id)[v6 mutableCopy];

  [v8 removeObjectsInArray:v5];
  id v7 = (void *)[v8 copy];
  [(AXAuditAutomationSupport *)self setAuditWarningsToCapture:v7];
}

- (void)_screenChangedNotification
{
  id v2 = [(AXAuditAutomationSupport *)self _screenChangedThrottler];
  [v2 scheduleNow];
}

- (BOOL)_initializeAXObserverIfNeeded
{
  if ([(AXAuditAutomationSupport *)self _axEventObserver]) {
    goto LABEL_5;
  }
  AXUIElementRegisterSystemWideServerDeathCallback();
  pid_t pid = 0;
  AXUIElementGetPid((AXUIElementRef)[MEMORY[0x263F21690] systemWideAXUIElement], &pid);
  if (![(AXAuditAutomationSupport *)self _axEventObserver])
  {
    AXObserverRef v7 = 0;
    if (AXObserverCreate(pid, (AXObserverCallback)_axNotificationHandler, &v7))
    {
      LOBYTE(RunLoopSource) = 0;
      return (char)RunLoopSource;
    }
    [(AXAuditAutomationSupport *)self set_axEventObserver:v7];
  }
  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource([(AXAuditAutomationSupport *)self _axEventObserver]);
  if (RunLoopSource)
  {
    id v4 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
LABEL_5:
    LOBYTE(RunLoopSource) = 1;
  }
  return (char)RunLoopSource;
}

- (id)_accessibilityNotificationsForContinuousAudit
{
  return &unk_26FB7A598;
}

- (void)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3) {
    [(AXAuditAutomationSupport *)self _initializeAXObserverIfNeeded];
  }
  if ([(AXAuditAutomationSupport *)self _axEventObserver])
  {
    id v5 = (const __AXUIElement *)[MEMORY[0x263F21690] systemWideAXUIElement];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(AXAuditAutomationSupport *)self _accessibilityNotificationsForContinuousAudit];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = (const __CFString *)[*(id *)(*((void *)&v13 + 1) + 8 * i) intValue];
        id v12 = [(AXAuditAutomationSupport *)self _axEventObserver];
        if (v3)
        {
          if (AXObserverAddNotification(v12, v5, v11, self)) {
            continue;
          }
        }
        else if (AXObserverRemoveNotification(v12, v5, v11))
        {
          continue;
        }
        [(AXAuditAutomationSupport *)self set_registeredForNotifications:v3];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v8)
      {
LABEL_16:

        return;
      }
    }
  }
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (NSArray)auditTypes
{
  return self->_auditTypes;
}

- (void)setAuditTypes:(id)a3
{
}

- (NSArray)elementIdentifiersToIgnore
{
  return self->_elementIdentifiersToIgnore;
}

- (void)setElementIdentifiersToIgnore:(id)a3
{
}

- (NSString)_auditTimestamp
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_auditTimestamp:(id)a3
{
}

- (AXAuditer)_auditor
{
  return self->__auditor;
}

- (void)set_auditor:(id)a3
{
}

- (AXAuditThrottler)_screenChangedThrottler
{
  return self->__screenChangedThrottler;
}

- (void)set_screenChangedThrottler:(id)a3
{
}

- (void)set_singleAuditPendingCount:(int64_t)a3
{
  self->__singleAuditPendingCount = a3;
}

- (OS_dispatch_queue)_auditQueue
{
  return self->__auditQueue;
}

- (void)set_auditQueue:(id)a3
{
}

- (BOOL)_runningContinuousAudit
{
  return self->__runningContinuousAudit;
}

- (void)set_runningContinuousAudit:(BOOL)a3
{
  self->__runningContinuousAudit = a3;
}

- (__AXObserver)_axEventObserver
{
  return self->__axEventObserver;
}

- (void)set_axEventObserver:(__AXObserver *)a3
{
  self->__axEventObserver = a3;
}

- (BOOL)_registeredForNotifications
{
  return self->__registeredForNotifications;
}

- (void)set_registeredForNotifications:(BOOL)a3
{
  self->__registeredForNotifications = a3;
}

- (OS_dispatch_queue)_backgroudQueue
{
  return self->__backgroudQueue;
}

- (void)set_backgroudQueue:(id)a3
{
}

- (id)_completionBlock
{
  return self->__completionBlock;
}

- (void)set_completionBlock:(id)a3
{
}

- (NSArray)auditWarningsToCapture
{
  return self->_auditWarningsToCapture;
}

- (void)setAuditWarningsToCapture:(id)a3
{
}

- (NSArray)auditWarningsToIgnore
{
  return self->_auditWarningsToIgnore;
}

- (BOOL)runContinuousAudit
{
  return self->_runContinuousAudit;
}

- (void)setRunContinuousAudit:(BOOL)a3
{
  self->_runContinuousAudit = a3;
}

- (AXAuditAutomationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXAuditAutomationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_auditWarningsToIgnore, 0);
  objc_storeStrong((id *)&self->_auditWarningsToCapture, 0);
  objc_storeStrong(&self->__completionBlock, 0);
  objc_storeStrong((id *)&self->__backgroudQueue, 0);
  objc_storeStrong((id *)&self->__auditQueue, 0);
  objc_storeStrong((id *)&self->__screenChangedThrottler, 0);
  objc_storeStrong((id *)&self->__auditor, 0);
  objc_storeStrong((id *)&self->__auditTimestamp, 0);
  objc_storeStrong((id *)&self->_elementIdentifiersToIgnore, 0);

  objc_storeStrong((id *)&self->_auditTypes, 0);
}

@end