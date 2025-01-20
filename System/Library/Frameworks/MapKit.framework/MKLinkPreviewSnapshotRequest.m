@interface MKLinkPreviewSnapshotRequest
- (BOOL)isCancelled;
- (BOOL)isLoading;
- (MKLinkPreviewMetadata)metadata;
- (MKLinkPreviewSnapshotRequest)initWithMetadata:(id)a3;
- (void)_annotatedSnapshotImageWithMetadata:(id)a3 isLightMode:(BOOL)a4 completionHandler:(id)a5;
- (void)_failWithError:(id)a3;
- (void)_handleDirectionsAction;
- (void)_handleGuidesAction;
- (void)_handleLookAroundAction;
- (void)_handleMapSnapshotAction;
- (void)_handleReportAProblemAction;
- (void)cancel;
- (void)dealloc;
- (void)getSnapshotWithCompletionHandler:(id)a3;
@end

@implementation MKLinkPreviewSnapshotRequest

- (MKLinkPreviewSnapshotRequest)initWithMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKLinkPreviewSnapshotRequest;
  v6 = [(MKLinkPreviewSnapshotRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metadata, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(MKLinkPreviewSnapshotRequest *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MKLinkPreviewSnapshotRequest;
  [(MKLinkPreviewSnapshotRequest *)&v3 dealloc];
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

- (void)getSnapshotWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_loading)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    id v5 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_ERROR, "Cannot call -[MKLinkPreviewMetadataRequest getMetadataWithCompletionHandler:] on a metadata request which is already loading", buf, 2u);
    }

    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    v7 = (void *)[v6 initWithDomain:MKErrorDomain code:1 userInfo:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__MKLinkPreviewSnapshotRequest_getSnapshotWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E54B8360;
    id v20 = v7;
    id v21 = v4;
    id v8 = v7;
    _performBlockOnMainThreadIfNeeded(v19);

    objc_super v9 = v21;
LABEL_5:
  }
  else
  {
    self->_loading = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    v10 = (void *)MEMORY[0x18C139AE0](v4);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v10;

    switch([(MKLinkPreviewMetadata *)self->_metadata actionType])
    {
      case 1:
        [(MKLinkPreviewSnapshotRequest *)self _handleDirectionsAction];
        break;
      case 2:
      case 3:
      case 4:
        [(MKLinkPreviewSnapshotRequest *)self _handleMapSnapshotAction];
        break;
      case 5:
        [(MKLinkPreviewSnapshotRequest *)self _handleLookAroundAction];
        break;
      case 6:
        [(MKLinkPreviewSnapshotRequest *)self _handleGuidesAction];
        break;
      case 7:
        [(MKLinkPreviewSnapshotRequest *)self _handleReportAProblemAction];
        break;
      default:
        v12 = MKGetMKLinkPreviewLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int64_t v13 = [(MKLinkPreviewMetadata *)self->_metadata actionType];
          *(_DWORD *)buf = 134217984;
          int64_t v23 = v13;
          _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "Unknown URL ActionType encountered : %lu", buf, 0xCu);
        }

        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        v15 = (void *)[v14 initWithDomain:MKErrorDomain code:1 userInfo:0];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __65__MKLinkPreviewSnapshotRequest_getSnapshotWithCompletionHandler___block_invoke_3;
        v16[3] = &unk_1E54B8360;
        id v17 = v15;
        id v18 = v4;
        id v8 = v15;
        _performBlockOnMainThreadIfNeeded(v16);

        objc_super v9 = v18;
        goto LABEL_5;
    }
  }
}

uint64_t __65__MKLinkPreviewSnapshotRequest_getSnapshotWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __65__MKLinkPreviewSnapshotRequest_getSnapshotWithCompletionHandler___block_invoke_3(uint64_t a1)
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

