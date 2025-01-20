@interface PFUbiquityRecordImportConflict
+ (id)createSnapshotFromManagedObject:(void *)a3 withSourceObject:;
+ (uint64_t)resolvedTypeForConflictingLogType:(uint64_t)a3 andLatestTransactionEntry:(unsigned char *)a4 skipObject:;
+ (void)initialize;
- (PFUbiquityRecordImportConflict)init;
- (id)createSetOfManagedObjectIDsForGlobalIDsInRelationship:(id)a3 withValue:(id)a4 withGlobalIDToLocalIDURIMap:(id)a5 andTransactionLog:(id)a6;
- (id)createSnapshotFromLogContent:(uint64_t)a3 withTransactionLog:;
- (id)description;
- (uint64_t)addObjectIDsForDiff:(void *)a3 forRelationship:;
- (uint64_t)resolveConflict:(uint64_t)a1;
- (uint64_t)resolveMergeConflictForLogContent:(void *)a3 previousSnapshot:(void *)a4 andAncestorSnapshot:(unsigned int)a5 withOldVersion:(unsigned int)a6 andNewVersion:(uint64_t)a7 error:;
- (void)_newNormalizedSnapshot:(void *)a1 forObject:(void *)a2;
- (void)addObjectID:(void *)a3 forRelationship:;
- (void)dealloc;
@end

@implementation PFUbiquityRecordImportConflict

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _ubMergePolicy = [(NSMergePolicy *)[PFUbiquityMergePolicy alloc] initWithMergeType:1];
  }
}

- (PFUbiquityRecordImportConflict)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityRecordImportConflict;
  v2 = [(PFUbiquityRecordImportConflict *)&v5 init];
  v3 = (PFUbiquityRecordImportConflict *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 36) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((void *)v2 + 11) = 0;
    *((void *)v2 + 12) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
    objc_setProperty_nonatomic(self, v5, 0, 56);
    objc_setProperty_nonatomic(self, v6, 0, 72);
    objc_setProperty_nonatomic(self, v7, 0, 80);
    objc_setProperty_nonatomic(self, v8, 0, 88);
    objc_setProperty_nonatomic(self, v9, 0, 32);
    objc_setProperty_nonatomic(self, v10, 0, 64);
    objc_setProperty_nonatomic(self, v11, 0, 40);
  }

  self->_relationshipsToObjectIDsToCheck = 0;
  v12.receiver = self;
  v12.super_class = (Class)PFUbiquityRecordImportConflict;
  [(PFUbiquityRecordImportConflict *)&v12 dealloc];
}

- (void)_newNormalizedSnapshot:(void *)a1 forObject:(void *)a2
{
  SEL v4 = (void *)[a2 entity];
  SEL v5 = (void *)[a1 mutableCopy];
  if (v4) {
    uint64_t v6 = v4[14];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v4, "propertiesByName"), "values");
  unint64_t v8 = *(void *)(v6 + 48);
  uint64_t v9 = *(void *)(v6 + 56);
  if (v8 < v9 + v8)
  {
    SEL v10 = (id *)(v7 + 8 * v8);
    do
    {
      id v11 = *v10;
      if ([*v10 allowsExternalBinaryDataStorage])
      {
        uint64_t v12 = [v11 name];
        v13 = (void *)[v5 objectForKey:v12];
        if (v13)
        {
          if ([v13 isNSDictionary])
          {
            id v14 = -[_PFExternalReferenceData initForUbiquityDictionary:store:]([_PFExternalReferenceData alloc], "initForUbiquityDictionary:store:", [a1 valueForKey:v12], objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"));
            [v5 setValue:v14 forKey:v12];
          }
        }
      }
      ++v10;
      --v9;
    }
    while (v9);
  }
  return v5;
}

- (uint64_t)addObjectIDsForDiff:(void *)a3 forRelationship:
{
  if (!a2) {
    return result;
  }
  uint64_t v5 = result;
  id v10 = (id)objc_msgSend(*(id *)(result + 96), "objectForKey:", objc_msgSend(a3, "name"));
  if (!v10)
  {
    id v10 = (id)objc_opt_new();
    objc_msgSend(*(id *)(v5 + 96), "setObject:forKey:");
  }
  if ([a2 isNSArray])
  {
    uint64_t isKindOfClass = [v10 addObjectsFromArray:a2];
LABEL_11:
    id v9 = v10;
    goto LABEL_12;
  }
  if ([a2 isNSSet])
  {
    uint64_t v7 = v10;
    unint64_t v8 = a2;
LABEL_10:
    uint64_t isKindOfClass = [v7 unionSet:v8];
    goto LABEL_11;
  }
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v9 = v10;
  if (isKindOfClass)
  {
    [v10 unionSet:a2[1]];
    unint64_t v8 = (void *)a2[2];
    uint64_t v7 = v10;
    goto LABEL_10;
  }
LABEL_12:
  return MEMORY[0x1F41817F8](isKindOfClass, v9);
}

- (void)addObjectID:(void *)a3 forRelationship:
{
  if (a2)
  {
    uint64_t v6 = [a3 name];
    id v7 = (id)[*(id *)(a1 + 96) objectForKey:v6];
    if (!v7)
    {
      id v8 = (id)objc_opt_new();
      [*(id *)(a1 + 96) setObject:v8 forKey:v6];
      id v7 = v8;
    }
    id v9 = v7;
    [v7 addObject:a2];
  }
}

