@interface BPSApplePayLocallyStoredValueManager
+ (id)remoteLocallyStoredValuePassNames;
+ (void)_attemptToMarkAllAppletsForDeletionWithCompletion:(id)a3;
+ (void)_presentApplePayLocallyStoredValueWarningInController:(id)a3 unableToConnect:(BOOL)a4 legacyDevice:(BOOL)a5 withCompletion:(id)a6;
+ (void)presentApplePayLocallyStoredValueOfflineWarningIfNeededInController:(id)a3 forPairedDevice:(id)a4 withCompletion:(id)a5;
@end

@implementation BPSApplePayLocallyStoredValueManager

+ (id)remoteLocallyStoredValuePassNames
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v3 = (void *)getPKPassLibraryClass_softClass;
  uint64_t v32 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __getPKPassLibraryClass_block_invoke;
    v27 = &unk_264408888;
    v28 = &v29;
    __getPKPassLibraryClass_block_invoke((uint64_t)&v24);
    v3 = (void *)v30[3];
  }
  v4 = v3;
  _Block_object_dispose(&v29, 8);
  if ([(objc_class *)v4 isPassLibraryAvailable])
  {
    id v5 = [v4 alloc];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    v6 = (id *)getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr;
    uint64_t v32 = getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr;
    if (!getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_block_invoke;
      v27 = &unk_264408888;
      v28 = &v29;
      v7 = (void *)PassKitCoreLibrary();
      v8 = dlsym(v7, "PKCompanionWatchPassLibraryMachServiceName");
      *(void *)(v28[1] + 24) = v8;
      getPKCompanionWatchPassLibraryMachServiceNameSymbolLoc_ptr = *(void *)(v28[1] + 24);
      v6 = (id *)v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (!v6) {
      goto LABEL_23;
    }
    id v9 = *v6;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    v10 = (void *)getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr;
    uint64_t v32 = getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr;
    if (!getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_block_invoke;
      v27 = &unk_264408888;
      v28 = &v29;
      v11 = (void *)PassKitCoreLibrary();
      v12 = dlsym(v11, "PKCompanionAgentServiceListenerResumedNotification");
      *(void *)(v28[1] + 24) = v12;
      getPKCompanionAgentServiceListenerResumedNotificationSymbolLoc_ptr = *(void *)(v28[1] + 24);
      v10 = (void *)v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (!v10)
    {
LABEL_23:
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
      __break(1u);
    }
    v13 = (void *)[v5 initWithMachServiceName:v9 resumeNotificationName:*v10 interfaceType:0];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = objc_msgSend(v13, "paymentPassesWithLocallyStoredValue", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = [*(id *)(*((void *)&v20 + 1) + 8 * i) localizedDescription];
          if (v18) {
            [v2 addObject:v18];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v33 count:16];
      }
      while (v15);
    }
  }
  return v2;
}

+ (void)presentApplePayLocallyStoredValueOfflineWarningIfNeededInController:(id)a3 forPairedDevice:(id)a4 withCompletion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if (!v11) {
    NSLog(&cfstr_Presentingcont.isa);
  }
  v10 = [a1 remoteLocallyStoredValuePassNames];
  if ([v10 count])
  {
    NRWatchOSVersionForRemoteDevice();
    [a1 _presentApplePayLocallyStoredValueWarningInController:v11 unableToConnect:0 legacyDevice:NRVersionIsGreaterThanOrEqual() ^ 1 withCompletion:v9];
  }
  else if (v9)
  {
    v9[2](v9, 1);
  }
}

