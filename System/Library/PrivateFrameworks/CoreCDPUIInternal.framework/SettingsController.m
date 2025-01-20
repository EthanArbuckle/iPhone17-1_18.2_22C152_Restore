@interface SettingsController
- (BOOL)_didUseSMSVerification;
- (BOOL)_enableWalrus;
- (BOOL)_forceInlineUI;
- (BOOL)_offerRPD;
- (BOOL)_offerRemoteApproval;
- (BOOL)_rkMandate;
- (BOOL)shouldAllowCDPEnrollment;
- (id)_contextForPrimaryAccount;
- (id)_enableCentralizedRPDFlow;
- (id)_enableSwiftUIRemoteSecretFlowSwitchCellSpecifier;
- (id)_enableWalrusSwitchCellSpecifier;
- (id)_fakeDevicesWithExpectedSecret:(id)a3 isNumber:(BOOL)a4 numericLength:(id)a5;
- (id)_recoverAndSyncrhonizeDataSpecifier;
- (id)_recoverStingrayDataSpecifier;
- (id)_recoveryKeySpecifier;
- (id)_recoveryKeySpecifierRegen;
- (id)_walrusSpecifiers;
- (id)_webAccessSpecifiers;
- (id)getUserDefaultEnabled:(id)a3;
- (id)specifiers;
- (id)walrusEnabled;
- (id)webAccessEnabled;
- (void)_loadSpecifiers;
- (void)_recoverAndSyncrhonizeStingrayData:(id)a3;
- (void)_recoverStingrayData:(id)a3;
- (void)_showStatusChangeUIFor:(id)a3;
- (void)_showWalrusChangeUI:(unint64_t)a3;
- (void)_showWebAccessChangeUI:(unint64_t)a3;
- (void)beginEnablementFlow:(id)a3;
- (void)beginFMIPRecovery:(id)a3;
- (void)beginIDMSRecovery:(id)a3;
- (void)beginIDMSRecoveryPrimary:(id)a3;
- (void)beginIDMSRecoveryRK:(id)a3;
- (void)beginIDMSRecoveryWithFailure:(id)a3;
- (void)beginIDMSRecoveryWithRKSkip:(id)a3;
- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5;
- (void)deviceToDeviceAccountUpgradeCardUI:(id)a3;
- (void)enableCDP:(id)a3;
- (void)generateNewRecoveryKey:(id)a3;
- (void)presentAccountRecoveryFlow;
- (void)promptFor4DigitICSC:(id)a3;
- (void)promptFor4DigitRemoteSecret:(id)a3;
- (void)promptFor6DigitICSC:(id)a3;
- (void)promptFor6DigitRemoteSecret:(id)a3;
- (void)promptForComplexICSC:(id)a3;
- (void)promptForCustomAlphanumericRemoteSecret:(id)a3;
- (void)promptForCustomNumericRemoteSecret:(id)a3;
- (void)promptForLocalSecret:(id)a3;
- (void)promptForRandomICSC:(id)a3;
- (void)removeSpinnerFromSpecifier:(id)a3;
- (void)setUserDefaultEnabled:(id)a3 specifier:(id)a4;
- (void)setWalrusStatus:(BOOL)a3;
- (void)setWebAccessStatus:(BOOL)a3;
- (void)showADPLandingPage:(id)a3;
- (void)showDisableWalrusUI:(id)a3;
- (void)showDisableWebAccessUI:(id)a3;
- (void)showEnableWalrusUI:(id)a3;
- (void)showEnableWebAccessUI:(id)a3;
- (void)simulateADPUpsell:(id)a3;
- (void)startBeneficiaryFlow:(id)a3;
- (void)startSpinnerForSpecifier:(id)a3;
- (void)upsellViewModelDidRequestBeginEnablementFlowWithContext:(id)a3;
- (void)upsellViewModelDidRequestCFUDismissalWithContext:(id)a3;
- (void)upsellViewModelDidRequestFlowCancellationWithContext:(id)a3;
- (void)viewDidLoad;
@end

@implementation SettingsController

- (BOOL)shouldAllowCDPEnrollment
{
  Boolean keyExistsAndHasValidFormat = 0;
  char v2 = CFPreferencesGetAppBooleanValue(@"UseCDP", @"com.apple.corecdp", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    char v2 = [v3 fileExistsAtPath:@"/var/db/.AppleiCDPEnroll"];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(SettingsController *)self loadSpecifiersFromPlistName:@"CoreCDPInternalSettings" target:self];
    v6 = (objc_class *)[v5 mutableCopy];
    v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SettingsController;
  [(SettingsController *)&v7 viewDidLoad];
  uint64_t v3 = objc_alloc_init(DummyWalrusStateController);
  walrusStateController = self->_walrusStateController;
  self->_walrusStateController = v3;

  v5 = objc_alloc_init(DummyWebAccessStateController);
  webAccessStatusController = self->_webAccessStatusController;
  self->_webAccessStatusController = v5;

  [(SettingsController *)self _loadSpecifiers];
}

- (void)_loadSpecifiers
{
  uint64_t v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SettingsController__loadSpecifiers__block_invoke;
  block[3] = &unk_264E27D00;
  block[4] = self;
  dispatch_async(v3, block);
}

