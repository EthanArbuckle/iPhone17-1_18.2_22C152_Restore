@interface EKEventTravelTimeEditViewController
+ (id)_cannotProvideDirectionsLocalizedString;
+ (id)_directionsCouldNotBeFoundLocalizedString;
+ (id)_okLocalizedString;
+ (id)_startingLocationLocalizedString;
+ (id)_travelTimeLocalizedString;
- (BOOL)_shouldAutoSelectEstimatedTravelTimeOnLookupCompletion;
- (BOOL)_showingOptions;
- (BOOL)_showingOptionsInitialState;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)editItemViewControllerShouldShowDetachAlert;
- (BOOL)setTravelTimeSelectedChoiceEstimatedRowAtIndex:(unint64_t)a3;
- (EKEventTravelTimeEditViewController)initWithFrame:(CGRect)a3 calendarItem:(id)a4 eventStore:(id)a5;
- (EKStructuredLocation)destinationStructuredLocation;
- (EKStructuredLocation)originStructuredLocation;
- (NSDate)arrivalDate;
- (NSString)description;
- (double)selectedTravelTime;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_errorStringForMapKitErrorCode:(unint64_t)a3;
- (id)_indexPathForSelectedTravelTime;
- (id)_routeEstimationControler;
- (id)_stringForOriginLocation;
- (id)editItemEventToDetach;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_cellStyleForIndexPath:(id)a3;
- (int64_t)_numberOfEstimatedTravelTimeResultRows;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)selectedRoutingMode;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)travelTimeSelectedChoice;
- (unint64_t)_customTravelTimeSection;
- (unint64_t)_estimatedTravelTimeSection;
- (unint64_t)_externallySetValueTravelTimeSection;
- (unint64_t)_toggleSwitchSection;
- (void)_autoselectFromAvailableChoices;
- (void)_checkItemAtIndexPath:(id)a3;
- (void)_contentCategorySizeChanged:(id)a3;
- (void)_handleEstimationControllerTravelTimeLookupErrors;
- (void)_handleOriginLocationErrorsWithAlert:(BOOL)a3;
- (void)_layoutShadowView;
- (void)_locationsChanged;
- (void)_originLocationButtonWasTapped;
- (void)_setEstimationActive:(BOOL)a3;
- (void)_showRouteEstimationAlert;
- (void)_travelTimeActivationSwitchChanged:(id)a3;
- (void)_updateTableView;
- (void)_updateVisibleSections;
- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)loadView;
- (void)resetBackgroundColor;
- (void)routeEstimationControllerDidBeginTravelTimeLookup:(id)a3;
- (void)routeEstimationControllerDidFinishOriginLocationLookup:(id)a3;
- (void)routeEstimationControllerDidFinishTravelTimeLookup:(id)a3;
- (void)setArrivalDate:(id)a3;
- (void)setCell:(id)a3 checked:(BOOL)a4;
- (void)setDestinationStructuredLocation:(id)a3;
- (void)setOriginStructuredLocation:(id)a3;
- (void)setSelectedRoutingMode:(int64_t)a3;
- (void)setSelectedTravelTime:(double)a3;
- (void)setTravelTimeSelectedChoice:(int64_t)a3;
- (void)setTravelTimeSelectedChoiceToFirstValidEstimatedRow;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKEventTravelTimeEditViewController

- (EKEventTravelTimeEditViewController)initWithFrame:(CGRect)a3 calendarItem:(id)a4 eventStore:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)EKEventTravelTimeEditViewController;
  v14 = -[EKEditItemViewController initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_initFrame.origin.double x = x;
    v14->_initFrame.origin.double y = y;
    v14->_initFrame.size.double width = width;
    v14->_initFrame.size.double height = height;
    objc_storeStrong((id *)&v14->_eventStore, a5);
    objc_storeStrong((id *)&v15->_calendarItem, a4);
    v15->_isOriginSelectionVisible = 0;
    routeEstimationErrorMessage = v15->_routeEstimationErrorMessage;
    v15->_routeEstimationErrorMessage = 0;

    v15->_suppressErrors = 1;
    v17 = [(id)objc_opt_class() _travelTimeLocalizedString];
    [(EKEventTravelTimeEditViewController *)v15 setTitle:v17];

    v15->_travelTimeSelectedChoice = 7;
    id v18 = [(EKEventTravelTimeEditViewController *)v15 _routeEstimationControler];
    objc_initWeak(&location, v15);
    v26[0] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__EKEventTravelTimeEditViewController_initWithFrame_calendarItem_eventStore___block_invoke;
    v22[3] = &unk_1E60874F8;
    objc_copyWeak(&v23, &location);
    id v20 = (id)[(EKEventTravelTimeEditViewController *)v15 registerForTraitChanges:v19 withHandler:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __77__EKEventTravelTimeEditViewController_initWithFrame_calendarItem_eventStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(MEMORY[0x1E4F57740], "routeTypeStringForCalLocationRoutingMode:", -[EKEventTravelTimeEditViewController selectedRoutingMode](self, "selectedRoutingMode"));
  v6 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];
  v7 = [v6 title];
  v8 = [(EKEventTravelTimeEditViewController *)self destinationStructuredLocation];
  v9 = [v8 title];
  [(EKEventTravelTimeEditViewController *)self selectedTravelTime];
  v10 = CUIKDisplayStringForTravelTimeUsingShortFormat();
  v11 = [v3 stringWithFormat:@"%@ [%p] - %@ from %@ to %@, taking %@", v4, self, v5, v7, v9, v10];

  return (NSString *)v11;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventTravelTimeEditViewController;
  [(EKEventTravelTimeEditViewController *)&v8 loadView];
  [(EKEventTravelTimeEditViewController *)self _handleOriginLocationErrorsWithAlert:0];
  self->_originalSelectedTravelTime = self->_selectedTravelTime;
  self->_originalSelectedRoutingMode = self->_selectedRoutingMode;
  v3 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  switchControl = self->_switchControl;
  self->_switchControl = v3;

  [(UISwitch *)self->_switchControl addTarget:self action:sel__travelTimeActivationSwitchChanged_ forControlEvents:4096];
  [(UISwitch *)self->_switchControl setOn:[(EKEventTravelTimeEditViewController *)self _showingOptionsInitialState] animated:0];
  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  table = self->_table;
  self->_table = v6;

  [(UITableView *)self->_table setDataSource:self];
  [(UITableView *)self->_table setDelegate:self];
  [(UITableView *)self->_table setRowHeight:*MEMORY[0x1E4FB2F28]];
  [(EKEventTravelTimeEditViewController *)self resetBackgroundColor];
  if (EKUIUnscaledCatalyst())
  {
    [(UITableView *)self->_table setRowHeight:EKUIUnscaledCatalystTableRowHeightDefault()];
    [(UITableView *)self->_table setSeparatorStyle:1];
  }
  [(EKEventTravelTimeEditViewController *)self setView:self->_table];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  table = self->_table;
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [(UITableView *)table setBackgroundColor:v5];
}

