@interface EKEventDetailLocationDisambiguationContentViewController
- (BOOL)_shouldEnableAddButton;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (EKEventDetailLocationDisambiguationContentViewController)initWithLocation:(id)a3 pois:(id)a4 completionBlock:(id)a5;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_constraintsForParadigm:(unint64_t)a3;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_createConstraints;
- (void)_deselectCircle;
- (void)_selectCircle;
- (void)_selectRow:(unint64_t)a3;
- (void)_updateMapRegion;
- (void)cancelTapped:(id)a3;
- (void)doneTapped:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation EKEventDetailLocationDisambiguationContentViewController

- (EKEventDetailLocationDisambiguationContentViewController)initWithLocation:(id)a3 pois:(id)a4 completionBlock:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  v11 = [(EKEventDetailLocationDisambiguationContentViewController *)&v40 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_location, a3);
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count") + 1);
    pois = v12->_pois;
    v12->_pois = (NSMutableArray *)v13;

    v15 = v12->_pois;
    v16 = (void *)[v32 copy];
    [(NSMutableArray *)v15 addObject:v16];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v37;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = v12->_pois;
          v22 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * v20) copy];
          [(NSMutableArray *)v21 addObject:v22];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v18);
    }

    v23 = _Block_copy(v10);
    id completionBlock = v12->_completionBlock;
    v12->_id completionBlock = v23;

    dispatch_queue_t v25 = dispatch_queue_create("LocationDisambiguationVCIconRenderQueue", MEMORY[0x1E4F14430]);
    iconRenderQueue = v12->_iconRenderQueue;
    v12->_iconRenderQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = objc_opt_new();
    iconCache = v12->_iconCache;
    v12->_iconCache = (NSCache *)v27;

    [(EKEventDetailLocationDisambiguationContentViewController *)v12 setDefinesPresentationContext:1];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    objc_initWeak(&location, v12);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __98__EKEventDetailLocationDisambiguationContentViewController_initWithLocation_pois_completionBlock___block_invoke;
    v33[3] = &unk_1E60874F8;
    objc_copyWeak(&v34, &location);
    id v30 = (id)[(EKEventDetailLocationDisambiguationContentViewController *)v12 registerForTraitChanges:v29 withHandler:v33];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __98__EKEventDetailLocationDisambiguationContentViewController_initWithLocation_pois_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained view];
  [v1 setNeedsUpdateConstraints];
}

