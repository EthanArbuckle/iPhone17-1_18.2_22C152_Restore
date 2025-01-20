@interface CNSharedProfileOnboardingController
+ (id)descriptorForRequiredKeys;
+ (id)log;
+ (id)sharingSettingsViewControllerForNicknameContact:(id)a3 meContact:(id)a4 mode:(int64_t)a5 contactStore:(id)a6;
+ (void)writeToDefaultsDidSkipPosterSetup:(BOOL)a3;
- (BOOL)accountCanCreateSNaP;
- (BOOL)accountCanCreateSNaPWithShouldShowErrorAlert:(BOOL)a3 fromViewController:(id)a4;
- (BOOL)alwaysShowSNaPOnboarding;
- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3;
- (BOOL)didSkipPosterSetup;
- (BOOL)hasCompletedOnboarding;
- (BOOL)isPhotosReadyForOnboarding;
- (BOOL)isPresentingModalViewController;
- (BOOL)multiplePhoneNumbersTiedToAppleID;
- (BOOL)shouldShowOnboarding;
- (BOOL)shouldShowOnboardingForSettingsWithNicknameContact:(id)a3 meContact:(id)a4;
- (CNContactStore)contactStore;
- (CNSNaPSetupFlowManager)setupFlowManager;
- (CNSharedProfileOnboardingController)initWithContactStore:(id)a3;
- (CNSharedProfileOnboardingController)initWithContactStore:(id)a3 stateController:(id)a4;
- (CNSharedProfileOnboardingControllerDelegate)delegate;
- (CNSharedProfileOnboardingStateController)stateController;
- (UIViewController)baseViewController;
- (UIViewController)presentedViewController;
- (id)meContact;
- (id)meOrPrimaryAccountContact;
- (int64_t)lastShownOnboardingVersion;
- (void)dismiss:(id)a3;
- (void)dismissOnboardingIfNeeded;
- (void)onboardingFromFlowManager:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)onboardingFromFlowManager:(id)a3 didUpdateSharingState:(BOOL)a4;
- (void)onboardingFromFlowManager:(id)a3 didUpdateWithSharingResult:(id)a4;
- (void)presentOnboardingFlowForNicknameContact:(id)a3 mode:(int64_t)a4 fromViewController:(id)a5;
- (void)presentOnboardingFlowIfNeededForMode:(int64_t)a3 fromViewController:(id)a4;
- (void)presentOnboardingFlowIfNeededForSettingsMode:(int64_t)a3 fromViewController:(id)a4 completion:(id)a5;
- (void)presentSettingsForMode:(int64_t)a3 fromViewController:(id)a4;
- (void)presentSettingsForNicknameContact:(id)a3 meContact:(id)a4 mode:(int64_t)a5 fromViewController:(id)a6;
- (void)presentSettingsForNicknameContact:(id)a3 mode:(int64_t)a4 fromViewController:(id)a5;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)setBaseViewController:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setSetupFlowManager:(id)a3;
- (void)setStateController:(id)a3;
- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4;
- (void)showMultiplePhoneNumbersAlertForNicknamesFromViewController:(id)a3;
- (void)showiCloudNotSignedInAlertForNicknamesFromViewController:(id)a3;
- (void)startOnboardingOrEditForMode:(int64_t)a3 fromViewController:(id)a4;
- (void)updateNicknameWithAudience:(unint64_t)a3;
- (void)updateNicknameWithSharingResult:(id)a3;
- (void)updateNicknameWithSharingState:(BOOL)a3;
- (void)writeToDefaultsCompletedOnboarding:(BOOL)a3;
- (void)writeToDefaultsLastShownOnboardingVersion;
@end

@implementation CNSharedProfileOnboardingController

- (void)presentOnboardingFlowIfNeededForMode:(int64_t)a3 fromViewController:(id)a4
{
  id v6 = a4;
  if ([(CNSharedProfileOnboardingController *)self shouldShowOnboarding]
    && [(CNSharedProfileOnboardingController *)self canShowOnboardingAllowingMultiplePhoneNumbers:0]&& [(CNSharedProfileOnboardingController *)self isPhotosReadyForOnboarding])
  {
    v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v8 = [v7 nicknameProvider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke;
    v9[3] = &unk_1E549AE70;
    v9[4] = self;
    int64_t v11 = a3;
    id v10 = v6;
    [v8 fetchPersonalNicknameAsContactWithCompletion:v9];
  }
}

- (BOOL)shouldShowOnboarding
{
  v2 = [(CNSharedProfileOnboardingController *)self stateController];
  char v3 = [v2 shouldShowOnboarding];

  return v3;
}

- (CNSharedProfileOnboardingStateController)stateController
{
  return self->_stateController;
}

- (CNSharedProfileOnboardingController)initWithContactStore:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNSharedProfileOnboardingStateController);
  id v6 = [(CNSharedProfileOnboardingController *)self initWithContactStore:v4 stateController:v5];

  return v6;
}

