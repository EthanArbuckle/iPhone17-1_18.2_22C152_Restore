@interface WDContactConsolidationController
- (BOOL)isPresentingConsolidationAlert;
- (HKHealthStore)healthStore;
- (SOSContactsManager)sosContactsManager;
- (UIAlertController)consolidationAlertController;
- (UIViewController)presentingViewController;
- (WDContactConsolidationController)initWithProfile:(id)a3 presentingViewController:(id)a4;
- (WDNotificationManager)notificationManager;
- (_HKMedicalIDData)medicalIDData;
- (id)completionHandler;
- (void)_consolidateSOSContactsWithMedicalIDContacts;
- (void)_showLearnMoreViewController;
- (void)checkAlertNecessity;
- (void)presentContactConsolidationAlertWithCompletionHandler:(id)a3;
- (void)presentContactsConsolidationAlert;
- (void)setCompletionHandler:(id)a3;
- (void)setConsolidationAlertController:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSosContactsManager:(id)a3;
@end

@implementation WDContactConsolidationController

- (WDContactConsolidationController)initWithProfile:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WDContactConsolidationController;
  v8 = [(WDContactConsolidationController *)&v12 init];
  if (v8)
  {
    v9 = [v6 healthStore];
    [(WDContactConsolidationController *)v8 setHealthStore:v9];

    v10 = [v6 notificationManager];
    [(WDContactConsolidationController *)v8 setNotificationManager:v10];

    [(WDContactConsolidationController *)v8 setPresentingViewController:v7];
  }

  return v8;
}

- (BOOL)isPresentingConsolidationAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consolidationAlertController);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (SOSContactsManager)sosContactsManager
{
  sosContactsManager = self->_sosContactsManager;
  if (!sosContactsManager)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getSOSContactsManagerClass_softClass;
    uint64_t v13 = getSOSContactsManagerClass_softClass;
    if (!getSOSContactsManagerClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getSOSContactsManagerClass_block_invoke;
      v9[3] = &unk_26458EBE0;
      v9[4] = &v10;
      __getSOSContactsManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (SOSContactsManager *)objc_alloc_init(v5);
    id v7 = self->_sosContactsManager;
    self->_sosContactsManager = v6;

    sosContactsManager = self->_sosContactsManager;
  }

  return sosContactsManager;
}

- (void)presentContactConsolidationAlertWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2210D2000, v5, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - presentContactConsolidationAlertWithCompletionHandler", v6, 2u);
  }
  [(WDContactConsolidationController *)self setCompletionHandler:v4];

  [(WDContactConsolidationController *)self checkAlertNecessity];
}

- (void)checkAlertNecessity
{
  uint64_t v3 = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
  _HKInitializeLogging();
  id v4 = (os_log_t *)MEMORY[0x263F098F8];
  v5 = *MEMORY[0x263F098F8];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT);
  if (v3 != 3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      id v7 = "WDContactConsolidationLearnMoreViewController - current process is not authorized to access contacts, skip co"
           "ntact consolidation";
      goto LABEL_9;
    }
LABEL_10:
    v8 = [(WDContactConsolidationController *)self notificationManager];
    [v8 resetEmergencySOSBadge];

    goto LABEL_11;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2210D2000, v5, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - Checking alert necessity", buf, 2u);
  }
  if ([getSOSUtilitiesClass() isAllowedToMessageSOSContacts])
  {
    _HKInitializeLogging();
    v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "WDContactConsolidationLearnMoreViewController - isAllowedToMessageSOSContacts - true";
LABEL_9:
      _os_log_impl(&dword_2210D2000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (([getSOSManagerClass() deviceSupportsSOS] & 1) != 0
    || ([MEMORY[0x263F0A980] hasPairedWatch] & 1) != 0)
  {
    id v11 = objc_alloc(MEMORY[0x263F0A4C8]);
    uint64_t v12 = [(WDContactConsolidationController *)self healthStore];
    uint64_t v10 = (void (**)(void))[v11 initWithHealthStore:v12];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__WDContactConsolidationController_checkAlertNecessity__block_invoke;
    v15[3] = &unk_26458EBB8;
    v15[4] = self;
    [v10 fetchMedicalIDDataWithCompletion:v15];
    goto LABEL_16;
  }
  _HKInitializeLogging();
  uint64_t v13 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2210D2000, v13, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - ![getSOSManagerClass() deviceSupportsSOS] && ![_HKBehavior hasPairedWatch]", buf, 2u);
  }
  v14 = [(WDContactConsolidationController *)self notificationManager];
  [v14 resetEmergencySOSBadge];

  [getSOSUtilitiesClass() setAllowedToMessageSOSContacts:1];
LABEL_11:
  v9 = [(WDContactConsolidationController *)self completionHandler];

  if (!v9) {
    return;
  }
  uint64_t v10 = [(WDContactConsolidationController *)self completionHandler];
  v10[2]();
LABEL_16:
}

void __55__WDContactConsolidationController_checkAlertNecessity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2210D2000, v4, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - fetched medical id", buf, 2u);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__WDContactConsolidationController_checkAlertNecessity__block_invoke_326;
  v6[3] = &unk_26458DB58;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __55__WDContactConsolidationController_checkAlertNecessity__block_invoke_326(uint64_t a1)
{
  [*(id *)(a1 + 32) setMedicalIDData:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) medicalIDData];
  id v3 = [v2 emergencyContacts];
  if ([v3 count])
  {

LABEL_4:
    _HKInitializeLogging();
    v8 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_2210D2000, v8, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - presentContactsConsolidationAlert", v13, 2u);
    }
    [*(id *)(a1 + 32) presentContactsConsolidationAlert];
    return;
  }
  id v4 = [*(id *)(a1 + 32) sosContactsManager];
  id v5 = [v4 legacyContactsManager];
  BOOL v6 = [v5 SOSLegacyContacts];
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_4;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2210D2000, v9, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - self.medicalIDData.emergencyContacts.count == 0 && self.sosContactsManager.legacyContactsManager.SOSLegacyContacts.count == 0", buf, 2u);
  }
  uint64_t v10 = [*(id *)(a1 + 32) notificationManager];
  [v10 resetEmergencySOSBadge];

  [getSOSUtilitiesClass() setAllowedToMessageSOSContacts:1];
  id v11 = [*(id *)(a1 + 32) completionHandler];

  if (v11)
  {
    uint64_t v12 = [*(id *)(a1 + 32) completionHandler];
    v12[2]();
  }
}

