@interface ZWMenuViewController
- (AXAssertion)disableDashBoardGesturesAssertion;
- (BOOL)userIsInteractingWithMenu;
- (UITableView)tableView;
- (ZWMenuViewControllerDelegate)delegate;
- (id)_localizedTitleForMenuItemTag:(unint64_t)a3;
- (id)_menuOptionArray;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismissLensEffectChooserViewController:(id)a3;
- (void)_handleZoomFactorSliderDidChange:(id)a3;
- (void)_handleZoomFactorSliderTouchDidBegin:(id)a3;
- (void)_handleZoomFactorSliderTouchDidEnd:(id)a3;
- (void)_invertColorsChange;
- (void)_reloadMenuOptions;
- (void)_reloadTableData;
- (void)_setBackgroundStyleWithInvertColors;
- (void)loadView;
- (void)menuDockPositionChooserViewController:(id)a3 didChooseDockPosition:(id)a4;
- (void)menuLensEffectChooserViewController:(id)a3 didChooseLensEffect:(id)a4;
- (void)menuZoomModeChooserViewController:(id)a3 didChooseZoomMode:(id)a4;
- (void)preferredLensModesDidChange;
- (void)setDelegate:(id)a3;
- (void)setDisableDashBoardGesturesAssertion:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUserIsInteractingWithMenu:(BOOL)a3;
- (void)standbyModeDidChange;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)zoomCurrentLensEffectDidChange;
@end

@implementation ZWMenuViewController

