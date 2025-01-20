@interface CLSLocationQueryPerformer
+ (double)defaultPrecision;
+ (id)queryWithTemplate:(id)a3 forRegions:(id)a4;
+ (unint64_t)numberOfRegionsPerBatch;
- ($06626BA963112C91E7E52BBD3AECAE4D)statistics;
- (BOOL)isCancelled;
- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4;
- (CLSLocationCache)locationCache;
- (CLSLocationQueryPerformer)initWithLocationCache:(id)a3;
- (CLSLocationQueryPerformer)initWithRegions:(id)a3 precision:(double)a4 locationCache:(id)a5;
- (GEOMapServiceTicket)ticket;
- (NSArray)geoLocations;
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

@implementation CLSLocationQueryPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_geoLocations, 0);
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
  *(_OWORD *)&self->_statistics.numberOfLocations = v3;
  *(_OWORD *)&self->_statistics.numberOfUnneededLocations = v4;
}

- ($06626BA963112C91E7E52BBD3AECAE4D)statistics
{
  long long v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[2].var2;
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

- (GEOMapServiceTicket)ticket
{
  return self->_ticket;
}

- (NSArray)geoLocations
{
  return self->_geoLocations;
}

- (void)logGeoLookupFailureResult
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F56658];
  long long v4 = @"reverseLookupFailureCount";
  v5[0] = &unk_1F28F2960;
  long long v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 sendEvent:@"com.apple.Photos.GraphGeoService" withPayload:v3];
}

- (void)logGeoLookupCounterAndDurationWithLookupDuration:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  long long v3 = (void *)MEMORY[0x1E4F56658];
  v7[0] = @"reverseLookupCount";
  v7[1] = @"reverseLookupDelay";
  v8[0] = &unk_1F28F2960;
  v8[1] = a3;
  long long v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v3 sendEvent:@"com.apple.Photos.GraphGeoService" withPayload:v6];
}

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (+[CLSLocationCache cachedRegion:isMatchingOtherRegion:](CLSLocationCache, "cachedRegion:isMatchingOtherRegion:", *(void *)(*((void *)&v14 + 1) + 8 * i), v6, (void)v14))
        {

          LOBYTE(v12) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = ![(CLSLocationCache *)self->_locationCache hasRegion:v6];
LABEL_11:

  return v12;
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)submitWithHandler:(id)a3
{
  id v5 = a3;
  long long v4 = (void *)MEMORY[0x1D2602300]();
  [(GEOMapServiceTicket *)self->_ticket submitWithHandler:v5 networkActivity:0];
}

- (unint64_t)cacheItems:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  uint64_t v32 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v32)
  {
    unint64_t v4 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v7 = (void *)MEMORY[0x1D2602300]();
        uint64_t v8 = [MEMORY[0x1E4F1E630] placemarkWithGEOMapItem:v6];
        if (v8)
        {
          uint64_t v9 = [v6 areasOfInterest];
          v33 = v7;
          unint64_t v34 = v4;
          if (v9)
          {
            uint64_t v10 = [v6 _additionalPlaceInfos];
            v11 = +[CLSLitePlacemark popularityScoresOrderedByAOIFromAdditionalPlaceInfos:v10 areasOfInterest:v9];
          }
          else
          {
            v11 = 0;
          }
          BOOL v12 = [[CLSLitePlacemark alloc] initWithCLPlacemark:v8 popularityScoresOrderedByAOI:v11];
          v39 = v12;
          v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
          [v28 addObject:v13];
          long long v14 = [(NSArray *)self->_geoLocations objectAtIndexedSubscript:v30 + i];
          long long v15 = [v14 latLng];
          [v14 horizontalAccuracy];
          double v17 = v16;
          [v15 lat];
          double v19 = v18;
          [v15 lng];
          double v21 = v20;
          id v22 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          v23 = [MEMORY[0x1E4F1C9C8] date];
          v24 = objc_msgSend(v22, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v23, v19, v21, 0.0, v17, 0.0);

          [v27 addObject:v24];
          unint64_t v4 = v34 + 1;

          id v7 = v33;
        }
      }
      v30 += i;
      uint64_t v32 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v32);
  }
  else
  {
    unint64_t v4 = 0;
  }

  [(CLSLocationCache *)self->_locationCache insertBatchesOfPlacemarks:v28 forLocations:v27];
  return v4;
}

- (CLSLocationQueryPerformer)initWithRegions:(id)a3 precision:(double)a4 locationCache:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a5;
  v29 = -[CLSLocationQueryPerformer initWithLocationCache:](self, "initWithLocationCache:");
  if (v29)
  {
    v29->_precision = a4;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v28;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    double v11 = *MEMORY[0x1E4F1E6D8];
    if (v10)
    {
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v14 clsHorizontalAccuracy];
          double v16 = v15;
          id v17 = objc_alloc_init(MEMORY[0x1E4F64660]);
          id v18 = objc_alloc_init(MEMORY[0x1E4F64638]);
          [v14 center];
          objc_msgSend(v18, "setLat:");
          [v14 center];
          [v18 setLng:v19];
          [v17 setLatLng:v18];
          [v17 setHorizontalAccuracy:v16];
          [v8 addObject:v17];

          double v11 = fmax(v11, v16);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    if ([MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:v11]) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = [v9 copy];
    regions = v29->_regions;
    v29->_regions = (NSArray *)v21;

    objc_storeStrong((id *)&v29->_geoLocations, v8);
    v29->_isCancelled = 0;
    id v23 = [MEMORY[0x1E4F64710] sharedService];
    objc_sync_enter(v23);
    uint64_t v24 = [v23 ticketForBatchReverseGeocodeLocations:v29->_geoLocations locationShifter:&__block_literal_global_683 additionalPlaceTypes:&kPLAnalyzerAdditionalPlaceTypes additionalPlaceTypesCount:9 placeTypeLimit:v20 traits:0];
    ticket = v29->_ticket;
    v29->_ticket = (GEOMapServiceTicket *)v24;

    objc_sync_exit(v23);
  }

  return v29;
}

id __69__CLSLocationQueryPerformer_initWithRegions_precision_locationCache___block_invoke()
{
  v0 = +[CLSLocationShifter sharedLocationShifter];
  v1 = [v0 locationShifter];

  return v1;
}

- (CLSLocationQueryPerformer)initWithLocationCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSLocationQueryPerformer;
  id v6 = [(CLSLocationQueryPerformer *)&v9 init];
  if (v6)
  {
    [(id)objc_opt_class() defaultPrecision];
    v6->_precision = v7;
    *(_OWORD *)&v6->_statistics.numberOfLocations = 0u;
    *(_OWORD *)&v6->_statistics.numberOfUnneededLocations = 0u;
    v6->_statistics.batchSize = 0;
    v6->_statistics.batchSize = [(id)objc_opt_class() numberOfRegionsPerBatch];
    objc_storeStrong((id *)&v6->_locationCache, a3);
  }

  return v6;
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
  [v6 precision];
  double v9 = v8;
  uint64_t v10 = [v6 locationCache];

  double v11 = (void *)[v7 initWithRegions:v5 precision:v10 locationCache:v9];
  return v11;
}

@end