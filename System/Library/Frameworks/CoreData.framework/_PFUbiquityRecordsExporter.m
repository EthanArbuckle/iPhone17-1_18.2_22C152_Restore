@interface _PFUbiquityRecordsExporter
- (_PFUbiquityRecordsExporter)init;
- (id)createDictionaryForObjectsInSaveNotification:(unsigned int)a3 forTransactionOfType:(uint64_t)a4 withExportContext:(uint64_t)a5 andSaveSnapshot:;
- (id)description;
- (uint64_t)beginWatchingForChangesFromStore:(uint64_t)result;
- (uint64_t)stopWatchingForChanges;
- (void)dealloc;
- (void)initWithLocalPeerID:(void *)a3 forStoreName:(void *)a4 ubiquityRootLocation:(void *)a5 localRootLocation:(NSObject *)a6 andProcessingQueue:;
- (void)managedObjectContextDidSave:(id)a3;
- (void)moveLogsFromTempDirectory;
- (void)scheduleTempLogMove;
@end

@implementation _PFUbiquityRecordsExporter

- (_PFUbiquityRecordsExporter)init
{
  return 0;
}

- (void)initWithLocalPeerID:(void *)a3 forStoreName:(void *)a4 ubiquityRootLocation:(void *)a5 localRootLocation:(NSObject *)a6 andProcessingQueue:
{
  if (!a1) {
    return 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)_PFUbiquityRecordsExporter;
  v11 = objc_msgSendSuper2(&v18, sel_init);
  if (v11)
  {
    v11[6] = objc_alloc_init(MEMORY[0x1E4F28E08]);
    v11[1] = [a2 copy];
    v11[3] = a4;
    v11[4] = a5;
    v11[5] = a3;
    objc_setProperty_atomic(v11, v12, 0, 16);
    v11[7] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((unsigned char *)v11 + 64) = 0;
    uint64_t v13 = v11[3];
    BOOL v14 = v13 == 0;
    BOOL v15 = v13 != 0;
    char v16 = v14;
    *((unsigned char *)v11 + 66) = v16;
    *((unsigned char *)v11 + 65) = v15;
    v11[9] = a6;
    dispatch_retain(a6);
  }
  return v11;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_localPeerID = 0;
  self->_ubiquityRootLocation = 0;

  self->_localRootLocation = 0;
  self->_transactionLock = 0;

  self->_storeName = 0;
  objc_setProperty_atomic(self, v3, 0, 16);
  dispatch_release((dispatch_object_t)self->_processingQueue);
  self->_processingQueue = 0;

  self->_pendingTransactionsToStoreNameAndTransactionNumber = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFUbiquityRecordsExporter;
  [(_PFUbiquityRecordsExporter *)&v4 dealloc];
}

- (id)description
{
  SEL v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)_PFUbiquityRecordsExporter;
  id v5 = [(_PFUbiquityRecordsExporter *)&v10 description];
  if (self)
  {
    localPeerID = self->_localPeerID;
    ubiquityRootLocation = self->_ubiquityRootLocation;
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    ubiquityRootLocation = 0;
    localPeerID = 0;
    id Property = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tlocalPeerID: %@\n\tubiquityRootLocation: %@\n\tlastTransactionDate: %@\n", v5, localPeerID, ubiquityRootLocation, Property];
}

- (uint64_t)beginWatchingForChangesFromStore:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    objc_super v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    return [v4 addObserver:v3 selector:sel_managedObjectContextDidSave_ name:@"_NSSQLCoreTransactionStateChangeNotification" object:a2];
  }
  return result;
}

- (uint64_t)stopWatchingForChanges
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    return [v2 removeObserver:v1 name:@"_NSSQLCoreTransactionStateChangeNotification" object:0];
  }
  return result;
}

