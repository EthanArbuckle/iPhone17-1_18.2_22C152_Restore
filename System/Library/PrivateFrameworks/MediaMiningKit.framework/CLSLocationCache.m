@interface CLSLocationCache
+ (BOOL)cachedRegion:(id)a3 isMatchingOtherRegion:(id)a4;
+ (id)defaultCacheName;
- (BOOL)hasCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4;
- (BOOL)hasRegion:(id)a3;
- (CLSLocationCache)initWithURL:(id)a3 dataModelName:(id)a4;
- (id)_insertManagedPlacemarkForLitePlacemark:(id)a3 inContext:(id)a4;
- (id)_insertManagedPlacemarksForLitePlacemarks:(id)a3 inContext:(id)a4;
- (id)_litePlacemarkFromManagedPlacemark:(id)a3;
- (id)_litePlacemarksFromManagedPlacemarks:(id)a3;
- (id)_stringifyAddressDictionaryValues:(id)a3;
- (id)_stringifyCircularRegionValue:(id)a3;
- (id)_stringifyPostalAddress:(id)a3;
- (id)dataModelName;
- (id)fetchPlacemarkForLocation:(id)a3 withQueryAccuracy:(double)a4;
- (id)nearestEntryForCoordinate:(CLLocationCoordinate2D)a3 entries:(id)a4;
- (id)placemarkForMUID:(unint64_t)a3;
- (id)placemarksForAddressDictionary:(id)a3;
- (id)placemarksForLocation:(id)a3;
- (id)placemarksForLocation:(id)a3 withQueryAccuracy:(double)a4;
- (id)placemarksForLocationAddress:(id)a3;
- (id)placemarksForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4;
- (id)placemarksForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4 queryAccuracy:(double)a5;
- (id)placemarksForPostalAddress:(id)a3;
- (id)predicateForCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4;
- (id)predicateForCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4 queryAccuracy:(double)a5;
- (void)_setPlacemarks:(id)a3 forEntryWithPredicate:(id)a4 entrySetupBlock:(id)a5;
- (void)insertBatchesOfPlacemarks:(id)a3 forLocations:(id)a4;
- (void)invalidateCacheForGeoServiceProviderChangeToProvider:(id)a3;
- (void)invalidateCacheForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4;
- (void)invalidateCacheForMUID:(unint64_t)a3;
- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3;
- (void)setPlacemark:(id)a3 forMUID:(unint64_t)a4;
- (void)setPlacemarks:(id)a3 forAddressDictionary:(id)a4;
- (void)setPlacemarks:(id)a3 forCLLocation:(id)a4;
- (void)setPlacemarks:(id)a3 forLocation:(id)a4;
- (void)setPlacemarks:(id)a3 forLocationAddress:(id)a4;
- (void)setPlacemarks:(id)a3 forLocationCoordinate:(CLLocationCoordinate2D)a4 withHorizontalAccuracy:(double)a5;
- (void)setPlacemarks:(id)a3 forPostalAddress:(id)a4;
@end

@implementation CLSLocationCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPredicateWithMUID, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithAddressTemplate, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithCoordinateTemplate, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithAddressBookDictionaryTemplate, 0);
  objc_storeStrong((id *)&self->_entryPredicateWithContactsPostalAddressTemplate, 0);
}

- (void)invalidateCacheForGeoServiceProviderChangeToProvider:(id)a3
{
  id v4 = a3;
  v5 = [(CLSDBCache *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__CLSLocationCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke;
  v8[3] = &unk_1E6910138;
  id v9 = v4;
  id v10 = v5;
  v11 = self;
  id v6 = v5;
  id v7 = v4;
  [v6 performBlockAndWait:v8];
}

void __73__CLSLocationCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke(uint64_t a1)
{
  v61[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[CLSManagedPlacemark entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"geoServiceProvider != %@", *(void *)(a1 + 32)];
  id v6 = [MEMORY[0x1E4F8AB68] autoNaviCountryCode];
  if ([MEMORY[0x1E4F8AB68] isAutoNaviRevGeoProvider:*(void *)(a1 + 32)]) {
    id v7 = @"isoCountryCode == %@";
  }
  else {
    id v7 = @"isoCountryCode != %@";
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v7, v6);
  id v9 = (void *)MEMORY[0x1E4F28BA0];
  v61[0] = v5;
  v61[1] = v8;
  v48 = (void *)v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v11 = [v9 andPredicateWithSubpredicates:v10];

  [v4 setPredicate:v11];
  v12 = *(void **)(a1 + 40);
  id v55 = 0;
  v13 = [v12 executeFetchRequest:v4 error:&v55];
  id v14 = v55;
  if ([v13 count])
  {
    v46 = v6;
    v15 = (void *)MEMORY[0x1E4F1C0D0];
    v16 = +[CLSLocationCacheEntry entityName];
    v17 = [v15 fetchRequestWithEntityName:v16];

    uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY placemarks IN %@", v13];

    v44 = (void *)v18;
    [v17 setPredicate:v18];
    v45 = v17;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v17];
    [v19 setResultType:2];
    v20 = *(void **)(a1 + 40);
    id v54 = v14;
    v43 = v19;
    v21 = [v20 executeRequest:v19 error:&v54];
    id v22 = v54;

    v23 = +[CLSLogging sharedLogging];
    v24 = [v23 loggingConnection];

    v47 = v5;
    v42 = v4;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v22;
        _os_log_error_impl(&dword_1D2150000, v24, OS_LOG_TYPE_ERROR, "Failed to batch location cache entries: Error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = [v21 result];
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v58 = v25;
      __int16 v59 = 2112;
      uint64_t v60 = v26;
      _os_log_impl(&dword_1D2150000, v24, OS_LOG_TYPE_INFO, "Batch deleted %@ location cache entries, for provider %@", buf, 0x16u);
    }
    v27 = v21;

    v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v29 = v13;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v51 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v50 + 1) + 8 * i) objectID];
          [v28 addObject:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v31);
    }

    v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithObjectIDs:v28];
    v36 = *(void **)(a1 + 40);
    id v49 = v22;
    v37 = [v36 executeRequest:v35 error:&v49];
    id v14 = v49;

    v38 = +[CLSLogging sharedLogging];
    v39 = [v38 loggingConnection];

    if (v14)
    {
      v5 = v47;
      id v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v14;
        _os_log_error_impl(&dword_1D2150000, v39, OS_LOG_TYPE_ERROR, "Failed to batch location cache entries: Error: %@", buf, 0xCu);
      }
    }
    else
    {
      v5 = v47;
      id v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = [v37 result];
        uint64_t v41 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        id v58 = v40;
        __int16 v59 = 2112;
        uint64_t v60 = v41;
        _os_log_impl(&dword_1D2150000, v39, OS_LOG_TYPE_INFO, "Batch deleted %{private}@ location cache placemarks, for provider %@", buf, 0x16u);
      }
    }

    [*(id *)(a1 + 48) _save];
    v11 = v44;
    id v6 = v46;
  }
}