- (uint64_t)resolveMergeConflictForLogContent:(void *)a3 previousSnapshot:(void *)a4 andAncestorSnapshot:(unsigned int)a5 withOldVersion:(unsigned int)a6 andNewVersion:(uint64_t)a7 error:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v27 = *(void **)(a1 + 16);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = (void *)[v27 entity];
  id v10 = objc_msgSend((id)objc_msgSend(v28, "relationshipsByName"), "allValues");
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v16 = (void *)[v15 inverseRelationship];
        if (([v16 isOptional] & 1) == 0)
        {
          v17 = a4;
          int v18 = [v15 isToMany];
          v19 = objc_msgSend(a2, "objectForKey:", objc_msgSend(v15, "name"));
          if (v18)
          {
            -[PFUbiquityRecordImportConflict addObjectIDsForDiff:forRelationship:](a1, v19, v16);
            -[PFUbiquityRecordImportConflict addObjectIDsForDiff:forRelationship:](a1, objc_msgSend(a3, "objectForKey:", objc_msgSend(v15, "name")), v16);
            a4 = v17;
            -[PFUbiquityRecordImportConflict addObjectIDsForDiff:forRelationship:](a1, objc_msgSend(v17, "objectForKey:", objc_msgSend(v15, "name")), v16);
          }
          else
          {
            -[PFUbiquityRecordImportConflict addObjectID:forRelationship:](a1, (uint64_t)v19, v16);
            -[PFUbiquityRecordImportConflict addObjectID:forRelationship:](a1, objc_msgSend(a3, "objectForKey:", objc_msgSend(v15, "name")), v16);
            a4 = v17;
            -[PFUbiquityRecordImportConflict addObjectID:forRelationship:](a1, objc_msgSend(v17, "objectForKey:", objc_msgSend(v15, "name")), v16);
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }
  int hasAttributesWithExternalData = -[NSEntityDescription _hasAttributesWithExternalDataReferences]((uint64_t)v28);
  if (hasAttributesWithExternalData)
  {
    a2 = -[PFUbiquityRecordImportConflict _newNormalizedSnapshot:forObject:](a2, v27);
    v21 = -[PFUbiquityRecordImportConflict _newNormalizedSnapshot:forObject:](a3, v27);
    a4 = -[PFUbiquityRecordImportConflict _newNormalizedSnapshot:forObject:](a4, v27);
  }
  else
  {
    v21 = a3;
  }
  v22 = [[PFUbiquityMergeConflict alloc] initWithSource:*(void *)(a1 + 16) newVersion:a6 oldVersion:a5 cachedSnapshot:v21 persistedSnapshot:a2];
  [(PFUbiquityMergeConflict *)v22 setAncestorSnapshot:a4];
  v23 = (void *)_ubMergePolicy;
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v22, 0);

  uint64_t v25 = [v23 resolveConflicts:v24 error:a7];
  objc_msgSend(*(id *)(a1 + 16), "_setVersionReference__:", a5);
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Resulting source object: %@", "-[PFUbiquityRecordImportConflict resolveMergeConflictForLogContent:previousSnapshot:andAncestorSnapshot:withOldVersion:andNewVersion:error:]", 242, *(void *)(a1 + 16));
  }

  if (hasAttributesWithExternalData)
  {
  }
  return v25;
}

