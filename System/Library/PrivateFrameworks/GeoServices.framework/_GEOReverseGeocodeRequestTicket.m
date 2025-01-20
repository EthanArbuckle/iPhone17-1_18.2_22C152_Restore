@interface _GEOReverseGeocodeRequestTicket
- (NSString)searchQuery;
- (_GEOReverseGeocodeRequestTicket)initWithRequest:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOReverseGeocodeRequestTicket

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    if (self->_shiftLocationsIfNeeded)
    {
      v12 = [(GEOPDPlaceRequest *)self->super._request placeRequestParameters];
      -[GEOPDPlaceRequestParameters reverseGeocodingParameters](v12);
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      v14 = -[GEOPDReverseGeocodingParameters extendedLocations](v13);
      v15 = [v14 firstObject];

      v16 = [v15 latLng];
      [v16 coordinate];
      LODWORD(v12) = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

      if (v12)
      {
        v17 = objc_alloc_init(GEOLocationShifter);
        v18 = [v15 latLng];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
        v22[3] = &unk_1E53DE820;
        v22[4] = self;
        id v23 = v10;
        id v24 = v9;
        id v25 = v11;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
        v20[3] = &unk_1E53DB698;
        id v21 = v24;
        global_queue = (void *)geo_get_global_queue();
        [(GEOLocationShifter *)v17 shiftLatLng:v18 accuracy:v23 auditToken:v22 withCompletionHandler:0 mustGoToNetworkCallback:v20 errorHandler:global_queue callbackQueue:0.0];

        goto LABEL_7;
      }
    }
    [(_GEOPlaceRequestTicket *)self _processRequest:self->super._request auditToken:v10 timeout:v9 withHandler:0 refinedHandler:v11 networkActivity:0.0];
  }
LABEL_7:
}

- (_GEOReverseGeocodeRequestTicket)initWithRequest:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_GEOReverseGeocodeRequestTicket;
  v6 = [(_GEOPlaceRequestTicket *)&v10 initWithRequest:a3 traits:a5];
  v7 = v6;
  if (v6)
  {
    v6->_shiftLocationsIfNeeded = a4;
    v8 = v6;
  }

  return v7;
}

- (NSString)searchQuery
{
  v2 = [(GEOPDPlaceRequest *)self->super._request placeRequestParameters];
  -[GEOPDPlaceRequestParameters reverseGeocodingParameters](v2);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = -[GEOPDReverseGeocodingParameters extendedLocations](v3);
  v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [v5 latLng];
    [v6 coordinate];
    uint64_t v8 = v7;
    uint64_t v10 = v9;

    id v11 = [NSString stringWithFormat:@"(%lf, %lf)", v8, v10];
  }
  else
  {
    id v11 = 0;
  }

  return (NSString *)v11;
}

@end