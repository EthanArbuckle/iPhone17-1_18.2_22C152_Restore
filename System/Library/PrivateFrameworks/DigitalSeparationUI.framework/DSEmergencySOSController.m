@interface DSEmergencySOSController
- (BOOL)hasAppWithKappaApproved;
- (BOOL)hasRetriedEmergencyContactFetch;
- (BOOL)maybeRetryDueToError:(id)a3 withReason:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (DSAppSharing)appSharing;
- (DSEmergencySOSController)init;
- (DSNavigationDelegate)delegate;
- (HKHealthStore)healthStore;
- (HKMedicalIDEmergencyContactFlow)contactFlow;
- (HKMedicalIDStore)medicalIDStore;
- (NSArray)emergencyContacts;
- (NSString)kappaApprovedAppID;
- (_HKEmergencyContact)selectedEmergencyContact;
- (_HKMedicalIDData)medicalIDData;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_showMaxContactsAlert;
- (void)chooseNewEmergencyContact;
- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4;
- (void)emergencyContactFlowDidCancel:(id)a3;
- (void)gatherEmergencyContacts;
- (void)removeEmergencyContact:(id)a3;
- (void)revokeKappaPermission;
- (void)setAppSharing:(id)a3;
- (void)setContactFlow:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmergencyContacts:(id)a3;
- (void)setHasRetriedEmergencyContactFetch:(BOOL)a3;
- (void)setHealthStore:(id)a3;
- (void)setKappaApprovedAppID:(id)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setMedicalIDStore:(id)a3;
- (void)setSelectedEmergencyContact:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateKappaBundleID;
- (void)viewDidLoad;
@end

@implementation DSEmergencySOSController

- (DSEmergencySOSController)init
{
  v3 = (void *)MEMORY[0x263F827E8];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v3 imageNamed:@"EmergencySOSIcon" inBundle:v4];

  v6 = DSUILocStringForKey(@"EMERGENCY_SOS_DETAIL");
  if ([MEMORY[0x263F660C8] isKappaUnmasked]
    && [MEMORY[0x263F660C8] isKappaDetectionSupportedOnCurrentDevice])
  {
    v7 = [MEMORY[0x263F01880] defaultWorkspace];
    int v8 = [v7 applicationIsInstalled:@"com.apple.MobileSMS"];

    if (v8) {
      v9 = @"EMERGENCY_SOS_DETAIL_WITH_CRASH";
    }
    else {
      v9 = @"EMERGENCY_SOS_DETAIL_IMESSAGES_DELETED";
    }
    uint64_t v10 = DSUILocStringForKeyInTable(v9, @"DigitalSeparationUI-SYDRO_FEATURES");

    v6 = (void *)v10;
  }
  v11 = DSUILocStringForKey(@"EMERGENCY_SOS");
  v24.receiver = self;
  v24.super_class = (Class)DSEmergencySOSController;
  v12 = [(DSTableWelcomeController *)&v24 initWithTitle:v11 detailText:v6 icon:v5 adoptTableViewScrollView:1 shouldShowSearchBar:0];

  if (v12)
  {
    os_log_t v13 = os_log_create("com.apple.DigitalSeparation", "DSEmergencySOSController");
    v14 = (void *)DSLog_15;
    DSLog_15 = (uint64_t)v13;

    v15 = (HKHealthStore *)objc_alloc_init(MEMORY[0x263F0A410]);
    healthStore = v12->_healthStore;
    v12->_healthStore = v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F0A4C8]) initWithHealthStore:v12->_healthStore];
    medicalIDStore = v12->_medicalIDStore;
    v12->_medicalIDStore = (HKMedicalIDStore *)v17;

    id v19 = objc_alloc_init(MEMORY[0x263F3A388]);
    uint64_t v20 = [objc_alloc(MEMORY[0x263F3A348]) initWithTCCStore:v19];
    appSharing = v12->_appSharing;
    v12->_appSharing = (DSAppSharing *)v20;

    kappaApprovedAppID = v12->_kappaApprovedAppID;
    v12->_kappaApprovedAppID = 0;
  }
  return v12;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)DSEmergencySOSController;
  [(DSTableWelcomeController *)&v15 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  v4 = DSUILocStringForKey(@"BACK_TO_UPDATE_APPLEID");
  v5 = (void *)[v3 initWithTitle:v4 style:0 target:0 action:0];

  v6 = [(DSEmergencySOSController *)self navigationController];
  v7 = [v6 navigationBar];
  int v8 = [v7 topItem];
  [v8 setBackBarButtonItem:v5];

  v9 = [(DSEmergencySOSController *)self delegate];
  if (v9)
  {
    uint64_t v10 = DSUILocStringForKey(@"CONTINUE");
    v11 = +[DSUIUtilities setUpBoldButtonForController:self title:v10 target:v9 selector:sel_pushNextPane];
    [(DSTableWelcomeController *)self setBoldButton:v11];
  }
  v12 = [(OBTableWelcomeController *)self tableView];
  [v12 setEditing:1];

  os_log_t v13 = [(OBTableWelcomeController *)self tableView];
  [v13 setAllowsSelectionDuringEditing:1];

  v14 = [(OBTableWelcomeController *)self tableView];
  [v14 setAllowsMultipleSelectionDuringEditing:0];

  self->_hasRetriedEmergencyContactFetch = 0;
  [(DSEmergencySOSController *)self gatherEmergencyContacts];
  [(DSEmergencySOSController *)self updateKappaBundleID];
}

