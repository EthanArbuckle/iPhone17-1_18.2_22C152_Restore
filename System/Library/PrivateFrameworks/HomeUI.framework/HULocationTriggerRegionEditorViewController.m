@interface HULocationTriggerRegionEditorViewController
+ (id)_homeImage;
+ (id)_pinImage;
- (BOOL)_hasLocation;
- (GEOLocationShifter)locationShifter;
- (HMHome)home;
- (HULocationTriggerEditorMapDragRadiusView)dragView;
- (HULocationTriggerRegion)region;
- (HULocationTriggerRegionEditorViewController)initWithCoder:(id)a3;
- (HULocationTriggerRegionEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HULocationTriggerRegionEditorViewController)initWithRegion:(id)a3 home:(id)a4 delegate:(id)a5;
- (HULocationTriggerRegionEditorViewControllerDelegate)delegate;
- (MKLocalSearch)localSearch;
- (MKMapView)mapView;
- (MKPointAnnotation)desiredAddressAnnotation;
- (NSArray)constraints;
- (NSArray)localSearchResults;
- (NSArray)recents;
- (NSIndexPath)selectedIndexPath;
- (UISearchBar)searchBar;
- (UITableView)tableView;
- (UIView)dividerView;
- (double)radiusInPoints;
- (id)_locationForRecentMetadataDictionary:(id)a3;
- (id)_shiftLocationIfNeeded:(id)a3;
- (id)_shiftLocationIfNeeded:(id)a3 isRetry:(BOOL)a4;
- (id)hu_preloadContent;
- (id)showLocationRegionInvalidAlert;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_firstLocalSearchResultRowIndex;
- (int64_t)_firstRecentRowIndex;
- (int64_t)_homeRowIndex;
- (int64_t)_lastRecentRowIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_proximityType;
- (void)_cancel:(id)a3;
- (void)_displayLocation:(id)a3;
- (void)_done:(id)a3;
- (void)_reloadData;
- (void)_resetSearchResults;
- (void)_setupMap;
- (void)_showMapRegionForCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4 animated:(BOOL)a5;
- (void)_updateRecentsWithSearchText:(id)a3;
- (void)_updateUI;
- (void)_updateUIWithRegion:(id)a3;
- (void)loadView;
- (void)mapRadiusView:(id)a3 radiusDidChange:(double)a4 radiusInPoints:(double)a5;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)setConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredAddressAnnotation:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setDragView:(id)a3;
- (void)setLocalSearch:(id)a3;
- (void)setLocalSearchResults:(id)a3;
- (void)setLocationShifter:(id)a3;
- (void)setMapView:(id)a3;
- (void)setRadiusInPoints:(double)a3;
- (void)setRecents:(id)a3;
- (void)setRegion:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HULocationTriggerRegionEditorViewController

- (HULocationTriggerRegionEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithRegion_home_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULocationTriggerRegionEditorViewController.m", 62, @"%s is unavailable; use %@ instead",
    "-[HULocationTriggerRegionEditorViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HULocationTriggerRegionEditorViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithRegion_home_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULocationTriggerRegionEditorViewController.m", 67, @"%s is unavailable; use %@ instead",
    "-[HULocationTriggerRegionEditorViewController initWithCoder:]",
    v6);

  return 0;
}

