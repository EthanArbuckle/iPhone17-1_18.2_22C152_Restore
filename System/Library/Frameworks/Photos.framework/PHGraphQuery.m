@interface PHGraphQuery
+ (id)_filterSocialGroupsWithFetchResult:(id)a3 option:(id)a4 graphQuery:(id)a5;
+ (id)_graphBasePredicateWithLabelCode:(unsigned int)a3 options:(id)a4;
+ (id)_graphFetchSocialGroupsObjectIDsSortedByDescriptors:(id)a3 library:(id)a4;
+ (id)_nodeTableFromNodeValuesInFetchResult:(id)a3;
+ (id)graphQueryForAssetsForPerson:(id)a3 options:(id)a4;
+ (id)graphQueryForExclusiveAssetsForSocialGroup:(id)a3 options:(id)a4;
+ (id)graphQueryForInclusiveAssetsForSocialGroup:(id)a3 options:(id)a4;
+ (id)graphQueryForKeyAssetForSocialGroup:(id)a3 createIfNeeded:(BOOL)a4 options:(id)a5;
+ (id)graphQueryForPersonsInSocialGroup:(id)a3 options:(id)a4;
+ (id)graphQueryForSocialGroupsWithOptions:(id)a3;
+ (id)queryForSearchEntitiesWithOptions:(id)a3;
+ (id)queryForSocialGroupsWithUUIDs:(id)a3 options:(id)a4;
- (BOOL)_graphQueryIntersectsWithChange:(id)a3;
- (PHObject)graphSubject;
- (id)_graphRefetchSocialGroup;
- (id)changeHandlingContainerIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)executeQuery;
- (id)extraBatchFetchingArrayOptions;
- (id)updatedQueryWithChange:(id)a3;
- (int64_t)graphQueryType;
- (unint64_t)possibleChangesForChange:(id)a3;
- (void)setGraphQueryType:(int64_t)a3;
- (void)setGraphSubject:(id)a3;
@end

@implementation PHGraphQuery

void __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke(uint64_t a1)
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  v3 = objc_msgSend(v2, "_pl_map:", &__block_literal_global_135_41073);

  v4 = [MEMORY[0x1E4F8A868] fetchRequest];
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %u AND %K IN %@", @"node.primaryLabelCode", 1000, @"valueName", v3];
  [v4 setPredicate:v5];

  [v4 setResultType:2];
  v17[0] = @"valueName";
  v17[1] = @"intValue";
  v17[2] = @"stringValue";
  v17[3] = @"node";
  v17[4] = @"node.uuid";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  [v4 setPropertiesToFetch:v6];

  v7 = *(void **)(a1 + 40);
  id v16 = 0;
  v8 = [v7 executeFetchRequest:v4 error:&v16];
  id v9 = v16;
  v10 = [*(id *)(a1 + 56) _nodeTableFromNodeValuesInFetchResult:v8];
  v11 = [v10 allValues];
  v12 = [v11 sortedArrayUsingDescriptors:*(void *)(a1 + 32)];

  uint64_t v13 = objc_msgSend(v12, "_pl_map:", &__block_literal_global_154);
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

