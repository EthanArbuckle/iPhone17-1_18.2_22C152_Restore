@interface PFUbiquityTransactionLog
+ (uint64_t)pruneTemporaryLogDirectoryForPeerRootLocation:(void *)a3 error:;
+ (void)truncateLogFilesBeforeBaselineMetadata:(void *)a3 withLocalPeerID:(void *)a4 andUbiquityRootLocation:;
- (BOOL)deleteLogFileWithError:(uint64_t)a1;
- (BOOL)moveFileToPermanentLocationWithError:(uint64_t)a1;
- (BOOL)releaseContents:(uint64_t)a1;
- (BOOL)writeToDiskWithError:(void *)a3 andUpdateFilenameInTransactionEntries:;
- (PFUbiquityTransactionLog)init;
- (PFUbiquityTransactionLog)initWithStoreName:(id)a3 andSaveSnapshot:(id)a4 andRootLocation:(id)a5;
- (PFUbiquityTransactionLog)initWithTransactionLogLocation:(id)a3 andLocalPeerID:(id)a4;
- (PFUbiquityTransactionLog)initWithTransactionLogURL:(id)a3 ubiquityRootLocation:(id)a4 andLocalPeerID:(id)a5;
- (id)description;
- (uint64_t)loadComparisonMetadataWithError:(uint64_t)a1;
- (uint64_t)loadContents:(uint64_t)a1;
- (uint64_t)loadDeletedObjectsDataWithError:(uint64_t)result;
- (uint64_t)loadImportMetadataWithError:(uint64_t)a1;
- (uint64_t)loadInsertedObjectsDataWithError:(uint64_t)result;
- (uint64_t)loadUpdatedObjectsDataWithError:(uint64_t)result;
- (uint64_t)releaseDeletedObjects;
- (uint64_t)releaseInsertedObjects;
- (uint64_t)releaseUpdatedObjects;
- (uint64_t)rewriteToDiskWithError:(uint64_t)result;
- (void)dealloc;
- (void)transactionNumber;
@end

@implementation PFUbiquityTransactionLog

- (PFUbiquityTransactionLog)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityTransactionLog;
  v2 = [(PFUbiquityTransactionLog *)&v5 init];
  v3 = (PFUbiquityTransactionLog *)v2;
  if (v2)
  {
    *((void *)v2 + 10) = 0;
    *(_DWORD *)(v2 + 89) = 0;
    *(_WORD *)(v2 + 93) = 0;
    v2[88] = 1;
    *((void *)v2 + 12) = objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v3->_knowledgeVector = 0;
  }
  return v3;
}

- (PFUbiquityTransactionLog)initWithTransactionLogURL:(id)a3 ubiquityRootLocation:(id)a4 andLocalPeerID:(id)a5
{
  v7 = +[PFUbiquityLocation createUbiquityLocationForURL:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a3, a4);
  v8 = [(PFUbiquityTransactionLog *)self initWithTransactionLogLocation:v7 andLocalPeerID:a5];

  return v8;
}

- (PFUbiquityTransactionLog)initWithTransactionLogLocation:(id)a3 andLocalPeerID:(id)a4
{
  v6 = [(PFUbiquityTransactionLog *)self init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (!a3) {
    goto LABEL_17;
  }
  int v8 = *((_DWORD *)a3 + 6);
  if (v8 == 21)
  {
    *(_WORD *)&v6->_inTemporaryLocation = 1;
    v6->_inPermanentLocation = 0;
    v12 = (PFUbiquityLocation *)a3;
    v7->_temporaryTransactionLogLocation = v12;
    self;
    transactionLogLocation = (PFUbiquityLocation *)[(PFUbiquityLocation *)v12 copy];
    [(PFUbiquityLocation *)transactionLogLocation setUbiquityLocationType:22];
    -[PFUbiquityLocation updateHash](transactionLogLocation);
    v7->_transactionLogLocation = transactionLogLocation;
    goto LABEL_8;
  }
  if (v8 == 26)
  {
    *(_WORD *)&v6->_inTemporaryLocation = 256;
    v6->_inPermanentLocation = 0;
    v15 = (PFUbiquityLocation *)a3;
    v7->_stagingTransactionLogLocation = v15;
    self;
    v16 = (PFUbiquityLocation *)[(PFUbiquityLocation *)v15 copy];
    [(PFUbiquityLocation *)v16 setUbiquityLocationType:22];
    -[PFUbiquityLocation updateHash](v16);
    v7->_transactionLogLocation = v16;
    self;
    v13 = (void *)[(PFUbiquityLocation *)v16 copy];
    [v13 setUbiquityLocationType:21];
    uint64_t v14 = 32;
    goto LABEL_10;
  }
  if (v8 != 22)
  {
LABEL_17:

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Core Data: Ubiquity: Unable to process transaction log location: %@, doesn't appear to actually represent a transaction log location.\n", a3), 0 reason userInfo]);
  }
  *(_WORD *)&v6->_inTemporaryLocation = 0;
  v6->_inPermanentLocation = 1;
  v9 = (PFUbiquityLocation *)a3;
  v7->_transactionLogLocation = v9;
  self;
  v10 = (PFUbiquityLocation *)[(PFUbiquityLocation *)v9 copy];
  [(PFUbiquityLocation *)v10 setUbiquityLocationType:21];
  -[PFUbiquityLocation updateHash](v10);
  v7->_temporaryTransactionLogLocation = v10;
  transactionLogLocation = v7->_transactionLogLocation;
LABEL_8:
  self;
  v13 = (void *)[(PFUbiquityLocation *)transactionLogLocation copy];
  [v13 setUbiquityLocationType:26];
  uint64_t v14 = 40;
LABEL_10:
  -[PFUbiquityLocation updateHash](v13);
  *(Class *)((char *)&v7->super.isa + v14) = (Class)v13;
  v7->_useTemporaryLogLocation = 0;
  v7->_contents = 0;
  v17 = v7->_transactionLogLocation;
  self;
  if (v17) {
    filename = v17->_filename;
  }
  else {
    filename = 0;
  }
  v19 = [(NSString *)filename componentsSeparatedByString:@"."];
  BOOL v20 = [(NSArray *)v19 count] == 3
     && objc_msgSend(-[NSArray objectAtIndex:](v19, "objectAtIndex:", 1), "intValue") == 1;
  v7->_transactionLogType = v20;
  v7->_localPeerID = (NSString *)a4;
  v7->_saveSnapshot = [[PFUbiquitySaveSnapshot alloc] initWithTransactionLog:v7];
  return v7;
}

- (PFUbiquityTransactionLog)initWithStoreName:(id)a3 andSaveSnapshot:(id)a4 andRootLocation:(id)a5
{
  int v8 = [(PFUbiquityTransactionLog *)self init];
  v9 = v8;
  if (v8)
  {
    v8->_useTemporaryLogLocation = 0;
    *(_WORD *)&v8->_inTemporaryLocation = 0;
    v8->_inPermanentLocation = 0;
    v8->_saveSnapshot = (PFUbiquitySaveSnapshot *)a4;
    if (a4)
    {
      v9->_localPeerID = (NSString *)*((id *)a4 + 4);
      uint64_t v10 = [*((id *)a4 + 5) objectForKey:a3];
    }
    else
    {
      uint64_t v10 = 0;
      v9->_localPeerID = 0;
    }
    v9->_transactionLogType = 1;
    self;
    self;
    v11 = (void *)[[NSString alloc] initWithFormat:@"%@.%d.%@", +[_PFRoutines _getUUID](), 1, @"cdt"];
    if (v10) {
      v12 = *(void **)(v10 + 160);
    }
    else {
      v12 = 0;
    }
    v9->_knowledgeVector = (PFUbiquityKnowledgeVector *)v12;
    if (a4)
    {
      uint64_t v14 = *((void *)a4 + 2);
      uint64_t v13 = *((void *)a4 + 3);
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    v15 = (PFUbiquityLocation *)+[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v13, (uint64_t)a3, v14, (uint64_t)v11, a5);
    v9->_transactionLogLocation = v15;
    self;
    v16 = (PFUbiquityLocation *)[(PFUbiquityLocation *)v15 copy];
    [(PFUbiquityLocation *)v16 setUbiquityLocationType:21];
    -[PFUbiquityLocation updateHash](v16);
    v9->_temporaryTransactionLogLocation = v16;
    transactionLogLocation = v9->_transactionLogLocation;
    self;
    v18 = (PFUbiquityLocation *)[(PFUbiquityLocation *)transactionLogLocation copy];
    [(PFUbiquityLocation *)v18 setUbiquityLocationType:26];
    -[PFUbiquityLocation updateHash](v18);
    v9->_stagingTransactionLogLocation = v18;

    v9->_fileProtectionOption = 0;
  }
  return v9;
}

- (void)dealloc
{
  self->_transactionLogLocation = 0;
  self->_stagingTransactionLogLocation = 0;

  self->_temporaryTransactionLogLocation = 0;
  self->_contents = 0;

  self->_saveSnapshot = 0;
  self->_knowledgeVector = 0;

  self->_contentsLock = 0;
  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionLog;
  [(PFUbiquityTransactionLog *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityTransactionLog;
  id v4 = [(PFUbiquityTransactionLog *)&v7 description];
  if (self) {
    transactionLogLocation = self->_transactionLogLocation;
  }
  else {
    transactionLogLocation = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\ttransactionLogLocation: %@\n\ttransactionNumber: %@\n", v4, transactionLogLocation, -[PFUbiquityTransactionLog transactionNumber](self)];
}

- (void)transactionNumber
{
  if (result)
  {
    uint64_t v1 = result[9];
    uint64_t v2 = result[3];
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 40);
      if (v1) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = 0;
      if (v1)
      {
LABEL_4:
        result = (void *)[*(id *)(v1 + 40) objectForKey:v3];
        if (result) {
          return (void *)result[15];
        }
        return result;
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)releaseInsertedObjects
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 96) lock];
    uint64_t v2 = *(void *)(v1 + 24);
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 40);
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 72);
    if (v4)
    {
      uint64_t v5 = [*(id *)(v4 + 40) objectForKey:v3];
      uint64_t v6 = v5;
      if (v5)
      {
        objc_super v7 = *(void **)(v5 + 88);
        if (v7)
        {

          *(void *)(v6 + 88) = [0 mutableCopy];
        }
      }
    }
    *(unsigned char *)(v1 + 91) = 0;
    return objc_msgSend(*(id *)(v1 + 96), "unlock", v3);
  }
  return result;
}

