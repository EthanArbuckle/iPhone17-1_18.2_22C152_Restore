@interface CNEmergencyContactAction
+ (id)log;
- (BOOL)addingToEmergency;
- (CNContactProperty)contactProperty;
- (CNContactStore)contactStore;
- (CNEmergencyContactAction)initWithContact:(id)a3 healthStoreManager:(id)a4 propertyItems:(id)a5;
- (CNHealthStoreManager)healthStoreManager;
- (CNScheduler)mainThreadScheduler;
- (CNScheduler)workQueue;
- (CNUINavigationListViewController)listController;
- (UIAlertController)alertController;
- (UINavigationController)medicalIDNavigationController;
- (void)createMedicalIDWithEmergencyContact:(id)a3;
- (void)dismissMedicalID;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidFinish:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)navigationListController:(id)a3 didSelectItem:(id)a4;
- (void)performActionForItem:(id)a3 sender:(id)a4;
- (void)performActionWithContactProperty:(id)a3 relationship:(id)a4;
- (void)performActionWithSender:(id)a3;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)presentDisambiguationAlertWithSender:(id)a3;
- (void)setAddingToEmergency:(BOOL)a3;
- (void)setAlertController:(id)a3;
- (void)setContactProperty:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setHealthStoreManager:(id)a3;
- (void)setListController:(id)a3;
- (void)setMainThreadScheduler:(id)a3;
- (void)setMedicalIDNavigationController:(id)a3;
- (void)showConfirmRemoveAlertWithSender:(id)a3 completion:(id)a4;
- (void)showHKMedicalIDViewControllerForMedicalID:(id)a3;
- (void)showMIUIMedicalIDViewControllerForMedicalID:(id)a3;
- (void)showRelationshipPickerForContactProperty:(id)a3 sender:(id)a4;
@end

@implementation CNEmergencyContactAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDNavigationController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_listController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_contactProperty, 0);
  objc_storeStrong((id *)&self->_healthStoreManager, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setMedicalIDNavigationController:(id)a3
{
}

- (UINavigationController)medicalIDNavigationController
{
  return self->_medicalIDNavigationController;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (void)setMainThreadScheduler:(id)a3
{
}

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

- (void)setListController:(id)a3
{
}

- (CNUINavigationListViewController)listController
{
  return self->_listController;
}

- (void)setAlertController:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setContactProperty:(id)a3
{
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

- (void)setHealthStoreManager:(id)a3
{
}

- (CNHealthStoreManager)healthStoreManager
{
  return self->_healthStoreManager;
}

- (void)setAddingToEmergency:(BOOL)a3
{
  self->_addingToEmergency = a3;
}

- (BOOL)addingToEmergency
{
  return self->_addingToEmergency;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactAction *)self delegate];
  [v5 actionDidFinish:self];

  id v7 = [(CNContactAction *)self delegate];
  v6 = [v4 navigationController];

  [v7 action:self dismissViewController:v6 sender:self];
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactAction *)self delegate];
  [v5 actionDidFinish:self];

  id v7 = [(CNContactAction *)self delegate];
  v6 = [v4 navigationController];

  [v7 action:self dismissViewController:v6 sender:self];
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactAction *)self delegate];
  [v5 actionWasCanceled:self];

  id v7 = [(CNContactAction *)self delegate];
  v6 = [v4 navigationController];

  [v7 action:self dismissViewController:v6 sender:self];
}

- (void)dismissMedicalID
{
  v3 = [(CNContactAction *)self delegate];
  [v3 actionDidFinish:self];

  id v4 = [(CNContactAction *)self delegate];
  v5 = [(CNEmergencyContactAction *)self medicalIDNavigationController];
  [v4 action:self dismissViewController:v5 sender:self];

  [(CNEmergencyContactAction *)self setMedicalIDNavigationController:0];
}

- (void)pickerDidCancel:(id)a3
{
  [a3 dismissViewControllerAnimated:1 completion:0];
  id v4 = [(CNContactAction *)self delegate];
  [v4 actionWasCanceled:self];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__CNEmergencyContactAction_picker_didPickItem___block_invoke;
  v8[3] = &unk_1E549BF80;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 dismissViewControllerAnimated:1 completion:v8];
}

