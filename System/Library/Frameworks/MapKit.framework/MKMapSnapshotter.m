@interface MKMapSnapshotter
- (BOOL)_isWidget;
- (BOOL)_shouldRenderLogoForSnapshotDimensions;
- (BOOL)isLoading;
- (MKMapSnapshotter)init;
- (MKMapSnapshotter)initWithOptions:(MKMapSnapshotOptions *)options;
- (void)_cancel;
- (void)_cleanupSnapshotCreator;
- (void)_deliverSnapshot:(id)a3;
- (void)_drawAppleLogoIfNecessaryOnSnapshot:(id)a3;
- (void)_enterBackground:(id)a3;
- (void)_exitBackground:(id)a3;
- (void)_failWithError:(id)a3;
- (void)_performSnapshot;
- (void)_performSnapshotOnSnapshotQueue;
- (void)_respondWithError:(id)a3;
- (void)_setupCustomFeaturesForAnnotationViewsIfNeeded;
- (void)_succeedWithSnapshot:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)startWithCompletionHandler:(MKMapSnapshotCompletionHandler)completionHandler;
- (void)startWithQueue:(dispatch_queue_t)queue completionHandler:(MKMapSnapshotCompletionHandler)completionHandler;
@end

@implementation MKMapSnapshotter

- (BOOL)isLoading
{
  return self->_loadingFlag == 1;
}

- (MKMapSnapshotter)init
{
  return [(MKMapSnapshotter *)self initWithOptions:0];
}

- (MKMapSnapshotter)initWithOptions:(MKMapSnapshotOptions *)options
{
  v4 = options;
  v21.receiver = self;
  v21.super_class = (Class)MKMapSnapshotter;
  v5 = [(MKMapSnapshotter *)&v21 init];
  if (v5)
  {
    uint64_t v6 = geo_isolater_create();
    isolation = v5->_isolation;
    v5->_isolation = (geo_isolater *)v6;

    uint64_t v8 = [(MKMapSnapshotOptions *)v4 copy];
    v9 = v5->_options;
    v5->_options = (MKMapSnapshotOptions *)v8;

    if (!v5->_options)
    {
      v10 = objc_alloc_init(MKMapSnapshotOptions);
      v11 = v5->_options;
      v5->_options = v10;
    }
    v12 = MKGetSnapshotLog();
    uint64_t v13 = [(MKMapSnapshotOptions *)v5->_options signpostId];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v20 = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LifeTime", (const char *)&unk_18BD3917F, v20, 2u);
      }
    }

    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v15 = +[MKApplicationStateMonitor sharedInstance];
      [v15 startObserving];
    }
    else
    {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_105);
    }
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v5 selector:sel__enterBackground_ name:@"MKApplicationStateDidEnterBackgroundNotification" object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v5 selector:sel__exitBackground_ name:@"MKApplicationStateWillEnterForegroundNotification" object:0];

    v18 = v5;
  }

  return v5;
}

void __36__MKMapSnapshotter_initWithOptions___block_invoke()
{
  id v0 = +[MKApplicationStateMonitor sharedInstance];
  [v0 startObserving];
}

- (void)dealloc
{
  [(VKMapSnapshotCreator *)self->_snapshotCreator cancel];
  snapshotCreator = self->_snapshotCreator;
  self->_snapshotCreator = 0;

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v4 = +[MKApplicationStateMonitor sharedInstance];
    [v4 stopObserving];
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_16_0);
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  uint64_t v6 = MKGetSnapshotLog();
  unint64_t v7 = [(MKMapSnapshotOptions *)self->_options signpostId];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v6, OS_SIGNPOST_INTERVAL_END, v8, "LifeTime", (const char *)&unk_18BD3917F, buf, 2u);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)MKMapSnapshotter;
  [(MKMapSnapshotter *)&v9 dealloc];
}

