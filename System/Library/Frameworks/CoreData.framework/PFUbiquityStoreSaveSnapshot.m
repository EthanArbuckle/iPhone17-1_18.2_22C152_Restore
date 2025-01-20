@interface PFUbiquityStoreSaveSnapshot
- (PFUbiquityKnowledgeVector)createKnowledgeVectorFromPeerStates;
- (PFUbiquityStoreSaveSnapshot)init;
- (PFUbiquityStoreSaveSnapshot)initWithExportingPeerID:(id)a3;
- (PFUbiquityTransactionEntryLight)addManagedObject:(unsigned int)a3 withTransactionType:(id *)a4 andStoreExportContext:(uint64_t *)a5 withError:;
- (id)createUbiquityDictionary:(uint64_t)a3 withStoreExportContext:(uint64_t *)a4 error:;
- (id)description;
- (id)initForExport:(id)a3;
- (id)setTransactionNumber:(void *)a3 peerStates:(void *)a4 andPeerIDs:;
- (uint64_t)checkIndex:(uint64_t)a3 forValue:(uint64_t)a4 fromArrayOfValues:;
- (uint64_t)compressedGlobalObjectIDFromGlobalObjectID:(uint64_t)a1;
- (uint64_t)generatePeerStates;
- (uint64_t)globalObjectIDFromCompressedObjectID:(uint64_t)a1;
- (uint64_t)transactionNumberFromPeerStates:(uint64_t)result;
- (void)_setFilesDeletedInTransaction:(uint64_t)a1;
- (void)dealloc;
- (void)finishGlobalIDReplacement;
- (void)globalObjectIDForManagedObject:(uint64_t)a3 withStoreExportContext:;
- (void)noSyncCheckIndex:(void *)a1 forValue:(uint64_t)a2 fromArrayOfValues:(void *)a3;
- (void)replaceGlobalObjectID:(uint64_t)a3 withGlobalObjectID:;
- (void)reserveTransactionNumberWithStoreExportContext:(void *)a1;
- (void)resetFromOptimisticLockingException;
- (void)setEntityNames:(uint64_t)a1 globalObjectIDs:(void *)a2 primaryKeys:(void *)a3 forStoreName:(uint64_t)a4 withRootLocation:(uint64_t)a5;
@end

@implementation PFUbiquityStoreSaveSnapshot

- (PFUbiquityStoreSaveSnapshot)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityStoreSaveSnapshot;
  v2 = [(PFUbiquityStoreSaveSnapshot *)&v4 init];
  if (v2)
  {
    v2->_entityNames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_peerIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_globalObjectIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_primaryKeys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_updatedObjects = 0;
    v2->_deletedObjects = 0;
    v2->_insertedObjects = 0;
    v2->_managedObjectIDToGlobalObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_globalObjectIDToPermanentManagedObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_entityNameToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_peerIDToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_primaryKeyToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_globalObjectIDToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_gidCache = 0;
    *(_OWORD *)&v2->_peerStates = 0u;
    *(_OWORD *)&v2->_exportingPeerID = 0u;
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coredata.ubiquity.snapshot", 0);
  }
  return v2;
}

- (PFUbiquityStoreSaveSnapshot)initWithExportingPeerID:(id)a3
{
  objc_super v4 = [(PFUbiquityStoreSaveSnapshot *)self init];
  if (v4) {
    v4->_exportingPeerID = (NSString *)a3;
  }
  return v4;
}