void __37__SettingsController__loadSpecifiers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFB210]);
  uint64_t v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  v4 = v3;
  if (v3)
  {
    v5 = [v3 accountProperties];
    v6 = [v5 objectForKeyedSubscript:@"personID"];

    int v7 = [MEMORY[0x263F34328] isICDPEnabledForDSID:v6 checkWithServer:1];
  }
  else
  {
    int v7 = 0;
  }
  v8 = [*(id *)(a1 + 32) loadSpecifiersFromPlistName:@"CoreCDPInternalSettings" target:*(void *)(a1 + 32)];
  uint64_t v9 = [v8 mutableCopy];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = (int)*MEMORY[0x263F5FDB8];
  v12 = *(void **)(v10 + v11);
  *(void *)(v10 + v11) = v9;

  v13 = [MEMORY[0x263EFF980] array];
  v14 = (void *)MEMORY[0x263F5FC40];
  if (!v4)
  {
    v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enable iCDP on Sign-In" target:*(void *)(a1 + 32) set:sel_setUserDefaultEnabled_specifier_ get:sel_getUserDefaultEnabled_ detail:0 cell:6 edit:0];
    [v19 setProperty:@"UseCDP" forKey:*MEMORY[0x263F60170]];
    [v19 setProperty:@"com.apple.corecdp" forKey:*MEMORY[0x263F60070]];
    [v19 setProperty:@"com.apple.corecdp.enable.changed" forKey:*MEMORY[0x263F60300]];
    [v19 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60068]];
    [v19 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
LABEL_9:
    [v13 addObject:v19];
    goto LABEL_10;
  }
  v15 = NSString;
  uint64_t v16 = [v4 username];
  v17 = (void *)v16;
  if (!v7)
  {
    v24 = [v15 stringWithFormat:@"Enable iCDP for %@", v16];
    v19 = [v14 preferenceSpecifierNamed:v24 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:13 edit:0];

    [v19 setButtonAction:sel_enableCDP_];
    goto LABEL_9;
  }
  v18 = [v15 stringWithFormat:@"Enabled for %@", v16];
  v19 = [v14 preferenceSpecifierNamed:v18 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

  [v19 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  [v13 addObject:v19];
  v20 = [*(id *)(a1 + 32) _recoverStingrayDataSpecifier];
  [v13 addObject:v20];

  v21 = [*(id *)(a1 + 32) _recoverAndSyncrhonizeDataSpecifier];
  [v13 addObject:v21];

  v22 = [*(id *)(a1 + 32) _recoveryKeySpecifier];
  [v13 addObject:v22];

  v23 = [*(id *)(a1 + 32) _recoveryKeySpecifierRegen];
  [v13 addObject:v23];

LABEL_10:
  v25 = [*(id *)(a1 + 32) _enableWalrusSwitchCellSpecifier];
  [v13 addObject:v25];

  v26 = [*(id *)(a1 + 32) _enableSwiftUIRemoteSecretFlowSwitchCellSpecifier];
  [v13 addObject:v26];

  v27 = [*(id *)(a1 + 32) _enableCentralizedRPDFlow];
  [v13 addObject:v27];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SettingsController__loadSpecifiers__block_invoke_2;
  block[3] = &unk_264E27CD8;
  uint64_t v28 = *(void *)(a1 + 32);
  id v31 = v13;
  uint64_t v32 = v28;
  id v29 = v13;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __37__SettingsController__loadSpecifiers__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = [MEMORY[0x263F5FC40] groupSpecifierWithName:@"iCloud Data Protection"];
    [*(id *)(a1 + 32) insertObject:v2 atIndex:0];
    [*(id *)(a1 + 40) insertContiguousSpecifiers:*(void *)(a1 + 32) atIndex:0];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  v4 = [v3 _walrusSpecifiers];
  [v3 addSpecifiersFromArray:v4];

  v5 = *(void **)(a1 + 40);
  v6 = [v5 _webAccessSpecifiers];
  [v5 addSpecifiersFromArray:v6];

  int v7 = *(void **)(a1 + 40);

  return [v7 reload];
}

- (id)_enableCentralizedRPDFlow
{
  id v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enable CentralizedRPDFlow" target:self set:sel_setUserDefaultEnabled_specifier_ get:sel_getUserDefaultEnabled_ detail:0 cell:6 edit:0];
  [v2 setProperty:@"CentralizedRPDFlow" forKey:*MEMORY[0x263F60170]];
  [v2 setProperty:@"com.apple.corecdp" forKey:*MEMORY[0x263F60070]];
  [v2 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60068]];
  [v2 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];

  return v2;
}

- (id)_enableWalrusSwitchCellSpecifier
{
  id v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enable Walrus" target:self set:sel_setUserDefaultEnabled_specifier_ get:sel_getUserDefaultEnabled_ detail:0 cell:6 edit:0];
  [v2 setProperty:@"EnableWalrus" forKey:*MEMORY[0x263F60170]];
  [v2 setProperty:@"com.apple.corecdp" forKey:*MEMORY[0x263F60070]];
  [v2 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60068]];
  [v2 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];

  return v2;
}

- (id)_enableSwiftUIRemoteSecretFlowSwitchCellSpecifier
{
  id v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enable SwiftUI Remote Secret Flow" target:self set:sel_setUserDefaultEnabled_specifier_ get:sel_getUserDefaultEnabled_ detail:0 cell:6 edit:0];
  [v2 setProperty:@"SwiftUIRemoteSecretFlow" forKey:*MEMORY[0x263F60170]];
  [v2 setProperty:@"com.apple.corecdp" forKey:*MEMORY[0x263F60070]];
  [v2 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60068]];
  [v2 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];

  return v2;
}

- (id)getUserDefaultEnabled:(id)a3
{
  id v3 = a3;
  v4 = [v3 propertyForKey:*MEMORY[0x263F60070]];
  v5 = [v3 propertyForKey:*MEMORY[0x263F60170]];
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t v6 = CFPreferencesGetAppBooleanValue(v5, v4, &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    int v7 = [v3 propertyForKey:*MEMORY[0x263F60068]];
    uint64_t v6 = [v7 BOOLValue];
  }
  v8 = [NSNumber numberWithBool:v6];

  return v8;
}

- (void)setUserDefaultEnabled:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 propertyForKey:*MEMORY[0x263F60070]];
  int v7 = [v5 propertyForKey:*MEMORY[0x263F60170]];
  if (v7)
  {
    if ([v9 BOOLValue]) {
      v8 = v9;
    }
    else {
      v8 = 0;
    }
    CFPreferencesSetAppValue(v7, v8, v6);
    CFPreferencesAppSynchronize(v6);
  }
  else
  {
    NSLog(&cfstr_CorecdpMissing.isa, v5);
  }
}

- (id)_contextForPrimaryAccount
{
  return (id)[MEMORY[0x263F34350] contextForPrimaryAccount];
}

- (void)startSpinnerForSpecifier:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F600A8];
  id v4 = a3;
  [v4 setProperty:MEMORY[0x263EFFA80] forKey:v3];
  id v6 = [v4 propertyForKey:*MEMORY[0x263F602B0]];

  if (v6)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:2];
    [v5 startAnimating];
    [v6 setAccessoryView:v5];
  }
}

- (void)removeSpinnerFromSpecifier:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F600A8];
  id v4 = a3;
  [v4 setProperty:MEMORY[0x263EFFA88] forKey:v3];
  id v6 = [v4 propertyForKey:*MEMORY[0x263F602B0]];

  id v5 = v6;
  if (v6)
  {
    [v6 setAccessoryView:0];
    id v5 = v6;
  }
}

- (id)_recoveryKeySpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [NSString stringWithFormat:@"Generate Recovery Key - New"];
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:sel_generateNewRecoveryKey_];

  return v5;
}

- (id)_recoveryKeySpecifierRegen
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [NSString stringWithFormat:@"Generate Recovery Key - Regen"];
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:sel_generateNewRecoveryKey_];

  return v5;
}

