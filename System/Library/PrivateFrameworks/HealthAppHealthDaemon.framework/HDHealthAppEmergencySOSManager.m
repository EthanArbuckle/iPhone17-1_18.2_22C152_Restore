@interface HDHealthAppEmergencySOSManager
- (FLFollowUpController)followUpController;
- (HDHealthAppEmergencySOSManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (HKCoreTelephonySatelliteClient)satelliteStatusClient;
- (OS_dispatch_queue)queue;
- (id)actionIdentifierForOnboardingStatus:(id)a3;
- (id)followUpItemDescription;
- (id)getEmergencyOnboardingStatus;
- (id)makeFollowUpItemWithActionIdentifier:(id)a3;
- (void)clearPendingFollowUpItems;
- (void)getEmergencyOnboardingStatus;
- (void)profileDidBecomeReady:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setProfile:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSatelliteStatusClient:(id)a3;
- (void)submitFollowUpItem:(id)a3;
- (void)submitSatelliteFollowUpItemIfNeeded;
@end

@implementation HDHealthAppEmergencySOSManager

- (HDHealthAppEmergencySOSManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHealthAppEmergencySOSManager;
  v5 = [(HDHealthAppEmergencySOSManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x263F35380]);
    uint64_t v10 = [v9 initWithClientIdentifier:*MEMORY[0x263F0ACA8]];
    followUpController = v6->_followUpController;
    v6->_followUpController = (FLFollowUpController *)v10;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:v6->_queue];
  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = (HKCoreTelephonySatelliteClient *)[objc_alloc(MEMORY[0x263F0A260]) initWithDelegate:self queue:self->_queue];
  satelliteStatusClient = self->_satelliteStatusClient;
  self->_satelliteStatusClient = v4;

  [(HDHealthAppEmergencySOSManager *)self submitSatelliteFollowUpItemIfNeeded];
}

- (void)submitSatelliteFollowUpItemIfNeeded
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(HKCoreTelephonySatelliteClient *)self->_satelliteStatusClient isSatelliteSupportedForEmergencyDemo])
  {
    v3 = [(HDHealthAppEmergencySOSManager *)self getEmergencyOnboardingStatus];
    _HKInitializeLogging();
    id v4 = (os_log_t *)MEMORY[0x263F09968];
    v5 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      *(_DWORD *)buf = 138412546;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2112;
      v22 = v3;
      id v7 = v20;
      _os_log_impl(&dword_250D3F000, v6, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Fetched emergency onboarding status: %@", buf, 0x16u);
    }
    if (v3)
    {
      if ([v3 intValue] == 3)
      {
        _HKInitializeLogging();
        os_log_t v8 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = v8;
          uint64_t v10 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v20 = v10;
          id v11 = v10;
          _os_log_impl(&dword_250D3F000, v9, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] We received a status that onboarding was completed with satellite, so we want to clear the follow up item.", buf, 0xCu);
        }
        [(HDHealthAppEmergencySOSManager *)self clearPendingFollowUpItems];
      }
      else
      {
        v16 = [(HDHealthAppEmergencySOSManager *)self followUpController];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __69__HDHealthAppEmergencySOSManager_submitSatelliteFollowUpItemIfNeeded__block_invoke;
        v17[3] = &unk_265358DE0;
        v17[4] = self;
        id v18 = v3;
        [v16 pendingFollowUpItemsWithCompletion:v17];
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v12 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        objc_super v14 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v20 = v14;
        id v15 = v14;
        _os_log_impl(&dword_250D3F000, v13, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] We have a nil emergency onboaridng status, so we do nothing here.", buf, 0xCu);
      }
    }
  }
  else
  {
    [(HDHealthAppEmergencySOSManager *)self clearPendingFollowUpItems];
  }
}

void __69__HDHealthAppEmergencySOSManager_submitSatelliteFollowUpItemIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    [*(id *)(a1 + 32) actionIdentifierForOnboardingStatus:*(void *)(a1 + 40)];
    v27 = uint64_t v26 = a1;
    objc_msgSend(*(id *)(a1 + 32), "makeFollowUpItemWithActionIdentifier:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v28 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      uint64_t v14 = *MEMORY[0x263F0ACC0];
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v17 = [v16 uniqueIdentifier];
          if ([v17 isEqualToString:v14])
          {
            id v18 = [v16 informativeText];
            v19 = [v9 informativeText];
            int v20 = [v18 isEqualToString:v19];

            if (v20)
            {
              _HKInitializeLogging();
              __int16 v21 = (void *)*MEMORY[0x263F09968];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v23 = v21;
                v24 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                id v35 = v24;
                id v25 = v24;
                _os_log_impl(&dword_250D3F000, v23, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Found a pending satellite item that was previously submitted. We do not need to submit the item.", buf, 0xCu);
              }
              goto LABEL_19;
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [*(id *)(v26 + 32) submitFollowUpItem:v9];
LABEL_19:
    id v6 = 0;
    id v5 = v28;
    os_log_t v8 = v27;
    goto LABEL_20;
  }
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v8 = v7;
    *(_DWORD *)buf = 138412546;
    id v35 = (id)objc_opt_class();
    __int16 v36 = 2112;
    id v37 = v6;
    id v9 = v35;
    _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Error when fetching pending items: %@", buf, 0x16u);
LABEL_20:
  }
}

- (id)actionIdentifierForOnboardingStatus:(id)a3
{
  int v3 = [a3 intValue];
  id v4 = (void **)MEMORY[0x263F0ACB0];
  if (v3 == 1) {
    id v4 = (void **)MEMORY[0x263F0ACB8];
  }
  id v5 = *v4;
  return v5;
}

