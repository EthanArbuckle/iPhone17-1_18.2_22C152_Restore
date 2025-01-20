@interface NSFetchedResultsController
+ (uint64_t)_CoreDataSectionCachesPath;
+ (uint64_t)_insertIndexForObject:(void *)a3 inArray:(uint64_t)a4 lowIdx:(uint64_t)a5 highIdx:(void *)a6 sortDescriptors:;
+ (void)deleteCacheWithName:(NSString *)name;
+ (void)initialize;
- (BOOL)_updateFetchedObjectsWithInsertChange:(uint64_t)a1;
- (BOOL)performFetch:(NSError *)error;
- (NSArray)fetchedObjects;
- (NSArray)sectionIndexTitles;
- (NSArray)sections;
- (NSFetchRequest)fetchRequest;
- (NSFetchedResultsController)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext:(NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name;
- (NSIndexPath)indexPathForObject:(id)object;
- (NSInteger)sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)sectionIndex;
- (NSManagedObjectContext)managedObjectContext;
- (NSString)cacheName;
- (NSString)sectionIndexTitleForSectionName:(NSString *)sectionName;
- (NSString)sectionNameKeyPath;
- (__CFString)_sectionNameForObject:(__CFString *)result;
- (id)_fetchedObjects;
- (id)_sectionCachePath;
- (id)delegate;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (uint64_t)_appendAffectedStoreInfoToData:(void *)a3 adjustedOffset:;
- (uint64_t)_computeSectionInfo:(id *)a3 error:;
- (uint64_t)_conditionallyDispatchSnapshotToDelegate:(void *)a3 updatesInfo:;
- (uint64_t)_core_managedObjectContextDidChange:(uint64_t)result;
- (uint64_t)_fetchedObjectsArrayOfObjectIDs;
- (uint64_t)_indexPathForIndex:(void *)a1;
- (uint64_t)_keyPathContainsNonPersistedProperties:(void *)a1;
- (uint64_t)_objectInResults:(uint64_t)a1;
- (uint64_t)_preprocessDeletedObjects:(void *)a3 deletesInfo:(void *)a4 sectionsWithDeletes:;
- (uint64_t)_preprocessUpdatedObjects:(void *)a3 insertsInfo:(void *)a4 deletesInfo:(void *)a5 updatesInfo:(void *)a6 sectionsWithDeletes:(void *)a7 newSectionNames:(void *)a8 treatAsRefreshes:;
- (uint64_t)_recursivePerformBlockAndWait:(void *)a3 withContext:;
- (uint64_t)_resolveSectionIndexTitleForSectionName:(uint64_t)a1;
- (uint64_t)_restoreCachedSectionInfo;
- (uint64_t)_updateFetchedObjectsWithDeleteChange:(unint64_t)a1;
- (uint64_t)_updateIndexCacheWithFetchedObjects;
- (unint64_t)_indexOfCachedID:(uint64_t)a1;
- (unint64_t)_indexOfFetchedID:(int)a3 isManagedObjectID:;
- (void)_core_managedObjectContextDidSave:(uint64_t)a1;
- (void)_lowerMoveOperationsToUpdatesForSection:(void *)a3 withInsertedObjects:(void *)a4 deletedObjects:(void *)a5 updatedObjects:;
- (void)_makeMutableFetchedObjects;
- (void)_managedObjectContextDidChange:(id)a3;
- (void)_managedObjectContextDidChangeObjectIDs:(id)a3;
- (void)_managedObjectContextDidMutateObjectIDs:(id)a3;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_updateSectionOffsetsStartingAtSection:(uint64_t)a1;
- (void)dealloc;
- (void)setDelegate:(id)delegate;
@end

@implementation NSFetchedResultsController

uint64_t __72__NSFetchedResultsController__recursivePerformBlockAndWait_withContext___block_invoke(void *a1)
{
  if (a1[4]) {
    return -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](a1[5], a1[6]);
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

void __43__NSFetchedResultsController_performFetch___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96) = 0;
  *(void *)(*(void *)(a1 + 32) + 136) = 0;

  *(void *)(*(void *)(a1 + 32) + 144) = 0;
  *(void *)(*(void *)(a1 + 32) + 104) = 0;

  *(void *)(*(void *)(a1 + 32) + 112) = 0;
  *(void *)(*(void *)(a1 + 32) + 120) = 0;

  *(void *)(*(void *)(a1 + 32) + 128) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 72) &= ~4u;
  *(_DWORD *)(*(void *)(a1 + 32) + 72) &= ~2u;
  [*(id *)(*(void *)(a1 + 32) + 8) setReturnsObjectsAsFaults:1];
  if (BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88)
    && !*(unsigned char *)(a1 + 56)
    && (![*(id *)(*(void *)(a1 + 32) + 16) hasChanges]
     || ([*(id *)(*(void *)(a1 + 32) + 8) includesPendingChanges] & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -[NSFetchedResultsController _restoreCachedSectionInfo](*(void *)(a1 + 32));
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 96))
  {
    *(void *)(*(void *)(a1 + 32) + 96) = (id)[*(id *)(v2 + 16) executeFetchRequest:*(void *)(v2 + 8) error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
    if (!*(unsigned char *)(a1 + 56))
    {
      *(void *)(*(void *)(a1 + 32) + 144) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(*(void *)(a1 + 32) + 136) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "count"));
      -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](*(void *)(a1 + 32));
    }
    if (!BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88) || *(unsigned char *)(a1 + 56)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -[NSFetchedResultsController _restoreCachedSectionInfo](*(void *)(a1 + 32));
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  if (v4)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if ([*(id *)(v3 + 104) count]) {
        goto LABEL_22;
      }
      uint64_t v3 = *(void *)(a1 + 32);
      v4 = *(void **)(v3 + 96);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -[NSFetchedResultsController _computeSectionInfo:error:](v3, v4, (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
      || (uint64_t v5 = *(void *)(a1 + 32), *(void *)(v5 + 40))
      && *(void *)(v5 + 80)
      && ((uint64_t v6 = *(void *)(v5 + 16)) == 0 || (*(unsigned char *)(v6 + 41) & 0x80) == 0)
      && (*(_DWORD *)(v5 + 72) |= 1u,
          -[NSFetchedResultsController _core_managedObjectContextDidSave:](*(void *)(a1 + 32), 0),
          !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)))
    {

      *(void *)(*(void *)(a1 + 32) + 96) = 0;
      *(void *)(*(void *)(a1 + 32) + 136) = 0;

      *(void *)(*(void *)(a1 + 32) + 144) = 0;
    }
  }
LABEL_22:
  [*(id *)(*(void *)(a1 + 32) + 8) setReturnsObjectsAsFaults:*(unsigned __int8 *)(a1 + 57)];
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 96))
  {

    *(void *)(*(void *)(a1 + 32) + 104) = 0;
    *(void *)(*(void *)(a1 + 32) + 112) = 0;

    *(void *)(*(void *)(a1 + 32) + 120) = 0;
    *(void *)(*(void *)(a1 + 32) + 128) = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 72) &= ~4u;
    *(_DWORD *)(*(void *)(a1 + 32) + 72) &= ~2u;
  }
}

- (uint64_t)_computeSectionInfo:(id *)a3 error:
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  v4 = a2;
  uint64_t v5 = result;
  uint64_t v6 = [a2 count];

  *(void *)(v5 + 104) = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  *(void *)(v5 + 112) = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  *(void *)(v5 + 120) = 0;
  *(void *)(v5 + 128) = 0;
  int v7 = *(_DWORD *)(v5 + 72);
  unint64_t v88 = v6;
  if (!v6 && (v7 & 8) != 0) {
    return 1;
  }
  if ((v7 & 8) == 0)
  {
    uint64_t v8 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], v5, 0, 0, 0, 0);
    v9 = v8;
    if (v8)
    {
      v8[5] = v88;

      v9[7] = 0;
    }
    [*(id *)(v5 + 104) addObject:v9];

    return 1;
  }
  if ([*(id *)(v5 + 8) includesPendingChanges]
    && (([*(id *)(v5 + 16) hasChanges] & 1) != 0 || objc_msgSend(*(id *)(v5 + 16), "parentContext"))
    || (*(unsigned char *)(v5 + 73) & 0x20) != 0
    || [*(id *)(v5 + 8) fetchLimit]
    || [*(id *)(v5 + 8) fetchOffset])
  {
    goto LABEL_14;
  }
  v36 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "affectedStores"), "copy");
  if (!v36) {
    v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "persistentStoreCoordinator"), "persistentStores"), "copy");
  }
  id v37 = v36;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  uint64_t v38 = [v36 countByEnumeratingWithState:&v100 objects:v106 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v101 != v40) {
          objc_enumerationMutation(v36);
        }
        if ((__CFString *)[*(id *)(*((void *)&v100 + 1) + 8 * i) type] != @"SQLite") {
          goto LABEL_14;
        }
      }
      uint64_t v39 = [v36 countByEnumeratingWithState:&v100 objects:v106 count:16];
    }
    while (v39);
  }
  v85 = v4;
  v83 = a3;
  id v42 = (id)objc_msgSend((id)objc_msgSend((id)v5, "fetchRequest"), "copy");
  [v42 setResultType:2];
  [v42 setIncludesPropertyValues:1];
  [v42 setFetchBatchSize:0];
  v43 = (void *)[(id)v5 sectionNameKeyPath];
  v44 = objc_alloc_init(NSExpressionDescription);
  -[NSExpressionDescription setExpression:](v44, "setExpression:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForFunction:arguments:", @"count:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", NSClassFromString((NSString *)@"_NSPredicateUtilities")), @"distinct:", objc_msgSend(MEMORY[0x1E4F1C978],
            "arrayWithObject:",
            [MEMORY[0x1E4F28C68] expressionForEvaluatedObject])))));
  [(NSPropertyDescription *)v44 setName:@"sectionCount"];
  [(NSExpressionDescription *)v44 setExpressionResultType:200];
  objc_msgSend(v42, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v43, v44, 0));
  objc_msgSend(v42, "setPropertiesToGroupBy:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v43, 0));
  v45 = (void *)[v42 sortDescriptors];
  if ([v45 count])
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v96 objects:v105 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = 0;
      uint64_t v49 = *(void *)v97;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v97 != v49) {
            objc_enumerationMutation(v45);
          }
          v51 = *(void **)(*((void *)&v96 + 1) + 8 * j);
          if (objc_msgSend(v43, "isEqualToString:", objc_msgSend(v51, "key"))) {
            uint64_t v48 = (uint64_t)v51;
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v96 objects:v105 count:16];
      }
      while (v47);
      v4 = v85;
      if (v48) {
        goto LABEL_68;
      }
    }
    uint64_t v52 = objc_msgSend((id)objc_msgSend(v45, "objectAtIndex:", 0), "ascending");
  }
  else
  {
    uint64_t v52 = 1;
  }
  uint64_t v48 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v43 ascending:v52];
LABEL_68:
  objc_msgSend(v42, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v48));
  id v95 = 0;
  v53 = objc_msgSend((id)objc_msgSend((id)v5, "managedObjectContext"), "executeFetchRequest:error:", v42, &v95);
  if (v53)
  {
    v54 = v53;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v55 = [v53 countByEnumeratingWithState:&v91 objects:v104 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      id obja = v54;
      uint64_t v57 = 0;
      uint64_t v89 = *(void *)v92;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v92 != v89) {
            objc_enumerationMutation(obja);
          }
          v59 = *(void **)(*((void *)&v91 + 1) + 8 * k);
          v60 = (void *)MEMORY[0x18C127630]();
          v61 = (void *)[v59 valueForKeyPath:v43];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *(_DWORD *)(v5 + 72) |= 0x10u;
            v62 = (__CFString *)(id)[v61 _retainedURIString];
          }
          else
          {
            v62 = (__CFString *)[v61 description];
          }
          v69 = v62;
          if (!v62)
          {
            _NSCoreDataLog(1, @"(NSFetchedResultsController) A section returned nil value for section name key path '%@'. Objects will be placed in unnamed section", v63, v64, v65, v66, v67, v68, *(void *)(v5 + 24));
            v69 = &stru_1ED787880;
          }
          uint64_t v70 = [*(id *)(v5 + 112) objectForKey:v69];
          if (v70)
          {
            uint64_t v71 = v70;
            uint64_t v72 = objc_msgSend((id)objc_msgSend(v59, "valueForKeyPath:", @"sectionCount"), "unsignedIntValue");
            *(void *)(v71 + 40) = [(id)v71 numberOfObjects] + v72;

            *(void *)(v71 + 56) = 0;
          }
          else
          {
            v73 = (void *)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v69);
            v74 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], v5, v69, (void *)[v59 valueForKeyPath:v43], v73, v57);
            unsigned int v75 = objc_msgSend((id)objc_msgSend(v59, "valueForKeyPath:", @"sectionCount"), "unsignedIntValue");
            uint64_t v72 = v75;
            if (v74)
            {
              v74[5] = v75;

              v74[7] = 0;
            }
            [*(id *)(v5 + 104) addObject:v74];
            [*(id *)(v5 + 112) setObject:v74 forKey:v69];
          }
          v57 += v72;
        }
        uint64_t v56 = [obja countByEnumeratingWithState:&v91 objects:v104 count:16];
      }
      while (v56);
    }
    return 1;
  }
  [v95 userInfo];
  _NSCoreDataLog(1, @"Fetching ERROR during section computation with request = %@ and error = %@ and userInfo = %@", v76, v77, v78, v79, v80, v81, (uint64_t)v42);
  a3 = v83;
LABEL_14:
  v10 = (void *)[MEMORY[0x1E4F1CA80] set];
  if ([*(id *)(v5 + 8) resultType] != 2)
  {
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __72__NSFetchedResultsController_PrivateMethods___computeSectionInfo_error___block_invoke;
    v90[3] = &unk_1E544BC40;
    v90[5] = v5;
    v90[6] = v88;
    v90[4] = v4;
    -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](v5, (uint64_t)v90, *(void **)(v5 + 16));
  }
  v11 = (__CFString *)[v4 objectAtIndex:0];
  v12 = -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)v5, v11);
  id v13 = (id)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v12);
  v14 = [_NSDefaultSectionInfo alloc];
  if ([*(id *)(v5 + 8) resultType] != 1)
  {
    if ([*(id *)(v5 + 8) resultType] == 4) {
      v11 = @"Count";
    }
    else {
      v11 = (__CFString *)[(__CFString *)v11 valueForKeyPath:*(void *)(v5 + 24)];
    }
  }
  obuint64_t j = v13;
  v15 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:](v14, v5, v12, v11, v13, 0);
  [*(id *)(v5 + 104) addObject:v15];
  [*(id *)(v5 + 112) setObject:v15 forKey:v12];

  if (v88 < 2)
  {
    uint64_t v16 = 1;
LABEL_33:

    goto LABEL_34;
  }
  v84 = v4;
  v82 = a3;
  BOOL v17 = 0;
  uint64_t v18 = 1;
  uint64_t v16 = 1;
  while (1)
  {
    v19 = (void *)MEMORY[0x18C127630]();
    v20 = (__CFString *)[v84 objectAtIndex:v18];
    v21 = -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)v5, v20);
    if (([(__CFString *)v21 isEqualToString:v12] & 1) == 0) {
      break;
    }
LABEL_32:
    ++v16;
    BOOL v17 = ++v18 >= v88;
    if (v88 == v18) {
      goto LABEL_33;
    }
  }
  if (![v10 containsObject:v21])
  {
    [v10 addObject:v12];
    if (v15)
    {
      v15[5] = v16;

      v15[7] = 0;
    }

    v12 = v21;
    id v22 = (id)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v12);
    v23 = [_NSDefaultSectionInfo alloc];
    if ([*(id *)(v5 + 8) resultType] == 1)
    {
      v24 = v20;
    }
    else
    {
      uint64_t v25 = [*(id *)(v5 + 8) resultType];
      v24 = @"Count";
      if (v25 != 4) {
        v24 = (__CFString *)[(__CFString *)v20 valueForKeyPath:*(void *)(v5 + 24), @"Count"];
      }
    }
    obuint64_t j = v22;
    v15 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:](v23, v5, v12, v24, v22, v18);
    [*(id *)(v5 + 104) addObject:v15];
    [*(id *)(v5 + 112) setObject:v15 forKey:v12];

    uint64_t v16 = 0;
    goto LABEL_32;
  }
  uint64_t v26 = [NSString stringWithFormat:@"The fetched object at index %lu has an out of order section name '%@'. Objects must be sorted by section name", v18, v12];
  if (v82)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    id *v82 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v26, @"reason"));
  }
  uint64_t v28 = objc_opt_class();
  _NSCoreDataLog(1, @"(%@) %@", v29, v30, v31, v32, v33, v34, v28);

  *(void *)(v5 + 104) = 0;
  *(void *)(v5 + 112) = 0;

  *(void *)(v5 + 120) = 0;
  *(void *)(v5 + 128) = 0;

  if (v17)
  {
LABEL_34:
    if (v15)
    {
      v15[5] = v16;

      v15[7] = 0;
    }
    return 1;
  }
  if (v82) {
    id v35 = *v82;
  }
  return 0;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSObjectsChangedInManagingContextPrivateNotification", self->_managedObjectContext);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification", self->_managedObjectContext);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification", self->_managedObjectContext);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification", -[NSManagedObjectContext persistentStoreCoordinator](self->_managedObjectContext, "persistentStoreCoordinator"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSManagedObjectContextPrivateDidMutateObjectIDsNotification", self->_managedObjectContext);

  v3.receiver = self;
  v3.super_class = (Class)NSFetchedResultsController;
  [(NSFetchedResultsController *)&v3 dealloc];
}

