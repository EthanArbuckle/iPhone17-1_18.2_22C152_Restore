@interface PFUbiquityMetadataFactory
+ (void)_invalidateStaticCaches;
+ (void)initialize;
- (PFUbiquityMetadataFactory)init;
- (PFUbiquityMetadataFactoryEntry)newMetadataEntryForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(void *)a5 error:;
- (id)createMetadataModel;
- (id)description;
- (id)newAttributeNamed:(id)a3 attributeType:(unint64_t)a4 isOptional:(BOOL)a5 isTransient:(BOOL)a6 withDefaultValue:(id)a7 andMinValue:(id)a8 andMaxValue:(id)a9;
- (id)newEntityForName:(id)a3;
- (id)newMetadataManagedObjectModel;
- (id)newRelationshipNamed:(id)a3 withDestinationEntity:(id)a4 andInverseRelationship:(id)a5 isOptional:(BOOL)a6 isToMany:(BOOL)a7 andDeleteRule:(unint64_t)a8;
- (id)newStackForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(void *)a5 error:;
- (uint64_t)cacheEntryForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(void *)a5 error:;
- (uint64_t)entryForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andUbiquityRootLocation:;
- (void)addModelingToolUserInfoToEntity:(id)a3;
- (void)dealloc;
- (void)removeCachedCoordinatorsForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andUbiquityRootLocation:;
@end

@implementation PFUbiquityMetadataFactory

+ (void)initialize
{
  self;
  if ((id)objc_opt_class() == a1)
  {
    _sharedFactory = objc_alloc_init(PFUbiquityMetadataFactory);
    self;
  }
}

+ (void)_invalidateStaticCaches
{
  _MergedGlobals_91 = 0;
}

- (PFUbiquityMetadataFactory)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityMetadataFactory;
  v2 = [(PFUbiquityMetadataFactory *)&v4 init];
  if (v2)
  {
    v2->_rootLocationToPeerIDToEntry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_rootLocationToPeerIDToEntryLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v2->_cachedModel = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_rootLocationToPeerIDToEntry = 0;
  self->_rootLocationToPeerIDToEntryLock = 0;

  self->_cachedModel = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactory;
  [(PFUbiquityMetadataFactory *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactory;
  return (id)[NSString stringWithFormat:@"%@\n\trootLocationToPeerIDToEntry: %@\n", -[PFUbiquityMetadataFactory description](&v3, sel_description), self->_rootLocationToPeerIDToEntry];
}

- (id)newStackForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(void *)a5 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v22 = 0;
  [*(id *)(a1 + 16) lock];
  v10 = (PFUbiquityMetadataFactoryEntry *)(id)-[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4);
  if (v10
    || (v10 = -[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](a1, a2, a3, a4, &v22)) != 0)
  {
    v11 = -[_PFUbiquityStack initWithMetadataEntry:]([_PFUbiquityStack alloc], v10);
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
    v11 = 0;
  }
  [*(id *)(a1 + 16) unlock];

  if ((v12 & 1) == 0)
  {

    if (v22)
    {
      if (a5)
      {
        v11 = 0;
        *a5 = v22;
        return v11;
      }
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m";
        __int16 v25 = 1024;
        int v26 = 113;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    return 0;
  }
  return v11;
}

- (uint64_t)entryForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andUbiquityRootLocation:
{
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 16) lock];
  uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a4), "objectForKey:", a2), "objectForKey:", a3);
  [*(id *)(a1 + 16) unlock];
  return v8;
}

- (PFUbiquityMetadataFactoryEntry)newMetadataEntryForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(void *)a5 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v22 = 0;
    if ([a2 length])
    {
      if ([a3 length])
      {
        v10 = +[PFUbiquityLocation createMetadataStoreFileLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)a2, (uint64_t)a3, a4);
        v11 = [[PFUbiquityMetadataFactoryEntry alloc] initWithMetadataStoreFileLocation:v10];
        char v12 = v11;
        if (v11)
        {
          if (-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]((uint64_t)v11, &v22))
          {
LABEL_17:

            return v12;
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ unable to construct metadata entry.\n\tEntry: %@\n\tlocalPeerID: %@\n\trootLocation: %@\n\tError: %@\nuserInfo: %@", "-[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:]", 138, a1, v12, a2, a4, v22, [v22 userInfo]);
          }

          char v12 = 0;
        }
        if (v22)
        {
          if (a5) {
            *a5 = v22;
          }
        }
        else
        {
          uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m");
          v20 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v24 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m";
            __int16 v25 = 1024;
            int v26 = 146;
            _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
        goto LABEL_17;
      }
    }
  }
  return 0;
}

