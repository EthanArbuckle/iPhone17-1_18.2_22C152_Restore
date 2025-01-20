@interface PHFaceGroup
+ (id)entityKeyMap;
+ (id)fetchEmptyFaceGroupsWithOptions:(id)a3;
+ (id)fetchFaceGroupsForPerson:(id)a3 options:(id)a4;
+ (id)fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces:(id)a3 options:(id)a4;
+ (id)fetchFaceGroupsWithFace:(id)a3 options:(id)a4;
+ (id)fetchFaceGroupsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchFaceGroupsWithOptions:(id)a3;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (Class)changeRequestClass;
- (PHFaceGroup)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (int64_t)getPersonModelId;
- (int64_t)personBuilderState;
- (int64_t)personModelId;
- (int64_t)unnamedFaceCount;
@end

@implementation PHFaceGroup

- (int64_t)personBuilderState
{
  return self->_personBuilderState;
}

- (int64_t)personModelId
{
  return self->_personModelId;
}

- (int64_t)unnamedFaceCount
{
  return self->_unnamedFaceCount;
}

- (int64_t)getPersonModelId
{
  return 0;
}

- (PHFaceGroup)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHFaceGroup;
  v9 = [(PHObject *)&v13 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"unnamedFaceCount"];
    v9->_unnamedFaceCount = [v10 integerValue];

    v11 = [v8 objectForKeyedSubscript:@"personBuilderState"];
    v9->_personBuilderState = [v11 integerValue];
  }
  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___PHFaceGroup;
  v7 = objc_msgSendSuper2(&v16, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  if (!v7)
  {
    id v8 = [v6 leftExpression];
    v9 = [v6 rightExpression];
    uint64_t v10 = [v8 expressionType];
    v11 = v8;
    if (v10 == 3 || (uint64_t v12 = [v9 expressionType], v11 = v9, v12 == 3))
    {
      objc_super v13 = [v11 keyPath];
      v14 = v13;
      if (v13
        && (([v13 isEqualToString:@"detectedFaces.personForFace"] & 1) != 0
         || ([v14 isEqualToString:@"detectedFaces.@count"] & 1) != 0
         || [v14 isEqualToString:@"detectedFaces.detectionType"]))
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B98]), "initWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, objc_msgSend(v6, "comparisonPredicateModifier"), objc_msgSend(v6, "predicateOperatorType"), objc_msgSend(v6, "options"));
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v14 = 0;
    }
    v7 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

+ (id)fetchEmptyFaceGroupsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_62_1376];
}

id __47__PHFaceGroup_fetchEmptyFaceGroupsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForEmptyFaceGroupsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces:(id)a3 options:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1378;
  v36 = __Block_byref_object_dispose__1379;
  id v37 = 0;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  id v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v15 = [v14 uuid];
        [v8 addObject:v15];

        if (!v10) {
          id v10 = v14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v11);
  }

  objc_super v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:v10];
  v17 = (void *)MEMORY[0x1E4F8A7B8];
  v18 = [v16 photoLibrary];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke;
  v23[3] = &unk_1E5845CC0;
  v26 = &v32;
  id v19 = v16;
  id v24 = v19;
  id v20 = v7;
  id v25 = v20;
  id v27 = a1;
  [v17 batchFetchFaceGroupByFaceUUIDWithFaceUUIDs:v8 predicate:0 library:v18 completion:v23];

  id v21 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v21;
}

void __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke_2;
    v11[3] = &unk_1E5841F28;
    uint64_t v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    long long v14 = *(_OWORD *)(a1 + 48);
    [v5 enumerateKeysAndObjectsUsingBlock:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching associated person by face group: %@", buf, 0xCu);
    }
  }
}

void __75__PHFaceGroup_fetchFaceGroupsGroupedByFaceLocalIdentifierForFaces_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PHObject localIdentifierWithUUID:a2];
  uint64_t v7 = [[PHObjectPLAdapter alloc] initWithPLManagedObject:v5 photoLibrary:*(void *)(a1 + 32)];

  uint64_t v8 = [*(id *)(a1 + 40) fetchPropertySetsAsSet];
  id v9 = objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithFetchDictionary:propertyHint:photoLibrary:", v7, +[PHObject propertyFetchHintsForPropertySets:](PHFaceGroup, "propertyFetchHintsForPropertySets:", v8), *(void *)(a1 + 32));
  id v10 = [PHManualFetchResult alloc];
  v13[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v12 = [(PHManualFetchResult *)v10 initWithObjects:v11 photoLibrary:*(void *)(a1 + 32) fetchType:@"PHPerson" fetchPropertySets:v8 identifier:0 registerIfNeeded:1];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v6];
}

+ (id)fetchFaceGroupsWithFace:(id)a3 options:(id)a4
{
  v4 = +[PHQuery queryForFaceGroupsWithFace:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchFaceGroupsForPerson:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PHFaceGroup_fetchFaceGroupsForPerson_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __48__PHFaceGroup_fetchFaceGroupsForPerson_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForFaceGroupsForPerson:*(void *)(a1 + 32) options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchFaceGroupsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PHFaceGroup_fetchFaceGroupsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __59__PHFaceGroup_fetchFaceGroupsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForFaceGroupsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchFaceGroupsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_49];
}

id __42__PHFaceGroup_fetchFaceGroupsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForFaceGroupsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PHFaceGroup_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_1390 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_1390, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_1391 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __51__PHFaceGroup_transformValueExpression_forKeyPath___block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"uuid";
  v4[1] = @"unnamedFaceCount";
  v4[2] = @"personBuilderState";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_1391;
  transformValueExpression_forKeyPath___passThroughSet_1391 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_1394;

  return v2;
}

void __27__PHFaceGroup_entityKeyMap__block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  id v9 = @"uuid";
  v10[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v11[0] = v1;
  v10[1] = @"unnamedFaceCount";
  id v8 = @"unnamedFaceCount";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v11[1] = v2;
  v10[2] = @"personBuilderState";
  id v7 = @"personBuilderState";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v11[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v5 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v4];
  id v6 = (void *)entityKeyMap_pl_once_object_15_1394;
  entityKeyMap_pl_once_object_15_1394 = v5;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_1397 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_1397, &__block_literal_global_1398);
  }
  v3 = (void *)propertiesToFetchWithHint__array_1399;

  return v3;
}

void __41__PHFaceGroup_propertiesToFetchWithHint___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"uuid";
  v3[2] = @"unnamedFaceCount";
  v3[3] = @"personBuilderState";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  uint64_t v2 = (void *)propertiesToFetchWithHint__array_1399;
  propertiesToFetchWithHint__array_1399 = v1;
}

+ (id)fetchType
{
  uint64_t v2 = @"PHFaceGroup";
  return @"PHFaceGroup";
}

+ (id)managedEntityName
{
  return @"DetectedFaceGroup";
}

+ (id)identifierCode
{
  return @"090";
}

@end