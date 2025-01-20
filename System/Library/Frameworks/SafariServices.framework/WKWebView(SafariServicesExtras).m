@interface WKWebView(SafariServicesExtras)
- (id)_sf_effectiveViewToLayOut;
- (id)_sf_securityInfo;
- (id)_sf_suggestedFilename;
- (id)_simulatedBEKeyEntryForReturnKeyWithType:()SafariServicesExtras;
- (id)_simulatedWebEventForReturnKeyWithType:()SafariServicesExtras;
- (id)webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:()SafariServicesExtras;
- (id)webui_lastGeneratedPasswordForCurrentBackForwardItem;
- (id)webui_presentingViewController;
- (id)webui_preventNavigationDuringAutoFillPrompt;
- (uint64_t)_sf_endEditingAndSimulateCarriageReturnKeyEvents:()SafariServicesExtras;
- (uint64_t)webui_privateBrowsingEnabled;
- (void)_sf_applicationDidEnterBackgroundOrWillTerminate:()SafariServicesExtras;
- (void)_sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata;
- (void)_sf_setSecurityInfo:()SafariServicesExtras;
- (void)webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:()SafariServicesExtras;
- (void)webui_setFormMetadata:()SafariServicesExtras forLastPasswordGenerationOrSubmitEventInFrame:;
- (void)webui_setLastGeneratedPasswordForCurrentBackForwardItem:()SafariServicesExtras;
@end

@implementation WKWebView(SafariServicesExtras)

- (id)_sf_effectiveViewToLayOut
{
  if ([a1 _isInFullscreen])
  {
    id v2 = [a1 _fullScreenPlaceholderView];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)_sf_securityInfo
{
  v1 = [a1 backForwardList];
  id v2 = [v1 currentItem];
  v3 = objc_msgSend(v2, "_sf_securityInfo");

  return v3;
}

- (void)_sf_setSecurityInfo:()SafariServicesExtras
{
  id v4 = a3;
  id v6 = [a1 backForwardList];
  v5 = [v6 currentItem];
  objc_msgSend(v5, "_sf_setSecurityInfo:", v4);
}

- (id)webui_preventNavigationDuringAutoFillPrompt
{
  id v2 = [a1 _retainActiveFocusedState];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__WKWebView_SafariServicesExtras__webui_preventNavigationDuringAutoFillPrompt__block_invoke;
  v6[3] = &unk_1E5C73380;
  v6[4] = a1;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)MEMORY[0x1AD0C36A0](v6);

  return v4;
}

- (uint64_t)webui_privateBrowsingEnabled
{
  v1 = [a1 configuration];
  id v2 = [v1 websiteDataStore];
  uint64_t v3 = [v2 isPersistent] ^ 1;

  return v3;
}

- (id)webui_presentingViewController
{
  id v2 = [a1 UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 _presentingViewControllerForWebView:a1];
  }
  else
  {
    id v4 = [a1 window];
    uint64_t v3 = [v4 rootViewController];
  }

  return v3;
}

- (id)webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:()SafariServicesExtras
{
  id v4 = (const void *)lastPasswordGenerationOrSubmitEventFrameKey;
  id v5 = a3;
  id v6 = objc_getAssociatedObject(a1, v4);
  id v7 = objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey);
  int v8 = [v5 isEqual:v6];

  if (v8) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (void)webui_setFormMetadata:()SafariServicesExtras forLastPasswordGenerationOrSubmitEventInFrame:
{
  id v6 = (const void *)lastPasswordGenerationOrSubmitEventFrameKey;
  id value = a3;
  objc_setAssociatedObject(a1, v6, a4, (void *)1);
  objc_setAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey, value, (void *)1);
}

- (void)webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:()SafariServicesExtras
{
  objc_setAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFrameKey, 0, (void *)1);
  id v2 = (const void *)lastPasswordGenerationOrSubmitEventFormKey;

  objc_setAssociatedObject(a1, v2, 0, (void *)1);
}

- (id)webui_lastGeneratedPasswordForCurrentBackForwardItem
{
  v1 = [a1 backForwardList];
  id v2 = [v1 currentItem];
  uint64_t v3 = objc_getAssociatedObject(v2, (const void *)lastGeneratedPasswordKey);

  return v3;
}

- (void)webui_setLastGeneratedPasswordForCurrentBackForwardItem:()SafariServicesExtras
{
  id v4 = a3;
  id v6 = [a1 backForwardList];
  id v5 = [v6 currentItem];
  objc_setAssociatedObject(v5, (const void *)lastGeneratedPasswordKey, v4, (void *)3);
}