- (void)_annotatedSnapshotImageWithMetadata:(id)a3 isLightMode:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  objc_super v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 bundleIdentifier];
  uint64_t v11 = [v10 isEqualToString:@"com.apple.Maps"] ^ 1;

  [v7 coordinateRegion];
  if (v13 < -180.0 || v13 > 180.0 || v12 < -90.0 || v12 > 90.0 || v14 < 0.0 || v14 > 180.0 || v15 < 0.0 || v15 > 360.0)
  {
    v29 = [MKAnnotatedMapSnapshotter alloc];
    id v17 = [v7 mapItems];
    v30 = [v7 mapCamera];
    +[MKLinkPreviewSnapshot size];
    v28 = -[MKAnnotatedMapSnapshotter initWithMapItems:camera:mapSize:mapType:useSnapshotService:](v29, "initWithMapItems:camera:mapSize:mapType:useSnapshotService:", v17, v30, [v7 mapType], v11, v31, v32);
  }
  else
  {
    v16 = [MKAnnotatedMapSnapshotter alloc];
    id v17 = [v7 mapItems];
    [v7 coordinateRegion];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    +[MKLinkPreviewSnapshot size];
    v28 = -[MKAnnotatedMapSnapshotter initWithMapItems:region:mapSize:mapType:useSnapshotService:](v16, "initWithMapItems:region:mapSize:mapType:useSnapshotService:", v17, [v7 mapType], v11, v19, v21, v23, v25, v26, v27);
  }

  if (v6) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2;
  }
  v34 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:v33];
  [(MKAnnotatedMapSnapshotter *)v28 setTraitCollection:v34];
  v35 = dispatch_get_global_queue(25, 0);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __98__MKLinkPreviewSnapshotRequest__annotatedSnapshotImageWithMetadata_isLightMode_completionHandler___block_invoke;
  v37[3] = &unk_1E54BBF38;
  id v38 = v8;
  id v36 = v8;
  [(MKAnnotatedMapSnapshotter *)v28 startWithQueue:v35 completionHandler:v37];
}

void __98__MKLinkPreviewSnapshotRequest__annotatedSnapshotImageWithMetadata_isLightMode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: MKAnnotatedMapSnapshotter startWithQueue failed: %{public}@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__MKLinkPreviewSnapshotRequest__annotatedSnapshotImageWithMetadata_isLightMode_completionHandler___block_invoke_9;
  block[3] = &unk_1E54B8338;
  id v12 = v5;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __98__MKLinkPreviewSnapshotRequest__annotatedSnapshotImageWithMetadata_isLightMode_completionHandler___block_invoke_9(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) image];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) image];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v7, 0);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void (**)(uint64_t, void, uint64_t))(v3 + 16);
    uint64_t v6 = *(void *)(a1 + 48);
    v5(v6, 0, v4);
  }
}

- (void)_failWithError:(id)a3
{
  id v4 = a3;
  [(MKLinkPreviewSnapshotRequest *)self cancel];
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
  v10[2] = __47__MKLinkPreviewSnapshotRequest__failWithError___block_invoke;
  v10[3] = &unk_1E54B8360;
  id v11 = v6;
  id v12 = v5;
  id v8 = v6;
  id v9 = v5;
  _performBlockOnMainThreadIfNeeded(v10);
}

uint64_t __47__MKLinkPreviewSnapshotRequest__failWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_handleDirectionsAction
{
  v2 = (void *)MEMORY[0x18C139AE0](self->_completionHandler, a2);
  uint64_t v3 = objc_alloc_init(MKLinkPreviewSnapshot);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MKLinkPreviewSnapshotRequest__handleDirectionsAction__block_invoke;
  v6[3] = &unk_1E54B8360;
  id v7 = v3;
  id v8 = v2;
  id v4 = v3;
  id v5 = v2;
  _performBlockOnMainThreadIfNeeded(v6);
}