+ (id)_nodeTableFromNodeValuesInFetchResult:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 objectForKeyedSubscript:@"node"];
        v10 = [v4 objectForKeyedSubscript:v9];
        if (!v10)
        {
          v11 = [v8 objectForKeyedSubscript:@"node.uuid"];
          v12 = (void *)MEMORY[0x1E4F1CA60];
          v25 = @"objectID";
          v26 = v9;
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          v10 = [v12 dictionaryWithDictionary:v13];

          if (v11) {
            [v10 setObject:v11 forKeyedSubscript:@"uuid"];
          }
          [v4 setObject:v10 forKeyedSubscript:v9];
        }
        uint64_t v14 = [v8 objectForKeyedSubscript:@"valueName"];
        v15 = +[PHSocialGroup propertyNameFromNodeValueName:v14];
        id v16 = +[PHSocialGroup nodeValueKeyPathForNodeValueName:v14];
        v17 = [v8 objectForKeyedSubscript:v16];
        [v10 setObject:v17 forKeyedSubscript:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)executeQuery
{
  v2 = self;
  switch([(PHGraphQuery *)self graphQueryType])
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      v23.receiver = v2;
      v23.super_class = (Class)PHGraphQuery;
      v2 = [(PHQuery *)&v23 executeQuery];
      break;
    case 1:
      id v3 = [[PHFetchResult alloc] initWithQuery:v2 registerIfNeeded:0];
      v4 = objc_opt_class();
      uint64_t v5 = [v2 fetchOptions];
      v2 = [v4 _filterSocialGroupsWithFetchResult:v3 option:v5 graphQuery:v2];

      goto LABEL_10;
    case 2:
      uint64_t v6 = [v2 fetchOptions];
      v7 = [v6 fetchPropertySets];
      if ([v7 count])
      {
        v8 = (void *)MEMORY[0x1E4F1CAD0];
        id v9 = [v2 fetchOptions];
        v10 = [v9 fetchPropertySets];
        id v3 = [v8 setWithArray:v10];
      }
      else
      {
        id v3 = 0;
      }

      v11 = [PHManualFetchResult alloc];
      v12 = [v2 seedOIDs];
      uint64_t v13 = [v2 fetchOptions];
      uint64_t v14 = [v13 photoLibrary];
      v15 = [v2 description];
      id v16 = [v2 fetchOptions];
      unint64_t v17 = [v16 fetchLimit];

      uint64_t v18 = 200;
      if (v17 < 0xC8) {
        uint64_t v18 = v17;
      }
      v19 = [(PHManualFetchResult *)v11 initWithOids:v12 photoLibrary:v14 fetchType:@"PHSocialGroup" fetchPropertySets:v3 identifier:v15 registerIfNeeded:0 graphQuery:v2 batchSize:v18];

      uint64_t v20 = objc_opt_class();
      long long v21 = [v2 fetchOptions];
      v2 = [v20 _filterSocialGroupsWithFetchResult:v19 option:v21 graphQuery:v2];

LABEL_10:
      break;
    default:
      break;
  }

  return v2;
}

- (id)description
{
  unint64_t v3 = [(PHGraphQuery *)self graphQueryType];
  if (v3 > 7) {
    v4 = 0;
  }
  else {
    v4 = off_1E5847AF8[v3];
  }
  uint64_t v5 = NSString;
  uint64_t v6 = [(PHGraphQuery *)self graphSubject];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = [(PHGraphQuery *)self graphSubject];
  v10 = [v9 uuid];
  v11 = [v5 stringWithFormat:@"PHGraphQuery(type=%@, subject=(%@ uuid=%@))", v4, v8, v10];

  return v11;
}

- (PHObject)graphSubject
{
  return (PHObject *)objc_getProperty(self, a2, 280, 1);
}

- (id)extraBatchFetchingArrayOptions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PHGraphQuery *)self graphQueryType];
  if (v3 > 7)
  {
    uint64_t v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      int64_t v8 = [(PHGraphQuery *)self graphQueryType];
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Unknown graph query type: %ld", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_3;
  }
  if (v3 != 2)
  {
LABEL_3:
    v4 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_4;
  }
  id v9 = @"fetchedObjectClass";
  v10[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
LABEL_4:

  return v4;
}

- (int64_t)graphQueryType
{
  return self->_graphQueryType;
}

+ (id)graphQueryForSocialGroupsWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _graphBasePredicateWithLabelCode:1000 options:v4];
  uint64_t v6 = [v4 sortDescriptors];
  int v7 = objc_msgSend(v6, "_pl_firstObjectPassingTest:", &__block_literal_global_41119);

  if (v7)
  {
    int64_t v8 = [v4 sortDescriptors];
    id v9 = [v4 photoLibrary];
    v10 = [a1 _graphFetchSocialGroupsObjectIDsSortedByDescriptors:v8 library:v9];

    v11 = [v4 photoLibrary];
    v12 = [a1 queryForType:@"PHSocialGroup" withBasePredicate:v5 seedOIDs:v10 inLibrary:v11];

    [v12 setGraphQueryType:2];
  }
  else
  {
    uint64_t v13 = [v4 photoLibrary];
    v12 = [a1 queryForType:@"PHSocialGroup" withBasePredicate:v5 inLibrary:v13];

    [v12 setGraphQueryType:1];
  }
  [v12 setFetchOptions:v4];
  [v12 setGraphSubject:0];

  return v12;
}

- (void)setGraphSubject:(id)a3
{
}

- (void)setGraphQueryType:(int64_t)a3
{
  self->_graphQueryType = a3;
}

