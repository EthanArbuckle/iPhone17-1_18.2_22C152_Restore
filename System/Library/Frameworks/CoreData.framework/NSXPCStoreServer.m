@interface NSXPCStoreServer
+ (unint64_t)debugDefault;
+ (void)initialize;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSQueryGenerationToken)retainedXPCEncodableGenerationTokenForOriginal:(NSQueryGenerationToken *)a1 inContext:(void *)a2;
- (NSQueryGenerationToken)unpackQueryGeneration:(uint64_t)a1 withContext:(void *)a2;
- (NSXPCStoreServerDelegate)delegate;
- (id)errorHandlingDelegate;
- (id)initForStoreWithURL:(id)a3 usingModel:(id)a4 options:(id)a5 policy:(id)a6;
- (id)initForStoreWithURL:(id)a3 usingModelAtURL:(id)a4 options:(id)a5 policy:(id)a6;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (uint64_t)_populateObject:(void *)a1 withValuesFromClient:(void *)a2;
- (uint64_t)setupRecoveryForConnectionContext:(uint64_t)a3 ifNecessary:;
- (void)dealloc;
- (void)errorIsPlausiblyAnSQLiteIssue:(uint64_t)a1;
- (void)handleRequest:(id)a3 reply:(id)a4;
- (void)removeCachesForConnection:(void *)result;
- (void)setDelegate:(id)a3;
- (void)setErrorHandlingDelegate:(id)a3;
- (void)startListening;
@end

@implementation NSXPCStoreServer

- (NSQueryGenerationToken)unpackQueryGeneration:(uint64_t)a1 withContext:(void *)a2
{
  v4 = (void *)MEMORY[0x18C127630]();
  if ([@"current" isEqual:a1])
  {
    v5 = +[NSQueryGenerationToken currentQueryGenerationToken];
  }
  else if ([@"unpinned" isEqual:a1])
  {
    v5 = +[NSQueryGenerationToken unpinnedQueryGenerationToken];
  }
  else
  {
    v6 = (void *)MEMORY[0x18C127630]();
    if (a1) {
      uint64_t v7 = *(void *)(a1 + 24);
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = (void *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]((id *)[a2 cache], v7);
    if (!v8)
    {
      v9 = (void (*)(void))[a2 persistentStoreCoordinator];
      uint64_t v10 = a1 ? *(void *)(a1 + 8) : 0;
      v8 = -[NSPersistentStoreCoordinator _reopenQueryGenerationWithIdentifier:inStoreWithIdentifier:error:](v9, v7, v10, 0);
      if (v8)
      {
        -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:]((void *)[a2 cache], v8, v7);
        v8 = (void *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]((id *)[a2 cache], v7);
      }
    }
    id v11 = v8;
    v5 = v8;
  }
  v12 = v5;
  if (v5)
  {
    uint64_t v21 = 0;
    if ((objc_msgSend((id)objc_msgSend(a2, "managedObjectContext"), "setQueryGenerationFromToken:error:", v5, &v21) & 1) == 0)
    {
      if (+[NSXPCStoreServer debugDefault])
      {
        _NSCoreDataLog(8, @"Failed to set query generation on context: %@ -> %@ (%@)", v13, v14, v15, v16, v17, v18, a1);
        v12 = 0;
      }
    }
    v19 = v12;
    return v12;
  }
  else
  {
    return 0;
  }
}

- (void)handleRequest:(id)a3 reply:(id)a4
{
  id v40 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = (void *)[MEMORY[0x1E4F29268] currentConnection];
  v8 = objc_msgSend((id)objc_msgSend(v7, "userInfo"), "objectForKey:", @"NSConnectionInfo");
  v9 = [[NSXPCStoreServerConnectionContext alloc] initWithConnectionInfo:v8];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3052000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  uint64_t v47 = 0;
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @"Starting event handler", v10, v11, v12, v13, v14, v15, v39);
  }
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @"XPCStore server handling request: %@", v16, v17, v18, v19, v20, v21, (uint64_t)a3);
  }
  BOOL v22 = [(NSXPCStoreServerRequestHandlingPolicy *)self->_policy shouldAcceptConnectionsFromClientWithContext:v9];
  v23 = v49;
  *((unsigned char *)v49 + 24) = v22;
  v43[5] = 0;
  if (!*((unsigned char *)v23 + 24))
  {
    uint64_t v24 = [NSString stringWithFormat:@"Policy rejected connection from client: %@"];
    v43[5] = v24;
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v24, (uint64_t)self, v25, v26, v27, v28, v29, (uint64_t)v7);
  }
  id v30 = [(NSXPCStoreServerConnectionContext *)v9 persistentStoreCoordinator];
  v31 = (NSManagedObjectContext *)[(NSXPCStoreServerConnectionContext *)v9 managedObjectContext];
  if (!v31)
  {
    v32 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    [(NSManagedObjectContext *)v32 setPersistentStoreCoordinator:v30];
    [(NSManagedObjectContext *)v32 _setDelegate:self];
    if (v32) {
      *(_DWORD *)&v32->_flags |= 0x1000000u;
    }
    v33 = objc_msgSend((id)objc_msgSend(v8, "entitlements"), "objectForKey:", @"application-identifier");
    if (v33) {
      -[NSPersistentStoreCoordinator _setXPCBundleIdentifier:]((uint64_t)v30, v33);
    }
    if (a3)
    {
      v34 = (void *)*((void *)a3 + 7);
      if (v34) {
        -[NSPersistentStoreCoordinator _setXPCProcessName:]((uint64_t)v30, v34);
      }
    }
    [(NSManagedObjectContext *)v32 setMergePolicy:NSErrorMergePolicy];
    [(NSManagedObjectContext *)v32 setUndoManager:0];
    if (a3 && *((void *)a3 + 5)) {
      -[NSManagedObjectContext setName:](v32, "setName:");
    }
    [(NSXPCStoreServerConnectionContext *)v9 setManagedObjectContext:v32];
    v31 = v32;
  }
  if (a3)
  {
    v35 = (void *)*((void *)a3 + 5);
    if (v35 && (objc_msgSend(v35, "isEqual:", -[NSManagedObjectContext name](v31, "name")) & 1) == 0) {
      [(NSManagedObjectContext *)v31 setName:*((void *)a3 + 5)];
    }
    v36 = (void *)*((void *)a3 + 6);
    if (v36
      && (objc_msgSend(v36, "isEqual:", -[NSManagedObjectContext transactionAuthor](v31, "transactionAuthor")) & 1) == 0)
    {
      [(NSManagedObjectContext *)v31 setTransactionAuthor:*((void *)a3 + 6)];
    }
    if (*((unsigned char *)a3 + 16)) {
      [(NSManagedObjectContext *)v31 _setAllowAncillaryEntities:1];
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NSXPCStoreServer_handleRequest_reply___block_invoke;
  block[3] = &unk_1E544B750;
  block[4] = 0;
  block[5] = a3;
  block[6] = v31;
  block[7] = v9;
  block[12] = &v48;
  block[13] = &v42;
  block[8] = self;
  block[9] = v7;
  block[10] = v30;
  block[11] = a4;
  dispatch_block_t v37 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v38 = v37;
  if (v31) {
    [(NSManagedObjectContext *)v31 performBlockAndWait:v37];
  }
  else {
    (*((void (**)(dispatch_block_t))v37 + 2))(v37);
  }
  _Block_release(v38);
  [v40 drain];
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  v6 = (void *)MEMORY[0x18C127630](self, a2, a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [NSXPCStoreManagedObjectArchivingToken alloc];
    a5 = (id)[a5 objectID];
LABEL_5:
    v8 = -[NSXPCStoreManagedObjectArchivingToken initWithURI:](v7, "initWithURI:", [a5 URIRepresentation]);
    return v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [NSXPCStoreManagedObjectArchivingToken alloc];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (+[NSQueryGenerationToken currentQueryGenerationToken] == a5)
    {
      a5 = @"current";
    }
    else if (+[NSQueryGenerationToken unpinnedQueryGenerationToken] == a5)
    {
      a5 = @"unpinned";
    }
    else
    {
      +[NSQueryGenerationToken nostoresQueryGenerationToken];
    }
  }
  return a5;
}

void __40__NSXPCStoreServer_handleRequest_reply___block_invoke(uint64_t *a1)
{
  uint64_t v784 = *MEMORY[0x1E4F143B8];
  id v733 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  self = objc_alloc_init(NSCoreDataXPCMessage);
  v742 = 0;
  v2 = (void *)a1[4];
  if (v2) {
    goto LABEL_447;
  }
  uint64_t v3 = a1[5];
  if (v3) {
    v4 = *(void **)(v3 + 32);
  }
  else {
    v4 = 0;
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1[6], "persistentStoreCoordinator"), "persistentStores"), "lastObject");
  -[NSXPCStoreServerConnectionContext setActiveStore:](a1[7], v5);
  if (v4 && (objc_msgSend(v4, "isEqual:", objc_msgSend(v5, "identifier")) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[12] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[13] + 8) + 40) = [NSString stringWithFormat:@"Token mismatch"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, *(void *)(*(void *)(a1[13] + 8) + 40), a1[8], v6, v7, v8, v9, v10, v724);
    int v732 = 1;
  }
  else
  {
    int v732 = 0;
  }
  if (!*(unsigned char *)(*(void *)(a1[12] + 8) + 24))
  {
    id v39 = 0;
LABEL_407:
    uint64_t v679 = *MEMORY[0x1E4F281F8];
    if (v732)
    {
      v742 = (char *)[MEMORY[0x1E4F28C58] errorWithDomain:v679, 134095, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"request failed, store identifier mismatch", @"Problem" code userInfo];
LABEL_409:
      uint64_t v681 = 2;
      goto LABEL_411;
    }
    v742 = (char *)[MEMORY[0x1E4F28C58] errorWithDomain:v679, 134070, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"request failed, insufficient permission", @"Problem" code userInfo];
    uint64_t v681 = 1;
    goto LABEL_411;
  }
  v734 = a1;
  uint64_t v11 = a1[5];
  if (!v11)
  {
LABEL_28:
    if (+[NSXPCStoreServer debugDefault])
    {
      uint64_t v46 = a1[5];
      if (v46) {
        uint64_t v46 = *(void *)(v46 + 8);
      }
      uint64_t v726 = a1[9];
      _NSCoreDataLog(8, @"Illegal input: %u from connection %p", v40, v41, v42, v43, v44, v45, v46);
    }
    id v39 = 0;
    v742 = (char *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134070 userInfo:0];
    goto LABEL_403;
  }
  switch(*(void *)(v11 + 8))
  {
    case 1:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Metadata", v12, v13, v14, v15, v16, v17, v724);
      }
      if (!a1[8]) {
        goto LABEL_444;
      }
      uint64_t v18 = (void *)a1[7];
      uint64_t v19 = (void *)MEMORY[0x18C127630]();
      uint64_t v20 = objc_msgSend((id)objc_msgSend(v18, "managedObjectContext"), "persistentStoreCoordinator");
      uint64_t v27 = objc_msgSend((id)objc_msgSend(v20, "persistentStores"), "lastObject");
      if (!v27) {
        _NSCoreDataLog(8, @"no store", v21, v22, v23, v24, v25, v26, v724);
      }
      uint64_t v28 = (void *)[v27 metadata];
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Got metadata %@", v29, v30, v31, v32, v33, v34, (uint64_t)v28);
      }
      v35 = (void *)[v20 managedObjectModel];
      long long v779 = 0u;
      long long v780 = 0u;
      long long v777 = 0u;
      long long v778 = 0u;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v777 objects:&v781 count:16];
      if (!v36) {
        goto LABEL_284;
      }
      uint64_t v37 = *(void *)v778;
      while (1)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v778 != v37) {
            objc_enumerationMutation(v35);
          }
          if (-[NSEntityDescription _hasAttributesWithFileBackedFutures](*(void *)(*((void *)&v777 + 1) + 8 * i)))
          {
            v502 = (void *)[v27 fileBackedFuturesDirectory];
            if (v502)
            {
              v775[0] = @"NSMetadataKey";
              v775[1] = @"NSFileBackedFuturePathKey";
              v776[0] = v28;
              v776[1] = v502;
              uint64_t v28 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v776 forKeys:v775 count:2];
              goto LABEL_284;
            }
            _NSCoreDataLog(8, @"what on earth happened?", v503, v504, v505, v506, v507, v508, v724);
