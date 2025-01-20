@interface SLSheetPlaceViewController
- ($E6A99E690B8E2A58490E99CCD7C1F8A1)_regionForPlaces:(SEL)a3;
- (ACAccount)account;
- (BOOL)_forceSelectPlace:(id)a3 setMapAnnotation:(BOOL)a4;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)searchDisplayController:(id)a3 shouldReloadTableForSearchString:(id)a4;
- (BOOL)searchEnabled;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (NSArray)places;
- (SLPlaceDataSource)placeDataSource;
- (SLSheetPlaceViewController)initWithPlaceDataSource:(id)a3 effectiveBundle:(id)a4;
- (SLSheetPlaceViewControllerDelegate)selectionDelegate;
- (double)_mapHeightForInterfaceOrientation:(int64_t)a3;
- (double)_preferredViewHeight;
- (id)_placeForRow:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_calculatePreferredContentSize;
- (void)_centerMapForPlaces;
- (void)_centerMapWithSelectedPlace:(id)a3;
- (void)_layoutForSearch;
- (void)_layoutNormal;
- (void)_presentSearch;
- (void)_restoreFromSearch;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)placeManager:(id)a3 failedWithError:(id)a4;
- (void)placeManager:(id)a3 updatedPlaces:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchDisplayControllerWillEndSearch:(id)a3;
- (void)setAccount:(id)a3;
- (void)setPlaceDataSource:(id)a3;
- (void)setPlaces:(id)a3;
- (void)setSearchEnabled:(BOOL)a3;
- (void)setSelectedPlace:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SLSheetPlaceViewController

- (SLSheetPlaceViewController)initWithPlaceDataSource:(id)a3 effectiveBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLSheetPlaceViewController;
  v9 = [(SLSheetPlaceViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeDataSource, a3);
    objc_storeStrong((id *)&v10->_effectiveBundle, a4);
    [(SLPlaceDataSource *)v10->_placeDataSource setDelegate:v10];
    v11 = SLSocialFrameworkBundle();
    v12 = [v11 localizedStringForKey:@"CHOOSE_LOCATION" value:&stru_1F1E28690 table:@"Localizable"];
    [(SLSheetPlaceViewController *)v10 setTitle:v12];

    v10->_searchEnabled = 1;
  }

  return v10;
}