- (id)_walrusSpecifiers
{
  v11[6] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithName:@"Walrus"];
  id v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enabled" target:self set:0 get:sel_walrusEnabled detail:0 cell:6 edit:0];
  id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Test Enable Walrus UI" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v5 setButtonAction:sel_showEnableWalrusUI_];
  id v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Test Disable Walrus UI" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v6 setButtonAction:sel_showDisableWalrusUI_];
  int v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Show ADP Landing Page" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v7 setButtonAction:sel_showADPLandingPage_];
  v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Simulate ADP Upsell CFU" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v8 setButtonAction:sel_simulateADPUpsell_];
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  v11[3] = v6;
  v11[4] = v7;
  v11[5] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:6];

  return v9;
}

- (id)_webAccessSpecifiers
{
  v9[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithName:@"Web Access"];
  id v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enabled" target:self set:0 get:sel_webAccessEnabled detail:0 cell:6 edit:0];
  id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Test Enable Web Access UI" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v5 setButtonAction:sel_showEnableWebAccessUI_];
  id v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Test Disable Web Access UI" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v6 setButtonAction:sel_showDisableWebAccessUI_];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return v7;
}

- (void)generateNewRecoveryKey:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F343F0];
  id v5 = a3;
  id v6 = [v4 alloc];
  int v7 = [(SettingsController *)self _contextForPrimaryAccount];
  v8 = (void *)[v6 initWithContext:v7];

  id v9 = [v5 name];

  LODWORD(v5) = [v9 hasSuffix:@"Regen"];
  uint64_t v10 = [v8 context];
  uint64_t v11 = v10;
  if (v5) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 5;
  }
  [v10 setType:v12];

  id v13 = objc_alloc(MEMORY[0x263F34A10]);
  v14 = [(SettingsController *)self navigationController];
  v15 = (void *)[v13 initWithPresentingViewController:v14];

  objc_msgSend(v15, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  [v8 setUiProvider:v15];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__SettingsController_generateNewRecoveryKey___block_invoke;
  v16[3] = &unk_264E27D28;
  v16[4] = self;
  [v8 generateNewRecoveryKey:v16];
}

void __45__SettingsController_generateNewRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v4 = [*(id *)(a1 + 32) navigationController];
  id v5 = (id)[v4 popToViewController:*(void *)(a1 + 32) animated:1];

  if ([v8 code] != -5307 && objc_msgSend(v8, "code") != -5308)
  {
    id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Failed to generate RK" message:@"Somethng went wrong... File a radar to PEP CoreCDP" preferredStyle:1];
    int v7 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
    [v6 addAction:v7];

    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
}

- (id)_recoverStingrayDataSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [NSString stringWithFormat:@"Restore Local Data"];
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:sel__recoverStingrayData_];

  return v5;
}

- (void)_recoverStingrayData:(id)a3
{
  id v4 = a3;
  [(SettingsController *)self startSpinnerForSpecifier:v4];
  id v5 = objc_alloc(MEMORY[0x263F343F0]);
  id v6 = [(SettingsController *)self _contextForPrimaryAccount];
  int v7 = (void *)[v5 initWithContext:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__SettingsController__recoverStingrayData___block_invoke;
  v9[3] = &unk_264E27D50;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 recoverWithSquirrel:v9];
}

void __43__SettingsController__recoverStingrayData___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  [*(id *)(a1 + 32) removeSpinnerFromSpecifier:*(void *)(a1 + 40)];
  id v5 = (void *)MEMORY[0x263F1C3F8];
  if (a2)
  {
    id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Result" message:@"Recovered" preferredStyle:1];
  }
  else
  {
    int v7 = [NSString stringWithFormat:@"Failed: %@", v9];
    id v6 = [v5 alertControllerWithTitle:@"Result" message:v7 preferredStyle:1];
  }
  id v8 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v6 addAction:v8];

  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

- (id)_recoverAndSyncrhonizeDataSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [NSString stringWithFormat:@"Restore Local Data and Synchronize"];
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:sel__recoverAndSyncrhonizeStingrayData_];

  return v5;
}

- (void)_recoverAndSyncrhonizeStingrayData:(id)a3
{
  id v4 = a3;
  [(SettingsController *)self startSpinnerForSpecifier:v4];
  id v5 = objc_alloc(MEMORY[0x263F343F0]);
  id v6 = [(SettingsController *)self _contextForPrimaryAccount];
  int v7 = (void *)[v5 initWithContext:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SettingsController__recoverAndSyncrhonizeStingrayData___block_invoke;
  v9[3] = &unk_264E27D50;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 recoverAndSynchronizeWithSquirrel:v9];
}

void __57__SettingsController__recoverAndSyncrhonizeStingrayData___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  [*(id *)(a1 + 32) removeSpinnerFromSpecifier:*(void *)(a1 + 40)];
  id v5 = (void *)MEMORY[0x263F1C3F8];
  if (a2)
  {
    id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Result" message:@"Recovered and synchronized" preferredStyle:1];
  }
  else
  {
    int v7 = [NSString stringWithFormat:@"Failed: %@", v9];
    id v6 = [v5 alertControllerWithTitle:@"Result" message:v7 preferredStyle:1];
  }
  id v8 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v6 addAction:v8];

  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

- (void)enableCDP:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFB210]);
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  int v7 = _CDPLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      -[SettingsController enableCDP:](v6, v7);
    }

    CFPreferencesSetAppValue(@"USeCDP", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.corecdp");
    CFPreferencesSynchronize(@"com.apple.corecdp", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    id v9 = objc_alloc_init(MEMORY[0x263F292A8]);
    id v10 = [v6 accountProperties];
    int v7 = [v10 objectForKeyedSubscript:@"personID"];

    [v9 setDSID:v7];
    uint64_t v11 = [v6 username];
    [v9 setUsername:v11];

    [v9 setIsUsernameEditable:0];
    [v9 setPresentingViewController:self];
    [v9 setShouldForceInteractiveAuth:1];
    [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    [v4 setProperty:@"Enabling iCDP..." forKey:*MEMORY[0x263F602D0]];
    [(SettingsController *)self reloadSpecifier:v4];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F29118]) initWithIdentifier:@"com.apple.corecdp.internal_prefs"];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__SettingsController_enableCDP___block_invoke;
    v14[3] = &unk_264E27DA0;
    v14[4] = self;
    id v15 = v9;
    id v13 = v9;
    [v12 authenticateWithContext:v13 completion:v14];
  }
  else if (v8)
  {
    -[SettingsController enableCDP:](v7);
  }
}

