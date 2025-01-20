@interface _NSXPCStoreUtilities
+ (_PFResultArray)_decodeBufferResultSetData:(void *)a3 forFetchRequest:(uint64_t)a4 options:(uint64_t)a5 store:(uint64_t)a6 context:(uint64_t)a7 rowCacheRows:(uint64_t *)a8 error:;
+ (id)_decodeResultSetData:(NSFetchRequest *)a3 forFetchRequest:(char)a4 options:(NSPersistentStore *)a5 store:(NSManagedObjectContext *)a6 context:(void *)a7 rowCacheRows:(void *)a8 error:;
+ (id)newSecureArchivedDataWithRootObject:(uint64_t)a1;
+ (uint64_t)classesForErrorArchive;
+ (uint64_t)classesForFetchArchive;
+ (uint64_t)classesForSaveArchive;
+ (uint64_t)decodeSecureArchivedData:(uint64_t)a3 usingDelegate:(uint64_t)a4 classes:;
+ (uint64_t)newUserInfoFromException:(uint64_t)a1;
+ (void)logMessage:(uint64_t)a3 forComponent:(uint64_t)a4;
@end

@implementation _NSXPCStoreUtilities

+ (uint64_t)classesForFetchArchive
{
  self;
  if (!classesForFetchArchive_archiveClasses)
  {
    id v0 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v1 = objc_opt_class();
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
    Class v11 = NSClassFromString((NSString *)@"_NSPredicateUtilities");
    [v10 unionSet:-[objc_class _compoundPredicateClassesForSecureCoding](NSClassFromString((NSString *)@"_NSPredicateUtilities"), "_compoundPredicateClassesForSecureCoding")];
    objc_msgSend(v10, "unionSet:", -[objc_class _extendedExpressionClassesForSecureCoding](v11, "_extendedExpressionClassesForSecureCoding"));
    objc_msgSend(v10, "unionSet:", -[objc_class _operatorClassesForSecureCoding](v11, "_operatorClassesForSecureCoding"));
    objc_msgSend(v10, "unionSet:", -[objc_class _constantValueClassesForSecureCoding](v11, "_constantValueClassesForSecureCoding"));
    [v10 addObject:NSClassFromString((NSString *)@"NSBoundedByPredicateOperator")];
    objc_msgSend(v10, "addObjectsFromArray:", +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving"));
    Class v12 = NSClassFromString((NSString *)@"_NSXPCStoreObjectIDArrayConstantValueExpression");
    if (v12) {
      [v10 addObject:v12];
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v10];

    uint64_t v14 = 0;
    atomic_compare_exchange_strong(&classesForFetchArchive_archiveClasses, (unint64_t *)&v14, (unint64_t)v13);
    if (v14) {
  }
    }
  return classesForFetchArchive_archiveClasses;
}

+ (uint64_t)decodeSecureArchivedData:(uint64_t)a3 usingDelegate:(uint64_t)a4 classes:
{
  self;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a2 error:0];
  [v7 setDelegate:a3];
  uint64_t v8 = [v7 decodeObjectOfClasses:a4 forKey:@"root"];

  return v8;
}