- (id)initForExport:(id)a3
{
  v3 = [(PFUbiquityStoreSaveSnapshot *)self initWithExportingPeerID:a3];
  if (v3)
  {
    v3->_insertedObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_updatedObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_deletedObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)dealloc
{
  self->_entityNames = 0;
  self->_peerIDs = 0;

  self->_globalObjectIDs = 0;
  self->_primaryKeys = 0;

  self->_managedObjectIDToGlobalObjectID = 0;
  self->_globalObjectIDToPermanentManagedObjectID = 0;

  self->_entityNameToIndex = 0;
  self->_peerIDToIndex = 0;

  self->_primaryKeyToIndex = 0;
  self->_insertedObjects = 0;

  self->_updatedObjects = 0;
  self->_deletedObjects = 0;

  self->_peerStates = 0;
  self->_transactionNumber = 0;

  self->_storeKV = 0;
  self->_exportingPeerID = 0;

  self->_localPeerID = 0;
  self->_globalObjectIDToIndex = 0;

  self->_filesInsertedInTransaction = 0;
  self->_filesDeletedInTransaction = 0;

  self->_gidCache = 0;
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = queue;
    dispatch_async(queue, block);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityStoreSaveSnapshot;
  [(PFUbiquityStoreSaveSnapshot *)&v4 dealloc];
}

void __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void __38__PFUbiquityStoreSaveSnapshot_dealloc__block_invoke_2(uint64_t a1)
{
}

- (id)description
{
  v3 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)PFUbiquityStoreSaveSnapshot;
  id v4 = [(PFUbiquityStoreSaveSnapshot *)&v19 description];
  if (self)
  {
    entityNames = self->_entityNames;
    peerIDs = self->_peerIDs;
    globalObjectIDs = self->_globalObjectIDs;
    primaryKeys = self->_primaryKeys;
    managedObjectIDToGlobalObjectID = self->_managedObjectIDToGlobalObjectID;
    entityNameToIndex = self->_entityNameToIndex;
    peerIDToIndex = self->_peerIDToIndex;
    primaryKeyToIndex = self->_primaryKeyToIndex;
    insertedObjects = self->_insertedObjects;
    updatedObjects = self->_updatedObjects;
    deletedObjects = self->_deletedObjects;
    peerStates = self->_peerStates;
    transactionNumber = self->_transactionNumber;
  }
  else
  {
    peerStates = 0;
    updatedObjects = 0;
    primaryKeyToIndex = 0;
    entityNameToIndex = 0;
    primaryKeys = 0;
    peerIDs = 0;
    entityNames = 0;
    globalObjectIDs = 0;
    managedObjectIDToGlobalObjectID = 0;
    peerIDToIndex = 0;
    insertedObjects = 0;
    deletedObjects = 0;
    transactionNumber = 0;
  }
  return (id)[v3 stringWithFormat:@"%@:\n\tentityNames: %@\n\tpeerIDs: %@\n\tglobalObjectIDs: %@\n\tprimaryKeys: %@\n\tmanagedObjectIDToGlobalObjectID: %@\n\tentityNameToIndex: %@\n\tpeerIDToIndex: %@\n\tprimaryKeyToIndex: %@\n\tinsertedObjects: %@\n\tupdatedObjects: %@\n\tdeletedObjects: %@\n\tpeerStates: %@\n\ttransactionNumber: %@\n", v4, entityNames, peerIDs, globalObjectIDs, primaryKeys, managedObjectIDToGlobalObjectID, entityNameToIndex, peerIDToIndex, primaryKeyToIndex, insertedObjects, updatedObjects, deletedObjects, peerStates, transactionNumber];
}

- (void)_setFilesDeletedInTransaction:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 152) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 152) = a2;
    }
  }
}

- (uint64_t)checkIndex:(uint64_t)a3 forValue:(uint64_t)a4 fromArrayOfValues:
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__51;
  v11 = __Block_byref_object_dispose__51;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PFUbiquityStoreSaveSnapshot_checkIndex_forValue_fromArrayOfValues___block_invoke;
  v6[3] = &unk_1E544B818;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  dispatch_sync(a1, v6);
  uint64_t v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __69__PFUbiquityStoreSaveSnapshot_checkIndex_forValue_fromArrayOfValues___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 48) count];
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [objc_alloc(NSNumber) initWithUnsignedInteger:v2];
    [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 40)];
    v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
}

- (void)noSyncCheckIndex:(void *)a1 forValue:(uint64_t)a2 fromArrayOfValues:(void *)a3
{
  v6 = (void *)[a1 objectForKey:a2];
  if (!v6)
  {
    uint64_t v7 = [a3 count];
    [a3 addObject:a2];
    v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v7];
    [a1 setObject:v6 forKey:a2];
  }
  return v6;
}

