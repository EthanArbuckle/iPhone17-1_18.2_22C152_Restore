@interface FAHealthKitSoftLinking
+ (BOOL)isMedicalIDViewControllerSupportedOnDevice;
- (FAHealthKitSoftLinking)initWithFamilyCircle:(id)a3;
- (id)_pathToEmergencyRow;
- (void)_startEmergencyContactsChangeObserver;
- (void)_stopEmergencyContactsChangeObserver;
- (void)dealloc;
- (void)dismissMedicalID;
- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4;
- (void)fetchLastModifiedDate:(id)a3 completionHandler:(id)a4;
- (void)fetchMedicalIDData:(id)a3 completionHandler:(id)a4;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)presentHKMedicalIDViewController:(id)a3 withFamily:(id)a4 isEmergencyContactSetup:(BOOL)a5;
- (void)presentMedicalIDV2ViewController:(id)a3;
- (void)presentMedicalIDViewController:(id)a3 withFamily:(id)a4 isEmergencyContactSetup:(BOOL)a5;
- (void)updateFamily:(id)a3;
@end

@implementation FAHealthKitSoftLinking

- (id)_pathToEmergencyRow
{
  return (id)[MEMORY[0x263F088C8] indexPathForRow:0 inSection:2];
}

- (FAHealthKitSoftLinking)initWithFamilyCircle:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FAHealthKitSoftLinking;
  v6 = [(FAHealthKitSoftLinking *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyCircle, a3);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v8 = (void *)getHKHealthStoreClass_softClass_0;
    uint64_t v30 = getHKHealthStoreClass_softClass_0;
    if (!getHKHealthStoreClass_softClass_0)
    {
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __getHKHealthStoreClass_block_invoke_0;
      v25 = &unk_264348998;
      v26 = &v27;
      __getHKHealthStoreClass_block_invoke_0((uint64_t)&v22);
      v8 = (void *)v28[3];
    }
    v9 = v8;
    _Block_object_dispose(&v27, 8);
    v10 = (HKHealthStore *)objc_alloc_init(v9);
    healthStore = v7->_healthStore;
    v7->_healthStore = v10;

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v12 = (void *)getHKMedicalIDStoreClass_softClass_0;
    uint64_t v30 = getHKMedicalIDStoreClass_softClass_0;
    if (!getHKMedicalIDStoreClass_softClass_0)
    {
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __getHKMedicalIDStoreClass_block_invoke_0;
      v25 = &unk_264348998;
      v26 = &v27;
      __getHKMedicalIDStoreClass_block_invoke_0((uint64_t)&v22);
      v12 = (void *)v28[3];
    }
    v13 = v12;
    _Block_object_dispose(&v27, 8);
    uint64_t v14 = [[v13 alloc] initWithHealthStore:v7->_healthStore];
    medicalIDStore = v7->_medicalIDStore;
    v7->_medicalIDStore = (HKMedicalIDStore *)v14;

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v16 = (void *)get_HKMedicalIDDataClass_softClass;
    uint64_t v30 = get_HKMedicalIDDataClass_softClass;
    if (!get_HKMedicalIDDataClass_softClass)
    {
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __get_HKMedicalIDDataClass_block_invoke;
      v25 = &unk_264348998;
      v26 = &v27;
      __get_HKMedicalIDDataClass_block_invoke((uint64_t)&v22);
      v16 = (void *)v28[3];
    }
    v17 = v16;
    _Block_object_dispose(&v27, 8);
    v18 = (_HKMedicalIDData *)objc_alloc_init(v17);
    medicalIDData = v7->_medicalIDData;
    v7->_medicalIDData = v18;

    [(FAHealthKitSoftLinking *)v7 _startEmergencyContactsChangeObserver];
  }

  return v7;
}

- (void)dealloc
{
  [(FAHealthKitSoftLinking *)self _stopEmergencyContactsChangeObserver];
  v3.receiver = self;
  v3.super_class = (Class)FAHealthKitSoftLinking;
  [(FAHealthKitSoftLinking *)&v3 dealloc];
}

- (void)updateFamily:(id)a3
{
}

- (void)presentMedicalIDViewController:(id)a3 withFamily:(id)a4 isEmergencyContactSetup:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  id v8 = a3;
  if (_os_feature_enabled_impl()) {
    [(FAHealthKitSoftLinking *)self presentMedicalIDV2ViewController:v8];
  }
  else {
    [(FAHealthKitSoftLinking *)self presentHKMedicalIDViewController:v8 withFamily:v9 isEmergencyContactSetup:v5];
  }
}