+ (id)newSecureArchivedDataWithRootObject:(uint64_t)a1
{
  self;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:a2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (id)_decodeResultSetData:(NSFetchRequest *)a3 forFetchRequest:(char)a4 options:(NSPersistentStore *)a5 store:(NSManagedObjectContext *)a6 context:(void *)a7 rowCacheRows:(void *)a8 error:
{
  v369[2] = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v15 = [a2 bytes];
  unint64_t v16 = [a2 length];
  if (v16 <= 7)
  {
    if (!a8) {
      return 0;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = @"CoreData: XPC: Suspect response from server (bad size)";
    goto LABEL_11;
  }
  if (v15 >= v15 + v16)
  {
    if (!a8) {
      return 0;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = @"CoreData: XPC: Suspect response from server (no result)";
    goto LABEL_11;
  }
  if (*(void *)v15 != 1) {
    goto LABEL_17;
  }
  if (v16 <= 0x13)
  {
    if (!a8) {
      return 0;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = @"CoreData: XPC: Suspect response from server (missing size)";
    goto LABEL_11;
  }
  if (!*(_DWORD *)(v15 + 16))
  {
LABEL_17:
    v25 = NSArray_EmptyArray;
    return v25;
  }
  if (v16 - 16 <= 0x6F)
  {
    if (!a8) {
      return 0;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = @"CoreData: XPC: Suspect response from server (not enough room for fetch results header)";
    goto LABEL_11;
  }
  *(double *)(v15 + 40) = (double)(unint64_t)*(double *)(v15 + 40);
  *(void *)(v15 + 96) = v15 + 128;
  uint64_t v27 = *(unsigned int *)(v15 + 52);
  if ((uint64_t)(v16 - 128) < 8 * ((v27 + 1) + v27))
  {
    if (!a8) {
      return 0;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = @"CoreData: XPC: Suspect response from server (not enough room for buffers and sizes)";
LABEL_11:
    uint64_t v21 = [v19 dictionaryWithObject:v20 forKey:@"Reason"];
    v22 = v17;
    uint64_t v23 = v18;
    goto LABEL_12;
  }
  uint64_t v28 = v15 + 128 + 8 * v27 + 8;
  *(void *)(v15 + 104) = v28;
  if (v27)
  {
    uint64_t v29 = 0;
    uint64_t v30 = 8 * v27;
    uint64_t v31 = v28 + v30;
    do
    {
      *(void *)(*(void *)(v15 + 96) + v29) = v15 + *(void *)(v31 + v29);
      v29 += 8;
    }
    while (v30 != v29);
    uint64_t v32 = **(void **)(v15 + 96);
    *(void *)(v15 + 112) = v32;
    *(void *)(v15 + 120) = v32;
  }
  unint64_t v338 = v15 + v16;
  v329 = a7;
  *(_DWORD *)(v15 + 80) |= 2u;
  if (*(_DWORD *)(v15 + 36) >> 30) {
    unsigned int v33 = 0;
  }
  else {
    unsigned int v33 = *(_DWORD *)(v15 + 36);
  }
  v34 = PF_ALLOCATE_OBJECT_ARRAY((int)v33);
  if (v34) {
    uint64_t v35 = v33;
  }
  else {
    uint64_t v35 = 0;
  }
  uint64_t v336 = v35;
  v337 = v34;
  Initialize = fetchPlanAllocateInitialize(a3, a5, a6);
  if ([(NSFetchRequest *)a3 resultType] != 2
    && ([(NSFetchRequest *)a3 resultType]
     || ![(NSArray *)[(NSFetchRequest *)a3 propertiesToFetch] count]))
  {
    v339 = (uint64_t *)a5;
    v353 = 0;
    int v349 = 0;
    propertyMapping = 0;
    unint64_t plan_for_entity = 0;
    id v331 = 0;
    v44 = 0;
    goto LABEL_44;
  }
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  v39 = a5;
  if (v37 != v38) {
    v39 = (NSPersistentStore *)[(NSPersistentStore *)a5 sqlCore];
  }
  v40 = v39;
  if (!v40)
  {
    if (!a8) {
      return 0;
    }
    v364[0] = @"Reason";
    v364[1] = @"FetchRequest";
    v365[0] = @"CoreData: XPC: Store is missing core";
    if (a3) {
      v75 = [(NSFetchRequest *)a3 description];
    }
    else {
      v75 = @"no fetch request";
    }
    v365[1] = v75;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v365 forKeys:v364 count:2];
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F281F8];
LABEL_12:
    uint64_t v24 = 0;
    *a8 = [v22 errorWithDomain:v23 code:134060 userInfo:v21];
    return (id)v24;
  }
  v41 = v40;
  v42 = (void *)[(NSFetchRequest *)a3 copy];
  [v42 setPredicate:0];
  v353 = (_PFFetchPlanHeader *)v41;
  v43 = (void *)-[NSSQLiteAdapter newSelectStatementWithFetchRequest:ignoreInheritance:]([(NSPersistentStore *)v41 adapter], v42, 0);
  if (!v43)
  {
    v69 = v353;
    if (a8)
    {
      v368[0] = @"Reason";
      v368[1] = @"FetchRequest";
      v369[0] = @"CoreData: XPC: Suspect fetch request failed to generate statement";
      if (v42) {
        v93 = (__CFString *)[v42 description];
      }
      else {
        v93 = @"no fetch request";
      }
      v369[1] = v93;
      uint64_t v259 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v369 forKeys:v368 count:2];
      *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v259];
    }
    if (Initialize) {

    }
    goto LABEL_376;
  }
  v44 = (unint64_t *)v43[6];
  if (!v44)
  {
    v69 = v353;
    if (a8)
    {
      v106 = v43;
      v366[0] = @"Reason";
      v366[1] = @"FetchRequest";
      v367[0] = @"CoreData: XPC: Suspect statement generated - entity missing";
      if (v42) {
        v107 = (__CFString *)[v42 description];
      }
      else {
        v107 = @"no fetch request";
      }
      v367[1] = v107;
      uint64_t v279 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v367 forKeys:v366 count:2];
      *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v279];
      v43 = v106;
    }
    if (Initialize)
    {
      v280 = v43;

      v43 = v280;
    }

LABEL_376:
    goto LABEL_377;
  }
  v339 = (uint64_t *)a5;
  id v331 = v43;
  Initialize->statement_entity = (NSSQLEntity *)v44;
  *(_DWORD *)&Initialize->flags &= ~1u;
  unint64_t plan_for_entity = _sql_read_only_fetch_plan_for_entity(v44);
  statement_entity = Initialize->statement_entity;
  if (statement_entity) {
    propertyMapping = statement_entity->_propertyMapping;
  }
  else {
    propertyMapping = 0;
  }

  int v349 = 1;
LABEL_44:
  unint64_t v350 = plan_for_entity;
  uint64_t v47 = [v339 model];
  uint64_t v48 = v47;
  if (v47) {
    int v49 = *(_DWORD *)(v47 + 60);
  }
  else {
    int v49 = 0;
  }
  v335 = Initialize;
  uint64_t v50 = [v44 model];
  v347 = a6;
  if (v50) {
    int v51 = *(_DWORD *)(v50 + 60);
  }
  else {
    int v51 = 0;
  }
  if (v49 != v51)
  {
    long long v359 = 0u;
    long long v360 = 0u;
    long long v357 = 0u;
    long long v358 = 0u;
    v355 = (char *)[(_PFFetchPlanHeader *)v353 ancillarySQLModels];
    uint64_t v59 = [v355 countByEnumeratingWithState:&v357 objects:v363 count:16];
    if (!v59) {
      goto LABEL_68;
    }
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v358;
    while (1)
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v358 != v61) {
          objc_enumerationMutation(v355);
        }
        uint64_t v48 = objc_msgSend((id)-[_PFFetchPlanHeader ancillarySQLModels](v353, "ancillarySQLModels"), "objectForKeyedSubscript:", *(void *)(*((void *)&v357 + 1) + 8 * v62));
        uint64_t v63 = [v44 model];
        if (v63)
        {
          v64 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
          int v65 = *(_DWORD *)(v63 + 60);
          if (v48) {
            goto LABEL_61;
          }
        }
        else
        {
          int v65 = 0;
          v64 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
          if (v48)
          {
LABEL_61:
            int v66 = *(_DWORD *)(v48 + v64[175]);
            goto LABEL_62;
          }
        }
        int v66 = 0;
LABEL_62:
        if (v65 == v66) {
          goto LABEL_49;
        }
        ++v62;
      }
      while (v60 != v62);
      uint64_t v67 = [v355 countByEnumeratingWithState:&v357 objects:v363 count:16];
      uint64_t v60 = v67;
      if (!v67)
      {
LABEL_68:
        v68 = v44;
        v69 = v335;
        v70 = v353;
        if (a8)
        {
          v362[0] = @"CoreData: XPC: Unable to find entity in model";
          v361[0] = @"Reason";
          v361[1] = @"EntityOffset";
          v71 = NSNumber;
          uint64_t v72 = [v68 model];
          if (v72) {
            uint64_t v73 = *(unsigned int *)(v72 + 60);
          }
          else {
            uint64_t v73 = 0;
          }
          v362[1] = [v71 numberWithUnsignedInt:v73];
          uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v362 forKeys:v361 count:2];
          *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v74];
        }

        if (!v69) {
          return 0;
        }
LABEL_377:

        return 0;
      }
    }
  }
