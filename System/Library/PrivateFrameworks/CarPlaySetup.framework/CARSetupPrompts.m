@interface CARSetupPrompts
+ (id)allowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4;
+ (id)assetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5;
+ (id)assetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5;
+ (id)bluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5;
+ (id)bluetoothContactsSyncPromptWithResponseHandler:(id)a3;
+ (id)bluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5;
+ (id)connectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5;
+ (id)enhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4;
+ (id)useWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5;
+ (id)waitingPrompt;
@end

@implementation CARSetupPrompts

+ (id)bluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5
{
  v62[4] = *MEMORY[0x263EF8340];
  id v56 = a5;
  v7 = (objc_class *)MEMORY[0x263F62378];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"BLUETOOTH_PAIRING_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v10 setTitle:v12];
  v13 = NSString;
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"BLUETOOTH_PAIRING_CARD_MESSAGE_IPHONE_%@" value:&stru_26FDB85C0 table:@"Localizable"];

  v57 = objc_msgSend(v13, "stringWithFormat:", v15, v9);

  [v10 setSubtitle:v57];
  [v10 setDismissalType:2];
  v16 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];

  uint64_t v17 = [v16 length];
  v55 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:36.0 weight:*MEMORY[0x263F1D338]];
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x263F1C238], v55, 0, v17);
  v53 = v16;
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x263F1C248], &unk_26FDBAA18, 0, v17);
  id v54 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v54 setAlignment:1];
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x263F1C268], v54, 0, v17);
  id v18 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v18 setAttributedText:v16];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  v51 = v10;
  v19 = [v10 contentView];
  [v19 addSubview:v18];

  v20 = [v10 contentView];
  v21 = [v20 mainContentGuide];

  v46 = (void *)MEMORY[0x263F08938];
  v50 = [v18 topAnchor];
  v49 = [v21 topAnchor];
  v48 = [v50 constraintEqualToSystemSpacingBelowAnchor:v49 multiplier:1.0];
  v62[0] = v48;
  v47 = [v21 bottomAnchor];
  v22 = [v18 bottomAnchor];
  v23 = [v47 constraintEqualToSystemSpacingBelowAnchor:v22 multiplier:1.0];
  v62[1] = v23;
  v24 = [v18 centerXAnchor];
  v52 = v21;
  v25 = [v21 centerXAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v62[2] = v26;
  v27 = [v18 widthAnchor];
  v28 = [v21 widthAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v62[3] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:4];
  [v46 activateConstraints:v30];

  v31 = (void *)MEMORY[0x263F62360];
  v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v33 = [v32 localizedStringForKey:@"BLUETOOTH_PAIRING_CARD_PAIR" value:&stru_26FDB85C0 table:@"Localizable"];

  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke;
  v60[3] = &unk_265276E28;
  id v34 = v56;
  id v61 = v34;
  v35 = [v31 actionWithTitle:v33 style:0 handler:v60];
  id v36 = (id)[v51 addAction:v35];

  v37 = (void *)MEMORY[0x263F62360];
  v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"BLUETOOTH_PAIRING_CARD_CANCEL" value:&stru_26FDB85C0 table:@"Localizable"];

  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke_2;
  v58[3] = &unk_265276E28;
  id v59 = v34;
  id v40 = v34;
  v41 = [v37 actionWithTitle:v39 style:1 handler:v58];
  id v42 = (id)[v51 addAction:v41];

  v43 = [v51 view];
  v44 = [MEMORY[0x263F1C550] labelColor];
  [v43 setTintColor:v44];

  return v51;
}

