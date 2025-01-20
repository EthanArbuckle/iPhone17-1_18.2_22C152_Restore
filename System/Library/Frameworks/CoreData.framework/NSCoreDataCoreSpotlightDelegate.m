@interface NSCoreDataCoreSpotlightDelegate
+ (void)initialize;
- (BOOL)isIndexingEnabled;
- (BOOL)usePrivateIndex;
- (CSSearchableItemAttributeSet)attributeSetForObject:(NSManagedObject *)object;
- (NSCoreDataCoreSpotlightDelegate)init;
- (NSCoreDataCoreSpotlightDelegate)initForStoreWithDescription:(NSPersistentStoreDescription *)description coordinator:(NSPersistentStoreCoordinator *)psc;
- (NSCoreDataCoreSpotlightDelegate)initForStoreWithDescription:(NSPersistentStoreDescription *)description model:(NSManagedObjectModel *)model;
- (NSString)domainIdentifier;
- (NSString)indexName;
- (NSURL)indexURL;
- (PFCSSearchableIndexProvider)indexProvider;
- (id)_importObjectsUpdatedSinceTransaction:(void *)a1;
- (id)bundleIdentifier;
- (id)indexedPropertyNamesByEntityNameUsingModel:(id)a3;
- (id)protectionClass;
- (int)_indexerThrottle;
- (uint64_t)_asyncContextBlock:(uint64_t)result;
- (uint64_t)_clientStateForSpotlightIndex:(uint64_t)a1;
- (uint64_t)_context;
- (uint64_t)_doFullReimport;
- (void)_catchUpToCurrentTransaction;
- (void)_initializePersistentStore;
- (void)_resetSpotlightIndexWithCompletionHandler:(void *)a1;
- (void)_searchableItemForObject:(void *)result;
- (void)_updateSpotlightIndexClientState:(uint64_t)a3 historyToken:(int)a4 updatedSpotlight:;
- (void)_updateSpotlightIndexFromBatchResult:(uint64_t)a3;
- (void)_updateSpotlightIndexFromSaveRequest:(uint64_t)a3;
- (void)createClientSearchableIndex;
- (void)dealloc;
- (void)deleteSpotlightIndexWithCompletionHandler:(void *)completionHandler;
- (void)indexSearchableItemsToCurrentHistoryToken;
- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexAllSearchableItemsWithAcknowledgementHandler:(void *)acknowledgementHandler;
- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexSearchableItemsWithIdentifiers:(NSArray *)identifiers acknowledgementHandler:(void *)acknowledgementHandler;
- (void)setIndexProvider:(id)a3;
- (void)setIndexURL:(id)a3;
- (void)startSpotlightIndexing;
- (void)stopSpotlightIndexing;
@end

@implementation NSCoreDataCoreSpotlightDelegate

void __54__NSCoreDataCoreSpotlightDelegate__asyncContextBlock___block_invoke(uint64_t a1)
{
  uint64_t v16 = 0;
  v2 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Spotlight Indexing", &v16);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  -[NSCoreDataCoreSpotlightDelegate _context](*(void *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(*(void *)(a1 + 32) + 32) reset];
  [v3 drain];
  id v4 = 0;
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v16, v2);
  if (_CoreData_SpotlightDebug >= 1)
  {
    v5 = NSString;
    uint64_t v6 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"retval: %d"];
    uint64_t v7 = *(void *)(a1 + 32);
    atomic_fetch_add_explicit((atomic_uint *volatile)(v7 + 104), 0xFFFFFFFF, memory_order_relaxed);
    uint64_t v15 = v7;
    uint64_t v8 = [v5 stringWithFormat:v6];
    _NSCoreDataLog(4, v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

void __57__NSCoreDataCoreSpotlightDelegate_startSpotlightIndexing__block_invoke(uint64_t a1)
{
}

- (void)_initializePersistentStore
{
  if (a1)
  {
    if (_CoreData_SpotlightDebug >= 1)
    {
      uint64_t v2 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"NSCoreDataCoreSpotlightDelegate initializing support for store with identifier %@"];
      _NSCoreDataLog(4, v2, v3, v4, v5, v6, v7, v8, a1);
    }
    global_queue = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = a1;
    dispatch_async(global_queue, block);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _CoreData_SpotlightDebug = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.SpotlightDebug");
  }
}

void __43__NSCoreDataCoreSpotlightDelegate__context__block_invoke(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (atomic_ullong *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "persistentStoreForURL:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "URL"));
  if (!v2)
  {
    if (_CoreData_SpotlightDebug >= 1)
    {
      uint64_t v5 = NSString;
      uint64_t v6 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Store was nil on initialization"];
      uint64_t v80 = *(void *)(a1 + 32);
      uint64_t v7 = [v5 stringWithFormat:v6];
      _NSCoreDataLog(4, v7, v8, v9, v10, v11, v12, v13, v80);
    }
    *(void *)&long long v96 = 0;
    *((void *)&v96 + 1) = &v96;
    uint64_t v97 = 0x3052000000;
    v98 = __Block_byref_object_copy__9;
    v99 = __Block_byref_object_dispose__9;
    uint64_t v100 = 0;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 8);
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __43__NSCoreDataCoreSpotlightDelegate__context__block_invoke_7;
    v88[3] = &unk_1E544B9B0;
    v88[4] = v14;
    v88[5] = &v96;
    [v15 performBlockAndWait:v88];
    id v16 = *(id *)(*((void *)&v96 + 1) + 40);
    if (v16 && _CoreData_SpotlightDebug >= 1)
    {
      v17 = NSString;
      uint64_t v18 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Error during initialization %@"];
      uint64_t v81 = *(void *)(a1 + 32);
      uint64_t v19 = [v17 stringWithFormat:v18];
      _NSCoreDataLog(4, v19, v20, v21, v22, v23, v24, v25, v81);
    }
    v26 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) URL];
    if ([v16 code] == 134081
      && (v27 = (void *)[v16 domain],
          [v27 isEqualToString:*MEMORY[0x1E4F281F8]]))
    {
      uint64_t v28 = [v26 path];
      v35 = @"NSCoreDataCoreSpotlightDelegate tried to load a store at %@ twice";
    }
    else
    {
      if (v16)
      {
        uint64_t v36 = [NSString stringWithUTF8String:"CDCS - NSCoreDataCoreSpotlightDelegate failed to load a store at %@ due to %@ with %@"];
        uint64_t v37 = [v26 path];
        [v16 userInfo];
        _NSCoreDataLog(17, v36, v38, v39, v40, v41, v42, v43, v37);
        v44 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v45 = [v26 path];
          uint64_t v46 = [v16 userInfo];
          *(_DWORD *)buf = 138412802;
          uint64_t v91 = v45;
          __int16 v92 = 2112;
          id v93 = v16;
          __int16 v94 = 2112;
          uint64_t v95 = v46;
          _os_log_fault_impl(&dword_18AB82000, v44, OS_LOG_TYPE_FAULT, "CoreData: CDCS - NSCoreDataCoreSpotlightDelegate failed to load a store at %@ due to %@ with %@", buf, 0x20u);
        }
        goto LABEL_38;
      }
      uint64_t v28 = [v26 path];
      v35 = @"NSCoreDataCoreSpotlightDelegate failed to find its store at %@.  Possibly it was removed from the coordinator.";
    }
    _NSCoreDataLog(1, (uint64_t)v35, v29, v30, v31, v32, v33, v34, v28);
LABEL_38:
    [*(id *)(*(void *)(a1 + 32) + 32) setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 32) + 8)];
    _Block_object_dispose(&v96, 8);
    return;
  }
  uint64_t v3 = v2;
  *(void *)(*(void *)(a1 + 32) + 24) = objc_msgSend((id)-[atomic_ullong identifier](v2, "identifier"), "copy");
  [*(id *)(*(void *)(a1 + 32) + 32) setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 32) + 8)];
  *(void *)(*(void *)(a1 + 32) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "domainIdentifier"), "copy");
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "indexName"), "length"))
  {
    id v4 = (id)[(id)objc_msgSend(NSString stringWithFormat:@"%@_%@", objc_msgSend(*(id *)(a1 + 32), "indexName"), *(void *)(*(void *)(a1 + 32) + 24)), "copy"];
  }
  else
  {
    uint64_t v47 = *(void *)(a1 + 32);
    uint64_t v48 = *(void *)(v47 + 56);
    if (v48
      || (uint64_t v48 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"),
          uint64_t v47 = *(void *)(a1 + 32),
          v48))
    {
      v49 = (void *)[NSString stringWithFormat:@"spotlight_%@_%@", v48, *(void *)(v47 + 24)];
    }
    else
    {
      v49 = (void *)[NSString stringWithFormat:@"spotlight_<>_%@", *(void *)(v47 + 24), v83];
    }
    id v4 = v49;
  }
  *(void *)(*(void *)(a1 + 32) + 48) = v4;
  *(void *)(*(void *)(a1 + 32) + 56) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"), "copy");
  *(void *)(*(void *)(a1 + 32) + 64) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "protectionClass"), "copy");
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = [*(id *)(a1 + 32) usePrivateIndex];
  *(void *)(*(void *)(a1 + 32) + 96) = (id)objc_msgSend(*(id *)(a1 + 32), "indexedPropertyNamesByEntityNameUsingModel:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "managedObjectModel"));
  if (_CoreData_SpotlightDebug >= 1)
  {
    v50 = NSString;
    uint64_t v51 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Initializing with store identifier %@, index name %@, domain identifier %@, bundle ID %@, protection class %@, uses private index %d, indexed property names %@"];
    uint64_t v82 = *(void *)(a1 + 32);
    uint64_t v52 = [v50 stringWithFormat:v51];
    _NSCoreDataLog(4, v52, v53, v54, v55, v56, v57, v58, v82);
  }
  v59 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "managedObjectModel"), "entitiesByName");
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v60 = (void *)[*(id *)(*(void *)(a1 + 32) + 96) allKeys];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v84 objects:v89 count:16];
  if (v61)
  {
    uint64_t v62 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v85 != v62) {
          objc_enumerationMutation(v60);
        }
        v64 = (void *)[v59 objectForKey:*(void *)(*((void *)&v84 + 1) + 8 * i)];
        [v64 coreSpotlightDisplayNameExpression];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend((id)objc_msgSend(v64, "coreSpotlightDisplayNameExpression"), "allowEvaluation");
        }
      }
      uint64_t v61 = [v60 countByEnumeratingWithState:&v84 objects:v89 count:16];
    }
    while (v61);
  }
  uint64_t v65 = [(atomic_ullong *)v3 coreSpotlightExporter];
  v66 = *(id **)(a1 + 32);
  if ((id *)v65 != v66)
  {
    if (v65)
    {
      v67 = (void *)[v66[2] URL];
      uint64_t v68 = [NSString stringWithUTF8String:"CDCS - Attempt to illegally register multiple NSCoreDataCoreSpotlightDelegate for a single store at %@"];
      uint64_t v69 = [v67 path];
      _NSCoreDataLog(17, v68, v70, v71, v72, v73, v74, v75, v69);
      v76 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v77 = [v67 path];
        LODWORD(v96) = 138412290;
        *(void *)((char *)&v96 + 4) = v77;
        _os_log_fault_impl(&dword_18AB82000, v76, OS_LOG_TYPE_FAULT, "CoreData: CDCS - Attempt to illegally register multiple NSCoreDataCoreSpotlightDelegate for a single store at %@", (uint8_t *)&v96, 0xCu);
      }
    }
    else
    {
      v78 = v66;
      uint64_t v79 = 0;
      atomic_compare_exchange_strong(v3 + 9, (unint64_t *)&v79, (unint64_t)v66);
      if (v79) {
    }
      }
  }
}

