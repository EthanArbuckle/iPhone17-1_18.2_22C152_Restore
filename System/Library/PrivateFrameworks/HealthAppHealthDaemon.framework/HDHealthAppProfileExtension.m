@interface HDHealthAppProfileExtension
- (HDAnalyticsDailyEventManager)dailyAnalyticsManager;
- (HDAppAnalyticsUpdateManager)appAnalyticsUpdateManager;
- (HDHAHealthAppApplicationInstallationManager)appInstallationManager;
- (HDHealthAppDataObserver)dataObserver;
- (HDHealthAppEmergencySOSManager)emergencySOSManager;
- (HDHealthAppLabConceptObserver)labConceptObserver;
- (HDHealthAppProfileExtension)initWithProfile:(id)a3;
- (HDHealthAppSharingEntryObserver)sharingEntryObserver;
- (HDNotificationSyncClient)healthAppNewDeviceNotificationSyncClient;
- (HDNotificationSyncClient)healthSharingNotificationSyncClient;
- (HDProfile)profile;
- (id)unitTest_didProcessNotificationInstruction;
- (void)_handleDismissInstruction;
- (void)_handleHoldInstruction;
- (void)_handleSendInstruction;
- (void)_healthAppWasUninstalled:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setAppInstallationManager:(id)a3;
- (void)setDailyAnalyticsManager:(id)a3;
- (void)setDataObserver:(id)a3;
- (void)setEmergencySOSManager:(id)a3;
- (void)setHealthAppNewDeviceNotificationSyncClient:(id)a3;
- (void)setHealthSharingNotificationSyncClient:(id)a3;
- (void)setLabConceptObserver:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSharingEntryObserver:(id)a3;
- (void)setUnitTest_didProcessNotificationInstruction:(id)a3;
@end

@implementation HDHealthAppProfileExtension

