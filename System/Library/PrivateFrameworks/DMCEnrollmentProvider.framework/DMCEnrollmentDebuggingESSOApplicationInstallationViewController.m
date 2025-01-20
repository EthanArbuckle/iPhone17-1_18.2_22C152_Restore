@interface DMCEnrollmentDebuggingESSOApplicationInstallationViewController
- (BOOL)requiredAppInstalled;
- (DMCEnrollmentConfirmationView)confirmationView;
- (DMCEnrollmentDebuggingESSOApplicationInstallationViewController)initWithDelegate:(id)a3 appBundleIDs:(id)a4 requiredEntitlements:(id)a5;
- (DMCEnrollmentDebuggingESSOApplicationInstallationViewControllerDelegate)delegate;
- (LSApplicationWorkspace)appWorkspace;
- (NSArray)bundleIDs;
- (NSArray)requiredEntitlements;
- (void)_setupNavigationBar;
- (void)applicationsDidInstall:(id)a3;
- (void)leftBarButtonTapped:(id)a3;
- (void)loadView;
- (void)setAppWorkspace:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setConfirmationView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequiredAppInstalled:(BOOL)a3;
- (void)setRequiredEntitlements:(id)a3;
- (void)updateContinueButtonStatus;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentDebuggingESSOApplicationInstallationViewController

- (DMCEnrollmentDebuggingESSOApplicationInstallationViewController)initWithDelegate:(id)a3 appBundleIDs:(id)a4 requiredEntitlements:(id)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = DMCLocalizedString();
  v30.receiver = self;
  v30.super_class = (Class)DMCEnrollmentDebuggingESSOApplicationInstallationViewController;
  v12 = [(DMCEnrollmentTemplateTableViewController *)&v30 initWithIconNames:&unk_26D44B038 title:v11 subTitle:0];

  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v8);
    uint64_t v13 = [v9 copy];
    bundleIDs = v12->_bundleIDs;
    v12->_bundleIDs = (NSArray *)v13;

    uint64_t v15 = [v10 copy];
    requiredEntitlements = v12->_requiredEntitlements;
    v12->_requiredEntitlements = (NSArray *)v15;

    uint64_t v17 = [MEMORY[0x263F01880] defaultWorkspace];
    appWorkspace = v12->_appWorkspace;
    v12->_appWorkspace = (LSApplicationWorkspace *)v17;

    [(LSApplicationWorkspace *)v12->_appWorkspace addObserver:v12];
    v19 = [DMCEnrollmentTableViewTextCell alloc];
    v20 = DMCLocalizedString();
    v21 = [(DMCEnrollmentTableViewTextCell *)v19 initWithText:v20 bold:0];
    v33[0] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    [(DMCEnrollmentTemplateTableViewController *)v12 addCellData:v22 animated:0];

    v23 = [[DMCEnrollmentNameListCell alloc] initWithNames:v9 numberOfColumns:1];
    v32 = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [(DMCEnrollmentTemplateTableViewController *)v12 addSectionWithCellData:v24 animated:0];

    v25 = [DMCEnrollmentTableViewTextCell alloc];
    v26 = DMCLocalizedString();
    v27 = [(DMCEnrollmentTableViewTextCell *)v25 initWithText:v26 bold:0];
    v31 = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    [(DMCEnrollmentTemplateTableViewController *)v12 addSectionWithCellData:v28 animated:0];
  }
  return v12;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentDebuggingESSOApplicationInstallationViewController;
  [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)&v12 loadView];
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  v4 = DMCLocalizedString();
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __75__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_loadView__block_invoke;
  id v9 = &unk_2645E9398;
  objc_copyWeak(&v10, &location);
  v5 = [(DMCEnrollmentConfirmationView *)v3 initWithConfirmationText:v4 cancelText:@" " confirmationAction:&v6 cancelAction:&__block_literal_global_1];

  -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v5, v6, v7, v8, v9);
  [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self setConfirmationView:v5];
  [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self updateContinueButtonStatus];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __75__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 debuggingApplicationInstallationViewController:v3 didReceiveUserAction:1];

    id WeakRetained = v3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentDebuggingESSOApplicationInstallationViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v4 viewWillAppear:a3];
  if (([(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self isBeingPresented] & 1) != 0
    || [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self isMovingToParentViewController])
  {
    [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self _setupNavigationBar];
  }
}

- (void)_setupNavigationBar
{
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4 = [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self delegate];
  [v4 debuggingApplicationInstallationViewController:self didReceiveUserAction:0];
}

- (void)updateContinueButtonStatus
{
  BOOL v3 = [(DMCEnrollmentTemplateTableViewController *)self inProgress];
  id v4 = [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self confirmationView];
  v5 = v4;
  if (v3)
  {
    [v4 setInProgress:1];
  }
  else
  {
    [v4 setInProgress:0];

    BOOL v6 = [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self requiredAppInstalled];
    v5 = [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self confirmationView];
    [v5 setConfirmationButtonEnabled:v6];
  }

  id v7 = [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self view];
  [v7 setNeedsDisplay];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    v29 = self;
    id v30 = v4;
    uint64_t v28 = *(void *)v39;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v31 = v6;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v32 = v8;
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        id v10 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_super v12 = [v9 bundleIdentifier];
          *(_DWORD *)buf = 138543362;
          v43 = v12;
          _os_log_impl(&dword_221CC5000, v11, OS_LOG_TYPE_DEFAULT, "Application (%{public}@) installed.", buf, 0xCu);
        }
        uint64_t v13 = [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self bundleIDs];
        v14 = [v9 bundleIdentifier];
        int v15 = [v13 containsObject:v14];

        if (v15)
        {
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v16 = [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self requiredEntitlements];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (!v17)
          {

LABEL_25:
            [(DMCEnrollmentDebuggingESSOApplicationInstallationViewController *)self setRequiredAppInstalled:1];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __90__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_applicationsDidInstall___block_invoke;
            block[3] = &unk_2645E90A0;
            block[4] = self;
            dispatch_async(MEMORY[0x263EF83A0], block);
            goto LABEL_26;
          }
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v35;
          char v20 = 1;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v35 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              v23 = [v9 entitlementValueForKey:v22 ofClass:objc_opt_class()];
              char v24 = [v23 BOOLValue];

              if ((v24 & 1) == 0)
              {
                v25 = *(NSObject **)DMCLogObjects();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v26 = v25;
                  v27 = [v9 bundleIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v43 = v27;
                  __int16 v44 = 2114;
                  uint64_t v45 = v22;
                  _os_log_impl(&dword_221CC5000, v26, OS_LOG_TYPE_ERROR, "Application (%{public}@) doesn't have the required entitlement: %{public}@", buf, 0x16u);
                }
                char v20 = 0;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
          }
          while (v18);

          self = v29;
          id v4 = v30;
          uint64_t v7 = v28;
          uint64_t v6 = v31;
          if (v20) {
            goto LABEL_25;
          }
        }
        uint64_t v8 = v32 + 1;
      }
      while (v32 + 1 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_26:
}

uint64_t __90__DMCEnrollmentDebuggingESSOApplicationInstallationViewController_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContinueButtonStatus];
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
}

- (DMCEnrollmentDebuggingESSOApplicationInstallationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentDebuggingESSOApplicationInstallationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (NSArray)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (void)setRequiredEntitlements:(id)a3
{
}

- (BOOL)requiredAppInstalled
{
  return self->_requiredAppInstalled;
}

- (void)setRequiredAppInstalled:(BOOL)a3
{
  self->_requiredAppInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlements, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
}

@end