- (void)globalObjectIDForManagedObject:(uint64_t)a3 withStoreExportContext:
{
  if (!a1) {
    return 0;
  }
  v5 = (void *)[a2 objectID];
  [v5 isTemporaryID];
  v6 = (void *)[*(id *)(a1 + 40) objectForKey:v5];
  if (!v6)
  {
    if (a3 && (uint64_t v7 = *(void *)(a3 + 48)) != 0) {
      uint64_t v8 = *(void *)(v7 + 40);
    }
    else {
      uint64_t v8 = 0;
    }
    v6 = (void *)-[PFUbiquityPeerRangeCache createGlobalObjectIDForManagedObjectID:](v8, v5);
    [*(id *)(a1 + 40) setObject:v6 forKey:v5];
    [*(id *)(a1 + 48) setObject:v5 forKey:v6];
  }
  return v6;
}

- (uint64_t)compressedGlobalObjectIDFromGlobalObjectID:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__51;
  v10 = __Block_byref_object_dispose__51;
  uint64_t v11 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 176);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PFUbiquityStoreSaveSnapshot_compressedGlobalObjectIDFromGlobalObjectID___block_invoke;
  block[3] = &unk_1E544C3F0;
  void block[5] = a2;
  block[6] = &v6;
  block[4] = a1;
  dispatch_sync(v2, block);
  uint64_t v3 = [(id)v7[5] stringValue];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__74__PFUbiquityStoreSaveSnapshot_compressedGlobalObjectIDFromGlobalObjectID___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = (uint64_t *)a1[5];
    uint64_t v4 = *(void **)(v2 + 56);
    if (v3)
    {
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](v4, v3[2], *(void **)(v2 + 8));
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 64), v3[4], *(void **)(v2 + 16));
      uint64_t v5 = v3[3];
    }
    else
    {
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](v4, 0, *(void **)(v2 + 8));
      -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 64), 0, *(void **)(v2 + 16));
      uint64_t v5 = 0;
    }
    -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 72), v5, *(void **)(v2 + 32));
    result = -[PFUbiquityStoreSaveSnapshot noSyncCheckIndex:forValue:fromArrayOfValues:](*(void **)(v2 + 80), (uint64_t)v3, *(void **)(v2 + 24));
  }
  else
  {
    result = 0;
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (uint64_t)globalObjectIDFromCompressedObjectID:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(NSNumber), "initWithLong:", objc_msgSend(a2, "integerValue"));
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x3052000000;
      uint64_t v12 = __Block_byref_object_copy__51;
      v13 = __Block_byref_object_dispose__51;
      uint64_t v14 = 0;
      uint64_t v6 = *(NSObject **)(v2 + 176);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__PFUbiquityStoreSaveSnapshot_globalObjectIDFromCompressedObjectID___block_invoke;
      block[3] = &unk_1E544B500;
      block[4] = v2;
      void block[5] = v5;
      block[6] = &v9;
      dispatch_sync(v6, block);

      uint64_t v2 = v10[5];
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to convert compressed object ID string: %@ to index number.", "-[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:]", 240, v2, a2);
      }
      return 0;
    }
  }
  return v2;
}

unint64_t __68__PFUbiquityStoreSaveSnapshot_globalObjectIDFromCompressedObjectID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [v3 count];
  unint64_t result = [*(id *)(a1 + 40) unsignedIntegerValue];
  if (v4 > result)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      uint64_t v7 = *(void **)(v6 + 24);
    }
    else {
      uint64_t v7 = 0;
    }
    unint64_t result = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  }
  return result;
}

- (PFUbiquityTransactionEntryLight)addManagedObject:(unsigned int)a3 withTransactionType:(id *)a4 andStoreExportContext:(uint64_t *)a5 withError:
{
  if (!a1) {
    return 0;
  }
  v10 = -[PFUbiquityStoreSaveSnapshot globalObjectIDForManagedObject:withStoreExportContext:](a1, a2, (uint64_t)a4);
  uint64_t v11 = (void *)[*(id *)(a1 + 48) objectForKey:v10];
  if (v10) {
    objc_setProperty_nonatomic(v10, v12, v11, 48);
  }
  id v13 = -[PFUbiquityGlobalObjectID createGlobalIDString](v10);
  uint64_t v14 = -[PFUbiquityStoreExportContext addTransactionEntryForGlobalID:andTransactionType:](a4, v10, a3);

  uint64_t v15 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, (uint64_t)v10);
  id v16 = -[PFUbiquityStoreSaveSnapshot createUbiquityDictionary:withStoreExportContext:error:](a1, a2, (uint64_t)a4, a5);
  if (!v16) {
    return 0;
  }
  v17 = v16;
  if (a3 <= 2) {
    [*(id *)(a1 + 8 * a3 + 88) setObject:v16 forKey:v15];
  }

  return v14;
}

