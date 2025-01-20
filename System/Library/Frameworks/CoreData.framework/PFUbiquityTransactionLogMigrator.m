@interface PFUbiquityTransactionLogMigrator
- (BOOL)migrateTransactionLogsForStoreName:(uint64_t)a3 andLocalPeerID:(void *)a4 atUbiquityRootLocation:(void *)a5 error:;
- (PFUbiquityTransactionLogMigrator)initWithSourceModel:(id)a3 destinationModel:(id)a4 mappingModel:(id)a5 localPeerID:(id)a6;
- (id)createDestinationObjectContentFromSourceObjectContent:(id)a3 withEntityMapping:(id)a4 migrationContext:(id)a5;
- (id)createDestinationObjectsFromSourceObjects:(id)a3 migrationContext:(id)a4;
- (uint64_t)createDestinationGlobalObjectIDFromSourceGlobalObjectID:(uint64_t)a1;
- (void)dealloc;
- (void)populateMappingsByEntityName;
@end

@implementation PFUbiquityTransactionLogMigrator

- (PFUbiquityTransactionLogMigrator)initWithSourceModel:(id)a3 destinationModel:(id)a4 mappingModel:(id)a5 localPeerID:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)PFUbiquityTransactionLogMigrator;
  v10 = [(PFUbiquityTransactionLogMigrator *)&v12 init];
  if (v10)
  {
    v10->_srcModel = (NSManagedObjectModel *)a3;
    v10->_dstModel = (NSManagedObjectModel *)a4;
    v10->_mappingModel = (NSMappingModel *)a5;
    v10->_localPeerID = (NSString *)a6;
    [(PFUbiquityTransactionLogMigrator *)v10 populateMappingsByEntityName];
  }
  return v10;
}

- (void)dealloc
{
  self->_localPeerID = 0;
  self->_mappingModel = 0;

  self->_srcModel = 0;
  self->_dstModel = 0;

  self->_mappingsByEntityName = 0;
  self->_removedEntities = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionLogMigrator;
  [(PFUbiquityTransactionLogMigrator *)&v3 dealloc];
}

- (void)populateMappingsByEntityName
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [(NSMappingModel *)self->_mappingModel entityMappings];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 sourceEntityName];
        uint64_t v13 = [v11 mappingType];
        if ((unint64_t)(v13 - 4) < 2)
        {
          [v4 addObject:v11];
          v14 = v3;
        }
        else
        {
          if (v13 == 2) {
            continue;
          }
          v14 = v5;
          if (v13 != 3)
          {
            uint64_t v15 = *MEMORY[0x1E4F1C3B8];
            v16 = (void *)MEMORY[0x1E4F1C9E8];
            if ([v11 name]) {
              uint64_t v17 = [v11 name];
            }
            else {
              uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
            }
            id v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v15, 134110, @"Unsupported entity mapping type", objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, @"entityMapping", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "mappingType")), @"mappingType", 0));
            objc_exception_throw(v18);
          }
        }
        [v14 addObject:v12];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  self->_mappingsByEntityName = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v4 forKeys:v3];

  self->_removedEntities = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
}

- (BOOL)migrateTransactionLogsForStoreName:(uint64_t)a3 andLocalPeerID:(void *)a4 atUbiquityRootLocation:(void *)a5 error:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    p_cache = PFUbiquityMetadataFactory.cache;
    v63 = +[PFUbiquityLocation createPeerStoreLocationForPeerID:andStoreName:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a3, a2, a4);
    id v10 = +[PFUbiquityLocation createMapOfLocationsForOldManagedObjectModel:andNewManagedObjectModel:inUbiquityPeerStoreLocation:]((uint64_t)PFUbiquityLocation, *(void **)(a1 + 8), *(void **)(a1 + 16), (uint64_t)v63);
    v11 = PFUbiquityMetadataFactory.cache;
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Migrating %lu transaction log files for '%@' at '%@'", "-[PFUbiquityTransactionLogMigrator migrateTransactionLogsForStoreName:andLocalPeerID:atUbiquityRootLocation:error:]", 121, [v10 count], a2, a4);
    }
    uint64_t v61 = a2;
    v62 = a4;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = (id)[v10 allKeys];
    uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v70;
      v64 = a5;
      id v65 = v10;
      uint64_t v66 = *(void *)v70;
