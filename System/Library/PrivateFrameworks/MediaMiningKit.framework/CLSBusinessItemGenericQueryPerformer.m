@interface CLSBusinessItemGenericQueryPerformer
+ (NSArray)categories;
+ (double)defaultPrecision;
+ (id)queryWithTemplate:(id)a3 forRegions:(id)a4;
+ (unint64_t)numberOfRegionsPerBatch;
- ($06626BA963112C91E7E52BBD3AECAE4D)statistics;
- (BOOL)isCancelled;
- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4;
- (CLSBusinessCategoryCache)businessCategoryCache;
- (CLSBusinessItemGenericQueryPerformer)initWithBusinessCategoryCache:(id)a3 locationCache:(id)a4;
- (CLSBusinessItemGenericQueryPerformer)initWithRegions:(id)a3 categories:(id)a4 precision:(double)a5 businessCategoryCache:(id)a6 locationCache:(id)a7;
- (CLSLocationCache)locationCache;
- (GEOMapServiceBatchSpatialLookupTicket)businessGenericTicket;
- (NSArray)locationGeoParameters;
- (NSArray)regions;
- (OS_os_log)loggingConnection;
- (double)precision;
- (unint64_t)cacheItems:(id)a3;
- (void)cancel;
- (void)logGeoLookupCounterAndDurationWithLookupDuration:(id)a3;
- (void)logGeoLookupFailureResult;
- (void)setLoggingConnection:(id)a3;
- (void)setPrecision:(double)a3;
- (void)setStatistics:(id *)a3;
- (void)submitWithHandler:(id)a3;
@end

@implementation CLSBusinessItemGenericQueryPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_businessGenericTicket, 0);
  objc_storeStrong((id *)&self->_locationGeoParameters, 0);
  objc_storeStrong((id *)&self->_businessCategoryCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
}

- (CLSBusinessCategoryCache)businessCategoryCache
{
  return self->_businessCategoryCache;
}

- (CLSLocationCache)locationCache
{
  return self->_locationCache;
}

- (void)setLoggingConnection:(id)a3
{
  self->_loggingConnection = (OS_os_log *)a3;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setPrecision:(double)a3
{
  self->_precision = a3;
}

- (double)precision
{
  return self->_precision;
}

- (void)setStatistics:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  self->_statistics.batchSize = a3->var4;
  *(_OWORD *)&self->_statistics.numberOfUnneededLocations = v4;
  *(_OWORD *)&self->_statistics.numberOfLocations = v3;
}

- ($06626BA963112C91E7E52BBD3AECAE4D)statistics
{
  long long v3 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[2].var3;
  return self;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (NSArray)regions
{
  return self->_regions;
}

- (GEOMapServiceBatchSpatialLookupTicket)businessGenericTicket
{
  return self->_businessGenericTicket;
}

- (NSArray)locationGeoParameters
{
  return self->_locationGeoParameters;
}

- (void)logGeoLookupFailureResult
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F56658];
  long long v4 = @"spatialLookupFailureCount";
  v5[0] = &unk_1F28F2C18;
  long long v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendEvent:@"com.apple.Photos.GraphGeoService" withPayload:v3];
}

- (void)logGeoLookupCounterAndDurationWithLookupDuration:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v3 = (void *)MEMORY[0x1E4F56658];
    v7[0] = @"spatialLookupCount";
    v7[1] = @"spatialLookupDelay";
    v8[0] = &unk_1F28F2C18;
    v8[1] = a3;
    long long v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];
    [v3 sendEvent:@"com.apple.Photos.GraphGeoService" withPayload:v6];
  }
}