void __32__SettingsController_enableCDP___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _CDPLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __32__SettingsController_enableCDP___block_invoke_cold_2(v7);
    }

    id v9 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F343F0]) initWithContext:v9];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F34A10]) initWithPresentingViewController:*(void *)(a1 + 32)];
    [v10 setUiProvider:v11];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __32__SettingsController_enableCDP___block_invoke_192;
    v16[3] = &unk_264E27D78;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v17 = v12;
    uint64_t v18 = v13;
    [v10 handleCloudDataProtectionStateWithCompletion:v16];
  }
  else
  {
    if (v8) {
      __32__SettingsController_enableCDP___block_invoke_cold_1();
    }

    id v9 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"iCDP Not Enabled" message:@"iCDP was not enabled on your account because authentication failed" preferredStyle:1];
    v14 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
    [v9 addAction:v14];

    [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
    CFPreferencesSetAppValue(@"UseCDP", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.corecdp");
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__SettingsController_enableCDP___block_invoke_216;
    block[3] = &unk_264E27D00;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __32__SettingsController_enableCDP___block_invoke_192(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  BOOL v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    int v20 = a2;
    __int16 v21 = 1024;
    int v22 = a3;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_debug_impl(&dword_23C03C000, v8, OS_LOG_TYPE_DEBUG, "State machine finished with shouldCompleteSignIn=%i cloudDataProtectionEnabled=%i error=%@", buf, 0x18u);
  }

  id v9 = (void *)MEMORY[0x263F1C3F8];
  if (a2 && a3)
  {
    id v10 = NSString;
    uint64_t v11 = [*(id *)(a1 + 32) username];
    id v12 = [v10 stringWithFormat:@"iCDP has been successfuly enabled on your account (%@)", v11];
    uint64_t v13 = [v9 alertControllerWithTitle:@"iCDP Enabled!" message:v12 preferredStyle:1];

    if (!v13) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (a2)
  {
    uint64_t v13 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"iCDP Not Enabled", @"iCDP was not enabled on your account, please file a radar to PEP CoreCDP | 1.0", 1 message preferredStyle];
    CFPreferencesSetAppValue(@"UseCDP", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.corecdp");
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __32__SettingsController_enableCDP___block_invoke_205;
    v18[3] = &unk_264E27D00;
    v18[4] = *(void *)(a1 + 40);
    v14 = MEMORY[0x263EF83A0];
    id v15 = v18;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"iCDP Enable Failed", @"Something went wrong trying to enable iCDP on your account, please file a radar to PEP CoreCDP | 1.0", 1 message preferredStyle];
    CFPreferencesSetAppValue(@"UseCDP", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.corecdp");
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__SettingsController_enableCDP___block_invoke_2;
    block[3] = &unk_264E27D00;
    void block[4] = *(void *)(a1 + 40);
    v14 = MEMORY[0x263EF83A0];
    id v15 = block;
  }
  dispatch_async(v14, v15);
  if (v13)
  {
LABEL_11:
    uint64_t v16 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
    [v13 addAction:v16];

    [*(id *)(a1 + 40) presentViewController:v13 animated:1 completion:0];
  }
LABEL_12:
}

uint64_t __32__SettingsController_enableCDP___block_invoke_205(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t __32__SettingsController_enableCDP___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t __32__SettingsController_enableCDP___block_invoke_216(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)_offerRemoteApproval
{
  return CFPreferencesGetAppBooleanValue(@"OfferRemoteApproval", @"com.apple.corecdp", 0) != 0;
}

- (BOOL)_enableWalrus
{
  return CFPreferencesGetAppBooleanValue(@"EnableWalrus", @"com.apple.corecdp", 0) != 0;
}

- (BOOL)_didUseSMSVerification
{
  return CFPreferencesGetAppBooleanValue(@"DidUseSMS", @"com.apple.corecdp", 0) != 0;
}

- (BOOL)_forceInlineUI
{
  return CFPreferencesGetAppBooleanValue(@"ForeceInLine", @"com.apple.corecdp", 0) != 0;
}

- (BOOL)_rkMandate
{
  return CFPreferencesGetAppBooleanValue(@"AccountRecoveryRKMandate", @"com.apple.corecdp", 0) != 0;
}

- (BOOL)_offerRPD
{
  return CFPreferencesGetAppBooleanValue(@"OfferAccountReset", @"com.apple.corecdp", 0) != 0;
}

- (id)_fakeDevicesWithExpectedSecret:(id)a3 isNumber:(BOOL)a4 numericLength:(id)a5
{
  BOOL v6 = a4;
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)CFPreferencesCopyAppValue(@"DevicePlatforms", @"com.apple.corecdp");
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:]();
  }

  id v11 = objc_alloc_init(MEMORY[0x263F34368]);
  id v12 = [NSString stringWithFormat:@"James' iPhone 1 (%@)", v7];
  [v11 setLocalizedName:v12];

  [v11 setHasNumericSecret:v6];
  [v11 setNumericSecretLength:v8];
  if ([v9 integerValue] < 1)
  {
    [v11 setPlatform:1];
    [v11 setModelClass:@"iPhone"];
    [v11 setModel:@"iPhone 6"];
    uint64_t v13 = @"iPhone8,1";
  }
  else
  {
    [v11 setPlatform:2];
    [v11 setModel:@"Mac Pro"];
    [v11 setModelClass:@"MacPro"];
    uint64_t v13 = @"MacPro1,1";
  }
  [v11 setModelVersion:v13];
  id v14 = objc_alloc_init(MEMORY[0x263F34368]);
  id v15 = [NSString stringWithFormat:@"James' iPad 2 (%@)", v7];
  [v14 setLocalizedName:v15];

  [v14 setHasNumericSecret:v6];
  [v14 setNumericSecretLength:v8];
  uint64_t v16 = [v9 integerValue];
  if (v16 == 1) {
    id v17 = @"MacBook Pro";
  }
  else {
    id v17 = @"iPad Air";
  }
  if (v16 == 1) {
    uint64_t v18 = @"MacBookPro11,1";
  }
  else {
    uint64_t v18 = @"iPad4,1";
  }
  if (v16 == 1) {
    v19 = @"MacBookPro";
  }
  else {
    v19 = @"iPad";
  }
  if (v16 == 1) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 1;
  }
  [v14 setModel:v17];
  [v14 setModelVersion:v18];
  [v14 setModelClass:v19];
  [v14 setPlatform:v20];
  __int16 v21 = (void *)CFPreferencesCopyAppValue(@"NumberOfDevices", @"com.apple.corecdp");
  int v22 = v21;
  if (!v21) {
    goto LABEL_22;
  }
  uint64_t v23 = [v21 integerValue];
  if (v23)
  {
    if (v23 == 1)
    {
      v30[0] = v11;
      id v24 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v25 = v30;
      uint64_t v26 = 1;
LABEL_23:
      v27 = [v24 arrayWithObjects:v25 count:v26];
      goto LABEL_25;
    }
LABEL_22:
    v29[0] = v11;
    v29[1] = v14;
    id v24 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v25 = v29;
    uint64_t v26 = 2;
    goto LABEL_23;
  }
  v27 = (void *)MEMORY[0x263EFFA68];
