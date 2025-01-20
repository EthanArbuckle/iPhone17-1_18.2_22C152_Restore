@interface MKMapItemView
- ($F24F406B2B787EFB06265DBA3D28CBD5)_clampCoordinateSpan:(id)result;
- (BOOL)_areBoundsValid;
- (BOOL)hideLookAroundView;
- (BOOL)shouldResolveMapItem;
- (BOOL)shouldShowBorders;
- (BOOL)shouldShowMapAttribution;
- (GEOApplicationAuditToken)_auditToken;
- (MKMapItem)mapItem;
- (MKMapItemView)initWithFrame:(CGRect)a3;
- (id)_annotationView;
- (id)_customAnnotation;
- (id)_deriveSnapshotOptions:(BOOL)a3;
- (void)_addAttributionViews;
- (void)_addTapRecognizerForAttributionView:(id)a3;
- (void)_callCompletionHandler;
- (void)_callCompletionHandlerWithInvalidBoundsError;
- (void)_callCompletionHandlerWithInvalidCoordinateSpanError;
- (void)_fetchLookAroundViewforMapItem:(id)a3;
- (void)_getParentItem;
- (void)_handleTapOnAttribution:(id)a3;
- (void)_handleTapOnLookAroundView:(id)a3;
- (void)_handleTapOnSnapshot:(id)a3;
- (void)_loadMapItem:(id)a3 camera:(id)a4 coordinateSpan:(id)a5 completionHandler:(id)a6;
- (void)_receivedFullyDrawnNotification:(id)a3;
- (void)_reloadSnapshot;
- (void)_renderMapItem;
- (void)_resetAttributionViewState;
- (void)_resetLookAroundContainerViewState;
- (void)_resetState;
- (void)_setAuditToken:(id)a3;
- (void)_setupLookAroundConstraints;
- (void)_setupObserver;
- (void)_setupSnapshotConstraints;
- (void)_takeSnapshotCompleted;
- (void)_takeSnapshotWithCompletionHandler:(id)a3 isReload:(BOOL)a4;
- (void)_updateBorders;
- (void)cancel;
- (void)dealloc;
- (void)infoCardThemeChanged;
- (void)layoutSubviews;
- (void)loadMapItem:(id)a3 completionHandler:(id)a4;
- (void)loadMapItem:(id)a3 coordinateSpan:(id)a4 completionHandler:(id)a5;
- (void)setHideLookAroundView:(BOOL)a3;
- (void)setShouldResolveMapItem:(BOOL)a3;
- (void)setShouldShowBorders:(BOOL)a3;
- (void)setShouldShowMapAttribution:(BOOL)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)triggerAnimation;
@end

@implementation MKMapItemView

- (MKMapItemView)initWithFrame:(CGRect)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemView;
  v3 = -[MKMapItemView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shouldResolveMapItem = 1;
    v5 = MKGetMKMapItemViewLog();
    v4->_signpostID = os_signpost_id_generate(v5);

    v10[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = (id)[(MKMapItemView *)v4 registerForTraitChanges:v6 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v4;
}

- (void)infoCardThemeChanged
{
  v11.receiver = self;
  v11.super_class = (Class)MKMapItemView;
  [(UIView *)&v11 infoCardThemeChanged];
  v3 = [(UIView *)self mk_theme];
  id v4 = [v3 separatorLineColor];
  uint64_t v5 = [v4 CGColor];
  v6 = [(MKLookAroundContainerView *)self->_lookAroundContainerView layer];
  [v6 setBorderColor:v5];

  id v7 = [(UIView *)self mk_theme];
  id v8 = [v7 separatorLineColor];
  uint64_t v9 = [v8 CGColor];
  v10 = [(MKMapSnapshotView *)self->_snapshotView layer];
  [v10 setBorderColor:v9];
}

- (void)setShouldShowBorders:(BOOL)a3
{
  if (self->_shouldShowBorders != a3)
  {
    self->_shouldShowBorders = a3;
    [(MKMapItemView *)self _updateBorders];
  }
}

- (void)_updateBorders
{
  if (self->_shouldShowBorders)
  {
    v3 = [(MKMapItemView *)self window];
    id v4 = [v3 screen];
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 nativeScale];
      double v7 = v6;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F42D90] mainScreen];
      [v9 nativeScale];
      double v7 = v10;
    }
    if (v7 <= 1.0) {
      double v8 = 1.0;
    }
    else {
      double v8 = 1.0 / v7;
    }
  }
  else
  {
    double v8 = 0.0;
  }
  objc_super v11 = [(MKLookAroundContainerView *)self->_lookAroundContainerView layer];
  [v11 setBorderWidth:v8];

  id v12 = [(MKMapSnapshotView *)self->_snapshotView layer];
  [v12 setBorderWidth:v8];
}

