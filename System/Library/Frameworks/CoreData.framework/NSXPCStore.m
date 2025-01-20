@interface NSXPCStore
+ (BOOL)_allowCoreDataFutures;
+ (BOOL)_isOnExtendedTimeout;
+ (id)archiver:(id)a3 willEncodeObject:(id)a4;
+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
+ (int)debugDefault;
+ (void)initialize;
+ (void)setDebugDefault:(int)a3;
- (BOOL)_allowCoreDataFutures;
- (BOOL)_hasActiveGenerations;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(id *)a3;
- (BOOL)supportsConcurrentRequestHandling;
- (BOOL)supportsGenerationalQuerying;
- (Class)_objectIDClass;
- (Class)objectIDFactoryForSQLEntity:(id)a3;
- (NSString)remoteStoreChangedNotificationName;
- (NSXPCStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4;
- (id)_rawMetadata__;
- (id)_storeInfoForEntityDescription:(id)a3;
- (id)ancillaryModels;
- (id)ancillarySQLModels;
- (id)connectionManager;
- (id)currentChangeToken;
- (id)currentQueryGeneration;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)fileBackedFuturesDirectory;
- (id)metadata;
- (id)model;
- (id)newForeignKeyID:(int64_t)a3 entity:(id)a4;
- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)objectIDFactoryForEntity:(id)a3;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (id)sendMessage:(void *)a3 fromContext:(void *)a4 interrupts:(void *)a5 error:;
- (id)sqlCore;
- (id)type;
- (os_unfair_lock_s)_cachedRowForObjectWithID:(void *)a3 generation:;
- (os_unfair_lock_s)_cachedRowForRelationship:(const void *)a3 onObjectWithID:(void *)a4 generation:;
- (uint64_t)_commitChangesForRequestContext:(uint64_t)a1;
- (uint64_t)_executeSaveRequestForContext:(void *)a3 error:;
- (uint64_t)decodePrefetchArray:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:;
- (uint64_t)executeFetchRequest:(NSManagedObjectContext *)a3 withContext:(void *)a4 error:;
- (void)_clearCachedRowForObjectWithID:(void *)a3 generation:;
- (void)_prepareStoreForRemovalFromCoordinator:(id)a3;
- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4;
- (void)cacheContents:(void *)a3 ofRelationship:(void *)a4 onObjectWithID:(void *)a5 withTimestamp:(double)a6 generation:;
- (void)cacheFetchedRows:(void *)a3 forManagedObjects:(void *)a4 generation:;
- (void)dealloc;
- (void)decodePrefetchResult:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:;
- (void)freeQueryGenerationWithIdentifier:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setURL:(id)a3;
- (void)willRemoveFromPersistentStoreCoordinator:(id)a3;
@end

@implementation NSXPCStore

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsGenerationalQuerying
{
  return 1;
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, a4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        -[NSPersistentStoreCache decrementRefCountForObjectID:]((uint64_t)v5, *(const void **)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __42__NSXPCStore_Internal__currentChangeToken__block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(NSCoreDataXPCMessage);
  v3 = v2;
  if (v2) {
    v2->_messageCode = 14;
  }
  v27[0] = [*(id *)(a1 + 32) identifier];
  id v5 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1]);
  if (v3) {
    objc_setProperty_nonatomic(v3, v4, v5, 24);
  }

  uint64_t v26 = 0;
  id v6 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v3, 0, &v25, &v26);
  if (v6)
  {
    uint64_t v13 = (uint64_t)v6;
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v18 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v13, *(void *)(a1 + 32), v17);
    if (+[NSXPCStore debugDefault]) {
      _NSCoreDataLog(8, @"Decoded history token - %@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }

    if (v18)
    {
      if ([v18 count]) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[_NSPersistentHistoryToken alloc] initWithDictionary:v18];
      }
    }
  }
  else
  {
    _NSCoreDataLog(8, @"Nil result for history token request - %@", v7, v8, v9, v10, v11, v12, v26);
  }
}

+ (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v5 = (void *)MEMORY[0x18C127630](a1, a2, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [NSXPCStoreManagedObjectArchivingToken alloc];
    id v7 = (id)[a4 objectID];
LABEL_5:
    uint64_t v8 = -[NSXPCStoreManagedObjectArchivingToken initWithURI:](v6, "initWithURI:", [v7 URIRepresentation]);
LABEL_6:
    uint64_t v9 = (void *)v8;
    return v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [NSXPCStoreManagedObjectArchivingToken alloc];
    id v7 = a4;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = +[_NSXPCStoreUtilities newUserInfoFromException:]((uint64_t)_NSXPCStoreUtilities, a4);
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [a4 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (+[NSQueryGenerationToken currentQueryGenerationToken] == a4)
    {
      a4 = @"current";
    }
    else if (+[NSQueryGenerationToken unpinnedQueryGenerationToken] == a4)
    {
      a4 = @"unpinned";
    }
    else
    {
      +[NSQueryGenerationToken nostoresQueryGenerationToken];
    }
  }
  return a4;
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a3 requestType];
  if ((int)atomic_fetch_add_explicit(&self->_outstandingRequests, 1u, memory_order_relaxed) > -2)
  {
    switch(v9)
    {
      case 1:
        id v11 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)a3, (NSManagedObjectContext *)a4, a5);
        goto LABEL_132;
      case 2:
        if (!self) {
          goto LABEL_134;
        }
        id v44 = 0;
        v221 = 0;
        unsigned __int8 v45 = atomic_load((unsigned __int8 *)&self->super.super._isMetadataDirty);
        if (v45) {
          id v44 = [(NSXPCStore *)self metadata];
        }
        v46 = [[NSXPCSaveRequestContext alloc] initForStore:self request:a3 metadata:v44 forceInsertsToUpdates:0 context:a4];
        v47 = (uint64_t *)-[NSXPCStore _executeSaveRequestForContext:error:]((uint64_t *)self, v46, &v221);
        uint64_t v10 = v47;
        if (!v47) {
          goto LABEL_124;
        }
        if ([v47 BOOLValue]) {
          goto LABEL_126;
        }
        if (!v46) {
          goto LABEL_121;
        }
        uint64_t v48 = v46[6];
        if (!v48) {
          goto LABEL_122;
        }
        if (objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count")
          && (uint64_t v49 = [(__CFString *)v221 domain],
              v206 = (void *)*MEMORY[0x1E4F281F8],
              [(id)*MEMORY[0x1E4F281F8] isEqual:v49])
          && [(__CFString *)v221 code] == 1555)
        {
          if (+[NSXPCStore debugDefault]) {
            _NSCoreDataLog(8, @"Attempting to resend what looks like it may be a reinsert", v50, v51, v52, v53, v54, v55, v199);
          }
          *(void *)buf = 0;
          v56 = [[NSXPCSaveRequestContext alloc] initForStore:self request:a3 metadata:v44 forceInsertsToUpdates:1 context:a4];
          v57 = (uint64_t *)-[NSXPCStore _executeSaveRequestForContext:error:]((uint64_t *)self, v56, buf);
          uint64_t v10 = v57;
          if (v57)
          {
            if ([v57 BOOLValue]) {
              goto LABEL_126;
            }
            if (+[NSXPCStore debugDefault]) {
              _NSCoreDataLog(8, @"Reinsert hit optimistic locking error, will discard and let the next save resolve it.", v192, v193, v194, v195, v196, v197, v199);
            }
            if (objc_msgSend(v206, "isEqual:", objc_msgSend(*(id *)buf, "domain"))
              && [*(id *)buf code] == 134050)
            {
              -[NSXPCStore _commitChangesForRequestContext:]((uint64_t)self, v56);
              char v198 = 1;
              uint64_t v10 = (uint64_t *)[NSNumber numberWithBool:1];
            }
            else
            {
              char v198 = 0;
              uint64_t v10 = 0;
              if (a5) {
                *a5 = v221;
              }
            }
            LOBYTE(v48) = 1;
            if (v198) {
              goto LABEL_126;
            }
LABEL_123:
            if ((v48 & 1) == 0)
            {
LABEL_124:
              uint64_t v10 = 0;
              if (a5) {
                *a5 = v221;
              }
            }
LABEL_126:

            goto LABEL_135;
          }
        }
        else
        {
          if ([(__CFString *)v221 code] != 134050
            || (v131 = (void *)[(__CFString *)v221 domain],
                ![v131 isEqualToString:*MEMORY[0x1E4F281F8]]))
          {
LABEL_121:
            LOBYTE(v48) = 0;
LABEL_122:
            uint64_t v10 = 0;
            goto LABEL_123;
          }
          v132 = objc_msgSend((id)-[__CFString userInfo](v221, "userInfo"), "valueForKey:", @"conflictList");
          id v133 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, 0);
          long long v216 = 0u;
          long long v217 = 0u;
          long long v214 = 0u;
          long long v215 = 0u;
          uint64_t v10 = (uint64_t *)[v132 countByEnumeratingWithState:&v214 objects:buf count:16];
          if (v10)
          {
            uint64_t v134 = *(void *)v215;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v215 != v134) {
                  objc_enumerationMutation(v132);
                }
                -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v133, (const void *)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v214 + 1) + 8 * i), "sourceObject"), "objectID"));
              }
              uint64_t v10 = (uint64_t *)[v132 countByEnumeratingWithState:&v214 objects:buf count:16];
            }
            while (v10);
          }
        }
        LOBYTE(v48) = 0;
        goto LABEL_123;
      case 5:
        if (!self) {
          goto LABEL_134;
        }
        *(void *)&long long v214 = 0;
        -[NSBatchInsertRequest _resolveEntityWithSQLCore:]((uint64_t)a3, self);
        v58 = (void *)[a3 encodeForXPC];
        v59 = objc_alloc_init(NSCoreDataXPCMessage);
        v61 = v59;
        if (v59)
        {
          v59->_messageCode = 16;
          objc_setProperty_nonatomic(v59, v60, v58, 24);
        }

        id v62 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v61, a4, &v221, &v214);
        if (v62)
        {
          v63 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v64 = objc_opt_class();
          uint64_t v65 = objc_opt_class();
          uint64_t v66 = objc_opt_class();
          uint64_t v67 = objc_msgSend(v63, "setWithObjects:", v64, v65, v66, objc_opt_class(), 0);
          uint64_t v68 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v62, (uint64_t)self, v67);
          if (v68)
          {
            v43 = -[NSBatchInsertResult initWithResultType:andObject:]([NSBatchInsertResult alloc], "initWithResultType:andObject:", [a3 resultType], v68);
            goto LABEL_131;
          }
          v108 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E08B8];
          *(void *)&long long v214 = v108;
          if (v108)
          {
LABEL_96:
            if (a5)
            {
              v43 = 0;
              *a5 = v108;
              goto LABEL_131;
            }
LABEL_128:
            v43 = 0;
LABEL_131:
            id v11 = v43;
            goto LABEL_132;
          }
          uint64_t v143 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v143, v144, v145, v146, v147, v148, v149, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v116 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
            goto LABEL_128;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          __int16 v212 = 1024;
          int v213 = 1468;
        }
        else
        {
          v108 = (void *)v214;
          if ((void)v214) {
            goto LABEL_96;
          }
          uint64_t v109 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v109, v110, v111, v112, v113, v114, v115, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v116 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
            goto LABEL_128;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          __int16 v212 = 1024;
          int v213 = 1473;
        }
        _os_log_fault_impl(&dword_18AB82000, v116, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        goto LABEL_128;
      case 6:
        if (!self) {
          goto LABEL_134;
        }
        *(void *)&long long v214 = 0;
        [a3 _resolveEntityWithContext:a4];
        v69 = (void *)[a3 encodeForXPC];
        if (!v69)
        {
          v87 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E08E0];
          if (v87) {
            goto LABEL_90;
          }
          uint64_t v101 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v101, v102, v103, v104, v105, v106, v107, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v95 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
            __int16 v212 = 1024;
            int v213 = 1486;
            goto LABEL_120;
          }
          goto LABEL_134;
        }
        v70 = objc_alloc_init(NSCoreDataXPCMessage);
        v72 = v70;
        if (v70)
        {
          v70->_messageCode = 15;
          objc_setProperty_nonatomic(v70, v71, v69, 24);
        }

        id v73 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v72, a4, &v221, &v214);
        if (v73)
        {
          v74 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v75 = objc_opt_class();
          uint64_t v76 = objc_opt_class();
          uint64_t v77 = objc_opt_class();
          uint64_t v78 = objc_msgSend(v74, "setWithObjects:", v75, v76, v77, objc_opt_class(), 0);
          uint64_t v79 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v73, (uint64_t)self, v78);
          if (v79)
          {
            v43 = -[NSBatchUpdateResult initWithResultType:andObject:]([NSBatchUpdateResult alloc], "initWithResultType:andObject:", [a3 resultType], v79);
            goto LABEL_131;
          }
          v121 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E0908];
          *(void *)&long long v214 = v121;
          if (v121)
          {
LABEL_116:
            if (a5)
            {
              v43 = 0;
              *a5 = v121;
              goto LABEL_131;
            }
            goto LABEL_130;
          }
          uint64_t v150 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v150, v151, v152, v153, v154, v155, v156, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v129 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
