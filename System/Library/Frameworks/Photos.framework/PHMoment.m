@interface PHMoment
+ (BOOL)managedObjectSupportsSharingComposition;
+ (BOOL)managedObjectSupportsTrashedState;
+ (id)_fetchMomentUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4;
+ (id)entityKeyMap;
+ (id)fetchMomentUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4;
+ (id)fetchMomentUUIDByAssetUUIDForAssets:(id)a3 options:(id)a4;
+ (id)fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs:(id)a3 photoLibrary:(id)a4;
+ (id)fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:(id)a3 options:(id)a4;
+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)collectionHasFixedOrder;
- (BOOL)hasLocationInfo;
- (Class)changeRequestClass;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)modificationDate;
- (NSDate)representativeDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSString)subtitle;
- (PHMoment)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (double)approximateLatitude;
- (double)approximateLongitude;
- (double)gpsHorizontalAccuracy;
- (float)aggregationScore;
- (id)description;
- (id)localizedLocationNames;
- (id)localizedSubtitle;
- (int)timeZoneOffset;
- (signed)originatorState;
- (unsigned)processedLocation;
- (unsigned)sharingComposition;
- (void)_cacheLocationWithCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation PHMoment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);

  objc_storeStrong((id *)&self->_representativeDate, 0);
}

- (double)gpsHorizontalAccuracy
{
  return self->_gpsHorizontalAccuracy;
}

- (double)approximateLongitude
{
  return self->_approximateLongitude;
}

- (double)approximateLatitude
{
  return self->_approximateLatitude;
}

- (signed)originatorState
{
  return self->_originatorState;
}

- (unsigned)processedLocation
{
  return self->_processedLocation;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (float)aggregationScore
{
  return self->_aggregationScore;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)representativeDate
{
  return self->_representativeDate;
}

- (int)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHMoment;
  v3 = [(PHAssetCollection *)&v8 description];
  v4 = [(PHAssetCollection *)self startDate];
  v5 = [(PHAssetCollection *)self endDate];
  v6 = [v3 stringByAppendingFormat:@" [%@ - %@]", v4, v5];

  return v6;
}

- (void)_cacheLocationWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:"))
  {
    v6 = (CLLocation *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
    approximateLocation = self->super._approximateLocation;
    self->super._approximateLocation = v6;
  }
  else
  {
    approximateLocation = self->super._approximateLocation;
    self->super._approximateLocation = 0;
  }
}

- (NSDate)universalEndDate
{
  return self->super._endDate;
}

- (NSDate)universalStartDate
{
  return self->super._startDate;
}

- (NSDate)localEndDate
{
  return [(NSDate *)self->super._endDate dateByAddingTimeInterval:(double)self->_timeZoneOffset];
}

- (NSDate)localStartDate
{
  return [(NSDate *)self->super._startDate dateByAddingTimeInterval:(double)self->_timeZoneOffset];
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (BOOL)hasLocationInfo
{
  return 0;
}

- (id)localizedSubtitle
{
  return self->_subtitle;
}

- (id)localizedLocationNames
{
  return self->super._localizedLocationNames;
}

- (BOOL)canShowAvalancheStacks
{
  return 1;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 == 1;
}

- (PHMoment)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PHMoment;
  v9 = [(PHAssetCollection *)&v36 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"timeZoneOffset"];
    v9->_timeZoneOffset = [v10 intValue];

    uint64_t v11 = [v8 objectForKeyedSubscript:@"representativeDate"];
    representativeDate = v9->_representativeDate;
    v9->_representativeDate = (NSDate *)v11;

    v13 = [v8 objectForKeyedSubscript:@"approximateLatitude"];
    [v13 doubleValue];
    v9->_approximateLatitude = v14;

    v15 = [v8 objectForKeyedSubscript:@"approximateLongitude"];
    [v15 doubleValue];
    v9->_approximateLongitude = v16;

    CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v9->_approximateLatitude, v9->_approximateLongitude);
    -[PHMoment _cacheLocationWithCoordinate:](v9, "_cacheLocationWithCoordinate:", v17.latitude, v17.longitude);
    v9->super._assetCollectionType = 3;
    uint64_t v18 = [v8 objectForKeyedSubscript:@"modificationDate"];
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v18;

    v20 = [v8 objectForKeyedSubscript:@"aggregationScore"];
    [v20 floatValue];
    v9->_aggregationScore = v21;

    v22 = [v8 objectForKeyedSubscript:@"processedLocation"];
    v9->_processedLocation = [v22 unsignedShortValue];

    v23 = [v8 objectForKeyedSubscript:@"originatorState"];
    v9->_originatorState = [v23 shortValue];

    uint64_t v24 = [v8 objectForKeyedSubscript:@"subtitle"];
    subtitle = v9->_subtitle;
    v9->_subtitle = (NSString *)v24;

    uint64_t v26 = [v8 objectForKeyedSubscript:@"localizedLocationNames"];
    localizedLocationNames = v9->super._localizedLocationNames;
    v9->super._localizedLocationNames = (NSArray *)v26;

    v28 = [v8 objectForKeyedSubscript:@"gpsHorizontalAccuracy"];
    [v28 doubleValue];
    v9->_gpsHorizontalAccuracy = v29;

    v30 = [v8 objectForKeyedSubscript:@"sharingComposition"];
    v9->_sharingComposition = [v30 integerValue];

    uint64_t v31 = [v8 objectForKeyedSubscript:@"startDate"];
    startDate = v9->super._startDate;
    v9->super._startDate = (NSDate *)v31;

    uint64_t v33 = [v8 objectForKeyedSubscript:@"endDate"];
    endDate = v9->super._endDate;
    v9->super._endDate = (NSDate *)v33;
  }
  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 photoLibrary];
  id v8 = v7;
  if (v7)
  {
    *(void *)buf = 0;
    uint64_t v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__13014;
    float v21 = __Block_byref_object_dispose__13015;
    id v22 = 0;
    v9 = [v7 photoLibraryForCurrentQueueQoS];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__PHMoment_fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs_options___block_invoke;
    v13[3] = &unk_1E5848318;
    id v14 = v5;
    id v15 = v8;
    double v16 = buf;
    [v9 performBlockAndWait:v13];
    id v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_FAULT, "Can't fetch moment uuids by highlight uuid: no PHPhotoLibrary specified", buf, 2u);
    }

    id v10 = 0;
  }

  return v10;
}

