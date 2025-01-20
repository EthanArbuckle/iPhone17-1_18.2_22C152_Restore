@interface FCUIFocusSelectionViewController
+ (id)selectionControllerWithSelectedActivityIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5;
- (FCActivityManager)_activityManager;
- (FCUIActivityControl)selectedControl;
- (FCUIFocusSelectionViewController)initWithSelectedActivityIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5;
- (FCUIFocusSelectionViewControllerDelegate)delegate;
- (NSString)selectedActivityIdentifier;
- (id)_activityControlForActivity:(id)a3;
- (void)_closeButtonTapped:(id)a3;
- (void)_configureActivityListView;
- (void)_setActivityManager:(id)a3;
- (void)_setSelectedControl:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedActivityIdentifier:(id)a3;
- (void)setSelectedControl:(id)a3;
- (void)viewDidLoad;
@end

@implementation FCUIFocusSelectionViewController

+ (id)selectionControllerWithSelectedActivityIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[FCUIFocusSelectionViewController alloc] initWithSelectedActivityIdentifier:v9 title:v8 subtitle:v7];

  return v10;
}

- (FCUIFocusSelectionViewController)initWithSelectedActivityIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v7 = a3;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FCUIFocusSelectionViewController;
  v12 = [(FCUIFocusSelectionViewController *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F3F3A0] sharedActivityManager];
    activityManager = v12->_activityManager;
    v12->_activityManager = (FCActivityManager *)v13;

    [(FCActivityManager *)v12->_activityManager addObserver:v12];
    objc_storeStrong((id *)&v12->_selectedActivityIdentifier, v7);
    if (v10)
    {
      [(FCUIFocusSelectionViewController *)v12 setTitle:v10];
    }
    else
    {
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = [v7 localizedStringForKey:@"FOCUS_SELECTOR_TITLE" value:&stru_26D1B4698 table:0];
      [(FCUIFocusSelectionViewController *)v12 setTitle:v15];
    }
    v16 = v11;
    if (!v11)
    {
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v7 localizedStringForKey:@"FOCUS_SELECTOR_HEADLINE" value:&stru_26D1B4698 table:0];
    }
    objc_storeStrong((id *)&v12->_subtitle, v16);
    if (!v11)
    {
    }
  }

  return v12;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)FCUIFocusSelectionViewController;
  [(FCUIFocusSelectionViewController *)&v27 viewDidLoad];
  v3 = [(FCUIFocusSelectionViewController *)self navigationItem];
  [v3 _setManualScrollEdgeAppearanceProgress:0.0];
  v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:24 target:self action:sel__closeButtonTapped_];
  [v3 setRightBarButtonItem:v4];
  v5 = [(FCUIFocusSelectionViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [MEMORY[0x263F53FE8] materialViewWithRecipe:54];
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v14;

  -[MTMaterialView setFrame:](self->_backgroundMaterialView, "setFrame:", v7, v9, v11, v13);
  [v5 addSubview:self->_backgroundMaterialView];
  [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  CGRectInset(v28, 45.0, 0.0);
  v16 = [(FCUIFocusSelectionViewController *)self traitCollection];
  [v16 displayScale];
  UIRectRoundToScale();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = -[FCUIActivityListView initWithFrame:]([FCUIActivityListView alloc], "initWithFrame:", v18, v20, v22, v24);
  activityListView = self->_activityListView;
  self->_activityListView = v25;

  [(FCUIActivityListView *)self->_activityListView setFooterPinnedToBottom:0];
  [(FCUIActivityListView *)self->_activityListView setDelegate:self];
  [v5 addSubview:self->_activityListView];
  [(FCUIActivityListView *)self->_activityListView setAutoresizingMask:18];
  [(FCUIFocusSelectionViewController *)self _configureActivityListView];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F82E00] _isInAnimationBlock] & 1) == 0)
  {
    [v9 adjustedContentInset];
    double v5 = v4;
    [v9 contentOffset];
    double v7 = fmin(fmax((v5 + v6) * 0.0625, 0.0), 1.0);
    double v8 = [(FCUIFocusSelectionViewController *)self navigationItem];
    [v8 _setManualScrollEdgeAppearanceProgress:v7];
  }
}

- (void)_setSelectedControl:(id)a3
{
  double v13 = (FCUIActivityControl *)a3;
  int v4 = [(FCUIActivityControl *)v13 isSelected];
  double v5 = v13;
  int v6 = v4;
  uint64_t v7 = v4 ^ 1u;
  p_selectedControl = (id *)&self->_selectedControl;
  selectedControl = self->_selectedControl;
  if ((v6 & 1) != 0 || selectedControl != v13)
  {
    [(FCUIActivityControl *)selectedControl setSelected:0];
    id v10 = *p_selectedControl;
    id *p_selectedControl = 0;

    selectedActivityIdentifier = self->_selectedActivityIdentifier;
    self->_selectedActivityIdentifier = 0;

    double v5 = v13;
  }
  if (v6) {
    double v5 = 0;
  }
  objc_storeStrong((id *)&self->_selectedControl, v5);
  [*p_selectedControl setSelected:v7];
  if (v6)
  {
    double v12 = 0;
  }
  else
  {
    uint64_t v7 = [(FCUIActivityControl *)v13 activityDescription];
    double v12 = [(id)v7 activityIdentifier];
  }
  objc_storeStrong((id *)&self->_selectedActivityIdentifier, v12);
  if ((v6 & 1) == 0)
  {
  }
}

