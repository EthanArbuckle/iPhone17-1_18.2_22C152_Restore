@interface HUDataAnalyticsLogListViewController
- (BOOL)bypassInitialItemUpdateReload;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUActivityLoadingView)activityLoadingView;
- (HUDataAnalyticsLogListViewController)init;
- (HUDataAnalyticsLogListViewController)initWithAccessoryGroupItem:(id)a3;
- (HUDataAnalyticsLogListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUDataAnalyticsLogListViewController)initWithMediaProfileContainer:(id)a3;
- (HUDataAnalyticsModuleController)analyticsModuleController;
- (id)hu_preloadContent;
- (id)itemModuleControllers;
- (void)_kickoffReload;
- (void)_watchForReload;
- (void)dataAnalyticsModuleController:(id)a3 didSelectItem:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUDataAnalyticsLogListViewController

- (HUDataAnalyticsLogListViewController)initWithMediaProfileContainer:(id)a3
{
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F690B8]) initWithMediaProfileContainer:v5 delegate:self];
  v15.receiver = self;
  v15.super_class = (Class)HUDataAnalyticsLogListViewController;
  v7 = [(HUItemTableViewController *)&v15 initWithItemManager:v6 tableViewStyle:1];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);
    v9 = [HUDataAnalyticsModuleController alloc];
    v10 = [v6 dataAnalyticsModule];
    uint64_t v11 = [(HUDataAnalyticsModuleController *)v9 initWithModule:v10];
    analyticsModuleController = v8->_analyticsModuleController;
    v8->_analyticsModuleController = (HUDataAnalyticsModuleController *)v11;

    [(HUDataAnalyticsModuleController *)v8->_analyticsModuleController setDataAnalyticsModuleControllerDelegate:v8];
    v13 = HFLocalizedString();
    [(HUDataAnalyticsLogListViewController *)v8 setTitle:v13];
  }
  return v8;
}

- (HUDataAnalyticsLogListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithAccessory_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDataAnalyticsLogListViewController.m", 58, @"%s is unavailable; use %@ instead",
    "-[HUDataAnalyticsLogListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUDataAnalyticsLogListViewController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithAccessory_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDataAnalyticsLogListViewController.m", 63, @"%s is unavailable; use %@ instead",
    "-[HUDataAnalyticsLogListViewController init]",
    v5);

  return 0;
}

- (void)viewDidLoad
{
  v48.receiver = self;
  v48.super_class = (Class)HUDataAnalyticsLogListViewController;
  [(HUItemTableViewController *)&v48 viewDidLoad];
  v3 = [HUActivityLoadingView alloc];
  v4 = -[HUActivityLoadingView initWithFrame:activityIndicatorStyle:](v3, "initWithFrame:activityIndicatorStyle:", 100, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  activityLoadingView = self->_activityLoadingView;
  self->_activityLoadingView = v4;

  v6 = _HULocalizedStringWithDefaultValue(@"HUDataAnalyticsDownloadingText", @"HUDataAnalyticsDownloadingText", 1);
  v7 = [(HUActivityLoadingView *)self->_activityLoadingView textLabel];
  [v7 setText:v6];

  [(HUActivityLoadingView *)self->_activityLoadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HUActivityLoadingView *)self->_activityLoadingView sizeToFit];
  v8 = objc_opt_new();
  v9 = [(HUDataAnalyticsLogListViewController *)self tableView];
  [v9 setBackgroundView:v8];

  v10 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v11 = [(HUDataAnalyticsLogListViewController *)self tableView];
  v12 = [v11 backgroundView];
  [v12 setBackgroundColor:v10];

  v13 = [(HUDataAnalyticsLogListViewController *)self tableView];
  v14 = [v13 backgroundView];
  objc_super v15 = [(HUDataAnalyticsLogListViewController *)self activityLoadingView];
  [v14 addSubview:v15];

  v16 = objc_opt_new();
  v17 = [(HUDataAnalyticsLogListViewController *)self tableView];
  [v17 addLayoutGuide:v16];

  v18 = [v16 heightAnchor];
  v19 = [(HUDataAnalyticsLogListViewController *)self tableView];
  v20 = [v19 heightAnchor];
  v21 = [v18 constraintEqualToAnchor:v20 multiplier:0.3];
  [v21 setActive:1];

  v22 = [v16 topAnchor];
  v23 = [(HUDataAnalyticsLogListViewController *)self tableView];
  v24 = [v23 topAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [(HUDataAnalyticsLogListViewController *)self activityLoadingView];
  v27 = [v26 centerXAnchor];
  v28 = [(HUDataAnalyticsLogListViewController *)self tableView];
  v29 = [v28 backgroundView];
  v30 = [v29 centerXAnchor];
  v31 = [v27 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [(HUDataAnalyticsLogListViewController *)self activityLoadingView];
  v33 = [v32 centerYAnchor];
  v34 = [v16 bottomAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [(HUDataAnalyticsLogListViewController *)self activityLoadingView];
  v37 = [v36 leadingAnchor];
  v38 = [(HUDataAnalyticsLogListViewController *)self view];
  v39 = [v38 layoutMarginsGuide];
  v40 = [v39 leadingAnchor];
  v41 = [v37 constraintGreaterThanOrEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [(HUDataAnalyticsLogListViewController *)self activityLoadingView];
  v43 = [v42 trailingAnchor];
  v44 = [(HUDataAnalyticsLogListViewController *)self view];
  v45 = [v44 layoutMarginsGuide];
  v46 = [v45 trailingAnchor];
  v47 = [v43 constraintLessThanOrEqualToAnchor:v46];
  [v47 setActive:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUDataAnalyticsLogListViewController;
  [(HUItemTableViewController *)&v4 viewWillAppear:a3];
  [(HUDataAnalyticsLogListViewController *)self _watchForReload];
}

- (BOOL)bypassInitialItemUpdateReload
{
  return 1;
}

- (id)itemModuleControllers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUDataAnalyticsLogListViewController *)self analyticsModuleController];
  objc_super v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)dataAnalyticsModuleController:(id)a3 didSelectItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 latestResults];
  uint64_t v9 = *MEMORY[0x1E4F68AB8];
  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v17 = HULocalizedStringWithFormat(@"HUDataAnalyticsLogListViewControllerLoadingFormatString", @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v10);

  v18 = [v7 fetchLog];
  v19 = [[HUTextViewController alloc] initWithTextTitle:v17];
  [(HUTextViewController *)v19 setShowsShareButton:1];
  v20 = [v7 latestResults];
  v21 = [v20 objectForKeyedSubscript:v9];
  [(HUTextViewController *)v19 setTitle:v21];

  [(HUTextViewController *)v19 loadTextFromFuture:v18 textTitle:v17];
  v22 = [(HUDataAnalyticsLogListViewController *)self navigationController];
  [v22 pushViewController:v19 animated:1];

  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke;
  v26[3] = &unk_1E638AA28;
  objc_copyWeak(&v29, &location);
  id v23 = v6;
  id v27 = v23;
  id v24 = v7;
  id v28 = v24;
  id v25 = (id)[v18 addFailureBlock:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_2;
  v5[3] = &unk_1E638AA00;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = a1[4];
  id v8 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F69110] sharedHandler];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F687C8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_3;
  v7[3] = &unk_1E6385250;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_4;
  v5[3] = &unk_1E63862A0;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  [v2 handleError:v3 operationType:v4 options:0 retryBlock:v7 cancelBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v10);
}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained dataAnalyticsModuleController:*(void *)(a1 + 32) didSelectItem:*(void *)(a1 + 40)];
}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  id v2 = (id)[v1 popToViewController:WeakRetained animated:1];
}