LABEL_446:
            __break(1u);
LABEL_447:
            objc_exception_throw(v2);
          }
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v777 objects:&v781 count:16];
        if (!v36)
        {
LABEL_284:
          v509 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:v28 format:200 options:0 error:0];
          if (+[NSXPCStoreServer debugDefault]) {
            _NSCoreDataLog(8, @"Which archives to %@", v510, v511, v512, v513, v514, v515, (uint64_t)v509);
          }
          id v516 = v509;
          id v332 = v509;
          goto LABEL_402;
        }
      }
    case 2:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Fetch", v284, v285, v286, v287, v288, v289, v724);
      }
      uint64_t v290 = a1[5];
      if (v290) {
        uint64_t v291 = *(void *)(v290 + 24);
      }
      else {
        uint64_t v291 = 0;
      }
      uint64_t v292 = a1[8];
      if (!v292) {
        goto LABEL_444;
      }
      v293 = (void *)a1[7];
      v776[0] = 0;
      id v740 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v294 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v295 = objc_opt_class();
      uint64_t v296 = objc_opt_class();
      uint64_t v297 = objc_opt_class();
      uint64_t v298 = objc_opt_class();
      objc_opt_class();
      uint64_t v726 = v297;
      uint64_t v727 = v298;
      uint64_t v724 = v296;
      v299 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v291, (uint64_t)v293, [v294 setWithObjects:v295]);
      if ((unint64_t)[v299 count] < 2)
      {
        uint64_t v301 = 0;
      }
      else
      {
        uint64_t v300 = [v299 objectAtIndex:1];
        uint64_t v301 = v300;
        if (v300)
        {
          v302 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v300, v293);
          goto LABEL_289;
        }
      }
      v302 = 0;
LABEL_289:
      id v517 = +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:](NSFetchRequest, "decodeFromXPCArchive:withContext:andPolicy:", [v299 firstObject], v293, *(void *)(v292 + 64));
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Got a fetch request %@", v518, v519, v520, v521, v522, v523, (uint64_t)v517);
      }
      if (v301 && !v302 && +[NSXPCStoreServer debugDefault])
      {
        _NSCoreDataLog(8, @"Can't fulfill fetch request: can't find query generation: %@", v524, v525, v526, v527, v528, v529, 0);
        v530 = (void *)MEMORY[0x1E4F28C58];
        v781 = @"unrecognized query generation";
        *(void *)&long long v777 = @"reason";
        *((void *)&v777 + 1) = @"generation";
        uint64_t v782 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v531 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v781 forKeys:&v777 count:2];
        v532 = 0;
        int v533 = 0;
        v776[0] = (id)[v530 errorWithDomain:*MEMORY[0x1E4F281F8] code:134061 userInfo:v531];
        goto LABEL_391;
      }
      v534 = (void *)[*(id *)(v292 + 64) processRequest:v517 fromClientWithContext:v293 error:v776];
      if (+[NSXPCStoreServer debugDefault])
      {
        if (v534) {
          uint64_t v541 = [v534 count];
        }
        else {
          uint64_t v541 = 0;
        }
        uint64_t v726 = v541;
        _NSCoreDataLog(8, @"Which had result %d (%d)", v535, v536, v537, v538, v539, v540, v534 != 0);
      }
      if (v534)
      {
        id v631 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v534);
        v532 = v631;
        if (+[NSXPCStoreServer debugDefault])
        {
          BOOL v638 = v631 != 0;
          if (v532) {
            uint64_t v639 = [v532 length];
          }
          else {
            uint64_t v639 = 0;
          }
          uint64_t v726 = v639;
          _NSCoreDataLog(8, @"Which archived %d (%d)", v632, v633, v634, v635, v636, v637, v638);
        }
        goto LABEL_390;
      }
      if (v776[0])
      {
        if (+[NSXPCStoreServer debugDefault])
        {
          v532 = 0;
          _NSCoreDataLog(8, @"Fetch failed returning error %@", v640, v641, v642, v643, v644, v645, (uint64_t)v776[0]);
LABEL_388:
          int v533 = 1;
          goto LABEL_391;
        }
      }
      else if (+[NSXPCStoreServer debugDefault])
      {
        v532 = 0;
        _NSCoreDataLog(8, @"Fetch failed with no error.", v658, v659, v660, v661, v662, v663, v724);
        goto LABEL_388;
      }
      v532 = 0;
LABEL_390:
      int v533 = 1;