LABEL_6:
      uint64_t v15 = 0;
      uint64_t v67 = v13;
      while (1)
      {
        if (*(void *)v70 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v69 + 1) + 8 * v15);
        uint64_t v17 = [v10 objectForKey:v16];
        id v18 = (void *)v17;
        if (v17 && -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v17, 0, 0))
        {
          if ([v11 + 253 canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Destination log file already exits in final location, skipping: %@", "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 159, v18);
          }
        }
        else
        {
          self;
          long long v19 = (void *)[v18 copy];
          [v19 setUbiquityLocationType:21];
          -[PFUbiquityLocation updateHash](v19);
          if (v19) {
            BOOL v20 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:]((uint64_t)v19, 0, 0);
          }
          else {
            BOOL v20 = 0;
          }

          int v21 = [v11 + 253 canLogMessageAtLevel:2];
          if (v20)
          {
            uint64_t v14 = v66;
            uint64_t v13 = v67;
            if (v21) {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Destination log file already exits in staging location, skipping: %@", "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 166, v18);
            }
          }
          else
          {
            if (v21) {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Migrating src transaction log %@ to %@", "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 173, v16, v18);
            }
            self;
            long long v22 = (void *)[v18 copy];
            [v22 setUbiquityLocationType:21];
            -[PFUbiquityLocation updateHash](v22);
            if (!v22 || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:]((uint64_t)v22, 0, 0))
            {

              v26 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:v16 andLocalPeerID:*(void *)(a1 + 32)];
              if (!-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v26, a5)
                || !-[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v26, a5)
                || !-[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v26, a5)
                || !-[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v26, a5))
              {
                goto LABEL_80;
              }
              v27 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:v18 andLocalPeerID:*(void *)(a1 + 32)];
              v29 = v27;
              if (v26
                && ((v30 = v26->_transactionLogLocation) == 0 ? (v31 = 0) : (v31 = v30->_storeName),
                    (v32 = v26->_saveSnapshot) != 0))
              {
                v33 = (void *)[(NSMutableDictionary *)v32->_storeNameToStoreSaveSnapshots objectForKey:v31];
                if (v29) {
                  goto LABEL_34;
                }
LABEL_69:
                v34 = 0;
                if (!v26) {
                  goto LABEL_70;
                }
LABEL_35:
                transactionLogLocation = v26->_transactionLogLocation;
                if (!transactionLogLocation) {
                  goto LABEL_70;
                }
                storeName = transactionLogLocation->_storeName;
                if (v34) {
                  goto LABEL_37;
                }
LABEL_71:
                uint64_t v37 = 0;
                if (!v29) {
                  goto LABEL_72;
                }
LABEL_38:
                saveSnapshot = v29->_saveSnapshot;
                if (v26) {
                  goto LABEL_39;
                }
LABEL_73:
                transactionDate = 0;
                if (!saveSnapshot) {
                  goto LABEL_42;
                }
              }
              else
              {
                v33 = 0;
                if (!v27) {
                  goto LABEL_69;
                }
LABEL_34:
                v34 = v29->_saveSnapshot;
                if (v26) {
                  goto LABEL_35;
                }
LABEL_70:
                storeName = 0;
                if (!v34) {
                  goto LABEL_71;
                }
LABEL_37:
                uint64_t v37 = [(NSMutableDictionary *)v34->_storeNameToStoreSaveSnapshots objectForKey:storeName];
                if (v29) {
                  goto LABEL_38;
                }
LABEL_72:
                saveSnapshot = 0;
                if (!v26) {
                  goto LABEL_73;
                }
LABEL_39:
                v39 = v26->_saveSnapshot;
                if (!v39) {
                  goto LABEL_73;
                }
                transactionDate = v39->_transactionDate;
                if (!saveSnapshot)
                {
LABEL_42:
                  v41 = (char *)-[PFUbiquityTransactionLog transactionNumber](v26);
                  if (v33)
                  {
                    v42 = (void *)v33[14];
                    v43 = (void *)v33[2];
                  }
                  else
                  {
                    v42 = 0;
                    v43 = 0;
                  }
                  -[PFUbiquityStoreSaveSnapshot setTransactionNumber:peerStates:andPeerIDs:]((id *)v37, v41, v42, v43);
                  v44 = objc_alloc_init(_PFUbiquityMigrationContext);
                  v46 = v44;
                  if (v44)
                  {
                    objc_setProperty_nonatomic(v44, v45, v26, 8);
                    objc_setProperty_nonatomic(v46, v47, v33, 16);
                    objc_setProperty_nonatomic(v46, v48, (id)v37, 24);
                  }
                  if (v33)
                  {
                    v49 = (void *)[(id)a1 createDestinationObjectsFromSourceObjects:v33[11] migrationContext:v46];
                    v50 = (void *)[(id)a1 createDestinationObjectsFromSourceObjects:v33[12] migrationContext:v46];
                    uint64_t v51 = v33[13];
                  }
                  else
                  {
                    v49 = (void *)[(id)a1 createDestinationObjectsFromSourceObjects:0 migrationContext:v46];
                    v50 = (void *)[(id)a1 createDestinationObjectsFromSourceObjects:0 migrationContext:v46];
                    uint64_t v51 = 0;
                  }
                  v52 = (void *)[(id)a1 createDestinationObjectsFromSourceObjects:v51 migrationContext:v46];
                  if (v37)
                  {
                    v53 = *(void **)(v37 + 88);
                    if (v53 != v49)
                    {

                      *(void *)(v37 + 88) = [v49 mutableCopy];
                    }
                    v54 = *(void **)(v37 + 96);
                    if (v54 != v50)
                    {

                      *(void *)(v37 + 96) = [v50 mutableCopy];
                    }
                    v55 = *(void **)(v37 + 104);
                    if (v55 != v52)
                    {

                      *(void *)(v37 + 104) = [v52 mutableCopy];
                    }
                  }

                  if (v29 && (*(unsigned char *)(a1 + 56) & 1) != 0) {
                    v29->_useTemporaryLogLocation = 1;
                  }
                  a5 = v64;
                  BOOL v56 = -[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]((uint64_t)v29, v64, 0);
                  BOOL v57 = +[PFUbiquityLogging canLogMessageAtLevel:2];
                  id v10 = v65;
                  uint64_t v14 = v66;
                  p_cache = (void **)(PFUbiquityMetadataFactory + 16);
                  if (!v56)
                  {
                    if (v57) {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Destination log write failed with error %@", "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 230, *v64);
                    }
                    goto LABEL_79;
                  }
                  if (v57) {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Destination log written succesfully", "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 224);
                  }
                  uint64_t v13 = v67;
                  if (!-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v29, v64))
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to move transaction log to permanent location: %@", "-[PFUbiquityTransactionLogMigrator migrateTransactionLogFromLocation:toLocation:error:]", 227, *v64);
                    }
                    goto LABEL_79;
                  }

                  v11 = (void **)(PFUbiquityMetadataFactory + 16);
                  goto LABEL_64;
                }
              }
              objc_setProperty_nonatomic(saveSnapshot, v28, transactionDate, 8);
              goto LABEL_42;
            }
            v23 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:v22 andLocalPeerID:*(void *)(a1 + 32)];
            uint64_t v24 = v23;
            uint64_t v14 = v66;
            if (*(unsigned char *)(a1 + 56))
            {

              uint64_t v13 = v67;
            }
            else
            {
              BOOL v25 = -[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v23, a5);

              uint64_t v13 = v67;
              if (!v25) {
                goto LABEL_81;
              }
            }
          }
        }
