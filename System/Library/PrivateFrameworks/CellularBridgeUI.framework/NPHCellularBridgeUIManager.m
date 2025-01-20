@interface NPHCellularBridgeUIManager
+ (BOOL)_isSubscriptionInUse:(id)a3;
+ (id)sharedInstance;
+ (void)_presentAirplaneModeOnAlertOnViewController:(id)a3;
+ (void)_presentCellularRequiredModeAlertOnViewController:(id)a3;
+ (void)_presentErrorTitle:(id)a3 onViewController:(id)a4 withActionTitle:(id)a5 actionHandler:(id)a6;
+ (void)_presentErrorTitled:(id)a3 withMessage:(id)a4 onViewController:(id)a5;
+ (void)presentCellularError:(id)a3 onViewController:(id)a4;
- (BOOL)LTEMayImpactService;
- (BOOL)_isCarrierSetupFlowUnsupportedForServiceSubscription:(id)a3;
- (BOOL)_isPersistentError:(id)a3;
- (BOOL)_isSetupBlockingError:(id)a3;
- (BOOL)allCompanionSIMsMissing;
- (BOOL)cellularPlanIsSetUp;
- (BOOL)isAnyCellularPlanActivating;
- (BOOL)isCarrierSetupFlowUnsupported;
- (BOOL)isGeminiSetup;
- (BOOL)isTinkerCrossCarrierSetup;
- (BOOL)shouldAllowUserToAddOrSetUpPlan;
- (BOOL)shouldAllowUserToTransferPlanFromDeviceWithCSN:(id)a3;
- (BOOL)shouldOfferRemotePlan;
- (BOOL)shouldOfferSignupCompletion;
- (BOOL)shouldOfferTrialPlan;
- (CTDeviceIdentifier)transferableRemoteDeviceID;
- (CTRemotePlan)transferableRemotePlan;
- (NPHCellularBridgeUIManager)init;
- (NSArray)serviceSubscriptionsInUse;
- (NSArray)serviceSubscriptionsOfferingRemotePlan;
- (NSArray)serviceSubscriptionsOfferingTrialPlan;
- (NSArray)serviceSubscriptionsShouldShowAddNewRemotePlan;
- (NSArray)serviceSubscriptionsToOfferUser;
- (NSString)tinkerFamilyMemberFirstName;
- (NSString)trialPlanType;
- (TSSIMSetupFlow)flow;
- (UIViewController)hostViewController;
- (id)_activeDeviceCSNList;
- (id)_currentDeviceCSN;
- (id)_serviceSubscriptionInfoForSubscriptionContext:(id)a3;
- (id)_trialPlanTypeForContext:(id)a3;
- (id)carrierNameForSubscription:(id)a3;
- (id)carrierPhoneNumberForSubscription:(id)a3;
- (id)cellularPlanRequiringPreInstallConsent;
- (id)cellularPlans;
- (id)cellularUseErrors;
- (id)displayNameForCellularPlan:(id)a3;
- (id)formattedPhoneNumberForSubscription:(id)a3;
- (id)hostCompletionBlock;
- (id)lteOverrideForSubscription:(id)a3;
- (id)selectedCellularPlan;
- (id)simLabelForSubscription:(id)a3;
- (id)subscriptionContextForCellularPlanItem:(id)a3;
- (id)userConsentMessageForConsentType:(int64_t)a3 relevantPlanItem:(id)a4;
- (int64_t)_minMajorWatchOSVersionForSubscription:(id)a3;
- (int64_t)consentRequiredRelevantCellularPlanItem:(id *)a3;
- (void)_ctCellularPlanInfoDidChange:(id)a3;
- (void)_ctCellularRemoteProvisioningDidBecomeAvailable:(id)a3;
- (void)_localPlanInfoDidChange:(id)a3;
- (void)_nrPairedWatchDidBecomeActive;
- (void)_prePromptForUserConsentIfNecessary:(id)a3;
- (void)_prePromptUserForConsentTextType:(int64_t)a3 relevantPlanItem:(id)a4 completionBlock:(id)a5;
- (void)_promptForUserConsentForCarrierWebsiteIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)_setUpCellularPlanDirectWithContext:(id)a3 onViewController:(id)a4 withCompletion:(id)a5;
- (void)_setUpCellularPlanWithActivationCodeOnViewController:(id)a3 withContext:(id)a4 withCompletion:(id)a5 codelessActivationBlock:(id)a6;
- (void)_updateCellularPlansWithFetch:(BOOL)a3 forCSN:(id)a4;
- (void)_updateCoreTelephonyClientInfo;
- (void)_updateIsRemotePlanCapable;
- (void)_updateSIMStatusForAllSubscriptionContexts;
- (void)_updateSIMStatusForSubscriptionContext:(id)a3 withStatus:(id)a4;
- (void)_updateServiceSubscriptionInfo:(id)a3;
- (void)_updateShouldShowAddNewRemotePlan;
- (void)_updateShouldWarnAboutLTEMayImpactService;
- (void)_updateTransferableCellularPlanFromDeviceWithCSN:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)fetchTinkerFamilyMember;
- (void)finishRemoteProvisioning;
- (void)installPendingCellularPlan:(id)a3 withCompletion:(id)a4;
- (void)setFlow:(id)a3;
- (void)setHostCompletionBlock:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setTinkerFamilyMemberFirstName:(id)a3;
- (void)setTransferableRemoteDeviceID:(id)a3;
- (void)setTransferableRemotePlan:(id)a3;
- (void)setUpCellularPlanOnViewController:(id)a3 withContext:(id)a4 withCompletion:(id)a5;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)startRemoteProvisioning;
- (void)subscriptionInfoDidChange;
- (void)transferCellularPlanOnViewController:(id)a3 withCompletion:(id)a4;
- (void)updateCellularPlansWithFetch:(BOOL)a3;
@end

@implementation NPHCellularBridgeUIManager

uint64_t __60__NPHCellularBridgeUIManager__updateCoreTelephonyClientInfo__block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateServiceSubscriptionInfo:*(void *)(a1 + 40)];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sNPHCellularBridgeUIManager;
  return v2;
}

void __53__NPHCellularBridgeUIManager_fetchTinkerFamilyMember__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = nph_general_log();
  WeakRetained = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__NPHCellularBridgeUIManager_fetchTinkerFamilyMember__block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[NPHCellularBridgeUIManager fetchTinkerFamilyMember]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_235444000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v11, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = [v5 firstName];
    v10 = [v9 localizedCapitalizedString];
    [WeakRetained setTinkerFamilyMemberFirstName:v10];
  }
}

void __53__NPHCellularBridgeUIManager_fetchTinkerFamilyMember__block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_235444000, v0, v1, "%s: %@ error: %@", v2);
}

uint64_t __72__NPHCellularBridgeUIManager__updateSIMStatusForAllSubscriptionContexts__block_invoke_104(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__NPHCellularBridgeUIManager__updateSIMStatusForAllSubscriptionContexts__block_invoke_104_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return [*(id *)(a1 + 40) _updateSIMStatusForSubscriptionContext:*(void *)(a1 + 48) withStatus:*(void *)(a1 + 56)];
}

- (void)_updateServiceSubscriptionInfo:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = (CTXPCServiceSubscriptionInfo *)a3;
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[NPHCellularBridgeUIManager _updateServiceSubscriptionInfo:]";
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s info:%@", (uint8_t *)&v7, 0x16u);
  }

  serviceSubscriptionInfo = self->_serviceSubscriptionInfo;
  self->_serviceSubscriptionInfo = v4;

  [(NPHCellularBridgeUIManager *)self _updateSIMStatusForAllSubscriptionContexts];
  [(NPHCellularBridgeUIManager *)self updateCellularPlansWithFetch:0];
}

- (void)updateCellularPlansWithFetch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[NPHCellularBridgeUIManager updateCellularPlansWithFetch:]";
    __int16 v24 = 1024;
    *(_DWORD *)v25 = v3;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s - fetch:%d", buf, 0x12u);
  }

  uint64_t v6 = [(NPHCellularBridgeUIManager *)self _activeDeviceCSNList];
  int v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[NPHCellularBridgeUIManager updateCellularPlansWithFetch:]";
    __int16 v24 = 2112;
    *(void *)v25 = v6;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s - pairedDeviceCSNs:%@", buf, 0x16u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    *(void *)&long long v10 = 136315906;
    long long v17 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (!-[NSMutableSet containsObject:](self->_outstandingRemotePlanItemsRequestedForCSN, "containsObject:", v14, v17, (void)v18)|| v3)
        {
          [(NSMutableSet *)self->_outstandingRemotePlanItemsRequestedForCSN addObject:v14];
          [(NPHCellularBridgeUIManager *)self _updateCellularPlansWithFetch:v3 forCSN:v14];
        }
        else
        {
          uint64_t v15 = nph_general_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            outstandingRemotePlanItemsRequestedForCSN = self->_outstandingRemotePlanItemsRequestedForCSN;
            *(_DWORD *)buf = v17;
            v23 = "-[NPHCellularBridgeUIManager updateCellularPlansWithFetch:]";
            __int16 v24 = 1024;
            *(_DWORD *)v25 = 0;
            *(_WORD *)&v25[4] = 2112;
            *(void *)&v25[6] = outstandingRemotePlanItemsRequestedForCSN;
            __int16 v26 = 2112;
            uint64_t v27 = v14;
            _os_log_impl(&dword_235444000, v15, OS_LOG_TYPE_DEFAULT, "%s IGNORING request for updateCellularPlansWithFetch: fetch:%d _outstandingRemotePlanItemsRequestedForCSN:%@ CSN:%@", buf, 0x26u);
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v11);
  }
}

- (NPHCellularBridgeUIManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)NPHCellularBridgeUIManager;
  uint64_t v2 = [(NPHCellularBridgeUIManager *)&v13 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_outstandingPlanFlowsIdentified = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v4 = objc_opt_new();
    outstandingRemotePlanItemsRequestedForCSN = v3->_outstandingRemotePlanItemsRequestedForCSN;
    v3->_outstandingRemotePlanItemsRequestedForCSN = (NSMutableSet *)v4;

    uint64_t v6 = objc_opt_new();
    serviceSubscriptionInfoList = v3->_serviceSubscriptionInfoList;
    v3->_serviceSubscriptionInfoList = (NSMutableDictionary *)v6;

    [(NPHCellularBridgeUIManager *)v3 setTransferableRemotePlan:0];
    [(NPHCellularBridgeUIManager *)v3 setTransferableRemoteDeviceID:0];
    id v8 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    uint64_t v10 = [v8 initWithQueue:v9];
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = (CoreTelephonyClient *)v10;

    [(CoreTelephonyClient *)v3->_coreTelephonyClient setDelegate:v3];
    [(NPHCellularBridgeUIManager *)v3 _updateCoreTelephonyClientInfo];
    [(NPHCellularBridgeUIManager *)v3 fetchTinkerFamilyMember];
  }
  return v3;
}

void __60__NPHCellularBridgeUIManager__updateCoreTelephonyClientInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v13 = "-[NPHCellularBridgeUIManager _updateCoreTelephonyClientInfo]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s - error:%@ subscriptionInfo:%@", buf, 0x20u);
  }

  if (v6)
  {
    id v8 = nph_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__NPHCellularBridgeUIManager__updateCoreTelephonyClientInfo__block_invoke_cold_1();
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__NPHCellularBridgeUIManager__updateCoreTelephonyClientInfo__block_invoke_106;
  v10[3] = &unk_264C53710;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v9 = v5;
  nph_ensure_on_main_queue(v10);
}

void __72__NPHCellularBridgeUIManager__updateSIMStatusForAllSubscriptionContexts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[NPHCellularBridgeUIManager _updateSIMStatusForAllSubscriptionContexts]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s - status:%@", buf, 0x16u);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__NPHCellularBridgeUIManager__updateSIMStatusForAllSubscriptionContexts__block_invoke_104;
  v10[3] = &unk_264C538B8;
  id v11 = v6;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  nph_ensure_on_main_queue(v10);
}