- (uint64_t)resolveConflict:(uint64_t)a1
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v157 = 0;
    return v157 & 1;
  }
  uint64_t v3 = a1;
  id v191 = 0;
  id v167 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Resolve conflict called on: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 263, v3);
  }
  v166 = a2;
  int v4 = [*(id *)(v3 + 16) _versionReference];
  unsigned int v170 = [*(id *)(v3 + 16) _versionReference];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(PFUbiquityPeerSnapshotCollection);
  v172 = v6;
  v168 = v5;
  id v8 = (void *)[*(id *)(v3 + 72) copy];
  int v174 = v4;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v187 objects:v199 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v188;
    id obj = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v188 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v187 + 1) + 8 * v11);
        if (!v12 || *(_DWORD *)(v12 + 16) != 3)
        {
          uint64_t v34 = *(void *)(a1 + 88);
          self;
          *(void *)&long long v193 = 0;
          if (v12) {
            long long v35 = *(void **)(v12 + 48);
          }
          else {
            long long v35 = 0;
          }
          id v36 = v35;
          if (v34 && (uint64_t v37 = *(void *)(v34 + 88)) != 0) {
            uint64_t v38 = *(void *)(v37 + 48);
          }
          else {
            uint64_t v38 = 0;
          }
          v39 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](v38, (uint64_t)v36, 1, &v193);
          if (v39)
          {
          }
          else
          {
            if ([(id)v193 code] != 4)
            {

LABEL_220:
              if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to find transaction log for entry: %@", "+[PFUbiquityRecordImportConflict createTransactionLogForTransactionEntry:withImportContext:error:]", 829, v12);
              }
              if ((void)v193)
              {
                id v191 = (id)v193;
              }
              else
              {
                uint64_t v140 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog(17, v140, v141, v142, v143, v144, v145, v146, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
                v147 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecord"
                         "ImportConflict.m";
                  __int16 v202 = 1024;
                  int v203 = 830;
                  _os_log_fault_impl(&dword_18AB82000, v147, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
LABEL_226:
              if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ aborting conflict resolution, unable to create snapshot for transaction entry: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 281, a1, v12, v191, [v191 userInfo]);
              }
              if (v191)
              {
                if (v166) {
                  void *v166 = v191;
                }
              }
              else
              {
                uint64_t v148 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog(17, v148, v149, v150, v151, v152, v153, v154, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
                v155 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecord"
                         "ImportConflict.m";
                  __int16 v202 = 1024;
                  int v203 = 282;
                  _os_log_fault_impl(&dword_18AB82000, v155, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }

              goto LABEL_234;
            }
            self;
            v40 = (void *)[v36 copy];
            [v40 setUbiquityLocationType:21];
            -[PFUbiquityLocation updateHash](v40);
            *(void *)&long long v193 = 0;
            if (v34 && (uint64_t v41 = *(void *)(v34 + 88)) != 0) {
              uint64_t v42 = *(void *)(v41 + 48);
            }
            else {
              uint64_t v42 = 0;
            }
            v39 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](v42, (uint64_t)v40, 1, &v193);
            if (!v39)
            {
              if ([(id)v193 code] == 4)
              {
                self;
                v43 = (void *)[v36 copy];
                [v43 setUbiquityLocationType:26];
                -[PFUbiquityLocation updateHash](v43);
                if (v34 && (uint64_t v44 = *(void *)(v34 + 88)) != 0) {
                  uint64_t v45 = *(void *)(v44 + 48);
                }
                else {
                  uint64_t v45 = 0;
                }
                v39 = -[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:](v45, (uint64_t)v43, 1, &v193);
              }
              else
              {
                v39 = 0;
              }
            }

            if (!v39) {
              goto LABEL_220;
            }
          }
          if (!v12 || (int v46 = *(_DWORD *)(v12 + 16)) == 0)
          {
            char v47 = -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v39, &v193);
            goto LABEL_56;
          }
          if (v46 == 2)
          {
            char v47 = -[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v39, &v193);
            goto LABEL_56;
          }
          if (v46 == 1)
          {
            char v47 = -[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v39, &v193);
LABEL_56:
            if ((v47 & 1) == 0)
            {
              if ((void)v193)
              {
                id v191 = (id)v193;
              }
              else
              {
                uint64_t v48 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog(17, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
                v55 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecord"
                         "ImportConflict.m";
                  __int16 v202 = 1024;
                  int v203 = 852;
                  _os_log_fault_impl(&dword_18AB82000, v55, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unknown change type for transaction entry: %@", "+[PFUbiquityRecordImportConflict createTransactionLogForTransactionEntry:withImportContext:error:]", 847, v12);
          }
          saveSnapshot = v39->_saveSnapshot;
          transactionLogLocation = v39->_transactionLogLocation;
          if (transactionLogLocation)
          {
            storeName = transactionLogLocation->_storeName;
            if (saveSnapshot) {
              goto LABEL_65;
            }
LABEL_101:
            uint64_t v59 = 0;
            if (!v12) {
              goto LABEL_102;
            }
LABEL_66:
            uint64_t v60 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](v59, *(void *)(v12 + 8));
            int v61 = *(_DWORD *)(v12 + 16);
            switch(v61)
            {
              case 2:
                v67 = v39->_saveSnapshot;
                if (v67)
                {
                  v64 = (void **)[(NSMutableDictionary *)v67->_storeNameToStoreSaveSnapshots objectForKey:*(void *)(v12 + 32)];
                  if (v64)
                  {
                    v65 = v64 + 13;
LABEL_79:
                    v64 = (void **)*v65;
                  }
LABEL_80:
                  id v33 = -[PFUbiquityRecordImportConflict createSnapshotFromLogContent:withTransactionLog:](a1, (void *)[v64 objectForKey:v60], (uint64_t)v39);
                  goto LABEL_82;
                }
                break;
              case 1:
                v66 = v39->_saveSnapshot;
                if (v66)
                {
                  v64 = (void **)[(NSMutableDictionary *)v66->_storeNameToStoreSaveSnapshots objectForKey:*(void *)(v12 + 32)];
                  if (v64)
                  {
                    v65 = v64 + 12;
                    goto LABEL_79;
                  }
                  goto LABEL_80;
                }
                break;
              case 0:
                uint64_t v62 = *(void *)(v12 + 32);
                goto LABEL_70;
              default:
                id v33 = 0;
LABEL_82:

                goto LABEL_91;
            }
          }
          else
          {
            storeName = 0;
            if (!saveSnapshot) {
              goto LABEL_101;
            }
LABEL_65:
            uint64_t v59 = [(NSMutableDictionary *)saveSnapshot->_storeNameToStoreSaveSnapshots objectForKey:storeName];
            if (v12) {
              goto LABEL_66;
            }
LABEL_102:
            uint64_t v60 = -[PFUbiquityStoreSaveSnapshot compressedGlobalObjectIDFromGlobalObjectID:](v59, 0);
            uint64_t v62 = 0;
LABEL_70:
            v63 = v39->_saveSnapshot;
            if (v63)
            {
              v64 = (void **)[(NSMutableDictionary *)v63->_storeNameToStoreSaveSnapshots objectForKey:v62];
              if (v64)
              {
                v65 = v64 + 11;
                goto LABEL_79;
              }
              goto LABEL_80;
            }
          }
          v64 = 0;
          goto LABEL_80;
        }
        *(void *)&long long v193 = 0;
        uint64_t v13 = *(void *)(v12 + 8);
        if (!v13 || !*(void *)(v13 + 48))
        {
          v15 = objc_msgSend(*(id *)(a1 + 80), "objectForKey:");
          v16 = *(void **)(v12 + 8);
          if (v16) {
            objc_setProperty_nonatomic(v16, v14, v15, 48);
          }
        }
        uint64_t v17 = *(void *)(a1 + 88);
        if (v17 && (uint64_t v18 = *(void *)(v17 + 56)) != 0)
        {
          uint64_t v19 = *(void *)(v18 + 24);
          if (v19)
          {
            uint64_t v20 = *(void *)(v19 + 40);
            uint64_t v21 = *(void *)(v19 + 48);
            if (*(_DWORD *)(v19 + 24) != 1) {
              uint64_t v19 = *(void *)(v19 + 8);
            }
          }
          else
          {
            uint64_t v21 = 0;
            uint64_t v20 = 0;
          }
        }
        else
        {
          uint64_t v21 = 0;
          uint64_t v20 = 0;
          uint64_t v19 = 0;
        }
        v22 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, v20, v21, (void *)v19);
        v23 = [PFUbiquityBaseline alloc];
        uint64_t v24 = *(void *)(a1 + 88);
        if (v24 && (uint64_t v25 = *(void *)(v24 + 56)) != 0) {
          uint64_t v26 = *(void *)(v25 + 80);
        }
        else {
          uint64_t v26 = 0;
        }
        v27 = [(PFUbiquityBaseline *)v23 initWithBaselineLocation:v22 andLocalPeerID:v26];

        if (!v27)
        {
          v29 = 0;
LABEL_88:

          goto LABEL_89;
        }
        v28 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:](v27, 1, (id *)&v193);

        if (v28)
        {
          v29 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
          [(NSManagedObjectContext *)v29 setPersistentStoreCoordinator:v28];
          [(NSManagedObjectContext *)v29 setUndoManager:0];
          [(NSManagedObjectContext *)v29 _setDelegate:a1];
          [(NSManagedObjectContext *)v29 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];

          uint64_t v30 = *(void *)(v12 + 8);
          if (v30) {
            uint64_t v31 = *(void *)(v30 + 48);
          }
          else {
            uint64_t v31 = 0;
          }
          v32 = [(NSManagedObjectContext *)v29 existingObjectWithID:v31 error:&v193];
          if (v32)
          {
            id v33 = +[PFUbiquityRecordImportConflict createSnapshotFromManagedObject:withSourceObject:]((uint64_t)PFUbiquityRecordImportConflict, v32, *(void **)(a1 + 16));

            if (v33) {
              goto LABEL_91;
            }
            goto LABEL_89;
          }
          goto LABEL_88;
        }
