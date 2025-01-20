@interface WFCellularPlansManager
+ (id)dataRateToRadioAccessTechnologyModeMapping;
+ (id)modesFromDataRate:(int64_t)a3;
- (BOOL)resetCellularDataStatisticsWithError:(id *)a3;
- (BOOL)setAutomaticDataLineSwitching:(BOOL)a3 error:(id *)a4;
- (BOOL)setDefaultDataLineToPlan:(id)a3 error:(id *)a4;
- (BOOL)setDefaultVoiceLineToPlan:(id)a3 error:(id *)a4;
- (BOOL)setPlanStatus:(BOOL)a3 forPlan:(id)a4 error:(id *)a5;
- (CoreTelephonyClient)client;
- (NSArray)allPlans;
- (OS_dispatch_queue)queue;
- (WFCellularPlansManager)init;
- (id)contexts;
@end

@implementation WFCellularPlansManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)contexts
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [(WFCellularPlansManager *)self client];
  id v8 = 0;
  v3 = [v2 getSubscriptionInfoWithError:&v8];
  id v4 = v8;

  if (v4)
  {
    v5 = getWFActionsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFCellularPlansManager contexts]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_ERROR, "%s Failed to get CTXPCServiceSubscriptionInfo with error: %@", buf, 0x16u);
    }
  }
  v6 = [v3 subscriptions];

  return v6;
}

- (BOOL)setPlanStatus:(BOOL)a3 forPlan:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = getWFActionsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v7 label];
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
    __int16 v24 = 1024;
    *(_DWORD *)v25 = v6;
    *(_WORD *)&v25[4] = 2112;
    *(void *)&v25[6] = v9;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_DEBUG, "%s Setting status to %d for plan with label %@", buf, 0x1Cu);
  }
  v10 = [getCTCellularPlanManagerClass() sharedManager];
  __int16 v11 = [v10 planItemsShouldUpdate:1];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__WFCellularPlansManager_setPlanStatus_forPlan_error___block_invoke;
  v20[3] = &unk_264E58ED8;
  id v12 = v7;
  id v21 = v12;
  uint64_t v13 = objc_msgSend(v11, "if_firstObjectPassingTest:", v20);
  if (v13)
  {
    v14 = [v10 didSelectPlanItem:v13 isEnable:v6];
    BOOL v15 = v14 == 0;
    v16 = getWFActionsLogObject();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
        __int16 v24 = 2112;
        *(void *)v25 = v12;
        *(_WORD *)&v25[8] = 2112;
        *(void *)&v25[10] = v14;
        _os_log_impl(&dword_23C364000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set plan item state for plan %@: %@", buf, 0x20u);
      }

      if (a5) {
        *a5 = v14;
      }
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
        __int16 v24 = 1024;
        *(_DWORD *)v25 = v6;
        *(_WORD *)&v25[4] = 2112;
        *(void *)&v25[6] = v12;
        _os_log_impl(&dword_23C364000, v16, OS_LOG_TYPE_ERROR, "%s Successfully set plan item state to %d for plan %@", buf, 0x1Cu);
      }
    }
  }
  else
  {
    v18 = getWFActionsLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
      _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_ERROR, "%s Could not find a valid plan item, bailing out.", buf, 0xCu);
    }

    if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:0];
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