- (void)dealloc
{
  [(MKMapView *)self->_mapView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v3 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setPlaces:(id)a3
{
  id v8 = a3;
  _SLLog(v3, 7, @"SLPlaceViewController setPlaces");
  if ([(SLSheetPlaceViewController *)self isViewLoaded]) {
    [(MKMapView *)self->_mapView removeAnnotations:self->_places];
  }
  objc_storeStrong((id *)&self->_places, a3);
  if ([(SLSheetPlaceViewController *)self isViewLoaded])
  {
    [(UITableView *)self->_tableView beginUpdates];
    tableView = self->_tableView;
    id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [(UITableView *)tableView reloadSections:v7 withRowAnimation:100];

    [(UITableView *)self->_tableView endUpdates];
    [(MKMapView *)self->_mapView addAnnotations:self->_places];
    [(SLSheetPlaceViewController *)self _centerMapWithSelectedPlace:self->_selectedPlace];
    [(SLSheetPlaceViewController *)self _calculatePreferredContentSize];
  }
}

- ($E6A99E690B8E2A58490E99CCD7C1F8A1)_regionForPlaces:(SEL)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  double MKMapRectNull = getMKMapRectNull();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v15 latitude];
        CLLocationDegrees v17 = v16;
        [v15 longitude];
        CLLocationCoordinate2D v19 = CLLocationCoordinate2DMake(v17, v18);
        uint64_t v51 = 0;
        v52 = &v51;
        uint64_t v53 = 0x2020000000;
        v20 = (double (*)(double, double))getMKMapPointForCoordinateSymbolLoc_ptr;
        v54 = getMKMapPointForCoordinateSymbolLoc_ptr;
        if (!getMKMapPointForCoordinateSymbolLoc_ptr)
        {
          uint64_t v46 = MEMORY[0x1E4F143A8];
          uint64_t v47 = 3221225472;
          v48 = __getMKMapPointForCoordinateSymbolLoc_block_invoke;
          v49 = &unk_1E64677E8;
          v50 = &v51;
          v21 = (void *)MapKitLibrary();
          v22 = dlsym(v21, "MKMapPointForCoordinate");
          *(void *)(v50[1] + 24) = v22;
          getMKMapPointForCoordinateSymbolLoc_ptr = *(_UNKNOWN **)(v50[1] + 24);
          v20 = (double (*)(double, double))v52[3];
        }
        _Block_object_dispose(&v51, 8);
        if (!v20) {
          -[SLSheetPlaceViewController _regionForPlaces:]();
        }
        double v23 = v20(v19.latitude, v19.longitude);
        double v25 = v24;
        uint64_t v51 = 0;
        v52 = &v51;
        uint64_t v53 = 0x2020000000;
        v26 = (double (*)(double, double, double, double, double, double, double, double))getMKMapRectUnionSymbolLoc_ptr;
        v54 = getMKMapRectUnionSymbolLoc_ptr;
        if (!getMKMapRectUnionSymbolLoc_ptr)
        {
          uint64_t v46 = MEMORY[0x1E4F143A8];
          uint64_t v47 = 3221225472;
          v48 = __getMKMapRectUnionSymbolLoc_block_invoke;
          v49 = &unk_1E64677E8;
          v50 = &v51;
          v27 = (void *)MapKitLibrary();
          v28 = dlsym(v27, "MKMapRectUnion");
          *(void *)(v50[1] + 24) = v28;
          getMKMapRectUnionSymbolLoc_ptr = *(_UNKNOWN **)(v50[1] + 24);
          v26 = (double (*)(double, double, double, double, double, double, double, double))v52[3];
        }
        _Block_object_dispose(&v51, 8);
        if (!v26) {
          -[SLSheetPlaceViewController _regionForPlaces:]();
        }
        double MKMapRectNull = v26(MKMapRectNull, v7, v9, v11, v23, v25, 0.0, 0.0);
        double v7 = v29;
        double v9 = v30;
        double v11 = v31;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v12);
  }

  double v32 = getMKMapRectNull();
  if ((MKMapRectNull == v32 && (double v32 = getMKMapRectNull(), v7 == v33) || v9 == 0.0 && v11 == 0.0)
    && objc_msgSend(obj, "count", v32))
  {
    v34 = [obj objectAtIndexedSubscript:0];
    [v34 coordinate];
    __MKCoordinateRegionMakeWithDistance(v35, v36, 50000.0, 50000.0);
  }
  else
  {
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    v37 = (void (*)(double, double, double, double))getMKCoordinateRegionForMapRectSymbolLoc_ptr;
    v54 = getMKCoordinateRegionForMapRectSymbolLoc_ptr;
    if (!getMKCoordinateRegionForMapRectSymbolLoc_ptr)
    {
      uint64_t v46 = MEMORY[0x1E4F143A8];
      uint64_t v47 = 3221225472;
      v48 = __getMKCoordinateRegionForMapRectSymbolLoc_block_invoke;
      v49 = &unk_1E64677E8;
      v50 = &v51;
      v38 = (void *)MapKitLibrary();
      v39 = dlsym(v38, "MKCoordinateRegionForMapRect");
      *(void *)(v50[1] + 24) = v39;
      getMKCoordinateRegionForMapRectSymbolLoc_ptr = *(_UNKNOWN **)(v50[1] + 24);
      v37 = (void (*)(double, double, double, double))v52[3];
    }
    _Block_object_dispose(&v51, 8);
    if (!v37) {
      -[SLSheetPlaceViewController _regionForPlaces:]();
    }
    v37(MKMapRectNull, v7, v9, v11);
  }

  return result;
}

- (void)setSelectedPlace:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPlace, a3);
  id v5 = a3;
  [(UITableView *)self->_tableView reloadData];
}

- (NSArray)places
{
  return self->_places;
}

- (id)_placeForRow:(int64_t)a3
{
  if (a3)
  {
    id v4 = [(NSArray *)self->_places objectAtIndexedSubscript:a3 - 1];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)cancelButtonTapped:(id)a3
{
  id v4 = [(SLSheetPlaceViewController *)self selectionDelegate];
  [v4 placeViewController:self didSelectPlace:self->_selectedPlace];
}

- (double)_preferredViewHeight
{
  -[UITableView sizeThatFits:](self->_tableView, "sizeThatFits:", 0.0, 1100.0);
  double v4 = v3;
  [(SLSheetPlaceViewController *)self _mapHeightForInterfaceOrientation:[(SLSheetPlaceViewController *)self interfaceOrientation]];
  double v6 = v5;
  [(UISearchBar *)self->_searchBar bounds];
  return v4 + v6 + v7;
}

- (void)_calculatePreferredContentSize
{
  if ([(NSArray *)self->_places count])
  {
    [(SLSheetPlaceViewController *)self _preferredViewHeight];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }
  v8.width = 320.0;
  v8.height = v5;
  double v6 = NSStringFromCGSize(v8);
  _SLLog(v2, 7, @"Place VC preferredContentSize=%@");

  -[SLSheetPlaceViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v5);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!self->_searchPresented) {
    [(SLSheetPlaceViewController *)self _layoutNormal];
  }
}