- (void)loadMapItem:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MKMapItemView *)self bounds];
  double v10 = +[MKMapCamera cameraLookingAtMapItem:forViewSize:allowPitch:](MKMapCamera, "cameraLookingAtMapItem:forViewSize:allowPitch:", v6, 1, v8, v9);
  objc_super v11 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = _MKDebugNameForMapItem(v6);
    v13 = [v10 description];
    int v14 = 138478083;
    v15 = v12;
    __int16 v16 = 2113;
    v17 = v13;
    _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_INFO, "BEGIN loadMapItem: \"%{private}@\" camera: %{private}@", (uint8_t *)&v14, 0x16u);
  }
  -[MKMapItemView _loadMapItem:camera:coordinateSpan:completionHandler:](self, "_loadMapItem:camera:coordinateSpan:completionHandler:", v6, v10, v7, NAN, NAN);
}

- (void)loadMapItem:(id)a3 coordinateSpan:(id)a4 completionHandler:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  [v9 _coordinate];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  v15 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = _MKDebugNameForMapItem(v9);
    v17 = NSString;
    uint64_t v18 = [NSString stringWithFormat:@"%+.8f, %+.8f", v12, v14];
    v19 = [v17 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v18, *(void *)&var0, *(void *)&var1];

    *(_DWORD *)buf = 138478083;
    v21 = v16;
    __int16 v22 = 2113;
    v23 = v19;
    _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_INFO, "BEGIN loadMapItem: \"%{private}@\" region: %{private}@", buf, 0x16u);
  }
  -[MKMapItemView _loadMapItem:camera:coordinateSpan:completionHandler:](self, "_loadMapItem:camera:coordinateSpan:completionHandler:", v9, 0, v10, var0, var1);
}

- (void)_loadMapItem:(id)a3 camera:(id)a4 coordinateSpan:(id)a5 completionHandler:(id)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = MKGetMKMapItemViewLog();
  __int16 v16 = v15;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v16, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "Load", (const char *)&unk_18BD3917F, (uint8_t *)buf, 2u);
  }

  uint64_t v18 = (void *)MEMORY[0x18C139AE0](v14);
  id mapItemloadedCompletionHandler = self->_mapItemloadedCompletionHandler;
  self->_id mapItemloadedCompletionHandler = v18;

  if ([(MKMapItemView *)self _areBoundsValid])
  {
    if (v13 || var0 >= 0.0 && var0 <= 180.0 && var1 >= 0.0 && var1 <= 360.0)
    {
      self->_loadCalledOnce = 1;
      objc_storeStrong((id *)&self->_mapItem, a3);
      objc_storeStrong((id *)&self->_camera, a4);
      -[MKMapItemView _clampCoordinateSpan:](self, "_clampCoordinateSpan:", var0, var1);
      self->_coordinateSpan.latitudeDelta = v20;
      self->_coordinateSpan.longitudeDelta = v21;
      [(MKMapItemView *)self cancel];
      objc_initWeak(buf, self);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __70__MKMapItemView__loadMapItem_camera_coordinateSpan_completionHandler___block_invoke;
      v22[3] = &unk_1E54B8F58;
      objc_copyWeak(&v23, buf);
      [(MKMapItemView *)self _takeSnapshotWithCompletionHandler:v22 isReload:0];
      [(MKMapItemView *)self _getParentItem];
      objc_destroyWeak(&v23);
      objc_destroyWeak(buf);
    }
    else
    {
      [(MKMapItemView *)self _callCompletionHandlerWithInvalidCoordinateSpanError];
    }
  }
  else
  {
    [(MKMapItemView *)self _callCompletionHandlerWithInvalidBoundsError];
  }
}

void __70__MKMapItemView__loadMapItem_camera_coordinateSpan_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _takeSnapshotCompleted];
}

- (BOOL)_areBoundsValid
{
  [(MKMapItemView *)self bounds];
  if (v3 <= 0.0) {
    return 0;
  }
  [(MKMapItemView *)self bounds];
  return v4 > 0.0;
}

- (void)_callCompletionHandlerWithInvalidBoundsError
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  double v4 = MKErrorDomain;
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = @"Height or width cannot be zero";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (NSError *)[v3 initWithDomain:v4 code:1 userInfo:v5];
  snapshotError = self->_snapshotError;
  self->_snapshotError = v6;

  [(MKMapItemView *)self _callCompletionHandler];
}