void __81__PHMoment_fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs_options___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8A9B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) photoLibraryForCurrentQueueQoS];
  id v10 = 0;
  id v5 = [v2 batchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:v3 library:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v5;
    v9 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching moment uuids by highlight uuid: %@", buf, 0xCu);
    }
  }
}

+ (id)fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs:(id)a3 photoLibrary:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F8A7B0] fetchRequest];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  id v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"assetForFace.moment.uuid"];
  [v7 setName:@"momentUUID"];
  [v7 setExpression:v8];
  [v7 setExpressionResultType:700];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  id v10 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"personForFace.personUUID"];
  [v9 setName:@"personUUID"];
  [v9 setExpression:v10];
  [v9 setExpressionResultType:700];
  v33[0] = v7;
  v33[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [v6 setPropertiesToFetch:v11];

  v32[0] = v7;
  v32[1] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v6 setPropertiesToFetch:v12];

  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"personForFace.personUUID", v19];
  [v6 setPredicate:v13];
  [v6 setResultType:2];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = __Block_byref_object_copy__13014;
  v30 = __Block_byref_object_dispose__13015;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = [v5 photoLibrary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke;
  v20[3] = &unk_1E5848DA8;
  id v15 = v5;
  id v21 = v15;
  id v16 = v6;
  id v22 = v16;
  v23 = @"personUUID";
  uint64_t v24 = @"momentUUID";
  v25 = &v26;
  [v14 performBlockAndWait:v20];

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photoLibrary];
  uint64_t v3 = [v2 managedObjectContext];
  uint64_t v4 = *(void *)(a1 + 40);
  id v14 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v14];
  id v6 = v14;

  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke_2;
    v10[3] = &unk_1E5843EB8;
    uint64_t v11 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    id v12 = v7;
    uint64_t v13 = v8;
    [v5 enumerateObjectsUsingBlock:v10];

    id v9 = v11;
  }
  else
  {
    id v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching moment uuids by person uuids: %@", buf, 0xCu);
    }
  }
}

void __73__PHMoment_fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs_photoLibrary___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  id v9 = [v4 objectForKeyedSubscript:v3];
  id v5 = [v4 objectForKeyedSubscript:a1[5]];

  if (v9) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:v9];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      if ([v5 length]) {
        [v8 addObject:v5];
      }
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
      [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v8 forKeyedSubscript:v9];
    }
  }
}

+ (id)_fetchMomentUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    *(void *)buf = 0;
    uint64_t v17 = buf;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__13014;
    v20 = __Block_byref_object_dispose__13015;
    id v21 = 0;
    uint64_t v8 = [v6 photoLibraryForCurrentQueueQoS];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke;
    v12[3] = &unk_1E5848318;
    id v13 = v5;
    id v14 = v7;
    id v15 = buf;
    [v8 performBlockAndWait:v12];
    id v9 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_FAULT, "Can't fetch moment uuids because input PHPhotoLibrary instance is nil", buf, 2u);
    }

    id v9 = 0;
  }

  return v9;
}

void __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A9B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) photoLibraryForCurrentQueueQoS];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke_2;
  v5[3] = &unk_1E5845D60;
  v5[4] = *(void *)(a1 + 48);
  [v2 batchFetchMomentUUIDsByAssetUUIDsWithAssetUUIDs:v3 library:v4 completion:v5];
}

void __66__PHMoment__fetchMomentUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    uint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Error batch fetching moments by assets: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (id)fetchMomentUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = [a4 photoLibrary];
  uint64_t v8 = [a1 _fetchMomentUUIDByAssetUUIDForAssetUUIDs:v6 photoLibrary:v7];

  return v8;
}