- (BOOL)performFetch:(NSError *)error
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  uint64_t v20 = 0;
  NSFetchRequestResultType v5 = [(NSFetchRequest *)self->_fetchRequest resultType];
  BOOL v6 = [(NSFetchRequest *)self->_fetchRequest returnsObjectsAsFaults];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__NSFetchedResultsController_performFetch___block_invoke;
  v12[3] = &unk_1E544D4D0;
  BOOL v13 = v5 == 2;
  v12[4] = self;
  v12[5] = &v21;
  v12[6] = &v15;
  BOOL v14 = v6;
  -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:]((uint64_t)self, (uint64_t)v12, self->_managedObjectContext);
  if (!v16[5])
  {
    id v7 = [(NSFetchedResultsController *)self delegate];
    if (v7)
    {
      -[NSFetchedResultsController _conditionallyDispatchSnapshotToDelegate:updatesInfo:]((uint64_t)self, v7, (void *)[MEMORY[0x1E4F1CAD0] set]);
    }
  }
  id v8 = (id)v16[5];
  if (error)
  {
    v9 = (NSError *)v16[5];
    if (v9) {
      *error = v9;
    }
  }
  char v10 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v10;
}

- (uint64_t)_conditionallyDispatchSnapshotToDelegate:(void *)a3 updatesInfo:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(result + 73))
    {
      v4 = NSClassFromString((NSString *)@"NSDiffableDataSourceSnapshot");
      if (!v4) {
        v4 = NSClassFromString((NSString *)@"_PFDiffableDataSourceSnapshot");
      }
      id v5 = objc_alloc_init(v4);
      context = (void *)MEMORY[0x18C127630]();
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v22 = v3;
      obuint64_t j = *(id *)(v3 + 104);
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(obj);
            }
            char v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v11 = (void *)MEMORY[0x18C127630]();
            uint64_t v12 = [v10 name];
            if (v12) {
              BOOL v13 = (__CFString *)v12;
            }
            else {
              BOOL v13 = @"d69e6c783a242772974cfc99189691b88e9d37c3";
            }
            uint64_t v33 = v13;
            objc_msgSend(v5, "appendSectionsWithIdentifiers:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v33, 1));
            objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", objc_msgSend((id)objc_msgSend(v10, "objects"), "valueForKey:", @"objectID"), v13);
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v7);
      }
      if ([a3 count])
      {
        BOOL v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v15 = [a3 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(a3);
              }
              objc_msgSend(v14, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "object"), "objectID"));
            }
            uint64_t v16 = [a3 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v16);
        }
        [v5 reloadItemsWithIdentifiers:v14];
      }
      [a2 controller:v22 didChangeContentWithSnapshot:v5];

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_recursivePerformBlockAndWait:(void *)a3 withContext:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = [a3 parentContext];
    if ([a3 concurrencyType])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __72__NSFetchedResultsController__recursivePerformBlockAndWait_withContext___block_invoke;
      v7[3] = &unk_1E544D4F8;
      v7[4] = v6;
      v7[5] = v5;
      v7[6] = a2;
      return [a3 performBlockAndWait:v7];
    }
    else
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)a3);
      if (v6) {
        -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](v5, a2);
      }
      else {
        (*(void (**)(uint64_t))(a2 + 16))(a2);
      }
      return -[NSManagedObjectContext unlockObjectStore]((uint64_t)a3);
    }
  }
  return result;
}

- (NSArray)fetchedObjects
{
  id fetchedObjects = self->_fetchedObjects;
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    id v4 = (id)[fetchedObjects copy];
  }
  else {
    id v4 = fetchedObjects;
  }

  return (NSArray *)v4;
}

- (id)_fetchedObjects
{
  return self->_fetchedObjects;
}

void __75__NSFetchedResultsController_PrivateMethods___managedObjectContextDidSave___block_invoke(uint64_t a1)
{
}

- (void)setDelegate:(id)delegate
{
  id v4 = (id *)self->_delegate;
  id v29 = delegate;
  if (!v4)
  {
LABEL_7:
    if (!delegate) {
      return;
    }
    if (objc_opt_respondsToSelector()) {
      int v8 = 2048;
    }
    else {
      int v8 = 0;
    }
    self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v8);
    int v9 = BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (NSClassFromString((NSString *)@"NSDiffableDataSourceSnapshot")
       || NSClassFromString((NSString *)@"_PFDiffableDataSourceSnapshot")))
    {
      int v10 = 256;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || self->_sectionNameKeyPath)
      {
        if (objc_opt_respondsToSelector()) {
          _NSCoreDataLog(2, @"Difference delegate method is not supported when fetched results controller is configured with a sectionNameKeyPath", v12, v13, v14, v15, v16, v17, v28);
        }
        char v18 = objc_opt_respondsToSelector();
        if (v18) {
          int v19 = 128;
        }
        else {
          int v19 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v19);
        char v20 = objc_opt_respondsToSelector();
        if (v20) {
          int v21 = 512;
        }
        else {
          int v21 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v21);
        char v22 = objc_opt_respondsToSelector();
        if (v22) {
          int v23 = 1024;
        }
        else {
          int v23 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v23);
        char v24 = objc_opt_respondsToSelector();
        if (v24) {
          int v25 = 4096;
        }
        else {
          int v25 = 0;
        }
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v25);
        if (v9 && (v18 & 1) == 0 && (v20 & 1) == 0 && (v22 & 1) == 0 && (v24 & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_16;
      }
      managedObjectContext = self->_managedObjectContext;
      if (managedObjectContext) {
        atomic_store(1u, (unsigned __int8 *)&managedObjectContext->_generatedMutatedIDsNotification);
      }
      int v10 = 64;
    }
    *(_DWORD *)&self->_flags |= v10;
LABEL_16:
    if ([(NSFetchRequest *)self->_fetchRequest resultType] == 2)
    {
      if (BYTE4(z9dsptsiQ80etb9782fsrs98bfdle88))
      {
        v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"%@ does not support both change tracking and fetch request's with NSDictionaryResultType", objc_opt_class()), 0 reason userInfo];
        objc_exception_throw(v11);
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__managedObjectContextDidChange_, @"_NSObjectsChangedInManagingContextPrivateNotification", -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__managedObjectContextDidChangeObjectIDs_, @"_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification", -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__managedObjectContextDidMutateObjectIDs_, @"_NSManagedObjectContextPrivateDidMutateObjectIDsNotification", -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
      long long v26 = [(NSFetchedResultsController *)self managedObjectContext];
      if (v26) {
        atomic_store(1u, (unsigned __int8 *)&v26->_generatedMutatedIDsNotification);
      }
    }
LABEL_46:
    self->_delegate = [[_PFWeakReference alloc] initWithObject:v29];
    return;
  }
  id WeakRetained = objc_loadWeakRetained(v4 + 1);
  if (WeakRetained) {
    BOOL v6 = WeakRetained == v29;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    uint64_t v7 = WeakRetained;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSObjectsChangedInManagingContextPrivateNotification", -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification", -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"_NSManagedObjectContextPrivateDidMutateObjectIDsNotification", -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    *(_DWORD *)&self->_flags &= 0xFFFFE03F;
    self->_delegate = 0;

    delegate = v29;
    goto LABEL_7;
  }

  MEMORY[0x1F41817F8](WeakRetained, v29);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)_managedObjectContextDidChangeObjectIDs:(id)a3
{
  uint64_t v4 = [a3 userInfo];

  -[NSFetchedResultsController _core_managedObjectContextDidChange:]((uint64_t)self, v4);
}

- (NSString)sectionNameKeyPath
{
  return self->_sectionNameKeyPath;
}

- (BOOL)_updateFetchedObjectsWithInsertChange:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__CFString *)[a2 object];
  if ((*(unsigned char *)(a1 + 72) & 8) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 104) lastObject];
LABEL_5:
    BOOL v6 = (void *)v4;
    goto LABEL_6;
  }
  uint64_t v5 = -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)a1, v3);
  if (v5)
  {
    uint64_t v4 = [*(id *)(a1 + 112) objectForKey:v5];
    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_6:
  unint64_t v7 = [v6 numberOfObjects];
  unint64_t v8 = [*(id *)(a1 + 96) count];
  if (v7 > v8) {
    return v7 <= v8;
  }
  if (!v6)
  {
    if ((*(unsigned char *)(a1 + 72) & 8) != 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v12 = *(void **)(a1 + 104);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:&v42 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v39;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * v16);
            if (v17) {
              uint64_t v18 = *(void *)(v17 + 32);
            }
            else {
              uint64_t v18 = 0;
            }
            objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v18));
            ++v16;
          }
          while (v14 != v16);
          uint64_t v19 = [v12 countByEnumeratingWithState:&v38 objects:&v42 count:16];
          uint64_t v14 = v19;
        }
        while (v19);
      }
      uint64_t v20 = +[NSFetchedResultsController _insertIndexForObject:inArray:lowIdx:highIdx:sortDescriptors:]((uint64_t)NSFetchedResultsController, (uint64_t)v3, v11, 0, [v11 count] - 1, objc_msgSend((id)objc_msgSend((id)a1, "fetchRequest"), "sortDescriptors"));

      int v21 = -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)a1, v3);
      char v22 = v3;
      if ([*(id *)(a1 + 8) resultType] != 1)
      {
        if ([*(id *)(a1 + 8) resultType] == 4) {
          char v22 = @"Count";
        }
        else {
          char v22 = (__CFString *)[(__CFString *)v3 valueForKeyPath:*(void *)(a1 + 24)];
        }
      }
      int v23 = (void *)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](a1, (uint64_t)v21);
      if (v20)
      {
        char v24 = (void *)[*(id *)(a1 + 104) objectAtIndex:v20 - 1];
        if (v24) {
          uint64_t v25 = v24[4];
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v26 = [v24 numberOfObjects] + v25;
      }
      else
      {
        uint64_t v26 = 0;
      }
      BOOL v6 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], a1, v21, v22, v23, v26);
      [*(id *)(a1 + 104) insertObject:v6 atIndex:v20];
      objc_msgSend(*(id *)(a1 + 112), "setObject:forKey:", v6, objc_msgSend(v6, "name"));

      *(void *)(a1 + 120) = 0;
      *(void *)(a1 + 128) = 0;
    }
    else
    {
      BOOL v6 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], a1, 0, 0, 0, 0);
      [*(id *)(a1 + 104) addObject:v6];

      if (!*(void *)(a1 + 104))
      {
        BOOL v6 = 0;
LABEL_11:
        uint64_t v9 = 0;
        char v10 = 1;
        goto LABEL_36;
      }
    }
    if (!v6) {
      goto LABEL_11;
    }
  }
  char v10 = 0;
  uint64_t v9 = v6[4];
LABEL_36:
  unint64_t v27 = +[NSFetchedResultsController _insertIndexForObject:inArray:lowIdx:highIdx:sortDescriptors:]((uint64_t)NSFetchedResultsController, (uint64_t)v3, *(void **)(a1 + 96), v9, v9 + [v6 numberOfObjects] - 1, objc_msgSend((id)objc_msgSend((id)a1, "fetchRequest"), "sortDescriptors"));
  if (v27 < [*(id *)(a1 + 96) count] && objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v27))
  {
    uint64_t v28 = [*(id *)(a1 + 96) count];
    id v29 = [_PFIndexCacheOffset alloc];
    if (v29)
    {
      v42.receiver = v29;
      v42.super_class = (Class)_PFIndexCacheOffset;
      long long v30 = objc_msgSendSuper2(&v42, sel_init);
      long long v31 = v30;
      if (v30)
      {
        v30[1] = v27;
        v30[2] = v28;
        v30[3] = 1;
      }
    }
    else
    {
      long long v31 = 0;
    }
    [*(id *)(a1 + 144) addObject:v31];
  }
  if ((*(unsigned char *)(a1 + 72) & 4) == 0) {
    -[NSFetchedResultsController _makeMutableFetchedObjects](a1);
  }
  if ([*(id *)(a1 + 96) count] > v27 && objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v27))
  {
    uint64_t v32 = [*(id *)(a1 + 96) count];
    uint64_t v33 = [_PFIndexCacheOffset alloc];
    if (v33)
    {
      v42.receiver = v33;
      v42.super_class = (Class)_PFIndexCacheOffset;
      uint64_t v34 = objc_msgSendSuper2(&v42, sel_init);
      uint64_t v35 = v34;
      if (v34)
      {
        v34[1] = v27;
        v34[2] = v32;
        v34[3] = 1;
      }
    }
    else
    {
      uint64_t v35 = 0;
    }
    [*(id *)(a1 + 144) addObject:v35];
  }
  [*(id *)(a1 + 96) insertObject:v3 atIndex:v27];
  objc_msgSend(*(id *)(a1 + 136), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v27), -[__CFString objectID](v3, "objectID"));
  uint64_t v36 = [v6 numberOfObjects];
  if ((v10 & 1) == 0)
  {
    v6[5] = v36 + 1;

    v6[7] = 0;
  }
  -[NSFetchedResultsController _updateSectionOffsetsStartingAtSection:](a1, v6);
  return v7 <= v8;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
  if (!indexPath && BYTE4(z9dsptsiQ80etb9782fsrs98bfdle88)) {
    return 0;
  }
  unint64_t v5 = [(NSIndexPath *)indexPath indexAtPosition:0];
  unint64_t v6 = [(NSIndexPath *)indexPath indexAtPosition:1];
  sections = self->_sections;
  if (sections)
  {
    uint64_t v8 = [(NSMutableOrderedSet *)sections count];
    if (v5 >= [(NSMutableOrderedSet *)self->_sections count])
    {
      if (v8)
      {
        _NSCoreDataLog(1, @"NSFetchedResultsController: no section at index %lu in sections list", v9, v10, v11, v12, v13, v14, v5);
        if (HIBYTE(dword_1EB270AB0))
        {
          uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v16 = *MEMORY[0x1E4F1C3C8];
          uint64_t v17 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"no section at index %lu", v5);
          uint64_t v18 = v15;
          uint64_t v19 = v16;
          goto LABEL_24;
        }
        return 0;
      }
LABEL_14:
      _NSCoreDataLog(1, @"NSFetchedResultsController: cannot access fetched objects before -performFetch:", v9, v10, v11, v12, v13, v14, v34);
      if (HIBYTE(dword_1EB270AB0))
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        uint64_t v17 = @"cannot access fetched objects before -performFetch:";
        goto LABEL_24;
      }
      return 0;
    }
  }
  else if (v5 >= [0 count])
  {
    goto LABEL_14;
  }
  uint64_t v20 = (void *)[(NSMutableOrderedSet *)self->_sections objectAtIndex:v5];
  if (v6 >= [v20 numberOfObjects])
  {
    _NSCoreDataLog(1, @"NSFetchedResultsController: no object at index %lu in section at index %lu", v21, v22, v23, v24, v25, v26, v6);
    if (HIBYTE(dword_1EB270AB0))
    {
      uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v33 = *MEMORY[0x1E4F1C3C8];
      uint64_t v17 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"no object at index %lu in section at index %lu", v6, v5);
      uint64_t v18 = v32;
      uint64_t v19 = v33;
LABEL_24:
      objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v17 userInfo:0]);
    }
    return 0;
  }
  if (v20) {
    uint64_t v27 = v20[4];
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v27 + v6;
  if (v27 + v6 >= [self->_fetchedObjects count]) {
    id v29 = 0;
  }
  else {
    id v29 = (void *)[self->_fetchedObjects objectAtIndex:v28];
  }
  id v31 = v29;

  return v31;
}

