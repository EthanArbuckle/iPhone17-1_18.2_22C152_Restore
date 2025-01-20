@interface MKLinkPreviewMetadataRequest
- (BOOL)isCancelled;
- (BOOL)isLoading;
- (MKLinkPreviewMetadataRequest)initWithURL:(id)a3;
- (NSURL)url;
- (id)_subtitleFromMapItem:(id)a3 useMultilineAddressFormat:(BOOL)a4;
- (void)_failWithError:(id)a3;
- (void)_forwardGeocodeString:(id)a3 completionHandler:(id)a4;
- (void)_handleDirectionsAction;
- (void)_handleFrameAction;
- (void)_handleGuidesAction;
- (void)_handleLookAroundAction;
- (void)_handlePlaceAction;
- (void)_handleReportAProblemAction;
- (void)_handleSearchAction;
- (void)_populateLocationInfo:(id)a3 withMapItem:(id)a4;
- (void)_refineCollectionStorage:(id)a3 completionHandler:(id)a4;
- (void)_refineCuratedCollectionStorageWithCollectionIdentifier:(unint64_t)a3 providerIdentifier:(int)a4 completionHandler:(id)a5;
- (void)_requestCategoryIconFromMapItem:(id)a3 completionHandler:(id)a4;
- (void)_requestMapItemFromLocationQueryItem:(id)a3 completionHandler:(id)a4;
- (void)_requestMapItemFromMapItemIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_requestPublisherFromPublisherIdentifier:(unint64_t)a3 providerIdentifier:(int)a4 completionHandler:(id)a5;
- (void)_reverseGeocodeCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4;
- (void)_searchWithQuery:(id)a3 region:(id *)a4 completionHandler:(id)a5;
- (void)_singleLocationUpdateWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)getMetadataWithCompletionHandler:(id)a3;
@end

@implementation MKLinkPreviewMetadataRequest

- (MKLinkPreviewMetadataRequest)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKLinkPreviewMetadataRequest;
  v6 = [(MKLinkPreviewMetadataRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(MKLinkPreviewMetadataRequest *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MKLinkPreviewMetadataRequest;
  [(MKLinkPreviewMetadataRequest *)&v3 dealloc];
}

- (BOOL)isCancelled
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isLoading
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_loading;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)getMetadataWithCompletionHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  BOOL loading = self->_loading;
  if (self->_loading)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Cannot call -[MKLinkPreviewMetadataRequest getMetadataWithCompletionHandler:] on a metadata request which is already loading", buf, 2u);
    }
  }
  else
  {
    self->_BOOL loading = 1;
    os_unfair_lock_unlock(&self->_stateLock);
  }
  v8 = [[_MKURLParser alloc] initWithURL:self->_url];
  objc_super v9 = v8;
  if (!v8)
  {
    v12 = MKGetMKLinkPreviewLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    v13 = NSStringFromSelector(a2);
    url = self->_url;
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = (uint64_t)v13;
    __int16 v34 = 2114;
    v35 = url;
    v15 = "%{public}@ could not build a parser for %{public}@";
LABEL_18:
    _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);

    goto LABEL_19;
  }
  if (loading) {
    goto LABEL_20;
  }
  if (![(_MKURLParser *)v8 parseIncludingCustomParameters:1])
  {
    v12 = MKGetMKLinkPreviewLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    v13 = NSStringFromSelector(a2);
    v16 = self->_url;
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = (uint64_t)v13;
    __int16 v34 = 2114;
    v35 = v16;
    v15 = "%{public}@ failed parsing %{public}@";
    goto LABEL_18;
  }
  if (![(_MKURLParser *)v9 actionType])
  {
    v12 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      v17 = self->_url;
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = (uint64_t)v13;
      __int16 v34 = 2114;
      v35 = v17;
      v15 = "%{public}@ parser could not identify action type for %{public}@";
      goto LABEL_18;
    }
LABEL_19:

LABEL_20:
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    v19 = (void *)[v18 initWithDomain:MKErrorDomain code:1 userInfo:0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __65__MKLinkPreviewMetadataRequest_getMetadataWithCompletionHandler___block_invoke;
    v29[3] = &unk_1E54B8360;
    id v30 = v19;
    id v31 = v5;
    id v20 = v19;
    _performBlockOnMainThreadIfNeeded(v29);

    v21 = v31;
LABEL_21:

    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x18C139AE0](v5);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v10;

  objc_storeStrong((id *)&self->_parser, v9);
  switch([(_MKURLParser *)v9 actionType])
  {
    case 1:
      [(MKLinkPreviewMetadataRequest *)self _handleDirectionsAction];
      break;
    case 2:
      [(MKLinkPreviewMetadataRequest *)self _handleFrameAction];
      break;
    case 3:
      [(MKLinkPreviewMetadataRequest *)self _handleSearchAction];
      break;
    case 4:
      [(MKLinkPreviewMetadataRequest *)self _handlePlaceAction];
      break;
    case 5:
      [(MKLinkPreviewMetadataRequest *)self _handleLookAroundAction];
      break;
    case 6:
      [(MKLinkPreviewMetadataRequest *)self _handleGuidesAction];
      break;
    case 7:
      [(MKLinkPreviewMetadataRequest *)self _handleReportAProblemAction];
      break;
    default:
      v22 = MKGetMKLinkPreviewLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [(_MKURLParser *)v9 actionType];
        *(_DWORD *)buf = 134217984;
        uint64_t v33 = v23;
        _os_log_impl(&dword_18BAEC000, v22, OS_LOG_TYPE_ERROR, "Unknown URL ActionType encountered : %lu", buf, 0xCu);
      }

      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      v25 = (void *)[v24 initWithDomain:MKErrorDomain code:1 userInfo:0];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65__MKLinkPreviewMetadataRequest_getMetadataWithCompletionHandler___block_invoke_4;
      v26[3] = &unk_1E54B8360;
      id v27 = v25;
      id v28 = v5;
      id v20 = v25;
      _performBlockOnMainThreadIfNeeded(v26);

      v21 = v28;
      goto LABEL_21;
  }
LABEL_22:
}

