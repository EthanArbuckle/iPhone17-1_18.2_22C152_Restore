@interface CDPRecoveryKeyEntryViewModel
- (BOOL)isDataRecoveryFlow;
- (BOOL)isFooterForMismatchRepairFlow;
- (BOOL)isFooterForVerifyFlow;
- (BOOL)isWalrusEnabled;
- (BOOL)mandatesRecoveryKey;
- (BOOL)shouldSuppressCancelButton;
- (BOOL)supportsRKRecovery;
- (CDPContext)context;
- (CDPEscapeOption)custodianRecoveryEscapeOption;
- (CDPEscapeOption)edpRecoveryTokenEscapeOption;
- (CDPRecoveryKeyEntryViewModel)initWithContext:(id)a3 validator:(id)a4;
- (CDPRecoveryKeyEntryViewModel)initWithContext:(id)a3 validator:(id)a4 mode:(int)a5;
- (CDPRemoteValidationEscapeOffer)deleteiCloudDataEscapeOffer;
- (id)completionHandler;
- (id)footerButtonTitle;
- (id)footerLabelText;
- (id)headerSubtitle;
- (id)headerTitle;
- (id)placeholderText;
- (id)recoveryKey;
- (int)mode;
- (void)handleCancel;
- (void)handleForgotRecoveryKeyWithCDPStateError:(int64_t)a3;
- (void)handleNoRecoveryKeyWithCDPStateError:(int64_t)a3;
- (void)processCollectedRecoveryKey:(id)a3 completion:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setCustodianRecoveryEscapeOption:(id)a3;
- (void)setDeleteiCloudDataEscapeOffer:(id)a3;
- (void)setEdpRecoveryTokenEscapeOption:(id)a3;
- (void)setIsFooterForMismatchRepairFlow:(BOOL)a3;
- (void)setIsFooterForVerifyFlow:(BOOL)a3;
- (void)setIsWalrusEnabled:(BOOL)a3;
- (void)setShouldSuppressCancelButton:(BOOL)a3;
@end

@implementation CDPRecoveryKeyEntryViewModel

- (CDPRecoveryKeyEntryViewModel)initWithContext:(id)a3 validator:(id)a4 mode:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(CDPRecoveryKeyEntryViewModel *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    v12->_mode = a5;
    objc_storeStrong((id *)&v12->_validator, a4);
    if ([(CDPRecoveryKeyEntryViewModel *)v12 supportsRKRecovery])
    {
      v12->_shouldSuppressCancelButton = 0;
      p_isFooterForVerifyFlow = &v12->_isFooterForVerifyFlow;
    }
    else
    {
      p_isFooterForVerifyFlow = &v12->_shouldSuppressCancelButton;
    }
    BOOL *p_isFooterForVerifyFlow = 1;
  }

  return v12;
}