- (uint64_t)releaseUpdatedObjects
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 96) lock];
    uint64_t v2 = *(void *)(v1 + 24);
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 40);
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 72);
    if (v4)
    {
      uint64_t v5 = [*(id *)(v4 + 40) objectForKey:v3];
      uint64_t v6 = v5;
      if (v5)
      {
        objc_super v7 = *(void **)(v5 + 96);
        if (v7)
        {

          *(void *)(v6 + 96) = [0 mutableCopy];
        }
      }
    }
    *(unsigned char *)(v1 + 92) = 0;
    return objc_msgSend(*(id *)(v1 + 96), "unlock", v3);
  }
  return result;
}

- (uint64_t)releaseDeletedObjects
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 96) lock];
    uint64_t v2 = *(void *)(v1 + 24);
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 40);
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 72);
    if (v4)
    {
      uint64_t v5 = [*(id *)(v4 + 40) objectForKey:v3];
      uint64_t v6 = v5;
      if (v5)
      {
        objc_super v7 = *(void **)(v5 + 104);
        if (v7)
        {

          *(void *)(v6 + 104) = [0 mutableCopy];
        }
      }
    }
    *(unsigned char *)(v1 + 93) = 0;
    return objc_msgSend(*(id *)(v1 + 96), "unlock", v3);
  }
  return result;
}

- (BOOL)releaseContents:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 96) lock];

    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 94) = 0;
    -[PFUbiquityTransactionLog releaseInsertedObjects](a1);
    -[PFUbiquityTransactionLog releaseUpdatedObjects](a1);
    -[PFUbiquityTransactionLog releaseDeletedObjects](a1);
    [*(id *)(a1 + 96) unlock];
  }
  return a1 != 0;
}

- (uint64_t)loadContents:(uint64_t)a1
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 96) lock];
  if (*(unsigned char *)(a1 + 94))
  {
    [*(id *)(a1 + 96) unlock];
    return 1;
  }
  if (*(unsigned char *)(a1 + 58))
  {
    uint64_t v5 = 24;
LABEL_10:
    uint64_t v6 = *(void *)(a1 + v5);
    goto LABEL_11;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = 32;
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v5 = 40;
    goto LABEL_10;
  }
  uint64_t v6 = 0;