uint64_t __65__MKLinkPreviewMetadataRequest_getMetadataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __65__MKLinkPreviewMetadataRequest_getMetadataWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)cancel
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_loading && !self->_cancelled) {
    self->_cancelled = 1;
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)_handleDirectionsAction
{
  objc_super v3 = self->_parser;
  v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  id v5 = [(MKLinkPreviewMetadata *)[MKLinkPreviewDirectionsMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
  v6 = [(_MKURLParser *)v3 sourceLocationQueryItem];
  v16 = [(_MKURLParser *)v3 destinationLocationQueryItem];
  int v7 = 2;
  switch([(_MKURLParser *)v3 transportType])
  {
    case 2uLL:
      break;
    case 4uLL:
      int v7 = 1;
      break;
    case 8uLL:
      int v7 = 3;
      break;
    default:
      int v7 = 0;
      break;
  }
  objc_initWeak(location, self);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke;
  v41[3] = &unk_1E54B9D78;
  v8 = v5;
  v42 = v8;
  int v44 = v7;
  id v9 = v4;
  id v43 = v9;
  v10 = (void *)MEMORY[0x18C139AE0](v41);
  v11 = dispatch_group_create();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__10;
  v39[4] = __Block_byref_object_dispose__10;
  id v40 = +[MKMapItem mapItemForCurrentLocation];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__10;
  v37[4] = __Block_byref_object_dispose__10;
  id v38 = 0;
  dispatch_group_enter(v11);
  if (v6)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_9;
    v35[3] = &unk_1E54B9DA0;
    v36[1] = v37;
    v36[2] = v39;
    v36[0] = v11;
    [(MKLinkPreviewMetadataRequest *)self _requestMapItemFromLocationQueryItem:v6 completionHandler:v35];
    v12 = (id *)v36;
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_2_11;
    v32[3] = &unk_1E54B9DC8;
    v33[1] = v39;
    v33[0] = v11;
    objc_copyWeak(&v34, location);
    v33[2] = v37;
    [(MKLinkPreviewMetadataRequest *)self _singleLocationUpdateWithCompletionHandler:v32];
    v12 = (id *)v33;
    objc_destroyWeak(&v34);
  }

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__10;
  v30[4] = __Block_byref_object_dispose__10;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__10;
  v28[4] = __Block_byref_object_dispose__10;
  id v29 = 0;
  dispatch_group_enter(v11);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_4;
  v24[3] = &unk_1E54B9DA0;
  v26 = v28;
  id v27 = v30;
  v13 = v11;
  v25 = v13;
  [(MKLinkPreviewMetadataRequest *)self _requestMapItemFromLocationQueryItem:v16 completionHandler:v24];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_5;
  block[3] = &unk_1E54B9DF0;
  id v20 = v37;
  v21 = v28;
  id v18 = v9;
  id v19 = v10;
  v22 = v30;
  uint64_t v23 = v39;
  id v14 = v10;
  id v15 = v9;
  dispatch_group_notify(v13, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  objc_destroyWeak(location);
}

void __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 _addressFormattedAsSinglelineAddress];
  [*(id *)(a1 + 32) setTitle:v7];

  v8 = [v5 name];
  [*(id *)(a1 + 32) setSourceName:v8];

  id v9 = [v5 _shortAddress];
  [*(id *)(a1 + 32) setSourceAddress:v9];

  v10 = [v5 _cnPostalAddress];
  [*(id *)(a1 + 32) setSourceAddressComponents:v10];

  v11 = [v6 name];
  [*(id *)(a1 + 32) setDestinationName:v11];

  v12 = [v6 _shortAddress];
  [*(id *)(a1 + 32) setDestinationAddress:v12];

  v13 = [v6 _cnPostalAddress];
  [*(id *)(a1 + 32) setDestinationAddressComponents:v13];

  id v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) setTransportType:v14];

  if (v5)
  {
    [v5 _coordinate];
    if (CLLocationCoordinate2DIsValid(v30))
    {
      [v6 _coordinate];
      if (CLLocationCoordinate2DIsValid(v31))
      {
        [v5 _coordinate];
        double v16 = v15;
        double v18 = v17;
        [v6 _coordinate];
        double v20 = v19;
        double v22 = v21;
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v16 longitude:v18];
        id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v20 longitude:v22];
        v25 = NSNumber;
        [v23 distanceFromLocation:v24];
        v26 = objc_msgSend(v25, "numberWithDouble:");

        [*(id *)(a1 + 32) setDistance:v26];
      }
    }
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_2;
  v27[3] = &unk_1E54B8360;
  id v29 = *(id *)(a1 + 40);
  id v28 = *(id *)(a1 + 32);
  _performBlockOnMainThreadIfNeeded(v27);
}

uint64_t __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_2_11(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [v5 coordinate];
    double v8 = v7;
    double v10 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_3;
    v13[3] = &unk_1E54B9DA0;
    int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    id v14 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_reverseGeocodeCoordinate:completionHandler:", v13, v8, v10);
  }
}

