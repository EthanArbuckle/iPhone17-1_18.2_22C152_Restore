@interface SFWebExtensionsController(SafariServicesExtras)
- (BOOL)_createTabWithURL:()SafariServicesExtras inWindow:;
- (id)_dialogController;
- (uint64_t)dialogController:()SafariServicesExtras presentationPolicyForDialog:;
- (uint64_t)webProcessIDForDialogController:()SafariServicesExtras;
- (void)_showPromptForExtensionDisabledBecauseItHasRequestedAdditionalPermissions:()SafariServicesExtras extensionIdentifier:;
- (void)cancelPresentedDialogIfNecessaryAndUnqueuePendingWebExtensionDialogs;
- (void)createNewTabFromBackgroundPageWithURL:()SafariServicesExtras;
- (void)dialogController:()SafariServicesExtras dismissViewController:withAdditionalAnimations:;
- (void)dialogController:()SafariServicesExtras presentViewController:withAdditionalAnimations:;
- (void)dismissDialogView:()SafariServicesExtras withAdditionalAnimations:forDialogController:;
- (void)presentDialogView:()SafariServicesExtras withAdditionalAnimations:forDialogController:;
- (void)showAccessRequestDialogForExtension:()SafariServicesExtras URLs:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:;
- (void)showAccessRequestDialogForExtension:()SafariServicesExtras domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:;
- (void)showAlwaysAllowConfirmationDialogForExtension:()SafariServicesExtras domains:includeDenyButton:responseBlock:;
- (void)showPromptForBlocklistedExtension:()SafariServicesExtras extensionName:;
- (void)showPromptForExpiredExtension:()SafariServicesExtras extensionName:;
- (void)showPromptForExtensionDisabledBecauseItDoesNotSupportThisVersionOfSafariWithMessage:()SafariServicesExtras extensionIdentifier:;
@end

@implementation SFWebExtensionsController(SafariServicesExtras)

- (uint64_t)webProcessIDForDialogController:()SafariServicesExtras
{
  return 1;
}

- (void)cancelPresentedDialogIfNecessaryAndUnqueuePendingWebExtensionDialogs
{
  v2 = [a1 _dialogController];
  [v2 cancelPresentedDialogIfNeeded];

  id v3 = [a1 _dialogController];
  [v3 presentNextDialogIfNeeded];
}

- (id)_dialogController
{
  uint64_t v2 = (int)*MEMORY[0x1E4F785D0];
  id v3 = *(void **)(a1 + v2);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F78278]);
    v5 = *(void **)(a1 + v2);
    *(void *)(a1 + v2) = v4;

    [*(id *)(a1 + v2) setViewControllerPresenter:a1];
    [*(id *)(a1 + v2) setDialogPresenter:a1];
    [*(id *)(a1 + v2) setDelegate:a1];
    id v3 = *(void **)(a1 + v2);
  }

  return v3;
}

- (BOOL)_createTabWithURL:()SafariServicesExtras inWindow:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 navigationIntentHandler];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
    [v9 setPrefersOpenInNewTab:1];
    [v9 setPreferredTabOrder:1];
    [v9 setPrefersRelationToSourceTab:0];
    v10 = [v9 navigationIntentWithURL:v6];
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&a1[*MEMORY[0x1E4F98FE0]]);
      v12 = [WeakRetained sfWebExtensionsController:a1 navigationIntentUUIDForWindow:v7];
      [v10 setSourceWindowUUID:v12];
    }
    [v8 dispatchNavigationIntent:v10];
  }
  return v8 != 0;
}

- (void)showAccessRequestDialogForExtension:()SafariServicesExtras URLs:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a3;
  objc_msgSend(a4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_55);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [a1 showAccessRequestDialogForExtension:v16 domains:v17 callingAPIName:v15 showMoreOptionsForAlwaysAllow:a6 includeDenyButton:a7 responseBlock:v14];
}