LABEL_25:

  return v27;
}

- (void)promptForLocalSecret:(id)a3
{
  objc_msgSend(MEMORY[0x263F34350], "contextForPrimaryAccount", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc(MEMORY[0x263F34A10]);
  id v5 = [(SettingsController *)self navigationController];
  BOOL v6 = (void *)[v4 initWithPresentingViewController:v5];

  objc_msgSend(v6, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  [v6 cdpContext:v7 promptForLocalSecretWithCompletion:&__block_literal_global_0];
}

void __43__SettingsController_promptForLocalSecret___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __43__SettingsController_promptForLocalSecret___block_invoke_cold_2(v5, v6);
    }
  }
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__SettingsController_promptForLocalSecret___block_invoke_cold_1(v4, v7);
  }
}

- (void)promptFor4DigitRemoteSecret:(id)a3
{
  id v12 = objc_alloc_init(MEMORY[0x263F34350]);
  objc_msgSend(v12, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v4 = [(SettingsController *)self _fakeDevicesWithExpectedSecret:@"1234" isNumber:1 numericLength:&unk_26EFA6CE8];
  id v5 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"1234"];
  id v6 = objc_alloc(MEMORY[0x263F34A10]);
  id v7 = [(SettingsController *)self navigationController];
  id v8 = (CDPUIController *)[v6 initWithPresentingViewController:v7];
  uiController = self->_uiController;
  self->_uiController = v8;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  BOOL v10 = [(SettingsController *)self _offerRemoteApproval];
  id v11 = objc_alloc_init(MEMORY[0x263F343E0]);
  [v11 setContext:v12];
  objc_msgSend(v11, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  [v11 setRpdProbationDuration:0.0];
  [v11 setHasPeersForRemoteApproval:v10];
  [(CDPUIController *)self->_uiController cdpRecoveryFlowContext:v11 promptForRemoteSecretWithDevices:v4 validator:v5];
}

- (void)promptFor6DigitRemoteSecret:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F34350]);
  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x263F34350]);
  }
  id v13 = v4;
  objc_msgSend(v4, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v5 = [(SettingsController *)self _fakeDevicesWithExpectedSecret:@"123456" isNumber:1 numericLength:&unk_26EFA6D00];
  id v6 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"123456"];
  id v7 = objc_alloc(MEMORY[0x263F34A10]);
  id v8 = [(SettingsController *)self navigationController];
  id v9 = (CDPUIController *)[v7 initWithPresentingViewController:v8];
  uiController = self->_uiController;
  self->_uiController = v9;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  if (([(DummyRemoteDeviceSecretValidator *)v6 supportedEscapeOfferMask] & 8) != 0) {
    [v13 setType:2];
  }
  if (([(DummyRemoteDeviceSecretValidator *)v6 supportedEscapeOfferMask] & 0x40) != 0) {
    objc_msgSend(v13, "set_supportsCustodianRecovery:", 1);
  }
  BOOL v11 = [(SettingsController *)self _offerRemoteApproval];
  id v12 = objc_alloc_init(MEMORY[0x263F343E0]);
  [v12 setContext:v13];
  objc_msgSend(v12, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  [v12 setRpdProbationDuration:0.0];
  [v12 setHasPeersForRemoteApproval:v11];
  [(CDPUIController *)self->_uiController cdpRecoveryFlowContext:v12 promptForRemoteSecretWithDevices:v5 validator:v6];
}