- (void)managedObjectContextDidSave:(id)a3
{
  v178[16] = *(id *)MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreTransactionType"), "intValue");
  selfa = self;
  if (v4 == 5) {
    goto LABEL_5;
  }
  int v5 = v4;
  if (v4 != 2)
  {
    uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
    if (![(NSString *)self->_storeName isEqualToString:v20]) {
      return;
    }
    uint64_t v21 = [(NSMutableDictionary *)self->_pendingTransactionsToStoreNameAndTransactionNumber objectForKey:v20];
    if (!v21) {
      return;
    }
    v22 = (void *)v21;
    uint64_t v23 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreTransientSequenceNumber");
    id v148 = (id)[v22 objectForKey:v23];
    if (!v148) {
      return;
    }
    if (v5 == 3)
    {
      uint64_t v40 = [v148 objectForKey:@"transactionLog"];
      v178[0] = 0;
      if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:](v40, v178))
      {
        v41 = (void *)[a3 object];
        v42 = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithStoreKnowledgeVectorDictionary:", -[NSSQLCore fetchUbiquityKnowledgeVector](v41));
        v43 = [PFUbiquityPeerReceipt alloc];
        if (v40 && (uint64_t v44 = *(void *)(v40 + 24)) != 0)
        {
          uint64_t v45 = *(void *)(v44 + 40);
          uint64_t v46 = *(void *)(v44 + 48);
        }
        else
        {
          uint64_t v45 = 0;
          uint64_t v46 = 0;
        }
        v47 = [(PFUbiquityPeerReceipt *)v43 initWithLocalPeerID:self->_localPeerID andKnowledgeVector:v42 forPeerID:self->_localPeerID storeName:v45 modelVersionHash:v46 andUbiquityRootLocation:self->_ubiquityRootLocation];
        self;
        v48 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
        v49 = v48;
        if (v48)
        {
          v50 = (void *)v48[11];
          if (v50) {
            v50 = (void *)v50[11];
          }
        }
        else
        {
          v50 = 0;
        }
        v51 = v50;
        v53 = v51;
        if (v51) {
          objc_setProperty_atomic(v51, v52, v42, 64);
        }
        -[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:]((uint64_t)v53, v47);
        if (v49)
        {
          uint64_t v55 = v49[11];
          if (v55)
          {
            v56 = *(void **)(v55 + 120);
            if (v56) {
              objc_setProperty_nonatomic(v56, v54, v42, 88);
            }
          }
        }
        if (v53) {
          uint64_t v57 = v53[6];
        }
        else {
          uint64_t v57 = 0;
        }
        -[PFUbiquityTransactionLogCache cacheExportedLog:](v57, v40);
        id v58 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)v42);
        if (v49 && (uint64_t v59 = v49[11]) != 0) {
          uint64_t v60 = *(void *)(v59 + 72);
        }
        else {
          uint64_t v60 = 0;
        }
        -[_PFUbiquityRecordsImporter requestBaselineRollForStore:](v60, (uint64_t)v41);

        id v61 = objc_alloc(MEMORY[0x1E4F1C978]);
        if (v40) {
          uint64_t v62 = *(void *)(v40 + 24);
        }
        else {
          uint64_t v62 = 0;
        }
        v63 = objc_msgSend(v61, "initWithObjects:", v62, 0);
        v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v63, @"PFLogLocationsKey", v58, @"debug.kvStr", self->_localPeerID, @"exportingPeerID", 0);

        v65 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"PFUbiquityLocationWasExportedNotification" object:self->_ubiquityRootLocation userInfo:v64];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v65);
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError moving log to permanent location: %@\nError: %@\n User Info: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 345, self, v40, v178[0], [v178[0] userInfo]);
      }
      goto LABEL_129;
    }
    if (v5 != 4)
    {
LABEL_129:
      [v22 removeObjectForKey:v23];

      return;
    }
    v24 = (void *)[v148 objectForKey:@"storeName"];
    v25 = (PFUbiquityKnowledgeVector *)[v148 objectForKey:@"transactionLog"];
    v26 = v25;
    if (v25)
    {
      kv = v25[2]._kv;
      unint64_t hash = v25->_hash;
      if (hash)
      {
        uint64_t v29 = *(void *)(hash + 40);
        if (kv)
        {
LABEL_37:
          v25 = (PFUbiquityKnowledgeVector *)[(objc_class *)kv[5].super.isa objectForKey:v29];
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v29 = 0;
        if (kv) {
          goto LABEL_37;
        }
      }
      v25 = 0;
    }
LABEL_38:
    v30 = -[PFUbiquityStoreSaveSnapshot createKnowledgeVectorFromPeerStates](v25);
    v31 = (void *)-[PFUbiquityKnowledgeVector newKnowledgeVectorByDecrementingPeerWithID:]((uint64_t)v30, (uint64_t)self->_localPeerID);
    self;
    v145 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
    if (v145)
    {
      uint64_t v33 = v145[11];
      if (v33)
      {
        v34 = *(void **)(v33 + 88);
        if (v34) {
          objc_setProperty_atomic(v34, v32, v31, 64);
        }
      }
    }

    self;
    v35 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, self->_localPeerID, self->_storeName, self->_ubiquityRootLocation, 0);
    if (v35) {
      id v36 = v35[1];
    }
    else {
      id v36 = 0;
    }
    uint64_t v143 = v23;
    v37 = +[PFUbiquityPeerState peerStateForStoreName:andPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeerState, v24, self->_localPeerID, v36, 0);
    if (v37)
    {
      v38 = v37;
      v39 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(-[PFUbiquityTransactionLog transactionNumber](v26), "unsignedIntegerValue") - 1);
      [(PFUbiquityPeerState *)v38 setTransactionNumber:v39];
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Didn't find peer state for local peer ID: %@ after transacation rolled back: %@", "-[_PFUbiquityRecordsExporter cleanUpFromRolledbackPendingTransaction:withNotification:]", 210, self->_localPeerID, v26);
    }
    if (v35) {
      id v84 = v35[1];
    }
    else {
      id v84 = 0;
    }
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    v141 = (void *)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v24, v84);
    v85 = (void *)[v141 transactionEntries];
    uint64_t v86 = [v85 countByEnumeratingWithState:&v171 objects:v178 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v172;
      do
      {
        uint64_t v88 = 0;
        do
        {
          if (*(void *)v172 != v87) {
            objc_enumerationMutation(v85);
          }
          v89 = *(void **)(*((void *)&v171 + 1) + 8 * v88);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v89, "actingPeer"), "peerKey"), "isEqualToString:", self->_localPeerID)&& objc_msgSend((id)objc_msgSend(v89, "transactionNumber"), "isEqualToNumber:", -[PFUbiquityTransactionLog transactionNumber](v26)))
          {
            if (v35) {
              id v90 = v35[1];
            }
            else {
              id v90 = 0;
            }
            [v90 deleteObject:v89];
          }
          ++v88;
        }
        while (v86 != v88);
        uint64_t v91 = [v85 countByEnumeratingWithState:&v171 objects:v178 count:16];
        uint64_t v86 = v91;
      }
      while (v91);
    }
    v92 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)self->_ubiquityRootLocation, (uint64_t)self->_localPeerID);
    if (v26) {
      uint64_t v93 = v26->_hash;
    }
    else {
      uint64_t v93 = 0;
    }
    v94 = (void *)-[PFUbiquityLocation createFullURL](v93);
    uint64_t v165 = 0;
    v166 = &v165;
    uint64_t v167 = 0x3052000000;
    v168 = __Block_byref_object_copy__37;
    v169 = __Block_byref_object_dispose__37;
    uint64_t v170 = 0;
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __87___PFUbiquityRecordsExporter_cleanUpFromRolledbackPendingTransaction_withNotification___block_invoke;
    v164[3] = &unk_1E544E928;
    v164[5] = &v165;
    v164[4] = self;
    [v92 coordinateWritingItemAtURL:v94 options:1 error:&v170 byAccessor:v164];

    if (v166[5]
      && +[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error deleting invalidated log file at url: %@\nError: %@\n User Info: %@", "-[_PFUbiquityRecordsExporter cleanUpFromRolledbackPendingTransaction:withNotification:]", 246, v26, v166[5], [(id)v166[5] userInfo]);
    }
    id v163 = 0;
    uint64_t v23 = v143;
    if (v35) {
      id v95 = v35[1];
    }
    else {
      id v95 = 0;
    }
    [v95 save:&v163];
    if (v163)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error trying to recover store metadata from rolled back transaction: %@\n User Info: %@\nStore Metadata: %@\nTransaction log: %@", "-[_PFUbiquityRecordsExporter cleanUpFromRolledbackPendingTransaction:withNotification:]", 252, v163, [v163 userInfo], v141, v26);
      }
      if (v145 && (uint64_t v96 = v145[11]) != 0) {
        uint64_t v97 = *(void *)(v96 + 72);
      }
      else {
        uint64_t v97 = 0;
      }
      -[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:](v97, [a3 object]);
    }

    _Block_object_dispose(&v165, 8);
    goto LABEL_129;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got notification that store is about to commit: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 269, a3);
  }
