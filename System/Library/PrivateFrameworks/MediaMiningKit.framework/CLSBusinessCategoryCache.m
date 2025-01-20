@interface CLSBusinessCategoryCache
- (BOOL)hasRegion:(id)a3;
- (CLSBusinessCategoryCache)initWithURL:(id)a3 dataModelName:(id)a4;
- (NSPredicate)predicateEntryWithUpdateTimestamp;
- (id)_businessItemInRegion:(id)a3 matchingCategories:(id)a4 maximumDistance:(double)a5 forBusinessItems:(id)a6;
- (id)_fetchBusinessItemsForMUIDs:(id)a3;
- (id)_fetchedBusinessItemByMUIDForBusinessItems:(id)a3;
- (id)businessItemFromManagedObject:(id)a3;
- (id)businessItemsForMuid:(unint64_t)a3;
- (id)businessItemsForMuids:(id)a3;
- (id)businessItemsForRegion:(id)a3;
- (id)businessItemsInRegion:(id)a3 categories:(id)a4 maximumDistance:(double)a5;
- (id)dataModelName;
- (id)nearestItemForRegion:(id)a3 inItems:(id)a4;
- (id)predicateForEntryNearbyRegion:(id)a3;
- (id)predicateForRegion:(id)a3;
- (id)updateBusinessItems:(id)a3;
- (unint64_t)numberOfBusinessItemsForRegion:(id)a3;
- (void)_updateManagedBusinessItem:(id)a3 withBusinessItem:(id)a4;
- (void)insertBatchesOfBusinessItems:(id)a3 forRegions:(id)a4;
- (void)invalidateCacheForGeoServiceProviderChangeToProvider:(id)a3;
- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3;
@end

@implementation CLSBusinessCategoryCache

- (void).cxx_destruct
{
}

- (NSPredicate)predicateEntryWithUpdateTimestamp
{
  return self->_predicateEntryWithUpdateTimestamp;
}

- (id)updateBusinessItems:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = [(CLSDBCache *)self managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke;
  v13[3] = &unk_1E690EFB0;
  id v14 = v4;
  v15 = self;
  id v7 = v5;
  id v16 = v7;
  v17 = v6;
  id v8 = v6;
  id v9 = v4;
  [v8 performBlockAndWait:v13];
  v10 = v17;
  id v11 = v7;

  return v11;
}

void __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v31 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v47 count:16];
  unint64_t v5 = 0x1E4F28000uLL;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v9, "muid", v31));
        [v2 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v6);
  }

  id v11 = (id *)v31;
  v12 = *(void **)(v31 + 40);
  v13 = [v2 allKeys];
  id v14 = [v12 _fetchBusinessItemsForMUIDs:v13];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v14;
  uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v33)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        v18 = objc_msgSend(*(id *)(v5 + 3792), "numberWithUnsignedLongLong:", objc_msgSend(v17, "muid", v31));
        v19 = [v2 objectForKeyedSubscript:v18];
        if (v19)
        {
          v20 = v2;
          [v2 removeObjectForKey:v18];
          v21 = [v19 name];
          [v17 setName:v21];

          objc_msgSend(v17, "setVenueCapacity:", objc_msgSend(v19, "venueCapacity"));
          v22 = [v19 businessCategories];
          if ([v22 count])
          {
            v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v22];
            [v23 allObjects];
            v25 = uint64_t v24 = v15;
            v26 = [v25 componentsJoinedByString:@"_#_"];

            uint64_t v15 = v24;
            id v11 = (id *)v31;
          }
          else
          {
            v26 = 0;
          }
          [v17 setBusinessCategories:v26];

          v27 = [v11[5] businessItemFromManagedObject:v17];
          if (v27) {
            [v11[6] addObject:v27];
          }

          unint64_t v5 = 0x1E4F28000;
          v2 = v20;
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v33);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke_2;
  v34[3] = &unk_1E690F050;
  id v28 = v11[7];
  id v29 = v11[5];
  id v30 = v11[6];
  id v35 = v28;
  id v36 = v29;
  id v37 = v30;
  [v2 enumerateKeysAndObjectsUsingBlock:v34];
  [v11[5] _save];
}