- (void)_createConstraints
{
  v88[11] = *MEMORY[0x1E4F143B8];
  v3 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
  v86 = objc_opt_new();
  v85 = (NSSet *)objc_opt_new();
  v82 = [(MKMapView *)self->_mapView leadingAnchor];
  v80 = [v3 leadingAnchor];
  v78 = [v82 constraintEqualToAnchor:v80];
  v88[0] = v78;
  v76 = [(MKMapView *)self->_mapView trailingAnchor];
  v74 = [v3 trailingAnchor];
  v71 = [v76 constraintEqualToAnchor:v74];
  v88[1] = v71;
  v69 = [(MKMapView *)self->_mapView topAnchor];
  v67 = [v3 topAnchor];
  v65 = [v69 constraintEqualToAnchor:v67];
  v88[2] = v65;
  v63 = [(UIView *)self->_separatorLine leadingAnchor];
  v61 = [v3 leadingAnchor];
  v59 = [v63 constraintEqualToAnchor:v61];
  v88[3] = v59;
  v57 = [(UIView *)self->_separatorLine trailingAnchor];
  v55 = [v3 trailingAnchor];
  v53 = [v57 constraintEqualToAnchor:v55];
  v88[4] = v53;
  v51 = [(UIView *)self->_separatorLine topAnchor];
  v49 = [(MKMapView *)self->_mapView bottomAnchor];
  v47 = [v51 constraintEqualToAnchor:v49];
  v88[5] = v47;
  v45 = [(UIView *)self->_separatorLine heightAnchor];
  uint64_t v43 = [v45 constraintEqualToConstant:EKUIPixelSizeInPoints()];
  v88[6] = v43;
  v41 = [(UITableView *)self->_tableView leadingAnchor];
  long long v39 = [v3 leadingAnchor];
  long long v37 = [v41 constraintEqualToAnchor:v39];
  v88[7] = v37;
  v35 = [(UITableView *)self->_tableView trailingAnchor];
  v84 = v3;
  v4 = [v3 trailingAnchor];
  v5 = [v35 constraintEqualToAnchor:v4];
  v88[8] = v5;
  v6 = [(UITableView *)self->_tableView topAnchor];
  v7 = [(UIView *)self->_separatorLine bottomAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v88[9] = v8;
  id v9 = [(UITableView *)self->_tableView bottomAnchor];
  id v10 = [v3 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v88[10] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:11];
  [v86 addObjectsFromArray:v12];

  uint64_t v13 = [(MKMapView *)self->_mapView heightAnchor];
  v14 = [(MKMapView *)self->_mapView widthAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v16 = [v86 setByAddingObject:v15];
  tallConstraints = self->_tallConstraints;
  self->_tallConstraints = v16;

  uint64_t v18 = [(MKMapView *)self->_mapView heightAnchor];
  uint64_t v19 = [(MKMapView *)self->_mapView widthAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19 multiplier:0.5];
  v21 = [v86 setByAddingObject:v20];
  iPadConstraints = self->_iPadConstraints;
  self->_iPadConstraints = v21;

  v83 = [(MKMapView *)self->_mapView leadingAnchor];
  v81 = [v84 leadingAnchor];
  v79 = [v83 constraintEqualToAnchor:v81];
  v87[0] = v79;
  v77 = [(MKMapView *)self->_mapView topAnchor];
  v75 = [v84 topAnchor];
  v72 = [v77 constraintEqualToAnchor:v75];
  v87[1] = v72;
  v70 = [(MKMapView *)self->_mapView bottomAnchor];
  v68 = [v84 bottomAnchor];
  v66 = [v70 constraintEqualToAnchor:v68];
  v87[2] = v66;
  v64 = [(UIView *)self->_separatorLine leadingAnchor];
  v62 = [(MKMapView *)self->_mapView trailingAnchor];
  v60 = [v64 constraintEqualToAnchor:v62];
  v87[3] = v60;
  v58 = [(UIView *)self->_separatorLine widthAnchor];
  v56 = [v58 constraintEqualToConstant:EKUIPixelSizeInPoints()];
  v87[4] = v56;
  v54 = [(UIView *)self->_separatorLine topAnchor];
  v52 = [v84 topAnchor];
  v50 = [v54 constraintEqualToAnchor:v52];
  v87[5] = v50;
  v48 = [(UIView *)self->_separatorLine bottomAnchor];
  v46 = [v84 bottomAnchor];
  v44 = [v48 constraintEqualToAnchor:v46];
  v87[6] = v44;
  v42 = [(UITableView *)self->_tableView leadingAnchor];
  v73 = [(UIView *)self->_separatorLine trailingAnchor];
  objc_super v40 = [v42 constraintEqualToAnchor:v73];
  v87[7] = v40;
  long long v38 = [(UITableView *)self->_tableView trailingAnchor];
  long long v36 = [v84 trailingAnchor];
  id v34 = [v38 constraintEqualToAnchor:v36];
  v87[8] = v34;
  v33 = [(UITableView *)self->_tableView topAnchor];
  v23 = [v84 topAnchor];
  v24 = [v33 constraintEqualToAnchor:v23];
  v87[9] = v24;
  dispatch_queue_t v25 = [(UITableView *)self->_tableView bottomAnchor];
  v26 = [v84 bottomAnchor];
  uint64_t v27 = [v25 constraintEqualToAnchor:v26];
  v87[10] = v27;
  v28 = [(UITableView *)self->_tableView widthAnchor];
  v29 = [(MKMapView *)self->_mapView widthAnchor];
  id v30 = [v28 constraintEqualToAnchor:v29];
  v87[11] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:12];
  [(NSSet *)v85 addObjectsFromArray:v31];

  splitConstraints = self->_splitConstraints;
  self->_splitConstraints = v85;
}

- (id)_constraintsForParadigm:(unint64_t)a3
{
  v3 = &OBJC_IVAR___EKEventDetailLocationDisambiguationContentViewController__tallConstraints;
  if (a3 == 8) {
    v3 = &OBJC_IVAR___EKEventDetailLocationDisambiguationContentViewController__splitConstraints;
  }
  if (a3 == 16) {
    v3 = &OBJC_IVAR___EKEventDetailLocationDisambiguationContentViewController__iPadConstraints;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)updateViewConstraints
{
  v3 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
  unint64_t v4 = EKUICurrentWindowInterfaceParadigm(v3);

  if (!self->_tallConstraints)
  {
    [(EKEventDetailLocationDisambiguationContentViewController *)self _createConstraints];
    uint64_t v13 = (void *)MEMORY[0x1E4F28DC8];
    v5 = [(EKEventDetailLocationDisambiguationContentViewController *)self _constraintsForParadigm:v4];
    v6 = [v5 allObjects];
    [v13 activateConstraints:v6];
    goto LABEL_5;
  }
  if (v4 != self->_currentLayoutParadigm)
  {
    v5 = -[EKEventDetailLocationDisambiguationContentViewController _constraintsForParadigm:](self, "_constraintsForParadigm:");
    v6 = [(EKEventDetailLocationDisambiguationContentViewController *)self _constraintsForParadigm:v4];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v5];
    [v7 minusSet:v6];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v6];
    [v8 minusSet:v5];
    id v9 = (void *)MEMORY[0x1E4F28DC8];
    id v10 = [v7 allObjects];
    [v9 deactivateConstraints:v10];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    v12 = [v8 allObjects];
    [v11 activateConstraints:v12];

LABEL_5:
  }
  v14.receiver = self;
  v14.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  [(EKEventDetailLocationDisambiguationContentViewController *)&v14 updateViewConstraints];
  self->_currentLayoutParadigm = v4;
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  [(EKEventDetailLocationDisambiguationContentViewController *)&v47 viewDidLoad];
  if (!self->_mapView)
  {
    v3 = (objc_class *)EKWeakLinkClass();
    unint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
    [v4 setObscuresBackgroundDuringPresentation:0];
    [v4 setHidesNavigationBarDuringPresentation:0];
    [v4 setAutomaticallyShowsCancelButton:0];
    v5 = [(EKEventDetailLocationDisambiguationContentViewController *)self navigationItem];
    [v5 setSearchController:v4];

    v6 = [(EKEventDetailLocationDisambiguationContentViewController *)self navigationItem];
    [v6 setHidesSearchBarWhenScrolling:0];

    v7 = [v4 searchBar];
    searchBar = self->_searchBar;
    self->_searchBar = v7;

    [(UISearchBar *)self->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UISearchBar *)self->_searchBar setAutocorrectionType:0];
    id v9 = EventKitUIBundle();
    id v10 = [v9 localizedStringForKey:@"Enter Location" value:&stru_1F0CC2140 table:0];
    [(UISearchBar *)self->_searchBar setPlaceholder:v10];

    [(UISearchBar *)self->_searchBar setReturnKeyType:9];
    [(UISearchBar *)self->_searchBar setEnablesReturnKeyAutomatically:1];
    [(UISearchBar *)self->_searchBar setTextContentType:*MEMORY[0x1E4FB2F80]];
    [(UISearchBar *)self->_searchBar setDelegate:self];
    id v11 = [v3 alloc];
    v12 = (MKMapView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    mapView = self->_mapView;
    self->_mapView = v12;

    [(MKMapView *)self->_mapView setNeedsLayout];
    [(MKMapView *)self->_mapView setZoomEnabled:1];
    [(MKMapView *)self->_mapView setScrollEnabled:1];
    [(MKMapView *)self->_mapView setPitchEnabled:0];
    [(MKMapView *)self->_mapView setRotateEnabled:0];
    [(MKMapView *)self->_mapView setShowsUserLocation:0];
    id v14 = objc_alloc(MEMORY[0x1E4F30FE0]);
    v15 = (void *)[v14 initExcludingCategories:MEMORY[0x1E4F1CBF0]];
    [(MKMapView *)self->_mapView setPointOfInterestFilter:v15];

    [(MKMapView *)self->_mapView setShowsBuildings:1];
    [(MKMapView *)self->_mapView setUserInteractionEnabled:1];
    [(MKMapView *)self->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKMapView *)self->_mapView setDelegate:self];
    v16 = self->_mapView;
    id v17 = objc_alloc(MEMORY[0x1E4FB1D38]);
    uint64_t v18 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
    uint64_t v19 = (void *)[v17 initWithTarget:v18 action:sel_endEditing_];
    [(MKMapView *)v16 addGestureRecognizer:v19];

    uint64_t v20 = (UIView *)objc_opt_new();
    separatorLine = self->_separatorLine;
    self->_separatorLine = v20;

    [(UIView *)self->_separatorLine setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
    [(UIView *)self->_separatorLine setBackgroundColor:v22];

    v23 = (UITableView *)objc_alloc_init(MEMORY[0x1E4FB1D00]);
    tableView = self->_tableView;
    self->_tableView = v23;

    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setDataSource:self];
    dispatch_queue_t v25 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
    [v25 addSubview:self->_mapView];

    v26 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
    [v26 addSubview:self->_tableView];

    uint64_t v27 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
    [v27 addSubview:self->_separatorLine];

    v28 = EventKitUIBundle();
    v29 = [v28 localizedStringForKey:@"Add Location" value:&stru_1F0CC2140 table:0];
    id v30 = [(EKEventDetailLocationDisambiguationContentViewController *)self navigationItem];
    [v30 setTitle:v29];

    v31 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelTapped_];
    id v32 = [(EKEventDetailLocationDisambiguationContentViewController *)self navigationItem];
    [v32 setLeftBarButtonItem:v31];

    id v33 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v34 = EventKitUIBundle();
    v35 = [v34 localizedStringForKey:@"Add" value:&stru_1F0CC2140 table:0];
    long long v36 = (void *)[v33 initWithTitle:v35 style:2 target:self action:sel_doneTapped_];
    long long v37 = [(EKEventDetailLocationDisambiguationContentViewController *)self navigationItem];
    [v37 setRightBarButtonItem:v36];

    long long v38 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
    [v38 setNeedsUpdateConstraints];

    long long v39 = (void *)EKWeakLinkClass();
    objc_super v40 = [(EKStructuredLocation *)self->_location geoLocation];
    [v40 coordinate];
    double v42 = v41;
    double v44 = v43;
    [(EKStructuredLocation *)self->_location radius];
    v46 = objc_msgSend(v39, "circleWithCenterCoordinate:radius:", v42, v44, v45);

    [(MKMapView *)self->_mapView addOverlay:v46 level:1];
  }
}