void __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_5(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
    objc_super v3 = (void *)[v2 initWithDomain:MKErrorDomain code:1 userInfo:MEMORY[0x1E4F1CC08]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_6;
    v7[3] = &unk_1E54B8360;
    id v4 = *(id *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    id v5 = v3;
    _performBlockOnMainThreadIfNeeded(v7);
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __55__MKLinkPreviewMetadataRequest__handleDirectionsAction__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_handleFrameAction
{
  objc_super v3 = self->_parser;
  id v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  id v5 = [(MKLinkPreviewMetadata *)[MKLinkPreviewFrameMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
  [(_MKURLParser *)v3 centerCoordinate];
  if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
  {
    [(_MKURLParser *)v3 centerCoordinate];
    id v9 = v8;
    uint64_t v11 = v10;
    -[MKLinkPreviewFrameMetadata setCoordinate:](v5, "setCoordinate:");
    [(_MKURLParser *)v3 cameraCenterBasedAltitude];
    if (v12 <= 0.0)
    {
      double v19 = [(_MKURLParser *)v3 mapCamera];
      [v19 altitude];
      if (v20 > 0.0)
      {
      }
      else
      {
        double v21 = [(_MKURLParser *)v3 mapCamera];
        [v21 centerCoordinateDistance];
        double v23 = v22;

        if (v23 <= 0.0)
        {
          [(_MKURLParser *)v3 span];
          if (v24 >= 0.0 && v24 <= 180.0 && v25 >= 0.0 && v25 <= 360.0)
          {
            [(_MKURLParser *)v3 span];
            if (v26 != 0.0)
            {
              [(_MKURLParser *)v3 span];
              if (v27 != 0.0)
              {
                [(_MKURLParser *)v3 span];
                -[MKLinkPreviewMetadata setCoordinateRegion:](v5, "setCoordinateRegion:", *(double *)&v9, *(double *)&v11, v28, v29);
              }
            }
          }
          goto LABEL_20;
        }
      }
      uint64_t v18 = [(_MKURLParser *)v3 mapCamera];
    }
    else
    {
      [(_MKURLParser *)v3 cameraCenterBasedAltitude];
      double v14 = v13;
      [(_MKURLParser *)v3 tilt];
      double v16 = v15;
      [(_MKURLParser *)v3 rotation];
      uint64_t v18 = +[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", *(double *)&v9, *(double *)&v11, v14, v16, v17);
    }
    CLLocationCoordinate2D v30 = (void *)v18;
    [(MKLinkPreviewMetadata *)v5 setMapCamera:v18];

LABEL_20:
    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke;
    v34[3] = &unk_1E54B9E40;
    v35 = v5;
    v37[1] = v9;
    v37[2] = v11;
    objc_copyWeak(v37, &location);
    id v36 = v4;
    -[MKLinkPreviewMetadataRequest _reverseGeocodeCoordinate:completionHandler:](self, "_reverseGeocodeCoordinate:completionHandler:", v34, *(double *)&v9, *(double *)&v11);

    objc_destroyWeak(v37);
    objc_destroyWeak(&location);
    goto LABEL_21;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke_4;
  v31[3] = &unk_1E54B8360;
  id v33 = v4;
  v32 = v5;
  _performBlockOnMainThreadIfNeeded(v31);

LABEL_21:
}

void __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (!v5 || v6)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:*(double *)(a1 + 56) longitude:*(double *)(a1 + 64)];
    id v9 = [[MKMapItem alloc] initWithCLLocation:v8];
    double v24 = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [*(id *)(a1 + 32) setMapItems:v10];
  }
  else
  {
    v25[0] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [*(id *)(a1 + 32) setMapItems:v8];
  }

  uint64_t v11 = [*(id *)(a1 + 32) mapCamera];
  if (v11) {
    goto LABEL_15;
  }
  [*(id *)(a1 + 32) coordinateRegion];
  if (v13 < -180.0 || v13 > 180.0 || v12 < -90.0 || v12 > 90.0 || v14 < 0.0 || v14 > 180.0 || v15 < 0.0 || v15 > 360.0)
  {
    +[MKLinkPreviewSnapshot size];
    uint64_t v11 = +[MKMapCamera cameraLookingAtMapItem:forViewSize:allowPitch:](MKMapCamera, "cameraLookingAtMapItem:forViewSize:allowPitch:", v5, 1);
    [*(id *)(a1 + 32) setMapCamera:v11];
LABEL_15:
  }
  double v16 = [v5 name];
  [*(id *)(a1 + 32) setTitle:v16];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v18 = [WeakRetained _subtitleFromMapItem:v5 useMultilineAddressFormat:1];
  [*(id *)(a1 + 32) setSubtitle:v18];

  id v19 = objc_loadWeakRetained((id *)(a1 + 48));
  [v19 _populateLocationInfo:*(void *)(a1 + 32) withMapItem:v5];

  id v20 = objc_loadWeakRetained((id *)(a1 + 48));
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke_2;
  v21[3] = &unk_1E54B9E18;
  id v22 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 40);
  [v20 _requestCategoryIconFromMapItem:v5 completionHandler:v21];
}

void __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setIcon:a2];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke_3;
  v3[3] = &unk_1E54B8360;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  _performBlockOnMainThreadIfNeeded(v3);
}

uint64_t __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __50__MKLinkPreviewMetadataRequest__handleFrameAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_handleSearchAction
{
  objc_super v3 = self->_parser;
  id v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  id v5 = [(MKLinkPreviewMetadata *)[MKLinkPreviewSearchMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
  id v6 = [(_MKURLParser *)v3 searchQuery];
  [(_MKURLParser *)v3 searchRegion];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(_MKURLParser *)v3 searchCoordinate];
  BOOL v17 = v16 >= -180.0;
  if (v16 > 180.0) {
    BOOL v17 = 0;
  }
  if (v15 < -90.0) {
    BOOL v17 = 0;
  }
  if (v15 > 90.0) {
    BOOL v17 = 0;
  }
  if ((v10 < -180.0 || v10 > 180.0 || v8 < -90.0 || v8 > 90.0 || v12 < 0.0 || v12 > 180.0 || v14 < 0.0 || v14 > 360.0)
    && v17)
  {
    [(_MKURLParser *)v3 searchCoordinate];
    double v8 = v18;
    double v10 = v19;
    GEOConfigGetDouble();
    double v14 = v20;
    double v12 = v20;
  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke;
  v24[3] = &unk_1E54B9E68;
  id v21 = v4;
  id v27 = v21;
  id v22 = v5;
  double v25 = v22;
  id v23 = v6;
  id v26 = v23;
  objc_copyWeak(&v28, &location);
  -[MKLinkPreviewMetadataRequest _searchWithQuery:region:completionHandler:](self, "_searchWithQuery:region:completionHandler:", v23, v24, v8, v10, v12, v14);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
}

void __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a3;
  if (v14 || ![v13 count])
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_2;
    v24[3] = &unk_1E54B8360;
    id v26 = *(id *)(a1 + 48);
    id v25 = v14;
    _performBlockOnMainThreadIfNeeded(v24);

    double v15 = v26;
  }
  else
  {
    [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setSearchQuery:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setMapItems:v13];
    objc_msgSend(*(id *)(a1 + 32), "setCoordinateRegion:", a4, a5, a6, a7);
    if ([v13 count] == 1)
    {
      double v15 = [v13 firstObject];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      [WeakRetained _populateLocationInfo:*(void *)(a1 + 32) withMapItem:v15];

      id v17 = objc_loadWeakRetained((id *)(a1 + 56));
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_3;
      v21[3] = &unk_1E54B9E18;
      id v22 = *(id *)(a1 + 32);
      id v23 = *(id *)(a1 + 48);
      [v17 _requestCategoryIconFromMapItem:v15 completionHandler:v21];
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_5;
      v18[3] = &unk_1E54B8360;
      id v20 = *(id *)(a1 + 48);
      id v19 = *(id *)(a1 + 32);
      _performBlockOnMainThreadIfNeeded(v18);

      double v15 = v20;
    }
  }
}

uint64_t __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setIcon:a2];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_4;
  v3[3] = &unk_1E54B8360;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  _performBlockOnMainThreadIfNeeded(v3);
}