- (void)_configureActivityListView
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  activityListView = self->_activityListView;
  int v4 = [(_FCUIFocusSelectionHeaderFooterView *)[_FCUIFocusSelectionHeaderView alloc] initWithText:self->_subtitle];
  [(FCUIActivityListView *)activityListView setHeaderView:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v6 = [(FCActivityManager *)self->_activityManager availableActivities];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v12 = [(FCUIFocusSelectionViewController *)self _activityControlForActivity:v11];
        if (([v11 isPlaceholder] & 1) == 0)
        {
          double v13 = [v11 activityIdentifier];
          int v14 = [v13 isEqual:self->_selectedActivityIdentifier];

          if (v14) {
            [(FCUIFocusSelectionViewController *)self _setSelectedControl:v12];
          }
        }
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  [(FCUIActivityListView *)self->_activityListView setActivityViews:v5];
  v15 = self->_activityListView;
  v16 = [_FCUIFocusSelectionFooterView alloc];
  double v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v18 = [v17 localizedStringForKey:@"FOCUS_SELECTOR_SETTINGS" value:&stru_26D1B4698 table:0];
  double v19 = [(_FCUIFocusSelectionHeaderFooterView *)v16 initWithText:v18];
  [(FCUIActivityListView *)v15 setFooterView:v19];
}

- (id)_activityControlForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [[FCUIActivityControl alloc] initWithActivityDescription:v4 style:2];
  objc_initWeak(&location, self);
  int v6 = (void *)MEMORY[0x263F823D0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__FCUIFocusSelectionViewController__activityControlForActivity___block_invoke;
  v12[3] = &unk_264542D78;
  objc_copyWeak(&v16, &location);
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = v5;
  int v14 = v8;
  v15 = self;
  uint64_t v9 = [v6 actionWithHandler:v12];
  [(FCUIActivityControl *)v8 addAction:v9 forControlEvents:64];
  [(FCUIActivityControl *)v8 setOptionsAction:v9];
  id v10 = v8;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __64__FCUIFocusSelectionViewController__activityControlForActivity___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  v2 = [WeakRetained _activityManager];
  v3 = [a1[4] activityIdentifier];
  id v4 = [v2 activityWithIdentifier:v3];

  if (![v4 isPlaceholder]) {
    goto LABEL_4;
  }
  id v5 = [WeakRetained _activityManager];
  int v6 = [a1[5] activityDescription];
  id v7 = [v5 promotedPlaceholderActivity:v6];

  if (v7)
  {
    [a1[5] setActivityDescription:v7];

LABEL_4:
    [WeakRetained _setSelectedControl:a1[5]];
    uint64_t v8 = [WeakRetained delegate];
    uint64_t v9 = [a1[5] isSelected];
    id v10 = [a1[5] activityDescription];
    [v8 focusSelectionViewController:WeakRetained hasSelected:v9 activity:v10];
    goto LABEL_6;
  }
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v8 localizedStringForKey:@"LINK_FOCUS_ALERT_TITLE" value:&stru_26D1B4698 table:0];
  double v11 = [v8 localizedStringForKey:@"LINK_FOCUS_ALERT_UNABLE_TO_CREATE" value:&stru_26D1B4698 table:0];
  double v12 = [v8 localizedStringForKey:@"OK" value:&stru_26D1B4698 table:0];
  id v13 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v11 preferredStyle:1];
  int v14 = [MEMORY[0x263F82400] actionWithTitle:v12 style:0 handler:0];
  [v13 addAction:v14];
  [WeakRetained presentViewController:v13 animated:1 completion:0];

LABEL_6:
}

- (void)_closeButtonTapped:(id)a3
{
}

- (FCUIFocusSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCUIFocusSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FCActivityManager)_activityManager
{
  return self->_activityManager;
}

- (void)_setActivityManager:(id)a3
{
}

- (NSString)selectedActivityIdentifier
{
  return self->_selectedActivityIdentifier;
}

- (void)setSelectedActivityIdentifier:(id)a3
{
}

- (FCUIActivityControl)selectedControl
{
  return self->_selectedControl;
}

- (void)setSelectedControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedControl, 0);
  objc_storeStrong((id *)&self->_selectedActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_activityListView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end