- (id)createUbiquityDictionary:(uint64_t)a3 withStoreExportContext:(uint64_t *)a4 error:
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v51 = a2;
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entity"), "attributesByName"), "allValues");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v71;
    uint64_t v45 = *MEMORY[0x1E4F281F8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v71 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v70 + 1) + 8 * v10);
        if (([v11 isTransient] & 1) == 0)
        {
          if ([v11 attributeType])
          {
            uint64_t v12 = [v11 name];
            id v13 = (id)[v51 valueForKey:v12];
            if (v13)
            {
              if ([v11 attributeType] == 1800) {
                id v13 = +[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v13, v11);
              }
              if ([v11 attributeType] != 1000
                || ![v11 allowsExternalBinaryDataStorage])
              {
                goto LABEL_37;
              }
              uint64_t v14 = a3 ? *(void **)(a3 + 40) : 0;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_37;
              }
              id v13 = (id)-[NSSQLCore _ubiquityDictionaryForAttribute:onObject:](v14, v11, v51);
              if ((unint64_t)[v13 count] < 2) {
                goto LABEL_37;
              }
              uint64_t v15 = (void *)[v13 valueForKey:@"UUID"];
              uint64_t v16 = (uint64_t)v15;
              if (v14 && [v15 length]) {
                obuint64_t j = (id)objc_msgSend((id)objc_msgSend(v14, "externalDataReferencesDirectory"), "stringByAppendingPathComponent:", v16);
              }
              else {
                obuint64_t j = 0;
              }
              id v49 = +[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, v16, v14);
              v17 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v49);
              v18 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquitousExternalDataReferenceLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v49);
              objc_super v19 = v18;
              uint64_t v69 = 0;
              uint64_t v65 = 0;
              v66 = &v65;
              uint64_t v67 = 0x2020000000;
              char v68 = 0;
              uint64_t v61 = 0;
              v62 = &v61;
              uint64_t v63 = 0x2020000000;
              char v64 = 0;
              if (v18)
              {
                v60[0] = MEMORY[0x1E4F143A8];
                v60[1] = 3221225472;
                v60[2] = __85__PFUbiquityStoreSaveSnapshot_createUbiquityDictionary_withStoreExportContext_error___block_invoke;
                v60[3] = &unk_1E544F628;
                v60[4] = obj;
                v60[5] = &v65;
                v60[6] = &v61;
                [v18 coordinateWritingItemAtURL:v17 options:8 error:&v69 byAccessor:v60];
              }
              else
              {
                char v68 = 0;
              }

              int v20 = *((unsigned __int8 *)v66 + 24);
              if (*((unsigned char *)v66 + 24))
              {
                if (!*((unsigned char *)v62 + 24))
                {
                  id v21 = *(id *)(a1 + 144);
                  if (!v21)
                  {
                    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    *(void *)(a1 + 144) = v21;
                  }
                  [v21 addObject:v49];
                }
                goto LABEL_36;
              }

              uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v45, 134030, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Failed to copy external reference to ubiquity container", @"Underlying error"));
              if (v22)
              {
                if (a4)
                {
                  id v46 = 0;
                  *a4 = v22;
LABEL_36:
                  _Block_object_dispose(&v61, 8);
                  _Block_object_dispose(&v65, 8);
                  if (!v20) {
                    return 0;
                  }
LABEL_37:
                  if (v13) {
                    [v46 setObject:v13 forKey:v12];
                  }
                  goto LABEL_39;
                }
              }
              else
              {
                uint64_t v23 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityStoreSaveSnapshot.m");
                v30 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v77 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/"
                        "PFUbiquityStoreSaveSnapshot.m";
                  __int16 v78 = 1024;
                  int v79 = 599;
                  _os_log_fault_impl(&dword_18AB82000, v30, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
              id v46 = 0;
              goto LABEL_36;
            }
          }
        }