- (void)_kickoffReload
{
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = (void *)MEMORY[0x1E4F69230];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 itemProviders];
  id v9 = [v6 setWithArray:v8];
  id v10 = [v5 requestToReloadItemProviders:v9 senderSelector:a2];
  id v11 = (id)[v4 performItemUpdateRequest:v10];

  [(HUDataAnalyticsLogListViewController *)self _watchForReload];
}

- (void)_watchForReload
{
  uint64_t v3 = [(HUDataAnalyticsLogListViewController *)self activityLoadingView];
  [v3 setHidden:0];

  uint64_t v4 = [(HUDataAnalyticsLogListViewController *)self activityLoadingView];
  id v5 = [v4 activityIndicatorView];
  [v5 startAnimating];

  objc_initWeak(&location, self);
  id v6 = [(HUDataAnalyticsLogListViewController *)self analyticsModuleController];
  id v7 = [v6 module];

  id v8 = [v7 logItemProvider];
  id v9 = [v8 logFetchFuture];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke;
  v11[3] = &unk_1E638AA50;
  objc_copyWeak(&v12, &location);
  id v10 = (id)[v9 addCompletionBlock:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = [WeakRetained activityLoadingView];
  [v9 setHidden:1];

  id v10 = [WeakRetained activityLoadingView];
  id v11 = [v10 activityIndicatorView];
  [v11 stopAnimating];

  if (v6)
  {
    id v12 = [MEMORY[0x1E4F69110] sharedHandler];
    uint64_t v13 = *MEMORY[0x1E4F687D0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_2;
    v16[3] = &unk_1E63862A0;
    objc_copyWeak(&v17, v7);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_3;
    v14[3] = &unk_1E63862A0;
    objc_copyWeak(&v15, v7);
    [v12 handleError:v6 operationType:v13 options:0 retryBlock:v16 cancelBlock:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
  }
}

void __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _kickoffReload];
}

void __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUActivityLoadingView)activityLoadingView
{
  return self->_activityLoadingView;
}

- (HUDataAnalyticsModuleController)analyticsModuleController
{
  return self->_analyticsModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsModuleController, 0);
  objc_storeStrong((id *)&self->_activityLoadingView, 0);

  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

- (HUDataAnalyticsLogListViewController)initWithAccessoryGroupItem:(id)a3
{
  uint64_t v4 = [a3 homeKitSettingsVendor];
  id v5 = [v4 homeKitObject];
  id v6 = &unk_1F1AD86A8;
  id v7 = v5;
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  if ([v7 conformsToProtocol:v6]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v8;
  if (!v9)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    uint64_t v13 = NSStringFromProtocol((Protocol *)v6);
    [v11 handleFailureInFunction:v12, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v13 file lineNumber description];

LABEL_7:
    id v10 = 0;
  }

  if (!v10)
  {
    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v14, OS_LOG_TYPE_ERROR, "-[HUDataAnalyticsLogListViewController initWithAccessoryGroupItem:] called without a HFMediaProfileContainer", buf, 2u);
    }
  }
  id v15 = [(HUDataAnalyticsLogListViewController *)self initWithMediaProfileContainer:v10];

  return v15;
}

@end