- (void)_callCompletionHandlerWithInvalidCoordinateSpanError
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  double v4 = MKErrorDomain;
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = @"CoordinateSpan is invalid";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = (NSError *)[v3 initWithDomain:v4 code:1 userInfo:v5];
  snapshotError = self->_snapshotError;
  self->_snapshotError = v6;

  [(MKMapItemView *)self _callCompletionHandler];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_clampCoordinateSpan:(id)result
{
  BOOL v3 = result.var0 >= 0.0;
  double var1 = 0.02;
  if (result.var0 <= 0.0) {
    double var0 = 0.02;
  }
  else {
    double var0 = result.var0;
  }
  if (result.var0 > 180.0) {
    BOOL v3 = 0;
  }
  if (result.var1 < 0.0) {
    BOOL v3 = 0;
  }
  if (result.var1 > 0.0) {
    double var1 = result.var1;
  }
  if (v3 && result.var1 <= 360.0)
  {
    result.double var0 = var0;
    result.double var1 = var1;
  }
  return result;
}

- (void)_getParentItem
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(MKMapItem *)self->_mapItem _hasLookAroundStorefront])
  {
    mapItem = self->_mapItem;
    [(MKMapItemView *)self _fetchLookAroundViewforMapItem:mapItem];
  }
  else if ([(MKMapItemView *)self shouldResolveMapItem])
  {
    double v4 = [(MKMapItem *)self->_mapItem _identifier];
    BOOL v5 = v4 == 0;

    id v6 = +[MKMapService sharedService];
    id v7 = self->_mapItem;
    if (v5)
    {
      [(MKMapItem *)v7 _coordinate];
      id v10 = objc_msgSend(v6, "ticketForReverseGeocodeCoordinate:traits:", 0);
    }
    else
    {
      uint64_t v8 = [(MKMapItem *)v7 _identifier];
      v14[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      id v10 = [v6 ticketForIdentifiers:v9 traits:0];
    }
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__MKMapItemView__getParentItem__block_invoke;
    v11[3] = &unk_1E54B8830;
    objc_copyWeak(&v12, &location);
    [v10 submitWithHandler:v11 networkActivity:0];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __31__MKMapItemView__getParentItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    id v7 = MKGetMKMapItemViewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Unable to resolve MapItem %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v5 firstObject];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchLookAroundViewforMapItem:v8];
}

- (void)_fetchLookAroundViewforMapItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F64918] modernManager];
  int v6 = [v5 isMuninEnabled];
  if (!v4 || !v6)
  {
LABEL_11:

    goto LABEL_12;
  }
  int v7 = [v4 _hasLookAroundStorefront];

  if (v7 && !self->_hideLookAroundView)
  {
    uint64_t v8 = MKGetMKMapItemViewLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _MKDebugNameForMapItem(v4);
      int v16 = 138477827;
      v17 = v9;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "BEGIN _fetchLookAroundViewforMapItem: \"%{private}@\"", (uint8_t *)&v16, 0xCu);
    }
    int v10 = MKGetMKMapItemViewLog();
    id v11 = v10;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v11, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "LoadLookAround", (const char *)&unk_18BD3917F, (uint8_t *)&v16, 2u);
    }

    id v13 = objc_alloc_init(MKLookAroundContainerView);
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v13;

    [(MKLookAroundContainerView *)self->_lookAroundContainerView setMapItem:v4];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView setClipsToBounds:1];
    v15 = [(MKLookAroundContainerView *)self->_lookAroundContainerView layer];
    [v15 setCornerRadius:8.0];

    [(MKLookAroundContainerView *)self->_lookAroundContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView setHidden:1];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapOnLookAroundView_];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView addGestureRecognizer:v5];
    [(MKMapItemView *)self addSubview:self->_lookAroundContainerView];
    [(MKMapItemView *)self _setupLookAroundConstraints];
    [(MKMapItemView *)self _setupObserver];
    [(MKMapItemView *)self infoCardThemeChanged];
    [(MKMapItemView *)self _updateBorders];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_takeSnapshotWithCompletionHandler:(id)a3 isReload:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MKMapItemView *)self bounds];
  self->_sizeWhenLastLoaded.width = v7;
  self->_sizeWhenLastLoaded.height = v8;
  if (!self->_snapshotView)
  {
    id v9 = objc_alloc_init(MKMapSnapshotView);
    snapshotView = self->_snapshotView;
    self->_snapshotView = v9;

    [(MKMapSnapshotView *)self->_snapshotView setClipsToBounds:1];
    id v11 = [(MKMapSnapshotView *)self->_snapshotView layer];
    [v11 setCornerRadius:8.0];

    [(MKMapSnapshotView *)self->_snapshotView setHidden:1];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapOnSnapshot_];
    [(MKMapSnapshotView *)self->_snapshotView addGestureRecognizer:v12];
    [(MKMapItemView *)self addSubview:self->_snapshotView];
    [(MKMapItemView *)self _setupSnapshotConstraints];
    [(MKMapItemView *)self infoCardThemeChanged];
    [(MKMapItemView *)self _updateBorders];
  }
  [(MKMapItemView *)self _resetAttributionViewState];
  if (self->_shouldShowMapAttribution) {
    [(MKMapItemView *)self _addAttributionViews];
  }
  objc_initWeak(&location, self);
  id v13 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = @"NO";
    if (v4) {
      id v14 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v29 = v14;
    _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_INFO, "BEGIN _takeSnapshotWithCompletionHandler:isReload: %@", buf, 0xCu);
  }

  v15 = MKGetMKMapItemViewLog();
  int v16 = v15;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v16, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MapSnapshot", (const char *)&unk_18BD3917F, buf, 2u);
  }

  if (v4)
  {
    uint64_t v18 = [(MKMapItemView *)self _deriveSnapshotOptions:1];
  }
  else
  {
    uint64_t v18 = 0;
  }
  v19 = (void *)self->_signpostID;
  double v20 = self->_snapshotView;
  double v21 = [(MKMapItemView *)self _deriveSnapshotOptions:0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__MKMapItemView__takeSnapshotWithCompletionHandler_isReload___block_invoke;
  v23[3] = &unk_1E54BC5F8;
  objc_copyWeak(v25, &location);
  BOOL v26 = v4;
  v25[1] = v19;
  id v22 = v6;
  id v24 = v22;
  [(MKMapSnapshotView *)v20 takeSnapshotWithOptions:v21 gridOptions:v18 completionHandler:v23];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __61__MKMapItemView__takeSnapshotWithCompletionHandler_isReload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 65, a2);
    if (!v4)
    {
      [v6[58] setHidden:0];
      goto LABEL_9;
    }
  }
  else if (!v4)
  {
LABEL_9:
    CGFloat v7 = MKGetMKMapItemViewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 56)) {
        id v13 = @"YES";
      }
      else {
        id v13 = @"NO";
      }
      int v18 = 138412290;
      v19 = v13;
      id v9 = "END _takeSnapshotWithCompletionHandler:isReload: %@ didCompleteSuccessfully";
      int v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 12;