- (double)_mapHeightForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 1) {
    return 125.0;
  }
  double v3 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];
  }
  else
  {
    uint64_t v5 = 0;
  }

  double v6 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    double v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];
  }
  else
  {
    uint64_t v8 = 0;
  }

  if (v5 == v8) {
    return 80.0;
  }
  else {
    return 125.0;
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  BOOL searchAnimationComplete = self->_searchAnimationComplete;
  if (!self->_searchAnimationComplete)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke;
    v6[3] = &unk_1E6467288;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke_2;
    v5[3] = &unk_1E64678C8;
    v5[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:v5 completion:0.1];
  }
  return searchAnimationComplete;
}

uint64_t __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
  [*(id *)(a1 + 32) _layoutForSearch];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _presentSearch];
}

uint64_t __58__SLSheetPlaceViewController_searchBarShouldBeginEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1016), "set_activationGapHeight:", 0.0);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)_presentSearch
{
  self->_BOOL searchAnimationComplete = 1;
  self->_searchPresented = 1;
  [(UISearchBar *)self->_searchBar becomeFirstResponder];
}

- (void)_restoreFromSearch
{
  double v3 = [(SLSheetPlaceSearchController *)self->_placeSearchController placeDataSource];
  [v3 stopUpdatingLocation];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke;
  v5[3] = &unk_1E6467288;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke_2;
  v4[3] = &unk_1E64678C8;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:v4 completion:0.1];
}

uint64_t __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutNormal];
}

uint64_t __48__SLSheetPlaceViewController__restoreFromSearch__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1041) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 1040) = 0;
  return result;
}

- (void)_layoutForSearch
{
  [(MKMapView *)self->_mapView frame];
  -[MKMapView setFrame:](self->_mapView, "setFrame:");
  [(UISearchBar *)self->_searchBar frame];
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:");
  [(UISearchBar *)self->_searchBar frame];
  double MaxY = CGRectGetMaxY(v14);
  double v4 = [(SLSheetPlaceViewController *)self view];
  [v4 frame];
  double v6 = v5;
  double v7 = [(SLSheetPlaceViewController *)self view];
  [v7 frame];
  double v9 = v8;
  [(UISearchBar *)self->_searchBar frame];
  double v11 = v9 - v10;

  tableView = self->_tableView;

  -[UITableView setFrame:](tableView, "setFrame:", 0.0, MaxY, v6, v11);
}

- (void)_layoutNormal
{
  double v3 = [(SLSheetPlaceViewController *)self view];
  [v3 frame];
  double v5 = v4;
  [(SLSheetPlaceViewController *)self _mapHeightForInterfaceOrientation:[(SLSheetPlaceViewController *)self interfaceOrientation]];
  -[MKMapView setFrame:](self->_mapView, "setFrame:", 0.0, 0.0, v5, v6);

  [(MKMapView *)self->_mapView frame];
  double MaxY = CGRectGetMaxY(v17);
  if ([(SLSheetPlaceViewController *)self searchEnabled])
  {
    double v8 = [(SLSheetPlaceViewController *)self view];
    [v8 frame];
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, MaxY);
  }
  else
  {
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, MaxY, 0.0, 0.0);
  }
  [(UISearchDisplayController *)self->_searchDisplayController set_activationGapHeight:MaxY];
  [(UISearchBar *)self->_searchBar frame];
  double v9 = CGRectGetMaxY(v18);
  id v15 = [(SLSheetPlaceViewController *)self view];
  [v15 frame];
  double v11 = v10;
  uint64_t v12 = [(SLSheetPlaceViewController *)self view];
  [v12 frame];
  double v14 = v13;
  [(UISearchBar *)self->_searchBar frame];
  -[UITableView setFrame:](self->_tableView, "setFrame:", 0.0, v9, v11, v14 - CGRectGetMaxY(v19));
}