uint64_t __54__WFCellularPlansManager_setPlanStatus_forPlan_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 iccid];
  id v4 = [*(id *)(a1 + 32) iccid];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)resetCellularDataStatisticsWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v12[0] = 0;
  long long v13 = 0u;
  uint64_t v14 = 0;
  v12[1] = self;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v4 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  v18 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v20 = __get_CTServerConnectionCreateWithIdentifierSymbolLoc_block_invoke;
    id v21 = &unk_264E5EC88;
    v22 = &v15;
    uint64_t v5 = CoreTelephonyLibrary_20810();
    BOOL v6 = dlsym(v5, "_CTServerConnectionCreateWithIdentifier");
    *(void *)(v22[1] + 24) = v6;
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(v22[1] + 24);
    id v4 = (void *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v4)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    __int16 v11 = objc_msgSend(NSString, "stringWithUTF8String:", "CTServerConnectionRef WFCTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"WFCellularManager.m", 37, @"%s", dlerror());

    __break(1u);
  }
  id v7 = (const void *)((uint64_t (*)(void, __CFString *, uint64_t (*)(), void *))v4)(*MEMORY[0x263EFFB08], @"com.apple.shortcuts", WFCoreTelephonyConnectionCallbackStub, v12);
  if (v7)
  {
    _CTServerConnectionEraseCellularDataUsageRecords();
    CFRelease(v7);
  }
  else
  {
    id v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[WFCellularPlansManager resetCellularDataStatisticsWithError:]";
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get CTServerConnection", (uint8_t *)&buf, 0xCu);
    }

    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:16 userInfo:0];
    }
  }
  return v7 != 0;
}

- (BOOL)setAutomaticDataLineSwitching:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v6 = getWFActionsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315394;
    __int16 v11 = "-[WFCellularPlansManager setAutomaticDataLineSwitching:error:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_DEBUG, "%s Setting automatic data line switching to %d", (uint8_t *)&v10, 0x12u);
  }

  id v7 = [(WFCellularPlansManager *)self client];
  id v8 = (id)[v7 setSupportDynamicDataSimSwitch:v4];

  return 1;
}

- (BOOL)setDefaultDataLineToPlan:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v6 label];
    int v12 = 136315394;
    BOOL v13 = "-[WFCellularPlansManager setDefaultDataLineToPlan:error:]";
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEBUG, "%s Setting default data line to plan with label %@", (uint8_t *)&v12, 0x16u);
  }
  v9 = [(WFCellularPlansManager *)self client];
  int v10 = [v6 ctContext];
  [v9 setActiveUserDataSelection:v10 error:a4];

  return 1;
}

- (BOOL)setDefaultVoiceLineToPlan:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [v6 isDataOnlyLine];
  id v8 = getWFActionsLogObject();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = [v6 label];
      int v16 = 136315394;
      uint64_t v17 = "-[WFCellularPlansManager setDefaultVoiceLineToPlan:error:]";
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_DEBUG, "%s Setting default voice line to plan with label %@", (uint8_t *)&v16, 0x16u);
    }
    int v12 = [(WFCellularPlansManager *)self client];
    BOOL v13 = [v6 ctContext];
    [v12 setDefaultVoice:v13 error:a4];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[WFCellularPlansManager setDefaultVoiceLineToPlan:error:]";
    _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_ERROR, "%s Cannot use data-only line as voice line, bailing out", (uint8_t *)&v16, 0xCu);
  }

  if (a4)
  {
    int v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F870B8];
    uint64_t v20 = *MEMORY[0x263F08320];
    int v12 = WFLocalizedString(@"Cannot set a data-only cellular plan as the Default Voice Line.");
    v21[0] = v12;
    BOOL v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a4 = [v10 errorWithDomain:v11 code:5 userInfo:v13];
LABEL_9:
  }
  return v7 ^ 1;
}

- (NSArray)allPlans
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [getCTCellularPlanManagerClass() sharedManager];
  BOOL v4 = [v3 planItemsShouldUpdate:1];
  uint64_t v5 = [(WFCellularPlansManager *)self client];
  id v16 = 0;
  id v6 = [v5 getSubscriptionInfoWithError:&v16];
  id v7 = v16;

  if (v7)
  {
    id v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v18 = "-[WFCellularPlansManager allPlans]";
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get CTXPCServiceSubscriptionInfo with error: %@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    int v10 = [v6 subscriptions];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __34__WFCellularPlansManager_allPlans__block_invoke;
    v12[3] = &unk_264E58EB0;
    id v13 = v3;
    id v14 = v10;
    uint64_t v15 = self;
    id v8 = v10;
    v9 = objc_msgSend(v4, "if_compactMap:", v12);
  }
  return (NSArray *)v9;
}

