@interface CDPUIDeviceToDeviceEncryptionUIProviderImp
- (id)_upgradeAlertControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5;
- (id)_upgradeCardUINavigationControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5;
- (id)_upgradeCardUIViewControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5;
- (id)_upgradeViewControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5;
- (id)cancelActionHandler;
- (id)continueActionHandler;
- (void)cancelTapped:(id)a3;
- (void)continueTapped:(id)a3;
- (void)dealloc;
- (void)promptForCancelWithContext:(id)a3 vm:(id)a4 completion:(id)a5;
- (void)promptForUpgradeWithContext:(id)a3 vm:(id)a4 completion:(id)a5;
- (void)promptIneligibilityWithContext:(id)a3 vm:(id)a4 completion:(id)a5;
- (void)setCancelActionHandler:(id)a3;
- (void)setContinueActionHandler:(id)a3;
@end

@implementation CDPUIDeviceToDeviceEncryptionUIProviderImp

- (void)promptForUpgradeWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForUpgradeWithContext_vm_completion___block_invoke;
  v14[3] = &unk_26433CCF0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __88__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForUpgradeWithContext_vm_completion___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _upgradeViewControllerWithContext:*(void *)(a1 + 40) vm:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 40) forceInlinePresentation]
    && ([*(id *)(a1 + 40) presentingViewController],
        v2 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v2,
        (isKindOfClass & 1) != 0))
  {
    v4 = [*(id *)(a1 + 40) presentingViewController];
    [v4 pushViewController:v5 animated:1];
  }
  else
  {
    v4 = [*(id *)(a1 + 40) presentingViewController];
    [v4 presentViewController:v5 animated:1 completion:0];
  }
}

- (void)promptForCancelWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F82400];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 continueTitle];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke;
  v29[3] = &unk_26433D010;
  id v12 = v7;
  id v30 = v12;
  id v13 = [v8 actionWithTitle:v11 style:0 handler:v29];

  v14 = (void *)MEMORY[0x263F82400];
  id v15 = [v9 cancelTitle];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke_2;
  v27 = &unk_26433D010;
  id v28 = v12;
  id v16 = v12;
  id v17 = [v14 actionWithTitle:v15 style:1 handler:&v24];

  v18 = (void *)MEMORY[0x263F82418];
  v19 = objc_msgSend(v9, "title", v24, v25, v26, v27);
  v20 = [v9 message];

  v21 = [v18 alertControllerWithTitle:v19 message:v20 preferredStyle:1];

  [v21 addAction:v13];
  [v21 addAction:v17];
  v22 = [v10 presentingViewController];

  v23 = [v22 presentedViewController];
  [v23 presentViewController:v21 animated:1 completion:0];
}

uint64_t __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptForCancelWithContext_vm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)promptIneligibilityWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F82400];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 continueTitle];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptIneligibilityWithContext_vm_completion___block_invoke;
  v20[3] = &unk_26433D010;
  id v21 = v7;
  id v12 = v7;
  id v13 = [v8 actionWithTitle:v11 style:0 handler:v20];

  v14 = (void *)MEMORY[0x263F82418];
  id v15 = [v9 title];
  id v16 = [v9 message];

  id v17 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

  [v17 addAction:v13];
  v18 = [v10 presentingViewController];

  v19 = [v18 presentedViewController];
  [v19 presentViewController:v17 animated:1 completion:0];
}

uint64_t __91__CDPUIDeviceToDeviceEncryptionUIProviderImp_promptIneligibilityWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "CDPUIDeviceToDeviceEncryptionUIProviderImp is going away...", v1, 2u);
}