LABEL_49:
  uint64_t v52 = 0;
  unint64_t flags = v335->flags;
  uint64_t v54 = (flags >> 2) & 7;
  uint64_t v55 = **(void **)(v15 + 96);
  uint64_t v326 = v54;
  if (v339 && v54 == 3) {
    uint64_t v52 = v339[6];
  }
  v56 = v335;
  uint64_t v57 = [(NSFetchRequest *)v335->fetch_request _disablePersistentStoreResultCaching];
  v311 = v44;
  int v310 = v57;
  uint64_t v313 = v52;
  BOOL v58 = (a4 & 1) != 0 || (*(unsigned char *)&v335->flags & 1) == 0;
  v324 = &v292;
  unint64_t v321 = flags;
  BOOL v317 = v58;
  char v76 = v58 & (v349 ^ 1);
  int v77 = v349 | ((flags & 2) >> 1);
  MEMORY[0x1F4188790](v57);
  unint64_t v325 = v80;
  if (v80 > 0x200)
  {
    v81 = NSAllocateScannedUncollectable();
    v332 = v81;
  }
  else
  {
    v332 = (uint64_t *)((char *)&v292 - v79);
    bzero((char *)&v292 - v79, 8 * v78);
  }
  MEMORY[0x1F4188790](v81);
  size_t v84 = 8 * v82;
  unint64_t v323 = v85;
  if (v85 > 0x200)
  {
    v330 = (char *)NSAllocateScannedUncollectable();
    v322 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v330 = (char *)&v292 - v83;
    bzero((char *)&v292 - v83, 8 * v82);
    MEMORY[0x1F4188790](v86);
    v322 = (char *)&v292 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v322, v84);
  }
  char v87 = v76 & (v332 == 0);
  unint64_t v88 = v338;
  unint64_t v89 = v350;
  if ((v87 & 1) != 0 || (v77 & 1) == 0 && (!v330 || !v322))
  {
    PF_FREE_OBJECT_ARRAY(v337);
    uint64_t v336 = 0;
    v337 = 0;
  }
  if ((uint64_t)(v88 - v55) <= 31)
  {
    v90 = v353;
    v91 = v337;
    unint64_t v92 = v323;
    if (a8) {
      *a8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"CoreData: XPC: Suspect response from server (not enough room for first row)", @"Reason"));
    }
    goto LABEL_400;
  }
  if (v349) {
    Class v309 = 0;
  }
  else {
    Class v309 = (Class)[v339 objectIDFactoryForSQLEntity:v56->statement_entity];
  }
  v299 = sel_setForeignEntityKeySlot_entityKey_;
  uint64_t v298 = +[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v297 = sel_setForeignOrderKeySlot_orderKey_;
  uint64_t v296 = +[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v303 = sel_setForeignKeySlot_int64_;
  v302 = (void (*)(id, char *, void, uint64_t))+[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v301 = sel_setOptLock_;
  uint64_t v94 = +[NSSQLRow instanceMethodForSelector:](NSSQLRow, "instanceMethodForSelector:");
  v300 = (void (*)(id, char *, uint64_t))v94;
  if (v349)
  {
    v95 = v335;
    entity_for_ek_funptr = (uint64_t (*)(uint64_t, char *, void))v335->entity_for_ek_funptr;
    v318 = sel_entityForID_;
    v319 = entity_for_ek_funptr;
    goto LABEL_114;
  }
  v95 = v335;
  if (v317)
  {
    int v97 = v336;
    uint64_t v94 = [(objc_class *)v309 allocateBatch:v332 count:v336];
    if (v97 == v94)
    {
      int v104 = v336;
      if ((v321 & 2) != 0 || !v336)
      {
        if (!v336) {
          goto LABEL_339;
        }
      }
      else
      {
        uint64_t v94 = +[NSSQLRow newBatchRowAllocation:v330 count:v336 forSQLEntity:v95->statement_entity withOwnedObjectIDs:v332 andTimestamp:*(double *)(v15 + 40)];
        if (v104 != v94)
        {
          v105 = @"Decoding failed: No rows.";
LABEL_338:
          _NSCoreDataLog(8, (uint64_t)v105, v98, v99, v100, v101, v102, v103, v292);
LABEL_339:
          v258 = v337;
          goto LABEL_340;
        }
      }
      v318 = 0;
      v319 = 0;
      int v108 = v336;
      unint64_t v89 = v350;
      goto LABEL_115;
    }
    v105 = @"Decoding failed: No oids.";
    goto LABEL_338;
  }
  v318 = 0;
  v319 = 0;
LABEL_114:
  int v108 = v336;
  if (!v336)
  {
    v258 = v337;
    if (!v337)
    {
LABEL_341:
      v260 = v353;
      v261 = v332;
      if (v323 >= 0x201 && v330)
      {
        NSZoneFree(0, v330);
        NSZoneFree(0, v322);
      }
      if (v325 >= 0x201 && v261) {
        NSZoneFree(0, v261);
      }

      return (id)NSArray_EmptyArray;
    }
LABEL_340:
    PF_FREE_OBJECT_ARRAY(v258);
    goto LABEL_341;
  }
LABEL_115:
  if (v108 < 1) {
    goto LABEL_349;
  }
  uint64_t v109 = 0;
  Class v293 = 0;
  uint64_t v294 = 0;
  uint64_t v354 = 0;
  v305 = 0;
  uint64_t v292 = 0;
  v334 = @"TOMBSTONE";
  uint64_t v306 = v336;
  uint64_t v307 = v48;
  int v308 = v77;
  while (1)
  {
    v320 = &v292;
    MEMORY[0x1F4188790](v94);
    unsigned int v316 = v112;
    if (v112 > 0x200)
    {
      uint64_t v94 = NSAllocateScannedUncollectable();
      v348 = (char *)v94;
    }
    else
    {
      v348 = (char *)&v292 - v111;
      bzero((char *)&v292 - v111, 8 * v110);
    }
    uint64_t v113 = v55;
    while ((*(_DWORD *)v113 & 0x80000000) != 0)
    {
      uint64_t v114 = *(unsigned int *)(v113 + 4);
      if ((v114 & 0x80000000) != 0) {
        uint64_t v113 = 0;
      }
      else {
        uint64_t v113 = *(void *)(*(void *)(v15 + 96) + 8 * v114) + *(void *)(v113 + 16);
      }
    }
    uint64_t v115 = v88 - v113;
    if (v115 <= 31)
    {
      v90 = v353;
      v91 = v337;
      unint64_t v92 = v323;
      if (a8)
      {
        v281 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v282 = *MEMORY[0x1E4F281F8];
        v283 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v284 = objc_msgSend(NSString, "stringWithFormat:", @"CoreData: XPC: Suspect response from server (not enough room for row %d)", v109);
        goto LABEL_397;
      }
      goto LABEL_399;
    }
    uint64_t v328 = v113;
    if (v349)
    {
      v116 = 0;
      if ((v321 & 2) != 0)
      {
        unint64_t v350 = v89;
LABEL_141:
        v122 = v347;
LABEL_142:
        v125 = 0;
        uint64_t v126 = v354;
        switch((int)v326)
        {
          case 0:
          case 3:
          case 5:
            v125 = (NSKnownKeysDictionary *)-[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v122, v116, v313);

            break;
          case 1:
            v125 = v116;
            break;
          default:
            goto LABEL_324;
        }
        goto LABEL_324;
      }
      uint64_t v354 = 0;
      v117 = v311;
      id v312 = 0;
      v327 = 0;
      v122 = v347;
    }
    else
    {
      v117 = (void *)_sqlEntityForEntityID(v48, *(unsigned int *)(v113 + 8));
      if (v117 != v305)
      {
        Class v309 = (Class)[v339 objectIDFactoryForSQLEntity:v117];
        v305 = v117;
      }
      if (v317)
      {
        v118 = v117;
        unint64_t v350 = v89;
        uint64_t v119 = v109;
        v120 = v332;
        unint64_t v121 = v332[v119];
        uint64_t v94 = _PFSetPrimaryKey(v121, *(void *)(v328 + 24));
        if (v121 == v94)
        {
          uint64_t v109 = v119;
          if ((v321 & 2) != 0)
          {
            v116 = (NSKnownKeysDictionary *)v121;
            goto LABEL_141;
          }
        }
        else
        {
          v116 = (NSKnownKeysDictionary *)v94;
          v120[v119] = v94;
          uint64_t v109 = v119;
          if ((v321 & 2) != 0) {
            goto LABEL_141;
          }
          [*(id *)&v330[8 * v119] setObjectID:v94];
          unint64_t v121 = (unint64_t)v116;
        }
        v124 = *(void **)&v330[8 * v109];
        v116 = (NSKnownKeysDictionary *)v121;
        v117 = v118;
        v122 = v347;
      }
      else
      {
        id v123 = [v309 alloc];
        uint64_t v94 = [v123 initWithPK64:*(void *)(v328 + 24)];
        v116 = (NSKnownKeysDictionary *)v94;
        v122 = v347;
        if ((v321 & 2) != 0)
        {
          unint64_t v350 = v89;
          goto LABEL_142;
        }
        v124 = objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v117), "initWithSQLEntity:ownedObjectID:andTimestamp:", v117, v94, *(double *)(v15 + 40));
        *(void *)&v330[8 * v109] = v124;
      }
      id v312 = v124;
      v327 = (char *)v124[5];
      unint64_t v89 = _sql_fetch_plan_for_entity((unint64_t *)v117);
      uint64_t v113 = v328;
    }
    if (v115 < *(int *)v89)
    {
      v90 = v353;
      v91 = v337;
      unint64_t v92 = v323;
      if (a8)
      {
        v281 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v282 = *MEMORY[0x1E4F281F8];
        v283 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v284 = objc_msgSend(NSString, "stringWithFormat:", @"CoreData: XPC: Suspect response from server (remaining space for %d smaller than estimated size)", v109);
        goto LABEL_397;
      }
      goto LABEL_399;
    }
    v295 = v116;
    uint64_t v304 = v109;
    uint64_t v127 = *(unsigned int *)(v89 + 4);
    unint64_t v350 = v89;
    uint64_t v126 = v354;
    if (v127) {
      break;
    }
LABEL_316:
    if (v349)
    {
      v251 = [NSKnownKeysDictionary alloc];
      v125 = [(NSKnownKeysDictionary *)v251 initWithSearchStrategy:propertyMapping];
      uint64_t v94 = [(NSKnownKeysDictionary *)v125 _setValues:v348 retain:0];
      uint64_t v109 = v304;
    }
    else
    {
      id v252 = v312;
      [v312 knownKeyValuesPointer];
      uint64_t v109 = v304;
      *(void *)&v322[8 * v304] = v252;
      v253 = v327;
      uint64_t v94 = v327;
      *(void *)&v330[8 * v109] = v94;
      if (a4)
      {
        uint64_t v94 = v253;
LABEL_322:
        v125 = (NSKnownKeysDictionary *)v94;
      }
      else
      {
        v125 = 0;
        v254 = v295;
        switch((int)v326)
        {
          case 0:
          case 3:
          case 5:
            uint64_t v94 = (uint64_t)-[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v122, v295, v313);
            goto LABEL_322;
          case 1:
            uint64_t v94 = (uint64_t)_PFfastOidRetain(0, v295);
            v125 = v254;
            break;
          default:
            break;
        }
      }
    }
LABEL_324:
    *((void *)v337 + v109) = v125;
    uint64_t v255 = *(unsigned int *)(v328 + 4);
    if ((v255 & 0x80000000) != 0 || (uint64_t v256 = *(void *)(*(void *)(v15 + 96) + 8 * v255)) == 0)
    {
      int v77 = v308;
LABEL_349:
      int v262 = v77;
      if (v326 > 5) {
        uint64_t v263 = 10;
      }
      else {
        uint64_t v263 = dword_18AE54090[v326];
      }
      v264 = v353;
      uint64_t v266 = v336;
      v265 = v337;
      v267 = [_PFArray alloc];
      uint64_t v24 = [(_PFArray *)v267 initWithObjects:v265 count:v266 andFlags:v263 andContext:v347];
      if ((v262 | v310))
      {
        BOOL v268 = 0;
        v269 = v330;
        v270 = v335;
      }
      else
      {
        v353 = v264;
        v271 = v329;
        BOOL v268 = v329 != 0;
        v270 = v335;
        if (v329)
        {
          v272 = [_PFArray alloc];
          void *v271 = [(_PFArray *)v272 initWithObjects:v322 count:v266 andFlags:26 andContext:v347];
        }
        v269 = v330;
        v264 = v353;
        if ((int)v266 < 1) {
          goto LABEL_364;
        }
        uint64_t v273 = (int)v266;
        v274 = (void **)v330;
        do
        {
          v275 = *v274++;

          --v273;
        }
        while (v273);
        v264 = v353;
      }
      if (((v262 | v268) & 1) == 0 && (int)v266 >= 1)
      {
        uint64_t v276 = (int)v266;
        v277 = (void **)v322;
        do
        {
          v278 = *v277++;

          --v276;
        }
        while (v276);
      }
LABEL_364:
      if (v323 >= 0x201)
      {
        NSZoneFree(0, v269);
        NSZoneFree(0, v322);
      }
      if (v325 >= 0x201) {
        NSZoneFree(0, v332);
      }
      if (v270) {

      }
      return (id)v24;
    }
    uint64_t v354 = v126;
    uint64_t v257 = *(void *)(v328 + 16);
    if (v316 >= 0x201) {
      NSZoneFree(0, v348);
    }
    uint64_t v55 = v256 + v257;
    ++v109;
    uint64_t v48 = v307;
    unint64_t v88 = v338;
    unint64_t v89 = v350;
    int v77 = v308;
    if (v109 == v306) {
      goto LABEL_349;
    }
  }
  v128 = 0;
  unint64_t v129 = 0;
  v343 = v117;
  uint64_t v344 = 0;
  uint64_t v333 = 0;
  int v130 = 0;
  uint64_t v131 = 0;
  v132 = (unsigned __int8 *)(v113 + 32);
  BOOL v342 = v348 != 0;
  v315 = v327 + 28;
  uint64_t v341 = 24 * v127;
  while (2)
  {
    uint64_t v354 = v126;
    uint64_t v133 = v131;
    CFDataRef v134 = (CFDataRef)&v128[v89];
    int v135 = v128[v89 + 20];
    if ((v135 - 2) > 6) {
      uint64_t v136 = 3;
    }
    else {
      uint64_t v136 = qword_18AE54058[(char)(v135 - 2)];
    }
    v132 = (unsigned __int8 *)((unint64_t)&v132[v136] & ~v136);
    if (*((unsigned char *)v134 + 16))
    {
      int v138 = *v132++;
      BOOL v137 = v138 != 0;
    }
    else
    {
      BOOL v137 = 0;
    }
    uint64_t v139 = 0;
    v355 = v128;
    unint64_t v351 = v129;
    int v352 = v130;
    if (((v129 > 6) & v130) == 1 && !v137)
    {
      BOOL v345 = v137;
      CFDataRef v346 = (CFDataRef)&v128[v89];
      unsigned int v340 = v131;
      v140 = v132;
      uint64_t v139 = v344;
      if (!v344)
      {
        uint64_t v141 = [v339 model];
        uint64_t v139 = v319(v141, v318, (int)v333);
      }
      id v142 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (void *)v139);
      v143 = objc_msgSend((id)objc_msgSend(*(id *)&v355[v89 + 24], "propertyDescription"), "name");
      int v144 = objc_msgSend((id)objc_msgSend(v143, "stringByReplacingOccurrencesOfString:withString:", v334, &stru_1ED787880), "intValue");
      int v145 = [v142 count];
      uint64_t v344 = v139;
      if (v144 >= v145)
      {
        uint64_t v139 = 0;
      }
      else
      {
        uint64_t v146 = [v142 objectAtIndexedSubscript:v144];
        if (v139) {
          uint64_t v139 = [*(id *)(v139 + 40) objectForKey:v146];
        }
        int v135 = 17;
      }

      v128 = v355;
      v132 = v140;
      uint64_t v133 = v340;
      CFDataRef v134 = v346;
      BOOL v137 = v345;
    }
    uint64_t v147 = ~v136;
    uint64_t v131 = 0;
    switch(v135)
    {
      case 1:
        LODWORD(v356) = 0;
        v173 = (__int16 *)((unint64_t)&v132[v136] & v147);
        if (!v137) {
          v132 = (unsigned __int8 *)(v173 + 2);
        }
        v174 = (__int16 *)&v356;
        if (!v137) {
          v174 = v173;
        }
        int v175 = v128[v350 + 21];
        if (v175 == 10)
        {
          if (v349) {
            goto LABEL_280;
          }
          uint64_t v215 = *((unsigned int *)v134 + 2);
          uint64_t v216 = *(unsigned int *)v174;
          id v176 = v312;
          v218 = (void (*)(id, char *, uint64_t, uint64_t))v296;
          v217 = v297;
          goto LABEL_278;
        }
        id v176 = v312;
        if (v175 == 4)
        {
          if ((v349 & 1) == 0)
          {
            uint64_t v215 = *((unsigned int *)v134 + 2);
            uint64_t v216 = *(unsigned int *)v174;
            v218 = (void (*)(id, char *, uint64_t, uint64_t))v298;
            v217 = v299;
LABEL_278:
            v195 = v132;
            v218(v176, v217, v215, v216);
            goto LABEL_279;
          }
          int v219 = v354;
          if (v137)
          {
            *(void *)&v348[8 * (int)v354] = 0;
          }
          else
          {
            uint64_t v244 = *(int *)v173;
            v245 = v132;
            uint64_t v246 = v319(v307, v318, v244);
            v132 = v245;
            v128 = v355;
            *(void *)&v348[8 * v219] = v246;
          }
          uint64_t v133 = 1;
        }
        else
        {
          if (v175 != 1) {
            goto LABEL_280;
          }
          if (v349)
          {
            if (byte_1EB270AB6) {
              BOOL v177 = v137;
            }
            else {
              BOOL v177 = 0;
            }
            int v178 = v354;
            if (v177)
            {
              CFNumberRef v179 = 0;
            }
            else
            {
              if (byte_1EB270AB6) {
                v242 = v173;
              }
              else {
                v242 = v174;
              }
              v243 = v132;
              CFNumberRef v179 = CFNumberCreate(0, kCFNumberIntType, v242);
              v132 = v243;
              v128 = v355;
            }
            uint64_t v133 = 0;
            *(void *)&v348[8 * v178] = v179;
          }
          else
          {
            unint64_t v229 = *((unsigned int *)v134 + 2);
            if (v137)
            {
              int v213 = 1 << (v229 & 7);
              unint64_t v214 = v229 >> 3;
              goto LABEL_264;
            }
            v247 = v132;
            CFDataRef v248 = v134;
            Class Class = object_getClass(v327);
            int v250 = *(char *)(*((void *)object_getIndexedIvars(Class) + 7) + v229);
            if (v250 == 115)
            {
              snapshot_set_int16(v327, *((_DWORD *)v248 + 2), *v173);
            }
            else if (v250 == 99)
            {
              snapshot_set_int8(v327, *((_DWORD *)v248 + 2), *(unsigned char *)v173);
            }
            else
            {
              snapshot_set_int32(v327, *((_DWORD *)v248 + 2), *(_DWORD *)v173);
            }
            v128 = v355;
            v132 = v247;
          }
        }
        goto LABEL_280;
      case 2:
      case 3:
        uint64_t v356 = 0;
        v157 = (uint64_t *)((unint64_t)&v132[v136] & v147);
        if (!v137) {
          v132 = (unsigned __int8 *)(v157 + 1);
        }
        v158 = &v356;
        if (!v137) {
          v158 = v157;
        }
        int v159 = v128[v350 + 21];
        if (v159 == 6)
        {
          if (v349) {
            goto LABEL_280;
          }
          v195 = v132;
          v300(v312, v301, *v158);
          goto LABEL_279;
        }
        if (v159 == 3)
        {
          if (v349)
          {
            if (v133)
            {
              uint64_t v196 = *(void *)&v348[8 * (int)v354 - 8];
              uint64_t v354 = (int)v354 - 1;
            }
            else
            {
              BOOL v230 = v137;
              v231 = v132;
              uint64_t v232 = objc_msgSend((id)objc_msgSend(*(id *)&v128[v350 + 24], "toOneRelationship"), "destinationEntity");
              v132 = v231;
              LOBYTE(v137) = v230;
              v128 = v355;
              uint64_t v196 = v232;
            }
            if (!v137 && *v157)
            {
              v233 = v132;
              if (v196 != v292)
              {
                v234 = (objc_class *)[v339 objectIDFactoryForSQLEntity:v196];
                uint64_t v292 = v196;
                Class v293 = v234;
              }
              CFNumberRef v163 = (CFNumberRef)[[v293 alloc] initWithPK64:*v157];
              v128 = v355;
              v132 = v233;
              goto LABEL_275;
            }
            goto LABEL_274;
          }
          v195 = v132;
          v302(v312, v303, *((unsigned int *)v134 + 2), *v158);
          goto LABEL_279;
        }
        if (v159 != 1) {
          goto LABEL_280;
        }
        if (v349)
        {
          if (byte_1EB270AB6) {
            BOOL v160 = v137;
          }
          else {
            BOOL v160 = 0;
          }
          if (!v160)
          {
            if (byte_1EB270AB6) {
              v161 = v157;
            }
            else {
              v161 = v158;
            }
            v162 = v132;
            CFNumberRef v163 = CFNumberCreate(0, kCFNumberLongLongType, v161);
            v132 = v162;
            v128 = v355;
            goto LABEL_275;
          }
LABEL_274:
          CFNumberRef v163 = 0;
LABEL_275:
          uint64_t v133 = 0;
          *(void *)&v348[8 * (int)v354] = v163;
          goto LABEL_280;
        }
        unint64_t v212 = *((unsigned int *)v134 + 2);
        if (!v137)
        {
          v195 = v132;
          snapshot_set_int64(v327, v212, *v157);
LABEL_279:
          v132 = v195;
          v128 = v355;
          goto LABEL_280;
        }
        int v213 = 1 << (v212 & 7);
        unint64_t v214 = v212 >> 3;
LABEL_264:
        v315[v214] |= v213;
        goto LABEL_280;
      case 4:
      case 5:
      case 6:
      case 9:
      case 12:
        if (v349)
        {
          if (v137)
          {
            CFStringRef v148 = 0;
            int v149 = v354;
            goto LABEL_234;
          }
          v167 = (const char *)((unint64_t)&v132[v136] & v147);
          v168 = (int *)(v167 + 4);
          if ((uint64_t)(v338 - (void)(v167 + 4)) >= *(int *)v167)
          {
            CFDataRef v169 = v134;
            CFStringRef v148 = CFStringCreateWithCString(0, v167 + 4, 0x8000100u);
            v132 = (unsigned __int8 *)v168 + *(int *)v167;
            int v170 = *((unsigned __int8 *)v169 + 20);
            if (v170 == 12)
            {
              v171 = (unsigned __int8 *)v168 + *(int *)v167;
              CFStringRef v172 = (const __CFString *)(id)[MEMORY[0x1E4F1CB10] URLWithString:v148];
              int v149 = v354;
            }
            else
            {
              int v149 = v354;
              if (v170 != 4)
              {
                v128 = v355;
                goto LABEL_234;
              }
              v171 = v132;
              CFStringRef v172 = (const __CFString *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithString:v148];
            }
            CFRelease(v148);
            CFStringRef v148 = v172;
            v128 = v355;
            v132 = v171;
LABEL_234:
            uint64_t v131 = 0;
            *(void *)&v348[8 * v149] = v148;
            goto LABEL_295;
          }
          v90 = v353;
          v91 = v337;
          unint64_t v92 = v323;
          if (!a8) {
            goto LABEL_399;
          }
          v285 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v286 = *MEMORY[0x1E4F281F8];
          v287 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v288 = [NSString stringWithFormat:@"CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (2))", *(void *)&v128[v350 + 24]];
LABEL_394:
          uint64_t v289 = [v287 dictionaryWithObject:v288 forKey:@"Reason"];
          v290 = v285;
          uint64_t v291 = v286;
          goto LABEL_398;
        }
        if (v137) {
          goto LABEL_222;
        }
        v150 = (const char *)((unint64_t)&v132[v136] & v147);
        v151 = (int *)(v150 + 4);
        if ((uint64_t)(v338 - (void)(v150 + 4)) < *(int *)v150)
        {
          v90 = v353;
          v91 = v337;
          unint64_t v92 = v323;
          if (!a8) {
            goto LABEL_399;
          }
          v285 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v286 = *MEMORY[0x1E4F281F8];
          v287 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v288 = [NSString stringWithFormat:@"CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (1))", *(void *)&v128[v350 + 24]];
          goto LABEL_394;
        }
        CFDataRef v152 = v134;
        v153 = (__CFString *)CFStringCreateWithCString(0, v150 + 4, 0x8000100u);
        uint64_t v154 = *(int *)v150;
        int v155 = *((unsigned __int8 *)v152 + 20);
        if (v155 == 12)
        {
          v156 = (__CFString *)(id)[MEMORY[0x1E4F1CB10] URLWithString:v153];
        }
        else
        {
          if (v155 != 4) {
            goto LABEL_284;
          }
          v156 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithString:v153];
        }
        goto LABEL_283;
      case 7:
      case 8:
        if (v349)
        {
          if (v137)
          {
            CFNumberRef v164 = 0;
            int v165 = v354;
            v166 = v348;
          }
          else
          {
            v197 = (CFAbsoluteTime *)((unint64_t)&v132[v136] & v147);
            v198 = v197 + 1;
            if (*((unsigned char *)v134 + 20) == 7) {
              CFNumberRef v164 = CFNumberCreate(0, kCFNumberDoubleType, v197);
            }
            else {
              CFNumberRef v164 = CFDateCreate(0, *v197);
            }
            int v165 = v354;
            v128 = v355;
            v166 = v348;
            v132 = (unsigned __int8 *)v198;
          }
          uint64_t v131 = 0;
          *(void *)&v166[8 * v165] = v164;
          goto LABEL_295;
        }
        if (v137) {
          goto LABEL_222;
        }
        v186 = (double *)((unint64_t)&v132[v136] & v147);
        uint64_t v187 = *((unsigned int *)v134 + 2);
        if (*((unsigned char *)v134 + 20) == 7)
        {
          v188 = v327;
          CFDataRef v189 = v134;
          Class v190 = object_getClass(v327);
          IndexedIvars = object_getIndexedIvars(v190);
          unsigned int v192 = *((_DWORD *)v189 + 2);
          double v193 = *v186;
          if (*(unsigned char *)(IndexedIvars[7] + v187) == 102)
          {
            float v194 = v193;
            snapshot_set_float(v188, v192, v194);
LABEL_267:
            uint64_t v131 = v133;
            v128 = v355;
            v132 = (unsigned __int8 *)(v186 + 1);
            goto LABEL_295;
          }
          v228 = v188;
        }
        else
        {
          double v193 = *v186;
          v228 = v327;
          unsigned int v192 = *((_DWORD *)v134 + 2);
        }
        snapshot_set_double(v228, v192, v193);
        goto LABEL_267;
      case 13:
      case 14:
        goto LABEL_295;
      case 16:
        v180 = *(void **)&v128[v350 + 24];
        CFDataRef v346 = v134;
        BOOL v345 = v137;
        uint64_t v181 = v133;
        v182 = v132;
        int v183 = objc_msgSend((id)objc_msgSend(v180, "propertyDescription"), "_isFileBackedFuture");
        v132 = v182;
        uint64_t v133 = v181;
        LOBYTE(v137) = v345;
        CFDataRef v134 = v346;
        v128 = v355;
        if (!v183) {
          goto LABEL_214;
        }
        if (v345)
        {
          if (v349)
          {
            uint64_t v131 = 0;
            *(void *)&v348[8 * (int)v354] = 0;
            goto LABEL_295;
          }
LABEL_222:
          v315[(unint64_t)*((unsigned int *)v134 + 2) >> 3] |= 1 << (*((_DWORD *)v134 + 2) & 7);
LABEL_280:
          uint64_t v131 = v133;
LABEL_295:
          if (v343 && v128 == (char *)72 && v343[46] == 16001)
          {
            int v237 = v354;
            v238 = v132;
            int v239 = [*(id *)&v348[8 * (int)v354] intValue];
            v132 = v238;
            v128 = v355;
            int v130 = (v239 == 2) | v352;
            v122 = v347;
            unint64_t v89 = v350;
          }
          else
          {
            int v130 = v352;
            v122 = v347;
            unint64_t v89 = v350;
            int v237 = v354;
            if (v128 == (char *)120 && (v352 & 1) != 0)
            {
              v240 = v132;
              uint64_t v241 = [*(id *)&v348[8 * (int)v354] intValue];
              v132 = v240;
              v128 = v355;
              uint64_t v333 = v241;
              int v130 = 1;
            }
          }
          uint64_t v126 = (v237 + v342);
          unint64_t v129 = v351 + 1;
          v128 += 24;
          if ((char *)v341 == v128) {
            goto LABEL_316;
          }
          continue;
        }
        v220 = (int *)((unint64_t)&v132[v136] & v147);
        v221 = v220 + 1;
        if ((uint64_t)(v338 - (void)(v220 + 1)) >= *v220)
        {
          uint64_t v222 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v220 + 1);
          uint64_t v223 = *v220;
          uint64_t v224 = v294;
          if (!v294) {
            uint64_t v224 = [v339 fileBackedFuturesDirectory];
          }
          v225 = (unsigned __int8 *)v221 + v223;
          v226 = [_NSDataFileBackedFuture alloc];
          uint64_t v294 = v224;
          uint64_t v227 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:](v226, "initWithStoreMetadata:directory:", v222, [MEMORY[0x1E4F1CB10] fileURLWithPath:v224 isDirectory:1]);
          if (v349)
          {
            uint64_t v131 = 0;
            *(void *)&v348[8 * (int)v354] = v227;
          }
          else
          {
            snapshot_set_object(v327, *((_DWORD *)v346 + 2), v227);
            uint64_t v131 = v133;
          }
          v128 = v355;
          v132 = v225;
          goto LABEL_295;
        }
        v90 = v353;
        v91 = v337;
        unint64_t v92 = v323;
        if (a8)
        {
          v281 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v282 = *MEMORY[0x1E4F281F8];
          v283 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v284 = [NSString stringWithFormat:@"CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (3))", *(void *)&v355[v350 + 24]];
LABEL_397:
          uint64_t v289 = [v283 dictionaryWithObject:v284 forKey:@"Reason"];
          v290 = v281;
          uint64_t v291 = v282;
LABEL_398:
          *a8 = objc_msgSend(v290, "errorWithDomain:code:userInfo:", v291, 134060, v289, v292);
        }