- (void)loadView
{
  id v3 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v4 = objc_alloc((Class)UIVisualEffectView);
  v5 = +[UIBlurEffect effectWithStyle:19];
  id v6 = [v4 initWithEffect:v5];

  [(ZWMenuViewController *)self setTableView:v3];
  v7 = [v6 contentView];
  [v7 addSubview:v3];

  [v6 setAccessibilityIgnoresInvertColors:1];
  [(ZWMenuViewController *)self setView:v6];
  [v3 setDelegate:self];
  [v3 setDataSource:self];
  [v3 setAutoresizingMask:18];
  v8 = +[UIColor clearColor];
  [v3 setBackgroundColor:v8];

  objc_msgSend(v3, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [v3 setAccessibilityContainerType:4];
  v9 = ZWLocString(@"ZW_MENU_TOUCH_CONTAINER_LABEL");
  [v3 setAccessibilityLabel:v9];

  [(ZWMenuViewController *)self _reloadMenuOptions];
  objc_initWeak(&location, self);
  v10 = +[AXSettings sharedInstance];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = __32__ZWMenuViewController_loadView__block_invoke;
  v15 = &unk_78C80;
  objc_copyWeak(&v16, &location);
  [v10 registerUpdateBlock:&v12 forRetrieveSelector:"zoomPeekZoomEverEnabled" withListener:self];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_invertColorsChange" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __32__ZWMenuViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadMenuOptions];
}

- (void)_reloadMenuOptions
{
  fullscreenMenuOptions = self->_fullscreenMenuOptions;
  self->_fullscreenMenuOptions = (NSArray *)&off_7B538;

  pipMenuOptions = self->_pipMenuOptions;
  self->_pipMenuOptions = (NSArray *)&off_7B550;

  dockMenuOptions = self->_dockMenuOptions;
  self->_dockMenuOptions = (NSArray *)&off_7B568;

  id v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 zoomPeekZoomEverEnabled];

  if (v7)
  {
    v8 = self->_fullscreenMenuOptions;
    self->_fullscreenMenuOptions = (NSArray *)&off_7B580;

    v9 = self->_pipMenuOptions;
    self->_pipMenuOptions = (NSArray *)&off_7B598;

    v10 = self->_dockMenuOptions;
    self->_dockMenuOptions = (NSArray *)&off_7B5B0;
  }
  id v11 = [(ZWMenuViewController *)self tableView];
  [v11 reloadData];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ZWMenuViewController;
  [(ZWMenuViewController *)&v5 viewDidLoad];
  id v3 = [(ZWMenuViewController *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  id v4 = [(ZWMenuViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ZWMenuViewController;
  [(ZWMenuViewController *)&v9 viewWillAppear:a3];
  if (ZWUseVibrantBlendModes())
  {
    id v4 = +[UIColor colorWithWhite:0.25 alpha:1.0];
    objc_super v5 = [(ZWMenuViewController *)self tableView];
    [v5 setSeparatorColor:v4];

    id v6 = +[UIBlurEffect effectWithStyle:2];
    unsigned int v7 = +[UIVibrancyEffect effectForBlurEffect:v6];
    v8 = [(ZWMenuViewController *)self tableView];
    [v8 setSeparatorEffect:v7];
  }
  else
  {
    id v6 = +[UIColor colorWithWhite:0.5 alpha:1.0];
    unsigned int v7 = [(ZWMenuViewController *)self tableView];
    [v7 setSeparatorColor:v6];
  }

  [(ZWMenuViewController *)self _reloadTableData];
  [(ZWMenuViewController *)self _setBackgroundStyleWithInvertColors];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ZWMenuViewController;
  [(ZWMenuViewController *)&v6 viewDidAppear:a3];
  id v4 = +[AXAssertion assertionWithType:AXAssertionTypeDisableDashboardSystemGestures identifier:@"Zoom: menu is visible"];
  [(ZWMenuViewController *)self setDisableDashBoardGesturesAssertion:v4];

  objc_super v5 = [(ZWMenuViewController *)self delegate];
  [v5 menuDidAppear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ZWMenuViewController;
  [(ZWMenuViewController *)&v8 viewDidDisappear:a3];
  [(ZWMenuViewController *)self setDisableDashBoardGesturesAssertion:0];
  id v4 = [(ZWMenuViewController *)self view];
  objc_super v5 = [v4 superview];
  if (v5)
  {
  }
  else
  {
    objc_super v6 = [(ZWMenuViewController *)self presentedViewController];

    if (v6) {
      goto LABEL_5;
    }
    id v4 = [(ZWMenuViewController *)self delegate];
    [v4 menuDidDisappear:self];
  }

LABEL_5:
  unsigned int v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)ZWMenuViewController;
  [(ZWMenuViewController *)&v10 viewDidLayoutSubviews];
  id v3 = [(ZWMenuViewController *)self tableView];
  [v3 contentSize];
  double v5 = v4;
  objc_super v6 = [(ZWMenuViewController *)self tableView];
  [v6 bounds];
  BOOL v8 = v5 > v7;
  objc_super v9 = [(ZWMenuViewController *)self tableView];
  [v9 setScrollEnabled:v8];
}

- (void)_invertColorsChange
{
  [(ZWMenuViewController *)self _reloadTableData];

  [(ZWMenuViewController *)self _setBackgroundStyleWithInvertColors];
}

- (id)_menuOptionArray
{
  id v3 = [(ZWMenuViewController *)self delegate];
  unsigned __int8 v4 = [v3 inFullscreenModeForMenuViewController:self];

  if (v4)
  {
    double v5 = &OBJC_IVAR___ZWMenuViewController__fullscreenMenuOptions;
LABEL_7:
    id v10 = *(id *)((char *)&self->super.super.super.super.isa + *v5);
    goto LABEL_8;
  }
  objc_super v6 = [(ZWMenuViewController *)self delegate];
  unsigned __int8 v7 = [v6 inPIPModeForMenuViewController:self];

  if (v7)
  {
    double v5 = &OBJC_IVAR___ZWMenuViewController__pipMenuOptions;
    goto LABEL_7;
  }
  BOOL v8 = [(ZWMenuViewController *)self delegate];
  unsigned int v9 = [v8 inDockedModeForMenuViewController:self];

  if (v9)
  {
    double v5 = &OBJC_IVAR___ZWMenuViewController__dockMenuOptions;
    goto LABEL_7;
  }
  id v10 = &__NSArray0__struct;
LABEL_8:

  return v10;
}

- (void)_reloadTableData
{
  id v3 = [(ZWMenuViewController *)self tableView];
  [v3 reloadData];

  unsigned __int8 v4 = [(ZWMenuViewController *)self tableView];
  [v4 layoutIfNeeded];

  id v5 = [(ZWMenuViewController *)self tableView];
  [v5 contentSize];
  -[ZWMenuViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned __int8 v4 = [(ZWMenuViewController *)self _menuOptionArray];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(ZWMenuViewController *)self _menuOptionArray];
  id v7 = [v5 row];

  BOOL v8 = [v6 objectAtIndex:v7];
  unsigned int v9 = (char *)[v8 unsignedIntegerValue];

  if (v9 == (unsigned char *)&dword_4 + 3)
  {
    id v10 = [[ZWMenuItemZoomLevelSliderTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    [(ZWMenuItemZoomLevelSliderTableViewCell *)v10 setSelectionStyle:0];
    id v11 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v10 zoomLevelSlider];

    [v11 addTarget:self action:"_handleZoomFactorSliderTouchDidBegin:" forControlEvents:65537];
    [v11 addTarget:self action:"_handleZoomFactorSliderDidChange:" forControlEvents:4096];
    [v11 addTarget:self action:"_handleZoomFactorSliderTouchDidEnd:" forControlEvents:262336];
    HIDWORD(v12) = *(&AXZoomMinimumZoomLevel + 1);
    *(float *)&double v12 = AXZoomMinimumZoomLevel;
    [v11 setMinimumValue:v12];
    uint64_t v13 = +[AXSettings sharedInstance];
    [v13 zoomPreferredMaximumZoomScale];
    *(float *)&double v14 = v14;
    [v11 setMaximumValue:v14];

    v15 = [(ZWMenuViewController *)self delegate];
    [v15 zoomFactorForMenuViewController:self];
    *(float *)&double v16 = v16;
    [v11 setValue:v16];
  }
  else
  {
    id v10 = [[ZWMenuItemSimpleButtonTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    v17 = [(ZWMenuViewController *)self _localizedTitleForMenuItemTag:v9];
    v18 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v10 textLabel];
    [v18 setText:v17];

    v19 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v10 textLabel];
    [v19 setNumberOfLines:0];

    v20 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v10 textLabel];
    [v20 setLineBreakMode:0];

    if (ZWUseVibrantBlendModes())
    {
      if (!UIAccessibilityIsInvertColorsEnabled()) {
        [(ZWMenuItemZoomLevelSliderTableViewCell *)v10 _setDrawsAsBackdropOverlayWithBlendMode:3];
      }
      id v11 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [v11 setAutoresizingMask:18];
      double v21 = 0.25;
    }
    else
    {
      id v11 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [v11 setAutoresizingMask:18];
      double v21 = 0.5;
    }
    v22 = +[UIColor colorWithWhite:v21 alpha:1.0];
    [v11 setBackgroundColor:v22];

    [(ZWMenuItemZoomLevelSliderTableViewCell *)v10 setSelectedBackgroundView:v11];
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(ZWMenuViewController *)self _menuOptionArray];
  BOOL v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row"));
  id v9 = [v8 unsignedIntegerValue];

  switch((unint64_t)v9)
  {
    case 0uLL:
      id v10 = [(ZWMenuViewController *)self delegate];
      [v10 toggleLensVisibilityWithMenuViewController:self];
      goto LABEL_5;
    case 1uLL:
    case 3uLL:
    case 4uLL:
      id v10 = objc_opt_new();
      id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
      [v10 setDelegate:self];
      [v11 setModalPresentationStyle:3];
      [v11 setModalTransitionStyle:2];
      [v11 setNavigationBarHidden:1];
      [(ZWMenuViewController *)self presentViewController:v11 animated:1 completion:0];

      goto LABEL_5;
    case 2uLL:
      id v10 = [(ZWMenuViewController *)self delegate];
      [v10 toggleLensResizeModeWithMenuViewController:self];
LABEL_5:

      break;
    case 5uLL:
      double v12 = [(ZWMenuViewController *)self delegate];
      [v12 toggleSlugVisibilityWithMenuViewController:self];
      goto LABEL_8;
    case 6uLL:
      double v12 = [(ZWMenuViewController *)self delegate];
      [v12 togglePeekZoomWithMenuViewController:self];
LABEL_8:

      [(ZWMenuViewController *)self _reloadTableData];
      break;
    default:
      break;
  }
  [v13 deselectRowAtIndexPath:v6 animated:1];
}

- (void)zoomCurrentLensEffectDidChange
{
  id v5 = [(ZWMenuViewController *)self delegate];
  id v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 zoomCurrentLensEffect];
  [v5 menuViewController:self didChooseLensEffect:v4];
}

- (void)_dismissLensEffectChooserViewController:(id)a3
{
}

- (id)_localizedTitleForMenuItemTag:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      unsigned __int8 v4 = [(ZWMenuViewController *)self delegate];
      if ([v4 inStandByForMenuViewController:self]) {
        id v5 = @"ZW_MENU_BUTTON_TOGGLE_ZOOM_IN";
      }
      else {
        id v5 = @"ZW_MENU_BUTTON_TOGGLE_ZOOM_OUT";
      }
      ZWLocString(v5);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      id v7 = @"ZW_MENU_BUTTON_LENS_MODE_LABEL";
      goto LABEL_17;
    case 2uLL:
      id v7 = @"ZW_MENU_BUTTON_RESIZE_LENS_LABEL";
      goto LABEL_17;
    case 3uLL:
      id v7 = @"ZW_MENU_BUTTON_DOCK_POSITION_LABEL";
      goto LABEL_17;
    case 4uLL:
      id v7 = @"ZW_MENU_BUTTON_LENS_EFFECT_LABEL";
      goto LABEL_17;
    case 5uLL:
      BOOL v8 = +[AXSettings sharedInstance];
      unsigned int v9 = [v8 zoomShouldShowSlug];

      if (v9) {
        id v7 = @"ZW_MENU_BUTTON_HIDE_SLUG_LABEL";
      }
      else {
        id v7 = @"ZW_MENU_BUTTON_SHOW_SLUG_LABEL";
      }
LABEL_17:
      ZWLocString(v7);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      id v10 = +[AXSettings sharedInstance];
      unsigned int v11 = [v10 zoomPeekZoomEnabled];

      if (v11) {
        id v6 = @"Enable Force Touch Zoom";
      }
      else {
        id v6 = @"Disable Force Touch Zoom";
      }
      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (void)_setBackgroundStyleWithInvertColors
{
  id v2 = [(ZWMenuViewController *)self popoverPresentationController];
  [v2 _setBackgroundBlurDisabled:1];
}

- (void)_handleZoomFactorSliderDidChange:(id)a3
{
  id v4 = a3;
  id v7 = [(ZWMenuViewController *)self delegate];
  [v4 value];
  float v6 = v5;

  [v7 menuViewController:self adjustZoomFactor:1 animated:v6];
}

- (void)_handleZoomFactorSliderTouchDidBegin:(id)a3
{
}

- (void)_handleZoomFactorSliderTouchDidEnd:(id)a3
{
  id v4 = a3;
  [(ZWMenuViewController *)self setUserIsInteractingWithMenu:0];
  id v7 = [(ZWMenuViewController *)self delegate];
  [v4 value];
  float v6 = v5;

  [v7 menuViewController:self finishedAdjustingZoomFactor:v6];
}

- (void)preferredLensModesDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)ZWMenuViewController;
  [(ZWZoomViewController *)&v2 preferredLensModesDidChange];
}

- (void)standbyModeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)ZWMenuViewController;
  [(ZWZoomViewController *)&v8 standbyModeDidChange];
  id v3 = [(ZWMenuViewController *)self tableView];
  id v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
  float v5 = [v3 cellForRowAtIndexPath:v4];

  float v6 = [(ZWMenuViewController *)self _localizedTitleForMenuItemTag:0];
  id v7 = [v5 textLabel];
  [v7 setText:v6];
}