- (void)showAccessRequestDialogForExtension:()SafariServicesExtras domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  if ([v14 count])
  {
    id v16 = objc_msgSend(v14, "safari_sortedArrayUsingFinderLikeSorting");
    id v17 = [a1 _dialogController];
    v18 = [MEMORY[0x1E4F78270] webExtensionPermissionDialogWithExtension:v13 domains:v16 showMoreOptionsForAlwaysAllow:a6 includeDenyButton:a7 completionHandler:v15];
    [v17 presentDialog:v18];
  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SFWebExtensionsController(SafariServicesExtras) showAccessRequestDialogForExtension:domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:](v19);
    }
  }
}

- (void)showAlwaysAllowConfirmationDialogForExtension:()SafariServicesExtras domains:includeDenyButton:responseBlock:
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v16 = [a1 _dialogController];
  id v13 = (void *)MEMORY[0x1E4F78270];
  id v14 = objc_msgSend(v11, "safari_sortedArrayUsingFinderLikeSorting");

  id v15 = [v13 webExtensionAlwaysAllowDialogWithExtension:v12 domains:v14 includeDenyButton:a5 completionHandler:v10];

  [v16 presentDialog:v15];
}

- (void)showPromptForExtensionDisabledBecauseItDoesNotSupportThisVersionOfSafariWithMessage:()SafariServicesExtras extensionIdentifier:
{
  id v4 = a3;
  id v8 = [a1 _dialogController];
  v5 = (void *)MEMORY[0x1E4F78270];
  id v6 = _WBSLocalizedString();
  id v7 = [v5 genericErrorDialogWithTitle:v6 message:v4 applicationModal:1];

  [v8 presentDialog:v7];
}

- (void)showPromptForBlocklistedExtension:()SafariServicesExtras extensionName:
{
  id v5 = a4;
  id v14 = [a1 _dialogController];
  id v6 = (void *)MEMORY[0x1E4F78270];
  id v7 = NSString;
  id v8 = _WBSLocalizedString();
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);
  id v10 = NSString;
  id v11 = _WBSLocalizedString();
  id v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v5);

  id v13 = [v6 genericErrorDialogWithTitle:v9 message:v12 applicationModal:1];
  [v14 presentDialog:v13];
}

- (void)showPromptForExpiredExtension:()SafariServicesExtras extensionName:
{
  id v5 = a4;
  id v11 = [a1 _dialogController];
  id v6 = (void *)MEMORY[0x1E4F78270];
  id v7 = NSString;
  id v8 = _WBSLocalizedString();
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);

  id v10 = [v6 genericErrorDialogWithTitle:v9 message:0 applicationModal:1];
  [v11 presentDialog:v10];
}

- (void)_showPromptForExtensionDisabledBecauseItHasRequestedAdditionalPermissions:()SafariServicesExtras extensionIdentifier:
{
  id v4 = a3;
  id v6 = [a1 _dialogController];
  id v5 = [MEMORY[0x1E4F78270] webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension:v4 completionHandler:&__block_literal_global_15_0];

  [v6 presentDialog:v5];
}

- (void)createNewTabFromBackgroundPageWithURL:()SafariServicesExtras
{
  id v4 = (id *)&a1[*MEMORY[0x1E4F98FE0]];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained sfWebExtensionsControllerLastFocusedWindow:a1];
  [a1 _createTabWithURL:v5 inWindow:v6];
}

- (void)dialogController:()SafariServicesExtras presentViewController:withAdditionalAnimations:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a1 viewControllerToPresentDialogsFrom];
  [v9 presentViewController:v8 animated:1 completion:0];
  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v7);
}

- (void)dialogController:()SafariServicesExtras dismissViewController:withAdditionalAnimations:
{
  id v6 = a5;
  id v8 = a4;
  id v7 = [v8 presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v6);
}

- (uint64_t)dialogController:()SafariServicesExtras presentationPolicyForDialog:
{
  v1 = [a1 viewControllerToPresentDialogsFrom];
  BOOL v2 = v1 == 0;

  return 2 * v2;
}

- (void)presentDialogView:()SafariServicesExtras withAdditionalAnimations:forDialogController:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __break(0xC471u);
}

- (void)dismissDialogView:()SafariServicesExtras withAdditionalAnimations:forDialogController:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __break(0xC471u);
}

- (void)showAccessRequestDialogForExtension:()SafariServicesExtras domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "showAccessRequestDialogForExtension called with empty array of domains.", v1, 2u);
}

@end