- (void)_sf_applicationDidEnterBackgroundOrWillTerminate:()SafariServicesExtras
{
  objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v2 = objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFrameKey);
    uint64_t v3 = +[_SFFormDataController sharedController];
    [v3 saveUnsubmittedGeneratedPasswordInFrame:v2 form:v4 context:0 closingWebView:0];
  }
}

- (void)_sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata
{
  objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFrameKey);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v2 = objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey);
    uint64_t v3 = +[_SFFormDataController sharedController];
    [v3 saveUnsubmittedGeneratedPasswordInFrame:v4 form:v2 context:0 closingWebView:1];
  }
  objc_msgSend(a1, "webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:", 0);
}

- (id)_sf_suggestedFilename
{
  id v2 = [a1 backForwardList];
  uint64_t v3 = [v2 currentItem];
  id v4 = objc_msgSend(v3, "_sf_explicitSuggestedFilename");

  if (v4)
  {
    id v5 = v4;
  }
  else if (![a1 _isDisplayingPDF] {
         || ([a1 _suggestedFilenameForDisplayedPDF], (id v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  }
  {
    id v6 = objc_alloc(MEMORY[0x1E4F18D40]);
    id v7 = [a1 _committedURL];
    int v8 = [a1 _MIMEType];
    v9 = (void *)[v6 initWithURL:v7 MIMEType:v8 expectedContentLength:0 textEncodingName:0];
    id v10 = [v9 suggestedFilename];
    objc_msgSend(v10, "safari_filenameByFixingIllegalCharacters");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_simulatedWebEventForReturnKeyWithType:()SafariServicesExtras
{
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F46718]), "initWithKeyEventType:timeStamp:characters:charactersIgnoringModifiers:modifiers:isRepeating:withFlags:withInputManagerHint:keyCode:isTabKey:", a3, @"\n", @"\n", 0, 0, 0, (double)(unint64_t)GSCurrentEventTimestamp(), 0, v5);

  return v3;
}

- (id)_simulatedBEKeyEntryForReturnKeyWithType:()SafariServicesExtras
{
  id v5 = objc_alloc(MEMORY[0x1E4FB18D8]);
  id v6 = [a1 _simulatedWebEventForReturnKeyWithType:a3];
  id v7 = (void *)[v5 initWithWebEvent:v6];

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  int v8 = (void *)getBEKeyEntryClass_softClass;
  uint64_t v16 = getBEKeyEntryClass_softClass;
  if (!getBEKeyEntryClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getBEKeyEntryClass_block_invoke;
    v12[3] = &unk_1E5C723B0;
    v12[4] = &v13;
    __getBEKeyEntryClass_block_invoke((uint64_t)v12);
    int v8 = (void *)v14[3];
  }
  v9 = v8;
  _Block_object_dispose(&v13, 8);
  id v10 = (void *)[[v9 alloc] _initWithUIKitKeyEvent:v7];

  return v10;
}

- (uint64_t)_sf_endEditingAndSimulateCarriageReturnKeyEvents:()SafariServicesExtras
{
  [a1 becomeFirstResponder];
  id v5 = [a1 firstResponder];
  if ([v5 conformsToProtocol:&unk_1EFCBA9F8]
    && [v5 conformsToProtocol:&unk_1EFCBB418])
  {
    if (!a3)
    {
      [v5 clearSelection];
      goto LABEL_12;
    }
    id v6 = [a1 _simulatedWebEventForReturnKeyWithType:4];
    [v5 handleKeyWebEvent:v6];

    id v7 = [a1 _simulatedWebEventForReturnKeyWithType:5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__WKWebView_SafariServicesExtras___sf_endEditingAndSimulateCarriageReturnKeyEvents___block_invoke;
    v15[3] = &unk_1E5C77CC8;
    id v16 = v5;
    [v16 handleKeyWebEvent:v7 withCompletionHandler:v15];

    id v8 = v16;
    goto LABEL_8;
  }
  if ([v5 conformsToProtocol:&unk_1EFCBBEA0])
  {
    if (!a3)
    {
      [v5 setSelectedTextRange:0];
      goto LABEL_12;
    }
    v9 = [a1 _simulatedBEKeyEntryForReturnKeyWithType:4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__WKWebView_SafariServicesExtras___sf_endEditingAndSimulateCarriageReturnKeyEvents___block_invoke_2;
    v12[3] = &unk_1E5C77D18;
    id v13 = v5;
    v14 = a1;
    [v13 handleKeyEntry:v9 withCompletionHandler:v12];

    id v8 = v13;
LABEL_8:

LABEL_12:
    uint64_t v10 = 1;
    goto LABEL_13;
  }
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

@end