LABEL_399:
        v56 = v335;
LABEL_400:
        if (v92 >= 0x201)
        {
          NSZoneFree(0, v330);
          NSZoneFree(0, v322);
        }
        if (v325 >= 0x201) {
          NSZoneFree(0, v332);
        }
        PF_FREE_OBJECT_ARRAY(v91);

        if (v56) {
        return 0;
        }
      default:
LABEL_214:
        if ((v349 & 1) == 0)
        {
          if (v137) {
            goto LABEL_222;
          }
          v208 = (const UInt8 *)((unint64_t)&v132[v136] & v147);
          v151 = (int *)(v208 + 4);
          CFIndex v209 = *(int *)v208;
          if ((uint64_t)(v338 - (void)(v208 + 4)) < v209)
          {
            v90 = v353;
            v91 = v337;
            unint64_t v92 = v323;
            if (!a8) {
              goto LABEL_399;
            }
            v285 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v286 = *MEMORY[0x1E4F281F8];
            v287 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v288 = [NSString stringWithFormat:@"CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (3))", *(void *)&v355[v350 + 24]];
            goto LABEL_394;
          }
          CFDataRef v152 = v134;
          CFDataRef v210 = CFDataCreate(0, v208 + 4, v209);
          v153 = (__CFString *)v210;
          uint64_t v154 = *(int *)v208;
          int v211 = *((unsigned __int8 *)v152 + 20);
          if (v211 == 11)
          {
            if ([(__CFData *)v210 length] == 16)
            {
              v156 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", -[__CFString bytes](v153, "bytes"));
LABEL_283:
              v235 = v156;
              CFRelease(v153);
              v153 = v235;
            }
          }
          else if (v211 == 15)
          {
            v156 = (__CFString *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v210, (void *)[*(id *)&v355[v350 + 24] propertyDescription]);
            goto LABEL_283;
          }
LABEL_284:
          snapshot_set_object(v327, *((_DWORD *)v152 + 2), (uint64_t)v153);
          v132 = (unsigned __int8 *)v151 + v154;
          uint64_t v131 = v133;
          v128 = v355;
          goto LABEL_295;
        }
        if (v137)
        {
          CFDataRef v184 = 0;
          int v185 = v354;
          goto LABEL_294;
        }
        v199 = (const UInt8 *)((unint64_t)&v132[v136] & v147);
        v201 = (int *)(v199 + 4);
        CFIndex v200 = *(int *)v199;
        if ((uint64_t)(v338 - (void)(v199 + 4)) < v200)
        {
          v90 = v353;
          v91 = v337;
          unint64_t v92 = v323;
          if (!a8) {
            goto LABEL_399;
          }
          v285 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v286 = *MEMORY[0x1E4F281F8];
          v287 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v288 = [NSString stringWithFormat:@"CoreData: XPC: Suspect response from server (remaining space for %@ insufficient (4))", *(void *)&v355[v350 + 24]];
          goto LABEL_394;
        }
        CFDataRef v202 = v134;
        CFDataRef v346 = CFDataCreate(0, v199 + 4, v200);
        uint64_t v203 = *(int *)v199;
        v132 = (unsigned __int8 *)v201 + v203;
        if (v135 == 17)
        {
          v204 = (unsigned __int8 *)v201 + v203;
          int v205 = [(id)v139 sqlType];
          v132 = v204;
          if (v205 != 10)
          {
            [*(id *)&v355[v350 + 24] propertyDescription];
            CFDataRef v184 = v346;
            CFDataRef v236 = (const __CFData *)_swizzleManifestTypeDataXPC(v346, (void *)v139);
            int v185 = v354;
            goto LABEL_291;
          }
        }
        int v206 = *((unsigned __int8 *)v202 + 20);
        int v185 = v354;
        if (v206 == 11)
        {
          v204 = v132;
          CFDataRef v184 = v346;
          if ([(__CFData *)v346 length] == 16)
          {
            CFDataRef v207 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", -[__CFData bytes](v184, "bytes"));
            goto LABEL_290;
          }
LABEL_292:
          v128 = v355;
          v132 = v204;
          goto LABEL_294;
        }
        CFDataRef v184 = v346;
        if (v206 == 15)
        {
          v204 = v132;
          CFDataRef v207 = (const __CFData *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v346, (void *)[*(id *)&v355[v350 + 24] propertyDescription]);
LABEL_290:
          CFDataRef v236 = v207;
LABEL_291:
          CFRelease(v184);
          CFDataRef v184 = v236;
          goto LABEL_292;
        }
        v128 = v355;
