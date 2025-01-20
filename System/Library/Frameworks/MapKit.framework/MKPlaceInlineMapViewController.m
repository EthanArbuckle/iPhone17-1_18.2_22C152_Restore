@interface MKPlaceInlineMapViewController
+ (id)inlineMapWithMapItem:(id)a3 configuration:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)isBottomHairlineHidden;
- (CGSize)_mapSize;
- (MKMapCamera)mapCamera;
- (MKMapItem)mapItem;
- (MKPlaceInlineMapViewController)initWithMKMapItem:(id)a3 configuration:(id)a4;
- (MKPlaceInlineMapViewControllerConfiguration)configuration;
- (MKPlaceInlineMapViewControllerDelegate)delegate;
- (NSArray)visibleMapItems;
- (id)snapshot;
- (id)traitCollectionForSnapshot;
- (int64_t)preferredUserInterfaceStyle;
- (void)_handleTapOnMap;
- (void)_launchMaps;
- (void)_updateInlineMapWithRefinedMapItems;
- (void)_updateMap;
- (void)_updateMapIfNeeded;
- (void)_updateSnapshotImage:(id)a3;
- (void)cancelSnapshotRequestIfNeeded;
- (void)loadView;
- (void)setBottomHairlineHidden:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMapCamera:(id)a3;
- (void)setMapItem:(id)a3;
- (void)updateInlineMapWithRefinedMapItems;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MKPlaceInlineMapViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)inlineMapWithMapItem:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 _isMapItemTypeBrand])
  {
    v7 = 0;
  }
  else
  {
    [v5 _coordinate];
    v7 = 0;
    if (v9 >= -180.0 && v9 <= 180.0 && v8 >= -90.0 && v8 <= 90.0) {
      v7 = [[MKPlaceInlineMapViewController alloc] initWithMKMapItem:v5 configuration:v6];
    }
  }

  return v7;
}

- (MKPlaceInlineMapViewController)initWithMKMapItem:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPlaceInlineMapViewController;
  double v9 = [(MKPlaceInlineMapViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a4);
    objc_storeStrong((id *)&v10->_mapItem, a3);
    v10->_currentSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }

  return v10;
}

- (void)loadView
{
  v3 = [_MKPlaceInlineMapContentView alloc];
  BOOL v4 = [(MKPlaceInlineMapViewControllerConfiguration *)self->_configuration suppressLookAround];
  BOOL v5 = [(MKPlaceInlineMapViewControllerConfiguration *)self->_configuration showMapAttribution];
  id v7 = [(MKPlaceInlineMapViewControllerConfiguration *)self->_configuration mapSnapshotAuditToken];
  id v6 = -[_MKPlaceInlineMapContentView initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:](v3, "initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:", v4, v5, v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKPlaceInlineMapViewController *)self setView:v6];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MKPlaceInlineMapViewController;
  [(MKPlaceInlineMapViewController *)&v5 viewDidLoad];
  v3 = [(MKPlaceInlineMapViewController *)self view];
  contentView = self->_contentView;
  self->_contentView = v3;

  [(_MKUIViewControllerClickableRootView *)self->_contentView setTarget:self action:sel__handleTapOnMap];
  [(_MKPlaceInlineMapContentView *)self->_contentView setBottomHairlineHidden:self->_bottomHairlineHidden];
  if (self->_mapItem) {
    [(MKPlaceInlineMapViewController *)self _updateMap];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceInlineMapViewController;
  [(MKPlaceInlineMapViewController *)&v3 viewDidLayoutSubviews];
  [(MKPlaceInlineMapViewController *)self _updateMapIfNeeded];
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  self->_bottomHairlineHidden = a3;
  contentView = self->_contentView;
  if (contentView) {
    -[_MKPlaceInlineMapContentView setBottomHairlineHidden:](contentView, "setBottomHairlineHidden:");
  }
}

- (void)setMapItem:(id)a3
{
  objc_super v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    int v6 = [(MKPlaceInlineMapViewController *)self isViewLoaded];
    objc_super v5 = v7;
    if (v6)
    {
      [(_MKPlaceInlineMapContentView *)self->_contentView setMap:0];
      [(MKPlaceInlineMapViewController *)self _updateMap];
      objc_super v5 = v7;
    }
  }
}

- (NSArray)visibleMapItems
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_mapItem;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (id)snapshot
{
  return [(_MKPlaceInlineMapContentView *)self->_contentView map];
}

