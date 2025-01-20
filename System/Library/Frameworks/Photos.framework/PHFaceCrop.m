@interface PHFaceCrop
+ (id)_trainingFaceCropByUUIDForPerson:(id)a3 options:(id)a4;
+ (id)entityKeyMap;
+ (id)fetchFaceCropByFaceLocalIdentifierForFaces:(id)a3 fetchOptions:(id)a4;
+ (id)fetchFaceCropsForPerson:(id)a3 options:(id)a4;
+ (id)fetchFaceCropsNeedingFaceDetectionWithOptions:(id)a3;
+ (id)fetchFaceCropsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchFaceCropsWithOptions:(id)a3;
+ (id)fetchTransientTrainingFaceCropsForPerson:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (Class)changeRequestClass;
- (NSData)resourceData;
- (PHFaceCrop)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (signed)state;
- (signed)type;
@end

@implementation PHFaceCrop

- (void).cxx_destruct
{
}

- (signed)type
{
  return self->_type;
}

- (signed)state
{
  return self->_state;
}

- (NSData)resourceData
{
  return self->_resourceData;
}

- (PHFaceCrop)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHFaceCrop;
  v9 = [(PHObject *)&v15 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"resourceData"];
    resourceData = v9->_resourceData;
    v9->_resourceData = (NSData *)v10;

    v12 = [v8 objectForKeyedSubscript:@"state"];
    v9->_state = [v12 shortValue];

    v13 = [v8 objectForKeyedSubscript:@"type"];
    v9->_type = [v13 integerValue];
  }
  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchFaceCropByFaceLocalIdentifierForFaces:(id)a3 fetchOptions:(id)a4
{
  id v23 = a1;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  v6 = [v5 photoLibrary];
  v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_super v15 = objc_msgSend(v14, "objectID", v23);
        v16 = [v14 localIdentifier];
        [v7 addObject:v15];
        [v8 setObject:v16 forKeyedSubscript:v15];
        if (!v6)
        {
          v6 = [v14 photoLibrary];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }

  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = (void *)MEMORY[0x1E4F8A7F8];
  v19 = [v6 photoLibrary];
  v20 = [v18 batchFetchFaceCropByFaceObjectIDWithFaceObjectIDs:v7 library:v19];

  if ([v20 count])
  {
    v21 = [v6 photoLibrary];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke;
    v25[3] = &unk_1E5848238;
    id v26 = v20;
    id v27 = v8;
    id v28 = v6;
    id v29 = v24;
    id v31 = v23;
    id v30 = v17;
    [v21 performBlockAndWait:v25];
  }

  return v17;
}

void __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke_2;
  v5[3] = &unk_1E5848210;
  v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 64);
  id v3 = (id)v4;
  long long v9 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __70__PHFaceCrop_fetchFaceCropByFaceLocalIdentifierForFaces_fetchOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v10 = [v5 objectForKeyedSubscript:a2];
  id v7 = [[PHObjectPLAdapter alloc] initWithPLManagedObject:v6 photoLibrary:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 48) fetchPropertySetsAsSet];
  long long v9 = objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithFetchDictionary:propertyHint:photoLibrary:", v7, +[PHObject propertyFetchHintsForPropertySets:](PHFaceCrop, "propertyFetchHintsForPropertySets:", v8), *(void *)(a1 + 40));
  if (v10 && v9) {
    [*(id *)(a1 + 56) setObject:v9 forKeyedSubscript:v10];
  }
}

+ (id)_trainingFaceCropByUUIDForPerson:(id)a3 options:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
  id v8 = [v7 librarySpecificFetchOptions];
  long long v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"vipModelType", 1);
  [v8 setInternalPredicate:v9];

  objc_msgSend(v8, "setFetchLimit:", objc_msgSend(v6, "fetchLimit"));
  id v10 = [v6 sortDescriptors];
  [v8 setSortDescriptors:v10];

  objc_msgSend(v8, "setIncludeNonvisibleFaces:", objc_msgSend(v6, "includeNonvisibleFaces"));
  uint64_t v11 = +[PHFace fetchFacesForPerson:v5 options:v8];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) localIdentifier];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v15);
  }

  if ([v12 count])
  {
    v19 = [v7 photoAnalysisClient];
    id v25 = 0;
    v20 = [v19 requestOnDemandFaceCropsForFaceLocalIdentifiers:v12 error:&v25];
    v21 = v25;

    if (v21 || !v20)
    {
      id v23 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v31 = v5;
        __int16 v32 = 2112;
        long long v33 = v12;
        __int16 v34 = 2112;
        long long v35 = v21;
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Failed to request on demand face crops for person: %@, faces: %@, error: %@", buf, 0x20u);
      }

      id v22 = 0;
    }
    else
    {
      id v22 = v20;
    }
  }
  else
  {
    v21 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v5;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "No on demand face crops to request for person: %@", buf, 0xCu);
    }
    id v22 = 0;
  }

  return v22;
}