LABEL_294:
        uint64_t v131 = 0;
        *(void *)&v348[8 * v185] = v184;
        goto LABEL_295;
    }
  }
}

+ (_PFResultArray)_decodeBufferResultSetData:(void *)a3 forFetchRequest:(uint64_t)a4 options:(uint64_t)a5 store:(uint64_t)a6 context:(uint64_t)a7 rowCacheRows:(uint64_t *)a8 error:
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v12 = [a2 bytes];
  unint64_t v13 = [a2 length];
  if (v13 <= 7)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"CoreData: XPC: Suspect response from server (bad size)", @"Reason"));
    if (!v14)
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
        __int16 v71 = 1024;
        int v72 = 1290;
LABEL_52:
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        return 0;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if (v12 >= v12 + v13)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"CoreData: XPC: Suspect response from server (no result)", @"Reason"));
    if (!v14)
    {
      uint64_t v31 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
        __int16 v71 = 1024;
        int v72 = 1306;
        goto LABEL_52;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if (*(void *)v12 == 1)
  {
    if (v13 <= 0x13)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"CoreData: XPC: Suspect response from server (missing size)", @"Reason"));
      if (!v14)
      {
        uint64_t v23 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m");
        v22 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Persistence/XPCStore/_NSXPCStoreUtilities.m";
          __int16 v71 = 1024;
          int v72 = 1319;
          goto LABEL_52;
        }
        return 0;
      }