void __47__CNEmergencyContactAction_picker_didPickItem___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 contactProperty];
  [v2 performActionWithContactProperty:v3 relationship:*(void *)(a1 + 40)];
}

- (void)navigationListController:(id)a3 didSelectItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(CNEmergencyContactAction *)self alertController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CNEmergencyContactAction_navigationListController_didSelectItem___block_invoke;
  v10[3] = &unk_1E549B670;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 dismissViewControllerAnimated:1 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __67__CNEmergencyContactAction_navigationListController_didSelectItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlertController:0];
  [WeakRetained setListController:0];
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) content];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4) {
    [WeakRetained showRelationshipPickerForContactProperty:v4 sender:0];
  }
}

- (void)showRelationshipPickerForContactProperty:(id)a3 sender:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F1AF50];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 contact];
  id v20 = +[CNCardPropertyGroup groupForProperty:v6 contact:v9 store:0 policy:0 linkedPolicies:0];

  v10 = (void *)MEMORY[0x1E4F1BA20];
  id v11 = [v8 value];
  id v12 = [v10 labeledValueWithLabel:0 value:v11];

  v13 = [v8 contact];
  v14 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v12 group:v20 contact:v13];

  id v15 = [[CNLabelPickerController alloc] initForPropertyItem:v14];
  [v15 setDelegate:self];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v15];
  [v16 setDelegate:self];
  v17 = CNContactsUIBundle();
  v18 = [v17 localizedStringForKey:@"CARD_ACTION_EMERGENCY_RELATIONSHIP_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  [v15 setTitle:v18];

  [(CNEmergencyContactAction *)self setContactProperty:v8];
  v19 = [(CNContactAction *)self delegate];
  [v19 action:self presentViewController:v16 sender:v7];
}

- (void)showConfirmRemoveAlertWithSender:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1B910];
  id v9 = [(CNEmergencyContactAction *)self contactProperty];
  v10 = [v9 contact];
  id v11 = [v8 stringFromContact:v10 style:0];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v12 = [(CNEmergencyContactAction *)self contactProperty];
    v13 = [v12 value];

    uint64_t v14 = [v13 formattedStringValue];

    id v11 = (void *)v14;
  }
  id v15 = (void *)MEMORY[0x1E4FB1418];
  v16 = NSString;
  v17 = CNContactsUIBundle();
  v18 = [v17 localizedStringForKey:@"CARD_ACTION_EMERGENCY_REMOVE_SHEET_TITLE-%@" value:&stru_1ED8AC728 table:@"Localized"];
  v19 = objc_msgSend(v16, "stringWithFormat:", v18, v11);
  id v20 = [v15 alertControllerWithTitle:0 message:v19 preferredStyle:0];

  v21 = (void *)MEMORY[0x1E4FB1410];
  v22 = CNContactsUIBundle();
  v23 = [v22 localizedStringForKey:@"CARD_ACTION_EMERGENCY_REMOVE" value:&stru_1ED8AC728 table:@"Localized"];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke;
  v34[3] = &unk_1E549A818;
  id v24 = v7;
  id v35 = v24;
  v25 = [v21 actionWithTitle:v23 style:2 handler:v34];
  [v20 addAction:v25];

  objc_initWeak(&location, self);
  v26 = (void *)MEMORY[0x1E4FB1410];
  v27 = CNContactsUIBundle();
  v28 = [v27 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke_2;
  v31[3] = &unk_1E5499870;
  objc_copyWeak(&v32, &location);
  v29 = [v26 actionWithTitle:v28 style:1 handler:v31];
  [v20 addAction:v29];

  v30 = [(CNContactAction *)self delegate];
  [v30 action:self presentViewController:v20 sender:v6];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

uint64_t __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 actionWasCanceled:WeakRetained];
}

