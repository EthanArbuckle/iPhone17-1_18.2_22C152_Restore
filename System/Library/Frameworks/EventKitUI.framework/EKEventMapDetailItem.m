@interface EKEventMapDetailItem
- (BOOL)_shouldShowMapView;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)detailItemVisibilityChanged;
- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification;
- (double)_mapHeight;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)_mapRelatedViewConstraintsForMapRelatedView:(id)a3 inCell:(id)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)_animateMapIfNeededWithPresentingController:(id)a3 presentingView:(id)a4;
- (void)_loadMapItem:(id)a3;
- (void)_setupCell;
- (void)_setupCellAsEmpty;
- (void)_setupCellWithMapView;
- (void)reset;
- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3;
- (void)setupMapView;
- (void)updateViewColors;
@end

@implementation EKEventMapDetailItem

- (void)updateViewColors
{
  v3 = [(UIView *)self->_loadingView layer];
  id v4 = [MEMORY[0x1E4FB1618] separatorColor];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  id v6 = [(UIView *)self->_loadingView layer];
  id v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));
}

- (void)reset
{
  objc_storeStrong((id *)&self->_oldCell, self->_cell);
  cell = self->_cell;
  self->_cell = 0;

  self->_visibilityChanged = self->_shouldShowCell != [(EKEventMapDetailItem *)self _shouldShowMapView];
}

- (BOOL)detailItemVisibilityChanged
{
  return self->_visibilityChanged;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  BOOL result = [(EKEventMapDetailItem *)self _shouldShowMapView];
  self->_shouldShowCell = result;
  return result;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  BOOL v6 = [(EKEventMapDetailItem *)self _shouldShowMapView];
  double result = 0.0;
  if (v6)
  {
    [(EKEventMapDetailItem *)self _mapHeight];
    return v8 + 16.0 + 25.0;
  }
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  p_cell = &self->_cell;
  if (!self->_cell)
  {
    oldCell = self->_oldCell;
    if (!oldCell) {
      goto LABEL_6;
    }
    location = self->_location;
    if (!location) {
      goto LABEL_6;
    }
    v7 = [(EKEvent *)self->super._event preferredLocation];
    double v8 = [v7 geoLocation];
    [(CLLocation *)location distanceFromLocation:v8];
    double v10 = v9;

    oldCell = self->_oldCell;
    if (v10 < 2.0)
    {
      objc_storeStrong((id *)p_cell, oldCell);
    }
    else
    {
LABEL_6:
      self->_oldCell = 0;

      [(EKEventMapDetailItem *)self _setupCell];
    }
  }
  v11 = *p_cell;

  return v11;
}