LABEL_130:
            v43 = 0;
            goto LABEL_131;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          __int16 v212 = 1024;
          int v213 = 1505;
        }
        else
        {
          v121 = (void *)v214;
          if ((void)v214) {
            goto LABEL_116;
          }
          uint64_t v122 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v122, v123, v124, v125, v126, v127, v128, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
          v129 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
            goto LABEL_130;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
          __int16 v212 = 1024;
          int v213 = 1510;
        }
        _os_log_fault_impl(&dword_18AB82000, v129, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        goto LABEL_130;
      case 7:
        if (!self) {
          goto LABEL_134;
        }
        objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "_resolveEntityWithContext:", a4);
        v31 = (void *)[a3 encodeForXPC];
        v32 = objc_alloc_init(NSCoreDataXPCMessage);
        v34 = v32;
        if (v32)
        {
          v32->_messageCode = 12;
          objc_setProperty_nonatomic(v32, v33, v31, 24);
        }

        *(void *)buf = 0;
        id v35 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v34, a4, &v214, buf);

        if (v35)
        {
          v36 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v37 = objc_opt_class();
          uint64_t v38 = objc_opt_class();
          uint64_t v39 = objc_opt_class();
          uint64_t v40 = objc_msgSend(v36, "setWithObjects:", v37, v38, v39, objc_opt_class(), 0);
          uint64_t v41 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v35, (uint64_t)self, v40);
          uint64_t v42 = v41;
          if (a5 && !v41) {
            *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E0930];
          }
          v43 = -[NSBatchDeleteResult initWithResultType:andObject:]([NSBatchDeleteResult alloc], "initWithResultType:andObject:", [a3 resultType], v42);
        }
        else
        {
          v43 = 0;
          if (a5) {
            *a5 = *(id *)buf;
          }
        }
        goto LABEL_131;
      case 8:
        goto LABEL_12;
      case 10:
        if (!a5) {
          goto LABEL_134;
        }
        id v30 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134091 userInfo:&unk_1ED7E09A8];
        goto LABEL_36;
      default:
        if (!a5) {
          goto LABEL_134;
        }
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Invalid request type" forKey:@"Reason"];
        id v30 = (id)[v28 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v29];
LABEL_36:
        uint64_t v10 = 0;
        *a5 = v30;
        goto LABEL_135;
    }
  }
  atomic_fetch_add_explicit(&self->_outstandingRequests, 0xFFFFFFFF, memory_order_relaxed);
  if (v9 != 8)
  {
    if (v9 == 1) {
      return (id)NSArray_EmptyArray;
    }
    goto LABEL_8;
  }
  if ([a3 isDelete])
  {
LABEL_8:
    uint64_t v10 = 0;
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134098 userInfo:0];
    }
    return v10;
  }
  uint64_t v12 = [NSPersistentHistoryResult alloc];
  uint64_t v13 = [a3 resultType];
  [(NSPersistentHistoryResult *)v12 initWithResultType:v13 andResult:MEMORY[0x1E4F1CBF0]];
LABEL_12:
  if (!self) {
    goto LABEL_134;
  }
  v208 = 0;
  if (![(NSDictionary *)[(NSPersistentStore *)self options] valueForKey:@"NSPersistentHistoryTrackingKey"])
  {
    v80 = [(NSPersistentStore *)self identifier];
    [(NSPersistentStore *)self URL];
    _NSCoreDataLog(1, @"History Change Request failed as no history tracking option detected on store %@ at %@", v81, v82, v83, v84, v85, v86, (uint64_t)v80);
    v87 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134091 userInfo:&unk_1ED7E0958];
    v208 = v87;
    if (v87) {
      goto LABEL_90;
    }
    uint64_t v88 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v88, v89, v90, v91, v92, v93, v94, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
    v95 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
LABEL_134:
      uint64_t v10 = 0;
      goto LABEL_135;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
    __int16 v212 = 1024;
    int v213 = 1557;
    goto LABEL_120;
  }
  if ([a3 token]
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "token"), "storeTokens"), "objectForKey:", -[NSPersistentStore identifier](self, "identifier")))
  {
    v117 = (void *)MEMORY[0x1E4F28C58];
    v221 = @"Reason";
    v118 = NSString;
    uint64_t v119 = [a3 token];
    v218 = [(NSPersistentStore *)self identifier];
    *(void *)&long long v214 = [v118 stringWithFormat:@"Unable to find stores referenced in History Token (%@) - %@", v119, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v218, 1)];
    uint64_t v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v214 forKeys:&v221 count:1];
    v87 = (void *)[v117 errorWithDomain:*MEMORY[0x1E4F281F8] code:134501 userInfo:v120];
    v208 = v87;
    if (v87)
    {
LABEL_90:
      if (a5)
      {
        uint64_t v10 = 0;
        *a5 = v87;
        goto LABEL_135;
      }
      goto LABEL_134;
    }
    uint64_t v136 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v136, v137, v138, v139, v140, v141, v142, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m");
    v95 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_134;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/NSXPCStore.m";
    __int16 v212 = 1024;
    int v213 = 1564;
LABEL_120:
    _os_log_fault_impl(&dword_18AB82000, v95, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_134;
  }
  if ([a3 isDelete])
  {
    v14 = (void *)[a3 encodeForXPC];
    uint64_t v15 = objc_alloc_init(NSCoreDataXPCMessage);
    uint64_t v17 = v15;
    if (v15)
    {
      v15->_messageCode = 13;
      objc_setProperty_nonatomic(v15, v16, v14, 24);
    }

    id v18 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v17, a4, buf, &v208);
    if (v18)
    {
      v205 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v203 = objc_opt_class();
      uint64_t v202 = objc_opt_class();
      uint64_t v201 = objc_opt_class();
      uint64_t v200 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_msgSend(v205, "setWithObjects:", v203, v202, v201, v200, v19, v20, v21, v22, v23, objc_opt_class(), 0);
      uint64_t v25 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v18, (uint64_t)self, v24);
      uint64_t v26 = v25;
      if (a5 && !v25) {
        *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E0980];
      }
      v27 = -[NSPersistentHistoryResult initWithResultType:andResult:]([NSPersistentHistoryResult alloc], "initWithResultType:andResult:", [a3 resultType], v26);
    }
    else
    {
      v27 = 0;
      if (a5) {
        *a5 = v208;
      }
    }
    id v11 = v27;
LABEL_132:
    uint64_t v10 = v11;
    goto LABEL_135;
  }
  v207 = (NSManagedObjectContext *)a4;
  if (!a4)
  {
    v207 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    [(NSManagedObjectContext *)v207 setPersistentStoreCoordinator:[(NSPersistentStore *)self persistentStoreCoordinator]];
  }
  [(NSManagedObjectContext *)v207 _setAllowAncillaryEntities:1];
  if ([a3 token])
  {
    v96 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingTokenCheckForStore:]((NSFetchRequest *)a3, self);
    if (v96)
    {
      v97 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v96, v207, &v208);
      if ([v97 count] && (objc_msgSend((id)objc_msgSend(v97, "firstObject"), "BOOLValue") & 1) == 0)
      {
        v98 = (__CFString *)[NSString stringWithFormat:@"Persistent History Token is expired for store at %@", -[NSURL path](-[NSPersistentStore URL](self, "URL"), "path")];
        v99 = (void *)MEMORY[0x1E4F28C58];
        v221 = v98;
        v218 = (NSString *)@"message";
        v219 = @"NSStoreUUID";
        v222 = [(NSPersistentStore *)self identifier];
        uint64_t v220 = *MEMORY[0x1E4F28328];
        v223 = [(NSURL *)[(NSPersistentStore *)self URL] path];
        uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v221 forKeys:&v218 count:3];
        v208 = (void *)[v99 errorWithDomain:*MEMORY[0x1E4F281F8] code:134301 userInfo:v100];
      }

      if (v208)
      {
        if (a5) {
          *a5 = v208;
        }
        if (a4)
        {
LABEL_79:
          [(NSManagedObjectContext *)v207 _setAllowAncillaryEntities:0];
          goto LABEL_134;
        }
LABEL_133:

        goto LABEL_134;
      }
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "predicate"))
  {
    v130 = -[_NSPersistentHistoryTransactionPredicateParser initWithPredicate:]([_NSPersistentHistoryTransactionPredicateParser alloc], "initWithPredicate:", objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "predicate"));
    *(void *)buf = 0;
    [(_NSPersistentHistoryTransactionPredicateParser *)v130 parse:buf];
    if (*(void *)buf)
    {
      if (a5) {
        *a5 = *(id *)buf;
      }
      goto LABEL_134;
    }
    uint64_t v158 = objc_msgSend(-[_NSPersistentHistoryTransactionPredicateParser storeTokens](v130, "storeTokens"), "objectForKey:", -[NSPersistentStore identifier](self, "identifier"));
    if (v158)
    {
      v159 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), @"TRANSACTION"]);
      [(NSFetchRequest *)v159 setIncludesSubentities:0];
      -[NSFetchRequest setPredicate:](v159, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"_puint64_t k = %@", v158]);
      [(NSFetchRequest *)v159 setResultType:4];
      v160 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v159, v207, &v208);

      if ([v160 count])
      {
        if ((objc_msgSend((id)objc_msgSend(v160, "firstObject"), "BOOLValue") & 1) == 0)
        {
          v161 = (__CFString *)[NSString stringWithFormat:@"Persistent History Token is expired for store at %@", -[NSURL path](-[NSPersistentStore URL](self, "URL"), "path")];
          v162 = (void *)MEMORY[0x1E4F28C58];
          v221 = v161;
          v218 = (NSString *)@"message";
          v219 = @"NSStoreUUID";
          v222 = [(NSPersistentStore *)self identifier];
          uint64_t v220 = *MEMORY[0x1E4F28328];
          v223 = [(NSURL *)[(NSPersistentStore *)self URL] path];
          uint64_t v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v221 forKeys:&v218 count:3];
          v164 = (void *)[v162 errorWithDomain:*MEMORY[0x1E4F281F8] code:134301 userInfo:v163];
          v208 = v164;
          if (v164)
          {
            if (a5) {
              *a5 = v164;
            }
            if (a4) {
              goto LABEL_79;
            }
            goto LABEL_133;
          }
        }
      }
    }
  }
  BOOL v165 = [a3 resultType] == 2
      || [a3 resultType] == 6
      || [a3 resultType] == 0;
  v166 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](a3, self);
  if (v165) {
    uint64_t v167 = 4;
  }
  else {
    uint64_t v167 = 2 * ([a3 fetchBatchSize] == 0);
  }
  [(NSFetchRequest *)v166 setResultType:v167];
  v168 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v166, v207, &v208);
  v204 = v166;
  if ([a3 resultType] == 5
    && (objc_msgSend((id)objc_msgSend(a3, "entityNameToFetch"), "isEqualToString:", @"CHANGE") & 1) == 0
    && ![a3 fetchBatchSize])
  {
    v187 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v168, "count"));
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    uint64_t v188 = [v168 countByEnumeratingWithState:&v214 objects:buf count:16];
    if (v188)
    {
      uint64_t v189 = *(void *)v215;
      do
      {
        for (uint64_t j = 0; j != v188; ++j)
        {
          if (*(void *)v215 != v189) {
            objc_enumerationMutation(v168);
          }
          objc_msgSend(v187, "addObject:", objc_msgSend(*(id *)(*((void *)&v214 + 1) + 8 * j), "objectForKey:", @"self"));
        }
        uint64_t v188 = [v168 countByEnumeratingWithState:&v214 objects:buf count:16];
      }
      while (v188);
    }
    if ([v187 count])
    {
      v183 = [[NSPersistentHistoryChangeRequest alloc] initWithTransactionIDs:v187];
      v184 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](v183, self);
      [(NSFetchRequest *)v184 setResultType:2];
      v191 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v184, v207, &v208);
      uint64_t v178 = 0;
      if (!v208 && v191)
      {
        v209 = v168;
        v210 = v191;
        uint64_t v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v209 count:2];
      }
      goto LABEL_204;
    }
LABEL_202:
    uint64_t v178 = (uint64_t)v168;
    goto LABEL_205;
  }
  if (([a3 resultType] == 1 || objc_msgSend(a3, "resultType") == 4)
    && objc_msgSend((id)objc_msgSend(a3, "entityNameToFetch"), "isEqualToString:", @"TRANSACTION"))
  {
    v169 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v168, "count"));
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    uint64_t v170 = [v168 countByEnumeratingWithState:&v214 objects:buf count:16];
    if (v170)
    {
      uint64_t v171 = *(void *)v215;
      do
      {
        for (uint64_t k = 0; k != v170; ++k)
        {
          if (*(void *)v215 != v171) {
            objc_enumerationMutation(v168);
          }
          objc_msgSend(v169, "addObject:", objc_msgSend(*(id *)(*((void *)&v214 + 1) + 8 * k), "objectForKey:", @"self"));
        }
        uint64_t v170 = [v168 countByEnumeratingWithState:&v214 objects:buf count:16];
      }
      while (v170);
    }
    if ([v169 count])
    {
      v173 = [[NSPersistentHistoryChangeRequest alloc] initWithTransactionIDs:v169];
      v174 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](v173, self);
      [(NSFetchRequest *)v174 setResultType:2];
      v175 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v174, v207, &v208);
      v176 = v208;

      if (v175) {
        BOOL v177 = v176 == 0;
      }
      else {
        BOOL v177 = 0;
      }
      if (v177) {
        uint64_t v178 = (uint64_t)v175;
      }
      else {
        uint64_t v178 = 0;
      }

      goto LABEL_205;
    }
    goto LABEL_189;
  }
  if ([a3 resultType] != 3 && objc_msgSend(a3, "resultType") != 5
    || !objc_msgSend((id)objc_msgSend(a3, "entityNameToFetch"), "isEqualToString:", @"CHANGE"))
  {
    goto LABEL_202;
  }
  v179 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v168, "count"));
  long long v216 = 0u;
  long long v217 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  uint64_t v180 = [v168 countByEnumeratingWithState:&v214 objects:buf count:16];
  if (v180)
  {
    uint64_t v181 = *(void *)v215;
    do
    {
      for (uint64_t m = 0; m != v180; ++m)
      {
        if (*(void *)v215 != v181) {
          objc_enumerationMutation(v168);
        }
        objc_msgSend(v179, "addObject:", objc_msgSend(*(id *)(*((void *)&v214 + 1) + 8 * m), "objectForKey:", @"TRANSACTIONID"));
      }
      uint64_t v180 = [v168 countByEnumeratingWithState:&v214 objects:buf count:16];
    }
    while (v180);
  }
  if ([v179 count])
  {
    v183 = [[NSPersistentHistoryChangeRequest alloc] initWithTransactionIDs:v179];
    [(NSPersistentHistoryChangeRequest *)v183 setResultType:3];
    v184 = -[NSPersistentHistoryChangeRequest fetchRequestDescribingChangeRequestForStore:](v183, self);
    [(NSFetchRequest *)v184 setResultType:2];
    v185 = -[NSXPCStore executeFetchRequest:withContext:error:]((uint64_t *)self, (uint64_t)v184, v207, &v208);
    uint64_t v178 = 0;
    if (!v208)
    {
      v186 = v185;
      if (v185)
      {
        if ([a3 resultType] == 5)
        {
          v209 = v186;
          v210 = v168;
          uint64_t v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v209 count:2];
        }
        else
        {
          uint64_t v178 = (uint64_t)v186;
        }
      }
    }