- (void)_updateSIMStatusForSubscriptionContext:(id)a3 withStatus:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315650;
    __int16 v26 = "-[NPHCellularBridgeUIManager _updateSIMStatusForSubscriptionContext:withStatus:]";
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_235444000, v8, OS_LOG_TYPE_DEFAULT, "%s context:%@ status:%@", (uint8_t *)&v25, 0x20u);
  }

  if (!v6)
  {
    id v9 = nph_general_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager _updateSIMStatusForSubscriptionContext:withStatus:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  id v17 = [(NPHCellularBridgeUIManager *)self _serviceSubscriptionInfoForSubscriptionContext:v6];
  uint64_t v18 = [v17 SIMStatus];
  char v19 = [v18 isEqualToString:v7];

  if ((v19 & 1) == 0)
  {
    long long v20 = (void *)[v7 copy];
    [v17 setSIMStatus:v20];

    long long v21 = nph_general_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v17 SIMStatus];
      int v25 = 136315394;
      __int16 v26 = "-[NPHCellularBridgeUIManager _updateSIMStatusForSubscriptionContext:withStatus:]";
      __int16 v27 = 2112;
      id v28 = v22;
      _os_log_impl(&dword_235444000, v21, OS_LOG_TYPE_DEFAULT, "%s - serviceSubscriptionInfo.SIMStatus:%@", (uint8_t *)&v25, 0x16u);
    }
    v23 = nph_general_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      __int16 v26 = "-[NPHCellularBridgeUIManager _updateSIMStatusForSubscriptionContext:withStatus:]";
      _os_log_impl(&dword_235444000, v23, OS_LOG_TYPE_DEFAULT, "%s - posting NPHCellularPlanInfoDidChangeNotification 4", (uint8_t *)&v25, 0xCu);
    }

    __int16 v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 postNotificationName:NPHCellularPlanInfoDidChangeNotification object:self userInfo:0];
  }
}

- (id)_serviceSubscriptionInfoForSubscriptionContext:(id)a3
{
  id v4 = a3;
  serviceSubscriptionInfoList = self->_serviceSubscriptionInfoList;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  id v7 = [(NSMutableDictionary *)serviceSubscriptionInfoList objectForKeyedSubscript:v6];

  id v8 = [v7 serviceSubscriptionContext];
  char v9 = [v8 isEqual:v4];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = objc_opt_new();

    [v10 setShouldOfferRemotePlan:1];
    [v10 setServiceSubscriptionContext:v4];
    uint64_t v11 = self->_serviceSubscriptionInfoList;
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

    id v7 = v10;
  }

  return v7;
}

void __44__NPHCellularBridgeUIManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_alloc_init(NPHCellularBridgeUIManager);
  os_log_t v1 = (void *)sharedInstance_sNPHCellularBridgeUIManager;
  sharedInstance_sNPHCellularBridgeUIManager = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:sharedInstance_sNPHCellularBridgeUIManager selector:sel__ctCellularPlanInfoDidChange_ name:*MEMORY[0x263F31928] object:0];

  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:sharedInstance_sNPHCellularBridgeUIManager selector:sel__localPlanInfoDidChange_ name:*MEMORY[0x263F31948] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:sharedInstance_sNPHCellularBridgeUIManager selector:sel__ctCellularRemoteProvisioningDidBecomeAvailable_ name:*MEMORY[0x263F31958] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v6 = (const void *)sharedInstance_sNPHCellularBridgeUIManager;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263F576F0];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_NRPairedWatchDidBecomeActive, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setTransferableRemotePlan:(id)a3
{
}

- (void)setTransferableRemoteDeviceID:(id)a3
{
}

- (void)fetchTinkerFamilyMember
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[NPHCellularBridgeUIManager fetchTinkerFamilyMember]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263F2BBC0] sharedInstance];
  id v5 = [v4 cachedTinkerFamilyMemeber];

  if (v5)
  {
    id v6 = nph_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[NPHCellularBridgeUIManager fetchTinkerFamilyMember]";
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_235444000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    CFStringRef v7 = [v5 firstName];
    id v8 = [v7 localizedCapitalizedString];
    [(NPHCellularBridgeUIManager *)self setTinkerFamilyMemberFirstName:v8];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    char v9 = [MEMORY[0x263F2BBC0] sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__NPHCellularBridgeUIManager_fetchTinkerFamilyMember__block_invoke;
    v10[3] = &unk_264C53BB8;
    objc_copyWeak(&v11, (id *)buf);
    [v9 getActiveTinkerFamilyMemberWithCompletion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_updateSIMStatusForAllSubscriptionContexts
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(CTXPCServiceSubscriptionInfo *)self->_serviceSubscriptionInfo subscriptions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[CoreTelephonyClient getSIMStatus:completion:](self->_coreTelephonyClient, "getSIMStatus:completion:", MEMORY[0x263EF8330], 3221225472, __72__NPHCellularBridgeUIManager__updateSIMStatusForAllSubscriptionContexts__block_invoke, &unk_264C538E0, self, *(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateCoreTelephonyClientInfo
{
  coreTelephonyClient = self->_coreTelephonyClient;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__NPHCellularBridgeUIManager__updateCoreTelephonyClientInfo__block_invoke;
  v3[3] = &unk_264C53908;
  v3[4] = self;
  [(CoreTelephonyClient *)coreTelephonyClient getSubscriptionInfo:v3];
}

- (id)_activeDeviceCSNList
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  BOOL v3 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v4 = [MEMORY[0x263F57730] activeDeviceSelectorBlock];
  uint64_t v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    uint64_t v11 = *MEMORY[0x263F57550];
    *(void *)&long long v8 = 138412546;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        __int16 v14 = objc_msgSend(v13, "valueForProperty:", v11, v17, (void)v18);
        uint64_t v15 = nph_general_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          v23 = v14;
          __int16 v24 = 2112;
          int v25 = v13;
          _os_log_impl(&dword_235444000, v15, OS_LOG_TYPE_DEFAULT, "CSN:%@ device:%@", buf, 0x16u);
        }

        if (v14) {
          [v2 addObject:v14];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NPHCellularBridgeUIManager;
  [(NPHCellularBridgeUIManager *)&v4 dealloc];
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[NPHCellularBridgeUIManager simStatusDidChange:status:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_235444000, v8, OS_LOG_TYPE_DEFAULT, "%s context:%@ status:%@", buf, 0x20u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__NPHCellularBridgeUIManager_simStatusDidChange_status___block_invoke;
  v11[3] = &unk_264C53760;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  nph_ensure_on_main_queue(v11);
}

uint64_t __56__NPHCellularBridgeUIManager_simStatusDidChange_status___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSIMStatusForSubscriptionContext:*(void *)(a1 + 40) withStatus:*(void *)(a1 + 48)];
}

- (void)subscriptionInfoDidChange
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[NPHCellularBridgeUIManager subscriptionInfoDidChange]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(NPHCellularBridgeUIManager *)self _updateCoreTelephonyClientInfo];
}

- (void)activeSubscriptionsDidChange
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[NPHCellularBridgeUIManager activeSubscriptionsDidChange]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(NPHCellularBridgeUIManager *)self _updateCoreTelephonyClientInfo];
}

- (void)_localPlanInfoDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[NPHCellularBridgeUIManager _localPlanInfoDidChange:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  [(NPHCellularBridgeUIManager *)self _updateCoreTelephonyClientInfo];
}

- (id)_currentDeviceCSN
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F57700] activeDevice];
  BOOL v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[NPHCellularBridgeUIManager _currentDeviceCSN]";
    __int16 v9 = 2112;
    uint64_t v10 = v2;
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s device:%@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = [v2 valueForProperty:*MEMORY[0x263F57550]];
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[NPHCellularBridgeUIManager _currentDeviceCSN]";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s CSN:%@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (void)_setUpCellularPlanDirectWithContext:(id)a3 onViewController:(id)a4 withCompletion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[NPHCellularBridgeUIManager _setUpCellularPlanDirectWithContext:onViewController:withCompletion:]";
    _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__NPHCellularBridgeUIManager__setUpCellularPlanDirectWithContext_onViewController_withCompletion___block_invoke;
  v15[3] = &unk_264C53958;
  objc_copyWeak(&v20, (id *)buf);
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  __int16 v18 = self;
  id v19 = v14;
  [(NPHCellularBridgeUIManager *)self _prePromptForUserConsentIfNecessary:v15];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __98__NPHCellularBridgeUIManager__setUpCellularPlanDirectWithContext_onViewController_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v6 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __98__NPHCellularBridgeUIManager__setUpCellularPlanDirectWithContext_onViewController_withCompletion___block_invoke_2;
  v9[3] = &unk_264C53930;
  objc_copyWeak(v14, v4);
  id v10 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  v14[1] = a2;
  [WeakRetained _promptForUserConsentForCarrierWebsiteIfNecessary:v6 withCompletion:v9];

  objc_destroyWeak(v14);
}

void __98__NPHCellularBridgeUIManager__setUpCellularPlanDirectWithContext_onViewController_withCompletion___block_invoke_2(uint64_t a1, int a2)
{
  v26[5] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = (id *)(a1 + 64);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained setHostViewController:v3];

    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = objc_loadWeakRetained(v4);
    [v7 setHostCompletionBlock:v6];

    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 _serviceSubscriptionInfoForSubscriptionContext:*(void *)(a1 + 40)];

    BOOL v10 = ([v9 planFlows] & 0x40) != 0
       && +[NPHSharedUtilities isActiveDeviceTinker];
    v25[0] = @"FlowTypeKey";
    id v11 = [NSNumber numberWithInteger:7];
    v26[0] = v11;
    v25[1] = @"CarrierNameKey";
    uint64_t v12 = [*(id *)(a1 + 48) carrierNameForSubscription:*(void *)(a1 + 40)];
    uint64_t v13 = *(void *)(a1 + 40);
    v26[1] = v12;
    v26[2] = v13;
    v25[2] = @"SubscriptionContextKey";
    v25[3] = @"UserResponse";
    id v14 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
    v26[3] = v14;
    v25[4] = @"LiveIdEnabledKey";
    uint64_t v15 = [NSNumber numberWithBool:v10];
    v26[4] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];

    id v17 = [MEMORY[0x263F66080] flowWithOptions:v16];
    id v18 = objc_loadWeakRetained(v4);
    [v18 setFlow:v17];

    id v19 = objc_loadWeakRetained(v4);
    id v20 = [v19 flow];
    long long v21 = [v20 firstViewController];

    id v22 = objc_loadWeakRetained(v4);
    uint64_t v23 = [v22 flow];
    [v23 setDelegate:*(void *)(a1 + 48)];

    __int16 v24 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v21];
    [*(id *)(a1 + 32) presentViewController:v24 animated:1 completion:0];
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[NPHCellularBridgeUIManager simSetupFlowCompleted:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s: %lu", (uint8_t *)&v7, 0x16u);
  }

  if ((IsCurrentDevicePairing() & 1) == 0)
  {
    uint64_t v6 = [(NPHCellularBridgeUIManager *)self hostViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  [(NPHCellularBridgeUIManager *)self setFlow:0];
}

- (void)_setUpCellularPlanWithActivationCodeOnViewController:(id)a3 withContext:(id)a4 withCompletion:(id)a5 codelessActivationBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[NPHCellularBridgeUIManager sharedInstance];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __134__NPHCellularBridgeUIManager__setUpCellularPlanWithActivationCodeOnViewController_withContext_withCompletion_codelessActivationBlock___block_invoke;
  v18[3] = &unk_264C53980;
  id v21 = v11;
  id v22 = v12;
  id v19 = v10;
  id v20 = v9;
  id v14 = v9;
  id v15 = v10;
  id v16 = v12;
  id v17 = v11;
  [v13 _prePromptForUserConsentIfNecessary:v18];
}

