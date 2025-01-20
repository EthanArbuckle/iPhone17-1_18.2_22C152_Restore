@interface _GEOLegacyBatchReverseGeocodeTicket
- (BOOL)isEqualForHistoryToTicket:(id)a3;
- (_GEOLegacyBatchReverseGeocodeTicket)initWithBatchReverseGeocodeRequest:(id)a3 locationShifter:(id)a4 traits:(id)a5;
- (id)description;
- (void)_batchReverseGeocodeWithRequest:(id)a3 auditToken:(id)a4 handler:(id)a5 networkActivity:(id)a6;
- (void)cancel;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOLegacyBatchReverseGeocodeTicket

- (_GEOLegacyBatchReverseGeocodeTicket)initWithBatchReverseGeocodeRequest:(id)a3 locationShifter:(id)a4 traits:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOLegacyBatchReverseGeocodeTicket;
  v11 = [(GEOAbstractTicket *)&v17 initWithTraits:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_batchReverseGeocodeRequest, a3);
    uint64_t v13 = [v10 copy];
    id locationShifter = v12->_locationShifter;
    v12->_id locationShifter = (id)v13;

    v15 = v12;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_GEOLegacyBatchReverseGeocodeTicket;
  v4 = [(GEOAbstractTicket *)&v8 description];
  v5 = [(GEOBatchRevGeocodeRequest *)self->_batchReverseGeocodeRequest formattedText];
  v6 = [v3 stringWithFormat:@"%@ Request: %@ ", v4, v5];

  return v6;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOLegacyBatchReverseGeocodeTicket;
  [(GEOAbstractTicket *)&v4 cancel];
  v3 = +[GEOGeocodeRequester sharedGeocodeRequester];
  [v3 cancelBatchReverseGeocode:self->_batchReverseGeocodeRequest];
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v34 = a4;
  id v10 = a6;
  v11 = v10;
  v33 = v9;
  if (!v9) {
    goto LABEL_24;
  }
  if (!self->_locationShifter)
  {
LABEL_23:
    v30 = v11;
    [(_GEOLegacyBatchReverseGeocodeTicket *)self _batchReverseGeocodeWithRequest:self->_batchReverseGeocodeRequest auditToken:v34 handler:v33 networkActivity:v11];
    v11 = v30;
    goto LABEL_24;
  }
  v31 = v10;
  v36 = self;
  v32 = (void *)[(GEOBatchRevGeocodeRequest *)self->_batchReverseGeocodeRequest copy];
  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v13 = [v32 locations];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_super v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if ([v17 referenceFrame] != 2)
        {
          [v17 coordinate];
          if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
          {
            [v12 addObject:v17];
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v14);
  }

  if (![v12 count])
  {

    v11 = v31;
    goto LABEL_23;
  }
  v18 = dispatch_group_create();
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__31;
  v52[4] = __Block_byref_object_dispose__31;
  id v53 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v12;
  uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        dispatch_group_enter(v18);
        v23 = (*((void (**)(void))v36->_locationShifter + 2))();
        v24 = [v22 latLng];
        [v22 horizontalAccuracy];
        double v26 = v25;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
        v46[3] = &unk_1E53DDF28;
        v46[4] = v22;
        v47 = v18;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
        v43[3] = &unk_1E53DFE48;
        v45 = v52;
        v44 = v47;
        global_queue = (void *)geo_get_global_queue();
        [v23 shiftLatLng:v24 accuracy:v46 withCompletionHandler:0 mustGoToNetworkCallback:v43 errorHandler:global_queue callbackQueue:v26];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v19);
  }

  v28 = geo_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3;
  block[3] = &unk_1E53DFE70;
  v42 = v52;
  id v40 = v33;
  block[4] = v36;
  id v38 = v32;
  id v39 = v34;
  id v41 = v31;
  id v29 = v32;
  dispatch_group_notify(v18, v28, block);

  _Block_object_dispose(v52, 8);
  v11 = v31;
LABEL_24:
}

- (void)_batchReverseGeocodeWithRequest:(id)a3 auditToken:(id)a4 handler:(id)a5 networkActivity:(id)a6
{
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke;
  v20[3] = &unk_1E53DFE98;
  v20[4] = self;
  id v11 = v10;
  id v21 = v11;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = (void *)MEMORY[0x18C120660](v20);
  v16 = +[GEOGeocodeRequester sharedGeocodeRequester];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke_2;
  v18[3] = &unk_1E53DB698;
  id v19 = v11;
  id v17 = v11;
  [v16 batchReverseGeocode:v14 auditToken:v13 success:v15 networkActivity:v12 error:v18];
}

- (BOOL)isEqualForHistoryToTicket:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationShifter, 0);

  objc_storeStrong((id *)&self->_batchReverseGeocodeRequest, 0);
}

@end