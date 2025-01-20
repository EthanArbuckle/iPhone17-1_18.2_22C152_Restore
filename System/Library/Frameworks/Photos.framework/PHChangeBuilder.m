@interface PHChangeBuilder
+ (id)changeWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 transaction:(id)a6;
+ (id)persistentChangeWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 transaction:(id)a6 enumerationContext:(id)a7;
- (BOOL)changeCountExeedsThreshold:(unint64_t)a3;
- (PHChangeBuilder)initWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 enumerationContext:(id)a6;
- (id)_uuidForDeleteChange:(id)a3 uniquedObjectID:(id)a4;
- (id)buildChange;
- (id)buildPersistentChange;
- (void)_recordChangedProperties:(id)a3 forObjectID:(id)a4;
- (void)_recordDeleteChange:(id)a3 withUniquedObjectID:(id)a4;
- (void)_recordInsertChange:(id)a3 withUniquedObjectID:(id)a4;
- (void)_recordUpdateChange:(id)a3 withUniquedObjectID:(id)a4;
- (void)recordChange:(id)a3;
- (void)recordChangesInTransaction:(id)a3;
- (void)recordNonIncrementalChanges;
- (void)recordTransaction:(id)a3;
@end

@implementation PHChangeBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedPrimaryLabelCodesByObjectId, 0);
  objc_storeStrong((id *)&self->_relationshipsByOID, 0);
  objc_storeStrong((id *)&self->_attributesByOID, 0);
  objc_storeStrong((id *)&self->_deletedUuidsByObjectId, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_updatedObjectIDs, 0);
  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
  objc_storeStrong((id *)&self->_enumerationContext, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (id)buildPersistentChange
{
  v2 = [(PHChangeBuilder *)self buildChange];
  v3 = [[PHPersistentChange alloc] initWithChange:v2];

  return v3;
}

- (id)buildChange
{
  v3 = [PHChange alloc];
  LOBYTE(v6) = self->_unknownMergeEvent;
  v4 = [(PHChange *)v3 initWithInsertedObjectIDs:self->_insertedObjectIDs updatedObjectIDs:self->_updatedObjectIDs deletedObjectIDs:self->_deletedObjectIDs deletedUuidsByObjectId:self->_deletedUuidsByObjectId deletedPrimaryLabelCodesByOID:self->_deletedPrimaryLabelCodesByObjectId changedAttributesByOID:self->_attributesByOID changedRelationshipsByOID:self->_relationshipsByOID unknownMergeEvent:v6 changeToken:self->_changeToken fetchOptions:self->_fetchOptions library:self->_library managedObjectContext:self->_context enumerationContext:self->_enumerationContext];

  return v4;
}

- (id)_uuidForDeleteChange:(id)a3 uniquedObjectID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 entity];
  v8 = [v7 name];

  v9 = [MEMORY[0x1E4F8A858] entityName];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11 = [v5 tombstone];
    v12 = [v11 objectForKeyedSubscript:@"uuid"];
  }
  else
  {
    v11 = [(objc_class *)+[PHPhotoLibrary PHObjectClassForOID:v6] entityKeyForPropertyKey:@"uuid"];
    v13 = [v5 tombstone];
    v12 = [v13 objectForKeyedSubscript:v11];
  }

  return v12;
}

- (void)_recordDeleteChange:(id)a3 withUniquedObjectID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(NSMutableSet *)self->_deletedObjectIDs addObject:v6];
  v7 = [(PHChangeBuilder *)self _uuidForDeleteChange:v14 uniquedObjectID:v6];
  [(NSMutableDictionary *)self->_deletedUuidsByObjectId _pl_setNonNilObject:v7 forKey:v6];
  v8 = [v6 entity];
  v9 = [v8 name];

  int v10 = [MEMORY[0x1E4F8A858] entityName];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    v12 = [v14 tombstone];
    v13 = [v12 valueForKey:@"primaryLabelCode"];

    if ([v13 unsignedIntValue]) {
      [(NSMutableDictionary *)self->_deletedPrimaryLabelCodesByObjectId _pl_setNonNilObject:v13 forKey:v6];
    }
  }
}

- (void)_recordChangedProperties:(id)a3 forObjectID:(id)a4
{
  id v6 = a4;
  id v8 = [a3 allObjects];
  v7 = objc_msgSend(v8, "_pl_map:", &__block_literal_global_29368);
  [MEMORY[0x1E4F8AAF8] recordChangedKeys:v7 forObjectID:v6 inAttributesByOID:self->_attributesByOID relationshipsByOID:self->_relationshipsByOID];
}

uint64_t __56__PHChangeBuilder__recordChangedProperties_forObjectID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (void)_recordUpdateChange:(id)a3 withUniquedObjectID:(id)a4
{
  updatedObjectIDs = self->_updatedObjectIDs;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableSet *)updatedObjectIDs addObject:v7];
  id v9 = [v8 updatedProperties];

  [(PHChangeBuilder *)self _recordChangedProperties:v9 forObjectID:v7];
}

- (void)_recordInsertChange:(id)a3 withUniquedObjectID:(id)a4
{
}

