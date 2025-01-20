@interface FinHealthGeoFeatures
- (FinHealthGeoFeatures)init;
- (GEOMapService)geoMapService;
- (GEOPOICategoryFilter)poiCategoryFilter;
- (NSCache)geoPOICache;
- (NSPredicate)geoPredicate;
- (OS_dispatch_queue)geoServicesQueue;
- (id)filterTransactions:(id)a3;
- (os_unfair_lock_s)geoSpatialParameterLock;
- (unint64_t)last;
- (unint64_t)numberOfSkippedBatches;
- (unint64_t)totalRecordsProcessed;
- (void)_evaluatePointsOfInterestWithCache:(id)a3 bypassMapService:(BOOL)a4 completion:(id)a5;
- (void)_updateCacheWithSpatialPlaceLookupParameters:(id)a3;
- (void)evaluatePointsOfInterest:(id)a3 bypassMapService:(BOOL)a4 completion:(id)a5;
- (void)resetTotalRecordsProcessed;
- (void)setGeoSpatialParameterLock:(os_unfair_lock_s)a3;
- (void)setLast:(unint64_t)a3;
- (void)setNumberOfSkippedBatches:(unint64_t)a3;
- (void)setTotalRecordsProcessed:(unint64_t)a3;
@end

@implementation FinHealthGeoFeatures

- (FinHealthGeoFeatures)init
{
  v18.receiver = self;
  v18.super_class = (Class)FinHealthGeoFeatures;
  v2 = [(FinHealthGeoFeatures *)&v18 init];
  if (v2)
  {
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", GEOPOICategoryAirport, GEOPOICategoryAmusementPark, GEOPOICategoryAquarium, GEOPOICategoryBeach, GEOPOICategoryCampground, GEOPOICategoryEVCharger, GEOPOICategoryFireStation, GEOPOICategoryHospital, GEOPOICategoryMovieTheater, GEOPOICategoryMuseum, GEOPOICategoryNationalPark, GEOPOICategoryPark, GEOPOICategoryPlayground, GEOPOICategoryPolice, GEOPOICategoryPostOffice, GEOPOICategoryPublicTransport, GEOPOICategoryReligiousSite,
      GEOPOICategorySchool,
      GEOPOICategoryStadium,
      GEOPOICategoryUniversity,
      GEOPOICategoryWinery,
      GEOPOICategoryZoo,
    v3 = 0);
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", GEOPOICategoryATM, GEOPOICategoryBakery, GEOPOICategoryBank, GEOPOICategoryBrewery, GEOPOICategoryCafe, GEOPOICategoryCarRental, GEOPOICategoryFitnessCenter, GEOPOICategoryFoodMarket, GEOPOICategoryGasStation, GEOPOICategoryHotel, GEOPOICategoryLaundry, GEOPOICategoryLibrary, GEOPOICategoryMarina, GEOPOICategoryNightlife, GEOPOICategoryParking, GEOPOICategoryPharmacy, GEOPOICategoryRestaurant,
      GEOPOICategoryRestroom,
      GEOPOICategoryStore,
      GEOPOICategoryTheater,
      GEOPOICategoryAirportGate,
      GEOPOICategoryAirportTerminal,
    v4 = 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.finhealth.geoservices", 0);
    geoServicesQueue = v2->_geoServicesQueue;
    v2->_geoServicesQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[GEOMapService sharedService];
    geoMapService = v2->_geoMapService;
    v2->_geoMapService = (GEOMapService *)v7;

    v9 = (GEOPOICategoryFilter *)[objc_alloc((Class)GEOPOICategoryFilter) initWithCategoriesToInclude:v3 categoriesToExclude:v4];
    poiCategoryFilter = v2->_poiCategoryFilter;
    v2->_poiCategoryFilter = v9;

    uint64_t v11 = FHTransactionHasLocationKey;
    v12 = +[NSNumber numberWithBool:1];
    uint64_t v13 = +[NSPredicate predicateWithFormat:@"SELF.%K == %@ AND SELF.%K IN %@", v11, v12, FHTransactionSourceKey, &off_100032888];
    geoPredicate = v2->_geoPredicate;
    v2->_geoPredicate = (NSPredicate *)v13;

    v15 = (NSCache *)objc_alloc_init((Class)NSCache);
    geoPOICache = v2->_geoPOICache;
    v2->_geoPOICache = v15;

    v2->_numberOfSkippedBatches = 0;
    v2->_geoSpatialParameterLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)evaluatePointsOfInterest:(id)a3 bypassMapService:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000275C;
    v10[3] = &unk_100031318;
    id v11 = v8;
    [(FinHealthGeoFeatures *)self _evaluatePointsOfInterestWithCache:a3 bypassMapService:v5 completion:v10];
  }
}