- (void)viewDidLoad
{
  [(EKEventTravelTimeEditViewController *)self selectedTravelTime];
  self->_customTravelTimeDuration = v3;
  v4.receiver = self;
  v4.super_class = (Class)EKEventTravelTimeEditViewController;
  [(EKEditItemViewController *)&v4 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventTravelTimeEditViewController;
  [(EKEditItemViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__contentCategorySizeChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  [(EKEventTravelTimeEditViewController *)self _updateVisibleSections];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__EKEventTravelTimeEditViewController_viewWillAppear___block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__EKEventTravelTimeEditViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _autoselectFromAvailableChoices];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventTravelTimeEditViewController;
  [(EKEventTravelTimeEditViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventTravelTimeEditViewController;
  [(EKEditItemViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventTravelTimeEditViewController;
  [(EKEventTravelTimeEditViewController *)&v3 viewDidLayoutSubviews];
  [(EKEventTravelTimeEditViewController *)self _layoutShadowView];
}

- (void)_contentCategorySizeChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__EKEventTravelTimeEditViewController__contentCategorySizeChanged___block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__EKEventTravelTimeEditViewController__contentCategorySizeChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTableView];
}

+ (id)_travelTimeLocalizedString
{
  v2 = EventKitUIBundle();
  objc_super v3 = [v2 localizedStringForKey:@"Travel Time" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)_layoutShadowView
{
  int64_t v3 = [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows];
  BOOL customTimesGroupIsShowing = self->_customTimesGroupIsShowing;
  table = self->_table;
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows")- 1, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
  id v24 = [(UITableView *)table cellForRowAtIndexPath:v6];

  if (!customTimesGroupIsShowing || v3 == 0 || v24 == 0)
  {
    [(UIView *)self->_shadowView removeFromSuperview];
  }
  else
  {
    v9 = self->_table;
    [v24 bounds];
    -[UITableView convertRect:fromView:](v9, "convertRect:fromView:", v24);
    double x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    double v14 = CGRectGetMaxY(v26) + -1.0;
    v27.origin.double x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double v15 = CGRectGetWidth(v27);
    double v16 = EKUIScaleFactor();
    shadowView = self->_shadowView;
    double v18 = 2.0 / v16;
    if (!shadowView)
    {
      id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      id v20 = (UIView *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      v21 = self->_shadowView;
      self->_shadowView = v20;

      v22 = self->_shadowView;
      id v23 = [MEMORY[0x1E4FB1618] colorWithWhite:0.788235294 alpha:1.0];
      [(UIView *)v22 setBackgroundColor:v23];

      [(UIView *)self->_shadowView setAutoresizingMask:2];
      shadowView = self->_shadowView;
    }
    -[UIView setFrame:](shadowView, "setFrame:", x, v14, v15, v18);
    [(UITableView *)self->_table addSubview:self->_shadowView];
    [(UITableView *)self->_table bringSubviewToFront:self->_shadowView];
  }
}

- (BOOL)_shouldAutoSelectEstimatedTravelTimeOnLookupCompletion
{
  return ![(EKEventTravelTimeEditViewController *)self _showingOptionsInitialState];
}

- (BOOL)_showingOptionsInitialState
{
  return self->_originalSelectedTravelTime > 0.0;
}

- (BOOL)_showingOptions
{
  return [(UISwitch *)self->_switchControl isOn];
}

- (void)_updateVisibleSections
{
  checkedItem = self->_checkedItem;
  self->_checkedItem = 0;

  BOOL v4 = [(EKEventTravelTimeEditViewController *)self _showingOptions];
  self->_externallySetValueGroupIsShowing &= v4;
  self->_BOOL customTimesGroupIsShowing = v4;
  BOOL v5 = self->_estimationGroupIsShowing && v4;
  self->_estimationGroupIsShowing = v5;
  uint64_t v6 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];
  if (!v6
    || (v7 = (void *)v6,
        [(EKEventTravelTimeEditViewController *)self originStructuredLocation],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isStructured],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    routeEstimationControler = self->_routeEstimationControler;
    v11 = [(EKEventTravelTimeEditViewController *)self arrivalDate];
    [(EKTravelRouteEstimationController *)routeEstimationControler setArrivalDate:v11];

    id v12 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
    [v12 beginOriginLocationEstimationLookup];
  }

  [(EKEventTravelTimeEditViewController *)self _locationsChanged];
}

- (void)_autoselectFromAvailableChoices
{
  self->_estimatedRowIsChecked = 0;
  self->_externallySetValueGroupIsShowing = 0;
  if ([(EKEventTravelTimeEditViewController *)self _showingOptions])
  {
    int64_t v3 = [(EKEventTravelTimeEditViewController *)self _indexPathForSelectedTravelTime];
    id v12 = v3;
    if (v3)
    {
      if (self->_estimationGroupIsShowing)
      {
        uint64_t v4 = [v3 section];
        BOOL v5 = v4 == [(EKEventTravelTimeEditViewController *)self _customTravelTimeSection];
        int64_t v3 = v12;
        if (v5)
        {
          uint64_t v6 = [v12 row];
          BOOL v7 = v6 < [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows];
          int64_t v3 = v12;
          if (v7)
          {
            self->_estimatedRowIsChecked = 1;
            [(EKEventTravelTimeEditViewController *)self setTravelTimeSelectedChoice:6];
            [(EKEventTravelTimeEditViewController *)self _checkItemAtIndexPath:v12];
LABEL_17:

            return;
          }
        }
      }
      uint64_t v8 = [v3 row];
      uint64_t v9 = v8
         - [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows];
      v10 = self;
    }
    else
    {
      [(EKEventTravelTimeEditViewController *)self selectedTravelTime];
      if (v11 <= 0.0)
      {
        v10 = self;
        uint64_t v9 = 2;
      }
      else
      {
        self->_externallySetValueGroupIsShowing = 1;
        v10 = self;
        uint64_t v9 = 6;
      }
    }
    [(EKEventTravelTimeEditViewController *)v10 setTravelTimeSelectedChoice:v9];
    goto LABEL_17;
  }

  [(EKEventTravelTimeEditViewController *)self setTravelTimeSelectedChoice:7];
}

- (void)_updateTableView
{
  if (self->_isAnimatingTableSections)
  {
    self->_pendingReloadData = 1;
  }
  else
  {
    self->_pendingReloadData = 0;
    [(UITableView *)self->_table reloadData];
    [(EKEventTravelTimeEditViewController *)self _layoutShadowView];
  }
}

- (void)setArrivalDate:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalDate, a3);
  id v5 = a3;
  id v6 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
  [v6 setArrivalDate:v5];
}

- (void)setDestinationStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_destinationStructuredLocation, a3);
  id v5 = a3;
  id v6 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
  [v6 setDestinationStructuredLocation:v5];
}

- (void)setOriginStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_originStructuredLocation, a3);
  id v5 = a3;
  id v6 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
  [v6 setOriginStructuredLocation:v5];

  [(EKEventTravelTimeEditViewController *)self _updateTableView];
}