- (void)presentDisambiguationAlertWithSender:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNUINavigationListViewController);
  [(CNEmergencyContactAction *)self setListController:v5];

  id v6 = [(CNEmergencyContactAction *)self listController];
  [v6 setDelegate:self];

  id v7 = [(CNEmergencyContactAction *)self listController];
  [v7 setContentAlignment:1];

  id v8 = [(CNEmergencyContactAction *)self listController];
  [v8 setShowFirstSectionTopSeparator:1];

  id v9 = (void *)MEMORY[0x1E4F1C978];
  v10 = [(CNPropertyAction *)self propertyItems];
  id v11 = objc_msgSend(v10, "_cn_map:", &__block_literal_global_323);
  id v12 = [v9 arrayWithArray:v11];

  v13 = [(CNEmergencyContactAction *)self listController];
  [v13 setItems:v12];

  uint64_t v14 = (void *)MEMORY[0x1E4FB1418];
  id v15 = CNContactsUIBundle();
  v16 = [v15 localizedStringForKey:@"CARD_ACTION_EMERGENCY_ADD_SHEET_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  v17 = [v14 alertControllerWithTitle:0 message:v16 preferredStyle:0];
  [(CNEmergencyContactAction *)self setAlertController:v17];

  v18 = [(CNEmergencyContactAction *)self listController];
  v19 = [(CNEmergencyContactAction *)self alertController];
  [v19 setContentViewController:v18];

  objc_initWeak(&location, self);
  id v20 = [(CNEmergencyContactAction *)self alertController];
  v21 = (void *)MEMORY[0x1E4FB1410];
  v22 = CNContactsUIBundle();
  v23 = [v22 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __65__CNEmergencyContactAction_presentDisambiguationAlertWithSender___block_invoke_2;
  v30 = &unk_1E5499870;
  objc_copyWeak(&v31, &location);
  id v24 = [v21 actionWithTitle:v23 style:1 handler:&v27];
  objc_msgSend(v20, "addAction:", v24, v27, v28, v29, v30);

  v25 = [(CNContactAction *)self delegate];
  v26 = [(CNEmergencyContactAction *)self alertController];
  [v25 action:self presentViewController:v26 sender:v4];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __65__CNEmergencyContactAction_presentDisambiguationAlertWithSender___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 actionWasCanceled:WeakRetained];

  [WeakRetained setAlertController:0];
}

id __65__CNEmergencyContactAction_presentDisambiguationAlertWithSender___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 contactProperty];
  id v3 = +[CNUINavigationListItem navigationListItemForContactProperty:v2];

  return v3;
}

- (void)createMedicalIDWithEmergencyContact:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNEmergencyContactAction *)self contactStore];
  id v6 = +[CNHealthStoreManager descriptorForRequiredKeys];
  v17[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v15 = 0;
  id v8 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v15];
  id v9 = v15;

  v10 = [(CNEmergencyContactAction *)self healthStoreManager];
  id v11 = [v10 createMedicalIDFromContact:v8];

  id v16 = v4;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];

  [v11 setEmergencyContacts:v12];
  v13 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v14 = [v13 featureFlags];
  LODWORD(v9) = [v14 isFeatureEnabled:10];

  if (v9) {
    [(CNEmergencyContactAction *)self showMIUIMedicalIDViewControllerForMedicalID:v11];
  }
  else {
    [(CNEmergencyContactAction *)self showHKMedicalIDViewControllerForMedicalID:v11];
  }
}

- (void)showMIUIMedicalIDViewControllerForMedicalID:(id)a3
{
  id v4 = (Class (__cdecl *)())getMIUIDisplayConfigurationClass_41134;
  id v5 = a3;
  id v15 = [(objc_class *)v4() standardConfiguration];
  [v15 setEntryPoint:1];
  id v6 = objc_alloc(getMIUIMedicalIDViewControllerClass_41135());
  id v7 = [(CNEmergencyContactAction *)self healthStoreManager];
  id v8 = [v7 healthStore];
  id v9 = (void *)[v6 initWithHealthStore:v8 medicalIDData:v5 displayConfiguration:v15];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  [(CNEmergencyContactAction *)self setMedicalIDNavigationController:v10];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissMedicalID];
  id v12 = [v9 navigationItem];
  [v12 setRightBarButtonItem:v11];

  v13 = [(CNContactAction *)self delegate];
  uint64_t v14 = [(CNEmergencyContactAction *)self medicalIDNavigationController];
  [v13 action:self presentViewController:v14 sender:0];
}

