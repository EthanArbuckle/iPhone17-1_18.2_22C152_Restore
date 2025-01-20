@interface MUPlaceEnrichmentAPIController
+ (id)sharedPlaceEnrichmentAPIController;
- (GEOEnrichmentData)enrichmentData;
- (GEOMapServiceTraits)traits;
- (MKMapItem)mapItem;
- (MKMapServicePlaceEnrichmentTicket)ticket;
- (NSString)description;
- (id)initInternal;
- (id)placeEnrichmentData;
- (int64_t)state;
- (void)cancelFetchingPlaceEnrichment;
- (void)configureWithMapItem:(id)a3 traits:(id)a4;
- (void)fetchPlaceEnrichment:(id)a3;
- (void)registerObserver:(id)a3;
- (void)resetConfiguration;
- (void)setEnrichmentData:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTicket:(id)a3;
- (void)setTraits:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MUPlaceEnrichmentAPIController

+ (id)sharedPlaceEnrichmentAPIController
{
  if (qword_1EB4F7208 != -1) {
    dispatch_once(&qword_1EB4F7208, &__block_literal_global_39);
  }
  v2 = (void *)_MergedGlobals_129;
  return v2;
}

uint64_t __68__MUPlaceEnrichmentAPIController_sharedPlaceEnrichmentAPIController__block_invoke()
{
  id v0 = [[MUPlaceEnrichmentAPIController alloc] initInternal];
  uint64_t v1 = _MergedGlobals_129;
  _MergedGlobals_129 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)initInternal
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceEnrichmentAPIController;
  v2 = [(MUPlaceEnrichmentAPIController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F647B0]) initWithProtocol:&unk_1EE43D838 queue:0];
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v3;
  }
  return v2;
}

- (void)configureWithMapItem:(id)a3 traits:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (GEOMapServiceTraits *)a4;
  if (([(MKMapItem *)self->_mapItem isEqual:v7] & 1) == 0)
  {
    v9 = MUGetMUPlaceEnrichmentAPIControllerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [v7 _identifier];
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1931EA000, v9, OS_LOG_TYPE_DEBUG, "Configuring API Controller. Identifier: %@", (uint8_t *)&v12, 0xCu);
    }
    objc_storeStrong((id *)&self->_mapItem, a3);
  }
  traits = self->_traits;
  self->_traits = v8;

  self->_state = 1;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = [(MUPlaceEnrichmentAPIController *)self mapItem];
  uint64_t v5 = [v4 _muid];
  objc_super v6 = [(MUPlaceEnrichmentAPIController *)self enrichmentData];
  id v7 = [v6 enrichmentEntities];
  v8 = [v7 firstObject];
  v9 = [v3 stringWithFormat:@"API Controller has mapItem: %llu and enrichment data: %@", v5, v8];

  return (NSString *)v9;
}

- (void)resetConfiguration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MUGetMUPlaceEnrichmentAPIControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [(MKMapItem *)self->_mapItem _identifier];
    uint64_t v5 = (void *)v4;
    unint64_t v6 = self->_state - 1;
    if (v6 > 3) {
      id v7 = @"Unknown";
    }
    else {
      id v7 = off_1E5750848[v6];
    }
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_DEBUG, "Resetting current state. Identifier: %@. State: %@", (uint8_t *)&v9, 0x16u);
  }
  mapItem = self->_mapItem;
  self->_mapItem = 0;

  self->_state = 1;
  [(MUPlaceEnrichmentAPIController *)self setEnrichmentData:0];
}

- (void)registerObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MUGetMUPlaceEnrichmentAPIControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentAPIController adding observer: %@", (uint8_t *)&v6, 0xCu);
  }

  [(GEOObserverHashTable *)self->_observers registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MUGetMUPlaceEnrichmentAPIControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentAPIController removing observer: %@", (uint8_t *)&v6, 0xCu);
  }

  [(GEOObserverHashTable *)self->_observers unregisterObserver:v4];
}