LABEL_11:
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v85 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v99 = __Block_byref_object_copy__53;
  v100 = __Block_byref_object_dispose__53;
  uint64_t v101 = 0;
  self;
  int v8 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, v6, *(void *)(a1 + 80));
  v9 = v8;
  if (!v8)
  {

    *(void *)(*(void *)&buf[8] + 40) = 0;
    uint64_t v24 = [NSString stringWithFormat:@"Setup assistant was torn down.  Error reading the log file at location: %@", v6];
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquityTransactionLog loadPlistAtLocation:withError:]", 561, v24);
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v24 forKey:@"reason"];
    v15 = (void *)[v25 errorWithDomain:*MEMORY[0x1E4F281F8] code:134302 userInfo:v26];
    if (v15) {
      goto LABEL_24;
    }
    uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    v34 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)v89 = 136315394;
    *(void *)&v89[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs"
                         "/PFUbiquityTransactionLog.m";
    *(_WORD *)&v89[12] = 1024;
    *(_DWORD *)&v89[14] = 563;
    v83 = v89;
    goto LABEL_63;
  }
  *(void *)v94 = 0;
  *(void *)&v94[8] = v94;
  *(void *)&v94[16] = 0x3052000000;
  v95 = __Block_byref_object_copy__53;
  v96 = __Block_byref_object_dispose__53;
  uint64_t v97 = 0;
  int v10 = *(unsigned __int8 *)(a1 + 88);
  *(void *)v89 = MEMORY[0x1E4F143A8];
  *(void *)&v89[8] = 3221225472;
  *(void *)&v89[16] = __58__PFUbiquityTransactionLog_loadPlistAtLocation_withError___block_invoke;
  v90 = &unk_1E544F628;
  uint64_t v91 = v6;
  v92 = v94;
  v93 = buf;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v8, v6, 1, v10, &v85, (uint64_t)v89);

  uint64_t v11 = *(void *)(*(void *)&v94[8] + 40);
  if (v11)
  {
    v12 = NSString;
    uint64_t v13 = [*(id *)(*(void *)&v94[8] + 40) userInfo];
    uint64_t v14 = [v12 stringWithFormat:@"Error encountered trying to read data inside coordinated accessor: %@\nuserInfo: %@, local error: %@\nuserInfo: %@", v11, v13, v85, objc_msgSend(v85, "userInfo")];
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquityTransactionLog loadPlistAtLocation:withError:]", 605, v14);
    }

    *(void *)(*(void *)&buf[8] + 40) = 0;
    v15 = *(void **)(*(void *)&v94[8] + 40);
    if (!v15)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v86 = 136315394;
        *(void *)&v86[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        __int16 v87 = 1024;
        int v88 = 608;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v86, 0x12u);
      }
    }
    _Block_object_dispose(v94, 8);
    goto LABEL_24;
  }
  _Block_object_dispose(v94, 8);
  uint64_t v37 = *(void *)(*(void *)&buf[8] + 40);
  if (!v37 || v85)
  {
    uint64_t v62 = [NSString stringWithFormat:@"Error reading the log file at location: %@\nuserInfo: %@", v85, objc_msgSend(v85, "userInfo")];
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquityTransactionLog loadPlistAtLocation:withError:]", 615, v62);
    }
    v63 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v62 forKey:@"reason"];
    v15 = (void *)[v63 errorWithDomain:*MEMORY[0x1E4F281F8] code:134302 userInfo:v64];
    if (!v15)
    {
      uint64_t v65 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v65, v66, v67, v68, v69, v70, v71, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v72 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v94 = 136315394;
        *(void *)&v94[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        *(_WORD *)&v94[12] = 1024;
        *(_DWORD *)&v94[14] = 617;
        _os_log_fault_impl(&dword_18AB82000, v72, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v94, 0x12u);
      }
    }

    v35 = 0;
    *(void *)(*(void *)&buf[8] + 40) = 0;
    goto LABEL_25;
  }
  id v38 = (id)-[_PFZipFileArchive contentsForEntryName:](v37, @"contents");
  *(void *)v86 = 0;
  uint64_t v84 = 0;
  if (v38)
  {
    v35 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v38 options:0 format:&v84 error:v86];
    if (*(void *)v86)
    {
      uint64_t v39 = [NSString stringWithFormat:@"Error during property list parsing during import or opening of log file at location: %@, error: %@", v6, *(void *)v86];
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v39 forKey:@"reason"];
      v15 = (void *)[v40 errorWithDomain:*MEMORY[0x1E4F281F8] code:134302 userInfo:v41];
      if (!v15)
      {
        uint64_t v42 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
        v49 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v94 = 136315394;
          *(void *)&v94[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transactio"
                               "n Logs/PFUbiquityTransactionLog.m";
          *(_WORD *)&v94[12] = 1024;
          *(_DWORD *)&v94[14] = 632;
          _os_log_fault_impl(&dword_18AB82000, v49, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v94, 0x12u);
        }
      }
      *(void *)v86 = 0;
    }
    else
    {
      v15 = 0;
    }

    *(void *)(*(void *)&buf[8] + 40) = 0;
    goto LABEL_25;
  }
  uint64_t v73 = [NSString stringWithFormat:@"Error getting data during property list parsing during import or opening of log file at location: %@", v6];
  v74 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v73 forKey:@"reason"];
  v15 = (void *)[v74 errorWithDomain:*MEMORY[0x1E4F281F8] code:134302 userInfo:v75];
  if (!v15)
  {
    uint64_t v76 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v76, v77, v78, v79, v80, v81, v82, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    v34 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
LABEL_23:
      v15 = 0;
      goto LABEL_24;
    }
    *(_DWORD *)v94 = 136315394;
    *(void *)&v94[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs"
                         "/PFUbiquityTransactionLog.m";
    *(_WORD *)&v94[12] = 1024;
    *(_DWORD *)&v94[14] = 637;
    v83 = v94;
LABEL_63:
    _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v83, 0x12u);
    goto LABEL_23;
  }
LABEL_24:
  v35 = 0;
LABEL_25:
  _Block_object_dispose(buf, 8);
  uint64_t v4 = 1;
  uint64_t v36 = [v35 mutableCopy];
  *(void *)(a1 + 8) = v36;
  if (!v36)
  {
    if (!v15) {
      v15 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134327 userInfo:0];
    }
    uint64_t v4 = 0;
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered while trying to load the comparison metadata for transaction log: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityTransactionLog loadContents:]", 345, a1, v15, [v15 userInfo]);
    }
  }
  *(unsigned char *)(a1 + 94) = v4;
  [*(id *)(a1 + 96) unlock];
  if (v15) {
    char v50 = v4;
  }
  else {
    char v50 = 1;
  }
  if ((v50 & 1) == 0) {
    id v51 = v15;
  }
  [v7 drain];
  if ((v4 & 1) == 0)
  {
    id v52 = v15;
    if (v15)
    {
      if (a2) {
        *a2 = v15;
      }
    }
    else
    {
      uint64_t v53 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v53, v54, v55, v56, v57, v58, v59, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v60 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 371;
        _os_log_fault_impl(&dword_18AB82000, v60, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v4;
}

- (uint64_t)loadComparisonMetadataWithError:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 89)) {
    return 1;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v29 = 0;
  if (-[PFUbiquityTransactionLog loadContents:](a1, &v29))
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 8) objectForKey:@"peerStates"];
    id v7 = (void *)[*(id *)(a1 + 8) objectForKey:@"peerIDs"];
    int v8 = (char *)[*(id *)(a1 + 8) objectForKey:@"transactionNumber"];
    v9 = (void *)[*(id *)(a1 + 8) objectForKey:@"transactionDate"];
    if (!v9
      && +[PFUbiquityLogging canLogMessageAtLevel:2])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMissing transaction date from contents: %@", "-[PFUbiquityTransactionLog loadComparisonMetadataWithError:]", 398, a1, *(void *)(a1 + 8));
    }
    id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v9 doubleValue];
    v12 = objc_msgSend(v10, "initWithTimeIntervalSince1970:");
    uint64_t v13 = *(void **)(a1 + 72);
    if (v13) {
      objc_setProperty_nonatomic(v13, v11, v12, 8);
    }

    uint64_t v14 = *(void *)(a1 + 24);
    if (v14) {
      uint64_t v15 = *(void *)(v14 + 40);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = *(void *)(a1 + 72);
    if (v16) {
      uint64_t v17 = (PFUbiquityKnowledgeVector *)[*(id *)(v16 + 40) objectForKey:v15];
    }
    else {
      uint64_t v17 = 0;
    }
    -[PFUbiquityStoreSaveSnapshot setTransactionNumber:peerStates:andPeerIDs:]((id *)&v17->super.isa, v8, v6, v7);
    *(void *)(a1 + 64) = -[PFUbiquityStoreSaveSnapshot createKnowledgeVectorFromPeerStates](v17);
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (v29) {
    id v18 = v29;
  }
  [v5 drain];
  if (v3)
  {
    *(unsigned char *)(a1 + 89) = 1;
  }
  else
  {
    id v19 = v29;
    if (v29)
    {
      if (a2) {
        *a2 = v29;
      }
    }
    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      uint64_t v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquity"
              "TransactionLog.m";
        __int16 v32 = 1024;
        int v33 = 429;
        _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v3;
}

- (uint64_t)loadImportMetadataWithError:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 90)) {
    return 1;
  }
  id v25 = 0;
  uint64_t v3 = -[PFUbiquityTransactionLog loadComparisonMetadataWithError:](a1, &v25);
  if (v3)
  {
    id v5 = (void *)[*(id *)(a1 + 8) objectForKey:@"entityNames"];
    uint64_t v6 = (void *)[*(id *)(a1 + 8) objectForKey:@"compressedGlobalIDs"];
    uint64_t v7 = [*(id *)(a1 + 8) objectForKey:@"primaryKeys"];
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 24);
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 40);
      if (v8) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v10 = 0;
      if (v8)
      {
LABEL_7:
        uint64_t v11 = (void *)[*(id *)(v8 + 40) objectForKey:v10];
        uint64_t v9 = *(void *)(a1 + 24);
        if (v9)
        {
LABEL_8:
          uint64_t v12 = *(void *)(v9 + 40);
          goto LABEL_9;
        }
LABEL_22:
        uint64_t v12 = 0;
LABEL_9:
        -[PFUbiquityStoreSaveSnapshot setEntityNames:globalObjectIDs:primaryKeys:forStoreName:withRootLocation:]((uint64_t)v11, v5, v6, v7, v12);
        uint64_t v14 = *(void *)(a1 + 24);
        if (v14)
        {
          uint64_t v15 = *(void **)(v14 + 32);
          if (!v11)
          {
LABEL_12:
            *(unsigned char *)(a1 + 90) = 1;
            return v3;
          }
        }
        else
        {
          uint64_t v15 = 0;
          if (!v11) {
            goto LABEL_12;
          }
        }
        objc_setProperty_nonatomic(v11, v13, v15, 128);
        goto LABEL_12;
      }
    }
    uint64_t v11 = 0;
    if (v9) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
  if (v25)
  {
    if (a2) {
      *a2 = v25;
    }
  }
  else
  {
    uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    uint64_t v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m";
      __int16 v28 = 1024;
      int v29 = 445;
      _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return v3;
}

