@interface _MKOfflineRegionsOverlayManager
- (BOOL)isClusteringEnabled;
- (MKMapView)mapView;
- (_MKOfflineRegionsOverlayManager)initWithMapView:(id)a3;
- (id)annotationsInMapRect:(id)a3;
- (id)clusterStyleAttributes;
- (id)createDrawableForOverlay:(id)a3;
- (id)globalAnnotations;
- (int64_t)visibility;
- (unsigned)featureType;
- (unsigned)sceneID;
- (unsigned)sceneState;
- (void)_fetchFullyLoadedSubscriptionsForState:(id)a3 completionHandler:(id)a4;
- (void)_setOverlay:(id)a3 customFeatures:(id)a4;
- (void)_update;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)getClusterAnnotationTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5;
- (void)getClusterImageTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5;
- (void)removeObserver:(id)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation _MKOfflineRegionsOverlayManager

- (id)clusterStyleAttributes
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 5, 3, 6, 452, 0);

  return v2;
}

- (unsigned)sceneState
{
  return 1;
}

- (unsigned)sceneID
{
  return 0;
}

- (BOOL)isClusteringEnabled
{
  return 1;
}

- (unsigned)featureType
{
  return 1;
}

- (void)addObserver:(id)a3
{
}

- (id)annotationsInMapRect:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_currentCustomFeatures;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "coordinate", (void)v12);
        GEOMapPointForCoordinate();
        if (GEOMapRectContainsPoint()) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (_MKOfflineRegionsOverlayManager)initWithMapView:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_MKOfflineRegionsOverlayManager;
  v5 = [(_MKOfflineRegionsOverlayManager *)&v28 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapView, v4);
    uint64_t v7 = [MEMORY[0x1E4F643F0] currentProcessAuditToken];
    uint64_t v8 = [v7 offlineCohortId];
    offlineCohortId = v6->_offlineCohortId;
    v6->_offlineCohortId = (NSString *)v8;

    uint64_t v10 = geo_dispatch_queue_create_with_workloop_qos();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F647B0]);
    uint64_t v13 = [v12 initWithProtocol:&unk_1EDA43318 queue:MEMORY[0x1E4F14428]];
    customFeatureDataSourceObservers = v6->_customFeatureDataSourceObservers;
    v6->_customFeatureDataSourceObservers = (GEOObserverHashTable *)v13;

    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v6 selector:sel__update name:*MEMORY[0x1E4F63F28] object:0];

    objc_initWeak(&location, v6);
    v16 = (const char *)*MEMORY[0x1E4F63ED8];
    uint64_t v17 = v6->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke;
    handler[3] = &unk_1E54B9578;
    objc_copyWeak(&v26, &location);
    notify_register_dispatch(v16, &v6->_fullyLoadedSubscriptionsChangedNotifyToken, v17, handler);
    v18 = (const char *)*MEMORY[0x1E4F63EE0];
    v19 = v6->_queue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke_2;
    v23[3] = &unk_1E54B9578;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch(v18, &v6->_subscriptionsChangedNotifyToken, v19, v23);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_mapView);
    [WeakRetained _addCustomFeatureDataSource:v6];

    [(_MKOfflineRegionsOverlayManager *)v6 _update];
    v21 = v6;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_update
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___MKOfflineRegionsOverlayManager__update__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setOverlay:(id)a3 customFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___MKOfflineRegionsOverlayManager__setOverlay_customFeatures___block_invoke;
  block[3] = &unk_1E54B8270;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)dealloc
{
  int fullyLoadedSubscriptionsChangedNotifyToken = self->_fullyLoadedSubscriptionsChangedNotifyToken;
  if (fullyLoadedSubscriptionsChangedNotifyToken != -1)
  {
    notify_cancel(fullyLoadedSubscriptionsChangedNotifyToken);
    self->_int fullyLoadedSubscriptionsChangedNotifyToken = -1;
  }
  int subscriptionsChangedNotifyToken = self->_subscriptionsChangedNotifyToken;
  if (subscriptionsChangedNotifyToken != -1)
  {
    notify_cancel(subscriptionsChangedNotifyToken);
    self->_int subscriptionsChangedNotifyToken = -1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  [WeakRetained _removeCustomFeatureDataSource:self];

  v6.receiver = self;
  v6.super_class = (Class)_MKOfflineRegionsOverlayManager;
  [(_MKOfflineRegionsOverlayManager *)&v6 dealloc];
}

- (void)_fetchFullyLoadedSubscriptionsForState:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  subscriptionsManager = self->_subscriptionsManager;
  if (!subscriptionsManager)
  {
    id v7 = (GEOMapDataSubscriptionManager *)objc_alloc_init(MEMORY[0x1E4F64688]);
    id v8 = self->_subscriptionsManager;
    self->_subscriptionsManager = v7;

    subscriptionsManager = self->_subscriptionsManager;
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke;
  v11[3] = &unk_1E54B9650;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  [(GEOMapDataSubscriptionManager *)subscriptionsManager fetchAllSubscriptionsWithCallbackQueue:queue completionHandler:v11];
}

- (void)setVisibility:(int64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    [(_MKOfflineRegionsOverlayManager *)self _update];
  }
}

- (id)createDrawableForOverlay:(id)a3
{
  id v3 = a3;
  id v4 = [[_MKMaskingPolygonOverlayRenderer alloc] initWithMultiPolygon:v3];

  [(_MKMaskingPolygonOverlayRenderer *)v4 setStyle:1];

  return v4;
}

- (void)removeObserver:(id)a3
{
}

- (void)getClusterAnnotationTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  if (a3)
  {
    int v7 = a3;
    id v8 = NSString;
    id v9 = _MKLocalizedStringFromThisBundleFromTable(@"OFFLINE_REGION_CLUSTER_TITLE", @"Offline");
    objc_msgSend(v8, "localizedStringWithFormat:", v9, (v7 - 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    *a5 = @"und";
  }
}

- (void)getClusterImageTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  id v8 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v10 setLocale:v8];

  [v10 setNumberStyle:1];
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  *a4 = [v10 stringFromNumber:v9];

  *a5 = @"und";
}

- (id)globalAnnotations
{
  return 0;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFeatureDataSourceObservers, 0);
  objc_storeStrong((id *)&self->_currentCustomFeatures, 0);
  objc_storeStrong((id *)&self->_currentOverlay, 0);
  objc_storeStrong((id *)&self->_subscriptionsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_offlineCohortId, 0);

  objc_destroyWeak((id *)&self->_mapView);
}

@end