- (void)showHKMedicalIDViewControllerForMedicalID:(id)a3
{
  id v4 = (Class (__cdecl *)())getHKMedicalIDViewControllerClass_41154;
  id v5 = a3;
  id v10 = (id)[objc_alloc(v4()) initInEditMode:1];
  [v10 setDelegate:self];
  [v10 setAllowsEditing:1];
  [v10 setShowsDismissButton:1];
  [v10 setMedicalID:v5];

  id v6 = [(CNEmergencyContactAction *)self healthStoreManager];
  id v7 = [v6 healthStore];
  [v10 setHealthStore:v7];

  [v10 setShowsDeleteButton:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v10];
  id v9 = [(CNContactAction *)self delegate];
  [v9 action:self presentViewController:v8 sender:0];
}

- (void)performActionWithSender:(id)a3
{
  id v7 = a3;
  if ([(CNEmergencyContactAction *)self addingToEmergency]
    && ([(CNPropertyAction *)self propertyItems],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5 != 1))
  {
    [(CNEmergencyContactAction *)self presentDisambiguationAlertWithSender:v7];
  }
  else
  {
    id v6 = [(CNPropertyAction *)self propertyItem];
    [(CNEmergencyContactAction *)self performActionForItem:v6 sender:v7];
  }
}

- (void)performActionWithContactProperty:(id)a3 relationship:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNEmergencyContactAction *)self addingToEmergency])
  {
    Class v8 = (Class)get_HKEmergencyContactClass[0]();
    id v9 = [v6 contact];
    id v10 = [(objc_class *)v8 emergencyContactWithContact:v9 property:v6];

    [v10 setRelationship:v7];
    id v11 = [(CNEmergencyContactAction *)self workQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke;
    v16[3] = &unk_1E549BF80;
    v16[4] = self;
    id v17 = v10;
    id v12 = v10;
    [v11 performBlock:v16];
  }
  else
  {
    v13 = [(CNEmergencyContactAction *)self healthStoreManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3_310;
    v15[3] = &unk_1E5499828;
    v15[4] = self;
    id v14 = (id)[v13 registerMedicalIDDataHandler:v15];
  }
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) healthStoreManager];
  id v3 = [v2 medicalIDStore];
  uint64_t v4 = [v3 medicalIDSetUpStatus];

  if (v4 == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 32) mainThreadScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2;
    v13[3] = &unk_1E549BF80;
    id v6 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v6;
    [v5 performBlock:v13];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v7 = [*(id *)(a1 + 32) healthStoreManager];
  Class v8 = [v7 medicalIDStore];
  uint64_t v9 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3;
  v10[3] = &unk_1E5499800;
  objc_copyWeak(&v11, &location);
  [v8 addEmergencyContact:v9 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3_310(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) healthStoreManager];
  [v7 unregisterHandlerForToken:v6];

  Class v8 = [v5 emergencyContacts];
  uint64_t v9 = [*(id *)(a1 + 32) contact];
  id v10 = +[CNHealthStoreManager emergencyContactMatchingContact:v9];
  id v11 = objc_msgSend(v8, "_cn_firstObjectPassingTest:", v10);

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v12 = [*(id *)(a1 + 32) healthStoreManager];
  v13 = [v12 medicalIDStore];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4_312;
  v14[3] = &unk_1E5499800;
  objc_copyWeak(&v15, &location);
  [v13 removeEmergencyContact:v11 completion:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4_312(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (a2)
  {
    Class v8 = [WeakRetained mainThreadScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_313;
    v9[3] = &unk_1E549B488;
    v9[4] = v7;
    [v8 performBlock:v9];
  }
  else
  {
    Class v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Failed to delete Medical ID: %@", buf, 0xCu);
    }
  }
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_313(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionDidFinish:*(void *)(a1 + 32)];
}

uint64_t __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) createMedicalIDWithEmergencyContact:*(void *)(a1 + 40)];
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (a2)
  {
    Class v8 = [WeakRetained healthStoreManager];
    uint64_t v9 = [v8 medicalIDStore];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4;
    v26[3] = &unk_1E54997D8;
    v26[4] = v7;
    [v9 fetchMedicalIDDataWithCompletion:v26];
  }
  else
  {
    int v10 = objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 130);
    id v11 = [(id)objc_opt_class() log];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v5;
        _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "User has reached maximum number of emergency contacts: %@", buf, 0xCu);
      }

      v13 = CNContactsUIBundle();
      id v14 = [v13 localizedStringForKey:@"CARD_ACTION_EMERGENCY_MAXIMUM_CONTACTS_REACHED_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

      id v15 = CNContactsUIBundle();
      id v16 = [v15 localizedStringForKey:@"CARD_ACTION_EMERGENCY_MAXIMUM_CONTACTS_REACHED_BODY" value:&stru_1ED8AC728 table:@"Localized"];

      id v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v16 preferredStyle:1];
      [v7 setAlertController:v17];
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v5;
        _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Received an error that we do not handle: %@", buf, 0xCu);
      }

      v18 = CNContactsUIBundle();
      id v14 = [v18 localizedStringForKey:@"CARD_ACTION_EMERGENCY_CONTACT_NOT_ADDED_ERROR_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

      id v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v14 preferredStyle:1];
      [v7 setAlertController:v16];
    }

    v19 = [v7 alertController];
    id v20 = (void *)MEMORY[0x1E4FB1410];
    v21 = CNContactsUIBundle();
    v22 = [v21 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_306;
    v25[3] = &unk_1E549B590;
    v25[4] = v7;
    v23 = [v20 actionWithTitle:v22 style:1 handler:v25];
    [v19 addAction:v23];

    Class v8 = [v7 mainThreadScheduler];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2_308;
    v24[3] = &unk_1E549B488;
    v24[4] = v7;
    [v8 performBlock:v24];
  }
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) mainThreadScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_283;
    v9[3] = &unk_1E549BF80;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    [v7 performBlock:v9];
  }
  else
  {
    Class v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch Medical ID to display edit view: %@", buf, 0xCu);
    }
  }
}

