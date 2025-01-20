@interface DMCUnenrollmentFlowUIPresenter
- (void)dismissUnenrollmentScene;
- (void)presentActivityPageForAppleMAID:(BOOL)a3;
- (void)requestDevicePasscodeWithCompletionHandler:(id)a3;
- (void)requestUserConfirmationIsAppleMAID:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation DMCUnenrollmentFlowUIPresenter

- (void)requestUserConfirmationIsAppleMAID:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke;
  block[3] = &unk_2645E9B20;
  BOOL v10 = a3;
  block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  v2 = DMCLocalizedString();
  v3 = (void *)MEMORY[0x263F1C3F8];
  v4 = DMCLocalizedString();
  v5 = [v3 alertControllerWithTitle:v2 message:v4 preferredStyle:1];

  id v6 = (void *)MEMORY[0x263F1C3F0];
  id v7 = DMCLocalizedString();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_2;
  v18[3] = &unk_2645E8F60;
  id v19 = *(id *)(a1 + 40);
  v8 = [v6 actionWithTitle:v7 style:1 handler:v18];

  id v9 = (void *)MEMORY[0x263F1C3F0];
  BOOL v10 = DMCLocalizedString();
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_3;
  v16 = &unk_2645E8F60;
  id v17 = *(id *)(a1 + 40);
  v11 = [v9 actionWithTitle:v10 style:2 handler:&v13];

  objc_msgSend(v5, "addAction:", v8, v13, v14, v15, v16);
  [v5 addAction:v11];
  v12 = [*(id *)(a1 + 32) baseViewController];
  [v12 presentViewController:v5 animated:1 completion:0];
}

uint64_t __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)requestDevicePasscodeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  DMCLocalizedStringByDevice();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(DMCEnrollmentFlowUIPresenterBase *)self requestDevicePasscodeWithDescriptionText:v5 completionHandler:v4];
}

- (void)presentActivityPageForAppleMAID:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__DMCUnenrollmentFlowUIPresenter_presentActivityPageForAppleMAID___block_invoke;
  v3[3] = &unk_2645E9668;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __66__DMCUnenrollmentFlowUIPresenter_presentActivityPageForAppleMAID___block_invoke(uint64_t a1)
{
  DMCLocalizedString();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) presentActivityPageWithText:v2 showButtomView:0];
}

- (void)dismissUnenrollmentScene
{
}

@end