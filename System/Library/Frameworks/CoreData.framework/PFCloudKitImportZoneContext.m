@interface PFCloudKitImportZoneContext
- (BOOL)linkInsertedObjectsAndMetadataInContext:(uint64_t *)a3 error:;
- (BOOL)populateUnresolvedIDsInStore:(void *)a3 withManagedObjectContext:(void *)a4 error:;
- (PFCloudKitImportZoneContext)initWithUpdatedRecords:(id)a3 deletedRecordTypeToRecordIDs:(id)a4 options:(id)a5 fileBackedFuturesDirectory:(id)a6;
- (uint64_t)addMirroredRelationshipToLink:(uint64_t)result;
- (uint64_t)addObjectID:(void *)a3 toCache:(uint64_t)a4 andRecordID:;
- (uint64_t)initializeCachesWithManagedObjectContext:(void *)a3 andObservedStore:(id *)a4 error:;
- (void)addObjectID:(void *)a3 toCache:(uint64_t)a4 forRecordWithType:(uint64_t)a5 andUniqueIdentifier:;
- (void)addUnresolvedRecordID:(uint64_t)a1 forRecordType:(uint64_t)a2 toCache:(void *)a3;
- (void)dealloc;
- (void)registerObject:(void *)a3 forInsertedRecord:(void *)a4 withMetadata:;
@end

@implementation PFCloudKitImportZoneContext

- (PFCloudKitImportZoneContext)initWithUpdatedRecords:(id)a3 deletedRecordTypeToRecordIDs:(id)a4 options:(id)a5 fileBackedFuturesDirectory:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)PFCloudKitImportZoneContext;
  v10 = [(PFCloudKitImportZoneContext *)&v12 init];
  if (v10)
  {
    v10->_updatedRecords = (NSArray *)a3;
    v10->_deletedRecordTypeToRecordID = (NSDictionary *)a4;
    v10->_recordTypeToUnresolvedRecordIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a5;
    if (a6 && [a6 length]) {
      v10->_fileBackedFuturesDirectory = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a6];
    }
    v10->_metadatasToLink = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v10;
}

- (void)dealloc
{
  self->_updatedRecords = 0;
  self->_deletedRecordTypeToRecordID = 0;

  self->_deletedObjectIDs = 0;
  self->_deletedMirroredRelationshipRecordIDs = 0;

  self->_modifiedRecords = 0;
  self->_updatedRelationships = 0;

  self->_deletedRelationships = 0;
  self->_recordTypeToRecordIDToObjectID = 0;

  self->_recordTypeToUnresolvedRecordIDs = 0;
  self->_importOperations = 0;

  self->_mirroringOptions = 0;
  self->_fileBackedFuturesDirectory = 0;

  self->_metadatasToLink = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImportZoneContext;
  [(PFCloudKitImportZoneContext *)&v3 dealloc];
}