- (id)_litePlacemarkFromManagedPlacemark:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(CLSLitePlacemark);
  [v3 latitude];
  CLLocationDegrees v6 = v5;
  [v3 longitude];
  CLLocationCoordinate2D v65 = CLLocationCoordinate2DMake(v6, v7);
  double latitude = v65.latitude;
  double longitude = v65.longitude;
  if (CLLocationCoordinate2DIsValid(v65))
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
    [(CLSLitePlacemark *)v4 setLocation:v10];
  }
  else
  {
    [(CLSLitePlacemark *)v4 setLocation:0];
  }
  [v3 regionLatitude];
  CLLocationDegrees v12 = v11;
  [v3 regionLongitude];
  CLLocationCoordinate2D v66 = CLLocationCoordinate2DMake(v12, v13);
  double v14 = v66.latitude;
  double v15 = v66.longitude;
  if (CLLocationCoordinate2DIsValid(v66))
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    [v3 regionRadius];
    double v18 = v17;
    v19 = [v3 regionIdentifier];
    v20 = objc_msgSend(v16, "initWithCenter:radius:identifier:", v19, v14, v15, v18);

    [(CLSLitePlacemark *)v4 setRegion:v20];
  }
  v21 = [v3 thoroughfare];
  [(CLSLitePlacemark *)v4 setThoroughfare:v21];

  id v22 = [v3 subThoroughfare];
  [(CLSLitePlacemark *)v4 setSubThoroughfare:v22];

  v23 = [v3 locality];
  [(CLSLitePlacemark *)v4 setLocality:v23];

  v24 = [v3 subLocality];
  [(CLSLitePlacemark *)v4 setSubLocality:v24];

  v25 = [v3 administrativeArea];
  [(CLSLitePlacemark *)v4 setAdministrativeArea:v25];

  uint64_t v26 = [v3 administrativeAreaCode];
  [(CLSLitePlacemark *)v4 setAdministrativeAreaCode:v26];

  v27 = [v3 subAdministrativeArea];
  [(CLSLitePlacemark *)v4 setSubAdministrativeArea:v27];

  v28 = [v3 isoCountryCode];
  [(CLSLitePlacemark *)v4 setISOcountryCode:v28];

  id v29 = [v3 inlandWater];
  [(CLSLitePlacemark *)v4 setInlandWater:v29];

  uint64_t v30 = [v3 ocean];
  [(CLSLitePlacemark *)v4 setOcean:v30];

  -[CLSLitePlacemark setIsIsland:](v4, "setIsIsland:", [v3 isIsland]);
  uint64_t v31 = [v3 areasOfInterest];
  uint64_t v32 = v31;
  if (v31)
  {
    v33 = [v31 componentsSeparatedByString:@"_#_"];
  }
  else
  {
    v33 = 0;
  }
  [(CLSLitePlacemark *)v4 setAreasOfInterest:v33];

  v34 = [v3 revGeoLocationData];
  [(CLSLitePlacemark *)v4 setRevGeoLocationData:v34];

  v35 = [v3 geoServiceProvider];
  [(CLSLitePlacemark *)v4 setGeoServiceProvider:v35];

  id v36 = [v3 popularityScoresOrderedByAOI];
  v37 = v36;
  if (v36)
  {
    id v55 = v4;
    v38 = [v36 componentsSeparatedByString:@"_#_"];
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v40 = v38;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v57;
      v44 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          v46 = (void *)MEMORY[0x1E4F28ED0];
          [*(id *)(*((void *)&v56 + 1) + 8 * i) doubleValue];
          v47 = objc_msgSend(v46, "numberWithDouble:");
          v48 = v47;
          if (!v47)
          {
            BOOL v49 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
            v48 = &unk_1F28F2C30;
            if (v49)
            {
              *(_DWORD *)buf = 138412290;
              v61 = v37;
              _os_log_error_impl(&dword_1D2150000, v44, OS_LOG_TYPE_ERROR, "[CLSLocationCache] Could not convert deserialize AOI string %@ to NSNumbers", buf, 0xCu);
              v48 = &unk_1F28F2C30;
            }
          }
          [v39 addObject:v48];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v42);
    }

    id v4 = v55;
  }
  else
  {
    id v39 = 0;
  }

  [(CLSLitePlacemark *)v4 setPopularityScoresOrderedByAOI:v39];
  long long v50 = [(CLSLitePlacemark *)v4 areasOfInterest];
  if (v50)
  {
    long long v51 = [(CLSLitePlacemark *)v4 popularityScoresOrderedByAOI];

    if (!v51)
    {
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v50 count])
      {
        unint64_t v53 = 0;
        do
          [v52 setObject:&unk_1F28F2C30 atIndexedSubscript:v53++];
        while (v53 < [v50 count]);
      }
      [(CLSLitePlacemark *)v4 setPopularityScoresOrderedByAOI:v52];
    }
  }

  return v4;
}