- (void)_selectRow:(unint64_t)a3
{
  v5 = [(EKEventDetailLocationDisambiguationContentViewController *)self navigationItem];
  v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:1];

  v7 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  uint64_t v8 = [v7 row];

  if (v8 != a3)
  {
    tableView = self->_tableView;
    id v10 = [(UITableView *)tableView indexPathForSelectedRow];
    id v11 = [(UITableView *)tableView cellForRowAtIndexPath:v10];
    [v11 setAccessoryType:0];
  }
  id v27 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  v12 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v27];
  [v12 setAccessoryType:3];

  [(UITableView *)self->_tableView selectRowAtIndexPath:v27 animated:0 scrollPosition:2];
  uint64_t v13 = [(NSMutableArray *)self->_pois objectAtIndexedSubscript:a3];
  id v14 = v13;
  if (a3)
  {
    v15 = [v13 title];
    [(UISearchBar *)self->_searchBar setText:v15];

    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F57740];
    uint64_t v18 = [v13 title];
    uint64_t v19 = [v14 address];
    uint64_t v20 = [v17 fullDisplayStringWithTitle:v18 address:v19];
    [(UISearchBar *)self->_searchBar setText:v20];

    [MEMORY[0x1E4FB1618] labelColor];
  v16 = };
  v21 = [(UISearchBar *)self->_searchBar searchField];
  [v21 setTextColor:v16];

  if ([v14 isImprecise])
  {
    [(MKMapView *)self->_mapView removeAnnotation:self->_pin];
    [(EKEventDetailLocationDisambiguationContentViewController *)self _selectCircle];
  }
  else
  {
    if (self->_pin)
    {
      -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:");
    }
    else
    {
      EKWeakLinkClass();
      v22 = (MKPointAnnotation *)objc_opt_new();
      pin = self->_pin;
      self->_pin = v22;
    }
    v24 = [v14 geoLocation];
    [v24 coordinate];
    -[MKPointAnnotation setCoordinate:](self->_pin, "setCoordinate:");

    dispatch_queue_t v25 = [v14 title];
    [(MKPointAnnotation *)self->_pin setTitle:v25];

    v26 = [v14 address];
    [(MKPointAnnotation *)self->_pin setSubtitle:v26];

    [(MKPointAnnotation *)self->_pin setRepresentation:2];
    [(MKMapView *)self->_mapView addAnnotation:self->_pin];
    [(MKMapView *)self->_mapView selectAnnotation:self->_pin animated:0];
    [(EKEventDetailLocationDisambiguationContentViewController *)self _updateMapRegion];
    [(EKEventDetailLocationDisambiguationContentViewController *)self _deselectCircle];
  }
  self->_textChanged = 0;
}