- (void)setSelectedRoutingMode:(int64_t)a3
{
  self->_selectedRoutingMode = a3;
}

- (int64_t)selectedRoutingMode
{
  return self->_selectedRoutingMode;
}

+ (id)_startingLocationLocalizedString
{
  v2 = EventKitUIBundle();
  int64_t v3 = [v2 localizedStringForKey:@"Starting Location" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)_stringForOriginLocation
{
  v2 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];
  int64_t v3 = [v2 title];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [v2 title];
  }
  else
  {
    id v6 = [v2 address];
    uint64_t v7 = [v6 length];

    if (!v7)
    {
      v10 = EventKitUIBundle();
      double v11 = v10;
      if (v2)
      {
        id v12 = @"Previous Location";
        id v13 = &stru_1F0CC2140;
      }
      else
      {
        id v12 = @"Travel editor no start location";
        id v13 = @"None";
      }
      uint64_t v8 = [v10 localizedStringForKey:v12 value:v13 table:0];

      goto LABEL_6;
    }
    uint64_t v5 = [v2 address];
  }
  uint64_t v8 = (void *)v5;
LABEL_6:

  return v8;
}

- (void)_originLocationButtonWasTapped
{
  double v18 = -[EKLocationEditItemViewController initWithFrame:calendarItem:eventStore:]([EKLocationEditItemViewController alloc], "initWithFrame:calendarItem:eventStore:", self->_calendarItem, self->_eventStore, self->_initFrame.origin.x, self->_initFrame.origin.y, self->_initFrame.size.width, self->_initFrame.size.height);
  [(EKEditItemViewController *)v18 setEditDelegate:self];
  int64_t v3 = [(id)objc_opt_class() _startingLocationLocalizedString];
  [(EKLocationEditItemViewController *)v18 setTitle:v3];

  [(EKEditItemViewController *)v18 setModal:1];
  [(EKEditItemViewController *)v18 setShowsDoneButton:0];
  [(EKLocationEditItemViewController *)v18 setSupportedSearchTypes:7];
  [(EKLocationEditItemViewController *)v18 setForceSingleTextField:1];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v18 action:sel_cancel];
  uint64_t v5 = [(EKLocationEditItemViewController *)v18 navigationItem];
  [v5 setRightBarButtonItem:v4];

  id v6 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];

  if (v6)
  {
    uint64_t v7 = [EKUILocationRowModel alloc];
    uint64_t v8 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];
    uint64_t v9 = [(EKUILocationRowModel *)v7 initWithStructuredLocation:v8];
    [(EKLocationEditItemViewController *)v18 setLocationViewModel:v9];
  }
  v10 = [(EKEventTravelTimeEditViewController *)self presentingViewController];
  double v11 = [v10 presentedViewController];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = [(EKEventTravelTimeEditViewController *)self presentingViewController];
    double v15 = (void *)v14;
    if (v14) {
      double v16 = (EKEventTravelTimeEditViewController *)v14;
    }
    else {
      double v16 = self;
    }
    id v13 = v16;
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v18];
  [v17 setModalPresentationStyle:3];
  self->_isOriginSelectionVisible = 1;
  self->_suppressErrors = 0;
  [(EKEventTravelTimeEditViewController *)v13 presentViewController:v17 animated:1 completion:0];
}

