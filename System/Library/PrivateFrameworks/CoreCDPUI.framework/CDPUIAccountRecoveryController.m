@interface CDPUIAccountRecoveryController
- (BOOL)performingAccountRecovery;
- (id)_accountRecoveryDevicePickerEscapeOfferWithCDPContext:(id)a3;
- (id)_accountRecoveryEscapeOfferForDevice:(id)a3;
- (id)devicePicker:(id)a3 escapeOffersForDevices:(id)a4;
- (void)_presentRemoteSecretControllerWithNewestDevice:(id)a3;
- (void)_setupDevicePickerController:(id)a3;
- (void)devicePicker:(id)a3 didSelectDevice:(id)a4;
@end

@implementation CDPUIAccountRecoveryController

- (void)devicePicker:(id)a3 didSelectDevice:(id)a4
{
  id v5 = a4;
  id v7 = [(CDPUIController *)self _remoteSecretControllerForDevice:v5];
  [v7 setHidesCancelButton:1];
  v6 = [(CDPUIAccountRecoveryController *)self _accountRecoveryEscapeOfferForDevice:v5];

  [v7 setEscapeOffer:v6];
  [(UINavigationController *)self->super._navController pushViewController:v7 animated:1];
}

- (id)devicePicker:(id)a3 escapeOffersForDevices:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F34350];
  id v6 = a3;
  id v7 = [v5 contextForPrimaryAccount];
  v8 = [(CDPUIAccountRecoveryController *)self _accountRecoveryDevicePickerEscapeOfferWithCDPContext:v7];

  [v8 setPresentingViewController:v6];
  v11[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  return v9;
}

- (BOOL)performingAccountRecovery
{
  return 1;
}

- (void)_presentRemoteSecretControllerWithNewestDevice:(id)a3
{
  id v4 = a3;
  id v6 = [(CDPUIController *)self _remoteSecretControllerForNewestDevice:v4];
  id v5 = [(CDPUIAccountRecoveryController *)self _accountRecoveryEscapeOfferForDevice:v4];

  [v6 setEscapeOffer:v5];
  [(CDPUIController *)self _presentRootController:v6 completion:0];
}

- (id)_accountRecoveryEscapeOfferForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [CDPRemoteValidationEscapeOffer alloc];
  id v6 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  id v7 = [(CDPRemoteValidationEscapeOffer *)v5 initWithCDPContext:v6];

  v8 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
  v9 = [v4 modelClass];
  v10 = [v8 addDeviceClass:v9];
  v11 = objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v12 = [v11 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setEscapeOfferName:v12];

  v13 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_HATCH"];
  v14 = [v4 modelClass];
  v15 = [v13 addDeviceClass:v14];
  v16 = objc_msgSend(v15, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v17 = [v16 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v7 setTitle:v17];

  v18 = objc_alloc_init(CDPEscapeOption);
  char v19 = [(CDPRemoteDeviceSecretValidator *)self->super._remoteSecretValidator supportedEscapeOfferMask];
  BOOL v20 = (v19 & 0x40) == 0;
  objc_initWeak(&location, self);
  if ([(NSArray *)self->super._devices count] < 2)
  {
    if ((v19 & 0x40) != 0)
    {
      [(CDPRemoteValidationEscapeOffer *)v7 setTitle:0];
      [(CDPEscapeOption *)v18 setStyle:4];
    }
    else
    {
      v44 = NSString;
      v30 = (void *)MEMORY[0x263F343B8];
      if (([@"ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_SINGLE" containsString:@"REBRAND"] & 1) != 0|| !_os_feature_enabled_impl())
      {
        int v43 = 0;
        v31 = @"ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_SINGLE";
      }
      else
      {
        [@"ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_SINGLE" stringByAppendingString:@"_REBRAND"];
        int v43 = 1;
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v42 = v31;
      v45 = objc_msgSend(v30, "builderForKey:");
      v32 = objc_msgSend(v45, "addSecretType:", objc_msgSend(v4, "localSecretType"));
      v33 = [v4 modelClass];
      v34 = [v32 addDeviceClass:v33];
      v35 = [v34 localizedString];
      v36 = [v4 localizedName];
      v37 = [v44 stringWithValidatedFormat:v35, @"%@", 0, v36 validFormatSpecifiers error];
      [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v37];

      if (v43) {
    }
      }
    v38 = CDPLocalizedString();
    [(CDPEscapeOption *)v18 setTitle:v38];

    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_3;
    v46[3] = &unk_26433D150;
    v29 = &v47;
    objc_copyWeak(&v47, &location);
    [(CDPEscapeOption *)v18 setEscapeAction:v46];
  }
  else
  {
    v21 = NSString;
    v22 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_ANOTHER_DEVICE"];
    v23 = objc_msgSend(v22, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v24 = objc_msgSend(v23, "addSecretType:", -[NSArray prevailingLocalSecretType](self->super._devices, "prevailingLocalSecretType"));
    v25 = [v24 localizedString];
    v26 = [v4 localizedName];
    v27 = [v21 stringWithValidatedFormat:v25, @"%@", 0, v26 validFormatSpecifiers error];
    [(CDPRemoteValidationEscapeOffer *)v7 setMessage:v27];

    v28 = CDPLocalizedString();
    [(CDPEscapeOption *)v18 setTitle:v28];

    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke;
    v48[3] = &unk_26433D150;
    v29 = &v49;
    objc_copyWeak(&v49, &location);
    [(CDPEscapeOption *)v18 setEscapeAction:v48];
    BOOL v20 = 1;
  }
  objc_destroyWeak(v29);
  v39 = objc_alloc_init(CDPEscapeOption);
  v40 = CDPLocalizedString();
  [(CDPEscapeOption *)v39 setTitle:v40];

  [(CDPEscapeOption *)v39 setStyle:1];
  [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v18];
  if (v20) {
    [(CDPRemoteValidationEscapeOffer *)v7 addEscapeOptionsObject:v39];
  }

  objc_destroyWeak(&location);

  return v7;
}

void __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_2;
  v2[3] = &unk_26433D128;
  v2[4] = WeakRetained;
  [WeakRetained _setupDevicePickerController:v2];
}

uint64_t __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) pushViewController:a2 animated:1];
}