- (void)_centerMapWithSelectedPlace:(id)a3
{
  id v5 = a3;
  selectedPlace = self->_selectedPlace;
  if (!selectedPlace
    || ![(SLSheetPlaceViewController *)self _forceSelectPlace:selectedPlace setMapAnnotation:1])
  {
    [(SLSheetPlaceViewController *)self _centerMapForPlaces];
  }
}

- (void)_centerMapForPlaces
{
  double v3 = [(SLSheetPlaceViewController *)self places];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    mapView = self->_mapView;
    id v6 = [(SLSheetPlaceViewController *)self places];
    [(SLSheetPlaceViewController *)self _regionForPlaces:v6];
    -[MKMapView setRegion:](mapView, "setRegion:");
  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v10 = a4;
  id v5 = [v10 annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v7 = [v10 annotation];
    selectedPlace = self->_selectedPlace;
    self->_selectedPlace = v7;
    double v9 = v7;

    [(SLSheetPlaceViewController *)self _forceSelectPlace:v9 setMapAnnotation:0];
  }
}

- (BOOL)_forceSelectPlace:(id)a3 setMapAnnotation:(BOOL)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  places = self->_places;
  char v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SLSheetPlaceViewController__forceSelectPlace_setMapAnnotation___block_invoke;
  v10[3] = &unk_1E64678F0;
  BOOL v11 = a4;
  v10[4] = self;
  v10[5] = &v12;
  [(NSArray *)places enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __65__SLSheetPlaceViewController__forceSelectPlace_setMapAnnotation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  char v8 = [v7 identifier];
  double v9 = [*(id *)(*(void *)(a1 + 32) + 984) identifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(*(void *)(a1 + 32) + 1032) selectAnnotation:v7 animated:1];
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "visibleCells", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v15++) setAccessoryType:0];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    double v16 = *(void **)(*(void *)(a1 + 32) + 1000);
    CGRect v17 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
    CGRect v18 = [v16 cellForRowAtIndexPath:v17];

    [v18 setAccessoryType:3];
    CGRect v19 = *(void **)(*(void *)(a1 + 32) + 1000);
    v20 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
    [v19 scrollToRowAtIndexPath:v20 atScrollPosition:(uint64_t)*MEMORY[0x1E4F43CD8] animated:1];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)placeManager:(id)a3 updatedPlaces:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F42738];
  id v6 = a4;
  [v5 shouldShowNetworkActivityIndicatorInRemoteApplication:0];
  [(SLSheetPlaceViewController *)self setPlaces:v6];
}

- (void)placeManager:(id)a3 failedWithError:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F42738];
  id v6 = a4;
  [v5 shouldShowNetworkActivityIndicatorInRemoteApplication:0];
  _SLLog(v4, 3, @"Base place manager failed to fetch places with error %{public}@");
}