- (void)_locationsChanged
{
  int64_t v3 = [(EKStructuredLocation *)self->_destinationStructuredLocation geoLocation];
  BOOL v4 = v3 != 0;

  [(EKEventTravelTimeEditViewController *)self _setEstimationActive:v4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EKEventTravelTimeEditViewController__locationsChanged__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__EKEventTravelTimeEditViewController__locationsChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTableView];
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  BOOL v4 = [a3 selectedLocation];
  if ([v4 isStructured])
  {
    uint64_t v5 = [v4 duplicate];
    [(EKEventTravelTimeEditViewController *)self setOriginStructuredLocation:v5];

    [(EKEventTravelTimeEditViewController *)self _handleOriginLocationErrorsWithAlert:1];
    [(EKEventTravelTimeEditViewController *)self _locationsChanged];
  }

  return 1;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  id v5 = a3;
  if [v5 modal] && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = [v5 navigationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke;
    v9[3] = &unk_1E6087570;
    v9[4] = self;
    [v6 dismissViewControllerAnimated:1 completion:v9];
  }
  else
  {
    uint64_t v7 = [(EKEventTravelTimeEditViewController *)self navigationController];
    id v8 = (id)[v7 popViewControllerAnimated:1];
  }
}

void __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_2;
  aBlock[3] = &unk_1E6087570;
  aBlock[4] = *(void *)(a1 + 32);
  v2 = (void (**)(void))_Block_copy(aBlock);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1162))
  {
    int64_t v3 = (void *)MEMORY[0x1E4FB1418];
    BOOL v4 = [(id)objc_opt_class() _cannotProvideDirectionsLocalizedString];
    id v5 = EventKitUIBundle();
    id v6 = [v5 localizedStringForKey:@"Cannot get directions to and from the same location." value:&stru_1F0CC2140 table:0];
    uint64_t v7 = [v3 alertControllerWithTitle:v4 message:v6 preferredStyle:1];

    id v8 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v9 = [(id)objc_opt_class() _okLocalizedString];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_3;
    v11[3] = &unk_1E608A3D0;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v2;
    v10 = [v8 actionWithTitle:v9 style:1 handler:v11];

    [v7 addAction:v10];
    [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    v2[2](v2);
  }
}

uint64_t __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1160) = 0;
  return [*(id *)(a1 + 32) _showRouteEstimationAlert];
}

uint64_t __84__EKEventTravelTimeEditViewController_editItemViewController_didCompleteWithAction___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1162) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)routeEstimationControllerDidFinishOriginLocationLookup:(id)a3
{
  BOOL v4 = [a3 evaluatedOriginLocation];
  [(EKEventTravelTimeEditViewController *)self setOriginStructuredLocation:v4];

  [(EKEventTravelTimeEditViewController *)self _locationsChanged];
}

+ (id)_cannotProvideDirectionsLocalizedString
{
  v2 = EventKitUIBundle();
  int64_t v3 = [v2 localizedStringForKey:@"Cannot Provide Directions" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)_handleOriginLocationErrorsWithAlert:(BOOL)a3
{
  id v5 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];
  int v6 = [v5 isEqualToLocation:self->_destinationStructuredLocation];

  if (v6)
  {
    [(EKEventTravelTimeEditViewController *)self setOriginStructuredLocation:0];
    self->_needsShowOriginAlert = a3;
  }
}

+ (id)_okLocalizedString
{
  v2 = EventKitUIBundle();
  int64_t v3 = [v2 localizedStringForKey:@"OK" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)_routeEstimationControler
{
  routeEstimationControler = self->_routeEstimationControler;
  if (!routeEstimationControler)
  {
    BOOL v4 = [EKTravelRouteEstimationController alloc];
    id v5 = [(EKEventTravelTimeEditViewController *)self destinationStructuredLocation];
    int v6 = [(EKTravelRouteEstimationController *)v4 initWithDestinationStructuredLocation:v5 eventStore:self->_eventStore];
    uint64_t v7 = self->_routeEstimationControler;
    self->_routeEstimationControler = v6;

    [(EKTravelRouteEstimationController *)self->_routeEstimationControler setDelegate:self];
    routeEstimationControler = self->_routeEstimationControler;
  }

  return routeEstimationControler;
}

- (void)_showRouteEstimationAlert
{
  if (self->_routeEstimationErrorMessage)
  {
    if (!self->_isOriginSelectionVisible)
    {
      int64_t v3 = (void *)MEMORY[0x1E4FB1418];
      BOOL v4 = [(id)objc_opt_class() _cannotProvideDirectionsLocalizedString];
      id v5 = [v3 alertControllerWithTitle:v4 message:self->_routeEstimationErrorMessage preferredStyle:1];

      objc_initWeak(&location, self);
      int v6 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v7 = [(id)objc_opt_class() _okLocalizedString];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      double v11 = __64__EKEventTravelTimeEditViewController__showRouteEstimationAlert__block_invoke;
      id v12 = &unk_1E6088F20;
      objc_copyWeak(&v13, &location);
      id v8 = [v6 actionWithTitle:v7 style:1 handler:&v9];
      objc_msgSend(v5, "addAction:", v8, v9, v10, v11, v12);

      [(EKEventTravelTimeEditViewController *)self presentViewController:v5 animated:1 completion:0];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __64__EKEventTravelTimeEditViewController__showRouteEstimationAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int64_t v3 = WeakRetained;
    [WeakRetained setOriginStructuredLocation:0];
    v2 = (void *)v3[144];
    v3[144] = 0;

    id WeakRetained = v3;
  }
}

- (void)_setEstimationActive:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
    id v5 = [(EKEventTravelTimeEditViewController *)self arrivalDate];
    [v4 setArrivalDate:v5];

    int v6 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
    uint64_t v7 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];
    [v6 setOriginStructuredLocation:v7];

    id v8 = [(EKEventTravelTimeEditViewController *)self originStructuredLocation];
    LODWORD(v7) = [v8 isStructured];

    if (v7)
    {
      uint64_t v9 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
      [v9 beginTravelTimeEstimationLookup];
    }
    BOOL v10 = [(EKEventTravelTimeEditViewController *)self _showingOptions];
  }
  else
  {
    BOOL v10 = 0;
  }
  self->_estimationGroupIsShowing = v10;
}

- (void)_travelTimeActivationSwitchChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__EKEventTravelTimeEditViewController__travelTimeActivationSwitchChanged___block_invoke;
  v6[3] = &unk_1E6087D68;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __74__EKEventTravelTimeEditViewController__travelTimeActivationSwitchChanged___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isOn] & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 40) + 1192) = 0;
    *(void *)(*(void *)(a1 + 40) + 1184) = 0;
  }
  [*(id *)(a1 + 40) _updateVisibleSections];
  v2 = *(void **)(a1 + 40);

  return [v2 _autoselectFromAvailableChoices];
}

- (void)routeEstimationControllerDidBeginTravelTimeLookup:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__EKEventTravelTimeEditViewController_routeEstimationControllerDidBeginTravelTimeLookup___block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__EKEventTravelTimeEditViewController_routeEstimationControllerDidBeginTravelTimeLookup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTableView];
}

- (void)routeEstimationControllerDidFinishTravelTimeLookup:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__EKEventTravelTimeEditViewController_routeEstimationControllerDidFinishTravelTimeLookup___block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__EKEventTravelTimeEditViewController_routeEstimationControllerDidFinishTravelTimeLookup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleEstimationControllerTravelTimeLookupErrors];
  [*(id *)(a1 + 32) _updateTableView];
  uint64_t result = [*(id *)(a1 + 32) _showingOptions];
  if (result)
  {
    if ([*(id *)(a1 + 32) _shouldAutoSelectEstimatedTravelTimeOnLookupCompletion]) {
      [*(id *)(a1 + 32) setTravelTimeSelectedChoiceToFirstValidEstimatedRow];
    }
    int64_t v3 = *(void **)(a1 + 32);
    return [v3 _autoselectFromAvailableChoices];
  }
  return result;
}

- (void)_handleEstimationControllerTravelTimeLookupErrors
{
  int64_t v3 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
  id v6 = [v3 estimatedTravelTimeRowErrorAtRowIndex:0];

  id v4 = v6;
  if (v6)
  {
    if (self->_suppressErrors)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = -[EKEventTravelTimeEditViewController _errorStringForMapKitErrorCode:](self, "_errorStringForMapKitErrorCode:", [v6 code]);
      id v4 = v6;
    }
    if ([v4 code] != 5) {
      [v6 code];
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_routeEstimationErrorMessage, v5);
      [(EKEventTravelTimeEditViewController *)self _showRouteEstimationAlert];
    }
    [(EKEventTravelTimeEditViewController *)self setOriginStructuredLocation:0];

    id v4 = v6;
  }
}

+ (id)_directionsCouldNotBeFoundLocalizedString
{
  v2 = EventKitUIBundle();
  int64_t v3 = [v2 localizedStringForKey:@"Travel lookup error - directions not found" value:@"Directions could not be found." table:0];

  return v3;
}

- (id)_errorStringForMapKitErrorCode:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 5uLL:
      int64_t v3 = [(id)objc_opt_class() _directionsCouldNotBeFoundLocalizedString];
      goto LABEL_11;
    case 2uLL:
      id v4 = EventKitUIBundle();
      id v5 = v4;
      id v6 = @"Travel lookup error - server failure";
      goto LABEL_7;
    case 3uLL:
      id v4 = EventKitUIBundle();
      id v5 = v4;
      id v6 = @"Travel lookup error - network throttled";
      goto LABEL_7;
    case 4uLL:
      id v4 = EventKitUIBundle();
      id v5 = v4;
      id v6 = @"Travel lookup error - place not found";
      id v7 = @"Directions could not be found.";
      goto LABEL_10;
    default:
      if (a3 == 1001)
      {
        id v4 = EventKitUIBundle();
        id v5 = v4;
        id v6 = @"Travel lookup error - server timeout";
LABEL_7:
        id v7 = @"Network lost.";
      }
      else
      {
        id v4 = EventKitUIBundle();
        id v5 = v4;
        id v6 = @"An unknown error occurred.";
        id v7 = &stru_1F0CC2140;
      }
LABEL_10:
      int64_t v3 = [v4 localizedStringForKey:v6 value:v7 table:0];

LABEL_11:
      return v3;
  }
}

- (void)_checkItemAtIndexPath:(id)a3
{
  id v5 = a3;
  if (([(NSIndexPath *)self->_checkedItem isEqual:v5] & 1) == 0) {
    objc_storeStrong((id *)&self->_checkedItem, a3);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__EKEventTravelTimeEditViewController__checkItemAtIndexPath___block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__EKEventTravelTimeEditViewController__checkItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTableView];
}

- (void)setTravelTimeSelectedChoiceToFirstValidEstimatedRow
{
  int64_t v3 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
  uint64_t v4 = [v3 numberOfOutputRows];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      if ([(EKEventTravelTimeEditViewController *)self setTravelTimeSelectedChoiceEstimatedRowAtIndex:v5])
      {
        break;
      }
      ++v5;
      id v6 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
      unint64_t v7 = [v6 numberOfOutputRows];
    }
    while (v5 < v7);
  }
}