- (void)promptForCustomNumericRemoteSecret:(id)a3
{
  id v12 = objc_alloc_init(MEMORY[0x263F34350]);
  objc_msgSend(v12, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v4 = [(SettingsController *)self _fakeDevicesWithExpectedSecret:@"1234567" isNumber:1 numericLength:&unk_26EFA6D18];
  id v5 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"1234567"];
  id v6 = objc_alloc(MEMORY[0x263F34A10]);
  id v7 = [(SettingsController *)self navigationController];
  id v8 = (CDPUIController *)[v6 initWithPresentingViewController:v7];
  uiController = self->_uiController;
  self->_uiController = v8;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  BOOL v10 = [(SettingsController *)self _offerRemoteApproval];
  id v11 = objc_alloc_init(MEMORY[0x263F343E0]);
  [v11 setContext:v12];
  objc_msgSend(v11, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  [v11 setRpdProbationDuration:0.0];
  [v11 setHasPeersForRemoteApproval:v10];
  [(CDPUIController *)self->_uiController cdpRecoveryFlowContext:v11 promptForRemoteSecretWithDevices:v4 validator:v5];
}

- (void)promptForCustomAlphanumericRemoteSecret:(id)a3
{
  id v12 = objc_alloc_init(MEMORY[0x263F34350]);
  objc_msgSend(v12, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v4 = [(SettingsController *)self _fakeDevicesWithExpectedSecret:@"Chuck" isNumber:0 numericLength:&unk_26EFA6D30];
  id v5 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"Chuck"];
  id v6 = objc_alloc(MEMORY[0x263F34A10]);
  id v7 = [(SettingsController *)self navigationController];
  id v8 = (CDPUIController *)[v6 initWithPresentingViewController:v7];
  uiController = self->_uiController;
  self->_uiController = v8;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  BOOL v10 = [(SettingsController *)self _offerRemoteApproval];
  id v11 = objc_alloc_init(MEMORY[0x263F343E0]);
  [v11 setContext:v12];
  objc_msgSend(v11, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  [v11 setRpdProbationDuration:0.0];
  [v11 setHasPeersForRemoteApproval:v10];
  [(CDPUIController *)self->_uiController cdpRecoveryFlowContext:v11 promptForRemoteSecretWithDevices:v4 validator:v5];
}

- (void)promptFor4DigitICSC:(id)a3
{
  id v9 = objc_alloc_init(MEMORY[0x263F34350]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v4 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"1234"];
  id v5 = objc_alloc(MEMORY[0x263F34A10]);
  id v6 = [(SettingsController *)self navigationController];
  id v7 = (CDPUIController *)[v5 initWithPresentingViewController:v6];
  uiController = self->_uiController;
  self->_uiController = v7;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  [(CDPUIController *)self->_uiController cdpContext:v9 promptForICSCWithIsNumeric:1 numericLength:&unk_26EFA6CE8 isRandom:0 validator:v4];
}

- (void)promptFor6DigitICSC:(id)a3
{
  id v9 = objc_alloc_init(MEMORY[0x263F34350]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v4 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"123456"];
  id v5 = objc_alloc(MEMORY[0x263F34A10]);
  id v6 = [(SettingsController *)self navigationController];
  id v7 = (CDPUIController *)[v5 initWithPresentingViewController:v6];
  uiController = self->_uiController;
  self->_uiController = v7;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  [(CDPUIController *)self->_uiController cdpContext:v9 promptForICSCWithIsNumeric:1 numericLength:&unk_26EFA6D00 isRandom:0 validator:v4];
}

- (void)promptForComplexICSC:(id)a3
{
  id v9 = objc_alloc_init(MEMORY[0x263F34350]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v4 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"Chuck"];
  id v5 = objc_alloc(MEMORY[0x263F34A10]);
  id v6 = [(SettingsController *)self navigationController];
  id v7 = (CDPUIController *)[v5 initWithPresentingViewController:v6];
  uiController = self->_uiController;
  self->_uiController = v7;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  [(CDPUIController *)self->_uiController cdpContext:v9 promptForICSCWithIsNumeric:0 numericLength:0 isRandom:0 validator:v4];
}

- (void)promptForRandomICSC:(id)a3
{
  id v9 = objc_alloc_init(MEMORY[0x263F34350]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  id v4 = [[DummyRemoteDeviceSecretValidator alloc] initWithExpectedSecret:@"Chuck"];
  id v5 = objc_alloc(MEMORY[0x263F34A10]);
  id v6 = [(SettingsController *)self navigationController];
  id v7 = (CDPUIController *)[v5 initWithPresentingViewController:v6];
  uiController = self->_uiController;
  self->_uiController = v7;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  [(CDPUIController *)self->_uiController cdpContext:v9 promptForICSCWithIsNumeric:0 numericLength:0 isRandom:1 validator:v4];
}

- (void)beginIDMSRecoveryRK:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34A10]);
  id v5 = [(SettingsController *)self navigationController];
  id v6 = (CDPUIController *)[v4 initWithPresentingViewController:v5];
  uiController = self->_uiController;
  self->_uiController = v6;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  id v8 = [(SettingsController *)self _contextForPrimaryAccount];
  [v8 setIdmsMasterKeyRecovery:1];
  objc_msgSend(v8, "setMandatesRecoveryKey:", -[SettingsController _rkMandate](self, "_rkMandate"));
  id v9 = (void *)[objc_alloc(MEMORY[0x263F343D8]) initWithContext:v8];
  [v9 setUiProvider:self->_uiController];
  [v9 setAuthProvider:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__SettingsController_beginIDMSRecoveryRK___block_invoke;
  v10[3] = &unk_264E27DE8;
  v10[4] = self;
  [v9 performRecovery:v10];
}

void __42__SettingsController_beginIDMSRecoveryRK___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F1C3F8];
  id v6 = NSString;
  id v7 = a2;
  id v8 = [v6 stringWithFormat:@"Recovered: %@. Error: %ld", v7, objc_msgSend(a3, "code")];

  id v10 = [v5 alertControllerWithTitle:@"Failure" message:v8 preferredStyle:1];

  id v9 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:2 handler:0];
  [v10 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
}

- (void)beginIDMSRecoveryWithRKSkip:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34A10]);
  id v5 = [(SettingsController *)self navigationController];
  id v6 = (CDPUIController *)[v4 initWithPresentingViewController:v5];
  uiController = self->_uiController;
  self->_uiController = v6;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  id v8 = [(SettingsController *)self _contextForPrimaryAccount];
  [v8 setIdmsMasterKeyRecovery:1];
  objc_msgSend(v8, "setMandatesRecoveryKey:", -[SettingsController _rkMandate](self, "_rkMandate"));
  id v9 = (void *)[objc_alloc(MEMORY[0x263F343D8]) initWithContext:v8];
  [v9 setUiProvider:self->_uiController];
  [v9 setAuthProvider:self];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F349B8]) initWithConnection:0 entitlements:8 clientType:0];
  id v11 = objc_alloc(MEMORY[0x263F343F8]);
  id v12 = [v9 uiProvider];
  id v13 = (void *)[v11 initWithUIProvider:v12];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__SettingsController_beginIDMSRecoveryWithRKSkip___block_invoke;
  v14[3] = &unk_264E27DE8;
  v14[4] = self;
  [v10 performRecoveryWithContext:v8 uiProvider:v13 authProvider:0 completion:v14];
}

void __50__SettingsController_beginIDMSRecoveryWithRKSkip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F1C3F8];
  id v6 = NSString;
  id v7 = a2;
  id v8 = [v6 stringWithFormat:@"Recovered: %@. Error: %ld", v7, objc_msgSend(a3, "code")];

  id v10 = [v5 alertControllerWithTitle:@"Failure" message:v8 preferredStyle:1];

  id v9 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:2 handler:0];
  [v10 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  id v5 = a5;
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SettingsController_cdpContext_verifyMasterKey_completion___block_invoke;
  block[3] = &unk_264E27C68;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __60__SettingsController_cdpContext_verifyMasterKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginIDMSRecovery:(id)a3
{
  id v4 = [CDPRecoveryTestController alloc];
  id v5 = [(SettingsController *)self _fakeDevicesWithExpectedSecret:@"1234567" isNumber:1 numericLength:&unk_26EFA6D18];
  dispatch_time_t v6 = [(SettingsController *)self navigationController];
  id v7 = [(CDPRecoveryTestController *)v4 initWithDevices:v5 andNavigationController:v6];
  recoveryTestController = self->_recoveryTestController;
  self->_recoveryTestController = v7;

  id v9 = self->_recoveryTestController;

  [(CDPRecoveryTestController *)v9 beginIDMSRecoveryFlow];
}

- (void)beginFMIPRecovery:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = [(SettingsController *)self _contextForPrimaryAccount];
  id v5 = objc_alloc_init(MEMORY[0x263F292A8]);
  dispatch_time_t v6 = [(id)v12[5] dsid];
  id v7 = [v6 stringValue];
  [v5 setDSID:v7];

  id v8 = [(id)v12[5] appleID];
  [v5 setUsername:v8];

  [v5 setIsUsernameEditable:0];
  [v5 setPresentingViewController:self];
  [v5 setShouldForceInteractiveAuth:1];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F29118]) initWithIdentifier:@"com.apple.corecdp.internal_prefs"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__SettingsController_beginFMIPRecovery___block_invoke;
  v10[3] = &unk_264E27E10;
  v10[4] = self;
  void v10[5] = &v11;
  [v9 authenticateWithContext:v5 completion:v10];

  _Block_object_dispose(&v11, 8);
}