- (void)presentContactsConsolidationAlert
{
  id v3 = [(WDContactConsolidationController *)self consolidationAlertController];

  if (!v3)
  {
    int v4 = [getSOSManagerClass() deviceSupportsSOS];
    id v5 = WDBundle();
    BOOL v6 = v5;
    if (v4) {
      uint64_t v7 = @"MEDICAL_ID_CONSOLIDATION_ALERT_BODY";
    }
    else {
      uint64_t v7 = @"MEDICAL_ID_CONSOLIDATION_ALERT_BODY_WATCH_ONLY";
    }
    v8 = [v5 localizedStringForKey:v7 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

    v9 = (void *)MEMORY[0x263F1C3F8];
    uint64_t v10 = WDBundle();
    id v11 = [v10 localizedStringForKey:@"MEDICAL_ID_CONSOLIDATION_ALERT_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    uint64_t v12 = [v9 alertControllerWithTitle:v11 message:v8 preferredStyle:1];

    uint64_t v13 = (void *)MEMORY[0x263F1C3F0];
    v14 = WDBundle();
    v15 = [v14 localizedStringForKey:@"DATA_COLLECTION_MORE_INFO_BUTTON" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke;
    v26[3] = &unk_26458DFA8;
    v26[4] = self;
    v16 = [v13 actionWithTitle:v15 style:0 handler:v26];

    [v12 addAction:v16];
    v17 = (void *)MEMORY[0x263F1C3F0];
    v18 = WDBundle();
    v19 = [v18 localizedStringForKey:@"OK" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke_2;
    v25[3] = &unk_26458DFA8;
    v25[4] = self;
    v20 = [v17 actionWithTitle:v19 style:0 handler:v25];

    [v12 addAction:v20];
    [(WDContactConsolidationController *)self setConsolidationAlertController:v12];
    _HKInitializeLogging();
    v21 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2210D2000, v21, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - presentingViewController presentViewController:self.consolidationAlertController", v24, 2u);
    }
    v22 = [(WDContactConsolidationController *)self presentingViewController];
    v23 = [(WDContactConsolidationController *)self consolidationAlertController];
    [v22 presentViewController:v23 animated:1 completion:0];
  }
}

uint64_t __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showLearnMoreViewController];
}

void __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _consolidateSOSContactsWithMedicalIDContacts];
  v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) completionHandler];
    v3[2]();
  }
}

- (void)_showLearnMoreViewController
{
  id v3 = objc_alloc_init(WDContactConsolidationLearnMoreViewController);
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __64__WDContactConsolidationController__showLearnMoreViewController__block_invoke;
  uint64_t v10 = &unk_26458DC70;
  objc_copyWeak(&v11, &location);
  [(WDContactConsolidationLearnMoreViewController *)v3 setDismissHandler:&v7];
  id v4 = objc_alloc(MEMORY[0x263F46858]);
  id v5 = objc_msgSend(v4, "initWithRootViewController:", v3, v7, v8, v9, v10);
  BOOL v6 = [(WDContactConsolidationController *)self presentingViewController];
  [v6 presentViewController:v5 animated:1 completion:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __64__WDContactConsolidationController__showLearnMoreViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained presentContactsConsolidationAlert];
    id WeakRetained = v2;
  }
}

- (void)_consolidateSOSContactsWithMedicalIDContacts
{
  id v3 = [(WDContactConsolidationController *)self medicalIDData];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F0A9F8]);
    [(WDContactConsolidationController *)self setMedicalIDData:v4];
  }
  id v5 = [(WDContactConsolidationController *)self sosContactsManager];
  BOOL v6 = [v5 legacyContactsManager];
  int v7 = [v6 SOSLegacyContactsExist];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v8 setBool:1 forKey:*MEMORY[0x263F46390]];
  }
  v9 = [(WDContactConsolidationController *)self medicalIDData];
  uint64_t v10 = [(WDContactConsolidationController *)self sosContactsManager];
  id v11 = [v9 consolidatedSOSContactsWithSOSContactsManager:v10];
  id v18 = (id)[v11 mutableCopy];

  uint64_t v12 = [(WDContactConsolidationController *)self medicalIDData];
  [v12 setEmergencyContacts:v18];

  id v13 = objc_alloc(MEMORY[0x263F0A4C8]);
  v14 = [(WDContactConsolidationController *)self healthStore];
  v15 = (void *)[v13 initWithHealthStore:v14];

  v16 = [(WDContactConsolidationController *)self medicalIDData];
  [v15 updateMedicalIDData:v16 completion:0];

  v17 = [(WDContactConsolidationController *)self notificationManager];
  [v17 resetEmergencySOSBadge];

  [getSOSUtilitiesClass() setAllowedToMessageSOSContacts:1];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (void)setSosContactsManager:(id)a3
{
}

- (WDNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIAlertController)consolidationAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consolidationAlertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setConsolidationAlertController:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_consolidationAlertController);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_sosContactsManager, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end