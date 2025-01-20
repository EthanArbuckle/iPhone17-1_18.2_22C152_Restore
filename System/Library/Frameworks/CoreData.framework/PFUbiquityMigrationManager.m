@interface PFUbiquityMigrationManager
- (PFUbiquityMigrationManager)initWithDestinationModel:(id)a3 sourceModel:(id)a4 ubiquityRootLocation:(id)a5 localPeerID:(id)a6;
- (PFUbiquityMigrationManager)initWithDestinationModel:(id)a3 storeName:(id)a4 previousModelVersionHash:(id)a5 ubiquityRootLocation:(id)a6 localPeerID:(id)a7;
- (uint64_t)migrateTransactionLogs:(uint64_t)a3 andBaselineIfNecessaryForStoreName:(uint64_t)a4 peerID:(void *)a5 error:;
- (void)dealloc;
@end

@implementation PFUbiquityMigrationManager

- (PFUbiquityMigrationManager)initWithDestinationModel:(id)a3 storeName:(id)a4 previousModelVersionHash:(id)a5 ubiquityRootLocation:(id)a6 localPeerID:(id)a7
{
  v11 = +[PFUbiquityBaseline createModelFromBaselineModelWithModelVersionHash:peerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityBaseline, (uint64_t)a5, (uint64_t)a7, (uint64_t)a4, a6);
  v12 = [(PFUbiquityMigrationManager *)self initWithDestinationModel:a3 sourceModel:v11 ubiquityRootLocation:a6 localPeerID:a7];

  return v12;
}

- (PFUbiquityMigrationManager)initWithDestinationModel:(id)a3 sourceModel:(id)a4 ubiquityRootLocation:(id)a5 localPeerID:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)PFUbiquityMigrationManager;
  v10 = [(PFUbiquityMigrationManager *)&v13 init];
  if (v10)
  {
    v11 = (NSManagedObjectModel *)a4;
    v10->_sourceModel = v11;
    if (v11)
    {
      v10->_rootLocation = (PFUbiquityLocation *)a5;
      v10->_destinationModel = (NSManagedObjectModel *)a3;
      v10->_localPeerID = (NSString *)a6;
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  self->_rootLocation = 0;
  self->_destinationModel = 0;

  self->_sourceModel = 0;
  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMigrationManager;
  [(PFUbiquityMigrationManager *)&v3 dealloc];
}

- (uint64_t)migrateTransactionLogs:(uint64_t)a3 andBaselineIfNecessaryForStoreName:(uint64_t)a4 peerID:(void *)a5 error:
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v60 = 0;
    return v60 & 1;
  }
  id v85 = 0;
  v10 = (void *)a1[1];
  v9 = (void *)a1[2];
  v11 = (void *)a1[3];
  v84 = +[NSMappingModel inferredMappingModelForSourceModel:v9 destinationModel:v10 error:&v85];
  if (!v84)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError: %@", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 78, @"Failed to migrate ubiquitous content, unable to create mapping model", v85);
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    if (v85) {
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjectsAndKeys:@"Failed to migrate ubiquitous content, unable to create mapping model", @"reason", v85, *MEMORY[0x1E4F28A50], 0];
    }
    else {
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjectsAndKeys:@"Failed to migrate ubiquitous content, unable to create mapping model", @"reason", 0];
    }
    v35 = (void *)[v16 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v17];
    id v85 = v35;
    if (v35) {
      goto LABEL_43;
    }
    uint64_t v36 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
    v43 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136315394;
    v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
    __int16 v91 = 1024;
    int v92 = 84;
    goto LABEL_80;
  }
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Migrating transaction logs", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 89);
    }
    v12 = [[PFUbiquityTransactionLogMigrator alloc] initWithSourceModel:v9 destinationModel:v10 mappingModel:v84 localPeerID:a1[4]];
    BOOL v13 = -[PFUbiquityTransactionLogMigrator migrateTransactionLogsForStoreName:andLocalPeerID:atUbiquityRootLocation:error:]((uint64_t)v12, a3, a4, v11, &v85);

    if (!v13)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError: %@", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 97, @"Failed to migrate ubiquitous content, unable to migrate transaction logs", v85);
      }
      v14 = (void *)MEMORY[0x1E4F28C58];
      if (v85) {
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjectsAndKeys:@"Failed to migrate ubiquitous content, unable to migrate transaction logs", @"reason", v85, *MEMORY[0x1E4F28A50], 0];
      }
      else {
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjectsAndKeys:@"Failed to migrate ubiquitous content, unable to migrate transaction logs", @"reason", 0];
      }
      v35 = (void *)[v14 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v15];
      id v85 = v35;
      if (v35)
      {
LABEL_43:
        if (a5) {
          *a5 = v35;
        }
        goto LABEL_46;
      }
      uint64_t v44 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
      v43 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_46:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v83 = 0;
LABEL_47:
        int v23 = 0;
        char v86 = 0;
        goto LABEL_53;
      }
      *(_DWORD *)buf = 136315394;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
      __int16 v91 = 1024;
      int v92 = 103;