LABEL_39:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v31 = [v7 countByEnumeratingWithState:&v70 objects:v80 count:16];
      uint64_t v8 = v31;
    }
    while (v31);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obja = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "entity"), "relationshipsByName"), "allValues");
  uint64_t v32 = [obja countByEnumeratingWithState:&v56 objects:v75 count:16];
  if (v32)
  {
    uint64_t v50 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v57 != v50) {
          objc_enumerationMutation(obja);
        }
        v34 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v35 = [v34 name];
        v36 = (void *)[v51 valueForKey:v35];
        if (v36 && ([v34 isTransient] & 1) == 0)
        {
          if ([v34 isToMany])
          {
            v37 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            uint64_t v38 = [v36 countByEnumeratingWithState:&v52 objects:v74 count:16];
            if (v38)
            {
              uint64_t v39 = *(void *)v53;
              do
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v53 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  v41 = -[PFUbiquityStoreSaveSnapshot globalObjectIDForManagedObject:withStoreExportContext:](a1, *(void **)(*((void *)&v52 + 1) + 8 * j), a3);
                  objc_msgSend(v37, "addObject:", -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, (uint64_t)v41));
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v52 objects:v74 count:16];
              }
              while (v38);
            }
          }
          else
          {
            v42 = -[PFUbiquityStoreSaveSnapshot globalObjectIDForManagedObject:withStoreExportContext:](a1, v36, a3);
            v37 = (void *)-[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, (uint64_t)v42);
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got final value for relationship: %@\n%@\nObject: %@", "-[PFUbiquityStoreSaveSnapshot createUbiquityDictionary:withStoreExportContext:error:]", 647, v35, v37, v51);
          }
          [v46 setObject:v37 forKey:v35];
        }
      }
      uint64_t v32 = [obja countByEnumeratingWithState:&v56 objects:v75 count:16];
    }
    while (v32);
  }
  return v46;
}

- (void)reserveTransactionNumberWithStoreExportContext:(void *)a1
{
  if (a1)
  {
    if (a2)
    {
      id Property = *(id *)(a2 + 48);
      if (Property) {
        id Property = objc_getProperty(Property, (SEL)a2, 64, 1);
      }
    }
    else
    {
      id Property = 0;
    }
    uint64_t v5 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByIncrementingPeerWithID:]((uint64_t)Property, a1[16]);
    a1[20] = v5;
    if (v5) {
      uint64_t v5 = (id *)[v5[1] objectForKey:a1[16]];
    }
    a1[15] = v5;
    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
    {
      uint64_t v7 = a1[20];
      if (a2)
      {
        id v8 = *(id *)(a2 + 48);
        if (v8) {
          id v8 = objc_getProperty(v8, v6, 64, 1);
        }
      }
      else
      {
        id v8 = 0;
      }
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nReserved transaction knowledge vector: %@ (%@)", "-[PFUbiquityStoreSaveSnapshot reserveTransactionNumberWithStoreExportContext:]", 293, a1, v7, v8);
    }
  }
}

- (uint64_t)generatePeerStates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    *(void *)(result + 112) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nGenerating Peer States: %@", "-[PFUbiquityStoreSaveSnapshot generatePeerStates]", 300, v1, *(void *)(v1 + 160));
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v2 = *(void *)(v1 + 160);
    if (v2) {
      uint64_t v3 = (void *)[*(id *)(v2 + 8) allKeys];
    }
    else {
      uint64_t v3 = 0;
    }
    unint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v13;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
          if (([v7 isEqualToString:*(void *)(v1 + 136)] & 1) == 0)
          {
            id v8 = (void *)-[PFUbiquityStoreSaveSnapshot checkIndex:forValue:fromArrayOfValues:](*(NSObject **)(v1 + 176), *(void *)(v1 + 64), (uint64_t)v7, *(void *)(v1 + 16));
            uint64_t v9 = *(void **)(v1 + 112);
            uint64_t v10 = *(void *)(v1 + 160);
            if (v10) {
              uint64_t v11 = [*(id *)(v10 + 8) objectForKey:v7];
            }
            else {
              uint64_t v11 = 0;
            }
            objc_msgSend(v9, "setObject:forKey:", v11, objc_msgSend(v8, "stringValue"));
          }
          ++v6;
        }
        while (v4 != v6);
        unint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)resetFromOptimisticLockingException
{
  if (a1)
  {

    a1[20] = 0;
    a1[15] = 0;

    a1[14] = 0;
  }
}