LABEL_64:
        if (v13 == ++v15)
        {
          uint64_t v58 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
          uint64_t v13 = v58;
          if (v58) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
    v46 = (void *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)(p_cache + 248), *(void **)(a1 + 8));
    v59 = (void *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)(p_cache + 248), *(void **)(a1 + 16));
    v26 = (PFUbiquityTransactionLog *)+[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_cache + 248), 10, v61, (uint64_t)v46, v62);
    v29 = (PFUbiquityTransactionLog *)+[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_cache + 248), 10, v61, (uint64_t)v46, v62);

LABEL_79:
    v26 = v29;
LABEL_80:

LABEL_81:
  }
  return a1 != 0;
}

- (uint64_t)createDestinationGlobalObjectIDFromSourceGlobalObjectID:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = a2 ? a2[2] : 0;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v4), "destinationEntityName");
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [PFUbiquityGlobalObjectID alloc];
  if (a2)
  {
    uint64_t v8 = a2[1];
    uint64_t v9 = a2[3];
    uint64_t v10 = a2[4];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }

  return (uint64_t)[(PFUbiquityGlobalObjectID *)v7 initWithStoreName:v8 entityName:v6 primaryKey:v9 andPeerID:v10];
}

- (id)createDestinationObjectContentFromSourceObjectContent:(id)a3 withEntityMapping:(id)a4 migrationContext:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v54 = a4;
  id obj = (id)[a4 attributeMappings];
  uint64_t v60 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
  if (!v60) {
    goto LABEL_35;
  }
  uint64_t v58 = *(void *)v79;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v79 != v58) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v78 + 1) + 8 * v9);
      uint64_t v62 = v9;
      if (v10) {
        v11 = (void *)v10[3];
      }
      else {
        v11 = 0;
      }
      uint64_t v12 = [v10 name];
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v74 objects:v84 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v75;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v75 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v74 + 1) + 8 * v16);
            if (v17)
            {
              if (*(void *)(v17 + 24)) {
                BOOL v18 = *(unsigned char *)(v17 + 32) != 0;
              }
              else {
                BOOL v18 = 0;
              }
              long long v19 = *(void **)(v17 + 8);
            }
            else
            {
              BOOL v18 = 0;
              long long v19 = 0;
            }
            uint64_t v20 = [v19 expressionType];
            if (v20 == 3)
            {
              int v21 = objc_msgSend(a3, "objectForKey:", objc_msgSend(v19, "keyPath"));
              if (!v21) {
                goto LABEL_27;
              }
            }
            else
            {
              if (v20 || v18 && [v8 objectForKey:v12]) {
                goto LABEL_27;
              }
              int v21 = (void *)[v19 constantValue];
              if (!v21) {
                goto LABEL_27;
              }
            }
            long long v22 = v21;
            if ((objc_msgSend(v21, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0) {
              [v8 setObject:v22 forKey:v12];
            }
LABEL_27:
            ++v16;
          }
          while (v14 != v16);
          uint64_t v23 = [v11 countByEnumeratingWithState:&v74 objects:v84 count:16];
          uint64_t v14 = v23;
        }
        while (v23);
      }
      uint64_t v9 = v62 + 1;
    }
    while (v62 + 1 != v60);
    uint64_t v24 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
    uint64_t v60 = v24;
  }
  while (v24);