- (uint64_t)initializeCachesWithManagedObjectContext:(void *)a3 andObservedStore:(id *)a4 error:
{
  uint64_t v302 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v288 = 0;
  id v221 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v247 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v244 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v220 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v219 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v232 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v233 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v238 = a2;
  id v245 = (id)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  id v248 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v235 = a3;
  if ([a3 configurationName]) {
    v6 = objc_msgSend(v245, "entitiesForConfiguration:", objc_msgSend(a3, "configurationName"));
  }
  else {
    v6 = objc_msgSend((id)objc_msgSend(v245, "entitiesByName"), "allValues");
  }
  v7 = v6;
  long long v286 = 0u;
  long long v287 = 0u;
  long long v284 = 0u;
  long long v285 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v284 objects:v301 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v285;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v285 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v248, "addObject:", objc_msgSend(*(id *)(*((void *)&v284 + 1) + 8 * i), "name"));
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v284 objects:v301 count:16];
    }
    while (v8);
  }
  long long v282 = 0u;
  long long v283 = 0u;
  long long v280 = 0u;
  long long v281 = 0u;
  obuint64_t j = *(id *)(a1 + 8);
  uint64_t v11 = [obj countByEnumeratingWithState:&v280 objects:v300 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v281;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v281 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v280 + 1) + 8 * j);
        v15 = (void *)MEMORY[0x18C127630]();
        v16 = (void *)[v14 recordType];
        v17 = (void *)[v14 recordType];
        if ([v17 hasPrefix:@"CD_"]) {
          v17 = (void *)[v17 substringFromIndex:objc_msgSend(@"CD_", "length")];
        }
        if (([v16 hasPrefix:@"CD_M2M_"] & 1) != 0
          || [v16 isEqualToString:@"CDMR"])
        {
          v18 = (void *)MEMORY[0x18C127630]();
          unint64_t v19 = __ckLoggingOverride;
          uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Updating relationship described by record: %@"];
          if (v19 >= 9) {
            uint64_t v27 = 9;
          }
          else {
            uint64_t v27 = v19;
          }
          _NSCoreDataLog(v27, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          uint64_t v28 = (uint64_t)v14;
          if ([*(id *)(a1 + 96) useDeviceToDeviceEncryption]) {
            uint64_t v28 = [v14 encryptedValues];
          }
          if (!+[PFMirroredRelationship isValidMirroredRelationshipRecord:v14 values:v28])
          {
            v32 = (void *)MEMORY[0x18C127630]();
            unint64_t v33 = __ckLoggingOverride;
            uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Skipping invalid mirrored relationship record: %@"];
            if (v33 >= 3) {
              uint64_t v41 = 3;
            }
            else {
              uint64_t v41 = v33;
            }
LABEL_47:
            _NSCoreDataLog(v41, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
            goto LABEL_48;
          }
          v29 = +[PFMirroredRelationship mirroredRelationshipWithManyToManyRecord:values:andManagedObjectModel:]((uint64_t)PFMirroredRelationship, v14, v28, (uint64_t)v245);
          v30 = v29;
          if (v29)
          {
            if (v29->super._relationshipDescription && v29->super._inverseRelationshipDescription)
            {
              [v220 addObject:v29];
              v31 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](v30);
              v279[0] = MEMORY[0x1E4F143A8];
              v279[1] = 3221225472;
              v279[2] = __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke;
              v279[3] = &unk_1E544B9D8;
              v279[4] = v248;
              v279[5] = v247;
              v279[6] = a1;
              v279[7] = v14;
              [v31 enumerateKeysAndObjectsUsingBlock:v279];
              goto LABEL_48;
            }
            v43 = (void *)MEMORY[0x18C127630]();
            unint64_t v44 = __ckLoggingOverride;
            uint64_t v45 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping mirrored relationship for unknown relationships: %@"];
            if (v44 >= 0x10) {
              uint64_t v52 = 16;
            }
            else {
              uint64_t v52 = v44;
            }
            _NSCoreDataLog(v52, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          }
          else
          {
            v43 = (void *)MEMORY[0x18C127630]();
            uint64_t v53 = __ckLoggingOverride;
            uint64_t v54 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to serialize many to many relationship from record: %@"];
            _NSCoreDataLog(v53 != 0, v54, v55, v56, v57, v58, v59, v60, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
          }
        }
        else
        {
          if (![v248 containsObject:v17])
          {
            v32 = (void *)MEMORY[0x18C127630]();
            unint64_t v61 = __ckLoggingOverride;
            uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown updated record: %@\nIt is not a part of: %@"];
            if (v61 >= 3) {
              uint64_t v41 = 3;
            }
            else {
              uint64_t v41 = v61;
            }
            goto LABEL_47;
          }
          id v42 = (id)[v247 objectForKey:v16];
          if (!v42)
          {
            id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v247 setObject:v42 forKey:v16];
          }
          [v221 addObject:v14];
          objc_msgSend(v42, "addObject:", objc_msgSend(v14, "recordID"));
        }
LABEL_48:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v280 objects:v300 count:16];
    }
    while (v11);
  }
  long long v277 = 0u;
  long long v278 = 0u;
  long long v275 = 0u;
  long long v276 = 0u;
  id v222 = *(id *)(a1 + 16);
  uint64_t v62 = [v222 countByEnumeratingWithState:&v275 objects:v299 count:16];
  if (!v62)
  {
    char v223 = 1;
    uint64_t v121 = (uint64_t)v235;
    goto LABEL_124;
  }
  char v223 = 1;
  id v224 = *(id *)v276;
  do
  {
    uint64_t v63 = 0;
    uint64_t v226 = v62;
    do
    {
      if (*(id *)v276 != v224) {
        objc_enumerationMutation(v222);
      }
      uint64_t v230 = v63;
      v64 = *(void **)(*((void *)&v275 + 1) + 8 * v63);
      context = (void *)MEMORY[0x18C127630]();
      id obja = (id)[*(id *)(a1 + 16) objectForKey:v64];
      id v236 = v64;
      if ([v64 hasPrefix:@"CD_"]) {
        id v236 = (id)[v64 substringFromIndex:objc_msgSend(@"CD_", "length")];
      }
      long long v273 = 0u;
      long long v274 = 0u;
      long long v271 = 0u;
      long long v272 = 0u;
      uint64_t v65 = [obja countByEnumeratingWithState:&v271 objects:v298 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v272;
        do
        {
          uint64_t v67 = 0;
          do
          {
            if (*(void *)v272 != v66) {
              objc_enumerationMutation(obja);
            }
            v68 = *(void **)(*((void *)&v271 + 1) + 8 * v67);
            v69 = (void *)MEMORY[0x18C127630]();
            unint64_t v70 = __ckLoggingOverride;
            uint64_t v71 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleting record with id (%@): %@"];
            if (v70 >= 9) {
              uint64_t v78 = 9;
            }
            else {
              uint64_t v78 = v70;
            }
            _NSCoreDataLog(v78, v71, v72, v73, v74, v75, v76, v77, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
            if ([v64 hasPrefix:@"CD_M2M_"])
            {
              v79 = +[PFMirroredRelationship mirroredRelationshipWithDeletedRecordType:recordID:andManagedObjectModel:]((uint64_t)PFMirroredRelationship, (uint64_t)v64, (uint64_t)v68, (uint64_t)v245);
              [v244 addObject:v79];
              v80 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](v79);
              v270[0] = MEMORY[0x1E4F143A8];
              v270[1] = 3221225472;
              v270[2] = __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_2;
              v270[3] = &unk_1E544B9D8;
              v270[4] = v248;
              v270[5] = v247;
              v270[6] = a1;
              v270[7] = v68;
              [v80 enumerateKeysAndObjectsUsingBlock:v270];
              goto LABEL_106;
            }
            if ([v64 isEqualToString:@"CDMR"])
            {
              v81 = (void *)+[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingPredicate:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"ckRecordID", objc_msgSend(v68, "recordName"), v64, v68], (uint64_t)v235, v238, (uint64_t)&v288);
              if (!v81)
              {
                v111 = (void *)MEMORY[0x18C127630]();
                uint64_t v112 = __ckLoggingOverride;
                uint64_t v113 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Import context failed to fetch mirrored relationships during import: %@"];
                _NSCoreDataLog(v112 != 0, v113, v114, v115, v116, v117, v118, v119, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
                char v223 = 0;
                id v120 = v288;
                goto LABEL_117;
              }
              v82 = (void *)[v81 lastObject];
              v83 = v82;
              if (!v82)
              {
                v98 = (void *)MEMORY[0x18C127630]();
                unint64_t v99 = __ckLoggingOverride;
                uint64_t v100 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping mirrored relationship with record id (not found locally): %@"];
                if (v99 >= 9) {
                  uint64_t v107 = 9;
                }
                else {
                  uint64_t v107 = v99;
                }
                goto LABEL_105;
              }
              [v82 setNeedsDelete:MEMORY[0x1E4F1CC38]];
              [v83 setIsUploaded:MEMORY[0x1E4F1CC38]];
              if (!objc_msgSend(v248, "containsObject:", objc_msgSend(v83, "cdEntityName")))
              {
                v98 = (void *)MEMORY[0x18C127630]();
                unint64_t v108 = __ckLoggingOverride;
                uint64_t v100 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown deleted relationship recordID: %@ - %@"];
                if (v108 >= 3) {
                  uint64_t v107 = 3;
                }
                else {
                  uint64_t v107 = v108;
                }
LABEL_105:
                _NSCoreDataLog(v107, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
                goto LABEL_106;
              }
              v84 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v245, "entitiesByName"), "objectForKey:", objc_msgSend(v83, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v83, "relationshipName"));
              v85 = -[NSCKMirroredRelationship createRecordIDForRecord](v83);
              v86 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v83);
              v87 = -[PFMirroredManyToManyRelationshipV2 initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:]([PFMirroredManyToManyRelationshipV2 alloc], "initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:", v68, v85, v86, v84, [v84 inverseRelationship], 1);
              [v244 addObject:v87];
              if (v87) {
                relationshipDescriptiouint64_t n = v87->super._relationshipDescription;
              }
              else {
                relationshipDescriptiouint64_t n = 0;
              }
              id v89 = (id)objc_msgSend(v247, "objectForKey:", -[NSEntityDescription name](-[NSPropertyDescription entity](relationshipDescription, "entity"), "name"));
              if (!v89)
              {
                id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                if (v87) {
                  v90 = v87->super._relationshipDescription;
                }
                else {
                  v90 = 0;
                }
                objc_msgSend(v247, "setObject:forKey:", v89, -[NSEntityDescription name](-[NSPropertyDescription entity](v90, "entity"), "name"));
              }
              if (v87) {
                ckRecordID = v87->super._ckRecordID;
              }
              else {
                ckRecordID = 0;
              }
              [v89 addObject:ckRecordID];

              if (v87) {
                inverseRelationshipDescriptiouint64_t n = v87->super._inverseRelationshipDescription;
              }
              else {
                inverseRelationshipDescriptiouint64_t n = 0;
              }
              id v93 = (id)objc_msgSend(v247, "objectForKey:", -[NSEntityDescription name](-[NSPropertyDescription entity](inverseRelationshipDescription, "entity"), "name"));
              if (!v93)
              {
                id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                if (v87) {
                  v94 = v87->super._inverseRelationshipDescription;
                }
                else {
                  v94 = 0;
                }
                objc_msgSend(v247, "setObject:forKey:", v93, -[NSEntityDescription name](-[NSPropertyDescription entity](v94, "entity"), "name"));
              }
              if (v87) {
                relatedCKRecordID = v87->super._relatedCKRecordID;
              }
              else {
                relatedCKRecordID = 0;
              }
              [v93 addObject:relatedCKRecordID];
            }
            else
            {
              if (![v248 containsObject:v236])
              {
                if ([v64 isEqualToString:getCloudKitCKRecordTypeShare()])
                {
                  [v232 addObject:v68];
                  goto LABEL_106;
                }
                v98 = (void *)MEMORY[0x18C127630]();
                unint64_t v109 = __ckLoggingOverride;
                uint64_t v100 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown deleted record: %@ - %@"];
                if (v109 >= 3) {
                  uint64_t v107 = 3;
                }
                else {
                  uint64_t v107 = v109;
                }
                goto LABEL_105;
              }
              id v96 = (id)[v247 objectForKey:v64];
              if (!v96)
              {
                id v96 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v247 setObject:v96 forKey:v64];
              }
              [v96 addObject:v68];

              id v97 = (id)[v233 objectForKey:v64];
              if (!v97)
              {
                id v97 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                [v233 setObject:v97 forKey:v64];
              }
              [v97 addObject:v68];
            }
LABEL_106:
            ++v67;
          }
          while (v65 != v67);
          uint64_t v110 = [obja countByEnumeratingWithState:&v271 objects:v298 count:16];
          uint64_t v65 = v110;
        }
        while (v110);
      }