- (id)_insertManagedPlacemarkForLitePlacemark:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  CLLocationDegrees v6 = (void *)MEMORY[0x1E4F1C0A8];
  id v7 = a4;
  uint64_t v8 = +[CLSManagedPlacemark entityName];
  id v9 = [v6 insertNewObjectForEntityForName:v8 inManagedObjectContext:v7];

  id v10 = [v5 location];
  double v11 = v10;
  if (v10)
  {
    [v10 coordinate];
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1E750];
    double v14 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  [v9 setLatitude:v12];
  [v9 setLongitude:v14];
  double v15 = [v5 region];
  id v16 = v15;
  if (v15)
  {
    [v15 center];
    double v19 = v18;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1E750];
    double v19 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  [v9 setRegionLatitude:v17];
  [v9 setRegionLongitude:v19];
  [v16 radius];
  objc_msgSend(v9, "setRegionRadius:");
  v20 = [v16 identifier];
  [v9 setRegionIdentifier:v20];

  v21 = [v5 thoroughfare];
  [v9 setThoroughfare:v21];

  id v22 = [v5 subThoroughfare];
  [v9 setSubThoroughfare:v22];

  v23 = [v5 locality];
  [v9 setLocality:v23];

  v24 = [v5 subLocality];
  [v9 setSubLocality:v24];

  v25 = [v5 administrativeArea];
  [v9 setAdministrativeArea:v25];

  uint64_t v26 = [v5 administrativeAreaCode];
  [v9 setAdministrativeAreaCode:v26];

  v27 = [v5 subAdministrativeArea];
  [v9 setSubAdministrativeArea:v27];

  v28 = [v5 ISOcountryCode];
  [v9 setIsoCountryCode:v28];

  id v29 = [v5 inlandWater];
  [v9 setInlandWater:v29];

  uint64_t v30 = [v5 ocean];
  [v9 setOcean:v30];

  objc_msgSend(v9, "setIsIsland:", objc_msgSend(v5, "isIsland"));
  uint64_t v31 = [v5 areasOfInterest];
  if ([v31 count])
  {
    uint64_t v32 = [v31 componentsJoinedByString:@"_#_"];
  }
  else
  {
    uint64_t v32 = 0;
  }
  [v9 setAreasOfInterest:v32];

  v33 = [v5 revGeoLocationData];
  [v9 setRevGeoLocationData:v33];

  v34 = [v5 geoServiceProvider];
  [v9 setGeoServiceProvider:v34];

  v35 = [v5 popularityScoresOrderedByAOI];
  if ([v35 count])
  {
    id v36 = [v35 componentsJoinedByString:@"_#_"];
  }
  else
  {
    id v36 = 0;
  }
  [v9 setPopularityScoresOrderedByAOI:v36];

  return v9;
}

- (id)_insertManagedPlacemarksForLitePlacemarks:(id)a3 inContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = -[CLSLocationCache _insertManagedPlacemarkForLitePlacemark:inContext:](self, "_insertManagedPlacemarkForLitePlacemark:inContext:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_litePlacemarksFromManagedPlacemarks:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = -[CLSLocationCache _litePlacemarkFromManagedPlacemark:](self, "_litePlacemarkFromManagedPlacemark:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_setPlacemarks:(id)a3 forEntryWithPredicate:(id)a4 entrySetupBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    uint64_t v11 = [(CLSDBCache *)self managedObjectContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__CLSLocationCache__setPlacemarks_forEntryWithPredicate_entrySetupBlock___block_invoke;
    v13[3] = &unk_1E690EBD0;
    id v14 = v9;
    id v15 = v11;
    id v18 = v10;
    long long v16 = self;
    id v17 = v8;
    id v12 = v11;
    [v12 performBlockAndWait:v13];
  }
}