LABEL_204:

    goto LABEL_205;
  }
LABEL_189:
  uint64_t v178 = MEMORY[0x1E4F1CBF0];
LABEL_205:
  uint64_t v10 = +[NSPersistentHistoryResult _processResult:v178 forRequest:a3 withProvider:self];
  if (a4) {
    [(NSManagedObjectContext *)v207 _setAllowAncillaryEntities:0];
  }
  else {

  }
LABEL_135:
  if (atomic_fetch_add_explicit(&self->_outstandingRequests, 0xFFFFFFFF, memory_order_relaxed) == 1) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_requestTerminationSem);
  }
  return v10;
}

- (void)cacheFetchedRows:(void *)a3 forManagedObjects:(void *)a4 generation:
{
  if (a1)
  {
    id v6 = -[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), a4);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceReferenceDate");
    double v8 = v7;
    uint64_t v9 = [a2 count];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = (void *)[a2 objectAtIndex:v11];
        uint64_t v13 = (void *)[v12 objectID];
        v14 = [[NSIncrementalStoreNode alloc] initWithObjectID:v13 fromSQLRow:v12];
        uint64_t v15 = [[NSXPCRow alloc] initWithNode:v14];
        uint64_t v16 = (atomic_uint *)v15;
        if (v15) {
          v15->super._birth = v8;
        }
        uint64_t v17 = [a3 objectAtIndex:v11];
        if (!v17) {
          goto LABEL_9;
        }
        int v18 = *(_DWORD *)(v17 + 16);
        if ((v18 & 0x200) == 0) {
          break;
        }
        if (!v16 || (int)atomic_fetch_add(v16 + 3, 0) >= 1) {
          goto LABEL_14;
        }
LABEL_13:
        atomic_fetch_add_explicit(v16 + 3, 1u, memory_order_relaxed);
LABEL_14:
        -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v6, (uint64_t)v16, v13, 0);

        if (v10 == ++v11) {
          return;
        }
      }
      *(_DWORD *)(v17 + 16) = v18 | 0x200;
LABEL_9:
      if (!v16) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
}

- (id)objectIDFactoryForEntity:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSXPCStore;
  id v5 = -[NSPersistentStore objectIDFactoryForEntity:](&v8, sel_objectIDFactoryForEntity_);
  if (![v5 _storeInfo1])
  {
    uint64_t v6 = 0;
    if (self && a3) {
      uint64_t v6 = _sqlEntityForEntityDescription((uint64_t)self->_model, a3);
    }
    [v5 _setStoreInfo1:v6];
  }
  return v5;
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return (id)_sqlEntityForEntityDescription((uint64_t)self->_model, a3);
}

+ (void)initialize
{
  self;
  if ((id)objc_opt_class() == a1)
  {
    dword_1E9122F14 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.XPCDebug");
    v3 = getprogname();
    if (v3)
    {
      if (*v3)
      {
        if (!strncmp("PhotosReliveWidget", v3, 0x12uLL)) {
          atomic_store(1u, _MergedGlobals_118);
        }
      }
    }
  }
}

- (id)type
{
  return @"NSXPCStore";
}

- (uint64_t)executeFetchRequest:(NSManagedObjectContext *)a3 withContext:(void *)a4 error:
{
  uint64_t v103 = a4;
  uint64_t v106 = a3;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v105 = (NSPersistentStore *)result;
  if (!result) {
    return result;
  }
  id v108 = 0;
  id v102 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (+[NSXPCStore debugDefault]) {
    _NSCoreDataLog(8, @"Executing fetch %@", v5, v6, v7, v8, v9, v10, a2);
  }
  if ([(id)a2 fetchBatchSize] && !objc_msgSend((id)a2, "resultType"))
  {
    id v11 = (id)[(id)a2 copy];
    [v11 setResultType:1];
    [v11 setFetchBatchSize:0];
    int v101 = 1;
    uint64_t v99 = a2;
    a2 = (uint64_t)v11;
  }
  else
  {
    uint64_t v99 = 0;
    int v101 = 0;
  }
  unsigned __int8 v12 = atomic_load(_MergedGlobals_118);
  if ((v12 & 1) == 0
    && [(id)a2 resultType] == 2
    && ![(id)a2 allocationType]
    && ![(id)a2 fetchBatchSize]
    && [(id)a2 _isEditable])
  {
    char v13 = [(NSManagedObjectContext *)v106 _allowAncillaryEntities];
    char v14 = a2 ? v13 : 1;
    if ((v14 & 1) == 0) {
      *(_DWORD *)(a2 + 104) = *(_DWORD *)(a2 + 104) & 0xFFFE3FFF | 0x4000;
    }
  }
  uint64_t v15 = +[NSSQLCore bufferedAllocationsOverride];
  if (v15 >= 1 && [(id)a2 resultType] == 2 && objc_msgSend((id)a2, "_isEditable"))
  {
    if (v15 == 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
    [(id)a2 setAllocationType:v16];
  }
  uint64_t v17 = (void *)[(id)a2 encodeForXPC];
  int v18 = objc_alloc_init(NSCoreDataXPCMessage);
  uint64_t v19 = v18;
  if (v18) {
    v18->_messageCode = 2;
  }
  uint64_t v20 = -[_NSQueryGenerationToken _generationalComponentForStore:]([(NSManagedObjectContext *)v106 _queryGenerationToken], v105);
  if (v20) {
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v17, v20, 0);
  }
  else {
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
  }

  id v23 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, v21);
  if (v19) {
    objc_setProperty_nonatomic(v19, v22, v23, 24);
  }

  id v24 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)v105, v19, v106, &v107, &v108);
  if (!v24)
  {
    if (v108)
    {
      uint64_t v41 = (void *)[v108 userInfo];
      uint64_t v42 = (void *)[v41 objectForKey:@"exception info"];
      v43 = (void *)[v42 objectForKey:@"controlled exception"];
      if (v42)
      {
        if (([v43 BOOLValue] & 1) == 0)
        {
          id v44 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v45 = [NSString stringWithFormat:@"Fetch threw on server (%@)", v41];
          v46 = (void *)[v44 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v45 userInfo:v41];
          if (v46) {
            objc_exception_throw(v46);
          }
        }
      }
    }
    id v35 = 0;
    goto LABEL_56;
  }
  if ([(NSManagedObjectContext *)v106 _allowAncillaryEntities]
    && [(id)a2 _isEditable])
  {
    [(id)a2 _resolveEntityWithContext:v106];
  }
  uint64_t v25 = NSSet_EmptySet;
  uint64_t v26 = -[NSManagedObjectModel _allowedClassesFromTransformableAttributes](objc_msgSend((id)-[NSPersistentStore model](v105, "model"), "managedObjectModel"));
  if ([v25 count]) {
    uint64_t v26 = [v25 setByAddingObjectsFromSet:v26];
  }
  uint64_t v27 = [(id)+[_NSXPCStoreUtilities classesForFetchArchive]() setByAddingObjectsFromSet:v26];
  id v104 = (id)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v24, (uint64_t)v105, v27);
  if ([v104 count])
  {
    v28 = -[_NSQueryGenerationToken _generationalComponentForStore:]([(NSManagedObjectContext *)v106 _queryGenerationToken], v105);
    uint64_t v29 = (void *)[v104 objectAtIndex:0];
    uint64_t v30 = [(id)a2 resultType];
    uint64_t v31 = v30;
    if (v30 != 4)
    {
      if (v30)
      {
        int v47 = 0;
        BOOL v48 = 0;
      }
      else
      {
        int v47 = [(id)a2 _disablePersistentStoreResultCaching] ^ 1;
        BOOL v48 = objc_msgSend((id)objc_msgSend((id)a2, "propertiesToFetch"), "count") != 0;
      }
      v117 = 0;
      if ([(id)a2 allocationType] == 1 || objc_msgSend((id)a2, "allocationType") == 2)
      {
        if (v47) {
          uint64_t v67 = &v117;
        }
        else {
          uint64_t v67 = 0;
        }
        uint64_t v100 = (_PFBatchFaultingArray *)+[_NSXPCStoreUtilities _decodeBufferResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v29, (void *)a2, 0, (uint64_t)v105, (uint64_t)v106, (uint64_t)v67, (uint64_t *)&v108);
      }
      else
      {
        if (v47) {
          uint64_t v68 = &v117;
        }
        else {
          uint64_t v68 = 0;
        }
        uint64_t v100 = (_PFBatchFaultingArray *)+[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v29, (NSFetchRequest *)a2, 0, v105, v106, v68, &v108);
      }
      if (v117) {
        char v69 = v48;
      }
      else {
        char v69 = 1;
      }
      if ((v69 & 1) == 0 && ((v47 ^ 1) & 1) == 0) {
        -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)v105, v117, v100, v28);
      }
      if (!v31)
      {
        if (v48)
        {
          unint64_t v98 = [(_PFBatchFaultingArray *)v100 count];
          if (v98)
          {
            uint64_t defaultFaultHandler = (uint64_t)v105->_defaultFaultHandler;
            v97 = (void **)[(_PFBatchFaultingArray *)v100 _objectsPointer];
            v70 = *v97;
            v71 = (void *)[MEMORY[0x1E4F1CA48] array];
            v72 = (void *)[MEMORY[0x1E4F1CA80] set];
            id v73 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            v74 = (void *)[v70 mapping];
            uint64_t v75 = [v74 countByEnumeratingWithState:&v113 objects:v119 count:16];
            if (v75)
            {
              uint64_t v76 = *(void *)v114;
              do
              {
                for (uint64_t i = 0; i != v75; ++i)
                {
                  if (*(void *)v114 != v76) {
                    objc_enumerationMutation(v74);
                  }
                  uint64_t v78 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a2, "entity"), "propertiesByName"), "objectForKey:", *(void *)(*((void *)&v113 + 1) + 8 * i));
                  uint64_t v79 = v78;
                  if (v78 && ([v78 _entitysReferenceID] & 0x8000000000000000) == 0)
                  {
                    [v71 addObject:v79];
                    [v72 addObject:v79];
                  }
                }
                uint64_t v75 = [v74 countByEnumeratingWithState:&v113 objects:v119 count:16];
              }
              while (v75);
            }
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            v80 = (void *)[(id)a2 propertiesToFetch];
            uint64_t v81 = [v80 countByEnumeratingWithState:&v109 objects:v118 count:16];
            uint64_t v82 = v97;
            if (v81)
            {
              uint64_t v83 = *(void *)v110;
              do
              {
                for (uint64_t j = 0; j != v81; ++j)
                {
                  if (*(void *)v110 != v83) {
                    objc_enumerationMutation(v80);
                  }
                  uint64_t v85 = *(void **)(*((void *)&v109 + 1) + 8 * j);
                  if ([v85 isTransient])
                  {
                    [v73 addObject:v85];
                    if (([v85 _entitysReferenceID] & 0x8000000000000000) == 0) {
                      objc_msgSend(v72, "addObject:", objc_msgSend(v85, "name"));
                    }
                  }
                }
                uint64_t v81 = [v80 countByEnumeratingWithState:&v109 objects:v118 count:16];
              }
              while (v81);
            }
            if (v98 <= 1) {
              uint64_t v86 = 1;
            }
            else {
              uint64_t v86 = v98;
            }
            uint64_t v87 = defaultFaultHandler;
            do
            {
              id v88 = *v82;
              uint64_t v89 = (void **)[*v82 values];
              uint64_t v90 = (unsigned int *)-[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v106, *v89, v87);
              _PFFaultHandlerFulfillPartialFault(v87, v90, (uint64_t)v106, (uint64_t)v89, v71, (uint64_t)v72, v73);
              *uint64_t v82 = v90;

              ++v82;
              --v86;
            }
            while (v86);
          }
        }
        else
        {
          uint64_t v91 = (uint64_t)v105->_defaultFaultHandler;
          uint64_t v92 = [v117 count];
          if (v92)
          {
            for (uint64_t k = 0; k != v92; ++k)
            {
              uint64_t v94 = [(_PFBatchFaultingArray *)v100 objectAtIndex:k];
              _PFFaultHandlerFulfillFault(v91, v94, (uint64_t)v106, (void *)[v117 objectAtIndex:k], 0);
            }
          }
        }
      }

      if ((unint64_t)[v104 count] >= 2) {
        -[NSXPCStore decodePrefetchArray:forSources:context:](v105, (void *)[v104 objectAtIndex:1], v100, v106);
      }
      goto LABEL_42;
    }
    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    id v104 = (id)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v29, (uint64_t)v105, v34);
  }
  uint64_t v100 = (_PFBatchFaultingArray *)v104;