void __134__NPHCellularBridgeUIManager__setUpCellularPlanWithActivationCodeOnViewController_withContext_withCompletion_codelessActivationBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[NPHCellularBridgeUIManager _setUpCellularPlanWithActivationCodeOnViewController:withContext:withCompletion:co"
         "delessActivationBlock:]_block_invoke";
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = objc_alloc_init(NPHBSCellularFauxCardViewController);
  [(NPHBSCellularFauxCardViewController *)v5 setCompletion:*(void *)(a1 + 48)];
  [(NPHBSCellularFauxCardViewController *)v5 setCodelessActivationBlock:*(void *)(a1 + 56)];
  [(NPHBSCellularFauxCardViewController *)v5 setUserConsentResponse:a2];
  [(NPHBSCellularFauxCardViewController *)v5 setSubscriptionContext:*(void *)(a1 + 32)];
  uint64_t v6 = objc_alloc_init(NPHBSCellularFauxCardNavigationController);
  [(NPHBSCellularFauxCardNavigationController *)v6 pushViewController:v5 animated:0];
  [(NPHBSCellularFauxCardNavigationController *)v6 setModalPresentationStyle:5];
  [*(id *)(a1 + 40) presentViewController:v6 animated:1 completion:0];
}

- (void)installPendingCellularPlan:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x263F31978];
  id v7 = a3;
  id v8 = [v6 sharedManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__NPHCellularBridgeUIManager_installPendingCellularPlan_withCompletion___block_invoke;
  v10[3] = &unk_264C539D0;
  id v11 = v5;
  id v9 = v5;
  [v8 installPendingRemotePlan:v7 completion:v10];
}

void __72__NPHCellularBridgeUIManager_installPendingCellularPlan_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = nph_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__NPHCellularBridgeUIManager_installPendingCellularPlan_withCompletion___block_invoke_cold_1();
    }
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NPHCellularBridgeUIManager_installPendingCellularPlan_withCompletion___block_invoke_134;
  v7[3] = &unk_264C539A8;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  nph_ensure_on_main_queue(v7);
}

uint64_t __72__NPHCellularBridgeUIManager_installPendingCellularPlan_withCompletion___block_invoke_134(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)shouldAllowUserToTransferPlanFromDeviceWithCSN:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[NPHCellularBridgeUIManager shouldAllowUserToTransferPlanFromDeviceWithCSN:]";
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  [(NPHCellularBridgeUIManager *)self _updateTransferableCellularPlanFromDeviceWithCSN:v4];
  id v6 = [(NPHCellularBridgeUIManager *)self transferableRemoteDeviceID];
  if (v6)
  {
    id v7 = [(NPHCellularBridgeUIManager *)self transferableRemotePlan];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  id v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [NSNumber numberWithBool:v8];
    uint64_t v11 = [v10 integerValue];
    int v13 = 136315394;
    id v14 = "-[NPHCellularBridgeUIManager shouldAllowUserToTransferPlanFromDeviceWithCSN:]";
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    _os_log_impl(&dword_235444000, v9, OS_LOG_TYPE_DEFAULT, "%s: %ld", (uint8_t *)&v13, 0x16u);
  }
  return v8;
}

- (void)_updateTransferableCellularPlanFromDeviceWithCSN:(id)a3
{
  v72[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "-[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:]";
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v4;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s CSN: %@", buf, 0x16u);
  }

  if ([v4 length])
  {
    id v6 = [(NPHCellularBridgeUIManager *)self _currentDeviceCSN];
    int v7 = [v4 isEqualToString:v6];

    if (v7)
    {
      BOOL v8 = nph_general_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
      id v16 = 0;
      goto LABEL_13;
    }
    coreTelephonyClient = self->_coreTelephonyClient;
    id v61 = 0;
    BOOL v8 = [(CoreTelephonyClient *)coreTelephonyClient getRemoteDeviceForTransferWithEID:v4 error:&v61];
    id v16 = v61;
    if (v8)
    {
      v72[0] = v8;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:1];
      goto LABEL_12;
    }
LABEL_13:
    id v20 = 0;
    goto LABEL_14;
  }
  uint64_t v17 = self->_coreTelephonyClient;
  id v60 = 0;
  BOOL v8 = [(CoreTelephonyClient *)v17 getRemoteDevicesForTransferOrError:&v60];
  id v16 = v60;
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v18 = [v8 devices];
LABEL_12:
  id v20 = (void *)v18;
LABEL_14:

  id v21 = nph_general_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v20 count];
    *(_DWORD *)buf = 136315394;
    v63 = "-[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:]";
    __int16 v64 = 2048;
    uint64_t v65 = v22;
    _os_log_impl(&dword_235444000, v21, OS_LOG_TYPE_DEFAULT, "%s - paired watches count:%ld", buf, 0x16u);
  }

  if (v16)
  {
    uint64_t v23 = nph_general_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:]();
    }

    goto LABEL_20;
  }
  if (![v20 count])
  {
LABEL_20:
    [(NPHCellularBridgeUIManager *)self setTransferableRemotePlan:0];
    [(NPHCellularBridgeUIManager *)self setTransferableRemoteDeviceID:0];
    goto LABEL_53;
  }
  v45 = 0;
  id v46 = v4;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v44 = v20;
  id obj = v20;
  uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
  if (!v49) {
    goto LABEL_50;
  }
  uint64_t v24 = 0;
  uint64_t v48 = *(void *)v57;
  do
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v57 != v48) {
        objc_enumerationMutation(obj);
      }
      uint64_t v50 = v25;
      __int16 v26 = *(void **)(*((void *)&v56 + 1) + 8 * v25);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      objc_msgSend(v26, "remotePlans", v44, v45, v46);
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v51 countByEnumeratingWithState:&v52 objects:v70 count:16];
      if (!v27) {
        goto LABEL_48;
      }
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(v51);
          }
          uint64_t v31 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v32 = [v31 transferAttributes];
          if ([v32 transferCapability] == 2)
          {
          }
          else
          {
            v33 = [v31 transferAttributes];
            v34 = self;
            uint64_t v35 = [v33 transferCapability];

            BOOL v36 = v35 == 4;
            self = v34;
            if (!v36)
            {
              v38 = nph_general_log();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v63 = "-[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:]";
                __int16 v64 = 2112;
                uint64_t v65 = (uint64_t)v31;
                _os_log_error_impl(&dword_235444000, v38, OS_LOG_TYPE_ERROR, "%s - Non-Transferable Plan:%@", buf, 0x16u);
              }
              goto LABEL_42;
            }
          }
          v37 = nph_general_log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v63 = "-[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:]";
            __int16 v64 = 2112;
            uint64_t v65 = (uint64_t)v31;
            _os_log_impl(&dword_235444000, v37, OS_LOG_TYPE_DEFAULT, "%s - Transferable Plan:%@", buf, 0x16u);
          }

          if (v24 >= 1)
          {
            v40 = nph_general_log();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              [(NPHCellularBridgeUIManager *)v68 _updateTransferableCellularPlanFromDeviceWithCSN:v40];
            }

            [(NPHCellularBridgeUIManager *)self setTransferableRemotePlan:0];
            [(NPHCellularBridgeUIManager *)self setTransferableRemoteDeviceID:0];
            ++v24;
            goto LABEL_48;
          }
          [(NPHCellularBridgeUIManager *)self setTransferableRemotePlan:v31];
          v38 = [v26 deviceID];
          [(NPHCellularBridgeUIManager *)self setTransferableRemoteDeviceID:v38];
          ++v24;
LABEL_42:
        }
        uint64_t v28 = [v51 countByEnumeratingWithState:&v52 objects:v70 count:16];
        if (v28) {
          continue;
        }
        break;
      }
LABEL_48:

      uint64_t v25 = v50 + 1;
    }
    while (v50 + 1 != v49);
    uint64_t v49 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
  }
  while (v49);
LABEL_50:

  v41 = nph_general_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = [(NPHCellularBridgeUIManager *)self transferableRemotePlan];
    v43 = [(NPHCellularBridgeUIManager *)self transferableRemoteDeviceID];
    *(_DWORD *)buf = 136315650;
    v63 = "-[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:]";
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v42;
    __int16 v66 = 2112;
    v67 = v43;
    _os_log_impl(&dword_235444000, v41, OS_LOG_TYPE_DEFAULT, "%s - TransferableRemote Plan: %@ DeviceID: %@", buf, 0x20u);
  }
  id v16 = v45;
  id v4 = v46;
  id v20 = v44;
LABEL_53:
}

- (void)setUpCellularPlanOnViewController:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = nph_general_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v29 = "-[NPHCellularBridgeUIManager setUpCellularPlanOnViewController:withContext:withCompletion:]";
    _os_log_impl(&dword_235444000, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_hostViewController, a3);
  self->_hostCompletionBlock = v11;
  if (v10)
  {
    uint64_t v13 = [(NPHCellularBridgeUIManager *)self _serviceSubscriptionInfoForSubscriptionContext:v10];
    if ([(NPHCellularBridgeUIManager *)self allCompanionSIMsMissing])
    {
      uint64_t v14 = [MEMORY[0x263F087E8] NPHCellularErrorWithCode:2 forSubscriptionContext:v10];
      [(id)objc_opt_class() presentCellularError:v14 onViewController:v9];
    }
    else if ([(NPHCellularBridgeUIManager *)self _isCarrierSetupFlowUnsupportedForServiceSubscription:v13])
    {
      uint64_t v22 = [MEMORY[0x263F087E8] NPHCellularErrorWithCode:3 forSubscriptionContext:v10];
      [(id)objc_opt_class() presentCellularError:v22 onViewController:v9];
    }
    else if ([v13 planFlows])
    {
      [(NPHCellularBridgeUIManager *)self _setUpCellularPlanDirectWithContext:v10 onViewController:v9 withCompletion:v11];
    }
    else if (([v13 planFlows] & 2) != 0)
    {
      [(NPHCellularBridgeUIManager *)self _setUpCellularPlanWithActivationCodeOnViewController:v9 withContext:v10 withCompletion:v11 codelessActivationBlock:0];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __91__NPHCellularBridgeUIManager_setUpCellularPlanOnViewController_withContext_withCompletion___block_invoke;
      v23[3] = &unk_264C539F8;
      objc_copyWeak(&v27, (id *)buf);
      id v24 = v10;
      id v25 = v9;
      id v26 = v11;
      [(NPHCellularBridgeUIManager *)self _setUpCellularPlanWithActivationCodeOnViewController:v25 withContext:v24 withCompletion:v26 codelessActivationBlock:v23];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v13 = nph_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager setUpCellularPlanOnViewController:withContext:withCompletion:](v13, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

void __91__NPHCellularBridgeUIManager_setUpCellularPlanOnViewController_withContext_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setUpCellularPlanDirectWithContext:*(void *)(a1 + 32) onViewController:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)transferCellularPlanOnViewController:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[NPHCellularBridgeUIManager transferCellularPlanOnViewController:withCompletion:]";
    _os_log_impl(&dword_235444000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_hostViewController, a3);
  self->_hostCompletionBlock = v8;
  uint64_t v10 = [(NPHCellularBridgeUIManager *)self transferableRemotePlan];
  if (v10
    && (id v11 = (void *)v10,
        [(NPHCellularBridgeUIManager *)self transferableRemoteDeviceID],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12))
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    uint64_t v14 = [(NPHCellularBridgeUIManager *)self transferableRemotePlan];
    uint64_t v15 = [v14 planID];
    uint64_t v16 = [(NPHCellularBridgeUIManager *)self transferableRemoteDeviceID];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __82__NPHCellularBridgeUIManager_transferCellularPlanOnViewController_withCompletion___block_invoke;
    v18[3] = &unk_264C53A20;
    void v18[4] = self;
    uint64_t v19 = v8;
    [(CoreTelephonyClient *)coreTelephonyClient transferRemotePlan:v15 fromDevice:v16 completion:v18];

    uint64_t v17 = v19;
  }
  else
  {
    uint64_t v17 = nph_general_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager transferCellularPlanOnViewController:withCompletion:](self, v17);
    }
  }
}