- (HULocationTriggerRegionEditorViewController)initWithRegion:(id)a3 home:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HULocationTriggerRegionEditorViewController;
  v12 = [(HULocationTriggerRegionEditorViewController *)&v20 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_region, a3);
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    [(HULocationTriggerRegionEditorViewController *)v13 _updateRecentsWithSearchText:0];
    v14 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerRegionEditorTitle", @"HULocationTriggerRegionEditorTitle", 1);
    [(HULocationTriggerRegionEditorViewController *)v13 setTitle:v14];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:v13 action:sel__cancel_];
    v16 = [(HULocationTriggerRegionEditorViewController *)v13 navigationItem];
    [v16 setLeftBarButtonItem:v15];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v13 action:sel__done_];
    v18 = [(HULocationTriggerRegionEditorViewController *)v13 navigationItem];
    [v18 setRightBarButtonItem:v17];
  }
  return v13;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v33 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v8 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v33 setBackgroundColor:v8];

  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42DB8]), "initWithFrame:", v4, v5, v6, v7);
  [(HULocationTriggerRegionEditorViewController *)self setSearchBar:v9];

  id v10 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  [v11 setAutocorrectionType:1];

  v12 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerEditorSearchFieldPlaceholder", @"HULocationTriggerEditorSearchFieldPlaceholder", 1);
  v13 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  [v13 setPlaceholder:v12];

  v14 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  [v14 setDelegate:self];

  [v33 addSubview:self->_searchBar];
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  [(HULocationTriggerRegionEditorViewController *)self setDividerView:v15];

  v16 = [MEMORY[0x1E4F428B8] colorWithWhite:0.8 alpha:1.0];
  v17 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
  [v17 setBackgroundColor:v16];

  v18 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 0, v4, v5, v6, v7);
  [(HULocationTriggerRegionEditorViewController *)self setTableView:v19];

  objc_super v20 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v20 setDataSource:self];

  v21 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v21 setDelegate:self];

  v22 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v22 setKeyboardDismissMode:1];

  double v23 = *MEMORY[0x1E4F43D18];
  v24 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v24 setRowHeight:v23];

  v25 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v25 _scaledValueForValue:44.0];
  double v27 = v26;
  v28 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v28 setEstimatedRowHeight:v27];

  v29 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  v31 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  [v30 deselectRowAtIndexPath:v31 animated:0];

  [(HULocationTriggerRegionEditorViewController *)self _reloadData];
  v32 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v33 addSubview:v32];

  [(HULocationTriggerRegionEditorViewController *)self setView:v33];
  [(HULocationTriggerRegionEditorViewController *)self _updateUI];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HULocationTriggerRegionEditorViewController;
  [(HULocationTriggerRegionEditorViewController *)&v11 viewWillAppear:a3];
  if ([(HULocationTriggerRegionEditorViewController *)self _hasLocation]
    && ([(HULocationTriggerRegionEditorViewController *)self region],
        double v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 regionType],
        v4,
        v5))
  {
    [(HULocationTriggerRegionEditorViewController *)self setSelectedIndexPath:0];
  }
  else
  {
    double v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[HULocationTriggerRegionEditorViewController _homeRowIndex](self, "_homeRowIndex"), 0);
    [(HULocationTriggerRegionEditorViewController *)self setSelectedIndexPath:v6];

    double v7 = [(HULocationTriggerRegionEditorViewController *)self tableView];
    v8 = [(HULocationTriggerRegionEditorViewController *)self selectedIndexPath];
    [v7 selectRowAtIndexPath:v8 animated:1 scrollPosition:1];

    id v9 = [(HULocationTriggerRegionEditorViewController *)self tableView];
    id v10 = [(HULocationTriggerRegionEditorViewController *)self selectedIndexPath];
    [(HULocationTriggerRegionEditorViewController *)self tableView:v9 didSelectRowAtIndexPath:v10];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HULocationTriggerRegionEditorViewController;
  [(HULocationTriggerRegionEditorViewController *)&v6 viewDidAppear:a3];
  double v4 = [(HULocationTriggerRegionEditorViewController *)self dragView];
  uint64_t v5 = [(HULocationTriggerRegionEditorViewController *)self mapView];
  [v5 setDelegate:v4];

  [(HULocationTriggerRegionEditorViewController *)self _setupMap];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HULocationTriggerRegionEditorViewController;
  [(HULocationTriggerRegionEditorViewController *)&v11 viewWillDisappear:a3];
  double v4 = [(HULocationTriggerRegionEditorViewController *)self mapView];
  uint64_t v5 = [(HULocationTriggerRegionEditorViewController *)self mapView];
  objc_super v6 = [v5 annotations];
  [v4 removeAnnotations:v6];

  double v7 = [(HULocationTriggerRegionEditorViewController *)self mapView];
  [v7 setDelegate:0];

  v8 = [(HULocationTriggerRegionEditorViewController *)self dragView];
  [v8 removeFromSuperview];

  id v9 = [(HULocationTriggerRegionEditorViewController *)self dragView];
  [v9 setDelegate:0];

  id v10 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  [v10 resignFirstResponder];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HULocationTriggerRegionEditorViewController;
  [(HULocationTriggerRegionEditorViewController *)&v4 viewDidLayoutSubviews];
  [(HULocationTriggerRegionEditorViewController *)self _setupMap];
  id v3 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v3 scrollToNearestSelectedRowAtScrollPosition:0 animated:0];
}