uint64_t __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __51__MKLinkPreviewMetadataRequest__handleSearchAction__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_handlePlaceAction
{
  objc_super v3 = self->_parser;
  id v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  id v25 = [(MKLinkPreviewMetadata *)[MKLinkPreviewPlaceMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
  id v23 = v3;
  id v5 = [(_MKURLParser *)v3 locationQueryItem];
  [v5 coordinate];
  BOOL v8 = v7 >= -180.0;
  if (v7 > 180.0) {
    BOOL v8 = 0;
  }
  if (v6 < -90.0) {
    BOOL v8 = 0;
  }
  BOOL v9 = v6 <= 90.0 && v8;
  double v10 = [v5 mapItemIdentifier];

  double v11 = [v5 address];
  uint64_t v12 = [v11 length];

  id v13 = [v5 name];
  if ([v13 length]) {
    BOOL v14 = v10 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  char v15 = v14;

  objc_initWeak(location, self);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke;
  v29[3] = &unk_1E54B9E90;
  id v24 = v4;
  id v32 = v24;
  double v16 = v25;
  CLLocationCoordinate2D v30 = v16;
  BOOL v34 = v9;
  BOOL v35 = v12 != 0;
  char v36 = v15;
  id v17 = v5;
  id v31 = v17;
  objc_copyWeak(&v33, location);
  double v18 = (void *)MEMORY[0x18C139AE0](v29);
  if (v10)
  {
    id v19 = v24;
    id v20 = [MKMapItemIdentifier alloc];
    id v21 = [v17 mapItemIdentifier];
    id v22 = [(MKMapItemIdentifier *)v20 initWithGEOMapItemIdentifier:v21];

    [(MKLinkPreviewMetadataRequest *)self _requestMapItemFromMapItemIdentifier:v22 completionHandler:v18];
LABEL_21:

    goto LABEL_22;
  }
  if (v12)
  {
    [v17 address];
    id v19 = v24;
    id v22 = (MKMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
    [(MKLinkPreviewMetadataRequest *)self _forwardGeocodeString:v22 completionHandler:v18];
    goto LABEL_21;
  }
  if (!v9)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_5;
    v26[3] = &unk_1E54B8360;
    id v19 = v24;
    id v28 = (MKMapItemIdentifier *)v24;
    id v27 = v16;
    _performBlockOnMainThreadIfNeeded(v26);

    id v22 = v28;
    goto LABEL_21;
  }
  [v17 coordinate];
  -[MKLinkPreviewMetadataRequest _reverseGeocodeCoordinate:completionHandler:](self, "_reverseGeocodeCoordinate:completionHandler:", v18);
  id v19 = v24;
LABEL_22:

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
}

void __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (!v5 || v6)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_2;
    v20[3] = &unk_1E54B8360;
    char v15 = &v22;
    id v22 = *(id *)(a1 + 48);
    double v16 = &v21;
    id v21 = v7;
    _performBlockOnMainThreadIfNeeded(v20);
  }
  else
  {
    v23[0] = v5;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [*(id *)(a1 + 32) setMapItems:v8];

    if (*(unsigned char *)(a1 + 64) || *(unsigned char *)(a1 + 65))
    {
      if (*(unsigned char *)(a1 + 66))
      {
        BOOL v9 = [*(id *)(a1 + 40) name];
        [v5 setName:v9];
      }
    }
    double v10 = [v5 name];
    [*(id *)(a1 + 32) setTitle:v10];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v12 = [WeakRetained _subtitleFromMapItem:v5 useMultilineAddressFormat:1];
    [*(id *)(a1 + 32) setSubtitle:v12];

    id v13 = objc_loadWeakRetained((id *)(a1 + 56));
    [v13 _populateLocationInfo:*(void *)(a1 + 32) withMapItem:v5];

    id v14 = objc_loadWeakRetained((id *)(a1 + 56));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_3;
    v17[3] = &unk_1E54B9E18;
    char v15 = &v18;
    id v18 = *(id *)(a1 + 32);
    double v16 = &v19;
    id v19 = *(id *)(a1 + 48);
    [v14 _requestCategoryIconFromMapItem:v5 completionHandler:v17];
  }
}

uint64_t __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setIcon:a2];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_4;
  v3[3] = &unk_1E54B8360;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  _performBlockOnMainThreadIfNeeded(v3);
}