LABEL_391:
      id v664 = v776[0];
      [v740 drain];
      id v665 = 0;
      id v666 = v776[0];
      if (v776[0]) {
        v742 = (char *)v776[0];
      }
      if (v533)
      {
        id v332 = v532;
        goto LABEL_402;
      }
      goto LABEL_444;
    case 3:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Save", v122, v123, v124, v125, v126, v127, v724);
      }
      uint64_t v128 = a1[5];
      if (v128) {
        uint64_t v129 = *(void *)(v128 + 24);
      }
      else {
        uint64_t v129 = 0;
      }
      uint64_t v730 = a1[8];
      if (!v730) {
        goto LABEL_444;
      }
      v731 = (void *)a1[7];
      id v728 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v771[0] = 0;
      uint64_t v130 = objc_msgSend((id)+[_NSXPCStoreUtilities classesForSaveArchive](), "setByAddingObjectsFromSet:", objc_msgSend(*(id *)(v730 + 64), "allowableClassesForClientWithContext:", v731));
      v131 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v129, (uint64_t)v731, v130);
      v132 = v131;
      if (v131)
      {
        v133 = (void *)[v131 valueForKey:@"NSMetadata"];
        v134 = (void *)[v731 managedObjectContext];
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Got save request: %@", v135, v136, v137, v138, v139, v140, (uint64_t)v132);
        }
        if (!v133) {
          goto LABEL_88;
        }
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Updating metadata", v141, v142, v143, v144, v145, v146, v724);
        }
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([*(id *)(v730 + 64) shouldAcceptMetadataChangesFromClientWithContext:v731] & 1) != 0)
        {
          v147 = (void *)[v133 mutableCopy];
          [v147 removeObjectForKey:@"NSStoreUUID"];
          [v147 removeObjectForKey:@"NSStoreType"];
          [v147 removeObjectForKey:@"NSStoreModelVersionHashes"];
          [v147 removeObjectForKey:@"NSStoreModelVersionIdentifiers"];
          [v147 removeObjectForKey:0x1ED796A00];
          [v147 removeObjectForKey:0x1ED796A20];
          if (v731) {
            v148 = (void *)v731[4];
          }
          else {
            v148 = 0;
          }
          [v148 setMetadata:v147];

LABEL_88:
          obuint64_t j = (id)[v132 valueForKey:@"deleted"];
          id v735 = (id)[v132 valueForKey:@"inserted"];
          id v738 = (id)[v132 valueForKey:@"updated"];
          v149 = (void *)[v132 valueForKey:@"locked"];
          v150 = (void *)[MEMORY[0x1E4F1CA48] array];
          long long v769 = 0u;
          long long v770 = 0u;
          long long v767 = 0u;
          long long v768 = 0u;
          uint64_t v151 = [obj countByEnumeratingWithState:&v767 objects:&v781 count:16];
          if (v151)
          {
            uint64_t v152 = *(void *)v768;
            do
            {
              for (uint64_t j = 0; j != v151; ++j)
              {
                if (*(void *)v768 != v152) {
                  objc_enumerationMutation(obj);
                }
                objc_msgSend(v150, "addObject:", objc_msgSend(*(id *)(*((void *)&v767 + 1) + 8 * j), "objectAtIndex:", 0));
              }
              uint64_t v151 = [obj countByEnumeratingWithState:&v767 objects:&v781 count:16];
            }
            while (v151);
          }
          long long v765 = 0u;
          long long v766 = 0u;
          long long v763 = 0u;
          long long v764 = 0u;
          uint64_t v154 = [v738 countByEnumeratingWithState:&v763 objects:&v777 count:16];
          if (v154)
          {
            uint64_t v155 = *(void *)v764;
            do
            {
              for (uint64_t k = 0; k != v154; ++k)
              {
                if (*(void *)v764 != v155) {
                  objc_enumerationMutation(v738);
                }
                objc_msgSend(v150, "addObject:", objc_msgSend(*(id *)(*((void *)&v763 + 1) + 8 * k), "objectAtIndex:", 0));
              }
              uint64_t v154 = [v738 countByEnumeratingWithState:&v763 objects:&v777 count:16];
            }
            while (v154);
          }
          long long v761 = 0u;
          long long v762 = 0u;
          long long v759 = 0u;
          long long v760 = 0u;
          uint64_t v157 = [v149 countByEnumeratingWithState:&v759 objects:v776 count:16];
          if (v157)
          {
            uint64_t v158 = *(void *)v760;
            do
            {
              for (uint64_t m = 0; m != v157; ++m)
              {
                if (*(void *)v760 != v158) {
                  objc_enumerationMutation(v149);
                }
                objc_msgSend(v150, "addObject:", objc_msgSend(*(id *)(*((void *)&v759 + 1) + 8 * m), "objectAtIndex:", 0));
              }
              uint64_t v157 = [v149 countByEnumeratingWithState:&v759 objects:v776 count:16];
            }
            while (v157);
          }
          +[_PFRoutines fetchHeterogeneousCollectionByObjectIDs:intoContext:]((uint64_t)_PFRoutines, (uint64_t)v150, (uint64_t)v134);
          self;
          if (+[NSXPCStoreServer debugDefault]) {
            _NSCoreDataLog(8, @"Locking objects :%@", v160, v161, v162, v163, v164, v165, (uint64_t)v149);
          }
          long long v757 = 0u;
          long long v758 = 0u;
          long long v755 = 0u;
          long long v756 = 0u;
          uint64_t v166 = [v149 countByEnumeratingWithState:&v755 objects:v775 count:16];
          if (v166)
          {
            uint64_t v167 = *(void *)v756;
            do
            {
              uint64_t v168 = 0;
              do
              {
                if (*(void *)v756 != v167) {
                  objc_enumerationMutation(v149);
                }
                v169 = *(void **)(*((void *)&v755 + 1) + 8 * v168);
                v170 = (void *)MEMORY[0x18C127630]();
                v171 = (void *)[v169 objectAtIndex:0];
                if (v134) {
                  id v172 = _PFRetainedObjectIDCore((uint64_t)v134, v171, 0, 1);
                }
                else {
                  id v172 = 0;
                }
                [v172 willAccessValueForKey:0];
                if ([v172 isDeleted])
                {
                  if (+[NSXPCStoreServer debugDefault]) {
                    _NSCoreDataLog(8, @"Not locking %@ because it's not in the db", v173, v174, v175, v176, v177, v178, (uint64_t)v172);
                  }
                }
                else
                {
                  if (+[NSXPCStoreServer debugDefault]) {
                    _NSCoreDataLog(8, @"Locking %@", v179, v180, v181, v182, v183, v184, (uint64_t)v172);
                  }
                  objc_msgSend(v172, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v169, "objectAtIndex:", 1), "unsignedIntegerValue"));
                  [v134 detectConflictsForObject:v172];
                }
                ++v168;
              }
              while (v166 != v168);
              uint64_t v185 = [v149 countByEnumeratingWithState:&v755 objects:v775 count:16];
              uint64_t v166 = v185;
            }
            while (v185);
          }
          long long v753 = 0u;
          long long v754 = 0u;
          long long v751 = 0u;
          long long v752 = 0u;
          uint64_t v186 = [obj countByEnumeratingWithState:&v751 objects:v774 count:16];
          if (!v186) {
            goto LABEL_156;
          }
          uint64_t v187 = 0;
          v188 = 0;
          uint64_t v189 = *(void *)v752;
          uint64_t v729 = *MEMORY[0x1E4F281F8];
          while (1)
          {
            uint64_t v190 = 0;
            do
            {
              if (*(void *)v752 != v189) {
                objc_enumerationMutation(obj);
              }
              v191 = *(void **)(*((void *)&v751 + 1) + 8 * v190);
              v192 = (void *)MEMORY[0x18C127630]();
              v193 = (void *)[v191 objectAtIndex:0];
              uint64_t v194 = [v193 entity];
              if (v187 != v194)
              {
                v188 = (void *)[*(id *)(v730 + 64) restrictingWritePredicateForEntity:v194 fromClientWithContext:v731];
                uint64_t v187 = v194;
              }
              if (!v188)
              {
                v203 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:v729 code:134092 userInfo:0];
LABEL_149:
                int v202 = 0;
                v771[0] = v203;
                goto LABEL_150;
              }
              if ((void *)[MEMORY[0x1E4F28F60] predicateWithValue:0] == v188)
              {
                v203 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:v729 code:134030 userInfo:0];
                goto LABEL_149;
              }
              if (v134) {
                id v195 = _PFRetainedObjectIDCore((uint64_t)v134, v193, 0, 1);
              }
              else {
                id v195 = 0;
              }
              [v195 willAccessValueForKey:0];
              if ([v195 isDeleted]) {
                goto LABEL_146;
              }
              objc_msgSend(v195, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v191, "objectAtIndex:", 1), "unsignedIntegerValue"));
              -[NSXPCStoreServer _populateObject:withValuesFromClient:](v195, v191);
              if ((void *)[MEMORY[0x1E4F28F60] predicateWithValue:1] == v188
                || ([v188 evaluateWithObject:v195] & 1) != 0)
              {
                if (+[NSXPCStoreServer debugDefault]) {
                  _NSCoreDataLog(8, @"Deleting object :%@", v196, v197, v198, v199, v200, v201, (uint64_t)v195);
                }
                [v134 deleteObject:v195];
LABEL_146:

                int v202 = 1;
                goto LABEL_150;
              }
              v771[0] = (id)[MEMORY[0x1E4F28C58] errorWithDomain:v729 code:134030 userInfo:0];

              int v202 = 0;
LABEL_150:
              if (!v202)
              {
                id v39 = 0;
                goto LABEL_383;
              }
              ++v190;
            }
            while (v186 != v190);
            uint64_t v204 = [obj countByEnumeratingWithState:&v751 objects:v774 count:16];
            uint64_t v186 = v204;
            if (!v204)
            {
LABEL_156:
              v205 = (void *)[MEMORY[0x1E4F1CA48] array];
              v206 = (void *)[MEMORY[0x1E4F1CA48] array];
              v207 = (void *)[MEMORY[0x1E4F1CA48] array];
              long long v749 = 0u;
              long long v750 = 0u;
              long long v747 = 0u;
              long long v748 = 0u;
              uint64_t v208 = [v735 countByEnumeratingWithState:&v747 objects:v773 count:16];
              if (v208)
              {
                uint64_t v209 = *(void *)v748;
                do
                {
                  for (uint64_t n = 0; n != v208; ++n)
                  {
                    if (*(void *)v748 != v209) {
                      objc_enumerationMutation(v735);
                    }
                    v211 = *(void **)(*((void *)&v747 + 1) + 8 * n);
                    v212 = (void *)MEMORY[0x18C127630]();
                    v213 = (void *)[v211 objectAtIndex:0];
                    [v207 addObject:v213];
                    v214 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([NSManagedObject alloc], "initWithEntity:insertIntoManagedObjectContext:", [v213 entity], v134);
                    [v206 addObject:v214];
                    if (+[NSXPCStoreServer debugDefault]) {
                      _NSCoreDataLog(8, @"Inserting object with ID %@", v215, v216, v217, v218, v219, v220, (uint64_t)v213);
                    }
                    [v205 addObject:v214];
                  }
                  uint64_t v208 = [v735 countByEnumeratingWithState:&v747 objects:v773 count:16];
                }
                while (v208);
              }

              uint64_t v221 = [v205 count];
              if (v221)
              {
                for (iuint64_t i = 0; ii != v221; ++ii)
                {
                  v223 = (void *)MEMORY[0x18C127630]();
                  v224 = (void *)[v735 objectAtIndex:ii];
                  v225 = (void *)[v205 objectAtIndex:ii];
                  objc_msgSend(v225, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v224, "objectAtIndex:", 1), "unsignedIntegerValue"));
                  -[NSXPCStoreServer _populateObject:withValuesFromClient:](v225, v224);
                }
              }
              long long v745 = 0u;
              long long v746 = 0u;
              long long v743 = 0u;
              long long v744 = 0u;
              uint64_t v226 = [v738 countByEnumeratingWithState:&v743 objects:v772 count:16];
              if (v226)
              {
                uint64_t v227 = *(void *)v744;
                do
                {
                  uint64_t v228 = 0;
                  do
                  {
                    if (*(void *)v744 != v227) {
                      objc_enumerationMutation(v738);
                    }
                    v229 = *(void **)(*((void *)&v743 + 1) + 8 * v228);
                    v230 = (void *)MEMORY[0x18C127630]();
                    v231 = (void *)[v229 objectAtIndex:0];
                    if (v134) {
                      id v232 = _PFRetainedObjectIDCore((uint64_t)v134, v231, 0, 1);
                    }
                    else {
                      id v232 = 0;
                    }
                    [v232 willAccessValueForKey:0];
                    objc_msgSend(v232, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(v229, "objectAtIndex:", 1), "unsignedIntegerValue"));
                    -[NSXPCStoreServer _populateObject:withValuesFromClient:](v232, v229);

                    ++v228;
                  }
                  while (v226 != v228);
                  uint64_t v233 = [v738 countByEnumeratingWithState:&v743 objects:v772 count:16];
                  uint64_t v226 = v233;
                }
                while (v233);
              }
              [v134 processPendingChanges];
              v234 = -[NSManagedObjectContext _newSaveRequestForCurrentState]((uint64_t)v134);
              if (+[NSXPCStoreServer debugDefault]) {
                _NSCoreDataLog(8, @"Made save request: %@", v235, v236, v237, v238, v239, v240, (uint64_t)v234);
              }
              id v39 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [*(id *)(v730 + 64) processRequest:v234 fromClientWithContext:v731 error:v771]);
