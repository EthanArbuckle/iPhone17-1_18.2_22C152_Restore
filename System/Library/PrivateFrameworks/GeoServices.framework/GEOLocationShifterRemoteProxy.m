@interface GEOLocationShifterRemoteProxy
@end

@implementation GEOLocationShifterRemoteProxy

void __56___GEOLocationShifterRemoteProxy_isLocationShiftEnabled__block_invoke(uint64_t a1)
{
}

void __38___GEOLocationShifterRemoteProxy_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[3];
    v4[3] = 0;

    WeakRetained = v4;
  }
}

void __75___GEOLocationShifterRemoteProxy_shiftLatLng_auditToken_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = [v9 function];
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    v8 = [v9 error];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
}

void __62___GEOLocationShifterRemoteProxy_locationShiftFunctionVersion__block_invoke(uint64_t a1)
{
}

void __67___GEOLocationShifterRemoteProxy_getAllShiftEntries_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = objc_msgSend(a2, "items", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = *(void *)(a1 + 40);
        v10 = [v8 addDate];
        [v8 coordinate];
        double v12 = v11;
        [v8 coordinate];
        double v14 = v13;
        [v8 radiusMeters];
        (*(void (**)(uint64_t, void *, double, double, double))(v9 + 16))(v9, v10, v12, v14, v15);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __110___GEOLocationShifterRemoteProxy_fetchCachedShiftFunctionResponseForLocation_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = [v9 function];
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    v8 = [v9 error];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
}

@end