+ (id)_graphFetchSocialGroupsObjectIDsSortedByDescriptors:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PHGraphQuery.m", 440, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  id v9 = [v8 photoLibraryForCurrentQueueQoS];
  v10 = [v9 managedObjectContext];
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__41070;
  v25 = __Block_byref_object_dispose__41071;
  id v26 = (id)MEMORY[0x1E4F1CBF0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke;
  v16[3] = &unk_1E5847AD8;
  id v11 = v7;
  id v17 = v11;
  id v12 = v10;
  v19 = &v21;
  id v20 = a1;
  id v18 = v12;
  [v9 performBlockAndWait:v16];
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v13;
}

+ (id)_graphBasePredicateWithLabelCode:(unsigned int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %u", @"primaryLabelCode", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 socialGroupContext])
  {
    id v7 = v6;
    if ([v5 socialGroupContext] != 1) {
      goto LABEL_6;
    }
    id v8 = (void *)MEMORY[0x1E4F28BA0];
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K == %d).@count > 0", @"values", @"valueName", @"socialGroupVerifiedType", @"intValue", 1, v6];
    v14[1] = v9;
    v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = v14;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F28BA0];
    v15[0] = v6;
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $v, $v.%K == %@ AND $v.%K > %d).@count > 0", @"values", @"valueName", @"socialGroupVerifiedType", @"intValue", 0];
    v15[1] = v9;
    v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = v15;
  }
  id v12 = [v10 arrayWithObjects:v11 count:2];
  id v7 = [v8 andPredicateWithSubpredicates:v12];

LABEL_6:

  return v7;
}

+ (id)_filterSocialGroupsWithFetchResult:(id)a3 option:(id)a4 graphQuery:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  uint64_t v13 = [v10 socialGroupContext];
  if (v13 == 2)
  {
    uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  else
  {
    if (v13 != 1)
    {
      if (v13) {
        goto LABEL_5;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F28BA0];
      id v36 = a1;
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"socialGroupVerifiedType", 1);
      v15 = v35 = a2;
      v38[0] = v15;
      id v16 = (void *)MEMORY[0x1E4F28BA0];
      id v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"socialGroupVerifiedType", 2);
      v37[0] = v17;
      id v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count > 0", @"exclusiveAssetIDs");
      v37[1] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      id v20 = [v16 andPredicateWithSubpredicates:v19];
      v38[1] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      long long v22 = [v14 orPredicateWithSubpredicates:v21];

      a1 = v36;
      a2 = v35;
      if (!v22) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"socialGroupVerifiedType", 1);
  }
  long long v22 = (void *)v24;
  if (!v24)
  {
LABEL_5:
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PHGraphQuery.m", 498, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];

    long long v22 = 0;
  }
LABEL_9:
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v12 count])
  {
    uint64_t v26 = 0;
    while (1)
    {
      v27 = (void *)MEMORY[0x19F389B10]();
      uint64_t v28 = [v12 objectAtIndexedSubscript:v26];
      if ([v22 evaluateWithObject:v28])
      {
        v29 = [v28 objectID];
        [v25 addObject:v29];
      }
      if ([v10 fetchLimit])
      {
        uint64_t v30 = [v25 count];
        if (v30 == [v10 fetchLimit]) {
          break;
        }
      }

      if ([v12 count] <= (unint64_t)++v26) {
        goto LABEL_18;
      }
    }
  }
LABEL_18:
  v31 = [PHManualFetchResult alloc];
  v32 = [v12 photoLibrary];
  v33 = [(PHManualFetchResult *)v31 initWithOids:v25 photoLibrary:v32 fetchType:@"PHSocialGroup" fetchPropertySets:0 identifier:0 registerIfNeeded:1 graphQuery:v11];

  return v33;
}

BOOL __53__PHGraphQuery_graphQueryForSocialGroupsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 key];
  unint64_t v3 = +[PHSocialGroup nodeValueNameFromPropertyName:v2];

  return v3 != 0;
}

id __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 key];
  unint64_t v3 = +[PHSocialGroup nodeValueNameFromPropertyName:v2];

  return v3;
}

- (void).cxx_destruct
{
}