- (id)indexedPropertyNamesByEntityNameUsingModel:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "entities"), "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)[a3 entities];
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    uint64_t v27 = *(void *)v42;
    do
    {
      uint64_t v7 = 0;
      uint64_t v29 = v5;
      do
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v41 + 1) + 8 * v7);
        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]((uint64_t)v8))
        {
          uint64_t v32 = v7;
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v31 = v8;
          uint64_t v10 = (void *)[v8 properties];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (!v11) {
            goto LABEL_31;
          }
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v38;
          while (1)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              if (objc_msgSend(v15, "_propertyType", v27) == 7)
              {
                id v16 = (void *)[v15 _flattenedElements];
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v34;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v34 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      uint64_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                      if ([v21 isIndexedBySpotlight]) {
                        objc_msgSend(v9, "addObject:", objc_msgSend(v21, "_qualifiedName"));
                      }
                    }
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  }
                  while (v18);
                }
              }
              else
              {
                uint64_t v22 = [v15 _propertyType];
                int v23 = [v15 isIndexedBySpotlight];
                if (v22 == 2)
                {
                  if (!v23) {
                    continue;
                  }
                  uint64_t v24 = [v15 _qualifiedName];
                }
                else
                {
                  if (!v23) {
                    continue;
                  }
                  uint64_t v24 = [v15 name];
                }
                [v9 addObject:v24];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (!v12)
            {
LABEL_31:
              objc_msgSend(v28, "setObject:forKey:", v9, objc_msgSend(v31, "name", v27));

              uint64_t v6 = v27;
              uint64_t v5 = v29;
              uint64_t v7 = v32;
              break;
            }
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v5);
  }
  id v25 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v28];

  return v25;
}

- (NSCoreDataCoreSpotlightDelegate)initForStoreWithDescription:(NSPersistentStoreDescription *)description coordinator:(NSPersistentStoreCoordinator *)psc
{
  if (self && (_BYTE)dword_1EB270AB8)
  {
    id v7 = [(NSDictionary *)[(NSPersistentStoreDescription *)description options] objectForKey:@"NSPersistentHistoryTrackingKey"];
    if ([(NSString *)[(NSPersistentStoreDescription *)description type] isEqualToString:@"SQLite"])
    {
      if (([v7 isNSDictionary] & 1) != 0
        || [v7 isNSNumber] && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
      {
        goto LABEL_10;
      }
      uint64_t v8 = @"NSCoreDataCoreSpotlightDelegate requires NSPersistentHistoryTrackingKey to be enabled in NSPersistentStoreDescription options.";
    }
    else
    {
      uint64_t v8 = @"NSCoreDataCoreSpotlightDelegate requires the store type to be NSSQLiteStoreType.";
    }
    uint64_t v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v8 userInfo:0];
    if (v9)
    {
      uint64_t v12 = (void *)v9;

      objc_exception_throw(v12);
    }
  }
LABEL_10:
  v13.receiver = self;
  v13.super_class = (Class)NSCoreDataCoreSpotlightDelegate;
  uint64_t v10 = [(NSCoreDataCoreSpotlightDelegate *)&v13 init];
  if (v10)
  {
    v10->_coordinator = psc;
    v10->_indexProvider = objc_alloc_init(PFCSSearchableIndexProvider);
    v10->_description = (NSPersistentStoreDescription *)[(NSPersistentStoreDescription *)description copy];
    v10->_context__ = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    atomic_store(0, (unsigned __int8 *)&v10->_enabled);
  }
  return v10;
}

- (void)_updateSpotlightIndexFromSaveRequest:(uint64_t)a3
{
  if (a1)
  {
    unsigned __int8 v10 = atomic_load((unsigned __int8 *)(a1 + 72));
    if (v10)
    {
      if (atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 88), 1u, memory_order_relaxed))
      {
        if (_CoreData_SpotlightDebug >= 1)
        {
          uint64_t v11 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Dropping \"duplicate\" indexing request (%d).", a1, "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:]", 486, objc_msgSend((id)a1, "_indexerThrottle")];
          _NSCoreDataLog(4, v11, v12, v13, v14, v15, v16, v17, a9);
        }
      }
      else
      {
        if (_CoreData_SpotlightDebug >= 1)
        {
          uint64_t v19 = NSString;
          uint64_t v20 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Allowing indexing request (%d)."];
          [(id)a1 _indexerThrottle];
          uint64_t v21 = [v19 stringWithFormat:v20];
          _NSCoreDataLog(4, v21, v22, v23, v24, v25, v26, v27, a1);
        }
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromSaveRequest___block_invoke;
        v28[3] = &unk_1E544BD80;
        int v29 = 1;
        v28[4] = a1;
        v28[5] = a2;
        -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](a1, (uint64_t)v28);
      }
    }
  }
}

uint64_t __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke_2;
  v3[3] = &unk_1E544B868;
  v3[4] = v1;
  return -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](v1, (uint64_t)v3);
}

void __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromSaveRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 72));
  uint64_t v10 = *(void *)(a1 + 32);
  if (v9)
  {
    if ([*(id *)(v10 + 8) persistentStoreForIdentifier:*(void *)(v10 + 24)]) {
      -[NSCoreDataCoreSpotlightDelegate _catchUpToCurrentTransaction](*(void **)(a1 + 32));
    }
    int v12 = *(_DWORD *)(a1 + 48);
    if ((int)(atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 88), -v12, memory_order_relaxed)- v12) < 1)
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        uint64_t v25 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Do *not* need additional indexing operation (%d).", *(void *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:]_block_invoke", 478, objc_msgSend(*(id *)(a1 + 32), "_indexerThrottle")];
        _NSCoreDataLog(4, v25, v26, v27, v28, v29, v30, v31, a9);
      }
    }
    else
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        uint64_t v13 = NSString;
        uint64_t v14 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Need additional indexing operation (%d)"];
        uint64_t v15 = *(void **)(a1 + 32);
        [v15 _indexerThrottle];
        uint64_t v16 = [v13 stringWithFormat:v14];
        _NSCoreDataLog(4, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);
      }
      atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 88), -*(_DWORD *)(*(void *)(a1 + 32) + 88), memory_order_relaxed);
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:](v23, v24);
    }
  }
  else
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v10 + 88), 0xFFFFFFFF, memory_order_relaxed);
  }
}

uint64_t __58__NSCoreDataCoreSpotlightDelegate__initialImportCompleted__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(void *)(*(void *)(a1 + 32) + 24)), "metadata"), "valueForKey:", @"coreSpotlightImportProgress"), "BOOLValue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __61__NSCoreDataCoreSpotlightDelegate__initializePersistentStore__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) persistentStoreForIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 72));
  if ((v11 & 1) == 0 || (int v12 = (void *)v10) == 0)
  {
    if (_CoreData_SpotlightDebug < 1) {
      return;
    }
    uint64_t v15 = NSString;
    uint64_t v16 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"NSCoreDataCoreSpotlightDelegate initialization cancelled for persistent store for %@"];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v17 + 24);
    uint64_t v19 = 1309;
    goto LABEL_17;
  }
  uint64_t v13 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(void *)(a1 + 32));
  if (*(void *)(a1 + 32))
  {
    uint64_t v20 = objc_msgSend((id)objc_msgSend(v12, "metadata"), "objectForKey:", @"_NSCoreDataCoreSpotlightFullReindexFrameworkVersion");
    uint64_t PFBundleVersion = +[_PFRoutines _getPFBundleVersionNumber]();
    if (v20)
    {
      int v22 = [v20 isEqual:PFBundleVersion];
      uint64_t v14 = *(void *)(a1 + 32);
      if (v22) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
    }
LABEL_14:
    -[NSCoreDataCoreSpotlightDelegate _doFullReimport](v14);
    goto LABEL_15;
  }
  uint64_t v14 = 0;
LABEL_9:
  uint64_t v23 = -[NSCoreDataCoreSpotlightDelegate _clientStateForSpotlightIndex:](v14, v13);
  uint64_t v14 = *(void *)(a1 + 32);
  if (!v23) {
    goto LABEL_14;
  }
  if (!v14) {
    goto LABEL_14;
  }
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v24 = (void *)-[NSCoreDataCoreSpotlightDelegate _context](v14);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __58__NSCoreDataCoreSpotlightDelegate__initialImportCompleted__block_invoke;
  v33[3] = &unk_1E544B4A8;
  v33[4] = v14;
  v33[5] = &v34;
  [v24 performBlockAndWait:v33];
  int v25 = *((unsigned __int8 *)v35 + 24);
  _Block_object_dispose(&v34, 8);
  uint64_t v14 = *(void *)(a1 + 32);
  if (!v25) {
    goto LABEL_14;
  }
  -[NSCoreDataCoreSpotlightDelegate _catchUpToCurrentTransaction](*(void **)(a1 + 32));
LABEL_15:

  if (_CoreData_SpotlightDebug < 1) {
    return;
  }
  uint64_t v15 = NSString;
  uint64_t v16 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"NSCoreDataCoreSpotlightDelegate finished initialization for persistent store for %@"];
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(v17 + 24);
  uint64_t v19 = 1302;