- (uint64_t)cacheEntryForLocalPeerID:(void *)a3 storeName:(void *)a4 andUbiquityRootLocation:(void *)a5 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v25 = 0;
  [*(id *)(a1 + 16) lock];
  id v10 = (id)[*(id *)(a1 + 8) objectForKey:a4];
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v12 = (void *)[a4 copy];
    [*(id *)(a1 + 8) setObject:v11 forKey:v12];

    id v10 = v11;
  }
  id v13 = (id)[v10 objectForKey:a2];
  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:v13 forKey:a2];
  }
  uint64_t v14 = (PFUbiquityMetadataFactoryEntry *)(id)[v13 objectForKey:a3];
  if (!v14)
  {
    if (!*(void *)(a1 + 24)) {
      *(void *)(a1 + 24) = [(id)a1 createMetadataModel];
    }
    uint64_t v14 = -[PFUbiquityMetadataFactory newMetadataEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](a1, a2, a3, a4, &v25);
    if (!v14)
    {
      uint64_t v15 = 0;
      goto LABEL_12;
    }
    [v13 setObject:v14 forKey:a3];
  }
  uint64_t v15 = 1;
LABEL_12:
  [*(id *)(a1 + 16) unlock];
  if ((v15 & 1) == 0)
  {
    if (v25)
    {
      if (a5) {
        *a5 = v25;
      }
    }
    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactory.m";
        __int16 v28 = 1024;
        int v29 = 218;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v15;
}

- (void)removeCachedCoordinatorsForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andUbiquityRootLocation:
{
  if (a1)
  {
    [a1[2] lock];
    id v8 = (id)objc_msgSend((id)objc_msgSend(a1[1], "objectForKey:", a4), "objectForKey:", a2);
    [v8 removeObjectForKey:a3];
    if ([v8 count])
    {
      v9 = 0;
    }
    else
    {
      id v10 = (id)[a1[1] objectForKey:a4];
      [v10 removeObjectForKey:a2];
      v9 = v10;
      if (![v10 count]) {
        [a1[1] removeObjectForKey:a4];
      }
    }
    if (![a1[1] count])
    {

      a1[3] = 0;
    }
    [a1[2] unlock];
  }
}

- (id)newMetadataManagedObjectModel
{
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 16) lock];
  v2 = *(void **)(a1 + 24);
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)[(id)a1 createMetadataModel];
  }
  id v4 = v3;
  [*(id *)(a1 + 16) unlock];
  return v4;
}

- (id)createMetadataModel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PFUbiquityMetadataFactory_createMetadataModel__block_invoke;
  block[3] = &unk_1E544B868;
  block[4] = self;
  if (qword_1EB270988 != -1) {
    dispatch_once(&qword_1EB270988, block);
  }
  return (id)_MergedGlobals_91;
}