void __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = a3;
  uint64_t v6 = +[CLSManagedBusinessItem entityName];
  id v8 = [v4 insertNewObjectForEntityForName:v6 inManagedObjectContext:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) _updateManagedBusinessItem:v8 withBusinessItem:v5];
  uint64_t v7 = [*(id *)(a1 + 40) businessItemFromManagedObject:v8];
  if (v7) {
    [*(id *)(a1 + 48) addObject:v7];
  }
}

- (void)_updateManagedBusinessItem:(id)a3 withBusinessItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 region];
  id v8 = [v6 categories];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  id v9 = GEOSpatialLookupAllCategories();
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = ___CLSBusinessCategoryCacheSerializeCategories_block_invoke;
  v26 = &unk_1E690F078;
  id v10 = v8;
  id v27 = v10;
  id v28 = &v29;
  [v9 enumerateObjectsUsingBlock:&v23];
  uint64_t v11 = *((unsigned int *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  objc_msgSend(v7, "center", v23, v24, v25, v26);
  double v13 = v12;
  double v15 = v14;
  objc_msgSend(v5, "setMuid:", objc_msgSend(v6, "muid"));
  objc_msgSend(v5, "setVenueCapacity:", objc_msgSend(v6, "venueCapacity"));
  [v5 setLatitude:v13];
  [v5 setLongitude:v15];
  [v7 radius];
  objc_msgSend(v5, "setRadius:");
  [v5 setCategories:v11];
  id v16 = [v6 name];
  [v5 setName:v16];

  v17 = [v6 businessCategories];
  if ([v17 count])
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v17];
    v19 = [v18 allObjects];
    v20 = [v19 componentsJoinedByString:@"_#_"];
  }
  else
  {
    v20 = 0;
  }
  [v5 setBusinessCategories:v20];

  v21 = [v6 geoServiceProvider];
  [v5 setGeoServiceProvider:v21];

  v22 = [v6 isoCountryCode];
  [v5 setIsoCountryCode:v22];
}

- (id)_fetchBusinessItemsForMUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1297;
  v18 = __Block_byref_object_dispose__1298;
  id v19 = 0;
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__CLSBusinessCategoryCache__fetchBusinessItemsForMUIDs___block_invoke;
  v10[3] = &unk_1E690F028;
  id v6 = v4;
  id v11 = v6;
  double v13 = &v14;
  id v7 = v5;
  id v12 = v7;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __56__CLSBusinessCategoryCache__fetchBusinessItemsForMUIDs___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSManagedBusinessItem entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"muid IN %@", a1[4]];
  [v4 setPredicate:v5];

  id v6 = (void *)a1[5];
  id v11 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v4 error:&v11];
  id v8 = v11;
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
}

- (unint64_t)numberOfBusinessItemsForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CLSBusinessCategoryCache_numberOfBusinessItemsForRegion___block_invoke;
  v10[3] = &unk_1E6910548;
  void v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  double v13 = &v14;
  [v7 performBlockAndWait:v10];
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __59__CLSBusinessCategoryCache_numberOfBusinessItemsForRegion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSBusinessCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setFetchLimit:1];
  id v5 = [*(id *)(a1 + 32) predicateForRegion:*(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 48);
  id v18 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v18];
  id v8 = v18;
  if (v7 && [v7 count])
  {
    uint64_t v9 = [v7 firstObject];
    id v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = +[CLSManagedBusinessItem entityName];
    id v12 = [v10 fetchRequestWithEntityName:v11];

    double v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entry == %@)", v9];
    [v12 setPredicate:v13];
    uint64_t v14 = *(void **)(a1 + 48);
    id v17 = v8;
    uint64_t v15 = [v14 countForFetchRequest:v12 error:&v17];
    id v16 = v17;

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
    id v8 = v16;
  }
}