- (void)fetchPlaceEnrichment:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  if (self->_state)
  {
    uint64_t v5 = [(MUPlaceEnrichmentAPIController *)self mapItem];
    int v6 = [v5 _enrichmentInfo];

    if (v6)
    {
      id v7 = [MEMORY[0x1E4F30F28] sharedService];
      uint64_t v8 = [(MUPlaceEnrichmentAPIController *)self mapItem];
      int v9 = [v8 _enrichmentInfo];
      uint64_t v10 = [(MUPlaceEnrichmentAPIController *)self mapItem];
      __int16 v11 = [v10 _identifier];
      int v12 = [(MUPlaceEnrichmentAPIController *)self traits];
      uint64_t v13 = [v7 ticketForPlaceEnrichmentWithEnrichmentInfo:v9 mapsIdentifier:v11 traits:v12];
      [(MUPlaceEnrichmentAPIController *)self setTicket:v13];

      objc_initWeak(&location, self);
      uint64_t v14 = MUGetMUPlaceEnrichmentAPIControllerLog();
      v15 = (char *)os_signpost_id_generate(v14);

      v16 = MUGetMUPlaceEnrichmentAPIControllerLog();
      v17 = v16;
      if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1931EA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "FetchingPlaceEnrichment", "", buf, 2u);
      }

      [(MUPlaceEnrichmentAPIController *)self setState:2];
      v18 = MUGetMUPlaceEnrichmentAPIControllerLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = [(MUPlaceEnrichmentAPIController *)self mapItem];
        v20 = [v19 _identifier];
        v21 = [(MUPlaceEnrichmentAPIController *)self mapItem];
        v22 = [v21 _enrichmentInfo];
        *(_DWORD *)buf = 138412546;
        v39 = v20;
        __int16 v40 = 2112;
        v41 = v22;
        _os_log_impl(&dword_1931EA000, v18, OS_LOG_TYPE_DEBUG, "Fetching enrichment data for identifier: %@ using enrichment info: %@", buf, 0x16u);
      }
      v23 = [(MUPlaceEnrichmentAPIController *)self ticket];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke;
      v34[3] = &unk_1E5750828;
      v36[1] = v15;
      objc_copyWeak(v36, &location);
      v35 = v4;
      [v23 submitWithHandler:v34 networkActivity:0];

      objc_destroyWeak(v36);
      objc_destroyWeak(&location);
    }
    else
    {
      v25 = MUGetMUPlaceEnrichmentAPIControllerLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = [(MUPlaceEnrichmentAPIController *)self mapItem];
        v27 = [v26 _identifier];
        *(_DWORD *)buf = 138412290;
        v39 = v27;
        _os_log_impl(&dword_1931EA000, v25, OS_LOG_TYPE_ERROR, "Enrichment Info missing for map item: %@", buf, 0xCu);
      }
      [(MUPlaceEnrichmentAPIController *)self setState:4];
      v28 = MUGetMUPlaceEnrichmentAPIControllerLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        observers = self->_observers;
        v30 = [(MUPlaceEnrichmentAPIController *)self mapItem];
        v31 = [v30 _identifier];
        *(_DWORD *)buf = 138412546;
        v39 = observers;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_impl(&dword_1931EA000, v28, OS_LOG_TYPE_DEBUG, "Notifying observers: %@ missing enrichment info for mapItem: %@", buf, 0x16u);
      }
      v32 = self->_observers;
      v33 = [(MUPlaceEnrichmentAPIController *)self mapItem];
      [(GEOObserverHashTable *)v32 placeEnrichmentAPIContollerDidFetchEnrichmentData:0 forMapItem:v33];

      if (v4) {
        v4[2](v4);
      }
    }
  }
  else
  {
    v24 = MUGetMUPlaceEnrichmentAPIControllerLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v24, OS_LOG_TYPE_ERROR, "Trying to fetch enrichment data without configuring", buf, 2u);
    }
  }
}