- (uint64_t)loadInsertedObjectsDataWithError:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 91)) {
      return 1;
    }
    result = -[PFUbiquityTransactionLog loadContents:](result, a2);
    if (result)
    {
      uint64_t v3 = (void *)[*(id *)(v2 + 8) objectForKey:@"inserted"];
      uint64_t v4 = *(void *)(v2 + 72);
      uint64_t v5 = *(void *)(v2 + 24);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 40);
        if (v4) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (v4)
        {
LABEL_7:
          uint64_t v7 = [*(id *)(v4 + 40) objectForKey:v6];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void **)(v7 + 88);
            if (v9 != v3)
            {

              *(void *)(v8 + 88) = [v3 mutableCopy];
            }
          }
        }
      }
      result = 1;
      *(unsigned char *)(v2 + 91) = 1;
    }
  }
  return result;
}

- (uint64_t)loadUpdatedObjectsDataWithError:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 92)) {
      return 1;
    }
    result = -[PFUbiquityTransactionLog loadContents:](result, a2);
    if (result)
    {
      uint64_t v3 = (void *)[*(id *)(v2 + 8) objectForKey:@"updated"];
      uint64_t v4 = *(void *)(v2 + 72);
      uint64_t v5 = *(void *)(v2 + 24);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 40);
        if (v4) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (v4)
        {
LABEL_7:
          uint64_t v7 = [*(id *)(v4 + 40) objectForKey:v6];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void **)(v7 + 96);
            if (v9 != v3)
            {

              *(void *)(v8 + 96) = [v3 mutableCopy];
            }
          }
        }
      }
      result = 1;
      *(unsigned char *)(v2 + 92) = 1;
    }
  }
  return result;
}

- (uint64_t)loadDeletedObjectsDataWithError:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 93)) {
      return 1;
    }
    result = -[PFUbiquityTransactionLog loadContents:](result, a2);
    if (result)
    {
      uint64_t v3 = (void *)[*(id *)(v2 + 8) objectForKey:@"deleted"];
      uint64_t v4 = *(void *)(v2 + 72);
      uint64_t v5 = *(void *)(v2 + 24);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 40);
        if (v4) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v6 = 0;
        if (v4)
        {
LABEL_7:
          uint64_t v7 = [*(id *)(v4 + 40) objectForKey:v6];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void **)(v7 + 104);
            if (v9 != v3)
            {

              *(void *)(v8 + 104) = [v3 mutableCopy];
            }
          }
        }
      }
      result = 1;
      *(unsigned char *)(v2 + 93) = 1;
    }
  }
  return result;
}

void __58__PFUbiquityTransactionLog_loadPlistAtLocation_withError___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)[a2 path];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3))
  {
    uint64_t v4 = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], v3, 0, *(void *)(a1[5] + 8) + 40);
    uint64_t v5 = a1[6];
LABEL_10:
    *(void *)(*(void *)(v5 + 8) + 40) = v4;
    return;
  }
  uint64_t v6 = (_DWORD *)a1[4];
  if (!v6 || v6[6] != 21)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    if (!v3) {
      uint64_t v3 = (void *)[MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v4 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 4, objc_msgSend(v11, "dictionaryWithObject:forKey:", v3, @"missingFile"));
    uint64_t v5 = a1[5];
    goto LABEL_10;
  }
  self;
  id v15 = (id)[v6 copy];
  [v15 setUbiquityLocationType:22];
  -[PFUbiquityLocation updateHash](v15);
  uint64_t v7 = -[PFUbiquityLocation createFullPath]((uint64_t)v15);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v7))
  {
    id v8 = (id)-[PFUbiquityLocation createFullURL]((uint64_t)v15);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F281F8];
    uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
    if (!v7) {
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CA98] null];
    }
    *(void *)(*(void *)(a1[5] + 8) + 40) = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 4, objc_msgSend(v14, "dictionaryWithObject:forKey:", v7, @"missingFile"));
  }
}

void __57__PFUbiquityTransactionLog_cleanupExternalDataReferences__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a2, &v3) & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Encountered an error attempting to remove external data reference (%@): %@\nuserInfo: %@\n", "-[PFUbiquityTransactionLog cleanupExternalDataReferences]_block_invoke", 674, *(void *)(a1 + 32), v3, [v3 userInfo]);
    }
  }
}

- (BOOL)deleteLogFileWithError:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__53;
  id v25 = __Block_byref_object_dispose__53;
  uint64_t v26 = 0;
  if (*(unsigned char *)(a1 + 58))
  {
    uint64_t v4 = 24;
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = 32;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 57))
    {
      uint64_t v5 = 0;
      goto LABEL_9;
    }
    uint64_t v4 = 40;
  }
  uint64_t v5 = *(void *)(a1 + v4);
LABEL_9:
  uint64_t v6 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, v5, *(void *)(a1 + 80));
  uint64_t v7 = (void *)-[PFUbiquityLocation createFullURL](v5);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __51__PFUbiquityTransactionLog_deleteLogFileWithError___block_invoke;
  v20[3] = &unk_1E544E958;
  v20[4] = &v21;
  [v6 coordinateWritingItemAtURL:v7 options:1 error:v22 + 5 byAccessor:v20];

  uint64_t v8 = v22[5];
  BOOL v9 = v8 == 0;
  if (v8)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error deleting log file: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityTransactionLog deleteLogFileWithError:]", 700, a1, v22[5], [(id)v22[5] userInfo]);
    }
    uint64_t v10 = v22[5];
    if (v10)
    {
      if (a2) {
        *a2 = v10;
      }
    }
    else
    {
      uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      uint64_t v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquity"
              "TransactionLog.m";
        __int16 v29 = 1024;
        int v30 = 701;
        _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v21, 8);
  return v9;
}

uint64_t __51__PFUbiquityTransactionLog_deleteLogFileWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8) + 40;

  return [v4 removeItemAtURL:a2 error:v5];
}