- (void)updateViewConstraints
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  uint64_t v5 = [v4 leadingAnchor];
  objc_super v6 = [(HULocationTriggerRegionEditorViewController *)self view];
  double v7 = [v6 safeAreaLayoutGuide];
  v8 = [v7 leadingAnchor];
  id v9 = [v5 constraintEqualToAnchor:v8];
  [v3 addObject:v9];

  id v10 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  objc_super v11 = [v10 trailingAnchor];
  v12 = [(HULocationTriggerRegionEditorViewController *)self view];
  v13 = [v12 safeAreaLayoutGuide];
  v14 = [v13 trailingAnchor];
  v15 = [v11 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  v17 = [v16 topAnchor];
  v18 = [(HULocationTriggerRegionEditorViewController *)self view];
  v19 = [v18 safeAreaLayoutGuide];
  objc_super v20 = [v19 topAnchor];
  v21 = [v17 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  v22 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  double v23 = [v22 heightAnchor];
  v24 = [v23 constraintEqualToConstant:44.0];
  [v3 addObject:v24];

  v25 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  double v26 = [v25 leadingAnchor];
  double v27 = [(HULocationTriggerRegionEditorViewController *)self view];
  v28 = [v27 safeAreaLayoutGuide];
  v29 = [v28 leadingAnchor];
  v30 = [v26 constraintEqualToAnchor:v29];
  [v3 addObject:v30];

  v31 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  v32 = [v31 trailingAnchor];
  id v33 = [(HULocationTriggerRegionEditorViewController *)self view];
  v34 = [v33 safeAreaLayoutGuide];
  v35 = [v34 trailingAnchor];
  v36 = [v32 constraintEqualToAnchor:v35];
  [v3 addObject:v36];

  v37 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  v38 = [v37 topAnchor];
  v39 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  v40 = [v39 bottomAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v3 addObject:v41];

  v42 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
  v43 = [v42 superview];

  v44 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  v45 = [v44 bottomAnchor];
  if (v43)
  {
    v46 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
    [v46 topAnchor];
  }
  else
  {
    v46 = [(HULocationTriggerRegionEditorViewController *)self view];
    [v46 bottomAnchor];
  v47 = };
  v48 = [v45 constraintEqualToAnchor:v47];
  [v3 addObject:v48];

  v49 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
  v50 = [v49 superview];

  if (v50)
  {
    v51 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
    v52 = [v51 leadingAnchor];
    v53 = [(HULocationTriggerRegionEditorViewController *)self view];
    v54 = [v53 safeAreaLayoutGuide];
    v55 = [v54 leadingAnchor];
    v56 = [v52 constraintEqualToAnchor:v55];
    [v3 addObject:v56];

    v57 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
    v58 = [v57 trailingAnchor];
    v59 = [(HULocationTriggerRegionEditorViewController *)self view];
    v60 = [v59 safeAreaLayoutGuide];
    v61 = [v60 trailingAnchor];
    v62 = [v58 constraintEqualToAnchor:v61];
    [v3 addObject:v62];

    v63 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
    v64 = [v63 heightAnchor];
    v65 = [MEMORY[0x1E4F42D90] mainScreen];
    [v65 scale];
    v67 = [v64 constraintEqualToConstant:1.0 / v66];
    [v3 addObject:v67];
  }
  v68 = [(HULocationTriggerRegionEditorViewController *)self mapView];
  v69 = [v68 superview];

  if (v69)
  {
    v70 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    v71 = [v70 topAnchor];
    v72 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
    v73 = [v72 bottomAnchor];
    v74 = [v71 constraintEqualToAnchor:v73];
    [v3 addObject:v74];

    v75 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    v76 = [v75 leadingAnchor];
    v77 = [(HULocationTriggerRegionEditorViewController *)self view];
    v78 = [v77 safeAreaLayoutGuide];
    v79 = [v78 leadingAnchor];
    v80 = [v76 constraintEqualToAnchor:v79];
    [v3 addObject:v80];

    v81 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    v82 = [v81 trailingAnchor];
    v83 = [(HULocationTriggerRegionEditorViewController *)self view];
    v84 = [v83 safeAreaLayoutGuide];
    v85 = [v84 trailingAnchor];
    v86 = [v82 constraintEqualToAnchor:v85];
    [v3 addObject:v86];

    v87 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    v88 = [v87 bottomAnchor];
    v89 = [(HULocationTriggerRegionEditorViewController *)self view];
    v90 = [v89 bottomAnchor];
    v91 = [v88 constraintEqualToAnchor:v90];
    [v3 addObject:v91];

    v92 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    v93 = [v92 heightAnchor];
    v94 = [v93 constraintEqualToConstant:300.0];
    [v3 addObject:v94];
  }
  v95 = [(HULocationTriggerRegionEditorViewController *)self constraints];
  char v96 = [v3 isEqual:v95];

  if ((v96 & 1) == 0)
  {
    v97 = (void *)MEMORY[0x1E4F28DC8];
    v98 = [(HULocationTriggerRegionEditorViewController *)self constraints];
    [v97 deactivateConstraints:v98];

    [(HULocationTriggerRegionEditorViewController *)self setConstraints:v3];
    v99 = (void *)MEMORY[0x1E4F28DC8];
    v100 = [(HULocationTriggerRegionEditorViewController *)self constraints];
    [v99 activateConstraints:v100];
  }
  v101.receiver = self;
  v101.super_class = (Class)HULocationTriggerRegionEditorViewController;
  [(HULocationTriggerRegionEditorViewController *)&v101 updateViewConstraints];
}

- (id)showLocationRegionInvalidAlert
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  objc_super v4 = [(HULocationTriggerRegionEditorViewController *)self home];
  uint64_t v5 = [v4 name];
  v12 = HULocalizedStringWithFormat(@"HUPresenceEventUnsupportedCustomLocationAlertMessageResetUsersFormat", @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  v13 = (void *)MEMORY[0x1E4F42728];
  v14 = _HULocalizedStringWithDefaultValue(@"HUPresenceEventUnsupportedCustomLocationAlertTitleResetUsers", @"HUPresenceEventUnsupportedCustomLocationAlertTitleResetUsers", 1);
  v15 = [v13 alertControllerWithTitle:v14 message:v12 preferredStyle:1];

  v16 = (void *)MEMORY[0x1E4F42720];
  v17 = _HULocalizedStringWithDefaultValue(@"HUPresenceEventUnsupportedCustomLocationAlertActionContinue", @"HUPresenceEventUnsupportedCustomLocationAlertActionContinue", 1);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke;
  v29[3] = &unk_1E6385188;
  id v18 = v3;
  id v30 = v18;
  v19 = [v16 actionWithTitle:v17 style:0 handler:v29];
  [v15 addAction:v19];

  objc_super v20 = (void *)MEMORY[0x1E4F42720];
  v21 = _HULocalizedStringWithDefaultValue(@"HUPresenceEventUnsupportedCustomLocationAlertActionCancel", @"HUPresenceEventUnsupportedCustomLocationAlertActionCancel", 1);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke_2;
  v27[3] = &unk_1E6385188;
  id v22 = v18;
  id v28 = v22;
  double v23 = [v20 actionWithTitle:v21 style:1 handler:v27];
  [v15 addAction:v23];

  [(HULocationTriggerRegionEditorViewController *)self presentViewController:v15 animated:1 completion:0];
  v24 = v28;
  id v25 = v22;

  return v25;
}

uint64_t __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __77__HULocationTriggerRegionEditorViewController_showLocationRegionInvalidAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)_updateUI
{
  id v3 = [(HULocationTriggerRegionEditorViewController *)self region];
  [(HULocationTriggerRegionEditorViewController *)self _updateUIWithRegion:v3];
}