WFCellularPlan *__34__WFCellularPlansManager_allPlans__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v5 = [*(id *)(a1 + 32) getSubscriptionContextUUIDforPlan:v3];
  id v6 = (void *)[v4 initWithUUIDString:v5];

  id v7 = *(void **)(a1 + 40);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __34__WFCellularPlansManager_allPlans__block_invoke_2;
  v17[3] = &unk_264E58E88;
  id v8 = v6;
  id v18 = v8;
  v9 = objc_msgSend(v7, "if_firstObjectPassingTest:", v17);
  if (!v9)
  {
    int v10 = getWFActionsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 UUIDString];
      *(_DWORD *)long long buf = 136315394;
      id v20 = "-[WFCellularPlansManager allPlans]_block_invoke";
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_DEFAULT, "%s CTXPCServiceSubscriptionContext couldn't be created (%@), still creating cellular plan but some functionality may not be available.", buf, 0x16u);
    }
  }
  if ([v9 isSimHidden])
  {
    int v12 = getWFActionsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v8 UUIDString];
      *(_DWORD *)long long buf = 136315394;
      id v20 = "-[WFCellularPlansManager allPlans]_block_invoke";
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_INFO, "%s Won't create a WFCellularPlan for contextUUID %@ because that SIM is hidden", buf, 0x16u);
    }
    id v14 = 0;
  }
  else
  {
    uint64_t v15 = [WFCellularPlan alloc];
    int v12 = [*(id *)(a1 + 48) client];
    id v14 = [(WFCellularPlan *)v15 initWithCTXPCServiceSubscriptionContext:v9 client:v12 planItem:v3];
  }

  return v14;
}

uint64_t __34__WFCellularPlansManager_allPlans__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (WFCellularPlansManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WFCellularPlansManager;
  v2 = [(WFCellularPlansManager *)&v13 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.shortcuts.WFCellularPlansManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2050000000;
    id v7 = (void *)getCoreTelephonyClientClass_softClass_20923;
    uint64_t v18 = getCoreTelephonyClientClass_softClass_20923;
    if (!getCoreTelephonyClientClass_softClass_20923)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getCoreTelephonyClientClass_block_invoke_20924;
      v14[3] = &unk_264E5EC88;
      v14[4] = &v15;
      __getCoreTelephonyClientClass_block_invoke_20924((uint64_t)v14);
      id v7 = (void *)v16[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v15, 8);
    uint64_t v9 = [[v8 alloc] initWithQueue:v2->_queue];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v9;

    uint64_t v11 = v2;
  }

  return v2;
}

+ (id)dataRateToRadioAccessTechnologyModeMapping
{
  v5[9] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26F075528;
  v4[1] = &unk_26F075540;
  v5[0] = &unk_26F076830;
  v5[1] = &unk_26F076848;
  v4[2] = &unk_26F075558;
  v4[3] = &unk_26F075570;
  v5[2] = &unk_26F076860;
  v5[3] = &unk_26F076878;
  v4[4] = &unk_26F075588;
  v4[5] = &unk_26F0755A0;
  v5[4] = &unk_26F076890;
  v5[5] = &unk_26F0768A8;
  v4[6] = &unk_26F0755B8;
  v4[7] = &unk_26F0755D0;
  v5[6] = &unk_26F0768C0;
  v5[7] = &unk_26F0768D8;
  v4[8] = &unk_26F075600;
  v5[8] = &unk_26F0768F0;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

+ (id)modesFromDataRate:(int64_t)a3
{
  uint64_t v4 = [a1 dataRateToRadioAccessTechnologyModeMapping];
  dispatch_queue_t v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

@end