void __82__NPHCellularBridgeUIManager_transferCellularPlanOnViewController_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __82__NPHCellularBridgeUIManager_transferCellularPlanOnViewController_withCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!v4)
  {
    [*(id *)(a1 + 32) setTransferableRemotePlan:0];
    [*(id *)(a1 + 32) setTransferableRemoteDeviceID:0];
  }
}

- (void)_prePromptForUserConsentIfNecessary:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = [MEMORY[0x263F31978] calculateInstallConsentTextTypeFor:self->_proxyPlanItems];
  id v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[NPHCellularBridgeUIManager _prePromptForUserConsentIfNecessary:]";
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_235444000, v6, OS_LOG_TYPE_DEFAULT, "%s - consentTextType:%ld", (uint8_t *)&v9, 0x16u);
  }

  if (v5 == 5)
  {
    if ([(NSArray *)self->_proxyPlanItems count] == 1)
    {
      id v7 = self;
      uint64_t v8 = 5;
      goto LABEL_8;
    }
LABEL_9:
    v4[2](v4, 0);
    goto LABEL_10;
  }
  if (v5 != 4) {
    goto LABEL_9;
  }
  id v7 = self;
  uint64_t v8 = 4;
LABEL_8:
  [(NPHCellularBridgeUIManager *)v7 _prePromptUserForConsentTextType:v8 relevantPlanItem:0 completionBlock:v4];
LABEL_10:
}

- (void)_prePromptUserForConsentTextType:(int64_t)a3 relevantPlanItem:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  int v9 = [(NPHCellularBridgeUIManager *)self userConsentMessageForConsentType:a3 relevantPlanItem:a4];
  uint64_t v10 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:v9 preferredStyle:0];
  [v10 setModalPresentationStyle:2];
  __int16 v11 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"CONSENT_DELETE_ACTION" value:&stru_26E895688 table:0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __96__NPHCellularBridgeUIManager__prePromptUserForConsentTextType_relevantPlanItem_completionBlock___block_invoke;
  v29[3] = &unk_264C53A48;
  id v14 = v8;
  id v30 = v14;
  uint64_t v15 = [v11 actionWithTitle:v13 style:2 handler:v29];

  [v10 addAction:v15];
  if (a3 == 5)
  {
    uint64_t v16 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"CONSENT_KEEP_ACTION" value:&stru_26E895688 table:0];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    id v26 = __96__NPHCellularBridgeUIManager__prePromptUserForConsentTextType_relevantPlanItem_completionBlock___block_invoke_2;
    id v27 = &unk_264C53A48;
    id v28 = v14;
    uint64_t v19 = [v16 actionWithTitle:v18 style:0 handler:&v24];

    objc_msgSend(v10, "addAction:", v19, v24, v25, v26, v27);
  }
  uint64_t v20 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v22 = [v21 localizedStringForKey:@"CONSENT_CANCEL" value:&stru_26E895688 table:0];
  uint64_t v23 = [v20 actionWithTitle:v22 style:1 handler:&__block_literal_global_156];

  [v10 addAction:v23];
  [(UIViewController *)self->_hostViewController presentViewController:v10 animated:1 completion:0];
}

uint64_t __96__NPHCellularBridgeUIManager__prePromptUserForConsentTextType_relevantPlanItem_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__NPHCellularBridgeUIManager__prePromptUserForConsentTextType_relevantPlanItem_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)userConsentMessageForConsentType:(int64_t)a3 relevantPlanItem:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = 0;
  char v8 = 1;
  char v9 = 1;
  switch(a3)
  {
    case 1:
      char v9 = 0;
      id v7 = @"CONSENT_NEW_PLAN_CANNOT_BE_DISABLED";
      break;
    case 2:
      char v9 = 0;
      id v7 = @"CONSENT_NEW_PLAN_CANNOT_BE_DELETED";
      break;
    case 3:
    case 7:
      char v9 = 0;
      id v7 = @"CONSENT_NEW_PLAN_INSTALL";
      break;
    case 4:
      char v8 = 0;
      char v9 = 0;
      id v7 = @"CONSENT_CURRENT_PLAN_CANNOT_BE_DISABLED";
      break;
    case 5:
      char v9 = 0;
      id v7 = @"CONSENT_CURRENT_PLAN_CANNOT_BE_DELETED";
      break;
    default:
      break;
  }
  uint64_t v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[NPHCellularBridgeUIManager userConsentMessageForConsentType:relevantPlanItem:]";
    __int16 v41 = 2048;
    int64_t v42 = a3;
    __int16 v43 = 2112;
    v44 = v7;
    _os_log_impl(&dword_235444000, v10, OS_LOG_TYPE_DEFAULT, "%s - consentType:%ld consentMessageKey:%@", buf, 0x20u);
  }

  if (v9)
  {
    id v7 = 0;
    __int16 v11 = 0;
    goto LABEL_33;
  }
  if ([(__CFString *)v7 isEqualToString:@"CONSENT_NEW_PLAN_INSTALL"])
  {
    int v12 = MGGetBoolAnswer();
    uint64_t v13 = @"WIFI";
    if (v12) {
      uint64_t v13 = @"WLAN";
    }
    id v14 = [NSString stringWithFormat:@"%@_%@", v7, v13];
    uint64_t v15 = NSString;
    uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:v14 value:&stru_26E895688 table:0];
    uint64_t v18 = [(NPHCellularBridgeUIManager *)self tinkerFamilyMemberFirstName];
    __int16 v11 = objc_msgSend(v15, "stringWithFormat:", v17, v18);

    if (a3 != 7) {
      goto LABEL_32;
    }
    uint64_t v19 = (__CFString *)[v11 mutableCopy];
    uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:@"CONSENT_NEW_PLAN_INSTALL_911_INFO" value:&stru_26E895688 table:0];
    [(__CFString *)v19 appendFormat:@"\n\n %@", v21];

    uint64_t v22 = [(__CFString *)v19 copy];
  }
  else
  {
    uint64_t v23 = [v6 plan];
    uint64_t v24 = [v23 carrierName];

    if (v24) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = &stru_26E895688;
    }
    id v14 = v25;

    id v26 = [(NPHCellularBridgeUIManager *)self selectedCellularPlan];
    id v27 = [v26 plan];
    id v28 = [v27 carrierName];

    if (v28) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = &stru_26E895688;
    }
    uint64_t v19 = v29;

    uint64_t v30 = [(__CFString *)v14 length];
    uint64_t v31 = [(__CFString *)v19 length];
    if (v30) {
      char v32 = v8;
    }
    else {
      char v32 = 0;
    }
    char v33 = (v30 != 0) & ~v8;
    if (!v31) {
      char v33 = 0;
    }
    if ((v33 & 1) == 0 && (v32 & 1) == 0)
    {
      id v7 = [(__CFString *)v7 stringByAppendingString:@"_NO_NAME"];
    }
    v34 = NSString;
    __int16 v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v35 = [v11 localizedStringForKey:v7 value:&stru_26E895688 table:0];
    v38[0] = v14;
    v38[1] = v19;
    BOOL v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
    uint64_t v22 = [v34 stringWithPositionalSpecifiersFormat:v35 arguments:v36];
  }
  __int16 v11 = (void *)v22;
LABEL_32:

LABEL_33:
  return v11;
}

- (void)_updateCellularPlansWithFetch:(BOOL)a3 forCSN:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v13 = "-[NPHCellularBridgeUIManager _updateCellularPlansWithFetch:forCSN:]";
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s - fetch:%d CSN:%@", buf, 0x1Cu);
  }

  char v8 = [MEMORY[0x263F31978] sharedManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__NPHCellularBridgeUIManager__updateCellularPlansWithFetch_forCSN___block_invoke;
  v10[3] = &unk_264C53AB0;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 remotePlanItemsWithUpdateFetch:v4 withCSN:v9 completion:v10];
}

void __67__NPHCellularBridgeUIManager__updateCellularPlansWithFetch_forCSN___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__NPHCellularBridgeUIManager__updateCellularPlansWithFetch_forCSN___block_invoke_2;
  v10[3] = &unk_264C538B8;
  id v11 = v6;
  id v12 = v5;
  id v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v5;
  id v9 = v6;
  nph_ensure_on_main_queue(v10);
}

void __67__NPHCellularBridgeUIManager__updateCellularPlansWithFetch_forCSN___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "-[NPHCellularBridgeUIManager _updateCellularPlansWithFetch:forCSN:]_block_invoke_2";
    __int16 v23 = 2112;
    uint64_t v24 = v3;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl(&dword_235444000, v2, OS_LOG_TYPE_DEFAULT, "%s - error:%@ items:%@", buf, 0x20u);
  }

  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(void **)(*(void *)(a1 + 48) + 48);
  id v8 = *(id *)(a1 + 32);
  [v7 removeObject:v6];
  if (!v5) {
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  id v9 = [MEMORY[0x263F087E8] NPHCellularSanitizedError:v8 forSubscriptionContext:0];

  if (v9)
  {
    uint64_t v10 = nph_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __67__NPHCellularBridgeUIManager__updateCellularPlansWithFetch_forCSN___block_invoke_2_cold_1();
    }

    uint64_t v19 = NPHCellularPlanInfoError;
    uint64_t v20 = v9;
    id v11 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = [v5 sortedArrayUsingComparator:&__block_literal_global_199];
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = *(void **)(v13 + 32);
  *(void *)(v13 + 32) = v12;

  BOOL v15 = nph_general_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[NPHCellularBridgeUIManager _updateCellularPlansWithFetch:forCSN:]_block_invoke_2";
    _os_log_impl(&dword_235444000, v15, OS_LOG_TYPE_DEFAULT, "%s - posting NPHCellularPlanInfoDidChangeNotification 1", buf, 0xCu);
  }

  __int16 v16 = nph_general_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[NPHCellularBridgeUIManager _updateCellularPlansWithFetch:forCSN:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    _os_log_impl(&dword_235444000, v16, OS_LOG_TYPE_DEFAULT, "%s - posting _proxyPlanItems:%@", buf, 0x16u);
  }

  uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 postNotificationName:NPHCellularPlanInfoDidChangeNotification object:*(void *)(a1 + 48) userInfo:v11];

  [*(id *)(a1 + 48) _updateShouldShowAddNewRemotePlan];
  [*(id *)(a1 + 48) _updateIsRemotePlanCapable];
  [*(id *)(a1 + 48) _updateShouldWarnAboutLTEMayImpactService];
}

