@interface MediaControlsLanguageOptionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)preferredContentSize;
- (MPAVClippingTableView)tableView;
- (MPRequestResponseController)requestResponseController;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsLanguageOptionsViewController)initWithRouteUID:(id)a3;
- (MediaControlsLanguageOptionsViewControllerDelegate)delegate;
- (NSArray)languageOptionGroups;
- (UIView)materialView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLanguageOptionGroups:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setRequestResponseController:(id)a3;
- (void)setTableView:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MediaControlsLanguageOptionsViewController

- (MediaControlsLanguageOptionsViewController)initWithRouteUID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsLanguageOptionsViewController;
  v5 = [(MediaControlsLanguageOptionsViewController *)&v9 init];
  v6 = v5;
  if (v4 && v5)
  {
    v10[0] = v4;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    v8 = v6;
    MRAVReconnaissanceSessionBeginSearch();
  }
  return v6;
}

void __63__MediaControlsLanguageOptionsViewController_initWithRouteUID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t ExternalDevice = MRAVEndpointGetExternalDevice();
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F31818]) initWithEndpoint:a3];
    if (ExternalDevice)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F31848]) initWithExternalDevice:ExternalDevice];
      [v6 setConnection:v7];
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F76EB0]);
    objc_super v9 = [MEMORY[0x1E4F31A00] emptyPropertySet];
    [v8 setPlayingItemProperties:v9];

    v10 = [MEMORY[0x1E4F76EA0] pathWithRoute:v6 bundleID:0 playerID:0];
    [v8 setPlayerPath:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4F31A20]);
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 992);
    *(void *)(v12 + 992) = v11;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 992) setRequest:v8];
    [*(id *)(*(void *)(a1 + 32) + 992) setNeedsReloadForSignificantRequestChange];
    [*(id *)(*(void *)(a1 + 32) + 992) beginAutomaticResponseLoading];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MediaControlsLanguageOptionsViewController_initWithRouteUID___block_invoke_2;
    block[3] = &unk_1E5F0D7F8;
    id v15 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __63__MediaControlsLanguageOptionsViewController_initWithRouteUID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dismissLanguageOptionsViewController:*(void *)(a1 + 32)];
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)MediaControlsLanguageOptionsViewController;
  [(MediaControlsLanguageOptionsViewController *)&v23 viewDidLoad];
  CCUIExpandedModuleContinuousCornerRadius();
  double v4 = v3;
  v5 = [(MediaControlsLanguageOptionsViewController *)self view];
  [v5 setClipsToBounds:1];

  v6 = [MEMORY[0x1E4FB1618] clearColor];
  v7 = [(MediaControlsLanguageOptionsViewController *)self view];
  [v7 setBackgroundColor:v6];

  id v8 = [(MediaControlsLanguageOptionsViewController *)self view];
  [v8 _setContinuousCornerRadius:v4];

  objc_super v9 = [MEMORY[0x1E4F5AE08] controlCenterDarkMaterial];
  [v9 _setContinuousCornerRadius:v4];
  [(MediaControlsLanguageOptionsViewController *)self setMaterialView:v9];
  v10 = [(MediaControlsLanguageOptionsViewController *)self view];
  [v10 addSubview:v9];

  id v11 = [v9 visualStylingProviderForCategory:1];
  [(MediaControlsLanguageOptionsViewController *)self setVisualStylingProvider:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F31810]);
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v17 = objc_msgSend(v12, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], v14, v15, v16);
  objc_msgSend(v17, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);
  v18 = [MEMORY[0x1E4FB1618] clearColor];
  [v17 setBackgroundColor:v18];

  v19 = [v17 headerBackgroundView];
  [v19 setHidden:1];

  v20 = [v17 footerBackgroundView];
  [v20 setHidden:1];

  objc_msgSend(v17, "setContentInset:", 0.0, 0.0, 24.0, 0.0);
  [v17 setDataSource:self];
  [v17 setDelegate:self];
  [v17 setSectionHeaderHeight:*MEMORY[0x1E4FB2F28]];
  [v17 setAllowsMultipleSelection:1];
  [v17 _setDrawsSeparatorAtTopOfSections:1];
  objc_msgSend(v17, "setScrollIndicatorInsets:", v4, 0.0, v4, 0.0);
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v13, v14, v15, v16);
  [v17 setTableFooterView:v21];

  [v17 registerClass:objc_opt_class() forCellReuseIdentifier:@"_LanguageOptionsCellIdentifier"];
  [v17 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"_LanguageOptionsHeaderIdentifier"];
  [(MediaControlsLanguageOptionsViewController *)self setTableView:v17];
  v22 = [(MediaControlsLanguageOptionsViewController *)self view];
  [v22 addSubview:v17];
}