LABEL_89:
        if (!(void)v193)
        {
          uint64_t v70 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v70, v71, v72, v73, v74, v75, v76, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
          v77 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m";
            __int16 v202 = 1024;
            int v203 = 705;
            _os_log_fault_impl(&dword_18AB82000, v77, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
          goto LABEL_226;
        }
        id v33 = 0;
        id v191 = (id)v193;
LABEL_91:
        if (!v33) {
          goto LABEL_226;
        }
        v68 = [[PFUbiquityPeerSnapshot alloc] initWithTranasctionEntry:v12 andLogSnapshot:v33];
        -[PFUbiquityPeerSnapshotCollection addSnapshot:]((uint64_t)v7, v68);
        if (v68) {
          kv = v68->_kv;
        }
        else {
          kv = 0;
        }
        [v172 setObject:v12 forKey:kv];

        ++v11;
      }
      while (v9 != v11);
      id v8 = obj;
      uint64_t v78 = [obj countByEnumeratingWithState:&v187 objects:v199 count:16];
      uint64_t v9 = v78;
      uint64_t v3 = a1;
    }
    while (v78);
  }

  -[PFUbiquityPeerSnapshotCollection calculateSnapshotDiffsWithError:]((uint64_t)v7);
  uint64_t v79 = *(void *)(v3 + 88);
  if (v79) {
    uint64_t v80 = *(void *)(v79 + 48);
  }
  else {
    uint64_t v80 = 0;
  }
  v81 = *(void **)(v3 + 32);
  self;
  v82 = v81;
  unsigned int v169 = v174 + 1;
  while (1)
  {
    v83 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByDecrementingPeerWithID:]((uint64_t)v82, v80);
    if ([v82 isEqual:v83])
    {
      v92 = 0;
      goto LABEL_130;
    }

    if (v83)
    {
      uint64_t v84 = [v83[1] objectForKey:v80];
      if (v7) {
        goto LABEL_115;
      }
    }
    else
    {
      uint64_t v84 = 0;
      if (v7)
      {
LABEL_115:
        v85 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7->_peerIDToTranasctionNumberToKnowledgeVector, "objectForKey:", v80), "objectForKey:", v84);
        goto LABEL_116;
      }
    }
    v85 = 0;