void __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_4;
  v2[3] = &unk_26433CC58;
  v2[4] = WeakRetained;
  [WeakRetained _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentDismissUI" completion:v2];
}

void __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

- (void)_setupDevicePickerController:(id)a3
{
  id v6 = (void (**)(id, CDPDevicePickerViewController *))a3;
  id v4 = [[CDPDevicePickerViewController alloc] initWithDevices:self->super._devices delegate:self];
  devicePicker = self->super._devicePicker;
  self->super._devicePicker = v4;

  v6[2](v6, self->super._devicePicker);
}

- (id)_accountRecoveryDevicePickerEscapeOfferWithCDPContext:(id)a3
{
  id v23 = a3;
  id v4 = [[CDPRemoteValidationEscapeOffer alloc] initWithCDPContext:v23];
  uint64_t v5 = [(NSArray *)self->super._devices prevailingLocalSecretType];
  id v6 = [MEMORY[0x263F343B8] builderForKey:@"DEVICE_PICKER_FORGOT_CODE_DIALOG_TITLE"];
  id v7 = [v6 addSecretType:v5];
  v8 = [v7 localizedString];

  v9 = (void *)MEMORY[0x263F343B8];
  v10 = @"ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_MULTI";
  if (([@"ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_MULTI" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v11 = 0;
  }
  else
  {
    v10 = [@"ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_MULTI" stringByAppendingString:@"_REBRAND"];
    int v11 = 1;
  }
  v12 = [v9 builderForKey:v10];
  v13 = [v12 addSecretType:v5];
  v14 = [v13 localizedString];

  if (v11) {
  v15 = [MEMORY[0x263F343B8] builderForKey:@"DEVICE_PICKER_APPROVE_FROM_ANOTHER_DEVICE"];
  }
  v16 = [v15 addSecretType:v5];
  v17 = [v16 localizedString];
  [(CDPRemoteValidationEscapeOffer *)v4 setEscapeOfferName:v17];

  [(CDPRemoteValidationEscapeOffer *)v4 setTitle:v8];
  [(CDPRemoteValidationEscapeOffer *)v4 setMessage:v14];
  objc_initWeak(&location, self);
  v18 = objc_alloc_init(CDPEscapeOption);
  char v19 = CDPLocalizedString();
  [(CDPEscapeOption *)v18 setTitle:v19];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke;
  v24[3] = &unk_26433D150;
  objc_copyWeak(&v25, &location);
  [(CDPEscapeOption *)v18 setEscapeAction:v24];
  BOOL v20 = objc_alloc_init(CDPEscapeOption);
  v21 = CDPLocalizedString();
  [(CDPEscapeOption *)v20 setTitle:v21];

  [(CDPEscapeOption *)v20 setStyle:1];
  [(CDPRemoteValidationEscapeOffer *)v4 addEscapeOptionsObject:v18];
  [(CDPRemoteValidationEscapeOffer *)v4 addEscapeOptionsObject:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v4;
}

void __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke_2;
  v2[3] = &unk_26433CC58;
  v2[4] = WeakRetained;
  [WeakRetained _dismissPresentedViewControllerWithReason:@"com.apple.CoreCDPUI.CDPEnrollmentDismissUI" completion:v2];
}

void __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelValidationWithError:v2];
}

@end