- (NSFetchedResultsController)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext:(NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!fetchRequest || !context)
  {
    uint64_t v34 = [NSString stringWithFormat:@"An instance of %@ requires a non-nil fetchRequest and managedObjectContext", objc_opt_class()];
    goto LABEL_40;
  }
  if (![(NSFetchRequest *)fetchRequest sortDescriptors])
  {
    uint64_t v34 = [NSString stringWithFormat:@"An instance of %@ requires a fetch request with sort descriptors", objc_opt_class()];
LABEL_40:
    uint64_t v35 = v34;

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v35 userInfo:0]);
  }
  v41.receiver = self;
  v41.super_class = (Class)NSFetchedResultsController;
  uint64_t v11 = [(NSFetchedResultsController *)&v41 init];
  if (v11)
  {
    v11->_fetchRequest = fetchRequest;
    v11->_managedObjectContext = context;
    uint64_t v12 = [(NSString *)sectionNameKeyPath copy];
    v11->_sectionNameKeyPath = (NSString *)v12;
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFFFF7 | (8 * (v12 != 0)));
    uint64_t v13 = [(NSFetchRequest *)v11->_fetchRequest predicate];
    v11->_originalPredicate = v13;
    if (v13) {
      v11->_remappedPredicate = (NSPredicate *)[+[_NSMemoryStorePredicateRemapper defaultInstance] createPredicateForFetchFromPredicate:v13 withContext:v11->_managedObjectContext];
    }
    v11->_cacheName = (NSString *)[(NSString *)name copy];
    uint64_t v14 = [(NSFetchRequest *)v11->_fetchRequest sortDescriptors];
    [(NSFetchRequest *)v11->_fetchRequest _resolveEntityWithContext:context];
    uint64_t v15 = [(NSFetchRequest *)v11->_fetchRequest entity];
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | (([(NSFetchRequest *)v11->_fetchRequest resultType] == 2) << 13));
    uint64_t v36 = context;
    if ([(NSDictionary *)[(NSEntityDescription *)v15 subentitiesByName] count])
    {
      if ([(NSFetchRequest *)v11->_fetchRequest includesSubentities]) {
        int v16 = 32;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFFFDF | v16);
    v11->_sortKeys = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v17 = [(NSArray *)v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) key];
          uint64_t v22 = (void *)[MEMORY[0x1E4F1CA48] array];
          for (uint64_t j = v21; ; v21 = j)
          {
            [j rangeOfString:@"."];
            if (!v24) {
              break;
            }
            objc_msgSend(v22, "insertObject:atIndex:", objc_msgSend(v21, "pathExtension"), 0);
            uint64_t j = (void *)[v21 stringByDeletingPathExtension];
          }
          [v11->_sortKeys addObject:v21];
          [v22 insertObject:v21 atIndex:0];
          if ((*((unsigned char *)&v11->_flags + 1) & 0x20) == 0)
          {
            if (-[NSFetchedResultsController _keyPathContainsNonPersistedProperties:](v11, v22)) {
              int v25 = 0x2000;
            }
            else {
              int v25 = 0;
            }
            v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | v25);
          }
        }
        uint64_t v18 = [(NSArray *)v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v18);
    }
    if ((*(unsigned char *)&v11->_flags & 8) != 0)
    {
      v11->_sectionNameKey = v11->_sectionNameKeyPath;
      uint64_t v26 = (void *)[MEMORY[0x1E4F1CA48] array];
      [(NSString *)v11->_sectionNameKey rangeOfString:@"."];
      if (v27)
      {
        do
        {
          objc_msgSend(v26, "insertObject:atIndex:", -[NSString pathExtension](v11->_sectionNameKey, "pathExtension"), 0);
          uint64_t v28 = [(NSString *)v11->_sectionNameKey stringByDeletingPathExtension];
          v11->_sectionNameKey = v28;
          [(NSString *)v28 rangeOfString:@"."];
        }
        while (v29);
      }
      long long v30 = v11->_sectionNameKey;
      [v26 insertObject:v11->_sectionNameKey atIndex:0];
      if ((*((unsigned char *)&v11->_flags + 1) & 0x20) == 0)
      {
        if (-[NSFetchedResultsController _keyPathContainsNonPersistedProperties:](v11, v26)) {
          int v31 = 0x2000;
        }
        else {
          int v31 = 0;
        }
        v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | v31);
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__managedObjectContextDidSave_, @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification", v36);
    if (v11->_cacheName)
    {
      uint64_t v32 = [(NSManagedObjectContext *)v36 persistentStoreCoordinator];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__managedObjectContextDidSave_, @"_NSManagedObjectContextDidSaveObjectIDsPrivateNotification", v32);
    }
  }
  return v11;
}

- (uint64_t)_keyPathContainsNonPersistedProperties:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "fetchRequest"), "entity"), "propertiesByName");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = (void *)[v3 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if (!v8) {
          return 1;
        }
        uint64_t v9 = v8;
        if ([v8 isTransient]) {
          return 1;
        }
        uint64_t v10 = [v9 _propertyType];
        if ([v9 _isAttribute])
        {
          uint64_t v11 = [v9 attributeType];
          if (v11 == 1800 || v11 == 0)
          {
            unsigned __int8 v18 = 1;
            if (!v11) {
              return v18;
            }
          }
          else
          {
            uint64_t v3 = 0;
            if (!v11) {
              return v18;
            }
          }
          if (v11 == 1800) {
            return v18;
          }
        }
        else if ([v9 _isRelationship])
        {
          uint64_t v3 = objc_msgSend((id)objc_msgSend(v9, "destinationEntity"), "propertiesByName");
        }
        else
        {
          if (v10) {
            BOOL v13 = v10 == 3;
          }
          else {
            BOOL v13 = 1;
          }
          if (v13) {
            return 1;
          }
          uint64_t v3 = 0;
        }
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v14 objects:v19 count:16];
      uint64_t result = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)_managedObjectContextDidChange:(id)a3
{
  if (!objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSObjectsChangedByMergeChangesKey"))
  {
    uint64_t v5 = [a3 userInfo];
    -[NSFetchedResultsController _core_managedObjectContextDidChange:]((uint64_t)self, v5);
  }
}

- (uint64_t)_updateIndexCacheWithFetchedObjects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (id *)result;
    [*(id *)(result + 136) removeAllObjects];
    [v1[18] removeAllObjects];
    if (![v1[1] resultType] || (uint64_t result = objc_msgSend(v1[1], "resultType"), result == 1))
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      obuint64_t j = (id)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs]((uint64_t)v1);
      uint64_t result = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v2 = result;
        uint64_t v3 = 0;
        uint64_t v4 = *(void *)v10;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v10 != v4) {
              objc_enumerationMutation(obj);
            }
            uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
            unint64_t v7 = (void *)MEMORY[0x18C127630]();
            objc_msgSend(v1[17], "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v3 + v5), v6);
            ++v5;
          }
          while (v2 != v5);
          uint64_t result = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v2 = result;
          v3 += v5;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_fetchedObjectsArrayOfObjectIDs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1 || [*(id *)(a1 + 8) resultType] == 2 || objc_msgSend(*(id *)(a1 + 8), "resultType") == 4) {
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = *(void **)(a1 + 96);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "objectID"));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    return (uint64_t)v2;
  }
  uint64_t v4 = *(void **)(a1 + 96);

  return [v4 arrayFromObjectIDs];
}

- (uint64_t)_core_managedObjectContextDidChange:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v4 = (uint64_t (*)(uint64_t *))__82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke;
    uint64_t v5 = &unk_1E544B778;
    uint64_t v6 = result;
    uint64_t v7 = a2;
    if (objc_msgSend(*(id *)(result + 16), "concurrencyType", MEMORY[0x1E4F143A8], 3221225472)) {
      return [*(id *)(v2 + 16) performBlockAndWait:&v3];
    }
    else {
      return v4(&v3);
    }
  }
  return result;
}

- (NSArray)sections
{
  uint64_t v2 = (void *)[(NSMutableOrderedSet *)self->_sections copy];
  uint64_t v3 = (NSArray *)[v2 array];

  return v3;
}

void *__82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke(void *result)
{
  v277[17] = *MEMORY[0x1E4F143B8];
  v193 = result;
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 96) || !*(void *)(v1 + 104)) {
    return result;
  }
  uint64_t v2 = v193;
  if (![(id)v193[5] objectForKey:@"invalidatedAll"])
  {
    id v7 = (id)v193[4];
    id v184 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    v189 = (void *)[(id)v193[4] delegate];
    if (!v189)
    {
      uint64_t v8 = (void *)v193[4];
      if (v8[10]) {
        [v8 setDelegate:0];
      }
    }
    id v9 = v189;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v188 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v191 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v185 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v186 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v11 = [*(id *)(v193[4] + 8) predicate];
    long long v12 = *(void **)(v193[4] + 56);
    if ((void *)v11 != v12)
    {
      long long v13 = (void *)v11;

      *(void *)(v193[4] + 56) = v13;
      if (v13) {
        id v14 = [+[_NSMemoryStorePredicateRemapper defaultInstance] createPredicateForFetchFromPredicate:v13 withContext:*(void *)(v2[4] + 16)];
      }
      else {
        id v14 = 0;
      }
      *(void *)(v2[4] + 48) = v14;
    }
    v192 = v10;
    int v31 = (void *)v2[5];
    v187 = @"inserted_objectIDs";
    uint64_t v32 = objc_msgSend(v31, "objectForKey:");
    uint64_t v33 = (void *)v2[5];
    v183 = @"updated_objectIDs";
    v190 = objc_msgSend((id)objc_msgSend(v33, "objectForKey:"), "mutableCopy");
    unint64_t v34 = v2[4];
    if (v34)
    {
      long long v276 = 0u;
      long long v275 = 0u;
      long long v274 = 0u;
      long long v273 = 0u;
      uint64_t v35 = [v32 countByEnumeratingWithState:&v273 objects:v277 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v274;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v274 != v36) {
              objc_enumerationMutation(v32);
            }
            long long v38 = *(void **)(*((void *)&v273 + 1) + 8 * v37);
            long long v39 = (void *)MEMORY[0x18C127630]();
            if (_objectIDEntityAffectsResults(v34, v38))
            {
              if (-[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v34, v38, 1) == 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v40 = (void *)[*(id *)(v34 + 16) objectWithID:v38];
                if (-[NSFetchedResultsController _objectInResults:](v34, v40))
                {
                  objc_super v41 = [_PFChangeInfo alloc];
                  if (v41)
                  {
                    uint64_t v42 = [(_PFChangeInfo *)v41 initWithObject:v40];
                    uint64_t v43 = (void *)v42;
                    if (v42) {
                      *(void *)(v42 + 16) = 1;
                    }
                  }
                  else
                  {
                    uint64_t v43 = 0;
                  }
                  if ((*(unsigned char *)(v34 + 72) & 8) != 0)
                  {
                    v44 = -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)v34, v40);
                    if (v44)
                    {
                      if (![*(id *)(v34 + 112) objectForKey:v44]) {
                        [v186 addObject:v44];
                      }
                    }
                  }
                  [v192 addObject:v43];
                }
              }
              else
              {
                [v190 addObject:v38];
              }
            }
            ++v37;
          }
          while (v35 != v37);
          uint64_t v45 = [v32 countByEnumeratingWithState:&v273 objects:v277 count:16];
          uint64_t v35 = v45;
        }
        while (v45);
      }
    }
    -[NSFetchedResultsController _preprocessDeletedObjects:deletesInfo:sectionsWithDeletes:](v193[4], (void *)[(id)v193[5] objectForKey:@"deleted_objectIDs"], v188, v185);
    -[NSFetchedResultsController _preprocessDeletedObjects:deletesInfo:sectionsWithDeletes:](v193[4], (void *)[(id)v193[5] objectForKey:@"invalidated_objectIDs"], v188, v185);
    uint64_t v46 = (void *)[(id)v193[5] objectForKey:@"refreshed_objectIDs"];
    uint64_t v47 = v192;
    -[NSFetchedResultsController _preprocessUpdatedObjects:insertsInfo:deletesInfo:updatesInfo:sectionsWithDeletes:newSectionNames:treatAsRefreshes:](v193[4], v190, v192, v188, v191, v185, v186, v46);
    if (v46)
    {
      uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v46];
      uint64_t v49 = [(id)v193[5] objectForKey:@"deleted_objectIDs"];
      if (v49) {
        [v48 minusSet:v49];
      }
      uint64_t v50 = [(id)v193[5] objectForKey:v183];
      if (v50) {
        [v48 minusSet:v50];
      }
      uint64_t v51 = [(id)v193[5] objectForKey:v187];
      if (v51) {
        [v48 minusSet:v51];
      }
      -[NSFetchedResultsController _preprocessUpdatedObjects:insertsInfo:deletesInfo:updatesInfo:sectionsWithDeletes:newSectionNames:treatAsRefreshes:](v193[4], v48, v192, v188, v191, v185, v186, v46);
    }
    if (![v192 count] && !objc_msgSend(v188, "count") && !objc_msgSend(v191, "count"))
    {
LABEL_148:

      [v184 drain];
      return (id)v193[4];
    }
    uint64_t v57 = v193;
    uint64_t v58 = v193[4];
    int v59 = *(_DWORD *)(v58 + 72);
    if ((v59 & 0x1000) != 0)
    {
      objc_msgSend(v189, "controllerWillChangeContent:");
      uint64_t v58 = v193[4];
      int v59 = *(_DWORD *)(v58 + 72);
    }
    *(_DWORD *)(v58 + 72) = v59 | 1;
    unint64_t v60 = v57[4];
    if (!*(void *)(v60 + 96) || !*(void *)(v60 + 104))
    {
LABEL_109:
      _NSCoreDataLog(4, @"(NSFetchedResultsController) rebuilding section caches", v58, v52, v53, v54, v55, v56, v182);
      v277[0] = 0;
      +[NSFetchedResultsController deleteCacheWithName:](NSFetchedResultsController, "deleteCacheWithName:", [(id)v193[4] cacheName]);
      uint64_t updated = [(id)v193[4] performFetch:v277];
      if ((updated & 1) == 0)
      {
        _NSCoreDataLog(1, @"(NSFetchedResultsController) error refetching objects after context update: %@", v78, v79, v80, v81, v82, v83, v277[0]);
        goto LABEL_113;
      }
      goto LABEL_110;
    }
    long long v255 = 0u;
    long long v256 = 0u;
    long long v257 = 0u;
    long long v258 = 0u;
    uint64_t v61 = [v188 countByEnumeratingWithState:&v255 objects:v277 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v256;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v256 != v62) {
            objc_enumerationMutation(v188);
          }
          if (!-[NSFetchedResultsController _updateFetchedObjectsWithDeleteChange:](v60, *(void **)(*((void *)&v255 + 1) + 8 * i)))goto LABEL_109; {
        }
          }
        uint64_t v61 = [v188 countByEnumeratingWithState:&v255 objects:v277 count:16];
      }
      while (v61);
    }
    long long v254 = 0u;
    long long v253 = 0u;
    long long v252 = 0u;
    long long v251 = 0u;
    uint64_t v64 = [v191 countByEnumeratingWithState:&v251 objects:&v273 count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v252;
      do
      {
        for (uint64_t j = 0; j != v64; ++j)
        {
          if (*(void *)v252 != v65) {
            objc_enumerationMutation(v191);
          }
          uint64_t v67 = *(void **)(*((void *)&v251 + 1) + 8 * j);
          if (v67
            && v67[2] == 3
            && !-[NSFetchedResultsController _updateFetchedObjectsWithDeleteChange:](v60, v67))
          {
            goto LABEL_109;
          }
        }
        uint64_t v64 = [v191 countByEnumeratingWithState:&v251 objects:&v273 count:16];
      }
      while (v64);
    }
    long long v249 = 0u;
    long long v250 = 0u;
    long long v247 = 0u;
    long long v248 = 0u;
    uint64_t v68 = [v191 countByEnumeratingWithState:&v247 objects:v272 count:16];
    if (!v68) {
      goto LABEL_99;
    }
    uint64_t v69 = *(void *)v248;
    do
    {
      for (uint64_t k = 0; k != v68; ++k)
      {
        if (*(void *)v248 != v69) {
          objc_enumerationMutation(v191);
        }
        uint64_t v71 = *(void **)(*((void *)&v247 + 1) + 8 * k);
        uint64_t v72 = (void *)MEMORY[0x18C127630]();
        if (v71 && v71[2] == 3 && !-[NSFetchedResultsController _updateFetchedObjectsWithInsertChange:](v60, v71))
        {
LABEL_108:
          goto LABEL_109;
        }
      }
      uint64_t v68 = [v191 countByEnumeratingWithState:&v247 objects:v272 count:16];
    }
    while (v68);
LABEL_99:
    long long v245 = 0u;
    long long v246 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    uint64_t v73 = [v192 countByEnumeratingWithState:&v243 objects:v271 count:16];
    if (v73)
    {
      uint64_t v74 = *(void *)v244;
      do
      {
        for (uint64_t m = 0; m != v73; ++m)
        {
          if (*(void *)v244 != v74) {
            objc_enumerationMutation(v192);
          }
          uint64_t v76 = *(void **)(*((void *)&v243 + 1) + 8 * m);
          uint64_t v72 = (void *)MEMORY[0x18C127630]();
          if (!-[NSFetchedResultsController _updateFetchedObjectsWithInsertChange:](v60, v76)) {
            goto LABEL_108;
          }
        }
        uint64_t v73 = [v192 countByEnumeratingWithState:&v243 objects:v271 count:16];
      }
      while (v73);
    }
    uint64_t updated = -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](v60);