- (void)_updateUIWithRegion:(id)a3
{
  id v35 = a3;
  [(HULocationTriggerRegionEditorViewController *)self loadViewIfNeeded];
  BOOL v4 = [(HULocationTriggerRegionEditorViewController *)self _hasLocation];
  uint64_t v5 = [v35 identifier];
  uint64_t v6 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
  [v6 setText:v5];

  if (v4)
  {
    uint64_t v7 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
    [v7 resignFirstResponder];

    uint64_t v8 = [(HULocationTriggerRegionEditorViewController *)self mapView];

    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F30F50]);
      double v10 = *MEMORY[0x1E4F1DB28];
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
      [(HULocationTriggerRegionEditorViewController *)self setMapView:v14];

      v15 = [(HULocationTriggerRegionEditorViewController *)self mapView];
      [v15 setDelegate:self];

      v16 = [(HULocationTriggerRegionEditorViewController *)self mapView];
      [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

      v17 = [(HULocationTriggerRegionEditorViewController *)self mapView];
      [v17 setPitchEnabled:0];

      id v18 = [(HULocationTriggerRegionEditorViewController *)self mapView];
      [v18 setRotateEnabled:0];

      v19 = [(HULocationTriggerRegionEditorViewController *)self mapView];
      [v19 setShowsUserLocation:1];

      objc_super v20 = [HULocationTriggerEditorMapDragRadiusView alloc];
      v21 = [v35 circularRegion];
      [v21 radius];
      double v23 = -[HULocationTriggerEditorMapDragRadiusView initWithFrame:radiusInMeters:delegate:](v20, "initWithFrame:radiusInMeters:delegate:", self, v10, v11, v12, v13, v22);
      [(HULocationTriggerRegionEditorViewController *)self setDragView:v23];

      v24 = [(HULocationTriggerRegionEditorViewController *)self dragView];
      [v24 setAutoresizingMask:18];

      id v25 = [MEMORY[0x1E4F428B8] clearColor];
      double v26 = [(HULocationTriggerRegionEditorViewController *)self dragView];
      [v26 setBackgroundColor:v25];

      double v27 = [(HULocationTriggerRegionEditorViewController *)self mapView];
      id v28 = [(HULocationTriggerRegionEditorViewController *)self dragView];
      [v28 setMapView:v27];

      unint64_t v29 = [(HULocationTriggerRegionEditorViewController *)self _proximityType];
      id v30 = [(HULocationTriggerRegionEditorViewController *)self dragView];
      [v30 setProximity:v29];

      [(MKMapView *)self->_mapView addSubview:self->_dragView];
    }
    v31 = [(HULocationTriggerRegionEditorViewController *)self view];
    [v31 addSubview:self->_mapView];

    v32 = [(HULocationTriggerRegionEditorViewController *)self view];
    [v32 addSubview:self->_dividerView];
  }
  else
  {
    id v33 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    [v33 removeFromSuperview];

    v32 = [(HULocationTriggerRegionEditorViewController *)self dividerView];
    [v32 removeFromSuperview];
  }

  v34 = [(HULocationTriggerRegionEditorViewController *)self view];
  [v34 setNeedsUpdateConstraints];
}

- (void)_updateRecentsWithSearchText:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F5CCE8];
    uint64_t v5 = *MEMORY[0x1E4F5CC98];
    uint64_t v22 = *MEMORY[0x1E4F5CC78];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    uint64_t v8 = [v6 arrayWithObjects:&v22 count:1];
    id v9 = [v4 predicateForKey:v5 inCollection:v8];
    v23[0] = v9;
    double v10 = (void *)MEMORY[0x1E4F5CCE8];
    double v11 = [MEMORY[0x1E4F5CCE8] predicateForKey:*MEMORY[0x1E4F5CC90] matchingText:v7 comparison:1];
    v21[0] = v11;
    double v12 = [MEMORY[0x1E4F5CCE8] predicateForKey:*MEMORY[0x1E4F5CC88] matchingText:v7 comparison:1];

    v21[1] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v14 = [v10 predicateSatisfyingAnySubpredicate:v13];
    v23[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v16 = [v4 predicateSatisfyingAllSubpredicates:v15];
  }
  else
  {
    v16 = 0;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F5CCF0]);
  [v17 setSearchPredicate:v16];
  [v17 setDomains:&unk_1F19B55B8];
  id v18 = [MEMORY[0x1E4F5CCF0] frecencyComparator];
  [v17 setComparator:v18];

  v19 = [MEMORY[0x1E4F5CCE0] defaultInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__HULocationTriggerRegionEditorViewController__updateRecentsWithSearchText___block_invoke;
  v20[3] = &unk_1E63851B0;
  v20[4] = self;
  [v19 performRecentsSearch:v17 queue:MEMORY[0x1E4F14428] completion:v20];
}

void __76__HULocationTriggerRegionEditorViewController__updateRecentsWithSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:a2];
  [*(id *)(a1 + 32) setRecents:v3];

  uint64_t v4 = [*(id *)(a1 + 32) tableView];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [*(id *)(a1 + 32) tableView];
    id v7 = [v6 superview];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      [v8 _reloadData];
    }
  }
}

- (int64_t)_homeRowIndex
{
  return 0;
}

- (int64_t)_firstRecentRowIndex
{
  id v3 = [(HULocationTriggerRegionEditorViewController *)self recents];
  uint64_t v4 = [v3 count];

  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    int64_t v6 = [(HULocationTriggerRegionEditorViewController *)self _homeRowIndex];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v6 + 1;
    }
  }
  return v5;
}

