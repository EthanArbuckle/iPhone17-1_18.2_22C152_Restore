@interface EKUIIntegrationAlertDisplayer
+ (id)alertControllerForAlert:(id)a3 viewController:(id)a4 options:(unint64_t)a5;
- (EKUIIntegrationAlertDisplayer)initWithViewController:(id)a3 options:(unint64_t)a4;
- (UIViewController)viewControllerForPresentingAlerts;
- (id)_effectiveViewControllerForPresentation;
- (void)displayIntegrationAlert:(id)a3;
- (void)setViewControllerForPresentingAlerts:(id)a3;
@end

@implementation EKUIIntegrationAlertDisplayer

- (EKUIIntegrationAlertDisplayer)initWithViewController:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKUIIntegrationAlertDisplayer;
  v7 = [(EKUIIntegrationAlertDisplayer *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewControllerForPresentingAlerts, v6);
    v8->_options = a4;
  }

  return v8;
}

- (void)displayIntegrationAlert:(id)a3
{
  id v4 = a3;
  id v6 = [(EKUIIntegrationAlertDisplayer *)self _effectiveViewControllerForPresentation];
  v5 = [(id)objc_opt_class() alertControllerForAlert:v4 viewController:v6 options:self->_options];

  [v6 presentViewController:v5 animated:1 completion:0];
}

+ (id)alertControllerForAlert:(id)a3 viewController:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = +[EKUIRecurrenceAlertController _useSheetForViewController:a4 options:2 * (v5 & 3)] ^ 1;
  v9 = (void *)MEMORY[0x1E4FB1418];
  objc_super v10 = [v7 title];
  v11 = [v7 message];
  v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:v8];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [v7 actions];
  uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v18 = [v17 style];
        if (v18 == 2) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = v18 == 1;
        }
        v20 = (void *)MEMORY[0x1E4FB1410];
        v21 = [v17 title];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __80__EKUIIntegrationAlertDisplayer_alertControllerForAlert_viewController_options___block_invoke;
        v25[3] = &unk_1E60874A8;
        v25[4] = v17;
        v22 = [v20 actionWithTitle:v21 style:v19 handler:v25];

        [v12 addAction:v22];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  return v12;
}

uint64_t __80__EKUIIntegrationAlertDisplayer_alertControllerForAlert_viewController_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionChosen];
}

- (id)_effectiveViewControllerForPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForPresentingAlerts);
  v3 = [WeakRetained presentedViewController];

  if (v3)
  {
    do
    {
      id v4 = [WeakRetained presentedViewController];

      char v5 = [v4 presentedViewController];

      id WeakRetained = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = WeakRetained;
  }

  return v4;
}

- (UIViewController)viewControllerForPresentingAlerts
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForPresentingAlerts);

  return (UIViewController *)WeakRetained;
}

- (void)setViewControllerForPresentingAlerts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end