- (void)_updateMapRegion
{
  if (_updateMapRegion_onceToken != -1) {
    dispatch_once(&_updateMapRegion_onceToken, &__block_literal_global_56);
  }
  v3 = [(EKStructuredLocation *)self->_location geoLocation];
  [v3 coordinate];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(EKStructuredLocation *)self->_location radius];
  double v10 = fmax(v9 * 3.0, 50.0);
  _updateMapRegion_makeRegionWithDistance(v8, v5, v7, v10, v10);
  -[MKMapView regionThatFits:](self->_mapView, "regionThatFits:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  pin = self->_pin;
  if (pin)
  {
    double v20 = ((double (*)(uint64_t))_updateMapRegion_makeRegionWithDistance)([(MKPointAnnotation *)pin coordinate]);
    double v24 = v12 - v20;
    if (v12 - v20 < 0.0) {
      double v24 = -(v12 - v20);
    }
    double v25 = v24 * 0.1;
    double v26 = v14 - v21;
    if (v14 - v21 < 0.0) {
      double v26 = -(v14 - v21);
    }
    double v27 = v26 * 0.1;
    if (v16 >= v25) {
      double v28 = v16;
    }
    else {
      double v28 = v25;
    }
    if (v18 >= v27) {
      double v29 = v18;
    }
    else {
      double v29 = v27;
    }
    if (v22 < v25) {
      double v22 = v25;
    }
    if (v23 < v27) {
      double v23 = v27;
    }
    double v30 = v28 * 0.5;
    double v31 = v12 - v30;
    double v32 = v29 * 0.5;
    double v33 = v14 - v32;
    double v34 = v12 + v30;
    double v35 = v14 + v32;
    double v36 = v22 * 0.5;
    double v37 = v20 - v36;
    double v38 = v23 * 0.5;
    double v39 = v21 - v38;
    double v40 = v20 + v36 + v25 * 4.0;
    double v41 = v21 + v38;
    if (v31 >= v37) {
      double v42 = v37;
    }
    else {
      double v42 = v31;
    }
    if (v33 >= v39) {
      double v43 = v39;
    }
    else {
      double v43 = v33;
    }
    if (v34 >= v40) {
      double v40 = v34;
    }
    if (v35 >= v41) {
      double v41 = v35;
    }
    -[MKMapView regionThatFits:](self->_mapView, "regionThatFits:", v42 + (v40 - v42) * 0.5, v43 + (v41 - v43) * 0.5);
    double v12 = v44;
    double v14 = v45;
    double v16 = v46;
    double v18 = v47;
  }
  mapView = self->_mapView;

  -[MKMapView setRegion:animated:](mapView, "setRegion:animated:", 1, v12, v14, v16, v18);
}