- (int64_t)_lastRecentRowIndex
{
  int64_t v3 = [(HULocationTriggerRegionEditorViewController *)self _firstRecentRowIndex];
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = v3;
    int64_t v6 = [(HULocationTriggerRegionEditorViewController *)self recents];
    int64_t v4 = v5 + [v6 count] - 1;
  }
  return v4;
}

- (int64_t)_firstLocalSearchResultRowIndex
{
  int64_t v3 = [(HULocationTriggerRegionEditorViewController *)self localSearchResults];
  uint64_t v4 = [v3 count];

  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    int64_t v6 = [(HULocationTriggerRegionEditorViewController *)self _lastRecentRowIndex];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v6 = [(HULocationTriggerRegionEditorViewController *)self _homeRowIndex];
    }
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v6 + 1;
    }
  }
  return v5;
}

- (void)_reloadData
{
  id v2 = [(HULocationTriggerRegionEditorViewController *)self tableView];
  [v2 reloadData];
}

- (void)_setupMap
{
  if ([(HULocationTriggerRegionEditorViewController *)self _hasLocation])
  {
    int64_t v3 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    uint64_t v4 = [v3 superview];

    if (v4)
    {
      id v6 = [(HULocationTriggerRegionEditorViewController *)self region];
      int64_t v5 = [v6 location];
      [(HULocationTriggerRegionEditorViewController *)self _displayLocation:v5];
    }
  }
}

- (BOOL)_hasLocation
{
  id v2 = [(HULocationTriggerRegionEditorViewController *)self region];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)_proximityType
{
  BOOL v3 = [(HULocationTriggerRegionEditorViewController *)self region];
  uint64_t v4 = [v3 regionType];

  if (v4 != 1) {
    return 0;
  }
  int64_t v5 = [(HULocationTriggerRegionEditorViewController *)self region];
  id v6 = [v5 circularRegion];
  if ([v6 notifyOnExit]) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 1;
  }

  return v7;
}

- (void)_displayLocation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HULocationTriggerRegionEditorViewController *)self region];
  uint64_t v6 = [v5 regionType];

  if (v6 != 1) {
    goto LABEL_3;
  }
  unint64_t v7 = [(HULocationTriggerRegionEditorViewController *)self region];
  uint64_t v8 = [v7 circularRegion];
  [v8 radius];
  double v10 = v9;

  if (v10 < 100.0) {
LABEL_3:
  }
    double v10 = 100.0;
  double v11 = [(HULocationTriggerRegionEditorViewController *)self _shiftLocationIfNeeded:v4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HULocationTriggerRegionEditorViewController__displayLocation___block_invoke;
  v13[3] = &unk_1E63851D8;
  v13[4] = self;
  *(double *)&v13[5] = v10;
  id v12 = (id)[v11 addSuccessBlock:v13];
}

void __64__HULocationTriggerRegionEditorViewController__displayLocation___block_invoke(uint64_t a1, void *a2)
{
  [a2 coordinate];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) desiredAddressAnnotation];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    double v9 = [*(id *)(a1 + 32) desiredAddressAnnotation];
    [v9 coordinate];
    if (v10 == v4)
    {
      double v11 = [*(id *)(a1 + 32) desiredAddressAnnotation];
      [v11 coordinate];
      double v13 = v12;

      if (v13 == v6) {
        return;
      }
    }
    else
    {
    }
  }
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F30FD8]), "initWithCoordinate:", v4, v6);
  objc_msgSend(*(id *)(a1 + 32), "_showMapRegionForCoordinate:radius:animated:", 1, v4, v6, *(double *)(a1 + 40));
  v14 = [*(id *)(a1 + 32) mapView];
  v15 = [*(id *)(a1 + 32) mapView];
  v16 = [v15 annotations];
  [v14 removeAnnotations:v16];

  [*(id *)(a1 + 32) setDesiredAddressAnnotation:v20];
  id v17 = [*(id *)(a1 + 32) mapView];
  [v17 addAnnotation:v20];

  id v18 = [*(id *)(a1 + 32) mapView];
  v19 = [*(id *)(a1 + 32) desiredAddressAnnotation];
  [v18 selectAnnotation:v19 animated:1];
}

- (id)_locationForRecentMetadataDictionary:(id)a3
{
  id v3 = a3;
  double v4 = [v3 objectForKey:@"latitude"];
  [v4 doubleValue];
  CLLocationDegrees v6 = v5;
  uint64_t v7 = [v3 objectForKey:@"longitude"];
  [v7 doubleValue];
  CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(v6, v8);

  id v10 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  double v11 = [v3 objectForKey:@"hAccuracy"];
  [v11 doubleValue];
  double v13 = v12;
  v14 = [v3 objectForKey:@"vAccuracy"];
  [v14 doubleValue];
  double v16 = v15;
  id v17 = [MEMORY[0x1E4F1C9C8] date];
  id v18 = [v3 objectForKey:@"referenceFrame"];

  v19 = objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v17, objc_msgSend(v18, "integerValue"), v9.latitude, v9.longitude, 0.0, v13, v16);

  return v19;
}