LABEL_383:
              id v654 = v771[0];
              [v728 drain];
              id v655 = v39;
              id v656 = 0;
              if (v771[0]) {
                v742 = (char *)v771[0];
              }
              id v657 = v771[0];
              goto LABEL_403;
            }
          }
        }
        v608 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134092 userInfo:0];
      }
      else
      {
        v606 = (void *)MEMORY[0x1E4F28C58];
        *(void *)&long long v777 = *MEMORY[0x1E4F28588];
        uint64_t v724 = v130;
        v781 = (__CFString *)[NSString stringWithFormat:@"Unable to unarchive save request with allowed classes: %@"];
        uint64_t v607 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v781 forKeys:&v777 count:1];
        v608 = (void *)[v606 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v607];
      }
      id v39 = 0;
      v771[0] = v608;
      goto LABEL_383;
    case 4:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"OID", v403, v404, v405, v406, v407, v408, v724);
      }
      uint64_t v409 = a1[5];
      if (v409) {
        uint64_t v410 = *(void *)(v409 + 24);
      }
      else {
        uint64_t v410 = 0;
      }
      uint64_t v411 = v734[8];
      if (!v411) {
        goto LABEL_444;
      }
      v412 = (void *)v734[7];
      v413 = (void *)MEMORY[0x18C127630]();
      v414 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v415 = objc_opt_class();
      uint64_t v416 = objc_opt_class();
      uint64_t v417 = objc_opt_class();
      uint64_t v727 = objc_opt_class();
      uint64_t v724 = v416;
      uint64_t v726 = v417;
      v418 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v410, (uint64_t)v412, [v414 setWithObjects:v415]);
      id v419 = v418;
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Got oid  request for %@", v420, v421, v422, v423, v424, v425, (uint64_t)v418);
      }
      v426 = -[NSXPCStoreServerRequestHandlingPolicy processObtainRequest:inContext:error:](*(void **)(v411 + 64), v418, v412, &v742);
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Returning result %@", v427, v428, v429, v430, v431, v432, (uint64_t)v426);
      }

      if (!v426) {
        goto LABEL_444;
      }
      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v426);
      goto LABEL_401;
    case 5:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Fault", v433, v434, v435, v436, v437, v438, v724);
      }
      uint64_t v439 = a1[5];
      if (v439) {
        uint64_t v440 = *(void *)(v439 + 24);
      }
      else {
        uint64_t v440 = 0;
      }
      uint64_t v441 = a1[8];
      if (!v441) {
        goto LABEL_444;
      }
      v442 = (void *)a1[7];
      v776[0] = 0;
      id v741 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v443 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v444 = objc_opt_class();
      uint64_t v445 = objc_opt_class();
      uint64_t v446 = objc_opt_class();
      uint64_t v447 = objc_opt_class();
      objc_opt_class();
      uint64_t v726 = v446;
      uint64_t v727 = v447;
      uint64_t v724 = v445;
      v448 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v440, (uint64_t)v442, [v443 setWithObjects:v444]);
      if ((unint64_t)[v448 count] < 2)
      {
        uint64_t v450 = 0;
      }
      else
      {
        uint64_t v449 = [v448 objectAtIndex:1];
        uint64_t v450 = v449;
        if (v449)
        {
          v451 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v449, v442);
          goto LABEL_300;
        }
      }
      v451 = 0;
LABEL_300:
      uint64_t v542 = [v448 firstObject];
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Attempting to fire fault for %@", v543, v544, v545, v546, v547, v548, v542);
      }
      if (v450 && !v451 && +[NSXPCStoreServer debugDefault])
      {
        _NSCoreDataLog(8, @"Can't fulfill fault request: can't find query generation: %@", v549, v550, v551, v552, v553, v554, 0);
        v555 = (void *)MEMORY[0x1E4F28C58];
        v781 = @"unrecognized query generation";
        *(void *)&long long v777 = @"reason";
        *((void *)&v777 + 1) = @"generation";
        *(void *)&long long v778 = @"target";
        uint64_t v782 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v783 = v542;
        uint64_t v556 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v781 forKeys:&v777 count:3];
        v557 = (void *)[v555 errorWithDomain:*MEMORY[0x1E4F281F8] code:134061 userInfo:v556];
LABEL_352:
        id v561 = 0;
        int v617 = 0;
        v776[0] = v557;
        goto LABEL_371;
      }
      v558 = (void *)[v442 managedObjectContext];
      [v558 setStalenessInterval:0.0];
      uint64_t v559 = objc_msgSend((id)objc_msgSend(v558, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", v542);
      if (!v559)
      {
        v615 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v616 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"missing objectID" forKey:@"reason"];
        v557 = (void *)[v615 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v616];
        goto LABEL_352;
      }
      uint64_t v560 = [*(id *)(v441 + 64) processFaultForObjectWithID:v559 fromClientWithContext:v442 error:v776];
      if (v560) {
        id v561 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, v560);
      }
      else {
        id v561 = 0;
      }
      int v617 = 1;
LABEL_371:
      id v646 = v776[0];
      [v741 drain];
      if (v776[0]) {
        v742 = (char *)v776[0];
      }
      id v647 = v776[0];
      if (!v617)
      {
LABEL_444:
        id v39 = 0;
        goto LABEL_403;
      }
      goto LABEL_374;
    case 6:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Rel fault", v241, v242, v243, v244, v245, v246, v724);
      }
      uint64_t v247 = a1[5];
      if (v247) {
        uint64_t v248 = *(void *)(v247 + 24);
      }
      else {
        uint64_t v248 = 0;
      }
      uint64_t v249 = a1[8];
      if (!v249) {
        goto LABEL_444;
      }
      v250 = (void *)a1[7];
      v776[0] = 0;
      id v739 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v251 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v252 = objc_opt_class();
      uint64_t v253 = objc_opt_class();
      uint64_t v254 = objc_opt_class();
      uint64_t v255 = objc_opt_class();
      objc_opt_class();
      objc_opt_class();
      uint64_t v727 = v255;
      uint64_t v724 = v253;
      uint64_t v726 = v254;
      v256 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v248, (uint64_t)v250, [v251 setWithObjects:v252]);
      v257 = (void *)[v256 firstObject];
      if ((unint64_t)[v256 count] < 2)
      {
        uint64_t v259 = 0;
      }
      else
      {
        uint64_t v258 = [v256 objectAtIndex:1];
        uint64_t v259 = v258;
        if (v258)
        {
          v260 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v258, v250);
          goto LABEL_311;
        }
      }
      v260 = 0;
LABEL_311:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Got relationship fault request: %@", v562, v563, v564, v565, v566, v567, (uint64_t)v257);
      }
      if (v259 && !v260 && +[NSXPCStoreServer debugDefault])
      {
        _NSCoreDataLog(8, @"Can't fulfill relationship fault request: can't find query generation: %@", v568, v569, v570, v571, v572, v573, 0);
        v574 = (void *)MEMORY[0x1E4F28C58];
        v781 = @"unrecognized query generation";
        *(void *)&long long v777 = @"reason";
        *((void *)&v777 + 1) = @"generation";
        *(void *)&long long v778 = @"request";
        uint64_t v782 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v783 = (uint64_t)v257;
        uint64_t v575 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v781 forKeys:&v777 count:3];
        v576 = (void *)[v574 errorWithDomain:*MEMORY[0x1E4F281F8] code:134061 userInfo:v575];
      }
      else
      {
        v577 = (void *)[v250 managedObjectContext];
        [v577 setStalenessInterval:0.0];
        uint64_t v578 = objc_msgSend((id)objc_msgSend(v577, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(v257, "valueForKey:", @"source"));
        uint64_t v579 = [v257 valueForKey:@"relationship"];
        if (+[NSXPCStoreServer debugDefault])
        {
          uint64_t v726 = v579;
          _NSCoreDataLog(8, @"Attempting to fire fault for %@, %@", v580, v581, v582, v583, v584, v585, v578);
        }
        if (v578)
        {
          v586 = (void *)[*(id *)(v249 + 64) processFaultForRelationshipWithName:v579 onObjectWithID:v578 fromClientWithContext:v250 error:v776];
          if (v586)
          {
            id v587 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if ((void *)[MEMORY[0x1E4F1CA98] null] == v586)
            {
              objc_msgSend(v587, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v586 URIRepresentation];
              }
              else
              {
                long long v779 = 0u;
                long long v780 = 0u;
                long long v777 = 0u;
                long long v778 = 0u;
                uint64_t v704 = [v586 countByEnumeratingWithState:&v777 objects:&v781 count:16];
                if (v704)
                {
                  uint64_t v705 = *(void *)v778;
                  do
                  {
                    for (juint64_t j = 0; jj != v704; ++jj)
                    {
                      if (*(void *)v778 != v705) {
                        objc_enumerationMutation(v586);
                      }
                      v707 = *(void **)(*((void *)&v777 + 1) + 8 * jj);
                      v708 = (void *)MEMORY[0x18C127630]();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        uint64_t v717 = objc_opt_class();
                        _NSCoreDataLog(8, @"Wrong in all kinds of ways. Less colloquially, that should be an object ID, but it's an instance of %@ instead", v718, v719, v720, v721, v722, v723, v717);
                        goto LABEL_446;
                      }
                      objc_msgSend(v587, "addObject:", objc_msgSend(v707, "URIRepresentation"));
                    }
                    uint64_t v704 = [v586 countByEnumeratingWithState:&v777 objects:&v781 count:16];
                  }
                  while (v704);
                }
              }
            }
            if (+[NSXPCStoreServer debugDefault])
            {
              uint64_t v726 = v579;
              uint64_t v727 = (uint64_t)v587;
              _NSCoreDataLog(8, @"Fired relationship fault %@ - %@, returning values: %@", v709, v710, v711, v712, v713, v714, v578);
            }
            id v561 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v587);
          }
          else
          {
            if (+[NSXPCStoreServer debugDefault])
            {
              uint64_t v726 = v579;
              _NSCoreDataLog(8, @"Attempted to fire relationship fault %@ - %@, no such luck", v648, v649, v650, v651, v652, v653, v578);
            }
            id v561 = 0;
          }
          int v620 = 1;
