@interface AMSUIParentalVerificationCommon
+ (id)_promiseToPromptAfterFailureWithBag:(id)a3 viewController:(id)a4 metrics:(id)a5 pageID:(id)a6 flowName:(id)a7;
@end

@implementation AMSUIParentalVerificationCommon

+ (id)_promiseToPromptAfterFailureWithBag:(id)a3 viewController:(id)a4 metrics:(id)a5 pageID:(id)a6 flowName:(id)a7
{
  id v35 = a5;
  id v11 = a6;
  id v38 = a7;
  v12 = (void *)MEMORY[0x263F086E0];
  id v13 = a4;
  id v14 = a3;
  v15 = [v12 bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v37 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_ID_CARD_FAILED_TITLE", v14, v15);

  v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v36 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_ID_CARD_FAILED_MESSAGE", v14, v16);

  v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v34 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_ID_CARD_FAILED_CONTINUE_BUTTON_TITLE", v14, v17);

  v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v19 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_ID_CARD_FAILED_CANCEL_BUTTON_TITLE", v14, v18);

  id v20 = objc_alloc_init(MEMORY[0x263F27D90]);
  v21 = (void *)[objc_alloc(MEMORY[0x263F27C10]) initWithTitle:v37 message:v36];
  v22 = [MEMORY[0x263F27C08] actionWithTitle:v19 identifier:@"cancelButtonID"];
  [v21 addButtonAction:v22];

  v23 = [MEMORY[0x263F27C08] actionWithTitle:v34 identifier:@"continueButtonID"];
  [v21 addButtonAction:v23];

  v24 = [[AMSUIAlertDialogTask alloc] initWithRequest:v21 presentingViewController:v13];
  [v35 enqueueEventWithPageId:v11 displayReason:0];
  v25 = [(AMSUIAlertDialogTask *)v24 present];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __110__AMSUIParentalVerificationCommon__promiseToPromptAfterFailureWithBag_viewController_metrics_pageID_flowName___block_invoke;
  v39[3] = &unk_2643E4248;
  id v40 = v21;
  v41 = @"cancelButtonID";
  id v26 = v20;
  id v42 = v26;
  id v43 = v35;
  id v44 = v11;
  id v45 = v38;
  id v27 = v38;
  id v28 = v11;
  id v29 = v35;
  id v30 = v21;
  [v25 addFinishBlock:v39];

  v31 = v45;
  id v32 = v26;

  return v32;
}

void __110__AMSUIParentalVerificationCommon__promiseToPromptAfterFailureWithBag_viewController_metrics_pageID_flowName___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  v4 = [a2 selectedActionIdentifier];
  v5 = [v3 locateActionWithIdentifier:v4];

  v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 40)];

  if (v7)
  {
    v8 = *(void **)(a1 + 48);
    id v14 = @"really_cancelled";
    v15[0] = MEMORY[0x263EFFA88];
    v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v10 = AMSCustomError();
    [v8 finishWithError:v10];

    [*(id *)(a1 + 56) enqueueEventWithTargetId:@"Cancel" pageId:*(void *)(a1 + 64) displayReason:0];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"%@ failed for parental verification, moving on to next method", *(void *)(a1 + 72)];
    v12 = *(void **)(a1 + 48);
    id v13 = AMSError();
    [v12 finishWithError:v13];

    [*(id *)(a1 + 56) enqueueEventWithTargetId:@"Continue" pageId:*(void *)(a1 + 64) displayReason:0];
  }
}

@end