- (unint64_t)cacheItems:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44 = self;
  id v5 = [(CLSBusinessItemGenericQueryPerformer *)self loggingConnection];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  unint64_t v39 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2150000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CacheItems", (const char *)&unk_1D21C5D8A, buf, 2u);
  }
  os_signpost_id_t spid = v6;
  v38 = v8;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v37 = mach_absolute_time();
  v41 = [(CLSBusinessItemGenericQueryPerformer *)v44 businessCategoryCache];
  v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  uint64_t v45 = v9;
  if (v9)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v43 = *(void *)v57;
    do
    {
      unint64_t v40 = v11;
      uint64_t v12 = 0;
      do
      {
        uint64_t v51 = v10;
        if (*(void *)v57 != v43) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
        context = (void *)MEMORY[0x1D2602300](v9);
        v14 = objc_msgSend(v13, "allKeys", spid);
        uint64_t v15 = [v14 firstObject];

        v48 = [(CLSLocationCache *)v44->_locationCache placemarksForLocation:v15];
        v16 = [v48 firstObject];
        v17 = [v16 ISOcountryCode];

        if (!v17)
        {
          v18 = +[CLSLogging sharedLogging];
          v19 = [v18 loggingConnection];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "[GeoMapService BusinessItemQuery] Not able to hit the cache, business item will have an empty isoCountryCode", buf, 2u);
          }
        }
        v49 = (void *)v15;
        v20 = [v13 allValues];
        v21 = [v20 firstObject];

        v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
        uint64_t v23 = [v21 count];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v24 = v21;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v65 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v53 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = [[CLSBusinessItem alloc] initFromMapItem:*(void *)(*((void *)&v52 + 1) + 8 * i) isoCountryCode:v17 categoryOnly:1];
              if (v29) {
                [v22 addObject:v29];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v65 count:16];
          }
          while (v26);
        }
        uint64_t v10 = v23 + v51;

        [v47 addObject:v22];
        [v46 addObject:v49];
        if ((unint64_t)(v23 + v51) >= 0xC8)
        {
          [v41 insertBatchesOfBusinessItems:v47 forRegions:v46];
          [v41 invalidateMemoryCaches];
          [v47 removeAllObjects];
          [v46 removeAllObjects];
          uint64_t v10 = 0;
        }

        ++v12;
      }
      while (v12 != v45);
      unint64_t v11 = v40 + v45;
      uint64_t v9 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
      uint64_t v45 = v9;
    }
    while (v9);
  }
  else
  {
    unint64_t v11 = 0;
  }

  [v41 insertBatchesOfBusinessItems:v47 forRegions:v46];
  [v41 invalidateMemoryCaches];
  uint64_t v30 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v33 = v38;
  v34 = v33;
  if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2150000, v34, OS_SIGNPOST_INTERVAL_END, spid, "CacheItems", (const char *)&unk_1D21C5D8A, buf, 2u);
  }

  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "CacheItems";
    __int16 v63 = 2048;
    double v64 = (float)((float)((float)((float)(v30 - v37) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D2150000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v11;
}

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        if (+[CLSLocationCache cachedRegion:isMatchingOtherRegion:](CLSLocationCache, "cachedRegion:isMatchingOtherRegion:", *(void *)(*((void *)&v23 + 1) + 8 * i), v6, (void)v23))
        {
          LOBYTE(v21) = 0;
          uint64_t v12 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = [(CLSBusinessItemGenericQueryPerformer *)self businessCategoryCache];
  id v13 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  [v6 center];
  double v15 = v14;
  double v17 = v16;
  double precision = self->_precision;
  v19 = [v6 identifier];
  v20 = objc_msgSend(v13, "initWithCenter:radius:identifier:", v19, v15, v17, precision);

  int v21 = [v12 hasRegion:v20] ^ 1;
LABEL_11:

  return v21;
}

- (void)cancel
{
  long long v3 = [(CLSBusinessItemGenericQueryPerformer *)self businessGenericTicket];
  [v3 cancel];

  self->_isCancelled = 1;
}

- (void)submitWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D2602300]();
  objc_initWeak(&location, self);
  id v6 = [(CLSBusinessItemGenericQueryPerformer *)self businessGenericTicket];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CLSBusinessItemGenericQueryPerformer_submitWithHandler___block_invoke;
  void v8[3] = &unk_1E690FBB0;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [v6 submitWithHandler:v8 networkActivity:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__CLSBusinessItemGenericQueryPerformer_submitWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D2602300]();
  id v5 = +[CLSLogging sharedLogging];
  id v6 = [v5 loggingConnection];

  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v36 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v57 = (uint64_t)v36;
      _os_log_error_impl(&dword_1D2150000, v6, OS_LOG_TYPE_ERROR, "[GeoMapService BusinessItemQuery] Failed to complete with error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2150000, v6, OS_LOG_TYPE_INFO, "[GeoMapService BusinessItemQuery] Sucessfully completed business item query", buf, 2u);
    }

    uint64_t v43 = [MEMORY[0x1E4F1CA48] array];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v38 = a1;
      unint64_t v39 = v4;
      id v9 = [WeakRetained locationGeoParameters];
      v42 = [v8 businessGenericTicket];
      v41 = [v8 regions];
      uint64_t v37 = v8;
      [v8 precision];
      double v11 = v10;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id obj = v9;
      uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v49 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            v18 = [MEMORY[0x1E4F1CA48] array];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            v19 = [v42 mapItemsForParameters:v17];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v54 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v45 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  [v18 addObject:*(void *)(*((void *)&v44 + 1) + 8 * j)];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v54 count:16];
              }
              while (v21);
            }

            long long v24 = +[CLSLogging sharedLogging];
            long long v25 = [v24 loggingConnection];

            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = [v18 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v57 = v26;
              _os_log_impl(&dword_1D2150000, v25, OS_LOG_TYPE_INFO, "[GeoMapService BusinessItemQuery] Fetched: %lu map items for business item", buf, 0xCu);
            }

            uint64_t v27 = [v41 objectAtIndexedSubscript:v14];
            id v28 = objc_alloc(MEMORY[0x1E4F1E5A8]);
            [v27 center];
            double v30 = v29;
            double v32 = v31;
            v33 = [v27 identifier];
            v34 = objc_msgSend(v28, "initWithCenter:radius:identifier:", v33, v30, v32, v11);

            long long v52 = v34;
            long long v53 = v18;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
            [v43 addObject:v35];
            ++v14;
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v13);
      }

      id v4 = v39;
      id v3 = 0;
      uint64_t v8 = v37;
      a1 = v38;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (CLSBusinessItemGenericQueryPerformer)initWithRegions:(id)a3 categories:(id)a4 precision:(double)a5 businessCategoryCache:(id)a6 locationCache:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v12 = a4;
  id v35 = a6;
  id v36 = a7;
  uint64_t v13 = -[CLSBusinessItemGenericQueryPerformer initWithBusinessCategoryCache:locationCache:](self, "initWithBusinessCategoryCache:locationCache:", v35);
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_double precision = a5;
    uint64_t v15 = +[CLSLocationShifter sharedLocationShifter];
    double v16 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v17 = v37;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v21 center];
          double v23 = v22;
          [v21 center];
          [v15 shiftedCoordinateForOriginalCoordinate:v23];
          uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64A60]), "initWithCoordinate:radius:categories:", v12, v24, v25, a5);
          [v16 addObject:v26];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v18);
    }

    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithArray:v16];
    locationGeoParameters = v14->_locationGeoParameters;
    v14->_locationGeoParameters = (NSArray *)v27;

    id v29 = [MEMORY[0x1E4F64710] sharedService];
    objc_sync_enter(v29);
    uint64_t v30 = [v29 ticketForSpatialLookupParameters:v14->_locationGeoParameters traits:0];
    businessGenericTicket = v14->_businessGenericTicket;
    v14->_businessGenericTicket = (GEOMapServiceBatchSpatialLookupTicket *)v30;

    objc_sync_exit(v29);
    uint64_t v32 = [v17 copy];
    regions = v14->_regions;
    v14->_regions = (NSArray *)v32;
  }
  return v14;
}