LABEL_17:
  uint64_t v26 = objc_msgSend(v15, "stringWithFormat:", v16, v17, "-[NSCoreDataCoreSpotlightDelegate _initializePersistentStore]_block_invoke_2", v19, v18);

  _NSCoreDataLog(4, v26, v27, v28, v29, v30, v31, v32, a9);
}

void __63__NSCoreDataCoreSpotlightDelegate__catchUpToCurrentTransaction__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) persistentStoreForIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 72));
  if ((v3 & 1) != 0 && v2)
  {
    id v4 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(void *)(a1 + 32));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)-[NSCoreDataCoreSpotlightDelegate _clientStateForSpotlightIndex:](*(void *)(a1 + 32), v4);
  }
}

- (void)createClientSearchableIndex
{
  if (!a1) {
    return 0;
  }
  -[NSCoreDataCoreSpotlightDelegate _context](a1);
  uint64_t v2 = *(void **)(a1 + 80);
  if (v2)
  {
    unsigned __int8 v3 = objc_msgSend(*(id *)(a1 + 112), "createPrivateSearchableIndexWithPath:", objc_msgSend(v2, "path"));
  }
  else
  {
    id v4 = *(void **)(a1 + 112);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 73)) {
      unsigned __int8 v3 = (void *)[v4 createPrivateSearchableIndexWithName:v7 protectionClass:v5 bundleIdentifier:v6];
    }
    else {
      unsigned __int8 v3 = (void *)[v4 createSearchableIndexWithName:v7 protectionClass:v5 bundleIdentifier:v6];
    }
  }
  uint64_t v8 = v3;
  [v3 setIndexDelegate:a1];
  return v8;
}

- (uint64_t)_clientStateForSpotlightIndex:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [*(id *)(a1 + 8) persistentStoreForIdentifier:*(void *)(a1 + 24)];
  uint64_t v5 = 0;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(a1 + 72));
  if (a2)
  {
    if ((v6 & 1) != 0 && v4 != 0)
    {
      uint64_t v33 = 0;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x3052000000;
      uint64_t v36 = __Block_byref_object_copy__9;
      char v37 = __Block_byref_object_dispose__9;
      uint64_t v38 = 0;
      objc_sync_enter((id)a1);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      long long v40 = __Block_byref_object_copy__9;
      long long v41 = __Block_byref_object_dispose__9;
      dispatch_semaphore_t v42 = 0;
      dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __65__NSCoreDataCoreSpotlightDelegate__clientStateForSpotlightIndex___block_invoke;
      v32[3] = &unk_1E544BE68;
      v32[4] = &v33;
      v32[5] = buf;
      [a2 fetchLastClientStateWithCompletionHandler:v32];
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(*(dispatch_object_t *)(*(void *)&buf[8] + 40));
      _Block_object_dispose(buf, 8);
      objc_sync_exit((id)a1);
      if ([(id)v34[5] length])
      {
        uint64_t v31 = 0;
        uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v34[5] error:&v31];
        if (!v5 && _CoreData_SpotlightDebug >= 1)
        {
          uint64_t v8 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Unable to decode CoreSpotlight token for %@, doing full reimport (error: %@)")];
          _NSCoreDataLog(4, v8, v9, v10, v11, v12, v13, v14, a1);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_15;
        }
        uint64_t v15 = [NSString stringWithUTF8String:"CDCS - Unexpected class for CoreSpotlight token for %@, doing full reimport (token: %@)"];
        _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)a2);
        int v22 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = a2;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v5;
          _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: CDCS - Unexpected class for CoreSpotlight token for %@, doing full reimport (token: %@)", buf, 0x16u);
        }
      }
      uint64_t v5 = 0;
LABEL_15:

      v34[5] = 0;
      if (_CoreData_SpotlightDebug >= 1)
      {
        uint64_t v23 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Fetched client state, %@, for index, %@")];
        _NSCoreDataLog(4, v23, v24, v25, v26, v27, v28, v29, a1);
      }
      _Block_object_dispose(&v33, 8);
    }
  }
  return v5;
}

void __73__NSCoreDataCoreSpotlightDelegate__importObjectsUpdatedSinceTransaction___block_invoke(uint64_t *a1)
{
  uint64_t v1 = a1;
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) persistentStoreForIdentifier:*(void *)(a1[4] + 24)];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v1[4] + 72));
  if ((v3 & 1) != 0 && v2)
  {
    if (_CoreData_SpotlightDebug >= 1)
    {
      uint64_t v4 = NSString;
      uint64_t v5 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Importing objects since transaction %@"];
      uint64_t v157 = v1[4];
      uint64_t v6 = [v4 stringWithFormat:v5];
      _NSCoreDataLog(4, v6, v7, v8, v9, v10, v11, v12, v157);
    }
    uint64_t v13 = v1[4];
    if (!v13) {
      goto LABEL_119;
    }
    uint64_t v14 = *(void **)(*(void *)(v1[5] + 8) + 40);
    uint64_t v15 = [*(id *)(v13 + 8) persistentStoreForIdentifier:*(void *)(v13 + 24)];
    unsigned __int8 v16 = atomic_load((unsigned __int8 *)(v13 + 72));
    if ((v16 & 1) == 0 || !v15) {
      goto LABEL_119;
    }
    uint64_t v163 = v15;
    id v17 = v14;
    int v161 = 0;
    uint64_t v168 = *MEMORY[0x1E4F281F8];
    v162 = v1;
    uint64_t v181 = v13;
    v160 = v14;
LABEL_9:
    v164 = (void *)MEMORY[0x18C127630]();
    unsigned __int8 v18 = atomic_load((unsigned __int8 *)(v13 + 72));
    if ((v18 & 1) == 0)
    {
LABEL_124:

LABEL_111:
      goto LABEL_119;
    }
    uint64_t v19 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:v17];
    [(NSPersistentHistoryChangeRequest *)v19 setResultType:5];
    uint64_t v215 = v163;
    -[NSPersistentStoreRequest setAffectedStores:](v19, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v215 count:1]);
    [(NSPersistentHistoryChangeRequest *)v19 setFetchBatchSize:100];
    [(NSPersistentHistoryChangeRequest *)v19 setFetchLimit:1000];
    id v196 = 0;
    uint64_t v20 = (void *)[(id)-[NSCoreDataCoreSpotlightDelegate _context](v13) executeRequest:v19 error:&v196];
    if (v20)
    {
      uint64_t v27 = v20;
      if (objc_msgSend((id)objc_msgSend(v20, "result"), "count"))
      {
        unsigned __int8 v28 = atomic_load((unsigned __int8 *)(v13 + 72));
        if ((v28 & 1) == 0) {
          goto LABEL_124;
        }
        uint64_t v29 = (void *)[v27 result];
        v174 = (void *)[MEMORY[0x1E4F1CA80] set];
        v173 = (void *)[MEMORY[0x1E4F1CA80] set];
        long long v191 = 0u;
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        obuint64_t j = v29;
        uint64_t v167 = [v29 countByEnumeratingWithState:&v191 objects:v214 count:16];
        if (!v167) {
          goto LABEL_53;
        }
        uint64_t v166 = *(void *)v192;
LABEL_15:
        uint64_t v30 = 0;
        uint64_t v31 = v17;
        while (1)
        {
          if (*(void *)v192 != v166) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v191 + 1) + 8 * v30);
          uint64_t v33 = (void *)MEMORY[0x18C127630]();
          unsigned __int8 v34 = atomic_load((unsigned __int8 *)(v13 + 72));
          if ((v34 & 1) == 0)
          {

            uint64_t v1 = v162;
            goto LABEL_111;
          }
          if (objc_msgSend((id)objc_msgSend(v32, "author"), "hasPrefix:", @"com.apple.coredata.schemamigrator"))
          {
            if (_CoreData_SpotlightDebug >= 1)
            {
              uint64_t v122 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Discovered migration author, performing full re-import")];
              _NSCoreDataLog(4, v122, v123, v124, v125, v126, v127, v128, v13);
            }
            if (_CoreData_SpotlightDebug > 0)
            {
              uint64_t v129 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Discovered migration author while processing transactions"];
              _NSCoreDataLog(4, v129, v130, v131, v132, v133, v134, v135, v13);
            }
            v182[0] = MEMORY[0x1E4F143A8];
            v182[1] = 3221225472;
            v182[2] = __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_3;
            v182[3] = &unk_1E544B868;
            v182[4] = v13;
            -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](v13, (uint64_t)v182);
            id v17 = v31;
            uint64_t v1 = v162;
            goto LABEL_117;
          }
          uint64_t v169 = v30;
          context = v33;
          id v171 = (id)[v32 token];

          long long v189 = 0u;
          long long v190 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          id v175 = (id)[v32 changes];
          uint64_t v179 = [v175 countByEnumeratingWithState:&v187 objects:v213 count:16];
          if (!v179) {
            goto LABEL_51;
          }
          v176 = *(void **)v188;
          do
          {
            for (uint64_t i = 0; i != v179; ++i)
            {
              if (*(void **)v188 != v176) {
                objc_enumerationMutation(v175);
              }
              uint64_t v36 = *(void **)(*((void *)&v187 + 1) + 8 * i);
              char v37 = (void *)MEMORY[0x18C127630]();
              uint64_t v38 = (void *)[v36 changedObjectID];
              if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]([v38 entity]))
              {
                if ([v36 changeType] == 1)
                {
                  long long v185 = 0u;
                  long long v186 = 0u;
                  long long v183 = 0u;
                  long long v184 = 0u;
                  long long v39 = (void *)[v36 updatedProperties];
                  uint64_t v40 = [v39 countByEnumeratingWithState:&v183 objects:v212 count:16];
                  if (!v40) {
                    goto LABEL_49;
                  }
                  uint64_t v41 = v40;
                  uint64_t v42 = *(void *)v184;
LABEL_29:
                  uint64_t v43 = 0;
                  while (1)
                  {
                    if (*(void *)v184 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    long long v44 = *(void **)(*((void *)&v183 + 1) + 8 * v43);
                    objc_opt_class();
                    uint64_t v45 = (objc_opt_isKindOfClass() & 1) != 0
                        ? [v44 _qualifiedName]
                        : [v44 name];
                    if (objc_msgSend((id)objc_msgSend(*(id *)(v181 + 96), "objectForKey:", objc_msgSend((id)objc_msgSend(v38, "entity"), "name")), "containsObject:", v45))break; {
                    if (v41 == ++v43)
                    }
                    {
                      uint64_t v41 = [v39 countByEnumeratingWithState:&v183 objects:v212 count:16];
                      if (v41) {
                        goto LABEL_29;
                      }
                      goto LABEL_49;
                    }
                  }
                }
                unint64_t v46 = [v36 changeType];
                if (v46 >= 2)
                {
                  if (v46 != 2)
                  {
                    _NSCoreDataLog(1, @"Core Data Spotlight Error - unknown change type - %@", v47, v48, v49, v50, v51, v52, (uint64_t)v36);
                    goto LABEL_49;
                  }
                  if (_CoreData_SpotlightDebug >= 1)
                  {
                    uint64_t v61 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Deleted object ID"];
                    _NSCoreDataLog(4, v61, v62, v63, v64, v65, v66, v67, v181);
                  }
                  v60 = v173;
                }
                else
                {
                  if (_CoreData_SpotlightDebug >= 1)
                  {
                    uint64_t v53 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Inserted or updated item"];
                    _NSCoreDataLog(4, v53, v54, v55, v56, v57, v58, v59, v181);
                  }
                  v60 = v174;
                }
                [v60 addObject:v38];
              }
LABEL_49:
            }
            uint64_t v179 = [v175 countByEnumeratingWithState:&v187 objects:v213 count:16];
          }
          while (v179);