uint64_t __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (id)bluetoothContactsSyncPromptWithResponseHandler:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F62378]);
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BLUETOOTH_CONTACTS_SYNC_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v4 setTitle:v6];
  v7 = NSString;
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BLUETOOTH_CONTACTS_SYNC_MESSAGE" value:&stru_26FDB85C0 table:@"Localizable"];

  id v10 = [v7 stringWithFormat:v9];

  [v4 setSubtitle:v10];
  [v4 setDismissalType:2];
  v11 = (void *)MEMORY[0x263F62360];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"BLUETOOTH_CONTACTS_SYNC_ALLOW" value:&stru_26FDB85C0 table:@"Localizable"];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke;
  v31[3] = &unk_265276E28;
  id v14 = v3;
  id v32 = v14;
  v15 = [v11 actionWithTitle:v13 style:0 handler:v31];
  id v16 = (id)[v4 addAction:v15];

  uint64_t v17 = (void *)MEMORY[0x263F62360];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"BLUETOOTH_CONTACTS_SYNC_DONT_ALLOW" value:&stru_26FDB85C0 table:@"Localizable"];

  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke_2;
  v29 = &unk_265276E28;
  id v30 = v14;
  id v20 = v14;
  v21 = [v17 actionWithTitle:v19 style:1 handler:&v26];
  id v22 = (id)objc_msgSend(v4, "addAction:", v21, v26, v27, v28, v29);

  v23 = [v4 view];
  v24 = [MEMORY[0x263F1C550] labelColor];
  [v23 setTintColor:v24];

  return v4;
}

uint64_t __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (id)bluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263F62378]);
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"BLUETOOTH_FAILED_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v9 setTitle:v11];
  if (v6)
  {
    v12 = NSString;
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = v13;
    v15 = @"BLUETOOTH_FAILED_MESSAGE_TIMEOUT";
  }
  else
  {
    v12 = NSString;
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = v13;
    if (v7)
    {
      id v16 = [v13 localizedStringForKey:@"BLUETOOTH_FAILED_MESSAGE_GENERIC_%@" value:&stru_26FDB85C0 table:@"Localizable"];

      objc_msgSend(v12, "stringWithFormat:", v16, v7);
      goto LABEL_7;
    }
    v15 = @"BLUETOOTH_FAILED_MESSAGE_GENERIC";
  }
  id v16 = [v13 localizedStringForKey:v15 value:&stru_26FDB85C0 table:@"Localizable"];

  objc_msgSend(v12, "stringWithFormat:", v16, v29);
  uint64_t v17 = LABEL_7:;

  [v9 setSubtitle:v17];
  [v9 setDismissalType:2];
  id v18 = (void *)MEMORY[0x263F1C6B0];
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v20 = [v18 imageNamed:@"Connection_Failure" inBundle:v19 withConfiguration:0];

  v21 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v20];
  objc_msgSend(v9, "carSetup_addMainContentCenteredView:size:", v21, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  id v22 = (void *)MEMORY[0x263F62360];
  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"BLUETOOTH_FAILED_OK" value:&stru_26FDB85C0 table:@"Localizable"];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __81__CARSetupPrompts_bluetoothFailedPromptForVehicleName_isTimeout_responseHandler___block_invoke;
  v30[3] = &unk_265276E28;
  id v31 = v8;
  id v25 = v8;
  uint64_t v26 = [v22 actionWithTitle:v24 style:0 handler:v30];
  id v27 = (id)[v9 addAction:v26];

  return v9;
}

uint64_t __81__CARSetupPrompts_bluetoothFailedPromptForVehicleName_isTimeout_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)waitingPrompt
{
  v22[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F62378]);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BLUETOOTH_PAIRING_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v2 setTitle:v4];
  [v2 setDismissalType:2];
  v5 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:101];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v6 = [v2 contentView];
  [v6 addSubview:v5];

  id v18 = v2;
  id v7 = [v2 contentView];
  id v8 = [v7 mainContentGuide];

  v19 = (void *)MEMORY[0x263F08938];
  v21 = [v5 topAnchor];
  id v20 = [v8 topAnchor];
  id v9 = [v21 constraintEqualToSystemSpacingBelowAnchor:v20 multiplier:1.0];
  v22[0] = v9;
  id v10 = [v8 bottomAnchor];
  v11 = [v5 bottomAnchor];
  v12 = [v10 constraintEqualToSystemSpacingBelowAnchor:v11 multiplier:1.0];
  v22[1] = v12;
  v13 = [v5 centerXAnchor];
  id v14 = [v8 centerXAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v22[2] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  [v19 activateConstraints:v16];

  [v5 startAnimating];
  return v18;
}