LABEL_441:
          id v715 = v776[0];
          [v739 drain];
          if (v776[0]) {
            v742 = (char *)v776[0];
          }
          id v716 = v776[0];
          if (!v620) {
            goto LABEL_444;
          }
LABEL_374:
          id v332 = v561;
          goto LABEL_402;
        }
        v618 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v619 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v257 forKey:@"originalRequest"];
        v576 = (void *)[v618 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v619];
      }
      id v561 = 0;
      int v620 = 0;
      v776[0] = v576;
      goto LABEL_441;
    case 7:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Request notification name", v303, v304, v305, v306, v307, v308, v724);
      }
      if (!a1[8]) {
        goto LABEL_444;
      }
      v309 = (void *)a1[7];
      v310 = (void *)MEMORY[0x18C127630]();
      v317 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v309, "managedObjectContext"), "persistentStoreCoordinator"), "persistentStores"), "lastObject");
      if (!v317) {
        _NSCoreDataLog(8, @"no store", v311, v312, v313, v314, v315, v316, v724);
      }
      *(void *)&long long v777 = @"notificationName";
      v781 = (__CFString *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)_PFRoutines, v317);
      uint64_t v318 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v781 forKeys:&v777 count:1];
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Got pull changes result %@", v319, v320, v321, v322, v323, v324, v318);
      }
      id v325 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, v318);
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Which archives to %@", v326, v327, v328, v329, v330, v331, (uint64_t)v325);
      }
      id v332 = v325;
      goto LABEL_402;
    case 9:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Query generation", v333, v334, v335, v336, v337, v338, v724);
      }
      if (!a1[8]) {
        goto LABEL_444;
      }
      v339 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18C127630]();
      v341 = (void *)[v339 persistentStoreCoordinator];
      v342 = (void *)[v341 _retainedCurrentQueryGeneration:0];
      v349 = objc_msgSend((id)objc_msgSend(v341, "persistentStores"), "lastObject");
      if (!v349) {
        _NSCoreDataLog(8, @"no store", v343, v344, v345, v346, v347, v348, v724);
      }
      v350 = (NSQueryGenerationToken *)-[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v342, v349);
      v351 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v350, v339);
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Got queryGeneration %@", v352, v353, v354, v355, v356, v357, (uint64_t)v342);
      }

      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v351);
      if (+[NSXPCStoreServer debugDefault]) {
        goto LABEL_399;
      }
      goto LABEL_400;
    case 0xALL:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Query generation release", v469, v470, v471, v472, v473, v474, v724);
      }
      uint64_t v475 = a1[5];
      if (v475) {
        uint64_t v476 = *(void *)(v475 + 24);
      }
      else {
        uint64_t v476 = 0;
      }
      if (!a1[8]) {
        goto LABEL_444;
      }
      v477 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18C127630]();
      v478 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v479 = objc_opt_class();
      uint64_t v480 = objc_opt_class();
      uint64_t v726 = objc_opt_class();
      uint64_t v727 = 0;
      uint64_t v724 = v480;
      uint64_t v481 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v476, (uint64_t)v477, [v478 setWithObjects:v479]);
      if (v481) {
        -[NSXPCStoreServerPerConnectionCache releaseQueryGenerationForRemoteGeneration:]((id *)[v477 cache], *(void *)(v481 + 24));
      }
      else {
        _NSCoreDataLog(8, @"Attempting to free nothing (or too many things) %@", v482, v483, v484, v485, v486, v487, 0);
      }
      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, MEMORY[0x1E4F1CC38]);
      goto LABEL_400;
    case 0xBLL:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Query generation reopen", v452, v453, v454, v455, v456, v457, v724);
      }
      uint64_t v458 = a1[5];
      if (v458) {
        uint64_t v459 = *(void *)(v458 + 24);
      }
      else {
        uint64_t v459 = 0;
      }
      if (!a1[8]) {
        goto LABEL_444;
      }
      v460 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18C127630]();
      v461 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v462 = objc_opt_class();
      uint64_t v463 = objc_opt_class();
      uint64_t v726 = objc_opt_class();
      uint64_t v727 = 0;
      uint64_t v724 = v463;
      uint64_t v464 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v459, (uint64_t)v460, [v461 setWithObjects:v462]);
      uint64_t v465 = v464;
      if (!v464)
      {
        if (+[NSXPCStoreServer debugDefault])
        {
          _NSCoreDataLog(8, @"Bad parameter to reopen generation %@", v609, v610, v611, v612, v613, v614, 0);
          v468 = 0;
          goto LABEL_398;
        }
        goto LABEL_397;
      }
      uint64_t v466 = *(void *)(v464 + 24);
      v467 = (NSQueryGenerationToken *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]((id *)[v460 cache], v466);
      if (v467)
      {
        v468 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v467, v460);
        goto LABEL_398;
      }
      v621 = (NSQueryGenerationToken *)-[NSPersistentStoreCoordinator _reopenQueryGenerationWithIdentifier:inStoreWithIdentifier:error:]((void (*)(void))[v460 persistentStoreCoordinator], v466, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v460, "persistentStoreCoordinator"), "persistentStores"), "firstObject"), "identifier"), 0);
      v622 = v621;
      if (!v621)
      {
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Unable to reopen generation %@", v667, v668, v669, v670, v671, v672, v465);
        }
LABEL_397:
        v468 = 0;
        goto LABEL_398;
      }
      v623 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v621, v460);
      v468 = v623;
      if (v623) {
        uint64_t isa = (uint64_t)v623[3].super.isa;
      }
      else {
        uint64_t isa = 0;
      }
      -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:]((void *)[v460 cache], v622, isa);
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Reopened generation %@", v625, v626, v627, v628, v629, v630, (uint64_t)v468);
      }
LABEL_398:
      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v468);

      if (+[NSXPCStoreServer debugDefault]) {
LABEL_399:
      }
        _NSCoreDataLog(8, @"Which archives to %@", v359, v360, v361, v362, v363, v364, (uint64_t)v358);
LABEL_400:
LABEL_401:
      id v332 = v358;
LABEL_402:
      id v39 = v332;
LABEL_403:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Done event handler", v673, v674, v675, v676, v677, v678, v724);
      }
      if (!*(unsigned char *)(*(void *)(v734[12] + 8) + 24))
      {
        a1 = v734;
        goto LABEL_407;
      }
      v680 = v742;
      if (v742)
      {
        a1 = v734;
        if (-[NSXPCStoreServer errorIsPlausiblyAnSQLiteIssue:](v734[8], v742))
        {
          if (-[NSXPCStoreServer setupRecoveryForConnectionContext:ifNecessary:](v734[8], v734[7], (uint64_t)v742))v696 = @"SQLite error on server: %@, recovery being attempted"; {
          else
          }
            v696 = @"SQLite error on server: %@, no recovery being attempted";
          *(void *)(*(void *)(v734[13] + 8) + 40) = objc_msgSend(NSString, "stringWithFormat:", v696, v742, v726, v727);
          +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, *(void *)(*(void *)(v734[13] + 8) + 40), v734[8], v697, v698, v699, v700, v701, v725);
        }
        goto LABEL_409;
      }
      a1 = v734;
      if (v39)
      {
        uint64_t v681 = 0;
      }
      else
      {
        v702 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v703 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"request failed (no result, no error)", @"Problem" forKey];
        id v39 = 0;
        v742 = (char *)[v702 errorWithDomain:*MEMORY[0x1E4F281F8] code:134070 userInfo:v703];
        uint64_t v681 = 8;
      }