LABEL_12:
      if (a8)
      {
        uint64_t v30 = 0;
        *a8 = v14;
        return v30;
      }
      return 0;
    }
    uint64_t v39 = *(unsigned int *)(v12 + 16);
    if (v39)
    {
      size_t v40 = *(void *)(v12 + 24);
      v41 = (char *)PF_CALLOC_SCANNED_BYTES(v40);
      memcpy(v41, (const void *)(v12 + 32), v40);
      v42 = (objc_class *)objc_opt_class();
      object_setClass(v41 + 8, v42);
      v43 = bufferResultSetAllocateWithBuffer(v40, (uint64_t)v41);
      *((_DWORD *)v43 + 10) |= 2u;
      v44 = (void *)[a3 propertiesToFetch];
      if (![v44 count])
      {
        v45 = (void *)[a3 entity];
        v46 = v45 ? objc_msgSend((id)objc_msgSend(v45, "propertiesByName"), "allKeys") : 0;
        v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v46, "count"));
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v64 objects:v68 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v65 != v49) {
                objc_enumerationMutation(v46);
              }
              uint64_t v51 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              uint64_t v52 = (void *)[a3 entity];
              if (v52)
              {
                v53 = objc_msgSend((id)objc_msgSend(v52, "propertiesByName"), "objectForKey:", v51);
                if (v53)
                {
                  uint64_t v54 = v53;
                  if (([v53 isTransient] & 1) == 0 && (objc_msgSend(v54, "_isRelationship") & 1) == 0) {
                    [v44 addObject:v54];
                  }
                }
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v64 objects:v68 count:16];
          }
          while (v48);
        }
      }
      id v55 = -[NSKnownKeysMappingStrategy initForKeys:]([NSKnownKeysMappingStrategy alloc], "initForKeys:", [v44 valueForKey:@"name"]);
      unint64_t v56 = [v44 count];
      unint64_t v57 = v56;
      if (v56 <= 1) {
        uint64_t v58 = 1;
      }
      else {
        uint64_t v58 = v56;
      }
      if (v56 >= 0x201) {
        uint64_t v59 = 1;
      }
      else {
        uint64_t v59 = v58;
      }
      uint64_t v60 = (char *)&v64 - ((8 * v59 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v56 > 0x200) {
        uint64_t v60 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v64 - ((8 * v59 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v58);
      }
      if ([v44 count])
      {
        unint64_t v62 = 0;
        do
        {
          *(void *)&v60[8 * v62] = [v44 objectAtIndexedSubscript:v62];
          ++v62;
        }
        while ([v44 count] > v62);
      }
      uint64_t v63 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v55];
      [(NSKnownKeysDictionary *)v63 setValues:v60];
      if (v57 >= 0x201) {
        NSZoneFree(0, v60);
      }
      uint64_t v30 = [[_PFResultArray alloc] initWithObjects:v43 count:v39 store:a5 metadata:v63];

      return v30;
    }
  }
  uint64_t v61 = NSArray_EmptyArray;

  return (_PFResultArray *)v61;
}