LABEL_42:
  id v35 = v100;
  if (v101)
  {
    unint64_t v36 = [(_PFBatchFaultingArray *)v100 count];
    unint64_t v37 = MEMORY[0x1F4188790](v36);
    uint64_t v40 = (char *)&v95 - v39;
    if (v37 >= 0x201) {
      uint64_t v40 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v95 - v39, 8 * v38);
    }
    -[_PFBatchFaultingArray getObjects:range:](v35, "getObjects:range:", v40, 0, v36);
    uint64_t v49 = [[_PFArray alloc] initWithObjects:v40 count:v36 andFlags:27];
    if (v36 >= 0x201) {
      NSZoneFree(0, v40);
    }

    uint64_t v50 = [_PFBatchFaultingArray alloc];
    id v35 = [(_PFBatchFaultingArray *)v50 initWithPFArray:v49 andRequest:v99 andContext:v106];
  }
LABEL_56:
  if (+[NSXPCStore debugDefault])
  {
    if (v35)
    {
      uint64_t v57 = [(_PFBatchFaultingArray *)v35 count];
      _NSCoreDataLog(8, @"Fetch retrieved %lu results from server", v58, v59, v60, v61, v62, v63, v57);
    }
    else
    {
      _NSCoreDataLog(8, @"Fetch retrieved null, error %@", v51, v52, v53, v54, v55, v56, (uint64_t)v108);
    }
  }
  id v64 = v108;
  [v102 drain];
  id v65 = v108;
  id v66 = 0;

  if (v103)
  {
    if (v108) {
      *uint64_t v103 = v108;
    }
  }
  return (uint64_t *)v35;
}

+ (int)debugDefault
{
  return dword_1E9122F14;
}

- (id)model
{
  return self->_model;
}

- (id)sendMessage:(void *)a3 fromContext:(void *)a4 interrupts:(void *)a5 error:
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (self)
  {
    uint64_t v10 = (void *)a1[23];
    if (v10) {
      objc_setProperty_nonatomic(self, (SEL)self, v10, 32);
    }
  }
  long long v114 = a5;
  if (!a3) {
    goto LABEL_12;
  }
  id v11 = (id)[*(id *)(a3[21] + 168) copy];
  if (self)
  {
    id v13 = v11;
    if (v11) {
      objc_setProperty_nonatomic(self, v12, v11, 40);
    }
  }
  id v14 = (id)objc_msgSend(*(id *)(a3[21] + 128), "copy", v13);
  if (!v14)
  {
LABEL_12:
    char v16 = [a3 _allowAncillaryEntities];
    if (self) {
      goto LABEL_13;
    }
LABEL_95:
    char v17 = 1;
    goto LABEL_14;
  }
  if (!self)
  {
    [a3 _allowAncillaryEntities];
    goto LABEL_95;
  }
  objc_setProperty_nonatomic(self, v15, v14, 48);
  char v16 = [a3 _allowAncillaryEntities];
LABEL_13:
  char v17 = 0;
  *((unsigned char *)self + 16) = v16;
LABEL_14:
  int v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  if ((v17 & 1) == 0) {
    objc_setProperty_nonatomic(self, v19, v18, 56);
  }
  unint64_t v20 = 0;
  unint64_t v21 = 0x1E4F29000uLL;
  while (1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (a1[20])
    {
      unint64_t v23 = v21;
      id v24 = [[NSXPCStoreMessageContext alloc] initForMessage:self store:a1];
      -[NSXPCStoreConnectionManager sendMessageWithContext:](a1[20], (uint64_t)v24);
      if (v24) {
        uint64_t v25 = (void *)v24[3];
      }
      else {
        uint64_t v25 = 0;
      }
      id v26 = v25;
      if (v114)
      {
        if (v24) {
          uint64_t v27 = (void *)v24[4];
        }
        else {
          uint64_t v27 = 0;
        }
        *long long v114 = v27;
      }

      unint64_t v21 = v23;
      if (v26) {
        break;
      }
    }
    uint64_t v29 = objc_msgSend(*(id *)(v21 + 24), "stringWithFormat:", @"sendMessage: failed #%d", v20);
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v29, (uint64_t)a1, v30, v31, v32, v33, v34, v109);
    unint64_t v40 = v20 + 1;
    *a4 = v20 + 1;
    if (v20 == 2)
    {
      +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, @"Unable to sendMessage: to server", (uint64_t)a1, v35, v36, v37, v38, v39, v108);
LABEL_28:
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "options"), "valueForKey:", @"NSXPCStoreSkipRetryWaitKey"), "BOOLValue") & 1) == 0)
      {
        double v41 = CFAbsoluteTimeGetCurrent();
        if (v20 < 4) {
          unsigned int v42 = 3;
        }
        else {
          unsigned int v42 = +[NSXPCStore _isOnExtendedTimeout] ? 60 : 3;
        }
        double v28 = v41 - Current;
        if (v41 - Current < (double)v42) {
          sleep(v42 - v28);
        }
      }
      goto LABEL_36;
    }
    if (v20) {
      goto LABEL_28;
    }
LABEL_36:
    ++v20;
    if (v40 == 8)
    {
      id v26 = 0;
      int v43 = 1;
      goto LABEL_41;
    }
  }
  int v43 = 0;
LABEL_41:
  if (+[NSXPCStore debugDefault] >= 1)
  {
    NSLog((NSString *)@"Got reply pointer: %p", v26);
    uint64_t v108 = (uint64_t)v26;
    NSLog((NSString *)@"Got reply: %@");
  }
  if (v43)
  {
    id v44 = *(void **)(v21 + 24);
    uint64_t v110 = [a1 options];
    uint64_t v45 = [v44 stringWithFormat:@"Unable to connect to server with options %@"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v45, (uint64_t)a1, v46, v47, v48, v49, v50, v110);
    uint64_t v51 = v114;
    if (v114)
    {
      uint64_t v52 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F281F8];
      uint64_t v54 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v55 = (__CFString *)objc_msgSend(*(id *)(v21 + 24), "stringWithFormat:", @"Unable to send to server; failed after %d attempts.",
                            8);
      uint64_t v56 = v54;
      goto LABEL_46;
    }
    return 0;
  }
  else
  {
    uint64_t v58 = [v26 objectForKey:@"reply"];
    uint64_t v59 = [v26 objectForKey:@"error"];
    if (NSKeyValueCoding_NullValue == v59) {
      uint64_t v60 = 0;
    }
    else {
      uint64_t v60 = (void *)v59;
    }
    if (v58)
    {
      uint64_t v61 = *(void **)(v58 + 24);
      BOOL v62 = *(void *)(v58 + 8) == 0;
    }
    else
    {
      uint64_t v61 = 0;
      BOOL v62 = 1;
    }
    id v63 = v61;
    id v57 = v63;
    if (v62)
    {
      if (v60)
      {
        if (+[NSXPCStore debugDefault] >= 1) {
          _NSCoreDataLog(8, @" Got success, but also an error. Ignoring the error (%@).", v69, v70, v71, v72, v73, v74, (uint64_t)v60);
        }
      }
      else if (!v63)
      {
        +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, @"sendMessage: apparently succeeded, but no response or error", (uint64_t)a1, v64, v65, v66, v67, v68, v108);
        uint64_t v51 = v114;
        if (!v114) {
          return 0;
        }
        uint64_t v52 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v53 = *MEMORY[0x1E4F281F8];
        uint64_t v56 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v55 = @"No data, cause unknown";
LABEL_46:
        id v57 = 0;
        *uint64_t v51 = objc_msgSend(v52, "errorWithDomain:code:userInfo:", v53, 134060, objc_msgSend(v56, "dictionaryWithObject:forKey:", v55, @"Problem"));
      }
    }
    else
    {
      if (+[NSXPCStore debugDefault] >= 1) {
        _NSCoreDataLog(8, @" Request failed: (%@).", v75, v76, v77, v78, v79, v80, (uint64_t)v60);
      }
      if (v60)
      {
        uint64_t v81 = (void *)[v60 userInfo];
        uint64_t v82 = [v60 code];
        uint64_t v83 = [v81 objectForKey:@"NSAffectedObjectsErrorKey"];
        long long v113 = v81;
        if (v83)
        {
          uint64_t v84 = (void *)v83;
          uint64_t v111 = v82;
          id v85 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v119 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          uint64_t v86 = [v84 countByEnumeratingWithState:&v119 objects:v124 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v120;
            do
            {
              uint64_t v89 = 0;
              do
              {
                if (*(void *)v120 != v88) {
                  objc_enumerationMutation(v84);
                }
                if (a3) {
                  id v90 = _PFRetainedObjectIDCore((uint64_t)a3, *(void **)(*((void *)&v119 + 1) + 8 * v89), 0, 1);
                }
                else {
                  id v90 = 0;
                }
                [v85 addObject:v90];

                ++v89;
              }
              while (v87 != v89);
              uint64_t v91 = [v84 countByEnumeratingWithState:&v119 objects:v124 count:16];
              uint64_t v87 = v91;
            }
            while (v91);
          }
          uint64_t v81 = v113;
          uint64_t v92 = (void *)[v113 mutableCopy];
          [v92 setObject:v85 forKey:@"NSAffectedObjectsErrorKey"];

          uint64_t v82 = v111;
        }
        else
        {
          uint64_t v92 = 0;
        }
        uint64_t v99 = (void *)[v81 objectForKey:@"conflictList"];
        if (v99)
        {
          uint64_t v100 = v99;
          long long v112 = v92;
          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          uint64_t v101 = [v99 countByEnumeratingWithState:&v115 objects:v123 count:16];
          if (v101)
          {
            uint64_t v102 = v101;
            uint64_t v103 = *(void *)v116;
            do
            {
              for (uint64_t i = 0; i != v102; ++i)
              {
                if (*(void *)v116 != v103) {
                  objc_enumerationMutation(v100);
                }
                uint64_t v105 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                uint64_t v106 = (void *)MEMORY[0x18C127630]();
                [v105 _doCleanupForXPCStore:a1 context:a3];
              }
              uint64_t v102 = [v100 countByEnumeratingWithState:&v115 objects:v123 count:16];
            }
            while (v102);
          }
          uint64_t v92 = v112;
          if (!v112) {
            uint64_t v92 = (void *)[v113 mutableCopy];
          }
          [v92 setObject:v100 forKey:@"conflictList"];
          uint64_t v82 = 134050;
        }
        if (v92)
        {
          uint64_t v60 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", objc_msgSend(v60, "domain"), v82, v92);
        }
        if (v114) {
          *long long v114 = v60;
        }
      }
      else
      {
        uint64_t v93 = [*(id *)(v21 + 24) stringWithFormat:@"Send failed with no error; probably something wrong here"];
        +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v93, (uint64_t)a1, v94, v95, v96, v97, v98, v108);
      }
    }
  }
  return v57;
}

- (id)sqlCore
{
  return self->_core;
}

- (Class)objectIDFactoryForSQLEntity:(id)a3
{
  if (a3 && *((void *)a3 + 3)) {
    return (Class)-[NSXPCStore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:");
  }
  else {
    return 0;
  }
}

- (BOOL)load:(id *)a3
{
  v29.receiver = self;
  v29.super_class = (Class)NSXPCStore;
  unsigned int v4 = [(NSIncrementalStore *)&v29 load:a3];
  BOOL v5 = v4;
  if (self && v4)
  {
    int v6 = objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", @"NSPersistentStoreRemoteChangeNotificationOptionKey"), "BOOLValue");
    int v7 = objc_msgSend(-[NSDictionary valueForKey:](-[NSPersistentStore options](self, "options"), "valueForKey:", @"NSXPCStorePostUpdateNotifications"), "BOOLValue") | v6;
    if (!self->_observer && v7 != 0)
    {
      uint64_t v9 = objc_alloc_init(NSCoreDataXPCMessage);
      uint64_t v10 = v9;
      if (v9) {
        v9->_messageCode = 7;
      }
      uint64_t v31 = 0;
      id v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v9, 0, &v30, &v31);

      if (v11)
      {
        int v18 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
        unint64_t v21 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v11, (uint64_t)self, v20);
        if (v21) {
          self->_remoteStoreChangedNotificationName = (NSString *)objc_msgSend((id)objc_msgSend(v21, "objectForKey:", @"notificationName"), "copy");
        }
        else {
          _NSCoreDataLog(8, @"Failed to enable remote store notifications: Can't get notification name. %@", v22, v23, v24, v25, v26, v27, v31);
        }
      }
      if (self->_remoteStoreChangedNotificationName) {
        self->_observer = (NSXPCStoreNotificationObserver *)[[NSXPCStoreNotificationObserver alloc] initForObservationWithName:[(NSXPCStore *)self remoteStoreChangedNotificationName] store:self];
      }
      else {
        _NSCoreDataLog(8, @"Failed to enable remote store notifications: %@", v12, v13, v14, v15, v16, v17, v31);
      }
    }
  }
  return v5;
}

- (NSString)remoteStoreChangedNotificationName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (id)currentChangeToken
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  id v3 = [(NSPersistentStore *)self _persistentStoreCoordinator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__NSXPCStore_Internal__currentChangeToken__block_invoke;
  v6[3] = &unk_1E544B4A8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)metadata
{
  p_stateLocuint64_t k = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  metadata = self->_metadata;
  if (metadata)
  {
    BOOL v5 = metadata;
    os_unfair_lock_unlock(p_stateLock);
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
  }
  BOOL v5 = 0;
  if ([(NSXPCStore *)self loadMetadata:0])
  {
    os_unfair_lock_lock_with_options();
    BOOL v5 = self->_metadata;
    os_unfair_lock_unlock(p_stateLock);
  }
LABEL_7:

  return v5;
}