uint64_t __67__NPHCellularBridgeUIManager__updateCellularPlansWithFetch_forCSN___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (void)_updateShouldShowAddNewRemotePlan
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_outstandingPlanFlowsIdentified == 0x7FFFFFFFFFFFFFFFLL) {
    self->_outstandingPlanFlowsIdentified = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id obj = [(CTXPCServiceSubscriptionInfo *)self->_serviceSubscriptionInfo subscriptions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        ++self->_outstandingPlanFlowsIdentified;
        id v8 = [MEMORY[0x263F31978] sharedManager];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __63__NPHCellularBridgeUIManager__updateShouldShowAddNewRemotePlan__block_invoke;
        v10[3] = &unk_264C53B00;
        void v10[4] = self;
        void v10[5] = v7;
        [v8 shouldShowAddNewRemotePlanWithContext:v7 completion:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __63__NPHCellularBridgeUIManager__updateShouldShowAddNewRemotePlan__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__NPHCellularBridgeUIManager__updateShouldShowAddNewRemotePlan__block_invoke_2;
  v13[3] = &unk_264C53AD8;
  long long v14 = *(_OWORD *)(a1 + 32);
  char v18 = a2;
  id v16 = v9;
  uint64_t v17 = a3;
  id v15 = v10;
  id v11 = v9;
  id v12 = v10;
  nph_ensure_on_main_queue(v13);
}

void __63__NPHCellularBridgeUIManager__updateShouldShowAddNewRemotePlan__block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  --*(void *)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __63__NPHCellularBridgeUIManager__updateShouldShowAddNewRemotePlan__block_invoke_2_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v2 = *(void *)(a1 + 40);
  }
  id v11 = [*(id *)(a1 + 32) _serviceSubscriptionInfoForSubscriptionContext:v2];
  int v12 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 64);
  long long v14 = nph_general_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    uint64_t v35 = "-[NPHCellularBridgeUIManager _updateShouldShowAddNewRemotePlan]_block_invoke";
    __int16 v36 = 1024;
    *(_DWORD *)v37 = v12;
    *(_WORD *)&v37[4] = 2048;
    *(void *)&v37[6] = v13;
    *(_WORD *)&v37[14] = 2112;
    *(void *)&v37[16] = v15;
    _os_log_impl(&dword_235444000, v14, OS_LOG_TYPE_DEFAULT, "%s - shouldShowAddNewRemotePlan:%d option:%lu shouldShowAddError:%@", buf, 0x26u);
  }

  if (v12 == [v11 shouldShowAddNewRemotePlan])
  {
    if ([v11 planFlows] == v13)
    {
      int v16 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    [v11 setShouldShowAddNewRemotePlan:v12 != 0];
    [v11 planFlows];
  }
  [v11 setPlanFlows:v13];
  if ([v11 shouldShowAddNewRemotePlan]) {
    unint64_t v17 = ((unint64_t)[v11 planFlows] >> 2) & 1;
  }
  else {
    unint64_t v17 = 0;
  }
  [v11 setShouldOfferTrialPlan:v17];
  if ([v11 shouldShowAddNewRemotePlan]) {
    unint64_t v18 = ((unint64_t)[v11 planFlows] >> 3) & 1;
  }
  else {
    unint64_t v18 = 0;
  }
  [v11 setShouldOfferSignupCompletion:v18];
  if ([v11 shouldOfferTrialPlan])
  {
    uint64_t v19 = (void *)[*(id *)(a1 + 56) copy];
    [v11 setTrialPlanType:v19];
  }
  else
  {
    [v11 setTrialPlanType:0];
  }
  uint64_t v20 = nph_general_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [v11 shouldOfferTrialPlan];
    int v22 = [v11 shouldOfferSignupCompletion];
    __int16 v23 = [v11 trialPlanType];
    *(_DWORD *)buf = 136315906;
    uint64_t v35 = "-[NPHCellularBridgeUIManager _updateShouldShowAddNewRemotePlan]_block_invoke";
    __int16 v36 = 1024;
    *(_DWORD *)v37 = v21;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v22;
    *(_WORD *)&v37[10] = 2112;
    *(void *)&v37[12] = v23;
    _os_log_impl(&dword_235444000, v20, OS_LOG_TYPE_DEFAULT, "%s - shouldOfferTrialPlan:%d shouldOfferSignupCompletion:%d trialPlanType:%@", buf, 0x22u);
  }
  int v16 = 1;
LABEL_23:
  uint64_t v24 = [MEMORY[0x263F087E8] NPHCellularSanitizedError:*(void *)(a1 + 48) forSubscriptionContext:*(void *)(a1 + 40)];
  __int16 v25 = nph_general_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v35 = "-[NPHCellularBridgeUIManager _updateShouldShowAddNewRemotePlan]_block_invoke";
    __int16 v36 = 2112;
    *(void *)v37 = v24;
    _os_log_impl(&dword_235444000, v25, OS_LOG_TYPE_DEFAULT, "%s - sanitizedShouldShowAddError:%@", buf, 0x16u);
  }

  int v26 = [*(id *)(a1 + 32) _isPersistentError:v24];
  if (!v24 || v26)
  {
    uint64_t v28 = [v11 persistentError];
    uint64_t v29 = v24 | v28;

    if (v29)
    {
      [v11 setPersistentError:v24];
    }
    else if (!v16)
    {
      goto LABEL_35;
    }
    uint64_t v27 = 0;
  }
  else
  {
    char v32 = NPHCellularPlanInfoError;
    uint64_t v33 = v24;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  }
  uint64_t v30 = nph_general_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v35 = "-[NPHCellularBridgeUIManager _updateShouldShowAddNewRemotePlan]_block_invoke";
    _os_log_impl(&dword_235444000, v30, OS_LOG_TYPE_DEFAULT, "%s - posting NPHCellularPlanInfoDidChangeNotification 2", buf, 0xCu);
  }

  uint64_t v31 = [MEMORY[0x263F08A00] defaultCenter];
  [v31 postNotificationName:NPHCellularPlanInfoDidChangeNotification object:*(void *)(a1 + 32) userInfo:v27];

LABEL_35:
}

- (void)_updateIsRemotePlanCapable
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v18 = "-[NPHCellularBridgeUIManager _updateIsRemotePlanCapable]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id obj = [(CTXPCServiceSubscriptionInfo *)self->_serviceSubscriptionInfo subscriptions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = [MEMORY[0x263F31978] sharedManager];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __56__NPHCellularBridgeUIManager__updateIsRemotePlanCapable__block_invoke;
        v11[3] = &unk_264C53B50;
        v11[4] = v8;
        void v11[5] = self;
        [v9 isRemotePlanCapableWithContext:v8 completion:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

void __56__NPHCellularBridgeUIManager__updateIsRemotePlanCapable__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__NPHCellularBridgeUIManager__updateIsRemotePlanCapable__block_invoke_2;
  v2[3] = &unk_264C53B28;
  long long v3 = *(_OWORD *)(a1 + 32);
  char v4 = a2;
  nph_ensure_on_main_queue(v2);
}

void __56__NPHCellularBridgeUIManager__updateIsRemotePlanCapable__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    long long v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __56__NPHCellularBridgeUIManager__updateIsRemotePlanCapable__block_invoke_2_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v11 = [*(id *)(a1 + 40) _serviceSubscriptionInfoForSubscriptionContext:v2];
  long long v12 = nph_general_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v11 shouldOfferRemotePlan];
    int v14 = *(unsigned __int8 *)(a1 + 48);
    int v20 = 136315650;
    int v21 = "-[NPHCellularBridgeUIManager _updateIsRemotePlanCapable]_block_invoke";
    __int16 v22 = 1024;
    int v23 = v13;
    __int16 v24 = 1024;
    int v25 = v14;
    _os_log_impl(&dword_235444000, v12, OS_LOG_TYPE_DEFAULT, "%s from:%d to :%d", (uint8_t *)&v20, 0x18u);
  }

  int v15 = *(unsigned __int8 *)(a1 + 48);
  if (v15 != [v11 shouldOfferRemotePlan])
  {
    [v11 setShouldOfferRemotePlan:*(unsigned __int8 *)(a1 + 48)];
    int v16 = nph_general_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v11 shouldOfferRemotePlan];
      int v20 = 136315394;
      int v21 = "-[NPHCellularBridgeUIManager _updateIsRemotePlanCapable]_block_invoke";
      __int16 v22 = 1024;
      int v23 = v17;
      _os_log_impl(&dword_235444000, v16, OS_LOG_TYPE_DEFAULT, "%s - shouldOfferRemotePlan:%d", (uint8_t *)&v20, 0x12u);
    }

    unint64_t v18 = nph_general_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      int v21 = "-[NPHCellularBridgeUIManager _updateIsRemotePlanCapable]_block_invoke";
      _os_log_impl(&dword_235444000, v18, OS_LOG_TYPE_DEFAULT, "%s - posting NPHCellularPlanInfoDidChangeNotification 3", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 postNotificationName:NPHCellularPlanInfoDidChangeNotification object:*(void *)(a1 + 40) userInfo:0];
  }
}

- (void)_updateShouldWarnAboutLTEMayImpactService
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[NPHCellularBridgeUIManager _updateShouldWarnAboutLTEMayImpactService]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_235444000, log, OS_LOG_TYPE_ERROR, "%s error from _CTServerConnectionShouldWarnDisabledLteMayImpactService - ctError.domain:%d ctError.error:%d", (uint8_t *)&v3, 0x18u);
}

- (NSArray)serviceSubscriptionsToOfferUser
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v26 = (NSMutableDictionary *)objc_opt_new();
  int v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    serviceSubscriptionInfoList = self->_serviceSubscriptionInfoList;
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "-[NPHCellularBridgeUIManager serviceSubscriptionsToOfferUser]";
    __int16 v34 = 2112;
    uint64_t v35 = serviceSubscriptionInfoList;
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s - _serviceSubscriptionInfoList:%@", buf, 0x16u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  __int16 v5 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(NSMutableDictionary **)(*((void *)&v27 + 1) + 8 * i);
        id v11 = nph_general_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v33 = "-[NPHCellularBridgeUIManager serviceSubscriptionsToOfferUser]";
          __int16 v34 = 2112;
          uint64_t v35 = v10;
          _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "%s - serviceSubscriptionInfo:%@", buf, 0x16u);
        }

        if ([(NSMutableDictionary *)v10 shouldShowAddNewRemotePlan])
        {
          long long v12 = [(NSMutableDictionary *)v10 persistentError];
          if ([(NPHCellularBridgeUIManager *)self _isSetupBlockingError:v12])
          {
          }
          else
          {
            if ([(id)objc_opt_class() _isSubscriptionInUse:v10])
            {

LABEL_27:
              __int16 v22 = nph_general_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v33 = "-[NPHCellularBridgeUIManager serviceSubscriptionsToOfferUser]";
                __int16 v34 = 2112;
                uint64_t v35 = v10;
                _os_log_impl(&dword_235444000, v22, OS_LOG_TYPE_DEFAULT, "%s - offer:%@", buf, 0x16u);
              }

              uint64_t v19 = [(NSMutableDictionary *)v10 serviceSubscriptionContext];
              [(NSMutableDictionary *)v26 addObject:v19];
LABEL_30:

              continue;
            }
            BOOL v21 = +[NPHSharedUtilities isActiveDeviceTinker];

            if (v21) {
              goto LABEL_27;
            }
          }
        }
        if (([(NSMutableDictionary *)v10 shouldShowAddNewRemotePlan] & 1) == 0)
        {
          int v13 = nph_general_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = [(NSMutableDictionary *)v10 shouldShowAddNewRemotePlan];
            *(_DWORD *)buf = 136315394;
            uint64_t v33 = "-[NPHCellularBridgeUIManager serviceSubscriptionsToOfferUser]";
            __int16 v34 = 1024;
            LODWORD(v35) = v14;
            _os_log_impl(&dword_235444000, v13, OS_LOG_TYPE_DEFAULT, "%s - REJECTED: shouldShowAddNewRemotePlan:%d", buf, 0x12u);
          }
        }
        int v15 = [(NSMutableDictionary *)v10 persistentError];
        BOOL v16 = [(NPHCellularBridgeUIManager *)self _isSetupBlockingError:v15];

        if (v16)
        {
          int v17 = nph_general_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v18 = [(NSMutableDictionary *)v10 persistentError];
            *(_DWORD *)buf = 136315394;
            uint64_t v33 = "-[NPHCellularBridgeUIManager serviceSubscriptionsToOfferUser]";
            __int16 v34 = 2112;
            uint64_t v35 = v18;
            _os_log_impl(&dword_235444000, v17, OS_LOG_TYPE_DEFAULT, "%s - REJECTED: persistent error:%@", buf, 0x16u);
          }
        }
        if (([(id)objc_opt_class() _isSubscriptionInUse:v10] & 1) == 0)
        {
          uint64_t v19 = nph_general_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = [(NSMutableDictionary *)v10 SIMStatus];
            *(_DWORD *)buf = 136315394;
            uint64_t v33 = "-[NPHCellularBridgeUIManager serviceSubscriptionsToOfferUser]";
            __int16 v34 = 2112;
            uint64_t v35 = v20;
            _os_log_impl(&dword_235444000, v19, OS_LOG_TYPE_DEFAULT, "%s - REJECTED: not in use:%@", buf, 0x16u);
          }
          goto LABEL_30;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  int v23 = nph_general_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "-[NPHCellularBridgeUIManager serviceSubscriptionsToOfferUser]";
    __int16 v34 = 2112;
    uint64_t v35 = v26;
    _os_log_impl(&dword_235444000, v23, OS_LOG_TYPE_DEFAULT, "%s - serviceSubscriptionsToOfferUser:%@", buf, 0x16u);
  }

  __int16 v24 = (void *)[(NSMutableDictionary *)v26 copy];
  return (NSArray *)v24;
}