- (BOOL)hasRegion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__CLSBusinessCategoryCache_hasRegion___block_invoke;
  v9[3] = &unk_1E6910548;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = v5;
  id v11 = v7;
  id v12 = &v13;
  [v7 performBlockAndWait:v9];
  LOBYTE(v5) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v5;
}

void __38__CLSBusinessCategoryCache_hasRegion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSBusinessCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [*(id *)(a1 + 32) predicateForRegion:*(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 48);
  id v11 = 0;
  uint64_t v7 = [v6 countForFetchRequest:v4 error:&v11];
  id v8 = v11;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  char v10 = !v9;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
}

- (id)businessItemFromManagedObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  [v3 latitude];
  CLLocationDegrees v6 = v5;
  [v3 longitude];
  CLLocationDegrees v8 = v7;
  [v3 radius];
  double v10 = v9;
  uint64_t v11 = [v3 muid];
  CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(v6, v8);
  id v13 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v15 = [v14 UUIDString];
  char v16 = objc_msgSend(v13, "initWithCenter:radius:identifier:", v15, v12.latitude, v12.longitude, v10);

  LODWORD(v14) = [v3 categories];
  id v17 = [MEMORY[0x1E4F1CA48] array];
  id v18 = GEOSpatialLookupAllCategories();
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = ___CLSBusinessCategoryCacheDeserializeCategories_block_invoke;
  int v32 = &unk_1E690F0A0;
  int v34 = (int)v14;
  id v19 = v17;
  id v33 = v19;
  [v18 enumerateObjectsUsingBlock:&v29];

  if (v19)
  {
    v20 = [CLSBusinessItem alloc];
    v21 = -[CLSBusinessItem initWithName:region:categories:](v20, "initWithName:region:categories:", v4, v16, v19, v29, v30, v31, v32);
    [(CLSBusinessItem *)v21 setMuid:v11];
    [(CLSBusinessItem *)v21 setCached:1];
    v22 = [v3 businessCategories];
    uint64_t v23 = v22;
    if (v22)
    {
      uint64_t v24 = [v22 componentsSeparatedByString:@"_#_"];
    }
    else
    {
      uint64_t v24 = 0;
    }
    [(CLSBusinessItem *)v21 setBusinessCategories:v24];

    -[CLSBusinessItem setVenueCapacity:](v21, "setVenueCapacity:", [v3 venueCapacity]);
    id v27 = [v3 geoServiceProvider];
    [(CLSBusinessItem *)v21 setGeoServiceProvider:v27];

    v26 = [v3 isoCountryCode];
    [(CLSBusinessItem *)v21 setIsoCountryCode:v26];
  }
  else
  {
    v25 = +[CLSLogging sharedLogging];
    v26 = [v25 loggingConnection];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_1D2150000, v26, OS_LOG_TYPE_ERROR, "An error occurred unarchiving categories value for business item", (uint8_t *)&v29, 2u);
    }
    v21 = 0;
  }

  return v21;
}

- (id)businessItemsForMuids:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__1297;
  id v19 = __Block_byref_object_dispose__1298;
  id v20 = 0;
  double v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__CLSBusinessCategoryCache_businessItemsForMuids___block_invoke;
  v10[3] = &unk_1E6910548;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v13 = self;
  uint64_t v14 = &v15;
  id v12 = v7;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __50__CLSBusinessCategoryCache_businessItemsForMuids___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSManagedBusinessItem entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  double v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"muid in %@", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 40);
  id v22 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v22];
  id v8 = v22;
  if ([v7 count])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(a1 + 48) businessItemFromManagedObject:*(void *)(*((void *)&v18 + 1) + 8 * v16)];
          if (v17) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