- (void)presentMedicalIDV2ViewController:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x2050000000;
  BOOL v5 = (void *)getMIUIDisplayConfigurationClass_softClass;
  uint64_t v23 = getMIUIDisplayConfigurationClass_softClass;
  if (!getMIUIDisplayConfigurationClass_softClass)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __getMIUIDisplayConfigurationClass_block_invoke;
    v18 = &unk_264348998;
    v19 = &v20;
    __getMIUIDisplayConfigurationClass_block_invoke((uint64_t)&v15);
    BOOL v5 = (void *)v21[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v20, 8);
  v7 = [v6 standardConfiguration];
  [v7 setEntryPoint:1];
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v8 = (void *)getMIUIMedicalIDViewControllerClass_softClass;
  uint64_t v23 = getMIUIMedicalIDViewControllerClass_softClass;
  if (!getMIUIMedicalIDViewControllerClass_softClass)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __getMIUIMedicalIDViewControllerClass_block_invoke;
    v18 = &unk_264348998;
    v19 = &v20;
    __getMIUIMedicalIDViewControllerClass_block_invoke((uint64_t)&v15);
    id v8 = (void *)v21[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v20, 8);
  v10 = (MIUIMedicalIDViewController *)[[v9 alloc] initWithHealthStore:self->_healthStore medicalIDData:0 displayConfiguration:v7];
  medicalIDV2ViewController = self->_medicalIDV2ViewController;
  self->_medicalIDV2ViewController = v10;

  v12 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_medicalIDV2ViewController];
  v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissMedicalID];
  uint64_t v14 = [(MIUIMedicalIDViewController *)self->_medicalIDV2ViewController navigationItem];
  [v14 setRightBarButtonItem:v13];

  [v4 presentViewController:v12 animated:1 completion:0];
}

- (void)dismissMedicalID
{
  id v2 = [(MIUIMedicalIDViewController *)self->_medicalIDV2ViewController navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentHKMedicalIDViewController:(id)a3 withFamily:(id)a4 isEmergencyContactSetup:(BOOL)a5
{
  id v7 = a3;
  id v8 = (FAFamilyCircle *)a4;
  if (getSOSUtilitiesClass() && ([getSOSUtilitiesClass() isAllowedToMessageSOSContacts] & 1) == 0) {
    [getSOSUtilitiesClass() setAllowedToMessageSOSContacts:1];
  }
  familyCircle = self->_familyCircle;
  self->_familyCircle = v8;
  v10 = v8;

  v11 = (HKMedicalIDViewController *)[objc_alloc((Class)getHKMedicalIDViewControllerClass()) initInEditMode:1];
  medicalIDViewController = self->_medicalIDViewController;
  self->_medicalIDViewController = v11;

  [(HKMedicalIDViewController *)self->_medicalIDViewController setHealthStore:self->_healthStore];
  [(HKMedicalIDViewController *)self->_medicalIDViewController setMedicalIDStore:self->_medicalIDStore];
  [(HKMedicalIDViewController *)self->_medicalIDViewController setMedicalID:self->_medicalIDData];
  [(HKMedicalIDViewController *)self->_medicalIDViewController setDelegate:self];
  [(HKMedicalIDViewController *)self->_medicalIDViewController setAllowsEditing:1];
  [(HKMedicalIDViewController *)self->_medicalIDViewController setShouldShowHints:1];
  [(HKMedicalIDViewController *)self->_medicalIDViewController setShowsDeleteButton:0];
  [(HKMedicalIDViewController *)self->_medicalIDViewController setShowsEditMedicalIDRowInViewMode:1];
  v13 = [(FAHealthKitSoftLinking *)self _pathToEmergencyRow];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_medicalIDViewController];
  uint64_t v15 = (void *)MEMORY[0x263F82E00];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke;
  v21[3] = &unk_264348AE0;
  id v22 = v7;
  id v23 = v14;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke_2;
  v19[3] = &unk_264349098;
  v19[4] = self;
  id v20 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v7;
  [v15 animateWithDuration:196608 delay:v21 options:v19 animations:0.1 completion:0.0];
}

uint64_t __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) tableView];
  [v2 scrollToRowAtIndexPath:*(void *)(a1 + 40) atScrollPosition:1 animated:0];
}

- (void)fetchMedicalIDData:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  objc_storeStrong((id *)&self->_familyCircle, a3);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  medicalIDStore = self->_medicalIDStore;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke;
  objc_super v21 = &unk_2643490C0;
  v25 = &v38;
  id v22 = self;
  id v11 = v7;
  id v23 = v11;
  v26 = &v34;
  uint64_t v27 = &v28;
  v12 = v9;
  v24 = v12;
  [(HKMedicalIDStore *)medicalIDStore fetchMedicalIDDataWithCompletion:&v18];
  dispatch_time_t v13 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v12, v13))
  {
    uint64_t v14 = _FALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FAHealthKitSoftLinking fetchMedicalIDData:completionHandler:](v14);
    }

    v35[3] = 0;
    id v15 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v16 = objc_msgSend(v15, "initWithDomain:code:userInfo:", @"com.apple.FAHealthKitSoftLinking", -1001, &unk_26CA525A0, v18, v19, v20, v21, v22, v23);
    id v17 = (void *)v29[5];
    v29[5] = v16;
  }
  v8[2](v8, v39[5], v35[3], v29[5]);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