- (HDHealthAppProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HDHealthAppProfileExtension;
  v5 = [(HDHealthAppProfileExtension *)&v52 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [HDHealthAppDataObserver alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v9 = [(HDHealthAppDataObserver *)v7 initWithProfile:WeakRetained];
    dataObserver = v6->_dataObserver;
    v6->_dataObserver = (HDHealthAppDataObserver *)v9;

    v11 = [HDHealthAppSharingEntryObserver alloc];
    id v12 = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v13 = [(HDHealthAppSharingEntryObserver *)v11 initWithProfile:v12];
    sharingEntryObserver = v6->_sharingEntryObserver;
    v6->_sharingEntryObserver = (HDHealthAppSharingEntryObserver *)v13;

    v15 = [HDHealthAppLabConceptObserver alloc];
    id v16 = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v17 = [(HDHealthAppLabConceptObserver *)v15 initWithProfile:v16];
    labConceptObserver = v6->_labConceptObserver;
    v6->_labConceptObserver = (HDHealthAppLabConceptObserver *)v17;

    v19 = [HDHAHealthAppApplicationInstallationManager alloc];
    id v20 = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v21 = [(HDHAHealthAppApplicationInstallationManager *)v19 initWithProfile:v20];
    appInstallationManager = v6->_appInstallationManager;
    v6->_appInstallationManager = (HDHAHealthAppApplicationInstallationManager *)v21;

    v23 = [HDHealthAppEmergencySOSManager alloc];
    id v24 = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v25 = [(HDHealthAppEmergencySOSManager *)v23 initWithProfile:v24];
    emergencySOSManager = v6->_emergencySOSManager;
    v6->_emergencySOSManager = (HDHealthAppEmergencySOSManager *)v25;

    _HKInitializeLogging();
    v27 = (objc_class *)MEMORY[0x263F0A0C0];
    id v28 = (id)*MEMORY[0x263F09968];
    id v29 = [v27 alloc];
    id v30 = objc_loadWeakRetained((id *)&v6->_profile);
    v31 = (void *)[v29 initWithLoggingCategory:v28 healthDataSource:v30];

    id v32 = objc_alloc(MEMORY[0x263F43158]);
    id v33 = objc_loadWeakRetained((id *)&v6->_profile);
    uint64_t v34 = [v32 initWithProfile:v33 eventSubmissionManager:v31 logCategory:v28 eventConstructor:&__block_literal_global];
    dailyAnalyticsManager = v6->_dailyAnalyticsManager;
    v6->_dailyAnalyticsManager = (HDAnalyticsDailyEventManager *)v34;

    id v36 = objc_alloc(MEMORY[0x263F432A0]);
    uint64_t v37 = *MEMORY[0x263F09890];
    v38 = HKCreateSerialDispatchQueue();
    uint64_t v39 = [v36 initWithProfile:v4 clientIdentifier:v37 queue:v38];
    healthSharingNotificationSyncClient = v6->_healthSharingNotificationSyncClient;
    v6->_healthSharingNotificationSyncClient = (HDNotificationSyncClient *)v39;

    [(HDNotificationSyncClient *)v6->_healthSharingNotificationSyncClient setDelegate:v6];
    id v41 = objc_alloc(MEMORY[0x263F432A0]);
    id v42 = objc_loadWeakRetained((id *)&v6->_profile);
    v43 = HKCreateSerialDispatchQueue();
    uint64_t v44 = [v41 initWithProfile:v42 clientIdentifier:@"NewDeviceSetup" queue:v43];
    healthAppNewDeviceNotificationSyncClient = v6->_healthAppNewDeviceNotificationSyncClient;
    v6->_healthAppNewDeviceNotificationSyncClient = (HDNotificationSyncClient *)v44;

    [(HDNotificationSyncClient *)v6->_healthAppNewDeviceNotificationSyncClient setDelegate:v6];
    v46 = [[HDAppAnalyticsUpdateManager alloc] initWithProfile:v4];
    appAnalyticsUpdateManager = v6->_appAnalyticsUpdateManager;
    v6->_appAnalyticsUpdateManager = v46;

    id v48 = objc_loadWeakRetained((id *)&v6->_profile);
    v49 = [v48 healthDaemon];
    [v49 registerDaemonReadyObserver:v6 queue:0];

    id v50 = objc_loadWeakRetained((id *)&v6->_profile);
    [v50 registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

HDHealthAppDailyAnalyticsEvent *__47__HDHealthAppProfileExtension_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDHealthAppDailyAnalyticsEvent alloc] initWithProfile:v2];

  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDHealthAppProfileExtension;
  [(HDHealthAppProfileExtension *)&v4 dealloc];
}

- (void)daemonReady:(id)a3
{
  _HKInitializeLogging();
  objc_super v4 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_250D3F000, v4, OS_LOG_TYPE_DEFAULT, "Health app profile extension reported daemon ready, starting observing for alert sample types", v6, 2u);
  }
  v5 = [(HDHealthAppProfileExtension *)self dataObserver];
  [v5 start];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_250D3F000, v5, OS_LOG_TYPE_DEFAULT, "Health app profile extension reported profile ready, starting observing for Health app install status, and pausing sharing if necessary", (uint8_t *)buf, 2u);
  }
  v6 = [MEMORY[0x263F01880] defaultWorkspace];
  [v6 addObserver:self];

  objc_initWeak(buf, self);
  objc_copyWeak(&v7, buf);
  MobileInstallationWaitForSystemAppMigrationWithCompletion();
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __53__HDHealthAppProfileExtension_profileDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __53__HDHealthAppProfileExtension_profileDidBecomeReady___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  else
  {
    v5 = [MEMORY[0x263F01880] defaultWorkspace];
    char v6 = [v5 applicationIsInstalled:*MEMORY[0x263F0AD08]];

    if ((v6 & 1) == 0)
    {
      _HKInitializeLogging();
      id v7 = (os_log_t *)MEMORY[0x263F09968];
      v8 = *MEMORY[0x263F09968];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "Health App is not installed on this device. Updating pause state for sharing entries.", buf, 2u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v10 = [WeakRetained profile];
      v11 = [v10 sharingEntryManager];
      id v15 = 0;
      char v12 = [v11 pauseActiveEntriesWithError:&v15];
      id v13 = v15;

      if ((v12 & 1) == 0)
      {
        _HKInitializeLogging();
        v14 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v17 = v13;
          _os_log_impl(&dword_250D3F000, v14, OS_LOG_TYPE_DEFAULT, "Failed to update pause state for sharing entries %{public}@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    v8 = (void *)*MEMORY[0x263F0AD08];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 bundleIdentifier];
        if (v11 == v8)
        {

LABEL_15:
          _HKInitializeLogging();
          id v15 = *MEMORY[0x263F09968];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl(&dword_250D3F000, v15, OS_LOG_TYPE_DEFAULT, "Health App has been uninstalled", v16, 2u);
          }
          [(HDHealthAppProfileExtension *)self _healthAppWasUninstalled:v10];
          goto LABEL_18;
        }
        char v12 = v11;
        if (v8)
        {
          id v13 = [v10 bundleIdentifier];
          int v14 = [v13 isEqualToString:v8];

          if (v14) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)_healthAppWasUninstalled:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263F0A980], "resetBuddy", a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v5 = [WeakRetained sharingEntryManager];
  id v9 = 0;
  char v6 = [v5 pauseActiveEntriesWithError:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v7;
      _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "Failed to update pause state for sharing entries %{public}@", buf, 0xCu);
    }
  }
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  char v6 = (void *)*MEMORY[0x263F09948];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09948], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v8 = objc_opt_class();
    id v9 = v8;
    v10 = NSStringFromHKNotificationInstructionAction();
    int v13 = 138543618;
    int v14 = v8;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_250D3F000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %@", (uint8_t *)&v13, 0x16u);
  }
  switch(a4)
  {
    case 1:
      [(HDHealthAppProfileExtension *)self _handleDismissInstruction];
      break;
    case 2:
      [(HDHealthAppProfileExtension *)self _handleHoldInstruction];
      break;
    case 3:
      [(HDHealthAppProfileExtension *)self _handleSendInstruction];
      break;
    default:
      _HKInitializeLogging();
      id v11 = *MEMORY[0x263F09968];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
        -[HDHealthAppProfileExtension notificationSyncClient:didReceiveInstructionWithAction:]((uint64_t)self, a4, v11);
      }
      break;
  }
  unitTest_didProcessNotificationInstruction = (void (**)(void))self->_unitTest_didProcessNotificationInstruction;
  if (unitTest_didProcessNotificationInstruction) {
    unitTest_didProcessNotificationInstruction[2]();
  }
}