uint64_t __55__MKLinkPreviewSnapshotRequest__handleDirectionsAction__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_handleMapSnapshotAction
{
  uint64_t v3 = self->_metadata;
  id v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__18;
  v30[4] = __Block_byref_object_dispose__18;
  double v31 = objc_alloc_init(MKLinkPreviewSnapshot);
  id v5 = [(MKLinkPreviewMetadata *)v3 mapItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = dispatch_group_create();
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__18;
    v28[4] = __Block_byref_object_dispose__18;
    id v29 = 0;
    dispatch_group_enter(v7);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke;
    v24[3] = &unk_1E54BBF60;
    id v8 = v7;
    double v25 = v8;
    double v26 = v28;
    double v27 = v30;
    [(MKLinkPreviewSnapshotRequest *)self _annotatedSnapshotImageWithMetadata:v3 isLightMode:1 completionHandler:v24];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__18;
    v22[4] = __Block_byref_object_dispose__18;
    id v23 = 0;
    dispatch_group_enter(v8);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_2;
    v18[3] = &unk_1E54BBF60;
    id v9 = v8;
    double v19 = v9;
    double v20 = v22;
    double v21 = v30;
    [(MKLinkPreviewSnapshotRequest *)self _annotatedSnapshotImageWithMetadata:v3 isLightMode:0 completionHandler:v18];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_3;
    block[3] = &unk_1E54BBFB0;
    double v15 = v28;
    id v16 = v22;
    id v14 = v4;
    uint64_t v17 = v30;
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v28, 8);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_6;
    v10[3] = &unk_1E54BBF88;
    id v11 = v4;
    id v12 = v30;
    _performBlockOnMainThreadIfNeeded(v10);
    id v9 = v11;
  }

  _Block_object_dispose(v30, 8);
}

void __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[4];
  id v10 = a2;
  dispatch_group_leave(v6);
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setLightImage:v10];
}

void __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[4];
  id v10 = a2;
  dispatch_group_leave(v6);
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setDarkImage:v10];
}

void __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v3 = (void *)[v2 initWithDomain:MKErrorDomain code:1 userInfo:MEMORY[0x1E4F1CC08]];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_4;
    v11[3] = &unk_1E54B8360;
    id v4 = *(id *)(a1 + 32);
    id v12 = v3;
    id v13 = v4;
    id v5 = v3;
    _performBlockOnMainThreadIfNeeded(v11);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_5;
    v8[3] = &unk_1E54BBF88;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 56);
    id v9 = v6;
    uint64_t v10 = v7;
    _performBlockOnMainThreadIfNeeded(v8);
    id v5 = v9;
  }
}

uint64_t __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