void __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v6 && ([v6 isEmpty] & 1) == 0)
  {
    id v32 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v33 = v6;
    v10 = [v6 emergencyContacts];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (!v11) {
      goto LABEL_18;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v16 = [v15 nameContactIdentifier];
        if ([v16 length])
        {
          id v17 = [v15 name];
          uint64_t v18 = [v17 length];

          if (!v18) {
            continue;
          }
          uint64_t v19 = [v15 nameContactIdentifier];
          [v8 addObject:v19];

          uint64_t v16 = [v15 name];
          [v34 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (!v12)
      {
LABEL_18:

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v31 = a1;
        id v20 = [*(id *)(a1 + 40) members];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (!v21)
        {
          uint64_t v23 = 0;
          goto LABEL_32;
        }
        uint64_t v22 = v21;
        uint64_t v23 = 0;
        uint64_t v24 = *(void *)v36;
        while (1)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v20);
            }
            v26 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (([v26 isMe] & 1) == 0)
            {
              uint64_t v27 = [v26 contact];
              uint64_t v28 = [v27 identifier];
              if ([v8 containsObject:v28])
              {
              }
              else
              {
                uint64_t v29 = [v26 fullName];
                int v30 = [v34 containsObject:v29];

                if (!v30) {
                  continue;
                }
              }
              ++v23;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (!v22)
          {
LABEL_32:

            a1 = v31;
            *(void *)(*(void *)(*(void *)(v31 + 64) + 8) + 24) = v23;
            id v7 = v32;
            id v6 = v33;
            goto LABEL_33;
          }
        }
      }
    }
  }
  if (v7)
  {
    id v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke_cold_1(v7, v9);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
LABEL_33:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (([getSOSUtilitiesClass() isAllowedToMessageSOSContacts] & 1) == 0) {
    [getSOSUtilitiesClass() setAllowedToMessageSOSContacts:1];
  }
  id v6 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
  if (v6)
  {
    id v7 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
    id v8 = [v7 arrayByAddingObject:v5];
  }
  else
  {
    v10[0] = v5;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }

  [(_HKMedicalIDData *)self->_medicalIDData setEmergencyContacts:v8];
  id v9 = [(HKMedicalIDViewController *)self->_medicalIDViewController tableView];
  [v9 reloadData];
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke;
  v3[3] = &unk_2643489F8;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[4];
  return [v6 fetchMedicalIDData:v7 completionHandler:&__block_literal_global_6];
}

void __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  if (v4)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2_cold_1((uint64_t)v4, v5);
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:*MEMORY[0x263F3BE18] object:0];
  }
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__FAHealthKitSoftLinking_medicalIDViewControllerDidCancel___block_invoke;
  v3[3] = &unk_2643489F8;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

void __59__FAHealthKitSoftLinking_medicalIDViewControllerDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

- (void)fetchLastModifiedDate:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  familyCircle = self->_familyCircle;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__FAHealthKitSoftLinking_fetchLastModifiedDate_completionHandler___block_invoke;
  v8[3] = &unk_264349108;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(FAHealthKitSoftLinking *)self fetchMedicalIDData:familyCircle completionHandler:v8];
}

void __66__FAHealthKitSoftLinking_fetchLastModifiedDate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) dateSaved];
  if (v5)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2_cold_1((uint64_t)v5, v7);
    }
  }
  else
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 24) emergencyContactsModifiedDate];

    if (v8)
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 24) emergencyContactsModifiedDate];

      id v6 = (void *)v9;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_startEmergencyContactsChangeObserver
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = (const char *)getkHKMedicalIDEmergencyContactsDidChangeNotification();
  CFStringRef v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_EmergencyContactsDidChangeNotification, v5, 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_stopEmergencyContactsChangeObserver
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = (const char *)getkHKMedicalIDEmergencyContactsDidChangeNotification();
  CFStringRef v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);
}

+ (BOOL)isMedicalIDViewControllerSupportedOnDevice
{
  id HKMedicalIDViewControllerClass = getHKMedicalIDViewControllerClass();
  return [HKMedicalIDViewControllerClass isSupportedOnThisDevice];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDV2ViewController, 0);
  objc_storeStrong((id *)&self->_navViewController, 0);
  objc_storeStrong((id *)&self->_medicalIDViewController, 0);
  objc_storeStrong((id *)&self->_contactFlow, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)fetchMedicalIDData:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "Failed fetchMedicalIDDataWithCompletion! Timed out", v1, 2u);
}

void __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = [a1 localizedDescription];
  int v4 = 138412290;
  CFStringRef v5 = v3;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "fetchMedicalIDData failed with error: %@", (uint8_t *)&v4, 0xCu);
}

void __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch medical data %@", (uint8_t *)&v2, 0xCu);
}

@end