+ (uint64_t)classesForSaveArchive
{
  self;
  if (!classesForSaveArchive_archiveClasses)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v0 = objc_opt_class();
    uint64_t v1 = objc_opt_class();
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v21, "initWithObjects:", v20, v19, v18, v17, v16, v15, v14, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9,
                    objc_opt_class(),
                    0);
    objc_msgSend(v10, "addObjectsFromArray:", +[NSKnownKeysDictionary classesForArchiving](NSKnownKeysDictionary, "classesForArchiving"));
    [v10 unionSet:-[objc_class _constantValueClassesForSecureCoding](NSClassFromString((NSString *)@"_NSPredicateUtilities"), "_constantValueClassesForSecureCoding")];
    Class v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v10];

    uint64_t v12 = 0;
    atomic_compare_exchange_strong(&classesForSaveArchive_archiveClasses, (unint64_t *)&v12, (unint64_t)v11);
    if (v12) {
  }
    }
  return classesForSaveArchive_archiveClasses;
}

+ (void)logMessage:(uint64_t)a3 forComponent:(uint64_t)a4
{
  self;
  if (a2)
  {
    NSLog((NSString *)@"%@", [NSString stringWithFormat:@"CoreData: XPC: %@", a2]);
  }
  else
  {
    _NSCoreDataLog(8, @"Someone tried to log something but failed because they didn't tell me what to log.", v10, v11, v12, v13, v14, v15, a9);
  }
}