void __27__MKMapSnapshotter_dealloc__block_invoke()
{
  id v0 = +[MKApplicationStateMonitor sharedInstance];
  [v0 stopObserving];
}

- (void)_enterBackground:(id)a3
{
  id v4 = a3;
  if (![(MKMapSnapshotOptions *)self->_options _rendersInBackground]
    && (_shouldUseSnapshotService(self->_options) & 1) == 0)
  {
    CFRetain(self);
    uint64_t v8 = 0;
    objc_super v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v5 = _snapshotQueue();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MKMapSnapshotter__enterBackground___block_invoke;
    v7[3] = &unk_1E54B8200;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v5, v7);

    int v6 = *((unsigned __int8 *)v9 + 24);
    self->_needsResume = v6;
    if (!v6) {
      CFRelease(self);
    }
    _Block_object_dispose(&v8, 8);
  }
}

void __37__MKMapSnapshotter__enterBackground___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 56) != 0;
  [*(id *)(*(void *)(a1 + 32) + 56) cancelFlushingTileDecodes:1];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;
}

- (void)_exitBackground:(id)a3
{
  if (self->_needsResume)
  {
    self->_needsResume = 0;
    [(MKMapSnapshotter *)self _performSnapshot];
    CFRelease(self);
  }
}

- (void)_cancel
{
  int v3 = 1;
  atomic_compare_exchange_strong_explicit(&self->_loadingFlag, (unsigned int *)&v3, 0, memory_order_relaxed, memory_order_relaxed);
  if (v3 == 1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    v5 = (void *)[v4 initWithDomain:MKErrorDomain code:1 userInfo:&unk_1ED97F148];
    [(MKMapSnapshotter *)self _respondWithError:v5];
  }
  if (_shouldUseSnapshotService(self->_options))
  {
    [(NSXPCConnection *)self->_snapshotService invalidate];
    snapshotService = self->_snapshotService;
    self->_snapshotService = 0;
  }
  else
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__28;
    v11[4] = __Block_byref_object_dispose__28;
    v12 = self->_snapshotCreator;
    [(VKMapSnapshotCreator *)v12 cancel];
    snapshotCreator = self->_snapshotCreator;
    self->_snapshotCreator = 0;

    dispatch_time_t v8 = dispatch_time(0, 10000000);
    objc_super v9 = _snapshotQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__MKMapSnapshotter__cancel__block_invoke;
    block[3] = &unk_1E54B8448;
    block[4] = v11;
    dispatch_after(v8, v9, block);

    _Block_object_dispose(v11, 8);
  }
}

void __27__MKMapSnapshotter__cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)_cleanupSnapshotCreator
{
  [(NSXPCConnection *)self->_snapshotService invalidate];
  snapshotService = self->_snapshotService;
  self->_snapshotService = 0;

  snapshotCreator = self->_snapshotCreator;
  self->_snapshotCreator = 0;
}

- (void)_respondWithError:(id)a3
{
  id v4 = a3;
  [(MKMapSnapshotter *)self _cleanupSnapshotCreator];
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MKMapSnapshotter__respondWithError___block_invoke;
  v7[3] = &unk_1E54B8248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(callbackQueue, v7);
}

void __38__MKMapSnapshotter__respondWithError___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(_DWORD **)(a1 + 32);
  if (v2[4])
  {
    [v2 cancel];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v20 = __Block_byref_object_copy__27;
    objc_super v21 = __Block_byref_object_dispose__28;
    id v22 = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __38__MKMapSnapshotter__respondWithError___block_invoke_29;
    v16 = &unk_1E54B8200;
    uint64_t v17 = v3;
    v18 = buf;
    geo_isolate_sync_data();
    uint64_t v4 = *(void *)(*(void *)&buf[8] + 40);
    if (v4) {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, *(void *)(a1 + 40));
    }
    v5 = MKGetSnapshotLog();
    os_signpost_id_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PerformSnapshot", (const char *)&unk_18BD3917F, v12, 2u);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    unint64_t v7 = MKGetSnapshotLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218243;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_INFO, "<%p> Snapshot failed to render (%{private}@), but snapshotter has already been canceled", buf, 0x16u);
    }

    uint64_t v10 = MKGetSnapshotLog();
    os_signpost_id_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PerformSnapshot", (const char *)&unk_18BD3917F, buf, 2u);
    }
  }
}