- (void)_evaluatePointsOfInterestWithCache:(id)a3 bypassMapService:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = v9;
  if (!v8 || a4)
  {
    if (v8)
    {
      id v33 = [v9 copy];
      v8[2](v8, v33);
    }
  }
  else
  {
    v77 = v9;
    id v74 = v7;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v7;
    id v11 = [obj countByEnumeratingWithState:&v79 objects:v89 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v80;
      uint64_t v14 = FHSmartFeatureCompoundTypePointsOfInterest;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v80 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          v17 = [v16 identifier];
          objc_super v18 = [v16 location];
          [v18 coordinate];
          uint64_t v20 = v19;
          v21 = [v16 location];
          [v21 coordinate];
          v23 = +[NSString stringWithFormat:@"[%.03f,%.03f]", v20, v22];

          v24 = [(NSCache *)self->_geoPOICache objectForKey:v23];
          if (v24)
          {
            id v25 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v24, v14, 0);
            [v77 setObject:v25 forKey:v17];

            v26 = FinHealthLogObject();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v84 = (unint64_t)v17;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "cachedValue found for transactionId: %@", buf, 0xCu);
            }

            [v16 setLocation:0];
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v79 objects:v89 count:16];
      }
      while (v12);
    }

    if (self->_numberOfSkippedBatches == 10)
    {
      v27 = FinHealthLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        unint64_t numberOfSkippedBatches = self->_numberOfSkippedBatches;
        *(_DWORD *)buf = 134217984;
        unint64_t v84 = numberOfSkippedBatches;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "_numberOfSkippedBatches: %lu, resetting", buf, 0xCu);
      }

      self->_unint64_t numberOfSkippedBatches = 0;
    }
    v29 = [(FinHealthGeoFeatures *)self filterTransactions:obj];
    unint64_t v30 = self->_numberOfSkippedBatches;
    if (v30)
    {
      self->_unint64_t numberOfSkippedBatches = v30 + 1;
      v31 = FinHealthLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v32 = self->_numberOfSkippedBatches;
        *(_DWORD *)buf = 134217984;
        unint64_t v84 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "GEO ticket has a previous error, will use cache as a last resort, _numberOfSkippedBatches: %lu", buf, 0xCu);
      }
    }
    else
    {
      id obja = [(GEOMapService *)self->_geoMapService maxParametersCountForSpatialPlaceLookup];
      v34 = FinHealthLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        id v35 = [v29 count];
        *(_DWORD *)buf = 134218240;
        unint64_t v84 = (unint64_t)v35;
        __int16 v85 = 2048;
        double v86 = *(double *)&obja;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "[filteredFHTransactions count]: %lu, maxParametersForLookup: %lu", buf, 0x16u);
      }

      v31 = objc_opt_new();
      v36 = +[NSMutableIndexSet indexSet];
      if ([v29 count])
      {
        v37 = 0;
        double v38 = FHGeoDefaultRadius;
        do
        {
          v39 = [v29 objectAtIndex:v37];
          v40 = [v39 location];
          [v40 coordinate];
          uint64_t v42 = v41;
          uint64_t v44 = v43;

          v45 = +[NSString stringWithFormat:@"%.03f", v42];
          [v45 doubleValue];
          double v47 = v46;

          v48 = +[NSString stringWithFormat:@"%.03f", v44];
          [v48 doubleValue];
          double v50 = v49;

          v51 = FinHealthLogObject();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            v52 = [v39 displayName];
            *(_DWORD *)buf = 138412802;
            unint64_t v84 = (unint64_t)v52;
            __int16 v85 = 2048;
            double v86 = v47;
            __int16 v87 = 2048;
            double v88 = v50;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "[fhTransaction displayName]: %@ - using approximate latitude: %f, longitude :%f", buf, 0x20u);
          }
          id v53 = objc_msgSend(objc_alloc((Class)GEOSpatialPlaceLookupParameters), "initWithCoordinate:radius:poiCategoryFilter:", self->_poiCategoryFilter, v47, v50, v38);
          [v31 addObject:v53];

          [v36 addIndex:v37];
          if (-[NSObject count](v31, "count") == obja || v37 == (char *)[v29 count] - 1)
          {
            os_unfair_lock_lock(&self->_geoSpatialParameterLock);
            id v54 = [v31 copy];
            [(FinHealthGeoFeatures *)self _updateCacheWithSpatialPlaceLookupParameters:v54];

            [v31 removeAllObjects];
            os_unfair_lock_unlock(&self->_geoSpatialParameterLock);
          }

          ++v37;
        }
        while (v37 < [v29 count]);
      }
    }
    if ([v29 count])
    {
      unint64_t v55 = 0;
      uint64_t v56 = FHSmartFeatureCompoundTypePointsOfInterest;
      do
      {
        v57 = [v29 objectAtIndex:v55];
        v58 = [v57 location];
        [v58 coordinate];
        uint64_t v60 = v59;
        uint64_t v62 = v61;

        v63 = +[NSString stringWithFormat:@"%.03f", v60];
        [v63 doubleValue];
        uint64_t v65 = v64;

        v66 = +[NSString stringWithFormat:@"%.03f", v62];
        [v66 doubleValue];
        uint64_t v68 = v67;

        v69 = +[NSString stringWithFormat:@"[%.03f,%.03f]", v65, v68];
        v70 = [(NSCache *)self->_geoPOICache objectForKey:v69];
        if (v70)
        {
          id v71 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v70, v56, 0);
          v72 = [v57 identifier];
          [v77 setObject:v71 forKey:v72];
        }
        ++v55;
      }
      while (v55 < (unint64_t)[v29 count]);
    }
    v10 = v77;
    id v73 = [v77 copy];
    v8[2](v8, v73);

    id v7 = v74;
  }
}

