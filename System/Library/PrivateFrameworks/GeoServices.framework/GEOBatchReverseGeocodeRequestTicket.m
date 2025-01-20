@interface GEOBatchReverseGeocodeRequestTicket
@end

@implementation GEOBatchReverseGeocodeRequestTicket

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = -[GEOPDBatchReverseGeocodingParameters assetLocations](*(id **)(a1 + 32));
  v5 = [v4 objectAtIndexedSubscript:a2];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v6 = *(void **)(a1 + 48);
  v7 = [v5 latLng];
  [v5 horizontalAccuracy];
  double v9 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2;
  v18[3] = &unk_1E53DE9B0;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 72);
  v18[4] = v10;
  id v19 = v5;
  id v20 = *(id *)(a1 + 32);
  uint64_t v23 = a2;
  id v21 = *(id *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4;
  v15[3] = &unk_1E53DE9D8;
  uint64_t v12 = *(void *)(a1 + 72);
  v15[4] = *(void *)(a1 + 64);
  uint64_t v17 = v12;
  id v16 = *(id *)(a1 + 40);
  id v13 = v5;
  global_queue = (void *)geo_get_global_queue();
  [v6 shiftLatLng:v7 accuracy:v11 auditToken:v18 withCompletionHandler:0 mustGoToNetworkCallback:v15 errorHandler:global_queue callbackQueue:v9];
}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_3(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v4 = (id)[*(id *)(a1 + 32) copy];
    id v2 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    [v4 setLatLng:v2];

    [v4 setReferenceFrame:2];
    id v3 = -[GEOPDBatchReverseGeocodingParameters assetLocations](*(id **)(a1 + 40));
    [v3 replaceObjectAtIndex:*(void *)(a1 + 72) withObject:v4];
  }
}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = v4;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void *)(v1 + 40);
  id v2 = (id *)(v1 + 40);
  if (!v3) {
    objc_storeStrong(v2, *(id *)(a1 + 32));
  }
}

uint64_t __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_6(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _submitRequest:*(void *)(*(void *)(a1 + 32) + 296) auditToken:*(void *)(a1 + 40) timeout:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 56) networkActivity:0.0];
  }
}

uint64_t __102___GEOBatchReverseGeocodeRequestTicket__submitRequest_auditToken_timeout_withHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _handleResponse:a2 completion:*(void *)(a1 + 40)];
  }
}

_GEOPlaceDataItem *__67___GEOBatchReverseGeocodeRequestTicket__handleResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2 && (-[GEOPDBatchReverseGeocodeResult _readPlace]((uint64_t)v2), v3[4]))
  {
    id v4 = -[GEOPDBatchReverseGeocodeResult additionalPlaces](v3);
    v5 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_699);

    v6 = [_GEOPlaceDataItem alloc];
    v7 = -[GEOPDBatchReverseGeocodeResult place](v3);
    double v8 = [(_GEOPlaceDataItem *)v6 initWithPlaceData:v7 attributionMap:0 disambiguationLabel:0 detourInfo:0 externalTransitStationCode:0 additionalPlaces:v5];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

GEOMapItemAdditionalPlaceInfo *__67___GEOBatchReverseGeocodeRequestTicket__handleResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[_GEOPlaceDataItem alloc] initWithPlaceData:v2];

  id v4 = [[GEOMapItemAdditionalPlaceInfo alloc] initWithMapItem:v3];

  return v4;
}

@end