uint64_t __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __50__MKLinkPreviewMetadataRequest__handlePlaceAction__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_handleLookAroundAction
{
  objc_super v3 = self->_parser;
  val = self;
  id v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  id v5 = [(MKLinkPreviewMetadata *)[MKLinkPreviewLookAroundMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
  id v6 = [(_MKURLParser *)v3 locationQueryItem];
  double v7 = [(_MKURLParser *)v3 muninViewState];
  [v6 coordinate];
  BOOL v10 = v9 >= -180.0;
  if (v9 > 180.0) {
    BOOL v10 = 0;
  }
  if (v8 < -90.0) {
    BOOL v10 = 0;
  }
  BOOL v11 = v8 <= 90.0 && v10;
  uint64_t v12 = [v6 mapItemIdentifier];

  id v13 = [v6 address];
  uint64_t v44 = [v13 length];

  id v14 = [v6 name];
  if ([v14 length]) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  char v16 = v15;
  char v47 = v16;

  if (v7)
  {
    BOOL v45 = v11;
    id v17 = [v7 locationInfo];
    id v18 = [[MKLookAroundScene alloc] initWithMuninViewState:v7];
    [(MKLinkPreviewMetadata *)v5 setScene:v18];
    id v19 = [v17 locationName];
    [(MKLinkPreviewLookAroundMetadata *)v5 setName:v19];

    id v20 = [v17 secondaryLocationName];
    id v43 = v4;
    if ([v20 length])
    {
      id v21 = [v17 localityName];
      uint64_t v22 = [v21 length];

      if (v22)
      {
        id v23 = NSString;
        id v24 = [v17 secondaryLocationName];
        id v25 = [v17 localityName];
        id v26 = [v23 stringWithFormat:@"%@\n%@", v24, v25];
        [(MKLinkPreviewLookAroundMetadata *)v5 setAddress:v26];

LABEL_23:
        BOOL v11 = v45;
        id v4 = v43;
        goto LABEL_24;
      }
    }
    else
    {
    }
    id v27 = [v17 secondaryLocationName];
    uint64_t v28 = [v27 length];

    if (v28) {
      [v17 secondaryLocationName];
    }
    else {
    id v24 = [v17 localityName];
    }
    [(MKLinkPreviewLookAroundMetadata *)v5 setAddress:v24];
    goto LABEL_23;
  }
LABEL_24:
  objc_initWeak(location, val);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke;
  v57[3] = &unk_1E54B9EE0;
  BOOL v63 = v7 != 0;
  id v29 = v4;
  id v61 = v29;
  CLLocationCoordinate2D v30 = v5;
  v58 = v30;
  id v46 = v7;
  id v59 = v46;
  BOOL v64 = v11;
  BOOL v65 = v44 != 0;
  char v66 = v47;
  id v31 = v6;
  id v60 = v31;
  objc_copyWeak(&v62, location);
  BOOL v32 = v11;
  id v33 = (void *)MEMORY[0x18C139AE0](v57);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_5;
  v52[3] = &unk_1E54B9F08;
  BOOL v56 = v7 != 0;
  id v34 = v29;
  id v54 = v34;
  BOOL v35 = v30;
  v53 = v35;
  id v36 = v33;
  id v55 = v36;
  v37 = (void *)MEMORY[0x18C139AE0](v52);
  if (v12)
  {
    id v38 = [MKMapItemIdentifier alloc];
    v39 = [v31 mapItemIdentifier];
    id v40 = [(MKMapItemIdentifier *)v38 initWithGEOMapItemIdentifier:v39];

    [(MKLinkPreviewMetadataRequest *)val _requestMapItemFromMapItemIdentifier:v40 completionHandler:v37];
LABEL_31:

    goto LABEL_32;
  }
  if (v44)
  {
    id v40 = [v31 address];
    [(MKLinkPreviewMetadataRequest *)val _forwardGeocodeString:v40 completionHandler:v37];
    goto LABEL_31;
  }
  if (!v32)
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_7;
    v49[3] = &unk_1E54B8360;
    v51 = (MKMapItemIdentifier *)v34;
    v50 = v35;
    _performBlockOnMainThreadIfNeeded(v49);

    id v40 = v51;
    goto LABEL_31;
  }
  [v31 coordinate];
  double v42 = v41;
  [v31 coordinate];
  [(MKLinkPreviewMetadataRequest *)val _reverseGeocodeCoordinate:v37 completionHandler:v42];
LABEL_32:

  objc_destroyWeak(&v62);
  objc_destroyWeak(location);
}

void __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (!v5 || v6)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_2;
    v21[3] = &unk_1E54B9EB8;
    char v25 = *(unsigned char *)(a1 + 72);
    id v24 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 32);
    id v23 = v7;
    _performBlockOnMainThreadIfNeeded(v21);

    double v8 = v24;
  }
  else
  {
    double v8 = [v5 _mapItem];
    v26[0] = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [*(id *)(a1 + 32) setMapItems:v9];

    if (*(unsigned char *)(a1 + 72))
    {
      BOOL v10 = [*(id *)(a1 + 40) cameraFrame];
      BOOL v11 = [[MKLookAroundScene alloc] initWithMapItem:v8 cameraFrameOverride:v10];
      [*(id *)(a1 + 32) setScene:v11];
    }
    else
    {
      [*(id *)(a1 + 32) setScene:v5];
    }
    if (*(unsigned char *)(a1 + 73) || *(unsigned char *)(a1 + 74))
    {
      if (*(unsigned char *)(a1 + 75))
      {
        uint64_t v12 = [*(id *)(a1 + 48) name];
        [v8 setName:v12];
      }
    }
    id v13 = [v8 name];
    [*(id *)(a1 + 32) setTitle:v13];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    BOOL v15 = [WeakRetained _subtitleFromMapItem:v8 useMultilineAddressFormat:1];
    [*(id *)(a1 + 32) setSubtitle:v15];

    id v16 = objc_loadWeakRetained((id *)(a1 + 64));
    [v16 _populateLocationInfo:*(void *)(a1 + 32) withMapItem:v8];

    id v17 = objc_loadWeakRetained((id *)(a1 + 64));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_3;
    v18[3] = &unk_1E54B9E18;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 56);
    [v17 _requestCategoryIconFromMapItem:v8 completionHandler:v18];
  }
}

uint64_t __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setIcon:a2];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_4;
  v3[3] = &unk_1E54B8360;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  _performBlockOnMainThreadIfNeeded(v3);
}

uint64_t __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (!v5 || v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_6;
    v9[3] = &unk_1E54B9EB8;
    char v13 = *(unsigned char *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    id v11 = v7;
    _performBlockOnMainThreadIfNeeded(v9);
  }
  else
  {
    double v8 = [[MKLookAroundSceneRequest alloc] initWithMapItem:v5];
    [(MKLookAroundSceneRequest *)v8 getSceneWithCompletionHandler:*(void *)(a1 + 48)];
  }
}

uint64_t __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __55__MKLinkPreviewMetadataRequest__handleLookAroundAction__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_handleGuidesAction
{
  objc_super v3 = self->_parser;
  id v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke;
  void v36[3] = &unk_1E54B9F30;
  id v5 = v4;
  id v37 = v5;
  id v6 = (void *)MEMORY[0x18C139AE0](v36);
  double v7 = [(_MKURLParser *)v3 collectionStorage];

  if (v7)
  {
    double v8 = [(MKLinkPreviewMetadata *)[MKLinkPreviewGuidesMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
    double v9 = [(_MKURLParser *)v3 collectionStorage];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_3;
    v31[3] = &unk_1E54B9F58;
    objc_copyWeak(&v35, &location);
    BOOL v32 = v3;
    id v10 = v8;
    id v33 = v10;
    id v34 = v6;
    [(MKLinkPreviewMetadataRequest *)self _refineCollectionStorage:v9 completionHandler:v31];

    objc_destroyWeak(&v35);
  }
  else
  {
    if ([(_MKURLParser *)v3 curatedCollectionMUID])
    {
      id v11 = [(MKLinkPreviewMetadata *)[MKLinkPreviewGuidesMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
      uint64_t v12 = [(_MKURLParser *)v3 curatedCollectionMUID];
      uint64_t v13 = [(_MKURLParser *)v3 searchProviderID];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_57;
      v27[3] = &unk_1E54B9F80;
      id v14 = &v30;
      objc_copyWeak(&v30, &location);
      id v10 = v11;
      uint64_t v28 = v10;
      id v29 = v6;
      [(MKLinkPreviewMetadataRequest *)self _refineCuratedCollectionStorageWithCollectionIdentifier:v12 providerIdentifier:v13 completionHandler:v27];

      BOOL v15 = v28;
    }
    else
    {
      if (![(_MKURLParser *)v3 publisherMUID])
      {
        id v19 = [[MKLinkPreviewMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_4;
        v20[3] = &unk_1E54B8360;
        id v22 = v5;
        id v10 = v19;
        id v21 = v10;
        _performBlockOnMainThreadIfNeeded(v20);

        goto LABEL_8;
      }
      id v16 = [(MKLinkPreviewMetadata *)[MKLinkPreviewPublisherMetadata alloc] initWithActionType:[(_MKURLParser *)v3 actionType] mapType:[(_MKURLParser *)v3 mapType]];
      uint64_t v17 = [(_MKURLParser *)v3 publisherMUID];
      uint64_t v18 = [(_MKURLParser *)v3 searchProviderID];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_2_79;
      v23[3] = &unk_1E54B9FA8;
      id v14 = &v26;
      objc_copyWeak(&v26, &location);
      id v10 = v16;
      id v24 = v10;
      id v25 = v5;
      [(MKLinkPreviewMetadataRequest *)self _requestPublisherFromPublisherIdentifier:v17 providerIdentifier:v18 completionHandler:v23];

      BOOL v15 = v24;
    }

    objc_destroyWeak(v14);
  }
LABEL_8:

  objc_destroyWeak(&location);
}

void __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * v12) _cnPostalAddress];
        if (v13) {
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [v5 setAddresses:v7];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_2;
  v16[3] = &unk_1E54B8360;
  id v14 = *(id *)(a1 + 32);
  id v17 = v5;
  id v18 = v14;
  id v15 = v5;
  _performBlockOnMainThreadIfNeeded(v16);
}

uint64_t __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v5 = [WeakRetained isCancelled];

  if ((v5 & 1) == 0)
  {
    if ([v3 count])
    {
      id v6 = [*(id *)(a1 + 32) collectionStorage];
      id v7 = [v6 name];

      [*(id *)(a1 + 40) setTitle:v7];
      id v8 = [*(id *)(a1 + 32) collectionStorage];
      uint64_t v9 = [v8 placesCount];

      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v9];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = v3;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = [*(id *)(*((void *)&v27 + 1) + 8 * v15) _addressFormattedAsCity];
            [v10 addObject:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v13);
      }

      id v17 = [v10 allObjects];
      id v18 = [v17 componentsJoinedByString:@", "];

      long long v19 = (void *)MEMORY[0x1E4F28EE0];
      if (v9 == 1)
      {
        long long v20 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1ED97E520 numberStyle:0];
        long long v21 = @"LinkPreviewUserGuide_Singular";
      }
      else
      {
        id v23 = [NSNumber numberWithUnsignedInt:v9];
        long long v20 = [v19 localizedStringFromNumber:v23 numberStyle:0];

        long long v21 = @"LinkPreviewUserGuide_Plural";
      }
      uint64_t v24 = _MKLocalizedStringFromThisBundle(v21);
      id v25 = objc_msgSend(NSString, "localizedStringWithFormat:", v24, v20, v18, (void)v27);
      [*(id *)(a1 + 40) setSubtitle:v25];

      id v26 = [*(id *)(a1 + 32) collectionStorage];
      [*(id *)(a1 + 40) setCollectionStorage:v26];

      [*(id *)(a1 + 40) setName:v7];
      [*(id *)(a1 + 40) setNumberOfItems:v9];
      [*(id *)(a1 + 40) setMapItems:v11];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v22 = objc_loadWeakRetained((id *)(a1 + 56));
      [v22 _failWithError:0];
    }
  }
}