- (id)businessItemsForMuid:(unint64_t)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1297;
  long long v18 = __Block_byref_object_dispose__1298;
  id v19 = 0;
  double v5 = [(CLSDBCache *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CLSBusinessCategoryCache_businessItemsForMuid___block_invoke;
  v9[3] = &unk_1E690F000;
  unint64_t v13 = a3;
  id v6 = v5;
  id v11 = self;
  id v12 = &v14;
  id v10 = v6;
  [v6 performBlockAndWait:v9];
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

void __49__CLSBusinessCategoryCache_businessItemsForMuid___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSManagedBusinessItem entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  double v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"muid == %lu", *(void *)(a1 + 56));
  [v4 setPredicate:v5];

  [v4 setFetchLimit:1];
  id v6 = *(void **)(a1 + 32);
  id v13 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v13];
  id v8 = v13;
  if ([v7 count])
  {
    uint64_t v9 = [v7 firstObject];
    uint64_t v10 = [*(id *)(a1 + 40) businessItemFromManagedObject:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)_businessItemInRegion:(id)a3 matchingCategories:(id)a4 maximumDistance:(double)a5 forBusinessItems:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = v10;
  v39.latitude = 0.0;
  *(void *)&v39.longitude = &v39;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  id v13 = GEOSpatialLookupAllCategories();
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  id v35 = ___CLSBusinessCategoryCacheSerializeCategories_block_invoke;
  id v36 = &unk_1E690F078;
  id v14 = v12;
  id v37 = v14;
  long long v38 = &v39;
  [v13 enumerateObjectsUsingBlock:&v33];
  int v15 = *(_DWORD *)(*(void *)&v39.longitude + 24);

  _Block_object_dispose(&v39, 8);
  uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
  [v9 center];
  uint64_t v33 = v17;
  uint64_t v34 = v18;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v11;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v23, "categories", (void)v29) & v15) != 0)
        {
          v39.latitude = 0.0;
          v39.longitude = 0.0;
          [v23 latitude];
          CLLocationDegrees v25 = v24;
          [v23 longitude];
          CLLocationCoordinate2D v39 = CLLocationCoordinate2DMake(v25, v26);
          CLLocationCoordinate2DGetDistanceFrom();
          if (v27 <= a5) {
            [v16 addObject:v23];
          }
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v20);
  }

  return v16;
}

- (id)businessItemsInRegion:(id)a3 categories:(id)a4 maximumDistance:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    id v10 = [MEMORY[0x1E4F1CA80] set];
    id v11 = [(CLSDBCache *)self managedObjectContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__CLSBusinessCategoryCache_businessItemsInRegion_categories_maximumDistance___block_invoke;
    v17[3] = &unk_1E690EFD8;
    v17[4] = self;
    id v18 = v8;
    id v19 = v11;
    id v20 = v9;
    double v22 = a5;
    id v12 = v10;
    id v21 = v12;
    id v13 = v11;
    [v13 performBlockAndWait:v17];
    id v14 = v21;
    id v15 = v12;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v15;
}

void __77__CLSBusinessCategoryCache_businessItemsInRegion_categories_maximumDistance___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSBusinessCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  double v5 = [*(id *)(a1 + 32) predicateForEntryNearbyRegion:*(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 48);
  id v30 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v30];
  id v8 = v30;
  if (v7 && [v7 count])
  {
    uint64_t v9 = [*(id *)(a1 + 32) nearestItemForRegion:*(void *)(a1 + 40) inItems:v7];
    id v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = +[CLSManagedBusinessItem entityName];
    id v12 = [v10 fetchRequestWithEntityName:v11];

    double v24 = (void *)v9;
    uint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entry == %@)", v9];
    objc_msgSend(v12, "setPredicate:");
    id v13 = *(void **)(a1 + 48);
    id v29 = v8;
    id v14 = [v13 executeFetchRequest:v12 error:&v29];
    id v22 = v29;

    id v15 = [*(id *)(a1 + 32) _businessItemInRegion:*(void *)(a1 + 40) matchingCategories:*(void *)(a1 + 56) maximumDistance:v14 forBusinessItems:*(double *)(a1 + 72)];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(a1 + 32) businessItemFromManagedObject:*(void *)(*((void *)&v25 + 1) + 8 * v19)];
          if (v20) {
            [*(id *)(a1 + 64) addObject:v20];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v17);
    }

    id v8 = v22;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138477827;
    uint64_t v32 = v21;
    _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[BusinessCache] No Entry for region %{private}@", buf, 0xCu);
  }
}

