@interface GEOLegacyBatchReverseGeocodeTicket
@end

@implementation GEOLegacyBatchReverseGeocodeTicket

void __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, double a2, double a3)
{
  v6 = [*(id *)(a1 + 32) latLng];
  [v6 setLat:a2];

  v7 = [*(id *)(a1 + 32) latLng];
  [v7 setLng:a3];

  v8 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v8);
}

void __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C1203C0]();
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    [*(id *)(a1 + 32) _batchReverseGeocodeWithRequest:*(void *)(a1 + 40) auditToken:*(void *)(a1 + 48) handler:*(void *)(a1 + 56) networkActivity:*(void *)(a1 + 64)];
  }
}

void __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "batchPlaceResultsCount"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [v2 batchPlaceResults];
  uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    double v7 = 0.0;
    double v8 = INFINITY;
    double v9 = 0.0;
    double v10 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if (!v12 || (*(unsigned char *)(v12 + 20) & 1) != 0 && *(_DWORD *)(v12 + 16) || !*(void *)(v12 + 8))
        {
          v13 = 0;
        }
        else
        {
          v13 = -[GEOBatchPlaceResult placeResult]((id *)v12);
        }
        v14 = [[_GEOPlaceItem alloc] initWithPlaceResult:v13];
        [v3 addObject:v14];
        v15 = [v13 place];
        int v16 = [v15 hasMapRegion];

        if (v16)
        {
          v17 = [v13 place];
          v18 = [v17 mapRegion];
          double v19 = GEOMapRectForMapRegion(v18);
          double v10 = GEOMapRectUnion(v10, v8, v9, v7, v19, v20);
          double v8 = v21;
          double v9 = v22;
          double v7 = v23;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = INFINITY;
    double v9 = 0.0;
    double v10 = INFINITY;
  }

  if (fabs(v10 + -INFINITY) >= 0.00000001
    || fabs(v8 + -INFINITY) >= 0.00000001
    || fabs(v9) >= 0.00000001
    || fabs(v7) >= 0.00000001)
  {
    v24 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v10, v8, v9, v7);
    uint64_t v25 = *(void *)(a1 + 32);
    v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  uint64_t v27 = [v3 count];
  uint64_t v28 = *(void *)(a1 + 40);
  if (v27)
  {
    (*(void (**)(uint64_t, void *, void))(v28 + 16))(v28, v3, 0);
  }
  else
  {
    v29 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
    (*(void (**)(uint64_t, void, void *))(v28 + 16))(v28, 0, v29);
  }
}

uint64_t __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end