LABEL_117:
      uint64_t v63 = v230 + 1;
    }
    while (v230 + 1 != v226);
    uint64_t v62 = [v222 countByEnumeratingWithState:&v275 objects:v299 count:16];
  }
  while (v62);
  uint64_t v121 = (uint64_t)v235;
  if ((v223 & 1) == 0)
  {
    id v122 = v288;
    id v123 = v288;
    if (v288)
    {
      v124 = a4;
      if (a4)
      {
        id objb = 0;
        id v234 = 0;
        goto LABEL_160;
      }
    }
    else
    {
      uint64_t v198 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v198, v199, v200, v201, v202, v203, v204, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
      v205 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v290 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        __int16 v291 = 1024;
        int v292 = 448;
        _os_log_fault_impl(&dword_18AB82000, v205, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id objb = 0;
    id v234 = 0;
    goto LABEL_207;
  }
LABEL_124:
  id v125 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, *(void **)(a1 + 8), MEMORY[0x1E4F1CBF0], v121, v238, &v288);
  v126 = v125;
  if (!v125)
  {
    id v123 = v288;
    if (v288)
    {
      v124 = a4;
      if (a4)
      {
        id objb = 0;
        id v234 = 0;
        char v223 = 0;
LABEL_160:
        id *v124 = v123;
        goto LABEL_207;
      }
    }
    else
    {
      uint64_t v190 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v190, v191, v192, v193, v194, v195, v196, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
      v197 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v290 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        __int16 v291 = 1024;
        int v292 = 444;
        _os_log_fault_impl(&dword_18AB82000, v197, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    id objb = 0;
    id v234 = 0;
    char v223 = 0;
    goto LABEL_207;
  }
  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  uint64_t v127 = [v125 countByEnumeratingWithState:&v266 objects:v297 count:16];
  if (v127)
  {
    uint64_t v128 = *(void *)v267;
    do
    {
      for (uint64_t k = 0; k != v127; ++k)
      {
        if (*(void *)v267 != v128) {
          objc_enumerationMutation(v126);
        }
        v130 = *(void **)(*((void *)&v266 + 1) + 8 * k);
        v131 = (void *)MEMORY[0x18C127630]();
        v132 = -[NSCKMirroredRelationship createRecordIDForRecord](v130);
        v133 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v130);
        id v134 = (id)objc_msgSend(v247, "objectForKey:", objc_msgSend(v130, "cdEntityName"));
        if (!v134)
        {
          id v134 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_msgSend(v247, "setObject:forKey:", v134, objc_msgSend(v130, "cdEntityName"));
        }
        [v134 addObject:v132];

        id v135 = (id)objc_msgSend(v247, "objectForKey:", objc_msgSend(v130, "relatedEntityName"));
        if (!v135)
        {
          id v135 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_msgSend(v247, "setObject:forKey:", v135, objc_msgSend(v130, "relatedEntityName"));
        }
        [v135 addObject:v133];
      }
      uint64_t v127 = [v126 countByEnumeratingWithState:&v266 objects:v297 count:16];
    }
    while (v127);
  }
  id objb = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v264 = 0u;
  long long v265 = 0u;
  long long v262 = 0u;
  long long v263 = 0u;
  id v234 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(v247, "allKeys"));
  uint64_t v136 = [v234 countByEnumeratingWithState:&v262 objects:v296 count:16];
  if (v136)
  {
    uint64_t v137 = *(void *)v263;
    p_info = &OBJC_METACLASS___PFCloudKitSizeMetric.info;
    v139 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_138:
    uint64_t v140 = 0;
    uint64_t v239 = v136;
    while (1)
    {
      if (*(void *)v263 != v137) {
        objc_enumerationMutation(v234);
      }
      v141 = (void *)[v247 objectForKey:*(void *)(*((void *)&v262 + 1) + 8 * v140)];
      v142 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)(p_info + 331), v139, v141, v235, v238, &v288);
      if (v142)
      {
        long long v260 = 0u;
        long long v261 = 0u;
        long long v258 = 0u;
        long long v259 = 0u;
        uint64_t v143 = [v141 countByEnumeratingWithState:&v258 objects:v295 count:16];
        if (v143)
        {
          uint64_t v144 = v137;
          v145 = p_info;
          uint64_t v146 = *(void *)v259;
          do
          {
            for (uint64_t m = 0; m != v143; ++m)
            {
              if (*(void *)v259 != v146) {
                objc_enumerationMutation(v141);
              }
              uint64_t v148 = *(void *)(*((void *)&v258 + 1) + 8 * m);
              v149 = (void *)[v142 objectForKey:v148];
              if (v149)
              {
                v150 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v149);
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](a1, v150, objb, v148);
              }
            }
            uint64_t v143 = [v141 countByEnumeratingWithState:&v258 objects:v295 count:16];
          }
          while (v143);
          p_info = v145;
          uint64_t v137 = v144;
          uint64_t v136 = v239;
          v139 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
      else
      {
        char v223 = 0;
        id v151 = v288;
      }

      if ((v223 & 1) == 0) {
        break;
      }
      if (++v140 == v136)
      {
        uint64_t v136 = [v234 countByEnumeratingWithState:&v262 objects:v296 count:16];
        if (v136) {
          goto LABEL_138;
        }
        goto LABEL_162;
      }
    }
  }
  else if (v223)
  {
LABEL_162:
    id v152 = (id)+[NSCKImportOperation fetchUnfinishedImportOperationsInStore:withManagedObjectContext:error:]((uint64_t)NSCKImportOperation, (uint64_t)v235, v238, (uint64_t)&v288);
    *(void *)(a1 + 88) = v152;
    if (v152)
    {
      long long v256 = 0u;
      long long v257 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      id v225 = v152;
      uint64_t v153 = [v152 countByEnumeratingWithState:&v254 objects:v294 count:16];
      if (v153)
      {
        uint64_t v227 = *(void *)v255;
        do
        {
          uint64_t v154 = 0;
          contexta = (void *)v153;
          do
          {
            if (*(void *)v255 != v227) {
              objc_enumerationMutation(v225);
            }
            uint64_t v231 = v154;
            v155 = *(void **)(*((void *)&v254 + 1) + 8 * v154);
            long long v250 = 0u;
            long long v251 = 0u;
            long long v252 = 0u;
            long long v253 = 0u;
            v156 = (void *)[v155 pendingRelationships];
            uint64_t v157 = [v156 countByEnumeratingWithState:&v250 objects:v293 count:16];
            if (v157)
            {
              uint64_t v240 = *(void *)v251;
              id v237 = v156;
              do
              {
                for (uint64_t n = 0; n != v157; ++n)
                {
                  if (*(void *)v251 != v240) {
                    objc_enumerationMutation(v237);
                  }
                  v159 = *(void **)(*((void *)&v250 + 1) + 8 * n);
                  uint64_t v160 = objc_msgSend((id)objc_msgSend(v245, "entitiesByName"), "objectForKey:", objc_msgSend(v159, "cdEntityName"));
                  uint64_t v161 = objc_msgSend((id)objc_msgSend(v245, "entitiesByName"), "objectForKey:", objc_msgSend(v159, "relatedEntityName"));
                  if (v160) {
                    BOOL v162 = v161 == 0;
                  }
                  else {
                    BOOL v162 = 1;
                  }
                  if (v162)
                  {
                    v163 = (void *)MEMORY[0x18C127630](v161);
                    unint64_t v164 = __ckLoggingOverride;
                    uint64_t v165 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleting pending relationship because it's entities are no longer in the model: %@"];
                    if (v164 >= 0x10) {
                      uint64_t v172 = 16;
                    }
                    else {
                      uint64_t v172 = v164;
                    }
                    _NSCoreDataLog(v172, v165, v166, v167, v168, v169, v170, v171, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]");
                    [v238 deleteObject:v159];
                  }
                  else
                  {
                    uint64_t v173 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, v160);
                    v174 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v159, "recordZoneName"), objc_msgSend(v159, "recordZoneOwnerName"));
                    v175 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v159, "recordName"), v174);
                    v176 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v159, "relatedRecordZoneName"), objc_msgSend(v159, "relatedRecordZoneOwnerName"));
                    v177 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v159, "relatedRecordName"), v176);
                    char v178 = [v174 isEqual:v176];
                    if ((v178 & 1) == 0)
                    {
                      uint64_t v179 = [NSString stringWithUTF8String:"Import is attempting to link objects across zones: %@"];
                      _NSCoreDataLog(17, v179, v180, v181, v182, v183, v184, v185, (uint64_t)v159);
                      v186 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v290 = (const char *)v159;
                        _os_log_fault_impl(&dword_18AB82000, v186, OS_LOG_TYPE_FAULT, "CoreData: Import is attempting to link objects across zones: %@", buf, 0xCu);
                      }
                    }
                    -[PFCloudKitImportZoneContext addUnresolvedRecordID:forRecordType:toCache:]((uint64_t)v175, v173, *(void **)(a1 + 72));
                    uint64_t v187 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, objc_msgSend((id)objc_msgSend(v245, "entitiesByName"), "objectForKey:", objc_msgSend(v159, "relatedEntityName")));
                    -[PFCloudKitImportZoneContext addUnresolvedRecordID:forRecordType:toCache:]((uint64_t)v177, v187, *(void **)(a1 + 72));
                    if ((objc_msgSend((id)objc_msgSend(v233, "objectForKey:", v173), "containsObject:", v175) & 1) != 0
                      || objc_msgSend((id)objc_msgSend(v233, "objectForKey:", v187), "containsObject:", v177))
                    {
                      [v238 deleteObject:v159];
                    }
                  }
                }
                uint64_t v157 = [v237 countByEnumeratingWithState:&v250 objects:v293 count:16];
              }
              while (v157);
            }
            uint64_t v154 = v231 + 1;
          }
          while ((void *)(v231 + 1) != contexta);
          uint64_t v153 = [v225 countByEnumeratingWithState:&v254 objects:v294 count:16];
        }
        while (v153);
      }
      *(void *)(a1 + 64) = objb;
      *(void *)(a1 + 32) = [v221 copy];
      *(void *)(a1 + 48) = [v244 copy];
      *(void *)(a1 + 56) = [v219 copy];
      *(void *)(a1 + 40) = v220;
      *(void *)(a1 + 112) = [v232 copy];
      id v188 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v189 = *(void **)(a1 + 16);
      v249[0] = MEMORY[0x1E4F143A8];
      v249[1] = 3221225472;
      v249[2] = __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_61;
      v249[3] = &unk_1E544BA00;
      v249[4] = a1;
      v249[5] = v188;
      [v189 enumerateKeysAndObjectsUsingBlock:v249];
      *(void *)(a1 + 24) = [v188 copy];

      goto LABEL_207;
    }
    id v206 = v288;
    char v223 = 0;
  }
  if (v288)
  {
    if (a4) {
      *a4 = v288;
    }
  }
  else
  {
    uint64_t v207 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v207, v208, v209, v210, v211, v212, v213, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
    v214 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v290 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
      __int16 v291 = 1024;
      int v292 = 439;
      _os_log_fault_impl(&dword_18AB82000, v214, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  id v215 = v288;
LABEL_207:
  uint64_t v216 = v223 & 1;

  return v216;
}

void __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v6 = (id)[*(id *)(a1 + 40) objectForKey:a2];
    if (!v6)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 40) setObject:v16 forKey:a2];
      id v6 = v16;
    }
    id v17 = v6;
    [v6 addObjectsFromArray:a3];
  }
  else
  {
    v7 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 3) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = __ckLoggingOverride;
    }
    uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown updated relationship record: %@"];
    _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]_block_invoke");
  }
}