- (void)setLanguageOptionGroups:(id)a3
{
  objc_storeStrong((id *)&self->_languageOptionGroups, a3);
  if ([(MediaControlsLanguageOptionsViewController *)self isViewLoaded])
  {
    id v4 = [(MediaControlsLanguageOptionsViewController *)self tableView];
    [v4 reloadData];
  }
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsLanguageOptionsViewController;
  [(MediaControlsLanguageOptionsViewController *)&v5 viewWillLayoutSubviews];
  double v3 = [(MediaControlsLanguageOptionsViewController *)self view];
  [v3 bounds];
  -[UIView setFrame:](self->_materialView, "setFrame:");

  id v4 = [(MediaControlsLanguageOptionsViewController *)self view];
  [v4 bounds];
  -[MPAVClippingTableView setFrame:](self->_tableView, "setFrame:");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)preferredContentSize
{
  CCUIDefaultExpandedContentModuleWidth();
  double v4 = v3;
  -[MPAVClippingTableView sizeThatFits:](self->_tableView, "sizeThatFits:");
  if (v5 < v4) {
    double v5 = v4;
  }
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"_LanguageOptionsCellIdentifier" forIndexPath:v6];
  id v8 = -[NSArray objectAtIndexedSubscript:](self->_languageOptionGroups, "objectAtIndexedSubscript:", [v6 section]);
  objc_super v9 = objc_msgSend(v8, "localizedTitleForOptionAtIndex:", objc_msgSend(v6, "row"));
  v10 = [v7 textLabel];
  [v10 setText:v9];

  uint64_t v11 = [v8 indexOfSelectedOption];
  uint64_t v12 = [v6 row];

  if (v11 == v12) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  double v14 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:0];
  double v15 = [v7 textLabel];
  objc_msgSend(v15, "mt_replaceVisualStyling:", v14);

  double v16 = [v14 color];
  [v7 setTintColor:v16];

  v17 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:5];
  v18 = [v7 topSeparatorView];
  objc_msgSend(v18, "mt_replaceVisualStyling:", v17);

  v19 = [v7 bottomSeparatorView];
  objc_msgSend(v19, "mt_replaceVisualStyling:", v17);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_languageOptionGroups count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(NSArray *)self->_languageOptionGroups objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 numberOfOptions];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [v14 deselectRowAtIndexPath:v6 animated:0];
  v7 = [v14 cellForRowAtIndexPath:v6];
  [v7 setAccessoryType:3];

  id v8 = -[NSArray objectAtIndexedSubscript:](self->_languageOptionGroups, "objectAtIndexedSubscript:", [v6 section]);
  uint64_t v9 = [v8 indexOfSelectedOption];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v9, objc_msgSend(v6, "section"));
    uint64_t v11 = [v14 cellForRowAtIndexPath:v10];
    [v11 setAccessoryType:0];
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F76E88];
  uint64_t v13 = objc_msgSend(v8, "changeRequestForOptionAtIndex:", objc_msgSend(v6, "row"));
  [v12 performRequest:v13 completion:0];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  languageOptionGroups = self->_languageOptionGroups;
  id v5 = a4;
  id v6 = -[NSArray objectAtIndexedSubscript:](languageOptionGroups, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v6 indexOfSelectedOption];
  uint64_t v8 = [v5 row];

  return v7 != v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"_LanguageOptionsHeaderIdentifier"];
  uint64_t v7 = [(NSArray *)self->_languageOptionGroups objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 localizedTitle];
  uint64_t v9 = [v6 titleLabel];
  [v9 setText:v8];

  v10 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:0];
  uint64_t v11 = [v6 titleLabel];
  objc_msgSend(v11, "mt_replaceVisualStyling:", v10);

  return v6;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MediaControlsLanguageOptionsViewController_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_1E5F0EE30;
  uint64_t v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__MediaControlsLanguageOptionsViewController_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) response];
  double v3 = [v2 tracklist];
  double v4 = [v3 playingItem];
  id v6 = [v4 languageOptionGroups];

  if ([v6 count])
  {
    [*(id *)(a1 + 40) setLanguageOptionGroups:v6];
    id v5 = [*(id *)(a1 + 40) delegate];
    [v5 didLoadOptionsForLanguageOptionsViewController:*(void *)(a1 + 40)];
  }
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MediaControlsLanguageOptionsViewController_controller_shouldRetryFailedRequestWithError___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  return 0;
}

void __91__MediaControlsLanguageOptionsViewController_controller_shouldRetryFailedRequestWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dismissLanguageOptionsViewController:*(void *)(a1 + 32)];
}

- (NSArray)languageOptionGroups
{
  return self->_languageOptionGroups;
}

- (MediaControlsLanguageOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaControlsLanguageOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MPRequestResponseController)requestResponseController
{
  return self->_requestResponseController;
}

- (void)setRequestResponseController:(id)a3
{
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (MPAVClippingTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void)setVisualStylingProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_requestResponseController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_languageOptionGroups, 0);
}

@end