LABEL_51:
          uint64_t v30 = v169 + 1;
          id v17 = v171;
          uint64_t v31 = v171;
          uint64_t v13 = v181;
          if (v169 + 1 == v167)
          {
            uint64_t v1 = v162;
            uint64_t v167 = [obj countByEnumeratingWithState:&v191 objects:v214 count:16];
            if (v167) {
              goto LABEL_15;
            }
LABEL_53:
            if ([v174 count] || objc_msgSend(v173, "count"))
            {
              [v174 minusSet:v173];
              v211[0] = v174;
              v211[1] = MEMORY[0x1E4F1CBF0];
              v211[2] = v173;
              uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v211 count:3];
              unsigned __int8 v69 = atomic_load((unsigned __int8 *)(v13 + 72));
              if (v69)
              {
                uint64_t v70 = (void *)v68;
                if ([*(id *)(v13 + 8) persistentStoreForIdentifier:*(void *)(v13 + 24)])
                {
                  id v172 = v17;
                  uint64_t v71 = (void *)[MEMORY[0x1E4F1CA48] array];
                  uint64_t v72 = (void *)[MEMORY[0x1E4F1CA48] array];
                  v177 = (void *)MEMORY[0x18C127630]();
                  v180 = v70;
                  long long v207 = 0u;
                  long long v208 = 0u;
                  long long v209 = 0u;
                  long long v210 = 0u;
                  uint64_t v73 = (void *)[v70 firstObject];
                  uint64_t v74 = [v73 countByEnumeratingWithState:&v207 objects:v218 count:16];
                  if (v74)
                  {
                    uint64_t v75 = v74;
                    uint64_t v76 = *(void *)v208;
                    do
                    {
                      for (uint64_t j = 0; j != v75; ++j)
                      {
                        if (*(void *)v208 != v76) {
                          objc_enumerationMutation(v73);
                        }
                        v78 = *(void **)(*((void *)&v207 + 1) + 8 * j);
                        uint64_t v79 = (void *)MEMORY[0x18C127630]();
                        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]([v78 entity]))
                        {
                          v217[0] = 0;
                          uint64_t v80 = (void *)[(id)-[NSCoreDataCoreSpotlightDelegate _context](v181) existingObjectWithID:v78 error:v217];
                          if (v80)
                          {
                            uint64_t v81 = v80;
                            uint64_t v82 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:]((void *)v181, v80);
                            if (v82)
                            {
                              uint64_t v83 = (uint64_t)v82;
                              long long v84 = v71;
                            }
                            else
                            {
                              uint64_t v83 = objc_msgSend((id)objc_msgSend(v78, "URIRepresentation"), "description");
                              long long v84 = v72;
                            }
                            [v84 addObject:v83];
                            [(id)-[NSCoreDataCoreSpotlightDelegate _context](v181) refreshObject:v81 mergeChanges:1];
                          }
                          else if ([v217[0] code] == 133000 {
                                 && objc_msgSend((id)objc_msgSend(v217[0], "domain"), "isEqualToString:", v168))
                          }
                          {
                            objc_msgSend(v72, "addObject:", objc_msgSend((id)objc_msgSend(v78, "URIRepresentation"), "description"));
                          }
                        }
                      }
                      uint64_t v75 = [v73 countByEnumeratingWithState:&v207 objects:v218 count:16];
                    }
                    while (v75);
                  }
                  v178 = (void *)MEMORY[0x18C127630]();
                  long long v203 = 0u;
                  long long v204 = 0u;
                  long long v205 = 0u;
                  long long v206 = 0u;
                  long long v85 = (void *)[v180 objectAtIndex:1];
                  uint64_t v86 = [v85 countByEnumeratingWithState:&v203 objects:v217 count:16];
                  if (v86)
                  {
                    uint64_t v87 = v86;
                    uint64_t v88 = *(void *)v204;
                    do
                    {
                      for (uint64_t k = 0; k != v87; ++k)
                      {
                        if (*(void *)v204 != v88) {
                          objc_enumerationMutation(v85);
                        }
                        v90 = *(void **)(*((void *)&v203 + 1) + 8 * k);
                        uint64_t v91 = (void *)MEMORY[0x18C127630]();
                        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]([v90 entity]))
                        {
                          v216[0] = 0;
                          __int16 v92 = (void *)[(id)-[NSCoreDataCoreSpotlightDelegate _context](v181) existingObjectWithID:v90 error:v216];
                          if (v92)
                          {
                            id v93 = v92;
                            __int16 v94 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:]((void *)v181, v92);
                            if (v94)
                            {
                              uint64_t v95 = (uint64_t)v94;
                              long long v96 = v71;
                            }
                            else
                            {
                              uint64_t v95 = objc_msgSend((id)objc_msgSend(v90, "URIRepresentation"), "description");
                              long long v96 = v72;
                            }
                            [v96 addObject:v95];
                            [(id)-[NSCoreDataCoreSpotlightDelegate _context](v181) refreshObject:v93 mergeChanges:1];
                          }
                          else if ([v216[0] code] == 133000 {
                                 && objc_msgSend((id)objc_msgSend(v216[0], "domain"), "isEqualToString:", v168))
                          }
                          {
                            objc_msgSend(v72, "addObject:", objc_msgSend((id)objc_msgSend(v90, "URIRepresentation"), "description"));
                          }
                        }
                      }
                      uint64_t v87 = [v85 countByEnumeratingWithState:&v203 objects:v217 count:16];
                    }
                    while (v87);
                  }
                  uint64_t v97 = (void *)MEMORY[0x18C127630]();
                  long long v199 = 0u;
                  long long v200 = 0u;
                  long long v201 = 0u;
                  long long v202 = 0u;
                  v98 = (void *)[v180 lastObject];
                  uint64_t v99 = [v98 countByEnumeratingWithState:&v199 objects:v216 count:16];
                  if (v99)
                  {
                    uint64_t v100 = v99;
                    uint64_t v101 = *(void *)v200;
                    do
                    {
                      for (uint64_t m = 0; m != v100; ++m)
                      {
                        if (*(void *)v200 != v101) {
                          objc_enumerationMutation(v98);
                        }
                        v103 = *(void **)(*((void *)&v199 + 1) + 8 * m);
                        v104 = (void *)MEMORY[0x18C127630]();
                        if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]([v103 entity])) {
                          objc_msgSend(v72, "addObject:", objc_msgSend((id)objc_msgSend(v103, "URIRepresentation"), "description"));
                        }
                      }
                      uint64_t v100 = [v98 countByEnumeratingWithState:&v199 objects:v216 count:16];
                    }
                    while (v100);
                  }
                  uint64_t v13 = v181;
                  if (_CoreData_SpotlightDebug >= 1)
                  {
                    uint64_t v105 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Searchable items %@"];
                    _NSCoreDataLog(4, v105, v106, v107, v108, v109, v110, v111, v181);
                    if (_CoreData_SpotlightDebug >= 1)
                    {
                      uint64_t v112 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Identifiers to delete %@"];
                      _NSCoreDataLog(4, v112, v113, v114, v115, v116, v117, v118, v181);
                    }
                  }
                  uint64_t v119 = [v71 count];
                  id v17 = v172;
                  if (v119 + [v72 count])
                  {
                    v120 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v181);
                    if ([v71 count])
                    {
                      v198[0] = MEMORY[0x1E4F143A8];
                      v198[1] = 3221225472;
                      v198[2] = __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke;
                      v198[3] = &unk_1E544BD58;
                      v198[4] = v181;
                      v198[5] = v71;
                      [v120 indexSearchableItems:v71 completionHandler:v198];
                      int v161 = 1;
                    }
                    uint64_t v1 = v162;
                    if ([v72 count])
                    {
                      v197[0] = MEMORY[0x1E4F143A8];
                      v197[1] = 3221225472;
                      v197[2] = __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke_2;
                      v197[3] = &unk_1E544BD58;
                      v197[4] = v181;
                      v197[5] = v72;
                      [v120 deleteSearchableItemsWithIdentifiers:v72 completionHandler:v197];
                      int v161 = 1;
                    }
                  }
                  else
                  {
                    uint64_t v1 = v162;
                  }
                }
              }
            }
            uint64_t v121 = [obj count];
            if (v121 != 1000) {
              goto LABEL_117;
            }
            goto LABEL_9;
          }
        }
      }
    }
    id v149 = v160;
    if (v196)
    {
      _NSCoreDataLog(1, @"Core Data Spotlight Error during processing of history: %@", v21, v22, v23, v24, v25, v26, (uint64_t)v196);
      if (objc_msgSend((id)objc_msgSend(v196, "domain"), "isEqualToString:", v168)
        && [v196 code] == 134301)
      {
        _NSCoreDataLog(2, @"Discovered an expired history token, attempting recovery.", v150, v151, v152, v153, v154, v155, v159);
        v156 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v13);
        -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:]((void *)v13, v156, 0, 0);

        id v149 = v160;
        v195[0] = MEMORY[0x1E4F143A8];
        v195[1] = 3221225472;
        v195[2] = __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke;
        v195[3] = &unk_1E544BDA8;
        v195[4] = v13;
        -[NSCoreDataCoreSpotlightDelegate _resetSpotlightIndexWithCompletionHandler:]((void *)v13, (uint64_t)v195);
      }

      id v17 = 0;
    }
    if (v17 == v149)
    {

      id v17 = 0;
    }
    else
    {
    }