+ (id)allowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F62378]);
  if (v5)
  {
    id v8 = NSString;
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"ALLOW_WHILE_LOCKED_CARD_TITLE_%@" value:&stru_26FDB85C0 table:@"Localizable"];

    objc_msgSend(v8, "stringWithFormat:", v10, v5);
  }
  else
  {
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v10 localizedStringForKey:@"ALLOW_WHILE_LOCKED_CARD_TITLE_GENERIC" value:&stru_26FDB85C0 table:@"Localizable"];
  id v31 = };

  [v7 setTitle:v31];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"ALLOW_WHILE_LOCKED_CARD_MESSAGE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v7 setSubtitle:v12];
  [v7 setDismissalType:3];
  objc_msgSend(v7, "carSetup_addCarPlayIconCenteredInMainContent");
  v13 = (void *)MEMORY[0x263F62360];
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"ALLOW_WHILE_LOCKED_CARD_ALLOW" value:&stru_26FDB85C0 table:@"Localizable"];

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke;
  v36[3] = &unk_265276E28;
  id v16 = v6;
  id v37 = v16;
  uint64_t v17 = [v13 actionWithTitle:v15 style:0 handler:v36];
  id v18 = (id)[v7 addAction:v17];

  v19 = (void *)MEMORY[0x263F62360];
  id v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"ALLOW_WHILE_LOCKED_CARD_DECLINE" value:&stru_26FDB85C0 table:@"Localizable"];

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_2;
  v34[3] = &unk_265276E28;
  id v22 = v16;
  id v35 = v22;
  v23 = [v19 actionWithTitle:v21 style:1 handler:v34];
  id v24 = (id)[v7 addAction:v23];

  id v25 = (void *)MEMORY[0x263F62360];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_3;
  v32[3] = &unk_265276E28;
  id v33 = v22;
  id v26 = v22;
  id v27 = [v25 actionWithTitle:&stru_26FDB85C0 style:0 handler:v32];
  [v7 setDismissButtonAction:v27];

  v28 = [v7 view];
  uint64_t v29 = [MEMORY[0x263F1C550] labelColor];
  [v28 setTintColor:v29];

  return v7;
}

uint64_t __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (id)connectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  char v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263F62378]);
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CONNECT_TO_CARPLAY_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v8 setTitle:v10];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"CONNECT_TO_CARPLAY_CARD_MESSAGE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v8 setSubtitle:v12];
  [v8 setDismissalType:3];
  objc_msgSend(v8, "carSetup_addCarPlayIconCenteredInMainContent");
  if ((v5 & 2) != 0)
  {
    v13 = CRLocalizedWiFiVariantKeyForKey();
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = [v15 localizedStringForKey:v13 value:&stru_26FDB85C0 table:@"Localizable"];
  }
  else
  {
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"CONNECT_TO_CARPLAY_CARD_CONNECT" value:&stru_26FDB85C0 table:@"Localizable"];
  }

  id v16 = (void *)MEMORY[0x263F62360];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke;
  v35[3] = &unk_265276E28;
  id v17 = v7;
  id v36 = v17;
  id v18 = [v16 actionWithTitle:v14 style:0 handler:v35];
  id v19 = (id)[v8 addAction:v18];

  if (v6)
  {
    id v20 = (void *)MEMORY[0x263F62360];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"CONNECT_USE_BLUETOOTH_ONLY" value:&stru_26FDB85C0 table:@"Localizable"];

    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_157;
    v33[3] = &unk_265276E28;
    id v34 = v17;
    v23 = [v20 actionWithTitle:v22 style:1 handler:v33];
    id v24 = (id)[v8 addAction:v23];
  }
  id v25 = (void *)MEMORY[0x263F62360];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_158;
  v31[3] = &unk_265276E28;
  id v32 = v17;
  id v26 = v17;
  id v27 = [v25 actionWithTitle:&stru_26FDB85C0 style:0 handler:v31];
  [v8 setDismissButtonAction:v27];

  v28 = [v8 view];
  uint64_t v29 = [MEMORY[0x263F1C550] labelColor];
  [v28 setTintColor:v29];

  return v8;
}