- (CNSharedProfileOnboardingController)initWithContactStore:(id)a3 stateController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSharedProfileOnboardingController;
  v9 = [(CNSharedProfileOnboardingController *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_stateController, a4);
    int64_t v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_setupFlowManager, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBaseViewController:(id)a3
{
}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setSetupFlowManager:(id)a3
{
}

- (CNSNaPSetupFlowManager)setupFlowManager
{
  return self->_setupFlowManager;
}

- (void)setPresentedViewController:(id)a3
{
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setStateController:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setDelegate:(id)a3
{
}

- (CNSharedProfileOnboardingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharedProfileOnboardingControllerDelegate *)WeakRetained;
}

- (BOOL)isPresentingModalViewController
{
  return self->isPresentingModalViewController;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = [(CNSharedProfileOnboardingController *)self baseViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__CNSharedProfileOnboardingController_sender_dismissViewController_completionHandler___block_invoke;
  v9[3] = &unk_1E549B710;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 dismissViewControllerAnimated:1 completion:v9];
}

uint64_t __86__CNSharedProfileOnboardingController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBaseViewController:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  v5 = [(CNSharedProfileOnboardingController *)self baseViewController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CNSharedProfileOnboardingController_sender_dismissViewController___block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

uint64_t __68__CNSharedProfileOnboardingController_sender_dismissViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBaseViewController:0];
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(CNSharedProfileOnboardingController *)self baseViewController];
  id v7 = [v6 presentedViewController];

  id v8 = [(CNSharedProfileOnboardingController *)self baseViewController];
  v9 = v8;
  if (v7)
  {
    id v10 = [v8 presentedViewController];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__CNSharedProfileOnboardingController_sender_presentViewController___block_invoke;
    v11[3] = &unk_1E549BF80;
    v11[4] = self;
    id v12 = v5;
    [v10 dismissViewControllerAnimated:0 completion:v11];
  }
  else
  {
    [v8 presentViewController:v5 animated:1 completion:0];
  }
}

void __68__CNSharedProfileOnboardingController_sender_presentViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) baseViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
}

- (void)onboardingFromFlowManager:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  [(CNSharedProfileOnboardingController *)self updateNicknameWithAudience:a4];

  [(CNSharedProfileOnboardingController *)self writeToDefaultsCompletedOnboarding:1];
}

- (void)onboardingFromFlowManager:(id)a3 didUpdateSharingState:(BOOL)a4
{
  [(CNSharedProfileOnboardingController *)self updateNicknameWithSharingState:a4];

  [(CNSharedProfileOnboardingController *)self writeToDefaultsCompletedOnboarding:1];
}

- (void)onboardingFromFlowManager:(id)a3 didUpdateWithSharingResult:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEFAULT, "Onboarding controller did finish with sharing result", v7, 2u);
  }

  [(CNSharedProfileOnboardingController *)self updateNicknameWithSharingResult:v5];
  [(CNSharedProfileOnboardingController *)self writeToDefaultsCompletedOnboarding:1];
  [(CNSharedProfileOnboardingController *)self setSetupFlowManager:0];
}

- (void)updateNicknameWithAudience:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v5 nicknameProvider];
  [v4 setSharingAudience:a3];
}

- (void)updateNicknameWithSharingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v5 nicknameProvider];
  [v4 setSharingEnabled:v3];
}

- (void)updateNicknameWithSharingResult:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5A3D8];
  id v5 = a3;
  id v6 = [v4 currentEnvironment];
  id v7 = [v6 nicknameProvider];
  [v7 setPersonalNicknameWithSharingResult:v5];

  id v8 = [(CNSharedProfileOnboardingController *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = [(CNSharedProfileOnboardingController *)self delegate];
    [v9 onboardingControllerDidFinishSetup:self];
  }
}

- (BOOL)didSkipPosterSetup
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  char v3 = [v2 didSkipPosterSetup];

  return v3;
}