uint64_t (*__76__EKEventDetailLocationDisambiguationContentViewController__updateMapRegion__block_invoke())(void, double, double, double, double)
{
  result = (uint64_t (*)(void, double, double, double, double))EKWeakLinkSymbol();
  _updateMapRegion_makeRegionWithDistance = result;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailLocationDisambiguationContentViewController;
  [(EKEventDetailLocationDisambiguationContentViewController *)&v3 viewDidLayoutSubviews];
  [(EKEventDetailLocationDisambiguationContentViewController *)self _updateMapRegion];
  if (!self->_rowSelectionInitialized)
  {
    [(EKEventDetailLocationDisambiguationContentViewController *)self _selectRow:0];
    self->_rowSelectionInitialized = 1;
  }
}

- (void)cancelTapped:(id)a3
{
}

- (void)doneTapped:(id)a3
{
  self->_done = 1;
  double v4 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
  [v4 endEditing:1];

  if (!self->_geocoding)
  {
    id completionBlock = (void (**)(id, void, void *))self->_completionBlock;
    pois = self->_pois;
    id v8 = [(UITableView *)self->_tableView indexPathForSelectedRow];
    double v7 = -[NSMutableArray objectAtIndexedSubscript:](pois, "objectAtIndexedSubscript:", [v8 row]);
    completionBlock[2](completionBlock, 0, v7);
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
  [v3 endEditing:0];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  self->_textChanged = 1;
  BOOL v5 = [(EKEventDetailLocationDisambiguationContentViewController *)self _shouldEnableAddButton];
  double v6 = [(EKEventDetailLocationDisambiguationContentViewController *)self navigationItem];
  double v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v5];

  id v8 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  [(UITableView *)self->_tableView selectRowAtIndexPath:0 animated:0 scrollPosition:2];
  if (v8)
  {
    tableView = self->_tableView;
    v11[0] = v8;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(UITableView *)tableView reloadRowsAtIndexPaths:v10 withRowAnimation:100];
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v3 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  BOOL v4 = [v3 row] == 0;

  return v4;
}