void __48__PFUbiquityMetadataFactory_createMetadataModel__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (objc_class *)objc_opt_class();
  v76 = (void *)[v2 newEntityForName:NSStringFromClass(v3)];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"peerKey" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v6 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"peerCode" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v77 = v4;
  [v4 addObject:v5];
  [v4 addObject:v6];

  v7 = *(void **)(a1 + 32);
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = [v7 newEntityForName:NSStringFromClass(v8)];
  id v10 = *(void **)(a1 + 32);
  id v11 = (objc_class *)objc_opt_class();
  v73 = (void *)[v10 newEntityForName:NSStringFromClass(v11)];
  v78 = (void *)[objc_alloc(NSNumber) initWithInteger:0];
  char v12 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"end" attributeType:300 isOptional:1 isTransient:0 withDefaultValue:v78 andMinValue:v78 andMaxValue:0];
  id v13 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"start" attributeType:300 isOptional:1 isTransient:0 withDefaultValue:v78 andMinValue:v78 andMaxValue:0];
  uint64_t v14 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"peerStart" attributeType:300 isOptional:1 isTransient:0 withDefaultValue:v78 andMinValue:0 andMaxValue:0];
  uint64_t v15 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"peerEnd" attributeType:300 isOptional:1 isTransient:0 withDefaultValue:v78 andMinValue:0 andMaxValue:0];
  uint64_t v16 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"peerEntityName" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  uint64_t v17 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"peer" withDestinationEntity:v76 andInverseRelationship:0 isOptional:1 isToMany:0 andDeleteRule:1];
  v70 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"storeMetadata" withDestinationEntity:v73 andInverseRelationship:0 isOptional:1 isToMany:0 andDeleteRule:1];
  uint64_t v18 = (void *)v9;
  v75 = (void *)v9;
  uint64_t v19 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"primaryKeyRanges" withDestinationEntity:v9 andInverseRelationship:v17 isOptional:1 isToMany:1 andDeleteRule:1];
  [v77 addObject:v19];

  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v12, v13, v14, v15, v16, v17, v70, 0);
  [v18 setProperties:v20];

  uint64_t v21 = *(void **)(a1 + 32);
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = [v21 newEntityForName:NSStringFromClass(v22)];
  v24 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"lastProcessedTransactionLogURL" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  uint64_t v25 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"storeName" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  int v26 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"transactionNumber" attributeType:300 isOptional:1 isTransient:0 withDefaultValue:v78 andMinValue:0 andMaxValue:0];
  uint64_t v27 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"peer" withDestinationEntity:v76 andInverseRelationship:0 isOptional:1 isToMany:0 andDeleteRule:1];
  __int16 v28 = (void *)v23;
  int v29 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"localPeerStates" withDestinationEntity:v23 andInverseRelationship:v27 isOptional:1 isToMany:1 andDeleteRule:1];
  [v77 addObject:v29];

  v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v24, v25, v26, v27, 0);
  v66 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"storeIdentifier" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  uint64_t v30 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"storeType" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v31 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"storeURLString" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v32 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"ubiquityName" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v33 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"ubiquityRelativePath" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v34 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"ubiquityRootURLString" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v35 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"storeOptionsBinaryPlistData" attributeType:1000 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v64 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"modelVersionHashString" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v74 = v28;
  v36 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"peerStates" withDestinationEntity:v28 andInverseRelationship:0 isOptional:1 isToMany:1 andDeleteRule:1];
  v37 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"primaryKeyRanges" withDestinationEntity:v75 andInverseRelationship:v70 isOptional:1 isToMany:1 andDeleteRule:1];
  v72 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v66, v30, v31, v32, v33, v34, v35, v64, v36, v37, 0);

  v38 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"storeMetadata" withDestinationEntity:v73 andInverseRelationship:v36 isOptional:1 isToMany:0 andDeleteRule:1];
  [v68 addObject:v38];

  [v74 setProperties:v68];
  v39 = *(void **)(a1 + 32);
  v40 = (objc_class *)objc_opt_class();
  v41 = (void *)[v39 newEntityForName:NSStringFromClass(v40)];
  v42 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"peerID" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v43 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"storeName" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v44 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"transactionNumber" attributeType:300 isOptional:1 isTransient:0 withDefaultValue:v78 andMinValue:0 andMaxValue:0];
  v45 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"peer" withDestinationEntity:v76 andInverseRelationship:0 isOptional:1 isToMany:0 andDeleteRule:1];
  v71 = v41;
  v46 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"remoteStates" withDestinationEntity:v41 andInverseRelationship:v45 isOptional:1 isToMany:1 andDeleteRule:1];
  [v77 addObject:v46];

  v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v42, v43, v44, v45, 0);
  [v41 setProperties:v47];

  v48 = *(void **)(a1 + 32);
  v49 = (objc_class *)objc_opt_class();
  uint64_t v50 = [v48 newEntityForName:NSStringFromClass(v49)];
  v69 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"globalIDStr" attributeType:700 isOptional:0 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v67 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"localIDStr" attributeType:700 isOptional:0 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v65 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"transactionDate" attributeType:900 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v51 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"transactionNumber" attributeType:300 isOptional:0 isTransient:0 withDefaultValue:v78 andMinValue:0 andMaxValue:0];
  v52 = (void *)[objc_alloc(NSNumber) initWithInt:3];
  v53 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"transactionTypeNum" attributeType:200 isOptional:0 isTransient:0 withDefaultValue:v78 andMinValue:v78 andMaxValue:v52];

  v54 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"transactionLogFilename" attributeType:700 isOptional:1 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v55 = (void *)[*(id *)(a1 + 32) newAttributeNamed:@"knowledgeVectorString" attributeType:700 isOptional:0 isTransient:0 withDefaultValue:0 andMinValue:0 andMaxValue:0];
  v56 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"actingPeer" withDestinationEntity:v76 andInverseRelationship:0 isOptional:1 isToMany:0 andDeleteRule:1];
  v57 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"storeMetadata" withDestinationEntity:v73 andInverseRelationship:0 isOptional:1 isToMany:0 andDeleteRule:1];
  uint64_t v58 = v50;
  v63 = (void *)v50;
  v59 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"transactionEntries" withDestinationEntity:v50 andInverseRelationship:v56 isOptional:1 isToMany:1 andDeleteRule:1];
  [v77 addObject:v59];

  v60 = (void *)[*(id *)(a1 + 32) newRelationshipNamed:@"transactionEntries" withDestinationEntity:v58 andInverseRelationship:v57 isOptional:1 isToMany:1 andDeleteRule:1];
  [v72 addObject:v60];

  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v69, v67, v65, v53, v51, v54, v55, v56, v57, 0);
  [v63 setProperties:v61];

  [v76 setProperties:v77];
  [v73 setProperties:v72];

  _MergedGlobals_91 = objc_alloc_init(NSManagedObjectModel);
  v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v76, v75, v74, v71, v73, v63, 0);
  [(id)_MergedGlobals_91 setEntities:v62];
}