uint64_t __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received accept for connect prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_157(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received decline for connect prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_158(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received dismiss / decline for connect prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (id)useWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  v69[4] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263F62378]);
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"USE_WIRELESS_CARPLAY_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v8 setTitle:v10];
  v62 = v7;
  unint64_t v63 = a4;
  switch(a3)
  {
    case 0uLL:
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = v11;
      v13 = @"USE_WIRELESS_CARPLAY_CARD_MESSAGE";
      goto LABEL_5;
    case 1uLL:
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = v11;
      v13 = @"USE_WIRELESS_CARPLAY_CARD_MESSAGE_BT";
LABEL_5:
      uint64_t v14 = [v11 localizedStringForKey:v13 value:&stru_26FDB85C0 table:@"Localizable"];
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
      v12 = CRLocalizedWiFiVariantKeyForKey();
      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v15 localizedStringForKey:v12 value:&stru_26FDB85C0 table:@"Localizable"];

LABEL_7:
      break;
    default:
      uint64_t v14 = 0;
      break;
  }
  v64 = (void *)v14;
  [v8 setSubtitle:v14];
  [v8 setDismissalType:0];
  id v16 = [MEMORY[0x263F1C6C8] configurationWithPointSize:78.0];
  id v17 = (void *)MEMORY[0x263F1C6C8];
  id v18 = [MEMORY[0x263F1C550] systemBlueColor];
  id v19 = [v17 configurationWithHierarchicalColor:v18];
  uint64_t v20 = [v16 configurationByApplyingConfiguration:v19];

  id v61 = (void *)v20;
  v60 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"carplay.radiowaves.left.and.right" withConfiguration:v20];
  v21 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v60];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v22 = [v8 contentView];
  [v22 addSubview:v21];

  v23 = [v8 contentView];
  id v24 = [v23 mainContentGuide];

  v53 = (void *)MEMORY[0x263F08938];
  v57 = [v21 topAnchor];
  id v56 = [v24 topAnchor];
  v55 = [v57 constraintGreaterThanOrEqualToAnchor:v56];
  v69[0] = v55;
  id v54 = [v21 bottomAnchor];
  id v25 = [v24 bottomAnchor];
  id v26 = [v54 constraintLessThanOrEqualToAnchor:v25];
  v69[1] = v26;
  id v27 = [v21 centerYAnchor];
  v28 = [v24 centerYAnchor];
  [v27 constraintEqualToAnchor:v28];
  id v30 = v29 = v8;
  v69[2] = v30;
  id v59 = v21;
  id v31 = [v21 centerXAnchor];
  v58 = v24;
  id v32 = [v24 centerXAnchor];
  id v33 = [v31 constraintEqualToAnchor:v32];
  v69[3] = v33;
  id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:4];
  [v53 activateConstraints:v34];

  id v35 = v29;
  id v36 = (void *)MEMORY[0x263F62360];
  id v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v38 = [v37 localizedStringForKey:@"USE_WIRELESS_CARPLAY_CARD_ENABLE" value:&stru_26FDB85C0 table:@"Localizable"];

  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke;
  v67[3] = &unk_265276E28;
  id v39 = v62;
  id v68 = v39;
  id v40 = [v36 actionWithTitle:v38 style:0 handler:v67];
  id v41 = (id)[v35 addAction:v40];

  if (v63 == 2)
  {
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v44 = v43;
    v45 = @"USE_WIRELESS_CARPLAY_CARD_DONTUSE";
  }
  else if (v63 == 1)
  {
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v44 = v43;
    v45 = @"USE_WIRELESS_CARPLAY_CARD_NOTNOW";
  }
  else
  {
    id v42 = 0;
    if (v63) {
      goto LABEL_15;
    }
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v44 = v43;
    v45 = @"USE_WIRELESS_CARPLAY_CARD_USB_ONLY";
  }
  id v42 = [v43 localizedStringForKey:v45 value:&stru_26FDB85C0 table:@"Localizable"];