- (void)writeToDefaultsCompletedOnboarding:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNSharedProfileOnboardingController *)self stateController];
  [v4 writeToDefaultsCompletedOnboarding:v3];
}

- (BOOL)hasCompletedOnboarding
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  char v3 = [v2 hasCompletedOnboarding];

  return v3;
}

- (int64_t)lastShownOnboardingVersion
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  int64_t v3 = [v2 lastShownOnboardingVersion];

  return v3;
}

- (void)writeToDefaultsLastShownOnboardingVersion
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  [v2 writeToDefaultsLastShownOnboardingVersion];
}

- (id)meOrPrimaryAccountContact
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(CNSharedProfileOnboardingController *)self meContact];
  int64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F179C8] defaultStore];
    id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");

    id v7 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    id v8 = objc_msgSend(v6, "_cn_firstName");
    [v7 setGivenName:v8];

    id v9 = objc_msgSend(v6, "_cn_lastName");
    [v7 setFamilyName:v9];

    id v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_INFO, "Failed to fetch current me contact, falling back to contact created from primary account %@", (uint8_t *)&v12, 0xCu);
    }

    id v4 = [v7 freeze];
  }

  return v4;
}

- (id)meContact
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(CNSharedProfileOnboardingController *)self contactStore];
  int64_t v3 = [(id)objc_opt_class() descriptorForRequiredKeys];
  v12[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = 0;
  id v5 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_INFO, "No me contact found, error: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)dismiss:(id)a3
{
  id v4 = [(CNSharedProfileOnboardingController *)self presentedViewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__CNSharedProfileOnboardingController_dismiss___block_invoke;
  v5[3] = &unk_1E549B488;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __47__CNSharedProfileOnboardingController_dismiss___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentedViewController:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 onboardingControllerDidDismissSettings:*(void *)(a1 + 32)];
  }
}

- (void)dismissOnboardingIfNeeded
{
  id v2 = [(CNSharedProfileOnboardingController *)self setupFlowManager];
  [v2 dismissOnboardingIfNeeded];
}

- (void)presentSettingsForNicknameContact:(id)a3 meContact:(id)a4 mode:(int64_t)a5 fromViewController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __107__CNSharedProfileOnboardingController_presentSettingsForNicknameContact_meContact_mode_fromViewController___block_invoke;
  v17[3] = &unk_1E549AF10;
  v17[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performBlock:v17];
}

void __107__CNSharedProfileOnboardingController_presentSettingsForNicknameContact_meContact_mode_fromViewController___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = [*(id *)(a1 + 32) contactStore];
  id v12 = [v2 sharingSettingsViewControllerForNicknameContact:v4 meContact:v3 mode:v5 contactStore:v6];

  [v12 setDelegate:*(void *)(a1 + 32)];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v12];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 32) action:sel_dismiss_];
  id v9 = [v12 navigationItem];
  [v9 setRightBarButtonItem:v8];

  id v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  [v7 setModalPresentationStyle:2 * ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)];
  [*(id *)(a1 + 32) setPresentedViewController:v12];
  [*(id *)(a1 + 56) presentViewController:v7 animated:1 completion:0];
}

- (void)presentSettingsForNicknameContact:(id)a3 mode:(int64_t)a4 fromViewController:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CNSharedProfileOnboardingController *)self meContact];
  [(CNSharedProfileOnboardingController *)self presentSettingsForNicknameContact:v9 meContact:v10 mode:a4 fromViewController:v8];
}

- (void)presentSettingsForMode:(int64_t)a3 fromViewController:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v8 = [v7 nicknameProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke;
  v10[3] = &unk_1E549AE70;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v9 = v6;
  [v8 fetchPersonalNicknameAsContactWithCompletion:v10];
}

void __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke_2;
  v7[3] = &unk_1E549AE48;
  uint64_t v5 = (void *)a1[5];
  v7[4] = a1[4];
  id v8 = v3;
  uint64_t v10 = a1[6];
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

uint64_t __81__CNSharedProfileOnboardingController_presentSettingsForMode_fromViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentSettingsForNicknameContact:*(void *)(a1 + 40) mode:*(void *)(a1 + 56) fromViewController:*(void *)(a1 + 48)];
}

- (void)startOnboardingOrEditForMode:(int64_t)a3 fromViewController:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__CNSharedProfileOnboardingController_startOnboardingOrEditForMode_fromViewController___block_invoke;
  v8[3] = &unk_1E549AEE8;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(CNSharedProfileOnboardingController *)self presentOnboardingFlowIfNeededForSettingsMode:a3 fromViewController:v7 completion:v8];
}