- (BOOL)_shouldEnableAddButton
{
  v2 = [(UISearchBar *)self->_searchBar searchField];
  id v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  if (self->_textChanged)
  {
    self->_geocoding = 1;
    BOOL v4 = (void *)MEMORY[0x1E4F57718];
    BOOL v5 = [(UISearchBar *)self->_searchBar text];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__EKEventDetailLocationDisambiguationContentViewController_searchBarTextDidEndEditing___block_invoke;
    v6[3] = &unk_1E608AD40;
    v6[4] = self;
    [v4 geocodeLocationString:v5 withCompletionBlock:v6];
  }
}

void __87__EKEventDetailLocationDisambiguationContentViewController_searchBarTextDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) navigationItem];
  BOOL v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:v3 != 0];

  if (v3)
  {
    double v6 = [MEMORY[0x1E4F25630] locationWithMapItem:v3];
    [*(id *)(*(void *)(a1 + 32) + 984) setObject:v6 atIndexedSubscript:0];

    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v7 + 1050))
    {
      (*(void (**)(void))(*(void *)(v7 + 992) + 16))();
    }
    else
    {
      [*(id *)(v7 + 1024) beginUpdates];
      double v18 = *(void **)(*(void *)(a1 + 32) + 1024);
      uint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      v21[0] = v19;
      double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v18 reloadRowsAtIndexPaths:v20 withRowAnimation:100];

      [*(id *)(*(void *)(a1 + 32) + 1024) endUpdates];
      [*(id *)(a1 + 32) _selectRow:0];
      *(unsigned char *)(*(void *)(a1 + 32) + 1049) = 0;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4FB1418];
    double v9 = EventKitUIBundle();
    double v10 = [v9 localizedStringForKey:@"Invalid Location" value:&stru_1F0CC2140 table:0];
    double v11 = EventKitUIBundle();
    double v12 = [v11 localizedStringForKey:@"Please enter a valid address or select a point of interest from the list." value:&stru_1F0CC2140 table:0];
    double v13 = [v8 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

    double v14 = (void *)MEMORY[0x1E4FB1410];
    double v15 = EventKitUIBundle();
    double v16 = [v15 localizedStringForKey:@"Ok" value:&stru_1F0CC2140 table:0];
    double v17 = [v14 actionWithTitle:v16 style:0 handler:0];
    [v13 addAction:v17];

    [*(id *)(a1 + 32) presentViewController:v13 animated:1 completion:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 1049) = 0;
  }
}