- (BOOL)isGeminiSetup
{
  uint64_t v2 = [(NPHCellularBridgeUIManager *)self serviceSubscriptionsInUse];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)isTinkerCrossCarrierSetup
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (+[NPHSharedUtilities isActiveDeviceTinker])
  {
    BOOL v3 = [(NPHCellularBridgeUIManager *)self cellularPlanRequiringPreInstallConsent];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  __int16 v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[NPHCellularBridgeUIManager isTinkerCrossCarrierSetup]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

+ (BOOL)_isSubscriptionInUse:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 SIMStatus];
  if ([v4 isEqualToString:*MEMORY[0x263F030B8]])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = +[NPHCellularBridgeUIManager sharedInstance];
    if ([v6 isTinkerCrossCarrierSetup])
    {
      int v7 = [v3 SIMStatus];
      char v5 = [v7 isEqualToString:*MEMORY[0x263F03078]];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (NSArray)serviceSubscriptionsInUse
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([(id)objc_opt_class() _isSubscriptionInUse:v9])
        {
          BOOL v10 = [v9 serviceSubscriptionContext];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[NPHCellularBridgeUIManager serviceSubscriptionsInUse]";
    __int16 v20 = 2112;
    BOOL v21 = v3;
    _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "%s serviceSubscriptionsInUse:%@", buf, 0x16u);
  }

  long long v12 = (void *)[v3 copy];
  return (NSArray *)v12;
}

- (NSArray)serviceSubscriptionsShouldShowAddNewRemotePlan
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 shouldShowAddNewRemotePlan]
          && [(id)objc_opt_class() _isSubscriptionInUse:v9])
        {
          BOOL v10 = [v9 serviceSubscriptionContext];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[NPHCellularBridgeUIManager serviceSubscriptionsShouldShowAddNewRemotePlan]";
    __int16 v20 = 2112;
    BOOL v21 = v3;
    _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "%s serviceSubscriptionsShouldShowAddNewRemotePlan:%@", buf, 0x16u);
  }

  long long v12 = (void *)[v3 copy];
  return (NSArray *)v12;
}

- (NSArray)serviceSubscriptionsOfferingRemotePlan
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = (NSMutableDictionary *)objc_opt_new();
  BOOL v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    serviceSubscriptionInfoList = self->_serviceSubscriptionInfoList;
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[NPHCellularBridgeUIManager serviceSubscriptionsOfferingRemotePlan]";
    __int16 v23 = 2112;
    __int16 v24 = serviceSubscriptionInfoList;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s _serviceSubscriptionInfoList:%@", buf, 0x16u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([(id)objc_opt_class() _isSubscriptionInUse:v11]
          && [v11 shouldOfferRemotePlan])
        {
          long long v12 = [v11 serviceSubscriptionContext];
          [(NSMutableDictionary *)v3 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  int v13 = nph_general_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[NPHCellularBridgeUIManager serviceSubscriptionsOfferingRemotePlan]";
    __int16 v23 = 2112;
    __int16 v24 = v3;
    _os_log_impl(&dword_235444000, v13, OS_LOG_TYPE_DEFAULT, "%s serviceSubscriptionsOfferingRemotePlan:%@", buf, 0x16u);
  }

  long long v14 = (void *)[(NSMutableDictionary *)v3 copy];
  return (NSArray *)v14;
}

- (BOOL)shouldOfferRemotePlan
{
  if (![(NSMutableDictionary *)self->_serviceSubscriptionInfoList count]) {
    return 1;
  }
  id v3 = [(NPHCellularBridgeUIManager *)self serviceSubscriptionsOfferingRemotePlan];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSArray)serviceSubscriptionsOfferingTrialPlan
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([(id)objc_opt_class() _isSubscriptionInUse:v9]
          && [v9 shouldOfferTrialPlan])
        {
          BOOL v10 = [v9 serviceSubscriptionContext];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v19 = "-[NPHCellularBridgeUIManager serviceSubscriptionsOfferingTrialPlan]";
    __int16 v20 = 2112;
    BOOL v21 = v3;
    _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "%s serviceSubscriptionsOfferingTrialPlan:%@", buf, 0x16u);
  }

  long long v12 = (void *)[v3 copy];
  return (NSArray *)v12;
}

- (BOOL)shouldOfferTrialPlan
{
  uint64_t v2 = [(NPHCellularBridgeUIManager *)self serviceSubscriptionsOfferingTrialPlan];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)cellularPlans
{
  uint64_t v2 = (void *)[(NSArray *)self->_proxyPlanItems copy];
  return v2;
}

- (id)selectedCellularPlan
{
  return [(NSArray *)self->_proxyPlanItems firstObjectPassingTest:&__block_literal_global_207];
}

uint64_t __50__NPHCellularBridgeUIManager_selectedCellularPlan__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (id)cellularPlanRequiringPreInstallConsent
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (+[NPHSharedUtilities isActiveDeviceTinker])
  {
    BOOL v3 = [(NSArray *)self->_proxyPlanItems firstObjectPassingTest:&__block_literal_global_209];
    BOOL v4 = nph_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[NPHCellularBridgeUIManager cellularPlanRequiringPreInstallConsent]";
      __int16 v8 = 2112;
      uint64_t v9 = v3;
      _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s cellularPlanRequiringConsent:%@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

BOOL __68__NPHCellularBridgeUIManager_cellularPlanRequiringPreInstallConsent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [v2 plan];
    int v8 = 136315394;
    uint64_t v9 = "-[NPHCellularBridgeUIManager cellularPlanRequiringPreInstallConsent]_block_invoke";
    __int16 v10 = 1024;
    int v11 = [v4 status];
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s planItem.status:%d", (uint8_t *)&v8, 0x12u);
  }
  uint64_t v5 = [v2 plan];
  BOOL v6 = [v5 status] == 12;

  return v6;
}

- (BOOL)cellularPlanIsSetUp
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = self->_proxyPlanItems;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = nph_general_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = [v6 isSelected];
          *(_DWORD *)buf = 136315650;
          long long v15 = "-[NPHCellularBridgeUIManager cellularPlanIsSetUp]";
          __int16 v16 = 1024;
          int v17 = v8;
          __int16 v18 = 2112;
          long long v19 = v6;
          _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s planItem.isSelected:%d planItem:%@", buf, 0x1Cu);
        }

        if ([v6 isSelected])
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v20 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (BOOL)isAnyCellularPlanActivating
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = [(NPHCellularBridgeUIManager *)self cellularPlans];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v8 = nph_general_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 plan];
          int v10 = [v9 status];
          *(_DWORD *)buf = 136315650;
          uint64_t v23 = "-[NPHCellularBridgeUIManager isAnyCellularPlanActivating]";
          __int16 v24 = 1024;
          int v25 = v10;
          __int16 v26 = 2112;
          long long v27 = v7;
          _os_log_impl(&dword_235444000, v8, OS_LOG_TYPE_DEFAULT, "%s planItem.status:%d planItem:%@", buf, 0x1Cu);
        }
        long long v11 = [v7 plan];
        if ([v11 status] == 2) {
          goto LABEL_18;
        }
        long long v12 = [v7 plan];
        if ([v12 status] == 11) {
          goto LABEL_17;
        }
        long long v13 = [v7 plan];
        if ([v13 status] == 6)
        {

LABEL_17:
LABEL_18:

LABEL_19:
          BOOL v16 = 1;
          goto LABEL_20;
        }
        long long v14 = [v7 plan];
        int v15 = [v14 status];

        if (v15 == 7) {
          goto LABEL_19;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v28 count:16];
      BOOL v16 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_20:

  return v16;
}

- (int64_t)consentRequiredRelevantCellularPlanItem:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(NSArray *)self->_proxyPlanItems firstObjectPassingTest:&__block_literal_global_211];
  BOOL v6 = v5;
  if (v5
    && ([v5 plan],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 status],
        v7,
        v8 == 7))
  {
    uint64_t v9 = [(NSArray *)self->_proxyPlanItems firstObjectPassingTest:&__block_literal_global_213];
    int v10 = [(NSArray *)self->_proxyPlanItems firstObjectPassingTest:&__block_literal_global_215];
    int64_t v11 = [MEMORY[0x263F31978] calculateInstallConsentTextTypeFor:self->_proxyPlanItems];
    id v12 = 0;
    long long v13 = v6;
    switch(v11)
    {
      case 1:
      case 2:
      case 3:
      case 7:
        goto LABEL_4;
      case 4:
        long long v13 = v10;
        goto LABEL_4;
      case 5:
        long long v13 = v9;
LABEL_4:
        id v12 = v13;
        break;
      default:
        break;
    }
    if (a3) {
      *a3 = v12;
    }
  }
  else
  {
    int64_t v11 = 0;
  }
  long long v14 = nph_general_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    int v17 = "-[NPHCellularBridgeUIManager consentRequiredRelevantCellularPlanItem:]";
    __int16 v18 = 2048;
    int64_t v19 = v11;
    _os_log_impl(&dword_235444000, v14, OS_LOG_TYPE_DEFAULT, "%s - consentRequiredType:%ld", (uint8_t *)&v16, 0x16u);
  }

  return v11;
}

uint64_t __70__NPHCellularBridgeUIManager_consentRequiredRelevantCellularPlanItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

uint64_t __70__NPHCellularBridgeUIManager_consentRequiredRelevantCellularPlanItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 plan];
  uint64_t v3 = [v2 isDeleteNotAllowed];

  return v3;
}

uint64_t __70__NPHCellularBridgeUIManager_consentRequiredRelevantCellularPlanItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 plan];
  uint64_t v3 = [v2 isDisableNotAllowed];

  return v3;
}

- (void)_ctCellularPlanInfoDidChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    BOOL v6 = "-[NPHCellularBridgeUIManager _ctCellularPlanInfoDidChange:]";
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(NPHCellularBridgeUIManager *)self updateCellularPlansWithFetch:0];
}

- (void)_ctCellularRemoteProvisioningDidBecomeAvailable:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    BOOL v6 = "-[NPHCellularBridgeUIManager _ctCellularRemoteProvisioningDidBecomeAvailable:]";
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(NPHCellularBridgeUIManager *)self updateCellularPlansWithFetch:1];
}

- (void)_nrPairedWatchDidBecomeActive
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[NPHCellularBridgeUIManager _nrPairedWatchDidBecomeActive]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(NPHCellularBridgeUIManager *)self fetchTinkerFamilyMember];
  [(NPHCellularBridgeUIManager *)self updateCellularPlansWithFetch:1];
}