LABEL_411:
      if (self)
      {
        self->_messageCode = v681;
        objc_setProperty_nonatomic(self, v680, v39, 24);
      }
      if (v742) {
        v742 = (char *)+[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v742);
      }
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Sending reply %p, %p", v682, v683, v684, v685, v686, v687, (uint64_t)self);
      }
      v688 = v742;
      [(id)a1[6] reset];

      [v733 drain];
      id v689 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      (*(void (**)(void))(a1[11] + 16))();
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Sent reply", v690, v691, v692, v693, v694, v695, v724);
      }

      [v689 drain];
      v742 = 0;
      return;
    case 0xCLL:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Batch delete", v71, v72, v73, v74, v75, v76, v724);
      }
      uint64_t v77 = a1[5];
      if (v77) {
        uint64_t v78 = *(void *)(v77 + 24);
      }
      else {
        uint64_t v78 = 0;
      }
      uint64_t v79 = v734[8];
      if (!v79) {
        goto LABEL_444;
      }
      uint64_t v80 = v734[7];
      v781 = 0;
      v81 = (void *)MEMORY[0x18C127630]();
      id v82 = +[NSBatchDeleteRequest decodeFromXPCArchive:v78 withContext:v80 withPolicy:*(void *)(v79 + 64)];
      if (v82)
      {
        id v88 = (id)[*(id *)(v79 + 64) processRequest:v82 fromClientWithContext:v80 error:&v781];
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Which had result %@", v89, v90, v91, v92, v93, v94, (uint64_t)v88);
        }
        if (v88) {
          id v88 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [v88 result]);
        }
      }
      else
      {
        _NSCoreDataLog(8, @"Nil batch delete request", 0, v83, v84, v85, v86, v87, v724);
        id v88 = 0;
      }
      v593 = v781;
      if (v781) {
        v742 = (char *)v781;
      }
      goto LABEL_331;
    case 0xDLL:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Persistent history", v261, v262, v263, v264, v265, v266, v724);
      }
      uint64_t v267 = a1[5];
      if (v267) {
        uint64_t v268 = *(void *)(v267 + 24);
      }
      else {
        uint64_t v268 = 0;
      }
      uint64_t v269 = v734[8];
      if (!v269) {
        goto LABEL_444;
      }
      uint64_t v270 = v734[7];
      v781 = 0;
      v271 = (void *)MEMORY[0x18C127630]();
      id v272 = +[NSPersistentHistoryChangeRequest decodeFromXPCArchive:v268 withContext:v270 withPolicy:*(void *)(v269 + 64)];
      if (v272)
      {
        id v88 = (id)[*(id *)(v269 + 64) processRequest:v272 fromClientWithContext:v270 error:&v781];
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Which had result %@", v278, v279, v280, v281, v282, v283, (uint64_t)v88);
        }
        if (v88) {
          id v88 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [v88 result]);
        }
      }
      else
      {
        _NSCoreDataLog(8, @"Nil persistent history request", 0, v273, v274, v275, v276, v277, v724);
        id v88 = 0;
      }
      v595 = v781;
      if (v781) {
        v742 = (char *)v781;
      }
LABEL_331:
      v594 = v781;
      id v332 = v88;
      goto LABEL_402;
    case 0xELL:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Persistent history token", v95, v96, v97, v98, v99, v100, v724);
      }
      uint64_t v101 = a1[5];
      if (v101) {
        uint64_t v102 = *(void *)(v101 + 24);
      }
      else {
        uint64_t v102 = 0;
      }
      if (!a1[8]) {
        goto LABEL_444;
      }
      v103 = (void *)a1[7];
      v104 = (void *)MEMORY[0x18C127630]();
      v105 = (void *)[v103 persistentStoreCoordinator];
      v106 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v107 = objc_opt_class();
      uint64_t v724 = objc_opt_class();
      uint64_t v726 = 0;
      v108 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v102, (uint64_t)v103, [v106 setWithObjects:v107]);
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Server received history token payload - %@", v109, v110, v111, v112, v113, v114, (uint64_t)v108);
      }
      if (![v108 count]) {
        goto LABEL_276;
      }
      v115 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v108, "count"));
      long long v779 = 0u;
      long long v780 = 0u;
      long long v777 = 0u;
      long long v778 = 0u;
      v116 = (void *)[v105 persistentStores];
      uint64_t v117 = [v116 countByEnumeratingWithState:&v777 objects:&v781 count:16];
      if (v117)
      {
        uint64_t v118 = *(void *)v778;
        do
        {
          for (uint64_t kk = 0; kk != v117; ++kk)
          {
            if (*(void *)v778 != v118) {
              objc_enumerationMutation(v116);
            }
            v120 = *(void **)(*((void *)&v777 + 1) + 8 * kk);
            if (objc_msgSend(v108, "containsObject:", objc_msgSend(v120, "identifier"))) {
              [v115 addObject:v120];
            }
          }
          uint64_t v117 = [v116 countByEnumeratingWithState:&v777 objects:&v781 count:16];
        }
        while (v117);
      }
      if ([v115 count]) {
        v121 = (void *)[v105 currentPersistentHistoryTokenFromStores:v115];
      }
      else {
LABEL_276:
      }
        v121 = 0;
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Server sending back historyToken %@", v488, v489, v490, v491, v492, v493, (uint64_t)v121);
      }
      id v494 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [v121 storeTokens]);
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Server historyToken archived to %@", v495, v496, v497, v498, v499, v500, (uint64_t)v494);
      }
      id v501 = 0;
      id v332 = v494;
      goto LABEL_402;
    case 0xFLL:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Batch update", v47, v48, v49, v50, v51, v52, v724);
      }
      uint64_t v53 = a1[5];
      if (v53) {
        uint64_t v54 = *(void *)(v53 + 24);
      }
      else {
        uint64_t v54 = 0;
      }
      uint64_t v55 = v734[8];
      if (!v55) {
        goto LABEL_444;
      }
      uint64_t v56 = v734[7];
      v781 = 0;
      v57 = (void *)MEMORY[0x18C127630]();
      id v58 = +[NSBatchUpdateRequest decodeFromXPCArchive:v54 withContext:v56 withPolicy:*(void *)(v55 + 64)];
      if (v58)
      {
        id v64 = (id)[*(id *)(v55 + 64) processRequest:v58 fromClientWithContext:v56 error:&v781];
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Which had result %@", v65, v66, v67, v68, v69, v70, (uint64_t)v64);
        }
        if (v64) {
          id v64 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [v64 result]);
        }
      }
      else
      {
        _NSCoreDataLog(8, @"Nil batch update request", 0, v59, v60, v61, v62, v63, v724);
        v588 = (void *)MEMORY[0x1E4F28C58];
        v776[0] = *(id *)MEMORY[0x1E4F28588];
        *(void *)&long long v777 = @"Unable to decode request, ensure policy allows for updated class values";
        uint64_t v589 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v777 forKeys:v776 count:1];
        v590 = (__CFString *)[v588 errorWithDomain:*MEMORY[0x1E4F281F8] code:134070 userInfo:v589];
        id v64 = 0;
        v781 = v590;
      }
      v591 = v781;
      if (v781) {
        v742 = (char *)v781;
      }
      goto LABEL_327;
    case 0x10:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Batch insert", v365, v366, v367, v368, v369, v370, v724);
      }
      uint64_t v371 = a1[5];
      if (v371) {
        uint64_t v372 = *(void *)(v371 + 24);
      }
      else {
        uint64_t v372 = 0;
      }
      uint64_t v373 = v734[8];
      if (!v373) {
        goto LABEL_444;
      }
      uint64_t v374 = v734[7];
      v781 = 0;
      v375 = (void *)MEMORY[0x18C127630]();
      id v376 = +[NSBatchInsertRequest decodeFromXPCArchive:v372 withContext:v374 withPolicy:*(void *)(v373 + 64)];
      if (v376)
      {
        id v64 = (id)[*(id *)(v373 + 64) processRequest:v376 fromClientWithContext:v374 error:&v781];
        if (+[NSXPCStoreServer debugDefault]) {
          _NSCoreDataLog(8, @"Which had result %@", v382, v383, v384, v385, v386, v387, (uint64_t)v64);
        }
        if (v64) {
          id v64 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, [v64 result]);
        }
      }
      else
      {
        _NSCoreDataLog(8, @"Nil batch insert request", 0, v377, v378, v379, v380, v381, v724);
        v596 = (void *)MEMORY[0x1E4F28C58];
        v776[0] = *(id *)MEMORY[0x1E4F28588];
        *(void *)&long long v777 = @"Unable to decode request, ensure policy allows for inserted class values";
        uint64_t v597 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v777 forKeys:v776 count:1];
        v598 = (__CFString *)[v596 errorWithDomain:*MEMORY[0x1E4F281F8] code:134070 userInfo:v597];
        id v64 = 0;
        v781 = v598;
      }
      v599 = v781;
      if (v781) {
        v742 = (char *)v781;
      }
LABEL_327:
      v592 = v781;
      id v332 = v64;
      goto LABEL_402;
    case 0x11:
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Query generation active connections", v388, v389, v390, v391, v392, v393, v724);
      }
      if (!a1[8]) {
        goto LABEL_444;
      }
      v394 = (void *)a1[7];
      v340 = (void *)MEMORY[0x18C127630]();
      v395 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v394, "persistentStoreCoordinator"), "persistentStores"), "lastObject");
      if (v395)
      {
        v402 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v395, "_hasActiveGenerations"));
      }
      else
      {
        _NSCoreDataLog(8, @"no store", v396, v397, v398, v399, v400, v401, v724);
        v402 = &unk_1ED7E2758;
      }
      if (+[NSXPCStoreServer debugDefault]) {
        _NSCoreDataLog(8, @"Got active connections %@", v600, v601, v602, v603, v604, v605, (uint64_t)v402);
      }
      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v402);
      if (+[NSXPCStoreServer debugDefault]) {
        goto LABEL_399;
      }
      goto LABEL_400;
    default:
      goto LABEL_28;
  }
}