LABEL_117:
    id v136 = v17;
    if (v136)
    {
      uint64_t v137 = (uint64_t)v136;
      *(void *)(*(void *)(v1[6] + 8) + 40) = v136;
      v138 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](v1[4]);
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:]((void *)v1[4], v138, v137, v161 != 0);

      return;
    }
LABEL_119:
    *(void *)(*(void *)(v1[6] + 8) + 40) = *(id *)(*(void *)(v1[5] + 8) + 40);
    if (_CoreData_SpotlightDebug >= 1)
    {
      v139 = NSString;
      uint64_t v140 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Didn't receive a new token back after processing transactions starting at, %@"];
      v141 = *(__CFString **)(*(void *)(v1[5] + 8) + 40);
      if (!v141) {
        v141 = @"null token";
      }
      uint64_t v142 = objc_msgSend(v139, "stringWithFormat:", v140, v1[4], "-[NSCoreDataCoreSpotlightDelegate _importObjectsUpdatedSinceTransaction:]_block_invoke", 913, v141);
      _NSCoreDataLog(4, v142, v143, v144, v145, v146, v147, v148, v158);
    }
  }
}

- (void)_catchUpToCurrentTransaction
{
  if (a1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3052000000;
    uint64_t v14 = __Block_byref_object_copy__9;
    uint64_t v15 = __Block_byref_object_dispose__9;
    uint64_t v16 = 0;
    uint64_t v2 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)a1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__NSCoreDataCoreSpotlightDelegate__catchUpToCurrentTransaction__block_invoke;
    v10[3] = &unk_1E544B4A8;
    v10[4] = a1;
    v10[5] = &v11;
    [v2 performBlockAndWait:v10];
    if (_CoreData_SpotlightDebug >= 1)
    {
      uint64_t v3 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Catching up Spotlight index since transaction, %@")];
      _NSCoreDataLog(4, v3, v4, v5, v6, v7, v8, v9, (uint64_t)a1);
    }
    -[NSCoreDataCoreSpotlightDelegate _importObjectsUpdatedSinceTransaction:](a1, (void *)v12[5]);

    _Block_object_dispose(&v11, 8);
  }
}

- (id)_importObjectsUpdatedSinceTransaction:(void *)a1
{
  id v2 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3052000000;
    uint64_t v15 = __Block_byref_object_copy__9;
    uint64_t v16 = __Block_byref_object_dispose__9;
    id v17 = 0;
    id v17 = a2;
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000;
    uint64_t v9 = __Block_byref_object_copy__9;
    uint64_t v10 = __Block_byref_object_dispose__9;
    uint64_t v11 = 0;
    uint64_t v3 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)v2);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__NSCoreDataCoreSpotlightDelegate__importObjectsUpdatedSinceTransaction___block_invoke;
    v5[3] = &unk_1E544BEB8;
    v5[4] = v2;
    v5[5] = &v12;
    v5[6] = &v6;
    [v3 performBlockAndWait:v5];

    id v2 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
    _Block_object_dispose(&v12, 8);
  }
  return v2;
}

- (void)startSpotlightIndexing
{
  -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  uint64_t v3 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__NSCoreDataCoreSpotlightDelegate_startSpotlightIndexing__block_invoke;
  v4[3] = &unk_1E544B868;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (uint64_t)_context
{
  if (result)
  {
    uint64_t v1 = result;
    if (![*(id *)(result + 32) persistentStoreCoordinator])
    {
      id v2 = *(void **)(v1 + 32);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __43__NSCoreDataCoreSpotlightDelegate__context__block_invoke;
      v3[3] = &unk_1E544B868;
      v3[4] = v1;
      [v2 performBlockAndWait:v3];
    }
    return *(void *)(v1 + 32);
  }
  return result;
}

- (uint64_t)_asyncContextBlock:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(result + 72));
    if (v3)
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        uint64_t v5 = NSString;
        uint64_t v6 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"retval: %d"];
        atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 104), 1u, memory_order_relaxed);
        uint64_t v7 = [v5 stringWithFormat:v6];
        _NSCoreDataLog(4, v7, v8, v9, v10, v11, v12, v13, v2);
      }
      uint64_t v14 = *(void **)(v2 + 32);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__NSCoreDataCoreSpotlightDelegate__asyncContextBlock___block_invoke;
      v15[3] = &unk_1E544BD30;
      v15[4] = v2;
      v15[5] = a2;
      return [v14 performBlock:v15];
    }
  }
  return result;
}

- (void)_updateSpotlightIndexClientState:(uint64_t)a3 historyToken:(int)a4 updatedSpotlight:
{
  v45[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    objc_sync_enter(result);
    uint64_t v8 = [*(id *)(v7 + 8) persistentStoreForIdentifier:*(void *)(v7 + 24)];
    unsigned __int8 v9 = atomic_load((unsigned __int8 *)(v7 + 72));
    if (a2)
    {
      if ((v9 & 1) != 0 && v8 != 0)
      {
        uint64_t v38 = 0;
        long long v39 = &v38;
        uint64_t v40 = 0x3052000000;
        uint64_t v41 = __Block_byref_object_copy__9;
        uint64_t v42 = __Block_byref_object_dispose__9;
        uint64_t v43 = 0;
        if (a3) {
          uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v43];
        }
        else {
          uint64_t v11 = [MEMORY[0x1E4F1C9B8] data];
        }
        uint64_t v18 = v11;
        if (v39[5])
        {
          _NSCoreDataLog(1, @"Error while archiving data to store in client state index, %@", v12, v13, v14, v15, v16, v17, v39[5]);
        }
        else
        {
          if (_CoreData_SpotlightDebug >= 1)
          {
            uint64_t v19 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Persisting token to index client state, %@")];
            _NSCoreDataLog(4, v19, v20, v21, v22, v23, v24, v25, v7);
          }
          uint64_t v26 = dispatch_semaphore_create(0);
          [a2 beginIndexBatch];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __98__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexClientState_historyToken_updatedSpotlight___block_invoke;
          v37[3] = &unk_1E544BE40;
          v37[4] = v26;
          v37[5] = &v38;
          [a2 endIndexBatchWithClientState:v18 completionHandler:v37];
          dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v26);
          if (_CoreData_SpotlightDebug >= 1)
          {
            uint64_t v27 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Persisted token to index client state, %@")];
            _NSCoreDataLog(4, v27, v28, v29, v30, v31, v32, v33, v7);
          }
          unsigned __int8 v34 = v39;
          if (a3 && !v39[5])
          {
            if (a4)
            {
              uint64_t v35 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
              uint64_t v36 = *(void *)(v7 + 24);
              v44[0] = @"NSStoreUUID";
              v44[1] = @"historyToken";
              v45[0] = v36;
              v45[1] = a3;
              objc_msgSend(v35, "postNotificationName:object:userInfo:", @"NSCoreDataCoreSpotlightDelegateIndexDidUpdateNotification", v7, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
              unsigned __int8 v34 = v39;
            }
          }

          v39[5] = 0;
        }
        _Block_object_dispose(&v38, 8);
      }
    }
    return objc_sync_exit((id)v7);
  }
  return result;
}

- (void)indexSearchableItemsToCurrentHistoryToken
{
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_enabled);
  if (v8) {
    -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:]((uint64_t)self, 0, v2, v3, v4, v5, v6, v7, v9);
  }
}

intptr_t __65__NSCoreDataCoreSpotlightDelegate__clientStateForSpotlightIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    uint64_t v5 = [a3 localizedDescription];
    _NSCoreDataLog(1, @"Error while fetching client state: %@, state, %@", v6, v7, v8, v9, v10, v11, v5);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  uint64_t v12 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v12);
}

intptr_t __98__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexClientState_historyToken_updatedSpotlight___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    uint64_t v4 = [a2 localizedDescription];
    _NSCoreDataLog(1, @"Error while batch updating the client state index: %@", v5, v6, v7, v8, v9, v10, v4);
  }
  uint64_t v11 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v11);
}

- (BOOL)isIndexingEnabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_enabled);
  return v2 & 1;
}

id *__43__NSCoreDataCoreSpotlightDelegate__context__block_invoke_7(uint64_t a1)
{
  uint64_t result = -[NSPersistentStoreCoordinator _lastOpenError](*(id **)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)domainIdentifier
{
  unsigned __int8 v2 = self->_storeIdentifier;

  return v2;
}

- (NSString)indexName
{
  return 0;
}

- (NSCoreDataCoreSpotlightDelegate)init
{
  if ((_BYTE)dword_1EB270AB8)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"NSCoreDataCoreSpotlightDelegate requires the use of the initializer %@", NSStringFromSelector(sel_initForStoreWithDescription_coordinator_)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  uint64_t v2 = [NSString stringWithUTF8String:"-init results in undefined behavior for NSCoreDataCoreSpotlightDelegate"];
  _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v12);
  uint64_t v9 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18AB82000, v9, OS_LOG_TYPE_FAULT, "CoreData: -init results in undefined behavior for NSCoreDataCoreSpotlightDelegate", buf, 2u);
  }
  return 0;
}

- (NSCoreDataCoreSpotlightDelegate)initForStoreWithDescription:(NSPersistentStoreDescription *)description model:(NSManagedObjectModel *)model
{
  return 0;
}

uint64_t __46__NSCoreDataCoreSpotlightDelegate__invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) reset];
}

- (void)dealloc
{
  self->_domainIdentifier = 0;
  self->_indexName = 0;

  self->_coordinator = 0;
  self->_description = 0;

  self->_storeIdentifier = 0;
  self->_context__ = 0;

  self->_bundleIdentifier = 0;
  self->_protectionClass = 0;

  self->_indexURL = 0;
  self->_indexedPropertyNamesByEntity = 0;

  self->_indexProvider = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCoreDataCoreSpotlightDelegate;
  [(NSCoreDataCoreSpotlightDelegate *)&v3 dealloc];
}

- (int)_indexerThrottle
{
  return self->__indexerThrottle;
}