- (CDPRecoveryKeyEntryViewModel)initWithContext:(id)a3 validator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CDPRecoveryKeyEntryViewModel *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    if ([(CDPContext *)v10->_context type] == 8)
    {
      v10->_shouldSuppressCancelButton = 0;
      char v11 = 1;
    }
    else
    {
      if ([(CDPContext *)v10->_context type] == 9)
      {
        v10->_shouldSuppressCancelButton = 0;
        char v11 = 1;
        uint64_t v12 = 34;
LABEL_8:
        *((unsigned char *)&v10->super.isa + v12) = v11;
        objc_storeStrong((id *)&v10->_secretValidator, a4);
        v10->_mode = 2;
        goto LABEL_9;
      }
      char v11 = 0;
      v10->_shouldSuppressCancelButton = 1;
    }
    uint64_t v12 = 33;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (id)footerButtonTitle
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v4 = [MEMORY[0x263F825C8] _systemInteractionTintColor];
  uint64_t v5 = *MEMORY[0x263F81500];
  v6 = (void *)MEMORY[0x263F81708];
  uint64_t v7 = *MEMORY[0x263F83570];
  id v8 = [MEMORY[0x263F82B60] mainScreen];
  id v9 = [v8 traitCollection];
  id v10 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v9];
  char v11 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v10, *MEMORY[0x263F814F0], 0);

  int mode = self->_mode;
  if (mode != 2)
  {
    v13 = 0;
    if (mode != 1) {
      goto LABEL_14;
    }
    id v14 = objc_alloc(MEMORY[0x263F086A0]);
    v15 = (void *)MEMORY[0x263F343B8];
    v16 = @"RECOVERY_KEY_CONTINUE_BUTTON_TITLE";
    goto LABEL_13;
  }
  if ([(CDPContext *)self->_context type] == 8)
  {
    id v14 = objc_alloc(MEMORY[0x263F086A0]);
    v15 = (void *)MEMORY[0x263F343B8];
    v16 = @"RECOVERY_KEY_FORGOT_BUTTON_TITLE";
LABEL_13:
    v18 = [v15 builderForKey:v16];
    v19 = [v18 localizedString];
    v13 = (void *)[v14 initWithString:v19 attributes:v11];

    goto LABEL_14;
  }
  if ([(CDPContext *)self->_context type] == 9)
  {
LABEL_12:
    id v14 = objc_alloc(MEMORY[0x263F086A0]);
    v15 = (void *)MEMORY[0x263F343B8];
    v16 = @"DONT_HAVE_RECOVERY_KEY";
    goto LABEL_13;
  }
  if ([(CDPRecoveryKeyEntryViewModel *)self supportsRKRecovery]
    || [(CDPRecoveryKeyEntryViewModel *)self isDataRecoveryFlow])
  {
    v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v17, OS_LOG_TYPE_DEFAULT, "CDPContext supports RK recovery. Adding Don't Have Recovery Key? button in the recovery flow", buf, 2u);
    }

    goto LABEL_12;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)footerLabelText
{
  if (self->_mode != 1)
  {
    v6 = 0;
    goto LABEL_16;
  }
  uint64_t v2 = [(CDPContext *)self->_context type];
  v3 = (void *)MEMORY[0x263F343B8];
  if (v2 == 4)
  {
    v4 = @"CDP_VERIFY_RECOVERY_KEY_FOOTER_LABEL";
    if (([@"CDP_VERIFY_RECOVERY_KEY_FOOTER_LABEL" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      char v5 = 0;
    }
    else
    {
      v4 = [@"CDP_VERIFY_RECOVERY_KEY_FOOTER_LABEL" stringByAppendingString:@"_REBRAND"];
      char v5 = 1;
    }
    id v8 = [v3 builderForKey:v4];
    v6 = [v8 localizedString];

    if ((v5 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_15:

    goto LABEL_16;
  }
  v4 = @"RECOVERY_KEY_FOOTER_LABEL_ENABLE_FLOW";
  if (([@"RECOVERY_KEY_FOOTER_LABEL_ENABLE_FLOW" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v7 = 0;
  }
  else
  {
    v4 = [@"RECOVERY_KEY_FOOTER_LABEL_ENABLE_FLOW" stringByAppendingString:@"_REBRAND"];
    int v7 = 1;
  }
  id v9 = [v3 builderForKey:v4];
  v6 = [v9 localizedString];

  if (v7) {
    goto LABEL_15;
  }
LABEL_16:

  return v6;
}

- (id)headerTitle
{
  if ([(CDPContext *)self->_context type] == 5
    || [(CDPContext *)self->_context type] == 4
    || [(CDPContext *)self->_context type] == 8
    || [(CDPContext *)self->_context type] == 9)
  {
    int v3 = [(CDPRecoveryKeyEntryViewModel *)self mode];
    v4 = (void *)MEMORY[0x263F343B8];
    if (v3 == 1) {
      char v5 = @"RECOVERY_KEY_TITLE";
    }
    else {
      char v5 = @"RECOVERY_KEY_TITLE_VERIFY";
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x263F343B8];
    char v5 = @"RECOVERY_KEY_TITLE_VERIFY_SIGNIN";
  }
  v6 = [v4 builderForKey:v5];
  int v7 = [v6 localizedString];

  return v7;
}

- (id)headerSubtitle
{
  int v3 = [(CDPRecoveryKeyEntryViewModel *)self mode];
  uint64_t v4 = [(CDPContext *)self->_context type];
  uint64_t v5 = v4;
  if (v3 == 1)
  {
    v6 = (void *)MEMORY[0x263F343B8];
    if (v5 == 4) {
      int v7 = @"CDP_VERIFY_RECOVERY_KEY_HEADER_SUBTITLE";
    }
    else {
      int v7 = @"RECOVERY_KEY_SUBTITLE_ENABLE_FLOW";
    }
  }
  else if (v4 == 4)
  {
    v6 = (void *)MEMORY[0x263F343B8];
    int v7 = @"RECOVERY_KEY_SUBTITLE_VERIFY_REGEN_FLOW";
  }
  else
  {
    uint64_t v8 = [(CDPContext *)self->_context type];
    v6 = (void *)MEMORY[0x263F343B8];
    if (v8 == 5) {
      int v7 = @"RECOVERY_KEY_SUBTITLE_VERIFY_ENABLE_FLOW";
    }
    else {
      int v7 = @"RECOVERY_KEY_SUBTITLE_VERIFY_JOIN_FLOW";
    }
  }
  id v9 = [v6 builderForKey:v7];
  id v10 = [v9 localizedString];

  return v10;
}

- (id)placeholderText
{
  uint64_t v2 = [MEMORY[0x263F343B8] builderForKey:@"RECOVERY_KEY_PLACEHOLDER"];
  int v3 = [v2 localizedString];

  return v3;
}

- (id)recoveryKey
{
  return (id)[(CDPRecoveryKeyValidator *)self->_validator generateRecoveryKeyWithError:0];
}

- (void)processCollectedRecoveryKey:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[CDPRecoveryKeyEntryViewModel processCollectedRecoveryKey:completion:]";
    __int16 v19 = 1024;
    int v20 = 132;
    _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke;
  aBlock[3] = &unk_26433CF70;
  aBlock[4] = self;
  id v9 = v7;
  id v16 = v9;
  id v10 = _Block_copy(aBlock);
  char v11 = v10;
  secretValidator = self->_secretValidator;
  if (secretValidator)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke_60;
    v13[3] = &unk_26433D768;
    id v14 = v10;
    [(CDPRemoteDeviceSecretValidatorProtocol *)secretValidator validateRecoveryKey:v6 withCompletion:v13];
  }
  else
  {
    [(CDPRecoveryKeyValidator *)self->_validator confirmRecoveryKey:v6 completion:v10];
  }
}

void __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [*(id *)(a1 + 32) completionHandler];
    char v11 = _Block_copy(v10);
    int v12 = 136315906;
    v13 = "-[CDPRecoveryKeyEntryViewModel processCollectedRecoveryKey:completion:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_debug_impl(&dword_2187CF000, v6, OS_LOG_TYPE_DEBUG, "%s: RK is Valid=%{BOOL}d, validationError=%@, completionHandler=%@", (uint8_t *)&v12, 0x26u);
  }
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) completionHandler];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) completionHandler];
      v8[2](v8, 1, 0);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