void __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_57(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v10 = [WeakRetained isCancelled];

  if ((v10 & 1) == 0)
  {
    if (v8 || ![v7 count])
    {
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      [v11 _failWithError:v8];
    }
    else
    {
      id v11 = [v23 collectionTitle];
      [*(id *)(a1 + 32) setTitle:v11];
      uint64_t v12 = [v23 numberOfItems];
      uint64_t v13 = [v23 publisherAttribution];
      uint64_t v14 = [v13 displayName];

      uint64_t v15 = (void *)MEMORY[0x1E4F28EE0];
      if (v12 == 1)
      {
        id v16 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1ED97E520 numberStyle:0];
        id v17 = @"LinkPreviewCuratedGuide_Singular";
      }
      else
      {
        id v18 = [NSNumber numberWithUnsignedInt:v12];
        id v16 = [v15 localizedStringFromNumber:v18 numberStyle:0];

        id v17 = @"LinkPreviewCuratedGuide_Plural";
      }
      long long v19 = _MKLocalizedStringFromThisBundle(v17);
      long long v20 = objc_msgSend(NSString, "localizedStringWithFormat:", v19, v14, v16);
      [*(id *)(a1 + 32) setSubtitle:v20];

      [*(id *)(a1 + 32) setCuratedCollection:v23];
      [*(id *)(a1 + 32) setName:v11];
      [*(id *)(a1 + 32) setNumberOfItems:v12];
      [*(id *)(a1 + 32) setPublisherName:v14];
      long long v21 = [v23 publisherAttribution];
      id v22 = +[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", [v21 iconIdentifier], 1, 0, 3.0);
      [*(id *)(a1 + 32) setIcon:v22];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_2_79(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  char v8 = [WeakRetained isCancelled];

  if ((v8 & 1) == 0)
  {
    if (!v5 || v6)
    {
      id v15 = objc_loadWeakRetained(a1 + 6);
      [v15 _failWithError:v6];
    }
    else
    {
      uint64_t v9 = [v5 publisherAttribution];
      char v10 = [v9 displayName];

      [a1[4] setTitle:v10];
      uint64_t v11 = [v5 totalCollectionCount];
      uint64_t v12 = (void *)MEMORY[0x1E4F28EE0];
      if (v11 == 1)
      {
        uint64_t v13 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1ED97E520 numberStyle:0];
        uint64_t v14 = @"LinkPreviewPublisherGuides_Singular";
      }
      else
      {
        id v16 = [NSNumber numberWithUnsignedInt:v11];
        uint64_t v13 = [v12 localizedStringFromNumber:v16 numberStyle:0];

        uint64_t v14 = @"LinkPreviewPublisherGuides_Plural";
      }
      id v17 = _MKLocalizedStringFromThisBundle(v14);
      id v18 = objc_msgSend(NSString, "localizedStringWithFormat:", v17, v13);
      [a1[4] setSubtitle:v18];

      [a1[4] setName:v10];
      [a1[4] setNumberOfPublishedCollections:v11];
      long long v19 = [v5 publisherAttribution];
      long long v20 = +[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", [v19 iconIdentifier], 1, 0, 3.0);
      [a1[4] setIcon:v20];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_3_98;
      v21[3] = &unk_1E54B8360;
      id v23 = a1[5];
      id v22 = a1[4];
      _performBlockOnMainThreadIfNeeded(v21);
    }
  }
}

uint64_t __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_3_98(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __51__MKLinkPreviewMetadataRequest__handleGuidesAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_handleReportAProblemAction
{
  id v2 = (void *)MEMORY[0x18C139AE0](self->_completionHandler, a2);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = (void *)[v3 initWithDomain:MKErrorDomain code:1 userInfo:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MKLinkPreviewMetadataRequest__handleReportAProblemAction__block_invoke;
  v7[3] = &unk_1E54B8360;
  id v8 = v4;
  id v9 = v2;
  id v5 = v4;
  id v6 = v2;
  _performBlockOnMainThreadIfNeeded(v7);
}

uint64_t __59__MKLinkPreviewMetadataRequest__handleReportAProblemAction__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_failWithError:(id)a3
{
  id v4 = a3;
  [(MKLinkPreviewMetadataRequest *)self cancel];
  id v5 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v6 = (id)[v7 initWithDomain:MKErrorDomain code:1 userInfo:0];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__MKLinkPreviewMetadataRequest__failWithError___block_invoke;
  v10[3] = &unk_1E54B8360;
  id v11 = v6;
  id v12 = v5;
  id v8 = v6;
  id v9 = v5;
  _performBlockOnMainThreadIfNeeded(v10);
}

uint64_t __47__MKLinkPreviewMetadataRequest__failWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_populateLocationInfo:(id)a3 withMapItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 identifier];
  [v6 setIsPointOfInterest:v7 != 0];

  [v5 _coordinate];
  objc_msgSend(v6, "setCoordinate:");
  id v8 = [v5 name];
  [v6 setName:v8];

  id v9 = [v5 _shortAddress];
  [v6 setAddress:v9];

  char v10 = [v5 _cnPostalAddress];
  [v6 setAddressComponents:v10];

  id v11 = [v5 _firstLocalizedCategoryName];

  [v6 setCategory:v11];
}

- (id)_subtitleFromMapItem:(id)a3 useMultilineAddressFormat:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 name];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__MKLinkPreviewMetadataRequest__subtitleFromMapItem_useMultilineAddressFormat___block_invoke;
  v24[3] = &unk_1E54B9FD0;
  BOOL v26 = a4;
  id v7 = v5;
  id v25 = v7;
  id v8 = __79__MKLinkPreviewMetadataRequest__subtitleFromMapItem_useMultilineAddressFormat___block_invoke((uint64_t)v24);
  id v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  char v10 = [v8 componentsSeparatedByCharactersInSet:v9];

  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v17, "isEqualToString:", v6, (void)v20) & 1) == 0) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v14);
  }

  id v18 = [v11 componentsJoinedByString:@"\n"];

  return v18;
}