- (CSSearchableItemAttributeSet)attributeSetForObject:(NSManagedObject *)object
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  uint64_t v6 = (void *)[objc_alloc(getCoreSpotlightCSSearchableItemAttributeSetClass()) initWithItemContentType:@"public.item"];
  uint64_t v7 = [(NSManagedObject *)object entity];
  uint64_t v8 = [(NSEntityDescription *)v7 coreSpotlightDisplayNameExpression];
  if (v8)
  {
    id v21 = v5;
    objc_msgSend(v6, "setDisplayName:", -[NSExpression expressionValueWithObject:context:](v8, "expressionValueWithObject:context:", object, objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary")));
    if (v7) {
      propertyRanges = v7->_propertyRanges;
    }
    else {
      propertyRanges = 0;
    }
    uint64_t v11 = [(NSDictionary *)[(NSEntityDescription *)v7 propertiesByName] values];
    uint64_t v12 = _kvcPropertysPublicGetters(v7);
    unint64_t location = propertyRanges[3].location;
    NSUInteger length = propertyRanges[3].length;
    if (location < length + location)
    {
      uint64_t v15 = v12;
      do
      {
        uint64_t v16 = *(void **)(v11 + 8 * location);
        if ([v16 isIndexedBySpotlight])
        {
          Property = _PF_Handler_Public_GetProperty((id **)object, location, 0, *(void *)(v15 + 8 * location));
          if (Property)
          {
            uint64_t v18 = objc_msgSend(objc_alloc(getCoreSpotlightCSCustomAttributeKeyClass()), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", objc_msgSend(v16, "name"), 1, 1, 0, 0);
            [v6 setValue:Property forCustomKey:v18];
          }
        }
        ++location;
        --length;
      }
      while (length);
    }
    int v10 = 1;
    id v5 = v21;
  }
  else
  {
    int v10 = 0;
  }
  [(NSManagedObjectContext *)[(NSManagedObject *)object managedObjectContext] refreshObject:object mergeChanges:0];
  [v5 drain];
  id v19 = 0;
  if (!v10) {
    return 0;
  }

  return (CSSearchableItemAttributeSet *)v6;
}

- (void)_searchableItemForObject:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    uint64_t v4 = -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)result);
    id v5 = (void *)MEMORY[0x18C127630](v4);
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectID"), "URIRepresentation"), "description");
    uint64_t v7 = [v3 attributeSetForObject:a2];
    if (v7) {
      uint64_t v8 = (void *)[objc_alloc(getCoreSpotlightCSSearchableItemClass()) initWithUniqueIdentifier:v6 domainIdentifier:v3[5] attributeSet:v7];
    }
    else {
      uint64_t v8 = 0;
    }
    return v8;
  }
  return result;
}

void __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2) {
    _NSCoreDataLog(1, @"Error indexing (insert/update): %@", a3, a4, a5, a6, a7, a8, a2);
  }
  if (_CoreData_SpotlightDebug >= 1)
  {
    uint64_t v10 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Indexed %d searchable items", *(void *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexForObjectsWithIDs:updatedSpotlight:]_block_invoke", 433, objc_msgSend(*(id *)(a1 + 40), "count")];
    _NSCoreDataLog(4, v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

void __91__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexForObjectsWithIDs_updatedSpotlight___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2) {
    _NSCoreDataLog(1, @"Error indexing (delete): %@", a3, a4, a5, a6, a7, a8, a2);
  }
  if (_CoreData_SpotlightDebug >= 1)
  {
    uint64_t v10 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Deleted %lu identifiers", *(void *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexForObjectsWithIDs:updatedSpotlight:]_block_invoke_2", 445, objc_msgSend(*(id *)(a1 + 40), "count")];
    _NSCoreDataLog(4, v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

- (void)_updateSpotlightIndexFromBatchResult:(uint64_t)a3
{
  if (a1)
  {
    unsigned __int8 v10 = atomic_load((unsigned __int8 *)(a1 + 72));
    if (v10)
    {
      if (atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 88), 1u, memory_order_relaxed))
      {
        if (_CoreData_SpotlightDebug >= 1)
        {
          uint64_t v11 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Dropping \"duplicate\" indexing request (%d).", a1, "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:]", 521, objc_msgSend((id)a1, "_indexerThrottle")];
          _NSCoreDataLog(4, v11, v12, v13, v14, v15, v16, v17, a9);
        }
      }
      else
      {
        if (_CoreData_SpotlightDebug >= 1)
        {
          uint64_t v19 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Allowing indexing request (%d)."];
          _NSCoreDataLog(4, v19, v20, v21, v22, v23, v24, v25, a1);
        }
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromBatchResult___block_invoke;
        v26[3] = &unk_1E544BD80;
        int v27 = 1;
        v26[4] = a1;
        v26[5] = a2;
        -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](a1, (uint64_t)v26);
      }
    }
  }
}

void __72__NSCoreDataCoreSpotlightDelegate__updateSpotlightIndexFromBatchResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 72));
  uint64_t v10 = *(void *)(a1 + 32);
  if (v9)
  {
    if ([*(id *)(v10 + 8) persistentStoreForIdentifier:*(void *)(v10 + 24)]) {
      -[NSCoreDataCoreSpotlightDelegate _catchUpToCurrentTransaction](*(void **)(a1 + 32));
    }
    int v12 = *(_DWORD *)(a1 + 48);
    if ((int)(atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 88), -v12, memory_order_relaxed)- v12) < 1)
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        uint64_t v25 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Do *not* need additional indexing operation (%d).", *(void *)(a1 + 32), "-[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:]_block_invoke", 513, objc_msgSend(*(id *)(a1 + 32), "_indexerThrottle")];
        _NSCoreDataLog(4, v25, v26, v27, v28, v29, v30, v31, a9);
      }
    }
    else
    {
      if (_CoreData_SpotlightDebug >= 1)
      {
        uint64_t v13 = NSString;
        uint64_t v14 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Need additional indexing operation (%d)."];
        uint64_t v15 = *(void **)(a1 + 32);
        [v15 _indexerThrottle];
        uint64_t v16 = [v13 stringWithFormat:v14];
        _NSCoreDataLog(4, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);
      }
      atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 88), -*(_DWORD *)(*(void *)(a1 + 32) + 88), memory_order_relaxed);
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:](v23, v24);
    }
  }
  else
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v10 + 88), 0xFFFFFFFF, memory_order_relaxed);
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) name];
    _NSCoreDataLog(1, @"Full re-import failed for entity %@ (re-index), %@.", v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    unsigned __int8 v9 = *(void **)(a1 + 40);
    [v9 removeAllObjects];
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) name];
    _NSCoreDataLog(1, @"Full re-import failed for entity %@ (delete), %@.", v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    unsigned __int8 v9 = *(void **)(a1 + 40);
    [v9 removeAllObjects];
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) name];
    _NSCoreDataLog(1, @"Full re-import failed for entity %@ (batch), %@.", v3, v4, v5, v6, v7, v8, v2);
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) name];
    _NSCoreDataLog(1, @"Full re-import failed for entity %@ (re-index), %@.", v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    unsigned __int8 v9 = *(void **)(a1 + 40);
    [v9 removeAllObjects];
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) name];
    _NSCoreDataLog(1, @"Full re-import failed for entity %@ (delete), %@.", v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    unsigned __int8 v9 = *(void **)(a1 + 40);
    [v9 removeAllObjects];
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) name];
    _NSCoreDataLog(1, @"Full re-import failed for entity %@ (batch), %@.", v3, v4, v5, v6, v7, v8, v2);
  }
}

void __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    _NSCoreDataLog(1, @"Full re-import failed, %@.", a3, a4, a5, a6, a7, a8, a2);
  }
}

void __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    _NSCoreDataLog(1, @"Error resetting spotlight index while recovering from expired history token: %@", a3, a4, a5, a6, a7, a8, a2);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_2;
    v9[3] = &unk_1E544B868;
    v9[4] = v8;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:](v8, (uint64_t)v9);
  }
}

uint64_t __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_2(uint64_t a1)
{
  return -[NSCoreDataCoreSpotlightDelegate _doFullReimport](*(void *)(a1 + 32));
}

- (uint64_t)_doFullReimport
{
  if (result)
  {
    uint64_t v1 = result;
    if (_CoreData_SpotlightDebug >= 1)
    {
      uint64_t v2 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Performing full Spotlight re-import"];
      _NSCoreDataLog(4, v2, v3, v4, v5, v6, v7, v8, v1);
    }
    -[NSCoreDataCoreSpotlightDelegate _context](v1);
    unsigned __int8 v9 = (void *)-[NSCoreDataCoreSpotlightDelegate _context](v1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke;
    v10[3] = &unk_1E544B868;
    v10[4] = v1;
    return [v9 performBlockAndWait:v10];
  }
  return result;
}

- (void)_resetSpotlightIndexWithCompletionHandler:(void *)a1
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex]((uint64_t)a1);
    if (v4)
    {
      uint64_t v5 = v4;
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](a1, v4, 0, 0);
      v7[0] = a1[5];
      objc_msgSend(v5, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1), a2);
    }
    else if (a2)
    {
      uint64_t v6 = *(void (**)(uint64_t, void))(a2 + 16);
      v6(a2, 0);
    }
  }
}

uint64_t __83__NSCoreDataCoreSpotlightDelegate__processTransactionsStartingAt_updatedSpotlight___block_invoke_3(uint64_t a1)
{
  return -[NSCoreDataCoreSpotlightDelegate _doFullReimport](*(void *)(a1 + 32));
}