uint64_t __71__CDPRecoveryKeyEntryViewModel_processCollectedRecoveryKey_completion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleCancel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDPRecoveryKeyEntryViewModel mode](self, "mode"));
    int v10 = 138412290;
    char v11 = v4;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling the recovery key flow in mode: %@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = [(CDPRecoveryKeyEntryViewModel *)self completionHandler];

  if (v5)
  {
    id v6 = [(CDPRecoveryKeyEntryViewModel *)self completionHandler];
    id v7 = _CDPStateError();
    ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
  }
  secretValidator = self->_secretValidator;
  if (secretValidator)
  {
    id v9 = _CDPStateError();
    [(CDPRemoteDeviceSecretValidatorProtocol *)secretValidator cancelValidationWithError:v9];
  }
}

- (void)handleForgotRecoveryKeyWithCDPStateError:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDPRecoveryKeyEntryViewModel mode](self, "mode"));
    int v10 = 138412546;
    char v11 = v6;
    __int16 v12 = 2048;
    int64_t v13 = a3;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "Forgot Recovery key tapped in mode: %@, error: %ld", (uint8_t *)&v10, 0x16u);
  }
  id v7 = [(CDPRecoveryKeyEntryViewModel *)self completionHandler];

  if (v7)
  {
    uint64_t v8 = [(CDPRecoveryKeyEntryViewModel *)self completionHandler];
    id v9 = _CDPStateError();
    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
  }
}

- (void)handleNoRecoveryKeyWithCDPStateError:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = [(CDPRecoveryKeyEntryViewModel *)self mode];
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "Don't Have Recovery Key? was tapped in account recovery flow. Mode: %d, error: %ld", (uint8_t *)v9, 0x12u);
  }

  id v6 = [(CDPRecoveryKeyEntryViewModel *)self completionHandler];

  if (v6)
  {
    id v7 = [(CDPRecoveryKeyEntryViewModel *)self completionHandler];
    uint64_t v8 = _CDPStateError();
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
  }
}

- (BOOL)supportsRKRecovery
{
  return [(CDPContext *)self->_context idmsMasterKeyRecovery];
}

- (BOOL)mandatesRecoveryKey
{
  return [(CDPContext *)self->_context mandatesRecoveryKey];
}

- (BOOL)isDataRecoveryFlow
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(CDPContext *)self->_context type];
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "cdpContextType = %ld", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type"))) {
    return 1;
  }
  else {
    return objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeRepair:", -[CDPContext type](self->_context, "type"));
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)shouldSuppressCancelButton
{
  return self->_shouldSuppressCancelButton;
}

- (void)setShouldSuppressCancelButton:(BOOL)a3
{
  self->_shouldSuppressCancelButton = a3;
}

- (BOOL)isFooterForVerifyFlow
{
  return self->_isFooterForVerifyFlow;
}

- (void)setIsFooterForVerifyFlow:(BOOL)a3
{
  self->_isFooterForVerifyFlow = a3;
}

- (BOOL)isFooterForMismatchRepairFlow
{
  return self->_isFooterForMismatchRepairFlow;
}

- (void)setIsFooterForMismatchRepairFlow:(BOOL)a3
{
  self->_isFooterForMismatchRepairFlow = a3;
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (CDPEscapeOption)custodianRecoveryEscapeOption
{
  return self->_custodianRecoveryEscapeOption;
}

- (void)setCustodianRecoveryEscapeOption:(id)a3
{
}

- (CDPEscapeOption)edpRecoveryTokenEscapeOption
{
  return self->_edpRecoveryTokenEscapeOption;
}

- (void)setEdpRecoveryTokenEscapeOption:(id)a3
{
}

- (CDPRemoteValidationEscapeOffer)deleteiCloudDataEscapeOffer
{
  return self->_deleteiCloudDataEscapeOffer;
}

- (void)setDeleteiCloudDataEscapeOffer:(id)a3
{
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_deleteiCloudDataEscapeOffer, 0);
  objc_storeStrong((id *)&self->_edpRecoveryTokenEscapeOption, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryEscapeOption, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_secretValidator, 0);

  objc_storeStrong((id *)&self->_validator, 0);
}

@end