LABEL_110:
    if ((*(unsigned char *)(v193[4] + 72) & 8) != 0)
    {
      uint64_t updated = [MEMORY[0x1E4F1CA80] set];
      v187 = (__CFString *)updated;
    }
    else
    {
      v187 = 0;
    }
    v84 = (void *)MEMORY[0x18C127630](updated);
    long long v237 = 0u;
    long long v238 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    uint64_t v85 = [v191 countByEnumeratingWithState:&v235 objects:v269 count:16];
    if (v85)
    {
      uint64_t v86 = *(void *)v236;
      do
      {
        uint64_t v87 = 0;
        do
        {
          if (*(void *)v236 != v86) {
            objc_enumerationMutation(v191);
          }
          unint64_t v88 = *(void **)(*((void *)&v235 + 1) + 8 * v87);
          uint64_t v89 = objc_msgSend((id)v193[4], "indexPathForObject:", objc_msgSend(v88, "object"));
          if (v88)
          {
            objc_setProperty_nonatomic(v88, v90, v89, 32);
            uint64_t v91 = v193[4];
            if ((*(unsigned char *)(v91 + 72) & 8) == 0) {
              goto LABEL_126;
            }
            long long v92 = (void *)v88[4];
          }
          else
          {
            uint64_t v91 = v193[4];
            if ((*(unsigned char *)(v91 + 72) & 8) == 0) {
              goto LABEL_126;
            }
            long long v92 = 0;
          }
          long long v93 = objc_msgSend(*(id *)(v91 + 104), "objectAtIndex:", objc_msgSend(v92, "indexAtPosition:", 0));
          if (!v88 || (objc_setProperty_nonatomic(v88, v94, v93, 48), v88[5] == v88[6])) {
            -[__CFString addObject:](v187, "addObject:");
          }
LABEL_126:
          ++v87;
        }
        while (v85 != v87);
        uint64_t v95 = [v191 countByEnumeratingWithState:&v235 objects:v269 count:16];
        uint64_t v85 = v95;
      }
      while (v95);
    }
    long long v233 = 0u;
    long long v234 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    uint64_t v96 = [v192 countByEnumeratingWithState:&v231 objects:v268 count:16];
    if (!v96) {
      goto LABEL_147;
    }
    uint64_t v97 = *(void *)v232;
LABEL_134:
    uint64_t v98 = 0;
    while (1)
    {
      if (*(void *)v232 != v97) {
        objc_enumerationMutation(v192);
      }
      long long v99 = *(void **)(*((void *)&v231 + 1) + 8 * v98);
      long long v100 = objc_msgSend((id)v193[4], "indexPathForObject:", objc_msgSend(v99, "object"));
      if (v99)
      {
        objc_setProperty_nonatomic(v99, v101, v100, 32);
        uint64_t v102 = v193[4];
        if ((*(unsigned char *)(v102 + 72) & 8) != 0)
        {
          long long v103 = (void *)v99[4];
          goto LABEL_140;
        }
      }
      else
      {
        uint64_t v102 = v193[4];
        if ((*(unsigned char *)(v102 + 72) & 8) != 0)
        {
          long long v103 = 0;
LABEL_140:
          v104 = objc_msgSend(*(id *)(v102 + 104), "objectAtIndex:", objc_msgSend(v103, "indexAtPosition:", 0));
          if (v99) {
            objc_setProperty_nonatomic(v99, v105, v104, 48);
          }
        }
      }
      if (v96 == ++v98)
      {
        uint64_t v106 = [v192 countByEnumeratingWithState:&v231 objects:v268 count:16];
        uint64_t v96 = v106;
        if (!v106)
        {
LABEL_147:
          uint64_t v47 = v192;
          if (-[NSFetchedResultsController _conditionallyDispatchSnapshotToDelegate:updatesInfo:](v193[4], v189, v191)) {
            goto LABEL_148;
          }
          uint64_t v107 = v193[4];
          int v108 = *(_DWORD *)(v107 + 72);
          if ((v108 & 0x40) == 0)
          {
            if ((v108 & 8) != 0)
            {
              long long v217 = 0u;
              long long v218 = 0u;
              long long v215 = 0u;
              long long v216 = 0u;
              uint64_t v140 = [(__CFString *)v187 countByEnumeratingWithState:&v215 objects:v264 count:16];
              if (v140)
              {
                uint64_t v141 = *(void *)v216;
                do
                {
                  for (uint64_t n = 0; n != v140; ++n)
                  {
                    if (*(void *)v216 != v141) {
                      objc_enumerationMutation(v187);
                    }
                    uint64_t v143 = *(void *)(*((void *)&v215 + 1) + 8 * n);
                    v144 = (void *)MEMORY[0x18C127630]();
                    v214[0] = MEMORY[0x1E4F143A8];
                    v214[1] = 3221225472;
                    v214[2] = __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke_2;
                    v214[3] = &unk_1E544D540;
                    v214[4] = v143;
                    uint64_t v145 = [MEMORY[0x1E4F28F60] predicateWithBlock:v214];
                    -[NSFetchedResultsController _lowerMoveOperationsToUpdatesForSection:withInsertedObjects:deletedObjects:updatedObjects:](v193[4], v143, (void *)[v192 filteredSetUsingPredicate:v145], objc_msgSend(v188, "filteredSetUsingPredicate:", v145), objc_msgSend(v191, "filteredSetUsingPredicate:", v145));
                  }
                  uint64_t v140 = [(__CFString *)v187 countByEnumeratingWithState:&v215 objects:v264 count:16];
                }
                while (v140);
              }
            }
            else
            {
              -[NSFetchedResultsController _lowerMoveOperationsToUpdatesForSection:withInsertedObjects:deletedObjects:updatedObjects:](v107, 0, v192, v188, v191);
            }
            if ((*(unsigned char *)(v193[4] + 73) & 2) != 0)
            {
              long long v212 = 0u;
              long long v213 = 0u;
              long long v210 = 0u;
              long long v211 = 0u;
              uint64_t v146 = [v188 countByEnumeratingWithState:&v210 objects:v263 count:16];
              if (v146)
              {
                uint64_t v147 = *(void *)v211;
                do
                {
                  uint64_t v148 = 0;
                  do
                  {
                    if (*(void *)v211 != v147) {
                      objc_enumerationMutation(v188);
                    }
                    v149 = *(void **)(*((void *)&v210 + 1) + 8 * v148);
                    uint64_t v150 = [v149 object];
                    if (v149) {
                      uint64_t v151 = v149[3];
                    }
                    else {
                      uint64_t v151 = 0;
                    }
                    [v189 controller:v193[4] didChangeObject:v150 atIndexPath:v151 forChangeType:2 newIndexPath:0];
                    ++v148;
                  }
                  while (v146 != v148);
                  uint64_t v152 = [v188 countByEnumeratingWithState:&v210 objects:v263 count:16];
                  uint64_t v146 = v152;
                }
                while (v152);
              }
            }
            if ((*(unsigned char *)(v193[4] + 73) & 4) != 0)
            {
              long long v208 = 0u;
              long long v209 = 0u;
              long long v206 = 0u;
              long long v207 = 0u;
              uint64_t v153 = [v186 countByEnumeratingWithState:&v206 objects:v262 count:16];
              if (v153)
              {
                uint64_t v154 = *(void *)v207;
                do
                {
                  for (iuint64_t i = 0; ii != v153; ++ii)
                  {
                    if (*(void *)v207 != v154) {
                      objc_enumerationMutation(v186);
                    }
                    uint64_t v156 = [*(id *)(v193[4] + 112) objectForKey:*(void *)(*((void *)&v206 + 1) + 8 * ii)];
                    if (v156) {
                      [v189 controller:v193[4] didChangeSection:v156 atIndex:-[_NSDefaultSectionInfo sectionNumber](v156) forChangeType:1];
                    }
                  }
                  uint64_t v153 = [v186 countByEnumeratingWithState:&v206 objects:v262 count:16];
                }
                while (v153);
              }
              long long v204 = 0u;
              long long v205 = 0u;
              long long v202 = 0u;
              long long v203 = 0u;
              v157 = (void *)[v185 allValues];
              uint64_t v158 = [v157 countByEnumeratingWithState:&v202 objects:v261 count:16];
              if (v158)
              {
                uint64_t v159 = *(void *)v203;
                do
                {
                  uint64_t v160 = 0;
                  do
                  {
                    if (*(void *)v203 != v159) {
                      objc_enumerationMutation(v157);
                    }
                    v161 = *(void **)(*((void *)&v202 + 1) + 8 * v160);
                    if (!objc_msgSend(*(id *)(v193[4] + 112), "objectForKey:", objc_msgSend(v161, "name")))
                    {
                      if (v161) {
                        uint64_t v162 = v161[6];
                      }
                      else {
                        uint64_t v162 = 0;
                      }
                      [v189 controller:v193[4] didChangeSection:v161 atIndex:v162 forChangeType:2];
                    }
                    ++v160;
                  }
                  while (v158 != v160);
                  uint64_t v163 = [v157 countByEnumeratingWithState:&v202 objects:v261 count:16];
                  uint64_t v158 = v163;
                }
                while (v163);
              }
            }
            if ((*(unsigned char *)(v193[4] + 73) & 2) != 0)
            {
              long long v200 = 0u;
              long long v201 = 0u;
              long long v198 = 0u;
              long long v199 = 0u;
              uint64_t v164 = [v192 countByEnumeratingWithState:&v198 objects:v260 count:16];
              if (v164)
              {
                uint64_t v165 = *(void *)v199;
                do
                {
                  uint64_t v166 = 0;
                  do
                  {
                    if (*(void *)v199 != v165) {
                      objc_enumerationMutation(v192);
                    }
                    v167 = *(void **)(*((void *)&v198 + 1) + 8 * v166);
                    uint64_t v168 = [v167 object];
                    if (v167) {
                      uint64_t v169 = v167[4];
                    }
                    else {
                      uint64_t v169 = 0;
                    }
                    [v189 controller:v193[4] didChangeObject:v168 atIndexPath:0 forChangeType:1 newIndexPath:v169];
                    ++v166;
                  }
                  while (v164 != v166);
                  uint64_t v170 = [v192 countByEnumeratingWithState:&v198 objects:v260 count:16];
                  uint64_t v164 = v170;
                }
                while (v170);
              }
              long long v196 = 0u;
              long long v197 = 0u;
              long long v194 = 0u;
              long long v195 = 0u;
              uint64_t v171 = [v191 countByEnumeratingWithState:&v194 objects:v259 count:16];
              if (v171)
              {
                uint64_t v172 = *(void *)v195;
                do
                {
                  uint64_t v173 = 0;
                  do
                  {
                    if (*(void *)v195 != v172) {
                      objc_enumerationMutation(v191);
                    }
                    v174 = *(void **)(*((void *)&v194 + 1) + 8 * v173);
                    uint64_t v175 = [v174 object];
                    if (v174)
                    {
                      uint64_t v176 = v174[2];
                      v177 = (void *)v174[3];
                      v174 = (void *)v174[4];
                      if (!BYTE2(dword_1EB270AB0) && v176 == 3)
                      {
                        uint64_t v178 = [v177 indexAtPosition:0];
                        if (v178 == [v174 indexAtPosition:0])
                        {
                          uint64_t v179 = [v177 indexAtPosition:1];
                          uint64_t v180 = [v174 indexAtPosition:1];
                          if (v179 == v180) {
                            uint64_t v176 = 4;
                          }
                          else {
                            uint64_t v176 = 3;
                          }
                          if (v179 == v180) {
                            v174 = 0;
                          }
                        }
                        else
                        {
                          uint64_t v176 = 3;
                        }
                      }
                    }
                    else
                    {
                      v177 = 0;
                      uint64_t v176 = 0;
                    }
                    [v189 controller:v193[4] didChangeObject:v175 atIndexPath:v177 forChangeType:v176 newIndexPath:v174];
                    ++v173;
                  }
                  while (v171 != v173);
                  uint64_t v181 = [v191 countByEnumeratingWithState:&v194 objects:v259 count:16];
                  uint64_t v171 = v181;
                }
                while (v181);
              }
            }
            uint64_t v47 = v192;
            if ((*(unsigned char *)(v193[4] + 72) & 0x80) != 0) {
              objc_msgSend(v189, "controllerDidChangeContent:");
            }
            goto LABEL_148;
          }
          v109 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v188, "count") + objc_msgSend(v192, "count") + 2 * objc_msgSend(v191, "count"));
          v187 = (__CFString *)MEMORY[0x18C127630]();
          long long v229 = 0u;
          long long v230 = 0u;
          long long v227 = 0u;
          long long v228 = 0u;
          uint64_t v110 = [v192 countByEnumeratingWithState:&v227 objects:v267 count:16];
          if (v110)
          {
            uint64_t v111 = *(void *)v228;
            do
            {
              uint64_t v112 = 0;
              do
              {
                if (*(void *)v228 != v111) {
                  objc_enumerationMutation(v192);
                }
                v113 = *(void **)(*((void *)&v227 + 1) + 8 * v112);
                v114 = (void *)MEMORY[0x1E4F28F18];
                uint64_t v115 = objc_msgSend((id)objc_msgSend(v113, "object"), "objectID");
                if (v113) {
                  v116 = (void *)v113[4];
                }
                else {
                  v116 = 0;
                }
                objc_msgSend(v109, "addObject:", objc_msgSend(v114, "changeWithObject:type:index:", v115, 0, objc_msgSend(v116, "indexAtPosition:", 1)));
                ++v112;
              }
              while (v110 != v112);
              uint64_t v117 = [v192 countByEnumeratingWithState:&v227 objects:v267 count:16];
              uint64_t v110 = v117;
            }
            while (v117);
          }
          long long v225 = 0u;
          long long v226 = 0u;
          long long v223 = 0u;
          long long v224 = 0u;
          uint64_t v118 = [v188 countByEnumeratingWithState:&v223 objects:v266 count:16];
          if (v118)
          {
            uint64_t v119 = *(void *)v224;
            do
            {
              uint64_t v120 = 0;
              do
              {
                if (*(void *)v224 != v119) {
                  objc_enumerationMutation(v188);
                }
                v121 = *(void **)(*((void *)&v223 + 1) + 8 * v120);
                v122 = (void *)MEMORY[0x1E4F28F18];
                uint64_t v123 = objc_msgSend((id)objc_msgSend(v121, "object"), "objectID");
                if (v121) {
                  v124 = (void *)v121[3];
                }
                else {
                  v124 = 0;
                }
                objc_msgSend(v109, "addObject:", objc_msgSend(v122, "changeWithObject:type:index:", v123, 1, objc_msgSend(v124, "indexAtPosition:", 1)));
                ++v120;
              }
              while (v118 != v120);
              uint64_t v125 = [v188 countByEnumeratingWithState:&v223 objects:v266 count:16];
              uint64_t v118 = v125;
            }
            while (v125);
          }
          long long v221 = 0u;
          long long v222 = 0u;
          long long v219 = 0u;
          long long v220 = 0u;
          uint64_t v126 = [v191 countByEnumeratingWithState:&v219 objects:v265 count:16];
          if (v126)
          {
            uint64_t v127 = *(void *)v220;
            do
            {
              uint64_t v128 = 0;
              do
              {
                if (*(void *)v220 != v127) {
                  objc_enumerationMutation(v191);
                }
                v129 = *(id **)(*((void *)&v219 + 1) + 8 * v128);
                v130 = (void *)MEMORY[0x1E4F28F18];
                uint64_t v131 = objc_msgSend((id)objc_msgSend(v129, "object"), "objectID");
                if (v129)
                {
                  uint64_t v132 = [v129[4] indexAtPosition:1];
                  id v133 = v129[3];
                }
                else
                {
                  uint64_t v132 = [0 indexAtPosition:1];
                  id v133 = 0;
                }
                objc_msgSend(v109, "addObject:", objc_msgSend(v130, "changeWithObject:type:index:associatedIndex:", v131, 0, v132, objc_msgSend(v133, "indexAtPosition:", 1)));
                v134 = (void *)MEMORY[0x1E4F28F18];
                uint64_t v135 = objc_msgSend((id)objc_msgSend(v129, "object"), "objectID");
                if (v129)
                {
                  uint64_t v136 = [v129[3] indexAtPosition:1];
                  id v137 = v129[4];
                }
                else
                {
                  uint64_t v136 = [0 indexAtPosition:1];
                  id v137 = 0;
                }
                objc_msgSend(v109, "addObject:", objc_msgSend(v134, "changeWithObject:type:index:associatedIndex:", v135, 1, v136, objc_msgSend(v137, "indexAtPosition:", 1)));
                ++v128;
              }
              while (v126 != v128);
              uint64_t v138 = [v191 countByEnumeratingWithState:&v219 objects:v265 count:16];
              uint64_t v126 = v138;
            }
            while (v138);
          }
          v139 = (void *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v109];
          [v189 controller:v193[4] didChangeContentWithDifference:v139];

LABEL_113:
          uint64_t v47 = v192;
          goto LABEL_148;
        }
        goto LABEL_134;
      }
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = v193[4];
  if (isKindOfClass)
  {
    -[_PFBatchFaultingArray _turnAllBatchesIntoFaults](*(void *)(v4 + 96));
    uint64_t v5 = v193[4];
    unsigned int v6 = *(_DWORD *)(v5 + 72) | 2;
  }
  else
  {
    uint64_t v15 = (void *)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs](v4);
    uint64_t v16 = [v15 count];
    uint64_t v17 = v16;
    if (!v16) {
      goto LABEL_22;
    }
    unsigned __int8 v18 = *(void **)(v193[4] + 96);
    unint64_t v19 = v16;
    MEMORY[0x1F4188790](v16);
    uint64_t v21 = (char *)&v182 - v20;
    if (v19 > 0x200) {
      uint64_t v21 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v182 - v20, 8 * v19);
    }
    objc_msgSend(v15, "getObjects:range:", v21, 0, v17);
    uint64_t v22 = [[_PFArray alloc] initWithObjects:v21 count:v17 andFlags:27];
    if (v19 >= 0x201) {
      NSZoneFree(0, v21);
    }
    uint64_t v23 = [_PFBatchFaultingArray alloc];
    uint64_t v24 = v193 + 4;
    *(void *)(*v24 + 96) = [(_PFBatchFaultingArray *)v23 initWithPFArray:v22 andRequest:*(void *)(v193[4] + 8) andContext:*(void *)(v193[4] + 16)];
    -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](*v24);

    if ((-[NSFetchedResultsController _computeSectionInfo:error:](*v24, *(void **)(*v24 + 96), 0) & 1) == 0)
    {
      int v25 = v193 + 4;

      *(void *)(*v25 + 104) = 0;
      *(void *)(*v25 + 112) = 0;

      *(void *)(*v25 + 120) = 0;
      *(void *)(*v25 + 128) = 0;
    }
    uint64_t v2 = v193;
    *(_DWORD *)(v193[4] + 72) |= 2u;
    uint64_t v5 = v2[4];
    unsigned int v6 = *(_DWORD *)(v5 + 72) & 0xFFFFFFFB;
  }
  *(_DWORD *)(v5 + 72) = v6;
