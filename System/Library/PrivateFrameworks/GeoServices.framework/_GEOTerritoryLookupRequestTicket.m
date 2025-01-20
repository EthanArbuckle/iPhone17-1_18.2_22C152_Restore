@interface _GEOTerritoryLookupRequestTicket
- (_GEOTerritoryLookupRequestTicket)initWithLatLngs:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOTerritoryLookupRequestTicket

- (_GEOTerritoryLookupRequestTicket)initWithLatLngs:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [[GEOLatLngE7 alloc] initWithLatLng:*(void *)(*((void *)&v26 + 1) + 8 * v15)];
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  id v17 = [[GEOPDPlaceRequest alloc] initForTerritoryForLatLngsE7:v10 traits:v9];
  v25.receiver = self;
  v25.super_class = (Class)_GEOTerritoryLookupRequestTicket;
  v18 = [(_GEOPlaceRequestTicket *)&v25 initWithRequest:v17 traits:v9];
  if (v18)
  {
    uint64_t v19 = [v11 copy];
    originalLatLngs = v18->_originalLatLngs;
    v18->_originalLatLngs = (NSArray *)v19;

    uint64_t v21 = [v10 copy];
    originalLatLngsE7 = v18->_originalLatLngsE7;
    v18->_originalLatLngsE7 = (NSArray *)v21;

    v18->_shiftLocationsIfNeeded = a4;
    v23 = v18;
  }

  return v18;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v53[3] = &unk_1E53DE848;
    v53[4] = self;
    id v12 = v10;
    id v54 = v12;
    id v13 = v9;
    id v55 = v13;
    id v14 = v11;
    id v56 = v14;
    uint64_t v15 = MEMORY[0x18C120660](v53);
    v16 = (void (**)(void))v15;
    if (self->_shiftLocationsIfNeeded)
    {
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__19;
      v51 = __Block_byref_object_dispose__19;
      id v52 = 0;
      originalLatLngsE7 = self->_originalLatLngsE7;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_672;
      v46[3] = &unk_1E53DE870;
      v46[4] = self;
      v46[5] = &v47;
      [(NSArray *)originalLatLngsE7 enumerateObjectsUsingBlock:v46];
      if ([(id)v48[5] count])
      {
        long long v29 = (void *)geo_isolater_create();
        id v27 = v10;
        long long v28 = (void *)[(NSArray *)self->_originalLatLngsE7 mutableCopy];
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x3032000000;
        v44[3] = __Block_byref_object_copy__19;
        v44[4] = __Block_byref_object_dispose__19;
        id v45 = 0;
        dispatch_group_t v18 = dispatch_group_create();
        uint64_t v19 = objc_alloc_init(GEOLocationShifter);
        v20 = (void *)v48[5];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2_677;
        v35[3] = &unk_1E53DE938;
        v35[4] = self;
        uint64_t v21 = v18;
        v36 = v21;
        long long v26 = v19;
        v37 = v26;
        id v38 = v12;
        id v22 = v29;
        id v39 = v22;
        id v23 = v28;
        id v40 = v23;
        id v41 = v14;
        v42 = v44;
        v43 = &v47;
        [v20 enumerateKeysAndObjectsUsingBlock:v35];
        global_queue = geo_get_global_queue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_679;
        block[3] = &unk_1E53DE960;
        v34 = v44;
        id v31 = v23;
        id v32 = v13;
        block[4] = self;
        v33 = v16;
        id v25 = v23;
        dispatch_group_notify(v21, global_queue, block);

        _Block_object_dispose(v44, 8);
        id v10 = v27;
      }
      else
      {
        v16[2](v16);
      }
      _Block_object_dispose(&v47, 8);
    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLatLngsE7, 0);

  objc_storeStrong((id *)&self->_originalLatLngs, 0);
}

@end