+ (unint64_t)debugDefault
{
  return _CoreData_XPCDebug;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x18C127630](self, a2, a3);
  if (a4) {
    [a4 auditToken];
  }
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @"%@ - Incoming connection: %@", v7, v8, v9, v10, v11, v12, (uint64_t)self);
  }
  if (self)
  {
    uint64_t v13 = (void *)MEMORY[0x18C127630]();
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v14 = (void *)[self->_delegate identifierForConnection:a4];
      objc_sync_enter(self);
      if (v14)
      {
        uint64_t v15 = (NSXPCStoreServerPerConnectionCache *)[(NSMutableDictionary *)self->_cacheIDtoCoordinatorMap objectForKey:v14];
        if (v15)
        {
          if (!NSMapGet(self->_connectionToCoordinatorMap, a4))
          {
            NSMapInsert(self->_connectionToCoordinatorMap, a4, v15);
            atomic_fetch_add_explicit(&v15->_connections, 1uLL, memory_order_relaxed);
LABEL_22:
            *(void *)&long long v59 = MEMORY[0x1E4F143A8];
            *((void *)&v59 + 1) = 3221225472;
            *(void *)&long long v60 = __47__NSXPCStoreServer_retainedCacheForConnection___block_invoke;
            *((void *)&v60 + 1) = &unk_1E544B778;
            uint64_t v61 = self;
            id v62 = a4;
            [a4 setInterruptionHandler:&v59];
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __47__NSXPCStoreServer_retainedCacheForConnection___block_invoke_2;
            v58[3] = &unk_1E544B778;
            v58[4] = self;
            v58[5] = a4;
            [a4 setInvalidationHandler:v58];
            goto LABEL_30;
          }
          goto LABEL_30;
        }
        char v16 = 0;
LABEL_14:
        uint64_t v15 = (NSXPCStoreServerPerConnectionCache *)NSMapGet(self->_connectionToCoordinatorMap, a4);
        if (!v15)
        {
          uint64_t v23 = self->_model;
          if (v23)
          {
            uint64_t v24 = (void *)MEMORY[0x18C127630]();
            uint64_t v25 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v23];

            *(void *)&long long v59 = 0;
            if ([(NSPersistentStoreCoordinator *)v25 addPersistentStoreWithType:@"SQLite" configuration:0 URL:self->_storeURL options:self->_storeOptions error:&v59])
            {
              if (v25)
              {
                uint64_t v15 = [[NSXPCStoreServerPerConnectionCache alloc] initWithCoordinator:v25];

                if ((v16 & 1) == 0)
                {
                  [(NSMutableDictionary *)self->_cacheIDtoCoordinatorMap setObject:v15 forKey:v14];
                  -[NSXPCStoreServerPerConnectionCache setClientIdentifier:](v15, v14);
                  if (v15) {
                    atomic_fetch_add_explicit(&v15->_connections, 1uLL, memory_order_relaxed);
                  }
                }
                NSMapInsert(self->_connectionToCoordinatorMap, a4, v15);

                goto LABEL_22;
              }
            }
            else
            {
              if (-[NSXPCStoreServer errorIsPlausiblyAnSQLiteIssue:]((uint64_t)self, (void *)v59))
              {
                -[NSXPCStoreServer setupRecoveryForConnectionContext:ifNecessary:]((uint64_t)self, 0, v59);
                uint64_t v26 = [NSString stringWithFormat:@"Can't create coordinator - attempting SQLite recovery"];
              }
              else
              {
                uint64_t v57 = v59;
                uint64_t v26 = [NSString stringWithFormat:@"Can't create coordinator - due to an error - %@"];
              }
              +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v26, (uint64_t)self, v27, v28, v29, v30, v31, v57);

              _NSCoreDataLog(8, @"Unable to load store: %@", v32, v33, v34, v35, v36, v37, v59);
            }
          }
          else
          {
            _NSCoreDataLog(8, @"%@: Unable to find model", v17, v18, v19, v20, v21, v22, (uint64_t)self);
          }
          uint64_t v15 = 0;
        }
LABEL_30:
        objc_sync_exit(self);
        v38 = v15;
        goto LABEL_31;
      }
    }
    else
    {
      objc_sync_enter(self);
      uint64_t v14 = 0;
    }
    char v16 = 1;
    goto LABEL_14;
  }
  uint64_t v15 = 0;
LABEL_31:
  if (![(NSXPCStoreServerPerConnectionCache *)v15 coordinator])
  {
    uint64_t v44 = [NSString stringWithFormat:@"Unable to create stack"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v44, (uint64_t)self, v45, v46, v47, v48, v49, v57);

LABEL_36:
    BOOL v43 = 0;
    goto LABEL_37;
  }
  id v39 = [NSXPCStoreConnectionInfo alloc];
  entitlementNames = self->_entitlementNames;
  long long v59 = 0u;
  long long v60 = 0u;
  id v41 = [(NSXPCStoreConnectionInfo *)v39 initForToken:&v59 entitlementNames:entitlementNames cache:v15];

  if (!v41)
  {
    uint64_t v50 = [NSString stringWithFormat:@"Unable to create connection context"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v50, (uint64_t)self, v51, v52, v53, v54, v55, v57);
    goto LABEL_36;
  }
  [a4 setDelegate:self];
  [a4 setExportedObject:self];
  objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1ED7EC5A8));
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v42 setValue:v41 forKey:@"NSConnectionInfo"];

  [a4 setUserInfo:v42];
  [a4 resume];
  BOOL v43 = 1;
LABEL_37:
  return v43;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _CoreData_XPCDebug = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.XPCDebug");
  }
}

- (id)initForStoreWithURL:(id)a3 usingModel:(id)a4 options:(id)a5 policy:(id)a6
{
  v69[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {

    uint64_t v14 = @"model";
    if (!a3) {
      uint64_t v14 = @"storeURL";
    }
    uint64_t v15 = [NSString stringWithFormat:@"Can't create server - misconfigured server : %@ is nil", v14];
    goto LABEL_14;
  }
  uint64_t v11 = (void *)[a5 valueForKey:@"NSXPCStoreEntitlementNames"];
  if (!v11)
  {
    v69[0] = @"application-identifier";
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
    goto LABEL_10;
  }
  uint64_t v12 = v11;
  if (([v11 containsObject:@"application-identifier"] & 1) == 0)
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", v12), "arrayByAddingObject:", @"application-identifier");
LABEL_10:
    uint64_t v12 = (void *)v13;
  }
  uint64_t v21 = [a5 valueForKey:@"NSXPCStoreServiceName"];
  int v22 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:", @"NSXPCStoreDaemonize"), "BOOLValue");
  int v23 = v22;
  if (!v21 && v22)
  {

    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Can't create server - misconfigured server : no service name supplied for daemonized server", v57);
LABEL_14:
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v15, 0, v16, v17, v18, v19, v20, v58);
    return 0;
  }
  uint64_t v26 = [a5 valueForKey:@"NSXPCStoreListener"];
  if (v26 && v21)
  {
    uint64_t v27 = [NSString stringWithFormat:@"Options dictionary contains service name and anonymous listener, defaulting to service name"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v27, 0, v28, v29, v30, v31, v32, v57);
    uint64_t v26 = 0;
  }
  long long v59 = (void *)v26;
  v66.receiver = self;
  v66.super_class = (Class)NSXPCStoreServer;
  uint64_t v24 = [(NSXPCStoreServer *)&v66 init];
  if (v24)
  {
    int v60 = v23;
    id v61 = a6;
    uint64_t v33 = (NSManagedObjectModel *)a4;
    v24->_model = v33;
    if (!v33)
    {
      uint64_t v51 = [NSString stringWithFormat:@"Can't create server - unable to load model"];
      +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v51, (uint64_t)v24, v52, v53, v54, v55, v56, v57);
      abort();
    }
    uint64_t v34 = v33;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v35 = [(NSManagedObjectModel *)v33 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v63 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          if (v39)
          {

            *(void *)(v39 + 48) = 0;
          }
        }
        uint64_t v36 = [(NSManagedObjectModel *)v34 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v36);
    }
    v24->_storeURL = (NSURL *)a3;
    v24->_entitlementNames = (NSArray *)[v12 copy];
    if (v61) {
      uint64_t v40 = (NSXPCStoreServerRequestHandlingPolicy *)v61;
    }
    else {
      uint64_t v40 = objc_alloc_init(NSXPCStoreServerRequestHandlingPolicy);
    }
    v24->_policy = v40;
    id v41 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a5];
    v67[0] = @"NSPersistentStoreDeferredLightweightMigrationOptionKey";
    v67[1] = @"NSMigratePersistentStoresAutomaticallyOption";
    v67[2] = @"NSInferMappingModelAutomaticallyOption";
    v67[3] = @"NSPersistentStoreForceLightweightMigrationOption";
    -[NSDictionary removeObjectsForKeys:](v41, "removeObjectsForKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4]);
    if (![(NSDictionary *)v41 isEqualToDictionary:a5]) {
      _NSCoreDataLog(2, @"XPC Store Server - Migration keys have been removed from %@", v42, v43, v44, v45, v46, v47, (uint64_t)a5);
    }
    v24->_storeOptions = v41;
    if (v21)
    {
      if (v60)
      {
        uint64_t v48 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v21];
      }
      else
      {
        _NSCoreDataLog(8, @"Attempting to create non-mach listener with service name: %@", v42, v43, v44, v45, v46, v47, v21);
        uint64_t v48 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithServiceName:v21];
      }
    }
    else if (v59)
    {
      uint64_t v48 = v59;
    }
    else
    {
      uint64_t v48 = (NSXPCListener *)(id)[MEMORY[0x1E4F29290] serviceListener];
    }
    v24->_listener = v48;
    [(NSXPCListener *)v48 setDelegate:v24];
    uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F28F58]) initWithOptions:0];
    uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F28F58]) initWithOptions:0];
    v24->_connectionToCoordinatorMap = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v49 valuePointerFunctions:v50 capacity:10];

    v24->_cacheIDtoCoordinatorMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v24;
}

- (id)initForStoreWithURL:(id)a3 usingModelAtURL:(id)a4 options:(id)a5 policy:(id)a6
{
  if (a3 && a4)
  {
    uint64_t v11 = [[NSManagedObjectModel alloc] initWithContentsOfURL:a4];
    uint64_t v12 = [(NSXPCStoreServer *)self initForStoreWithURL:a3 usingModel:v11 options:a5 policy:a6];
    if (v12) {
      v12[2] = a4;
    }
  }
  else
  {

    uint64_t v13 = @"storeURL";
    if (!a4) {
      uint64_t v13 = @"modelURL";
    }
    uint64_t v14 = [NSString stringWithFormat:@"Can't create server - misconfigured server : %@ is nil", v13];
    +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, v14, 0, v15, v16, v17, v18, v19, v21);
    return 0;
  }
  return v12;
}