- (void)loadView
{
  v39.receiver = self;
  v39.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v39 loadView];
  double v3 = [(SLSheetPlaceViewController *)self view];
  [v3 setOpaque:0];

  uint64_t v4 = [MEMORY[0x1E4F428B8] clearColor];
  id v5 = [(SLSheetPlaceViewController *)self view];
  [v5 setBackgroundColor:v4];

  effectiveBundle = self->_effectiveBundle;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2050000000;
  id v7 = (void *)getMKLocationManagerClass_softClass;
  uint64_t v48 = getMKLocationManagerClass_softClass;
  if (!getMKLocationManagerClass_softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    long long v42 = __getMKLocationManagerClass_block_invoke;
    long long v43 = &unk_1E64677E8;
    long long v44 = &v45;
    __getMKLocationManagerClass_block_invoke((uint64_t)&v40);
    id v7 = (void *)v46[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v45, 8);
  double v9 = [v8 sharedLocationManager];
  [v9 setEffectiveBundle:effectiveBundle];

  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2050000000;
  int v10 = (void *)getMKMapViewClass_softClass;
  uint64_t v48 = getMKMapViewClass_softClass;
  if (!getMKMapViewClass_softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    long long v42 = __getMKMapViewClass_block_invoke;
    long long v43 = &unk_1E64677E8;
    long long v44 = &v45;
    __getMKMapViewClass_block_invoke((uint64_t)&v40);
    int v10 = (void *)v46[3];
  }
  BOOL v11 = v10;
  _Block_object_dispose(&v45, 8);
  id v12 = [v11 alloc];
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGRect v17 = (MKMapView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
  mapView = self->_mapView;
  self->_mapView = v17;

  [(MKMapView *)self->_mapView setAutoresizingMask:2];
  [(MKMapView *)self->_mapView setRendersInBackground:1];
  [(MKMapView *)self->_mapView setShowsUserLocation:1];
  [(MKMapView *)self->_mapView setUserTrackingMode:0 animated:0];
  [(MKMapView *)self->_mapView setDelegate:self];
  if (![(NSArray *)self->_places count])
  {
    CGRect v19 = [(SLSheetPlaceViewController *)self placeDataSource];
    v20 = [v19 currentLocation];

    if (v20)
    {
      long long v21 = self->_mapView;
      long long v22 = [(SLSheetPlaceViewController *)self placeDataSource];
      long long v23 = [v22 currentLocation];
      [v23 coordinate];
      __MKCoordinateRegionMakeWithDistance(v24, v25, 3000.0, 3000.0);
      -[MKMapView setRegion:](v21, "setRegion:");
    }
  }
  uint64_t v26 = (UISearchBar *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42DB8]), "initWithFrame:", v13, v14, v15, v16);
  searchBar = self->_searchBar;
  self->_searchBar = v26;

  [(UISearchBar *)self->_searchBar setAutoresizingMask:2];
  [(UISearchBar *)self->_searchBar setDelegate:self];
  v28 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 0, v13, v14, v15, v16);
  tableView = self->_tableView;
  self->_tableView = v28;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setOpaque:0];
  double v30 = [MEMORY[0x1E4F428B8] clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v30];

  double v31 = [(UITableView *)self->_tableView backgroundView];
  [v31 setOpaque:0];

  double v32 = [MEMORY[0x1E4F428B8] clearColor];
  double v33 = [(UITableView *)self->_tableView backgroundView];
  [v33 setBackgroundColor:v32];

  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4F43D18]];
  v34 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v34 lineHeight];
  [(UITableView *)self->_tableView setEstimatedRowHeight:v35 + v35];

  [(SLSheetPlaceViewController *)self _layoutNormal];
  double v36 = [(SLSheetPlaceViewController *)self view];
  [v36 addSubview:self->_mapView];

  if ([(SLSheetPlaceViewController *)self searchEnabled])
  {
    v37 = [(SLSheetPlaceViewController *)self view];
    [v37 addSubview:self->_searchBar];
  }
  v38 = [(SLSheetPlaceViewController *)self view];
  [v38 addSubview:self->_tableView];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v5 viewDidLoad];
  double v3 = [(SLSheetPlaceViewController *)self places];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(SLSheetPlaceViewController *)self _centerMapForPlaces];
    [(SLSheetPlaceViewController *)self _centerMapWithSelectedPlace:self->_selectedPlace];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v4 viewWillAppear:a3];
  [MEMORY[0x1E4F42738] shouldShowNetworkActivityIndicatorInRemoteApplication:1];
  [(SLPlaceDataSource *)self->_placeDataSource fetchPlaces];
  [(UITableView *)self->_tableView reloadData];
  [(SLSheetPlaceViewController *)self _calculatePreferredContentSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v4 viewDidAppear:a3];
  [(UITableView *)self->_tableView flashScrollIndicators];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SLSheetPlaceViewController *)self placeDataSource];
  [v5 cancelPlaceFetch];

  id v6 = [(SLSheetPlaceViewController *)self placeDataSource];
  [v6 stopUpdatingLocation];

  v10.receiver = self;
  v10.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v10 viewWillDisappear:v3];
  id v7 = [(SLSheetPlaceViewController *)self selectionDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(SLSheetPlaceViewController *)self selectionDelegate];
    [v9 placeViewController:self willDisappear:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SLSheetPlaceViewController;
  [(SLSheetPlaceViewController *)&v3 viewDidDisappear:a3];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(SLSheetPlaceViewController *)self places];
  int64_t v5 = [v4 count] + 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"SLFacebookPlaceCell"];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:3 reuseIdentifier:@"SLFacebookPlaceCell"];
  }
  [v7 setOpaque:0];
  char v8 = [MEMORY[0x1E4F428B8] clearColor];
  [v7 setBackgroundColor:v8];

  if ([v6 row])
  {
    double v9 = -[SLSheetPlaceViewController _placeForRow:](self, "_placeForRow:", [v6 row]);
    objc_super v10 = [v9 name];
    BOOL v11 = [v7 textLabel];
    [v11 setText:v10];

    id v12 = [v9 category];
    double v13 = [v7 detailTextLabel];
    [v13 setText:v12];

    if (self->_selectedPlace
      && ([v9 identifier],
          double v14 = objc_claimAutoreleasedReturnValue(),
          [(SLPlace *)self->_selectedPlace identifier],
          double v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v14 isEqualToString:v15],
          v15,
          v14,
          (v16 & 1) != 0))
    {
      uint64_t v17 = 3;
    }
    else
    {
      uint64_t v17 = 0;
    }
    [v7 setAccessoryType:v17];
  }
  else
  {
    CGRect v18 = SLSocialFrameworkBundle();
    CGRect v19 = [v18 localizedStringForKey:@"SHEET_LOCATION_NO_VALUE" value:&stru_1F1E28690 table:@"Localizable"];
    v20 = [v7 textLabel];
    [v20 setText:v19];

    long long v21 = [v7 detailTextLabel];
    [v21 setText:&stru_1F1E28690];

    if (self->_selectedPlace) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = 3;
    }
    [v7 setAccessoryType:v22];
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setOpaque:0];
  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = (UITableView *)a3;
  id v8 = a4;
  tableView = self->_tableView;
  uint64_t v21 = v4;
  if (tableView == v7)
  {
    _SLLog(v4, 6, @"Selection from standard place results");
    objc_super v10 = self->_tableView;
    id v12 = -[SLSheetPlaceViewController _placeForRow:](self, "_placeForRow:", [v8 row]);
    [(MKMapView *)self->_mapView selectAnnotation:v12 animated:1];
  }
  else
  {
    _SLLog(v4, 6, @"Selection from search results");
    objc_super v10 = [(UISearchDisplayController *)self->_searchDisplayController searchResultsTableView];
    BOOL v11 = [(SLSheetPlaceSearchController *)self->_placeSearchController searchResults];
    id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  }
  objc_storeStrong((id *)&self->_selectedPlace, v12);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v13 = [(UITableView *)v10 visibleCells];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "setAccessoryType:", 0, v21);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  CGRect v18 = [(UITableView *)v10 cellForRowAtIndexPath:v8];
  [v18 setAccessoryType:3];
  [(UITableView *)v10 deselectRowAtIndexPath:v8 animated:1];
  CGRect v19 = [(SLSheetPlaceViewController *)self selectionDelegate];
  [v19 placeViewController:self didSelectPlace:v12];

  if (tableView != v7)
  {
    _SLLog(v21, 7, @"Popping after delay");
    dispatch_time_t v20 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__SLSheetPlaceViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    block[3] = &unk_1E6467288;
    block[4] = self;
    dispatch_after(v20, MEMORY[0x1E4F14428], block);
  }
}