- (BOOL)setTravelTimeSelectedChoiceEstimatedRowAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
  char v6 = [v5 estimatedTravelTimeRowHasErrorAtRowIndex:a3];

  if ((v6 & 1) == 0)
  {
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
    [(EKEventTravelTimeEditViewController *)self _checkItemAtIndexPath:v7];

    id v8 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
    [v8 estimatedTravelTimeValueAtRowIndex:a3];
    -[EKEventTravelTimeEditViewController setSelectedTravelTime:](self, "setSelectedTravelTime:");

    uint64_t v9 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
    self->_selectedRoutingMode = [v9 estimatedTravelTimeRoutingModeAtRowIndex:a3];
  }
  return v6 ^ 1;
}

- (void)setTravelTimeSelectedChoice:(int64_t)a3
{
  if (a3 == 6)
  {
    if (self->_estimatedRowIsChecked)
    {
      id v9 = [(EKEventTravelTimeEditViewController *)self _indexPathForSelectedTravelTime];
      [(EKEventTravelTimeEditViewController *)self _checkItemAtIndexPath:v9];
      unint64_t v5 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
      objc_msgSend(v5, "estimatedTravelTimeValueAtRowIndex:", objc_msgSend(v9, "row"));
      -[EKEventTravelTimeEditViewController setSelectedTravelTime:](self, "setSelectedTravelTime:");
    }
    else
    {
      unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[EKEventTravelTimeEditViewController _externallySetValueTravelTimeSection](self, "_externallySetValueTravelTimeSection"));
      [(EKEventTravelTimeEditViewController *)self _checkItemAtIndexPath:v7];

      double customTravelTimeDuration = self->_customTravelTimeDuration;
      [(EKEventTravelTimeEditViewController *)self setSelectedTravelTime:customTravelTimeDuration];
    }
  }
  else
  {
    if (a3 == 7)
    {
      [(EKEventTravelTimeEditViewController *)self setSelectedTravelTime:0.0];
      [(EKEventTravelTimeEditViewController *)self _checkItemAtIndexPath:0];
    }
    else
    {
      char v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows")+ a3, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
      [(EKEventTravelTimeEditViewController *)self _checkItemAtIndexPath:v6];

      [(EKEventTravelTimeEditViewController *)self setSelectedTravelTime:_travelTimeDurations[a3]];
    }
    self->_selectedRoutingMode = 0;
  }
}

- (int64_t)travelTimeSelectedChoice
{
  return self->_travelTimeSelectedChoice;
}

- (id)_indexPathForSelectedTravelTime
{
  if (self->_selectedTravelTime == 0.0)
  {
    id v2 = 0;
  }
  else
  {
    if (self->_estimationGroupIsShowing
      && [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows] >= 1)
    {
      for (int64_t i = 0;
            [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows] > i;
            ++i)
      {
        unint64_t v5 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
        char v6 = [v5 estimatedTravelTimeRowHasErrorAtRowIndex:i];

        if ((v6 & 1) == 0)
        {
          unint64_t v7 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
          [v7 estimatedTravelTimeValueAtRowIndex:i];
          double v9 = v8;

          BOOL v10 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
          uint64_t v11 = [v10 estimatedTravelTimeRoutingModeAtRowIndex:i];

          id v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", i, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));
          id v2 = v12;
          if (v11 == self->_selectedRoutingMode && v9 == self->_selectedTravelTime) {
            goto LABEL_18;
          }
        }
      }
    }
    id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    uint64_t v14 = 0;
    double selectedTravelTime = self->_selectedTravelTime;
    if (selectedTravelTime == 300.0)
    {
LABEL_15:
      double v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[EKEventTravelTimeEditViewController _numberOfEstimatedTravelTimeResultRows](self, "_numberOfEstimatedTravelTimeResultRows")+ v14, -[EKEventTravelTimeEditViewController _customTravelTimeSection](self, "_customTravelTimeSection"));

      id v2 = v18;
      id v13 = v2;
    }
    else
    {
      uint64_t v16 = 0;
      while (v16 != 6)
      {
        uint64_t v14 = v16 + 1;
        double v17 = _travelTimeDurations[++v16];
        if (v17 == selectedTravelTime) {
          goto LABEL_15;
        }
      }
      id v2 = 0;
    }
  }
LABEL_18:

  return v2;
}

- (unint64_t)_toggleSwitchSection
{
  return 0;
}

- (unint64_t)_estimatedTravelTimeSection
{
  if (self->_estimationGroupIsShowing) {
    return 1;
  }
  else {
    return -1;
  }
}

- (unint64_t)_customTravelTimeSection
{
  unint64_t v2 = 2;
  if (self->_estimationGroupIsShowing) {
    unint64_t v2 = 3;
  }
  unint64_t v3 = 1;
  if (self->_estimationGroupIsShowing) {
    unint64_t v3 = 2;
  }
  if (self->_externallySetValueGroupIsShowing) {
    return v2;
  }
  else {
    return v3;
  }
}