- (BOOL)supportsConcurrentRequestHandling
{
  id v2 = [(NSDictionary *)[(NSPersistentStore *)self options] valueForKey:@"NSPersistentStoreConnectionPoolMaxSize"];
  uint64_t v3 = [v2 integerValue];
  if (v2) {
    BOOL v4 = v3 <= 0;
  }
  else {
    BOOL v4 = 0;
  }
  return !v4;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v9 = &off_1E544B000;
  if (+[NSXPCStore debugDefault]) {
    _NSCoreDataLog(8, @"Firing fault %@", v10, v11, v12, v13, v14, v15, (uint64_t)a3);
  }
  uint64_t v16 = (void *)[a4 _queryGenerationToken];
  if ([v16 _isEnabled]) {
    uint64_t v17 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v16, self);
  }
  else {
    uint64_t v17 = 0;
  }
  int v18 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v17);
  [a4 stalenessInterval];
  if (v19 != 0.0)
  {
    double v20 = v19 <= 0.0 ? *(double *)&NSSQLDistantPastTimeInterval : CFAbsoluteTimeGetCurrent() - v19;
    unint64_t v21 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v18, a3, v20);
    if (v21)
    {
      uint64_t v22 = *(void **)&v21[10]._os_unfair_lock_opaque;
      if (v22)
      {
        id v76 = v22;
        if (+[NSXPCStore debugDefault]) {
          _NSCoreDataLog(8, @"Returning cached value %@", v23, v24, v25, v26, v27, v28, (uint64_t)v76);
        }
        return v76;
      }
    }
  }
  uint64_t v30 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v30, "addObject:", objc_msgSend(a3, "URIRepresentation"));
  if (v17) {
    [v30 addObject:v17];
  }
  id v31 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v30);
  uint64_t v32 = objc_alloc_init(NSCoreDataXPCMessage);
  uint64_t v34 = v32;
  if (v32)
  {
    v32->_messageCode = 5;
    objc_setProperty_nonatomic(v32, v33, v31, 24);
  }

  uint64_t v77 = 0;
  id v78 = 0;
  id v35 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v34, a4, &v77, &v78);
  if (!v35)
  {
    if (a5)
    {
      unint64_t v40 = 0;
      *a5 = v78;
      goto LABEL_68;
    }
    goto LABEL_48;
  }
  uint64_t v36 = (uint64_t)v35;
  uint64_t v74 = a5;
  uint64_t v37 = (void *)+[_NSXPCStoreUtilities classesForSaveArchive]();
  uint64_t v38 = objc_msgSend(v37, "setByAddingObjectsFromSet:", -[NSManagedObjectModel _allowedClassesFromTransformableAttributes](objc_msgSend(-[NSXPCStore model](self, "model"), "managedObjectModel")));
  uint64_t v39 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v36, (uint64_t)self, v38);
  if (objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 0), "integerValue") != 1)
  {
    if (objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 0), "integerValue") == 2)
    {
      double v41 = objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 1), "firstObject");
      unsigned int v42 = objc_alloc_init(NSFetchRequest);
      -[NSFetchRequest setEntity:](v42, "setEntity:", [a3 entity]);
      id v79 = 0;
      id v43 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v41, v42, 1, &self->super.super, (NSManagedObjectContext *)a4, &v79, &v78);

      if ([v43 count])
      {
        id v44 = (NSXPCRow *)[v79 lastObject];
        uint64_t v45 = v44;
      }
      else
      {
        id v44 = 0;
        id v78 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134093 userInfo:0];
      }

      uint64_t v9 = &off_1E544B000;
      if (v44)
      {
        uint64_t v60 = [a4 objectRegisteredForID:a3];
        uint64_t v61 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v44];
        -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)self, v61, (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v60], v17);
        BOOL v62 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v18, a3, *(double *)&NSSQLDistantPastTimeInterval);
        if (v62) {
          id v63 = *(void **)&v62[10]._os_unfair_lock_opaque;
        }
        else {
          id v63 = 0;
        }
        unint64_t v40 = v63;
      }
      else
      {
        unint64_t v40 = 0;
        if (v74 && v78)
        {
          unint64_t v40 = 0;
          id *v74 = v78;
        }
      }
      goto LABEL_67;
    }
    if (v74)
    {
      unint64_t v40 = 0;
      id *v74 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:0];
      goto LABEL_68;
    }
    goto LABEL_48;
  }
  if ([v39 count] != 1)
  {
    uint64_t v46 = (void *)[v39 lastObject];
    uint64_t v47 = (void *)[a3 entity];
    uint64_t v48 = (void *)[v47 _propertyRangesByType];
    uint64_t v49 = v48[7] + v48[13] + 1;
    if ([v46 count] == v49)
    {
      uint64_t v50 = v48[6];
      uint64_t v51 = v48[7];
      uint64_t v73 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](v47));
      uint64_t v75 = [(NSKnownKeysDictionary *)v73 knownKeyValuesPointer];
      if (v51)
      {
        uint64_t v52 = 0;
        uint64_t v53 = v75 + 8 * v50;
        do
        {
          uint64_t v54 = (void *)[v46 objectAtIndex:v52];
          if ((void *)NSKeyValueCoding_NullValue != v54) {
            *(void *)(v53 + 8 * v52) = v54;
          }
          ++v52;
        }
        while (v51 != v52);
      }
      uint64_t v55 = v48[13];
      if (v55)
      {
        uint64_t v56 = (void *)(v75 + 8 * v48[12]);
        do
        {
          *v56++ = (id)[v46 objectAtIndex:v51++];
          --v55;
        }
        while (v55);
      }
      unint64_t v40 = -[NSIncrementalStoreNode initWithObjectID:withValues:version:]([NSIncrementalStoreNode alloc], "initWithObjectID:withValues:version:", a3, v73, objc_msgSend((id)objc_msgSend(v46, "lastObject"), "unsignedIntegerValue"));

      id v44 = [[NSXPCRow alloc] initWithNode:v40];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      if (v44) {
        v44->super._birth = v57;
      }
      uint64_t v58 = (void *)[a4 _queryGenerationToken];
      uint64_t v9 = &off_1E544B000;
      if ([v58 _isEnabled]) {
        uint64_t v59 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v58, self);
      }
      else {
        uint64_t v59 = 0;
      }
      id v64 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v59);
      uint64_t v65 = [a4 objectWithID:a3];
      if (v65)
      {
        int v66 = *(_DWORD *)(v65 + 16);
        if ((v66 & 0x200) != 0)
        {
          if (!v44 || (int)atomic_fetch_add(&v44->super._externalReferenceCount, 0) >= 1) {
            goto LABEL_66;
          }
LABEL_65:
          atomic_fetch_add_explicit(&v44->super._externalReferenceCount, 1u, memory_order_relaxed);
LABEL_66:
          -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v64, (uint64_t)v44, a3, 0);
LABEL_67:

          goto LABEL_68;
        }
        *(_DWORD *)(v65 + 16) = v66 | 0x200;
      }
      if (!v44) {
        goto LABEL_66;
      }
      goto LABEL_65;
    }
    if (v74)
    {
      unint64_t v40 = 0;
      id *v74 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Unexpected number of property values returned from server", @"Reason"));
      goto LABEL_68;
    }
LABEL_48:
    unint64_t v40 = 0;
    goto LABEL_68;
  }
  if (!v74) {
    goto LABEL_48;
  }
  unint64_t v40 = 0;
  id *v74 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 133000, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", a3), @"NSAffectedObjectsErrorKey", 0));
LABEL_68:

  if ([v9[44] debugDefault]) {
    _NSCoreDataLog(8, @"Retrieved node from server %@", v67, v68, v69, v70, v71, v72, (uint64_t)v40);
  }
  return v40;
}

- (NSXPCStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  id v6 = a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (![a6 valueForKey:@"serviceName"]
    && ![v6 valueForKey:@"NSXPCStoreServiceName"]
    && ![v6 valueForKey:@"NSXPCStoreServerEndpointFactory"])
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"No service name or endpoint factory supplied" userInfo:0]);
  }
  id v47 = a4;
  if (objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"skipModelCheck"), "BOOLValue"))
  {
    if ([v6 valueForKey:@"NSXPCStoreServerEndpointFactory"]
      && ![v6 valueForKey:@"NSPersistentHistoryTrackingKey"])
    {
      id v6 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
      [v6 setValue:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentHistoryTrackingKey"];
    }
  }
  else
  {
    uint64_t v10 = (void *)[a3 managedObjectModel];
    uint64_t v45 = self;
    id v46 = a5;
    if ([a4 length]
      && ![a4 isEqualToString:@"PF_DEFAULT_CONFIGURATION_NAME"])
    {
      uint64_t v11 = (void *)[v10 entitiesForConfiguration:a4];
    }
    else
    {
      uint64_t v11 = (void *)[v10 entities];
    }
    uint64_t v12 = v11;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v51;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v51 != v18) {
                  objc_enumerationMutation(v16);
                }
                double v20 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                if ([v20 _propertyType] == 4
                  && [v20 isToMany]
                  && [v20 isOrdered])
                {
                  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"XPC store does not currently allow models containing ordered relationships" userInfo:0]);
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }
            while (v17);
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v13);
    }
    a5 = v46;
    a4 = v47;
    self = v45;
  }
  v49.receiver = self;
  v49.super_class = (Class)NSXPCStore;
  uint64_t v26 = [(NSPersistentStore *)&v49 initWithPersistentStoreCoordinator:a3 configurationName:a4 URL:a5 options:v6];
  if (v26)
  {
    v26->_requestTerminationSeuint64_t m = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v26->_cache = [[NSGenerationalRowCache alloc] initWithStore:v26];
    uint64_t v27 = -[NSSQLModel initWithManagedObjectModel:]([NSSQLModel alloc], "initWithManagedObjectModel:", [a3 managedObjectModel]);
    v26->_model = v27;
    if (!v27) {
      +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, @"Unable to load model", (uint64_t)v26, v28, v29, v30, v31, v32, v44);
    }
    v26->_sanityCheckToken = 0;
    v26->_stateLock._os_unfair_lock_opaque = 0;
    v26->_outstandingRequests = 0;
    v26->_connectionManager = (NSXPCStoreConnectionManager *)[[NSXPCStoreConnectionManager alloc] initForStore:v26];
    if (a3)
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v35 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
      [v35 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NSXPCStoreDelegate"];
      uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"/dev/null/CDInternalXPCStore-%p", v26);
      uint64_t v37 = [NSSQLCore alloc];
      uint64_t v38 = -[NSSQLCore initWithPersistentStoreCoordinator:configurationName:URL:options:](v37, "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, v47, [MEMORY[0x1E4F1CB10] fileURLWithPath:v36], v35);
      v26->_core = (NSSQLCore *)v38;
      -[NSSQLCore _useModel:](v38, v26->_model);
    }
    else
    {
      id v34 = 0;
      id v33 = 0;
    }
    uint64_t v39 = [v6 objectForKey:@"NSPersistentHistoryTrackingKey"];
    if (a3 && v39)
    {
      unint64_t v40 = (void *)[v6 objectForKey:@"NSPersistentHistoryTrackingKey"];
      if (([v40 isNSDictionary] & 1) == 0 && (objc_msgSend(v40, "isNSNumber") & 1) == 0) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersistentHistoryTrackingKey must be a NSNumber" userInfo:0]);
      }
      if (([v40 isNSDictionary] & 1) != 0
        || [v40 isNSNumber] && objc_msgSend(v40, "BOOLValue"))
      {
        id v41 = [(NSDictionary *)[(NSSQLCore *)v26->_core ancillaryModels] objectForKey:@"NSPersistentHistoryTrackingKey"];
        -[_PFModelMap addManagedObjectModel:](*((void *)a3 + 12), v41);
        [v33 setObject:v41 forKey:@"NSPersistentHistoryTrackingKey"];
        objc_msgSend(v34, "setObject:forKey:", objc_msgSend(-[NSSQLCore ancillarySQLModels](v26->_core, "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), @"NSPersistentHistoryTrackingKey");
        id v42 = +[_PFPersistentHistoryFetchModel newFetchHistoryModelForCoordinator:andOptions:]();
        -[_PFModelMap addManagedObjectModel:](*((void *)a3 + 12), v42);
      }
    }
    v26->_ancillaryModels = (NSDictionary *)[v33 copy];
    v26->_ancillarySQLModels = (NSDictionary *)[v34 copy];
  }
  else
  {
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, @"Unable to initialize client", 0, v21, v22, v23, v24, v25, v44);
  }
  return v26;
}

