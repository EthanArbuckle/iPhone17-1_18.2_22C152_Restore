@interface MKOfflineRegionsOverlayManager
@end

@implementation MKOfflineRegionsOverlayManager

uint64_t __42___MKOfflineRegionsOverlayManager__update__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [MEMORY[0x1E4F647B8] activeStateForCohortId:*(void *)(*(void *)(a1 + 32) + 24)];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[2];
  if (v4 != 1)
  {
    int v5 = v2;
    if (v4) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v2 >= 2u;
    }
    if (!v6) {
      return [v3 _setOverlay:0 customFeatures:0];
    }
    if (v2 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = v5;
        _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
        v3 = *(void **)(a1 + 32);
      }
      return [v3 _setOverlay:0 customFeatures:0];
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42___MKOfflineRegionsOverlayManager__update__block_invoke_2;
  v8[3] = &unk_1E54B95E0;
  unsigned int v9 = v2;
  v8[4] = v3;
  return [v3 _fetchFullyLoadedSubscriptionsForState:v2 completionHandler:v8];
}

uint64_t __62___MKOfflineRegionsOverlayManager__setOverlay_customFeatures___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    [WeakRetained removeOverlay:*(void *)(*(void *)(a1 + 32) + 48)];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 48), *(id *)(a1 + 40));
  uint64_t v4 = [*(id *)(a1 + 48) copy];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 48))
  {
    id v8 = objc_loadWeakRetained((id *)(v7 + 8));
    objc_msgSend(v8, "_addInternalOverlay:level:provider:", *(void *)(*(void *)(a1 + 32) + 48), 1);

    uint64_t v7 = *(void *)(a1 + 32);
  }
  unsigned int v9 = *(void **)(v7 + 72);
  double v10 = *MEMORY[0x1E4F63F08];
  double v11 = *(double *)(MEMORY[0x1E4F63F08] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F63F08] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F63F08] + 24);

  return objc_msgSend(v9, "dataSource:featuresDidChangeForRect:", v10, v11, v12, v13);
}

void __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

void __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _update];
}

void __42___MKOfflineRegionsOverlayManager__update__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  BOOL v3 = *(_DWORD *)(a1 + 40) == [MEMORY[0x1E4F647B8] activeStateForCohortId:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v4 = v8;
  if (v3)
  {
    if ([v8 count])
    {
      uint64_t v5 = objc_msgSend(v8, "_geo_map:", &__block_literal_global_19);
      if ([v5 count]) {
        BOOL v6 = [[MKMultiPolygon alloc] initWithPolygons:v5];
      }
      else {
        BOOL v6 = 0;
      }
      uint64_t v7 = objc_msgSend(v8, "_geo_map:", &__block_literal_global_65);
      [*(id *)(a1 + 32) _setOverlay:v6 customFeatures:v7];
    }
    else
    {
      [*(id *)(a1 + 32) _setOverlay:0 customFeatures:0];
    }
    uint64_t v4 = v8;
  }
}

id __42___MKOfflineRegionsOverlayManager__update__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = [v2 region];
  [v3 northLat];
  CLLocationDegrees v5 = v4;
  BOOL v6 = [v2 region];
  [v6 westLng];
  v25[0] = CLLocationCoordinate2DMake(v5, v7);
  id v8 = [v2 region];
  [v8 northLat];
  CLLocationDegrees v10 = v9;
  double v11 = [v2 region];
  [v11 eastLng];
  v25[1] = CLLocationCoordinate2DMake(v10, v12);
  double v13 = [v2 region];
  [v13 southLat];
  CLLocationDegrees v15 = v14;
  v16 = [v2 region];
  [v16 eastLng];
  v25[2] = CLLocationCoordinate2DMake(v15, v17);
  v18 = [v2 region];
  [v18 southLat];
  CLLocationDegrees v20 = v19;
  v21 = [v2 region];

  [v21 westLng];
  v25[3] = CLLocationCoordinate2DMake(v20, v22);

  v23 = +[MKPolygon polygonWithCoordinates:v25 count:4];

  return v23;
}

_MKOfflineRegionCustomFeature *__42___MKOfflineRegionsOverlayManager__update__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [[_MKOfflineRegionCustomFeature alloc] initWithSubscription:v2];

  return v3;
}

void __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(a2, "_geo_filtered:", &__block_literal_global_72);
  double v4 = v3;
  if (v3 && [v3 count])
  {
    CLLocationDegrees v5 = dispatch_group_create();
    double v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    CLLocationDegrees v17 = v4;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(obj);
          }
          CLLocationDegrees v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
          dispatch_group_enter(v5);
          double v11 = *(void **)(*(void *)(a1 + 32) + 40);
          CLLocationDegrees v12 = [v10 identifier];
          uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_3;
          v23[3] = &unk_1E54B9628;
          id v24 = v19;
          v25 = v10;
          uint64_t v26 = v5;
          [v11 fetchStateForSubscriptionWithIdentifier:v12 callbackQueue:v13 completionHandler:v23];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v7);
    }

    double v14 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_4;
    block[3] = &unk_1E54B8360;
    id v15 = *(id *)(a1 + 40);
    id v21 = v19;
    id v22 = v15;
    id v16 = v19;
    dispatch_group_notify(v5, v14, block);

    double v4 = v17;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

unint64_t __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

void __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && (unint64_t)([v6 loadState] - 1) <= 1) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end