- (unint64_t)_externallySetValueTravelTimeSection
{
  unint64_t v2 = 1;
  if (self->_estimationGroupIsShowing) {
    unint64_t v2 = 2;
  }
  if (self->_externallySetValueGroupIsShowing) {
    return v2;
  }
  else {
    return -1;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(EKEventTravelTimeEditViewController *)self _toggleSwitchSection] == a4)
  {
    if (![(UISwitch *)self->_switchControl isOn])
    {
      char v6 = EventKitUIBundle();
      unint64_t v7 = v6;
      double v8 = @"Add travel time for this event to your calendar. Event alerts will take this time into account and your calendar will be blocked during this time.";
LABEL_7:
      double v9 = [v6 localizedStringForKey:v8 value:&stru_1F0CC2140 table:0];

      goto LABEL_9;
    }
  }
  else if (self->_estimationGroupIsShowing {
         && [(EKEventTravelTimeEditViewController *)self _estimatedTravelTimeSection] == a4)
  }
  {
    char v6 = EventKitUIBundle();
    unint64_t v7 = v6;
    double v8 = @"Select a starting location to automatically determine travel time, or select a time below.";
    goto LABEL_7;
  }
  double v9 = 0;
LABEL_9:

  return v9;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v9 = a3;
  id v6 = a4;
  if (EKUICatalyst())
  {
    unint64_t v7 = [v9 backgroundColor];
    double v8 = [v6 contentView];
    [v8 setBackgroundColor:v7];
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  BOOL v4 = EKUIUnscaledCatalyst();
  double result = *MEMORY[0x1E4FB2F28];
  if (v4) {
    return 45.0;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = 1;
  if (self->_estimationGroupIsShowing) {
    uint64_t v3 = 2;
  }
  return v3 + self->_customTimesGroupIsShowing + (unint64_t)self->_externallySetValueGroupIsShowing;
}

- (int64_t)_numberOfEstimatedTravelTimeResultRows
{
  if (!self->_estimationGroupIsShowing) {
    return 0;
  }
  unint64_t v2 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
  int64_t v3 = [v2 numberOfOutputRows];

  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(EKEventTravelTimeEditViewController *)self _toggleSwitchSection] == a4
    || self->_estimationGroupIsShowing
    && [(EKEventTravelTimeEditViewController *)self _estimatedTravelTimeSection] == a4
    || self->_externallySetValueGroupIsShowing
    && [(EKEventTravelTimeEditViewController *)self _externallySetValueTravelTimeSection] == a4)
  {
    return 1;
  }
  if ([(EKEventTravelTimeEditViewController *)self _customTravelTimeSection] != a4) {
    return 0;
  }
  if (self->_estimationGroupIsShowing) {
    return [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows]+ 6;
  }
  return 6;
}

- (void)setCell:(id)a3 checked:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  id v8 = [v5 labelColor];
  unint64_t v7 = [v6 textLabel];
  [v7 setTextColor:v8];

  [v6 setChecked:v4];
}