- (BOOL)loadMetadata:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"), "managedObjectModel");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v5);
        }
        if (-[NSEntityDescription _hasAttributesWithFileBackedFutures](*(void *)(*((void *)&v41 + 1) + 8 * i)))
        {
          int v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v9 = 0;
LABEL_11:
  uint64_t v10 = objc_alloc_init(NSCoreDataXPCMessage);
  uint64_t v11 = v10;
  if (v10) {
    v10->_messageCode = 1;
  }
  unint64_t v40 = 0;
  id v12 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v10, 0, &v39, &v40);
  if (v12)
  {
    uint64_t v38 = 0;
    uint64_t v13 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:&v38 error:a3];
    uint64_t v14 = v13;
    if (!v13)
    {

      return v12 != 0;
    }
    if (v9)
    {
      uint64_t v15 = (NSString *)(id)[v13 objectForKey:@"NSFileBackedFuturePathKey"];
      self->_fileBackedFuturesDirectory = v15;
      if (!v15)
      {
        uint64_t v26 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E0890];
        BOOL result = 0;
        *a3 = v26;
        return result;
      }
      uint64_t v14 = (void *)[v14 objectForKey:@"NSMetadataKey"];
    }
    uint64_t v16 = (void *)[v14 objectForKey:@"NSStoreModelVersionIdentifiers"];
    if (!v16)
    {
      if (a3)
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Server did not return model version info. (Unsupported configuration.)" forKey:@"Reason"];
        double v19 = (void *)[v17 errorWithDomain:*MEMORY[0x1E4F281F8] code:134080 userInfo:v18];
        id v12 = 0;
        *a3 = v19;
      }
      else
      {
        id v12 = 0;
      }
    }
    if (!objc_msgSend(-[NSDictionary objectForKey:](-[NSPersistentStore options](self, "options"), "objectForKey:", @"NSIgnorePersistentStoreVersioningOption"), "BOOLValue")|| (objc_msgSend(v16, "isEqual:", objc_msgSend(v5, "entityVersionHashesByName")) & 1) != 0)
    {
      if (self)
      {
        os_unfair_lock_lock_with_options();
        uint64_t v28 = self->_sanityCheckToken;
        os_unfair_lock_unlock(&self->_stateLock);
        uint64_t v29 = v28;
        uint64_t v30 = (NSString *)[v14 objectForKey:@"NSStoreUUID"];
        if (v29)
        {
          if (([(NSString *)v29 isEqual:v30] & 1) == 0)
          {
            if (a3)
            {
              uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Server side store changed, remove and re-add this client store", @"Reason" forKey];
              id v33 = (void *)[v31 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v32];
              id v12 = 0;
              *a3 = v33;
            }
            else
            {
              id v12 = 0;
            }
          }
        }
        else
        {
          os_unfair_lock_lock_with_options();
          if (self->_sanityCheckToken != v30)
          {
            id v34 = v30;

            self->_sanityCheckToken = v30;
          }
          os_unfair_lock_unlock(&self->_stateLock);
        }
      }
      else
      {
        [v14 objectForKey:@"NSStoreUUID"];
      }
      [(NSXPCStore *)self _setMetadata:v14 includeVersioning:0];

      if (v12) {
        return v12 != 0;
      }
      goto LABEL_24;
    }
    if (a3)
    {
      id v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Server schema is incompatible and ignore version enabled. (Unsupported configuration.)" forKey:@"Reason"];
      *a3 = (id)[v35 errorWithDomain:*MEMORY[0x1E4F281F8] code:134020 userInfo:v36];
    }
  }
  else if (a3)
  {
    *a3 = v40;
  }

LABEL_24:
  uint64_t v20 = [NSString stringWithFormat:@"Unable to load metadata: %@", v40];
  +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v20, (uint64_t)self, v21, v22, v23, v24, v25, v37);
  id v12 = 0;
  return v12 != 0;
}

- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSXPCStore;
  id v5 = [(NSPersistentStore *)&v7 _updatedMetadataWithSeed:a3 includeVersioning:a4];
  os_unfair_lock_lock_with_options();
  if (([v5 isEqual:self->_metadata] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSXPCStore;
    [(NSPersistentStore *)&v6 _setMetadataDirty:1];

    self->_metadata = (NSDictionary *)v5;
  }
  os_unfair_lock_unlock(&self->_stateLock);
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  v76[16] = *MEMORY[0x1E4F143B8];
  [a5 stalenessInterval];
  double v12 = v11;
  uint64_t v13 = (void *)[a5 _queryGenerationToken];
  if ([v13 _isEnabled]) {
    uint64_t v14 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v13, self);
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v14);
  if (v12 != 0.0)
  {
    uint64_t v16 = v15;
    if (v12 <= 0.0) {
      double v17 = *(double *)&NSSQLDistantPastTimeInterval;
    }
    else {
      double v17 = CFAbsoluteTimeGetCurrent() - v12;
    }
    uint64_t v18 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v16, a4, v17);
    if (v18) {
      double v19 = *(void **)&v18[10]._os_unfair_lock_opaque;
    }
    else {
      double v19 = 0;
    }
    id v20 = v19;
    if (!v20)
    {
      v76[0] = 0;
      id v21 = [(NSXPCStore *)self newValuesForObjectWithID:a4 withContext:a5 error:v76];
      if (!v21)
      {
        if (a6) {
          *a6 = (id)v76[0];
        }
        return 0;
      }
      id v20 = v21;
    }
    uint64_t v22 = (void *)[v20 valueForPropertyDescription:a3];
    if (([a3 isToMany] & 1) == 0)
    {
      uint64_t v24 = NSKeyValueCoding_NullValue;
      if (v22) {
        uint64_t v24 = v22;
      }
      uint64_t v23 = v24;
      goto LABEL_19;
    }
    if (v22)
    {
      uint64_t v23 = v22;
LABEL_19:
      uint64_t v25 = v23;

      return v25;
    }

    uint64_t v25 = -[NSPersistentStoreCache toManyForSourceObjectID:forProperty:afterTimestamp:](v16, a4, a3, v17);
    if (v25) {
      return v25;
    }
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(a4, "URIRepresentation"), @"source");
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(a3, "name"), @"relationship");
  [v26 addObject:v27];

  if (v14) {
    [v26 addObject:v14];
  }
  id v28 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v26);

  uint64_t v29 = objc_alloc_init(NSCoreDataXPCMessage);
  uint64_t v31 = v29;
  if (v29)
  {
    v29->_messageCode = 6;
    objc_setProperty_nonatomic(v29, v30, v28, 24);
  }

  uint64_t v71 = 0;
  id v32 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v31, a5, &v70, &v71);

  if (v32)
  {
    uint64_t v69 = v14;
    id v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
    uint64_t v37 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v32, (uint64_t)self, v36);
    if (+[NSXPCStore debugDefault])
    {
      [a3 name];
      _NSCoreDataLog(8, @"Decoded value for %@ - %@ : %@", v38, v39, v40, v41, v42, v43, (uint64_t)a4);
    }
    long long v44 = (void *)[a5 persistentStoreCoordinator];
    if ([a3 isToMany])
    {
      int v45 = [a3 isOrdered];
      uint64_t v46 = (Class *)0x1E4F1CA70;
      if (!v45) {
        uint64_t v46 = (Class *)0x1E4F1CA80;
      }
      uint64_t v25 = (os_unfair_lock_s *)objc_alloc_init(*v46);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      uint64_t v47 = [v37 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        id v68 = a4;
        uint64_t v49 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v73 != v49) {
              objc_enumerationMutation(v37);
            }
            uint64_t v51 = *(void *)(*((void *)&v72 + 1) + 8 * i);
            long long v52 = (void *)MEMORY[0x18C127630]();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_57;
            }
            uint64_t v53 = [v44 managedObjectIDForURIRepresentation:v51];
            if (v53) {
              [(os_unfair_lock_s *)v25 addObject:v53];
            }
          }
          uint64_t v48 = [v37 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v48);
        a4 = v68;
      }
    }
    else
    {
      uint64_t v54 = NSKeyValueCoding_NullValue;
      if (v54 != [v37 lastObject])
      {
        uint64_t v55 = [v37 lastObject];
        objc_opt_class();
        long long v56 = v69;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_57:
          uint64_t v61 = [a3 name];
          _NSCoreDataLog(8, @"Got a bad relationship value for %@, %@ (%@)", v62, v63, v64, v65, v66, v67, v61);
          __break(1u);
        }
        long long v57 = (void *)[v44 managedObjectIDForURIRepresentation:v55];
        if (v57) {
          uint64_t v25 = v57;
        }
        else {
          uint64_t v25 = 0;
        }
        goto LABEL_53;
      }
      uint64_t v25 = (os_unfair_lock_s *)(id)NSKeyValueCoding_NullValue;
    }
    long long v56 = v69;
LABEL_53:
    if ([a3 isToMany])
    {
      id v58 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v56);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceReferenceDate");
      -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v58, v25, 0, a4, a3, v59);
    }
    return v25;
  }
  uint64_t v25 = 0;
  if (a6) {
    *a6 = v71;
  }
  return v25;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)_allowCoreDataFutures
{
  return 1;
}

+ (BOOL)_allowCoreDataFutures
{
  return 1;
}

+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return (id)[a1 archiver:a4 willEncodeObject:a5];
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  uint64_t v8 = objc_opt_class();

  return (id)[v8 replacementObjectForXPCConnection:a3 encoder:a4 object:a5];
}

- (void)dealloc
{
  -[NSXPCStoreConnectionManager disconnectAllConnections:]((uint64_t)self->_connectionManager, 0);

  self->_ancillaryModels = 0;
  self->_ancillarySQLModels = 0;

  self->_connectionManager = 0;
  -[NSXPCStoreNotificationObserver setStore:]((id *)&self->_observer->super.isa, 0);

  self->_observer = 0;
  requestTerminationSeuint64_t m = self->_requestTerminationSem;
  if (requestTerminationSem) {
    dispatch_release(requestTerminationSem);
  }

  self->_remoteStoreChangedNotificationName = 0;
  self->_cache = 0;

  self->_model = 0;
  self->_metadata = 0;

  self->_core = 0;
  self->_sanityCheckToken = 0;

  self->_fileBackedFuturesDirectory = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSXPCStore;
  [(NSIncrementalStore *)&v4 dealloc];
}

- (void)willRemoveFromPersistentStoreCoordinator:(id)a3
{
  if (self) {
    -[NSXPCStoreConnectionManager disconnectAllConnections:]((uint64_t)self->_connectionManager, 1);
  }
  -[NSXPCStoreNotificationObserver setStore:]((id *)&self->_observer->super.isa, 0);
  v5.receiver = self;
  v5.super_class = (Class)NSXPCStore;
  [(NSPersistentStore *)&v5 willRemoveFromPersistentStoreCoordinator:a3];
}

- (void)setURL:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (id)_rawMetadata__
{
  return self->_metadata;
}