+ (id)fetchMomentUUIDByAssetUUIDForAssets:(id)a3 options:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 photoLibrary];
  int v9 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "uuid", (void)v19);
        [v9 addObject:v16];

        if (!v8)
        {
          uint64_t v8 = [v15 photoLibrary];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [a1 _fetchMomentUUIDByAssetUUIDForAssetUUIDs:v9 photoLibrary:v8];

  return v17;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PHMoment_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_13046 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_13046, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_13047 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __48__PHMoment_transformValueExpression_forKeyPath___block_invoke()
{
  v4[14] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"estimatedAssetCount";
  v4[1] = @"startDate";
  v4[2] = @"endDate";
  v4[3] = @"localStartDate";
  v4[4] = @"localEndDate";
  v4[5] = @"timeZoneOffset";
  v4[6] = @"modificationDate";
  v4[7] = @"aggregationScore";
  v4[8] = @"processedLocation";
  v4[9] = @"originatorState";
  v4[10] = @"title";
  v4[11] = @"subtitle";
  v4[12] = @"localizedLocationNames";
  v4[13] = @"sharingComposition";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:14];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_13047;
  transformValueExpression_forKeyPath___passThroughSet_13047 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_13062;

  return v2;
}

void __24__PHMoment_entityKeyMap__block_invoke()
{
  v37[16] = *MEMORY[0x1E4F143B8];
  id v15 = [PHEntityKeyMap alloc];
  v35 = @"uuid";
  v36[0] = @"uuid";
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v37[0] = v19;
  v36[1] = @"startDate";
  v34 = @"startDate";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v37[1] = v18;
  v36[2] = @"endDate";
  uint64_t v33 = @"endDate";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v37[2] = v17;
  v36[3] = @"timeZoneOffset";
  v32[0] = @"timeZoneOffset";
  v32[1] = @"localStartDate";
  void v32[2] = @"localEndDate";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v37[3] = v16;
  v36[4] = @"modificationDate";
  id v31 = @"modificationDate";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v37[4] = v14;
  v36[5] = @"cachedCount";
  v30 = @"estimatedAssetCount";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v37[5] = v13;
  v36[6] = @"aggregationScore";
  double v29 = @"aggregationScore";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v37[6] = v12;
  v36[7] = @"processedLocation";
  uint64_t v28 = @"processedLocation";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v37[7] = v0;
  v36[8] = @"originatorState";
  v27 = @"originatorState";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v37[8] = v1;
  v36[9] = @"title";
  v26[0] = @"title";
  v26[1] = @"localizedTitle";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v37[9] = v2;
  v36[10] = @"subtitle";
  v25[0] = @"subtitle";
  v25[1] = @"localizedSubtitle";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v37[10] = v3;
  v36[11] = @"approximateLatitude";
  uint64_t v24 = @"approximateLatitude";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v37[11] = v4;
  v36[12] = @"approximateLongitude";
  v23 = @"approximateLongitude";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v37[12] = v5;
  v36[13] = @"localizedLocationNames";
  long long v22 = @"localizedLocationNames";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v37[13] = v6;
  v36[14] = @"gpsHorizontalAccuracy";
  long long v21 = @"gpsHorizontalAccuracy";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v37[14] = v7;
  v36[15] = @"sharingComposition";
  long long v20 = @"sharingComposition";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v37[15] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:16];
  uint64_t v10 = [(PHEntityKeyMap *)v15 initWithPropertyKeysByEntityKey:v9];
  uint64_t v11 = (void *)entityKeyMap_pl_once_object_15_13062;
  entityKeyMap_pl_once_object_15_13062 = v10;
}

+ (id)identifierCode
{
  return @"060";
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  if (!a3)
  {
LABEL_4:
    id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"sharingComposition", a3, v3);
    return v5;
  }
  if (a3 == 1)
  {
    *(void *)&a3 = 1;
    goto LABEL_4;
  }
  id v5 = 0;
  return v5;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 1;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (id)fetchType
{
  uint64_t v2 = @"PHMoment";
  return @"PHMoment";
}

+ (id)managedEntityName
{
  return @"Moment";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PHMoment_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_13086 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_13086, block);
  }
  uint64_t v3 = (void *)propertiesToFetchWithHint__array_13087;

  return v3;
}

void __38__PHMoment_propertiesToFetchWithHint___block_invoke()
{
  v4[20] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"uuid";
  v4[2] = @"approximateLatitude";
  v4[3] = @"approximateLongitude";
  v4[4] = @"cachedCount";
  v4[5] = @"cachedPhotosCount";
  v4[6] = @"cachedVideosCount";
  v4[7] = @"startDate";
  v4[8] = @"endDate";
  v4[9] = @"timeZoneOffset";
  v4[10] = @"representativeDate";
  v4[11] = @"modificationDate";
  v4[12] = @"aggregationScore";
  v4[13] = @"title";
  v4[14] = @"subtitle";
  void v4[15] = @"processedLocation";
  v4[16] = @"originatorState";
  v4[17] = @"localizedLocationNames";
  v4[18] = @"gpsHorizontalAccuracy";
  v4[19] = @"sharingComposition";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:20];
  uint64_t v3 = (void *)propertiesToFetchWithHint__array_13087;
  propertiesToFetchWithHint__array_13087 = v2;
}

@end