LABEL_14:
      _os_log_impl(&dword_18BAEC000, v10, v11, v9, (uint8_t *)&v18, v12);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  CGFloat v7 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    CGFloat v8 = @"YES";
    if (!*(unsigned char *)(a1 + 56)) {
      CGFloat v8 = @"NO";
    }
    int v18 = 138412546;
    v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    id v9 = "END _takeSnapshotWithCompletionHandler:isReload: %@ didCompleteWithError: %@";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_14;
  }
LABEL_15:

  id v14 = MKGetMKMapItemViewLog();
  v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 48);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v15, OS_SIGNPOST_INTERVAL_END, v16, "MapSnapshot", (const char *)&unk_18BD3917F, (uint8_t *)&v18, 2u);
  }

  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v4);
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)MKMapItemView;
  [(MKMapItemView *)&v8 layoutSubviews];
  if (self->_loadCalledOnce)
  {
    [(MKMapItemView *)self bounds];
    if (v4 != self->_sizeWhenLastLoaded.width || v3 != self->_sizeWhenLastLoaded.height)
    {
      [(MKMapItemView *)self bounds];
      if (v6 != 0.0)
      {
        [(MKMapItemView *)self bounds];
        if (v7 != 0.0)
        {
          [(MKMapSnapshotView *)self->_snapshotView setHidden:1];
          [(MKMapSnapshotView *)self->_snapshotView cancel];
          +[MKMapItemView cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadSnapshot object:0];
          [(MKMapItemView *)self performSelector:sel__reloadSnapshot withObject:0 afterDelay:0.1];
        }
      }
    }
  }
}

- (id)_deriveSnapshotOptions:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MKMapSnapshotOptions);
  double v6 = v5;
  if (v3)
  {
    [(MKMapSnapshotOptions *)v5 setMapType:105];
  }
  else
  {
    double v7 = [[MKStandardMapConfiguration alloc] initWithElevationStyle:1];
    [(MKMapSnapshotOptions *)v6 setPreferredConfiguration:v7];
    objc_super v8 = [(MKMapItemView *)self _customAnnotation];
    v14[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(MKMapSnapshotOptions *)v6 _setCustomFeatureAnnotations:v9];
  }
  if (self->_camera)
  {
    -[MKMapSnapshotOptions setCamera:](v6, "setCamera:");
  }
  else
  {
    [(MKMapItem *)self->_mapItem _coordinate];
    -[MKMapSnapshotOptions setRegion:](v6, "setRegion:");
  }
  [(MKMapItemView *)self bounds];
  -[MKMapSnapshotOptions setSize:](v6, "setSize:", v10, v11);
  uint32_t v12 = [(MKMapItemView *)self traitCollection];
  [(MKMapSnapshotOptions *)v6 setTraitCollection:v12];

  [(MKMapSnapshotOptions *)v6 _setSearchResultsType:1];
  [(MKMapSnapshotOptions *)v6 _setShowsAppleLogo:0];
  [(MKMapSnapshotOptions *)v6 _setAuditToken:self->_auditToken];

  return v6;
}