void __40__SettingsController_beginFMIPRecovery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    dispatch_time_t v6 = (objc_class *)MEMORY[0x263F34350];
    id v7 = a2;
    uint64_t v8 = [[v6 alloc] initWithAuthenticationResults:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setGuestMode:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setFindMyiPhoneUUID:@"1234"];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F343D8]) initWithContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 1408);
    *(void *)(v12 + 1408) = v11;

    id v14 = (void *)[objc_alloc(MEMORY[0x263F34A10]) initWithPresentingViewController:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 1408) setUiProvider:v14];
    id v15 = *(void **)(*(void *)(a1 + 32) + 1408);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__SettingsController_beginFMIPRecovery___block_invoke_2;
    v18[3] = &unk_264E27DA0;
    id v16 = v5;
    uint64_t v17 = *(void *)(a1 + 32);
    id v19 = v16;
    uint64_t v20 = v17;
    [v15 performRecovery:v18];
  }
}

void __40__SettingsController_beginFMIPRecovery___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F34270]];

  id v4 = (void *)MEMORY[0x263F1C3F8];
  if (v3)
  {
    id v7 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Success" message:@"FMIP present" preferredStyle:1];
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"FMIP are missing, error: %@", *(void *)(a1 + 32)];
    id v7 = [v4 alertControllerWithTitle:@"Failure" message:v5 preferredStyle:1];
  }
  dispatch_time_t v6 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:2 handler:0];
  [v7 addAction:v6];

  [*(id *)(a1 + 40) presentViewController:v7 animated:1 completion:0];
}

- (void)beginIDMSRecoveryPrimary:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = [(SettingsController *)self _contextForPrimaryAccount];
  id v5 = objc_alloc_init(MEMORY[0x263F292A8]);
  dispatch_time_t v6 = [(id)v12[5] dsid];
  id v7 = [v6 stringValue];
  [v5 setDSID:v7];

  uint64_t v8 = [(id)v12[5] appleID];
  [v5 setUsername:v8];

  [v5 setIsUsernameEditable:0];
  [v5 setPresentingViewController:self];
  [v5 setShouldForceInteractiveAuth:1];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F29118]) initWithIdentifier:@"com.apple.corecdp.internal_prefs"];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke;
  v10[3] = &unk_264E27E10;
  v10[4] = self;
  void v10[5] = &v11;
  [v9 authenticateWithContext:v5 completion:v10];

  _Block_object_dispose(&v11, 8);
}

void __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    dispatch_time_t v6 = (objc_class *)MEMORY[0x263F34350];
    id v7 = a2;
    uint64_t v8 = [[v6 alloc] initWithAuthenticationResults:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIdmsRecovery:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setGuestMode:1];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F343D8]) initWithContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 1408);
    *(void *)(v12 + 1408) = v11;

    id v14 = (void *)[objc_alloc(MEMORY[0x263F34A08]) initWithPresentingViewController:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 1408) setUiProvider:v14];
    id v15 = *(void **)(*(void *)(a1 + 32) + 1408);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke_2;
    v18[3] = &unk_264E27DA0;
    id v16 = v5;
    uint64_t v17 = *(void *)(a1 + 32);
    id v19 = v16;
    uint64_t v20 = v17;
    [v15 performRecovery:v18];
  }
}

void __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 objectForKeyedSubscript:*MEMORY[0x263F34290]];
  if (v3
    && (id v4 = (void *)v3,
        [v10 objectForKeyedSubscript:*MEMORY[0x263F34288]],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    dispatch_time_t v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Success" message:@"PRK + MID present" preferredStyle:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F1C3F8];
    uint64_t v8 = [NSString stringWithFormat:@"PRK + MID are missing, error: %@", *(void *)(a1 + 32)];
    dispatch_time_t v6 = [v7 alertControllerWithTitle:@"Failure" message:v8 preferredStyle:1];
  }
  uint64_t v9 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:2 handler:0];
  [v6 addAction:v9];

  [*(id *)(a1 + 40) presentViewController:v6 animated:1 completion:0];
}

- (void)beginIDMSRecoveryWithFailure:(id)a3
{
  id v4 = [CDPRecoveryTestController alloc];
  id v5 = [(SettingsController *)self _fakeDevicesWithExpectedSecret:@"1234567" isNumber:1 numericLength:&unk_26EFA6D18];
  dispatch_time_t v6 = [(SettingsController *)self navigationController];
  id v7 = [(CDPRecoveryTestController *)v4 initWithDevices:v5 andNavigationController:v6];
  recoveryTestController = self->_recoveryTestController;
  self->_recoveryTestController = v7;

  uint64_t v9 = self->_recoveryTestController;

  [(CDPRecoveryTestController *)v9 beginIDMSRecoveryFlowWithSecretFailure];
}

- (void)deviceToDeviceAccountUpgradeCardUI:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34A18]);
  id v5 = [MEMORY[0x263F34328] sharedInstance];
  dispatch_time_t v6 = [v5 primaryAccountAltDSID];
  id v8 = (id)[v4 initWithAltDSID:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:v8];
  [v8 setDeviceToDeviceEncryptionUpgradeUIStyle:1];
  [v8 setDeviceToDeviceEncryptionUpgradeType:0];
  [v8 setFeatureName:@"Account Upgrade Flow - Card UI"];
  [v8 setPresentingViewController:self];
  [v7 performDeviceToDeviceEncryptionStateRepairWithCompletion:0];
}

- (void)startBeneficiaryFlow:(id)a3
{
  id v10 = objc_alloc_init(MEMORY[0x263F34350]);
  id v4 = objc_alloc_init(MEMORY[0x263F08C38]);
  [v10 setBeneficiaryIdentifier:v4];

  id v5 = objc_msgSend(@"ABCD", "aaf_toBase64DecodedData");
  [v10 setBeneficiaryWrappedKeyData:v5];

  id v6 = objc_alloc(MEMORY[0x263F34A10]);
  id v7 = [(SettingsController *)self navigationController];
  id v8 = (CDPUIController *)[v6 initWithPresentingViewController:v7];
  uiController = self->_uiController;
  self->_uiController = v8;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:[(SettingsController *)self _forceInlineUI]];
  [(CDPUIController *)self->_uiController cdpContext:v10 promptForBeneficiaryAccessKeyWithCompletion:&__block_literal_global_348];
}