- (void)_showMapRegionForCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  [(HULocationTriggerRegionEditorViewController *)self radiusInPoints];
  double v10 = 3.5;
  if (v11 > 1.0)
  {
    double v12 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    [v12 bounds];
    double v14 = v13;
    [(HULocationTriggerRegionEditorViewController *)self radiusInPoints];
    double v10 = v14 / v15;
  }
  double v16 = MEMORY[0x1C1897BB0](latitude, longitude, 0.0, v10 * a4);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = [(HULocationTriggerRegionEditorViewController *)self mapView];
  objc_msgSend(v23, "regionThatFits:", v16, v18, v20, v22);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  if (v27 >= -180.0
    && v27 <= 180.0
    && v25 >= -90.0
    && v25 <= 90.0
    && v29 >= 0.0
    && v29 <= 180.0
    && v31 >= 0.0
    && v31 <= 360.0)
  {
    id v32 = [(HULocationTriggerRegionEditorViewController *)self mapView];
    objc_msgSend(v32, "setRegion:animated:", v5, v25, v27, v29, v31);
  }
}

- (void)setRegion:(id)a3
{
  BOOL v5 = (HULocationTriggerRegion *)a3;
  if (self->_region != v5)
  {
    CLLocationDegrees v8 = v5;
    objc_storeStrong((id *)&self->_region, a3);
    unint64_t v6 = [(HULocationTriggerRegionEditorViewController *)self _proximityType];
    uint64_t v7 = [(HULocationTriggerRegionEditorViewController *)self dragView];
    [v7 setProximity:v6];

    BOOL v5 = v8;
  }
}

- (void)_cancel:(id)a3
{
  id v4 = [(HULocationTriggerRegionEditorViewController *)self delegate];
  [v4 regionEditorDidCancel:self];
}

- (void)_done:(id)a3
{
  id v5 = [(HULocationTriggerRegionEditorViewController *)self delegate];
  id v4 = [(HULocationTriggerRegionEditorViewController *)self region];
  [v5 regionEditor:self didFinishWithRegion:v4];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(HULocationTriggerRegionEditorViewController *)self _homeRowIndex];
  unint64_t v6 = [(HULocationTriggerRegionEditorViewController *)self recents];
  uint64_t v7 = [v6 count];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  CLLocationCoordinate2D v9 = [(HULocationTriggerRegionEditorViewController *)self localSearchResults];
  int64_t v10 = v8 + [v9 count];

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setOpaque:0];
  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"locationCell"];
  if (!v7) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:3 reuseIdentifier:@"locationCell"];
  }
  uint64_t v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  CLLocationCoordinate2D v9 = [v7 textLabel];
  [v9 setFont:v8];

  int64_t v10 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
  double v11 = [v7 detailTextLabel];
  [v11 setFont:v10];

  int64_t v12 = [(HULocationTriggerRegionEditorViewController *)self _firstRecentRowIndex];
  uint64_t v13 = [(HULocationTriggerRegionEditorViewController *)self _firstLocalSearchResultRowIndex];
  uint64_t v14 = [v6 row];
  if (v14 == [(HULocationTriggerRegionEditorViewController *)self _homeRowIndex])
  {
    double v15 = _HULocalizedStringWithDefaultValue(@"HULocationTriggerEditorOptionHome", @"HULocationTriggerEditorOptionHome", 1);
    double v16 = [(id)objc_opt_class() _homeImage];
    double v17 = 0;
    goto LABEL_14;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL
    || [v6 row] < v12
    || (uint64_t v18 = [v6 row],
        v18 > [(HULocationTriggerRegionEditorViewController *)self _lastRecentRowIndex]))
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL || [v6 row] < v13)
    {
      double v17 = 0;
      double v16 = 0;
      double v15 = 0;
      goto LABEL_14;
    }
    uint64_t v19 = [v6 row] - v13;
    double v20 = [(HULocationTriggerRegionEditorViewController *)self localSearchResults];
    double v21 = [v20 objectAtIndexedSubscript:v19];

    double v15 = [v21 name];
    uint64_t v22 = [v21 _shortAddress];
  }
  else
  {
    uint64_t v23 = [v6 row] - v12;
    double v24 = [(HULocationTriggerRegionEditorViewController *)self recents];
    double v21 = [v24 objectAtIndexedSubscript:v23];

    double v15 = [v21 displayName];
    uint64_t v22 = [v21 address];
  }
  double v17 = (void *)v22;
  double v16 = [(id)objc_opt_class() _pinImage];