- (void)_updateMapIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_mapItem)
  {
    p_currentSize = &self->_currentSize;
    BOOL v4 = [(MKPlaceInlineMapViewController *)self view];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double width = p_currentSize->width;
    double height = p_currentSize->height;

    if (width != v6 || height != v8)
    {
      objc_super v12 = MKGetMKPlaceInlineMapVCLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [(MKPlaceInlineMapViewController *)self view];
        [v13 frame];
        uint64_t v15 = v14;
        v16 = [(MKPlaceInlineMapViewController *)self view];
        [v16 frame];
        int v21 = 134218240;
        uint64_t v22 = v15;
        __int16 v23 = 2048;
        uint64_t v24 = v17;
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_INFO, "Size Changed: %f x %f", (uint8_t *)&v21, 0x16u);
      }
      v18 = [(MKPlaceInlineMapViewController *)self view];
      [v18 frame];
      p_currentSize->double width = v19;
      p_currentSize->double height = v20;

      [(MKPlaceInlineMapViewController *)self _updateMap];
    }
  }
}

- (void)_updateMap
{
  objc_super v3 = [(MKPlaceInlineMapViewController *)self mapItem];
  char v4 = [v3 _hasResolvablePartialInformation];

  if ((v4 & 1) == 0)
  {
    [(MKPlaceInlineMapViewController *)self updateInlineMapWithRefinedMapItems];
  }
}

- (void)updateInlineMapWithRefinedMapItems
{
  dispatch_time_t v3 = dispatch_time(0, 1000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MKPlaceInlineMapViewController_updateInlineMapWithRefinedMapItems__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __68__MKPlaceInlineMapViewController_updateInlineMapWithRefinedMapItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateInlineMapWithRefinedMapItems];
}

- (void)_updateInlineMapWithRefinedMapItems
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = MKGetMKPlaceInlineMapVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "Updating inline map.", buf, 2u);
  }

  if (self->_collectionSnapshotter) {
    [(MKPlaceInlineMapViewController *)self cancelSnapshotRequestIfNeeded];
  }
  WeakRetained = (MKMapItem *)objc_loadWeakRetained((id *)&self->_updatingInlineMapItem);
  BOOL v5 = WeakRetained == self->_mapItem;

  if (!v5)
  {
    double v6 = [(MKPlaceInlineMapViewController *)self visibleMapItems];
    BOOL v7 = [v6 count] == 0;

    if (!v7)
    {
      double v8 = [(MKPlaceInlineMapViewController *)self visibleMapItems];
      double v9 = [v8 firstObject];
      [v9 _coordinate];
      double v11 = v10;
      double v13 = v12;

      if (v13 >= -180.0 && v13 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
      {
        objc_storeWeak((id *)&self->_updatingInlineMapItem, self->_mapItem);
        uint64_t v14 = [(MKPlaceInlineMapViewController *)self visibleMapItems];
        BOOL v15 = [v14 count] == 1;

        if (v15)
        {
          v16 = [(MKPlaceInlineMapViewController *)self visibleMapItems];
          [(MKPlaceInlineMapViewController *)self _mapSize];
          v53.origin.x = mapRectContainingMapItems(v16, v17, v18);
          MKCoordinateRegion v54 = MKCoordinateRegionForMapRect(v53);
          double latitudeDelta = v54.span.latitudeDelta;
          double longitudeDelta = v54.span.longitudeDelta;

          int v21 = [(MKPlaceInlineMapViewController *)self view];
          [v21 layoutMargins];
          double v23 = v22;
          double v25 = v24;

          [(_MKPlaceInlineMapContentView *)self->_contentView bounds];
          double v27 = v26;
          [(_MKPlaceInlineMapContentView *)self->_contentView mapViewHeight];
          double v29 = v28;
          v30 = [(_MKPlaceInlineMapContentView *)self->_contentView mapItemView];
          objc_msgSend(v30, "setFrame:", 0.0, 0.0, v27 - v23 - v25, v29);

          objc_initWeak((id *)buf, self);
          v31 = [(_MKPlaceInlineMapContentView *)self->_contentView mapItemView];
          mapItem = self->_mapItem;
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke;
          v46[3] = &unk_1E54B8F58;
          objc_copyWeak(&v47, (id *)buf);
          objc_msgSend(v31, "loadMapItem:coordinateSpan:completionHandler:", mapItem, v46, latitudeDelta, longitudeDelta);

          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v33 = [MKAnnotatedMapSnapshotter alloc];
          v34 = [(MKPlaceInlineMapViewController *)self visibleMapItems];
          [(MKPlaceInlineMapViewController *)self _mapSize];
          v35 = -[MKAnnotatedMapSnapshotter initWithMapItems:mapSize:useSnapshotService:](v33, "initWithMapItems:mapSize:useSnapshotService:", v34, 1);
          collectionSnapshotter = self->_collectionSnapshotter;
          self->_collectionSnapshotter = v35;

          v37 = [(MKPlaceInlineMapViewController *)self traitCollectionForSnapshot];
          [(MKAnnotatedMapSnapshotter *)self->_collectionSnapshotter setTraitCollection:v37];

          objc_initWeak(&location, self);
          v38 = MKGetMKPlaceInlineMapVCLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            [(MKPlaceInlineMapViewController *)self _mapSize];
            uint64_t v40 = v39;
            [(MKPlaceInlineMapViewController *)self _mapSize];
            *(_DWORD *)buf = 134218240;
            uint64_t v49 = v40;
            __int16 v50 = 2048;
            uint64_t v51 = v41;
            _os_log_impl(&dword_18BAEC000, v38, OS_LOG_TYPE_INFO, "Proceeding for snapshot. Size: %f x %f", buf, 0x16u);
          }

          v42 = self->_collectionSnapshotter;
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke_11;
          v43[3] = &unk_1E54B8F80;
          objc_copyWeak(&v44, &location);
          [(MKAnnotatedMapSnapshotter *)v42 startWithCompletionHandler:v43];
          objc_destroyWeak(&v44);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v3 = WeakRetained;
    objc_storeWeak(WeakRetained + 123, 0);
    v2 = [v3[122] mapItemView];
    [v2 triggerAnimation];

    WeakRetained = v3;
  }
}

void __69__MKPlaceInlineMapViewController__updateInlineMapWithRefinedMapItems__block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 123, 0);
    if (v5)
    {
      if (!a3)
      {
        double v8 = MKGetMKPlaceInlineMapVCLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138412290;
          uint64_t v11 = 0;
          _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "Snapshot Error: %@", (uint8_t *)&v10, 0xCu);
        }

        double v9 = [v5 image];
        [v7 _updateSnapshotImage:v9];
      }
    }
  }
}