+ (void)_presentApplePayLocallyStoredValueWarningInController:(id)a3 unableToConnect:(BOOL)a4 legacyDevice:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v44 = a3;
  id v42 = a6;
  v10 = [a1 remoteLocallyStoredValuePassNames];
  uint64_t v11 = [v10 count];
  unint64_t v12 = 0x263F08000uLL;
  v43 = v10;
  if (v11 == 1)
  {
    v13 = NSString;
    v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
    uint64_t v15 = [v14 localizedStringForKey:@"REMAINING_BALANCE_TITLE_%@" value:&stru_26CCB36C8 table:@"Localizable"];
    uint64_t v16 = [v10 firstObject];
    v17 = v13;
    unint64_t v12 = 0x263F08000;
    v18 = objc_msgSend(v17, "stringWithFormat:", v15, v16);
  }
  else
  {
    v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
    v18 = [v14 localizedStringForKey:@"REMAINING_BALANCE_TITLE_MULTIPLE" value:&stru_26CCB36C8 table:@"Localizable"];
  }

  if (v8)
  {
    v19 = [*(id *)(v12 + 1760) bundleWithIdentifier:@"com.apple.BridgePreferences"];
    long long v20 = [v19 localizedStringForKey:@"REMAINING_BALANCE_MESSAGE_ERROR" value:&stru_26CCB36C8 table:@"Localizable"];
  }
  else
  {
    long long v21 = @"REMAINING_BALANCE_MESSAGE_MULTIPLE";
    if (v11 == 1) {
      long long v21 = @"REMAINING_BALANCE_MESSAGE";
    }
    long long v22 = v21;
    v19 = v22;
    if (v7)
    {
      uint64_t v23 = [(__CFString *)v22 stringByAppendingString:@"_LEGACY"];

      v19 = (void *)v23;
    }
    uint64_t v24 = [*(id *)(v12 + 1760) bundleWithIdentifier:@"com.apple.BridgePreferences"];
    long long v20 = [v24 localizedStringForKey:v19 value:&stru_26CCB36C8 table:@"Localizable"];
  }
  uint64_t v25 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v18 message:v20 preferredStyle:1];
  if (v7)
  {
    uint64_t v26 = 0;
    v27 = v42;
  }
  else
  {
    v28 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v29 = [*(id *)(v12 + 1760) bundleWithIdentifier:@"com.apple.BridgePreferences"];
    v30 = [v29 localizedStringForKey:@"CONNECT_TO_APPLE_PAY" value:&stru_26CCB36C8 table:@"Localizable"];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke;
    v49[3] = &unk_264408950;
    id v50 = v44;
    id v52 = a1;
    v27 = v42;
    id v51 = v42;
    BOOL v53 = v7;
    uint64_t v31 = [v28 actionWithTitle:v30 style:0 handler:v49];

    [v25 addAction:v31];
    [v25 setPreferredAction:v31];

    uint64_t v26 = 2;
  }
  uint64_t v32 = (void *)MEMORY[0x263F1C3F0];
  v33 = [*(id *)(v12 + 1760) bundleWithIdentifier:@"com.apple.BridgePreferences"];
  uint64_t v34 = [v33 localizedStringForKey:@"RESET" value:&stru_26CCB36C8 table:@"Localizable"];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_3;
  v47[3] = &unk_264408978;
  id v35 = v27;
  id v48 = v35;
  v36 = [v32 actionWithTitle:v34 style:v26 handler:v47];

  [v25 addAction:v36];
  if (v7) {
    [v25 setPreferredAction:v36];
  }
  v37 = (void *)MEMORY[0x263F1C3F0];
  v38 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  v39 = [v38 localizedStringForKey:@"CANCEL" value:&stru_26CCB36C8 table:@"Localizable"];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_4;
  v45[3] = &unk_264408978;
  id v46 = v35;
  id v40 = v35;
  v41 = [v37 actionWithTitle:v39 style:1 handler:v45];
  [v25 addAction:v41];

  [v44 presentViewController:v25 animated:1 completion:0];
}

void __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_UserSelectedCo.isa);
  id v2 = objc_alloc_init(MEMORY[0x263F1C8D8]);
  [v2 setAutoresizingMask:45];
  [v2 setFontSize:16];
  v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BridgePreferences"];
  v4 = [v3 localizedStringForKey:@"CONNECTING_TO_APPLE_PAY" value:&stru_26CCB36C8 table:@"Localizable"];
  [v2 setText:v4];

  id v5 = [*(id *)(a1 + 32) view];
  v6 = [v5 window];

  BOOL v7 = [v6 rootViewController];
  BOOL v8 = [v7 view];
  [v2 showInView:v8];

  [v6 setUserInteractionEnabled:0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_2;
  v14[3] = &unk_264408928;
  id v15 = v2;
  id v16 = v6;
  id v9 = *(void **)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v18 = v10;
  uint64_t v19 = v11;
  id v17 = *(id *)(a1 + 32);
  char v20 = *(unsigned char *)(a1 + 56);
  id v12 = v6;
  id v13 = v2;
  [v9 _attemptToMarkAllAppletsForDeletionWithCompletion:v14];
}

uint64_t __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  NSLog(&cfstr_MarkAppletsFor.isa, a2, a3);
  [*(id *)(a1 + 32) hide];
  [*(id *)(a1 + 40) setUserInteractionEnabled:1];
  if (a2)
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    BOOL v7 = *(void **)(a1 + 64);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 48);
    return [v7 _presentApplePayLocallyStoredValueWarningInController:v10 unableToConnect:1 legacyDevice:v9 withCompletion:v8];
  }
  return result;
}

uint64_t __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_3(uint64_t a1)
{
  NSLog(&cfstr_UserContinuedF.isa);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __138__BPSApplePayLocallyStoredValueManager__presentApplePayLocallyStoredValueWarningInController_unableToConnect_legacyDevice_withCompletion___block_invoke_4(uint64_t a1)
{
  NSLog(&cfstr_UserCancelledF.isa);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (void)_attemptToMarkAllAppletsForDeletionWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getNPKCompanionAgentConnectionClass_softClass;
  uint64_t v14 = getNPKCompanionAgentConnectionClass_softClass;
  if (!getNPKCompanionAgentConnectionClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getNPKCompanionAgentConnectionClass_block_invoke;
    v10[3] = &unk_264408888;
    v10[4] = &v11;
    __getNPKCompanionAgentConnectionClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = objc_alloc_init(v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke;
  v8[3] = &unk_2644089C8;
  id v9 = v3;
  id v7 = v3;
  [v6 markAllAppletsForDeletionWithCompletion:v8];
}

void __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke_2;
  block[3] = &unk_2644089A0;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __90__BPSApplePayLocallyStoredValueManager__attemptToMarkAllAppletsForDeletionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

@end