void __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v6 = (id)[*(id *)(a1 + 40) objectForKey:a2];
    if (!v6)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 40) setObject:v16 forKey:a2];
      id v6 = v16;
    }
    id v17 = v6;
    [v6 addObjectsFromArray:a3];
  }
  else
  {
    v7 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 3) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = __ckLoggingOverride;
    }
    uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Skipping unknown deleted relationship recordID: %@ - %@"];
    _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]_block_invoke_2");
  }
}

- (uint64_t)addObjectID:(void *)a3 toCache:(uint64_t)a4 andRecordID:
{
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = (void *)[a2 entity];
    uint64_t v9 = [v8 name];
    do
    {
      -[PFCloudKitImportZoneContext addObjectID:toCache:forRecordWithType:andUniqueIdentifier:](v7, (uint64_t)a2, a3, v9, a4);
      uint64_t v8 = (void *)[v8 superentity];
      result = [v8 name];
      uint64_t v9 = result;
    }
    while (result);
  }
  return result;
}

- (void)addUnresolvedRecordID:(uint64_t)a1 forRecordType:(uint64_t)a2 toCache:(void *)a3
{
  id v6 = (id)[a3 objectForKey:a2];
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [a3 setObject:v7 forKey:a2];
    id v6 = v7;
  }
  id v8 = v6;
  [v6 addObject:a1];
}