uint64_t __87__CNSharedProfileOnboardingController_startOnboardingOrEditForMode_fromViewController___block_invoke(uint64_t result, char a2, uint64_t a3, uint64_t a4)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) presentSettingsForNicknameContact:a3 meContact:a4 mode:*(void *)(result + 48) fromViewController:*(void *)(result + 40)];
  }
  return result;
}

- (void)presentOnboardingFlowIfNeededForSettingsMode:(int64_t)a3 fromViewController:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(CNSharedProfileOnboardingController *)self accountCanCreateSNaPWithShouldShowErrorAlert:1 fromViewController:v8])
  {
    int64_t v10 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v11 = [v10 nicknameProvider];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke;
    v12[3] = &unk_1E549AEC0;
    v12[4] = self;
    int64_t v15 = a3;
    id v13 = v8;
    id v14 = v9;
    [v11 fetchPersonalNicknameAsContactWithCompletion:v12];
  }
}

void __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke_2;
  v7[3] = &unk_1E549AE98;
  uint64_t v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v11 = *(void *)(a1 + 56);
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 performBlock:v7];
}

void __114__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForSettingsMode_fromViewController_completion___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) meContact];
  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowOnboardingForSettingsWithNicknameContact:meContact:", *(void *)(a1 + 40)))
  {
    [*(id *)(a1 + 32) presentOnboardingFlowForNicknameContact:*(void *)(a1 + 40) mode:*(void *)(a1 + 64) fromViewController:*(void *)(a1 + 48)];
    id v2 = [*(id *)(a1 + 32) stateController];
    [v2 writeToDefaultsLastShownSettingsOnboardingVersion];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (BOOL)shouldShowOnboardingForSettingsWithNicknameContact:(id)a3 meContact:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CNSharedProfileOnboardingController *)self canShowOnboardingAllowingMultiplePhoneNumbers:1];
  BOOL v9 = [(CNSharedProfileOnboardingController *)self shouldShowOnboarding];
  id v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v31 = v8;
    __int16 v32 = 1024;
    BOOL v33 = v9;
    _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEFAULT, "Should show onboarding: canShowOnboarding %d, newOnboardingVersionAvailable %d", buf, 0xEu);
  }

  if (v8 && !v9)
  {
    uint64_t v11 = [(CNSharedProfileOnboardingController *)self stateController];
    uint64_t v12 = [v11 lastShowOnboardingVersionInSettings];
    id v13 = [(CNSharedProfileOnboardingController *)self stateController];
    uint64_t v14 = [v13 currentOnboardingVersion];

    int64_t v15 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = v12 >= v14;
      _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_DEFAULT, "Should show onboarding: hasShownOnboardingInSettings %d", buf, 8u);
    }

    if (v12 < v14)
    {
      BOOL v16 = [(CNSharedProfileOnboardingController *)self hasCompletedOnboarding];
      BOOL v29 = [(CNSharedProfileOnboardingController *)self didSkipPosterSetup];
      v17 = [(CNSharedProfileOnboardingController *)self stateController];
      int v18 = [v17 deviceSupportsPosters];

      uint64_t v19 = *MEMORY[0x1E4F5A268];
      id v20 = [v7 wallpaper];
      int64_t v21 = [v20 posterArchiveData];
      int v22 = (*(uint64_t (**)(uint64_t, void *))(v19 + 16))(v19, v21);

      v23 = [v6 wallpaper];
      v24 = [v23 posterArchiveData];
      int v25 = (*(uint64_t (**)(uint64_t, void *))(v19 + 16))(v19, v24);

      v26 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110144;
        int v31 = !v16;
        __int16 v32 = 1024;
        BOOL v33 = v6 == 0;
        __int16 v34 = 1024;
        int v35 = v22;
        __int16 v36 = 1024;
        int v37 = v25;
        __int16 v38 = 1024;
        BOOL v39 = v29;
        _os_log_impl(&dword_18B625000, v26, OS_LOG_TYPE_DEFAULT, "hasNeverCompletedOnboarding %d, hasNoNickname %d, hasNoMeContactPoster %d, hasNoNicknamePoster %d, userSkippedPosterSetup %d", buf, 0x20u);
      }

      if (v6) {
        int v27 = 1;
      }
      else {
        int v27 = v16;
      }
      if (v18)
      {
        if (!v27 || ((v22 & v25 ^ 1 | v29) & 1) == 0) {
          goto LABEL_15;
        }
      }
      else if (!v27)
      {
LABEL_15:
        LOBYTE(v8) = 1;
        goto LABEL_18;
      }
    }
    LOBYTE(v8) = 0;
  }