+ (id)fetchTransientTrainingFaceCropsForPerson:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v6];
  long long v9 = [a1 _trainingFaceCropByUUIDForPerson:v6 options:v7];

  if (v9)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v11 = [v6 uuid];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__PHFaceCrop_fetchTransientTrainingFaceCropsForPerson_options___block_invoke;
    v17[3] = &unk_1E58481E8;
    id v18 = v11;
    id v12 = v8;
    id v19 = v12;
    id v20 = v10;
    id v13 = v10;
    id v14 = v11;
    [v9 enumerateKeysAndObjectsUsingBlock:v17];
    uint64_t v15 = [[PHManualFetchResult alloc] initWithObjects:v13 photoLibrary:v12 fetchType:@"PHFaceCrop" fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

void __63__PHFaceCrop_fetchTransientTrainingFaceCropsForPerson_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 stringByAppendingString:a2];
  v10[0] = @"uuid";
  v10[1] = @"resourceData";
  v11[0] = v7;
  v11[1] = v6;
  v10[2] = @"state";
  v10[3] = @"type";
  v11[2] = &unk_1EEB26460;
  v11[3] = &unk_1EEB26460;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  long long v9 = [[PHFaceCrop alloc] initWithFetchDictionary:v8 propertyHint:2 photoLibrary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v9];
}

+ (id)fetchFaceCropsNeedingFaceDetectionWithOptions:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = (void *)[v4 copy];
  }
  else
  {
    id v6 = objc_opt_new();
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"state == %d", 0);
  id v8 = [v6 predicate];

  if (v8)
  {
    long long v9 = [v6 predicate];
    id v10 = (void *)MEMORY[0x1E4F28BA0];
    v15[0] = v9;
    v15[1] = v7;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v12 = [v10 andPredicateWithSubpredicates:v11];
    [v6 setPredicate:v12];
  }
  else
  {
    [v6 setPredicate:v7];
  }
  id v13 = [a1 fetchFaceCropsWithOptions:v6];

  return v13;
}

+ (id)fetchFaceCropsForPerson:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PHFaceCrop_fetchFaceCropsForPerson_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  long long v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

id __46__PHFaceCrop_fetchFaceCropsForPerson_options___block_invoke(uint64_t a1)
{
  v1 = +[PHQuery queryForFaceCropsForPerson:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchFaceCropsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PHFaceCrop_fetchFaceCropsWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E58481C0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  long long v9 = +[PHObject authorizationAwareFetchResultWithOptions:v7 fetchBlock:v11];

  return v9;
}

id __57__PHFaceCrop_fetchFaceCropsWithLocalIdentifiers_options___block_invoke(uint64_t a1)
{
  v1 = +[PHQuery queryForFaceCropsWithLocalIdentifiers:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchFaceCropsWithOptions:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PHFaceCrop_fetchFaceCropsWithOptions___block_invoke;
  v7[3] = &unk_1E5849048;
  id v8 = v3;
  id v4 = v3;
  id v5 = +[PHObject authorizationAwareFetchResultWithOptions:v4 fetchBlock:v7];

  return v5;
}

id __40__PHFaceCrop_fetchFaceCropsWithOptions___block_invoke(uint64_t a1)
{
  v1 = +[PHQuery queryForFaceCropsWithOptions:*(void *)(a1 + 32)];
  v2 = [v1 executeQuery];

  return v2;
}

+ (id)fetchType
{
  v2 = @"PHFaceCrop";
  return @"PHFaceCrop";
}

+ (id)managedEntityName
{
  return @"FaceCrop";
}

+ (id)identifierCode
{
  return @"110";
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PHFaceCrop_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_44781 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_44781, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_44782 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __50__PHFaceCrop_transformValueExpression_forKeyPath___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"uuid";
  v4[1] = @"resourceData";
  v4[2] = @"state";
  v4[3] = @"type";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_44782;
  transformValueExpression_forKeyPath___passThroughSet_44782 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_44785;

  return v2;
}

void __26__PHFaceCrop_entityKeyMap__block_invoke()
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  uint64_t v11 = @"uuid";
  v12[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[0] = v1;
  v12[1] = @"resourceData";
  id v10 = @"resourceData";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v13[1] = v2;
  v12[2] = @"state";
  long long v9 = @"state";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v13[2] = v3;
  v12[3] = @"type";
  id v8 = @"type";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v13[3] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  uint64_t v6 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v5];
  id v7 = (void *)entityKeyMap_pl_once_object_15_44785;
  entityKeyMap_pl_once_object_15_44785 = v6;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_44787 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_44787, &__block_literal_global_44788);
  }
  id v3 = (void *)propertiesToFetchWithHint__array_44789;

  return v3;
}

void __40__PHFaceCrop_propertiesToFetchWithHint___block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"uuid";
  v3[2] = @"resourceData";
  v3[3] = @"state";
  v3[4] = @"type";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  uint64_t v2 = (void *)propertiesToFetchWithHint__array_44789;
  propertiesToFetchWithHint__array_44789 = v1;
}

@end