void __73__CLSLocationCache__setPlacemarks_forEntryWithPredicate_entrySetupBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setFetchLimit:1];
  [v4 setPredicate:*(void *)(a1 + 32)];
  id v5 = *(void **)(a1 + 40);
  id v22 = 0;
  id v6 = [v5 executeFetchRequest:v4 error:&v22];
  id v7 = v22;
  if (v6 && [v6 count] == 1)
  {
    id v8 = [v6 objectAtIndexedSubscript:0];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = objc_msgSend(v8, "placemarks", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(a1 + 40) deleteObject:*(void *)(*((void *)&v18 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1C0A8];
    id v15 = +[CLSLocationCacheEntry entityName];
    id v8 = [v14 insertNewObjectForEntityForName:v15 inManagedObjectContext:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  long long v16 = [*(id *)(a1 + 48) _insertManagedPlacemarksForLitePlacemarks:*(void *)(a1 + 56) inContext:*(void *)(a1 + 40)];
  [v8 setPlacemarks:v16];

  id v17 = [MEMORY[0x1E4F1C9C8] date];
  [v17 timeIntervalSince1970];
  objc_msgSend(v8, "setUpdateTimestamp:");

  [*(id *)(a1 + 48) _save];
}

- (id)fetchPlacemarkForLocation:(id)a3 withQueryAccuracy:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CLSLocationCache *)self placemarksForLocation:v6 withQueryAccuracy:a4];
  id v8 = [v7 firstObject];

  if (!v8)
  {
    id v9 = +[CLSCachedGeocoderOperation operationForceGeocoderWithLocation:v6];
    id v20 = 0;
    uint64_t v10 = [v9 performSynchronouslyWithLocationCache:self error:&v20];
    id v11 = v20;
    if (v10)
    {
      [v6 coordinate];
      double v13 = v12;
      double v15 = v14;
      [v6 horizontalAccuracy];
      -[CLSLocationCache setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:](self, "setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:", v10, v13, v15, v16);
      id v8 = [v10 firstObject];
    }
    else
    {
      id v17 = +[CLSLogging sharedLogging];
      long long v18 = [v17 loggingConnection];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v22 = "-[CLSLocationCache fetchPlacemarkForLocation:withQueryAccuracy:]";
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_error_impl(&dword_1D2150000, v18, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
      }

      id v8 = 0;
    }
  }
  return v8;
}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CLSLocationCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke;
  v7[3] = &unk_1E69104D0;
  double v10 = a3;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __64__CLSLocationCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"updateTimestamp <= %f", *(void *)(a1 + 48));
  [v4 setPredicate:v5];
  id v6 = *(void **)(a1 + 32);
  id v24 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v24];
  id v8 = v24;
  id v9 = v8;
  if (v7)
  {
    id v18 = v8;
    long long v19 = v5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v13 = 0;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
          id v17 = (void *)MEMORY[0x1D2602300]();
          [*(id *)(a1 + 32) deleteObject:v16];
          if (v13 >= 0x13)
          {
            [*(id *)(a1 + 40) _save];
            unint64_t v13 = 0;
          }
          else
          {
            ++v13;
          }
          ++v15;
        }
        while (v12 != v15);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    [*(id *)(a1 + 40) _save];
    id v9 = v18;
    id v5 = v19;
  }
}

- (void)invalidateCacheForMUID:(unint64_t)a3
{
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CLSLocationCache_invalidateCacheForMUID___block_invoke;
  v7[3] = &unk_1E69104D0;
  id v8 = v5;
  unint64_t v9 = a3;
  void v7[4] = self;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __43__CLSLocationCache_invalidateCacheForMUID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v8 = [v6 dictionaryWithObject:v7 forKey:@"muid"];
  unint64_t v9 = [v5 predicateWithSubstitutionVariables:v8];

  [v4 setPredicate:v9];
  [v4 setFetchLimit:1];
  id v10 = *(void **)(a1 + 40);
  id v15 = 0;
  uint64_t v11 = [v10 executeFetchRequest:v4 error:&v15];
  id v12 = v15;
  if ([v11 count] == 1)
  {
    unint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v11 objectAtIndexedSubscript:0];
    [v13 deleteObject:v14];

    [*(id *)(a1 + 32) _save];
  }
}

- (id)placemarkForMUID:(unint64_t)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__778;
  id v17 = __Block_byref_object_dispose__779;
  id v18 = 0;
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__CLSLocationCache_placemarkForMUID___block_invoke;
  v9[3] = &unk_1E690F000;
  v9[4] = self;
  unint64_t v12 = a3;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = &v13;
  [v6 performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __37__CLSLocationCache_placemarkForMUID___block_invoke(void *a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = *(void **)(a1[4] + 88);
  long long v22 = @"muid";
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1[7]];
  v23[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v8 = [v5 predicateWithSubstitutionVariables:v7];

  [v4 setFetchLimit:1];
  [v4 setPredicate:v8];
  unint64_t v9 = (void *)a1[5];
  id v19 = 0;
  id v10 = [v9 executeFetchRequest:v4 error:&v19];
  id v11 = v19;
  if (v10 && [v10 count] == 1)
  {
    unint64_t v12 = [v10 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 placemarks];
    uint64_t v14 = (void *)a1[4];
    uint64_t v15 = [v13 anyObject];
    uint64_t v16 = [v14 _litePlacemarkFromManagedPlacemark:v15];
    uint64_t v17 = *(void *)(a1[6] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    if (!*(void *)(*(void *)(a1[6] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemark, error %@", buf, 0xCu);
    }
  }
}

- (void)setPlacemark:(id)a3 forMUID:(unint64_t)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v16[0] = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    id v8 = [v6 arrayWithObjects:v16 count:1];
    entryPredicateWithMUID = self->_entryPredicateWithMUID;
    uint64_t v14 = @"muid";
    id v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    uint64_t v15 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    unint64_t v12 = [(NSPredicate *)entryPredicateWithMUID predicateWithSubstitutionVariables:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__CLSLocationCache_setPlacemark_forMUID___block_invoke;
    v13[3] = &__block_descriptor_40_e31_v16__0__CLSLocationCacheEntry_8l;
    void v13[4] = a4;
    [(CLSLocationCache *)self _setPlacemarks:v8 forEntryWithPredicate:v12 entrySetupBlock:v13];
  }
}

uint64_t __41__CLSLocationCache_setPlacemark_forMUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMuid:*(void *)(a1 + 32)];
}

- (id)_stringifyPostalAddress:(id)a3
{
  id v3 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:a3 style:0];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"_"];

  return v5;
}

- (id)_stringifyCircularRegionValue:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v4 identifier];
  [v4 center];
  uint64_t v7 = v6;
  [v4 center];
  uint64_t v9 = v8;
  [v4 radius];
  uint64_t v11 = v10;

  unint64_t v12 = [v3 stringWithFormat:@"%@_%.5lf_%.5lf_%.2lf", v5, v7, v9, v11];

  return v12;
}

- (id)_stringifyAddressDictionaryValues:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 allKeys];
  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  uint64_t v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      unint64_t v12 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v11)];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 appendFormat:@"%@_", v12];
      }
      unint64_t v13 = [v6 length];

      if (v13 > 0xFF) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v6;
}

- (id)placemarksForLocation:(id)a3 withQueryAccuracy:(double)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [v7 coordinate];
    double v9 = v8;
    double v11 = v10;
    [v7 horizontalAccuracy];
