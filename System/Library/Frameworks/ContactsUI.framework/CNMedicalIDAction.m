@interface CNMedicalIDAction
- (CNHealthStoreManager)healthStoreManager;
- (UINavigationController)medicalIDNavigationController;
- (int64_t)medicalIDActionType;
- (void)dismissMedicalID;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidDelete:(id)a3;
- (void)medicalIDViewControllerDidFinish:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)performActionWithSender:(id)a3;
- (void)presentHKMedicalIDViewControllerWithSender:(id)a3;
- (void)presentMedicalIDViewControllerWithSender:(id)a3;
- (void)setHealthStoreManager:(id)a3;
- (void)setMedicalIDActionType:(int64_t)a3;
- (void)setMedicalIDNavigationController:(id)a3;
@end

@implementation CNMedicalIDAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDNavigationController, 0);

  objc_storeStrong((id *)&self->_healthStoreManager, 0);
}

- (void)setMedicalIDNavigationController:(id)a3
{
}

- (UINavigationController)medicalIDNavigationController
{
  return self->_medicalIDNavigationController;
}

- (void)setHealthStoreManager:(id)a3
{
}

- (CNHealthStoreManager)healthStoreManager
{
  return self->_healthStoreManager;
}

- (void)setMedicalIDActionType:(int64_t)a3
{
  self->_medicalIDActionType = a3;
}

- (int64_t)medicalIDActionType
{
  return self->_medicalIDActionType;
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

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id v4 = a3;
  v5 = [v4 medicalIDStore];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CNMedicalIDAction_medicalIDViewControllerDidDelete___block_invoke;
  v9[3] = &unk_1E5497450;
  v9[4] = self;
  [v5 deleteMedicalIDDataWithCompletion:v9];

  v6 = [(CNContactAction *)self delegate];
  [v6 actionDidFinish:self];

  id v7 = [(CNContactAction *)self delegate];
  v8 = [v4 navigationController];

  [v7 action:self dismissViewController:v8 sender:self];
}

void __54__CNMedicalIDAction_medicalIDViewControllerDidDelete___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v8 = a3;
    uint64_t v3 = objc_opt_class();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNMedicalIDAction.m", 145, 3, @"[%@] Failed to delete Medical ID: %@", v4, v5, v6, v7, v3);
  }
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactAction *)self delegate];
  [v5 actionDidFinish:self];

  id v7 = [(CNContactAction *)self delegate];
  uint64_t v6 = [v4 navigationController];

  [v7 action:self dismissViewController:v6 sender:self];
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactAction *)self delegate];
  [v5 actionWasCanceled:self];

  id v7 = [(CNContactAction *)self delegate];
  uint64_t v6 = [v4 navigationController];

  [v7 action:self dismissViewController:v6 sender:self];
}

- (void)dismissMedicalID
{
  uint64_t v3 = [(CNContactAction *)self delegate];
  [v3 actionDidFinish:self];

  id v4 = [(CNContactAction *)self delegate];
  uint64_t v5 = [(CNMedicalIDAction *)self medicalIDNavigationController];
  [v4 action:self dismissViewController:v5 sender:self];

  [(CNMedicalIDAction *)self setMedicalIDNavigationController:0];
}

- (void)presentMedicalIDViewControllerWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(Class)getMIUIDisplayConfigurationClass[0]() standardConfiguration];
  if ([(CNMedicalIDAction *)self medicalIDActionType] != 1
    && [(CNMedicalIDAction *)self medicalIDActionType] != 3)
  {
    [v5 setIsEditingAvailable:0];
  }
  if ([(CNMedicalIDAction *)self medicalIDActionType] == 3) {
    [v5 setIsDeletionAvailable:1];
  }
  uint64_t v6 = [(CNMedicalIDAction *)self healthStoreManager];
  id v7 = [v6 healthStore];

  objc_initWeak(&location, self);
  id v8 = [(CNMedicalIDAction *)self healthStoreManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke;
  v13[3] = &unk_1E5497428;
  objc_copyWeak(&v17, &location);
  id v9 = v7;
  id v14 = v9;
  id v10 = v5;
  id v15 = v10;
  id v11 = v4;
  id v16 = v11;
  id v12 = (id)[v8 registerMedicalIDDataHandler:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v8 = [WeakRetained healthStoreManager];
  [v8 unregisterHandlerForToken:v6];

  id v9 = +[CNUIContactsEnvironment currentEnvironment];
  id v10 = [v9 defaultSchedulerProvider];
  id v11 = [v10 mainThreadScheduler];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke_2;
  v13[3] = &unk_1E5497400;
  id v14 = a1[4];
  id v15 = v5;
  id v16 = a1[5];
  id v17 = WeakRetained;
  id v18 = a1[6];
  id v12 = v5;
  [v11 performBlock:v13];
}

void __62__CNMedicalIDAction_presentMedicalIDViewControllerWithSender___block_invoke_2(uint64_t a1)
{
  id v8 = (id)[objc_alloc((Class)getMIUIMedicalIDViewControllerClass[0]()) initWithHealthStore:*(void *)(a1 + 32) medicalIDData:*(void *)(a1 + 40) displayConfiguration:*(void *)(a1 + 48)];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  [*(id *)(a1 + 56) setMedicalIDNavigationController:v2];

  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 56) action:sel_dismissMedicalID];
  id v4 = [v8 navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = [*(id *)(a1 + 56) delegate];
  id v6 = *(void **)(a1 + 56);
  id v7 = [v6 medicalIDNavigationController];
  [v5 action:v6 presentViewController:v7 sender:*(void *)(a1 + 64)];
}

- (void)presentHKMedicalIDViewControllerWithSender:(id)a3
{
  id v4 = a3;
  if ([(CNMedicalIDAction *)self medicalIDActionType] == 2)
  {
    id v5 = objc_alloc_init((Class)getHKMedicalIDViewControllerClass[0]());
  }
  else
  {
    if ([(CNMedicalIDAction *)self medicalIDActionType] != 1
      && [(CNMedicalIDAction *)self medicalIDActionType] != 3)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    id v5 = (id)[objc_alloc((Class)getHKMedicalIDViewControllerClass[0]()) initInEditMode:1];
  }
  id v6 = v5;
LABEL_7:
  id v7 = [(CNMedicalIDAction *)self healthStoreManager];
  id v8 = [v7 healthStore];

  objc_initWeak(&location, self);
  id v9 = [(CNMedicalIDAction *)self healthStoreManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke;
  v14[3] = &unk_1E5497428;
  objc_copyWeak(&v18, &location);
  id v10 = v6;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  id v12 = v4;
  id v17 = v12;
  id v13 = (id)[v9 registerMedicalIDDataHandler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v8 = [WeakRetained healthStoreManager];
  [v8 unregisterHandlerForToken:v6];

  id v9 = +[CNUIContactsEnvironment currentEnvironment];
  id v10 = [v9 defaultSchedulerProvider];
  id v11 = [v10 mainThreadScheduler];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke_2;
  v13[3] = &unk_1E5497400;
  id v14 = v5;
  id v15 = WeakRetained;
  id v16 = a1[4];
  id v17 = a1[5];
  id v18 = a1[6];
  id v12 = v5;
  [v11 performBlock:v13];
}

void __64__CNMedicalIDAction_presentHKMedicalIDViewControllerWithSender___block_invoke_2(uint64_t a1)
{
  id v6 = *(id *)(a1 + 32);
  if (!v6)
  {
    v2 = [*(id *)(a1 + 40) healthStoreManager];
    uint64_t v3 = [*(id *)(a1 + 40) contact];
    id v6 = [v2 createMedicalIDFromContact:v3];
  }
  [*(id *)(a1 + 48) setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setAllowsEditing:1];
  [*(id *)(a1 + 48) setShowsDismissButton:1];
  [*(id *)(a1 + 48) setMedicalID:v6];
  [*(id *)(a1 + 48) setHealthStore:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 40) medicalIDActionType] == 3) {
    [*(id *)(a1 + 48) setShowsDeleteButton:1];
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 40) delegate];
  [v5 action:*(void *)(a1 + 40) presentViewController:v4 sender:*(void *)(a1 + 64)];
}

- (void)performActionWithSender:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5A3D8];
  id v8 = a3;
  id v5 = [v4 currentEnvironment];
  id v6 = [v5 featureFlags];
  int v7 = [v6 isFeatureEnabled:10];

  if (v7) {
    [(CNMedicalIDAction *)self presentMedicalIDViewControllerWithSender:v8];
  }
  else {
    [(CNMedicalIDAction *)self presentHKMedicalIDViewControllerWithSender:v8];
  }
}

@end