- (BOOL)moveFileToPermanentLocationWithError:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v51 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  int v3 = 1;
  char v50 = 1;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3052000000;
  uint64_t v44 = __Block_byref_object_copy__53;
  uint64_t v45 = __Block_byref_object_dispose__53;
  uint64_t v46 = 0;
  if (*(unsigned char *)(a1 + 58))
  {
    uint64_t v34 = 0;
    v35 = 0;
    uint64_t v4 = 0;
    BOOL v52 = 1;
  }
  else
  {
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v6 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(a1 + 24));
      uint64_t v7 = -[PFUbiquityLocation createFullURL](*(void *)(a1 + 32));
    }
    else
    {
      if (*(unsigned char *)(a1 + 20)) {
        uint64_t v6 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(a1 + 32));
      }
      else {
        uint64_t v6 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(a1 + 24));
      }
      uint64_t v7 = -[PFUbiquityLocation createFullURL](*(void *)(a1 + 40));
    }
    uint64_t v34 = (void *)v7;
    v35 = v6;
    uint64_t v36 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(a1 + 24), *(void *)(a1 + 80));
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3052000000;
    v39[3] = __Block_byref_object_copy__53;
    v39[4] = __Block_byref_object_dispose__53;
    uint64_t v40 = 0;
    uint64_t v40 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [v6 URLByDeletingLastPathComponent];
    char v9 = 0;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = v48;
    while (1)
    {
      *((unsigned char *)v11 + 24) = 0;
      v38[0] = v10;
      v38[1] = 3221225472;
      v38[2] = __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke;
      v38[3] = &unk_1E544F750;
      v38[4] = &v47;
      v38[5] = v39;
      v38[6] = &v41;
      [v36 coordinateWritingItemAtURL:v34 options:2 writingItemAtURL:v6 options:8 error:&v51 byAccessor:v38];
      if ((v9 & 1) != 0 || [v51 code] != 4 && objc_msgSend((id)v42[5], "code") != 4) {
        break;
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke_2;
      v37[3] = &unk_1E544F7C8;
      v37[4] = v39;
      v37[5] = &v47;
      v37[6] = &v41;
      [v36 coordinateWritingItemAtURL:v8 options:8 error:&v51 byAccessor:v37];
      uint64_t v11 = v48;
      if (!*((unsigned char *)v48 + 24)) {
        break;
      }
      id v51 = 0;
      v42[5] = 0;
      char v9 = 1;
    }
    if (*((unsigned char *)v48 + 24))
    {
      *(unsigned char *)(a1 + 57) = 0;
      char v12 = *(unsigned char *)(a1 + 20);
      *(unsigned char *)(a1 + 56) = v12;
      *(unsigned char *)(a1 + 58) = v12 ^ 1;
      uint64_t v13 = *(void *)(a1 + 24);
      self;
      if (v13)
      {
        uint64_t v14 = v13;
        while (*(_DWORD *)(v14 + 24) != 1)
        {
          uint64_t v14 = *(void *)(v14 + 8);
          if (!v14) {
            goto LABEL_21;
          }
        }
        uint64_t v15 = *(void **)(v14 + 16);
      }
      else
      {
LABEL_21:
        uint64_t v15 = 0;
      }
      uint64_t v16 = -[PFUbiquityLocation createRelativePath](v13);
      uint64_t v17 = objc_msgSend((id)objc_msgSend(v16, "stringByDeletingLastPathComponent"), "pathComponents");
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:buf count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v54 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v15 = (void *)[v15 stringByAppendingPathComponent:*(void *)(*((void *)&v53 + 1) + 8 * i)];
            if (utimes((const char *)[v15 fileSystemRepresentation], 0) < 0)
            {
              uint64_t v21 = *__error();
              if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered while updating the modification time for file (%d): %@", "+[PFUbiquityTransactionLog updateModificationTimesForLocation:]", 1347, v21, v15);
              }
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:buf count:16];
        }
        while (v18);
      }

      int v3 = 0;
    }
    else
    {
      id v22 = v51;
      if (!v51)
      {
        id v22 = (id)v42[5];
        if (v22) {
          id v51 = (id)v42[5];
        }
      }
      uint64_t v23 = [NSString stringWithFormat:@"CoreData: Ubiquity: Error writing export log to file: %@\nerror: %@\nuserInfo: %@", v6, v22, objc_msgSend(v22, "userInfo")];
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]", 773, v23);
      }
      if (v51)
      {
        if (a2) {
          *a2 = v51;
        }
      }
      else
      {
        uint64_t v24 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
        uint64_t v31 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiqui"
                "tyTransactionLog.m";
          __int16 v59 = 1024;
          int v60 = 774;
          _os_log_fault_impl(&dword_18AB82000, v31, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      BOOL v52 = *((unsigned char *)v48 + 24) != 0;
      int v3 = 1;
    }
    _Block_object_dispose(v39, 8);
    uint64_t v4 = v36;
  }

  if (v3) {
    BOOL v32 = v52;
  }
  else {
    BOOL v32 = *((unsigned char *)v48 + 24) != 0;
  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v32;
}

uint64_t __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(*(void *)(a1[5] + 8) + 40) moveItemAtURL:a2 toURL:a3 error:*(void *)(a1[6] + 8) + 40];
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke_2(void *a1, void *a2)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 40), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    uint64_t result = [*(id *)(*(void *)(a1[4] + 8) + 40) createDirectoryAtURL:a2 withIntermediateDirectories:1 attributes:0 error:*(void *)(a1[6] + 8) + 40];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  }
  return result;
}