- (BOOL)_graphQueryIntersectsWithChange:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([(PHGraphQuery *)self graphQueryType] - 1) > 1)
  {
    id v6 = [v4 updatedObjectIDs];
    id v7 = [(PHGraphQuery *)self graphSubject];
    id v8 = [v7 objectID];
    int v9 = [v6 containsObject:v8];

    if (v9)
    {
      switch([(PHGraphQuery *)self graphQueryType])
      {
        case 3:
          id v10 = [(PHGraphQuery *)self graphSubject];
          id v11 = [v10 objectID];
          id v12 = [v4 changedPropertyNamesForObjectID:v11 entityClass:objc_opt_class()];
          uint64_t v13 = v12;
          uint64_t v14 = @"memberPersonIDs";
          goto LABEL_8;
        case 4:
          id v10 = [(PHGraphQuery *)self graphSubject];
          id v11 = [v10 objectID];
          id v12 = [v4 changedPropertyNamesForObjectID:v11 entityClass:objc_opt_class()];
          uint64_t v13 = v12;
          uint64_t v14 = @"keyAssetID";
          goto LABEL_8;
        case 5:
        case 6:
          id v10 = [(PHGraphQuery *)self graphSubject];
          id v11 = [v10 objectID];
          id v12 = [v4 changedPropertyNamesForObjectID:v11 entityClass:objc_opt_class()];
          uint64_t v13 = v12;
          uint64_t v14 = @"inclusiveAssetIDs";
LABEL_8:
          char v15 = [v12 containsObject:v14];

          if (v15) {
            goto LABEL_9;
          }
          goto LABEL_11;
        case 7:
          id v16 = [MEMORY[0x1E4F8A850] entityName];
          char v17 = [v4 containsChangesForEntityWithManagedEntityName:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_11;
          }
LABEL_9:
          char v5 = 1;
          break;
        default:
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      char v5 = 0;
    }
  }
  else
  {
    char v5 = [v4 containsChangesForEntityClass:objc_opt_class()];
  }

  return v5;
}

- (id)_graphRefetchSocialGroup
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = self->_graphSubject;
  unint64_t v3 = [(PHObject *)v2 photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];

  [v4 setSocialGroupContext:2];
  char v5 = [(PHObject *)v2 localIdentifier];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v7 = +[PHSocialGroup fetchSocialGroupsWithLocalIdentifiers:v6 options:v4];

  id v8 = [v7 firstObject];

  return v8;
}

- (id)changeHandlingContainerIdentifier
{
  v2 = [(PHGraphQuery *)self graphSubject];
  unint64_t v3 = [v2 objectID];

  return v3;
}

- (unint64_t)possibleChangesForChange:(id)a3
{
  if ([(PHGraphQuery *)self _graphQueryIntersectsWithChange:a3]) {
    return 15;
  }
  else {
    return 0;
  }
}

- (id)updatedQueryWithChange:(id)a3
{
  if (![(PHGraphQuery *)self _graphQueryIntersectsWithChange:a3]) {
    goto LABEL_12;
  }
  switch([(PHGraphQuery *)self graphQueryType])
  {
    case 1:
    case 2:
      id v4 = objc_opt_class();
      char v5 = [(PHQuery *)self fetchOptions];
      uint64_t v6 = [v4 graphQueryForSocialGroupsWithOptions:v5];
      goto LABEL_8;
    case 3:
      id v7 = objc_opt_class();
      char v5 = [(PHGraphQuery *)self _graphRefetchSocialGroup];
      id v8 = [(PHQuery *)self fetchOptions];
      uint64_t v9 = [v7 graphQueryForPersonsInSocialGroup:v5 options:v8];
      goto LABEL_10;
    case 4:
      id v10 = objc_opt_class();
      char v5 = [(PHGraphQuery *)self _graphRefetchSocialGroup];
      id v8 = [(PHQuery *)self fetchOptions];
      uint64_t v9 = [v10 graphQueryForKeyAssetForSocialGroup:v5 createIfNeeded:0 options:v8];
      goto LABEL_10;
    case 5:
      char v15 = objc_opt_class();
      char v5 = [(PHGraphQuery *)self _graphRefetchSocialGroup];
      id v8 = [(PHQuery *)self fetchOptions];
      uint64_t v9 = [v15 graphQueryForInclusiveAssetsForSocialGroup:v5 options:v8];
      goto LABEL_10;
    case 6:
      id v11 = objc_opt_class();
      char v5 = [(PHGraphQuery *)self _graphRefetchSocialGroup];
      id v8 = [(PHQuery *)self fetchOptions];
      uint64_t v9 = [v11 graphQueryForExclusiveAssetsForSocialGroup:v5 options:v8];
LABEL_10:
      uint64_t v14 = (PHGraphQuery *)v9;

      break;
    case 7:
      id v12 = objc_opt_class();
      graphSubject = self->_graphSubject;
      char v5 = [(PHQuery *)self fetchOptions];
      uint64_t v6 = [v12 graphQueryForAssetsForPerson:graphSubject options:v5];
LABEL_8:
      uint64_t v14 = (PHGraphQuery *)v6;
      break;
    default:
      goto LABEL_12;
  }

  if (!v14) {
LABEL_12:
  }
    uint64_t v14 = self;

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHGraphQuery;
  id v4 = [(PHQuery *)&v8 copyWithZone:a3];
  char v5 = [(PHGraphQuery *)self graphSubject];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setGraphSubject:v6];

  objc_msgSend(v4, "setGraphQueryType:", -[PHGraphQuery graphQueryType](self, "graphQueryType"));
  return v4;
}

