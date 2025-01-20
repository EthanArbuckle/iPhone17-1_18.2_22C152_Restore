@interface MKMapItemRequest
- (BOOL)isCancelled;
- (BOOL)isLoading;
- (MKMapFeatureAnnotation)featureAnnotation;
- (MKMapFeatureAnnotation)mapFeatureAnnotation;
- (MKMapItemIdentifier)mapItemIdentifier;
- (MKMapItemRequest)initWithMapFeatureAnnotation:(MKMapFeatureAnnotation *)mapFeatureAnnotation;
- (MKMapItemRequest)initWithMapItemIdentifier:(id)a3;
- (void)_handleMapItems:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_performLookupRequestWithMapItemIdentifier:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)cancel;
- (void)getMapItemWithCompletionHandler:(void *)completionHandler;
- (void)getMapItemWithQueue:(id)a3 completionHandler:(id)a4;
@end

@implementation MKMapItemRequest

- (MKMapItemRequest)initWithMapFeatureAnnotation:(MKMapFeatureAnnotation *)mapFeatureAnnotation
{
  v5 = mapFeatureAnnotation;
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemRequest;
  v6 = [(MKMapItemRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_featureAnnotation, mapFeatureAnnotation);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (MKMapItemRequest)initWithMapItemIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemRequest;
  v6 = [(MKMapItemRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItemIdentifier, a3);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)getMapItemWithCompletionHandler:(void *)completionHandler
{
}

- (void)getMapItemWithQueue:(id)a3 completionHandler:(id)a4
{
  v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  if (self->_loading)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    v8 = MKGetMapItemRequestLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      v11 = (void *)[v10 initWithDomain:MKErrorDomain code:1 userInfo:0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __58__MKMapItemRequest_getMapItemWithQueue_completionHandler___block_invoke;
      v19[3] = &unk_1E54B8360;
      id v20 = v11;
      id v21 = v7;
      id v12 = v11;
      dispatch_async(v6, v19);

      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    objc_super v9 = "Cannot call -[MKMapItemRequest getMapItemWithCompletionHandler:] on a request which is already loading";
LABEL_4:
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, v9, buf, 2u);
    goto LABEL_5;
  }
  self->_loading = 1;
  os_unfair_lock_unlock(&self->_stateLock);
  featureAnnotation = self->_featureAnnotation;
  if (featureAnnotation)
  {
    v14 = [(MKMapFeatureAnnotation *)featureAnnotation marker];
    v15 = [v14 identifier];

    if (!v15)
    {
      v8 = MKGetMapItemRequestLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      objc_super v9 = "Invalid MKMapFeatureAnnotation provided to MKMapItemRequest initializer";
      goto LABEL_4;
    }
  }
  mapItemIdentifier = self->_mapItemIdentifier;
  if (mapItemIdentifier)
  {
    v17 = mapItemIdentifier;
  }
  else
  {
    v18 = [(MKMapFeatureAnnotation *)self->_featureAnnotation marker];
    v17 = [v18 identifier];
  }
  [(MKMapItemRequest *)self _performLookupRequestWithMapItemIdentifier:v17 queue:v6 completionHandler:v7];

LABEL_12:
}

uint64_t __58__MKMapItemRequest_getMapItemWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_performLookupRequestWithMapItemIdentifier:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  v16 = __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke;
  v17 = &unk_1E54BA468;
  v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  v11 = (void *)MEMORY[0x1E4F29060];
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  if (objc_msgSend(v11, "isMainThread", v15, 3221225472)) {
    v16((uint64_t)&v15);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v15);
  }
}

void __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 21))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    v3 = +[MKMapService sharedService];
    v4 = [v3 defaultTraits];

    id v5 = +[MKMapService sharedService];
    v15[0] = *(void *)(a1 + 40);
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    uint64_t v7 = [v5 ticketForIdentifiers:v6 traits:v4];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = v7;

    uint64_t v10 = *(void *)(a1 + 32);
    v11 = (os_unfair_lock_s *)(v10 + 16);
    id v12 = *(id *)(v10 + 8);
    os_unfair_lock_unlock(v11);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke_2;
    v13[3] = &unk_1E54B9FF8;
    v13[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    [v12 submitWithHandler:v13 queue:*(void *)(a1 + 48) networkActivity:0];
  }
}

void __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v8 = a2;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)(*(void *)(a1 + 32) + 20) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  [*(id *)(a1 + 32) _handleMapItems:v8 error:v5 completionHandler:*(void *)(a1 + 40)];
}

- (void)_handleMapItems:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  BOOL cancelled = self->_cancelled;
  os_unfair_lock_unlock(p_stateLock);
  if (v9 && !cancelled)
  {
    if (v8)
    {
      id v12 = objc_msgSend(v8, "_mapkit_error");
      v9[2](v9, 0, v12);
    }
    else if ([v14 count])
    {
      id v12 = [v14 firstObject];
      ((void (**)(id, void *, void *))v9)[2](v9, v12, 0);
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v12 = (void *)[v13 initWithDomain:MKErrorDomain code:1 userInfo:0];
      v9[2](v9, 0, v12);
    }
  }
}

- (MKMapFeatureAnnotation)featureAnnotation
{
  featureAnnotation = self->_featureAnnotation;
  if (!featureAnnotation)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This request was not created using an MKMapFeatureAnnotation. Use the mapFeatureAnnotation property to avoid this exception."];
    featureAnnotation = self->_featureAnnotation;
  }

  return featureAnnotation;
}

- (MKMapFeatureAnnotation)mapFeatureAnnotation
{
  return self->_featureAnnotation;
}

- (BOOL)isCancelled
{
  uint64_t v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isLoading
{
  uint64_t v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_loading;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)cancel
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_loading && !self->_cancelled)
  {
    self->_BOOL cancelled = 1;
    [(MKMapServiceTicket *)self->_ticket cancel];
    ticket = self->_ticket;
    self->_ticket = 0;
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (MKMapItemIdentifier)mapItemIdentifier
{
  return self->_mapItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);
  objc_storeStrong((id *)&self->_featureAnnotation, 0);

  objc_storeStrong((id *)&self->_ticket, 0);
}

@end