void __64__SLSheetPlaceViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popToRootViewControllerAnimated:1];
}

- (void)searchDisplayControllerWillEndSearch:(id)a3
{
}

- (BOOL)searchDisplayController:(id)a3 shouldReloadTableForSearchString:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  _SLLog(v4, 6, @"User started place search with search string %@");
  -[SLSheetPlaceSearchController searchWithSearchString:](self->_placeSearchController, "searchWithSearchString:", v7, v7);

  [v8 setNoResultsMessage:&stru_1F1E28690];
  return 0;
}

- (SLSheetPlaceViewControllerDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (SLSheetPlaceViewControllerDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (BOOL)searchEnabled
{
  return self->_searchEnabled;
}

- (void)setSearchEnabled:(BOOL)a3
{
  self->_searchEnabled = a3;
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setAccount:(id)a3
{
}

- (SLPlaceDataSource)placeDataSource
{
  return (SLPlaceDataSource *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setPlaceDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDataSource, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_placeSearchController, 0);
  objc_storeStrong((id *)&self->_searchDisplayController, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_storeStrong((id *)&self->_selectedPlace, 0);

  objc_storeStrong((id *)&self->_places, 0);
}

- (void)_regionForPlaces:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"MKCoordinateRegion __MKCoordinateRegionForMapRect(MKMapRect)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SLSheetPlaceViewController.m", 44, @"%s", dlerror());

  __break(1u);
}

- (void)_regionForPlaces:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"MKMapPoint __MKMapPointForCoordinate(CLLocationCoordinate2D)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SLSheetPlaceViewController.m", 46, @"%s", dlerror());

  __break(1u);
}

- (void)_regionForPlaces:.cold.3()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = objc_msgSend(NSString, "stringWithUTF8String:", "MKMapRect __MKMapRectUnion(MKMapRect, MKMapRect)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SLSheetPlaceViewController.m", 47, @"%s", dlerror());

  __break(1u);
}

@end