- (id)businessItemsForRegion:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1297;
  uint64_t v18 = __Block_byref_object_dispose__1298;
  id v19 = 0;
  double v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CLSBusinessCategoryCache_businessItemsForRegion___block_invoke;
  v10[3] = &unk_1E6910548;
  void v10[4] = self;
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

void __51__CLSBusinessCategoryCache_businessItemsForRegion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSBusinessCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setFetchLimit:1];
  double v5 = [*(id *)(a1 + 32) predicateForRegion:*(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 48);
  id v32 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v32];
  id v8 = v32;
  if (v7 && [v7 count])
  {
    uint64_t v9 = [v7 firstObject];
    id v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = +[CLSManagedBusinessItem entityName];
    id v12 = [v10 fetchRequestWithEntityName:v11];

    long long v26 = (void *)v9;
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entry == %@)", v9];
    [v12 setPredicate:v13];
    uint64_t v14 = *(void **)(a1 + 48);
    id v31 = v8;
    id v15 = [v14 executeFetchRequest:v12 error:&v31];
    id v25 = v31;

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v15;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          double v24 = [*(id *)(a1 + 32) businessItemFromManagedObject:*(void *)(*((void *)&v27 + 1) + 8 * v23)];
          if (v24) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v24];
          }

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v21);
    }

    id v8 = v25;
  }
}

- (id)nearestItemForRegion:(id)a3 inItems:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 center];
  uint64_t v29 = v7;
  uint64_t v30 = v8;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v26;
    double v14 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "latitude", 0, 0, (void)v25);
        CLLocationDegrees v18 = v17;
        [v16 longitude];
        CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v18, v19);
        CLLocationCoordinate2DGetDistanceFrom();
        if (v21 < v14)
        {
          double v22 = v21;
          id v23 = v16;

          id v12 = v23;
          double v14 = v22;
        }
      }
      uint64_t v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16, *(void *)&v20.latitude, *(void *)&v20.longitude);
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)insertBatchesOfBusinessItems:(id)a3 forRegions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v9 = [v7 count];
      if (v9 == [v6 count])
      {
        uint64_t v10 = [(CLSDBCache *)self managedObjectContext];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __68__CLSBusinessCategoryCache_insertBatchesOfBusinessItems_forRegions___block_invoke;
        v12[3] = &unk_1E690EFB0;
        id v13 = v6;
        id v14 = v8;
        id v15 = v10;
        uint64_t v16 = self;
        id v11 = v10;
        [v11 performBlockAndWait:v12];
      }
    }
  }
}

uint64_t __68__CLSBusinessCategoryCache_insertBatchesOfBusinessItems_forRegions___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v27)
  {
    uint64_t v5 = 0;
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v6;
        id v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1D2602300]();
        uint64_t v32 = v5;
        uint64_t v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v5];
        uint64_t v9 = (void *)MEMORY[0x1E4F1C0A8];
        uint64_t v10 = +[CLSBusinessCacheEntry entityName];
        id v11 = [v9 insertNewObjectForEntityForName:v10 inManagedObjectContext:*(void *)(a1 + 48)];

        [v8 center];
        double v13 = v12;
        objc_msgSend(v11, "setLatitude:");
        [v11 setLongitude:v13];
        uint64_t v29 = v8;
        [v8 radius];
        objc_msgSend(v11, "setRadius:");
        long long v28 = v11;
        [v11 setUpdateTimestamp:v4];
        id v14 = [MEMORY[0x1E4F1CA80] set];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v15 = v7;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v34;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * v19);
              double v21 = (void *)MEMORY[0x1E4F1C0A8];
              double v22 = +[CLSManagedBusinessItem entityName];
              id v23 = [v21 insertNewObjectForEntityForName:v22 inManagedObjectContext:*(void *)(a1 + 48)];

              [*(id *)(a1 + 56) _updateManagedBusinessItem:v23 withBusinessItem:v20];
              [v14 addObject:v23];

              ++v19;
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v17);
        }
        uint64_t v5 = v32 + 1;

        [v28 setBusinessItems:v14];
        uint64_t v6 = v31 + 1;
      }
      while (v31 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v27);
  }

  return [*(id *)(a1 + 56) _save];
}