- (void)menuLensEffectChooserViewController:(id)a3 didChooseLensEffect:(id)a4
{
  id v5 = a4;
  id v6 = [(ZWMenuViewController *)self delegate];
  [v6 menuViewController:self didChooseLensEffect:v5];
}

- (void)menuZoomModeChooserViewController:(id)a3 didChooseZoomMode:(id)a4
{
  id v5 = a4;
  id v6 = [(ZWMenuViewController *)self delegate];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __76__ZWMenuViewController_menuZoomModeChooserViewController_didChooseZoomMode___block_invoke;
  v7[3] = &unk_78CA8;
  v7[4] = self;
  [v6 menuViewController:self didChooseZoomMode:v5 withCompletion:v7];
}

id __76__ZWMenuViewController_menuZoomModeChooserViewController_didChooseZoomMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTableData];
}

- (void)menuDockPositionChooserViewController:(id)a3 didChooseDockPosition:(id)a4
{
  id v5 = a4;
  id v6 = [(ZWMenuViewController *)self delegate];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __84__ZWMenuViewController_menuDockPositionChooserViewController_didChooseDockPosition___block_invoke;
  v7[3] = &unk_78CA8;
  v7[4] = self;
  [v6 menuViewController:self didChooseDockPosition:v5 withCompletion:v7];
}

id __84__ZWMenuViewController_menuDockPositionChooserViewController_didChooseDockPosition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTableData];
}

- (ZWMenuViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWMenuViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)userIsInteractingWithMenu
{
  return self->_userIsInteractingWithMenu;
}

- (void)setUserIsInteractingWithMenu:(BOOL)a3
{
  self->_userIsInteractingWithMenu = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesAssertion
{
  return self->_disableDashBoardGesturesAssertion;
}

- (void)setDisableDashBoardGesturesAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableDashBoardGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dockMenuOptions, 0);
  objc_storeStrong((id *)&self->_pipMenuOptions, 0);

  objc_storeStrong((id *)&self->_fullscreenMenuOptions, 0);
}

@end