- (id)_customAnnotation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB39F8]);
  [(MKMapItem *)self->_mapItem _coordinate];
  double v4 = objc_msgSend(v3, "initWithCoordinate:");
  id v5 = [(MKMapItem *)self->_mapItem name];
  [v4 setText:v5 locale:0];

  double v6 = [(MKMapItem *)self->_mapItem _styleAttributes];
  double v7 = (void *)[v6 copy];

  if (!v7)
  {
    double v7 = [MEMORY[0x1E4F645A0] markerStyleAttributes];
  }
  long long v10 = xmmword_18BD1B410;
  [v7 replaceAttributes:&v10 count:2];
  [v4 setStyleAttributes:v7];
  objc_super v8 = objc_alloc_init(_MKAnnotationViewCustomFeatureAnnotation);
  [(MKMapItem *)self->_mapItem _coordinate];
  -[_MKAnnotationViewCustomFeatureAnnotation setCoordinate:](v8, "setCoordinate:");
  [(_MKAnnotationViewCustomFeatureAnnotation *)v8 setCustomFeature:v4];

  return v8;
}

- (id)_annotationView
{
  id v3 = objc_alloc_init(MKPointAnnotation);
  [(MKMapItem *)self->_mapItem _coordinate];
  -[MKPointAnnotation setCoordinate:](v3, "setCoordinate:");
  double v4 = [(MKMapItem *)self->_mapItem name];
  [(MKShape *)v3 setTitle:v4];

  id v5 = [[MKMarkerAnnotationView alloc] initWithAnnotation:v3 reuseIdentifier:0];
  double v6 = [(MKMapItem *)self->_mapItem _styleAttributes];
  [(MKMarkerAnnotationView *)v5 _setStyleAttributes:v6];

  return v5;
}

- (void)_handleTapOnSnapshot:(id)a3
{
}

void __38__MKMapItemView__handleTapOnSnapshot___block_invoke(uint64_t a1, int a2)
{
  id v3 = MKGetMKMapItemViewLog();
  double v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = 0;
      id v5 = "Punch into Maps successful";
      double v6 = (uint8_t *)&v10;
      double v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_18BAEC000, v7, v8, v5, v6, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = 0;
    id v5 = "Punch into Maps was not successful";
    double v6 = (uint8_t *)&v9;
    double v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (void)_handleTapOnAttribution:(id)a3
{
  if (self->_attributionURL)
  {
    id v4 = +[MKSystemController sharedInstance];
    [v4 openURL:self->_attributionURL completionHandler:0];
  }
}

- (void)_handleTapOnLookAroundView:(id)a3
{
  id v3 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  [v3 openInMapsWithCompletionHandler:0];
}

- (void)_setupObserver
{
  id v4 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  if (v4)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__receivedFullyDrawnNotification_ name:@"MKLookAroundViewDidBecomeFullyDrawn" object:v4];
  }
}

- (void)_receivedFullyDrawnNotification:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 removeObserver:self];

  id v5 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  char v6 = [v5 isLoading];

  double v7 = MKGetMKMapItemViewLog();
  os_log_type_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "Received fully-drawn notification, but view still claims to be loading", v11, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "END _fetchLookAroundViewforMapItem: (Received fully-drawn notification)", buf, 2u);
    }

    __int16 v9 = MKGetMKMapItemViewLog();
    os_log_type_t v8 = v9;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)uint32_t v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v8, OS_SIGNPOST_INTERVAL_END, signpostID, "LoadLookAround", (const char *)&unk_18BD3917F, v12, 2u);
    }
  }
}

- (void)_setupLookAroundConstraints
{
  v23[6] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v22 = [(MKLookAroundContainerView *)self->_lookAroundContainerView topAnchor];
  id v21 = [(MKMapItemView *)self topAnchor];
  __int16 v20 = [v22 constraintGreaterThanOrEqualToAnchor:v21];
  v23[0] = v20;
  v19 = [(MKLookAroundContainerView *)self->_lookAroundContainerView bottomAnchor];
  int v18 = [(MKMapItemView *)self bottomAnchor];
  uint64_t v17 = [v19 constraintEqualToAnchor:v18 constant:-8.0];
  v23[1] = v17;
  v15 = [(MKLookAroundContainerView *)self->_lookAroundContainerView leadingAnchor];
  id v14 = [(MKMapItemView *)self leadingAnchor];
  id v13 = [v15 constraintEqualToAnchor:v14 constant:8.0];
  v23[2] = v13;
  id v3 = [(MKLookAroundContainerView *)self->_lookAroundContainerView widthAnchor];
  id v4 = [v3 constraintEqualToConstant:124.0];
  v23[3] = v4;
  id v5 = [(MKLookAroundContainerView *)self->_lookAroundContainerView heightAnchor];
  char v6 = [v5 constraintEqualToConstant:91.0];
  void v23[4] = v6;
  double v7 = [(MKLookAroundContainerView *)self->_lookAroundContainerView trailingAnchor];
  os_log_type_t v8 = [(MKMapItemView *)self trailingAnchor];
  __int16 v9 = [v7 constraintLessThanOrEqualToAnchor:v8];
  v23[5] = v9;
  __int16 v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];
  uint64_t v11 = [v16 arrayWithArray:v10];
  lookAroundConstraints = self->_lookAroundConstraints;
  self->_lookAroundConstraints = v11;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_lookAroundConstraints];
}