- (id)_fetchedBusinessItemByMUIDForBusinessItems:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "muid"));
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  double v12 = [(CLSBusinessCategoryCache *)self _fetchBusinessItemsForMUIDs:v5];
  double v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        uint64_t v20 = objc_msgSend(v19, "muid", (void)v23);
        double v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v20];
        [v13 setObject:v19 forKeyedSubscript:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  return v13;
}

- (id)predicateForRegion:(id)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v3 = a3;
  CLSCalculateRangeCoordinateForRegion(v3, (double *)&v16, (double *)&v15, (double *)&v14, (double *)&v13);
  id v4 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = v15;
  uint64_t v5 = v16;
  uint64_t v8 = v13;
  uint64_t v7 = v14;
  [v3 radius];
  uint64_t v10 = v9;

  id v11 = objc_msgSend(v4, "predicateWithFormat:", @"(latitude >= %f) && (latitude <= %f) && (longitude >= %f) && (longitude <= %f) && (radius == %f)", v5, v7, v6, v8, v10);
  return v11;
}

- (id)predicateForEntryNearbyRegion:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  CLSCalculateRangeCoordinateForRegion(a3, (double *)&v8, (double *)&v7, (double *)&v6, (double *)&v5);
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(latitude >= %f) && (latitude <= %f) && (longitude >= %f) && (longitude <= %f)", v8, v6, v7, v5);
  return v3;
}

- (void)invalidateCacheForGeoServiceProviderChangeToProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLSDBCache *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__CLSBusinessCategoryCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke;
  v8[3] = &unk_1E6910138;
  id v9 = v4;
  id v10 = v5;
  id v11 = self;
  id v6 = v5;
  id v7 = v4;
  [v6 performBlockAndWait:v8];
}