- (void)_handleSendInstruction
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_250D3F000, v5, v6, "[%{public}@] Error retrieving send instructions: %{public}@", v7, v8, v9, v10, v11);
}

void __53__HDHealthAppProfileExtension__handleSendInstruction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09948];
  uint64_t v5 = *MEMORY[0x263F09948];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__HDHealthAppProfileExtension__handleSendInstruction__block_invoke_cold_1(a1, v4);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v4;
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v7 = v9;
    _os_log_impl(&dword_250D3F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posted AAAccountNotification", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_handleHoldInstruction
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_250D3F000, v5, v6, "[%{public}@] notification hold instructions returned nil with error = [%{public}@]", v7, v8, v9, v10, v11);
}

- (void)_handleDismissInstruction
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_250D3F000, v5, v6, "[%{public}@] Mark pending notification instruction as processed failed with error: [%{public}@]", v7, v8, v9, v10, v11);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDNotificationSyncClient)healthSharingNotificationSyncClient
{
  return self->_healthSharingNotificationSyncClient;
}

- (void)setHealthSharingNotificationSyncClient:(id)a3
{
}

- (HDAppAnalyticsUpdateManager)appAnalyticsUpdateManager
{
  return self->_appAnalyticsUpdateManager;
}

- (id)unitTest_didProcessNotificationInstruction
{
  return self->_unitTest_didProcessNotificationInstruction;
}

- (void)setUnitTest_didProcessNotificationInstruction:(id)a3
{
}

- (HDHealthAppDataObserver)dataObserver
{
  return self->_dataObserver;
}

- (void)setDataObserver:(id)a3
{
}

- (HDHealthAppLabConceptObserver)labConceptObserver
{
  return self->_labConceptObserver;
}

- (void)setLabConceptObserver:(id)a3
{
}

- (HDHealthAppSharingEntryObserver)sharingEntryObserver
{
  return self->_sharingEntryObserver;
}

- (void)setSharingEntryObserver:(id)a3
{
}

- (HDHAHealthAppApplicationInstallationManager)appInstallationManager
{
  return self->_appInstallationManager;
}

- (void)setAppInstallationManager:(id)a3
{
}

- (HDAnalyticsDailyEventManager)dailyAnalyticsManager
{
  return self->_dailyAnalyticsManager;
}

- (void)setDailyAnalyticsManager:(id)a3
{
}

- (HDHealthAppEmergencySOSManager)emergencySOSManager
{
  return self->_emergencySOSManager;
}

- (void)setEmergencySOSManager:(id)a3
{
}

- (HDNotificationSyncClient)healthAppNewDeviceNotificationSyncClient
{
  return self->_healthAppNewDeviceNotificationSyncClient;
}

- (void)setHealthAppNewDeviceNotificationSyncClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthAppNewDeviceNotificationSyncClient, 0);
  objc_storeStrong((id *)&self->_emergencySOSManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_appInstallationManager, 0);
  objc_storeStrong((id *)&self->_sharingEntryObserver, 0);
  objc_storeStrong((id *)&self->_labConceptObserver, 0);
  objc_storeStrong((id *)&self->_dataObserver, 0);
  objc_storeStrong(&self->_unitTest_didProcessNotificationInstruction, 0);
  objc_storeStrong((id *)&self->_appAnalyticsUpdateManager, 0);
  objc_storeStrong((id *)&self->_healthSharingNotificationSyncClient, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __53__HDHealthAppProfileExtension_profileDidBecomeReady___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_250D3F000, a2, OS_LOG_TYPE_ERROR, "Error migrating system applications %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)notificationSyncClient:(os_log_t)log didReceiveInstructionWithAction:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_250D3F000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected notification instruction received: %ld", (uint8_t *)&v3, 0x16u);
}

void __53__HDHealthAppProfileExtension__handleSendInstruction__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)OUTLINED_FUNCTION_3();
  id v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_1(&dword_250D3F000, v6, v7, "[%{public}@] Failed to post notifications %{public}@", v8, v9, v10, v11, v12);
}

@end