uint64_t __95__PFCloudKitImportZoneContext_initializeCachesWithManagedObjectContext_andObservedStore_error___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  v4 = a2;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a2 hasPrefix:@"CD_"]) {
    v4 = (void *)[v4 substringFromIndex:objc_msgSend(@"CD_", "length")];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:", v4), "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9));
        if (v10) {
          [*(id *)(a1 + 40) addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)registerObject:(void *)a3 forInsertedRecord:(void *)a4 withMetadata:
{
  if (a1)
  {
    -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](a1, (void *)[a2 objectID], *(void **)(a1 + 64), objc_msgSend(a3, "recordID"));
    uint64_t v7 = [_PFCKInsertedMetadataLink alloc];
    if (v7
      && (v18.receiver = v7,
          v18.super_class = (Class)_PFCKInsertedMetadataLink,
          (id v17 = objc_msgSendSuper2(&v18, sel_init)) != 0))
    {
      v17[2] = a2;
      v17[1] = a4;
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v8 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 9) {
      uint64_t v9 = 9;
    }
    else {
      uint64_t v9 = __ckLoggingOverride;
    }
    uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Linking %@ to %@"];
    [a2 objectID];
    _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImportZoneContext registerObject:forInsertedRecord:withMetadata:]");
    [*(id *)(a1 + 80) addObject:v17];
  }
}