- (BOOL)_shouldShowMapView
{
  v3 = [(EKEvent *)self->super._event preferredLocation];
  id v4 = [v3 geoLocation];
  if (v4)
  {
    id v5 = [(EKEvent *)self->super._event preferredLocation];
    int v6 = [v5 isPrediction] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_setupCell
{
  if ([(EKEventMapDetailItem *)self _shouldShowMapView])
  {
    [(EKEventMapDetailItem *)self _setupCellWithMapView];
  }
  else
  {
    [(EKEventMapDetailItem *)self _setupCellAsEmpty];
  }
}

- (void)_setupCellWithMapView
{
  cell = self->_cell;
  if (!cell) {
    goto LABEL_4;
  }
  if (![(EKEventMapCell *)cell setupAsEmptyView]) {
    return;
  }
  if (!self->_cell)
  {
LABEL_4:
    id v4 = [[EKEventMapCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_cell;
    self->_cell = v4;

    [(EKEventMapCell *)self->_cell setDrawingEnabled:1];
    [(EKEventMapCell *)self->_cell setSelectionStyle:0];
    [(EKEventMapCell *)self->_cell setDetailItem:self];
  }
  int v6 = [(EKEvent *)self->super._event preferredLocation];
  v7 = [v6 geoLocation];
  location = self->_location;
  self->_location = v7;

  id v9 = objc_alloc((Class)EKWeakLinkClass());
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = (MKMapItemView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  mapView = self->_mapView;
  self->_mapView = v14;

  [(MKMapItemView *)self->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKMapItemView *)self->_mapView setShouldShowBorders:1];
  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v10, v11, v12, v13);
  loadingView = self->_loadingView;
  self->_loadingView = v16;

  v18 = [(UIView *)self->_loadingView layer];
  [v18 setCornerRadius:8.0];

  v19 = [(UIView *)self->_loadingView layer];
  [v19 setBorderWidth:1.0 / EKUIScaleFactor()];

  v20 = [(UIView *)self->_loadingView layer];
  [v20 setMasksToBounds:1];

  [(UIView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(EKEventMapDetailItem *)self updateViewColors];
  [(EKEventMapCell *)self->_cell addSubview:self->_mapView];
  [(EKEventMapCell *)self->_cell addSubview:self->_loadingView];
  [(MKMapItemView *)self->_mapView setAlpha:0.0];
  v21 = [(EKEventMapDetailItem *)self _mapRelatedViewConstraintsForMapRelatedView:self->_mapView inCell:self->_cell];
  mapViewConstraints = self->_mapViewConstraints;
  self->_mapViewConstraints = v21;

  v23 = [(EKEventMapDetailItem *)self _mapRelatedViewConstraintsForMapRelatedView:self->_loadingView inCell:self->_cell];
  loadingViewConstraints = self->_loadingViewConstraints;
  self->_loadingViewConstraints = v23;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_mapViewConstraints];
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_loadingViewConstraints];
  [(EKEventMapCell *)self->_cell setSetupAsEmptyView:0];
  self->_animationHasRan = 0;
  v25 = self->_cell;

  [(EKEventMapCell *)v25 setMapViewSetup:0];
}

- (void)_setupCellAsEmpty
{
  cell = self->_cell;
  if (!cell) {
    goto LABEL_4;
  }
  if ([(EKEventMapCell *)cell setupAsEmptyView]) {
    return;
  }
  if (!self->_cell)
  {
LABEL_4:
    id v4 = [[EKEventMapCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_cell;
    self->_cell = v4;

    [(EKEventMapCell *)self->_cell setDrawingEnabled:1];
    [(EKEventMapCell *)self->_cell setSelectionStyle:0];
    [(EKEventMapCell *)self->_cell setDetailItem:self];
  }
  location = self->_location;
  self->_location = 0;

  [(MKMapItemView *)self->_mapView removeFromSuperview];
  mapView = self->_mapView;
  self->_mapView = 0;

  [(UIView *)self->_loadingView removeFromSuperview];
  loadingView = self->_loadingView;
  self->_loadingView = 0;

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_mapViewConstraints];
  mapViewConstraints = self->_mapViewConstraints;
  self->_mapViewConstraints = 0;

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_loadingViewConstraints];
  loadingViewConstraints = self->_loadingViewConstraints;
  self->_loadingViewConstraints = 0;

  [(EKEventMapCell *)self->_cell setSetupAsEmptyView:1];
  self->_animationHasRan = 0;
  double v11 = self->_cell;

  [(EKEventMapCell *)v11 setMapViewSetup:0];
}

- (id)_mapRelatedViewConstraintsForMapRelatedView:(id)a3 inCell:(id)a4
{
  v17[5] = *MEMORY[0x1E4F143B8];
  int v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v7 attribute:3 multiplier:1.0 constant:16.0];
  double v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:-25.0];
  [(EKEventMapDetailItem *)self _mapHeight];
  double v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v11];
  double v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:5 relatedBy:0 toItem:v7 attribute:17 multiplier:1.0 constant:0.0];
  v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:6 relatedBy:0 toItem:v7 attribute:18 multiplier:1.0 constant:0.0];

  v17[0] = v9;
  v17[1] = v10;
  v17[2] = v12;
  v17[3] = v13;
  v17[4] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];

  return v15;
}

- (void)setupMapView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MKMapItemView *)self->_mapView setAlpha:0.0];
  [(UIView *)self->_loadingView setAlpha:1.0];
  v3 = [(EKEvent *)self->super._event preferredLocation];
  id v4 = (void *)EKWeakLinkClass();
  id v5 = [v3 mapKitHandle];

  int v6 = kEKUILogHandle;
  BOOL v7 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      id v8 = v6;
      id v9 = [v3 mapKitHandle];
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_INFO, "Found mapKitHandle, loading MKMapItemView with mapKitHandle: %@", buf, 0xCu);
    }
    double v10 = [v3 mapKitHandle];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__EKEventMapDetailItem_setupMapView__block_invoke;
    v13[3] = &unk_1E608AB08;
    v15 = v4;
    v13[4] = self;
    id v14 = v3;
    [v4 _mapItemFromHandle:v10 completionHandler:v13];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "Did not find mapKitHandle, falling back to load MKMapItemView with geoLocation", buf, 2u);
    }
    double v11 = (void *)[objc_alloc((Class)v4) initWithCLLocation:self->_location];
    double v12 = [v3 title];
    [v11 setName:v12];

    [(EKEventMapDetailItem *)self _loadMapItem:v11];
  }
}

void __36__EKEventMapDetailItem_setupMapView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      id v9 = [v6 domain];
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = [v6 code];
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "Received error while recreating mapItem from mapKitHandle: %@ - %ld. Falling back to load MKMapItemView with geoLocation.", buf, 0x16u);
    }
    double v10 = (void *)[objc_alloc(*(Class *)(a1 + 48)) initWithCLLocation:*(void *)(*(void *)(a1 + 32) + 128)];

    double v11 = [*(id *)(a1 + 40) title];
    [v10 setName:v11];

    id v5 = v10;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__EKEventMapDetailItem_setupMapView__block_invoke_53;
  v13[3] = &unk_1E6087D68;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __36__EKEventMapDetailItem_setupMapView__block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadMapItem:*(void *)(a1 + 40)];
}