- (void)_showStatusChangeUIFor:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F34A28];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithModel:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SettingsController__showStatusChangeUIFor___block_invoke;
  v8[3] = &unk_264E27E58;
  v8[4] = self;
  [v6 setUserActionCallback:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SettingsController__showStatusChangeUIFor___block_invoke_2;
  v7[3] = &unk_264E27E80;
  v7[4] = self;
  [v6 setCompletionCallback:v7];
  [v6 presentWithViewController:self presentationType:2];
}

void __45__SettingsController__showStatusChangeUIFor___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = @"Approved";
  }
  else {
    uint64_t v3 = @"Declined";
  }
  id v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"User choice callback made" message:v3 preferredStyle:1];
  id v4 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v5 addAction:v4];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t __45__SettingsController__showStatusChangeUIFor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reload];
}

- (void)_showWalrusChangeUI:(unint64_t)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F34A30]) initWithTargetStatus:a3 statusProvider:self->_walrusStateController statusUpdater:self->_walrusStateController];
  [(SettingsController *)self _showStatusChangeUIFor:v4];
}

- (void)showEnableWalrusUI:(id)a3
{
}

- (void)showDisableWalrusUI:(id)a3
{
}

- (void)_showWebAccessChangeUI:(unint64_t)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F34A40]) initWithTargetStatus:a3 statusProvider:self->_webAccessStatusController statusUpdater:self->_webAccessStatusController walrusStatusProvider:self->_walrusStateController];
  [(SettingsController *)self _showStatusChangeUIFor:v4];
}

- (void)showEnableWebAccessUI:(id)a3
{
}

- (void)showDisableWebAccessUI:(id)a3
{
}

- (id)webAccessEnabled
{
  id v2 = NSNumber;
  BOOL v3 = [(DummyWebAccessStateController *)self->_webAccessStatusController webAccessStatus:0] == 1;

  return (id)[v2 numberWithInt:v3];
}

- (void)setWebAccessStatus:(BOOL)a3
{
  webAccessStatusController = self->_webAccessStatusController;
  if (a3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [(DummyWebAccessStateController *)webAccessStatusController updateWebAccessStatus:v4 completion:&__block_literal_global_365];
}

- (id)walrusEnabled
{
  id v2 = NSNumber;
  BOOL v3 = [(DummyWalrusStateController *)self->_walrusStateController walrusStatus:0] == 1;

  return (id)[v2 numberWithInt:v3];
}

- (void)setWalrusStatus:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = [(SettingsController *)self _contextForPrimaryAccount];
  [(DummyWalrusStateController *)self->_walrusStateController updateWalrusStatus:v4 authenticatedContext:v5 completion:&__block_literal_global_367];
}

- (void)showADPLandingPage:(id)a3
{
  id v7 = [(SettingsController *)self _contextForPrimaryAccount];
  id v4 = objc_alloc_init(MEMORY[0x263F34A38]);
  id v5 = [v4 makeSwiftUIViewWithCdpContext:v7 advancedDataProtectionViewModelDelegate:self presentingViewController:self];
  id v6 = [(SettingsController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)simulateADPUpsell:(id)a3
{
  id v4 = [(SettingsController *)self _contextForPrimaryAccount];
  id v5 = objc_alloc_init(MEMORY[0x263F34A38]);
  id v6 = [MEMORY[0x263F29270] sharedBag];
  id v7 = [MEMORY[0x263F29218] sharedNetworkObserver];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__SettingsController_simulateADPUpsell___block_invoke;
  v8[3] = &unk_264E27EC8;
  v8[4] = self;
  [v5 makeSwiftUIUpsellViewWithCDPContext:v4 urlBag:v6 networkObserver:v7 viewModelDelegate:self completion:v8];
}

uint64_t __40__SettingsController_simulateADPUpsell___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

- (void)beginEnablementFlow:(id)a3
{
  id v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Began Enablement Flow" message:0 preferredStyle:1];
  id v4 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v5 addAction:v4];

  [(SettingsController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)presentAccountRecoveryFlow
{
  id v4 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Account Recovery Flow" message:0 preferredStyle:1];
  BOOL v3 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v4 addAction:v3];

  [(SettingsController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)upsellViewModelDidRequestBeginEnablementFlowWithContext:(id)a3
{
  id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Began Enablement Flow" message:0 preferredStyle:1];
  id v4 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v6 addAction:v4];

  id v5 = [(SettingsController *)self presentedViewController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)upsellViewModelDidRequestCFUDismissalWithContext:(id)a3
{
  id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Requested CFU dismissal" message:0 preferredStyle:1];
  id v4 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v6 addAction:v4];

  id v5 = [(SettingsController *)self presentedViewController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)upsellViewModelDidRequestFlowCancellationWithContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccessStatusController, 0);
  objc_storeStrong((id *)&self->_walrusStateController, 0);
  objc_storeStrong((id *)&self->_recoveryController, 0);
  objc_storeStrong((id *)&self->_recoveryTestController, 0);

  objc_storeStrong((id *)&self->_uiController, 0);
}

- (void)enableCDP:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23C03C000, log, OS_LOG_TYPE_DEBUG, "No primary account present, not running CDP state machine", v1, 2u);
}

- (void)enableCDP:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 username];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23C03C000, a2, v4, "Primary account is present (%@), will try to auth", v5);
}

void __32__SettingsController_enableCDP___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23C03C000, v0, v1, "Authentication failed with error %@", v2);
}

void __32__SettingsController_enableCDP___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_23C03C000, log, OS_LOG_TYPE_DEBUG, "Authentication succeeded, starting up the state machine", v1, 2u);
}

- (void)_fakeDevicesWithExpectedSecret:isNumber:numericLength:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23C03C000, v0, v1, "Platforms: %@", v2);
}

void __43__SettingsController_promptForLocalSecret___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 validatedSecret];
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 1024;
  int v8 = [a1 secretType];
  _os_log_debug_impl(&dword_23C03C000, a2, OS_LOG_TYPE_DEBUG, "User entered secret %@ of type %ul", (uint8_t *)&v5, 0x12u);
}

void __43__SettingsController_promptForLocalSecret___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23C03C000, a2, v4, "Error when collecting local secret: %@", v5);
}

@end