id __79__MKLinkPreviewMetadataRequest__subtitleFromMapItem_useMultilineAddressFormat___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    && ([*(id *)(a1 + 32) identifier],
        id v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    id v7 = [*(id *)(a1 + 32) _addressFormattedAsMultilineAddress];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) _cnPostalAddress];
    id v4 = NSString;
    id v5 = [v3 city];
    id v6 = [v3 state];
    id v7 = [v4 stringWithFormat:@"%@ %@", v5, v6];
  }

  return v7;
}

- (void)_forwardGeocodeString:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MKMapService sharedService];
  id v8 = [v7 ticketForForwardGeocodeString:v5 traits:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MKLinkPreviewMetadataRequest__forwardGeocodeString_completionHandler___block_invoke;
  v11[3] = &unk_1E54B9FF8;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 submitWithHandler:v11 networkActivity:0];
}

void __72__MKLinkPreviewMetadataRequest__forwardGeocodeString_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138478083;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: ticketForForwardGeocodeString with address string %{private}@ failed: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v5 firstObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
}

- (void)_refineCollectionStorage:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[MKCollectionStorageRefiner alloc] initWithCollectionStorage:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__MKLinkPreviewMetadataRequest__refineCollectionStorage_completionHandler___block_invoke;
  v10[3] = &unk_1E54BA020;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [(MKCollectionStorageRefiner *)v7 fetchMapItems:v10];
}

void __75__MKLinkPreviewMetadataRequest__refineCollectionStorage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) name];
      int v9 = 138478083;
      id v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: MKCollectionStorageRefiner with collection %{private}@ failed: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_refineCuratedCollectionStorageWithCollectionIdentifier:(unint64_t)a3 providerIdentifier:(int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = [[MKPlaceCuratedCollectionRefiner alloc] initWithCollectionIdentifier:a3 providerIdentifier:v5];
  int v9 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __125__MKLinkPreviewMetadataRequest__refineCuratedCollectionStorageWithCollectionIdentifier_providerIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E54BA048;
  int v14 = v5;
  id v12 = v7;
  unint64_t v13 = a3;
  id v10 = v7;
  [(MKPlaceCuratedCollectionRefiner *)v8 fetchWithCallbackQueue:v9 completion:v11];
}

void __125__MKLinkPreviewMetadataRequest__refineCuratedCollectionStorageWithCollectionIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = *(_DWORD *)(a1 + 48);
      int v13 = 134284035;
      uint64_t v14 = v11;
      __int16 v15 = 1025;
      int v16 = v12;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_ERROR, "Error: MKPlaceCuratedCollectionRefiner with collection identifier %{private}llu, provider identifier %{private}d failed: %{public}@", (uint8_t *)&v13, 0x1Cu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestCategoryIconFromMapItem:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 _styleAttributes];
  +[MKLinkPreviewMetadata displayScale];
  double v9 = v8;
  if (v7)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __82__MKLinkPreviewMetadataRequest__requestCategoryIconFromMapItem_completionHandler___block_invoke;
    v27[3] = &unk_1E54BA070;
    id v10 = &v28;
    id v11 = v7;
    int v12 = &v29;
    id v28 = v11;
    id v29 = v5;
    int v13 = &v30;
    id v30 = v6;
    id v14 = v6;
    id v15 = v5;
    int v16 = v27;
  }
  else
  {
    __int16 v17 = [MEMORY[0x1E4F645A0] addressMarkerStyleAttributes];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    long long v22 = __82__MKLinkPreviewMetadataRequest__requestCategoryIconFromMapItem_completionHandler___block_invoke_114;
    long long v23 = &unk_1E54BA070;
    id v10 = &v24;
    id v11 = v17;
    int v12 = &v25;
    id v24 = v11;
    id v25 = v5;
    int v13 = &v26;
    id v26 = v6;
    id v18 = v6;
    id v19 = v5;
    int v16 = &v20;
  }
  +[MKIconManager requestImageForStyleAttributes:size:scale:completionHandler:](MKIconManager, "requestImageForStyleAttributes:size:scale:completionHandler:", v11, 5, v16, v9, v20, v21, v22, v23);
}