void __81__CLSBusinessCategoryCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke(uint64_t a1)
{
  v61[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSManagedBusinessItem entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"geoServiceProvider != %@", *(void *)(a1 + 32)];
  id v6 = [MEMORY[0x1E4F8AB68] autoNaviCountryCode];
  if ([MEMORY[0x1E4F8AB68] isAutoNaviRevGeoProvider:*(void *)(a1 + 32)]) {
    id v7 = @"isoCountryCode == %@";
  }
  else {
    id v7 = @"isoCountryCode != %@";
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v7, v6);
  id v9 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v48 = (void *)v8;
  v61[0] = v8;
  v61[1] = v5;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  id v11 = [v9 andPredicateWithSubpredicates:v10];

  [v4 setPredicate:v11];
  double v12 = *(void **)(a1 + 40);
  id v55 = 0;
  uint64_t v13 = [v12 executeFetchRequest:v4 error:&v55];
  id v14 = v55;
  if ([v13 count])
  {
    v46 = v6;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v16 = +[CLSBusinessCacheEntry entityName];
    uint64_t v17 = [v15 fetchRequestWithEntityName:v16];

    uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY businessItems IN %@", v13];

    long long v44 = (void *)v18;
    [v17 setPredicate:v18];
    long long v45 = v17;
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v17];
    [v19 setResultType:2];
    uint64_t v20 = *(void **)(a1 + 40);
    id v54 = v14;
    uint64_t v43 = v19;
    double v21 = [v20 executeRequest:v19 error:&v54];
    id v22 = v54;

    long long v23 = +[CLSLogging sharedLogging];
    long long v24 = [v23 loggingConnection];

    v47 = v5;
    long long v42 = v4;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v22;
        _os_log_error_impl(&dword_1D2150000, v24, OS_LOG_TYPE_ERROR, "Failed to batch-delete business cache entries: Error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      long long v25 = [v21 result];
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v58 = v25;
      __int16 v59 = 2112;
      uint64_t v60 = v26;
      _os_log_impl(&dword_1D2150000, v24, OS_LOG_TYPE_INFO, "Batch deleted %@ business cache entries, for provider %@", buf, 0x16u);
    }
    long long v27 = v21;

    long long v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
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
          long long v34 = [*(id *)(*((void *)&v50 + 1) + 8 * i) objectID];
          [v28 addObject:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v31);
    }

    long long v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithObjectIDs:v28];
    long long v36 = *(void **)(a1 + 40);
    id v49 = v22;
    long long v37 = [v36 executeRequest:v35 error:&v49];
    id v14 = v49;

    long long v38 = +[CLSLogging sharedLogging];
    long long v39 = [v38 loggingConnection];

    if (v14)
    {
      uint64_t v5 = v47;
      id v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v14;
        _os_log_error_impl(&dword_1D2150000, v39, OS_LOG_TYPE_ERROR, "Failed to batch-delete business cache entries: Error: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v5 = v47;
      id v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        long long v40 = [v37 result];
        uint64_t v41 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        id v58 = v40;
        __int16 v59 = 2112;
        uint64_t v60 = v41;
        _os_log_impl(&dword_1D2150000, v39, OS_LOG_TYPE_INFO, "Batch deleted %@ business items, for provider %@", buf, 0x16u);
      }
    }

    [*(id *)(a1 + 48) _save];
    id v11 = v44;
    id v6 = v46;
  }
}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
  uint64_t v5 = [(CLSDBCache *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CLSBusinessCategoryCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke;
  v7[3] = &unk_1E69104D0;
  double v9 = a3;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __72__CLSBusinessCategoryCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSBusinessCacheEntry entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = [*(id *)(a1 + 32) predicateEntryWithUpdateTimestamp];
  double v21 = @"updateTimestamp";
  id v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  v22[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v8 = [v5 predicateWithSubstitutionVariables:v7];

  [v4 setPredicate:v8];
  double v9 = [*(id *)(a1 + 32) managedObjectContext];
  id v20 = 0;
  id v10 = [v9 executeFetchRequest:v4 error:&v20];
  id v19 = v20;

  if (v10)
  {
    uint64_t v11 = [v10 count];
    if (v11)
    {
      unint64_t v12 = v11;
      uint64_t v13 = 0;
      do
      {
        id v14 = (void *)MEMORY[0x1D2602300]();
        unint64_t v15 = 0;
        do
        {
          uint64_t v16 = [v10 objectAtIndexedSubscript:v13 + v15];
          [*(id *)(a1 + 40) deleteObject:v16];
          unint64_t v17 = v13 + v15 + 1;

          unint64_t v18 = v15 + 1;
          if (v15 > 0x12) {
            break;
          }
          ++v15;
        }
        while (v17 < v12);
        [*(id *)(a1 + 32) _save];
        v13 += v18;
      }
      while (v17 < v12);
    }
  }
}

- (id)dataModelName
{
  return @"CLSBusinessCategoryCacheModel";
}

- (CLSBusinessCategoryCache)initWithURL:(id)a3 dataModelName:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLSBusinessCategoryCache;
  id v4 = [(CLSDBCache *)&v8 initWithURL:a3 dataModelName:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(updateTimestamp <= $updateTimestamp)"];
    predicateEntryWithUpdateTimestamp = v4->_predicateEntryWithUpdateTimestamp;
    v4->_predicateEntryWithUpdateTimestamp = (NSPredicate *)v5;
  }
  return v4;
}

@end