- (int64_t)_cellStyleForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (self->_estimationGroupIsShowing
    && (uint64_t v6 = [v4 section],
        v6 == [(EKEventTravelTimeEditViewController *)self _estimatedTravelTimeSection]))
  {
    int64_t v7 = 3;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(EKEventTravelTimeEditViewController *)self _cellStyleForIndexPath:v7];
  uint64_t v9 = [v7 section];
  if (v9 == [(EKEventTravelTimeEditViewController *)self _toggleSwitchSection])
  {
    BOOL v10 = [[EKUITableViewCell alloc] initWithStyle:v8 reuseIdentifier:0];
    [(EKEventStandardTravelTimeCell *)v10 setSelectionStyle:0];
    uint64_t v11 = [(id)objc_opt_class() _travelTimeLocalizedString];
    id v12 = [(EKEventStandardTravelTimeCell *)v10 textLabel];
    [v12 setText:v11];

    [(EKEventStandardTravelTimeCell *)v10 setAccessoryView:self->_switchControl];
    goto LABEL_19;
  }
  if (self->_estimationGroupIsShowing)
  {
    uint64_t v13 = [v7 section];
    if (v13 == [(EKEventTravelTimeEditViewController *)self _estimatedTravelTimeSection])
    {
      BOOL v10 = [[EKUITableViewCell alloc] initWithStyle:v8 reuseIdentifier:0];
      uint64_t v14 = [(id)objc_opt_class() _startingLocationLocalizedString];
      double v15 = [(EKEventStandardTravelTimeCell *)v10 textLabel];
      [v15 setText:v14];

      uint64_t v16 = [(EKEventTravelTimeEditViewController *)self _stringForOriginLocation];
      double v17 = [(EKEventStandardTravelTimeCell *)v10 detailTextLabel];
      [v17 setText:v16];

      [(EKCalendarChooserCell *)v10 setAccessoryType:1];
      goto LABEL_19;
    }
  }
  if (self->_externallySetValueGroupIsShowing
    && (uint64_t v18 = [v7 section],
        v18 == [(EKEventTravelTimeEditViewController *)self _externallySetValueTravelTimeSection]))
  {
    BOOL v10 = [(EKCalendarChooserCell *)[EKEventStandardTravelTimeCell alloc] initWithStyle:v8 reuseIdentifier:0];
    id v19 = CUIKDisplayStringForTravelTimeUsingShortFormat();
    id v20 = [(EKEventStandardTravelTimeCell *)v10 textLabel];
    [v20 setText:v19];
  }
  else
  {
    if (!self->_customTimesGroupIsShowing
      || (uint64_t v21 = [v7 section],
          v21 != [(EKEventTravelTimeEditViewController *)self _customTravelTimeSection]))
    {
      BOOL v10 = 0;
      goto LABEL_19;
    }
    unint64_t v22 = [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows];
    if (self->_estimationGroupIsShowing && [v7 row] < v22)
    {
      id v23 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
      objc_msgSend(v23, "estimatedTravelTimeTableViewCellWithRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
      BOOL v10 = (EKEventStandardTravelTimeCell *)objc_claimAutoreleasedReturnValue();

      id v24 = +[EKCalendarChooserCellLayoutManager sharedLayoutManagerForStyle:[(EKEventStandardTravelTimeCell *)v10 style]];
      [(EKEventStandardTravelTimeCell *)v10 setLayoutManager:v24];

      objc_super v25 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
      int v26 = objc_msgSend(v25, "estimatedTravelTimeRowHasErrorAtRowIndex:", objc_msgSend(v7, "row"));

      if (v26)
      {
        [(EKEventStandardTravelTimeCell *)v10 setSelectionStyle:0];
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    [v7 row];
    BOOL v10 = [(EKCalendarChooserCell *)[EKEventStandardTravelTimeCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v19 = CUIKDisplayStringForTravelTimeUsingShortFormat();
    [(EKCalendarChooserCell *)v10 setTextLabelText:v19];
  }

LABEL_18:
  [(EKEventTravelTimeEditViewController *)self setCell:v10 checked:[(NSIndexPath *)self->_checkedItem isEqual:v7]];
LABEL_19:
  if (EKUICatalyst())
  {
    CGRect v27 = [v6 backgroundColor];
    [(EKEventStandardTravelTimeCell *)v10 setBackgroundColor:v27];
  }
  if (self->_sampleSizingCell)
  {
    if (v10)
    {
LABEL_23:
      v28 = v10;
      goto LABEL_26;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_sampleSizingCell, v10);
    if (v10) {
      goto LABEL_23;
    }
  }
  v28 = (EKEventStandardTravelTimeCell *)objc_opt_new();
LABEL_26:
  v29 = v28;

  return v29;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sampleSizingCell = self->_sampleSizingCell;
  if (sampleSizingCell)
  {
    uint64_t v9 = sampleSizingCell;
  }
  else
  {
    uint64_t v9 = [(EKEventTravelTimeEditViewController *)self tableView:v6 cellForRowAtIndexPath:v7];
  }
  BOOL v10 = v9;
  int64_t v11 = [(EKEventTravelTimeEditViewController *)self _cellStyleForIndexPath:v7];
  id v12 = [(UITableViewCell *)v10 textLabel];
  uint64_t v13 = [v12 font];

  uint64_t v14 = [(UITableViewCell *)v10 detailTextLabel];
  double v15 = [v14 font];

  [v13 _scaledValueForValue:46.0];
  double v17 = v16;
  if (v11 == 3)
  {
    [v15 _scaledValueForValue:15.0];
    double v17 = v17 + v18;
  }
  CalRoundToScreenScale(v17);
  double v20 = v19;

  return v20;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = v7;
  if (self->_estimationGroupIsShowing)
  {
    uint64_t v9 = [v7 section];
    if (v9 == [(EKEventTravelTimeEditViewController *)self _customTravelTimeSection])
    {
      uint64_t v10 = [v8 row];
      if (v10 < [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows])
      {
        int64_t v11 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
        if (objc_msgSend(v11, "estimatedTravelTimeRowHasErrorAtRowIndex:", objc_msgSend(v8, "row")))
        {

LABEL_7:
          id v15 = 0;
          goto LABEL_9;
        }
        id v12 = [(EKEventTravelTimeEditViewController *)self _routeEstimationControler];
        objc_msgSend(v12, "estimatedTravelTimeValueAtRowIndex:", objc_msgSend(v8, "row"));
        double v14 = v13;

        if (v14 == 0.0) {
          goto LABEL_7;
        }
      }
    }
  }
  id v15 = v8;
LABEL_9:

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  uint64_t v5 = [v14 section];
  BOOL v6 = v5 == [(EKEventTravelTimeEditViewController *)self _toggleSwitchSection];
  id v7 = v14;
  if (!v6)
  {
    if (self->_estimationGroupIsShowing)
    {
      uint64_t v8 = [v14 section];
      if (v8 == [(EKEventTravelTimeEditViewController *)self _estimatedTravelTimeSection])
      {
        [(EKEventTravelTimeEditViewController *)self _originLocationButtonWasTapped];
LABEL_13:
        id v7 = v14;
        goto LABEL_14;
      }
    }
    if (self->_externallySetValueGroupIsShowing
      && (uint64_t v9 = [v14 section],
          v9 == [(EKEventTravelTimeEditViewController *)self _externallySetValueTravelTimeSection]))
    {
      uint64_t v10 = self;
      uint64_t v11 = 6;
    }
    else
    {
      unint64_t v12 = [(EKEventTravelTimeEditViewController *)self _numberOfEstimatedTravelTimeResultRows];
      uint64_t v13 = [v14 row];
      if (self->_estimationGroupIsShowing && [v14 row] < v12)
      {
        -[EKEventTravelTimeEditViewController setTravelTimeSelectedChoiceEstimatedRowAtIndex:](self, "setTravelTimeSelectedChoiceEstimatedRowAtIndex:", [v14 row]);
        goto LABEL_13;
      }
      uint64_t v11 = v13 - v12;
      uint64_t v10 = self;
    }
    [(EKEventTravelTimeEditViewController *)v10 setTravelTimeSelectedChoice:v11];
    goto LABEL_13;
  }
LABEL_14:
}

- (double)selectedTravelTime
{
  return self->_selectedTravelTime;
}

- (void)setSelectedTravelTime:(double)a3
{
  self->_double selectedTravelTime = a3;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (EKStructuredLocation)originStructuredLocation
{
  return self->_originStructuredLocation;
}

- (EKStructuredLocation)destinationStructuredLocation
{
  return self->_destinationStructuredLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationStructuredLocation, 0);
  objc_storeStrong((id *)&self->_originStructuredLocation, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_sampleSizingCell, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_routeEstimationControler, 0);
  objc_storeStrong((id *)&self->_routeEstimationErrorMessage, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_checkedItem, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_calendarItem, 0);
}

@end