LABEL_15:
  v46 = (void *)MEMORY[0x263F62360];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke_2;
  v65[3] = &unk_265276E28;
  id v66 = v39;
  id v47 = v39;
  v48 = [v46 actionWithTitle:v42 style:1 handler:v65];
  id v49 = (id)[v35 addAction:v48];

  v50 = [v35 view];
  v51 = [MEMORY[0x263F1C550] labelColor];
  [v50 setTintColor:v51];

  return v35;
}

uint64_t __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (id)enhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v5 = a4;
  BOOL v6 = (objc_class *)MEMORY[0x263F62378];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = NSString;
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"ENHANCED_INTEGRATION_CARD_TITLE_%@" value:&stru_26FDB85C0 table:@"Localizable"];

  id v29 = objc_msgSend(v9, "stringWithFormat:", v11, v7);

  [v8 setTitle:v29];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"ENHANCED_INTEGRATION_CARD_MESSAGE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v8 setSubtitle:v13];
  [v8 setDismissalType:0];
  uint64_t v14 = (void *)MEMORY[0x263F62360];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = [v15 localizedStringForKey:@"ENHANCED_INTEGRATION_CARD_ALLOW" value:&stru_26FDB85C0 table:@"Localizable"];

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke;
  v32[3] = &unk_265276E28;
  id v17 = v5;
  id v33 = v17;
  id v18 = [v14 actionWithTitle:v16 style:0 handler:v32];
  id v19 = (id)[v8 addAction:v18];

  uint64_t v20 = (void *)MEMORY[0x263F62360];
  v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v22 = [v21 localizedStringForKey:@"ENHANCED_INTEGRATION_CARD_DECLINE" value:&stru_26FDB85C0 table:@"Localizable"];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke_2;
  v30[3] = &unk_265276E28;
  id v31 = v17;
  id v23 = v17;
  id v24 = [v20 actionWithTitle:v22 style:1 handler:v30];
  id v25 = (id)[v8 addAction:v24];

  id v26 = [v8 view];
  id v27 = [MEMORY[0x263F1C550] labelColor];
  [v26 setTintColor:v27];

  return v8;
}

uint64_t __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (id)assetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  char v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263F62378]);
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CONNECT_TO_CARPLAY_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v8 setTitle:v10];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"CONNECT_TO_CARPLAY_CARD_MESSAGE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v8 setSubtitle:v12];
  [v8 setDismissalType:3];
  objc_msgSend(v8, "carSetup_addCarPlayIconCenteredInMainContent");
  if ((v5 & 2) != 0)
  {
    v13 = CRLocalizedWiFiVariantKeyForKey();
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v15 localizedStringForKey:v13 value:&stru_26FDB85C0 table:@"Localizable"];
  }
  else
  {
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"CONNECT_TO_CARPLAY_CARD_CONNECT" value:&stru_26FDB85C0 table:@"Localizable"];
  }

  id v16 = (void *)MEMORY[0x263F62360];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __106__CARSetupPrompts_assetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke;
  v35[3] = &unk_265276E28;
  id v17 = v7;
  id v36 = v17;
  id v18 = [v16 actionWithTitle:v14 style:0 handler:v35];
  id v19 = (id)[v8 addAction:v18];

  if (v6)
  {
    uint64_t v20 = (void *)MEMORY[0x263F62360];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"CONNECT_USE_BLUETOOTH_ONLY" value:&stru_26FDB85C0 table:@"Localizable"];

    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __106__CARSetupPrompts_assetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_202;
    v33[3] = &unk_265276E28;
    id v34 = v17;
    id v23 = [v20 actionWithTitle:v22 style:1 handler:v33];
    id v24 = (id)[v8 addAction:v23];
  }
  id v25 = (void *)MEMORY[0x263F62360];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __106__CARSetupPrompts_assetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_203;
  v31[3] = &unk_265276E28;
  id v32 = v17;
  id v26 = v17;
  id v27 = [v25 actionWithTitle:&stru_26FDB85C0 style:0 handler:v31];
  [v8 setDismissButtonAction:v27];

  v28 = [v8 view];
  id v29 = [MEMORY[0x263F1C550] labelColor];
  [v28 setTintColor:v29];

  return v8;
}