- (void)_addTapRecognizerForAttributionView:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F42EC8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithTarget:self action:sel__handleTapOnAttribution_];
  [v5 addGestureRecognizer:v6];
}

- (void)_addAttributionViews
{
  v52[2] = *MEMORY[0x1E4F143B8];
  if (self->_snapshotView)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = +[MKMapAttributionImage badgeImageForView:self];
    v48 = (void *)v4;
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
      double v7 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      attributionBadgeView = self->_attributionBadgeView;
      self->_attributionBadgeView = v7;

      [(UIImageView *)self->_attributionBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)self->_attributionBadgeView setImage:v5];
      [(MKMapSnapshotView *)self->_snapshotView addSubview:self->_attributionBadgeView];
      v49 = self->_attributionBadgeView;
      __int16 v9 = [(UIImageView *)self->_attributionBadgeView widthAnchor];
      [v5 size];
      __int16 v10 = objc_msgSend(v9, "constraintEqualToConstant:");
      v52[0] = v10;
      uint64_t v11 = [(UIImageView *)self->_attributionBadgeView heightAnchor];
      [v5 size];
      id v13 = [v11 constraintEqualToConstant:v12];
      v52[1] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
      [v3 addObjectsFromArray:v14];

      double v15 = 10.0;
    }
    else
    {
      os_signpost_id_t v16 = [MEMORY[0x1E4F42F80] currentTraitCollection];
      BOOL v17 = [v16 userInterfaceStyle] == 2;

      int v18 = [[MKAppleLogoLabel alloc] initForMapType:0 forDarkMode:v17 alternativeStringDrawing:1];
      attributionAppleLogo = self->_attributionAppleLogo;
      self->_attributionAppleLogo = v18;

      [(MKAppleLogoLabel *)self->_attributionAppleLogo setTranslatesAutoresizingMaskIntoConstraints:0];
      [(MKMapSnapshotView *)self->_snapshotView addSubview:self->_attributionAppleLogo];
      v49 = self->_attributionAppleLogo;
      double v15 = 7.0;
    }
    __int16 v20 = v3;
    id v21 = [(UIImageView *)v49 leadingAnchor];
    uint64_t v22 = [(MKMapSnapshotView *)self->_snapshotView leadingAnchor];
    id v23 = [v21 constraintEqualToAnchor:v22 constant:10.0];
    v51[0] = v23;
    id v24 = [(MKMapSnapshotView *)self->_snapshotView bottomAnchor];
    v25 = [(UIImageView *)v49 bottomAnchor];
    BOOL v26 = [v24 constraintEqualToAnchor:v25 constant:v15];
    v51[1] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    [v20 addObjectsFromArray:v27];

    v28 = [MEMORY[0x1E4F64918] modernManager];
    v29 = [v28 activeTileGroup];
    uint64_t v30 = v20;
    [(MKMapItem *)self->_mapItem _coordinate];
    objc_msgSend(v29, "mapAttributionURLForCoordinate:");
    v31 = (NSURL *)objc_claimAutoreleasedReturnValue();
    attributionURL = self->_attributionURL;
    self->_attributionURL = v31;

    if (self->_attributionURL)
    {
      v33 = objc_alloc_init(MKAttributionLabel);
      attributionLabel = self->_attributionLabel;
      self->_attributionLabel = v33;

      [(MKAttributionLabel *)self->_attributionLabel setMapType:0];
      [(MKAttributionLabel *)self->_attributionLabel sizeToFit];
      [(MKAttributionLabel *)self->_attributionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(MKMapSnapshotView *)self->_snapshotView addSubview:self->_attributionLabel];
      [(MKMapItemView *)self _addTapRecognizerForAttributionView:self->_attributionLabel];
      v47 = [(MKAttributionLabel *)self->_attributionLabel widthAnchor];
      [(MKAttributionLabel *)self->_attributionLabel bounds];
      v46 = [v47 constraintEqualToConstant:v35];
      v50[0] = v46;
      v36 = [(MKAttributionLabel *)self->_attributionLabel heightAnchor];
      [(MKAttributionLabel *)self->_attributionLabel bounds];
      v38 = [v36 constraintEqualToConstant:v37];
      v50[1] = v38;
      v39 = [(MKAttributionLabel *)self->_attributionLabel leadingAnchor];
      v40 = [(UIImageView *)v49 trailingAnchor];
      v41 = [v39 constraintEqualToAnchor:v40 constant:10.0];
      v50[2] = v41;
      v42 = [(MKMapSnapshotView *)self->_snapshotView bottomAnchor];
      v43 = [(MKAttributionLabel *)self->_attributionLabel bottomAnchor];
      v44 = [v42 constraintEqualToAnchor:v43 constant:10.0];
      v50[3] = v44;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
      [v30 addObjectsFromArray:v45];
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:v30];
  }
}