- (void)_updateCacheWithSpatialPlaceLookupParameters:(id)a3
{
  id v4 = a3;
  geoMapService = self->_geoMapService;
  v6 = [(GEOMapService *)geoMapService defaultBackgroundTraits];
  id v7 = [(GEOMapService *)geoMapService ticketForSpatialPlaceLookupParameters:v4 traits:v6];

  id v8 = FinHealthLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "spatialPlaceLookupParameters count: %lu", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003198;
  v15[3] = &unk_100031340;
  objc_copyWeak(&v18, &location);
  id v10 = v4;
  id v16 = v10;
  id v11 = v9;
  v17 = v11;
  [v7 submitWithHandler:v15 queue:self->_geoServicesQueue];
  dispatch_time_t v12 = dispatch_time(0, 1000000 * FHGeoDefaultMillisecondTimeout);
  intptr_t v13 = dispatch_group_wait(v11, v12);
  uint64_t v14 = FinHealthLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = (id)v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "didTimeout: %lu", buf, 0xCu);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)filterTransactions:(id)a3
{
  return [a3 filteredArrayUsingPredicate:self->_geoPredicate];
}

- (void)resetTotalRecordsProcessed
{
  p_geoSpatialParameterLock = &self->_geoSpatialParameterLock;
  os_unfair_lock_lock(&self->_geoSpatialParameterLock);
  self->_totalRecordsProcessed = 0;
  self->_unint64_t numberOfSkippedBatches = 0;
  os_unfair_lock_unlock(p_geoSpatialParameterLock);
}

- (GEOMapService)geoMapService
{
  return self->_geoMapService;
}

- (OS_dispatch_queue)geoServicesQueue
{
  return self->_geoServicesQueue;
}

- (GEOPOICategoryFilter)poiCategoryFilter
{
  return self->_poiCategoryFilter;
}

- (NSCache)geoPOICache
{
  return self->_geoPOICache;
}

- (NSPredicate)geoPredicate
{
  return self->_geoPredicate;
}

- (os_unfair_lock_s)geoSpatialParameterLock
{
  return self->_geoSpatialParameterLock;
}

- (void)setGeoSpatialParameterLock:(os_unfair_lock_s)a3
{
  self->_geoSpatialParameterLock = a3;
}

- (unint64_t)totalRecordsProcessed
{
  return self->_totalRecordsProcessed;
}

- (void)setTotalRecordsProcessed:(unint64_t)a3
{
  self->_totalRecordsProcessed = a3;
}

- (unint64_t)last
{
  return self->_last;
}

- (void)setLast:(unint64_t)a3
{
  self->_last = a3;
}

- (unint64_t)numberOfSkippedBatches
{
  return self->_numberOfSkippedBatches;
}

- (void)setNumberOfSkippedBatches:(unint64_t)a3
{
  self->_unint64_t numberOfSkippedBatches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoPredicate, 0);
  objc_storeStrong((id *)&self->_geoPOICache, 0);
  objc_storeStrong((id *)&self->_poiCategoryFilter, 0);
  objc_storeStrong((id *)&self->_geoServicesQueue, 0);
  objc_storeStrong((id *)&self->_geoMapService, 0);
}

@end