void __38__MKMapSnapshotter__respondWithError___block_invoke_29(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x18C139AE0](*(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  os_signpost_id_t v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

- (void)_failWithError:(id)a3
{
  [(MKMapSnapshotter *)self _respondWithError:a3];
  id v3 = +[MKUsageCounter sharedCounter];
  [v3 count:55];
}

- (void)_succeedWithSnapshot:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MKMapSnapshotter *)self _cleanupSnapshotCreator];
  uint64_t v5 = [(MKMapSnapshotOptions *)self->_options annotationViews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v8 = [(MKMapSnapshotOptions *)self->_options annotationViews];
    uint64_t v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [(MKMapSnapshotOptions *)self->_options annotationViews];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v15 _skipDrawingForSnapshots] & 1) == 0) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    v16 = _snapshotQueue();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__MKMapSnapshotter__succeedWithSnapshot___block_invoke;
    v17[3] = &unk_1E54B8248;
    v17[4] = self;
    id v18 = v4;
    [v18 _prepareForRenderWithAnnotationViews:v9 workQueue:v16 completionHandler:v17];
  }
  else
  {
    [(MKMapSnapshotter *)self _drawAppleLogoIfNecessaryOnSnapshot:v4];
  }
}

uint64_t __41__MKMapSnapshotter__succeedWithSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drawAppleLogoIfNecessaryOnSnapshot:*(void *)(a1 + 40)];
}

- (void)_drawAppleLogoIfNecessaryOnSnapshot:(id)a3
{
  id v4 = a3;
  if ([(MKMapSnapshotter *)self _shouldRenderLogoForSnapshotDimensions]
    && [(MKMapSnapshotOptions *)self->_options _showsAppleLogo]
    && _MKLinkedOnOrAfterReleaseSet(2310)
    && objc_msgSend(MEMORY[0x1E4F28B50], "_mapkit_shouldShowAppleLogo")
    && ![(MKMapSnapshotter *)self _isWidget])
  {
    MKMapType v5 = [(MKMapSnapshotOptions *)self->_options mapType];
    uint64_t v6 = _snapshotQueue();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__MKMapSnapshotter__drawAppleLogoIfNecessaryOnSnapshot___block_invoke;
    v7[3] = &unk_1E54B8248;
    v7[4] = self;
    id v8 = v4;
    [v8 _displayAppleLogoForMapType:v5 callbackQueue:v6 completionHandler:v7];
  }
  else
  {
    [(MKMapSnapshotter *)self _deliverSnapshot:v4];
  }
}

uint64_t __56__MKMapSnapshotter__drawAppleLogoIfNecessaryOnSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverSnapshot:*(void *)(a1 + 40)];
}

- (void)_deliverSnapshot:(id)a3
{
  id v4 = a3;
  if (qword_1EB316258 != -1) {
    dispatch_once(&qword_1EB316258, &__block_literal_global_169);
  }
  MKMapType v5 = (void *)qword_1EB316250;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __37__MKMapSnapshotter__deliverSnapshot___block_invoke;
  uint64_t v11 = &unk_1E54B8248;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  [v5 dispatch:&v8];
  unint64_t v7 = +[MKUsageCounter sharedCounter];
  [v7 count:54];
}

void __37__MKMapSnapshotter__deliverSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 16))
  {
    id v3 = *(NSObject **)(v2 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__MKMapSnapshotter__deliverSnapshot___block_invoke_33;
    v9[3] = &unk_1E54B8248;
    v9[4] = v2;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v3, v9);
  }
  else
  {
    id v4 = MKGetSnapshotLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v5;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "<%p> Snapshot succeeded, but snapshotter has already been canceled", buf, 0xCu);
    }

    id v6 = MKGetSnapshotLog();
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PerformSnapshot", (const char *)&unk_18BD3917F, buf, 2u);
      }
    }
  }
}