LABEL_35:
  if (a5) {
    uint64_t v25 = *((void *)a5 + 3);
  }
  else {
    uint64_t v25 = 0;
  }
  id obja = -[NSDictionary objectForKey:](-[NSManagedObjectModel entitiesByName](self->_dstModel, "entitiesByName"), "objectForKey:", [v54 destinationEntityName]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v26 = (void *)[v54 relationshipMappings];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v71;
    uint64_t v53 = *(void *)v71;
    v55 = v26;
    do
    {
      uint64_t v30 = 0;
      uint64_t v59 = v28;
      do
      {
        if (*(void *)v71 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v70 + 1) + 8 * v30);
        if (v31) {
          v32 = (void *)v31[3];
        }
        else {
          v32 = 0;
        }
        uint64_t v33 = [v31 name];
        uint64_t v34 = [v32 objectAtIndex:0];
        if (v34) {
          v35 = *(void **)(v34 + 8);
        }
        else {
          v35 = 0;
        }
        if ([v35 expressionType] == 3)
        {
          id v69 = 0;
          v36 = objc_msgSend(a3, "objectForKey:", objc_msgSend(v35, "keyPath"));
          id v69 = v36;
          if (v36)
          {
            if ((objc_msgSend(v36, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
            {
              uint64_t v61 = v33;
              uint64_t v63 = v30;
              if ([v69 isNSArray]) {
                id v37 = v69;
              }
              else {
                id v69 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v69 count:1];
              }
              id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
              v39 = objc_msgSend(v38, "initWithCapacity:", objc_msgSend(v69, "count"));
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              id v40 = v69;
              uint64_t v41 = [v69 countByEnumeratingWithState:&v65 objects:v82 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v66;
                do
                {
                  uint64_t v44 = 0;
                  do
                  {
                    if (*(void *)v66 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    if (a5) {
                      v45 = (void *)-[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](*((void *)a5 + 2), *(void **)(*((void *)&v65 + 1) + 8 * v44));
                    }
                    else {
                      v45 = 0;
                    }
                    uint64_t v46 = -[PFUbiquityTransactionLogMigrator createDestinationGlobalObjectIDFromSourceGlobalObjectID:]((uint64_t)self, v45);
                    if (v46)
                    {
                      SEL v47 = (void *)v46;
                      objc_msgSend(v39, "addObject:", -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](v25, v46));
                    }
                    ++v44;
                  }
                  while (v42 != v44);
                  uint64_t v48 = [v40 countByEnumeratingWithState:&v65 objects:v82 count:16];
                  uint64_t v42 = v48;
                }
                while (v48);
              }

              char v49 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(obja, "propertiesByName"), "objectForKey:", v61), "isToMany");
              uint64_t v50 = (uint64_t)v39;
              uint64_t v29 = v53;
              v26 = v55;
              uint64_t v28 = v59;
              uint64_t v30 = v63;
              if (v49)
              {
LABEL_68:
                [v8 setObject:v50 forKey:v61];
              }
              else if (objc_msgSend(v39, "count", v39) == 1)
              {
                uint64_t v50 = [v39 objectAtIndex:0];
                goto LABEL_68;
              }
            }
          }
        }
        ++v30;
      }
      while (v30 != v28);
      uint64_t v51 = [v26 countByEnumeratingWithState:&v70 objects:v83 count:16];
      uint64_t v28 = v51;
    }
    while (v51);
  }
  return v8;
}