- (void)recordChange:(id)a3
{
  id v7 = a3;
  v4 = [v7 changedObjectID];
  id v5 = +[PHPhotoLibrary uniquedOID:v4];
  uint64_t v6 = [v7 changeType];
  switch(v6)
  {
    case 2:
      [(PHChangeBuilder *)self _recordDeleteChange:v7 withUniquedObjectID:v5];
      break;
    case 1:
      [(PHChangeBuilder *)self _recordUpdateChange:v7 withUniquedObjectID:v5];
      break;
    case 0:
      [(PHChangeBuilder *)self _recordInsertChange:v7 withUniquedObjectID:v5];
      break;
  }
}

- (void)recordChangesInTransaction:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  [v15 changes];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v10 = (void *)MEMORY[0x19F389B10]();
        int v11 = [v9 changedObjectID];
        if (v11)
        {
          [(PHChangeBuilder *)self recordChange:v9];
        }
        else
        {
          v12 = PLBackendGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            v13 = objc_msgSend(v9, "_pl_prettyDescription");
            id v14 = objc_msgSend(v15, "_pl_prettyDescriptionWithIndent:", 1);
            *(_DWORD *)buf = 138412546;
            v21 = v13;
            __int16 v22 = 2112;
            v23 = v14;
            _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_FAULT, "PHChangeBuilder: changedObjectID is nil\n%@%@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }
}

- (void)recordNonIncrementalChanges
{
  self->_unknownMergeEvent = 1;
}

- (BOOL)changeCountExeedsThreshold:(unint64_t)a3
{
  unint64_t v5 = [(PHPersistentChangeFetchOptions *)self->_fetchOptions maximumChangeThreshold];
  if (v5)
  {
    unint64_t v6 = [(PHPersistentChangeFetchOptions *)self->_fetchOptions maximumChangeThreshold];
    if (v6) {
      BOOL v7 = v6 >= a3;
    }
    else {
      BOOL v7 = 1;
    }
    LOBYTE(v5) = !v7;
  }
  return v5;
}

- (void)recordTransaction:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__PHChangeBuilder_recordTransaction___block_invoke;
  v7[3] = &unk_1E5848DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSManagedObjectContext *)context performBlockAndWait:v7];
}

void __37__PHChangeBuilder_recordTransaction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) token];
  uint64_t v3 = +[PHPersistentChangeToken tokenWithPersistentHistoryToken:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  id v8 = [*(id *)(a1 + 40) changes];
  int v6 = objc_msgSend(*(id *)(a1 + 32), "changeCountExeedsThreshold:", objc_msgSend(v8, "count"));
  BOOL v7 = *(void **)(a1 + 32);
  if (v6) {
    [v7 recordNonIncrementalChanges];
  }
  else {
    [v7 recordChangesInTransaction:*(void *)(a1 + 40)];
  }
}

- (PHChangeBuilder)initWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 enumerationContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PHChangeBuilder;
  id v15 = [(PHChangeBuilder *)&v33 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_library, a4);
    objc_storeStrong((id *)&v16->_fetchOptions, a5);
    objc_storeStrong((id *)&v16->_enumerationContext, a6);
    long long v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    insertedObjectIDs = v16->_insertedObjectIDs;
    v16->_insertedObjectIDs = v17;

    long long v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updatedObjectIDs = v16->_updatedObjectIDs;
    v16->_updatedObjectIDs = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deletedObjectIDs = v16->_deletedObjectIDs;
    v16->_deletedObjectIDs = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedUuidsByObjectId = v16->_deletedUuidsByObjectId;
    v16->_deletedUuidsByObjectId = v23;

    uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributesByOID = v16->_attributesByOID;
    v16->_attributesByOID = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationshipsByOID = v16->_relationshipsByOID;
    v16->_relationshipsByOID = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedPrimaryLabelCodesByObjectId = v16->_deletedPrimaryLabelCodesByObjectId;
    v16->_deletedPrimaryLabelCodesByObjectId = v29;

    v31 = v16;
  }

  return v16;
}

+ (id)persistentChangeWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 transaction:(id)a6 enumerationContext:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v16)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PHChangeBuilder.m", 60, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];
  }
  long long v18 = [v16 token];

  if (!v18)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PHChangeBuilder.m", 61, @"Invalid parameter not satisfying: %@", @"transaction.token" object file lineNumber description];
  }
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = v17;
  v32 = v16;
  id v19 = v16;
  id v20 = v17;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  v24 = pl_result_with_autoreleasepool();

  return v24;
}

id __107__PHChangeBuilder_persistentChangeWithManagedObjectContext_library_options_transaction_enumerationContext___block_invoke(void *a1)
{
  v2 = [[PHChangeBuilder alloc] initWithManagedObjectContext:a1[4] library:a1[5] options:a1[6] enumerationContext:a1[7]];
  [(PHChangeBuilder *)v2 recordTransaction:a1[8]];
  uint64_t v3 = [(PHChangeBuilder *)v2 buildPersistentChange];

  return v3;
}

+ (id)changeWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 transaction:(id)a6
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v9 = v18;
  id v10 = v17;
  id v11 = v16;
  id v12 = v15;
  id v13 = pl_result_with_autoreleasepool();

  return v13;
}

id __78__PHChangeBuilder_changeWithManagedObjectContext_library_options_transaction___block_invoke(void *a1)
{
  v2 = [[PHChangeBuilder alloc] initWithManagedObjectContext:a1[4] library:a1[5] options:a1[6] enumerationContext:0];
  [(PHChangeBuilder *)v2 recordTransaction:a1[7]];
  uint64_t v3 = [(PHChangeBuilder *)v2 buildChange];

  return v3;
}

@end