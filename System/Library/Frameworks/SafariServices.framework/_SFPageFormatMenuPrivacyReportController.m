@interface _SFPageFormatMenuPrivacyReportController
- (BOOL)_presentPromptToTurnOnTrackingProtection;
- (_SFBrowserDocument)document;
- (_SFPageFormatMenuItemControllerDelegate)delegate;
- (_SFPageFormatMenuPrivacyReportController)initWithDocument:(id)a3;
- (_SFSettingsAlertItem)alertItem;
- (void)_dismissPromptIfTrackerProtectionEnabled;
- (void)_initializeManagedProfileConnection;
- (void)_presentPrivacyReport;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation _SFPageFormatMenuPrivacyReportController

- (_SFPageFormatMenuPrivacyReportController)initWithDocument:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPageFormatMenuPrivacyReportController;
  v6 = [(_SFPageFormatMenuPrivacyReportController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  char v3 = objc_opt_respondsToSelector();
  profileConnection = self->_profileConnection;
  if (v3) {
    [(MCProfileConnection *)profileConnection unregisterObserver:self];
  }
  else {
    [(MCProfileConnection *)profileConnection removeObserver:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SFPageFormatMenuPrivacyReportController;
  [(_SFPageFormatMenuPrivacyReportController *)&v5 dealloc];
}

- (_SFSettingsAlertItem)alertItem
{
  char v3 = _WBSLocalizedString();
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  objc_super v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"shield.lefthalf.fill"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke;
  v20[3] = &unk_1E5C72650;
  v20[4] = self;
  v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v4 icon:v5 action:25 handler:v20];

  [v6 setAccessibilityIdentifier:@"ShowPrivacyReport"];
  if (objc_opt_respondsToSelector())
  {
    v7 = [(_SFBrowserDocument *)self->_document trackerInfo];
    BOOL v8 = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled];
    v9 = [MEMORY[0x1E4F98CF0] sharedManager];
    char v10 = [v9 isPrivacyProxyOnForEitherTier];

    if (v8 || (v10) && v8)
    {
      [v6 setSubtitle:@" "];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_2;
      v17[3] = &unk_1E5C72238;
      id v18 = v7;
      id v12 = v6;
      id v19 = v12;
      [v18 updateKnownTrackingThirdPartiesWithCompletionHandler:v17];
      id v13 = v12;
    }
    else
    {
      v14 = _WBSLocalizedString();
      [v6 setSubtitle:v14];

      id v15 = v6;
    }
  }
  else
  {
    id v11 = v6;
  }

  return (_SFSettingsAlertItem *)v6;
}

- (BOOL)_presentPromptToTurnOnTrackingProtection
{
  char v3 = [(_SFPageFormatMenuPrivacyReportController *)self delegate];
  uint64_t v4 = [v3 viewControllerForPresentationForItemController:self];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke;
  v13[3] = &unk_1E5C72678;
  id v5 = v4;
  id v14 = v5;
  v6 = +[SFPrivacyReportOnboardingController onboardingViewControllerWithCompletionHandler:v13];
  if (v6)
  {
    objc_storeWeak((id *)&self->_enableTrackerProtectionViewController, v6);
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke_2;
    v10[3] = &unk_1E5C72238;
    id v11 = v5;
    id v12 = v7;
    id v8 = v7;
    [v11 dismissViewControllerAnimated:1 completion:v10];
  }
  return v6 != 0;
}

- (void)_presentPrivacyReport
{
  char v3 = [SFPrivacyReportViewController alloc];
  uint64_t v4 = [(_SFBrowserDocument *)self->_document webView];
  id v5 = [(SFPrivacyReportViewController *)v3 initWithWebView:v4];

  [(SFPrivacyReportViewController *)v5 setWebsiteDetailShouldSeparateBlockedTrackers:[(_SFBrowserDocument *)self->_document privacyReportShouldSeparateBlockedTrackers]];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v6 = [(_SFBrowserDocument *)self->_document allBrowserHistories];
    [(SFPrivacyReportViewController *)v5 setHistories:v6];

    v7 = [(_SFBrowserDocument *)self->_document allBrowserProfileIdentifiers];
    [(SFPrivacyReportViewController *)v5 setProfileIdentifiers:v7];
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [v8 setModalPresentationStyle:1];
  v9 = [(_SFPageFormatMenuPrivacyReportController *)self delegate];
  char v10 = [v9 viewControllerForPresentationForItemController:self];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65___SFPageFormatMenuPrivacyReportController__presentPrivacyReport__block_invoke;
  v13[3] = &unk_1E5C72238;
  id v14 = v10;
  id v15 = v8;
  id v11 = v8;
  id v12 = v10;
  [v12 dismissViewControllerAnimated:1 completion:v13];
}

- (void)_initializeManagedProfileConnection
{
  char v3 = [MEMORY[0x1E4F74230] sharedConnection];
  profileConnection = self->_profileConnection;
  self->_profileConnection = v3;

  char v5 = objc_opt_respondsToSelector();
  v6 = self->_profileConnection;
  if (v5)
  {
    [(MCProfileConnection *)v6 registerObserver:self];
  }
  else
  {
    [(MCProfileConnection *)v6 addObserver:self];
  }
}

- (void)_dismissPromptIfTrackerProtectionEnabled
{
  if (+[SFBrowserDocumentTrackerInfo trackingPreventionEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_enableTrackerProtectionViewController);
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

- (_SFPageFormatMenuItemControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFPageFormatMenuItemControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SFBrowserDocument)document
{
  return self->_document;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_enableTrackerProtectionViewController);

  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end