LABEL_5:
    double v15 = v12;

    uint64_t v16 = -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", v9, v11, v15, a4);
LABEL_6:
    long long v17 = (void *)v16;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [v7 center];
    double v9 = v13;
    double v11 = v14;
    [v7 clsHorizontalAccuracy];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [(CLSLocationCache *)self placemarksForAddressDictionary:v6];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [(CLSLocationCache *)self placemarksForLocationAddress:v6];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v19 = *MEMORY[0x1E4F1E6D8];
    if (*MEMORY[0x1E4F1E6D8] == a4)
    {
      uint64_t v20 = [[CLSLitePlacemark alloc] initWithCLPlacemark:v6];
      v28[0] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
LABEL_21:
      long long v17 = (void *)v21;

      goto LABEL_7;
    }
LABEL_20:
    objc_msgSend(v6, "location", v19);
    uint64_t v20 = (CLSLitePlacemark *)objc_claimAutoreleasedReturnValue();
    [(CLSLitePlacemark *)v20 coordinate];
    double v23 = v22;
    double v25 = v24;
    [(CLSLitePlacemark *)v20 horizontalAccuracy];
    uint64_t v21 = -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", v23, v25, v26, a4);
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v19 = *MEMORY[0x1E4F1E6D8];
    if (*MEMORY[0x1E4F1E6D8] == a4)
    {
      id v27 = v6;
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v27, 1, v19);
      goto LABEL_6;
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [(CLSLocationCache *)self placemarksForPostalAddress:v6];
    goto LABEL_6;
  }
  long long v17 = 0;
LABEL_7:

  return v17;
}

- (id)placemarksForLocation:(id)a3
{
  return [(CLSLocationCache *)self placemarksForLocation:a3 withQueryAccuracy:*MEMORY[0x1E4F1E6D8]];
}

- (id)placemarksForPostalAddress:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__778;
  long long v18 = __Block_byref_object_dispose__779;
  id v19 = 0;
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CLSLocationCache_placemarksForPostalAddress___block_invoke;
  v10[3] = &unk_1E6910548;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  double v13 = &v14;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __47__CLSLocationCache_placemarksForPostalAddress___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (void *)v5[7];
  double v22 = @"postalAddress";
  id v8 = [v5 _stringifyPostalAddress:v6];
  v23[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  double v10 = [v7 predicateWithSubstitutionVariables:v9];

  [v4 setFetchLimit:1];
  [v4 setPredicate:v10];
  id v11 = *(void **)(a1 + 48);
  id v19 = 0;
  id v12 = [v11 executeFetchRequest:v4 error:&v19];
  id v13 = v19;
  if (v12 && [v12 count] == 1)
  {
    uint64_t v14 = [v12 objectAtIndexedSubscript:0];
    double v15 = [v14 placemarks];

    uint64_t v16 = [*(id *)(a1 + 32) _litePlacemarksFromManagedPlacemarks:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemarks, error %@", buf, 0xCu);
    }
  }
}

- (void)setPlacemarks:(id)a3 forPostalAddress:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CLSLocationCache *)self _stringifyPostalAddress:a4];
  entryPredicateWithContactsPostalAddressTemplate = self->_entryPredicateWithContactsPostalAddressTemplate;
  uint64_t v16 = @"postalAddress";
  v17[0] = v7;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  double v10 = [(NSPredicate *)entryPredicateWithContactsPostalAddressTemplate predicateWithSubstitutionVariables:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CLSLocationCache_setPlacemarks_forPostalAddress___block_invoke;
  v13[3] = &unk_1E690EB88;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(CLSLocationCache *)self _setPlacemarks:v12 forEntryWithPredicate:v10 entrySetupBlock:v13];
}

void __51__CLSLocationCache_setPlacemarks_forPostalAddress___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) firstObject];
  id v4 = [v3 location];

  if (v4)
  {
    [v4 coordinate];
    double v6 = v5;
    objc_msgSend(v7, "setLatitude:");
    [v7 setLongitude:v6];
    [v7 setCoarse:0];
  }
  [v7 setPostalAddress:*(void *)(a1 + 40)];
}

- (id)placemarksForAddressDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__778;
  long long v18 = __Block_byref_object_dispose__779;
  id v19 = 0;
  double v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CLSLocationCache_placemarksForAddressDictionary___block_invoke;
  v10[3] = &unk_1E6910548;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v13 = &v14;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __51__CLSLocationCache_placemarksForAddressDictionary___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (void *)v5[8];
  double v22 = @"addressDictionaryString";
  id v8 = [v5 _stringifyAddressDictionaryValues:v6];
  v23[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  double v10 = [v7 predicateWithSubstitutionVariables:v9];

  [v4 setFetchLimit:1];
  [v4 setPredicate:v10];
  id v11 = *(void **)(a1 + 48);
  id v19 = 0;
  id v12 = [v11 executeFetchRequest:v4 error:&v19];
  id v13 = v19;
  if (v12 && [v12 count] == 1)
  {
    uint64_t v14 = [v12 objectAtIndexedSubscript:0];
    id v15 = [v14 placemarks];

    uint64_t v16 = [*(id *)(a1 + 32) _litePlacemarksFromManagedPlacemarks:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemarks, error %@", buf, 0xCu);
    }
  }
}

- (void)setPlacemarks:(id)a3 forAddressDictionary:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CLSLocationCache *)self _stringifyAddressDictionaryValues:a4];
  entryPredicateWithAddressBookDictionaryTemplate = self->_entryPredicateWithAddressBookDictionaryTemplate;
  uint64_t v16 = @"addressDictionaryString";
  v17[0] = v7;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  double v10 = [(NSPredicate *)entryPredicateWithAddressBookDictionaryTemplate predicateWithSubstitutionVariables:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__CLSLocationCache_setPlacemarks_forAddressDictionary___block_invoke;
  v13[3] = &unk_1E690EB88;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(CLSLocationCache *)self _setPlacemarks:v12 forEntryWithPredicate:v10 entrySetupBlock:v13];
}