LABEL_116:
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    v86 = (void *)[v85 allObjects];
    uint64_t v87 = [v86 countByEnumeratingWithState:&v193 objects:buf count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v194;
      do
      {
        uint64_t v89 = 0;
        v90 = v83;
        do
        {
          if (*(void *)v194 != v88) {
            objc_enumerationMutation(v86);
          }
          v83 = (id *)-[PFUbiquityKnowledgeVector createAncestorVectorForConflictingVector:](v90, *(void *)(*((void *)&v193 + 1) + 8 * v89));

          ++v89;
          v90 = v83;
        }
        while (v87 != v89);
        uint64_t v87 = [v86 countByEnumeratingWithState:&v193 objects:buf count:16];
      }
      while (v87);
    }
    if (v7)
    {
      uint64_t v91 = [(NSMutableDictionary *)v7->_kvToSnapshot objectForKey:v83];
      if (v91) {
        break;
      }
    }
    v82 = v83;
  }
  v82 = 0;
  v92 = *(void **)(v91 + 24);
LABEL_130:

  id v93 = v92;
  if (!v7 || (uint64_t v171 = [(NSMutableDictionary *)v7->_kvToSnapshot objectForKey:v93]) == 0)
  {
    uint64_t v94 = [*(id *)(v3 + 72) objectAtIndex:0];
    if (v94)
    {
      uint64_t v95 = *(void *)(v94 + 56);
      if (v7) {
        goto LABEL_134;
      }
LABEL_248:
      uint64_t v171 = 0;
    }
    else
    {
      uint64_t v95 = 0;
      if (!v7) {
        goto LABEL_248;
      }
LABEL_134:
      uint64_t v171 = [(NSMutableDictionary *)v7->_kvToSnapshot objectForKey:v95];
    }
  }
  v96 = (id *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByAddingKnowledgeVector:](*(void *)(v3 + 40), *(void *)(v3 + 32));
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nElected ancestor vector: %@ and snapshot: %@\nNew vector: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 309, v3, v93, v171, v96);
  }

  id v97 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  if (v96)
  {
    v173 = (void *)[v96[1] allKeys];
    uint64_t v98 = [v173 countByEnumeratingWithState:&v183 objects:v198 count:16];
  }
  else
  {
    v173 = 0;
    uint64_t v98 = [0 countByEnumeratingWithState:&v183 objects:v198 count:16];
  }
  uint64_t v99 = v98;
  if (!v98)
  {
    LOBYTE(obja) = 1;
    goto LABEL_174;
  }
  uint64_t v175 = *(void *)v184;
  int obja = 1;
  while (2)
  {
    uint64_t v100 = 0;
    while (2)
    {
      if (*(void *)v184 != v175) {
        objc_enumerationMutation(v173);
      }
      uint64_t v101 = *(void *)(*((void *)&v183 + 1) + 8 * v100);
      if (v96) {
        v102 = (void *)[v96[1] objectForKey:*(void *)(*((void *)&v183 + 1) + 8 * v100)];
      }
      else {
        v102 = 0;
      }
      if ([v102 integerValue] < 1) {
        goto LABEL_165;
      }
      if (!v7)
      {
        uint64_t v104 = 0;
        goto LABEL_169;
      }
      uint64_t v103 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7->_peerIDToTransactionNumberToSnapshot, "objectForKey:", v101), "objectForKey:", v102);
      uint64_t v104 = v103;
      if (!v103)
      {
LABEL_169:
        v106 = 0;
        int v105 = 1;
        goto LABEL_150;
      }
      int v105 = 0;
      v106 = *(void **)(v103 + 24);
LABEL_150:
      obja &= [v106 isEqual:*(void *)(a1 + 32)] ^ 1;
      if (v105)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got nil snapshot for peerID: %@ and transaction number: %@\n\tnew knowledge vector: %@\n\timport conflict: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 329, v101, v102, v96, a1);
        }
        uint64_t v107 = *(void *)(a1 + 32);
        if (v107) {
          v108 = (void *)[*(id *)(v107 + 8) objectForKey:v101];
        }
        else {
          v108 = 0;
        }
        id v109 = v108;
        if (!v109) {
          id v109 = (id)[objc_alloc(NSNumber) initWithInt:0];
        }
        uint64_t v110 = [v109 integerValue];
        uint64_t v111 = [v102 integerValue] - 1;
        while (v111 > v110)
        {
          v112 = (void *)[objc_alloc(NSNumber) initWithInteger:v111];
          if (v7
            && (uint64_t v113 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7->_peerIDToTransactionNumberToSnapshot, "objectForKey:", v101), "objectForKey:", v112)) != 0)
          {
            [v97 addObject:v113];
            uint64_t v111 = -1;
          }
          else
          {
            --v111;
          }
        }
      }
      else
      {
        [v97 addObject:v104];
      }
LABEL_165:
      if (++v100 != v99) {
        continue;
      }
      break;
    }
    uint64_t v114 = [v173 countByEnumeratingWithState:&v183 objects:v198 count:16];
    uint64_t v99 = v114;
    if (v114) {
      continue;
    }
    break;
  }