- (id)_upgradeViewControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 deviceToDeviceEncryptionUpgradeUIStyle])
  {
    if ([v8 deviceToDeviceEncryptionUpgradeUIStyle] != 1)
    {
      v14 = 0;
      goto LABEL_10;
    }
    if ([v8 forceInlinePresentation]
      && ([v8 presentingViewController],
          id v11 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) != 0))
    {
      uint64_t v13 = [(CDPUIDeviceToDeviceEncryptionUIProviderImp *)self _upgradeCardUIViewControllerWithContext:v8 vm:v9 completion:v10];
    }
    else
    {
      uint64_t v13 = [(CDPUIDeviceToDeviceEncryptionUIProviderImp *)self _upgradeCardUINavigationControllerWithContext:v8 vm:v9 completion:v10];
    }
  }
  else
  {
    uint64_t v13 = [(CDPUIDeviceToDeviceEncryptionUIProviderImp *)self _upgradeAlertControllerWithContext:v8 vm:v9 completion:v10];
  }
  v14 = (void *)v13;
LABEL_10:

  return v14;
}

- (id)_upgradeAlertControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = (void *)MEMORY[0x263F82400];
  id v8 = a4;
  id v9 = [v8 continueTitle];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke;
  v26[3] = &unk_26433D010;
  id v10 = v6;
  id v27 = v10;
  id v11 = [v7 actionWithTitle:v9 style:0 handler:v26];

  id v12 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = [v8 cancelTitle];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke_2;
  uint64_t v24 = &unk_26433D010;
  id v25 = v10;
  id v14 = v10;
  id v15 = [v12 actionWithTitle:v13 style:1 handler:&v21];

  id v16 = (void *)MEMORY[0x263F82418];
  id v17 = objc_msgSend(v8, "title", v21, v22, v23, v24);
  v18 = [v8 message];

  v19 = [v16 alertControllerWithTitle:v17 message:v18 preferredStyle:1];

  [v19 addAction:v11];
  [v19 addAction:v15];

  return v19;
}

uint64_t __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeAlertControllerWithContext_vm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_upgradeCardUIViewControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F086E0];
  id v9 = a4;
  id v10 = [v8 bundleForClass:objc_opt_class()];
  id v11 = [MEMORY[0x263F827E8] imageNamed:@"lock_icon_bg_buddy" inBundle:v10];
  id v12 = objc_alloc(MEMORY[0x263F5B918]);
  uint64_t v13 = [v9 title];
  id v14 = [v9 message];
  id v15 = (void *)[v12 initWithTitle:v13 detailText:v14 icon:v11];

  id v16 = [MEMORY[0x263F5B898] boldButton];
  id v17 = [v9 continueTitle];
  [v16 setTitle:v17 forState:0];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke;
  v31[3] = &unk_26433CDE0;
  id v18 = v7;
  id v32 = v18;
  [(CDPUIDeviceToDeviceEncryptionUIProviderImp *)self setContinueActionHandler:v31];
  [v16 addTarget:self action:sel_continueTapped_ forControlEvents:64];
  v19 = [v15 buttonTray];
  [v19 addButton:v16];

  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  id v28 = __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke_2;
  v29 = &unk_26433CDE0;
  id v30 = v18;
  id v20 = v18;
  [(CDPUIDeviceToDeviceEncryptionUIProviderImp *)self setCancelActionHandler:&v26];
  id v21 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v22 = objc_msgSend(v9, "cancelTitle", v26, v27, v28, v29);

  v23 = (void *)[v21 initWithTitle:v22 style:0 target:self action:sel_cancelTapped_];
  uint64_t v24 = [v15 navigationItem];
  [v24 setLeftBarButtonItem:v23];

  return v15;
}

uint64_t __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__CDPUIDeviceToDeviceEncryptionUIProviderImp__upgradeCardUIViewControllerWithContext_vm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)_upgradeCardUINavigationControllerWithContext:(id)a3 vm:(id)a4 completion:(id)a5
{
  id v5 = [(CDPUIDeviceToDeviceEncryptionUIProviderImp *)self _upgradeCardUIViewControllerWithContext:a3 vm:a4 completion:a5];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v5];

  return v6;
}

- (void)continueTapped:(id)a3
{
}

- (void)cancelTapped:(id)a3
{
}

- (id)cancelActionHandler
{
  return self->_cancelActionHandler;
}

- (void)setCancelActionHandler:(id)a3
{
}

- (id)continueActionHandler
{
  return self->_continueActionHandler;
}

- (void)setContinueActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueActionHandler, 0);

  objc_storeStrong(&self->_cancelActionHandler, 0);
}

@end