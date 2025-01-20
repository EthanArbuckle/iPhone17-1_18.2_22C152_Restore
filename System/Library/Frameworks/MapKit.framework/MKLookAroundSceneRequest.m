@interface MKLookAroundSceneRequest
- (BOOL)isCancelled;
- (BOOL)isLoading;
- (CLLocationCoordinate2D)coordinate;
- (MKLookAroundSceneRequest)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (MKLookAroundSceneRequest)initWithMapItem:(MKMapItem *)mapItem;
- (MKMapItem)mapItem;
- (void)_handleMapItems:(id)a3 requestType:(unint64_t)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_performLookupRequestWithMapItem:(id)a3 orCoordinate:(CLLocationCoordinate2D)a4 completionHandler:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)getSceneWithCompletionHandler:(void *)completionHandler;
@end

@implementation MKLookAroundSceneRequest

- (MKLookAroundSceneRequest)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  CLLocationDegrees longitude = coordinate.longitude;
  CLLocationDegrees latitude = coordinate.latitude;
  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundSceneRequest;
  result = [(MKLookAroundSceneRequest *)&v6 init];
  if (result)
  {
    result->_coordinate.CLLocationDegrees latitude = latitude;
    result->_coordinate.CLLocationDegrees longitude = longitude;
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (MKLookAroundSceneRequest)initWithMapItem:(MKMapItem *)mapItem
{
  v5 = mapItem;
  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundSceneRequest;
  objc_super v6 = [(MKLookAroundSceneRequest *)&v9 init];
  v7 = (MKLookAroundSceneRequest *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 40) = MKCoordinateInvalid;
    objc_storeStrong((id *)v6 + 4, mapItem);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(MKLookAroundSceneRequest *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MKLookAroundSceneRequest;
  [(MKLookAroundSceneRequest *)&v3 dealloc];
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

- (void)getSceneWithCompletionHandler:(void *)completionHandler
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v4 = completionHandler;
  v5 = (void *)MEMORY[0x1E4F14428];
  id v6 = MEMORY[0x1E4F14428];
  os_unfair_lock_lock_with_options();
  if (!self->_loading)
  {
    self->_loading = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    mapItem = self->_mapItem;
    if (!mapItem) {
      goto LABEL_11;
    }
    v13 = [(MKMapItem *)mapItem _identifier];
    if (v13)
    {
    }
    else
    {
      [(MKMapItem *)self->_mapItem _coordinate];
      if (!CLLocationCoordinate2DIsValid(v38))
      {
        v7 = MKGetMKLookAroundLog();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_5;
        }
        *(_WORD *)buf = 0;
        v8 = "MKMapItem with missing identifier or invalid coordinate provided to MKLookAroundSceneRequest's initWithMapI"
             "tem: initializer";
        goto LABEL_4;
      }
    }
    v14 = self->_mapItem;
    if (!v14)
    {
LABEL_11:
      if (!CLLocationCoordinate2DIsValid(self->_coordinate))
      {
        v7 = MKGetMKLookAroundLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v27 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude];
          *(_DWORD *)buf = 138412290;
          v36 = v27;
          _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Invalid CLLocationCoordinate2D provided to MKLookAroundSceneRequest's initWithCoordinate: initializer: %@", buf, 0xCu);
        }
        goto LABEL_5;
      }
      v14 = self->_mapItem;
    }
    if ([(MKMapItem *)v14 isCurrentLocation])
    {
      if (!self->_singleLocationUpdate)
      {
        v15 = +[MKLocationManager sharedLocationManager];
        int v16 = [v15 isLocationServicesAvailable];

        if (v16)
        {
          v17 = +[MKLocationManager sharedLocationManager];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_2;
          v29[3] = &unk_1E54BF4C8;
          v29[4] = self;
          id v31 = v4;
          id v18 = v5;
          id v30 = v5;
          v19 = [v17 singleLocationUpdateWithHandler:v29];
          singleLocationUpdate = self->_singleLocationUpdate;
          self->_singleLocationUpdate = v19;

          [(MKLocationManagerOperation *)self->_singleLocationUpdate start];
          goto LABEL_31;
        }
      }
    }
    v21 = self->_mapItem;
    if (v21)
    {
      BOOL v22 = [(MKMapItem *)v21 _hasLookAroundStorefront];
      v23 = self->_mapItem;
      if (v22)
      {
        v24 = v23;
        if (v24)
        {
LABEL_20:
          [(MKMapItem *)v24 _coordinate];
LABEL_30:
          -[MKLookAroundSceneRequest _performLookupRequestWithMapItem:orCoordinate:completionHandler:](self, "_performLookupRequestWithMapItem:orCoordinate:completionHandler:", v24, v4, latitude, longitude);

          goto LABEL_31;
        }
      }
      else
      {
        v28 = [(MKMapItem *)v23 _identifier];
        if (v28) {
          v24 = self->_mapItem;
        }
        else {
          v24 = 0;
        }

        if (v24) {
          goto LABEL_20;
        }
      }
    }
    v24 = 0;
    double latitude = self->_coordinate.latitude;
    double longitude = self->_coordinate.longitude;
    goto LABEL_30;
  }
  os_unfair_lock_unlock(&self->_stateLock);
  v7 = MKGetMKLookAroundLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v8 = "Cannot call -[MKLookAroundSceneRequest getSceneWithCompletionHandler:] on a scene request which is already loading";
LABEL_4:
    _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
  }