LABEL_18:

  return v8;
}

- (void)presentOnboardingFlowForNicknameContact:(id)a3 mode:(int64_t)a4 fromViewController:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v15 = [(CNSharedProfileOnboardingController *)self meOrPrimaryAccountContact];
  [(CNSharedProfileOnboardingController *)self setBaseViewController:v8];

  id v10 = [CNSNaPSetupFlowManager alloc];
  uint64_t v11 = [(CNSharedProfileOnboardingController *)self contactStore];
  uint64_t v12 = [(CNSNaPSetupFlowManager *)v10 initWithPresenterDelegate:self contactStore:v11 mode:a4];

  [(CNSharedProfileOnboardingController *)self setSetupFlowManager:v12];
  id v13 = [(CNSharedProfileOnboardingController *)self setupFlowManager];
  [v13 setDelegate:self];

  uint64_t v14 = [(CNSharedProfileOnboardingController *)self setupFlowManager];
  [v14 startOnboardingFlowWithNicknameContact:v9 meContact:v15];

  [(CNSharedProfileOnboardingController *)self writeToDefaultsLastShownOnboardingVersion];
}

void __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke_2;
  v7[3] = &unk_1E549AE48;
  uint64_t v5 = (void *)a1[5];
  v7[4] = a1[4];
  id v8 = v3;
  uint64_t v10 = a1[6];
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

uint64_t __95__CNSharedProfileOnboardingController_presentOnboardingFlowIfNeededForMode_fromViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentOnboardingFlowForNicknameContact:*(void *)(a1 + 40) mode:*(void *)(a1 + 56) fromViewController:*(void *)(a1 + 48)];
}

- (void)showMultiplePhoneNumbersAlertForNicknamesFromViewController:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = a3;
  uint64_t v5 = CNContactsUIBundle();
  id v6 = [v5 localizedStringForKey:@"SHARING_NICKNAME_FEATURE_NOT_AVAILABLE_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  id v7 = CNContactsUIBundle();
  id v8 = [v7 localizedStringForKey:@"SHARING_NICKNAME_MULTIPLE_PHONE_NUMBERS_MESSAGE_LEGACY" value:&stru_1ED8AC728 table:@"Localized"];
  id v13 = [v3 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = CNContactsUIBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v12 = [v9 actionWithTitle:v11 style:0 handler:0];
  [v13 addAction:v12];

  [v4 presentViewController:v13 animated:1 completion:0];
}

- (void)showiCloudNotSignedInAlertForNicknamesFromViewController:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = a3;
  uint64_t v5 = CNContactsUIBundle();
  id v6 = [v5 localizedStringForKey:@"SHARING_NICKNAME_FEATURE_NOT_AVAILABLE_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  id v7 = CNContactsUIBundle();
  id v8 = [v7 localizedStringForKey:@"SHARING_NICKNAME_ICLOUD_NOT_SIGNED_IN_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
  id v13 = [v3 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = CNContactsUIBundle();
  uint64_t v11 = [v10 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v12 = [v9 actionWithTitle:v11 style:0 handler:0];
  [v13 addAction:v12];

  [v4 presentViewController:v13 animated:1 completion:0];
}

- (BOOL)accountCanCreateSNaPWithShouldShowErrorAlert:(BOOL)a3 fromViewController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CNSharedProfileOnboardingController *)self stateController];
  char v8 = [v7 iCloudSignedInToUseNicknames];

  if ((v8 & 1) == 0)
  {
    if (v4) {
      [(CNSharedProfileOnboardingController *)self showiCloudNotSignedInAlertForNicknamesFromViewController:v6];
    }
    uint64_t v11 = [(id)objc_opt_class() log];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    __int16 v18 = 0;
    uint64_t v12 = "Cannot create SNaP on account because iCloud is not signed in";
    id v13 = (uint8_t *)&v18;
    goto LABEL_13;
  }
  id v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v10 = [v9 featureFlags];
  if ([v10 isFeatureEnabled:14])
  {

LABEL_15:
    BOOL v15 = 1;
    goto LABEL_16;
  }
  BOOL v14 = [(CNSharedProfileOnboardingController *)self multiplePhoneNumbersTiedToAppleID];

  if (!v14) {
    goto LABEL_15;
  }
  if (v4) {
    [(CNSharedProfileOnboardingController *)self showMultiplePhoneNumbersAlertForNicknamesFromViewController:v6];
  }
  uint64_t v11 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = 0;
    uint64_t v12 = "Cannot create SNaP on account because multiple numbers are associated with Apple ID";
    id v13 = (uint8_t *)&v17;
LABEL_13:
    _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
  }
LABEL_14:

  BOOL v15 = 0;
LABEL_16:

  return v15;
}