void __37__MKMapSnapshotter__deliverSnapshot___block_invoke_33(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 16), (unsigned int *)&v2, 0, memory_order_relaxed, memory_order_relaxed);
  if (v2 == 1)
  {
    [*(id *)(a1 + 32) cancel];
    *(void *)uint64_t v12 = 0;
    uint64_t v13 = v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__27;
    v16 = __Block_byref_object_dispose__28;
    id v17 = 0;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = *(void *)(a1 + 32);
    geo_isolate_sync_data();
    if (*((void *)v13 + 5))
    {
      id v3 = MKGetSnapshotLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "signpostId", v10, 3221225472, __37__MKMapSnapshotter__deliverSnapshot___block_invoke_34, &unk_1E54B8200, v11, v12);
        *(_DWORD *)buf = 134217984;
        uint64_t v19 = v4;
        _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "<%p> Successfully rendered map snapshot", buf, 0xCu);
      }

      (*(void (**)(void))(*((void *)v13 + 5) + 16))();
    }
    uint64_t v5 = MKGetSnapshotLog();
    os_signpost_id_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PerformSnapshot", (const char *)&unk_18BD3917F, buf, 2u);
    }

    _Block_object_dispose(v12, 8);
  }
  else
  {
    uint64_t v7 = MKGetSnapshotLog();
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PerformSnapshot", (const char *)&unk_18BD3917F, v12, 2u);
      }
    }
  }
}

void __37__MKMapSnapshotter__deliverSnapshot___block_invoke_34(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x18C139AE0](*(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  os_signpost_id_t v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

- (BOOL)_isWidget
{
  if (!ChronoServicesLibraryCore() || !getCHSIsWidgetExtensionPointSymbolLoc()) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x1E4F22448] extensionPointRecordForCurrentProcess];
  uint64_t v3 = v2;
  if (!v2)
  {
    char v6 = 0;
    goto LABEL_8;
  }
  id v4 = [v2 identifier];
  CHSIsWidgetExtensionPointSymbolLoc = (uint64_t (*)(id))getCHSIsWidgetExtensionPointSymbolLoc();
  if (CHSIsWidgetExtensionPointSymbolLoc)
  {
    char v6 = CHSIsWidgetExtensionPointSymbolLoc(v4);

LABEL_8:
    return v6;
  }
  dlerror();
  uint64_t v8 = (MKMapSnapshotter *)abort_report_np();
  return [(MKMapSnapshotter *)v8 _shouldRenderLogoForSnapshotDimensions];
}

- (BOOL)_shouldRenderLogoForSnapshotDimensions
{
  [(MKMapSnapshotOptions *)self->_options size];
  if (v3 < (double)GEOConfigGetInteger()) {
    return 0;
  }
  [(MKMapSnapshotOptions *)self->_options size];
  return v5 >= (double)GEOConfigGetInteger();
}

- (void)startWithCompletionHandler:(MKMapSnapshotCompletionHandler)completionHandler
{
}