- (void)_loadMapItem:(id)a3
{
  mapView = self->_mapView;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__EKEventMapDetailItem__loadMapItem___block_invoke;
  v4[3] = &unk_1E608AB30;
  v4[4] = self;
  [(MKMapItemView *)mapView loadMapItem:a3 completionHandler:v4];
}

void __37__EKEventMapDetailItem__loadMapItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "Received error while loading MKMapItemView: %@", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 80) setCurrentlyLoading:0];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 80) setNeedsLayout];
    [*(id *)(*(void *)(a1 + 32) + 80) layoutIfNeeded];
    id v5 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      int v7 = [v6 noninteractivePlatterMode];

      double v8 = 0.3;
      if (v7) {
        double v8 = 0.0;
      }
    }
    else
    {

      double v8 = 0.3;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__EKEventMapDetailItem__loadMapItem___block_invoke_59;
    v10[3] = &unk_1E6087570;
    uint64_t v11 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__EKEventMapDetailItem__loadMapItem___block_invoke_2;
    v9[3] = &unk_1E6087520;
    v9[4] = v11;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v9 completion:v8];
  }
}

uint64_t __37__EKEventMapDetailItem__loadMapItem___block_invoke_59(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 112) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 96);

  return [v2 setAlpha:1.0];
}

void __37__EKEventMapDetailItem__loadMapItem___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) setCurrentlyLoading:0];
  id v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) == 0) {
      return;
    }
    id v4 = [*(id *)(a1 + 32) delegate];
    id v7 = [v4 eventDetailsScrollView];

    id v5 = [*(id *)(a1 + 32) delegate];
    id v6 = [v5 eventDetailsViewController];

    [*(id *)(a1 + 32) _animateMapIfNeededWithPresentingController:v6 presentingView:v7];
  }
}

- (double)_mapHeight
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [(EKEventDetailItem *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKEventDetailItem *)self delegate];
    id v6 = [v5 eventDetailsScrollView];

    [v6 bounds];
    double Width = CGRectGetWidth(v18);
    [v6 layoutMargins];
    double v9 = Width - v8;
    [v6 layoutMargins];
    double v11 = (v9 - v10) * 0.4;
LABEL_5:

    goto LABEL_6;
  }
  id v12 = (void *)kEKUILogHandle;
  double v11 = 0.0;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    id v6 = v12;
    id v13 = [(EKEventDetailItem *)self delegate];
    int v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Delegate [%@] does not respond to eventDetailsScrollView, so setting map height to 0.", (uint8_t *)&v15, 0xCu);

    goto LABEL_5;
  }
LABEL_6:
  CalRoundToScreenScale(v11);
  return result;
}

- (void)_animateMapIfNeededWithPresentingController:(id)a3 presentingView:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_animationHasRan && ![(EKEventMapCell *)self->_cell currentlyLoading])
  {
    [v7 bounds];
    uint64_t v9 = v8;
    double v11 = v10;
    uint64_t v13 = v12;
    double v15 = v14;
    mapView = self->_mapView;
    [(MKMapItemView *)mapView bounds];
    -[MKMapItemView convertRect:toView:](mapView, "convertRect:toView:", v7);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    v25 = [v6 navigationController];
    v26 = [v25 toolbar];

    [v26 bounds];
    objc_msgSend(v26, "convertRect:toView:", v7);
    double v27 = CGRectGetMinY(v38) - v11;
    if (v27 >= v15) {
      double v28 = v15;
    }
    else {
      double v28 = v27;
    }
    uint64_t v29 = v9;
    double v30 = v11;
    uint64_t v31 = v13;
    v41.origin.x = v18;
    v41.origin.y = v20;
    v41.size.width = v22;
    v41.size.height = v24;
    CGRect v39 = CGRectIntersection(*(CGRect *)(&v28 - 3), v41);
    double Height = CGRectGetHeight(v39);
    v40.origin.x = v18;
    v40.origin.y = v20;
    v40.size.width = v22;
    v40.size.height = v24;
    double v33 = Height / CGRectGetHeight(v40);
    if (v33 >= 0.75)
    {
      v34 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        int v35 = 134217984;
        double v36 = v33;
        _os_log_impl(&dword_1B3F4C000, v34, OS_LOG_TYPE_DEBUG, "Triggering MapItemView animation with cell percent visible: %f", (uint8_t *)&v35, 0xCu);
      }
      self->_animationHasRan = 1;
      [(MKMapItemView *)self->_mapView triggerAnimation];
    }
  }
}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_loadingViewConstraints, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_mapViewConstraints, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_oldCell, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end