- (void)setShouldShowMapAttribution:(BOOL)a3
{
  if (self->_shouldShowMapAttribution != a3)
  {
    self->_shouldShowMapAttribution = a3;
    [(MKMapItemView *)self _resetAttributionViewState];
    if (self->_shouldShowMapAttribution)
    {
      [(MKMapItemView *)self _addAttributionViews];
    }
  }
}

- (void)_setupSnapshotConstraints
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v19 = [(MKMapSnapshotView *)self->_snapshotView topAnchor];
  int v18 = [(MKMapItemView *)self topAnchor];
  BOOL v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  uint64_t v4 = [(MKMapSnapshotView *)self->_snapshotView trailingAnchor];
  id v5 = [(MKMapItemView *)self trailingAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];
  v20[1] = v6;
  double v7 = [(MKMapSnapshotView *)self->_snapshotView heightAnchor];
  os_log_type_t v8 = [(MKMapItemView *)self heightAnchor];
  __int16 v9 = [v7 constraintEqualToAnchor:v8];
  v20[2] = v9;
  __int16 v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  uint64_t v11 = [v3 arrayWithArray:v10];
  snapshotConstraints = self->_snapshotConstraints;
  self->_snapshotConstraints = v11;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_snapshotConstraints];
  id v13 = [(MKMapSnapshotView *)self->_snapshotView widthAnchor];
  id v14 = [(MKMapItemView *)self widthAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  snapshotWidthConstraint = self->_snapshotWidthConstraint;
  self->_snapshotWidthConstraint = v15;

  [(NSLayoutConstraint *)self->_snapshotWidthConstraint setActive:1];
}

- (void)_reloadSnapshot
{
  if ([(MKMapItemView *)self _areBoundsValid])
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __32__MKMapItemView__reloadSnapshot__block_invoke;
    v3[3] = &unk_1E54B8F58;
    objc_copyWeak(&v4, &location);
    [(MKMapItemView *)self _takeSnapshotWithCompletionHandler:v3 isReload:1];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MKMapItemView *)self _callCompletionHandlerWithInvalidBoundsError];
  }
}

void __32__MKMapItemView__reloadSnapshot__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (!a2 && WeakRetained) {
    [WeakRetained[58] setHidden:0];
  }
  id v5 = objc_loadWeakRetained(v3);
  [v5 _takeSnapshotCompleted];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "BEGIN traitCollectionDidChange", buf, 2u);
  }

  if (self->_loadCalledOnce)
  {
    double v7 = [(MKMapItemView *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];
    if (v8 == [v5 userInterfaceStyle] || (-[MKMapItemView bounds](self, "bounds"), v9 == 0.0))
    {
    }
    else
    {
      [(MKMapItemView *)self bounds];
      double v11 = v10;

      if (v11 != 0.0) {
        [(MKMapItemView *)self _reloadSnapshot];
      }
    }
  }
  double v12 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_INFO, "END traitCollectionDidChange", v13, 2u);
  }
}

- (void)_takeSnapshotCompleted
{
  [(MKMapItemView *)self _renderMapItem];

  [(MKMapItemView *)self _callCompletionHandler];
}

- (void)_renderMapItem
{
  id v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(MKMapItemView *)self setBackgroundColor:v3];

  id v4 = [(MKMapSnapshotView *)self->_snapshotView image];
  if (v4 && (id v5 = self->_lookAroundContainerView, v4, v5))
  {
    [(NSLayoutConstraint *)self->_snapshotWidthConstraint setActive:0];
    [(MKLookAroundContainerView *)self->_lookAroundContainerView setHidden:0];
  }
  else
  {
    id v6 = [(MKMapSnapshotView *)self->_snapshotView image];
    if (!v6) {
      return;
    }
    lookAroundContainerView = self->_lookAroundContainerView;

    if (lookAroundContainerView) {
      return;
    }
  }
  snapshotView = self->_snapshotView;

  [(MKMapSnapshotView *)snapshotView setHidden:0];
}