- (void)updateKappaBundleID
{
  id v3 = [(DSEmergencySOSController *)self appSharing];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__DSEmergencySOSController_updateKappaBundleID__block_invoke;
  v4[3] = &unk_264C6E820;
  v4[4] = self;
  [v3 approvedBundleIdForKappa:MEMORY[0x263EF83A0] handler:v4];
}

void __47__DSEmergencySOSController_updateKappaBundleID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  [*(id *)(a1 + 32) setKappaApprovedAppID:v4];

  id v5 = [*(id *)(a1 + 32) tableView];
  [v5 reloadData];
}

- (BOOL)maybeRetryDueToError:(id)a3 withReason:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  int v8 = [v6 domain];
  if (![v8 isEqualToString:*MEMORY[0x263F07F70]] || objc_msgSend(v6, "code") != 4097)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(DSEmergencySOSController *)self hasRetriedEmergencyContactFetch];

  if (v9)
  {
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = [v7 stringByAppendingFormat:@" %@", v6];
  v11 = DSLog_15;
  if (os_log_type_enabled((os_log_t)DSLog_15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl(&dword_235BFC000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  BOOL v12 = 1;
  [(DSEmergencySOSController *)self setHasRetriedEmergencyContactFetch:1];
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__DSEmergencySOSController_maybeRetryDueToError_withReason___block_invoke;
  block[3] = &unk_264C6EA20;
  objc_copyWeak(&v16, (id *)buf);
  os_log_t v13 = (void *)MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

LABEL_9:
  return v12;
}

void __60__DSEmergencySOSController_maybeRetryDueToError_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained gatherEmergencyContacts];
}

- (void)gatherEmergencyContacts
{
  id v3 = [(DSTableWelcomeController *)self boldButton];
  [v3 showsBusyIndicator];

  objc_initWeak(&location, self);
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  medicalIDStore = self->_medicalIDStore;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke;
  v13[3] = &unk_264C6F4D0;
  objc_copyWeak(&v15, &location);
  id v6 = v4;
  v14 = v6;
  [(HKMedicalIDStore *)medicalIDStore fetchMedicalIDDataWithCompletion:v13];
  dispatch_group_enter(v6);
  id v7 = self->_medicalIDStore;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_338;
  v10[3] = &unk_264C6F4F8;
  objc_copyWeak(&v12, &location);
  int v8 = v6;
  v11 = v8;
  [(HKMedicalIDStore *)v7 fetchMedicalIDEmergencyContactsWithCompletion:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_2;
  v9[3] = &unk_264C6E7D0;
  v9[4] = self;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v6) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)DSLog_15, OS_LOG_TYPE_ERROR)) {
      __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_cold_1();
    }
    if (([WeakRetained maybeRetryDueToError:v6 withReason:@"Retrying medicalIDData fetch."] & 1) == 0)
    {
LABEL_6:
      if (v5)
      {
        [WeakRetained setMedicalIDData:v5];
      }
      else
      {
        id v8 = objc_alloc_init(MEMORY[0x263F0A9F8]);
        [WeakRetained setMedicalIDData:v8];
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_338(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v6) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)DSLog_15, OS_LOG_TYPE_ERROR)) {
      __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_338_cold_1();
    }
    if (([WeakRetained maybeRetryDueToError:v6 withReason:@"Retrying emergencyContacts fetch."] & 1) == 0)
    {
LABEL_6:
      id v8 = DSLog_15;
      if (os_log_type_enabled((os_log_t)DSLog_15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_235BFC000, v8, OS_LOG_TYPE_INFO, "Fetched emergencyContacts: %@ ", buf, 0xCu);
      }
      objc_initWeak((id *)buf, WeakRetained);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_342;
      v9[3] = &unk_264C6EA98;
      objc_copyWeak(&v11, (id *)buf);
      id v10 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v9);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_342(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setEmergencyContacts:v1];
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) boldButton];
  [v2 hidesBusyIndicator];

  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(DSEmergencySOSController *)self hasAppWithKappaApproved]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1) {
    return 1;
  }
  id v5 = [(DSEmergencySOSController *)self emergencyContacts];
  int64_t v4 = [v5 count] + 1;

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1) {
    DSUILocStringForKeyInTable(@"CAR_CRASH_TABLE_TITLE", @"DigitalSeparationUI-SYDRO_FEATURES");
  }
  else {
  int64_t v4 = DSUILocStringForKey(@"EMERGENCY_SOS_TABLE_TITLE");
  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    DSUILocStringForKeyInTable(@"CAR_CRASH_TABLE_DETAIL", @"DigitalSeparationUI-SYDRO_FEATURES");
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = &stru_26E9097D0;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F82C80]);
  id v7 = [MEMORY[0x263F82918] valueCellConfiguration];
  [v6 setIsAccessibilityElement:1];
  id v8 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
  [v6 setBackgroundColor:v8];

  BOOL v9 = [v7 textProperties];
  [v9 setNumberOfLines:0];

  id v10 = [v7 textProperties];
  [v10 setLineBreakMode:0];

  if ([v5 section])
  {
    if ([(DSEmergencySOSController *)self hasAppWithKappaApproved])
    {
      id v11 = [(DSEmergencySOSController *)self kappaApprovedAppID];
      id v12 = displayNameForApp();
      [v7 setText:v12];

      id v13 = [(DSEmergencySOSController *)self kappaApprovedAppID];
      uint64_t v14 = +[DSUIUtilities appIconForAppID:v13 format:0];
      [v7 setImage:v14];
    }
  }
  else
  {
    unint64_t v15 = [v5 row];
    id v16 = [(DSEmergencySOSController *)self emergencyContacts];
    unint64_t v17 = [v16 count];

    if (v15 >= v17)
    {
      objc_super v24 = DSUILocStringForKey(@"ADD_EMERGENCY_CONTACT");
      [v7 setText:v24];

      v25 = [v7 textProperties];
      v26 = [MEMORY[0x263F825C8] systemBlueColor];
      [v25 setColor:v26];

      uint64_t v27 = [v6 accessibilityTraits];
      [v6 setAccessibilityTraits:*MEMORY[0x263F83260] | v27];
    }
    else
    {
      v18 = [(DSEmergencySOSController *)self emergencyContacts];
      uint64_t v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      uint64_t v20 = [v19 name];
      [v7 setText:v20];

      v21 = [(DSEmergencySOSController *)self emergencyContacts];
      v22 = objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      v23 = [v22 phoneNumber];
      [v7 setSecondaryText:v23];

      [v7 setPrefersSideBySideTextAndSecondaryText:0];
    }
  }
  [v6 setContentConfiguration:v7];

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    int64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = [v5 row];
    id v8 = [(DSEmergencySOSController *)self emergencyContacts];
    LOBYTE(v7) = v7 == [v8 count];

    if (v7) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [v5 row];
    id v8 = [(DSEmergencySOSController *)self emergencyContacts];
    BOOL v6 = v7 == [v8 count];
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v7 animated:1];

  if (![v11 section])
  {
    uint64_t v8 = [v11 row];
    BOOL v9 = [(DSEmergencySOSController *)self emergencyContacts];
    uint64_t v10 = [v9 count];

    if (v8 == v10) {
      [(DSEmergencySOSController *)self chooseNewEmergencyContact];
    }
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a5;
  if ([v9 section])
  {
    [(DSEmergencySOSController *)self revokeKappaPermission];
  }
  else if (a4 == 2)
  {
    [(DSEmergencySOSController *)self chooseNewEmergencyContact];
  }
  else if (a4 == 1)
  {
    uint64_t v7 = [(DSEmergencySOSController *)self emergencyContacts];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));

    [(DSEmergencySOSController *)self removeEmergencyContact:v8];
  }
}

