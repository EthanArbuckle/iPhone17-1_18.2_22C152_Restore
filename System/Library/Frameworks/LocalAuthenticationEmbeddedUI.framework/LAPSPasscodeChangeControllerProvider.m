@interface LAPSPasscodeChangeControllerProvider
- (id)_authorizerWithUseCase:(int64_t)a3 options:(id)a4;
- (id)_uiWithOptions:(id)a3;
- (id)passcodeChangeControllerWithOptions:(id)a3;
- (id)passcodeRecoveryControllerWithOptions:(id)a3;
- (id)passcodeRecoveryPreflightController;
- (id)passcodeRemovalControllerWithOptions:(id)a3;
- (id)passcodeVerificationControllerWithOptions:(id)a3;
@end

@implementation LAPSPasscodeChangeControllerProvider

- (id)passcodeRecoveryPreflightController
{
  v2 = [LAPSPasscodeChangePreflightController alloc];
  v3 = +[LAPSPasscodeChangeSystemBuilder passcodeRecoverySystem];
  v4 = [(LAPSPasscodeChangePreflightController *)v2 initWithSystem:v3];

  return v4;
}

- (id)passcodeChangeControllerWithOptions:(id)a3
{
  id v4 = a3;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke;
  v19[3] = &unk_26506F260;
  id v5 = v4;
  id v20 = v5;
  v6 = __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke((uint64_t)v19);
  v7 = +[LAPSPasscodeChangeSystemBuilder passcodeChangeSystemWithOptions:v6];

  v8 = [(LAPSPasscodeChangeControllerProvider *)self _authorizerWithUseCase:0 options:v5];
  v9 = [(LAPSPasscodeChangeControllerProvider *)self _uiWithOptions:v5];
  v10 = [LAPSPasscodeChangeController alloc];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke_2;
  v16[3] = &unk_26506F288;
  id v17 = v5;
  id v18 = v7;
  id v11 = v7;
  id v12 = v5;
  v13 = __76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke_2((uint64_t)v16);
  v14 = [(LAPSPasscodeChangeController *)v10 initWithSystem:v11 authorizer:v8 ui:v9 options:v13];

  return v14;
}

LAPSPasscodeChangeSystemOptions *__76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeChangeSystemOptions);
  -[LAPSPasscodeChangeSystemOptions setSkipSuccessNotification:](v2, "setSkipSuccessNotification:", [*(id *)(a1 + 32) skipSuccessNotification]);

  return v2;
}

LAPSPasscodeChangeControllerOptions *__76__LAPSPasscodeChangeControllerProvider_passcodeChangeControllerWithOptions___block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  -[LAPSPasscodeChangeControllerOptions setDismissUIAfterCompletion:](v2, "setDismissUIAfterCompletion:", [*(id *)(a1 + 32) dismissUIAfterCompletion]);
  -[LAPSPasscodeChangeControllerOptions setSkipOldPasscode:](v2, "setSkipOldPasscode:", [*(id *)(a1 + 40) hasPasscode] ^ 1);
  v3 = [*(id *)(a1 + 32) oldPasscode];
  [(LAPSPasscodeChangeControllerOptions *)v2 setOldPasscode:v3];

  id v4 = [*(id *)(a1 + 32) newPasscode];
  [(LAPSPasscodeChangeControllerOptions *)v2 setNewPasscode:v4];

  return v2;
}

- (id)passcodeRecoveryControllerWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[LAPSPasscodeChangeSystemBuilder passcodeRecoverySystem];
  v6 = [(LAPSPasscodeChangeControllerProvider *)self _authorizerWithUseCase:2 options:v4];
  v7 = [(LAPSPasscodeChangeControllerProvider *)self _uiWithOptions:v4];

  v8 = [[LAPSPasscodeChangeController alloc] initWithSystem:v5 authorizer:v6 ui:v7];

  return v8;
}

- (id)passcodeRemovalControllerWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[LAPSPasscodeChangeSystemBuilder passcodeRemovalSystem];
  v6 = [(LAPSPasscodeChangeControllerProvider *)self _authorizerWithUseCase:1 options:v4];
  v7 = [(LAPSPasscodeChangeControllerProvider *)self _uiWithOptions:v4];
  v8 = [LAPSPasscodeChangeController alloc];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __77__LAPSPasscodeChangeControllerProvider_passcodeRemovalControllerWithOptions___block_invoke;
  id v17 = &unk_26506F288;
  id v18 = v4;
  id v19 = v5;
  id v9 = v5;
  id v10 = v4;
  id v11 = __77__LAPSPasscodeChangeControllerProvider_passcodeRemovalControllerWithOptions___block_invoke((uint64_t)&v14);
  id v12 = -[LAPSPasscodeChangeController initWithSystem:authorizer:ui:options:](v8, "initWithSystem:authorizer:ui:options:", v9, v6, v7, v11, v14, v15, v16, v17);

  return v12;
}