- (uint64_t)addMirroredRelationshipToLink:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 40) addObject:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = -[PFMirroredOneToManyRelationship recordTypesToRecordIDs](a2);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke;
      uint64_t v14 = &unk_1E544BA28;
      uint64_t v15 = v3;
      v5 = &v11;
    }
    else
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if ((result & 1) == 0) {
        return result;
      }
      v4 = -[PFMirroredManyToManyRelationship recordTypeToRecordID](a2);
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      uint64_t v8 = __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke_2;
      uint64_t v9 = &unk_1E544BA28;
      uint64_t v10 = v3;
      v5 = &v6;
    }
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return result;
}

uint64_t __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:", a2), "objectForKey:", v10))
        {
          id v11 = (id)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:a2];
          if (!v11)
          {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [*(id *)(*(void *)(a1 + 32) + 72) setObject:v11 forKey:a2];
          }
          [v11 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __61__PFCloudKitImportZoneContext_addMirroredRelationshipToLink___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:", a2), "objectForKey:", v10))
        {
          id v11 = (id)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:a2];
          if (!v11)
          {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [*(id *)(*(void *)(a1 + 32) + 72) setObject:v11 forKey:a2];
          }
          [v11 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)populateUnresolvedIDsInStore:(void *)a3 withManagedObjectContext:(void *)a4 error:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  objc_super v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__4;
  uint64_t v21 = __Block_byref_object_dispose__4;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__PFCloudKitImportZoneContext_populateUnresolvedIDsInStore_withManagedObjectContext_error___block_invoke;
  v16[3] = &unk_1E544BA50;
  v16[4] = a1;
  v16[5] = a2;
  v16[6] = a3;
  v16[7] = &v17;
  v16[8] = &v23;
  [a3 performBlockAndWait:v16];
  if (!*((unsigned char *)v24 + 24))
  {
    id v7 = (id)v18[5];
    if (v7)
    {
      if (a4) {
        *a4 = v7;
      }
    }
    else
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
      long long v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        __int16 v29 = 1024;
        int v30 = 590;
        _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v18[5] = 0;
  BOOL v5 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v5;
}

void __91__PFCloudKitImportZoneContext_populateUnresolvedIDsInStore_withManagedObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 9) {
    uint64_t v3 = 9;
  }
  else {
    uint64_t v3 = __ckLoggingOverride;
  }
  uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Populating unresolved relationships:\n%@"];
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitImportZoneContext populateUnresolvedIDsInStore:withManagedObjectContext:error:]_block_invoke");
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "allKeys"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v12)
  {
    uint64_t v29 = *(void *)v35;
LABEL_6:
    uint64_t v13 = 0;
    uint64_t v28 = v12;
    while (1)
    {
      if (*(void *)v35 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * v13);
      long long v15 = (void *)MEMORY[0x18C127630]();
      uint64_t v16 = (void *)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v14];
      uint64_t v17 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, MEMORY[0x1E4F1CBF0], v16, *(void **)(a1 + 40), *(void **)(a1 + 48), (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      if (v17)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v22 = (void *)[v17 objectForKey:v21];
              uint64_t v23 = v22;
              if (v22 && ([v22 isInserted] & 1) == 0)
              {
                uint64_t v24 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v23);
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](*(void *)(a1 + 32), v24, *(void **)(*(void *)(a1 + 32) + 64), v21);
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v18);
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        id v25 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }

      int v26 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if (!v26) {
        break;
      }
      if (++v13 == v28)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (void)addObjectID:(void *)a3 toCache:(uint64_t)a4 forRecordWithType:(uint64_t)a5 andUniqueIdentifier:
{
  if (a1)
  {
    id v9 = (id)[a3 objectForKey:a4];
    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [a3 setObject:v10 forKey:a4];
      id v9 = v10;
    }
    id v11 = v9;
    [v9 setObject:a2 forKey:a5];
  }
}