- (void)_showMaxContactsAlert
{
  id v3 = (void *)MEMORY[0x263F82418];
  uint64_t v4 = DSUILocStringForKey(@"MAX_SOS_CONTACTS_TITLE");
  id v8 = [v3 alertControllerWithTitle:v4 message:0 preferredStyle:1];

  id v5 = (void *)MEMORY[0x263F82400];
  id v6 = DSUILocStringForKey(@"OK");
  uint64_t v7 = [v5 actionWithTitle:v6 style:1 handler:&__block_literal_global_19];
  [v8 addAction:v7];

  [(DSEmergencySOSController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)removeEmergencyContact:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DSEmergencySOSController *)self medicalIDStore];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__DSEmergencySOSController_removeEmergencyContact___block_invoke;
  v6[3] = &unk_264C6F458;
  objc_copyWeak(&v7, &location);
  [v5 removeEmergencyContact:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __51__DSEmergencySOSController_removeEmergencyContact___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_2;
    block[3] = &unk_264C6EA20;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);
  }
  else if (v5 && os_log_type_enabled((os_log_t)DSLog_15, OS_LOG_TYPE_ERROR))
  {
    __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_cold_1();
  }
}

void __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained gatherEmergencyContacts];
}

- (void)chooseNewEmergencyContact
{
  id v3 = objc_alloc(MEMORY[0x263F46818]);
  id v4 = [(DSEmergencySOSController *)self medicalIDData];
  id v5 = (HKMedicalIDEmergencyContactFlow *)[v3 initWithPresentingViewController:self forMedicalIDData:v4];
  contactFlow = self->_contactFlow;
  self->_contactFlow = v5;

  id v7 = [(DSEmergencySOSController *)self contactFlow];
  [v7 setDelegate:self];

  id v8 = [(DSEmergencySOSController *)self contactFlow];
  [v8 presentEmergencyContactFlow];
}