void __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v2 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(void *)(a1 + 32));
  -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](*(void **)(a1 + 32), v2, 0, 0);

  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) persistentStoreForIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 72));
  if ((v4 & 1) != 0 && (uint64_t v5 = v3) != 0)
  {
    id v6 = (id)[v3 currentChangeToken];
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 72));
    if (v7)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v5, "metadata"), "mutableCopy");
      [v8 setValue:0 forKey:@"coreSpotlightImportProgress"];
      [v8 setValue:0 forKey:@"_NSCoreDataCoreSpotlightFullReindexFrameworkVersion"];
      [v5 setMetadata:v8];

      uint64_t v62 = 0;
      if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "persistentStores"), "count")
        && [*(id *)(*(void *)(a1 + 32) + 8) persistentStoreForIdentifier:*(void *)(*(void *)(a1 + 32) + 24)])
      {
        [(id)-[NSCoreDataCoreSpotlightDelegate _context](*(void *)(a1 + 32)) save:&v62];
      }
      else
      {
        *((unsigned char *)v64 + 24) = 1;
      }
      if (v62)
      {
        _NSCoreDataLog(1, @"Failed to save store metadata changes to Spotlight import tracking, %@", v9, v10, v11, v12, v13, v14, v62);
        *((unsigned char *)v64 + 24) = 1;
      }
    }
    if (*((unsigned char *)v64 + 24))
    {

      goto LABEL_35;
    }
    uint64_t v24 = objc_msgSend((id)objc_msgSend((id)-[NSCoreDataCoreSpotlightDelegate _context](*(void *)(a1 + 32)), "persistentStoreCoordinator"), "managedObjectModel");
    uint64_t v25 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v59 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight](v29)) {
            [v25 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v26);
    }
    uint64_t v30 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    [(NSManagedObjectContext *)v30 setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 32) + 8)];
    [(NSManagedObjectContext *)v30 setName:@"Spotlight_reindex"];
    uint64_t v31 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(void *)(a1 + 32));
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_2;
    v57[3] = &unk_1E544BE18;
    v57[4] = *(void *)(a1 + 32);
    v57[5] = v31;
    v57[7] = v30;
    v57[8] = &v63;
    v57[6] = v25;
    [(NSManagedObjectContext *)v30 performBlockAndWait:v57];

    if (*((unsigned char *)v64 + 24))
    {
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v62 = 0;
    uint64_t v32 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) persistentStoreForIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];
    unsigned __int8 v39 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 72));
    if ((v39 & 1) != 0
      && (uint64_t v40 = v32) != 0
      && (uint64_t v41 = objc_msgSend((id)objc_msgSend(v32, "metadata"), "mutableCopy"),
          [v41 setValue:MEMORY[0x1E4F1CC38] forKey:@"coreSpotlightImportProgress"],
          [v41 setValue:+[_PFRoutines _getPFBundleVersionNumber]() forKey:@"_NSCoreDataCoreSpotlightFullReindexFrameworkVersion"], objc_msgSend(v40, "setMetadata:", v41), v41, objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "persistentStores"), "count"))&& objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "persistentStoreForIdentifier:", *(void *)(*(void *)(a1 + 32) + 24)))
    {
      [(id)-[NSCoreDataCoreSpotlightDelegate _context](*(void *)(a1 + 32)) save:&v62];
    }
    else
    {
      *((unsigned char *)v64 + 24) = 1;
    }
    if (v62)
    {
      _NSCoreDataLog(1, @"Failed to save store metadata changes to Spotlight import tracking, %@", v33, v34, v35, v36, v37, v38, v62);
      *((unsigned char *)v64 + 24) = 1;
      goto LABEL_34;
    }
    if (*((unsigned char *)v64 + 24)) {
      goto LABEL_34;
    }
    if (v6)
    {
      uint64_t v42 = -[NSCoreDataCoreSpotlightDelegate createClientSearchableIndex](*(void *)(a1 + 32));
      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](*(void **)(a1 + 32), v42, (uint64_t)v6, 0);

      uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 24);
      v67[0] = @"NSStoreUUID";
      v67[1] = @"historyToken";
      v68[0] = v43;
      v68[1] = v6;
      uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSCoreDataCoreSpotlightDelegateIndexDidUpdateNotification", *(void *)(a1 + 32), v44);
    }
    if (_CoreData_SpotlightDebug >= 1)
    {
      uint64_t v45 = NSString;
      uint64_t v46 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Performing extended import with token, %@"];
      uint64_t v56 = *(void *)(a1 + 32);
      uint64_t v47 = [v45 stringWithFormat:v46];
      _NSCoreDataLog(4, v47, v48, v49, v50, v51, v52, v53, v56);
    }
    id v54 = (id)-[NSCoreDataCoreSpotlightDelegate _importObjectsUpdatedSinceTransaction:](*(void *)(a1 + 32), v6);
  }
  else
  {
    if (_CoreData_SpotlightDebug >= 1)
    {
      uint64_t v15 = NSString;
      uint64_t v16 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Not performing full re-import because Spotlight was disabled or store was nil."];
      uint64_t v55 = *(void *)(a1 + 32);
      uint64_t v17 = [v15 stringWithFormat:v16];
      _NSCoreDataLog(4, v17, v18, v19, v20, v21, v22, v23, v55);
    }
    *((unsigned char *)v64 + 24) = 1;
  }
LABEL_35:
  _Block_object_dispose(&v63, 8);
}

uint64_t __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_2(uint64_t a1)
{
  v104[1] = *MEMORY[0x1E4F143B8];
  -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexClientState:historyToken:updatedSpotlight:](*(void **)(a1 + 32), *(void **)(a1 + 40), 0, 0);
  uint64_t v1 = *(void **)(a1 + 32);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_3;
  v83[3] = &unk_1E544BDF0;
  v83[4] = *(void *)(a1 + 64);
  -[NSCoreDataCoreSpotlightDelegate _resetSpotlightIndexWithCompletionHandler:](v1, (uint64_t)v83);
  uint64_t v81 = *(void *)(a1 + 32);
  if (v81)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    obuint64_t j = *(id *)(a1 + 48);
    uint64_t v82 = *(void **)(a1 + 56);
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v81 + 72));
    if (v3)
    {
      uint64_t v15 = [*(id *)(v81 + 8) persistentStoreForIdentifier:*(void *)(v81 + 24)];
      if (v15)
      {
        if (!v2)
        {
          if (_CoreData_SpotlightDebug < 1) {
            return [*(id *)(a1 + 56) reset];
          }
          unsigned __int8 v4 = NSString;
          uint64_t v5 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Returning from %@, searchable index is nil."];
          id v6 = NSStringFromSelector(sel__reindexInstancesOf_inIndex_usingContext_);
          uint64_t v7 = 542;
          goto LABEL_5;
        }
        uint64_t v71 = v15;
        id v16 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        uint64_t v17 = *(void **)(v81 + 8);
        v104[0] = v71;
        id v69 = v16;
        uint64_t v18 = objc_msgSend(v17, "currentPersistentHistoryTokenFromStores:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v104, 1));
        uint64_t v19 = -[NSCoreDataCoreSpotlightDelegate _clientStateForSpotlightIndex:](v81, v2);
        uint64_t v99 = 0;
        if (v18) {
          uint64_t v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v99];
        }
        else {
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] data];
        }
        uint64_t v68 = v20;
        if (v19) {
          uint64_t v77 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v99];
        }
        else {
          uint64_t v77 = [MEMORY[0x1E4F1C9B8] data];
        }
        if (_CoreData_SpotlightDebug >= 1)
        {
          uint64_t v23 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Starting re-indexing with history token %@."];
          _NSCoreDataLog(4, v23, v24, v25, v26, v27, v28, v29, v81);
        }
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        uint64_t v74 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
        if (v74)
        {
          uint64_t v79 = 0;
          uint64_t v80 = 0;
          uint64_t v73 = *(void *)v96;
          do
          {
            for (uint64_t i = 0; i != v74; ++i)
            {
              if (*(void *)v96 != v73) {
                objc_enumerationMutation(obj);
              }
              uint64_t v30 = *(void **)(*((void *)&v95 + 1) + 8 * i);
              context = (void *)MEMORY[0x18C127630]();
              if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]((uint64_t)v30))
              {
                uint64_t v31 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", [v30 name]);
                [(NSFetchRequest *)v31 setIncludesSubentities:0];
                [(NSFetchRequest *)v31 setFetchBatchSize:100];
                uint64_t v102 = v71;
                -[NSFetchRequest setAffectedStores:](v31, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1]);
                uint64_t v101 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"SELF" ascending:1];
                -[NSFetchRequest setSortDescriptors:](v31, "setSortDescriptors:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1]);
                uint64_t v94 = 0;
                id v78 = (id)[v82 executeFetchRequest:v31 error:&v94];

                if (!v78 || v94)
                {
                  uint64_t v51 = [v30 name];
                  _NSCoreDataLog(1, @"Full re-import failed for: %@ due to %@.", v52, v53, v54, v55, v56, v57, v51);
                }
                else
                {
                  uint64_t v32 = (void *)[MEMORY[0x1E4F1CA48] array];
                  uint64_t v33 = (void *)[MEMORY[0x1E4F1CA48] array];
                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  uint64_t v34 = 0;
                  uint64_t v35 = [v78 countByEnumeratingWithState:&v90 objects:v100 count:16];
                  if (v35)
                  {
                    uint64_t v36 = *(void *)v91;
                    do
                    {
                      for (uint64_t j = 0; j != v35; ++j)
                      {
                        if (*(void *)v91 != v36) {
                          objc_enumerationMutation(v78);
                        }
                        uint64_t v38 = *(void **)(*((void *)&v90 + 1) + 8 * j);
                        unsigned __int8 v39 = (void *)MEMORY[0x18C127630]();
                        [v38 willAccessValueForKey:0];
                        uint64_t v40 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:]((void *)v81, v38);
                        if (v40) {
                          [v32 addObject:v40];
                        }
                        else {
                          objc_msgSend(v33, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "objectID"), "URIRepresentation"), "description"));
                        }
                        [v82 refreshObject:v38 mergeChanges:1];
                        if (++v34 == 100)
                        {
                          [v2 beginIndexBatch];
                          if ([v32 count])
                          {
                            uint64_t v41 = [v32 count];
                            v89[0] = MEMORY[0x1E4F143A8];
                            v89[1] = 3221225472;
                            v89[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke;
                            v89[3] = &unk_1E544BD58;
                            v89[4] = v30;
                            v89[5] = v32;
                            [v2 indexSearchableItems:v32 completionHandler:v89];
                            v80 += v41;
                          }
                          if ([v33 count])
                          {
                            v88[0] = MEMORY[0x1E4F143A8];
                            v88[1] = 3221225472;
                            v88[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_2;
                            v88[3] = &unk_1E544BD58;
                            v88[4] = v30;
                            v88[5] = v33;
                            [v2 deleteSearchableItemsWithIdentifiers:v33 completionHandler:v88];
                            v79 *= 2;
                          }
                          v87[0] = MEMORY[0x1E4F143A8];
                          v87[1] = 3221225472;
                          v87[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_3;
                          v87[3] = &unk_1E544BDA8;
                          v87[4] = v30;
                          [v2 endIndexBatchWithClientState:v77 completionHandler:v87];
                          uint64_t v34 = 0;
                        }
                      }
                      uint64_t v35 = [v78 countByEnumeratingWithState:&v90 objects:v100 count:16];
                    }
                    while (v35);
                  }
                  [v82 reset];
                  if (v34)
                  {
                    [v2 beginIndexBatch];
                    if ([v32 count])
                    {
                      uint64_t v42 = [v32 count];
                      v86[0] = MEMORY[0x1E4F143A8];
                      v86[1] = 3221225472;
                      v86[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_4;
                      v86[3] = &unk_1E544BD58;
                      v86[4] = v30;
                      v86[5] = v32;
                      [v2 indexSearchableItems:v32 completionHandler:v86];
                      v80 += v42;
                    }
                    if ([v33 count])
                    {
                      uint64_t v43 = [v33 count];
                      v85[0] = MEMORY[0x1E4F143A8];
                      v85[1] = 3221225472;
                      v85[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_5;
                      v85[3] = &unk_1E544BD58;
                      v85[4] = v30;
                      v85[5] = v33;
                      [v2 deleteSearchableItemsWithIdentifiers:v33 completionHandler:v85];
                      v79 += v43;
                    }
                    v84[0] = MEMORY[0x1E4F143A8];
                    v84[1] = 3221225472;
                    v84[2] = __76__NSCoreDataCoreSpotlightDelegate__reindexInstancesOf_inIndex_usingContext___block_invoke_6;
                    v84[3] = &unk_1E544BDA8;
                    v84[4] = v30;
                    [v2 endIndexBatchWithClientState:v77 completionHandler:v84];
                  }
                }
              }
              else
              {
                uint64_t v44 = [v30 name];
                _NSCoreDataLog(2, @"Entity %@ has no indexed properties, skipping.", v45, v46, v47, v48, v49, v50, v44);
              }
            }
            uint64_t v74 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
          }
          while (v74);
        }
        if (_CoreData_SpotlightDebug >= 1)
        {
          uint64_t v58 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Total items indexed, %lu, total items deleted, %lu")];
          _NSCoreDataLog(4, v58, v59, v60, v61, v62, v63, v64, v81);
        }
        [v2 beginIndexBatch];
        [v2 endIndexBatchWithClientState:v68 completionHandler:&__block_literal_global_6];
        [v82 reset];
        [v69 drain];
        id v65 = 0;
      }
      else if (_CoreData_SpotlightDebug >= 1)
      {
        uint64_t v21 = NSString;
        uint64_t v22 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Returning from %@, store for identifier %@ is nil."];
        NSStringFromSelector(sel__reindexInstancesOf_inIndex_usingContext_);
        uint64_t v67 = v81;
        uint64_t v8 = [v21 stringWithFormat:v22];
        goto LABEL_12;
      }
    }
    else if (_CoreData_SpotlightDebug >= 1)
    {
      unsigned __int8 v4 = NSString;
      uint64_t v5 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Returning from %@, Spotlight not enabled."];
      id v6 = NSStringFromSelector(sel__reindexInstancesOf_inIndex_usingContext_);
      uint64_t v7 = 531;
LABEL_5:
      uint64_t v8 = objc_msgSend(v4, "stringWithFormat:", v5, v81, "-[NSCoreDataCoreSpotlightDelegate _reindexInstancesOf:inIndex:usingContext:]", v7, v6);
LABEL_12:
      _NSCoreDataLog(4, v8, v9, v10, v11, v12, v13, v14, v67);
    }
  }
  return [*(id *)(a1 + 56) reset];
}