+ (uint64_t)classesForErrorArchive
{
  self;
  if (!classesForErrorArchive_archiveClasses)
  {
    id v0 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v1 = objc_opt_class();
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
    [v3 unionSet:+[_NSXPCStoreUtilities classesForSaveArchive]()];
    [v3 unionSet:+[_NSXPCStoreUtilities classesForFetchArchive]()];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v3];

    uint64_t v5 = 0;
    atomic_compare_exchange_strong(&classesForErrorArchive_archiveClasses, (unint64_t *)&v5, (unint64_t)v4);
    if (v5) {
  }
    }
  return classesForErrorArchive_archiveClasses;
}

+ (uint64_t)newUserInfoFromException:(uint64_t)a1
{
  self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(a2, "name"), @"exception name");
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(a2, "reason"), @"exception reason");
  if (objc_msgSend((id)objc_msgSend(a2, "userInfo"), "valueForKey:", @"NSSQLiteErrorDomain")) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend(a2, "userInfo"), "valueForKey:", @"NSSQLiteErrorDomain"), @"NSSQLiteErrorDomain");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"controlled exception"];
  }
  _NSCoreDataLog(8, @"Error: Exception raised: %@", v4, v5, v6, v7, v8, v9, (uint64_t)a2);
  uint64_t v10 = [a2 callStackSymbols];
  _NSCoreDataLog(8, @"Error: Callstack: %@", v11, v12, v13, v14, v15, v16, v10);
  uint64_t v17 = [a2 userInfo];
  _NSCoreDataLog(8, @"Error: UserInfo: %@", v18, v19, v20, v21, v22, v23, v17);
  uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v3, @"exception info", 0);

  return v24;
}

@end