LABEL_22:
  long long v241 = 0u;
  long long v242 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  uint64_t v26 = *(void **)(v2[4] + 104);
  uint64_t result = (void *)[v26 countByEnumeratingWithState:&v239 objects:v270 count:16];
  uint64_t v27 = result;
  if (result)
  {
    uint64_t v28 = *(void *)v240;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v240 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v239 + 1) + 8 * (void)v29);
        if (v30)
        {

          *(void *)(v30 + 56) = 0;
        }
        uint64_t v29 = (void *)((char *)v29 + 1);
      }
      while (v27 != v29);
      uint64_t result = (void *)[v26 countByEnumeratingWithState:&v239 objects:v270 count:16];
      uint64_t v27 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_preprocessDeletedObjects:(void *)a3 deletesInfo:(void *)a4 sectionsWithDeletes:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v6 = result;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(a2);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
          if (_objectIDEntityAffectsResults(v6, v10))
          {
            unint64_t v11 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v6, v10, 1);
            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v12 = v11;
              uint64_t v13 = [*(id *)(v6 + 16) objectWithID:v10];
              id v14 = [_PFChangeInfo alloc];
              if (v14)
              {
                uint64_t v15 = [(_PFChangeInfo *)v14 initWithObject:v13];
                uint64_t v16 = (void *)v15;
                if (v15) {
                  *(void *)(v15 + 16) = 2;
                }
              }
              else
              {
                uint64_t v16 = 0;
              }
              uint64_t v17 = (void *)-[NSFetchedResultsController _indexPathForIndex:](*(void **)(v6 + 104), v12);
              if (v17)
              {
                unint64_t v19 = v17;
                if (v16) {
                  objc_setProperty_nonatomic(v16, v18, v17, 24);
                }
                uint64_t v21 = objc_msgSend(*(id *)(v6 + 104), "objectAtIndex:", objc_msgSend(v19, "indexAtPosition:", 0));
                if (v16) {
                  objc_setProperty_nonatomic(v16, v20, v21, 40);
                }
                if ((*(unsigned char *)(v6 + 72) & 8) != 0)
                {
                  uint64_t v22 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v21);
                  if (v21) {
                    v21[6] = v22;
                  }
                  objc_msgSend(a4, "setObject:forKey:", v21, objc_msgSend(v21, "name"));
                }
              }
              [a3 addObject:v16];
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v7 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)delegate
{
  delegate = (id *)self->_delegate;
  if (delegate) {
    return objc_loadWeak(delegate + 1);
  }
  else {
    return 0;
  }
}

- (uint64_t)_preprocessUpdatedObjects:(void *)a3 insertsInfo:(void *)a4 deletesInfo:(void *)a5 updatesInfo:(void *)a6 sectionsWithDeletes:(void *)a7 newSectionNames:(void *)a8 treatAsRefreshes:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v11 = a2;
    unint64_t v12 = result;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t result = [a2 countByEnumeratingWithState:&v59 objects:v64 count:16];
    uint64_t v52 = result;
    if (result)
    {
      uint64_t v13 = *(void *)v60;
      uint64_t v45 = a4;
      uint64_t v46 = a6;
      uint64_t v43 = v11;
      v44 = a3;
      uint64_t v49 = *(void *)v60;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v60 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * v14);
          context = (void *)MEMORY[0x18C127630]();
          if (_objectIDEntityAffectsResults(v12, v15))
          {
            unint64_t v16 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v12, v15, 1);
            id newValue = v16 == 0x7FFFFFFFFFFFFFFFLL
                     ? 0
                     : (id)-[NSFetchedResultsController _indexPathForIndex:](*(void **)(v12 + 104), v16);
            uint64_t v51 = (void *)[*(id *)(v12 + 16) objectWithID:v15];
            char v17 = -[NSFetchedResultsController _objectInResults:](v12, v51);
            if ((v17 & 1) != 0 || newValue)
            {
              unsigned __int8 v18 = [[_PFChangeInfo alloc] initWithObject:v51];
              if (v17)
              {
                self = v18;
                if (!newValue)
                {
                  uint64_t v20 = v18;
                  if (v18) {
                    v18->_changeType = 1;
                  }
                  long long v25 = a3;
                  if ((*(unsigned char *)(v12 + 72) & 8) != 0)
                  {
                    long long v27 = -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)v12, v51);
                    long long v25 = a3;
                    if (v27)
                    {
                      uint64_t v28 = [*(id *)(v12 + 112) objectForKey:v27];
                      long long v25 = a3;
                      if (!v28)
                      {
                        [a7 addObject:v27];
                        long long v25 = a3;
                      }
                    }
                  }
                  goto LABEL_55;
                }
                uint64_t v20 = v18;
                if (([a3 containsObject:v18] & 1) == 0
                  && ([a4 containsObject:self] & 1) == 0)
                {
                  if ([a8 containsObject:v15])
                  {
                    int v21 = 1;
                    int v22 = 1;
                  }
                  else
                  {
                    uint64_t v29 = (void *)[v51 changedValuesForCurrentEvent];
                    long long v55 = 0u;
                    long long v56 = 0u;
                    long long v57 = 0u;
                    long long v58 = 0u;
                    uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v63 count:16];
                    if (v30)
                    {
                      uint64_t v31 = v30;
                      int v21 = 0;
                      int v22 = 0;
                      uint64_t v32 = *(void *)v56;
                      do
                      {
                        for (uint64_t i = 0; i != v31; ++i)
                        {
                          if (*(void *)v56 != v32) {
                            objc_enumerationMutation(v29);
                          }
                          uint64_t v34 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                          int v35 = [*(id *)(v12 + 88) containsObject:v34];
                          v22 |= v35;
                          v21 |= [*(id *)(v12 + 32) isEqualToString:v34] | v35;
                        }
                        uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v63 count:16];
                      }
                      while (v31);
                    }
                    else
                    {
                      int v21 = 0;
                      int v22 = 0;
                    }
                  }
                  uint64_t v37 = objc_msgSend(*(id *)(v12 + 104), "objectAtIndex:", objc_msgSend(newValue, "indexAtPosition:", 0));
                  uint64_t v20 = self;
                  if (!self)
                  {
                    long long v25 = a5;
                    a4 = v45;
                    a6 = v46;
                    a3 = v44;
                    goto LABEL_45;
                  }
                  objc_setProperty_nonatomic(self, v36, newValue, 24);
                  objc_setProperty_nonatomic(self, v38, v37, 40);
                  a4 = v45;
                  a6 = v46;
                  a3 = v44;
                  if ((v21 | v22))
                  {
                    self->_changeType = 3;
                    long long v25 = a5;
LABEL_45:
                    unint64_t v11 = v43;
                    if (v21)
                    {
                      long long v25 = a5;
                      if ((*(unsigned char *)(v12 + 72) & 8) != 0)
                      {
                        long long v39 = -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)v12, v51);
                        if (!v39) {
                          goto LABEL_50;
                        }
                        long long v40 = v39;
                        uint64_t v41 = [*(id *)(v12 + 112) objectForKey:v39];
                        if (!v41)
                        {
                          [a7 addObject:v40];
LABEL_50:
                          uint64_t v41 = 0;
                        }
                        long long v25 = a5;
                        if (v37)
                        {
                          long long v25 = a5;
                          if (v37 != (void *)v41)
                          {
                            v37[6] = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v37);
                            objc_msgSend(a6, "setObject:forKey:", v37, objc_msgSend(v37, "name"));
                            long long v25 = a5;
                          }
                        }
                      }
                    }
                  }
                  else
                  {
                    self->_changeType = 4;
                    long long v25 = a5;
                    unint64_t v11 = v43;
                  }
LABEL_55:
                  [v25 addObject:v20];
                  uint64_t v13 = v49;
                }

                goto LABEL_57;
              }
              uint64_t v20 = v18;
              if (v18)
              {
                v18->_changeType = 2;
                objc_setProperty_nonatomic(v18, v19, newValue, 24);
              }
              long long v24 = objc_msgSend(*(id *)(v12 + 104), "objectAtIndex:", objc_msgSend(newValue, "indexAtPosition:", 0));
              if (v20) {
                objc_setProperty_nonatomic(v20, v23, v24, 40);
              }
              long long v25 = a4;
              if ((*(unsigned char *)(v12 + 72) & 8) != 0)
              {
                uint64_t v26 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v24);
                if (v24) {
                  v24[6] = v26;
                }
                objc_msgSend(a6, "setObject:forKey:", v24, objc_msgSend(v24, "name"));
                long long v25 = a4;
              }
              goto LABEL_55;
            }
          }
LABEL_57:
          ++v14;
        }
        while (v14 != v52);
        uint64_t result = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
        uint64_t v52 = result;
      }
      while (result);
    }
  }
  return result;
}

- (unint64_t)_indexOfFetchedID:(int)a3 isManagedObjectID:
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  if ([*(id *)(result + 8) resultType] == 1) {
    goto LABEL_3;
  }
  if ([*(id *)(v5 + 8) resultType] != 2)
  {
    if ([*(id *)(v5 + 8) resultType]) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"Result type of fetched object is not an NSManagedObjectIDResultType, NSDictionaryResultType or NSManagedObjectResultType.", 0 reason userInfo]);
    }
    if ((a3 & 1) == 0) {
      a2 = (void *)[a2 objectID];
    }
LABEL_3:
    if ((objc_opt_respondsToSelector() & 1) != 0 && a3)
    {
      unint64_t v6 = *(void **)(v5 + 96);
      return [v6 indexOfManagedObjectForObjectID:a2];
    }
    else
    {
      return -[NSFetchedResultsController _indexOfCachedID:](v5, (uint64_t)a2);
    }
  }
  uint64_t v7 = *(void **)(v5 + 96);

  return [v7 indexOfObject:a2];
}

- (uint64_t)_indexPathForIndex:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a1);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = *(void *)(v8 + 32);
        }
        else {
          uint64_t v9 = 0;
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) numberOfObjects] + v9 > a2)
        {
          v15[0] = -[_NSDefaultSectionInfo sectionNumber](v8);
          if (v8) {
            uint64_t v10 = *(void *)(v8 + 32);
          }
          else {
            uint64_t v10 = 0;
          }
          v15[1] = a2 - v10;
          return [MEMORY[0x1E4F28D58] indexPathWithIndexes:v15 length:2];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [a1 countByEnumeratingWithState:&v11 objects:v16 count:16];
      uint64_t v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSIndexPath)indexPathForObject:(id)object
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!object) {
    return 0;
  }
  uint64_t v4 = (*(unsigned char *)&self->_flags & 8) != 0
     ? -[NSMutableDictionary objectForKey:](self->_sectionsByName, "objectForKey:", -[NSFetchedResultsController _sectionNameForObject:]((__CFString *)self, object)): [(NSMutableOrderedSet *)self->_sections lastObject];
  uint64_t v5 = v4;
  if (!v4) {
    return 0;
  }
  unint64_t v6 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(void *)(v4 + 8), object, 0);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v7 = v6 - *(void *)(v5 + 32);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v9[0] = -[_NSDefaultSectionInfo sectionNumber](v5);
  v9[1] = v7;
  return (NSIndexPath *)[MEMORY[0x1E4F28D58] indexPathWithIndexes:v9 length:2];
}

- (unint64_t)_indexOfCachedID:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = (void *)[*(id *)(a1 + 136) objectForKey:a2];
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = v5;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      unint64_t v7 = *(void **)(a1 + 144);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        unint64_t v4 = v6;
        while (1)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            if (v12)
            {
              if (v4 < *(void *)(v12 + 8)) {
                continue;
              }
              uint64_t v12 = *(void *)(v12 + 24);
            }
            v4 += v12;
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (!v9) {
            return v4;
          }
        }
      }
      return v6;
    }
  }
  return v4;
}

- (void)_updateSectionOffsetsStartingAtSection:(uint64_t)a1
{
  unint64_t v4 = [*(id *)(a1 + 104) count];
  unint64_t v5 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)a2) + 1;
  if (v5 < v4)
  {
    do
    {
      uint64_t v6 = [*(id *)(a1 + 104) objectAtIndex:v5];
      if (a2) {
        uint64_t v7 = a2[4];
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = [a2 numberOfObjects];
      if (v6)
      {
        *(void *)(v6 + 32) = v8 + v7;

        *(void *)(v6 + 56) = 0;
      }
      ++v5;
      a2 = (void *)v6;
    }
    while (v4 != v5);
  }
}

- (uint64_t)_updateFetchedObjectsWithDeleteChange:(unint64_t)a1
{
  uint64_t v2 = (uint64_t)a2;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)[a2 object];
  if (v2)
  {
    uint64_t v2 = *(void *)(v2 + 40);
    if (v2)
    {
      unint64_t v5 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(void *)(v2 + 8), v4, 0);
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v6 = *(void *)(v2 + 32);
        unint64_t v7 = v5 - v6;
        if (v5 - v6 != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v18) = 0;
LABEL_23:
          uint64_t v19 = v6 + v7;
          if ((*(unsigned char *)(a1 + 72) & 4) == 0) {
            -[NSFetchedResultsController _makeMutableFetchedObjects](a1);
          }
          uint64_t v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v19), "objectID");
          [*(id *)(a1 + 96) removeObjectAtIndex:v19];
          [*(id *)(a1 + 136) removeObjectForKey:v20];
          if ([*(id *)(a1 + 96) count])
          {
            uint64_t v21 = [*(id *)(a1 + 96) count];
            int v22 = [_PFIndexCacheOffset alloc];
            if (v22)
            {
              v33.receiver = v22;
              v33.super_class = (Class)_PFIndexCacheOffset;
              uint64_t v23 = objc_msgSendSuper2(&v33, sel_init);
              long long v24 = v23;
              if (v23)
              {
                v23[1] = v19;
                v23[2] = v21;
                v23[3] = -1;
              }
            }
            else
            {
              long long v24 = 0;
            }
            [*(id *)(a1 + 144) addObject:v24];
          }
          else
          {
            [*(id *)(a1 + 144) removeAllObjects];
          }
          uint64_t v25 = [(id)v2 numberOfObjects];
          if ((v18 & 1) == 0)
          {
            *(void *)(v2 + 40) = v25 - 1;

            *(void *)(v2 + 56) = 0;
          }
          -[NSFetchedResultsController _updateSectionOffsetsStartingAtSection:](a1, (void *)v2);
          goto LABEL_34;
        }
      }
    }
  }
  unint64_t v8 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](a1, (void *)[v4 objectID], 1);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_34:
    if (v2 && ![(id)v2 numberOfObjects] && (*(unsigned char *)(a1 + 72) & 8) != 0)
    {
      [*(id *)(a1 + 104) removeObjectAtIndex:-[_NSDefaultSectionInfo sectionNumber](v2)];
      objc_msgSend(*(id *)(a1 + 112), "removeObjectForKey:", objc_msgSend((id)v2, "name"));
      *(void *)(v2 + 8) = 0;

      *(void *)(v2 + 56) = 0;
      *(void *)(a1 + 120) = 0;

      *(void *)(a1 + 128) = 0;
    }
    return 1;
  }
  unint64_t v7 = v8;
  uint64_t v9 = *(void **)(a1 + 104);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:&v33 count:16];
  if (!v10)
  {
LABEL_20:
    if (v2)
    {
      LOBYTE(v18) = 0;
      uint64_t v6 = *(void *)(v2 + 32);
    }
    else
    {
LABEL_46:
      uint64_t v6 = 0;
      LOBYTE(v18) = 1;
    }
    goto LABEL_23;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v30;
LABEL_8:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v30 != v12) {
      objc_enumerationMutation(v9);
    }
    uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
    uint64_t v15 = v14 ? *(void *)(v14 + 32) : 0;
    if ([*(id *)(*((void *)&v29 + 1) + 8 * v13) numberOfObjects] + v15 > v7) {
      break;
    }
    if (v11 == ++v13)
    {
      uint64_t v16 = [v9 countByEnumeratingWithState:&v29 objects:&v33 count:16];
      uint64_t v11 = v16;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  uint64_t v17 = -[_NSDefaultSectionInfo sectionNumber](v14);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_20;
  }
  uint64_t v27 = [*(id *)(a1 + 104) objectAtIndex:v17];
  uint64_t v2 = v27;
  if (!v27)
  {
    unint64_t v7 = 0;
    goto LABEL_46;
  }
  unint64_t v28 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(void *)(v27 + 8), v4, 0);
  uint64_t v18 = 0;
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = 0;
    uint64_t v6 = *(void *)(v2 + 32);
    unint64_t v7 = v28 - v6;
    if (v28 - v6 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
  }
  return v18;
}

