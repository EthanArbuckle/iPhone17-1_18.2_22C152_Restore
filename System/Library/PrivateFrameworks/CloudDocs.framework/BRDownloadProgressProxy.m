@interface BRDownloadProgressProxy
- (BRDownloadProgressProxy)initWithURL:(id)a3;
- (void)_queryDidReceiveUpdate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BRDownloadProgressProxy

- (BRDownloadProgressProxy)initWithURL:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRDownloadProgressProxy;
  v5 = [(BRDownloadProgressProxy *)&v21 init];
  if (v5)
  {
    v6 = (NSMetadataQuery *)objc_alloc_init(MEMORY[0x1E4F28E38]);
    query = v5->_query;
    v5->_query = v6;

    [(NSMetadataQuery *)v5->_query br_setupForMonitoringItemAtURL:v4];
    [(NSMetadataQuery *)v5->_query setNotificationBatchingInterval:0.1];
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v5->_queue;
    v5->_queue = v8;

    [(NSOperationQueue *)v5->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_queue setQualityOfService:17];
    [(NSMetadataQuery *)v5->_query setOperationQueue:v5->_queue];
    [(BRDownloadProgressProxy *)v5 setKind:*MEMORY[0x1E4F28898]];
    [(BRDownloadProgressProxy *)v5 setUserInfoObject:*MEMORY[0x1E4F28858] forKey:*MEMORY[0x1E4F28868]];
    [(BRDownloadProgressProxy *)v5 setUserInfoObject:v4 forKey:*MEMORY[0x1E4F28890]];
    id v20 = 0;
    char v10 = [v4 getPromisedItemResourceValue:&v20 forKey:*MEMORY[0x1E4F1C6C8] error:0];
    id v11 = v20;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = [v4 lastPathComponent];

      id v11 = (id)v12;
    }
    objc_initWeak(&location, v5);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__BRDownloadProgressProxy_initWithURL___block_invoke;
    v17[3] = &unk_1E59AE2E8;
    objc_copyWeak(&v18, &location);
    [(BRDownloadProgressProxy *)v5 setCancellationHandler:v17];
    if (v11) {
      [(BRDownloadProgressProxy *)v5 setUserInfoObject:v11 forKey:*MEMORY[0x1E4F28828]];
    }
    v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v14 = objc_msgSend(v13, "br_currentPersonaID");
    personaID = v5->_personaID;
    v5->_personaID = (NSString *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __39__BRDownloadProgressProxy_initWithURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _queryDidReceiveUpdate:0];
}

- (void)_queryDidReceiveUpdate:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (id v4 = self->_personaID) == 0)
  {
    if (_queryDidReceiveUpdate____personaOnceToken != -1) {
      dispatch_once(&_queryDidReceiveUpdate____personaOnceToken, &__block_literal_global_20);
    }
    v5 = (NSString *)(id)_queryDidReceiveUpdate____personalPersona;
    int v6 = 1;
  }
  else
  {
    v5 = v4;
    int v6 = 0;
  }
  v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  v42 = [v7 currentPersona];

  id v44 = 0;
  v8 = [v42 userPersonaUniqueString];
  v9 = v8;
  if (v8 == v5 || [(NSString *)v8 isEqualToString:v5]) {
    goto LABEL_9;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v43 = 0;
    v23 = (void *)[v42 copyCurrentPersonaContextWithError:&v43];
    id v24 = v43;
    id v25 = v44;
    id v44 = v23;

    if (v24)
    {
      v26 = brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
      v27 = brc_default_log(0);
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
        BRPerformWithPersonaAndError_cold_1((uint64_t)v24, (uint64_t)v26, v27);
      }
    }
    v41 = [v42 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

    if (!v41)
    {
LABEL_9:
      v41 = 0;
      goto LABEL_10;
    }
    v28 = brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
    v29 = brc_default_log(0);
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      personaID = self->_personaID;
      *(_DWORD *)buf = 138412802;
      v46 = personaID;
      __int16 v47 = 2112;
      v48 = v41;
      __int16 v49 = 2112;
      v50 = v28;
      _os_log_error_impl(&dword_19ED3F000, v29, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
    }
    goto LABEL_41;
  }
  if (v6 && ([v42 isDataSeparatedPersona] & 1) == 0)
  {
    v28 = brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
    v29 = brc_default_log(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      BRPerformWithPersonaAndError_cold_3((uint64_t)v28, v29);
    }
    v41 = 0;
LABEL_41:

    goto LABEL_10;
  }
  v36 = brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
  v37 = brc_default_log(1);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    BRPerformWithPersonaAndError_cold_2((uint64_t)v36, v37);
  }

  v41 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
LABEL_10:
  char v10 = [(NSMetadataQuery *)self->_query results];
  if ([v10 count])
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
    v39 = [v11 valueForKey:*MEMORY[0x1E4F286D0]];
    uint64_t v12 = [v11 valueForKey:@"BRMetadataUbiquitousItemDownloadingSizeKey"];
    v13 = [(BRDownloadProgressProxy *)self userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28828]];

    int v15 = [(BRDownloadProgressProxy *)self isCancelled];
    if ([(BRDownloadProgressProxy *)self isCancelled])
    {
      objc_super v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v14) {
        _BRLocalizedStringWithFormat(@"CANCELLING_DOWNLOAD_ITEM_PROGRESS_WITH_FILENAME", @"Localizable", v21, v16, v17, v18, v19, v20, (uint64_t)v14);
      }
      else {
        _BRLocalizedStringWithFormat(@"CANCELLING_DOWNLOAD_ITEM_PROGRESS", @"Localizable", v21, v16, v17, v18, v19, v20, v38);
      }
    }
    else
    {
      objc_super v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v14) {
        _BRLocalizedStringWithFormat(@"DOWNLOAD_ITEM_PROGRESS_WITH_FILENAME", @"Localizable", v21, v31, v32, v33, v34, v35, (uint64_t)v14);
      }
      else {
        _BRLocalizedStringWithFormat(@"DOWNLOAD_ITEM_PROGRESS", @"Localizable", v21, v31, v32, v33, v34, v35, v38);
      }
    v22 = };
    [(BRDownloadProgressProxy *)self setLocalizedDescription:v22];

    if (v15)
    {
      [(BRDownloadProgressProxy *)self setTotalUnitCount:-1];
    }
    else if (v12)
    {
      -[BRDownloadProgressProxy setTotalUnitCount:](self, "setTotalUnitCount:", [v12 longLongValue]);
      -[BRDownloadProgressProxy setCompletedUnitCount:](self, "setCompletedUnitCount:", [v39 longLongValue] * objc_msgSend(v12, "longLongValue") / 100);
    }
  }
  _BRRestorePersona(&v44);
}

void __50__BRDownloadProgressProxy__queryDidReceiveUpdate___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)_queryDidReceiveUpdate____personalPersona;
  _queryDidReceiveUpdate____personalPersona = v0;
}

- (void)start
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__queryDidReceiveUpdate_ name:*MEMORY[0x1E4F28620] object:self->_query];
  [v3 addObserver:self selector:sel__queryDidReceiveUpdate_ name:*MEMORY[0x1E4F28618] object:self->_query];
  [(NSMetadataQuery *)self->_query startQuery];
}

- (void)stop
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__BRDownloadProgressProxy_stop__block_invoke;
  v3[3] = &unk_1E59AD3B0;
  v3[4] = self;
  [(NSOperationQueue *)queue addOperationWithBlock:v3];
}

void __31__BRDownloadProgressProxy_stop__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 120) stopQuery];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end