- (id)newEntityForName:(id)a3
{
  v5 = objc_alloc_init(NSEntityDescription);
  [(NSEntityDescription *)v5 setName:a3];
  [(NSEntityDescription *)v5 setManagedObjectClassName:a3];
  [(PFUbiquityMetadataFactory *)self addModelingToolUserInfoToEntity:v5];
  return v5;
}

- (id)newAttributeNamed:(id)a3 attributeType:(unint64_t)a4 isOptional:(BOOL)a5 isTransient:(BOOL)a6 withDefaultValue:(id)a7 andMinValue:(id)a8 andMaxValue:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v16 = objc_alloc_init(NSAttributeDescription);
  [(NSPropertyDescription *)v16 setName:a3];
  [(NSAttributeDescription *)v16 setAttributeType:a4];
  [(NSPropertyDescription *)v16 setOptional:v12];
  [(NSPropertyDescription *)v16 setTransient:v11];
  [(NSAttributeDescription *)v16 setDefaultValue:a7];
  if (a8)
  {
    uint64_t v17 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    uint64_t v18 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a8];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v17 rightExpression:v18 modifier:0 type:3 options:0];
    a8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = (void *)[objc_alloc(NSNumber) initWithInteger:1620];
    [v20 addObject:v21];

    [a8 addObject:v19];
    if (!a9) {
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v22 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    uint64_t v23 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a9];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v22 rightExpression:v23 modifier:0 type:1 options:0];
    if (a8)
    {
      if (v20)
      {
LABEL_7:
        uint64_t v25 = (void *)[objc_alloc(NSNumber) initWithInteger:1610];
        [v20 addObject:v25];

        [a8 addObject:v24];
        goto LABEL_8;
      }
    }
    else
    {
      a8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v20) {
        goto LABEL_7;
      }
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_7;
  }
  id v20 = 0;
  if (a9) {
    goto LABEL_5;
  }
LABEL_8:
  if (a8 && v20) {
    [(NSPropertyDescription *)v16 setValidationPredicates:a8 withValidationWarnings:v20];
  }

  [(PFUbiquityMetadataFactory *)self addModelingToolUserInfoToProperty:v16];
  return v16;
}

- (id)newRelationshipNamed:(id)a3 withDestinationEntity:(id)a4 andInverseRelationship:(id)a5 isOptional:(BOOL)a6 isToMany:(BOOL)a7 andDeleteRule:(unint64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v15 = objc_alloc_init(NSRelationshipDescription);
  [(NSPropertyDescription *)v15 setName:a3];
  [(NSPropertyDescription *)v15 setOptional:v10];
  [(NSRelationshipDescription *)v15 setDeleteRule:a8];
  [(NSRelationshipDescription *)v15 setDestinationEntity:a4];
  if (a5)
  {
    [(NSRelationshipDescription *)v15 setInverseRelationship:a5];
    [a5 setInverseRelationship:v15];
  }
  BOOL v16 = !v9;
  [(NSRelationshipDescription *)v15 setMinCount:v16];
  [(NSRelationshipDescription *)v15 setMaxCount:v16];
  [(PFUbiquityMetadataFactory *)self addModelingToolUserInfoToProperty:v15];
  return v15;
}

- (void)addModelingToolUserInfoToEntity:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  [a3 setUserInfo:v4];
}

@end