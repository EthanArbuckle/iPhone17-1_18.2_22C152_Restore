@interface HUSiriEndpointUtilities
+ (id)presentShareSiriAndDictationAlert:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5;
+ (id)presentShareSiriAndDictationAlertForMultipleAccessories:(id)a3;
+ (id)presentShareSiriAndDictationAlertForSingleAccessory:(id)a3 accessoryName:(id)a4;
@end

@implementation HUSiriEndpointUtilities

+ (id)presentShareSiriAndDictationAlertForMultipleAccessories:(id)a3
{
  id v3 = a3;
  v4 = _HULocalizedStringWithDefaultValue(@"HUSiriEndpointSetup_ShareSiriDictation_AlertTitle_Multiple", @"HUSiriEndpointSetup_ShareSiriDictation_AlertTitle_Multiple", 1);
  v5 = _HULocalizedStringWithDefaultValue(@"HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Multiple", @"HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Multiple", 1);
  v6 = +[HUSiriEndpointUtilities presentShareSiriAndDictationAlert:v3 alertTitle:v4 alertMessage:v5];

  return v6;
}

+ (id)presentShareSiriAndDictationAlertForSingleAccessory:(id)a3 accessoryName:(id)a4
{
  id v5 = a3;
  v12 = HULocalizedStringWithFormat(@"HUSiriEndpointSetup_ShareSiriDictation_AlertTitle_Single", @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)a4);
  v13 = _HULocalizedStringWithDefaultValue(@"HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Single", @"HUSiriEndpointSetup_ShareSiriDictation_AlertMessage_Single", 1);
  v14 = +[HUSiriEndpointUtilities presentShareSiriAndDictationAlert:v5 alertTitle:v12 alertMessage:v13];

  return v14;
}

+ (id)presentShareSiriAndDictationAlert:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    NSLog(&cfstr_NoVcFoundCanno.isa);
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F7A0D8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke;
  v17[3] = &unk_1E638D120;
  id v18 = v9;
  id v19 = v10;
  id v20 = v8;
  SEL v21 = a2;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  v15 = [v11 futureWithBlock:v17];

  return v15;
}

void __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ Showing Share Siri & Dictation alert", buf, 0xCu);
  }
  uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUAlertDismiss", @"HUAlertDismiss", 1);
  uint64_t v7 = [MEMORY[0x1E4F42728] alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  id v8 = (void *)MEMORY[0x1E4F42720];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke_22;
  v15 = &unk_1E638E610;
  uint64_t v9 = *(void *)(a1 + 56);
  id v16 = v3;
  uint64_t v17 = v9;
  id v10 = v3;
  uint64_t v11 = [v8 actionWithTitle:v6 style:0 handler:&v12];
  objc_msgSend(v7, "addAction:", v11, v12, v13, v14, v15);

  [*(id *)(a1 + 48) presentViewController:v7 animated:1 completion:0];
}

uint64_t __85__HUSiriEndpointUtilities_presentShareSiriAndDictationAlert_alertTitle_alertMessage___block_invoke_22(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@ Dismissing Share Siri & Dictation alert.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) finishWithNoResult];
}

@end