- (void)cancelSnapshotRequestIfNeeded
{
  collectionSnapshotter = self->_collectionSnapshotter;
  if (collectionSnapshotter && [(MKAnnotatedMapSnapshotter *)collectionSnapshotter isLoading])
  {
    char v4 = MKGetMKPlaceInlineMapVCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Cancelling snapshot request.", v5, 2u);
    }

    [(MKAnnotatedMapSnapshotter *)self->_collectionSnapshotter cancel];
    objc_storeWeak((id *)&self->_updatingInlineMapItem, 0);
  }
}

- (CGSize)_mapSize
{
  dispatch_time_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v7 <= v5) {
    double v8 = v5;
  }
  else {
    double v8 = v7;
  }
  double v9 = [(MKPlaceInlineMapViewController *)self view];
  [v9 layoutMargins];
  double v11 = v10;
  double v13 = v12;

  [(_MKPlaceInlineMapContentView *)self->_contentView mapViewHeight];
  double v15 = v14;
  double v16 = v8 - v11 - v13;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (void)_updateSnapshotImage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke;
  v6[3] = &unk_1E54B8248;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F42FF0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke_2;
  v3[3] = &unk_1E54B8248;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  objc_msgSend(v1, "_mapkit_animateWithDuration:animations:completion:", v3, 0, 0.200000003);
}

uint64_t __55__MKPlaceInlineMapViewController__updateSnapshotImage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setMap:*(void *)(a1 + 40)];
}

- (void)_handleTapOnMap
{
  dispatch_time_t v3 = [(MKPlaceInlineMapViewController *)self delegate];
  char v4 = [v3 inlineMapViewControllerDidSelectMap:self];

  if ((v4 & 1) == 0)
  {
    [(MKPlaceInlineMapViewController *)self _launchMaps];
  }
}

- (void)_launchMaps
{
  id v2 = [(MKPlaceInlineMapViewController *)self mapItem];
  [v2 openInMapsWithLaunchOptions:0 completionHandler:&__block_literal_global_9];
}

void __45__MKPlaceInlineMapViewController__launchMaps__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    dispatch_time_t v3 = [v4 bundleIdentifier];
    NSLog(&cfstr_CouldnTLaunchM.isa, v3);
  }
}

- (id)traitCollectionForSnapshot
{
  BOOL v3 = [(MKPlaceInlineMapViewControllerConfiguration *)self->_configuration useWindowTraitCollectionForUserInterfaceStyle];
  id v4 = [(MKPlaceInlineMapViewController *)self view];
  id v5 = v4;
  if (v3) {
    [v4 window];
  }
  else {
  double v6 = [v4 superview];
  }
  id v7 = [v6 traitCollection];

  return v7;
}

- (int64_t)preferredUserInterfaceStyle
{
  uint64_t v2 = [(MKPlaceInlineMapViewController *)self traitCollectionForSnapshot];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)isBottomHairlineHidden
{
  return self->_bottomHairlineHidden;
}

- (MKPlaceInlineMapViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKPlaceInlineMapViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKPlaceInlineMapViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (MKMapCamera)mapCamera
{
  return self->_mapCamera;
}

- (void)setMapCamera:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapCamera, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_collectionSnapshotter, 0);
  objc_destroyWeak((id *)&self->_updatingInlineMapItem);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end