- (void)startWithQueue:(dispatch_queue_t)queue completionHandler:(MKMapSnapshotCompletionHandler)completionHandler
{
  uint64_t v7 = queue;
  MKMapSnapshotCompletionHandler v8 = completionHandler;
  SEL v9 = v8;
  if (v7 && v8)
  {
    int v10 = 0;
    atomic_compare_exchange_strong_explicit(&self->_loadingFlag, (unsigned int *)&v10, 1u, memory_order_relaxed, memory_order_relaxed);
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Attempted to start a snapshotter that is still loading." userInfo:0];
      [v11 raise];
    }
    uint64_t v12 = MKGetSnapshotLog();
    unint64_t v13 = [(MKMapSnapshotOptions *)self->_options signpostId];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "StartWithQueue", (const char *)&unk_18BD3917F, buf, 2u);
      }
    }

    objc_storeStrong((id *)&self->_callbackQueue, queue);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    id v21 = v9;
    geo_isolate_sync_data();
    if (![(MKMapSnapshotOptions *)self->_options _rendersInBackground])
    {
      v15 = +[MKApplicationStateMonitor sharedInstance];
      if ([v15 isInBackground])
      {
        char shouldUseSnapshotService = _shouldUseSnapshotService(self->_options);

        if ((shouldUseSnapshotService & 1) == 0)
        {
          self->_needsResume = 1;
          CFRetain(self);
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    [(MKMapSnapshotter *)self _performSnapshot];
    id v17 = MKGetSnapshotLog();
    unint64_t v18 = [(MKMapSnapshotOptions *)self->_options signpostId];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18BAEC000, v17, OS_SIGNPOST_INTERVAL_END, v19, "StartWithQueue", (const char *)&unk_18BD3917F, buf, 2u);
      }
    }

    goto LABEL_17;
  }
LABEL_18:
}

void __53__MKMapSnapshotter_startWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (void)_setupCustomFeaturesForAnnotationViewsIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(MKMapSnapshotOptions *)self->_options annotationViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v11 prepareForSnapshotting];
        if ([v11 isProvidingCustomFeature])
        {
          objc_msgSend(v11, "_updateAnchorPosition:alignToPixels:", 1, v8, v9);
          uint64_t v12 = [v11 customFeatureAnnotation];
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    unint64_t v13 = [(MKMapSnapshotOptions *)self->_options _customFeatureAnnotations];
    uint64_t v14 = [v13 count];

    options = self->_options;
    if (v14)
    {
      v16 = [(MKMapSnapshotOptions *)options _customFeatureAnnotations];
      id v17 = [v3 arrayByAddingObjectsFromArray:v16];
      [(MKMapSnapshotOptions *)self->_options _setCustomFeatureAnnotations:v17];
    }
    else
    {
      [(MKMapSnapshotOptions *)options _setCustomFeatureAnnotations:v3];
    }
  }
}

- (void)_performSnapshot
{
  uint64_t v3 = MKGetSnapshotLog();
  unint64_t v4 = [(MKMapSnapshotOptions *)self->_options signpostId];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PerformSnapshot", (const char *)&unk_18BD3917F, buf, 2u);
    }
  }

  uint64_t v6 = [(MKMapSnapshotOptions *)self->_options annotationViews];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(MKMapSnapshotter *)self _setupCustomFeaturesForAnnotationViewsIfNeeded];
LABEL_7:
    [(MKMapSnapshotter *)self _performSnapshotOnSnapshotQueue];
    return;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MKMapSnapshotter__performSnapshot__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __36__MKMapSnapshotter__performSnapshot__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupCustomFeaturesForAnnotationViewsIfNeeded];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _performSnapshotOnSnapshotQueue];
}

- (void)_performSnapshotOnSnapshotQueue
{
  uint64_t v3 = _snapshotQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(v3, block);

  [MEMORY[0x1E4F63E30] reportDailyUsageCountType:105];
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke(uint64_t a1)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 8) _prepareToSubmit];
  uint64_t v2 = MKGetSnapshotLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (!v3) {
    goto LABEL_16;
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) _viewportMode];
  if (v4 == 2)
  {
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) camera];
    unint64_t v13 = [v12 debugDescription];
    uint64_t v14 = @"camera";
  }
  else if (v4 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) mapRect];
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    long long v19 = NSString;
    uint64_t v12 = [NSString stringWithFormat:@"{%.1f, %.1f}", v20, v21];
    long long v22 = [NSString stringWithFormat:@"{%.1f, %.1f}", v16, v18];
    unint64_t v13 = [v19 stringWithFormat:@"{%@, %@}", v12, v22];

    uint64_t v14 = @"mapRect";
  }
  else
  {
    if (v4)
    {
      unint64_t v13 = 0;
      uint64_t v14 = @"<unknown>";
      goto LABEL_10;
    }
    [*(id *)(*(void *)(a1 + 32) + 8) region];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    double v9 = NSString;
    uint64_t v12 = [NSString stringWithFormat:@"%+.8f, %+.8f", v10, v11];
    unint64_t v13 = [v9 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v12, v6, v8];
    uint64_t v14 = @"region";
  }