uint64_t __106__CARSetupPrompts_assetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received accept for connect prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __106__CARSetupPrompts_assetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_202(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received decline for connect prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __106__CARSetupPrompts_assetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_203(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received dismiss / decline for connect prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

+ (id)assetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263F62378]);
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CONNECT_TO_CARPLAY_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable"];

  [v8 setTitle:v10];
  switch(a3)
  {
    case 0uLL:
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = v11;
      v13 = @"USE_WIRELESS_CARPLAY_CARD_MESSAGE";
      goto LABEL_5;
    case 1uLL:
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = v11;
      v13 = @"USE_WIRELESS_CARPLAY_CARD_MESSAGE_BT";
LABEL_5:
      uint64_t v14 = [v11 localizedStringForKey:v13 value:&stru_26FDB85C0 table:@"Localizable"];
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
      v12 = CRLocalizedWiFiVariantKeyForKey();
      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v15 localizedStringForKey:v12 value:&stru_26FDB85C0 table:@"Localizable"];

LABEL_7:
      break;
    default:
      uint64_t v14 = 0;
      break;
  }
  [v8 setSubtitle:v14];
  [v8 setDismissalType:0];
  objc_msgSend(v8, "carSetup_addCarPlayIconCenteredInMainContent");
  id v16 = (void *)MEMORY[0x263F62360];
  id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v18 = [v17 localizedStringForKey:@"USE_WIRELESS_CARPLAY_CARD_ENABLE" value:&stru_26FDB85C0 table:@"Localizable"];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __105__CARSetupPrompts_assetSupportingUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke;
  v39[3] = &unk_265276E28;
  id v19 = v7;
  id v40 = v19;
  uint64_t v20 = [v16 actionWithTitle:v18 style:0 handler:v39];
  id v21 = (id)[v8 addAction:v20];

  BOOL v22 = a4 == 2;
  if (a4 < 2)
  {
    id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v24 = v23;
    id v25 = @"USE_WIRELESS_CARPLAY_CARD_NOTNOW";
LABEL_13:
    id v26 = [v23 localizedStringForKey:v25 value:&stru_26FDB85C0 table:@"Localizable"];

    goto LABEL_14;
  }
  id v26 = 0;
  if (v22)
  {
    id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v24 = v23;
    id v25 = @"USE_WIRELESS_CARPLAY_CARD_DONTUSE";
    goto LABEL_13;
  }
LABEL_14:
  id v27 = (void *)MEMORY[0x263F62360];
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 3221225472;
  id v36 = __105__CARSetupPrompts_assetSupportingUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke_204;
  id v37 = &unk_265276E28;
  id v38 = v19;
  id v28 = v19;
  id v29 = [v27 actionWithTitle:v26 style:1 handler:&v34];
  id v30 = (id)objc_msgSend(v8, "addAction:", v29, v34, v35, v36, v37);

  id v31 = [v8 view];
  id v32 = [MEMORY[0x263F1C550] labelColor];
  [v31 setTintColor:v32];

  return v8;
}

uint64_t __105__CARSetupPrompts_assetSupportingUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received accept for use wireless prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __105__CARSetupPrompts_assetSupportingUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke_204(uint64_t a1)
{
  id v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_249B58000, v2, OS_LOG_TYPE_INFO, "received decline for use wireless prompt", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

@end