- (BOOL)writeToDiskWithError:(void *)a3 andUpdateFilenameInTransactionEntries:
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  char v107 = 1;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3052000000;
  uint64_t v101 = __Block_byref_object_copy__53;
  uint64_t v102 = __Block_byref_object_dispose__53;
  uint64_t v103 = 0;
  uint64_t v90 = *(void *)(a1 + 40);
  uint64_t v6 = -[PFUbiquityLocation createFullURL](v90);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 24);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 40);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v91 = (void *)v6;
  if (v7) {
    uint64_t v10 = (PFUbiquityKnowledgeVector *)[*(id *)(v7 + 40) objectForKey:v9];
  }
  else {
    uint64_t v10 = 0;
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)(a1 + 8) = v11;
  *(unsigned char *)(a1 + 94) = 1;
  [v11 setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:@"cdVersion"];
  char v12 = *(void **)(a1 + 8);
  if (v10)
  {
    [v12 setObject:v10->_kv forKey:@"entityNames"];
    [*(id *)(a1 + 8) setObject:v10->_storeKVDict forKey:@"peerIDs"];
    Class isa = v10[1].super.isa;
  }
  else
  {
    [v12 setObject:0 forKey:@"entityNames"];
    [*(id *)(a1 + 8) setObject:0 forKey:@"peerIDs"];
    Class isa = 0;
  }
  [*(id *)(a1 + 8) setObject:isa forKey:@"primaryKeys"];
  uint64_t v14 = -[PFUbiquityStoreSaveSnapshot createKnowledgeVectorFromPeerStates](v10);
  id v15 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)v14);
  [*(id *)(a1 + 8) setObject:v15 forKey:@"kvStr"];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v123 = 0u;
  long long v124 = 0u;
  memset(v122, 0, sizeof(v122));
  if (v10) {
    hash = (void *)v10->_hash;
  }
  else {
    hash = 0;
  }
  uint64_t v18 = [hash countByEnumeratingWithState:v122 objects:buf count:16];
  if (v18)
  {
    uint64_t v19 = **(void **)&v122[16];
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (**(void **)&v122[16] != v19) {
          objc_enumerationMutation(hash);
        }
        if (v10)
        {
          Class v22 = v10[2].super.isa;
          kv = v10[2]._kv;
          uint64_t v23 = (void *)v10[1]._hash;
        }
        else
        {
          kv = 0;
          uint64_t v23 = 0;
          Class v22 = 0;
        }
        id v24 = -[PFUbiquityGlobalObjectID createCompressedStringWithEntityNameToIndex:primaryKeyToIndex:peerIDToIndex:](*(void **)(*(void *)&v122[8] + 8 * v20), v23, kv, v22);
        [v16 addObject:v24];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v25 = [hash countByEnumeratingWithState:v122 objects:buf count:16];
      uint64_t v18 = v25;
    }
    while (v25);
  }
  [*(id *)(a1 + 8) setObject:v16 forKey:@"compressedGlobalIDs"];

  uint64_t v26 = *(void **)(a1 + 8);
  if (v10)
  {
    [v26 setObject:v10[2]._hash forKey:@"inserted"];
    [*(id *)(a1 + 8) setObject:v10[3].super.isa forKey:@"updated"];
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v10[3]._kv);
    [*(id *)(a1 + 8) setObject:v10[3]._storeKVDict forKey:@"peerStates"];
    unint64_t v27 = v10[3]._hash;
  }
  else
  {
    [v26 setObject:0 forKey:@"inserted"];
    [*(id *)(a1 + 8) setObject:0 forKey:@"updated"];
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", 0);
    [*(id *)(a1 + 8) setObject:0 forKey:@"peerStates"];
    unint64_t v27 = 0;
  }
  [*(id *)(a1 + 8) setObject:v27 forKey:@"transactionNumber"];
  id v28 = objc_alloc(NSNumber);
  uint64_t v29 = *(void *)(a1 + 72);
  if (v29) {
    uint64_t v30 = *(void **)(v29 + 8);
  }
  else {
    uint64_t v30 = 0;
  }
  [v30 timeIntervalSince1970];
  uint64_t v31 = objc_msgSend(v28, "initWithDouble:");
  [*(id *)(a1 + 8) setObject:v31 forKey:@"transactionDate"];

  uint64_t v32 = *(void *)(a1 + 72);
  if (v32) {
    uint64_t v33 = *(void *)(v32 + 16);
  }
  else {
    uint64_t v33 = 0;
  }
  [*(id *)(a1 + 8) setObject:v33 forKey:@"modelVersionHash"];
  if (v10)
  {
    storeKVDict = v10[4]._storeKVDict;
    if (storeKVDict)
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      uint64_t v37 = [(NSDictionary *)storeKVDict countByEnumeratingWithState:&v109 objects:&v114 count:16];
      v89 = a2;
      if (v37)
      {
        uint64_t v38 = *(void *)v110;
        do
        {
          uint64_t v39 = 0;
          do
          {
            if (*(void *)v110 != v38) {
              objc_enumerationMutation(storeKVDict);
            }
            uint64_t v40 = *(void *)(*((void *)&v109 + 1) + 8 * v39);
            if (v40) {
              uint64_t v41 = *(void *)(v40 + 56);
            }
            else {
              uint64_t v41 = 0;
            }
            [v36 addObject:v41];
            ++v39;
          }
          while (v37 != v39);
          uint64_t v42 = [(NSDictionary *)storeKVDict countByEnumeratingWithState:&v109 objects:&v114 count:16];
          uint64_t v37 = v42;
        }
        while (v42);
      }
      [v35 setObject:v36 forKey:@"inserted"];
      a2 = v89;

      unint64_t v43 = v10[4]._hash;
      if (!v43) {
        goto LABEL_46;
      }
      if (v35)
      {
LABEL_45:
        [v35 setObject:v43 forKey:@"deleted"];
LABEL_46:
        if (v35) {
          [*(id *)(a1 + 8) setObject:v35 forKey:@"externalDataReferencesInfo"];
        }
        goto LABEL_49;
      }
LABEL_44:
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      goto LABEL_45;
    }
    unint64_t v43 = v10[4]._hash;
    if (v43) {
      goto LABEL_44;
    }
  }
  id v35 = 0;
LABEL_49:

  uint64_t v44 = [MEMORY[0x1E4F28F98] dataWithPropertyList:*(void *)(a1 + 8) format:200 options:0 error:v99 + 5];
  if (v44)
  {
    uint64_t v45 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(a1 + 40), *(void *)(a1 + 80));
    uint64_t v114 = 0;
    v115 = &v114;
    uint64_t v116 = 0x2020000000;
    char v117 = 0;
    uint64_t v46 = (void *)v90;
    if (v90)
    {
      uint64_t v47 = *(void *)(v90 + 32);
      if (*(_DWORD *)(v90 + 24) != 1) {
        uint64_t v46 = *(void **)(v90 + 8);
      }
    }
    else
    {
      uint64_t v47 = 0;
    }
    uint64_t v48 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v47, v46);
    uint64_t v49 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v48);

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    v119 = __Block_byref_object_copy__53;
    v120 = __Block_byref_object_dispose__53;
    uint64_t v121 = 0;
    uint64_t v121 = [MEMORY[0x1E4F28CB8] defaultManager];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke;
    v97[3] = &unk_1E544F778;
    v97[4] = a1;
    v97[5] = &v114;
    v97[6] = buf;
    v97[7] = &v104;
    v97[8] = &v98;
    [v45 coordinateWritingItemAtURL:v49 options:0 error:v99 + 5 byAccessor:v97];

    char v50 = v105;
    if (*((unsigned char *)v115 + 24) && *((unsigned char *)v105 + 24))
    {
      *((unsigned char *)v115 + 24) = 0;
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke_2;
      v96[3] = &unk_1E544F7A0;
      v96[6] = &v114;
      v96[7] = buf;
      v96[8] = &v104;
      v96[9] = &v98;
      v96[10] = 1;
      v96[4] = v44;
      v96[5] = a1;
      [v45 coordinateWritingItemAtURL:v91 options:8 error:v99 + 5 byAccessor:v96];
      char v50 = v105;
    }
    if (*((unsigned char *)v50 + 24))
    {
      *(unsigned char *)(a1 + 58) = 0;
      *(_WORD *)(a1 + 56) = 256;
      uint64_t v51 = *(void *)(a1 + 24);
      if (v51) {
        uint64_t v52 = *(void *)(v51 + 40);
      }
      else {
        uint64_t v52 = 0;
      }
      uint64_t v53 = *(void *)(a1 + 72);
      if (v53 && (uint64_t v54 = [*(id *)(v53 + 40) objectForKey:v52]) != 0) {
        long long v55 = *(void **)(v54 + 160);
      }
      else {
        long long v55 = 0;
      }
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      uint64_t v57 = [a3 countByEnumeratingWithState:&v92 objects:v113 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v93;
        do
        {
          uint64_t v59 = 0;
          do
          {
            if (*(void *)v93 != v58) {
              objc_enumerationMutation(a3);
            }
            int v60 = *(void **)(*((void *)&v92 + 1) + 8 * v59);
            uint64_t v61 = *(void **)(a1 + 24);
            if (v60)
            {
              objc_setProperty_nonatomic(*(id *)(*((void *)&v92 + 1) + 8 * v59), v56, v61, 48);
              uint64_t v61 = *(void **)(a1 + 24);
            }
            if (v61) {
              uint64_t v61 = (void *)v61[5];
            }
            uint64_t v62 = *(void *)(a1 + 72);
            if (v62 && (uint64_t v63 = [*(id *)(v62 + 40) objectForKey:v61]) != 0) {
              uint64_t v64 = *(void *)(v63 + 120);
            }
            else {
              uint64_t v64 = 0;
            }
            [v60 setTransactionNumber:v64];
            if (v60) {
              objc_setProperty_nonatomic(v60, v56, v55, 56);
            }
            ++v59;
          }
          while (v57 != v59);
          uint64_t v65 = [a3 countByEnumeratingWithState:&v92 objects:v113 count:16];
          uint64_t v57 = v65;
        }
        while (v65);
      }
      int v66 = 0;
    }
    else
    {
      uint64_t v69 = [NSString stringWithFormat:@"CoreData: Ubiquity: Error writing export log to file (%d:%d): %@\nerror: %@\nuserInfo: %@", *((unsigned __int8 *)v115 + 24), 0, v91, v99[5], objc_msgSend((id)v99[5], "userInfo")];
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]", 904, v69);
      }
      uint64_t v70 = v99[5];
      if (v70)
      {
        if (a2) {
          *a2 = v70;
        }
      }
      else
      {
        uint64_t v79 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
        v86 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v122 = 136315394;
          *(void *)&v122[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transacti"
                                "on Logs/PFUbiquityTransactionLog.m";
          *(_WORD *)&v122[12] = 1024;
          *(_DWORD *)&v122[14] = 905;
          _os_log_fault_impl(&dword_18AB82000, v86, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v122, 0x12u);
        }
      }
      BOOL v108 = *((unsigned char *)v105 + 24) != 0;
      int v66 = 1;
    }
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v114, 8);
  }
  else
  {
    uint64_t v67 = [NSString stringWithFormat:@"CoreData: Ubiquity: Error creating data for export: %@\nuserInfo: %@\n from transaction log: %@", v99[5], objc_msgSend((id)v99[5], "userInfo"), a1];
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]", 828, v67);
    }
    uint64_t v68 = v99[5];
    if (v68)
    {
      if (a2) {
        *a2 = v68;
      }
    }
    else
    {
      uint64_t v71 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v71, v72, v73, v74, v75, v76, v77, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      uint64_t v78 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 829;
        _os_log_fault_impl(&dword_18AB82000, v78, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v45 = 0;
    BOOL v108 = 0;
    int v66 = 1;
  }
  _Block_object_dispose(&v98, 8);

  if (v66) {
    BOOL v87 = v108;
  }
  else {
    BOOL v87 = *((unsigned char *)v105 + 24) != 0;
  }
  _Block_object_dispose(&v104, 8);
  return v87;
}