- (void)startListening
{
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @"%@: Listening", v3, v4, v5, v6, v7, v8, (uint64_t)self);
  }
  listener = self->_listener;

  [(NSXPCListener *)listener resume];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];

  self->_listener = 0;
  self->_policy = 0;

  self->_connectionToCoordinatorMap = 0;
  self->_cacheIDtoCoordinatorMap = 0;

  self->_modelURL = 0;
  self->_model = 0;

  self->_storeURL = 0;
  self->_storeOptions = 0;

  self->_entitlementNames = 0;
  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreServer;
  [(NSXPCStoreServer *)&v3 dealloc];
}

- (id)errorHandlingDelegate
{
  return self->_delegate;
}

- (void)setErrorHandlingDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    id v5 = a3;

    self->_delegate = a3;
  }
}

- (void)errorIsPlausiblyAnSQLiteIssue:(uint64_t)a1
{
  result = 0;
  if (a1 && a2)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSSQLiteErrorDomain");
    if (result) {
      goto LABEL_8;
    }
    id v5 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSUnderlyingException");
    if (v5)
    {
      result = (void *)[v5 userInfo];
    }
    else
    {
      result = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"exception info");
      if (!result) {
        return result;
      }
    }
    result = (void *)[result objectForKey:@"NSSQLiteErrorDomain"];
    if (result)
    {
LABEL_8:
      int v6 = [result intValue];
      return (void *)(v6 == 11 || v6 == 26);
    }
  }
  return result;
}

- (uint64_t)setupRecoveryForConnectionContext:(uint64_t)a3 ifNecessary:
{
  if (result)
  {
    uint64_t v3 = result;
    result = *(void *)(result + 8);
    if (result)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return 0;
      }
      result = [*(id *)(v3 + 8) willPerformRecoveryForError:a3 fromContext:a2];
      if (!result) {
        return result;
      }
      if (objc_opt_respondsToSelector())
      {
        [*(id *)(v3 + 8) performRecoveryForError:a3 fromContext:a2];
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)removeCachesForConnection:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_sync_enter(result);
    id v5 = (void *)MEMORY[0x18C127630](v4);
    int v6 = NSMapGet(*((NSMapTable **)v3 + 9), a2);
    if (v6 && v6[6] && (uint64_t)atomic_fetch_add_explicit(v6 + 5, 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed) <= 1) {
      objc_msgSend(*((id *)v3 + 10), "removeObjectForKey:");
    }
    NSMapRemove(*((NSMapTable **)v3 + 9), a2);
    [a2 setUserInfo:0];
    return objc_sync_exit(v3);
  }
  return result;
}

void *__47__NSXPCStoreServer_retainedCacheForConnection___block_invoke(uint64_t a1)
{
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @" Server Connection interrupted.", v2, v3, v4, v5, v6, v7, v11);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);

  return -[NSXPCStoreServer removeCachesForConnection:](v8, v9);
}

void *__47__NSXPCStoreServer_retainedCacheForConnection___block_invoke_2(uint64_t a1)
{
  if (+[NSXPCStoreServer debugDefault]) {
    _NSCoreDataLog(8, @" Server Connection invalidated.", v2, v3, v4, v5, v6, v7, v11);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);

  return -[NSXPCStoreServer removeCachesForConnection:](v8, v9);
}

- (NSXPCStoreServerDelegate)delegate
{
  return (NSXPCStoreServerDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSQueryGenerationToken)retainedXPCEncodableGenerationTokenForOriginal:(NSQueryGenerationToken *)a1 inContext:(void *)a2
{
  uint64_t v4 = (void *)MEMORY[0x18C127630]();
  if (+[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken") == a1|| +[NSQueryGenerationToken unpinnedQueryGenerationToken] == a1)
  {
    uint64_t v9 = a1;
    goto LABEL_13;
  }
  if (+[NSQueryGenerationToken nostoresQueryGenerationToken] == a1)
  {
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  if (a1)
  {
    Class isa = a1[2].super.isa;
    if (isa) {
      id WeakRetained = objc_loadWeakRetained((id *)isa + 1);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v7 = [_NSXPCQueryGenerationToken alloc];
    Class v8 = a1[3].super.isa;
    if (v7) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [_NSXPCQueryGenerationToken alloc];
  id WeakRetained = 0;
  Class v8 = 0;
  if (!v7) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = (NSQueryGenerationToken *)-[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v7, v8, WeakRetained, 0);
LABEL_9:

  uint64_t v10 = (void *)[a2 cache];
  if (a1) {
    uint64_t v11 = (uint64_t)a1[3].super.isa;
  }
  else {
    uint64_t v11 = 0;
  }
  -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:](v10, a1, v11);
LABEL_13:
  return v9;
}

- (uint64_t)_populateObject:(void *)a1 withValuesFromClient:(void *)a2
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v47 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v4 = (void *)[a1 managedObjectContext];
  uint64_t v5 = (void *)[a1 entity];
  objc_msgSend(a1, "_setVersionReference__:", objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 1), "longLongValue"));
  uint64_t v56 = a2;
  uint64_t v55 = [a2 objectAtIndex:2];
  if (v5) {
    uint64_t v6 = (void *)v5[14];
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "values");
  unint64_t v8 = v6[6];
  uint64_t v9 = v6[7];
  uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v53 = v10;
  BOOL v11 = v8 < v9 + v8;
  uint64_t v49 = v7;
  if (v8 < v9 + v8)
  {
    uint64_t v50 = v6;
    uint64_t v12 = 0;
    uint64_t v13 = v7;
    char v14 = 0;
    uint64_t v15 = v9 + 3;
    uint64_t v16 = v13 + 8 * v8;
    while (1)
    {
      uint64_t v17 = [*(id *)(v16 + 8 * v12) name];
      uint64_t v10 = [v56 objectAtIndex:v12 + 3];
      if (v10 != v55)
      {
        uint64_t v18 = v10;
        uint64_t v10 = [a1 valueForKey:v17];
        if (v10 != v18)
        {
          uint64_t v10 = [(id)v10 isEqual:v18];
          if ((v10 & 1) == 0) {
            break;
          }
        }
      }
      if ((v14 & 1) == 0)
      {
        uint64_t v19 = [a1 valueForKey:v17];
LABEL_14:
        uint64_t v10 = [a1 setValue:v19 forKey:v17];
      }
      ++v12;
      char v14 = 1;
      if (v9 == v12)
      {
        uint64_t v7 = v49;
        uint64_t v6 = v50;
        goto LABEL_18;
      }
    }
    if (v53 == v18) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v18;
    }
    goto LABEL_14;
  }
  uint64_t v15 = 3;
LABEL_18:
  unint64_t v20 = v6[12];
  uint64_t v21 = v6[13];
  uint64_t v48 = a1;
  if (v20 >= v21 + v20) {
    goto LABEL_32;
  }
  uint64_t v51 = v21 + v15;
  int v22 = (id *)(v7 + 8 * v20);
  do
  {
    uint64_t v23 = [*v22 name];
    uint64_t v10 = [v56 objectAtIndex:v15];
    if (v10 == v55
      || (v24 = v10, uint64_t v10 = [a1 valueForKey:v23], v10 == v24)
      || (uint64_t v10 = [(id)v10 isEqual:v24], (v10 & 1) != 0))
    {
      if (v11) {
        goto LABEL_29;
      }
      uint64_t v25 = [a1 valueForKey:v23];
    }
    else
    {
      if (v53 == v24)
      {
        uint64_t v26 = 0;
        goto LABEL_28;
      }
      uint64_t v25 = [v4 existingObjectWithID:v24 error:0];
    }
    uint64_t v26 = v25;
LABEL_28:
    uint64_t v10 = [a1 setValue:v26 forKey:v23];
LABEL_29:
    ++v15;
    ++v22;
    BOOL v11 = 1;
    --v21;
  }
  while (v21);
  uint64_t v15 = v51;
LABEL_32:
  unint64_t v28 = v6[14];
  uint64_t v27 = v6[15];
  if (v28 < v27 + v28)
  {
    uint64_t v52 = v27 + v15;
    do
    {
      uint64_t v29 = (void *)MEMORY[0x18C127630](v10);
      uint64_t v30 = [*(id *)(v7 + 8 * v28) name];
      uint64_t v31 = (void *)[v56 objectAtIndex:v15];
      if (v55 == [v31 objectAtIndex:0])
      {
        if (!v11) {
          objc_msgSend(v48, "setValue:forKey:", objc_msgSend(v48, "valueForKey:", v30), v30);
        }
        BOOL v11 = 1;
      }
      else
      {
        uint64_t v32 = (void *)[v31 objectAtIndex:0];
        uint64_t v33 = (void *)[v31 objectAtIndex:1];
        uint64_t v54 = (void *)[v48 mutableSetValueForKey:v30];
        if ([v32 count])
        {
          id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v35 = [v32 countByEnumeratingWithState:&v61 objects:v66 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v62;
            do
            {
              uint64_t v38 = 0;
              do
              {
                if (*(void *)v62 != v37) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v39 = [v4 existingObjectWithID:*(void *)(*((void *)&v61 + 1) + 8 * v38) error:0];
                if (v39) {
                  [v34 addObject:v39];
                }
                ++v38;
              }
              while (v36 != v38);
              uint64_t v36 = [v32 countByEnumeratingWithState:&v61 objects:v66 count:16];
            }
            while (v36);
          }
          [v54 unionSet:v34];

          BOOL v11 = 1;
          uint64_t v7 = v49;
        }
        if ([v33 count])
        {
          id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          uint64_t v41 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v58;
            do
            {
              uint64_t v44 = 0;
              do
              {
                if (*(void *)v58 != v43) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v45 = [v4 existingObjectWithID:*(void *)(*((void *)&v57 + 1) + 8 * v44) error:0];
                if (v45) {
                  [v40 addObject:v45];
                }
                ++v44;
              }
              while (v42 != v44);
              uint64_t v42 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
            }
            while (v42);
          }
          [v54 minusSet:v40];

          BOOL v11 = 1;
          uint64_t v7 = v49;
        }
      }
      ++v15;
      ++v28;
    }
    while (v15 != v52);
  }
  return [v47 drain];
}

@end