- (void)_lowerMoveOperationsToUpdatesForSection:(void *)a3 withInsertedObjects:(void *)a4 deletedObjects:(void *)a5 updatedObjects:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    context = (void *)MEMORY[0x18C127630]();
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = (uint64_t)v9;
    if (a2) {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v11 = [a5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(a5);
          }
          uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
          if (v15)
          {
            if (v15[2] == 4) {
              goto LABEL_19;
            }
            uint64_t v16 = v9;
            if (!a2)
            {
LABEL_18:
              [v16 addObject:v15];
              goto LABEL_19;
            }
            uint64_t v17 = v15[6];
          }
          else
          {
            uint64_t v16 = v9;
            if (!a2) {
              goto LABEL_18;
            }
            uint64_t v17 = 0;
          }
          if (v17 == a2) {
            [v9 addObject:*(void *)(*((void *)&v40 + 1) + 8 * v14)];
          }
          if (v15) {
            uint64_t v18 = v15[5];
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v16 = (void *)v10;
          if (v18 == a2) {
            goto LABEL_18;
          }
LABEL_19:
          ++v14;
        }
        while (v12 != v14);
        uint64_t v19 = [a5 countByEnumeratingWithState:&v40 objects:v44 count:16];
        uint64_t v12 = v19;
      }
      while (v19);
    }
    id v20 = (id)objc_msgSend((id)objc_msgSend(a3, "allObjects"), "mutableCopy");
    [v20 addObjectsFromArray:v9];
    [v20 sortUsingComparator:&__block_literal_global_13];
    id v21 = (id)objc_msgSend((id)objc_msgSend(a4, "allObjects"), "mutableCopy");
    [v21 addObjectsFromArray:v10];
    [v21 sortUsingComparator:&__block_literal_global_227];
    if ([v20 count])
    {
      unint64_t v22 = 0;
      unsigned int v23 = 0;
      unsigned int v24 = 0;
      do
      {
        if ([v21 count] <= (unint64_t)v23) {
          break;
        }
        uint64_t v25 = (void *)[v20 objectAtIndex:v22];
        uint64_t v26 = [v21 objectAtIndex:v23];
        uint64_t v27 = (void *)v26;
        if (!v25 || v25[2] != 1)
        {
          if (v26 && *(void *)(v26 + 16) == 2) {
            goto LABEL_55;
          }
          unint64_t v28 = v25 ? (void *)v25[4] : 0;
          uint64_t v29 = [v28 indexAtPosition:1];
          long long v30 = v27 ? (void *)v27[3] : 0;
          unint64_t v31 = v29 - v22;
          unint64_t v32 = [v30 indexAtPosition:1] - v23;
          if (v31 >= v32)
          {
            if (v32 < v31) {
              goto LABEL_55;
            }
            if (v25 == v27)
            {
              if (v25) {
                v25[2] = 4;
              }
              ++v24;
LABEL_55:
              ++v23;
              goto LABEL_56;
            }
            unint64_t v38 = [v21 indexOfObject:v25];
            unint64_t v33 = [v20 indexOfObject:v27];
            if (v38 != 0x7FFFFFFFFFFFFFFFLL && v38 >= v23)
            {
              if (v33 == 0x7FFFFFFFFFFFFFFFLL || v33 < v22) {
                goto LABEL_55;
              }
              unint64_t v34 = v33;
              int v35 = v25 ? (void *)v25[3] : 0;
              if (v31 == [v35 indexAtPosition:1] - v38)
              {
                uint64_t v36 = v27 ? (void *)v27[4] : 0;
                if (v32 != [v36 indexAtPosition:1] - v34) {
                  goto LABEL_55;
                }
                unint64_t v37 = [v21 indexOfObject:v25];
                if ([v20 indexOfObject:v27] > v37) {
                  goto LABEL_55;
                }
              }
            }
          }
        }
        ++v24;
LABEL_56:
        unint64_t v22 = v24;
      }
      while ([v20 count] > (unint64_t)v24);
    }
  }
}

- (void)_makeMutableFetchedObjects
{
  if ((*(unsigned char *)(a1 + 72) & 4) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 96);
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      *(void *)(a1 + 96) = [[_PFMutableProxyArray alloc] initWithPFArray:*(void *)(a1 + 96)];
      unsigned int v3 = *(_DWORD *)(a1 + 72) | 2;
    }
    else
    {
      *(void *)(a1 + 96) = (id)[MEMORY[0x1E4F1CA48] arrayWithArray:v2];
      unsigned int v3 = *(_DWORD *)(a1 + 72) & 0xFFFFFFFD;
    }
    *(_DWORD *)(a1 + 72) = v3;

    *(_DWORD *)(a1 + 72) |= 4u;
  }
}

+ (uint64_t)_insertIndexForObject:(void *)a3 inArray:(uint64_t)a4 lowIdx:(uint64_t)a5 highIdx:(void *)a6 sortDescriptors:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self;
  if (a5 < a4 || a5 + 1 == a4) {
    return a4;
  }
  while (2)
  {
    uint64_t v11 = a4 + a5;
    if (a4 + a5 < 0 != __OFADD__(a4, a5)) {
      ++v11;
    }
    uint64_t v12 = v11 >> 1;
    uint64_t v13 = [a3 objectAtIndex:v11 >> 1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [a6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(a6);
        }
        uint64_t v18 = [*(id *)(*((void *)&v20 + 1) + 8 * v17) compareObject:v13 toObject:a2];
        if (v18) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [a6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v15) {
            goto LABEL_7;
          }
          return v12;
        }
      }
      if (v18 == 1)
      {
        if (a4 == v12) {
          return a4;
        }
        a5 = v12 - 1;
      }
      else
      {
        if (a5 == v12) {
          return a5 + 1;
        }
        a4 = v12 + 1;
      }
      if (a4 <= a5) {
        continue;
      }
    }
    return v12;
  }
}

+ (void)initialize
{
}

- (uint64_t)_objectInResults:(uint64_t)a1
{
  unsigned int v3 = *(void **)(a1 + 48);
  if ((*(unsigned char *)(a1 + 72) & 8) == 0
    || (uint64_t result = (uint64_t)-[NSFetchedResultsController _sectionNameForObject:]((__CFString *)a1, a2)) != 0)
  {
    if ([a2 isDeleted])
    {
      return 0;
    }
    else if (v3)
    {
      return [v3 evaluateWithObject:a2];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)_managedObjectContextDidSave:(id)a3
{
  if ([(NSManagedObjectContext *)self->_managedObjectContext concurrencyType])
  {
    managedObjectContext = self->_managedObjectContext;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__NSFetchedResultsController_PrivateMethods___managedObjectContextDidSave___block_invoke;
    v6[3] = &unk_1E544B778;
    v6[4] = self;
    v6[5] = a3;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v6];
  }
  else
  {
    -[NSFetchedResultsController _core_managedObjectContextDidSave:]((uint64_t)self, a3);
  }
}

+ (void)deleteCacheWithName:(NSString *)name
{
  unint64_t v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v5 = (void *)+[NSFetchedResultsController _CoreDataSectionCachesPath]();
  uint64_t v6 = (uint64_t)v5;
  if (name) {
    uint64_t v6 = [v5 stringByAppendingPathComponent:name];
  }

  [v4 removeItemAtPath:v6 error:0];
}

- (uint64_t)_restoreCachedSectionInfo
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (uint64_t)-[NSFetchedResultsController _sectionCachePath](result);
    if (result)
    {
      uint64_t v2 = (void *)[(id)result stringByAppendingPathComponent:@"sectionInfo"];
      unsigned int v3 = (const char *)[v2 fileSystemRepresentation];
      memset(&v116, 0, sizeof(v116));
      if (stat(v3, &v116)) {
        return 0;
      }
      unint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfMappedFile:v2];
      unint64_t v5 = [v4 length];
      unint64_t v115 = 0;
      if (v5 < 0x20
        || ((unint64_t v6 = v5, v7 = (void *)[v4 bytes], *v7 == 0x3562366135623134)
          ? (BOOL v8 = v7[1] == 0x3463383438653663)
          : (BOOL v8 = 0),
            v8 ? (BOOL v9 = v7[2] == 0x6330383438613236) : (BOOL v9 = 0),
            v9 ? (BOOL v10 = v7[3] == 0x3366656163343264) : (BOOL v10 = 0),
            !v10))
      {
LABEL_27:

        unlink(v3);
        return 0;
      }
      uint64_t v11 = (uint64_t)v7;
      v115 += 48;
      uint64_t v12 = objc_msgSend((id)objc_msgSend((id)v1, "fetchRequest"), "entity");
      id v13 = _newReadStringFromBytes(v11, &v115, v6);
      if (!v13
        || (objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", v13) & 1) == 0
        || (v13, (id v13 = _newReadDataFromBytes(v11, &v115, v6)) == 0)
        || (objc_msgSend((id)objc_msgSend(v12, "versionHash"), "isEqualToData:", v13) & 1) == 0)
      {

        goto LABEL_27;
      }

      id v14 = _newReadStringFromBytes(v11, &v115, v6);
      if (v14)
      {
        uint64_t v15 = *(void **)(v1 + 24);
        if (!v15)
        {
LABEL_24:
          if ([v14 length]) {
            goto LABEL_25;
          }
LABEL_30:

          unint64_t v16 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v16 + 4 <= v6)
          {
            unsigned int v114 = bswap32(*(_DWORD *)(v11 + v16));
            unint64_t v115 = v16 + 4;
          }
          else
          {
            unsigned int v114 = 0;
          }
          if (!BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88)
            && objc_msgSend((id)objc_msgSend((id)v1, "fetchedObjects"), "count") != v114)
          {
            goto LABEL_27;
          }
          uint64_t v17 = (void *)[*(id *)(v1 + 8) sortDescriptors];
          uint64_t v18 = v17;
          unint64_t v19 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v19 + 4 <= v6)
          {
            unsigned int v20 = *(_DWORD *)(v11 + v19);
            uint64_t v21 = bswap32(v20);
            unint64_t v115 = v19 + 4;
            if (v21 != [v17 count]) {
              goto LABEL_27;
            }
            if (v20)
            {
              uint64_t v22 = 0;
              do
              {
                id v23 = _newReadStringFromBytes(v11, &v115, v6);
                int v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", v22), "key"), "isEqualToString:", v23);

                if (!v24) {
                  goto LABEL_27;
                }
              }
              while (v21 != ++v22);
            }
          }
          else if ([v17 count])
          {
            goto LABEL_27;
          }
          uint64_t v25 = (void *)[*(id *)(v1 + 8) affectedStores];
          if (![v25 count]) {
            uint64_t v25 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "persistentStoreCoordinator"), "persistentStores");
          }
          unint64_t v26 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v26 + 4 <= v6)
          {
            unsigned int v27 = *(_DWORD *)(v11 + v26);
            unsigned int v28 = bswap32(v27);
            unint64_t v115 = v26 + 4;
            if (v28 != [v25 count]) {
              goto LABEL_27;
            }
            if (v27)
            {
              uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:", v25, objc_msgSend(v25, "valueForKey:", @"identifier"));
              do
              {
                id v30 = _newReadStringFromBytes(v11, &v115, v6);
                unint64_t v31 = (void *)[v29 objectForKey:v30];

                if (!v31) {
                  goto LABEL_27;
                }
                __darwin_time_t v32 = stat_path_for_modication_time((void *)[v31 URL]);
                unint64_t v34 = (v115 + 7) & 0xFFFFFFFFFFFFFFF8;
                unint64_t v35 = v34 + 8;
                if (v34 + 8 <= v6)
                {
                  unint64_t v36 = bswap64(*(void *)(v11 + v34));
                  unint64_t v115 = v34 + 8;
                  unint64_t v34 = (v34 + 15) & 0xFFFFFFFFFFFFFFF8;
                  unint64_t v35 = v34 + 8;
                }
                else
                {
                  unint64_t v36 = 0;
                }
                if (v35 <= v6)
                {
                  unint64_t v37 = bswap64(*(void *)(v11 + v34));
                  unint64_t v115 = v35;
                }
                else
                {
                  unint64_t v37 = 0;
                }
                if (v36 != v32 || v37 != v33) {
                  goto LABEL_27;
                }
              }
              while (--v28);
            }
          }
          else if ([v25 count])
          {
            goto LABEL_27;
          }

          *(void *)(v1 + 104) = objc_alloc_init(MEMORY[0x1E4F1CA70]);
          *(void *)(v1 + 112) = objc_alloc_init(MEMORY[0x1E4F1CA60]);

          *(void *)(v1 + 120) = 0;
          *(void *)(v1 + 128) = 0;
          unint64_t v38 = v115;
          unint64_t v39 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t v40 = v39 + 4;
          if (v39 + 4 <= v6)
          {
            unsigned int v41 = *(_DWORD *)(v11 + v39);
            unint64_t v115 = v40;
            unint64_t v38 = v40;
            if (v41)
            {
              unsigned int v42 = bswap32(v41);
              while (1)
              {
                id v43 = _newReadStringFromBytes(v11, &v115, v6);
                id v44 = _newReadStringFromBytes(v11, &v115, v6);
                id v14 = v44;
                unint64_t v45 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                unint64_t v46 = v45 + 4;
                if (v45 + 4 <= v6)
                {
                  unsigned int v47 = bswap32(*(_DWORD *)(v11 + v45));
                  unint64_t v115 = v45 + 4;
                  unint64_t v45 = (v45 + 7) & 0xFFFFFFFFFFFFFFFCLL;
                  unint64_t v46 = v45 + 4;
                }
                else
                {
                  unsigned int v47 = 0;
                }
                if (v46 <= v6)
                {
                  unsigned int v48 = bswap32(*(_DWORD *)(v11 + v45));
                  unint64_t v115 = v46;
                }
                else
                {
                  unsigned int v48 = 0;
                }
                if (!v43 || !v44) {
                  break;
                }
                uint64_t v49 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], v1, v43, 0, v44, v48);
                uint64_t v50 = v49;
                if (v49)
                {
                  v49[5] = v47;

                  v50[7] = 0;
                }

                [*(id *)(v1 + 104) addObject:v50];
                if ((*(unsigned char *)(v1 + 72) & 8) != 0) {
                  objc_msgSend(*(id *)(v1 + 112), "setObject:forKey:", v50, objc_msgSend(v50, "name"));
                }

                if (!--v42)
                {
                  unint64_t v38 = v115;
                  goto LABEL_78;
                }
              }

              goto LABEL_25;
            }
          }
LABEL_78:
          unint64_t v51 = (v38 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t v52 = v51 + 4;
          if (v51 + 4 > v6
            || (int v53 = *(_DWORD *)(v11 + v51), v115 = v52, !v53)
            || !BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88))
          {
LABEL_79:

            return 1;
          }
          id v113 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          uint64_t v54 = (void *)[MEMORY[0x1E4F1CA48] array];
          unint64_t v55 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t v56 = v55 + 4;
          if (v55 + 4 <= v6)
          {
            unsigned int v57 = *(_DWORD *)(v11 + v55);
            unint64_t v115 = v56;
            if (v57)
            {
              uint64_t v58 = bswap32(v57);
              do
              {
                id v59 = _newReadStringFromBytes(v11, &v115, v6);
                if (!v59) {
                  goto LABEL_122;
                }
                long long v60 = v59;
                [v54 addObject:v59];
              }
              while (--v58);
            }
          }
          long long v61 = (void *)[MEMORY[0x1E4F1CA48] array];
          unint64_t v62 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t v63 = v62 + 4;
          if (v62 + 4 <= v6)
          {
            unsigned int v64 = *(_DWORD *)(v11 + v62);
            unint64_t v115 = v63;
            if (v64)
            {
              uint64_t v65 = bswap32(v64);
              while (1)
              {
                id v66 = _newReadStringFromBytes(v11, &v115, v6);
                if (!v66) {
                  break;
                }
                uint64_t v67 = v66;
                [v61 addObject:v66];

                if (!--v65) {
                  goto LABEL_92;
                }
              }
LABEL_122:
              [v113 drain];
              goto LABEL_27;
            }
          }