uint64_t __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_306(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlertController:0];
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2_308(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 alertController];
  [v4 action:v2 presentViewController:v3 sender:*(void *)(a1 + 32)];
}

uint64_t __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_283(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v3 = [v2 featureFlags];
  int v4 = [v3 isFeatureEnabled:10];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v4)
  {
    return [v5 showMIUIMedicalIDViewControllerForMedicalID:v6];
  }
  else
  {
    return [v5 showHKMedicalIDViewControllerForMedicalID:v6];
  }
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  Class v8 = [v6 contactProperty];
  [(CNEmergencyContactAction *)self setContactProperty:v8];

  if ([(CNEmergencyContactAction *)self addingToEmergency])
  {
    uint64_t v9 = [v6 contactProperty];
    [(CNEmergencyContactAction *)self showRelationshipPickerForContactProperty:v9 sender:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__CNEmergencyContactAction_performActionForItem_sender___block_invoke;
    v10[3] = &unk_1E549B670;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    [(CNEmergencyContactAction *)self showConfirmRemoveAlertWithSender:v7 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __56__CNEmergencyContactAction_performActionForItem_sender___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) contactProperty];
  [WeakRetained performActionWithContactProperty:v2 relationship:0];
}

- (CNEmergencyContactAction)initWithContact:(id)a3 healthStoreManager:(id)a4 propertyItems:(id)a5
{
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CNEmergencyContactAction;
  id v10 = [(CNPropertyAction *)&v22 initWithContact:a3 propertyItems:a5];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_healthStoreManager, a4);
    id v12 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v13 = [v12 defaultSchedulerProvider];
    uint64_t v14 = [v13 mainThreadScheduler];
    mainThreadScheduler = v11->_mainThreadScheduler;
    v11->_mainThreadScheduler = (CNScheduler *)v14;

    id v16 = +[CNUIContactsEnvironment currentEnvironment];
    id v17 = [v16 defaultSchedulerProvider];
    uint64_t v18 = [v17 newSerialSchedulerWithName:@"com.apple.Contacts.CNEmergencyContactAction.workQueue"];
    workQueue = v11->_workQueue;
    v11->_workQueue = (CNScheduler *)v18;

    id v20 = v11;
  }

  return v11;
}

+ (id)log
{
  if (log_cn_once_token_4_41193 != -1) {
    dispatch_once(&log_cn_once_token_4_41193, &__block_literal_global_41194);
  }
  id v2 = (void *)log_cn_once_object_4_41195;

  return v2;
}

void __31__CNEmergencyContactAction_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNEmergencyContactAction");
  v1 = (void *)log_cn_once_object_4_41195;
  log_cn_once_object_4_41195 = (uint64_t)v0;
}

@end