LABEL_5:
  if (self)
  {
    v6 = (void *)[a3 object];
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Exporter considering response to save: %@\nStore: %@\nOptions: %@\n", "-[_PFUbiquityRecordsExporter shouldRespondToSaveNotification:]", 137, self, v6, [v6 options]);
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreActiveSavingContext");
    if (v7)
    {
      if ((*(unsigned char *)(v7 + 42) & 2) != 0)
      {
        v8 = objc_msgSend((id)objc_msgSend(v6, "options"), "objectForKey:", @"PFSetupLocalPeerIDOverride");
        if (!v8 || [v8 isEqualToString:self->_localPeerID])
        {
          if (-[NSString isEqualToString:](self->_storeName, "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey")))
          {
            v9 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreActiveSaveRequest");
            uint64_t v10 = [v6 persistentStoreCoordinator];
            if (v10)
            {
              if (*(_WORD *)(v10 + 24))
              {
                v11 = (void *)[v9 insertedObjects];
                uint64_t v12 = [v9 updatedObjects];
                uint64_t v13 = (void *)[v9 deletedObjects];
                if (v11) {
                  v11 = (void *)[v11 count];
                }
                if (v12)
                {
                  uint64_t v12 = [(id)v12 count];
                  if (v12 >= 1)
                  {
                    id v14 = objc_alloc_init(MEMORY[0x1E4F28B28]);
                    long long v171 = 0u;
                    long long v172 = 0u;
                    long long v173 = 0u;
                    long long v174 = 0u;
                    BOOL v15 = (void *)[v9 updatedObjects];
                    uint64_t v16 = [v15 countByEnumeratingWithState:&v171 objects:v178 count:16];
                    if (v16)
                    {
                      uint64_t v17 = *(void *)v172;
                      do
                      {
                        for (uint64_t i = 0; i != v16; ++i)
                        {
                          if (*(void *)v172 != v17) {
                            objc_enumerationMutation(v15);
                          }
                          v12 -= [*(id *)(*((void *)&v171 + 1) + 8 * i) hasPersistentChangedValues] ^ 1;
                        }
                        uint64_t v16 = [v15 countByEnumeratingWithState:&v171 objects:v178 count:16];
                      }
                      while (v16);
                    }
                    [v14 drain];
                  }
                }
                BOOL v19 = !v13 || [v13 count] == 0;
                if (v11 || v12 || !v19)
                {
                  if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                  {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Exporter: %@\nWill respond.", "-[_PFUbiquityRecordsExporter shouldRespondToSaveNotification:]", 188, selfa);
                  }
                  v66 = selfa;
                  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  id v129 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  id v68 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
                  BOOL v140 = !selfa->_useLocalStorage
                      && selfa->_allowTempLogStorage
                      && objc_getProperty(selfa, v67, 16, 1)
                      && (objc_msgSend(v68, "timeIntervalSinceDate:", objc_getProperty(selfa, v67, 16, 1)), v73 < 1.0)
                      && !selfa->_pendingTempLogMove;
                  objc_setProperty_atomic(selfa, v67, v68, 16);

                  [(NSLock *)selfa->_transactionLock lock];
                  v69 = [[PFUbiquityExportContext alloc] initWithLocalPeerID:selfa->_localPeerID andUbiquityRootLocation:selfa->_ubiquityRootLocation];
                  if (v69) {
                    v69->_useLocalStorage = selfa->_useLocalStorage;
                  }
                  p_isa = (id *)&v69->super.isa;
                  v149 = [[PFUbiquitySaveSnapshot alloc] initWithSaveNotification:a3 withLocalPeerID:selfa->_localPeerID];
                  id v133 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  id v134 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  id v135 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  id v136 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  if ([v137 count])
                  {
                    v70 = 0;
                    v71 = 0;
                    v72 = 0;
                    v146 = 0;
LABEL_228:
                    if ([v137 count])
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                      {
                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Export of save notification encountered the following errors: %@, \nSave Notification: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 571, v137, a3);
                      }
                    }
                    [(NSLock *)selfa->_transactionLock unlock];

                    return;
                  }
                  id v74 = -[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]((uint64_t)selfa, a3, 0, (uint64_t)p_isa, (uint64_t)v149);
                  id v75 = -[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]((uint64_t)selfa, a3, 1u, (uint64_t)p_isa, (uint64_t)v149);
                  id v130 = -[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]((uint64_t)selfa, a3, 2u, (uint64_t)p_isa, (uint64_t)v149);
                  id v131 = v75;
                  id v132 = v74;
                  v76 = v149;
                  id v77 = v74;
                  v78 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreTransactionExternalDataReferencesToDelete"), "allObjects"), "mutableCopy");
                  if ([v78 count])
                  {
                    id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v161 = 0u;
                    long long v162 = 0u;
                    long long v159 = 0u;
                    long long v160 = 0u;
                    uint64_t v80 = [v78 countByEnumeratingWithState:&v159 objects:v177 count:16];
                    if (v80)
                    {
                      uint64_t v81 = *(void *)v160;
                      do
                      {
                        for (uint64_t j = 0; j != v80; ++j)
                        {
                          if (*(void *)v160 != v81) {
                            objc_enumerationMutation(v78);
                          }
                          uint64_t v83 = [*(id *)(*((void *)&v159 + 1) + 8 * j) UUID];
                          if (v83) {
                            [v79 addObject:v83];
                          }
                        }
                        uint64_t v80 = [v78 countByEnumeratingWithState:&v159 objects:v177 count:16];
                      }
                      while (v80);
                      v146 = v79;
                      v76 = v149;
                      id v77 = v132;
                    }
                    else
                    {
                      v146 = v79;
                    }
                  }
                  else
                  {
                    v146 = 0;
                  }

                  long long v157 = 0u;
                  long long v158 = 0u;
                  long long v155 = 0u;
                  long long v156 = 0u;
                  if (v76)
                  {
                    obuint64_t j = (id)[(NSMutableDictionary *)v76->_storeNameToStoreSaveSnapshots allKeys];
                    uint64_t v98 = [obj countByEnumeratingWithState:&v155 objects:v176 count:16];
                  }
                  else
                  {
                    obuint64_t j = 0;
                    uint64_t v98 = [0 countByEnumeratingWithState:&v155 objects:v176 count:16];
                  }
                  uint64_t v142 = v98;
                  if (!v98)
                  {
                    v70 = v77;
LABEL_227:
                    v72 = v130;
                    v71 = v131;
                    goto LABEL_228;
                  }
                  uint64_t v139 = *(void *)v156;
                  uint64_t v128 = *MEMORY[0x1E4F1C3B8];
LABEL_136:
                  uint64_t v99 = 0;
                  while (1)
                  {
                    if (*(void *)v156 != v139) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v100 = *(void *)(*((void *)&v155 + 1) + 8 * v99);
                    if (p_isa) {
                      uint64_t v101 = [p_isa[1] objectForKey:*(void *)(*((void *)&v155 + 1) + 8 * v99)];
                    }
                    else {
                      uint64_t v101 = 0;
                    }
                    if (v149)
                    {
                      v102 = (void *)[(NSMutableDictionary *)v149->_storeNameToStoreSaveSnapshots objectForKey:v100];
                      if (v101) {
                        goto LABEL_143;
                      }
                    }
                    else
                    {
                      v102 = 0;
                      if (v101)
                      {
LABEL_143:
                        uint64_t v103 = *(void *)(v101 + 40);
                        goto LABEL_144;
                      }
                    }
                    uint64_t v103 = 0;
LABEL_144:
                    if (v146 && [a3 object] == v103) {
                      -[PFUbiquityStoreSaveSnapshot _setFilesDeletedInTransaction:]((uint64_t)v102, v146);
                    }
                    -[PFUbiquityStoreSaveSnapshot reserveTransactionNumberWithStoreExportContext:](v102, v101);
                    -[PFUbiquityStoreSaveSnapshot generatePeerStates]((uint64_t)v102);
                    long long v153 = 0u;
                    long long v154 = 0u;
                    long long v151 = 0u;
                    long long v152 = 0u;
                    if (v101) {
                      v104 = *(void **)(v101 + 32);
                    }
                    else {
                      v104 = 0;
                    }
                    uint64_t v105 = [v104 countByEnumeratingWithState:&v151 objects:v175 count:16];
                    if (v105)
                    {
                      uint64_t v106 = *(void *)v152;
                      do
                      {
                        uint64_t v107 = 0;
                        do
                        {
                          if (*(void *)v152 != v106) {
                            objc_enumerationMutation(v104);
                          }
                          if (v102) {
                            uint64_t v108 = v102[15];
                          }
                          else {
                            uint64_t v108 = 0;
                          }
                          [*(id *)(*((void *)&v151 + 1) + 8 * v107++) setTransactionNumber:v108];
                        }
                        while (v105 != v107);
                        uint64_t v109 = [v104 countByEnumeratingWithState:&v151 objects:v175 count:16];
                        uint64_t v105 = v109;
                      }
                      while (v109);
                    }
                    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"PFUbiquityExporterWillUpdateKnowledgeVectorNotification", selfa);
                    if (selfa->_throwOptimisticLockingException)
                    {
                      id v111 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v128, 134304, @"Just testing", 0);
                      objc_exception_throw(v111);
                    }
                    if (v102) {
                      uint64_t v110 = v102[15];
                    }
                    else {
                      uint64_t v110 = 0;
                    }
                    -[NSSQLCore updateUbiquityKnowledgeForPeerWithID:andTransactionNumber:](v103, (uint64_t)selfa->_localPeerID, v110);
                    if (v140) {
                      -[_PFUbiquityRecordsExporter scheduleTempLogMove]((uint64_t)selfa);
                    }
                    uint64_t v112 = 32;
                    if (!selfa->_useLocalStorage) {
                      uint64_t v112 = 24;
                    }
                    v113 = [[PFUbiquityTransactionLog alloc] initWithStoreName:v100 andSaveSnapshot:v149 andRootLocation:*(Class *)((char *)&selfa->super.isa + v112)];
                    v114 = v113;
                    if (v113) {
                      v113->_useTemporaryLogLocation = selfa->_pendingTempLogMove;
                    }
                    v178[0] = 0;
                    if (v101) {
                      v115 = *(void **)(v101 + 32);
                    }
                    else {
                      v115 = 0;
                    }
                    if (-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]((uint64_t)v113, v178, v115))
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                      {
                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ Successfully wrote transaction log: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 516, selfa, v114);
                      }
                      if (selfa->_useLocalStorage)
                      {
                        if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                        {
                          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSkipping transaction history caching, using local storage.", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 522, selfa);
                        }
                      }
                      else
                      {
                        self;
                        v116 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)selfa->_storeName, (uint64_t)selfa->_localPeerID);
                        *(void *)&long long v171 = 0;
                        if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                        {
                          if (v101) {
                            uint64_t v117 = *(void *)(v101 + 32);
                          }
                          else {
                            uint64_t v117 = 0;
                          }
                          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nTransaction Entries: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 528, selfa, v117);
                        }
                        if (v116
                          && (uint64_t v118 = v116[11]) != 0
                          && (uint64_t v119 = *(void *)(v118 + 88)) != 0
                          && (uint64_t v120 = *(void *)(v119 + 56)) != 0)
                        {
                          if (v101) {
                            v121 = *(void **)(v101 + 32);
                          }
                          else {
                            v121 = 0;
                          }
                          if (-[PFUbiquityTransactionHistoryCache addTransactionEntryLights:error:](v120, (void *)[v121 allObjects]))
                          {
                            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                            {
                              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Added transaction entries to cache", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 533);
                            }
                          }
                          else
                          {
                            if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                            {
                              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error caching transaction entries after export: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 535, (void)v171);
                            }
                            if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](*(void *)(v119 + 56), 1))
                            {
                              if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                              {
                                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Wrote pending entries to disk and purged cache, it will be rebuilt", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 537);
                              }
                            }
                            else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                            {
                              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error purging cache for transaction entries: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 539, (void)v171);
                            }
                          }
                        }
                        else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                        {
                          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  No transaction history cache found for store: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 543, v114);
                        }
                      }
                      uint64_t v122 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"_NSSQLCoreTransientSequenceNumber");
                      v123 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v100, @"storeName", -[PFUbiquityTransactionLog transactionNumber](v114), @"transactionNumber", v114, @"transactionLog", 0);
                      if (v114 && (transactionLogLocation = v114->_transactionLogLocation) != 0) {
                        storeName = transactionLogLocation->_storeName;
                      }
                      else {
                        storeName = 0;
                      }
                      id v126 = (id)[(NSMutableDictionary *)selfa->_pendingTransactionsToStoreNameAndTransactionNumber objectForKey:storeName];
                      if (!v126)
                      {
                        id v126 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                        [(NSMutableDictionary *)selfa->_pendingTransactionsToStoreNameAndTransactionNumber setObject:v126 forKey:v100];
                      }
                      [v126 setObject:v123 forKey:v122];
                    }
                    else
                    {
                      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                      {
                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error writing transaction log: %@.\nError: %@\n User Info: %@", "-[_PFUbiquityRecordsExporter managedObjectContextDidSave:]", 561, v114, v178[0], [v178[0] userInfo]);
                      }
                      if (v178[0]) {
                        objc_msgSend(v137, "addObject:");
                      }
                    }

                    if (++v99 == v142)
                    {
                      uint64_t v127 = [obj countByEnumeratingWithState:&v155 objects:v176 count:16];
                      uint64_t v142 = v127;
                      if (!v127)
                      {
                        v70 = v132;
                        goto LABEL_227;
                      }
                      goto LABEL_136;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)createDictionaryForObjectsInSaveNotification:(unsigned int)a3 forTransactionOfType:(uint64_t)a4 withExportContext:(uint64_t)a5 andSaveSnapshot:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v9 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"_NSSQLCoreActiveSaveRequest");
  uint64_t v10 = (void *)[a2 object];
  if (a3 == 2)
  {
    v11 = (void *)[v9 deletedObjects];
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ exporting deleted objects: %@", "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 627, a1, v11);
    }
  }
  else if (a3 == 1)
  {
    v11 = (void *)[v9 updatedObjects];
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ exporting updated objects: %@", "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 623, a1, v11);
    }
  }
  else if (a3)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)[v9 insertedObjects];
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ exporting inserted objects: %@", "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 619, a1, v11);
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v36 = v12;
    uint64_t v38 = a4;
    uint64_t v39 = a5;
    uint64_t v15 = *(void *)v48;
    do
    {
      uint64_t v16 = 0;
      uint64_t v40 = v14;
      do
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8 * v16);
        objc_super v18 = -[PFUbiquityExportContext storeExportContextForStore:](a4, v10);
        if (v18)
        {
          p_isa = (id *)&v18->super.isa;
          if (a3 != 1 || [v17 hasPersistentChangedValues])
          {
            uint64_t v20 = v11;
            uint64_t v21 = -[PFUbiquitySaveSnapshot storeSaveSnapshotForStore:](v39, v10);
            id v46 = 0;
            v37 = v17;
            v22 = -[PFUbiquityStoreSaveSnapshot addManagedObject:withTransactionType:andStoreExportContext:withError:]((uint64_t)v21, v17, a3, p_isa, (uint64_t *)&v46);
            uint64_t v23 = 0;
            if (!*(unsigned char *)(a1 + 66))
            {
              uint64_t v23 = v22;
              if (!v22)
              {
                if (v21) {
                  v27 = (void *)v21[18];
                }
                else {
                  v27 = 0;
                }
                if ([v27 count])
                {
                  v28 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquitousExternalDataReferenceLocation:]((uint64_t)PFUbiquityFileCoordinator, [v27 lastObject]);
                  long long v42 = 0u;
                  long long v43 = 0u;
                  long long v44 = 0u;
                  long long v45 = 0u;
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v51 count:16];
                  if (v29)
                  {
                    uint64_t v30 = v29;
                    uint64_t v31 = *(void *)v43;
                    do
                    {
                      for (uint64_t i = 0; i != v30; ++i)
                      {
                        if (*(void *)v43 != v31) {
                          objc_enumerationMutation(v27);
                        }
                        uint64_t v33 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(*((void *)&v42 + 1) + 8 * i));
                        [v28 coordinateWritingItemAtURL:v33 options:1 error:0 byAccessor:&__block_literal_global_27];
                      }
                      uint64_t v30 = [v27 countByEnumeratingWithState:&v42 objects:v51 count:16];
                    }
                    while (v30);
                  }
                }
                if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error adding object to save snapshot: %@\n User Info: %@\n Object: %@", "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 688, v46, [v46 userInfo], v37);
                }
                v34 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                v35 = v34;
                if (v37) {
                  [v34 setObject:v37 forKey:@"offendingObject"];
                }
                if (v46) {
                  [v35 setObject:v46 forKey:*MEMORY[0x1E4F28A50]];
                }
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"CoreData: Ubiquity: Unable to export content for managed object." userInfo:v35]);
              }
            }
            if (v39) {
              uint64_t v24 = *(void *)(v39 + 8);
            }
            else {
              uint64_t v24 = 0;
            }
            v11 = v20;
            [(PFUbiquityTransactionEntryLight *)v23 setTransactionDate:v24];
            a4 = v38;
            uint64_t v14 = v40;
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Skipping object from a store that this exporter is not responsible for. Object ID: %@, exporter: %@", "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]", 651, v17, a1);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v25 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
      uint64_t v14 = v25;
    }
    while (v25);
    return v36;
  }
  return v12;
}