LABEL_174:

  if (obja)
  {
    if (v7) {
      uint64_t v115 = [(NSMutableDictionary *)v7->_kvToSnapshot objectForKey:*(void *)(a1 + 32)];
    }
    else {
      uint64_t v115 = 0;
    }
    [v97 addObject:v115];
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Sorting snapshots: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 366, v97);
  }
  [v97 sortUsingComparator:&__block_literal_global_33];
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got snapshots to merge: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 376, v97);
  }
  id v116 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  if (v171) {
    v117 = *(void **)(v171 + 8);
  }
  else {
    v117 = 0;
  }
  char v118 = -[PFUbiquityRecordImportConflict resolveMergeConflictForLogContent:previousSnapshot:andAncestorSnapshot:withOldVersion:andNewVersion:error:](a1, v117, 0, v116, v170, v169, (uint64_t)&v191);

  if (v118)
  {
    if (v171) {
      v119 = *(void **)(v171 + 8);
    }
    else {
      v119 = 0;
    }
    id v120 = v119;
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    uint64_t v121 = [v97 countByEnumeratingWithState:&v179 objects:v197 count:16];
    if (v121)
    {
      uint64_t v122 = *(void *)v180;
LABEL_189:
      uint64_t v123 = 0;
      while (1)
      {
        if (*(void *)v180 != v122) {
          objc_enumerationMutation(v97);
        }
        uint64_t v124 = *(void *)(*((void *)&v179 + 1) + 8 * v123);
        v125 = (void *)[v120 mutableCopy];
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Merging snapshot into current snapshot: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 394, v124);
        }
        if (v124) {
          uint64_t v126 = *(void *)(v124 + 16);
        }
        else {
          uint64_t v126 = 0;
        }
        [v125 addEntriesFromDictionary:v126];
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Merging current snapshot: %@\nWith previous snapshot: %@\n and ancestor snapshot: %@\n", "-[PFUbiquityRecordImportConflict resolveConflict:]", 397, v125, v120, v171);
        }
        v127 = v171 ? *(void **)(v171 + 8) : 0;
        if ((-[PFUbiquityRecordImportConflict resolveMergeConflictForLogContent:previousSnapshot:andAncestorSnapshot:withOldVersion:andNewVersion:error:](a1, v125, v120, v127, v170, v169, (uint64_t)&v191) & 1) == 0)break; {

        }
        id v120 = +[PFUbiquityRecordImportConflict createSnapshotFromManagedObject:withSourceObject:]((uint64_t)PFUbiquityRecordImportConflict, *(void **)(a1 + 16), *(void **)(a1 + 16));
        if (v121 == ++v123)
        {
          uint64_t v128 = [v97 countByEnumeratingWithState:&v179 objects:v197 count:16];
          uint64_t v121 = v128;
          if (v128) {
            goto LABEL_189;
          }
          goto LABEL_206;
        }
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered trying to resolve conflict: %@\nuserInfo: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 400, v191, [v191 userInfo]);
      }
      id v131 = v191;
      if (v191) {
        goto LABEL_217;
      }
      uint64_t v159 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v159, v160, v161, v162, v163, v164, v165, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
      v139 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_234;
      }
      *(_DWORD *)buf = 136315394;
      v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m";
      __int16 v202 = 1024;
      int v203 = 401;
LABEL_240:
      _os_log_fault_impl(&dword_18AB82000, v139, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_234;
    }
LABEL_206:
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Done resolving conflict: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 410, a1);
    }

    int v129 = 0;
    char v130 = 1;
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered trying to reset the source object to the ancestor state: %@\nuserInfo: %@", "-[PFUbiquityRecordImportConflict resolveConflict:]", 383, v191, [v191 userInfo]);
    }
    id v131 = v191;
    if (v191)
    {
LABEL_217:
      if (v166) {
        void *v166 = v131;
      }
    }
    else
    {
      uint64_t v132 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v132, v133, v134, v135, v136, v137, v138, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m");
      v139 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v201 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityRecordImportConflict.m";
        __int16 v202 = 1024;
        int v203 = 384;
        goto LABEL_240;
      }
    }
LABEL_234:
    char v130 = 0;
    char v192 = 0;
    int v129 = 1;
  }

  id v156 = 0;
  char v157 = v192;
  if (!v129) {
    char v157 = v130;
  }
  return v157 & 1;
}

uint64_t __50__PFUbiquityRecordImportConflict_resolveConflict___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    if (a2)
    {
      [*(id *)(a2 + 40) timeIntervalSince1970];
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)(a2 + 24);
      if (a3) {
        goto LABEL_4;
      }
    }
    else
    {
      [0 timeIntervalSince1970];
      uint64_t v6 = v16;
      uint64_t v7 = 0;
      if (a3)
      {
LABEL_4:
        [*(id *)(a3 + 40) timeIntervalSince1970];
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)(a3 + 24);
        if (a2) {
          goto LABEL_5;
        }
        goto LABEL_18;
      }
    }
    [0 timeIntervalSince1970];
    uint64_t v9 = v17;
    uint64_t v10 = 0;
    if (a2)
    {
LABEL_5:
      uint64_t v11 = *(void **)(a2 + 40);
      if (a3)
      {
LABEL_6:
        uint64_t v12 = *(void *)(a3 + 40);
LABEL_7:
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Comparing:\n\t%f - %@\n\t%f - %@\n\t%d", "-[PFUbiquityRecordImportConflict resolveConflict:]_block_invoke", 372, v6, v7, v9, v10, [v11 compare:v12]);
        goto LABEL_8;
      }
LABEL_19:
      uint64_t v12 = 0;
      goto LABEL_7;
    }
