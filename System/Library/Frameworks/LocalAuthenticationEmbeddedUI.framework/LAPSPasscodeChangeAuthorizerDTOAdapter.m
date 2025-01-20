@interface LAPSPasscodeChangeAuthorizerDTOAdapter
- (LAPSPasscodeChangeAuthorizerDTOAdapter)initWithOptions:(id)a3;
- (void)_authorizeOperationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_authorizePasscodeChangeWithCompletion:(id)a3;
- (void)_authorizePasscodeRecoveryWithCompletion:(id)a3;
- (void)_authorizePasscodeRemovalWithCompletion:(id)a3;
- (void)_authorizePasscodeVerificationWithCompletion:(id)a3;
- (void)authorizeWithCompletion:(id)a3;
@end

@implementation LAPSPasscodeChangeAuthorizerDTOAdapter

- (LAPSPasscodeChangeAuthorizerDTOAdapter)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeChangeAuthorizerDTOAdapter;
  v6 = [(LAPSPasscodeChangeAuthorizerDTOAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

- (void)authorizeWithCompletion:(id)a3
{
  id v4 = a3;
  switch([(LAPSPasscodeChangeAuthorizationOptions *)self->_options useCase])
  {
    case 0:
      [(LAPSPasscodeChangeAuthorizerDTOAdapter *)self _authorizePasscodeChangeWithCompletion:v4];
      break;
    case 1:
      [(LAPSPasscodeChangeAuthorizerDTOAdapter *)self _authorizePasscodeRemovalWithCompletion:v4];
      break;
    case 2:
      [(LAPSPasscodeChangeAuthorizerDTOAdapter *)self _authorizePasscodeRecoveryWithCompletion:v4];
      break;
    case 3:
      [(LAPSPasscodeChangeAuthorizerDTOAdapter *)self _authorizePasscodeVerificationWithCompletion:v4];
      break;
    default:
      break;
  }
}

- (void)_authorizePasscodeChangeWithCompletion:(id)a3
{
  v14[6] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  if (_os_feature_enabled_impl())
  {
    v13[0] = &unk_26F32BA88;
    id v5 = +[LALocalizedString passcodeChangeLocalizedReason];
    v14[0] = v5;
    v13[1] = &unk_26F32BAA0;
    v6 = +[LALocalizedString passcodeChangeRatchetBeginTitle];
    v14[1] = v6;
    v13[2] = &unk_26F32BAB8;
    v7 = +[LALocalizedString passcodeChangeRatchetCountdownText];
    v14[2] = v7;
    v13[3] = &unk_26F32BAD0;
    v8 = [(LAPSPasscodeChangeAuthorizationOptions *)self->_options calloutReason];
    objc_super v9 = v8;
    if (!v8)
    {
      objc_super v9 = +[LALocalizedString passcodeChangeRatchetCalloutReason];
    }
    v14[3] = v9;
    v13[4] = &unk_26F32BAE8;
    v10 = [(LAPSPasscodeChangeAuthorizationOptions *)self->_options calloutURL];
    v11 = v10;
    if (!v10)
    {
      v11 = [NSURL URLWithString:@"prefs:root=PASSCODE&path=12"];
    }
    v13[5] = &unk_26F32BB00;
    v14[4] = v11;
    v14[5] = MEMORY[0x263EFFA88];
    v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];
    [(LAPSPasscodeChangeAuthorizerDTOAdapter *)self _authorizeOperationWithIdentifier:@"com.apple.LocalAuthentication.passcode.change" options:v12 completion:v4];

    if (!v10) {
    if (!v8)
    }
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (void)_authorizePasscodeRemovalWithCompletion:(id)a3
{
  v14[6] = *MEMORY[0x263EF8340];
  v13[0] = &unk_26F32BA88;
  id v4 = a3;
  id v5 = +[LALocalizedString passcodeRemovalLocalizedReason];
  v14[0] = v5;
  v13[1] = &unk_26F32BAA0;
  v6 = +[LALocalizedString passcodeRemovalRatchetBeginTitle];
  v14[1] = v6;
  v13[2] = &unk_26F32BAB8;
  v7 = +[LALocalizedString passcodeRemovalRatchetCountdownText];
  v14[2] = v7;
  v13[3] = &unk_26F32BAD0;
  v8 = [(LAPSPasscodeChangeAuthorizationOptions *)self->_options calloutReason];
  objc_super v9 = v8;
  if (!v8)
  {
    objc_super v9 = +[LALocalizedString passcodeRemovalRatchetCalloutReason];
  }
  v14[3] = v9;
  v13[4] = &unk_26F32BAE8;
  v10 = [(LAPSPasscodeChangeAuthorizationOptions *)self->_options calloutURL];
  v11 = v10;
  if (!v10)
  {
    v11 = [NSURL URLWithString:@"prefs:root=PASSCODE&path=8"];
  }
  v13[5] = &unk_26F32BB00;
  v14[4] = v11;
  v14[5] = MEMORY[0x263EFFA88];
  v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];
  [(LAPSPasscodeChangeAuthorizerDTOAdapter *)self _authorizeOperationWithIdentifier:@"com.apple.LocalAuthentication.passcode.removal" options:v12 completion:v4];

  if (!v10) {
  if (!v8)
  }
}

- (void)_authorizePasscodeRecoveryWithCompletion:(id)a3
{
}

- (void)_authorizePasscodeVerificationWithCompletion:(id)a3
{
}

- (void)_authorizeOperationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x263F10480];
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithIdentifier:v10];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __95__LAPSPasscodeChangeAuthorizerDTOAdapter__authorizeOperationWithIdentifier_options_completion___block_invoke;
  v14[3] = &unk_26506E7B8;
  id v15 = v11;
  id v16 = v7;
  id v12 = v11;
  id v13 = v7;
  [v12 armWithOptions:v9 completion:v14];
}

uint64_t __95__LAPSPasscodeChangeAuthorizerDTOAdapter__authorizeOperationWithIdentifier_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

@end