- (id)createDestinationObjectsFromSourceObjects:(id)a3 migrationContext:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = v7;
  if (a4) {
    uint64_t v9 = *((void *)a4 + 3);
  }
  else {
    uint64_t v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__PFUbiquityTransactionLogMigrator_createDestinationObjectsFromSourceObjects_migrationContext___block_invoke;
  v11[3] = &unk_1E544DE70;
  v11[4] = a4;
  v11[5] = self;
  v11[6] = v9;
  v11[7] = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  return v8;
}

void __95__PFUbiquityTransactionLogMigrator_createDestinationObjectsFromSourceObjects_migrationContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](*(void *)(v5 + 16), a2);
    id v7 = (void *)v6;
    if (v6)
    {
      uint64_t v8 = *(void *)(v6 + 16);
      goto LABEL_4;
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = 0;
LABEL_4:
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v8];
  if (v9)
  {
    id v12 = (id)[*(id *)(a1 + 40) createDestinationObjectContentFromSourceObjectContent:a3 withEntityMapping:v9 migrationContext:*(void *)(a1 + 32)];
    uint64_t v10 = (void *)-[PFUbiquityTransactionLogMigrator createDestinationGlobalObjectIDFromSourceGlobalObjectID:](*(void *)(a1 + 40), v7);
    uint64_t v11 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](*(void *)(a1 + 48), (uint64_t)v10);

    [*(id *)(a1 + 56) setObject:v12 forKey:v11];
  }
}

@end