- (void)_callCompletionHandler
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_mapItemloadedCompletionHandler)
  {
    id v3 = MKGetMKMapItemViewLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if (self->_snapshotError) {
        id v4 = @"(with error)";
      }
      else {
        id v4 = @"(with success)";
      }
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "END loadMapItem: %@", (uint8_t *)&v13, 0xCu);
    }

    id v5 = MKGetMKMapItemViewLog();
    id v6 = v5;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v6, OS_SIGNPOST_INTERVAL_END, signpostID, "Load", (const char *)&unk_18BD3917F, (uint8_t *)&v13, 2u);
    }

    uint64_t v8 = (void (**)(void, void))MEMORY[0x18C139AE0](self->_mapItemloadedCompletionHandler);
    id mapItemloadedCompletionHandler = self->_mapItemloadedCompletionHandler;
    self->_id mapItemloadedCompletionHandler = 0;

    if (self->_snapshotError)
    {
      double v10 = MKGetMKMapItemViewLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        snapshotError = self->_snapshotError;
        int v13 = 138412290;
        id v14 = snapshotError;
        _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_ERROR, "SnapshotError: %@", (uint8_t *)&v13, 0xCu);
      }

      double v12 = self->_snapshotError;
    }
    else
    {
      double v12 = 0;
    }
    ((void (**)(void, NSError *))v8)[2](v8, v12);
  }
}

- (void)cancel
{
  id v3 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "BEGIN cancel", buf, 2u);
  }

  [(MKLookAroundContainerView *)self->_lookAroundContainerView cancelIfPresent];
  [(MKMapSnapshotView *)self->_snapshotView cancel];
  [(MKMapItemView *)self _resetState];
  id v4 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "END cancel", v5, 2u);
  }
}

- (void)_resetState
{
  snapshotError = self->_snapshotError;
  self->_snapshotError = 0;

  [(MKMapSnapshotView *)self->_snapshotView setHidden:1];
  [(MKMapSnapshotView *)self->_snapshotView setImage:0];
  [(NSLayoutConstraint *)self->_snapshotWidthConstraint setActive:1];
  [(MKMapItemView *)self _resetLookAroundContainerViewState];
  [(MKMapItemView *)self _resetAttributionViewState];

  +[MKMapItemView cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadSnapshot object:0];
}

- (void)_resetLookAroundContainerViewState
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  [v3 removeObserver:self name:@"MKLookAroundViewDidBecomeFullyDrawn" object:v4];

  [(MKMapItemView *)self removeConstraints:self->_lookAroundConstraints];
  [(MKLookAroundContainerView *)self->_lookAroundContainerView removeFromSuperview];
  lookAroundContainerView = self->_lookAroundContainerView;
  self->_lookAroundContainerView = 0;
}

- (void)_resetAttributionViewState
{
  attributionURL = self->_attributionURL;
  self->_attributionURL = 0;

  [(MKAppleLogoLabel *)self->_attributionAppleLogo removeFromSuperview];
  attributionAppleLogo = self->_attributionAppleLogo;
  self->_attributionAppleLogo = 0;

  [(MKAttributionLabel *)self->_attributionLabel removeFromSuperview];
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = 0;

  [(UIImageView *)self->_attributionBadgeView removeFromSuperview];
  attributionBadgeView = self->_attributionBadgeView;
  self->_attributionBadgeView = 0;
}

- (void)triggerAnimation
{
  id v3 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "BEGIN triggerAnimation", buf, 2u);
  }

  id v4 = [(MKLookAroundContainerView *)self->_lookAroundContainerView lookAroundViewIfPresent];
  [v4 moveToCloseUpView];

  id v5 = MKGetMKMapItemViewLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "END triggerAnimation", v6, 2u);
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MKMapItemView;
  [(MKMapItemView *)&v4 dealloc];
}

- (BOOL)shouldResolveMapItem
{
  return self->_shouldResolveMapItem;
}

- (void)setShouldResolveMapItem:(BOOL)a3
{
  self->_shouldResolveMapItem = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)shouldShowBorders
{
  return self->_shouldShowBorders;
}

- (BOOL)hideLookAroundView
{
  return self->_hideLookAroundView;
}

- (void)setHideLookAroundView:(BOOL)a3
{
  self->_hideLookAroundView = a3;
}

- (BOOL)shouldShowMapAttribution
{
  return self->_shouldShowMapAttribution;
}

- (GEOApplicationAuditToken)_auditToken
{
  return self->_auditToken;
}

- (void)_setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_loadTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_snapshotError, 0);
  objc_storeStrong((id *)&self->_snapshotWidthConstraint, 0);
  objc_storeStrong((id *)&self->_snapshotConstraints, 0);
  objc_storeStrong(&self->_mapItemloadedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_attributionConstraints, 0);
  objc_storeStrong((id *)&self->_attributionBadgeView, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_attributionAppleLogo, 0);
  objc_storeStrong((id *)&self->_lookAroundConstraints, 0);

  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
}

@end