- (CLSBusinessItemGenericQueryPerformer)initWithBusinessCategoryCache:(id)a3 locationCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLSBusinessItemGenericQueryPerformer;
  id v9 = [(CLSBusinessItemGenericQueryPerformer *)&v13 init];
  double v10 = v9;
  if (v9)
  {
    v9->_isCancelled = 0;
    [(id)objc_opt_class() defaultPrecision];
    v10->_double precision = v11;
    *(_OWORD *)&v10->_statistics.numberOfLocations = 0u;
    *(_OWORD *)&v10->_statistics.numberOfUnneededLocations = 0u;
    v10->_statistics.batchSize = 0;
    objc_storeStrong((id *)&v10->_businessCategoryCache, a3);
    objc_storeStrong((id *)&v10->_locationCache, a4);
  }

  return v10;
}

+ (NSArray)categories
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (double)defaultPrecision
{
  return 0.0;
}

+ (unint64_t)numberOfRegionsPerBatch
{
  return 35;
}

+ (id)queryWithTemplate:(id)a3 forRegions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  id v8 = [(id)objc_opt_class() categories];
  [v6 precision];
  double v10 = v9;
  double v11 = [v6 businessCategoryCache];
  id v12 = [v6 locationCache];

  objc_super v13 = (void *)[v7 initWithRegions:v5 categories:v8 precision:v11 businessCategoryCache:v12 locationCache:v10];
  return v13;
}

@end