- (BOOL)linkInsertedObjectsAndMetadataInContext:(uint64_t *)a3 error:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v49 = 0;
    if (!objc_msgSend(a2, "obtainPermanentIDsForObjects:error:", objc_msgSend((id)objc_msgSend(a2, "insertedObjects"), "allObjects"), &v49))goto LABEL_31; {
    uint64_t v41 = a3;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = *(id *)(v5 + 80);
    uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v46;
      uint64_t v43 = *MEMORY[0x1E4F281F8];
      uint64_t v42 = *MEMORY[0x1E4F28588];
      char v9 = 1;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * v10);
          if (v11) {
            uint64_t v12 = *(void **)(v11 + 16);
          }
          else {
            uint64_t v12 = 0;
          }
          uint64_t v13 = (char *)[v12 objectID];
          if ([v13 isTemporaryID])
          {
            uint64_t v14 = [NSString stringWithUTF8String:"Found temporary objectID for metadata link: %@\n%@\n%@\n%@"];
            [a2 insertedObjects];
            uint64_t v40 = v49;
            _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
            uint64_t v21 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v30 = [a2 insertedObjects];
              *(_DWORD *)buf = 138413058;
              uint64_t v53 = v13;
              __int16 v54 = 2112;
              uint64_t v55 = v11;
              __int16 v56 = 2112;
              uint64_t v57 = v30;
              __int16 v58 = 2112;
              uint64_t v59 = v49;
              _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Found temporary objectID for metadata link: %@\n%@\n%@\n%@", buf, 0x2Au);
            }
            uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v50 = v42;
            uint64_t v51 = [NSString stringWithFormat:@"Found temporary objectID for metadata link: %@\n%@\n%@", v13, v11, objc_msgSend(a2, "insertedObjects"), v40];
            char v9 = 0;
            uint64_t v49 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v43, 134410, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
          }
          else
          {
            uint64_t v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
            if (v11) {
              uint64_t v24 = *(void **)(v11 + 8);
            }
            else {
              uint64_t v24 = 0;
            }
            [v24 setEntityPK:v23];
            uint64_t v25 = _sqlEntityForEntityDescription(objc_msgSend((id)objc_msgSend(v13, "persistentStore"), "model"), objc_msgSend(v13, "entity"));
            if (v25) {
              uint64_t v26 = *(unsigned int *)(v25 + 184);
            }
            else {
              uint64_t v26 = 0;
            }
            uint64_t v27 = [NSNumber numberWithUnsignedInt:v26];
            if (v11)
            {
              [*(id *)(v11 + 8) setEntityId:v27];
              uint64_t v28 = *(void **)(v11 + 8);
            }
            else
            {
              [0 setEntityId:v27];
              uint64_t v28 = 0;
            }
            uint64_t v29 = (void *)-[NSCKRecordMetadata createRecordID](v28);
            -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](v5, v13, *(void **)(v5 + 64), (uint64_t)v29);
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v31 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
        uint64_t v7 = v31;
      }
      while (v31);
    }
    else
    {
      char v9 = 1;
    }

    *(void *)(v5 + 80) = 0;
    a3 = v41;
    if (v9)
    {
      return 1;
    }
    else
    {
LABEL_31:
      if (v49)
      {
        if (a3)
        {
          uint64_t result = 0;
          *a3 = v49;
          return result;
        }
      }
      else
      {
        uint64_t v32 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v32, v33, v34, v35, v36, v37, v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m");
        uint64_t v39 = __pflogFaultLog;
        uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v53 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitImportZoneContext.m";
        __int16 v54 = 1024;
        LODWORD(v55) = 674;
        _os_log_fault_impl(&dword_18AB82000, v39, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      return 0;
    }
  }
  return result;
}

@end