LABEL_92:
          uint64_t v112 = v54;
          Mutable = CFArrayCreateMutable(0, 0, 0);
          unint64_t v69 = v115;
          unint64_t v70 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t v71 = v70 + 4;
          if (v70 + 4 <= v6 && (unsigned int v72 = *(_DWORD *)(v11 + v70), v115 = v71, v69 = v71, v72))
          {
            uint64_t v73 = bswap32(v72);
            while (1)
            {
              unint64_t v74 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
              unint64_t v75 = v74 + 4;
              if (v74 + 4 > v6) {
                break;
              }
              unsigned int v76 = *(_DWORD *)(v11 + v74);
              unint64_t v115 = v75;
              if (!v76) {
                break;
              }
              CFArrayAppendValue(Mutable, (const void *)bswap32(v76));
              if (!--v73)
              {
                unint64_t v69 = v115;
                goto LABEL_99;
              }
            }
          }
          else
          {
LABEL_99:
            unint64_t v77 = (v69 + 7) & 0xFFFFFFFFFFFFFFF8;
            unint64_t v78 = v77 + 8;
            if (v77 + 8 <= v6)
            {
              unint64_t v79 = *(void *)(v11 + v77);
              unint64_t v115 = v78;
              if (v79)
              {
                uint64_t v80 = bswap64(v79);
                uint64_t v110 = [NSNumber numberWithLongLong:v80];
                unsigned int Count = CFArrayGetCount(Mutable);
                uint64_t v82 = CFArrayCreateMutable(0, 0, 0);
                uint64_t v111 = v80;
                BOOL v83 = v80 >= 0x1000000 || Count >= 0xFF;
                int v84 = !v83;
                int v109 = v84;
                if (v83)
                {
                  unint64_t v91 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                  unint64_t v92 = v91 + 4;
                  if (v91 + 4 <= v6)
                  {
                    unsigned int v93 = bswap32(*(_DWORD *)(v11 + v91));
                    unint64_t v115 = v92;
                  }
                  else
                  {
                    unsigned int v93 = 0;
                  }
                  uint64_t v103 = v93;
                  if (Count >= 0xFF)
                  {
                    if (v93)
                    {
                      do
                      {
                        unint64_t v105 = (v115 + 1) & 0xFFFFFFFFFFFFFFFELL;
                        unint64_t v106 = v105 + 2;
                        if (v105 + 2 <= v6)
                        {
                          unsigned int v107 = bswap32(*(unsigned __int16 *)(v11 + v105)) >> 16;
                          unint64_t v115 = v106;
                        }
                        else
                        {
                          unsigned int v107 = 0;
                        }
                        if (v107 >= Count) {
                          goto LABEL_112;
                        }
                        CFArrayAppendValue(v82, (const void *)v107);
                      }
                      while (--v103);
                    }
                  }
                  else if (v93)
                  {
                    do
                    {
                      if (v115 + 1 <= v6) {
                        unsigned int v104 = *(unsigned __int8 *)(v11 + v115++);
                      }
                      else {
                        unsigned int v104 = 0;
                      }
                      if (v104 >= Count) {
                        goto LABEL_112;
                      }
                      CFArrayAppendValue(v82, (const void *)v104);
                    }
                    while (--v103);
                  }
                }
                uint64_t v85 = CFArrayCreateMutable(0, 0, 0);
                unint64_t v86 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                unint64_t v87 = v86 + 4;
                if (v86 + 4 <= v6)
                {
                  unsigned int v88 = bswap32(*(_DWORD *)(v11 + v86));
                  unint64_t v115 = v87;
                }
                else
                {
                  unsigned int v88 = 0;
                }
                uint64_t v94 = v88;
                if (v111 >= 0xFFFFFFFFLL)
                {
                  if (v88)
                  {
                    do
                    {
                      unint64_t v98 = (v115 + 7) & 0xFFFFFFFFFFFFFFF8;
                      unint64_t v99 = v98 + 8;
                      if (v98 + 8 > v6) {
                        goto LABEL_113;
                      }
                      unint64_t v100 = *(void *)(v11 + v98);
                      unint64_t v115 = v99;
                      if (!v100) {
                        goto LABEL_113;
                      }
                      CFArrayAppendValue(v85, (const void *)bswap64(v100));
                    }
                    while (--v94);
                  }
                }
                else if (v88)
                {
                  do
                  {
                    unint64_t v95 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                    unint64_t v96 = v95 + 4;
                    if (v95 + 4 > v6) {
                      goto LABEL_113;
                    }
                    unsigned int v97 = *(_DWORD *)(v11 + v95);
                    unint64_t v115 = v96;
                    if (!v97) {
                      goto LABEL_113;
                    }
                    CFArrayAppendValue(v85, (const void *)bswap32(v97));
                  }
                  while (--v94);
                }
                long long v101 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v112, v61, Mutable, v110, 0);
                if (v109) {
                  uint64_t v102 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v85];
                }
                else {
                  uint64_t v102 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v82, v85, 0);
                }
                int v108 = (void *)+[_PFRoutines _newObjectIDsArrayWithMapping:andEntries:andCoordinator:]((uint64_t)_PFRoutines, v101, v102, (void *)[*(id *)(v1 + 16) persistentStoreCoordinator]);
                uint64_t v89 = v108;
                if (v108 && [v108 count] == v114)
                {
                  *(void *)(v1 + 96) = [[_PFBatchFaultingArray alloc] initWithPFArray:v89 andRequest:*(void *)(v1 + 8) andContext:*(void *)(v1 + 16)];
                  *(void *)(v1 + 136) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v89, "count"));
                  *(void *)(v1 + 144) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  *(_DWORD *)(v1 + 72) = *(_DWORD *)(v1 + 72) & 0xFFFFFFF9 | 2;
                  int v90 = 1;
                  if (!Mutable)
                  {
LABEL_116:
                    if (v82) {
                      CFRelease(v82);
                    }
                    if (v85) {
                      CFRelease(v85);
                    }

                    [v113 drain];
                    if (!v90) {
                      goto LABEL_27;
                    }
                    goto LABEL_79;
                  }
LABEL_115:
                  CFRelease(Mutable);
                  goto LABEL_116;
                }
LABEL_114:
                int v90 = 0;
                if (!Mutable) {
                  goto LABEL_116;
                }
                goto LABEL_115;
              }
            }
          }
          uint64_t v82 = 0;
LABEL_112:
          uint64_t v85 = 0;
LABEL_113:
          uint64_t v89 = 0;
          goto LABEL_114;
        }
        if ([v15 isEqualToString:v14])
        {
          if (*(void *)(v1 + 24)) {
            goto LABEL_30;
          }
          goto LABEL_24;
        }
      }
LABEL_25:

      goto LABEL_27;
    }
  }
  return result;
}

- (id)_sectionCachePath
{
  if (!*(void *)(a1 + 40)) {
    return 0;
  }
  id result = *(id *)(a1 + 64);
  if (!result)
  {
    id result = (id)[(id)+[NSFetchedResultsController _CoreDataSectionCachesPath]() stringByAppendingPathComponent:*(void *)(a1 + 40)];
    *(void *)(a1 + 64) = result;
  }
  return result;
}

+ (uint64_t)_CoreDataSectionCachesPath
{
  self;
  uint64_t result = _CoreDataSectionCachesPath__cachesPath;
  if (!_CoreDataSectionCachesPath__cachesPath)
  {
    uint64_t v1 = objc_opt_class();
    objc_sync_enter(v1);
    uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    if ([(NSArray *)v2 count]) {
      unsigned int v3 = [(NSArray *)v2 objectAtIndex:0];
    }
    else {
      unsigned int v3 = NSTemporaryDirectory();
    }
    unint64_t v4 = v3;
    unint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
    if ([v5 length]) {
      unint64_t v4 = [(NSString *)v4 stringByAppendingPathComponent:v5];
    }
    unint64_t v6 = [[(NSString *)v4 stringByAppendingPathComponent:@".CoreDataCaches"] stringByAppendingPathComponent:@"SectionInfoCaches"];
    if (!_CoreDataSectionCachesPath__cachesPath) {
      _CoreDataSectionCachesPath__cachesPath = v6;
    }
    objc_sync_exit(v1);
    return _CoreDataSectionCachesPath__cachesPath;
  }
  return result;
}

- (void)_core_managedObjectContextDidSave:(uint64_t)a1
{
  v170[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"_NSTriggerModifiedObjectIDsKey");
    if ([v4 count])
    {
      uint64_t v169 = @"updated_objectIDs";
      v170[0] = v4;
      -[NSFetchedResultsController _core_managedObjectContextDidChange:](a1, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v170 forKeys:&v169 count:1]);
    }
    if (*(void *)(a1 + 40) && *(void *)(a1 + 80))
    {
      id v5 = -[NSFetchedResultsController _sectionCachePath](a1);
      unint64_t v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v157 = 0;
      int v7 = [v6 fileExistsAtPath:v5];
      BOOL v8 = (void *)[a2 userInfo];
      BOOL v9 = (void *)[v5 stringByAppendingPathComponent:@"sectionInfo"];
      memset(&v168, 0, sizeof(v168));
      int v10 = stat((const char *)[v9 fileSystemRepresentation], &v168);
      off_t st_size = v168.st_size;
      uint64_t v12 = (const char *)[v9 fileSystemRepresentation];
      if (a2)
      {
        if ([a2 object] == *(void *)(a1 + 16))
        {
          if ((*(_WORD *)(a1 + 72) & 0x1080) == 0) {
            goto LABEL_10;
          }
        }
        else
        {
          uint64_t v13 = [v8 objectForKey:@"managedObjectContext"];
          if (v13 && v13 != *(void *)(a1 + 16))
          {
LABEL_10:
            if (v12)
            {
              int v14 = open(v12, 1026, 384);
              if ((v14 & 0x80000000) == 0) {
                close(v14);
              }
            }
            return;
          }
        }
      }
      int v15 = *(_DWORD *)(a1 + 72);
      if (v15) {
        int v16 = 0;
      }
      else {
        int v16 = v7;
      }
      if (v16 != 1 || v10 || st_size < 1) {
        goto LABEL_30;
      }
      uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend(-[NSFetchedResultsController _sectionCachePath](a1), "stringByAppendingPathComponent:", @"sectionInfo"), "fileSystemRepresentation");
      if (v17)
      {
        int v18 = open(v17, 2);
        if ((v18 & 0x80000000) == 0)
        {
          int v19 = v18;
          unint64_t __buf = 0;
          memset(&v168, 0, sizeof(v168));
          if (!fstat(v18, &v168) && v168.st_size >= 40)
          {
            if (pread(v19, &__buf, 8uLL, 40) == 8)
            {
              unint64_t __offsetb = bswap64(__buf);
              id v114 = objc_alloc_init(MEMORY[0x1E4F28B28]);
              unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4096];
              -[NSFetchedResultsController _appendAffectedStoreInfoToData:adjustedOffset:](a1, v20, 0);
              ssize_t v21 = pwrite(v19, (const void *)[v20 bytes], objc_msgSend(v20, "length"), __offsetb);
              if (v21 == [v20 length])
              {

                close(v19);
                uint64_t v22 = v114;
LABEL_116:
                [v22 drain];
                return;
              }
              __error();
              uint64_t v103 = objc_opt_class();
              _NSCoreDataLog(1, @" (%@): error writing section cached info at %@ with error %d", v104, v105, v106, v107, v108, v109, v103);
              ftruncate(v19, 0);

              close(v19);
              [v114 drain];
              goto LABEL_29;
            }
            uint64_t v23 = objc_opt_class();
            _NSCoreDataLog(1, @" (%@): couldn't read cache file to update store info timestamps", v24, v25, v26, v27, v28, v29, v23);
          }
          close(v19);
        }
      }
LABEL_29:
      int v15 = *(_DWORD *)(a1 + 72);