LABEL_5:

  id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
  v10 = (void *)[v9 initWithDomain:MKErrorDomain code:1 userInfo:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke;
  block[3] = &unk_1E54B8360;
  id v33 = v10;
  id v34 = v4;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_31:
}

uint64_t __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_super v3 = *(void **)(a1 + 32);
    [a2 coordinate];
    objc_msgSend(v3, "_performLookupRequestWithMapItem:orCoordinate:completionHandler:", 0, *(void *)(a1 + 48));
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_3;
    v7[3] = &unk_1E54B8630;
    v4 = *(NSObject **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v4, v7);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = 0;
}

void __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = (id)[v3 initWithDomain:MKErrorDomain code:1 userInfo:0];
  [v2 _handleMapItems:MEMORY[0x1E4F1CBF0] requestType:0 error:v4 completionHandler:*(void *)(a1 + 40)];
}

- (void)_performLookupRequestWithMapItem:(id)a3 orCoordinate:(CLLocationCoordinate2D)a4 completionHandler:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v9 = a3;
  id v10 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v15 = __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke;
  int v16 = &unk_1E54BF518;
  v17 = self;
  id v18 = v9;
  CLLocationDegrees v20 = latitude;
  CLLocationDegrees v21 = longitude;
  id v19 = v10;
  id v11 = (void *)MEMORY[0x1E4F29060];
  id v12 = v10;
  id v13 = v9;
  if ([v11 isMainThread]) {
    v15((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 29))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  }
  else
  {
    id v3 = +[MKMapService sharedService];
    id v4 = [v3 defaultTraits];

    uint64_t v5 = *(void **)(a1 + 40);
    if (v5
      && (([v5 _hasLookAroundStorefront] & 1) != 0
       || ([*(id *)(a1 + 40) _identifier],
           id v6 = objc_claimAutoreleasedReturnValue(),
           v6,
           v6)))
    {
      if ([*(id *)(a1 + 40) _hasLookAroundStorefront]) {
        v7 = *(void **)(a1 + 40);
      }
      else {
        v7 = 0;
      }
      id v10 = v7;
      id v8 = +[MKMapService sharedService];
      uint64_t v14 = [v8 ticketForMapItemToRefine:*(void *)(a1 + 40) traits:v4];
      uint64_t v15 = *(void *)(a1 + 32);
      id v13 = *(void **)(v15 + 16);
      *(void *)(v15 + 16) = v14;
      uint64_t v11 = 1;
    }
    else
    {
      id v8 = +[MKMapService sharedService];
      uint64_t v9 = objc_msgSend(v8, "ticketForReverseGeocodeCoordinate:traits:", v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
      id v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 16);
      *(void *)(v12 + 16) = v9;
    }

    uint64_t v16 = *(void *)(a1 + 32);
    v17 = (os_unfair_lock_s *)(v16 + 24);
    id v18 = *(id *)(v16 + 16);
    os_unfair_lock_unlock(v17);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke_2;
    v21[3] = &unk_1E54BF4F0;
    id v19 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v10;
    id v23 = v19;
    uint64_t v25 = v11;
    id v24 = *(id *)(a1 + 48);
    id v20 = v10;
    [v18 submitWithHandler:v21 queue:MEMORY[0x1E4F14428] networkActivity:0];
  }
}

void __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if (![v5 count] && *(void *)(a1 + 40))
  {
    v10[0] = *(void *)(a1 + 48);
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

    id v6 = 0;
    id v5 = (id)v9;
  }
  [*(id *)(a1 + 32) _handleMapItems:v5 requestType:*(void *)(a1 + 64) error:v6 completionHandler:*(void *)(a1 + 56)];
}

- (void)cancel
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_loading && !self->_cancelled)
  {
    self->_cancelled = 1;
    [(MKLocationManagerOperation *)self->_singleLocationUpdate cancel];
    singleLocationUpdate = self->_singleLocationUpdate;
    self->_singleLocationUpdate = 0;

    [(MKMapServiceTicket *)self->_ticket cancel];
    ticket = self->_ticket;
    self->_ticket = 0;
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)_handleMapItems:(id)a3 requestType:(unint64_t)a4 error:(id)a5 completionHandler:(id)a6
{
  id v17 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, MKLookAroundScene *, void))a6;
  os_unfair_lock_lock(&self->_stateLock);
  BOOL cancelled = self->_cancelled;
  os_unfair_lock_unlock(&self->_stateLock);
  if (v11 && !cancelled)
  {
    if (v10)
    {
      uint64_t v13 = objc_msgSend(v10, "_mapkit_error");
    }
    else
    {
      if ([v17 count])
      {
        uint64_t v14 = [v17 firstObject];
        if ([v14 _hasLookAroundStorefront])
        {
          uint64_t v15 = [[MKLookAroundScene alloc] initWithMapItem:v14];
          v11[2](v11, v15, 0);
        }
        else if (a4 == 1)
        {
          [v14 _coordinate];
          -[MKLookAroundSceneRequest _performLookupRequestWithMapItem:orCoordinate:completionHandler:](self, "_performLookupRequestWithMapItem:orCoordinate:completionHandler:", 0, v11);
        }
        else
        {
          v11[2](v11, 0, 0);
        }
        goto LABEL_6;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = [v16 initWithDomain:MKErrorDomain code:1 userInfo:0];
    }
    uint64_t v14 = (void *)v13;
    v11[2](v11, 0, v13);
LABEL_6:
  }
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_ticket, 0);

  objc_storeStrong((id *)&self->_singleLocationUpdate, 0);
}

@end