- (id)currentQueryGeneration
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy_;
  double v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  id v3 = [(NSPersistentStore *)self _persistentStoreCoordinator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NSXPCStore_currentQueryGeneration__block_invoke;
  v6[3] = &unk_1E544B4A8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __36__NSXPCStore_currentQueryGeneration__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(NSCoreDataXPCMessage);
  id v3 = v2;
  if (v2) {
    v2->_messageCode = 9;
  }
  uint64_t v25 = 0;
  id v4 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v2, 0, &v24, &v25);

  if (!v4)
  {
    uint64_t v14 = @"Nil result for query generation request";
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  uint64_t v13 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v4, v11, v12);
  if (!v13)
  {
    uint64_t v14 = @"Unable to decode query generation";
LABEL_7:
    _NSCoreDataLog(8, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v22);
    uint64_t v23 = v25;
    uint64_t v15 = [NSString stringWithFormat:@"Unable to get query generation: %@"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, *(void *)(a1 + 32), v16, v17, v18, v19, v20, v23);
    uint64_t v13 = 0;
  }
  id result = v13;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_hasActiveGenerations
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(NSPersistentStore *)self _persistentStoreCoordinator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NSXPCStore__hasActiveGenerations__block_invoke;
  v5[3] = &unk_1E544B4A8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__NSXPCStore__hasActiveGenerations__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(NSCoreDataXPCMessage);
  id v3 = v2;
  if (v2) {
    v2->_messageCode = 17;
  }
  uint64_t v25 = 0;
  id v4 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v2, 0, &v24, &v25);

  if (!v4)
  {
    uint64_t v14 = @"Nil result for active generations request";
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  uint64_t v13 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v4, v11, v12);
  if (!v13)
  {
    uint64_t v14 = @"Unable to decode active generations result";
LABEL_7:
    _NSCoreDataLog(8, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v22);
    uint64_t v23 = v25;
    uint64_t v15 = [NSString stringWithFormat:@"Unable to check for active generations: %@"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, *(void *)(a1 + 32), v16, v17, v18, v19, v20, v23);
    uint64_t v13 = 0;
  }
  uint64_t result = [v13 BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)freeQueryGenerationWithIdentifier:(id)a3
{
  objc_initWeak(&location, self);
  id v5 = [(NSPersistentStore *)self _persistentStoreCoordinator];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__NSXPCStore_freeQueryGenerationWithIdentifier___block_invoke;
  v6[3] = &unk_1E544B480;
  objc_copyWeak(&v7, &location);
  v6[4] = a3;
  [v5 performBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__NSXPCStore_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1)
{
  Weauint64_t k = (uint64_t *)objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    id v3 = Weak;
    id v4 = *(void **)(a1 + 32);
    -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](Weak[18], (uint64_t)v4);
    id v5 = objc_alloc_init(NSCoreDataXPCMessage);
    uint64_t v6 = v5;
    if (v5) {
      v5->_messageCode = 10;
    }
    id v7 = [_NSQueryGenerationToken alloc];
    if (v7) {
      uint64_t v8 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v7, v4, v3, 0);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v8);

    if (v6) {
      objc_setProperty_nonatomic(v6, v10, v9, 24);
    }

    uint64_t v23 = 0;
    id v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](v3, v6, 0, &v22, &v23);
    if (v11)
    {
      uint64_t v12 = (uint64_t)v11;
      uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      uint64_t v14 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v12, (uint64_t)v3, v13);
      if (v14 && ([v14 BOOLValue] & 1) != 0) {
        goto LABEL_14;
      }
      uint64_t v15 = [NSString stringWithFormat:@"Unable to release query generation: %@", v23];
    }
    else
    {
      uint64_t v15 = [NSString stringWithFormat:@"Attempt to release query generation failed: %@", v23];
    }
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, (uint64_t)v3, v16, v17, v18, v19, v20, v21);
LABEL_14:
  }
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  id v6 = [(NSPersistentStore *)self _persistentStoreCoordinator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__NSXPCStore_reopenQueryGenerationWithIdentifier_error___block_invoke;
  v9[3] = &unk_1E544B500;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = &v10;
  [v6 performBlockAndWait:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

id __56__NSXPCStore_reopenQueryGenerationWithIdentifier_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(NSCoreDataXPCMessage);
  id v3 = v2;
  if (v2) {
    v2->_messageCode = 11;
  }
  id v4 = [_NSQueryGenerationToken alloc];
  if (v4) {
    id v5 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v4, *(void **)(a1 + 32), *(void **)(a1 + 40), 0);
  }
  else {
    id v5 = 0;
  }
  id v6 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v5);

  if (v3) {
    objc_setProperty_nonatomic(v3, v7, v6, 24);
  }

  uint64_t v22 = 0;
  id v8 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 40), v3, 0, &v21, &v22);
  if (!v8
    || (uint64_t v9 = (uint64_t)v8,
        uint64_t v10 = *(void *)(a1 + 40),
        uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()],
        (uint64_t v12 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v9, v10, v11)) == 0))
  {
    uint64_t v13 = [NSString stringWithFormat:@"Attempt to reopen query generation failed: %@", v22];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v13, *(void *)(a1 + 40), v14, v15, v16, v17, v18, v20);
    uint64_t v12 = 0;
  }

  id result = v12;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (uint64_t)decodePrefetchArray:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x18C127630]();
        -[NSXPCStore decodePrefetchResult:forSources:context:](a1, v12, a3, a4);
        ++v11;
      }
      while (v9 != v11);
      uint64_t result = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v9 = result;
    }
    while (result);
  }
  return result;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, a4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        -[NSPersistentStoreCache incrementRefCountForObjectID:]((uint64_t)v5, *(const void **)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (uint64_t)_commitChangesForRequestContext:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a2) {
    id v4 = (void *)a2[5];
  }
  else {
    id v4 = 0;
  }
  id v5 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), 0);
  uint64_t v29 = a2;
  uint64_t v6 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), objc_msgSend((id)objc_msgSend(a2, "managedObjectContext"), "_queryGenerationToken"));
  if ([v4 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v37;
      BOOL v11 = v5 == v6 || v6 == 0;
      unint64_t v12 = 0x1E911F000uLL;
      uint64_t v30 = *(void *)v37;
      do
      {
        uint64_t v13 = 0;
        uint64_t v31 = v8;
        do
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v4);
          }
          long long v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
          if (v11)
          {
            uint64_t v15 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v5, *(const void **)(*((void *)&v36 + 1) + 8 * v13), *(double *)&NSSQLDistantPastTimeInterval);
            uint64_t v16 = [v4 objectForKey:v14];
            long long v17 = (void *)v16;
            if (v15)
            {
              BOOL v18 = v11;
              uint64_t v19 = v4;
              if (v16) {
                uint64_t v20 = *(void **)(v16 + *(int *)(v12 + 1552));
              }
              else {
                uint64_t v20 = 0;
              }
              unint64_t v21 = v12;
              uint64_t v22 = [v20 version];
              if (v22 == [*(id *)((char *)&v15->_os_unfair_lock_opaque + *(int *)(v21 + 1552)) version]) {
                -[NSPersistentCacheRow updateMissingRelationshipCachesFromOriginal:](v17, (uint64_t)v15);
              }
              -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v5, (uint64_t)v17, v14, 0);
              unint64_t v12 = v21;
              id v4 = v19;
              BOOL v11 = v18;
              uint64_t v9 = v30;
              uint64_t v8 = v31;
            }
            else
            {
              -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v5, v16, v14, 0);
            }
          }
          else
          {
            -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v5, *(const void **)(*((void *)&v36 + 1) + 8 * v13));
          }
          ++v13;
        }
        while (v8 != v13);
        uint64_t v23 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
        uint64_t v8 = v23;
      }
      while (v23);
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  if (v29) {
    uint64_t v24 = (void *)[(id)v29[2] deletedObjects];
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t result = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (result)
  {
    uint64_t v26 = result;
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v5, (const void *)[*(id *)(*((void *)&v32 + 1) + 8 * v28++) objectID]);
      }
      while (v26 != v28);
      uint64_t result = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
      uint64_t v26 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_executeSaveRequestForContext:(void *)a3 error:
{
  uint64_t v6 = (void *)[a2 managedObjectContext];
  uint64_t v7 = objc_alloc_init(NSCoreDataXPCMessage);
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_messageCode = 3;
    id v9 = -[NSXPCSaveRequestContext newEncodedSaveRequest](a2);
    objc_setProperty_nonatomic(v8, v10, v9, 24);
  }
  else
  {
    id v9 = -[NSXPCSaveRequestContext newEncodedSaveRequest](a2);
  }

  uint64_t v15 = 0;
  id v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](a1, v8, v6, &v15, a3);
  uint64_t v12 = (uint64_t)v11;
  if (a2) {
    a2[6] = v15;
  }
  if (v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v12 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v12, (uint64_t)a1, v13);
    if (objc_msgSend((id)objc_msgSend(NSNumber, "numberWithBool:", 1), "isEqual:", v12)) {
      -[NSXPCStore _commitChangesForRequestContext:]((uint64_t)a1, a2);
    }
  }

  return v12;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return (id)NSArray_EmptyArray;
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "entity"), "name");
        uint64_t v13 = (void *)[v7 objectForKey:v12];
        if (v13)
        {
          uint64_t v14 = [v13 integerValue] + 1;
          uint64_t v15 = NSNumber;
        }
        else
        {
          uint64_t v15 = NSNumber;
          uint64_t v14 = 1;
        }
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v15, "numberWithInteger:", v14), v12);
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v9);
  }
  uint64_t v16 = [v7 count];
  id v17 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v7);
  BOOL v18 = objc_alloc_init(NSCoreDataXPCMessage);
  uint64_t v20 = v18;
  if (v18)
  {
    v18->_messageCode = 4;
    objc_setProperty_nonatomic(v18, v19, v17, 24);
  }

  uint64_t v67 = 0;
  id v21 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v20, objc_msgSend((id)objc_msgSend(a3, "lastObject"), "managedObjectContext"), &v66, &v67);
  if (v21)
  {
    uint64_t v22 = (uint64_t)v21;
    uint64_t v54 = a4;
    uint64_t v55 = v20;
    size_t count = v16;
    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    long long v56 = self;
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
    uint64_t v31 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v22, (uint64_t)v56, v30);
    if ([v31 count]) {
      long long v32 = (void *)[MEMORY[0x1E4F1CA48] array];
    }
    else {
      long long v32 = 0;
    }
    if ([v31 count] != count)
    {

      uint64_t v48 = v54;
      if (!v54) {
        return 0;
      }
      uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F281F8];
      uint64_t v51 = (void *)MEMORY[0x1E4F1C9E8];
      long long v52 = @"Wrong number of object IDs returned from server";
      goto LABEL_43;
    }
    id v33 = -[NSKnownKeysMappingStrategy initForKeys:]([NSKnownKeysMappingStrategy alloc], "initForKeys:", [v31 allKeys]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v73 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v63;
LABEL_24:
      uint64_t v37 = 0;
      while (1)
      {
        if (*(void *)v63 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v62 + 1) + 8 * v37);
        uint64_t v39 = objc_msgSend((id)objc_msgSend(v31, "objectForKey:", v38), "count");
        if (v39 != objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v38), "unsignedIntegerValue")) {
          break;
        }
        if (v35 == ++v37)
        {
          uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v73 count:16];
          if (v35) {
            goto LABEL_24;
          }
          goto LABEL_30;
        }
      }

      uint64_t v48 = v54;
      if (!v54) {
        return 0;
      }
      uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F281F8];
      uint64_t v51 = (void *)MEMORY[0x1E4F1C9E8];
      long long v52 = @"Wrong number of object IDs returned from server (2)";
LABEL_43:
      long long v32 = 0;
      *uint64_t v48 = (id)objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, 134060, objc_msgSend(v51, "dictionaryWithObject:forKey:", v52, @"Reason"));
      return v32;
    }
LABEL_30:
    uint64_t v40 = malloc_type_calloc(count, 4uLL, 0x100004052888210uLL);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v41 = [a3 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v59 != v43) {
            objc_enumerationMutation(a3);
          }
          uint64_t v45 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * j), "entity"), "name");
          uint64_t v46 = (void *)[v31 objectForKey:v45];
          uint64_t v47 = [v33 indexForKey:v45];
          ++v40[v47];
          objc_msgSend(v32, "addObject:", objc_msgSend(v46, "objectAtIndex:"));
        }
        uint64_t v42 = [a3 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v42);
    }

    free(v40);
    uint64_t v20 = v55;
  }
  else
  {
    long long v32 = 0;
    if (a4) {
      *a4 = v67;
    }
  }

  return v32;
}

- (id)newForeignKeyID:(int64_t)a3 entity:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = objc_alloc([(NSXPCStore *)self objectIDFactoryForSQLEntity:a4]);

  return (id)[v5 initWithPK64:a3];
}

+ (BOOL)_isOnExtendedTimeout
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NSXPCStore_Internal___isOnExtendedTimeout__block_invoke;
  block[3] = &unk_1E544B4D0;
  block[4] = &v5;
  if (_isOnExtendedTimeout_onceToken != -1) {
    dispatch_once(&_isOnExtendedTimeout_onceToken, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__NSXPCStore_Internal___isOnExtendedTimeout__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  uint64_t result = [@"com.apple.internetaccounts" isEqual:v2];
  if ((result & 1) != 0
    || (uint64_t result = [@"com.apple.preferences.internetaccounts.remoteservices" isEqual:v2],
        result))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)_prepareStoreForRemovalFromCoordinator:(id)a3
{
  if ([(NSPersistentStore *)self _persistentStoreCoordinator] == a3)
  {
    os_unfair_lock_lock_with_options();
    if (a3 && (uint64_t v5 = self->_requestTerminationSem) != 0)
    {
      dispatch_retain(v5);
      requestTerminationSeuint64_t m = self->_requestTerminationSem;
      os_unfair_lock_unlock(&self->_stateLock);
      if (requestTerminationSem)
      {
        for (int i = 0; ; int i = 0)
        {
          atomic_compare_exchange_strong_explicit(&self->_outstandingRequests, (unsigned int *)&i, 0xFFF0BDC1, memory_order_relaxed, memory_order_relaxed);
          if (!i) {
            break;
          }
          dispatch_time_t v8 = dispatch_time(0, 10000000000);
          dispatch_semaphore_wait(requestTerminationSem, v8);
        }
        os_unfair_lock_lock_with_options();
        uint64_t v9 = self->_requestTerminationSem;
        if (v9)
        {
          dispatch_release(v9);
          self->_requestTerminationSeuint64_t m = 0;
        }
        os_unfair_lock_unlock(&self->_stateLock);
        dispatch_release(requestTerminationSem);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_stateLock);
    }
  }
}

- (id)ancillaryModels
{
  return self->_ancillaryModels;
}

- (id)ancillarySQLModels
{
  return self->_ancillarySQLModels;
}

- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4
{
  id v5 = objc_alloc([(NSXPCStore *)self objectIDFactoryForSQLEntity:a3]);

  return (id)[v5 initWithPK64:a4];
}

- (os_unfair_lock_s)_cachedRowForRelationship:(const void *)a3 onObjectWithID:(void *)a4 generation:
{
  if (result)
  {
    uint64_t v6 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(void *)&result[36]._os_unfair_lock_opaque, a4);
    double v7 = *(double *)&NSSQLDistantPastTimeInterval;
    return -[NSPersistentStoreCache toManyForSourceObjectID:forProperty:afterTimestamp:](v6, a3, a2, v7);
  }
  return result;
}

- (os_unfair_lock_s)_cachedRowForObjectWithID:(void *)a3 generation:
{
  if (result)
  {
    id v4 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(void *)&result[36]._os_unfair_lock_opaque, a3);
    uint64_t result = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v4, a2, *(double *)&NSSQLDistantPastTimeInterval);
    if (result) {
      return *(os_unfair_lock_s **)&result[10]._os_unfair_lock_opaque;
    }
  }
  return result;
}

- (void)_clearCachedRowForObjectWithID:(void *)a3 generation:
{
  if (a1)
  {
    id v4 = -[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), a3);
    -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v4, a2);
  }
}

