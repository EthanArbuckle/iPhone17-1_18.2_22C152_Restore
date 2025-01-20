@interface _PFUbiquityStack
- (PFUbiquityKnowledgeVector)createMetadataStoreKnowledgeVector:(uint64_t)a1;
- (PFUbiquityKnowledgeVector)createMinMetadataStoreKnowledgeVector:(uint64_t)a1;
- (_PFUbiquityStack)init;
- (id)description;
- (id)initWithMetadataEntry:(void *)a1;
- (uint64_t)purgeAndInitializeMetadataStoreFileWithError:(uint64_t)result;
- (void)dealloc;
@end

@implementation _PFUbiquityStack

- (_PFUbiquityStack)init
{
  return 0;
}

- (id)initWithMetadataEntry:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)_PFUbiquityStack;
  v3 = (id *)objc_msgSendSuper2(&v16, sel_init);
  if (v3)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
    {
      v15.receiver = v3;
      v15.super_class = (Class)_PFUbiquityStack;
      id v4 = objc_msgSendSuper2(&v15, sel_description);
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Initializing stack(%@) with metadata entry: %@", "-[_PFUbiquityStack initWithMetadataEntry:]", 71, v4, a2);
    }
    v3[2] = a2;
    if (a2)
    {
      v5 = (void *)a2[1];
      if (v5) {
        v5 = (void *)v5[4];
      }
      v3[3] = v5;
      uint64_t v6 = a2[1];
      if (v6 && *(_DWORD *)(v6 + 24) != 1) {
        uint64_t v6 = *(void *)(v6 + 8);
      }
      v3[4] = (id)v6;
      v7 = (void *)a2[1];
      if (v7) {
        v7 = (void *)v7[5];
      }
      v3[5] = v7;
      v8 = (void *)a2[1];
    }
    else
    {
      v3[3] = 0;
      v3[4] = 0;
      v8 = 0;
      v3[5] = 0;
    }
    v3[6] = v8;
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Setting up metadataMOC for stack: %@", "-[_PFUbiquityStack initWithMetadataEntry:]", 88, v3);
    }
    v9 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
    v3[1] = v9;
    [(NSManagedObjectContext *)v9 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    v10 = v3[2];
    if (v10) {
      uint64_t v11 = v10[2];
    }
    else {
      uint64_t v11 = 0;
    }
    [v3[1] setPersistentStoreCoordinator:v11];
    v12 = v3[1];
    if (v12)
    {
      v12[10] &= ~0x20000u;
      id v13 = v3[1];
    }
    else
    {
      id v13 = 0;
    }
    [v13 setUndoManager:0];
    [v3[1] _setDelegate:v3];
    if (!objc_msgSend((id)objc_msgSend(v3[1], "persistentStoreCoordinator"), "managedObjectModel")) {
      __break(1u);
    }
  }
  return v3;
}

- (void)dealloc
{
  self->_localPeerID = 0;
  self->_ubiquityRootURL = 0;

  self->_storeName = 0;
  self->_metadataStoreFileLocation = 0;

  self->_metadataMOC = 0;
  self->_metadataEntry = 0;
  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityStack;
  [(_PFUbiquityStack *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_PFUbiquityStack;
  id v4 = [(_PFUbiquityStack *)&v9 description];
  if (self)
  {
    localPeerID = self->_localPeerID;
    ubiquityRootURL = self->_ubiquityRootURL;
    metadataStoreFileLocation = self->_metadataStoreFileLocation;
  }
  else
  {
    ubiquityRootURL = 0;
    localPeerID = 0;
    metadataStoreFileLocation = 0;
  }
  return (id)[v3 stringWithFormat:@"%@: \n\tlocalPeerID: %@\n\tubiquityRootURL: %@\n\tmetadataContainerURL: %@\n", v4, localPeerID, ubiquityRootURL, metadataStoreFileLocation];
}

- (uint64_t)purgeAndInitializeMetadataStoreFileWithError:(uint64_t)result
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v29 = 0;

  *(void *)(v3 + 8) = 0;
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4) {
    return 1;
  }
  id v5 = (id)[*(id *)(v4 + 24) options];
  uint64_t v6 = *(void *)(v3 + 16);
  if (v6) {
    v7 = *(void **)(v6 + 24);
  }
  else {
    v7 = 0;
  }
  id v8 = (id)[v7 URL];
  self;
  uint64_t v9 = -[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](_sharedFactory, *(void *)(v3 + 24), *(void *)(v3 + 40), *(void *)(v3 + 32));
  self;
  -[PFUbiquityMetadataFactory removeCachedCoordinatorsForLocalPeerID:storeName:andUbiquityRootLocation:]((id *)_sharedFactory, *(void *)(v3 + 24), *(void *)(v3 + 40), *(void *)(v3 + 32));
  v10 = -[PFUbiquityLocation createFullPath](*(void *)(v3 + 48));
  uint64_t v11 = [v10 stringByDeletingLastPathComponent];

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v11))
  {
    uint64_t v12 = *(void *)(v3 + 16);
    if (v12) {
      id v13 = *(void **)(v12 + 16);
    }
    else {
      id v13 = 0;
    }
    int v14 = [v13 _destroyPersistentStoreAtURL:v8 withType:@"SQLite" options:v5 error:&v29];

    *(void *)(v3 + 16) = 0;
  }
  else
  {
    int v14 = 1;
  }

  if (v14)
  {
    if (!v9)
    {
      self;
      objc_super v15 = -[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(v3 + 24), *(void **)(v3 + 40), *(void **)(v3 + 32), &v29);
LABEL_15:
      *(void *)(v3 + 16) = v15;
      if (v15)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Setting up metadataMOC for stack: %@", "-[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:]", 175, v3);
        }
        objc_super v16 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
        *(void *)(v3 + 8) = v16;
        [(NSManagedObjectContext *)v16 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
        uint64_t v17 = *(void *)(v3 + 16);
        if (v17) {
          uint64_t v18 = *(void *)(v17 + 16);
        }
        else {
          uint64_t v18 = 0;
        }
        [*(id *)(v3 + 8) setPersistentStoreCoordinator:v18];
        uint64_t v19 = *(void *)(v3 + 8);
        if (v19)
        {
          *(_DWORD *)(v19 + 40) &= ~0x20000u;
          v20 = *(void **)(v3 + 8);
        }
        else
        {
          v20 = 0;
        }
        [v20 setUndoManager:0];
        [*(id *)(v3 + 8) _setDelegate:v3];
        return 1;
      }
      goto LABEL_24;
    }
    self;
    if (-[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(v3 + 24), *(void **)(v3 + 40), *(void **)(v3 + 32), &v29))
    {
      self;
      objc_super v15 = (PFUbiquityMetadataFactoryEntry *)(id)-[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](_sharedFactory, *(void *)(v3 + 24), *(void *)(v3 + 40), *(void *)(v3 + 32));
      goto LABEL_15;
    }
  }
