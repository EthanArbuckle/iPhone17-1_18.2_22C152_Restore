@interface _GEOBatchReverseGeocodeRequestTicket
- (_GEOBatchReverseGeocodeRequestTicket)initWithRequest:(id)a3 locationShifter:(id)a4 traits:(id)a5;
- (void)_handleResponse:(id)a3 completion:(id)a4;
- (void)_processRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 refinedHandler:(id)a7 networkActivity:(id)a8;
- (void)_submitRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 networkActivity:(id)a7;
@end

@implementation _GEOBatchReverseGeocodeRequestTicket

- (_GEOBatchReverseGeocodeRequestTicket)initWithRequest:(id)a3 locationShifter:(id)a4 traits:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOBatchReverseGeocodeRequestTicket;
  v9 = [(_GEOPlaceRequestTicket *)&v14 initWithRequest:a3 traits:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id locationShifter = v9->_locationShifter;
    v9->_id locationShifter = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (void)_processRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 refinedHandler:(id)a7 networkActivity:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = v17;
  if (v15)
  {
    if (self->_locationShifter)
    {
      v40 = v17;
      id v39 = v13;
      v19 = [(GEOPDPlaceRequest *)self->super._request placeRequestParameters];
      -[GEOPDPlaceRequestParameters batchReverseGeocodingParameters](v19);
      v20 = (id *)objc_claimAutoreleasedReturnValue();

      v21 = [MEMORY[0x1E4F28E60] indexSet];
      unint64_t v22 = 0;
      if (!v20) {
        goto LABEL_10;
      }
LABEL_4:
      -[GEOPDBatchReverseGeocodingParameters _readAssetLocations]((uint64_t)v20);
      for (unint64_t i = [v20[6] count]; v22 < i; unint64_t i = 0)
      {
        v24 = -[GEOPDBatchReverseGeocodingParameters assetLocations](v20);
        v25 = [v24 objectAtIndexedSubscript:v22];

        if ([v25 referenceFrame] == 2)
        {

          v18 = v40;
          goto LABEL_18;
        }
        v26 = [v25 latLng];
        [v26 coordinate];
        BOOL v27 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

        if (v27) {
          [v21 addIndex:v22];
        }

        ++v22;
        if (v20) {
          goto LABEL_4;
        }
LABEL_10:
        ;
      }
      if (![v21 count])
      {

        id v13 = v39;
        v18 = v40;
        goto LABEL_15;
      }
      v28 = (*((void (**)(void))self->_locationShifter + 2))();
      v29 = v28;
      if (v28) {
        v30 = v28;
      }
      else {
        v30 = objc_alloc_init(GEOLocationShifter);
      }
      v31 = v30;

      v32 = (geo_isolater *)geo_isolater_create();
      shiftIsolation = self->_shiftIsolation;
      self->_shiftIsolation = v32;

      dispatch_group_t v34 = dispatch_group_create();
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x3032000000;
      v53[3] = __Block_byref_object_copy__19;
      v53[4] = __Block_byref_object_dispose__19;
      id v54 = 0;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke;
      v46[3] = &unk_1E53DEA00;
      v47 = v20;
      v35 = v34;
      v48 = v35;
      v36 = v31;
      v49 = v36;
      id v37 = v14;
      id v50 = v37;
      v51 = self;
      v52 = v53;
      [v21 enumerateIndexesUsingBlock:v46];
      global_queue = geo_get_global_queue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_6;
      block[3] = &unk_1E53DE960;
      v45 = v53;
      id v43 = v15;
      block[4] = self;
      id v42 = v37;
      v18 = v40;
      id v44 = v40;
      dispatch_group_notify(v35, global_queue, block);

      _Block_object_dispose(v53, 8);
LABEL_18:

      id v13 = v39;
    }
    else
    {
LABEL_15:
      [(_GEOBatchReverseGeocodeRequestTicket *)self _submitRequest:self->super._request auditToken:v14 timeout:v15 withHandler:v18 networkActivity:0.0];
    }
  }
}

- (void)_submitRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 networkActivity:(id)a7
{
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[GEOPlaceDataRequester sharedInstance];
  traits = self->super.super.super._traits;
  throttlerToken = self->super.super.super._throttlerToken;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102___GEOBatchReverseGeocodeRequestTicket__submitRequest_auditToken_timeout_withHandler_networkActivity___block_invoke;
  v18[3] = &unk_1E53DEA28;
  v18[4] = self;
  id v19 = v11;
  id v17 = v11;
  [v14 startWithRequest:v13 traits:traits timeout:v12 auditToken:throttlerToken throttleToken:v18 completionHandler:a5];
}

- (void)_handleResponse:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, void *, void))a4;
  v5 = [a3 resultsWithResultType:5];
  v6 = objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_696);
  if ([v6 count])
  {
    v8[2](v8, v6, 0);
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:0];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftIsolation, 0);

  objc_storeStrong(&self->_locationShifter, 0);
}

@end