- (void)emergencyContactFlowDidCancel:(id)a3
{
}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x263F660C8] isAllowedToMessageSOSContacts] & 1) == 0) {
    [MEMORY[0x263F660C8] setAllowedToMessageSOSContacts:1];
  }
  id v8 = [(DSEmergencySOSController *)self medicalIDData];
  id v9 = [v8 emergencyContacts];
  if (v9)
  {
    uint64_t v10 = [(DSEmergencySOSController *)self medicalIDData];
    id v11 = [v10 emergencyContacts];
    id v12 = [v11 arrayByAddingObject:v7];
  }
  else
  {
    v19[0] = v7;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  }

  id v13 = [(DSEmergencySOSController *)self medicalIDData];
  [v13 setEmergencyContacts:v12];

  objc_initWeak(&location, self);
  uint64_t v14 = [(DSEmergencySOSController *)self medicalIDStore];
  unint64_t v15 = [(DSEmergencySOSController *)self medicalIDData];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke;
  v16[3] = &unk_264C6F458;
  objc_copyWeak(&v17, &location);
  [v14 updateMedicalIDData:v15 completion:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)DSLog_15, OS_LOG_TYPE_ERROR))
  {
    __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_cold_1();
    if (!a2) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_374;
    block[3] = &unk_264C6EA20;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v7);
  }
LABEL_5:
}

void __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_374(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained gatherEmergencyContacts];
}

- (void)revokeKappaPermission
{
  id v3 = [(DSEmergencySOSController *)self kappaApprovedAppID];
  TCCAccessResetForBundleId();

  [(DSEmergencySOSController *)self updateKappaBundleID];
}

- (BOOL)hasAppWithKappaApproved
{
  v2 = [(DSEmergencySOSController *)self kappaApprovedAppID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void)setMedicalIDStore:(id)a3
{
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (NSArray)emergencyContacts
{
  return self->_emergencyContacts;
}

- (void)setEmergencyContacts:(id)a3
{
}

- (_HKEmergencyContact)selectedEmergencyContact
{
  return self->_selectedEmergencyContact;
}

- (void)setSelectedEmergencyContact:(id)a3
{
}

- (HKMedicalIDEmergencyContactFlow)contactFlow
{
  return self->_contactFlow;
}

- (void)setContactFlow:(id)a3
{
}

- (BOOL)hasRetriedEmergencyContactFetch
{
  return self->_hasRetriedEmergencyContactFetch;
}

- (void)setHasRetriedEmergencyContactFetch:(BOOL)a3
{
  self->_hasRetriedEmergencyContactFetch = a3;
}

- (DSAppSharing)appSharing
{
  return self->_appSharing;
}

- (void)setAppSharing:(id)a3
{
}

- (NSString)kappaApprovedAppID
{
  return self->_kappaApprovedAppID;
}

- (void)setKappaApprovedAppID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kappaApprovedAppID, 0);
  objc_storeStrong((id *)&self->_appSharing, 0);
  objc_storeStrong((id *)&self->_contactFlow, 0);
  objc_storeStrong((id *)&self->_selectedEmergencyContact, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error fetching medicalIDData: %@", v2, v3, v4, v5, v6);
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_338_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error fetching emergencyContacts: %@", v2, v3, v4, v5, v6);
}

void __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error removing emergencyContact: %@", v2, v3, v4, v5, v6);
}

void __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error updating medicalIDData error: %@", v2, v3, v4, v5, v6);
}

@end