LABEL_24:
  if (v29)
  {
    if (a2) {
      *a2 = v29;
    }
  }
  else
  {
    uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m");
    v28 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m";
      __int16 v32 = 1024;
      int v33 = 187;
      _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return 0;
}

- (PFUbiquityKnowledgeVector)createMetadataStoreKnowledgeVector:(uint64_t)a1
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v30 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"max:(transactionNumber)"];
  uint64_t v4 = objc_alloc_init(NSExpressionDescription);
  [(NSPropertyDescription *)v4 setName:@"max"];
  [(NSExpressionDescription *)v4 setExpression:v3];
  [(NSExpressionDescription *)v4 setExpressionResultType:300];
  id v5 = [[NSFetchRequest alloc] initWithEntityName:@"PFUbiquityTransactionEntry"];
  [(NSFetchRequest *)v5 setResultType:2];
  v36[0] = @"actingPeer.peerKey";
  v36[1] = v4;
  -[NSFetchRequest setPropertiesToFetch:](v5, "setPropertiesToFetch:", [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2]);
  [(NSFetchRequest *)v5 setPropertiesToGroupBy:&unk_1ED7E9928];

  uint64_t v6 = (void *)[*(id *)(a1 + 8) executeFetchRequest:v5 error:&v30];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v12 = [v11 objectForKey:@"actingPeer.peerKey"];
          uint64_t v13 = [v11 objectForKey:@"max"];
          if (v12) {
            BOOL v14 = v13 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            [v7 setObject:v13 forKey:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v8);
    }
    if (v7)
    {
      objc_super v15 = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorDictionary:v7];
      if (v15) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error getting knowledge vector from metadata store: %@", "-[_PFUbiquityStack createMetadataStoreKnowledgeVector:]", 278, v30);
    }
    id v7 = 0;
  }
  if (!v30)
  {
    uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m");
    uint64_t v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m";
      __int16 v33 = 1024;
      int v34 = 282;
      _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_26;
  }
  if (!a2)
  {
LABEL_26:
    objc_super v15 = 0;
    goto LABEL_27;
  }
  objc_super v15 = 0;
  *a2 = v30;
LABEL_27:

  return v15;
}

- (PFUbiquityKnowledgeVector)createMinMetadataStoreKnowledgeVector:(uint64_t)a1
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v30 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"min:(transactionNumber)"];
  uint64_t v4 = objc_alloc_init(NSExpressionDescription);
  [(NSPropertyDescription *)v4 setName:@"min"];
  [(NSExpressionDescription *)v4 setExpression:v3];
  [(NSExpressionDescription *)v4 setExpressionResultType:300];
  id v5 = [[NSFetchRequest alloc] initWithEntityName:@"PFUbiquityTransactionEntry"];
  [(NSFetchRequest *)v5 setResultType:2];
  v36[0] = @"actingPeer.peerKey";
  v36[1] = v4;
  -[NSFetchRequest setPropertiesToFetch:](v5, "setPropertiesToFetch:", [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2]);
  [(NSFetchRequest *)v5 setPropertiesToGroupBy:&unk_1ED7E9940];

  uint64_t v6 = (void *)[*(id *)(a1 + 8) executeFetchRequest:v5 error:&v30];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v12 = [v11 objectForKey:@"actingPeer.peerKey"];
          uint64_t v13 = [v11 objectForKey:@"min"];
          if (v12) {
            BOOL v14 = v13 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {

            goto LABEL_20;
          }
          [v7 setObject:v13 forKey:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    if (v7)
    {
      objc_super v15 = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorDictionary:v7];
      if (v15) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error getting knowledge vector from metadata store: %@", "-[_PFUbiquityStack createMinMetadataStoreKnowledgeVector:]", 333, v30);
    }
LABEL_20:
    id v7 = 0;
  }
  if (!v30)
  {
    uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m");
    uint64_t v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/_PFUbiquityStack.m";
      __int16 v33 = 1024;
      int v34 = 337;
      _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_26;
  }
  if (!a2)
  {
LABEL_26:
    objc_super v15 = 0;
    goto LABEL_27;
  }
  objc_super v15 = 0;
  *a2 = v30;
LABEL_27:

  return v15;
}

@end