void __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = MUGetMUPlaceEnrichmentAPIControllerLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "FetchingPlaceEnrichment", "", buf, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke_55;
  v27 = &unk_1E574FB28;
  v28 = WeakRetained;
  id v29 = *(id *)(a1 + 32);
  __int16 v11 = (void (**)(void))_Block_copy(&v24);
  if (!v5 || v6)
  {
    v22 = MUGetMUPlaceEnrichmentAPIControllerLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      _os_log_impl(&dword_1931EA000, v22, OS_LOG_TYPE_ERROR, "API Response for Place Enrichment is invalid. Error: %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "setEnrichmentData:", 0, v24, v25, v26, v27, v28);
    [WeakRetained setState:4];
    v11[2](v11);
  }
  else
  {
    int v12 = objc_msgSend(WeakRetained, "mapItem", v24, v25, v26, v27, v28);
    uint64_t v13 = [v12 _enrichmentInfo];

    uint64_t v14 = [v5 enrichmentEntities];
    v15 = [v14 firstObject];
    v16 = [v15 enrichmentInfo];

    if ([v16 isEqual:v13])
    {
      [WeakRetained setState:3];
      v17 = MUGetMUPlaceEnrichmentAPIControllerLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v5;
        _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_DEBUG, "Received enrichment data: %@", buf, 0xCu);
      }

      [WeakRetained setEnrichmentData:v5];
      v18 = MUGetMUPlaceEnrichmentAPIControllerLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = WeakRetained[1];
        v20 = [WeakRetained[2] _identifier];
        *(_DWORD *)buf = 138412802;
        id v31 = v19;
        __int16 v32 = 2112;
        id v33 = v5;
        __int16 v34 = 2112;
        v35 = v20;
        _os_log_impl(&dword_1931EA000, v18, OS_LOG_TYPE_DEBUG, "Notifying observers: %@ with this enrichment data: %@ for mapItem: %@", buf, 0x20u);
      }
      [WeakRetained[1] placeEnrichmentAPIContollerDidFetchEnrichmentData:WeakRetained[5] forMapItem:WeakRetained[2]];
      uint64_t v21 = *(void *)(a1 + 32);
      if (v21) {
        (*(void (**)(uint64_t))(v21 + 16))(v21);
      }
    }
    else
    {
      v23 = MUGetMUPlaceEnrichmentAPIControllerLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = v13;
        __int16 v32 = 2112;
        id v33 = v16;
        _os_log_impl(&dword_1931EA000, v23, OS_LOG_TYPE_ERROR, "Enrichment Info mismatch. Requested : %@. Received: %@", buf, 0x16u);
      }

      [WeakRetained setEnrichmentData:0];
      [WeakRetained setState:4];
      v11[2](v11);
    }
  }
}

uint64_t __55__MUPlaceEnrichmentAPIController_fetchPlaceEnrichment___block_invoke_55(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = MUGetMUPlaceEnrichmentAPIControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    id v5 = [*(id *)(v3 + 16) _identifier];
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1931EA000, v2, OS_LOG_TYPE_DEBUG, "Notifying observers: %@ for mapItem: %@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) placeEnrichmentAPIContollerDidFetchEnrichmentData:0 forMapItem:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cancelFetchingPlaceEnrichment
{
  uint64_t v3 = MUGetMUPlaceEnrichmentAPIControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_DEBUG, "Cancelling ticket to fetch enrichnment data.", v5, 2u);
  }

  uint64_t v4 = [(MUPlaceEnrichmentAPIController *)self ticket];
  [v4 cancel];
}

- (id)placeEnrichmentData
{
  v2 = [(MUPlaceEnrichmentAPIController *)self enrichmentData];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (MKMapServicePlaceEnrichmentTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (GEOEnrichmentData)enrichmentData
{
  return self->_enrichmentData;
}

- (void)setEnrichmentData:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentData, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end