- (void)decodePrefetchResult:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:
{
  uint64_t v110 = a3;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a2 objectAtIndex:0];
  uint64_t v8 = [a2 objectAtIndex:1];
  uint64_t v9 = objc_msgSend(-[NSPersistentStore _persistentStoreCoordinator](a1, "_persistentStoreCoordinator"), "managedObjectModel");
  if (v9 && (uint64_t v10 = (void *)[*(id *)(v9 + 32) objectForKey:v8]) != 0) {
    id v11 = objc_msgSend((id)objc_msgSend(v10, "propertiesByName"), "objectForKey:", v7);
  }
  else {
    id v11 = 0;
  }
  if ([v11 _propertyType] != 4) {
    return;
  }
  int v12 = [v11 isToMany];
  if (!v11) {
    return;
  }
  int v13 = v12;
  id v109 = (id)[a2 objectAtIndex:2];
  unint64_t v14 = [a2 count];
  if (v14 < 4) {
    return;
  }
  id v15 = (id)v14;
  uint64_t v16 = (NSManagedObject *)[a2 objectAtIndex:3];
  if (!v16) {
    return;
  }
  uint64_t v108 = v16;
  id defaultFaultHandler = v15;
  id v103 = a2;
  long long v112 = v11;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceReferenceDate");
  double v18 = v17;
  long long v113 = a1;
  uint64_t v111 = -[_NSQueryGenerationToken _generationalComponentForStore:]([(NSManagedObjectContext *)a4 _queryGenerationToken], a1);
  LODWORD(v104) = v13;
  if (v13)
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    uint64_t v19 = [v110 countByEnumeratingWithState:&v131 objects:v139 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v132 != v21) {
            objc_enumerationMutation(v110);
          }
          uint64_t v23 = *(void **)(*((void *)&v131 + 1) + 8 * i);
          if (-[NSEntityDescription _relationshipNamed:]((void *)[v23 entity], v7))
          {
            uint64_t v24 = (void *)[v23 objectID];
            uint64_t v25 = NSArray_EmptyArray;
            id v26 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)v113[1]._oidFactories, v111);
            -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v26, v25, 0, v24, v112, v18);
          }
        }
        uint64_t v20 = [v110 countByEnumeratingWithState:&v131 objects:v139 count:16];
      }
      while (v20);
    }
  }
  uint64_t v27 = objc_alloc_init(NSFetchRequest);
  -[NSFetchRequest setEntity:](v27, "setEntity:", [v112 destinationEntity]);
  [(NSFetchRequest *)v27 setResultType:0];
  v130 = 0;
  uint64_t v28 = (os_unfair_lock_s *)v113;
  id v29 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]((uint64_t)_NSXPCStoreUtilities, v108, v27, 0, v113, a4, &v130, 0);
  -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)v113, v130, v29, v111);

  uint64_t v30 = [v29 count];
  if (!v30)
  {

    return;
  }
  unint64_t v31 = v30;
  uint64_t v107 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v29];
  if ((unint64_t)defaultFaultHandler < 5) {
    long long v32 = 0;
  }
  else {
    long long v32 = (void *)[v103 lastObject];
  }
  id v103 = v32;
  if (v113) {
    id defaultFaultHandler = v113->_defaultFaultHandler;
  }
  else {
    id defaultFaultHandler = 0;
  }
  id v101 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  unint64_t v102 = v31;
  id v105 = v29;
  if (!v104)
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    uint64_t v46 = v112;
    id v109 = (id)[v110 countByEnumeratingWithState:&v118 objects:v136 count:16];
    if (!v109) {
      goto LABEL_110;
    }
    uint64_t v108 = *(NSManagedObject **)v119;
    while (1)
    {
      uint64_t v47 = 0;
      uint64_t v48 = v111;
      do
      {
        if (*(NSManagedObject **)v119 != v108) {
          objc_enumerationMutation(v110);
        }
        uint64_t v49 = *(void **)(*((void *)&v118 + 1) + 8 * (void)v47);
        uint64_t v50 = (void *)MEMORY[0x18C127630]();
        uint64_t v51 = (const void *)[v49 objectID];
        uint64_t v52 = [v49 primitiveValueForKey:v7];
        if (!v52)
        {
          uint64_t v55 = (void *)-[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v51, v48), "valueForPropertyDescription:", v46);
          goto LABEL_55;
        }
        uint64_t v53 = (void *)v52;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v54 = -[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v51, v48), "valueForPropertyDescription:", v46);
          if ([v53 isEqual:v54]) {
            uint64_t v55 = (void *)v54;
          }
          else {
            uint64_t v55 = 0;
          }
          goto LABEL_55;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ![v53 isFault]) {
          goto LABEL_71;
        }
        long long v58 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v51, v48);
        if (!v58)
        {
          uint64_t v55 = (void *)[v53 objectID];
          long long v62 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v55, v48);
          if (v62)
          {
            long long v63 = v62;
            uint64_t v46 = v112;
            if (a4)
            {
              id v64 = _PFRetainedObjectIDCore((uint64_t)a4, v55, 0, 1);
              id v57 = v64;
              if (v64)
              {
                int v65 = *((_DWORD *)v64 + 4);
                if ((v65 & 0x200) == 0) {
                  *((_DWORD *)v64 + 4) = v65 | 0x200;
                }
              }
            }
            else
            {
              id v57 = 0;
            }
            if ([v57 isFault]) {
              _PFFaultHandlerFulfillFault((uint64_t)defaultFaultHandler, (uint64_t)v57, (uint64_t)a4, v63, 0);
            }
            goto LABEL_62;
          }
          uint64_t v46 = v112;
LABEL_55:
          if (v55) {
            BOOL v56 = NSKeyValueCoding_NullValue == (void)v55;
          }
          else {
            BOOL v56 = 1;
          }
          if (!v56)
          {
            if (a4) {
              id v57 = _PFRetainedObjectIDCore((uint64_t)a4, v55, 0, 1);
            }
            else {
              id v57 = 0;
            }
            _PFFaultHandlerPreconnectRelationship((int)defaultFaultHandler, (unsigned int *)v49, v46, v57);
LABEL_62:
            [v107 removeObject:v57];

            goto LABEL_71;
          }
          goto LABEL_71;
        }
        long long v59 = (void *)[(os_unfair_lock_s *)v58 valueForPropertyDescription:v112];
        uint64_t v46 = v112;
        if (objc_msgSend((id)objc_msgSend(v53, "objectID"), "isEqual:", v59))
        {
          if (a4)
          {
            id v60 = _PFRetainedObjectIDCore((uint64_t)a4, v59, 0, 1);
            id v57 = v60;
            if (v60)
            {
              int v61 = *((_DWORD *)v60 + 4);
              if ((v61 & 0x200) == 0) {
                *((_DWORD *)v60 + 4) = v61 | 0x200;
              }
            }
          }
          else
          {
            id v57 = 0;
          }
          goto LABEL_62;
        }
LABEL_71:
        uint64_t v47 = (char *)v47 + 1;
      }
      while (v109 != v47);
      uint64_t v66 = (void *)[v110 countByEnumeratingWithState:&v118 objects:v136 count:16];
      id v109 = v66;
      if (!v66) {
        goto LABEL_110;
      }
    }
  }
  if (!objc_msgSend((id)objc_msgSend(v112, "inverseRelationship"), "isToMany"))
  {
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    uint64_t v110 = (void *)[v29 countByEnumeratingWithState:&v122 objects:v137 count:16];
    if (v110)
    {
      uint64_t v67 = 0;
      id v68 = 0;
      id v109 = *(id *)v123;
      do
      {
        for (uint64_t j = 0; j != v110; uint64_t j = (char *)j + 1)
        {
          long long v70 = v67;
          if (*(id *)v123 != v109) {
            objc_enumerationMutation(v105);
          }
          long long v71 = *(void **)(*((void *)&v122 + 1) + 8 * (void)j);
          long long v72 = (void *)MEMORY[0x18C127630]();
          uint64_t v67 = (NSManagedObject *)-[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:](v28, (const void *)[v71 objectID], v111), "valueForPropertyDescription:", objc_msgSend(v112, "inverseRelationship"));
          if ([v112 inverseRelationship] && !-[NSManagedObject isEqual:](v70, "isEqual:", v67))
          {
            if (v68)
            {
              long long v73 = v68;
              uint64_t v108 = v67;
              id v104 = (void *)-[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:](v28, (const void *)objc_msgSend((id)objc_msgSend(v68, "lastObject"), "objectID"), v111), "valueForPropertyDescription:", objc_msgSend(v112, "inverseRelationship"));
              long long v74 = -[NSManagedObjectContext objectWithID:](a4, "objectWithID:");
              uint64_t v75 = [[_NSFaultingMutableSet alloc] initWithSource:v74 destinations:v73 forRelationship:v112 inContext:a4];
              if ([v112 isOrdered])
              {
                uint64_t v76 = [v73 valueForKey:@"objectID"];
              }
              else
              {
                uint64_t v77 = v73;
                id v78 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v79 = [v77 valueForKey:@"objectID"];
                uint64_t v80 = v78;
                long long v73 = v77;
                uint64_t v76 = [v80 setWithArray:v79];
              }
              uint64_t v81 = (void *)v76;
              uint64_t v28 = (os_unfair_lock_s *)v113;
              id v82 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)v113[1]._oidFactories, v111);
              -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v82, v81, 0, v104, v112, v18);
              _PFFaultHandlerPreconnectRelationship((int)defaultFaultHandler, v74, v112, v75);
              [v107 minusSet:v75];

              uint64_t v67 = v108;
            }
            id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v68 addObject:v71];
        }
        uint64_t v110 = (void *)[v105 countByEnumeratingWithState:&v122 objects:v137 count:16];
      }
      while (v110);
      if (!v68 || ![v68 count]) {
        goto LABEL_109;
      }
      uint64_t v83 = v111;
      uint64_t v84 = (void *)-[os_unfair_lock_s valueForPropertyDescription:](-[NSXPCStore _cachedRowForObjectWithID:generation:](v28, (const void *)objc_msgSend((id)objc_msgSend(v68, "lastObject"), "objectID"), v111), "valueForPropertyDescription:", objc_msgSend(v112, "inverseRelationship"));
      id v85 = [(NSManagedObjectContext *)a4 objectWithID:v84];
      uint64_t v86 = [[_NSFaultingMutableSet alloc] initWithSource:v85 destinations:v68 forRelationship:v112 inContext:a4];
      if ([v112 isOrdered])
      {
        uint64_t v87 = (void *)[v68 valueForKey:@"objectID"];
      }
      else
      {
        uint64_t v83 = v111;
        uint64_t v87 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(v68, "valueForKey:", @"objectID"));
      }
      -[NSXPCStore cacheContents:ofRelationship:onObjectWithID:withTimestamp:generation:]((uint64_t)v28, v87, v112, v84, v83, v18);
      _PFFaultHandlerPreconnectRelationship((int)defaultFaultHandler, v85, v112, v86);
      [v107 minusSet:v86];
    }
    id v68 = 0;
LABEL_109:

    goto LABEL_110;
  }
  unint64_t v33 = [v109 count];
  if (v33 >= 2)
  {
    uint64_t v34 = 0;
    id v104 = (void *)(v33 >> 1);
    do
    {
      uint64_t v110 = (void *)MEMORY[0x18C127630]();
      uint64_t v35 = (void *)[v109 objectAtIndex:2 * (void)v34];
      uint64_t v108 = [(NSManagedObjectContext *)a4 objectWithID:v35];
      uint64_t v36 = (void *)[v109 objectAtIndex:(2 * (void)v34) | 1];
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      uint64_t v38 = [v36 countByEnumeratingWithState:&v126 objects:v138 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v127;
        do
        {
          uint64_t v41 = 0;
          do
          {
            if (*(void *)v127 != v40) {
              objc_enumerationMutation(v36);
            }
            if (a4) {
              id v42 = _PFRetainedObjectIDCore((uint64_t)a4, *(void **)(*((void *)&v126 + 1) + 8 * v41), 0, 1);
            }
            else {
              id v42 = 0;
            }
            [v37 addObject:v42];

            ++v41;
          }
          while (v39 != v41);
          uint64_t v43 = [v36 countByEnumeratingWithState:&v126 objects:v138 count:16];
          uint64_t v39 = v43;
        }
        while (v43);
      }
      if (([v112 isOrdered] & 1) == 0) {
        uint64_t v36 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v36];
      }
      id v44 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)v113[1]._oidFactories, v111);
      -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v44, v36, 0, v35, v112, v18);
      uint64_t v45 = [[_NSFaultingMutableSet alloc] initWithSource:v108 destinations:v37 forRelationship:v112 inContext:a4];
      _PFFaultHandlerPreconnectRelationship((int)defaultFaultHandler, (unsigned int *)v108, v112, v45);
      [v107 minusSet:v45];

      uint64_t v34 = (char *)v34 + 1;
    }
    while (v34 != v104);
  }
LABEL_110:
  [v101 drain];
  id v88 = v105;
  if (v103) {
    -[NSXPCStore decodePrefetchArray:forSources:context:](v113, v103, v105, a4);
  }
  unint64_t v89 = v102;
  if (v102 >= 0x201) {
    uint64_t v90 = 1;
  }
  else {
    uint64_t v90 = v102;
  }
  unint64_t v91 = (8 * v90 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v92 = (char *)&v100 - v91;
  if (v102 > 0x200) {
    uint64_t v92 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v100 - v91, 8 * v102);
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v93 = [v88 countByEnumeratingWithState:&v114 objects:v135 count:16];
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = 0;
    uint64_t v96 = *(void *)v115;
    do
    {
      for (uint64_t k = 0; k != v94; ++k)
      {
        if (*(void *)v115 != v96) {
          objc_enumerationMutation(v88);
        }
        *(void *)&v92[8 * v95 + 8 * k] = [*(id *)(*((void *)&v114 + 1) + 8 * k) objectID];
      }
      uint64_t v94 = [v88 countByEnumeratingWithState:&v114 objects:v135 count:16];
      v95 += k;
    }
    while (v94);
  }
  uint64_t v98 = v107;
  uint64_t v99 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v107);
  [(NSPersistentStore *)v113 managedObjectContextDidUnregisterObjectsWithIDs:v99 generation:v111];

  if (v89 >= 0x201) {
    NSZoneFree(0, v92);
  }
}

- (void)cacheContents:(void *)a3 ofRelationship:(void *)a4 onObjectWithID:(void *)a5 withTimestamp:(double)a6 generation:
{
  id v10 = -[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), a5);

  -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]((uint64_t)v10, a2, 0, a4, a3, a6);
}

+ (void)setDebugDefault:(int)a3
{
  dword_1E9122F14 = a3;
}

- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4
{
  uint64_t v6 = _sqlEntityForEntityDescription((uint64_t)self->_model, a3);

  return [(NSXPCStore *)self newObjectIDForEntity:v6 pk:a4];
}

- (id)connectionManager
{
  return self->_connectionManager;
}

- (id)fileBackedFuturesDirectory
{
  return self->_fileBackedFuturesDirectory;
}

@end