- (void)startRemoteProvisioning
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [(NPHCellularBridgeUIManager *)self _activeDeviceCSNList];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        int v8 = [MEMORY[0x263F31978] sharedManager];
        [v8 startRemoteProvisioningForCSN:v7 completion:&__block_literal_global_217];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __53__NPHCellularBridgeUIManager_startRemoteProvisioning__block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[NPHCellularBridgeUIManager startRemoteProvisioning]_block_invoke";
    __int16 v6 = 1024;
    int v7 = a2;
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s - startRemoteProvisioningWithCompletion success:%d", (uint8_t *)&v4, 0x12u);
  }
}

- (void)finishRemoteProvisioning
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [(NPHCellularBridgeUIManager *)self _activeDeviceCSNList];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = [MEMORY[0x263F31978] sharedManager];
        [v8 finishRemoteProvisioningForCSN:v7 completion:&__block_literal_global_219];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __54__NPHCellularBridgeUIManager_finishRemoteProvisioning__block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[NPHCellularBridgeUIManager finishRemoteProvisioning]_block_invoke";
    __int16 v6 = 1024;
    int v7 = a2;
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s - finishRemoteProvisioningWithCompletion success:%d", (uint8_t *)&v4, 0x12u);
  }
}

- (id)subscriptionContextForCellularPlanItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(CTXPCServiceSubscriptionInfo *)self->_serviceSubscriptionInfo subscriptions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v4 companionSlotUuid];
        long long v11 = [v9 uuid];
        int v12 = [v10 isEqual:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)displayNameForCellularPlan:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NPHCellularBridgeUIManager *)self isGeminiSetup])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [(NPHCellularBridgeUIManager *)self serviceSubscriptionsInUse];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v11 = [v4 companionSlotUuid];
          int v12 = [v10 uuid];
          int v13 = [v11 isEqual:v12];

          if (v13)
          {
            long long v14 = [(NPHCellularBridgeUIManager *)self simLabelForSubscription:v10];
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    long long v14 = 0;
LABEL_13:
  }
  else
  {
    long long v14 = 0;
  }
  if (![v14 length])
  {
    long long v15 = [v4 plan];
    uint64_t v16 = [v15 carrierName];

    long long v14 = (void *)v16;
  }

  return v14;
}

- (id)carrierNameForSubscription:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F02C20];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithBundleType:1];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v12 = 0;
  uint64_t v8 = (void *)[(CoreTelephonyClient *)coreTelephonyClient copyCarrierBundleValue:v5 key:@"CarrierName" bundleType:v6 error:&v12];

  id v9 = v12;
  if (v9)
  {
    long long v10 = nph_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager carrierNameForSubscription:]();
    }
  }
  return v8;
}

- (id)carrierPhoneNumberForSubscription:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F02C20];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithBundleType:1];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v14 = 0;
  uint64_t v8 = (void *)[(CoreTelephonyClient *)coreTelephonyClient copyCarrierBundleValue:v5 key:@"WatchCustomerServicePhoneNumber" bundleType:v6 error:&v14];

  id v9 = v14;
  long long v10 = nph_general_log();
  long long v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager carrierPhoneNumberForSubscription:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[NPHCellularBridgeUIManager carrierPhoneNumberForSubscription:]";
      __int16 v17 = 2112;
      long long v18 = v8;
      _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
    }

    long long v11 = TUHomeCountryCode();
    uint64_t v12 = TUFormattedPhoneNumber();

    uint64_t v8 = (void *)v12;
  }

  return v8;
}

- (id)formattedPhoneNumberForSubscription:(id)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  id v10 = 0;
  id v4 = [(CoreTelephonyClient *)coreTelephonyClient getPhoneNumber:a3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = nph_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager formattedPhoneNumberForSubscription:]();
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = [v4 number];
    uint64_t v8 = TUHomeCountryCode();
    uint64_t v7 = TUFormattedPhoneNumber();
  }
  return v7;
}

- (id)lteOverrideForSubscription:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F02C20];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithBundleType:1];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v12 = 0;
  uint64_t v8 = (__CFString *)[(CoreTelephonyClient *)coreTelephonyClient copyCarrierBundleValueWithDefault:v5 key:@"DataIndicatorOverrideForLTE" bundleType:v6 error:&v12];

  id v9 = v12;
  if (v9)
  {
    id v10 = nph_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NPHCellularBridgeUIManager lteOverrideForSubscription:]();
    }
  }
  if (![(__CFString *)v8 length])
  {

    uint64_t v8 = @"LTE";
  }

  return v8;
}

- (id)simLabelForSubscription:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v9 = 0;
  id v4 = [(CoreTelephonyClient *)coreTelephonyClient getSimLabel:a3 error:&v9];
  id v5 = v9;
  uint64_t v6 = [v4 text];

  uint64_t v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v11 = "-[NPHCellularBridgeUIManager simLabelForSubscription:]";
    __int16 v12 = 2112;
    int v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s - Label: %@ Error: %@", buf, 0x20u);
  }

  return v6;
}

- (NSString)trialPlanType
{
  uint64_t v3 = [(NPHCellularBridgeUIManager *)self serviceSubscriptionsInUse];
  id v4 = [v3 firstObject];
  id v5 = [(NPHCellularBridgeUIManager *)self _trialPlanTypeForContext:v4];

  return (NSString *)v5;
}

- (id)_trialPlanTypeForContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[NPHCellularBridgeUIManager _trialPlanTypeForContext:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s - subscriptionContext: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v6 = [(NPHCellularBridgeUIManager *)self _serviceSubscriptionInfoForSubscriptionContext:v4];
  uint64_t v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[NPHCellularBridgeUIManager _trialPlanTypeForContext:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s - serviceSubscriptionInfo: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = [v6 trialPlanType];
  id v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[NPHCellularBridgeUIManager _trialPlanTypeForContext:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_235444000, v9, OS_LOG_TYPE_DEFAULT, "%s - trialPlanType: %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (int64_t)_minMajorWatchOSVersionForSubscription:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F02C20];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithBundleType:1];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v17 = 0;
  uint64_t v8 = (void *)[(CoreTelephonyClient *)coreTelephonyClient copyCarrierBundleValueWithDefault:v5 key:@"RemoteCardProvisioningSettings" bundleType:v6 error:&v17];

  id v9 = v17;
  NSLog(&stru_26E895BE8.isa, v8);
  id v10 = [v8 objectForKeyedSubscript:@"MinCompatibleWatchOS"];
  int v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[NPHCellularBridgeUIManager _minMajorWatchOSVersionForSubscription:]";
    __int16 v20 = 2112;
    long long v21 = v10;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_INFO, "%s - copyCarrierBundleValue for minWatchOSVersion:%@ error:%@", buf, 0x20u);
  }

  if ([v10 length])
  {
    __int16 v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"."];
    __int16 v13 = [v10 componentsSeparatedByCharactersInSet:v12];

    id v14 = [v13 objectAtIndexedSubscript:0];
    int64_t v15 = [v14 integerValue];
  }
  else
  {
    int64_t v15 = -1;
  }

  return v15;
}

- (BOOL)shouldAllowUserToAddOrSetUpPlan
{
  id v2 = [(NPHCellularBridgeUIManager *)self serviceSubscriptionsToOfferUser];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_isSetupBlockingError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:NPHCellularErrorDomain];

  if (!v5)
  {
    uint64_t v8 = [v3 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x263F31920]];

    if (!v9)
    {
      BOOL v7 = 0;
      goto LABEL_11;
    }
    if ([v3 code] != 21 && objc_msgSend(v3, "code") != 27 && objc_msgSend(v3, "code") != 14)
    {
      uint64_t v6 = 32;
      goto LABEL_4;
    }
LABEL_9:
    BOOL v7 = 1;
    goto LABEL_11;
  }
  if ([v3 code] == 3) {
    goto LABEL_9;
  }
  uint64_t v6 = 2;
LABEL_4:
  BOOL v7 = [v3 code] == v6;
LABEL_11:

  return v7;
}

- (id)cellularUseErrors
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  if ([(NPHCellularBridgeUIManager *)self allCompanionSIMsMissing]
    && ![(NPHCellularBridgeUIManager *)self cellularPlanIsSetUp])
  {
    uint64_t v16 = [MEMORY[0x263F087E8] NPHCellularErrorWithCode:2 forSubscriptionContext:0];
    [v3 addObject:v16];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
          id v10 = [v9 persistentError];
          if (v10)
          {
            [v3 addObject:v10];
          }
          else
          {
            proxyPlanItems = self->_proxyPlanItems;
            if (proxyPlanItems
              && ![(NSArray *)proxyPlanItems count]
              && [(NPHCellularBridgeUIManager *)self _isCarrierSetupFlowUnsupportedForServiceSubscription:v9])
            {
              __int16 v12 = (void *)MEMORY[0x263F087E8];
              __int16 v13 = [v9 serviceSubscriptionContext];
              id v14 = [v12 NPHCellularErrorWithCode:3 forSubscriptionContext:v13];
              [v3 addObject:v14];
            }
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v15 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v6 = v15;
      }
      while (v15);
    }
  }
  id v17 = (void *)[v3 copy];

  return v17;
}

- (BOOL)_isPersistentError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F31920]]) {
    BOOL v5 = [v3 code] == 14
  }
      || [v3 code] == 20
      || [v3 code] == 27
      || [v3 code] == 21
      || [v3 code] == 32
      || [v3 code] == 22;
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)allCompanionSIMsMissing
{
  id v2 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
  char v3 = [v2 hasObjectPassingTest:&__block_literal_global_250];

  return v3 ^ 1;
}

uint64_t __53__NPHCellularBridgeUIManager_allCompanionSIMsMissing__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 SIMStatus];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    BOOL v5 = [v2 SIMStatus];
    uint64_t v6 = [v5 isEqualToString:*MEMORY[0x263F03078]] ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (BOOL)_isCarrierSetupFlowUnsupportedForServiceSubscription:(id)a3
{
  int64_t outstandingPlanFlowsIdentified = self->_outstandingPlanFlowsIdentified;
  id v4 = a3;
  uint64_t v5 = outstandingPlanFlowsIdentified | [v4 planFlows];
  uint64_t v6 = [v4 SIMStatus];

  char v7 = [v6 isEqualToString:*MEMORY[0x263F030B8]];
  if (v5) {
    return 0;
  }
  else {
    return v7;
  }
}

- (BOOL)isCarrierSetupFlowUnsupported
{
  char v3 = [(NSMutableDictionary *)self->_serviceSubscriptionInfoList allValues];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__NPHCellularBridgeUIManager_isCarrierSetupFlowUnsupported__block_invoke;
  v6[3] = &unk_264C53C00;
  v6[4] = self;
  id v4 = [v3 firstObjectPassingTest:v6];

  return v4 == 0;
}

uint64_t __59__NPHCellularBridgeUIManager_isCarrierSetupFlowUnsupported__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isCarrierSetupFlowUnsupportedForServiceSubscription:a2] ^ 1;
}

+ (void)_presentErrorTitled:(id)a3 withMessage:(id)a4 onViewController:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    id v17 = "+[NPHCellularBridgeUIManager _presentErrorTitled:withMessage:onViewController:]";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_235444000, v10, OS_LOG_TYPE_DEFAULT, "%s - title: %@  message: %@", (uint8_t *)&v16, 0x20u);
  }

  int v11 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  [v11 setModalPresentationStyle:2];
  __int16 v12 = (void *)MEMORY[0x263F1C3F0];
  __int16 v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"ERROR_OK" value:&stru_26E895688 table:0];
  uint64_t v15 = [v12 actionWithTitle:v14 style:0 handler:0];

  [v11 addAction:v15];
  [v9 presentViewController:v11 animated:1 completion:0];
}