LABEL_80:
      _os_log_fault_impl(&dword_18AB82000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_46;
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Migrating baseline (if necessary)", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 107);
  }
  uint64_t v18 = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v9);
  v19 = (void *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v10);
  v20 = (void *)v18;
  v83 = [[PFUbiquityBaseline alloc] initWithLocalPeerID:a1[4] ubiquityRootLocation:v11 forStoreWithName:a3 andManagedObjectModel:v10];
  v21 = v19;
  if (-[PFUbiquitySafeSaveFile existsInCloud](v83))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Baseline exists in the cloud, the current baseline cache will be created if it is needed.", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 179);
    }
    v22 = 0;
    goto LABEL_21;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Missing baseline archive for the migration destination data model, need to migrate baseline archive from the source version", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 117);
  }
  v22 = [[PFUbiquityBaseline alloc] initWithLocalPeerID:a1[4] ubiquityRootLocation:v11 forStoreWithName:a3 andManagedObjectModel:v9];
  int v24 = -[PFUbiquitySafeSaveFile existsInCloud](v22);
  if (!v24)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to initialize src data model baseline: %@", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 173, v85);
    }
    if (v85)
    {
      if (a5) {
        *a5 = v85;
      }
    }
    else
    {
      uint64_t v51 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v51, v52, v53, v54, v55, v56, v57, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
      v58 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
        __int16 v91 = 1024;
        int v92 = 174;
        _os_log_fault_impl(&dword_18AB82000, v58, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    goto LABEL_52;
  }
  if (!v22
    || ![(PFUbiquityBaseline *)v22 loadFileFromLocation:v22->super._currentLocation error:&v85])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Missing baseline archive for the migration src data model, let the standard ubiquity awake/launch logic start a new baseline", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 170);
    }
LABEL_52:
    int v23 = 0;
    char v86 = v24 ^ 1;
    goto LABEL_53;
  }
  -[PFUbiquityBaselineMetadata _migrateToModelVersionHash:]((id *)&v22->_metadata->super.isa, v19);
  v25 = (void *)[(NSMutableDictionary *)v22->_storeFilenameToData objectForKey:v22->_storeFilename];
  v26 = [(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"ubbaselinestoreXXXXXX"];
  v27 = (char *)malloc_type_malloc([(NSString *)v26 length], 0x100004077774924uLL);
  strlcpy(v27, [(NSString *)v26 fileSystemRepresentation], [(NSString *)v26 length]);
  if (!mkdtemp(v27))
  {
    id v85 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 512, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to create temp directory for migrating source baseline", @"reason", objc_msgSend(NSNumber, "numberWithInt:", *__error()), @"errno", 0));
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to migrate baseline: %@", "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", 132, v85);
    }
    if (v85)
    {
      v62 = v27;
      if (a5) {
        *a5 = v85;
      }
    }
    else
    {
      v62 = v27;
      uint64_t v65 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v65, v66, v67, v68, v69, v70, v71, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
      v72 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
        __int16 v91 = 1024;
        int v92 = 133;
        _os_log_fault_impl(&dword_18AB82000, v72, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    free(v62);
    goto LABEL_47;
  }
  v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4));
  uint64_t v29 = [v28 URLByAppendingPathComponent:@"src_baseline.store"];
  uint64_t v30 = [v28 URLByAppendingPathComponent:@"dst_baseline.store"];
  [v25 writeToURL:v29 atomically:0];
  v31 = [[NSMigrationManager alloc] initWithSourceModel:v9 destinationModel:v10];
  uint64_t v87 = 0x1ED796880;
  v88 = &unk_1ED7E2C80;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
  BOOL v33 = [(NSMigrationManager *)v31 migrateStoreFromURL:v29 type:@"SQLite" options:v32 withMappingModel:v84 toDestinationURL:v30 destinationType:@"SQLite" destinationOptions:v32 error:&v85];

  if (v33)
  {
    if (-[PFUbiquityBaseline gatherContentsFromMigratedBaseline:withStoreFileURL:error:]((uint64_t)v83, v22, v30, &v85))
    {
      if (-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v83, 0, 1, &v85))
      {
        int v34 = -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v83, &v85);
        goto LABEL_71;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        uint64_t v63 = 157;
        v64 = @"%s(%d): CoreData: Ubiquity:  Error writing out migrated baseline: %@\nError: %@";
        goto LABEL_69;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      uint64_t v63 = 160;
      v64 = @"%s(%d): CoreData: Ubiquity:  Error gathering contents for migrated baseline: %@\nError: %@";
LABEL_69:
      int v34 = 0;
      NSLog((NSString *)v64, "-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:]", v63, v83, v85);
      goto LABEL_71;
    }
  }
  int v34 = 0;
LABEL_71:
  v73 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  [v73 removeItemAtPath:objc_msgSend(NSString, "stringWithFormat:", @"%s", v27), 0 error];
  free(v27);
  if (v34)
  {
LABEL_21:
    int v23 = 1;
LABEL_53:
    char v59 = 1;
    goto LABEL_54;
  }
  if (!v85)
  {
    uint64_t v74 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v74, v75, v76, v77, v78, v79, v80, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m");
    v81 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityMigrationManager.m";
      __int16 v91 = 1024;
      int v92 = 166;
      _os_log_fault_impl(&dword_18AB82000, v81, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_77;
  }
  if (!a5)
  {
LABEL_77:
    char v59 = 0;
    goto LABEL_78;
  }
  char v59 = 0;
  *a5 = v85;
LABEL_78:
  int v23 = 1;
LABEL_54:

  char v60 = v86;
  if (v23) {
    char v60 = v59;
  }
  return v60 & 1;
}

@end