- (PFUbiquityKnowledgeVector)createKnowledgeVectorFromPeerStates
{
  uint64_t v1 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 setObject:v1[3]._hash forKey:v1[4].super.isa];
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v1->_storeKVDict];
    uint64_t v4 = [(NSDictionary *)v1->_storeKVDict count];
    uint64_t v5 = v4 - [(NSDictionary *)v1->_storeKVDict containsObject:v1[4].super.isa];
    if ([(NSDictionary *)v1[3]._storeKVDict count] != v5) {
      objc_msgSend(v3, "addObjectsFromArray:", -[NSDictionary allKeys](v1[3]._storeKVDict, "allKeys"));
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v3);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = -[PFUbiquityStoreSaveSnapshot transactionNumberFromPeerStates:]((uint64_t)v1, (void *)[(objc_class *)v1[2].super.isa objectForKey:v10]);
          if (!v11)
          {
            uint64_t v11 = [(NSDictionary *)v1[3]._storeKVDict objectForKey:v10];
            if (!v11) {
              continue;
            }
          }
          [v2 setObject:v11 forKey:v10];
        }
        uint64_t v7 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    uint64_t v1 = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorDictionary:v2];
  }
  return v1;
}

- (uint64_t)transactionNumberFromPeerStates:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ([a2 isNSString]) {
      id v4 = a2;
    }
    else {
      id v4 = (id)[[NSString alloc] initWithFormat:@"%@", a2];
    }
    uint64_t v5 = v4;
    uint64_t v6 = [*(id *)(v3 + 112) objectForKey:v4];

    return v6;
  }
  return result;
}

- (id)setTransactionNumber:(void *)a3 peerStates:(void *)a4 andPeerIDs:
{
  if (result)
  {
    uint64_t v6 = result;
    objc_setProperty_nonatomic(result, newValue, newValue, 120);

    v6[14] = (id)[a3 mutableCopy];
    [v6[8] removeAllObjects];
    uint64_t v7 = (void *)[a4 mutableCopy];
    v6[2] = v7;
    unint64_t result = (id *)[v7 count];
    if (result)
    {
      for (unint64_t i = 0; i < (unint64_t)result; ++i)
      {
        uint64_t v9 = [v6[2] objectAtIndex:i];
        uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:i];
        [v6[8] setObject:v10 forKey:v9];

        unint64_t result = (id *)[v6[2] count];
      }
    }
  }
  return result;
}

- (void)setEntityNames:(uint64_t)a1 globalObjectIDs:(void *)a2 primaryKeys:(void *)a3 forStoreName:(uint64_t)a4 withRootLocation:(uint64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 56) removeAllObjects];
    [*(id *)(a1 + 8) removeAllObjects];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(a2);
          }
          long long v14 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v13) copy];
          [*(id *)(a1 + 8) addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [a2 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v11);
    }
    if ([*(id *)(a1 + 8) count])
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = [*(id *)(a1 + 8) objectAtIndex:v15];
        uint64_t v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v15];
        [*(id *)(a1 + 56) setObject:v17 forKey:v16];

        ++v15;
      }
      while (v15 < [*(id *)(a1 + 8) count]);
    }
    [*(id *)(a1 + 72) removeAllObjects];
    [*(id *)(a1 + 32) setArray:a4];
    if ([*(id *)(a1 + 32) count])
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v19 = [*(id *)(a1 + 32) objectAtIndex:v18];
        int v20 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v18];
        [*(id *)(a1 + 72) setObject:v20 forKey:v19];

        ++v18;
      }
      while (v18 < [*(id *)(a1 + 32) count]);
    }
    id v21 = *(NSObject **)(a1 + 176);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__PFUbiquityStoreSaveSnapshot_setEntityNames_globalObjectIDs_primaryKeys_forStoreName_withRootLocation___block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = a1;
    dispatch_sync(v21, block);
    uint64_t v22 = (PFUbiquityGlobalObjectIDCache *)*(id *)(a1 + 168);
    if (!v22) {
      uint64_t v22 = [[PFUbiquityGlobalObjectIDCache alloc] initWithLocalPeerID:*(void *)(a1 + 136) forStoreName:a5];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v23 = [a3 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v29;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(a3);
          }
          uint64_t v27 = -[PFUbiquityGlobalObjectIDCache createGlobalIDForCompressedString:withEntityNames:primaryKeys:peerIDs:]((PFUbiquityGlobalObjectID *)v22, *(void **)(*((void *)&v28 + 1) + 8 * v26), *(void *)(a1 + 8), *(void *)(a1 + 32), *(void *)(a1 + 16));
          if (v27) {
            -[PFUbiquityStoreSaveSnapshot checkIndex:forValue:fromArrayOfValues:](*(NSObject **)(a1 + 176), *(void *)(a1 + 80), (uint64_t)v27, *(void *)(a1 + 24));
          }

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [a3 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v24);
    }
  }
}