LABEL_18:
    uint64_t v11 = 0;
    if (a3) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_8:
  if (a2)
  {
    uint64_t v13 = *(void **)(a2 + 40);
    if (a3)
    {
LABEL_10:
      uint64_t v14 = *(void *)(a3 + 40);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (a3) {
      goto LABEL_10;
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  return [v13 compare:v14];
}

+ (id)createSnapshotFromManagedObject:(void *)a3 withSourceObject:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "entity"), "properties");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore");
  id v9 = (id)objc_msgSend((id)objc_msgSend(a3, "managedObjectContext"), "persistentStoreCoordinator");
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v10 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v33 = *(void *)v39;
    id v30 = v5;
    uint64_t v31 = a2;
    v29 = v6;
    do
    {
      uint64_t v12 = 0;
      uint64_t v32 = v11;
      do
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(a2, "valueForKey:", objc_msgSend(v13, "name"));
        if (v14)
        {
          v15 = (void *)v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v15;
LABEL_30:
            objc_msgSend(v5, "setObject:forKey:", v16, objc_msgSend(v13, "name"));

            goto LABEL_31;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v13 isToMany]) {
              id v17 = v15;
            }
            else {
              id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v15, 0);
            }
            uint64_t v18 = v17;
            uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v17, "count"));
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v35 != v22) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v24 = (NSTemporaryObjectID *)[*(id *)(*((void *)&v34 + 1) + 8 * i) objectID];
                  uint64_t v25 = v24;
                  if (v7 != v8) {
                    uint64_t v25 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v9, (CFURLRef)[(NSTemporaryObjectID *)v24 URIRepresentation], 0);
                  }
                  if (v25) {
                    objc_msgSend(v19, "addObject:");
                  }
                }
                uint64_t v21 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
              }
              while (v21);
            }
            char v26 = [v13 isToMany];
            v27 = v19;
            if ((v26 & 1) == 0) {
              v27 = (void *)[v19 anyObject];
            }
            id v16 = v27;

            id v5 = v30;
            a2 = v31;
            uint64_t v6 = v29;
            uint64_t v11 = v32;
            goto LABEL_30;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            && +[PFUbiquityLogging canLogMessageAtLevel:1])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unknown property type: %@", "+[PFUbiquityRecordImportConflict createSnapshotFromManagedObject:withSourceObject:]", 599, v13);
          }
        }
LABEL_31:
        ++v12;
      }
      while (v12 != v11);
      uint64_t v11 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v11);
  }

  return v5;
}

+ (uint64_t)resolvedTypeForConflictingLogType:(uint64_t)a3 andLatestTransactionEntry:(unsigned char *)a4 skipObject:
{
  self;
  if (a2 != 2)
  {
    if (a2 != 1)
    {
      if (a2) {
        return a2;
      }
      if (a3)
      {
        int v7 = *(_DWORD *)(a3 + 16);
        if (v7)
        {
          if (v7 != 2) {
            return v7 == 1;
          }
          a2 = 2;
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping inserted object with globalID: %@ because it was later deleted by the transaction with entry: %@", "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 494, *(void *)(a3 + 8), a3);
          }
          return a2;
        }
        if (!+[PFUbiquityLogging canLogMessageAtLevel:2])
        {
LABEL_23:
          a2 = 0;
          *a4 = 1;
          return a2;
        }
        uint64_t v10 = *(void *)(a3 + 8);
      }
      else
      {
        if (!+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          goto LABEL_23;
        }
        uint64_t v10 = 0;
      }
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping inserted object with globalID: %@ because it was later deleted, and the re-inserted by the transaction with entry: %@", "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 490, v10, a3);
      goto LABEL_23;
    }
    if (a3)
    {
      int v9 = *(_DWORD *)(a3 + 16);
      if (v9)
      {
        if (v9 != 2) {
          return 1;
        }
        a2 = 2;
        if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping updated object with globalID: %@ because it was later deleted by the transaction with entry: %@", "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 514, *(void *)(a3 + 8), a3);
        }
        return a2;
      }
      if (!+[PFUbiquityLogging canLogMessageAtLevel:2])
      {
LABEL_27:
        a2 = 1;
        *a4 = 1;
        return a2;
      }
      uint64_t v11 = *(void *)(a3 + 8);
    }
    else
    {
      if (!+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        goto LABEL_27;
      }
      uint64_t v11 = 0;
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping updated object with globalID: %@ because it was later inserted (meaning it had to have also been deleted by some prior transaction) by the transaction with entry: %@", "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 507, v11, a3);
    goto LABEL_27;
  }
  if (!a3)
  {
    a2 = 2;
    if (!+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      return a2;
    }
    uint64_t v12 = 0;
    goto LABEL_32;
  }
  int v8 = *(_DWORD *)(a3 + 16);
  switch(v8)
  {
    case 0:
      a2 = 2;
      if (!+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        return a2;
      }
      uint64_t v12 = *(void *)(a3 + 8);
LABEL_32:
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Object with globalID: %@ was later inserted by the transaction with entry: %@", "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 522, v12, a3);
      return a2;
    case 1:
      a2 = 2;
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Deleting existing object with globalID: %@ because previously deleted in a log file.", "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 528, *(void *)(a3 + 8));
      }
      break;
    case 2:
      a2 = 2;
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping deleted object with globalID: %@ because it was already deleted, and then deleted by the transaction with entry: %@ and thus no longer exists in the store.", "+[PFUbiquityRecordImportConflict resolvedTypeForConflictingLogType:andLatestTransactionEntry:skipObject:]", 525, *(void *)(a3 + 8), a3);
      }
      break;
    default:
      return 2;
  }
  return a2;
}

