@interface DKEraseConfirmationAlertController
+ (id)alertControllerWithCellularPlans:(id)a3 completion:(id)a4;
+ (id)alertControllerWithCompletion:(id)a3;
- (BOOL)_canShowWhileLocked;
@end

@implementation DKEraseConfirmationAlertController

+ (id)alertControllerWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(DKTelephonyProvider);
  v5 = objc_opt_class();
  v6 = [(DKTelephonyProvider *)v4 cellularPlans];
  v7 = [v5 alertControllerWithCellularPlans:v6 completion:v3];

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)alertControllerWithCellularPlans:(id)a3 completion:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v62 = v5;
  if ([v5 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v74 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v73 + 1) + 8 * i) carrierName];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v73 objects:v77 count:16];
      }
      while (v10);
    }
    v61 = v6;

    uint64_t v14 = [v8 count];
    v15 = NSString;
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = v16;
    uint64_t v60 = v14;
    if (v14 == 1) {
      v18 = @"ERASE_CONFIRMATION_ALERT_MESSAGE_WITH_CELLULAR_SINGULAR";
    }
    else {
      v18 = @"ERASE_CONFIRMATION_ALERT_MESSAGE_WITH_CELLULAR_PLURAL";
    }
    v34 = [v16 localizedStringForKey:v18 value:&stru_26EAA9F58 table:@"Localizable"];
    v35 = (void *)MEMORY[0x263F08950];
    v36 = [v7 allObjects];
    v37 = (void *)[v36 mutableCopy];
    v38 = [v35 localizedStringByJoiningStrings:v37];
    objc_msgSend(v15, "stringWithFormat:", v34, v38);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v40 = [v39 localizedStringForKey:@"ERASE_ALL_DATA_CONFIRMATION_ALERT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
    v23 = +[DKEraseConfirmationAlertController alertControllerWithTitle:v40 message:v31 preferredStyle:1];

    v41 = (void *)MEMORY[0x263F1C3F0];
    v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v43 = [v42 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke;
    v71[3] = &unk_264CF0C48;
    id v44 = v61;
    id v72 = v44;
    v45 = [v41 actionWithTitle:v43 style:0 handler:v71];
    [v23 addAction:v45];

    v46 = (void *)MEMORY[0x263F1C3F0];
    v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v48 = v47;
    if (v60 == 1) {
      v49 = @"ERASE_CONFIRMATION_CELLULAR_KEEP_CELLULAR_PLAN_ALERT_BUTTON";
    }
    else {
      v49 = @"ERASE_CONFIRMATION_CELLULAR_KEEP_CELLULAR_PLANS_ALERT_BUTTON";
    }
    v50 = [v47 localizedStringForKey:v49 value:&stru_26EAA9F58 table:@"Localizable"];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_2;
    v69[3] = &unk_264CF0C48;
    id v51 = v44;
    id v70 = v51;
    v52 = [v46 actionWithTitle:v50 style:2 handler:v69];
    [v23 addAction:v52];

    v53 = (void *)MEMORY[0x263F1C3F0];
    v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v55 = v54;
    if (v60 == 1) {
      v56 = @"ERASE_CONFIRMATION_CELLULAR_ERASE_CELLULAR_PLAN_ALERT_BUTTON";
    }
    else {
      v56 = @"ERASE_CONFIRMATION_CELLULAR_ERASE_CELLULAR_PLANS_ALERT_BUTTON";
    }
    v57 = [v54 localizedStringForKey:v56 value:&stru_26EAA9F58 table:@"Localizable"];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_3;
    v67[3] = &unk_264CF0C48;
    id v68 = v51;
    id v33 = v51;
    v58 = [v53 actionWithTitle:v57 style:2 handler:v67];
    [v23 addAction:v58];
  }
  else
  {
    v19 = [MEMORY[0x263F1C5C0] currentDevice];
    BOOL v20 = [v19 userInterfaceIdiom] == 1;

    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"ERASE_CONFIRMATION_ALERT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
    v23 = +[DKEraseConfirmationAlertController alertControllerWithTitle:v22 message:0 preferredStyle:v20];

    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v24 localizedStringForKey:@"ERASE_CONFIRMATION_ALERT_BUTTON" value:&stru_26EAA9F58 table:@"Localizable"];

    v25 = (void *)MEMORY[0x263F1C3F0];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_4;
    v65[3] = &unk_264CF0C48;
    id v26 = v6;
    id v66 = v26;
    v27 = [v25 actionWithTitle:v7 style:2 handler:v65];
    [v23 addAction:v27];

    v28 = (void *)MEMORY[0x263F1C3F0];
    v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_5;
    v63[3] = &unk_264CF0C48;
    id v64 = v26;
    id v31 = v26;
    v32 = [v28 actionWithTitle:v30 style:1 handler:v63];
    [v23 addAction:v32];

    id v33 = v66;
  }

  return v23;
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end