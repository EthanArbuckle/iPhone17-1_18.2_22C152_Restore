@interface DummyRemoteDeviceSecretValidator
- (DummyRemoteDeviceSecretValidator)initWithExpectedSecret:(id)a3;
- (id)edpRepairAction;
- (unint64_t)stubbedEDPHealth;
- (unint64_t)supportedEscapeOfferMask;
- (void)approveFromAnotherDeviceWithCompletion:(id)a3;
- (void)repairEDPStateWithContext:(id)a3 completion:(id)a4;
- (void)setEdpRepairAction:(id)a3;
- (void)setStubbedEDPHealth:(unint64_t)a3;
- (void)supportedEscapeOfferMaskCompletion:(id)a3;
- (void)validateEDPIdentitiesWithContext:(id)a3 completion:(id)a4;
- (void)validateEDPRecoveryToken:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4;
- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6;
@end

@implementation DummyRemoteDeviceSecretValidator

- (DummyRemoteDeviceSecretValidator)initWithExpectedSecret:(id)a3
{
  id v5 = a3;
  v6 = [(DummyRemoteDeviceSecretValidator *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expectedString, a3);
  }

  return v7;
}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  dispatch_time_t v10 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__DummyRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke;
  block[3] = &unk_264E27C40;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_after(v10, MEMORY[0x263EF83A0], block);
}

void __79__DummyRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 24)];
  if ((v2 & 1) == 0) {
    ++*(void *)(*(void *)(a1 + 40) + 32);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    BOOL v4 = *(void *)(*(void *)(a1 + 40) + 32) < 3uLL;
    _CDPStateError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, BOOL, id))(v3 + 16))(v3, v2, v4, v5);
  }
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v4 = a4;
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__DummyRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke;
  block[3] = &unk_264E27C68;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

uint64_t __71__DummyRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(result + 16))(result, 1, 0, 0);
  }
  return result;
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 100000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke;
  block[3] = &unk_264E27C68;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_cold_1(v2);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (unint64_t)supportedEscapeOfferMask
{
  if (CFPreferencesGetAppBooleanValue(@"OfferRemoteApproval", @"com.apple.corecdp", 0)) {
    unint64_t v2 = 5;
  }
  else {
    unint64_t v2 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(@"OfferAccountReset", @"com.apple.corecdp", 0)) {
    v2 |= 8uLL;
  }
  if (CFPreferencesGetAppBooleanValue(@"OfferRecoveryKey", @"com.apple.corecdp", 0)) {
    v2 |= 0x20uLL;
  }
  if (CFPreferencesGetAppBooleanValue(@"OfferCustodianRecovery", @"com.apple.corecdp", 0)) {
    v2 |= 0x40uLL;
  }
  if (CFPreferencesGetAppBooleanValue(@"OfferEDPRecoveryToken", @"com.apple.corecdp", 0)) {
    v2 |= 0x100uLL;
  }
  if (!CFPreferencesGetAppBooleanValue(@"ContextTypeRepair", @"com.apple.corecdp", 0)) {
    v2 |= 0x10uLL;
  }
  if (CFPreferencesGetAppIntegerValue(@"NumberOfDevices", @"com.apple.corecdp", 0) == 2) {
    return v2 | 2;
  }
  else {
    return v2;
  }
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, unint64_t))a3 + 2))(v5, [(DummyRemoteDeviceSecretValidator *)self supportedEscapeOfferMask]);
}

- (void)validateEDPIdentitiesWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = dispatch_time(0, 1500000000);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__DummyRemoteDeviceSecretValidator_validateEDPIdentitiesWithContext_completion___block_invoke;
  v8[3] = &unk_264E27C90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x263EF83A0], v8);
}

uint64_t __80__DummyRemoteDeviceSecretValidator_validateEDPIdentitiesWithContext_completion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = [*(id *)(result + 32) stubbedEDPHealth];
    id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v1 + 16);
    uint64_t v4 = MEMORY[0x263EFFA78];
    return v3(v1, v2, v4, 0);
  }
  return result;
}

- (void)repairEDPStateWithContext:(id)a3 completion:(id)a4
{
  id v5 = [(DummyRemoteDeviceSecretValidator *)self edpRepairAction];

  if (v5)
  {
    dispatch_time_t v6 = [(DummyRemoteDeviceSecretValidator *)self edpRepairAction];
    v6[2]();
  }
}

- (void)validateEDPRecoveryToken:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatch_time_t v9 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__DummyRemoteDeviceSecretValidator_validateEDPRecoveryToken_withContext_completion___block_invoke;
  block[3] = &unk_264E27C40;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_after(v9, MEMORY[0x263EF83A0], block);
}

void __84__DummyRemoteDeviceSecretValidator_validateEDPRecoveryToken_withContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 24)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = v2;
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5200);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v5);
  }
}

- (unint64_t)stubbedEDPHealth
{
  return self->_stubbedEDPHealth;
}

- (void)setStubbedEDPHealth:(unint64_t)a3
{
  self->_stubbedEDPHealth = a3;
}

- (id)edpRepairAction
{
  return self->_edpRepairAction;
}

- (void)setEdpRepairAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_edpRepairAction, 0);

  objc_storeStrong((id *)&self->_expectedString, 0);
}

void __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_23C03C000, log, OS_LOG_TYPE_DEBUG, "Faking remote approval success...", v1, 2u);
}

@end