- (void)_selectCircle
{
  id v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  BOOL v4 = [v3 colorWithAlphaComponent:0.28];
  [(MKCircleRenderer *)self->_circleRenderer setFillColor:v4];

  BOOL v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(MKCircleRenderer *)self->_circleRenderer setStrokeColor:v5];

  circleRenderer = self->_circleRenderer;

  [(MKCircleRenderer *)circleRenderer setNeedsDisplay];
}

- (void)_deselectCircle
{
  id v3 = [(MKCircleRenderer *)self->_circleRenderer fillColor];
  BOOL v4 = [v3 colorWithAlphaComponent:0.1];
  [(MKCircleRenderer *)self->_circleRenderer setFillColor:v4];

  [(MKCircleRenderer *)self->_circleRenderer setStrokeColor:0];
  circleRenderer = self->_circleRenderer;

  [(MKCircleRenderer *)circleRenderer setNeedsDisplay];
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  circleRenderer = self->_circleRenderer;
  if (!circleRenderer)
  {
    id v6 = a4;
    uint64_t v7 = (MKCircleRenderer *)[objc_alloc((Class)EKWeakLinkClass()) initWithCircle:v6];

    id v8 = self->_circleRenderer;
    self->_circleRenderer = v7;

    double v9 = CalOnePixelInPoints();
    [(MKCircleRenderer *)self->_circleRenderer setLineWidth:v9 + v9];
    [(EKEventDetailLocationDisambiguationContentViewController *)self _selectCircle];
    circleRenderer = self->_circleRenderer;
  }

  return circleRenderer;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_pois count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  BOOL v4 = EventKitUIBundle();
  BOOL v5 = [v4 localizedStringForKey:@"Suggestions" value:&stru_1F0CC2140 table:0];

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v10 = a3;
  id v6 = a4;
  if (EKUICatalyst())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [v10 backgroundColor];
      double v9 = [v7 contentView];

      [v9 setBackgroundColor:v8];
    }
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 32.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (tableView_cellForRowAtIndexPath__onceToken != -1) {
    dispatch_once(&tableView_cellForRowAtIndexPath__onceToken, &__block_literal_global_88);
  }
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"MapItemCell"];
  if (!v8)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"MapItemCell"];
    [v8 setSelectionStyle:0];
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v8 setSelectedBackgroundView:v9];
  }
  uint64_t v10 = [v6 indexPathForSelectedRow];
  if (v10
    && (double v11 = (void *)v10,
        [v6 indexPathForSelectedRow],
        double v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 row],
        uint64_t v14 = [v7 row],
        v12,
        v11,
        v13 == v14))
  {
    uint64_t v15 = 3;
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v8 setAccessoryType:v15];
  double v16 = -[NSMutableArray objectAtIndexedSubscript:](self->_pois, "objectAtIndexedSubscript:", [v7 row]);
  if ([v7 row])
  {
    double v17 = [v16 title];
    double v18 = [v8 textLabel];
    [v18 setText:v17];

    uint64_t v19 = [v16 address];
    double v20 = [v8 detailTextLabel];
    double v21 = v20;
    double v22 = v19;
    goto LABEL_11;
  }
  if ([v16 isImprecise])
  {
    uint64_t v19 = [MEMORY[0x1E4F57BA0] labelForLocation:v16];
    if (v19)
    {
      double v28 = [v8 textLabel];
      [v28 setText:v19];

      double v21 = [v16 title];
      double v29 = [v8 detailTextLabel];
      [v29 setText:v21];

      goto LABEL_12;
    }
    double v32 = [v16 title];
    double v33 = [v8 textLabel];
    [v33 setText:v32];

    double v20 = [v8 detailTextLabel];
    double v21 = v20;
    double v22 = 0;
LABEL_11:
    [v20 setText:v22];
LABEL_12:

    goto LABEL_13;
  }
  double v30 = [v16 title];
  double v31 = [v8 textLabel];
  [v31 setText:v30];

  uint64_t v19 = [v8 detailTextLabel];
  [v19 setText:0];