void __55__CLSLocationCache_setPlacemarks_forAddressDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) firstObject];
  id v4 = [v3 location];

  if (v4)
  {
    [v4 coordinate];
    double v6 = v5;
    objc_msgSend(v7, "setLatitude:");
    [v7 setLongitude:v6];
    [v7 setCoarse:0];
  }
  [v7 setAddressDictionaryString:*(void *)(a1 + 40)];
}

- (id)placemarksForLocationAddress:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__778;
  long long v18 = __Block_byref_object_dispose__779;
  id v19 = 0;
  double v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__CLSLocationCache_placemarksForLocationAddress___block_invoke;
  v10[3] = &unk_1E6910548;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v13 = &v14;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __49__CLSLocationCache_placemarksForLocationAddress___block_invoke(void *a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 80);
  id v21 = @"address";
  v22[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v8 = [v6 predicateWithSubstitutionVariables:v7];

  [v4 setFetchLimit:1];
  [v4 setPredicate:v8];
  double v9 = (void *)a1[6];
  id v18 = 0;
  double v10 = [v9 executeFetchRequest:v4 error:&v18];
  id v11 = v18;
  if (v10 && [v10 count] == 1)
  {
    id v12 = [v10 objectAtIndexedSubscript:0];
    id v13 = (void *)a1[4];
    uint64_t v14 = [v12 placemarks];
    uint64_t v15 = [v13 _litePlacemarksFromManagedPlacemarks:v14];
    uint64_t v16 = *(void *)(a1[7] + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (!*(void *)(*(void *)(a1[7] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not unarchive litePlacemarks, error %@", buf, 0xCu);
    }
  }
}

- (void)setPlacemarks:(id)a3 forLocationAddress:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  entryPredicateWithAddressTemplate = self->_entryPredicateWithAddressTemplate;
  uint64_t v16 = @"address";
  v17[0] = v7;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  double v10 = [(NSPredicate *)entryPredicateWithAddressTemplate predicateWithSubstitutionVariables:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__CLSLocationCache_setPlacemarks_forLocationAddress___block_invoke;
  v13[3] = &unk_1E690EB88;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(CLSLocationCache *)self _setPlacemarks:v12 forEntryWithPredicate:v10 entrySetupBlock:v13];
}

void __53__CLSLocationCache_setPlacemarks_forLocationAddress___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) firstObject];
  id v4 = [v3 location];

  if (v4)
  {
    [v4 coordinate];
    double v6 = v5;
    objc_msgSend(v7, "setLatitude:");
    [v7 setLongitude:v6];
    [v7 setCoarse:0];
  }
  [v7 setAddress:*(void *)(a1 + 40)];
}

- (id)placemarksForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4 queryAccuracy:(double)a5
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__778;
  double v25 = __Block_byref_object_dispose__779;
  id v26 = 0;
  double v10 = [(CLSDBCache *)self managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__CLSLocationCache_placemarksForLocationCoordinate_withHorizontalAccuracy_queryAccuracy___block_invoke;
  v14[3] = &unk_1E690EB60;
  v14[4] = self;
  CLLocationDegrees v17 = latitude;
  CLLocationDegrees v18 = longitude;
  double v19 = a4;
  double v20 = a5;
  id v11 = v10;
  id v15 = v11;
  uint64_t v16 = &v21;
  [v11 performBlockAndWait:v14];
  id v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __89__CLSLocationCache_placemarksForLocationCoordinate_withHorizontalAccuracy_queryAccuracy___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  double v5 = objc_msgSend(*(id *)(a1 + 32), "predicateForCoordinate:withHorizontalAccuracy:queryAccuracy:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [v4 setPredicate:v5];
  double v6 = *(void **)(a1 + 40);
  id v15 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v15];
  id v8 = v15;
  if (v7 && [v7 count])
  {
    double v9 = objc_msgSend(*(id *)(a1 + 32), "nearestEntryForCoordinate:entries:", v7, *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v10 = *(void **)(a1 + 32);
    id v11 = [v9 placemarks];
    uint64_t v12 = [v10 _litePlacemarksFromManagedPlacemarks:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (id)placemarksForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  return -[CLSLocationCache placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "placemarksForLocationCoordinate:withHorizontalAccuracy:queryAccuracy:", a3.latitude, a3.longitude, a4, *MEMORY[0x1E4F1E6D8]);
}

- (void)setPlacemarks:(id)a3 forLocationCoordinate:(CLLocationCoordinate2D)a4 withHorizontalAccuracy:(double)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  v20[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v21.double latitude = latitude;
  v21.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v21))
  {
    uint64_t v10 = [MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:a5];
    entryPredicateWithCoordinateTemplate = self->_entryPredicateWithCoordinateTemplate;
    v19[0] = @"latitude";
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:latitude];
    v20[0] = v12;
    v19[1] = @"longitude";
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:longitude];
    v20[1] = v13;
    v19[2] = @"coarse";
    id v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
    v20[2] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    uint64_t v16 = [(NSPredicate *)entryPredicateWithCoordinateTemplate predicateWithSubstitutionVariables:v15];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __79__CLSLocationCache_setPlacemarks_forLocationCoordinate_withHorizontalAccuracy___block_invoke;
    v17[3] = &__block_descriptor_49_e31_v16__0__CLSLocationCacheEntry_8l;
    *(double *)&v17[4] = latitude;
    *(double *)&v17[5] = longitude;
    char v18 = v10;
    [(CLSLocationCache *)self _setPlacemarks:v9 forEntryWithPredicate:v16 entrySetupBlock:v17];
  }
}