unint64_t __104__PFUbiquityStoreSaveSnapshot_setEntityNames_globalObjectIDs_primaryKeys_forStoreName_withRootLocation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndex:i];
      uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:i];
      [*(id *)(*(void *)(a1 + 32) + 80) setObject:v5 forKey:v4];

      unint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
    }
  }
  return result;
}

- (void)replaceGlobalObjectID:(uint64_t)a3 withGlobalObjectID:
{
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 176);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PFUbiquityStoreSaveSnapshot_replaceGlobalObjectID_withGlobalObjectID___block_invoke;
    block[3] = &unk_1E544BB28;
    block[4] = a1;
    void block[5] = a2;
    block[6] = a3;
    dispatch_sync(v3, block);
  }
}

void __72__PFUbiquityStoreSaveSnapshot_replaceGlobalObjectID_withGlobalObjectID___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 24);
  if (v2 && (uint64_t v3 = [v2 indexOfObject:a1[5]], v3 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v4 = v3;
    if ([*(id *)(a1[4] + 24) count])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ replacing global object id:\n\told: %@\n\tnew: %@", "-[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:]_block_invoke", 492, a1[4], a1[5], a1[6]);
      }
      [*(id *)(a1[4] + 24) replaceObjectAtIndex:v4 withObject:a1[6]];
      uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v4];
      [*(id *)(a1[4] + 80) removeObjectForKey:a1[5]];
      [*(id *)(a1[4] + 80) setObject:v5 forKey:a1[6]];
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Hrm found something in empty array did you? %@\n\ti: %lu\n\tNSNotFound: %lu", "-[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:]_block_invoke", 488, *(void *)(a1[4] + 24), v4, 0x7FFFFFFFFFFFFFFFLL);
      }
      __break(1u);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ wasn't in this snapshot: %@", "-[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:]_block_invoke", 507, a1[5], a1[4]);
  }
}

- (void)finishGlobalIDReplacement
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3052000000;
    unint64_t v15 = __Block_byref_object_copy__51;
    uint64_t v16 = __Block_byref_object_dispose__51;
    uint64_t v17 = 0;
    id v2 = *(NSObject **)(a1 + 176);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PFUbiquityStoreSaveSnapshot_finishGlobalIDReplacement__block_invoke;
    block[3] = &unk_1E544B9B0;
    block[4] = a1;
    void block[5] = &v12;
    dispatch_sync(v2, block);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v3 = (void *)v13[5];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](a1, *(void *)(*((void *)&v7 + 1) + 8 * i));
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
      }
      while (v4);
    }
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __56__PFUbiquityStoreSaveSnapshot_finishGlobalIDReplacement__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __85__PFUbiquityStoreSaveSnapshot_createUbiquityDictionary_withStoreExportContext_error___block_invoke(void *a1, void *a2)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "path"), "stringByDeletingLastPathComponent");
  char v12 = 0;
  uint64_t v11 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", v4, &v12) & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
  }
  id v10 = 0;
  int v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtPath:toPath:error:", a1[4], objc_msgSend(a2, "path"), &v10);
  id result = v10;
  if (v5) {
    BOOL v7 = v10 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v9 = a1[5];
    goto LABEL_11;
  }
  long long v8 = (void *)[v10 domain];
  id result = (id)[v8 isEqualToString:*MEMORY[0x1E4F281F8]];
  if (result)
  {
    id result = (id)[v10 code];
    if (result == (id)516)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      uint64_t v9 = a1[6];
LABEL_11:
      *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
    }
  }
  return result;
}

@end