uint64_t __76__PHGraphQuery__graphFetchSocialGroupsObjectIDsSortedByDescriptors_library___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"objectID"];
}

+ (id)queryForSearchEntitiesWithOptions:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  char v5 = objc_msgSend(v3, "predicateWithFormat:", @"%K == %u", @"primaryLabelCode", 1100);
  uint64_t v6 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v4 object:0];
  id v7 = +[PHQuery queryForType:@"PHSearchEntity" withBasePredicate:v5 inLibrary:v6];

  [v7 setFetchOptions:v4];

  return v7;
}

+ (id)graphQueryForAssetsForPerson:(id)a3 options:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 photoLibrary];
  uint64_t v9 = [v8 managedObjectContext];

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__41070;
  v37 = __Block_byref_object_dispose__41071;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__41070;
  v31 = __Block_byref_object_dispose__41071;
  id v32 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __53__PHGraphQuery_graphQueryForAssetsForPerson_options___block_invoke;
  long long v22 = &unk_1E5847CB0;
  id v25 = &v27;
  id v10 = v6;
  id v23 = v10;
  id v11 = v9;
  id v24 = v11;
  uint64_t v26 = &v33;
  [v11 performBlockAndWait:&v19];
  if (v28[5])
  {
    id v12 = objc_msgSend(v10, "photoLibrary", v19, v20, v21, v22, v23);
    uint64_t v13 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v12];

    uint64_t v14 = [a1 queryForVisibleAssetsWithObjectIDs:v28[5] options:v13];
    [v14 setGraphSubject:v10];
    [v14 setGraphQueryType:7];
  }
  else
  {
    char v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(v10, "uuid", v19, v20, v21, v22, v23);
      uint64_t v17 = v34[5];
      *(_DWORD *)buf = 136315650;
      v40 = "+[PHGraphQuery graphQueryForAssetsForPerson:options:]";
      __int16 v41 = 2112;
      v42 = v16;
      __int16 v43 = 2112;
      uint64_t v44 = v17;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to fetch assets for person %@ with error: %@", buf, 0x20u);
    }
    uint64_t v14 = 0;
    uint64_t v13 = v7;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v14;
}

void __53__PHGraphQuery_graphQueryForAssetsForPerson_options___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8ABF8];
  unint64_t v3 = [*(id *)(a1 + 32) objectID];
  uint64_t v4 = *(void *)(a1 + 40);
  id v16 = 0;
  uint64_t v5 = [v2 fetchAssetIDsHavingAssetPersonEdgesToPersonID:v3 inManagedObjectContext:v4 error:&v16];
  id v6 = v16;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v10 + 40);
  id v11 = (id *)(v10 + 40);
  id v12 = v13;
  id v14 = v6;
  char v15 = v14;
  if (!v9) {
    id v12 = v14;
  }

  objc_storeStrong(v11, v12);
}