void __79__CLSLocationCache_setPlacemarks_forLocationCoordinate_withHorizontalAccuracy___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setLatitude:v3];
  [v4 setLongitude:*(double *)(a1 + 40)];
  [v4 setCoarse:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setPlacemarks:(id)a3 forCLLocation:(id)a4
{
  id v6 = a4;
  id v13 = a3;
  [v6 coordinate];
  double v8 = v7;
  double v10 = v9;
  [v6 horizontalAccuracy];
  double v12 = v11;

  -[CLSLocationCache setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:](self, "setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:", v13, v8, v10, v12);
}

- (void)insertBatchesOfPlacemarks:(id)a3 forLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CLSDBCache *)self managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__CLSLocationCache_insertBatchesOfPlacemarks_forLocations___block_invoke;
  v12[3] = &unk_1E690EFB0;
  id v13 = v6;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = self;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [v9 performBlockAndWait:v12];
}

uint64_t __59__CLSLocationCache_insertBatchesOfPlacemarks_forLocations___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        double v12 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8 + v10, (void)v22);
        [v12 coordinate];
        if (v11)
        {
          double v15 = v13;
          double v16 = v14;
          if ([v11 count])
          {
            v28.double latitude = v15;
            v28.double longitude = v16;
            if (CLLocationCoordinate2DIsValid(v28))
            {
              CLLocationDegrees v17 = (void *)MEMORY[0x1E4F1C0A8];
              char v18 = +[CLSLocationCacheEntry entityName];
              double v19 = [v17 insertNewObjectForEntityForName:v18 inManagedObjectContext:*(void *)(a1 + 48)];

              [v19 setLatitude:v15];
              [v19 setLongitude:v16];
              objc_msgSend(v19, "setCoarse:", objc_msgSend(MEMORY[0x1E4F8A930], "locationIsCoarse:", v12));
              [v19 setUpdateTimestamp:v4];
              double v20 = [*(id *)(a1 + 56) _insertManagedPlacemarksForLitePlacemarks:v11 inContext:*(void *)(a1 + 48)];
              [v19 setPlacemarks:v20];
            }
          }
        }

        ++v10;
      }
      while (v7 != v10);
      v8 += v10;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  return [*(id *)(a1 + 56) _save];
}

- (void)setPlacemarks:(id)a3 forLocation:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CLSLocationCache *)self setPlacemarks:v15 forCLLocation:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      [v7 center];
      double v9 = v8;
      double v11 = v10;
      [v7 clsHorizontalAccuracy];
      double v13 = v12;

      -[CLSLocationCache setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:](self, "setPlacemarks:forLocationCoordinate:withHorizontalAccuracy:", v15, v9, v11, v13);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CLSLocationCache *)self setPlacemarks:v15 forAddressDictionary:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CLSLocationCache *)self setPlacemarks:v15 forLocationAddress:v6];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            double v14 = [v6 location];
            [(CLSLocationCache *)self setPlacemarks:v15 forCLLocation:v14];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(CLSLocationCache *)self setPlacemarks:v15 forPostalAddress:v6];
            }
          }
        }
      }
    }
  }
}

- (BOOL)hasCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  double v8 = [(CLSDBCache *)self managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__CLSLocationCache_hasCoordinate_withHorizontalAccuracy___block_invoke;
  v12[3] = &unk_1E690EB18;
  void v12[4] = self;
  CLLocationDegrees v15 = latitude;
  CLLocationDegrees v16 = longitude;
  double v17 = a4;
  id v9 = v8;
  id v13 = v9;
  double v14 = &v18;
  [v9 performBlockAndWait:v12];
  char v10 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __57__CLSLocationCache_hasCoordinate_withHorizontalAccuracy___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  double v3 = +[CLSLocationCacheEntry entityName];
  double v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(*(id *)(a1 + 32), "predicateForCoordinate:withHorizontalAccuracy:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [v4 setPredicate:v5];
  id v6 = *(void **)(a1 + 40);
  id v9 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v9];
  id v8 = v9;
  if (v7 && [v7 count]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)hasRegion:(id)a3
{
  id v4 = a3;
  [v4 center];
  double v6 = v5;
  double v8 = v7;
  [v4 clsHorizontalAccuracy];
  double v10 = v9;

  return -[CLSLocationCache hasCoordinate:withHorizontalAccuracy:](self, "hasCoordinate:withHorizontalAccuracy:", v6, v8, v10);
}

- (id)nearestEntryForCoordinate:(CLLocationCoordinate2D)a3 entries:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CLLocationCoordinate2D v24 = a3;
  id v4 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = 0;
    uint64_t v8 = *(void *)v21;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "latitude", 0, 0);
        CLLocationDegrees v13 = v12;
        [v11 longitude];
        CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v14);
        CLLocationCoordinate2DGetDistanceFrom();
        if (v16 < v9)
        {
          double v17 = v16;
          id v18 = v11;

          double v7 = v18;
          double v9 = v17;
        }
      }
      uint64_t v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, *(void *)&v15.latitude, *(void *)&v15.longitude);
    }
    while (v6);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)predicateForCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4 queryAccuracy:(double)a5
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  CLLocationDegrees v6 = a3.latitude * 0.0174532925;
  CLLocationDegrees v7 = a3.longitude * 0.0174532925;
  double v8 = a5 / 6378137.0;
  double v9 = (v6 + a5 / 6378137.0) * 57.2957795;
  double v10 = (v7 - v8) * 57.2957795;
  double v11 = (v6 - v8) * 57.2957795;
  double v12 = (v7 + v8) * 57.2957795;
  if (v11 <= v9) {
    double v13 = v11;
  }
  else {
    double v13 = v9;
  }
  if (v11 <= v9) {
    double v11 = v9;
  }
  if (v12 <= v10) {
    double v14 = v12;
  }
  else {
    double v14 = v10;
  }
  if (v12 <= v10) {
    double v12 = v10;
  }
  CLLocationCoordinate2D v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%f <= latitude && latitude <= %f && %f <= longitude && longitude <= %f", *(void *)&v13, *(void *)&v11, *(void *)&v14, *(void *)&v12);
  unsigned int v16 = [MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:a4];
  double v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"coarse == %d", v16);
  id v18 = (void *)MEMORY[0x1E4F28BA0];
  v22[0] = v15;
  v22[1] = v17;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  long long v20 = [v18 andPredicateWithSubpredicates:v19];

  return v20;
}

