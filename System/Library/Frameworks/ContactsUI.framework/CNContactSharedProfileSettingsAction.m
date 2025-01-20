@interface CNContactSharedProfileSettingsAction
+ (id)os_log;
- (CNContactSharedProfileSettingsActionDelegate)sharedProfileSettingsActionDelegate;
- (CNContactStore)contactStore;
- (CNSharedProfileOnboardingController)onboardingController;
- (id)meContact;
- (void)onboardingControllerDidFinishSetup:(id)a3;
- (void)performActionWithSender:(id)a3;
- (void)presentSharingSettingsWithNicknameContact:(id)a3 sender:(id)a4;
- (void)setContactStore:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)setSharedProfileSettingsActionDelegate:(id)a3;
- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4;
@end

@implementation CNContactSharedProfileSettingsAction

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_1359);
  }
  v2 = (void *)os_log_cn_once_object_1;

  return v2;
}

void __46__CNContactSharedProfileSettingsAction_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNContactSharedProfileSettingsAction");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_destroyWeak((id *)&self->_sharedProfileSettingsActionDelegate);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setOnboardingController:(id)a3
{
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return (CNSharedProfileOnboardingController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSharedProfileSettingsActionDelegate:(id)a3
{
}

- (CNContactSharedProfileSettingsActionDelegate)sharedProfileSettingsActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sharedProfileSettingsActionDelegate);

  return (CNContactSharedProfileSettingsActionDelegate *)WeakRetained;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F5A3D8];
  id v6 = a4;
  v7 = [v5 currentEnvironment];
  v8 = [v7 nicknameProvider];
  [v8 setPersonalNicknameWithSharingResult:v6];

  id v9 = [(CNContactSharedProfileSettingsAction *)self sharedProfileSettingsActionDelegate];
  [v9 sharedProfileSettingsDidUpdate];
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F5A3D8], "currentEnvironment", a3);
  v7 = [v6 nicknameProvider];
  [v7 setSharingAudience:a4];

  id v8 = [(CNContactSharedProfileSettingsAction *)self sharedProfileSettingsActionDelegate];
  [v8 sharedProfileSettingsDidUpdate];
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_msgSend(MEMORY[0x1E4F5A3D8], "currentEnvironment", a3);
  v7 = [v6 nicknameProvider];
  [v7 setSharingEnabled:v4];

  id v8 = [(CNContactSharedProfileSettingsAction *)self sharedProfileSettingsActionDelegate];
  [v8 sharedProfileSettingsDidUpdate];
}

- (id)meContact
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CNContactSharedProfileSettingsAction *)self contactStore];
  v3 = +[CNMeCardSharingSettingsViewController descriptorForRequiredKeys];
  v12[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = 0;
  v5 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_INFO, "No me contact found, error: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)presentSharingSettingsWithNicknameContact:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(CNContactSharedProfileSettingsAction *)self meContact];
  id v8 = [(CNContactSharedProfileSettingsAction *)self contactStore];
  id v9 = +[CNSharedProfileOnboardingController sharingSettingsViewControllerForNicknameContact:v7 meContact:v11 mode:1 contactStore:v8];

  [v9 setDelegate:self];
  v10 = [(CNContactAction *)self delegate];
  [v10 action:self pushViewController:v9 sender:v6];
}

- (void)onboardingControllerDidFinishSetup:(id)a3
{
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactSharedProfileSettingsAction *)self contactStore];

  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke;
    aBlock[3] = &unk_1E5496908;
    aBlock[4] = self;
    id v23 = v4;
    id v6 = _Block_copy(aBlock);
    id v7 = [CNSharedProfileOnboardingController alloc];
    id v8 = [(CNContactSharedProfileSettingsAction *)self contactStore];
    id v9 = [(CNSharedProfileOnboardingController *)v7 initWithContactStore:v8];

    v10 = [(CNContactAction *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      [(CNContactSharedProfileSettingsAction *)self setOnboardingController:v9];
      v12 = [(CNContactAction *)self delegate];
      v13 = [v12 actionPresentingViewController];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_2;
      v20[3] = &unk_1E5496930;
      v14 = &v21;
      v21 = v6;
      id v15 = v6;
      [(CNSharedProfileOnboardingController *)v9 presentOnboardingFlowIfNeededForSettingsMode:1 fromViewController:v13 completion:v20];
    }
    else
    {
      v12 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      v13 = [v12 nicknameProvider];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_3;
      v18[3] = &unk_1E5496958;
      v14 = &v19;
      v19 = v6;
      id v17 = v6;
      [v13 fetchPersonalNicknameAsContactWithCompletion:v18];
    }
  }
  else
  {
    v16 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "me card sharing settings requires a contact store", buf, 2u);
    }
  }
}

void __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_INFO, "No personal nickname contact found", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_3;
  block[3] = &unk_1E549B800;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __64__CNContactSharedProfileSettingsAction_performActionWithSender___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

{
  return [*(id *)(a1 + 32) presentSharingSettingsWithNicknameContact:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

@end