uint64_t __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t v4 = a1[4];
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 24);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 32);
      uint64_t v7 = *(void *)(v5 + 40);
      uint64_t v8 = *(void *)(v5 + 48);
      if (*(_DWORD *)(v5 + 24) != 1) {
        uint64_t v5 = *(void *)(v5 + 8);
      }
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v9 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v6, v7, v8, (void *)v5);
  uint64_t v10 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v9);
  if ((objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "fileExistsAtPath:", objc_msgSend(v10, "path")) & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(*(void *)(a1[6] + 8) + 40) createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:0];
  }

  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(*(void *)(a1[6] + 8) + 40) createDirectoryAtURL:a2 withIntermediateDirectories:1 attributes:0 error:*(void *)(a1[8] + 8) + 40];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  }
  return result;
}

void __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke_2(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  uint64_t v4 = (void *)[a2 URLByDeletingLastPathComponent];
  if ((objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "fileExistsAtPath:", objc_msgSend(v4, "path")) & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [*(id *)(*(void *)(a1[7] + 8) + 40) createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:*(void *)(a1[9] + 8) + 40];
  }
  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a1[4], @"contents", 0);
    id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"contents", 0);
    uint64_t v6 = (void *)-[_PFZipFileArchive initWithEntryNames:contents:properties:options:]((uint64_t)[_PFZipFileArchive alloc], v8, v5, 0);
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = -[_PFZipFileArchive writeToFile:options:error:]((uint64_t)v6, (void *)[a2 path], a1[10], *(void *)(a1[9] + 8) + 40);
    if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
    {
      uint64_t v7 = a1[5];
      [a2 path];
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v7 != 0;
    }
  }
}

- (uint64_t)rewriteToDiskWithError:(uint64_t)result
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v16 = 0;
    if ((*(unsigned char *)(result + 91)
       || -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:](result, &v16))
      && (*(unsigned char *)(v3 + 92) || -[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:](v3, &v16))
      && (*(unsigned char *)(v3 + 93) || -[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:](v3, &v16)))
    {

      *(void *)(v3 + 8) = 0;
      *(unsigned char *)(v3 + 94) = 0;
      uint64_t v4 = -[PFUbiquityLocation createFullPath](*(void *)(v3 + 24));
      uint64_t v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      if ([v5 fileExistsAtPath:v4]
        && ([v5 removeItemAtPath:v4 error:&v16] & 1) == 0
        && +[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError deleting existing log file: %@", "-[PFUbiquityTransactionLog rewriteToDiskWithError:]", 1003, v3, v16);
      }

      uint64_t v6 = -[PFUbiquityLocation createFullPath](*(void *)(v3 + 32));
      if ([v5 fileExistsAtPath:v6]
        && ([v5 removeItemAtPath:v6 error:&v16] & 1) == 0
        && +[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError deleting existing log file (t): %@", "-[PFUbiquityTransactionLog rewriteToDiskWithError:]", 1011, v3, v16);
      }

      uint64_t v7 = -[PFUbiquityLocation createFullPath](*(void *)(v3 + 40));
      if ([v5 fileExistsAtPath:v7]
        && ([v5 removeItemAtPath:v7 error:&v16] & 1) == 0)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError deleting existing log file (s): %@", "-[PFUbiquityTransactionLog rewriteToDiskWithError:]", 1020, v3, v16);
        }
      }

      if (-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:](v3, &v16, 0)) {
        return 1;
      }
    }
    if (v16)
    {
      if (a2)
      {
        uint64_t result = 0;
        *a2 = v16;
        return result;
      }
    }
    else
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      id v15 = __pflogFaultLog;
      uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m";
      __int16 v19 = 1024;
      int v20 = 1030;
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  return result;
}

