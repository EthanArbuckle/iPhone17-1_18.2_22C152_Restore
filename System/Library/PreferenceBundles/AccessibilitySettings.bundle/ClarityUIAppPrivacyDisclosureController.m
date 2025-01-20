@interface ClarityUIAppPrivacyDisclosureController
- (ClarityUIAppPrivacyDisclosureController)initWithApplicationTitle:(id)a3 icon:(id)a4 bundleIdentifier:(id)a5;
- (ClarityUIAppPrivacyDisclosureControllerDelegate)delegate;
- (NSString)bundleIdentifier;
- (void)_didTapCancelButton:(id)a3;
- (void)_didTapOpenAppButton:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ClarityUIAppPrivacyDisclosureController

- (ClarityUIAppPrivacyDisclosureController)initWithApplicationTitle:(id)a3 icon:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = settingsLocString(@"ACCEPT_PRIVACY_TERMS_FOR_APP", @"ClarityUISettings");
  v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v8, v8);

  v21.receiver = self;
  v21.super_class = (Class)ClarityUIAppPrivacyDisclosureController;
  v13 = [(ClarityUIAppPrivacyDisclosureController *)&v21 initWithTitle:v8 detailText:v12 icon:v10 contentLayout:2];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleIdentifier, a5);
    id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v13 action:"_didTapCancelButton:"];
    v15 = [(ClarityUIAppPrivacyDisclosureController *)v13 navigationItem];
    [v15 setRightBarButtonItem:v14];

    v16 = +[OBBoldTrayButton boldButton];
    v17 = settingsLocString(@"OPEN_APP_TITLE", @"ClarityUISettings");
    v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v8);
    [v16 setTitle:v18 forState:0];

    [v16 addTarget:v13 action:"_didTapOpenAppButton:" forControlEvents:0x2000];
    v19 = [(ClarityUIAppPrivacyDisclosureController *)v13 buttonTray];
    [v19 addButton:v16];
  }
  return v13;
}

- (void)_didTapOpenAppButton:(id)a3
{
  v4 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  v5 = +[CLFAppAvailabilityChecker sharedInstance];
  v6 = [(ClarityUIAppPrivacyDisclosureController *)self bundleIdentifier];
  v7 = [v5 standardBundleIdentifierForClarityBundleIdentifier:v6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __64__ClarityUIAppPrivacyDisclosureController__didTapOpenAppButton___block_invoke;
  v8[3] = &unk_20B058;
  v8[4] = self;
  [v4 openApplication:v7 withOptions:0 completion:v8];
}

void __64__ClarityUIAppPrivacyDisclosureController__didTapOpenAppButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if ([v6 code] == (char *)&dword_0 + 1)
    {
      id v8 = [v7 userInfo];
      id v9 = [v8 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v10 = [v9 domain];
      if ([v10 isEqualToString:FBSOpenApplicationErrorDomain])
      {
        v11 = (char *)[v9 code];

        if (v11 == (unsigned char *)&dword_4 + 2) {
          goto LABEL_12;
        }
      }
      else
      {
      }
    }
    v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__ClarityUIAppPrivacyDisclosureController__didTapOpenAppButton___block_invoke_cold_2(a1, (uint64_t)v7, v12);
    }
  }
  else
  {
    v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__ClarityUIAppPrivacyDisclosureController__didTapOpenAppButton___block_invoke_cold_1(a1, v12);
    }
  }

LABEL_12:
}

- (void)_didTapCancelButton:(id)a3
{
  id v4 = [(ClarityUIAppPrivacyDisclosureController *)self delegate];
  [v4 cancelButtonTappedForPrivacyDisclosureController:self];
}

- (ClarityUIAppPrivacyDisclosureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ClarityUIAppPrivacyDisclosureControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __64__ClarityUIAppPrivacyDisclosureController__didTapOpenAppButton___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  v3 = [*(id *)(a1 + 32) bundleIdentifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unexpectedly able to open app that we thought needed preflight: %@", (uint8_t *)&v4, 0xCu);
}

void __64__ClarityUIAppPrivacyDisclosureController__didTapOpenAppButton___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 32) bundleIdentifier];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Unable to open application with bundle identifier %@: %@", (uint8_t *)&v6, 0x16u);
}

@end