void __50__NSCoreDataCoreSpotlightDelegate__doFullReimport__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    _NSCoreDataLog(1, @"Error while resetting the client spotlight index before re-index, %@.", a3, a4, a5, a6, a7, a8, a2);
  }
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexAllSearchableItemsWithAcknowledgementHandler:(void *)acknowledgementHandler
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_enabled);
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke;
    v6[3] = &unk_1E544BD30;
    v6[4] = self;
    v6[5] = acknowledgementHandler;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)self, (uint64_t)v6);
  }
  else if (acknowledgementHandler)
  {
    uint64_t v5 = (void (*)(void *))*((void *)acknowledgementHandler + 2);
    v5(acknowledgementHandler);
  }
}

uint64_t __103__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke(uint64_t a1)
{
  if (_CoreData_SpotlightDebug >= 1)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Re-indexing all searchable items"];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v4 = [v2 stringWithFormat:v3];
    _NSCoreDataLog(4, v4, v5, v6, v7, v8, v9, v10, v13);
  }
  -[NSCoreDataCoreSpotlightDelegate _doFullReimport](*(void *)(a1 + 32));
  uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v11();
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexSearchableItemsWithIdentifiers:(NSArray *)identifiers acknowledgementHandler:(void *)acknowledgementHandler
{
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_enabled);
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
    v7[3] = &unk_1E544BE90;
    v7[4] = self;
    v7[5] = identifiers;
    v7[6] = searchableIndex;
    v7[7] = acknowledgementHandler;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)self, (uint64_t)v7);
  }
  else if (acknowledgementHandler)
  {
    uint64_t v6 = (void (*)(void *))*((void *)acknowledgementHandler + 2);
    v6(acknowledgementHandler);
  }
}

uint64_t __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (_CoreData_SpotlightDebug >= 1)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Re-indexing searchable items with identifiers, %@"];
    uint64_t v37 = *(void *)(a1 + 32);
    uint64_t v4 = [v2 stringWithFormat:v3];
    _NSCoreDataLog(4, v4, v5, v6, v7, v8, v9, v10, v37);
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x18C127630]();
        uint64_t v19 = (const char *)[v17 UTF8String];
        uint64_t v20 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) managedObjectIDFromUTF8String:v19 length:strlen(v19)];
        if (v20)
        {
          uint64_t v21 = v20;
          if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]([v20 entity])) {
            [v11 addObject:v21];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v14);
  }
  if ([v11 count])
  {
    uint64_t v22 = -[NSCoreDataCoreSpotlightDelegate _context](*(void *)(a1 + 32));
    uint64_t v23 = +[_PFRoutines fetchHeterogeneousCollectionByObjectIDs:intoContext:]((uint64_t)_PFRoutines, (uint64_t)v11, v22);
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      uint64_t v25 = (void *)[MEMORY[0x1E4F1CA48] array];
      uint64_t v26 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v27 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v39 != v29) {
              objc_enumerationMutation(v24);
            }
            uint64_t v31 = *(void **)(*((void *)&v38 + 1) + 8 * j);
            uint64_t v32 = (void *)MEMORY[0x18C127630]();
            uint64_t v33 = -[NSCoreDataCoreSpotlightDelegate _searchableItemForObject:](*(void **)(a1 + 32), v31);
            if (v33)
            {
              uint64_t v34 = (uint64_t)v33;
              uint64_t v35 = v25;
            }
            else
            {
              uint64_t v34 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "objectID"), "URIRepresentation"), "description");
              uint64_t v35 = v26;
            }
            [v35 addObject:v34];
          }
          uint64_t v28 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v28);
      }
      if ([v25 count]) {
        [*(id *)(a1 + 48) indexSearchableItems:v25 completionHandler:&__block_literal_global_260];
      }
      if ([v26 count]) {
        [*(id *)(a1 + 48) deleteSearchableItemsWithIdentifiers:v26 completionHandler:&__block_literal_global_265];
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    _NSCoreDataLog(1, @"Error indexing (insert/update 2): %@", a3, a4, a5, a6, a7, a8, a2);
  }
}

void __112__NSCoreDataCoreSpotlightDelegate_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    _NSCoreDataLog(1, @"Error indexing (delete 2): %@", a3, a4, a5, a6, a7, a8, a2);
  }
}

- (void)stopSpotlightIndexing
{
  -[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  uint64_t v3 = (void *)-[NSCoreDataCoreSpotlightDelegate _context]((uint64_t)self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NSCoreDataCoreSpotlightDelegate_stopSpotlightIndexing__block_invoke;
  v4[3] = &unk_1E544B868;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __56__NSCoreDataCoreSpotlightDelegate_stopSpotlightIndexing__block_invoke(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 72));
  if (_CoreData_SpotlightDebug >= 1)
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [@"CoreData+CoreSpotlight <%p>: %s(%d): " stringByAppendingString:@"Stopping spotlight indexing"];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v4 = [v2 stringWithFormat:v3];
    _NSCoreDataLog(4, v4, v5, v6, v7, v8, v9, v10, v13);
  }
  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v11 reset];
}

- (void)deleteSpotlightIndexWithCompletionHandler:(void *)completionHandler
{
  v7[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_enabled);
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__NSCoreDataCoreSpotlightDelegate_deleteSpotlightIndexWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E544BD30;
    v5[4] = self;
    v5[5] = completionHandler;
    -[NSCoreDataCoreSpotlightDelegate _asyncContextBlock:]((uint64_t)self, (uint64_t)v5);
  }
  else if (completionHandler)
  {
    uint64_t v4 = *MEMORY[0x1E4F281F8];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = @"Spotlight index not deleted because indexing was not started.";
    (*((void (**)(void *, uint64_t))completionHandler + 2))(completionHandler, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v4, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
  }
}

void __77__NSCoreDataCoreSpotlightDelegate_deleteSpotlightIndexWithCompletionHandler___block_invoke(uint64_t a1)
{
}

- (PFCSSearchableIndexProvider)indexProvider
{
  return self->_indexProvider;
}

- (void)setIndexProvider:(id)a3
{
}

- (id)bundleIdentifier
{
  return 0;
}

- (id)protectionClass
{
  return 0;
}

- (BOOL)usePrivateIndex
{
  return 0;
}

- (NSURL)indexURL
{
  return self->_indexURL;
}

- (void)setIndexURL:(id)a3
{
  if (_CoreData_SpotlightDebug >= 1)
  {
    uint64_t v5 = [NSString stringWithFormat:objc_msgSend(@"CoreData+CoreSpotlight <%p>: %s(%d): ", "stringByAppendingString:", @"Setting alternative index URL"];
    _NSCoreDataLog(4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)self);
  }
  uint64_t v12 = (NSURL *)[a3 standardizedURL];
  if (self->_indexURL != v12)
  {
    uint64_t v13 = v12;
    if (objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "isEqualToString:", -[NSURL absoluteString](v12, "absoluteString")))
    {

      self->_indexURL = (NSURL *)[(NSURL *)v13 copy];
    }
  }
}

@end