LABEL_10:
  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 8) traitCollection];
  unint64_t v24 = [v23 userInterfaceStyle];

  if (v24 > 2) {
    v25 = @", unknown";
  }
  else {
    v25 = off_1E54BF478[v24];
  }
  v26 = MKGetSnapshotLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
    [*(id *)(*(void *)(a1 + 32) + 8) size];
    uint64_t v29 = v28;
    [*(id *)(*(void *)(a1 + 32) + 8) size];
    *(_DWORD *)buf = 134219267;
    uint64_t v96 = v27;
    __int16 v97 = 2114;
    double v98 = *(double *)&v14;
    __int16 v99 = 2113;
    v100 = v13;
    __int16 v101 = 2114;
    v102 = v25;
    __int16 v103 = 2050;
    uint64_t v104 = v29;
    __int16 v105 = 2050;
    uint64_t v106 = v30;
    _os_log_impl(&dword_18BAEC000, v26, OS_LOG_TYPE_INFO, "<%p> Starting snapshot: <%{public}@: %{private}@%{public}@> (%{public}.1f x %{public}.1f)", buf, 0x3Eu);
  }

LABEL_16:
  v31 = [*(id *)(*(void *)(a1 + 32) + 8) camera];
  [v31 centerCoordinate];
  if (CLLocationCoordinate2DIsValid(v108))
  {
    v32 = [*(id *)(*(void *)(a1 + 32) + 8) _customFeatureAnnotations];
    uint64_t v33 = [v32 count];

    if (v33)
    {
      v34 = objc_alloc_init(_MKCustomFeatureStore);
      v35 = [*(id *)(*(void *)(a1 + 32) + 8) _customFeatureAnnotations];
      [(_MKCustomFeatureStore *)v34 addAnnotations:v35];
    }
    else
    {
      v34 = 0;
    }
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_72;
    v94[3] = &unk_1E54BF3F0;
    v94[4] = *(void *)(a1 + 32);
    v42 = (void *)MEMORY[0x18C139AE0](v94);
    v43 = [*(id *)(*(void *)(a1 + 32) + 8) traitCollection];
    [v43 displayScale];
    double v45 = v44;

    v46 = [MEMORY[0x1E4F42D90] mainScreen];
    [v46 scale];
    double v48 = v47;

    if (v45 <= v48)
    {
      if (v45 <= 1.0) {
        unsigned int v53 = 1;
      }
      else {
        unsigned int v53 = 2;
      }
      if (v45 <= 2.0) {
        uint64_t v54 = v53;
      }
      else {
        uint64_t v54 = 3;
      }
      v55 = [MEMORY[0x1E4F64918] modernManager];
      v52 = [v55 activeTileGroup];

      if (v52)
      {
        v56 = [MEMORY[0x1E4F42D90] mainScreen];
        [v56 scale];
        int v57 = GEOResourceFilterScaleForScale();

        if (v54 != v57)
        {
          if ([v52 activeScalesCount])
          {
            uint64_t v58 = 0;
            while ([v52 activeScaleAtIndex:v58] != v54)
            {
              if (++v58 >= (unint64_t)[v52 activeScalesCount]) {
                goto LABEL_39;
              }
            }
          }
          else
          {
LABEL_39:
            v59 = [MEMORY[0x1E4F42D90] mainScreen];
            [v59 scale];
            double v45 = v60;
          }
        }
      }
      id v61 = *(id *)(*(void *)(a1 + 32) + 8);
      v62 = [*(id *)(*(void *)(a1 + 32) + 8) traitCollection];
      [v62 displayScale];
      double v64 = vabdd_f64(v45, v63);

      if (v64 >= 0.000001)
      {
        v65 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copy];

        v66 = [*(id *)(*(void *)(a1 + 32) + 8) traitCollection];
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_84;
        v93[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
        *(double *)&v93[4] = v45;
        v67 = [v66 traitCollectionByModifyingTraits:v93];
        [v65 setTraitCollection:v67];

        id v61 = v65;
      }
      if (_shouldUseSnapshotService(*(void **)(*(void *)(a1 + 32) + 8)))
      {
        v68 = MKGetSnapshotLog();
        uint64_t v69 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
        if ((unint64_t)(v69 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v70 = v69;
          if (os_signpost_enabled(v68))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18BAEC000, v68, OS_SIGNPOST_INTERVAL_BEGIN, v70, "SnapshotServiceRequest", (const char *)&unk_18BD3917F, buf, 2u);
          }
        }

        uint64_t v71 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.MapKit.SnapshotService"];
        uint64_t v72 = *(void *)(a1 + 32);
        v73 = *(void **)(v72 + 48);
        *(void *)(v72 + 48) = v71;

        v74 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA43378];
        [*(id *)(*(void *)(a1 + 32) + 48) setRemoteObjectInterface:v74];

        [*(id *)(*(void *)(a1 + 32) + 48) resume];
        uint64_t v75 = *(void *)(a1 + 32);
        v76 = *(void **)(v75 + 48);
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_97;
        v92[3] = &unk_1E54B9CB0;
        v92[4] = v75;
        v77 = [v76 remoteObjectProxyWithErrorHandler:v92];
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_100;
        v90[3] = &unk_1E54BF440;
        v90[4] = *(void *)(a1 + 32);
        id v91 = v42;
        [v77 requestSnapshotWithOptions:v61 completionHandler:v90];
      }
      else
      {
        v78 = [MEMORY[0x1E4F64918] modernManager];
        [v78 activateResourceScale:v54];

        id v79 = objc_alloc(MEMORY[0x1E4FB3A38]);
        v80 = _snapshotQueue();
        v81 = [*(id *)(*(void *)(a1 + 32) + 8) _auditToken];
        uint64_t v82 = [v79 initWithSnapshotOptions:v61 homeQueue:v80 auditToken:v81];
        uint64_t v83 = *(void *)(a1 + 32);
        v84 = *(void **)(v83 + 56);
        *(void *)(v83 + 56) = v82;

        v85 = *(void **)(*(void *)(a1 + 32) + 56);
        if (v85)
        {
          if (v34)
          {
            [v85 addCustomFeatureDataSource:v34];
            v85 = *(void **)(*(void *)(a1 + 32) + 56);
          }
          [v85 renderSnapshot:v42];
        }
        else
        {
          v86 = MKGetSnapshotLog();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            uint64_t v87 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
            *(_DWORD *)buf = 134217984;
            uint64_t v96 = v87;
            _os_log_impl(&dword_18BAEC000, v86, OS_LOG_TYPE_ERROR, "<%p> Failed to create underlying snapshotter", buf, 0xCu);
          }

          id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
          v89 = (void *)[v88 initWithDomain:MKErrorDomain code:1 userInfo:&unk_1ED97F1C0];
          [*(id *)(a1 + 32) _failWithError:v89];
        }
      }
    }
    else
    {
      v49 = MKGetSnapshotLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
        *(_DWORD *)buf = 134218240;
        uint64_t v96 = v50;
        __int16 v97 = 2050;
        double v98 = v45;
        _os_log_impl(&dword_18BAEC000, v49, OS_LOG_TYPE_ERROR, "<%p> Invalid content scale: %{public}.1f", buf, 0x16u);
      }

      id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
      v52 = (void *)[v51 initWithDomain:MKErrorDomain code:1 userInfo:&unk_1ED97F198];
      [*(id *)(a1 + 32) _failWithError:v52];
    }
  }
  else
  {
    v36 = MKGetSnapshotLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
      [v31 centerCoordinate];
      v40 = [NSString stringWithFormat:@"%+.8f, %+.8f", v38, v39];
      *(_DWORD *)buf = 134218243;
      uint64_t v96 = v37;
      __int16 v97 = 2113;
      double v98 = *(double *)&v40;
      _os_log_impl(&dword_18BAEC000, v36, OS_LOG_TYPE_ERROR, "<%p> Center coordinate is not valid: %{private}@", buf, 0x16u);
    }
    id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
    v34 = (_MKCustomFeatureStore *)[v41 initWithDomain:MKErrorDomain code:1 userInfo:&unk_1ED97F170];
    [*(id *)(a1 + 32) _failWithError:v34];
  }
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(_DWORD *)(*(void *)(a1 + 32) + 16))
  {
    if (v5)
    {
      uint64_t v7 = [MKMapSnapshot alloc];
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) traitCollection];
      id v9 = [(MKMapSnapshot *)v7 _initWithSnapshot:v5 traitCollection:v8];

      if (v9)
      {
        [*(id *)(a1 + 32) _succeedWithSnapshot:v9];
      }
      else
      {
        unint64_t v13 = MKGetSnapshotLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
          int v17 = 134217984;
          uint64_t v18 = v14;
          _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_ERROR, "<%p> Failed to initialize final snapshot object", (uint8_t *)&v17, 0xCu);
        }

        id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = (void *)[v15 initWithDomain:MKErrorDomain code:1 userInfo:0];
        [*(id *)(a1 + 32) _failWithError:v16];

        id v9 = 0;
      }
    }
    else
    {
      uint64_t v10 = MKGetSnapshotLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
        int v17 = 134218242;
        uint64_t v18 = v11;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_ERROR, "<%p> Snapshot failed to render: %{public}@", (uint8_t *)&v17, 0x16u);
      }

      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v9 = (id)[v12 initWithDomain:MKErrorDomain code:2 userInfo:0];
      [*(id *)(a1 + 32) _failWithError:v9];
    }
  }
}