uint64_t __56__MKLinkPreviewSnapshotRequest__handleMapSnapshotAction__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (void)_handleLookAroundAction
{
  id completionHandler = self->_completionHandler;
  uint64_t v3 = self->_metadata;
  id v4 = (void *)MEMORY[0x18C139AE0](completionHandler);
  id v5 = objc_alloc_init(MKLookAroundSnapshotOptions);
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v7 = [v6 bundleIdentifier];
  uint64_t v8 = [v7 isEqualToString:@"com.apple.Maps"] ^ 1;

  id v9 = [(MKLookAroundSnapshotOptions *)v5 _options];
  [v9 _setUseSnapshotService:v8];

  +[MKLinkPreviewSnapshot size];
  -[MKLookAroundSnapshotOptions setSize:](v5, "setSize:");
  uint64_t v10 = [(MKLinkPreviewMetadata *)v3 scene];
  id v11 = [[MKLookAroundSnapshotter alloc] initWithScene:v10 options:v5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__MKLinkPreviewSnapshotRequest__handleLookAroundAction__block_invoke;
  v13[3] = &unk_1E54BBFD8;
  id v14 = v4;
  id v12 = v4;
  [(MKLookAroundSnapshotter *)v11 getSnapshotWithCompletionHandler:v13];
}

void __55__MKLinkPreviewSnapshotRequest__handleLookAroundAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = MKGetMKLinkPreviewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "Error: MKAnnotatedMapSnapshotter startWithQueue failed: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v8 = [v5 image];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MKLinkPreviewSnapshotRequest__handleLookAroundAction__block_invoke_14;
  block[3] = &unk_1E54B8338;
  id v13 = v8;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__MKLinkPreviewSnapshotRequest__handleLookAroundAction__block_invoke_14(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = objc_alloc_init(MKLinkPreviewSnapshot);
    [(MKLinkPreviewSnapshot *)v3 setLightImage:*(void *)(a1 + 32)];
    [(MKLinkPreviewSnapshot *)v3 setDarkImage:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

- (void)_handleGuidesAction
{
  uint64_t v3 = self->_metadata;
  id v4 = (void *)MEMORY[0x18C139AE0](self->_completionHandler);
  id v5 = [(MKLinkPreviewMetadata *)v3 curatedCollection];

  if (v5)
  {
    id v6 = [(MKLinkPreviewMetadata *)v3 curatedCollection];
    uint64_t v7 = +[MKSystemController sharedInstance];
    [v7 screenScale];
    double v9 = v8;

    id v10 = [v6 photos];
    id v11 = [v10 firstObject];
    +[MKLinkPreviewSnapshot size];
    double v13 = v12;
    double v15 = v14;
    id v16 = [MEMORY[0x1E4F646D0] defaultPhotoOptionsWithAllowSmaller:1];
    id v17 = objc_msgSend(v11, "bestPhotoForFrameSize:displayScale:options:", v16, v13, v15, v9);

    if (v17)
    {
      uint64_t v18 = [v17 url];
      double v19 = [v18 absoluteString];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        double v21 = +[MKAppImageManager sharedImageManager];
        double v22 = [v17 url];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __51__MKLinkPreviewSnapshotRequest__handleGuidesAction__block_invoke;
        v24[3] = &unk_1E54BC028;
        void v24[4] = self;
        id v25 = v4;
        [v21 loadAppImageAtURL:v22 completionHandler:v24];
      }
    }
  }
  else
  {
    id v23 = [(MKLinkPreviewMetadata *)v3 collectionStorage];

    if (v23) {
      [(MKLinkPreviewSnapshotRequest *)self _handleMapSnapshotAction];
    }
  }
}

void __51__MKLinkPreviewSnapshotRequest__handleGuidesAction__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  if (!v7 || a5)
  {
    [*(id *)(a1 + 32) _failWithError:a5];
  }
  else
  {
    +[MKLinkPreviewSnapshot size];
    double v9 = v8;
    double v11 = v10;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__MKLinkPreviewSnapshotRequest__handleGuidesAction__block_invoke_2;
    v13[3] = &unk_1E54BC000;
    id v14 = v7;
    id v12 = *(id *)(a1 + 40);
    id v15 = 0;
    id v16 = v12;
    +[MKLinkPreviewImageHelper resizeImageIfNeeded:toFrameSize:displayScale:completion:](MKLinkPreviewImageHelper, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v14, v13, v9, v11, 1.0);
  }
}

void __51__MKLinkPreviewSnapshotRequest__handleGuidesAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!a2) {
    id v4 = *(void **)(a1 + 32);
  }
  id v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MKLinkPreviewSnapshotRequest__handleGuidesAction__block_invoke_3;
  block[3] = &unk_1E54B8338;
  id v9 = v5;
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  id v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__MKLinkPreviewSnapshotRequest__handleGuidesAction__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = objc_alloc_init(MKLinkPreviewSnapshot);
    [(MKLinkPreviewSnapshot *)v3 setLightImage:*(void *)(a1 + 32)];
    [(MKLinkPreviewSnapshot *)v3 setDarkImage:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

- (void)_handleReportAProblemAction
{
  id v2 = (void *)MEMORY[0x18C139AE0](self->_completionHandler, a2);
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = (void *)[v3 initWithDomain:MKErrorDomain code:1 userInfo:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MKLinkPreviewSnapshotRequest__handleReportAProblemAction__block_invoke;
  v7[3] = &unk_1E54B8360;
  id v8 = v4;
  id v9 = v2;
  id v5 = v4;
  id v6 = v2;
  _performBlockOnMainThreadIfNeeded(v7);
}

uint64_t __59__MKLinkPreviewSnapshotRequest__handleReportAProblemAction__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (MKLinkPreviewMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end