+ (id)graphQueryForKeyAssetForSocialGroup:(id)a3 createIfNeeded:(BOOL)a4 options:(id)a5
{
  BOOL v6 = a4;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 keyAssetID];
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  if (v11)
  {
    id v12 = [v10 photoLibrary];
    uint64_t v13 = [v12 managedObjectContext];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      id v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, a1, @"PHGraphQuery.m", 164, @"Invalid parameter not satisfying: %@", @"options.photoLibrary.managedObjectContext" object file lineNumber description];
    }
    char v15 = [v10 photoLibrary];
    id v16 = [v15 managedObjectContext];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __75__PHGraphQuery_graphQueryForKeyAssetForSocialGroup_createIfNeeded_options___block_invoke;
    v33[3] = &unk_1E5848318;
    id v34 = v10;
    id v35 = v11;
    id v36 = &v37;
    [v16 performBlockAndWait:v33];
  }
  if (_os_feature_enabled_impl())
  {
    BOOL v17 = !*((unsigned char *)v38 + 24) || v11 == 0;
    if (v17 && v6)
    {
      uint64_t v19 = [v9 exclusiveAssetIDs];
      BOOL v20 = [v19 count] == 0;

      if (!v20)
      {
        uint64_t v21 = [v10 photoLibrary];
        long long v22 = [v21 photoAnalysisClient];

        id v23 = (void *)[objc_alloc(MEMORY[0x1E4F8AA30]) initWithServiceProvider:v22];
        id v24 = (void *)MEMORY[0x1E4F1CAD0];
        id v25 = [v9 uuid];
        uint64_t v26 = [v24 setWithObject:v25];
        [v23 updateKeyAssetOfSocialGroupsWithUUIDs:v26 operationID:&stru_1EEAC1950 reply:&__block_literal_global_85];
      }
    }
  }
  if (v11)
  {
    v41[0] = v11;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v28 = [v9 photoLibrary];
  uint64_t v29 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v10 photoLibrary:v28];

  uint64_t v30 = [a1 queryForVisibleAssetsWithObjectIDs:v27 options:v29];
  [v30 setGraphSubject:v9];
  [v30 setGraphQueryType:4];

  _Block_object_dispose(&v37, 8);

  return v30;
}

void __75__PHGraphQuery_graphQueryForKeyAssetForSocialGroup_createIfNeeded_options___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photoLibrary];
  unint64_t v3 = [v2 managedObjectContext];
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = 0;
  uint64_t v5 = [v3 existingObjectWithID:v4 error:&v8];
  id v6 = v8;

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isVisibleForSocialGroupKeyAssetFetch];
  }
  else
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Error getting social group key asset from assetID: %@", buf, 0xCu);
    }
  }
}

void __75__PHGraphQuery_graphQueryForKeyAssetForSocialGroup_createIfNeeded_options___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    unint64_t v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_ERROR, "Error updating key asset for social group: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (id)graphQueryForInclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 inclusiveAssetIDs];
  id v9 = [v7 photoLibrary];
  id v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v9];

  uint64_t v11 = [v8 allObjects];
  id v12 = [a1 queryForVisibleAssetsWithObjectIDs:v11 options:v10];

  [v12 setGraphSubject:v7];
  [v12 setGraphQueryType:5];

  return v12;
}

+ (id)graphQueryForExclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 exclusiveAssetIDs];
  id v9 = [v7 photoLibrary];
  id v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v9];

  uint64_t v11 = [v8 allObjects];
  id v12 = [a1 queryForVisibleAssetsWithObjectIDs:v11 options:v10];

  [v12 setGraphSubject:v7];
  [v12 setGraphQueryType:6];

  return v12;
}

+ (id)graphQueryForPersonsInSocialGroup:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 memberPersonIDs];
  id v9 = [v7 photoLibrary];
  id v10 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v6 photoLibrary:v9];

  uint64_t v11 = [v8 allObjects];
  id v12 = [a1 queryForPersonsWithObjectIDs:v11 options:v10];

  [v12 setGraphSubject:v7];
  [v12 setGraphQueryType:3];

  return v12;
}

+ (id)queryForSocialGroupsWithUUIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__41070;
  id v25 = __Block_byref_object_dispose__41071;
  id v26 = 0;
  id v7 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
  id v8 = [v7 photoLibrary];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  BOOL v17 = __54__PHGraphQuery_queryForSocialGroupsWithUUIDs_options___block_invoke;
  id v18 = &unk_1E5848D28;
  id v9 = v8;
  id v19 = v9;
  BOOL v20 = &v21;
  [v9 performBlockAndWait:&v15];
  uint64_t v10 = v22[5];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ AND %K IN %@", @"primaryLabel", v10, @"uuid", v5, v15, v16, v17, v18];
    id v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:0];
    uint64_t v13 = +[PHQuery queryForType:@"PHSocialGroup" withBasePredicate:v11 inLibrary:v12];

    [v13 setFetchOptions:v6];
  }
  else
  {
    uint64_t v13 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v13;
}

void __54__PHGraphQuery_queryForSocialGroupsWithUUIDs_options___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  objc_msgSend(v2, "pl_graphCache");
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = [v7 objectIDForLabelWithCode:1000 inContext:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end