uint64_t __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_84(uint64_t a1, void *a2)
{
  return [a2 setDisplayScale:*(double *)(a1 + 32)];
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _snapshotQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2;
  v6[3] = &unk_1E54B8248;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MKGetSnapshotLog();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v2, OS_SIGNPOST_INTERVAL_END, v4, "SnapshotServiceRequest", (const char *)&unk_18BD3917F, (uint8_t *)&v12, 2u);
    }
  }

  if (*(_DWORD *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v17[0] = v5;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      id v6 = 0;
    }
    id v7 = MKGetSnapshotLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 134218242;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "<%p> Snapshot service encountered error: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = (void *)[v10 initWithDomain:MKErrorDomain code:1 userInfo:v6];
    [*(id *)(a1 + 32) _failWithError:v11];
  }
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_100(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _snapshotQueue();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2_101;
  v11[3] = &unk_1E54BF418;
  uint64_t v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2_101(uint64_t a1)
{
  uint64_t v2 = MKGetSnapshotLog();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) signpostId];
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)id v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v2, OS_SIGNPOST_INTERVAL_END, v4, "SnapshotServiceRequest", (const char *)&unk_18BD3917F, v6, 2u);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)cancel
{
  uint64_t v3 = _snapshotQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__MKMapSnapshotter_cancel__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_sync(v3, block);

  if (self->_needsResume)
  {
    self->_needsResume = 0;
    CFRelease(self);
  }
}

uint64_t __26__MKMapSnapshotter_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCreator, 0);
  objc_storeStrong((id *)&self->_snapshotService, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end