+ (void)presentCellularError:(id)a3 onViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[NPHCellularBridgeUIManager presentCellularError:onViewController:]();
  }

  id v9 = [v6 domain];
  uint64_t v10 = *MEMORY[0x263F31920];
  if ([v9 isEqualToString:*MEMORY[0x263F31920]])
  {
    uint64_t v11 = [v6 code];

    if (v11 == 16)
    {
      __int16 v12 = [v6 description];
      BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();

      goto LABEL_23;
    }
  }
  else
  {
  }
  __int16 v13 = [v6 domain];
  if ([v13 isEqualToString:v10])
  {
    uint64_t v14 = [v6 code];

    if (v14 == 28)
    {
      [a1 _presentAirplaneModeOnAlertOnViewController:v7];
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v15 = [v6 domain];
  if ([v15 isEqualToString:v10])
  {
    uint64_t v16 = [v6 code];

    if (v16 == 29)
    {
      [a1 _presentCellularRequiredModeAlertOnViewController:v7];
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v17 = [v6 domain];
  if ([v17 isEqualToString:@"NPHCellularDataUsageErrorDomain"])
  {
    uint64_t v18 = [v6 code];

    if (v18 == 35)
    {
      id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      __int16 v20 = [v19 localizedStringForKey:@"ERROR_TRY_AGAIN_TITLE" value:&stru_26E895688 table:0];
      id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v22 = [v21 localizedStringForKey:@"ERROR_TRY_AGAIN_MESSAGE" value:&stru_26E895688 table:0];
      [a1 _presentErrorTitled:v20 withMessage:v22 onViewController:v7];

      goto LABEL_23;
    }
  }
  else
  {
  }
  id v23 = [v6 userInfo];
  uint64_t v24 = [v23 objectForKeyedSubscript:NPHCellularErrorTitleKey];
  int v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    long long v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v26 = [v27 localizedStringForKey:@"ERROR_GENERIC_TITLE" value:&stru_26E895688 table:0];
  }
  long long v28 = [v6 userInfo];
  uint64_t v29 = [v28 objectForKeyedSubscript:*MEMORY[0x263F08320]];

  [a1 _presentErrorTitled:v26 withMessage:v29 onViewController:v7];
LABEL_23:
}

+ (void)_presentAirplaneModeOnAlertOnViewController:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "+[NPHCellularBridgeUIManager _presentAirplaneModeOnAlertOnViewController:]";
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v7 = [v6 localizedStringForKey:@"AIRPLANE_MODE_ERROR_TITLE" value:&stru_26E895688 table:0];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v9 = [v8 localizedStringForKey:@"AIRPLANE_MODE_TURN_OFF_ACTION" value:&stru_26E895688 table:0];
  [a1 _presentErrorTitle:v7 onViewController:v4 withActionTitle:v9 actionHandler:&__block_literal_global_270];
}

void __74__NPHCellularBridgeUIManager__presentAirplaneModeOnAlertOnViewController___block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = nph_general_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    char v3 = "+[NPHCellularBridgeUIManager _presentAirplaneModeOnAlertOnViewController:]_block_invoke";
    _os_log_impl(&dword_235444000, v0, OS_LOG_TYPE_DEFAULT, "%s - turning off airplane mode", (uint8_t *)&v2, 0xCu);
  }

  id v1 = objc_alloc_init(MEMORY[0x263F255D8]);
  [v1 setAirplaneMode:0];
}

+ (void)_presentCellularRequiredModeAlertOnViewController:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "+[NPHCellularBridgeUIManager _presentCellularRequiredModeAlertOnViewController:]";
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v7 = [v6 localizedStringForKey:@"CELLULAR_DATA_ERROR_TITLE" value:&stru_26E895688 table:0];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v9 = [v8 localizedStringForKey:@"CELLULAR_DATA_TURN_ON_ACTION" value:&stru_26E895688 table:0];
  [a1 _presentErrorTitle:v7 onViewController:v4 withActionTitle:v9 actionHandler:&__block_literal_global_279];
}

uint64_t __80__NPHCellularBridgeUIManager__presentCellularRequiredModeAlertOnViewController___block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = nph_general_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    char v3 = "+[NPHCellularBridgeUIManager _presentCellularRequiredModeAlertOnViewController:]_block_invoke";
    _os_log_impl(&dword_235444000, v0, OS_LOG_TYPE_DEFAULT, "%s - turning on cellular data", (uint8_t *)&v2, 0xCu);
  }

  CTSUServerConnectionRef();
  return _CTServerConnectionSetCellularDataIsEnabled();
}

+ (void)_presentErrorTitle:(id)a3 onViewController:(id)a4 withActionTitle:(id)a5 actionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = nph_general_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[NPHCellularBridgeUIManager _presentErrorTitle:onViewController:withActionTitle:actionHandler:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

  uint64_t v22 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v13 message:0 preferredStyle:1];

  [v22 setModalPresentationStyle:2];
  id v23 = [MEMORY[0x263F1C3F0] actionWithTitle:v11 style:0 handler:v10];

  [v22 addAction:v23];
  uint64_t v24 = (void *)MEMORY[0x263F1C3F0];
  int v25 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v26 = [v25 localizedStringForKey:@"CELLULAR_ERROR_CLOSE_ACTION" value:&stru_26E895688 table:0];
  long long v27 = [v24 actionWithTitle:v26 style:1 handler:0];

  [v22 addAction:v27];
  [v12 presentViewController:v22 animated:1 completion:0];
}

- (void)_promptForUserConsentForCarrierWebsiteIfNecessary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPHCellularBridgeUIManager *)self _serviceSubscriptionInfoForSubscriptionContext:v6];
  if (([v8 planFlows] & 0x40) != 0
    && +[NPHSharedUtilities isActiveDeviceTinker])
  {
    id v9 = NSString;
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"WEB_CONSENT_TITLE" value:&stru_26E895688 table:0];
    id v12 = [(NPHCellularBridgeUIManager *)self carrierNameForSubscription:v6];
    id v26 = objc_msgSend(v9, "stringWithFormat:", v11, v12);

    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v25 = [v13 localizedStringForKey:@"WEB_CONSENT_MESSAGE" value:&stru_26E895688 table:0];

    uint64_t v14 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v26 message:v25 preferredStyle:1];
    uint64_t v15 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"WEB_CONSENT_CONTINUE" value:&stru_26E895688 table:0];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __95__NPHCellularBridgeUIManager__promptForUserConsentForCarrierWebsiteIfNecessary_withCompletion___block_invoke;
    v31[3] = &unk_264C53A48;
    id v18 = v7;
    id v32 = v18;
    uint64_t v19 = [v15 actionWithTitle:v17 style:0 handler:v31];

    [v14 addAction:v19];
    uint64_t v20 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v22 = [v21 localizedStringForKey:@"WEB_CONSENT_CANCEL" value:&stru_26E895688 table:0];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __95__NPHCellularBridgeUIManager__promptForUserConsentForCarrierWebsiteIfNecessary_withCompletion___block_invoke_2;
    v29[3] = &unk_264C53A48;
    id v30 = v18;
    id v23 = [v20 actionWithTitle:v22 style:1 handler:v29];

    [v14 addAction:v23];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __95__NPHCellularBridgeUIManager__promptForUserConsentForCarrierWebsiteIfNecessary_withCompletion___block_invoke_3;
    v27[3] = &unk_264C53710;
    v27[4] = self;
    id v28 = v14;
    id v24 = v14;
    nph_ensure_on_main_queue(v27);
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

uint64_t __95__NPHCellularBridgeUIManager__promptForUserConsentForCarrierWebsiteIfNecessary_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__NPHCellularBridgeUIManager__promptForUserConsentForCarrierWebsiteIfNecessary_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__NPHCellularBridgeUIManager__promptForUserConsentForCarrierWebsiteIfNecessary_withCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (BOOL)LTEMayImpactService
{
  return self->LTEMayImpactService;
}

- (BOOL)shouldOfferSignupCompletion
{
  return self->_shouldOfferSignupCompletion;
}

- (CTRemotePlan)transferableRemotePlan
{
  return self->_transferableRemotePlan;
}

- (NSString)tinkerFamilyMemberFirstName
{
  return self->_tinkerFamilyMemberFirstName;
}

- (void)setTinkerFamilyMemberFirstName:(id)a3
{
}

- (CTDeviceIdentifier)transferableRemoteDeviceID
{
  return self->_transferableRemoteDeviceID;
}

- (TSSIMSetupFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (UIViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (id)hostCompletionBlock
{
  return self->_hostCompletionBlock;
}

- (void)setHostCompletionBlock:(id)a3
{
  self->_hostCompletionBlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_transferableRemoteDeviceID, 0);
  objc_storeStrong((id *)&self->_tinkerFamilyMemberFirstName, 0);
  objc_storeStrong((id *)&self->_transferableRemotePlan, 0);
  objc_storeStrong((id *)&self->_outstandingRemotePlanItemsRequestedForCSN, 0);
  objc_storeStrong((id *)&self->_proxyPlanItems, 0);
  objc_storeStrong((id *)&self->_serviceSubscriptionInfoList, 0);
  objc_storeStrong((id *)&self->_serviceSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

void __72__NPHCellularBridgeUIManager__updateSIMStatusForAllSubscriptionContexts__block_invoke_104_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateSIMStatusForSubscriptionContext:(uint64_t)a3 withStatus:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__NPHCellularBridgeUIManager__updateCoreTelephonyClientInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - error:%@", v2, v3, v4, v5, 2u);
}

void __72__NPHCellularBridgeUIManager_installPendingCellularPlan_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s: installPendingRemotePlan Error: %@", v2, v3, v4, v5, 2u);
}

- (void)_updateTransferableCellularPlanFromDeviceWithCSN:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[NPHCellularBridgeUIManager _updateTransferableCellularPlanFromDeviceWithCSN:]";
  _os_log_error_impl(&dword_235444000, log, OS_LOG_TYPE_ERROR, "%s - count of transferable plan is more than 1", buf, 0xCu);
}

- (void)_updateTransferableCellularPlanFromDeviceWithCSN:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - error:%@", v2, v3, v4, v5, 2u);
}

- (void)_updateTransferableCellularPlanFromDeviceWithCSN:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setUpCellularPlanOnViewController:(uint64_t)a3 withContext:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transferCellularPlanOnViewController:(void *)a1 withCompletion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 transferableRemotePlan];
  uint64_t v5 = [a1 transferableRemoteDeviceID];
  int v6 = 136315650;
  id v7 = "-[NPHCellularBridgeUIManager transferCellularPlanOnViewController:withCompletion:]";
  __int16 v8 = 2112;
  id v9 = v4;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_error_impl(&dword_235444000, a2, OS_LOG_TYPE_ERROR, "%s - Unable to transfer: %@ %@", (uint8_t *)&v6, 0x20u);
}

void __82__NPHCellularBridgeUIManager_transferCellularPlanOnViewController_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - error:%@", v2, v3, v4, v5, 2u);
}

void __67__NPHCellularBridgeUIManager__updateCellularPlansWithFetch_forCSN___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - remotePlanItemsWithCompletion:%@", v2, v3, v4, v5, 2u);
}

void __63__NPHCellularBridgeUIManager__updateShouldShowAddNewRemotePlan__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__NPHCellularBridgeUIManager__updateIsRemotePlanCapable__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)carrierNameForSubscription:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - error from copyCarrierBundleValue for CarrierName error:%@", v2, v3, v4, v5, 2u);
}

- (void)carrierPhoneNumberForSubscription:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - error from copyCarrierBundleValue for carrierPhoneNumber error:%@", v2, v3, v4, v5, 2u);
}

- (void)formattedPhoneNumberForSubscription:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - error: %@", v2, v3, v4, v5, 2u);
}

- (void)lteOverrideForSubscription:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_235444000, v0, v1, "%s - error from copyCarrierBundleValue for lteOverride error:%@", v2, v3, v4, v5, 2u);
}

+ (void)presentCellularError:onViewController:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_235444000, v0, v1, "%s - error: %@  hostViewController: %@", v2);
}

+ (void)_presentErrorTitle:(uint64_t)a3 onViewController:(uint64_t)a4 withActionTitle:(uint64_t)a5 actionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end