- (id)makeFollowUpItemWithActionIdentifier:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35388]);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263F0ACC0];
    [v5 setUniqueIdentifier:*MEMORY[0x263F0ACC0]];
    [v6 setActions:0];
    os_log_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"STEWIE_FOLLOW_UP_ITEM_TITLE" value:&stru_2701DEAF8 table:@"Localizable"];
    [v6 setTitle:v9];

    id v10 = [(HDHealthAppEmergencySOSManager *)self followUpItemDescription];
    [v6 setInformativeText:v10];

    [v6 setExtensionIdentifier:*MEMORY[0x263F0ACA8]];
    [v6 setGroupIdentifier:*MEMORY[0x263F352C8]];
    [v6 setCategoryIdentifier:v7];
    [v6 setDisplayStyle:0];
    uint64_t v29 = *MEMORY[0x263F35348];
    v30[0] = MEMORY[0x263EFFA88];
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    [v6 setUserInfo:v11];

    id v12 = objc_alloc_init(MEMORY[0x263EFF910]);
    uint64_t v13 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v14 = objc_msgSend(v13, "hk_dateByAddingDays:toDate:", 30, v12);
    [v6 setExpirationDate:v14];

    id v15 = objc_alloc_init(MEMORY[0x263F35378]);
    v16 = v15;
    if (v15)
    {
      [v15 setIdentifier:v4];
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v18 = [v17 localizedStringForKey:@"STEWIE_FOLLOW_UP_ITEM_BUTTON" value:&stru_2701DEAF8 table:@"Localizable"];
      [v16 setLabel:v18];

      id v28 = v16;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
      [v6 setActions:v19];
    }
  }
  _HKInitializeLogging();
  int v20 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = v20;
    int v24 = 138412546;
    id v25 = (id)objc_opt_class();
    __int16 v26 = 2112;
    uint64_t v27 = v6;
    id v22 = v25;
    _os_log_impl(&dword_250D3F000, v21, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Created follow-up item: %@", (uint8_t *)&v24, 0x16u);
  }
  return v6;
}

- (id)followUpItemDescription
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v3 = [WeakRetained medicalIDDataManager];

  id v15 = 0;
  uint64_t v4 = [v3 medicalIDSetupStatusWithError:&v15];
  id v5 = v15;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      os_log_t v8 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      __int16 v18 = 2112;
      id v19 = v5;
      id v9 = v8;
      _os_log_impl(&dword_250D3F000, v7, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Could not fetch user's Medical ID status: %@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    id v12 = @"STEWIE_FOLLOW_UP_ITEM_REVIEW_DESCRIPTION";
  }
  else
  {
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    if (v4 == 2) {
      id v12 = @"STEWIE_FOLLOW_UP_ITEM_REVIEW_DESCRIPTION";
    }
    else {
      id v12 = @"STEWIE_FOLLOW_UP_ITEM_SET_UP_DESCRIPTION";
    }
  }
  uint64_t v13 = [v10 localizedStringForKey:v12 value:&stru_2701DEAF8 table:@"Localizable"];

  return v13;
}

- (void)submitFollowUpItem:(id)a3
{
  followUpController = self->_followUpController;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HDHealthAppEmergencySOSManager_submitFollowUpItem___block_invoke;
  v4[3] = &unk_265358E08;
  v4[4] = self;
  [(FLFollowUpController *)followUpController postFollowUpItem:a3 completion:v4];
}

void __53__HDHealthAppEmergencySOSManager_submitFollowUpItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09928], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v8 = 138412802;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v9;
    _os_log_impl(&dword_250D3F000, v6, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Posted follow-up item with success %d and error %@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)clearPendingFollowUpItems
{
  followUpController = self->_followUpController;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__HDHealthAppEmergencySOSManager_clearPendingFollowUpItems__block_invoke;
  v3[3] = &unk_265358E08;
  v3[4] = self;
  [(FLFollowUpController *)followUpController clearPendingFollowUpItemsWithCompletion:v3];
}

void __59__HDHealthAppEmergencySOSManager_clearPendingFollowUpItems__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09928], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v8 = 138412802;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v4;
    id v7 = v9;
    _os_log_impl(&dword_250D3F000, v6, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Cleared follow-up items with success %d and error %@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (id)getEmergencyOnboardingStatus
{
  id v3 = objc_alloc(MEMORY[0x263F43218]);
  uint64_t v4 = *MEMORY[0x263F0ACA0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = (void *)[v3 initWithCategory:102 domainName:v4 profile:WeakRetained];

  uint64_t v7 = *MEMORY[0x263F0ACC8];
  id v14 = 0;
  int v8 = [v6 numberForKey:v7 error:&v14];
  id v9 = v14;
  if (v9)
  {
    _HKInitializeLogging();
    __int16 v10 = (void *)*MEMORY[0x263F09928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09928], OS_LOG_TYPE_ERROR)) {
      [(HDHealthAppEmergencySOSManager *)v10 getEmergencyOnboardingStatus];
    }
    int v11 = 0;
  }
  else
  {
    if (v8)
    {
      id v12 = v8;
    }
    else
    {
      id v12 = [NSNumber numberWithInt:0];
    }
    int v11 = v12;
  }

  return v11;
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (HKCoreTelephonySatelliteClient)satelliteStatusClient
{
  return self->_satelliteStatusClient;
}

- (void)setSatelliteStatusClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_satelliteStatusClient, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

- (void)getEmergencyOnboardingStatus
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_250D3F000, v4, OS_LOG_TYPE_ERROR, "[%@][FollowUp] Failed to get emergency onboarding status: %@", (uint8_t *)&v6, 0x16u);
}

@end