+ (void)truncateLogFilesBeforeBaselineMetadata:(void *)a3 withLocalPeerID:(void *)a4 andUbiquityRootLocation:
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  self;
  p_cache = PFUbiquityMetadataFactory.cache;
  if (a2)
  {
    uint64_t v47 = *(void **)(a2 + 8);
    uint64_t v7 = *(void *)(a2 + 40);
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v7 = 0;
  }
  self;
  id v70 = 0;
  self;
  uint64_t v8 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, a3, v47, a4, &v70);
  if (!v8)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Log file truncation failed to get a stack: %@\nuserInfo: %@", "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1088, v70, [v70 userInfo]);
    }
    uint64_t v49 = 0;
    char v50 = 0;
    uint64_t v57 = 0;
    uint64_t v39 = 0;
    goto LABEL_83;
  }
  uint64_t v57 = v8;
  self;
  id v9 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v47, (uint64_t)a3);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = (void *)*((void *)v9 + 11);
    if (v11) {
      uint64_t v11 = (void *)v11[10];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11;

  if (v12 && v12[64]) {
    -[_PFUbiquityRecordsExporter moveLogsFromTempDirectory]((uint64_t)v12);
  }

  uint64_t v44 = [objc_alloc(NSNumber) initWithInt:0];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  if (v7)
  {
    obuint64_t j = (id)[*(id *)(v7 + 8) allKeys];
    uint64_t v13 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
  }
  else
  {
    obuint64_t j = 0;
    uint64_t v13 = [0 countByEnumeratingWithState:&v66 objects:v78 count:16];
  }
  if (!v13)
  {
    uint64_t v49 = 0;
    char v50 = 0;
    goto LABEL_82;
  }
  uint64_t v41 = v13;
  uint64_t v42 = v7;
  uint64_t v43 = *(void *)v67;
  uint64_t v46 = *MEMORY[0x1E4F281F8];
  uint64_t v51 = a3;
LABEL_14:
  uint64_t v48 = 0;
  while (1)
  {
    if (*(void *)v67 != v43) {
      objc_enumerationMutation(obj);
    }
    uint64_t v14 = *(void **)(*((void *)&v66 + 1) + 8 * v48);
    id v15 = +[PFUbiquityLocation createPeerStoreLocationForPeerID:andStoreName:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)v14, (uint64_t)v47, a4);
    uint64_t v49 = -[PFUbiquityLocation createFullPath]((uint64_t)v15);
    char v50 = v15;
    if (v42) {
      uint64_t v16 = [*(id *)(v42 + 8) objectForKey:v14];
    }
    else {
      uint64_t v16 = 0;
    }
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = v44;
    }
    uint64_t v52 = v17;
    uint64_t v18 = (void *)+[PFUbiquityTransactionEntry transactionEntriesForPeerID:beforeTransacationNumber:forStoreNamed:inManagedObjectContext:]((uint64_t)PFUbiquityTransactionEntry, v14, v17, v47, v8[1]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v77 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v63 != v20) {
            objc_enumerationMutation(v18);
          }
          [v57[1] deleteObject:*(void *)(*((void *)&v62 + 1) + 8 * i)];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v77 count:16];
      }
      while (v19);
    }
    uint64_t v8 = v57;
    if ([v57[1] save:&v70])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Successfully deleted transaction entries before %@ for peer %@", "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1120, v52, v14);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error deleting transaction entries before %@ for peer %@\nError: %@\nuserInfo: %@", "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1122, v52, v14, v70, [v70 userInfo]);
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v49) & 1) == 0)
    {

      Class v22 = 0;
      uint64_t v23 = 0;
      goto LABEL_67;
    }
    id v53 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v50, (uint64_t)&v70);
    if (!v70)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v24 = [v53 countByEnumeratingWithState:&v58 objects:v76 count:16];
      if (v24)
      {
        uint64_t v54 = *(void *)v59;
        do
        {
          uint64_t v25 = 0;
          uint64_t v55 = v24;
          do
          {
            if (*(void *)v59 != v54) {
              objc_enumerationMutation(v53);
            }
            uint64_t v56 = v25;
            uint64_t v26 = *(void *)(*((void *)&v58 + 1) + 8 * v25);
            if (v26 && *(_DWORD *)(v26 + 24) == 22)
            {
              uint64_t v27 = [objc_alloc((Class)(p_cache + 328)) initWithTransactionLogLocation:v26 andLocalPeerID:a3];
              -[PFUbiquityTransactionLog loadComparisonMetadataWithError:](v27, &v70);
              if (!v70
                && [-[PFUbiquityTransactionLog transactionNumber]((void *)v27) compare:v52] == -1)
              {
                if (v27)
                {
                  id v28 = (void *)[*(id *)(v27 + 8) objectForKey:@"externalDataReferencesInfo"];
                  if (v28)
                  {
                    uint64_t v29 = (void *)[v28 objectForKey:@"deleted"];
                    long long v74 = 0u;
                    long long v75 = 0u;
                    long long v72 = 0u;
                    long long v73 = 0u;
                    uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v79 count:16];
                    if (v30)
                    {
                      uint64_t v31 = *(void *)v73;
                      do
                      {
                        for (uint64_t j = 0; j != v30; ++j)
                        {
                          if (*(void *)v73 != v31) {
                            objc_enumerationMutation(v29);
                          }
                          uint64_t v33 = *(void *)(*((void *)&v72 + 1) + 8 * j);
                          uint64_t v34 = +[PFUbiquityLocation createUbiquityExternalDataReferenceFileLocationForUUID:andLog:]((uint64_t)PFUbiquityLocation, v33, v27);
                          id v35 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquitousExternalDataReferenceLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v34);
                          id v36 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v34);

                          v71[0] = MEMORY[0x1E4F143A8];
                          v71[1] = 3221225472;
                          v71[2] = __57__PFUbiquityTransactionLog_cleanupExternalDataReferences__block_invoke;
                          v71[3] = &unk_1E544F728;
                          v71[4] = v33;
                          [v35 coordinateWritingItemAtURL:v36 options:1 error:0 byAccessor:v71];
                        }
                        uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v79 count:16];
                      }
                      while (v30);
                    }
                  }
                }
                uint64_t v8 = v57;
                -[PFUbiquityTransactionLog deleteLogFileWithError:](v27, &v70);
                a3 = v51;
                p_cache = (void **)(PFUbiquityMetadataFactory + 16);
                if (v70
                  && ([v70 code] != 4
                   || (objc_msgSend((id)objc_msgSend(v70, "domain"), "isEqual:", v46) & 1) == 0)
                  && +[PFUbiquityLogging canLogMessageAtLevel:0])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered attempting to delete an old log file after the baseline rolled: %@\nuserInfo: %@", "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1161, v70, [v70 userInfo]);
                }
              }
            }
            uint64_t v25 = v56 + 1;
          }
          while (v56 + 1 != v55);
          uint64_t v37 = [v53 countByEnumeratingWithState:&v58 objects:v76 count:16];
          uint64_t v24 = v37;
        }
        while (v37);
      }

      Class v22 = 0;
      uint64_t v23 = 0;
      goto LABEL_67;
    }
    if ([v70 code] != 4) {
      break;
    }
    uint64_t v23 = v49;
    Class v22 = v50;
LABEL_67:
    if (++v48 == v41)
    {
      uint64_t v38 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
      uint64_t v41 = v38;
      if (!v38)
      {
        uint64_t v49 = v23;
        char v50 = v22;
        goto LABEL_82;
      }
      goto LABEL_14;
    }
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error trying to inspect log files after baseline roll at location: %@\nError: %@\nuserInfo: %@", "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1138, v50, v70, [v70 userInfo]);
  }
LABEL_82:
  uint64_t v39 = (void *)v44;
LABEL_83:
}

+ (uint64_t)pruneTemporaryLogDirectoryForPeerRootLocation:(void *)a3 error:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = self;
  uint64_t v32 = 0;
  id v5 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, a2, (uint64_t)&v32);
  uint64_t v6 = v5;
  if (v5)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (!v7) {
      goto LABEL_25;
    }
    uint64_t v26 = a3;
    uint64_t v8 = *(void *)v29;
    char v9 = 1;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        if (v11 && *(_DWORD *)(v11 + 24) == 21)
        {
          uint64_t v12 = [PFUbiquityTransactionLog alloc];
          if (a2) {
            uint64_t v13 = *(void *)(a2 + 32);
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v14 = [(PFUbiquityTransactionLog *)v12 initWithTransactionLogLocation:v11 andLocalPeerID:v13];
          if (!-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v14, &v32))
          {
            char v9 = 0;
            if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError moving transaction log from temporary location: %@ to permanent location:\n%@\n", "+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]", 1202, v27, v11, v14);
            }
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
      uint64_t v7 = v15;
    }
    while (v15);
    if (v9)
    {
LABEL_25:
      uint64_t v16 = 1;
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v26 = a3;
  }
  if (!v32)
  {
    uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    uint64_t v24 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m";
      __int16 v35 = 1024;
      int v36 = 1211;
      _os_log_fault_impl(&dword_18AB82000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  if (!v26)
  {
LABEL_28:
    uint64_t v16 = 0;
    goto LABEL_29;
  }
  uint64_t v16 = 0;
  *uint64_t v26 = v32;
LABEL_29:

  return v16;
}

@end