LAPSPasscodeChangeControllerOptions *__77__LAPSPasscodeChangeControllerProvider_passcodeRemovalControllerWithOptions___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  -[LAPSPasscodeChangeControllerOptions setDismissUIAfterCompletion:](v2, "setDismissUIAfterCompletion:", [*(id *)(a1 + 32) dismissUIAfterCompletion]);
  -[LAPSPasscodeChangeControllerOptions setSkipOldPasscode:](v2, "setSkipOldPasscode:", [*(id *)(a1 + 40) hasPasscode] ^ 1);
  [(LAPSPasscodeChangeControllerOptions *)v2 setSkipNewPasscode:1];

  return v2;
}

- (id)passcodeVerificationControllerWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[LAPSPasscodeChangeSystemBuilder passcodeVerificationSystem];
  v6 = [(LAPSPasscodeChangeControllerProvider *)self _authorizerWithUseCase:3 options:v4];
  v7 = [(LAPSPasscodeChangeControllerProvider *)self _uiWithOptions:v4];
  v8 = [LAPSPasscodeChangeController alloc];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __82__LAPSPasscodeChangeControllerProvider_passcodeVerificationControllerWithOptions___block_invoke;
  id v17 = &unk_26506F288;
  id v18 = v4;
  id v19 = v5;
  id v9 = v5;
  id v10 = v4;
  id v11 = __82__LAPSPasscodeChangeControllerProvider_passcodeVerificationControllerWithOptions___block_invoke((uint64_t)&v14);
  id v12 = -[LAPSPasscodeChangeController initWithSystem:authorizer:ui:options:](v8, "initWithSystem:authorizer:ui:options:", v9, v6, v7, v11, v14, v15, v16, v17);

  return v12;
}

LAPSPasscodeChangeControllerOptions *__82__LAPSPasscodeChangeControllerProvider_passcodeVerificationControllerWithOptions___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeChangeControllerOptions);
  -[LAPSPasscodeChangeControllerOptions setDismissUIAfterCompletion:](v2, "setDismissUIAfterCompletion:", [*(id *)(a1 + 32) dismissUIAfterCompletion]);
  -[LAPSPasscodeChangeControllerOptions setSkipOldPasscode:](v2, "setSkipOldPasscode:", [*(id *)(a1 + 40) hasPasscode] ^ 1);
  [(LAPSPasscodeChangeControllerOptions *)v2 setSkipNewPasscode:1];

  return v2;
}

- (id)_uiWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = [LAPSPasscodeChangeUIAdapter alloc];
  id v5 = [v3 parentVC];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__LAPSPasscodeChangeControllerProvider__uiWithOptions___block_invoke;
  v10[3] = &unk_26506F2B0;
  id v11 = v3;
  id v6 = v3;
  v7 = __55__LAPSPasscodeChangeControllerProvider__uiWithOptions___block_invoke((uint64_t)v10);
  v8 = [(LAPSPasscodeChangeUIAdapter *)v4 initWithParentVC:v5 options:v7];

  return v8;
}

LAPSPasscodeChangeUIAdapterOptions *__55__LAPSPasscodeChangeControllerProvider__uiWithOptions___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSPasscodeChangeUIAdapterOptions);
  id v3 = [*(id *)(a1 + 32) title];
  [(LAPSPasscodeChangeUIAdapterOptions *)v2 setTitle:v3];

  id v4 = [*(id *)(a1 + 32) passcodePrompt];
  [(LAPSPasscodeChangeUIAdapterOptions *)v2 setPasscodePrompt:v4];

  id v5 = [*(id *)(a1 + 32) oldPasscodePrompt];
  [(LAPSPasscodeChangeUIAdapterOptions *)v2 setOldPasscodePrompt:v5];

  -[LAPSPasscodeChangeUIAdapterOptions setIsPasscodeRecoveryMessageHidden:](v2, "setIsPasscodeRecoveryMessageHidden:", [*(id *)(a1 + 32) isPasscodeRecoveryMessageHidden]);

  return v2;
}

- (id)_authorizerWithUseCase:(int64_t)a3 options:(id)a4
{
  id v5 = a4;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __71__LAPSPasscodeChangeControllerProvider__authorizerWithUseCase_options___block_invoke;
  v13 = &unk_26506F2D8;
  id v14 = v5;
  int64_t v15 = a3;
  id v6 = v5;
  v7 = __71__LAPSPasscodeChangeControllerProvider__authorizerWithUseCase_options___block_invoke((uint64_t)&v10);
  v8 = +[LAPSPasscodeChangeAuthorizerBuilder authorizerWithOptions:](LAPSPasscodeChangeAuthorizerBuilder, "authorizerWithOptions:", v7, v10, v11, v12, v13);

  return v8;
}

LAPSPasscodeChangeAuthorizationOptions *__71__LAPSPasscodeChangeControllerProvider__authorizerWithUseCase_options___block_invoke(uint64_t a1)
{
  v2 = [[LAPSPasscodeChangeAuthorizationOptions alloc] initWithUseCase:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) calloutReason];
  [(LAPSPasscodeChangeAuthorizationOptions *)v2 setCalloutReason:v3];

  id v4 = [*(id *)(a1 + 32) calloutURL];
  [(LAPSPasscodeChangeAuthorizationOptions *)v2 setCalloutURL:v4];

  return v2;
}

@end