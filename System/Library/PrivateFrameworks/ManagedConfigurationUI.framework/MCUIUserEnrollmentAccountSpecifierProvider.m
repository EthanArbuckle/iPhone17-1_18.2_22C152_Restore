@interface MCUIUserEnrollmentAccountSpecifierProvider
+ (id)deleteAccountGroupFooterText;
+ (id)labelTextForAccountSummaryCell;
+ (id)titleForAccountSummaryGroup;
+ (id)warningTextForAccountDeletion;
- (id)devicePasscodeVerificationCompletionHandler;
- (void)_verifyDevicePasscodeWithPresentingViewController:(id)a3 completionHandler:(id)a4;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)preflightsAccountDeletion:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
- (void)setDevicePasscodeVerificationCompletionHandler:(id)a3;
@end

@implementation MCUIUserEnrollmentAccountSpecifierProvider

+ (id)titleForAccountSummaryGroup
{
  return MCUILocalizedString(@"ACCOUNT");
}

+ (id)labelTextForAccountSummaryCell
{
  return MCUILocalizedString(@"APPLE_ACCOUNT");
}

+ (id)warningTextForAccountDeletion
{
  return MCUILocalizedStringByDevice(@"ACCOUNT_DELETION_WARNING");
}

+ (id)deleteAccountGroupFooterText
{
  return MCUILocalizedString(@"DELETE_ACCOUNT_WARNING");
}

- (void)preflightsAccountDeletion:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (objc_msgSend(v12, "mc_isUserEnrollmentAccount")
    && objc_msgSend(v12, "aa_isAccountClass:", *MEMORY[0x1E4F4BF30])
    && ([MEMORY[0x1E4F74230] sharedConnection],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isPasscodeSet],
        v10,
        (v11 & 1) != 0))
  {
    [(MCUIUserEnrollmentAccountSpecifierProvider *)self _verifyDevicePasscodeWithPresentingViewController:v8 completionHandler:v9];
  }
  else if (v9)
  {
    v9[2](v9, 1);
  }
}

- (void)_verifyDevicePasscodeWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke;
  block[3] = &unk_1E6EAD990;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setDelegate:*(void *)(a1 + 32)];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v2];
  [v3 setModalInPresentation:1];
  if (MCUIIsiPad()) {
    [v3 setModalPresentationStyle:2];
  }
  [*(id *)(a1 + 40) presentViewController:v3 animated:1 completion:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6EADAD0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  [v4 setDevicePasscodeVerificationCompletionHandler:v6];
}

void __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_3;
  block[3] = &unk_1E6EADAA8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_4;
  v3[3] = &unk_1E6EADA80;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __114__MCUIUserEnrollmentAccountSpecifierProvider__verifyDevicePasscodeWithPresentingViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = [(MCUIUserEnrollmentAccountSpecifierProvider *)self devicePasscodeVerificationCompletionHandler];

  if (v4)
  {
    char v5 = [(MCUIUserEnrollmentAccountSpecifierProvider *)self devicePasscodeVerificationCompletionHandler];
    v5[2](v5, 1);

    [(MCUIUserEnrollmentAccountSpecifierProvider *)self setDevicePasscodeVerificationCompletionHandler:0];
  }
}

- (void)didCancelEnteringPIN
{
  v3 = [(MCUIUserEnrollmentAccountSpecifierProvider *)self devicePasscodeVerificationCompletionHandler];

  if (v3)
  {
    id v4 = [(MCUIUserEnrollmentAccountSpecifierProvider *)self devicePasscodeVerificationCompletionHandler];
    v4[2](v4, 0);

    [(MCUIUserEnrollmentAccountSpecifierProvider *)self setDevicePasscodeVerificationCompletionHandler:0];
  }
}

- (id)devicePasscodeVerificationCompletionHandler
{
  return self->_devicePasscodeVerificationCompletionHandler;
}

- (void)setDevicePasscodeVerificationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end