- (id)predicateForCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  return -[CLSLocationCache predicateForCoordinate:withHorizontalAccuracy:queryAccuracy:](self, "predicateForCoordinate:withHorizontalAccuracy:queryAccuracy:", a3.latitude, a3.longitude, a4, *MEMORY[0x1E4F1E6D8]);
}

- (id)dataModelName
{
  return @"CLSLocationCacheModel";
}

- (void)invalidateCacheForLocationCoordinate:(CLLocationCoordinate2D)a3 withHorizontalAccuracy:(double)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  char v7 = [MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:a4];
  double v8 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__CLSLocationCache_invalidateCacheForLocationCoordinate_withHorizontalAccuracy___block_invoke;
  v10[3] = &unk_1E690EAF0;
  CLLocationDegrees v12 = latitude;
  CLLocationDegrees v13 = longitude;
  char v14 = v7;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [v9 performBlockAndWait:v10];
}

void __80__CLSLocationCache_invalidateCacheForLocationCoordinate_withHorizontalAccuracy___block_invoke(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  double v3 = +[CLSLocationCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 72);
  v17[0] = @"latitude";
  CLLocationDegrees v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  v18[0] = v6;
  v17[1] = @"longitude";
  char v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 56)];
  v18[1] = v7;
  void v17[2] = @"coarse";
  double v8 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v18[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  double v10 = [v5 predicateWithSubstitutionVariables:v9];

  [v4 setFetchLimit:1];
  [v4 setPredicate:v10];
  id v11 = *(void **)(a1 + 40);
  id v16 = 0;
  CLLocationDegrees v12 = [v11 executeFetchRequest:v4 error:&v16];
  id v13 = v16;
  if ([v12 count] == 1)
  {
    char v14 = *(void **)(a1 + 40);
    CLLocationCoordinate2D v15 = [v12 objectAtIndexedSubscript:0];
    [v14 deleteObject:v15];

    [*(id *)(a1 + 32) _save];
  }
}

- (CLSLocationCache)initWithURL:(id)a3 dataModelName:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CLSLocationCache;
  id v4 = [(CLSDBCache *)&v16 initWithURL:a3 dataModelName:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(postalAddress = $postalAddress)"];
    entryPredicateWithContactsPostalAddressTemplate = v4->_entryPredicateWithContactsPostalAddressTemplate;
    v4->_entryPredicateWithContactsPostalAddressTemplate = (NSPredicate *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(addressDictionaryString = $addressDictionaryString)"];
    entryPredicateWithAddressBookDictionaryTemplate = v4->_entryPredicateWithAddressBookDictionaryTemplate;
    v4->_entryPredicateWithAddressBookDictionaryTemplate = (NSPredicate *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(address = $address)"];
    entryPredicateWithAddressTemplate = v4->_entryPredicateWithAddressTemplate;
    v4->_entryPredicateWithAddressTemplate = (NSPredicate *)v9;

    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(CLLocationDegrees latitude = $latitude) && (longitude = $longitude) && (coarse = $coarse)"];
    entryPredicateWithCoordinateTemplate = v4->_entryPredicateWithCoordinateTemplate;
    v4->_entryPredicateWithCoordinateTemplate = (NSPredicate *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(muid = $muid)"];
    entryPredicateWithMUID = v4->_entryPredicateWithMUID;
    v4->_entryPredicateWithMUID = (NSPredicate *)v13;
  }
  return v4;
}

+ (BOOL)cachedRegion:(id)a3 isMatchingOtherRegion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F8A930];
  [v5 clsHorizontalAccuracy];
  LODWORD(v7) = objc_msgSend(v7, "horizontalAccuracyIsCoarse:");
  double v8 = (void *)MEMORY[0x1E4F8A930];
  [v6 clsHorizontalAccuracy];
  if (v7 == objc_msgSend(v8, "horizontalAccuracyIsCoarse:"))
  {
    double v10 = *MEMORY[0x1E4F1E6D8];
    [v5 center];
    double v12 = v11;
    double v14 = v13;
    [v6 center];
    double v17 = (v12 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    double v18 = (v14 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    double v19 = (v12 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    double v20 = (v14 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    if (v19 <= v17) {
      double v21 = (v12 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    }
    else {
      double v21 = (v12 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    }
    if (v19 <= v17) {
      double v19 = (v12 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    }
    if (v20 <= v18) {
      double v22 = (v14 * 0.0174532925 + v10 / 6378137.0) * 57.2957795;
    }
    else {
      double v22 = (v14 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    }
    if (v20 <= v18) {
      double v20 = (v14 * 0.0174532925 - v10 / 6378137.0) * 57.2957795;
    }
    BOOL v23 = v21 <= v15;
    if (v15 > v19) {
      BOOL v23 = 0;
    }
    if (v22 > v16) {
      BOOL v23 = 0;
    }
    BOOL v9 = v16 <= v20 && v23;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)defaultCacheName
{
  return @"CLSLocationCache";
}

@end