LABEL_30:
      *(_DWORD *)(a1 + 72) = v15 & 0xFFFFFFFE;
      if ((v7 & 1) == 0
        && ([v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v157] & 1) == 0)
      {
        uint64_t v74 = objc_opt_class();
        _NSCoreDataLog(1, @" (%@): couldn't create section info cache directory at %@ : %@", v75, v76, v77, v78, v79, v80, v74);
        return;
      }
      if (!v12 || (int v30 = open(v12, 1538, 384), v30 < 0))
      {
        __error();
        uint64_t v110 = objc_opt_class();
        _NSCoreDataLog(1, @" (%@): couldn't create section info file at %@ : %d", v68, v69, v70, v71, v72, v73, v110);
        return;
      }
      int v31 = v30;
      id __offseta = objc_alloc_init(MEMORY[0x1E4F28B28]);
      __darwin_time_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4096];
      [v32 appendBytes:"41b5a6b5c6e848c462a8480cd24caef3" length:32];
      _writeInt64IntoData(v32, 0);
      unint64_t __buf = 0;
      _writeInt64IntoData(v32, 0);
      _writeStringIntoData(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "entity"), "name"), v32, &v168);
      _writeDataIntoData(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "entity"), "versionHash"), v32);
      _writeStringIntoData(*(void **)(a1 + 24), v32, &v168);
      _writeInt32IntoData(v32, [*(id *)(a1 + 96) count]);
      uint64_t v33 = (void *)[*(id *)(a1 + 8) sortDescriptors];
      _writeInt32IntoData(v32, [v33 count]);
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v153 objects:v167 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v154;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v154 != v36) {
              objc_enumerationMutation(v33);
            }
            _writeStringIntoData((void *)[*(id *)(*((void *)&v153 + 1) + 8 * i) key], v32, &v168);
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v153 objects:v167 count:16];
        }
        while (v35);
      }
      -[NSFetchedResultsController _appendAffectedStoreInfoToData:adjustedOffset:](a1, v32, &__buf);
      _writeInt32IntoData(v32, [*(id *)(a1 + 104) count]);
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      unint64_t v38 = *(void **)(a1 + 104);
      uint64_t v39 = [v38 countByEnumeratingWithState:&v149 objects:v166 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v150;
        do
        {
          uint64_t v42 = 0;
          do
          {
            if (*(void *)v150 != v41) {
              objc_enumerationMutation(v38);
            }
            id v43 = *(void **)(*((void *)&v149 + 1) + 8 * v42);
            _writeStringIntoData((void *)[v43 name], v32, &v168);
            _writeStringIntoData((void *)[v43 indexTitle], v32, &v168);
            _writeInt32IntoData(v32, [v43 numberOfObjects]);
            if (v43) {
              uint64_t v44 = v43[4];
            }
            else {
              LODWORD(v44) = 0;
            }
            _writeInt32IntoData(v32, v44);
            ++v42;
          }
          while (v40 != v42);
          uint64_t v45 = [v38 countByEnumeratingWithState:&v149 objects:v166 count:16];
          uint64_t v40 = v45;
        }
        while (v45);
      }
      id v148 = 0;
      id v147 = 0;
      unint64_t v46 = (void *)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs](a1);
      id v113 = (char *)v12;
      if (+[_PFRoutines _generateObjectIDMaptableForArray:withMapping:andEntries:]((uint64_t)_PFRoutines, v46, (uint64_t *)&v148, (uint64_t *)&v147))
      {
        int v111 = v31;
        _writeInt32IntoData(v32, 1u);
        unsigned int v47 = (void *)[v148 objectAtIndex:0];
        unsigned int v48 = (void *)[v148 objectAtIndex:1];
        uint64_t v49 = (void *)[v148 objectAtIndex:2];
        uint64_t v112 = (void *)[v148 objectAtIndex:3];
        uint64_t v50 = (void *)[v147 objectAtIndex:0];
        unint64_t v51 = v50;
        if ((unint64_t)[v147 count] >= 2) {
          unint64_t v51 = (void *)[v147 objectAtIndex:1];
        }
        _writeInt32IntoData(v32, [v47 count]);
        long long v145 = 0u;
        long long v146 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        uint64_t v52 = [v47 countByEnumeratingWithState:&v143 objects:v165 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v144;
          do
          {
            for (uint64_t j = 0; j != v53; ++j)
            {
              if (*(void *)v144 != v54) {
                objc_enumerationMutation(v47);
              }
              _writeStringIntoData(*(void **)(*((void *)&v143 + 1) + 8 * j), v32, &v168);
            }
            uint64_t v53 = [v47 countByEnumeratingWithState:&v143 objects:v165 count:16];
          }
          while (v53);
        }
        _writeInt32IntoData(v32, [v48 count]);
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        uint64_t v56 = [v48 countByEnumeratingWithState:&v139 objects:v164 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v140;
          do
          {
            for (uint64_t k = 0; k != v57; ++k)
            {
              if (*(void *)v140 != v58) {
                objc_enumerationMutation(v48);
              }
              _writeStringIntoData(*(void **)(*((void *)&v139 + 1) + 8 * k), v32, &v168);
            }
            uint64_t v57 = [v48 countByEnumeratingWithState:&v139 objects:v164 count:16];
          }
          while (v57);
        }
        _writeInt32IntoData(v32, [v49 count]);
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        uint64_t v60 = [v49 countByEnumeratingWithState:&v135 objects:v163 count:16];
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v136;
          do
          {
            for (uint64_t m = 0; m != v61; ++m)
            {
              if (*(void *)v136 != v62) {
                objc_enumerationMutation(v49);
              }
              _writeInt32IntoData(v32, *(void *)(*((void *)&v135 + 1) + 8 * m));
            }
            uint64_t v61 = [v49 countByEnumeratingWithState:&v135 objects:v163 count:16];
          }
          while (v61);
        }
        _writeInt64IntoData(v32, [v112 longLongValue]);
        if ((unint64_t)[v147 count] >= 2)
        {
          _writeInt32IntoData(v32, [v50 count]);
          if ((unint64_t)[v49 count] > 0xFE)
          {
            long long v129 = 0uLL;
            long long v130 = 0uLL;
            long long v127 = 0uLL;
            long long v128 = 0uLL;
            uint64_t v82 = [v50 countByEnumeratingWithState:&v127 objects:v161 count:16];
            if (v82)
            {
              uint64_t v83 = v82;
              uint64_t v84 = *(void *)v128;
              do
              {
                for (uint64_t n = 0; n != v83; ++n)
                {
                  if (*(void *)v128 != v84) {
                    objc_enumerationMutation(v50);
                  }
                  _writeInt16IntoData(v32, (unsigned __int16)*(void *)(*((void *)&v127 + 1) + 8 * n));
                }
                uint64_t v83 = [v50 countByEnumeratingWithState:&v127 objects:v161 count:16];
              }
              while (v83);
            }
          }
          else
          {
            long long v133 = 0uLL;
            long long v134 = 0uLL;
            long long v131 = 0uLL;
            long long v132 = 0uLL;
            uint64_t v64 = [v50 countByEnumeratingWithState:&v131 objects:v162 count:16];
            if (v64)
            {
              uint64_t v65 = v64;
              uint64_t v66 = *(void *)v132;
              do
              {
                for (iuint64_t i = 0; ii != v65; ++ii)
                {
                  if (*(void *)v132 != v66) {
                    objc_enumerationMutation(v50);
                  }
                  LOBYTE(v118) = *(void *)(*((void *)&v131 + 1) + 8 * ii);
                  [v32 appendBytes:&v118 length:1];
                }
                uint64_t v65 = [v50 countByEnumeratingWithState:&v131 objects:v162 count:16];
              }
              while (v65);
            }
          }
        }
        _writeInt32IntoData(v32, [v51 count]);
        if ([v112 longLongValue] > 4294967294)
        {
          long long v121 = 0uLL;
          long long v122 = 0uLL;
          long long v119 = 0uLL;
          long long v120 = 0uLL;
          uint64_t v90 = [v51 countByEnumeratingWithState:&v119 objects:v159 count:16];
          int v31 = v111;
          id v81 = __offseta;
          if (v90)
          {
            uint64_t v91 = v90;
            uint64_t v92 = *(void *)v120;
            do
            {
              for (juint64_t j = 0; jj != v91; ++jj)
              {
                if (*(void *)v120 != v92) {
                  objc_enumerationMutation(v51);
                }
                _writeInt64IntoData(v32, *(void *)(*((void *)&v119 + 1) + 8 * jj));
              }
              uint64_t v91 = [v51 countByEnumeratingWithState:&v119 objects:v159 count:16];
            }
            while (v91);
          }
        }
        else
        {
          long long v125 = 0uLL;
          long long v126 = 0uLL;
          long long v123 = 0uLL;
          long long v124 = 0uLL;
          uint64_t v86 = [v51 countByEnumeratingWithState:&v123 objects:v160 count:16];
          int v31 = v111;
          id v81 = __offseta;
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v124;
            do
            {
              for (kuint64_t k = 0; kk != v87; ++kk)
              {
                if (*(void *)v124 != v88) {
                  objc_enumerationMutation(v51);
                }
                _writeInt32IntoData(v32, *(void *)(*((void *)&v123 + 1) + 8 * kk));
              }
              uint64_t v87 = [v51 countByEnumeratingWithState:&v123 objects:v160 count:16];
            }
            while (v87);
          }
        }
      }
      else
      {
        _writeInt32IntoData(v32, 0);
        id v81 = __offseta;
      }
      unint64_t v94 = [v32 length];
      unint64_t v118 = bswap64(v94);
      objc_msgSend(v32, "replaceBytesInRange:withBytes:", 32, 8, &v118);
      unint64_t v117 = bswap64(__buf);
      objc_msgSend(v32, "replaceBytesInRange:withBytes:", 40, 8, &v117);
      ssize_t v95 = pwrite(v31, (const void *)[v32 bytes], v94, 0);
      if (!v94 || v95 != v94)
      {
        __error();
        uint64_t v96 = objc_opt_class();
        _NSCoreDataLog(1, @" (%@): error writing section cached info at %@ with error %d", v97, v98, v99, v100, v101, v102, v96);
        ftruncate(v31, 0);
        unlink(v113);
      }

      close(v31);
      uint64_t v22 = v81;
      goto LABEL_116;
    }
  }
}

uint64_t __136__NSFetchedResultsController_PrivateMethods___lowerMoveOperationsToUpdatesForSection_withInsertedObjects_deletedObjects_updatedObjects___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2)
  {
    unsigned int v3 = 0;
    if (!a3) {
      return [v3 compare:a3];
    }
    goto LABEL_3;
  }
  unsigned int v3 = *(void **)(a2 + 24);
  if (a3) {
LABEL_3:
  }
    a3 = *(void *)(a3 + 24);
  return [v3 compare:a3];
}

uint64_t __136__NSFetchedResultsController_PrivateMethods___lowerMoveOperationsToUpdatesForSection_withInsertedObjects_deletedObjects_updatedObjects___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2)
  {
    unsigned int v3 = 0;
    if (!a3) {
      return [v3 compare:a3];
    }
    goto LABEL_3;
  }
  unsigned int v3 = *(void **)(a2 + 32);
  if (a3) {
LABEL_3:
  }
    a3 = *(void *)(a3 + 32);
  return [v3 compare:a3];
}

- (__CFString)_sectionNameForObject:(__CFString *)result
{
  if (result)
  {
    unsigned int v3 = result;
    if ([(id)result->info resultType] == 1)
    {
      unint64_t v4 = (void *)[a2 _retainedURIString];
      return (__CFString *)v4;
    }
    else if ([(id)v3->info resultType] == 4)
    {
      return @"Count";
    }
    else
    {
      id v5 = (void *)[a2 valueForKeyPath:v3->length];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = (void *)[v5 objectID];
        LODWORD(v3[2].info) |= 0x10u;
        uint64_t result = (__CFString *)(id)[v6 _retainedURIString];
      }
      else
      {
        uint64_t result = (__CFString *)[v5 description];
      }
      if (!result) {
        return &stru_1ED787880;
      }
    }
  }
  return result;
}

- (NSString)sectionIndexTitleForSectionName:(NSString *)sectionName
{
  if (!sectionName || ![(NSString *)sectionName length]) {
    return 0;
  }
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%c", -[NSString characterAtIndex:](sectionName, "characterAtIndex:", 0));

  return (NSString *)[v4 uppercaseString];
}

- (NSArray)sectionIndexTitles
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t result = (NSArray *)self->_sectionIndexTitles;
  if (!result)
  {
    self->_sectionIndexTitles = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_sections, "count"));
    self->_sectionIndexTitlesSections = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_sections, "count"));
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      sections = self->_sections;
      uint64_t v5 = [(NSMutableOrderedSet *)sections countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        int v7 = 0;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(sections);
            }
            int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            uint64_t v11 = [v10 indexTitle];
            if (v11)
            {
              uint64_t v12 = (void *)v11;
              if (([v7 isEqualToString:v11] & 1) == 0)
              {
                [self->_sectionIndexTitles addObject:v12];
                [self->_sectionIndexTitlesSections addObject:v10];
                int v7 = v12;
              }
            }
          }
          uint64_t v6 = [(NSMutableOrderedSet *)sections countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }
    }
    return (NSArray *)self->_sectionIndexTitles;
  }
  return result;
}

- (NSInteger)sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)sectionIndex
{
  int v7 = [(NSFetchedResultsController *)self sectionIndexTitles];
  if ((int64_t)[(NSArray *)v7 count] <= sectionIndex)
  {
    int v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"invalid Section Index offset%li", sectionIndex);
    long long v13 = v10;
    uint64_t v14 = v11;
    goto LABEL_8;
  }
  if ((objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", sectionIndex), "isEqualToString:", title) & 1) == 0)
  {
    long long v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    uint64_t v12 = [NSString stringWithFormat:@"Index title at %li is not equal to '%@'", sectionIndex, title];
    long long v13 = v15;
    uint64_t v14 = v16;
LABEL_8:
    objc_exception_throw((id)[v13 exceptionWithName:v14 reason:v12 userInfo:0]);
  }
  uint64_t v8 = [self->_sectionIndexTitlesSections objectAtIndex:sectionIndex];

  return -[_NSDefaultSectionInfo sectionNumber](v8);
}

- (NSString)cacheName
{
  return self->_cacheName;
}

void __72__NSFetchedResultsController_PrivateMethods___computeSectionInfo_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v2 = 0;
    do
    {
      unsigned int v3 = (void *)[*(id *)(a1 + 32) objectAtIndex:v2];
      if (([v3 isFault] & 1) == 0
        && (objc_msgSend((id)objc_msgSend(v3, "objectID"), "isTemporaryID") & 1) == 0)
      {
        int v4 = [v3 _versionReference];
        uint64_t v5 = [v3 objectID];
        uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16);
        if (v6) {
          int v7 = *(void **)(v6 + 32);
        }
        else {
          int v7 = 0;
        }
        uint64_t v8 = objc_msgSend(v7, "newValuesForObjectWithID:withContext:error:", v5);
        if (!v8 || (v9 = v8, int v10 = [v8 _versionNumber], v9, v4 != v10))
        {
          if (([v3 hasChanges] & 1) == 0) {
            [*(id *)(*(void *)(a1 + 40) + 16) refreshObject:v3 mergeChanges:0];
          }
        }
      }
      ++v2;
    }
    while (v2 < *(void *)(a1 + 48));
  }
}

- (uint64_t)_resolveSectionIndexTitleForSectionName:(uint64_t)a1
{
  if ((*(unsigned char *)(a1 + 73) & 8) != 0)
  {
    uint64_t v5 = *(void *)(a1 + 80);
    if (v5) {
      id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v7 = [WeakRetained controller:a1 sectionIndexTitleForSectionName:a2];

    return v7;
  }
  else
  {
    return [(id)a1 sectionIndexTitleForSectionName:a2];
  }
}

uint64_t __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[2];
  if ((unint64_t)(v2 - 3) >= 2)
  {
    BOOL v6 = v2 == 1;
    uint64_t v5 = a2 + 6;
    unsigned int v3 = (void *)(a1 + 32);
    if (!v6) {
      uint64_t v5 = a2 + 5;
    }
    return *v5 == *v3;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v3 = (void *)(a1 + 32);
  if (a2[5] != v4)
  {
    uint64_t v5 = a2 + 6;
    return *v5 == *v3;
  }
  return 1;
}

- (void)_managedObjectContextDidMutateObjectIDs:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"_NSManagedObjectContextObjectIDMutationMappingKey");
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        unint64_t v10 = -[NSFetchedResultsController _indexOfCachedID:]((uint64_t)self, v9);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v11 = v10;
          uint64_t v12 = [v4 objectForKey:v9];
          -[NSMutableDictionary setObject:forKey:](self->_indexCache, "setObject:forKey:", [NSNumber numberWithUnsignedInteger:v11], v12);
          [(NSMutableDictionary *)self->_indexCache removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v6);
  }
  _fetchResultsControllerFlags flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    context = (void *)MEMORY[0x18C127630]();
    obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v14 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v59;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v4);
          }
          uint64_t v18 = *(void **)(*((void *)&v58 + 1) + 8 * v17);
          int v19 = (void *)MEMORY[0x18C127630](v14);
          sectionsByName = self->_sectionsByName;
          *(_DWORD *)&self->_flags |= 0x10u;
          uint64_t v21 = -[NSMutableDictionary objectForKeyedSubscript:](sectionsByName, "objectForKeyedSubscript:", (id)objc_msgSend(v18, "_retainedURIString", context));
          if (v21)
          {
            uint64_t v22 = (uint64_t *)v21;
            uint64_t v23 = [_NSDefaultSectionInfo alloc];
            uint64_t v24 = (void *)[v4 objectForKeyedSubscript:v18];
            *(_DWORD *)&self->_flags |= 0x10u;
            uint64_t v25 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:](v23, (uint64_t)self, (id)[v24 _retainedURIString], objc_msgSend(v22, "sectionId"), objc_msgSend(v22, "indexTitle"), v22[4]);
            uint64_t v26 = [v22 numberOfObjects];
            if (v25)
            {
              v25[5] = v26;

              v25[7] = 0;
            }
            -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_sections, "replaceObjectAtIndex:withObject:", -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v22), v25);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionsByName, "setObject:forKeyedSubscript:", v25, [v25 name]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionsByName, "setObject:forKeyedSubscript:", 0, [v22 name]);
            [obj addObject:v25];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v14 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
        uint64_t v15 = v14;
      }
      while (v14);
    }
    if (objc_msgSend(obj, "count", context))
    {
      id v27 = [(NSFetchedResultsController *)self delegate];
      if (v27)
      {
        uint64_t v28 = v27;
        _fetchResultsControllerFlags v29 = self->_flags;
        if ((*(_WORD *)&v29 & 0x1000) != 0)
        {
          [v27 controllerWillChangeContent:self];
          _fetchResultsControllerFlags v29 = self->_flags;
        }
        if ((*(_WORD *)&v29 & 0x400) != 0)
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v30 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v55 != v32) {
                  objc_enumerationMutation(obj);
                }
                [v28 controller:self didChangeSection:*(void *)(*((void *)&v54 + 1) + 8 * j) atIndex:-[_NSDefaultSectionInfo sectionNumber](*(void *)(*((void *)&v54 + 1) + 8 * j)) forChangeType:4];
              }
              uint64_t v31 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
            }
            while (v31);
          }
        }
        if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
          [v28 controllerDidChangeContent:self];
        }
      }
    }

    _fetchResultsControllerFlags flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    id v34 = [(NSFetchedResultsController *)self delegate];
    if (v34 || !self->_delegate)
    {
      contextb = v34;
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id obja = (id)MEMORY[0x18C127630]();
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v36 = [v4 countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v51 != v38) {
              objc_enumerationMutation(v4);
            }
            uint64_t v40 = *(void *)(*((void *)&v50 + 1) + 8 * k);
            uint64_t v41 = objc_msgSend(v4, "objectForKeyedSubscript:", v40, contextb);
            unint64_t v42 = -[NSFetchedResultsController _indexOfCachedID:]((uint64_t)self, v41);
            if (v42 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v43 = v42;
              objc_msgSend(v35, "addObject:", objc_msgSend(MEMORY[0x1E4F28F18], "changeWithObject:type:index:associatedIndex:", v40, 1, v43, v43));
              objc_msgSend(v35, "addObject:", objc_msgSend(MEMORY[0x1E4F28F18], "changeWithObject:type:index:associatedIndex:", v41, 0, v43, v43));
            }
          }
          uint64_t v37 = [v4 countByEnumeratingWithState:&v50 objects:v66 count:16];
        }
        while (v37);
      }
      if ([v35 count])
      {
        uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v35];
        [contextb controller:self didChangeContentWithDifference:v44];
      }
    }
    else
    {
      [(NSFetchedResultsController *)self setDelegate:0];
    }
  }
}

- (uint64_t)_appendAffectedStoreInfoToData:(void *)a3 adjustedOffset:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[*(id *)(a1 + 8) affectedStores];
  if (![v6 count]) {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "persistentStoreCoordinator"), "persistentStores");
  }
  _writeInt32IntoData(a2, [v6 count]);
  if (a3) {
    *a3 = [a2 length] - 4;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        _writeStringIntoData((void *)[v11 identifier], a2, v20);
        __darwin_time_t v12 = stat_path_for_modication_time((void *)[v11 URL]);
        unint64_t v14 = v13;
        _writeInt64IntoData(a2, v12);
        _writeInt64IntoData(a2, v14);
        ++v10;
      }
      while (v8 != v10);
      uint64_t result = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = result;
    }
    while (result);
  }
  return result;
}

@end