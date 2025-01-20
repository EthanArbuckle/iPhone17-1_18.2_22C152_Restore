@interface CDPDBackupIDMSErrorProvider
- (BOOL)supportsErrorPresentation;
- (id)cooldownErrorWithUnderlyingError:(id)a3;
- (id)globalHardLimitError;
- (id)globalHardLimitErrorWithRecord:(id)a3;
- (id)hardLimitErrorForRecord:(id)a3;
- (id)recordNotFoundErrorWithUnderlyingError:(id)a3;
- (void)handleHardLimitError:(id)a3 completion:(id)a4;
- (void)handleSoftLimitError:(id)a3 completion:(id)a4;
@end

@implementation CDPDBackupIDMSErrorProvider

- (BOOL)supportsErrorPresentation
{
  return 1;
}

- (id)cooldownErrorWithUnderlyingError:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  v6 = [MEMORY[0x263F343B8] builderForKey:@"ACCOUNT_RECOVERY_SOFT_LIMIT_REACHED_TITLE"];
  v7 = [v6 localizedString];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];

  v8 = [MEMORY[0x263F343B8] builderForKey:@"ACCOUNT_RECOVERY_SOFT_LIMIT_REACHED_MESSAGE"];
  v9 = [v8 addSecretType:self->super._prevailingSecret];
  v10 = [v9 localizedString];
  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08338]];

  v11 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  v12 = [v11 localizedString];
  [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08348]];

  if (v4) {
    [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v13 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  v14 = [v13 localizedString];
  v18[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v5 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08340]];

  v16 = _CDPStateError();

  return v16;
}

- (id)globalHardLimitError
{
  v21[2] = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  id v4 = [MEMORY[0x263F343B8] builderForKey:@"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_TITLE"];
  v5 = [v4 localizedString];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];

  v6 = (void *)MEMORY[0x263F343B8];
  v7 = @"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_GLOBAL";
  if (([@"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_GLOBAL" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v8 = 0;
  }
  else
  {
    v7 = [@"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_GLOBAL" stringByAppendingString:@"_REBRAND"];
    int v8 = 1;
  }
  v9 = [v6 builderForKey:v7];
  v10 = [v9 addSecretType:self->super._prevailingSecret];
  v11 = [v10 localizedString];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08338]];

  if (v8) {
  v12 = [MEMORY[0x263F343B8] builderForKey:@"START_ACCOUNT_RECOVERY_BUTTON"];
  }
  v13 = [v12 localizedString];
  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08348]];

  v14 = [MEMORY[0x263F343B8] builderForKey:@"START_ACCOUNT_RECOVERY_BUTTON"];
  v15 = [v14 localizedString];
  v21[0] = v15;
  v16 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
  v17 = [v16 localizedString];
  v21[1] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x263F08340]];

  v19 = _CDPStateError();

  return v19;
}

- (id)globalHardLimitErrorWithRecord:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  v5 = [MEMORY[0x263F343B8] builderForKey:@"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_TITLE"];
  v6 = [v5 localizedString];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08320]];

  v7 = NSString;
  int v8 = (void *)MEMORY[0x263F343B8];
  v9 = @"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_SINGLE";
  if (([@"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_SINGLE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v10 = 0;
  }
  else
  {
    v9 = [@"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_SINGLE" stringByAppendingString:@"_REBRAND"];
    int v10 = 1;
  }
  v11 = [v8 builderForKey:v9];
  v12 = objc_msgSend(v11, "addSecretType:", objc_msgSend(v3, "localSecretType"));
  v13 = [v12 localizedString];
  v14 = [v3 localizedName];

  v15 = [v7 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08338]];

  if (v10) {
  v16 = [MEMORY[0x263F343B8] builderForKey:@"START_ACCOUNT_RECOVERY_BUTTON"];
  }
  v17 = [v16 localizedString];
  [v4 setObject:v17 forKeyedSubscript:*MEMORY[0x263F08348]];

  v18 = [MEMORY[0x263F343B8] builderForKey:@"START_ACCOUNT_RECOVERY_BUTTON"];
  v19 = [v18 localizedString];
  v25[0] = v19;
  v20 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
  v21 = [v20 localizedString];
  v25[1] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [v4 setObject:v22 forKeyedSubscript:*MEMORY[0x263F08340]];

  v23 = _CDPStateError();

  return v23;
}

- (id)hardLimitErrorForRecord:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  v6 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_TITLE"];
  v7 = objc_msgSend(v6, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  int v8 = [v7 localizedString];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];

  v9 = NSString;
  int v10 = [MEMORY[0x263F343B8] builderForKey:@"ACCOUNT_RECOVERY_HARD_LIMIT_REACHED_MESSAGE_MULTI"];
  v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v12 = [v11 addSecretType:self->super._prevailingSecret];
  v13 = [v12 localizedString];
  v14 = [v4 localizedName];

  v15 = [v9 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];
  [v5 setObject:v15 forKeyedSubscript:*MEMORY[0x263F08338]];

  v16 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  v17 = [v16 localizedString];
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x263F08348]];

  v18 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  v19 = [v18 localizedString];
  v23[0] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v5 setObject:v20 forKeyedSubscript:*MEMORY[0x263F08340]];

  v21 = _CDPStateError();

  return v21;
}

- (id)recordNotFoundErrorWithUnderlyingError:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F08608];
  id v3 = _CDPStateError();
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = _CDPStateError();

  return v5;
}

- (void)handleHardLimitError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uiProvider = self->super._uiProvider;
  context = self->super._context;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__CDPDBackupIDMSErrorProvider_handleHardLimitError_completion___block_invoke;
  v12[3] = &unk_26432FAD8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(CDPStateUIProviderInternal *)uiProvider cdpContext:context showError:v10 withCompletion:v12];
}

void __63__CDPDBackupIDMSErrorProvider_handleHardLimitError_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v5 = *MEMORY[0x263F08608];
    uint64_t v6 = *(void *)(a1 + 32);
    id v3 = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F08608];
    v8[0] = *(void *)(a1 + 32);
    id v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  id v4 = _CDPStateError();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)handleSoftLimitError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uiProvider = self->super._uiProvider;
  context = self->super._context;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__CDPDBackupIDMSErrorProvider_handleSoftLimitError_completion___block_invoke;
  v12[3] = &unk_26432FAD8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(CDPStateUIProviderInternal *)uiProvider cdpContext:context showError:v10 withCompletion:v12];
}

void __63__CDPDBackupIDMSErrorProvider_handleSoftLimitError_completion___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v5 = *MEMORY[0x263F08608];
  v6[0] = v1;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = _CDPStateError();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

@end