- (void)scheduleTempLogMove
{
  if (a1 && !*(unsigned char *)(a1 + 64))
  {
    *(unsigned char *)(a1 + 64) = 1;
    if (*(void *)(a1 + 72))
    {
      dispatch_time_t v2 = dispatch_time(0, 5000000000);
      uint64_t v3 = *(NSObject **)(a1 + 72);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49___PFUbiquityRecordsExporter_scheduleTempLogMove__block_invoke;
      block[3] = &unk_1E544B868;
      block[4] = a1;
      dispatch_after(v2, v3, block);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAsked to schedule a temporary log move without a queue", "-[_PFUbiquityRecordsExporter scheduleTempLogMove]", 785, a1);
    }
  }
}

- (void)moveLogsFromTempDirectory
{
  if (a1)
  {
    uint64_t v7 = 0;
    [*(id *)(a1 + 48) lock];
    int v2 = *(unsigned __int8 *)(a1 + 64);
    if (*(unsigned char *)(a1 + 64)) {
      *(unsigned char *)(a1 + 64) = 0;
    }
    [*(id *)(a1 + 48) unlock];
    if (v2)
    {
      self;
      id v3 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 40), *(void *)(a1 + 8));
      if (v3)
      {
        int v4 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 8), *(void **)(a1 + 24));
        unsigned __int8 v5 = +[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v4, &v7);
        v6 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 8), *(void **)(a1 + 32));
        if ((+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v6, &v7) & v5 & 1) == 0)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nEncountered an error while trying to move logs out of the temporary directory: %@\n Rescheduling move timer.", "-[_PFUbiquityRecordsExporter moveLogsFromTempDirectory]", 759, a1, v7);
          }
          -[_PFUbiquityRecordsExporter scheduleTempLogMove](a1);
        }
        goto LABEL_12;
      }
    }
    else
    {
      id v3 = 0;
    }
    v6 = 0;
    int v4 = 0;
LABEL_12:
  }
}

@end