LABEL_14:
  double v25 = [v7 textLabel];
  [v25 setText:v15];

  double v26 = [v7 detailTextLabel];
  [v26 setText:v17];

  double v27 = [v7 imageView];
  [v27 setImage:v16];

  double v28 = [(HULocationTriggerRegionEditorViewController *)self selectedIndexPath];
  if ([v6 isEqual:v28])
  {
    if ([(HULocationTriggerRegionEditorViewController *)self _hasLocation]) {
      uint64_t v29 = 3;
    }
    else {
      uint64_t v29 = 0;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
  [v7 setAccessoryType:v29];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v32 = a4;
  id v6 = a3;
  [v6 deselectRowAtIndexPath:v32 animated:1];
  uint64_t v7 = [(HULocationTriggerRegionEditorViewController *)self selectedIndexPath];
  uint64_t v8 = [v6 cellForRowAtIndexPath:v7];
  [v8 setAccessoryType:0];

  CLLocationCoordinate2D v9 = [v6 cellForRowAtIndexPath:v32];

  [v9 setAccessoryType:3];
  [(HULocationTriggerRegionEditorViewController *)self setSelectedIndexPath:v32];
  int64_t v10 = [(HULocationTriggerRegionEditorViewController *)self region];
  int64_t v11 = [(HULocationTriggerRegionEditorViewController *)self _firstRecentRowIndex];
  int64_t v12 = [(HULocationTriggerRegionEditorViewController *)self _firstLocalSearchResultRowIndex];
  uint64_t v13 = [v32 row];
  if (v13 == [(HULocationTriggerRegionEditorViewController *)self _homeRowIndex])
  {
    uint64_t v14 = [(HULocationTriggerRegionEditorViewController *)self home];
    double v15 = [(HULocationTriggerRegionEditorViewController *)self region];
    double v16 = +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v14, [v15 eventType]);
    goto LABEL_15;
  }
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && [v32 row] >= v11)
  {
    uint64_t v17 = [v32 row];
    if (v17 <= [(HULocationTriggerRegionEditorViewController *)self _lastRecentRowIndex])
    {
      uint64_t v23 = [v32 row] - v11;
      double v24 = [(HULocationTriggerRegionEditorViewController *)self recents];
      double v20 = [v24 objectAtIndexedSubscript:v23];

      double v25 = [v20 metadata];
      uint64_t v14 = [(HULocationTriggerRegionEditorViewController *)self _locationForRecentMetadataDictionary:v25];

      uint64_t v22 = [v20 address];
      goto LABEL_11;
    }
  }
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && [v32 row] >= v12)
  {
    uint64_t v18 = [v32 row] - v12;
    uint64_t v19 = [(HULocationTriggerRegionEditorViewController *)self localSearchResults];
    double v20 = [v19 objectAtIndexedSubscript:v18];

    double v21 = [v20 placemark];
    uint64_t v14 = [v21 location];

    uint64_t v22 = [v20 name];
LABEL_11:
    double v15 = (void *)v22;

    goto LABEL_12;
  }
  double v15 = 0;
  uint64_t v14 = 0;
LABEL_12:
  double v26 = [v10 circularRegion];
  if (v26)
  {
    double v27 = [v10 circularRegion];
    [v27 radius];
  }
  id v28 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  [v14 coordinate];
  uint64_t v29 = objc_msgSend(v28, "initWithCenter:radius:identifier:", v15);
  objc_msgSend(v29, "setReferenceFrame:", objc_msgSend(v14, "referenceFrame"));
  double v30 = [(HULocationTriggerRegionEditorViewController *)self region];
  objc_msgSend(v29, "setNotifyOnEntry:", objc_msgSend(v30, "eventType") == 1);

  double v31 = [(HULocationTriggerRegionEditorViewController *)self region];
  objc_msgSend(v29, "setNotifyOnExit:", objc_msgSend(v31, "eventType") == 2);

  double v16 = +[HULocationTriggerRegion customRegionWithCircularRegion:v29];

LABEL_15:
  [(HULocationTriggerRegionEditorViewController *)self setRegion:v16];
  [(HULocationTriggerRegionEditorViewController *)self _updateUI];
}

- (void)mapRadiusView:(id)a3 radiusDidChange:(double)a4 radiusInPoints:(double)a5
{
  -[HULocationTriggerRegionEditorViewController setRadiusInPoints:](self, "setRadiusInPoints:", a3, a5);
  uint64_t v7 = [(HULocationTriggerRegionEditorViewController *)self region];
  uint64_t v8 = [v7 regionType];

  if (v8 == 1)
  {
    CLLocationCoordinate2D v9 = [(HULocationTriggerRegionEditorViewController *)self region];
    int64_t v10 = [v9 circularRegion];

    id v11 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    [v10 center];
    double v13 = v12;
    double v15 = v14;
    double v16 = [v10 identifier];
    uint64_t v17 = objc_msgSend(v11, "initWithCenter:radius:identifier:", v16, v13, v15, a4);

    objc_msgSend(v17, "setNotifyOnEntry:", objc_msgSend(v10, "notifyOnEntry"));
    objc_msgSend(v17, "setNotifyOnExit:", objc_msgSend(v10, "notifyOnExit"));
    objc_msgSend(v17, "setReferenceFrame:", objc_msgSend(v10, "referenceFrame"));
    uint64_t v18 = +[HULocationTriggerRegion customRegionWithCircularRegion:v17];
    [(HULocationTriggerRegionEditorViewController *)self setRegion:v18];

    uint64_t v19 = [(HULocationTriggerRegionEditorViewController *)self region];
    double v20 = [v19 location];
    double v21 = [(HULocationTriggerRegionEditorViewController *)self _shiftLocationIfNeeded:v20];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__HULocationTriggerRegionEditorViewController_mapRadiusView_radiusDidChange_radiusInPoints___block_invoke;
    void v23[3] = &unk_1E63851D8;
    v23[4] = self;
    *(double *)&v23[5] = a4;
    id v22 = (id)[v21 addSuccessBlock:v23];
  }
}

uint64_t __92__HULocationTriggerRegionEditorViewController_mapRadiusView_radiusDidChange_radiusInPoints___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 coordinate];

  return objc_msgSend(v2, "_showMapRegionForCoordinate:radius:animated:", 0);
}