- (BOOL)accountCanCreateSNaP
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  char v3 = [v2 accountCanCreateSNaP];

  return v3;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  char v3 = [v2 multiplePhoneNumbersTiedToAppleID];

  return v3;
}

- (BOOL)alwaysShowSNaPOnboarding
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  char v3 = [v2 alwaysShowSNaPOnboarding];

  return v3;
}

- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3
{
  uint64_t v3 = a3;
  BOOL v4 = [(CNSharedProfileOnboardingController *)self stateController];
  LOBYTE(v3) = [v4 canShowOnboardingAllowingMultiplePhoneNumbers:v3];

  return v3;
}

- (BOOL)isPhotosReadyForOnboarding
{
  id v2 = [(CNSharedProfileOnboardingController *)self stateController];
  char v3 = [v2 isPhotosReadyForOnboarding];

  return v3;
}

+ (void)writeToDefaultsDidSkipPosterSetup:(BOOL)a3
{
}

+ (id)sharingSettingsViewControllerForNicknameContact:(id)a3 meContact:(id)a4 mode:(int64_t)a5 contactStore:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = v10;
  }
  id v13 = v12;
  id v14 = a6;
  BOOL v15 = [[CNMeCardSharingContactNameProvider alloc] initWithContact:v13];
  id v16 = v9;
  id v17 = v16;
  if (!v9)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    if ([v11 isKeyAvailable:*MEMORY[0x1E4F1ADF0]])
    {
      __int16 v18 = [v11 givenName];
      [v17 setGivenName:v18];
    }
    else
    {
      [v17 setGivenName:&stru_1ED8AC728];
    }
    if ([v11 isKeyAvailable:*MEMORY[0x1E4F1ADE0]])
    {
      uint64_t v19 = [v11 familyName];
      [v17 setFamilyName:v19];
    }
    else
    {
      [v17 setFamilyName:&stru_1ED8AC728];
    }
  }
  int v31 = v17;
  __int16 v32 = v13;
  id v20 = [[CNMeCardSharingContactAvatarProvider alloc] initWithContact:v17];
  int64_t v21 = a5;
  int v22 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v23 = [v22 nicknameProvider];
  uint64_t v24 = [v23 isNicknameSharingEnabled];

  int v25 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v26 = [v25 nicknameProvider];
  uint64_t v27 = [v26 sharingAudience];

  LOBYTE(v30) = 1;
  v28 = [[CNMeCardSharingSettingsViewController alloc] initWithContactStore:v14 contact:v11 avatarProvider:v20 nameProvider:v15 sharingEnabled:v24 selectedSharingAudience:v27 showsWallpaperSuggestionsGalleryPicker:v30 headerMode:v21];

  return v28;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_4_59377 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_4_59377, &__block_literal_global_38_59378);
  }
  id v2 = (void *)descriptorForRequiredKeys_cn_once_object_4_59379;

  return v2;
}

void __64__CNSharedProfileOnboardingController_descriptorForRequiredKeys__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = +[CNMeCardSharingSettingsViewController descriptorForRequiredKeys];
  v1 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 0, v0);
  v8[1] = v1;
  id v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForNameOrder];
  v8[2] = v2;
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  BOOL v4 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v5 = [NSString stringWithUTF8String:"+[CNSharedProfileOnboardingController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v6 = [v4 descriptorWithKeyDescriptors:v3 description:v5];

  id v7 = (void *)descriptorForRequiredKeys_cn_once_object_4_59379;
  descriptorForRequiredKeys_cn_once_object_4_59379 = v6;
}

+ (id)log
{
  if (log_cn_once_token_3_59384 != -1) {
    dispatch_once(&log_cn_once_token_3_59384, &__block_literal_global_59385);
  }
  id v2 = (void *)log_cn_once_object_3_59386;

  return v2;
}

void __42__CNSharedProfileOnboardingController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNSharedProfileOnboardingController");
  v1 = (void *)log_cn_once_object_3_59386;
  log_cn_once_object_3_59386 = (uint64_t)v0;
}

@end