LABEL_13:

  double v23 = [(NSCache *)self->_iconCache objectForKey:v7];
  double v24 = [v8 imageView];
  [v24 setImage:v23];

  if (!v23)
  {
    double v25 = (void *)tableView_cellForRowAtIndexPath__MKMapItemClass;
    double v26 = [v16 mapKitHandle];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v34[3] = &unk_1E60891C8;
    id v35 = v6;
    id v36 = v7;
    double v37 = self;
    [v25 _mapItemFromHandle:v26 completionHandler:v34];
  }

  return v8;
}

uint64_t __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke()
{
  uint64_t result = EKWeakLinkClass();
  tableView_cellForRowAtIndexPath__MKMapItemClass = result;
  return result;
}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v7[3] = &unk_1E60890B0;
  id v8 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];

  if (v2)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 48) + 1056);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_4;
    v6[3] = &unk_1E60890B0;
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = v4;
    uint64_t v10 = v5;
    dispatch_async(v3, v6);
  }
}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  v2 = ImageForMapItem(*(void **)(a1 + 32));
  v12.width = 26.0;
  v12.height = 26.0;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  objc_msgSend(v2, "drawInRect:", 0.0, 0.0, 26.0, 26.0);
  id v3 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_5;
  v7[3] = &unk_1E60890B0;
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __92__EKEventDetailLocationDisambiguationContentViewController_tableView_cellForRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 48) + 1064) setObject:*(void *)(a1 + 56) forKey:*(void *)(a1 + 40)];
  if (v4)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = [v4 imageView];
    [v3 setImage:v2];

    [v4 setNeedsLayout];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(EKEventDetailLocationDisambiguationContentViewController *)self view];
  [v6 endEditing:0];

  uint64_t v7 = [v5 row];

  [(EKEventDetailLocationDisambiguationContentViewController *)self _selectRow:v7];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
  [v4 setAccessoryType:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitConstraints, 0);
  objc_storeStrong((id *)&self->_iPadConstraints, 0);
  objc_storeStrong((id *)&self->_tallConstraints, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_iconRenderQueue, 0);
  objc_storeStrong((id *)&self->_circleRenderer, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_pois, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end