- (void)_resetSearchResults
{
  id v3 = [(HULocationTriggerRegionEditorViewController *)self localSearch];

  if (v3)
  {
    id v4 = [(HULocationTriggerRegionEditorViewController *)self localSearch];
    [v4 cancel];

    [(HULocationTriggerRegionEditorViewController *)self setLocalSearch:0];
  }

  [(HULocationTriggerRegionEditorViewController *)self setLocalSearchResults:0];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  [(HULocationTriggerRegionEditorViewController *)self _resetSearchResults];
  if (v5 && ![v5 isEqualToString:&stru_1F18F92B8])
  {
    id v6 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
    uint64_t v7 = [v6 text];
    [(HULocationTriggerRegionEditorViewController *)self _updateRecentsWithSearchText:v7];

    id v8 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
    CLLocationCoordinate2D v9 = [(HULocationTriggerRegionEditorViewController *)self searchBar];
    int64_t v10 = [v9 text];
    [v8 setNaturalLanguageQuery:v10];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v8];
    [(HULocationTriggerRegionEditorViewController *)self setLocalSearch:v11];

    double v12 = [(HULocationTriggerRegionEditorViewController *)self localSearch];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__HULocationTriggerRegionEditorViewController_searchBar_textDidChange___block_invoke;
    v13[3] = &unk_1E6385200;
    v13[4] = self;
    [v12 startWithCompletionHandler:v13];
  }
  else
  {
    [(HULocationTriggerRegionEditorViewController *)self _updateRecentsWithSearchText:0];
    [(HULocationTriggerRegionEditorViewController *)self _updateUIWithRegion:0];
    [(HULocationTriggerRegionEditorViewController *)self _reloadData];
  }
}

uint64_t __71__HULocationTriggerRegionEditorViewController_searchBar_textDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 mapItems];
  [*(id *)(a1 + 32) setLocalSearchResults:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 _reloadData];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

+ (id)_homeImage
{
  return (id)HUCommonImageNamed();
}

+ (id)_pinImage
{
  return (id)HUCommonImageNamed();
}

- (id)_shiftLocationIfNeeded:(id)a3
{
  return [(HULocationTriggerRegionEditorViewController *)self _shiftLocationIfNeeded:a3 isRetry:0];
}

- (id)_shiftLocationIfNeeded:(id)a3 isRetry:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  [v6 horizontalAccuracy];
  double v9 = v8;
  [v6 coordinate];
  double v11 = v10;
  [v6 coordinate];
  double v13 = v12;
  int v14 = [v6 referenceFrame];
  int v15 = objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", v11, v13);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke;
  aBlock[3] = &unk_1E6385228;
  id v16 = v6;
  id v34 = v16;
  id v17 = v7;
  id v35 = v17;
  uint64_t v18 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_2;
  v27[3] = &unk_1E6385278;
  BOOL v31 = a4;
  objc_copyWeak(&v30, &location);
  id v19 = v16;
  id v28 = v19;
  id v20 = v17;
  id v29 = v20;
  double v21 = _Block_copy(v27);
  if (v14 == 2 || !v15)
  {
    [v20 finishWithResult:v19];
  }
  else
  {
    id v22 = [(HULocationTriggerRegionEditorViewController *)self locationShifter];
    uint64_t v23 = MEMORY[0x1E4F14428];
    id v24 = MEMORY[0x1E4F14428];
    objc_msgSend(v22, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v18, 0, v21, v23, v11, v13, v9);
  }
  id v25 = v20;

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v25;
}

void __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(a2, a3);
  id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [*(id *)(a1 + 32) altitude];
  double v9 = v8;
  [*(id *)(a1 + 32) verticalAccuracy];
  double v11 = v10;
  double v12 = [*(id *)(a1 + 32) timestamp];
  id v13 = (id)objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v6.latitude, v6.longitude, v9, a4, v11);

  [v13 setReferenceFrame:2];
  [*(id *)(a1 + 40) finishWithResult:v13];
}

void __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 56);
  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  CLLocationCoordinate2D v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4F687A0];
  if (v4)
  {
    [v5 handleError:v3 operationType:*MEMORY[0x1E4F687A0] options:0 retryBlock:0 cancelBlock:0];

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_3;
    v11[3] = &unk_1E6385250;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_4;
    v8[3] = &unk_1E63850E0;
    id v9 = *(id *)(a1 + 40);
    id v10 = v3;
    [v6 handleError:v10 operationType:v7 options:0 retryBlock:v11 cancelBlock:v8];

    objc_destroyWeak(&v14);
  }
}

void __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained _shiftLocationIfNeeded:*(void *)(a1 + 32) isRetry:1];
  id v3 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v4 = (id)[v2 addCompletionBlock:v3];
}

uint64_t __78__HULocationTriggerRegionEditorViewController__shiftLocationIfNeeded_isRetry___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

- (GEOLocationShifter)locationShifter
{
  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    id v4 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E4F64670]);
    id v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }

  return locationShifter;
}

- (HULocationTriggerRegion)region
{
  return self->_region;
}

- (HMHome)home
{
  return self->_home;
}

- (HULocationTriggerRegionEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HULocationTriggerRegionEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (HULocationTriggerEditorMapDragRadiusView)dragView
{
  return self->_dragView;
}

- (void)setDragView:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void)setLocationShifter:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
}

- (NSArray)localSearchResults
{
  return self->_localSearchResults;
}

- (void)setLocalSearchResults:(id)a3
{
}

- (MKPointAnnotation)desiredAddressAnnotation
{
  return self->_desiredAddressAnnotation;
}

- (void)setDesiredAddressAnnotation:(id)a3
{
}

- (double)radiusInPoints
{
  return self->_radiusInPoints;
}

- (void)setRadiusInPoints:(double)a3
{
  self->_radiusInPoints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredAddressAnnotation, 0);
  objc_storeStrong((id *)&self->_localSearchResults, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end