- (id)createSnapshotFromLogContent:(uint64_t)a3 withTransactionLog:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "entity"), "properties");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v18 = (void *)a1;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 name];
        id v13 = (id)[a2 valueForKey:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 attributeType] == 1800) {
            id v13 = +[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v13, v11);
          }
          [v5 setValue:v13 forKey:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = (void *)[v18 createSetOfManagedObjectIDsForGlobalIDsInRelationship:v11 withValue:v13 withGlobalIDToLocalIDURIMap:v18[10] andTransactionLog:a3];
            char v15 = [v11 isToMany];
            uint64_t v16 = (uint64_t)v14;
            if ((v15 & 1) == 0) {
              uint64_t v16 = objc_msgSend(v14, "anyObject", v14);
            }
            [v5 setValue:v16 forKey:v12];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              && +[PFUbiquityLogging canLogMessageAtLevel:1])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unknown property type: %@", "-[PFUbiquityRecordImportConflict createSnapshotFromLogContent:withTransactionLog:]", 743, v11);
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)createSetOfManagedObjectIDsForGlobalIDsInRelationship:(id)a3 withValue:(id)a4 withGlobalIDToLocalIDURIMap:(id)a5 andTransactionLog:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  if (self) {
    sourceObject = self->_sourceObject;
  }
  else {
    sourceObject = 0;
  }
  uint64_t v11 = [(NSManagedObjectContext *)[(NSManagedObject *)sourceObject managedObjectContext] persistentStoreCoordinator];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([a3 isToMany]) {
    id v13 = a4;
  }
  else {
    id v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", a4, 0);
  }
  uint64_t v14 = v13;
  if (a6)
  {
    uint64_t v15 = *((void *)a6 + 9);
    uint64_t v16 = *((void *)a6 + 3);
    if (v16)
    {
      uint64_t v17 = *(void *)(v16 + 40);
      if (v15)
      {
LABEL_11:
        a6 = (id)[*(id *)(v15 + 40) objectForKey:v17];
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v17 = 0;
      if (v15) {
        goto LABEL_11;
      }
    }
    a6 = 0;
  }
LABEL_12:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v18 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v33 = self;
    long long v20 = 0;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:]((uint64_t)a6, *(void **)(*((void *)&v35 + 1) + 8 * v22));
        uint64_t v24 = v23;
        if (!v23 || (uint64_t v25 = *(void *)(v23 + 48)) == 0)
        {
          char v26 = (void *)[a5 objectForKey:v23];
          if (!v26)
          {
            if (!v20)
            {
              if ((importContext = v33->_importContext) == 0
                || (cacheWrapper = importContext->_cacheWrapper) == 0
                || (uint64_t peerRangeCache = (uint64_t)cacheWrapper->_peerRangeCache) == 0
                || (!a6 ? (uint64_t v30 = 0) : (uint64_t v30 = *((void *)a6 + 3)),
                    (long long v20 = (void *)-[PFUbiquityPeerRangeCache createMapOfManagedObjectIDsForGlobalIDs:count:error:](peerRangeCache, v30, 0, 0)) == 0))
              {
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unable to map objectIDs" userInfo:0]);
              }
            }
            char v26 = (void *)[v20 objectForKey:v24];
          }
          uint64_t v25 = -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:](v11, "managedObjectIDFromUTF8String:length:", [v26 UTF8String], objc_msgSend(v26, "lengthOfBytesUsingEncoding:", 4));
        }
        [v12 addObject:v25];
        ++v22;
      }
      while (v19 != v22);
      uint64_t v31 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v19 = v31;
    }
    while (v31);
  }
  else
  {
    long long v20 = 0;
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PFUbiquityRecordImportConflict;
  id v4 = [(PFUbiquityRecordImportConflict *)&v14 description];
  if (self)
  {
    conflictingObjectGlobalIDStr = self->_conflictingObjectGlobalIDStr;
    sourceObject = self->_sourceObject;
    uint64_t conflictingLogTransactionType = self->_conflictingLogTransactionType;
    conflictLogDate = self->_conflictLogDate;
    conflictingLogContent = self->_conflictingLogContent;
    conflictingLogKnowledgeVector = self->_conflictingLogKnowledgeVector;
    transactionHistory = self->_transactionHistory;
    globalIDIndexToLocalIDURIMap = self->_globalIDIndexToLocalIDURIMap;
  }
  else
  {
    transactionHistory = 0;
    conflictLogDate = 0;
    conflictingLogContent = 0;
    conflictingObjectGlobalIDStr = 0;
    sourceObject = 0;
    uint64_t conflictingLogTransactionType = 0;
    conflictingLogKnowledgeVector = 0;
    globalIDIndexToLocalIDURIMap = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tconflictingObjectGlobalIDStr: %@\n\tsourceObject: %@\n\tconflictingLogContent: %@\n\tconflictingLogTransactionType: %d\n\tconflictLogDate: %@\n\tconflictingLogKnowledgeVector: %@\n\ttransactionHistory: %@\n\tglobalIDStrToLocalIDURIMap: %@\n\n", v4, conflictingObjectGlobalIDStr, sourceObject, conflictingLogContent, conflictingLogTransactionType, conflictLogDate, conflictingLogKnowledgeVector, transactionHistory, globalIDIndexToLocalIDURIMap];
}

@end