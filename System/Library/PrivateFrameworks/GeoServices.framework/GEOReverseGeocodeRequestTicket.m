@interface GEOReverseGeocodeRequestTicket
@end

@implementation GEOReverseGeocodeRequestTicket

void __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, double a2, double a3)
{
  v6 = (void *)MEMORY[0x18C1203C0]();
  v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 296) copy];
  v8 = [v7 placeRequestParameters];
  -[GEOPDPlaceRequestParameters reverseGeocodingParameters](v8);
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOPDReverseGeocodingParameters extendedLocations](v9);
  v11 = [v10 firstObject];

  v12 = [v11 latLng];
  [v12 setLat:a2];

  v13 = [v11 latLng];
  [v13 setLng:a3];

  [*(id *)(a1 + 32) _processRequest:v7 auditToken:*(void *)(a1 + 40) timeout:*(void *)(a1 + 48) withHandler:0 refinedHandler:*(void *)(a1 + 56) networkActivity:0.0];
}

void __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x18C1203C0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end