void __82__MKLinkPreviewMetadataRequest__requestCategoryIconFromMapItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v4 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) name];
      int v7 = 138478083;
      uint64_t v8 = v5;
      __int16 v9 = 2113;
      id v10 = v6;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_ERROR, "Failed to retrieve POI icon with non-null attributes : %{private}@ and mapItem : %{private}@", (uint8_t *)&v7, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __82__MKLinkPreviewMetadataRequest__requestCategoryIconFromMapItem_completionHandler___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v4 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) name];
      int v7 = 138478083;
      uint64_t v8 = v5;
      __int16 v9 = 2113;
      id v10 = v6;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_ERROR, "Failed to retrieve fallback address icon with attributes : %{private}@ and mapItem : %{private}@", (uint8_t *)&v7, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_requestMapItemFromLocationQueryItem:(id)a3 completionHandler:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  [v19 coordinate];
  BOOL v9 = v8 >= -180.0;
  if (v8 > 180.0) {
    BOOL v9 = 0;
  }
  if (v7 < -90.0) {
    BOOL v9 = 0;
  }
  BOOL v10 = v7 <= 90.0 && v9;
  uint64_t v11 = [v19 mapItemIdentifier];

  int v12 = [v19 address];
  uint64_t v13 = [v12 length];

  if (v11)
  {
    id v14 = [MKMapItemIdentifier alloc];
    id v15 = [v19 mapItemIdentifier];
    int v16 = [(MKMapItemIdentifier *)v14 initWithGEOMapItemIdentifier:v15];

    [(MKLinkPreviewMetadataRequest *)self _requestMapItemFromMapItemIdentifier:v16 completionHandler:v6];
LABEL_12:

    goto LABEL_13;
  }
  if (v13)
  {
    int v16 = [v19 address];
    [(MKLinkPreviewMetadataRequest *)self _forwardGeocodeString:v16 completionHandler:v6];
    goto LABEL_12;
  }
  if (v10)
  {
    [v19 coordinate];
    -[MKLinkPreviewMetadataRequest _reverseGeocodeCoordinate:completionHandler:](self, "_reverseGeocodeCoordinate:completionHandler:", v6);
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v18 = (void *)[v17 initWithDomain:MKErrorDomain code:1 userInfo:0];
    v6[2](v6, 0, v18);
  }
LABEL_13:
}

- (void)_requestMapItemFromMapItemIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [[MKMapItemRequest alloc] initWithMapItemIdentifier:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__MKLinkPreviewMetadataRequest__requestMapItemFromMapItemIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E54BA098;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [(MKMapItemRequest *)v7 getMapItemWithCompletionHandler:v10];
}

void __87__MKLinkPreviewMetadataRequest__requestMapItemFromMapItemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) identifierString];
      int v9 = 138478083;
      BOOL v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: MKMapItemRequest with identifier %{private}@ failed: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_requestPublisherFromPublisherIdentifier:(unint64_t)a3 providerIdentifier:(int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = [[MKPlacePublisherRefiner alloc] initWithPublisherIdentifier:a3 providerIdentifier:v5];
  int v9 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110__MKLinkPreviewMetadataRequest__requestPublisherFromPublisherIdentifier_providerIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E54BA0C0;
  int v14 = v5;
  id v12 = v7;
  unint64_t v13 = a3;
  id v10 = v7;
  [(MKPlacePublisherRefiner *)v8 fetchWithCallbackQueue:v9 completion:v11];
}

void __110__MKLinkPreviewMetadataRequest__requestPublisherFromPublisherIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = *(_DWORD *)(a1 + 48);
      int v10 = 134284035;
      uint64_t v11 = v8;
      __int16 v12 = 1025;
      int v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: MKPlacePublisherRefiner with publisher identifier %{private}llu, provider identifier %{private}d failed: %{public}@", (uint8_t *)&v10, 0x1Cu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reverseGeocodeCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = a4;
  id v7 = +[MKMapService sharedService];
  uint64_t v8 = objc_msgSend(v7, "ticketForReverseGeocodeCoordinate:traits:", 0, latitude, longitude);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__MKLinkPreviewMetadataRequest__reverseGeocodeCoordinate_completionHandler___block_invoke;
  v10[3] = &unk_1E54BA0E8;
  double v12 = latitude;
  double v13 = longitude;
  id v11 = v6;
  id v9 = v6;
  [v8 submitWithHandler:v10 networkActivity:0];
}

void __76__MKLinkPreviewMetadataRequest__reverseGeocodeCoordinate_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [NSString stringWithFormat:@"%+.8f, %+.8f", a1[5], a1[6]];
      *(_DWORD *)buf = 138478083;
      double v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: ticketForReverseGeocodeCoordinate with coordinate %{private}@ failed: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v9 = a1[4];
  int v10 = [v5 firstObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
}

- (void)_searchWithQuery:(id)a3 region:(id *)a4 completionHandler:(id)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  id v14 = a3;
  uint64_t v15 = a4;
  if (v12 < -180.0 || v12 > 180.0 || v13 < -90.0 || v13 > 90.0 || v11 < 0.0 || v11 > 180.0 || v10 < 0.0 || v10 > 360.0)
  {
    uint64_t v16 = [[MKLocalSearchRequest alloc] initWithNaturalLanguageQuery:v14];
    char v17 = 0;
  }
  else
  {
    uint64_t v16 = -[MKLocalSearchRequest initWithNaturalLanguageQuery:region:]([MKLocalSearchRequest alloc], "initWithNaturalLanguageQuery:region:", v14, v13, v12, v11, v10);
    char v17 = 1;
  }
  id v18 = [[MKLocalSearch alloc] initWithRequest:v16];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__MKLinkPreviewMetadataRequest__searchWithQuery_region_completionHandler___block_invoke;
  v21[3] = &unk_1E54BA110;
  char v28 = v17;
  double v24 = v13;
  double v25 = v12;
  double v26 = v11;
  double v27 = v10;
  id v22 = v14;
  long long v23 = v15;
  id v19 = v15;
  id v20 = v14;
  [(MKLocalSearch *)v18 startWithCompletionHandler:v21];
}

void __74__MKLinkPreviewMetadataRequest__searchWithQuery_region_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 64);
      uint64_t v10 = *(void *)(a1 + 72);
      double v11 = MKGetMKLinkPreviewLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        double v13 = NSString;
        id v14 = [NSString stringWithFormat:@"%+.8f, %+.8f", v7, v8];
        uint64_t v15 = [v13 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v14, v9, v10];

        *(_DWORD *)buf = 138478339;
        uint64_t v20 = v12;
        __int16 v21 = 2113;
        id v22 = v15;
        __int16 v23 = 2114;
        id v24 = v6;
        _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "Error: MKLocalSearchRequest with query : \"%{private}@\", region : %{private}@ failed: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      double v11 = MKGetMKLinkPreviewLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        uint64_t v20 = v16;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "Error: MKLocalSearchRequest with query : \"%{private}@\" failed: %{public}@", buf, 0x16u);
      }
    }
  }
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = [v5 mapItems];
  [v5 boundingRegion];
  (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v6);
}

- (void)_singleLocationUpdateWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[MKLocationManager sharedLocationManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__MKLinkPreviewMetadataRequest__singleLocationUpdateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E54B97B0;
  id v8 = v3;
  id v5 = v3;
  id v6 = [v4 singleLocationUpdateWithHandler:v7];
  [v6 start];
}

void __75__MKLinkPreviewMetadataRequest__singleLocationUpdateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: singleLocationUpdate failed: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end