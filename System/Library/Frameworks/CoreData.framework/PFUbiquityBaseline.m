@interface PFUbiquityBaseline
+ (NSManagedObjectModel)createModelFromBaselineModelWithModelVersionHash:(uint64_t)a3 peerID:(uint64_t)a4 storeName:(void *)a5 andUbiquityRootLocation:;
+ (uint64_t)checkPeerReceiptsUnderRootLocation:(uint64_t)a3 forAgreementWithLocalPeerID:(uint64_t)a4 storeName:(uint64_t)a5 modelVersionHash:(void *)a6 error:;
+ (uint64_t)metadataFromBaselineArchive:(uint64_t)a1;
+ (uint64_t)metadataFromCurrentBaselineForStoreWithName:(uint64_t)a1 peerID:(uint64_t)a2 modelVersionHash:(uint64_t)a3 andUbiquityRootLocation:(uint64_t)a4 withError:(void *)a5;
+ (uint64_t)removePeerSpecificIdentifiersFromStore:(uint64_t)a3 withLocalPeerID:;
- (BOOL)constructBaselineArchive:(uint64_t)a1;
- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4;
- (BOOL)moveToPermanentLocation:(id *)a3;
- (BOOL)prepareForBaselineRollOfPersistentStore:(uint64_t)a3 andLocalPeerID:(void *)a4 error:;
- (BOOL)replaceLocalPersistentStoreAtURL:(uint64_t)a3 ofType:(uint64_t)a4 withOptions:(void *)a5 usingPersistentStoreCoordinator:(void *)a6 error:;
- (BOOL)updateCurrentStoreIdentifier:(void *)a1 error:(uint64_t)a2;
- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4;
- (NSManagedObjectModel)createManagedObjectModelFromCurrentBaseline;
- (NSPersistentStoreCoordinator)_createPersistentStoreCoordinatorForCurrentBaseline:(id *)a3 error:;
- (PFUbiquityBaseline)init;
- (PFUbiquityBaseline)initWithBaselineLocation:(id)a3 andLocalPeerID:(id)a4;
- (PFUbiquityBaseline)initWithLocalPeerID:(id)a3 ubiquityRootLocation:(id)a4 forStoreWithName:(id)a5 andManagedObjectModel:(id)a6;
- (id)createManagedObjectModel;
- (id)description;
- (uint64_t)canReplaceStoreAtKnowledgeVector:(void *)a1;
- (uint64_t)clearOutStagingLocationWithError:(uint64_t)a1;
- (uint64_t)gatherContentsAndConstructArchiveWithError:(uint64_t)result;
- (uint64_t)gatherContentsFromMigratedBaseline:(uint64_t)a3 withStoreFileURL:(void *)a4 error:;
- (uint64_t)importBaselineForStoreAtURL:(uint64_t)a3 ofType:(uint64_t)a4 options:(uint64_t)a5 withLocalPeerID:(uint64_t)a6 stack:(void *)a7 andPersistentStoreCoordinator:(void *)a8 error:;
- (uint64_t)isUploaded:(uint64_t)a1;
- (uint64_t)makeCurrentBaselineWithError:(uint64_t)a1;
- (uint64_t)metadataMatchesCurrentMetadata:(void *)a1;
- (uint64_t)removeUnusedExternalDataReferences:(uint64_t)a1;
- (void)dealloc;
@end

@implementation PFUbiquityBaseline

- (PFUbiquityBaseline)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityBaseline;
  v2 = [(PFUbiquitySafeSaveFile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_baselineStagingLocation = 0;
    v2->_metadata = 0;
    v2->_storeFilenameToData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_storeFilename = 0;
    v3->_storeName = 0;
    v3->_modelVersionHash = 0;
    v3->_model = 0;
    v3->_baselineArchive = 0;
    v3->_store = 0;
  }
  return v3;
}

- (PFUbiquityBaseline)initWithLocalPeerID:(id)a3 ubiquityRootLocation:(id)a4 forStoreWithName:(id)a5 andManagedObjectModel:(id)a6
{
  v11 = (NSString *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, a6);
  v12 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, (uint64_t)a5, (uint64_t)v11, a4);
  v13 = +[PFUbiquityLocation createPeerBaselineFileSafeSaveLocationForLocalPeerID:andBaselineFileLocation:]((uint64_t)PFUbiquityLocation, a3, v12);
  v14 = [(PFUbiquitySafeSaveFile *)self initWithPermanentLocation:v12 safeSaveLocation:v13 andLocalPeerID:a3];

  if (v14)
  {
    v14->_model = (NSManagedObjectModel *)a6;
    v14->_modelVersionHash = v11;
    uint64_t v15 = [a5 copy];
    v14->_storeName = (NSString *)v15;
    v14->_baselineStagingLocation = (PFUbiquityLocation *)+[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 30, v15, (uint64_t)v14->_modelVersionHash, 0, a4);
    v14->_baselineArchive = 0;
  }
  else
  {
  }
  return v14;
}

- (PFUbiquityBaseline)initWithBaselineLocation:(id)a3 andLocalPeerID:(id)a4
{
  objc_super v5 = (id *)a3;
  if (!a3)
  {
LABEL_5:
    id v8 = 0;
    id v9 = 0;
    goto LABEL_9;
  }
  int v7 = *((_DWORD *)a3 + 6);
  if (v7 != 40)
  {
    if (v7 == 10)
    {
      id v8 = a3;
      id v9 = +[PFUbiquityLocation createPeerBaselineFileSafeSaveLocationForLocalPeerID:andBaselineFileLocation:]((uint64_t)PFUbiquityLocation, a4, v5);
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  id v9 = a3;
  v10 = v5;
  if (*((_DWORD *)v5 + 6) != 1) {
    v10 = (id *)v5[1];
  }
  id v8 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, (uint64_t)self->_storeName, (uint64_t)self->_modelVersionHash, v10);
LABEL_9:
  v11 = [(PFUbiquitySafeSaveFile *)self initWithPermanentLocation:v5 safeSaveLocation:v9 andLocalPeerID:a4];

  if (v11)
  {
    if (v5)
    {
      p_modelVersionHash = (uint64_t *)&v11->_modelVersionHash;
      v11->_modelVersionHash = (NSString *)v5[6];
      id v13 = v5[5];
    }
    else
    {
      id v13 = 0;
      p_modelVersionHash = (uint64_t *)&v11->_modelVersionHash;
      v11->_modelVersionHash = 0;
    }
    v14 = (NSString *)v13;
    v11->_storeName = v14;
    if (v5 && *((_DWORD *)v5 + 6) != 1) {
      objc_super v5 = (id *)v5[1];
    }
    v11->_baselineStagingLocation = (PFUbiquityLocation *)+[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 30, (uint64_t)v14, *p_modelVersionHash, 0, v5);
  }
  return v11;
}

- (void)dealloc
{
  self->_baselineStagingLocation = 0;
  self->_metadata = 0;

  self->_storeFilename = 0;
  self->_storeFilenameToData = 0;

  self->_storeName = 0;
  self->_modelVersionHash = 0;

  self->_model = 0;
  self->_baselineArchive = 0;

  self->_store = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaseline;
  [(PFUbiquitySafeSaveFile *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PFUbiquityBaseline;
  id v4 = [(PFUbiquitySafeSaveFile *)&v9 description];
  if (self)
  {
    storeName = self->_storeName;
    modelVersionHash = self->_modelVersionHash;
    permanentLocation = self->super._permanentLocation;
  }
  else
  {
    modelVersionHash = 0;
    storeName = 0;
    permanentLocation = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tstoreName: %@\n\tmodelVersionHash: %@\n\tbaselineArchiveLocation: %@\n", v4, storeName, modelVersionHash, permanentLocation];
}

- (uint64_t)clearOutStagingLocationWithError:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  objc_super v5 = -[PFUbiquityLocation createFullPath](*(void *)(a1 + 88));
  if ([v4 fileExistsAtPath:v5])
  {
    if ([v4 removeItemAtPath:v5 error:&v16])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ Successfully removed contents of staging area.", "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 188, a1);
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError while preparing for baseline roll: %@\nuserInfo: %@", "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 190, a1, v16, [v16 userInfo]);
      }
      id v16 = 0;
    }
  }
  uint64_t v6 = [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v16];
  if (v6)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully created staging directory: %@", "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 198, a1, v5);
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to create staging directory path, failing now: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaseline clearOutStagingLocationWithError:]", 201, a1, v5, v16, [v16 userInfo]);
    }
    if (v16)
    {
      if (a2) {
        *a2 = v16;
      }
    }
    else
    {
      uint64_t v7 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        __int16 v19 = 1024;
        int v20 = 202;
        _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v6;
}

- (BOOL)prepareForBaselineRollOfPersistentStore:(uint64_t)a3 andLocalPeerID:(void *)a4 error:
{
  v38[2] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  id v33 = 0;
  uint64_t v8 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];

  *(void *)(v7 + 112) = 0;
  *(void *)(v7 + 152) = a2;
  id v9 = (id)-[PFUbiquityLocation createFullURL](*(void *)(v7 + 88));
  if (objc_msgSend(v8, "fileExistsAtPath:", objc_msgSend(v9, "path")))
  {
    if ((-[PFUbiquityBaseline clearOutStagingLocationWithError:](v7, &v33) & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (![v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v33])
  {
    goto LABEL_33;
  }
  id v10 = (id)objc_msgSend((id)objc_msgSend(a2, "URL"), "lastPathComponent");
  *(void *)(v7 + 112) = v10;
  uint64_t v11 = (void *)[v9 URLByAppendingPathComponent:v10];
  uint64_t v12 = (void *)[a2 persistentStoreCoordinator];
  if (objc_msgSend(v12, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v11, objc_msgSend(a2, "options"), objc_msgSend(a2, "URL"), objc_msgSend(a2, "options"), objc_msgSend(a2, "type"), &v33))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully copied store to staging directory: %@", "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 240, v7, v11);
    }
    uint64_t v13 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", [v12 managedObjectModel]);
    if (v11)
    {
      uint64_t v14 = [a2 type];
      uint64_t v15 = [a2 configurationName];
      v37[0] = @"NSUbiquityImporterPrivateStoreKey";
      uint64_t v16 = [NSNumber numberWithBool:1];
      v37[1] = @"NSSQLitePragmasOption";
      v38[0] = v16;
      v38[1] = &unk_1ED7E2500;
      uint64_t v17 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v13, "addPersistentStoreWithType:configuration:URL:options:error:", v14, v15, v11, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2], &v33);
      if (v17)
      {
        v18 = (void *)v17;
        uint64_t v19 = objc_msgSend((id)objc_msgSend(v11, "path"), "stringByAppendingString:", @"-wal");
        uint64_t v20 = objc_msgSend((id)objc_msgSend(v11, "path"), "stringByAppendingString:", @"-shm");
        if ([v8 fileExistsAtPath:v20])
        {
          if (([v8 fileExistsAtPath:v19] & 1) == 0)
          {
            *(void *)buf = 0;
            if (([v8 removeItemAtPath:v20 error:buf] & 1) == 0)
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing the orphaned -shm file: %@\n%@", "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 257, v7, *(void *)buf, [*(id *)buf userInfo]);
              }
            }
          }
        }

        *(void *)(v7 + 96) = 0;
        uint64_t v21 = [PFUbiquityBaselineMetadata alloc];
        uint64_t v22 = *(void *)(v7 + 8);
        if (v22)
        {
          if (*(_DWORD *)(v22 + 24) != 1) {
            uint64_t v22 = *(void *)(v22 + 8);
          }
        }
        uint64_t v23 = [(PFUbiquityBaselineMetadata *)v21 initWithLocalPeerID:a3 storeName:*(void *)(v7 + 120) modelVersionHash:*(void *)(v7 + 128) andUbiquityRootLocation:v22];
        *(void *)(v7 + 96) = v23;
        char v24 = -[PFUbiquityBaselineMetadata gatherMetadataWithStore:andError:](v23, v18, (uint64_t)&v33);

        if (v24) {
          return 1;
        }
        goto LABEL_33;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to open staging store as URL is nil", "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 248);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError connecting to the staged baseline store file: %@\n%@", "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 267, v7, v33, [v33 userInfo]);
    }
  }
  else if (objc_msgSend((id)objc_msgSend(v33, "domain"), "isEqualToString:", @"NSSQLiteErrorDomain")&& objc_msgSend(v33, "code") == 5)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to copy store file to staging directory: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 274, v7, v11, v33, [v33 userInfo]);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to copy store file to staging directory: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]", 276, v7, v11, v33, [v33 userInfo]);
  }
LABEL_33:
  if (v33)
  {
    if (a4)
    {
      result = 0;
      *a4 = v33;
      return result;
    }
  }
  else
  {
    uint64_t v25 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    v32 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
    __int16 v35 = 1024;
    int v36 = 282;
    _os_log_fault_impl(&dword_18AB82000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

- (uint64_t)gatherContentsFromMigratedBaseline:(uint64_t)a3 withStoreFileURL:(void *)a4 error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    id v21 = 0;

    *(void *)(v7 + 144) = 0;
    [*(id *)(v7 + 104) removeAllObjects];
    uint64_t v8 = *(void **)(v7 + 104);
    if (a2)
    {
      [v8 addEntriesFromDictionary:a2[13]];

      id v9 = (void *)a2[14];
    }
    else
    {
      [v8 addEntriesFromDictionary:0];

      id v9 = 0;
    }
    *(void *)(v7 + 112) = v9;

    if (a2) {
      id v10 = (void *)a2[12];
    }
    else {
      id v10 = 0;
    }
    *(void *)(v7 + 96) = v10;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:a3 options:2 error:&v21];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      [*(id *)(v7 + 104) setObject:v11 forKey:*(void *)(v7 + 112)];

      return -[PFUbiquityBaseline constructBaselineArchive:](v7, a4);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  No store file found at url: %@\nBaseline: %@\nError: %@\nuserInfo: %@\n", "-[PFUbiquityBaseline gatherContentsFromMigratedBaseline:withStoreFileURL:error:]", 302, a3, a2, v21, [v21 userInfo]);
    }
    if (v21)
    {
      if (a4)
      {
        result = 0;
        *a4 = v21;
        return result;
      }
      return 0;
    }
    uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    uint64_t v20 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      __int16 v24 = 1024;
      int v25 = 303;
      _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      return 0;
    }
  }
  return result;
}

- (BOOL)constructBaselineArchive:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];

  *(void *)(a1 + 144) = 0;
  id v4 = *(void **)(a1 + 136);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  uint64_t v7 = *(void **)(a1 + 112);
  self;
  id v35 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v10 = [v4 _optimizedEncoding:&v35];
  if (v10)
  {
    [v8 setObject:v10 forKey:@"model"];
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error getting data for optimized encoding: %@\nuserInfo: %@\nModel: %@", "+[PFUbiquityBaseline createArchiveWithModel:metadata:storeFilenameToData:storeFilename:error:]", 1551, v35, [v35 userInfo], v4);
  }
  uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  if (v11)
  {
    [v8 setObject:v11 forKey:@"gcmodel"];
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0), @"metadata");
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0), @"storeFilenameToData");
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v7, "dataUsingEncoding:", 4), @"storeFilename");
    uint64_t v12 = -[_PFZipFileArchive initWithEntryNames:contents:properties:options:]((uint64_t)[_PFZipFileArchive alloc], (void *)[v8 allKeys], v8, 0);
    char v13 = 1;
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error getting data for regular encoding: %@\nuserInfo: %@\nModel: %@", "+[PFUbiquityBaseline createArchiveWithModel:metadata:storeFilenameToData:storeFilename:error:]", 1560, v35, [v35 userInfo], v4);
    }
    uint64_t v12 = 0;
    char v13 = 0;
  }
  id v14 = v35;

  [v9 drain];
  id v15 = v35;
  id v16 = 0;
  if ((v13 & 1) == 0)
  {
    id v17 = v35;
    if (v35) {
      goto LABEL_15;
    }
    uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    int v25 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      __int16 v38 = 1024;
      int v39 = 1595;
      _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  id v17 = 0;
LABEL_15:
  *(void *)(a1 + 144) = v12;
  if (!v12)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to crate compressed archive of baseline contents: %@\nuserInfo: %@", "-[PFUbiquityBaseline constructBaselineArchive:]", 375, a1, v17, [v17 userInfo]);
    }
    if (v17)
    {
      if (a2) {
        *a2 = v17;
      }
    }
    else
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        __int16 v38 = 1024;
        int v39 = 376;
        _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v12 != 0;
}

- (uint64_t)gatherContentsAndConstructArchiveWithError:(uint64_t)result
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    id v37 = 0;
    [*(id *)(result + 104) removeAllObjects];
    uint64_t v31 = v2;
    objc_super v3 = -[PFUbiquityLocation createFullPath](*(void *)(v2 + 88));
    id v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "subpathsAtPath:", v3);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend((id)objc_msgSend(v9, "pathComponents"), "count") < 2)
          {
            uint64_t v10 = [v3 stringByAppendingPathComponent:v9];
            char v32 = 0;
            if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", v10, &v32))BOOL v11 = v32 == 0; {
            else
            }
              BOOL v11 = 0;
            if (v11)
            {
              uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v10 options:2 error:&v37];
              if (!v12)
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got nil data for staged store file at path: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]", 341, v10, v37, [v37 userInfo]);
                }
                if (v37)
                {
                  if (a2) {
                    *a2 = v37;
                  }
                }
                else
                {
                  uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                  _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
                  uint64_t v21 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    int v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
                    __int16 v40 = 1024;
                    int v41 = 342;
                    _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                  }
                }

                return 0;
              }
              char v13 = (void *)v12;
              [*(id *)(v31 + 104) setObject:v12 forKey:v9];
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got more than one path component for subpath: %@ of baseline staging directory: %@", "-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]", 329, v9, v3);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    if (-[PFUbiquityBaseline constructBaselineArchive:](v31, &v37)) {
      return 1;
    }
    if (v37)
    {
      if (a2)
      {
        result = 0;
        *a2 = v37;
        return result;
      }
      return 0;
    }
    uint64_t v22 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    uint64_t v29 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      int v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      __int16 v40 = 1024;
      int v41 = 359;
      _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      return 0;
    }
  }
  return result;
}

- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v53 = 0;

  self->_baselineArchive = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__47;
  v51 = __Block_byref_object_dispose__47;
  uint64_t v52 = 0;
  uint64_t v7 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)self->super._currentLocation, (uint64_t)self->super._localPeerID);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v55 = __Block_byref_object_copy__47;
  v56 = __Block_byref_object_dispose__47;
  uint64_t v57 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  currentLocation = self->super._currentLocation;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __49__PFUbiquityBaseline_loadFileFromLocation_error___block_invoke;
  v42[3] = &unk_1E544F2F0;
  v42[6] = &v47;
  v42[7] = buf;
  v42[4] = self;
  v42[5] = &v43;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v7, (uint64_t)currentLocation, 1, 1, &v53, (uint64_t)v42);

  if (*((unsigned char *)v44 + 24))
  {
    if (v48[5])
    {

      char v9 = 0;
      self->_baselineArchive = (_PFZipFileArchive *)(id)v48[5];
      goto LABEL_9;
    }
    uint64_t v10 = [NSString stringWithFormat:@"%@\nCoordinated read of baseline archive file succeeded, but the file could not be read: %@\nError: %@\n", self, self->super._currentLocation, *(void *)(*(void *)&buf[8] + 40)];
    BOOL v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:*MEMORY[0x1E4F28568]];
    id v53 = (id)[v11 errorWithDomain:*MEMORY[0x1E4F281F8] code:134307 userInfo:v12];
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCoordinated read of baseline archive file: %@ did not succed: %@\nuserInfo: %@\n", "-[PFUbiquityBaseline loadFileFromLocation:error:]", 434, self, self->super._currentLocation, v53, [v53 userInfo]);
  }
  char v9 = 1;
LABEL_9:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(buf, 8);
  if (v9)
  {
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_27;
  }

  self->_metadata = 0;
  uint64_t v14 = (PFUbiquityBaselineMetadata *)(id)+[PFUbiquityBaseline metadataFromBaselineArchive:]((uint64_t)PFUbiquityBaseline, (uint64_t)self->_baselineArchive);
  self->_metadata = v14;
  if (!v14)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Encountered baseline without any metadata in it's archive: %@", "-[PFUbiquityBaseline loadFileFromLocation:error:]", 445, self);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = self->super._currentLocation;
    if (!v25) {
      uint64_t v25 = (PFUbiquityLocation *)[MEMORY[0x1E4F1CA98] null];
    }
    goto LABEL_26;
  }

  self->_model = 0;
  uint64_t v15 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, @"gcmodel");
  if (!v15)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Encountered baseline without any model data in it's archive: %@", "-[PFUbiquityBaseline loadFileFromLocation:error:]", 456, self);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = self->super._currentLocation;
    if (!v25) {
      uint64_t v25 = (PFUbiquityLocation *)[MEMORY[0x1E4F1CA98] null];
    }
    goto LABEL_26;
  }
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v17 = (NSManagedObjectModel *)(id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v16, v15, (uint64_t)&v53);
  self->_model = v17;
  if (!v17)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to decode model from archive: %@", "-[PFUbiquityBaseline loadFileFromLocation:error:]", 464, v53);
    }
    goto LABEL_10;
  }
  uint64_t v18 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, @"storeFilenameToData");
  uint64_t v19 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, @"storeFilename");
  uint64_t v20 = v19;
  if (v18 | v19)
  {
    if (v18)
    {
      if (v19)
      {
        int v39 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v40 = objc_opt_class();
        uint64_t v41 = [v39 unarchivedDictionaryWithKeysOfClass:v40 objectsOfClass:objc_opt_class() fromData:v18 error:&v53];
        if (!v41) {
          goto LABEL_10;
        }
        [(NSMutableDictionary *)self->_storeFilenameToData removeAllObjects];
        [(NSMutableDictionary *)self->_storeFilenameToData addEntriesFromDictionary:v41];

        uint64_t v22 = (__CFString *)[[NSString alloc] initWithData:v20 encoding:4];
        goto LABEL_40;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Encountered baseline without any filename data in it's archive: %@", "-[PFUbiquityBaseline loadFileFromLocation:error:]", 492, self);
      }
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v25 = self->super._currentLocation;
      if (!v25) {
        uint64_t v25 = (PFUbiquityLocation *)[MEMORY[0x1E4F1CA98] null];
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Encountered baseline without any filenames data in it's archive: %@", "-[PFUbiquityBaseline loadFileFromLocation:error:]", 488, self);
      }
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v25 = self->super._currentLocation;
      if (!v25) {
        uint64_t v25 = (PFUbiquityLocation *)[MEMORY[0x1E4F1CA98] null];
      }
    }
LABEL_26:
    uint64_t v26 = [v24 dictionaryWithObject:v25 forKey:@"offendingBaseline"];
    BOOL v13 = 0;
    id v53 = (id)[v23 errorWithDomain:*MEMORY[0x1E4F281F8] code:134307 userInfo:v26];
    goto LABEL_27;
  }
  uint64_t v21 = -[_PFZipFileArchive contentsForEntryName:]((uint64_t)self->_baselineArchive, @"store");
  if (!v21)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Encountered baseline without any filenames data in it's archive: %@", "-[PFUbiquityBaseline loadFileFromLocation:error:]", 483, self);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = self->super._currentLocation;
    if (!v25) {
      uint64_t v25 = (PFUbiquityLocation *)[MEMORY[0x1E4F1CA98] null];
    }
    goto LABEL_26;
  }
  [(NSMutableDictionary *)self->_storeFilenameToData removeAllObjects];
  [(NSMutableDictionary *)self->_storeFilenameToData setObject:v21 forKey:@"baseline.store"];

  uint64_t v22 = @"baseline.store";
LABEL_40:
  self->_storeFilename = (NSString *)v22;
  BOOL v13 = 1;
LABEL_27:

  v48[5] = 0;
  id v27 = v53;
  [v6 drain];
  id v28 = v53;
  id v29 = 0;
  if (!v13)
  {
    if (v53)
    {
      if (a4) {
        *a4 = v53;
      }
    }
    else
    {
      uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      id v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFU"
                             "biquityBaseline.m";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 525;
        _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v47, 8);
  return v13;
}

id __49__PFUbiquityBaseline_loadFileFromLocation_error___block_invoke(void *a1, void *a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  *(void *)(*(void *)(a1[6] + 8) + 40) = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], (void *)[a2 path], 0, *(void *)(a1[7] + 8) + 40);
  if (!*(void *)(*(void *)(a1[6] + 8) + 40)
    && [*(id *)(*(void *)(a1[7] + 8) + 40) code] == 4)
  {
    uint64_t v5 = (void *)a1[4];
    if (v5)
    {
      id v6 = (void *)v5[1];
      if ((void *)v5[3] == v6) {
        id v6 = (void *)v5[2];
      }
    }
    else
    {
      id v6 = 0;
    }
    -[PFUbiquitySafeSaveFile setCurrentLocation:](v5, v6);
    *(void *)(*(void *)(a1[7] + 8) + 40) = 0;
    uint64_t v7 = a1[4];
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 24);
    }
    else {
      uint64_t v8 = 0;
    }
    char v9 = -[PFUbiquityLocation createFullPath](v8);
    *(void *)(*(void *)(a1[6] + 8) + 40) = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], v9, 0, *(void *)(a1[7] + 8) + 40);
  }
  id v10 = *(id *)(*(void *)(a1[7] + 8) + 40);
  [v4 drain];
  BOOL v11 = *(void **)(*(void *)(a1[7] + 8) + 40);

  return v11;
}

+ (uint64_t)metadataFromBaselineArchive:(uint64_t)a1
{
  self;
  uint64_t v3 = -[_PFZipFileArchive contentsForEntryName:](a2, @"metadata");
  uint64_t v6 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v6];
  if (v6 && +[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to baseline metadata: %@", "+[PFUbiquityBaseline metadataFromBaselineArchive:]", 1533, v6);
  }
  return v4;
}

- (BOOL)replaceLocalPersistentStoreAtURL:(uint64_t)a3 ofType:(uint64_t)a4 withOptions:(void *)a5 usingPersistentStoreCoordinator:(void *)a6 error:
{
  BOOL v6 = 0;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v7 = a5;
    if (a5)
    {
      uint64_t v75 = 0;
      v76 = &v75;
      uint64_t v77 = 0x3052000000;
      v78 = __Block_byref_object_copy__47;
      v79 = __Block_byref_object_dispose__47;
      uint64_t v80 = 0;
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      char v74 = 0;
      uint64_t v85 = 0;
      if (-[PFUbiquityBaseline clearOutStagingLocationWithError:](a1, &v85))
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v10 = (void *)[*(id *)(a1 + 104) allKeys];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v81 objects:buf count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v82;
          v65 = v7;
          v66 = a6;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v82 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v81 + 1) + 8 * i);
              uint64_t v15 = (void *)[*(id *)(a1 + 104) objectForKey:v14];
              if (!v15)
              {
                uint64_t v7 = v65;
                a6 = v66;
                if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Encountered baseline without any file data in it's archive for file named: %@\nBaseline: %@", "-[PFUbiquityBaseline unpackStoreFilesToStagingLocation:]", 551, v14, a1);
                }
                id v28 = (void *)MEMORY[0x1E4F28C58];
                id v29 = (void *)MEMORY[0x1E4F1C9E8];
                uint64_t v30 = *(void *)(a1 + 24);
                if (!v30) {
                  uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
                }
                uint64_t v31 = objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v30, @"offendingBaseline", v14, @"offendingFilename", 0);
                uint64_t v32 = [v28 errorWithDomain:*MEMORY[0x1E4F281F8] code:134307 userInfo:v31];
                uint64_t v85 = v32;
                if (v32)
                {
                  uint64_t v18 = 0;
                  char v19 = 0;
                  uint64_t v80 = v32;
                  goto LABEL_37;
                }
                uint64_t v33 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog(17, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
                uint64_t v40 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v86 = 136315394;
                  v87 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
                  __int16 v88 = 1024;
                  int v89 = 553;
                  _os_log_fault_impl(&dword_18AB82000, v40, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v86, 0x12u);
                }
                uint64_t v18 = 0;
LABEL_36:
                char v19 = 0;
                goto LABEL_37;
              }
              uint64_t v16 = *(void *)(a1 + 8);
              if (v16 && *(_DWORD *)(v16 + 24) != 1) {
                uint64_t v16 = *(void *)(v16 + 8);
              }
              uint64_t v17 = +[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 31, *(void *)(a1 + 120), *(void *)(a1 + 128), v14, (void *)v16);
              uint64_t v18 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v17);

              if (([v15 writeToURL:v18 options:1 error:&v85] & 1) == 0)
              {
                if (v85)
                {
                  char v19 = 0;
                  uint64_t v80 = v85;
                  uint64_t v7 = v65;
                  a6 = v66;
                  goto LABEL_37;
                }
                uint64_t v41 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                uint64_t v7 = v65;
                a6 = v66;
                _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
                v48 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v86 = 136315394;
                  v87 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
                  __int16 v88 = 1024;
                  int v89 = 565;
                  _os_log_fault_impl(&dword_18AB82000, v48, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v86, 0x12u);
                }
                goto LABEL_36;
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v81 objects:buf count:16];
            uint64_t v18 = 0;
            char v19 = 1;
            uint64_t v7 = v65;
            a6 = v66;
            if (v11) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v18 = 0;
          char v19 = 1;
        }
LABEL_37:
      }
      else if (v85)
      {
        char v19 = 0;
        uint64_t v80 = v85;
      }
      else
      {
        uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
        id v27 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v91 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
          __int16 v92 = 1024;
          int v93 = 540;
          _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        char v19 = 0;
      }
      char v74 = v19;
      if (*((unsigned char *)v72 + 24))
      {
        uint64_t v49 = *(void *)(a1 + 8);
        if (v49 && *(_DWORD *)(v49 + 24) != 1) {
          uint64_t v49 = *(void *)(v49 + 8);
        }
        v50 = +[PFUbiquityLocation createBaselineStagingLocation:forStoreName:modelVersionHash:andFilename:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 31, *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 112), (void *)v49);
        v51 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v50);
        uint64_t v52 = [v7 persistentStoreForURL:a2];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __112__PFUbiquityBaseline_replaceLocalPersistentStoreAtURL_ofType_withOptions_usingPersistentStoreCoordinator_error___block_invoke;
        v70[3] = &unk_1E544F318;
        v70[4] = v52;
        v70[5] = a2;
        v70[6] = a4;
        v70[7] = v51;
        v70[10] = &v71;
        v70[11] = &v75;
        v70[8] = v7;
        v70[9] = a3;
        [v7 performBlockAndWait:v70];
        id v53 = (id)v76[5];
        if (a6)
        {
          uint64_t v54 = v76[5];
          if (v54) {
            *a6 = v54;
          }
        }
        if (*((unsigned char *)v72 + 24)
          && (-[PFUbiquityBaseline clearOutStagingLocationWithError:](a1, v76 + 5) & 1) == 0
          && +[PFUbiquityLogging canLogMessageAtLevel:1])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to clear out staging directory after store replacement: %@\nuserInfo: %@", "-[PFUbiquityBaseline replaceLocalPersistentStoreAtURL:ofType:withOptions:usingPersistentStoreCoordinator:error:]", 624, v76[5], [(id)v76[5] userInfo]);
        }
      }
      else
      {
        uint64_t v56 = v76[5];
        if (v56)
        {
          if (a6) {
            *a6 = v56;
          }
        }
        else
        {
          uint64_t v57 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v57, v58, v59, v60, v61, v62, v63, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
          v64 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v91 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
            __int16 v92 = 1024;
            int v93 = 586;
            _os_log_fault_impl(&dword_18AB82000, v64, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }
      BOOL v6 = *((unsigned char *)v72 + 24) != 0;
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v75, 8);
    }
  }
  return v6;
}

id __112__PFUbiquityBaseline_replaceLocalPersistentStoreAtURL_ofType_withOptions_usingPersistentStoreCoordinator_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v2 = (id)[*(id *)(a1 + 32) identifier];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = +[NSSQLCore _replacePersistentStoreAtURL:*(void *)(a1 + 40) destinationOptions:*(void *)(a1 + 48) withPersistentStoreFromURL:*(void *)(a1 + 56) sourceOptions:*(void *)(a1 + 48) error:*(void *)(*(void *)(a1 + 88) + 8) + 40];
    -[NSSQLCore resetExternalDataReferencesDirectories](*(unint64_t **)(a1 + 32));
    [*(id *)(a1 + 32) setIdentifier:v2];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 64) _replacePersistentStoreAtURL:*(void *)(a1 + 40) destinationOptions:*(void *)(a1 + 48) withPersistentStoreFromURL:*(void *)(a1 + 56) sourceOptions:*(void *)(a1 + 48) storeType:*(void *)(a1 + 72) error:*(void *)(*(void *)(a1 + 88) + 8) + 40];
  }
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);

  return v3;
}

- (uint64_t)canReplaceStoreAtKnowledgeVector:(void *)a1
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v5 = 0;
    return v5 & 1;
  }
  uint64_t v3 = a1[12];
  if (v3) {
    uint64_t v4 = *(id **)(v3 + 48);
  }
  else {
    uint64_t v4 = 0;
  }
  v64 = v4;
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nChecking to see if it can replace store with knowledge vector: %@", "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 640, a1, a2);
  }
  if ([a2 isEqual:v4])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nLocal store is current with the baseline", "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 642, a1);
    }
LABEL_9:
    char v5 = 0;
    goto LABEL_17;
  }
  if (!-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)a2))
  {
    if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](a2, (uint64_t)v4))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nLocal store is an ancestor of the baseline", "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 648, a1);
      }
      goto LABEL_16;
    }
    if (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v4, (uint64_t)a2))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nBaseline is an ancestor of the local store", "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 651, a1);
      }
      goto LABEL_9;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nBeginning knowledge vector inspection", "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 654, a1);
    }
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", a2, v4, 0);
    id v8 = +[PFUbiquityKnowledgeVector createSetOfAllPeerIDsInKnowledgeVectors:]((uint64_t)PFUbiquityKnowledgeVector, v7);

    uint64_t v56 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    id obj = v8;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v61 = [v8 countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (!v61)
    {
LABEL_130:
      char v5 = 0;
      goto LABEL_131;
    }
    char v9 = 0;
    id v10 = 0;
    char v5 = 0;
    uint64_t v60 = *(void *)v69;
    p_cache = PFUbiquityMetadataFactory.cache;
    uint64_t v55 = *MEMORY[0x1E4F1C3B8];
LABEL_27:
    uint64_t v65 = 0;
    while (1)
    {
      if (*(void *)v69 != v60) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v68 + 1) + 8 * v65);
      if (a2)
      {
        uint64_t v13 = [a2[1] objectForKey:*(void *)(*((void *)&v68 + 1) + 8 * v65)];
        if (!v64)
        {
          char v19 = v56;
          uint64_t v63 = (void *)v13;
          if (!v13)
          {
            char v19 = v9;
            uint64_t v63 = v10;
          }
          goto LABEL_54;
        }
        uint64_t v14 = (void *)v13;
        uint64_t v15 = v64;
      }
      else
      {
        if (!v64)
        {
          char v19 = v9;
          uint64_t v63 = v10;
          p_cache = (void **)(PFUbiquityMetadataFactory + 16);
          goto LABEL_54;
        }
        uint64_t v14 = 0;
        uint64_t v15 = v64;
        p_cache = (void **)(PFUbiquityMetadataFactory + 16);
      }
      uint64_t v16 = (void *)[v15[1] objectForKey:v12];
      uint64_t v17 = v16;
      if (v14 && v16)
      {
        uint64_t v18 = [v16 compare:v14];
        if (v18 == 1)
        {
          uint64_t v21 = a1[12];
          if (v21) {
            uint64_t v22 = *(void *)(v21 + 16);
          }
          else {
            uint64_t v22 = 0;
          }
          int v23 = [v12 isEqualToString:v22];
          if (v23) {
            char v19 = 0;
          }
          else {
            char v19 = v14;
          }
          if (v23) {
            uint64_t v24 = 0;
          }
          else {
            uint64_t v24 = v17;
          }
          uint64_t v63 = v24;
        }
        else
        {
          if (!v18) {
            goto LABEL_44;
          }
          char v19 = v9;
          uint64_t v63 = v10;
          if (v18 == -1)
          {
            char v19 = v17;
            uint64_t v63 = v14;
          }
        }
      }
      else
      {
        char v19 = v56;
        if (v14)
        {
          uint64_t v20 = v14;
        }
        else
        {
          char v19 = v9;
          uint64_t v20 = v10;
        }
        uint64_t v63 = v20;
        if (!v14 && v16)
        {
LABEL_44:
          id v10 = 0;
          char v9 = 0;
          goto LABEL_117;
        }
      }
LABEL_54:
      uint64_t v25 = v19;
      if (v19)
      {
        id v10 = v63;
        if (v63)
        {
          uint64_t v66 = [v19 integerValue];
          uint64_t v26 = [v63 integerValue];
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nNeed logs for peer %@ between %ld and %ld to adopt", "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 727, a1, v12, v66, v26);
          }
          id v80 = 0;
          uint64_t v27 = a1[1];
          if (v27 && *(_DWORD *)(v27 + 24) != 1) {
            uint64_t v27 = *(void *)(v27 + 8);
          }
          uint64_t v58 = v25;
          id v28 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)(p_cache + 248), (uint64_t)v12, a1[15], a1[16], (void *)v27);
          id v29 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)(p_cache + 248), (uint64_t)v28, (uint64_t)&v80);
          uint64_t v59 = v28;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v76 objects:v85 count:16];
          uint64_t v67 = v26 - v66;
          if (v30)
          {
            uint64_t v31 = *(void *)v77;
LABEL_63:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v77 != v31) {
                objc_enumerationMutation(v29);
              }
              uint64_t v33 = *(void *)(*((void *)&v76 + 1) + 8 * v32);
              if (v33 && *(_DWORD *)(v33 + 24) == 22)
              {
                uint64_t v34 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:v33 andLocalPeerID:a1[4]];
                int v35 = -[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)v34, &v80);
                if (v35)
                {
                  uint64_t v36 = [-[PFUbiquityTransactionLog transactionNumber](v34) integerValue];
                  BOOL v37 = v36 > v66 && v36 <= v26;
                  uint64_t v38 = v37;
                  v67 -= v38;
                }
                else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to load log: %@ while checking for baseline adoption: %@", "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 754, a1, v33, v80);
                }

                if (!v35) {
                  break;
                }
              }
              if (v30 == ++v32)
              {
                uint64_t v30 = [v29 countByEnumeratingWithState:&v76 objects:v85 count:16];
                if (v30) {
                  goto LABEL_63;
                }
                break;
              }
            }
          }
          if (v67 < 1)
          {
            int v52 = 1;
          }
          else
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            uint64_t v39 = [v29 countByEnumeratingWithState:&v72 objects:v84 count:16];
            if (v39)
            {
              int v40 = 0;
              int v41 = 0;
              uint64_t v42 = *(void *)v73;
              do
              {
                uint64_t v43 = 0;
                do
                {
                  if (*(void *)v73 != v42) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v44 = *(void *)(*((void *)&v72 + 1) + 8 * v43);
                  if (v44)
                  {
                    int v45 = *(_DWORD *)(v44 + 24);
                    if (v45 == 22)
                    {
                      int v40 = 1;
                    }
                    else if (v45 == 32)
                    {
                      uint64_t v46 = [[PFUbiquityPeerReceipt alloc] initWithLocalPeerID:a1[4] andReceiptFileLocation:v44];
                      if (v46)
                      {
                        kv = v46->_kv;
                        if (kv) {
                          uint64_t v46 = [(NSDictionary *)kv->_kv objectForKey:v12];
                        }
                        else {
                          uint64_t v46 = 0;
                        }
                      }
                      uint64_t v48 = [(PFUbiquityPeerReceipt *)v46 integerValue];
                      if (v48) {
                        BOOL v49 = v48 == v26;
                      }
                      else {
                        BOOL v49 = 0;
                      }
                      int v50 = v49;
                      v41 |= v50;
                    }
                  }
                  ++v43;
                }
                while (v39 != v43);
                uint64_t v51 = [v29 countByEnumeratingWithState:&v72 objects:v84 count:16];
                uint64_t v39 = v51;
              }
              while (v51);
              if (!(v40 & 1 | ((v41 & 1) == 0)))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  We are forked from baseline...force it", "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 783);
                }
                uint64_t v53 = [NSString stringWithFormat:@"Unable to find missing transaction files"];
                long long v82 = @"PFUbiquitySetupDoFork";
                uint64_t v83 = MEMORY[0x1E4F1CC38];
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v55, v53, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1)));
              }
              if ((v41 & v40 & 1) != 0
                && +[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  we found some logs but the peer is still behind...should we force fork??", "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 788);
              }
            }
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nDidn't find all the required logs for baseline adoption, giving up", "-[PFUbiquityBaseline haveTransactionLogsForPeer:between:and:]", 790, a1);
            }
            int v52 = 0;
          }

          p_cache = (void **)(PFUbiquityMetadataFactory + 16);
          if (!v52) {
            goto LABEL_130;
          }
          char v5 = 1;
          id v10 = v63;
          char v9 = v58;
          goto LABEL_117;
        }
      }
      else
      {
        id v10 = v63;
      }
      char v9 = v19;
LABEL_117:
      if (++v65 == v61)
      {
        uint64_t v54 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
        uint64_t v61 = v54;
        if (!v54)
        {
LABEL_131:

          goto LABEL_17;
        }
        goto LABEL_27;
      }
    }
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nLocal store has a zero vector", "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 645, a1);
  }
LABEL_16:
  char v5 = 1;
LABEL_17:
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nFinished check: %d", "-[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:]", 721, a1, v5 & 1);
  }
  return v5 & 1;
}

- (uint64_t)isUploaded:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(a1 + 24));
  id v7 = 0;
  if ([v3 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C690] error:a2]
    && [v7 BOOLValue]
    && (id v6 = 0, [v3 getResourceValue:&v6 forKey:*MEMORY[0x1E4F1C790] error:a2]))
  {
    uint64_t v4 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (uint64_t)metadataMatchesCurrentMetadata:(void *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1[1];
  if (v2 && *(_DWORD *)(v2 + 24) != 1) {
    uint64_t v2 = *(void *)(v2 + 8);
  }
  uint64_t v3 = +[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]((uint64_t)PFUbiquityBaseline, a1[15], a1[4], a1[16], (void *)v2);
  if (!v3)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    uint64_t v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
      __int16 v17 = 1024;
      int v18 = 842;
      _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  uint64_t v4 = v3;
  char v5 = (void *)a1[12];

  return [v5 isEqual:v4];
}

+ (uint64_t)metadataFromCurrentBaselineForStoreWithName:(uint64_t)a1 peerID:(uint64_t)a2 modelVersionHash:(uint64_t)a3 andUbiquityRootLocation:(uint64_t)a4 withError:(void *)a5
{
  self;
  uint64_t v9 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, a2, a3, a4, @"baseline.meta", a5);
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__47;
  uint64_t v20 = __Block_byref_object_dispose__47;
  uint64_t v21 = 0;
  id v15 = 0;
  uint64_t v10 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __124__PFUbiquityBaseline_metadataFromCurrentBaselineForStoreWithName_peerID_modelVersionHash_andUbiquityRootLocation_withError___block_invoke;
  v14[3] = &unk_1E544E958;
  v14[4] = &v16;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v10, (uint64_t)v9, 1, 1, &v15, (uint64_t)v14);

  if (v15 || !v17[5])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Didn't get baseline metadata back from metadata url: %@\nError: %@\nuserInfo: %@\n", "+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]", 1509, v9, v15, [v15 userInfo]);
    }

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v17[5] error:&v13];
    if (v13
      && +[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to baseline metadata: %@", "+[PFUbiquityBaseline metadataFromCurrentBaselineForStoreWithName:peerID:modelVersionHash:andUbiquityRootLocation:withError:]", 1519, v13);
    }

    v17[5] = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (uint64_t)checkPeerReceiptsUnderRootLocation:(uint64_t)a3 forAgreementWithLocalPeerID:(uint64_t)a4 storeName:(uint64_t)a5 modelVersionHash:(void *)a6 error:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v42 = 0;
  uint64_t v32 = objc_opt_new();
  id v9 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, a2, (uint64_t)&v42);
  if (!v9)
  {
    id v10 = 0;
    id v33 = 0;
LABEL_47:
    uint64_t v13 = 0;
    goto LABEL_48;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        if (v16)
        {
          int v17 = *(_DWORD *)(v16 + 24);
          if (v17 == 32)
          {
            if ([*(id *)(v16 + 32) isEqualToString:a3]) {
              uint64_t v13 = (PFUbiquityPeerReceipt *)v16;
            }
            else {
              [v10 addObject:v16];
            }
          }
          else if (v17 == 15)
          {
            v12 += [*(id *)(v16 + 32) isEqualToString:a3] ^ 1;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v11);
    if (v12) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v12 = 0;
  if (![v10 count])
  {
    uint64_t v13 = 0;
    goto LABEL_54;
  }
LABEL_21:
  if ([v10 count] != v12) {
    goto LABEL_47;
  }
  if (!v13) {
    goto LABEL_54;
  }
  uint64_t v13 = [[PFUbiquityPeerReceipt alloc] initWithLocalPeerID:a3 andReceiptFileLocation:v13];
  if (-[PFUbiquitySafeSaveFile existsInCloud](v13)
    && v13
    && [(PFUbiquityPeerReceipt *)v13 loadFileFromLocation:v13->super._currentLocation error:&v42])
  {
    p_isa = (id *)&v13->_kv->super.isa;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v18 = [v10 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v18)
    {
      uint64_t v30 = *(void *)v35;
LABEL_28:
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v10);
        }
        uint64_t v21 = [[PFUbiquityPeerReceipt alloc] initWithLocalPeerID:a3 andReceiptFileLocation:*(void *)(*((void *)&v34 + 1) + 8 * v20)];
        if (!-[PFUbiquitySafeSaveFile existsInCloud](v21)
          || !-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v21, 0, &v42)
          || !v21
          || ![(PFUbiquityPeerReceipt *)v21 loadFileFromLocation:v21->super._currentLocation error:&v42])
        {
          goto LABEL_49;
        }
        if ((-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](p_isa, (uint64_t)v21->_kv) & 1) == 0
          && ([p_isa isEqual:v21->_kv] & 1) == 0)
        {
          self;
          writeDate = v21->_writeDate;
          if (!writeDate)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:1])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Receipt file has no write date: %@", "+[PFUbiquityBaseline isPeerReceiptTooOld:]", 985, v21);
            }
            goto LABEL_49;
          }
          [(NSDate *)writeDate timeIntervalSinceNow];
          if (v23 >= -7776000.0) {
            goto LABEL_49;
          }
          permanentLocation = v21->super._permanentLocation;
          if (permanentLocation) {
            exportingPeerID = permanentLocation->_exportingPeerID;
          }
          else {
            exportingPeerID = 0;
          }
          [v32 addObject:exportingPeerID];
        }

        if (v19 == ++v20)
        {
          uint64_t v18 = [v10 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v18) {
            goto LABEL_28;
          }
          break;
        }
      }
    }
LABEL_54:
    uint64_t v21 = 0;
    if ([v32 count])
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = @"offendingPeers";
      uint64_t v44 = v32;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v42 = [v27 errorWithDomain:*MEMORY[0x1E4F281F8] code:134325 userInfo:v28];
    }
    uint64_t v26 = 1;
    goto LABEL_57;
  }
LABEL_48:
  uint64_t v21 = 0;
LABEL_49:
  uint64_t v26 = 0;
  if (a6 && v42)
  {
    uint64_t v26 = 0;
    *a6 = v42;
  }
LABEL_57:

  return v26;
}

- (uint64_t)importBaselineForStoreAtURL:(uint64_t)a3 ofType:(uint64_t)a4 options:(uint64_t)a5 withLocalPeerID:(uint64_t)a6 stack:(void *)a7 andPersistentStoreCoordinator:(void *)a8 error:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v15 = result;
  id v44 = 0;
  if (*(void *)(result + 144)
    || [(id)result loadFileFromLocation:*(void *)(result + 24) error:&v44])
  {
    uint64_t v16 = *(void *)(v15 + 96);
    if (v16)
    {
      int v17 = *(void **)(v16 + 8);
      if (a6)
      {
LABEL_6:
        uint64_t v18 = *(void **)(a6 + 8);
        goto LABEL_7;
      }
    }
    else
    {
      int v17 = 0;
      if (a6) {
        goto LABEL_6;
      }
    }
    uint64_t v18 = 0;
LABEL_7:
    uint64_t v19 = (void *)+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, v17, v18);
    -[PFUbiquityStoreMetadata loadFromBaselineMetadata:withLocalPeerID:](v19, *(void *)(v15 + 96), a5);
    [v19 setModelVersionHashString:*(void *)(v15 + 128)];
    if (-[PFUbiquityBaseline makeCurrentBaselineWithError:](v15, &v44))
    {
      if (-[PFUbiquityBaseline replaceLocalPersistentStoreAtURL:ofType:withOptions:usingPersistentStoreCoordinator:error:](v15, a2, a3, a4, a7, &v44))
      {
        return 1;
      }
      goto LABEL_21;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered making this baseline: %@ the current baseline: %@\nuserInfo: %@", "-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]", 1011, v15, v44, [v44 userInfo]);
    }
    id v20 = v44;
    if (!v44)
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      uint64_t v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        __int16 v47 = 1024;
        int v48 = 1012;
LABEL_31:
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
LABEL_18:
    if (a8) {
      *a8 = v20;
    }
    goto LABEL_21;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error initializing the baseline: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]", 1015, v15, v44, [v44 userInfo]);
  }
  id v20 = v44;
  if (v44) {
    goto LABEL_18;
  }
  uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
  uint64_t v28 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
    __int16 v47 = 1024;
    int v48 = 1016;
    goto LABEL_31;
  }
LABEL_21:
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error encountered making this baseline: %@ the current baseline: %@\nuserInfo: %@", "-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:]", 1020, v15, v44, [v44 userInfo]);
  }
  if (v44)
  {
    if (a8)
    {
      result = 0;
      *a8 = v44;
      return result;
    }
  }
  else
  {
    uint64_t v36 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
    uint64_t v43 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v46 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
    __int16 v47 = 1024;
    int v48 = 1021;
    _os_log_fault_impl(&dword_18AB82000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

- (uint64_t)makeCurrentBaselineWithError:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v2;
  }
  id v47 = 0;
  id v42 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3)
  {
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    if (*(_DWORD *)(v3 + 24) != 1) {
      uint64_t v3 = *(void *)(v3 + 8);
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v4 = *(void *)(v2 + 32);
  }
  uint64_t v7 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 6, v5, v4, v6, 0, (void *)v3);
  uint64_t v8 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v7);
  id v9 = -[PFUbiquityLocation createFullPath]((uint64_t)v7);

  id v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  int v11 = 1;
  if ([v10 fileExistsAtPath:v9]) {
    int v11 = [v10 removeItemAtURL:v8 error:&v47];
  }

  if (!v11)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      id v13 = v47;
      uint64_t v14 = [v47 userInfo];
      uint64_t v15 = 1135;
      uint64_t v16 = @"%s(%d): CoreData: Ubiquity:  Error cleaning out current baseline directory: %@\nuserInfo: %@";
LABEL_16:
      NSLog((NSString *)v16, "-[PFUbiquityBaseline makeCurrentBaselineWithError:]", v15, v13, v14);
      int v17 = 0;
      uint64_t v18 = 0;
      uint64_t v41 = 0;
      goto LABEL_39;
    }
LABEL_17:
    int v17 = 0;
    uint64_t v18 = 0;
    uint64_t v41 = 0;
    goto LABEL_39;
  }
  if (![v10 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v47])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      id v13 = v47;
      uint64_t v14 = [v47 userInfo];
      uint64_t v15 = 1132;
      uint64_t v16 = @"%s(%d): CoreData: Ubiquity:  Error attempting to create the directory for the current baseline: %@\nuserInfo: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", *(void *)(v2 + 96), 1, 0), "writeToURL:options:error:", objc_msgSend(v8, "URLByAppendingPathComponent:", @"baseline.meta"), 1, &v47)&& objc_msgSend((id)-[_PFZipFileArchive contentsForEntryName:](*(void *)(v2 + 144), @"model"), "writeToURL:options:error:", objc_msgSend(v8, "URLByAppendingPathComponent:", @"baseline.model"), 1, &v47))
  {
    int v12 = objc_msgSend((id)-[_PFZipFileArchive contentsForEntryName:](*(void *)(v2 + 144), @"gcmodel"), "writeToURL:options:error:", objc_msgSend(v8, "URLByAppendingPathComponent:", @"baseline.gcmodel"), 1, &v47);
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v19 = *(void *)(v2 + 8);
  if (v19 && *(_DWORD *)(v19 + 24) != 1) {
    uint64_t v19 = *(void *)(v19 + 8);
  }
  id v20 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 8, *(void *)(v2 + 120), *(void *)(v2 + 32), *(void *)(v2 + 128), 0, (void *)v19);
  uint64_t v21 = -[PFUbiquityLocation createFullPath]((uint64_t)v20);
  int v17 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v20);
  uint64_t v41 = v20;
  uint64_t v39 = v21;
  if ([v10 fileExistsAtPath:v21])
  {
    uint64_t v18 = v21;
    if (v12)
    {
LABEL_24:
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v22 = *(void **)(v2 + 104);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (!v23)
      {
        uint64_t v2 = 1;
        goto LABEL_40;
      }
      uint64_t v24 = *(void *)v44;
LABEL_26:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * v25);
        uint64_t v27 = [v17 URLByAppendingPathComponent:v26];
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMaking current: %@\n", "-[PFUbiquityBaseline makeCurrentBaselineWithError:]", 1121, v2, v27);
        }
        if (!objc_msgSend((id)objc_msgSend(*(id *)(v2 + 104), "objectForKey:", v26), "writeToURL:options:error:", v27, 1, &v47))goto LABEL_38; {
        if (v23 == ++v25)
        }
        {
          uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v23) {
            goto LABEL_26;
          }
          uint64_t v2 = 1;
          uint64_t v18 = v39;
          goto LABEL_40;
        }
      }
    }
  }
  else
  {
    uint64_t v18 = v21;
    if ([v10 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v47])goto LABEL_24; {
  }
    }
  if (!+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
LABEL_38:
    uint64_t v18 = v39;
    goto LABEL_39;
  }
  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error attempting to create the stores directory for the current baseline: %@\nuserInfo: %@", "-[PFUbiquityBaseline makeCurrentBaselineWithError:]", 1129, v47, [v47 userInfo]);
  uint64_t v18 = v21;
LABEL_39:
  id v28 = v47;
  uint64_t v2 = 0;
LABEL_40:
  [v42 drain];
  if ((v2 & 1) == 0)
  {
    id v29 = v47;
    if (v47)
    {
      if (a2) {
        *a2 = v47;
      }
    }
    else
    {
      uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      uint64_t v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v49 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        __int16 v50 = 1024;
        int v51 = 1153;
        _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v2;
}

- (BOOL)updateCurrentStoreIdentifier:(void *)a1 error:(uint64_t)a2
{
  if (a1)
  {
    id v10 = 0;
    uint64_t v4 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:](a1, 0, &v10);
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = [(NSArray *)[(NSPersistentStoreCoordinator *)v4 persistentStores] lastObject];
      uint64_t v7 = v6;
      if (v6)
      {
        [v6 setIdentifier:a2];
        uint64_t v8 = objc_alloc_init(NSSaveChangesRequest);
        [v7 executeRequest:v8 withContext:0 error:0];
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Didn't get persistent store from the baseline coordinator: %@\n%@", "-[PFUbiquityBaseline updateCurrentStoreIdentifier:error:]", 1044, v5, v10);
      }
    }
  }
  return a1 != 0;
}

- (NSPersistentStoreCoordinator)_createPersistentStoreCoordinatorForCurrentBaseline:(id *)a3 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v29 = 0;
  uint64_t v5 = -[PFUbiquityBaseline createManagedObjectModelFromCurrentBaseline](a1);
  if (v5) {
    goto LABEL_3;
  }
  if (-[PFUbiquitySafeSaveFile existsInCloud](a1)
    && [a1 loadFileFromLocation:a1[3] error:a3]
    && -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)a1, a3))
  {
    uint64_t v5 = -[PFUbiquityBaseline createManagedObjectModelFromCurrentBaseline](a1);
    if (v5)
    {
LABEL_3:
      uint64_t v24 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v5];

      uint64_t v6 = a1[1];
      if (v6 && *(_DWORD *)(v6 + 24) != 1) {
        uint64_t v6 = *(void *)(v6 + 8);
      }
      uint64_t v7 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 8, a1[15], a1[4], a1[16], 0, (void *)v6);
      id v8 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v7, (uint64_t)&v29);
      uint64_t v21 = v7;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v9)
      {
        uint64_t v22 = a1;
        id v10 = 0;
        uint64_t v11 = *(void *)v26;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
            if (v13) {
              uint64_t v14 = *(void **)(v13 + 56);
            }
            else {
              uint64_t v14 = 0;
            }
            if ([v14 rangeOfString:@"-wal"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v15 = v13 ? *(void **)(v13 + 56) : 0;
              if ([v15 rangeOfString:@"-shm"] == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v16 = -[PFUbiquityLocation createFullURL](v13);
                if (v16)
                {
                  if (a2)
                  {
                    uint64_t v32 = @"NSReadOnlyPersistentStoreOption";
                    uint64_t v33 = MEMORY[0x1E4F1CC38];
                    int v17 = &v32;
                    uint64_t v18 = &v33;
                  }
                  else
                  {
                    uint64_t v30 = @"NSUbiquityImporterPrivateStoreKey";
                    uint64_t v31 = MEMORY[0x1E4F1CC38];
                    int v17 = &v30;
                    uint64_t v18 = &v31;
                  }
                  if (!-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v24, "addPersistentStoreWithType:configuration:URL:options:error:", @"SQLite", 0, v16, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:1], &v29)&& +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                  {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to open store file: %@\n%@", "-[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:]", 1365, v22, v8, v29);
                  }
                  id v10 = (void *)v16;
                }
                else
                {
                  id v10 = 0;
                  if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                  {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to open store file: %@ as URL is nil", "-[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:]", 1368, v22, v8);
                  }
                }
              }
            }
            ++v12;
          }
          while (v9 != v12);
          uint64_t v19 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
          uint64_t v9 = v19;
        }
        while (v19);
      }
      else
      {
        id v10 = 0;
      }
      goto LABEL_41;
    }
    uint64_t v21 = 0;
    id v10 = 0;
    id v8 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    id v10 = 0;
    id v8 = 0;
  }
  uint64_t v24 = 0;
LABEL_41:

  return v24;
}

- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v38 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3052000000;
  long long v27 = __Block_byref_object_copy__47;
  long long v28 = __Block_byref_object_dispose__47;
  uint64_t v29 = 0;
  if (self) {
    localPeerID = self->super._localPeerID;
  }
  else {
    localPeerID = 0;
  }
  id v8 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a3, (uint64_t)localPeerID);
  uint64_t v9 = -[PFUbiquityLocation createFullURL]((uint64_t)a3);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__PFUbiquityBaseline_writeFileToLocation_error___block_invoke;
  v23[3] = &unk_1E544F2F0;
  v23[6] = &v34;
  v23[7] = &v24;
  v23[4] = self;
  v23[5] = &v30;
  [v8 coordinateWritingItemAtURL:v9 options:8 error:&v38 byAccessor:v23];
  if (*((unsigned char *)v35 + 24))
  {
    id v10 = (void *)v9;
    uint64_t v11 = v8;
  }
  else
  {
    if (*((unsigned char *)v31 + 24)) {
      id v38 = (id)v25[5];
    }
    id v10 = (void *)v9;
    uint64_t v11 = v8;
    if (+[PFUbiquityLogging canLogMessageAtLevel:1])
    {
      if (self) {
        permanentLocation = self->super._permanentLocation;
      }
      else {
        permanentLocation = 0;
      }
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error attempting to write new baseline archive to url: %@, error: %@\nuserInfo: %@", "-[PFUbiquityBaseline writeFileToLocation:error:]", 1212, permanentLocation, v38, [v38 userInfo]);
    }
    if (v38)
    {
      if (a4) {
        *a4 = v38;
      }
    }
    else
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      uint64_t v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        __int16 v41 = 1024;
        int v42 = 1213;
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  char v12 = *((unsigned char *)v35 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v12;
}

void __48__PFUbiquityBaseline_writeFileToLocation_error___block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [a2 URLByDeletingLastPathComponent];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:*(void *)(a1[7] + 8) + 40];
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error creating directory for baseline file: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaseline writeFileToLocation:error:]_block_invoke", 1195, v5, *(void *)(*(void *)(a1[7] + 8) + 40), [*(id *)(*(void *)(a1[7] + 8) + 40) userInfo]);
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = -[_PFZipFileArchive writeToFile:options:error:](*(void *)(a1[4] + 144), (void *)[a2 path], 1, *(void *)(a1[7] + 8) + 40);
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      uint64_t v6 = *(void **)(*(void *)(a1[7] + 8) + 40);
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error writing new baseline file to URL: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaseline writeFileToLocation:error:]_block_invoke", 1200, a2, v6, [v6 userInfo]);
    }
  }
}

- (BOOL)moveToPermanentLocation:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PFUbiquityBaseline;
  uint64_t v15 = 0;
  BOOL v4 = [(PFUbiquitySafeSaveFile *)&v14 moveToPermanentLocation:&v15];
  if (!v4)
  {
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
    }
    else
    {
      uint64_t v5 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      char v12 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        __int16 v18 = 1024;
        int v19 = 1239;
        _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v4;
}

+ (uint64_t)removePeerSpecificIdentifiersFromStore:(uint64_t)a3 withLocalPeerID:
{
  self;
  id v5 = (id)[a2 persistentStoreCoordinator];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__47;
  char v12 = __Block_byref_object_dispose__47;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PFUbiquityBaseline_removePeerSpecificIdentifiersFromStore_withLocalPeerID___block_invoke;
  v7[3] = &unk_1E544B500;
  v7[4] = a2;
  v7[5] = a3;
  v7[6] = &v8;
  [v5 performBlockAndWait:v7];

  v9[5] = 0;
  _Block_object_dispose(&v8, 8);
  return 1;
}

void __77__PFUbiquityBaseline_removePeerSpecificIdentifiersFromStore_withLocalPeerID___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isReadOnly] & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Removing identifiers from: %@", "+[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]_block_invoke", 1256, *(void *)(a1 + 32));
    }
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "metadata"), "mutableCopy");
    [v2 removeObjectForKey:@"com.apple.coredata.ubiquity.token"];
    [v2 removeObjectForKey:@"PFUbiquitySetupContainerIdentifierKey"];
    [v2 removeObjectForKey:@"PFUbiquitySetupStoreFilePeerIDKey"];
    [*(id *)(a1 + 32) setMetadata:v2];

    uint64_t v3 = objc_alloc_init(NSSaveChangesRequest);
    [*(id *)(a1 + 32) executeRequest:v3 withContext:0 error:0];

    -[NSSQLCore setUbiquityTableValue:forKey:](*(void *)(a1 + 32), (uint64_t)&stru_1ED787880, @"containerId");
    -[NSSQLCore setUbiquityTableValue:forKey:](*(void *)(a1 + 32), @"NO", @"com.apple.coredata.ubiquity.localImportComplete");
    if (![-[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32)) objectForKey:*(void *)(a1 + 40)])
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [objc_alloc(NSNumber) initWithInt:0];
      -[NSSQLCore updateUbiquityKnowledgeForPeerWithID:andTransactionNumber:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
    }
  }
}

- (NSManagedObjectModel)createManagedObjectModelFromCurrentBaseline
{
  uint64_t v1 = a1[1];
  if (v1 && *(_DWORD *)(v1 + 24) != 1) {
    uint64_t v1 = *(void *)(v1 + 8);
  }
  return +[PFUbiquityBaseline createModelFromBaselineModelWithModelVersionHash:peerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityBaseline, a1[16], a1[4], a1[15], (void *)v1);
}

- (id)createManagedObjectModel
{
  if (!a1) {
    return 0;
  }
  uint64_t v9 = 0;
  CFDataRef v2 = (const __CFData *)objc_msgSend((id)-[_PFZipFileArchive contentsForEntryName:](*(void *)(a1 + 144), @"model"), "mutableCopy");
  id v8 = 0;
  +[NSManagedObjectModel _newModelFromOptimizedEncoding:error:]((uint64_t)NSManagedObjectModel, v2, (uint64_t *)&v8);
  id v4 = v3;
  if (!v3)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got nil model for baseline: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityBaseline createManagedObjectModel]", 1422, a1, v8, [v8 userInfo]);
    }
    uint64_t v6 = -[_PFZipFileArchive contentsForEntryName:](*(void *)(a1 + 144), @"gcmodel");
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    id v4 = (id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v7, v6, (uint64_t)&v9);
    if (v9 && +[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to read gc model data: %@", "-[PFUbiquityBaseline createManagedObjectModel]", 1429, v9);
    }
  }

  return v4;
}

+ (NSManagedObjectModel)createModelFromBaselineModelWithModelVersionHash:(uint64_t)a3 peerID:(uint64_t)a4 storeName:(void *)a5 andUbiquityRootLocation:
{
  self;
  self;
  uint64_t v9 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, a4, a3, a2, @"baseline.model", a5);
  uint64_t v10 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v9);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v10, "path")))
  {
    uint64_t v11 = [[NSManagedObjectModel alloc] initWithContentsOfOptimizedURL:v10];
    if (v11) {
      goto LABEL_8;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Couldn't load optimized model at url: %@", "+[PFUbiquityBaseline createBaselineOptimizedModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1454, v10);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Cannot find optimized model at URL: %@.\nIt appears there is no current baseline.", "+[PFUbiquityBaseline createBaselineOptimizedModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1457, v10);
  }
  uint64_t v11 = 0;
LABEL_8:

  if (!v11)
  {
    self;
    char v12 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 7, a4, a3, a2, @"baseline.gcmodel", a5);
    uint64_t v13 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v12);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v13, "path")))
    {
      uint64_t v11 = [[NSManagedObjectModel alloc] initWithContentsOfURL:v13];
      if (v11)
      {
LABEL_16:

        return v11;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Couldn't load model at url: %@", "+[PFUbiquityBaseline createBaselineGCModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1473, v13);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Cannot find model at URL: %@.\nIt appears there is no current baseline.", "+[PFUbiquityBaseline createBaselineGCModelForStoreName:peerID:modelVersionHash:andUbiquityRootLocation:]", 1476, v13);
    }
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  return v11;
}

uint64_t __124__PFUbiquityBaseline_metadataFromCurrentBaselineForStoreWithName_peerID_modelVersionHash_andUbiquityRootLocation_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (uint64_t)removeUnusedExternalDataReferences:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v55 = 0;
    id v64 = 0;
    uint64_t v3 = objc_opt_new();
    id v4 = objc_opt_new();
    id v5 = -[PFUbiquityBaseline _createPersistentStoreCoordinatorForCurrentBaseline:error:]((void *)v2, 1, &v64);
    uint64_t v6 = v5;
    if (v5 && [(NSArray *)[(NSPersistentStoreCoordinator *)v5 persistentStores] count] == 1)
    {
      id v7 = [(NSArray *)[(NSPersistentStoreCoordinator *)v6 persistentStores] lastObject];
      id v8 = [(NSPersistentStoreCoordinator *)v6 managedObjectModel];
      uint64_t v49 = v6;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v9 = [(NSManagedObjectModel *)v8 entities];
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v60 objects:buf count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v61;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v61 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v60 + 1) + 8 * v12);
            if (v13)
            {
              if ((*(unsigned char *)(v13 + 120) & 4) != 0)
              {
                uint64_t v14 = *(void *)(v13 + 72);
              }
              else
              {
                do
                {
                  uint64_t v14 = v13;
                  uint64_t v13 = [(id)v13 superentity];
                }
                while (v13);
              }
            }
            else
            {
              uint64_t v14 = 0;
            }
            [v4 addObject:v14];
            ++v12;
          }
          while (v12 != v10);
          uint64_t v15 = [(NSArray *)v9 countByEnumeratingWithState:&v60 objects:buf count:16];
          uint64_t v10 = v15;
        }
        while (v15);
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v16 = [v4 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v57 != v17) {
              objc_enumerationMutation(v4);
            }
            id v19 = -[NSSQLCore newFetchUUIDSForSubentitiesRootedAt:](v7, *(void **)(*((void *)&v56 + 1) + 8 * i));
            [v3 addObjectsFromArray:v19];
          }
          uint64_t v16 = [v4 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v16);
      }
      uint64_t v20 = v3;
      uint64_t v6 = v49;
    }
    else
    {
      if (v64)
      {
        id v55 = v64;
      }
      else
      {
        uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
        long long v28 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v68 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
          __int16 v69 = 1024;
          int v70 = 1633;
          _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      id v8 = 0;

      uint64_t v20 = 0;
    }

    if (v20)
    {
      uint64_t v29 = *(void *)(v2 + 8);
      if (v29 && *(_DWORD *)(v29 + 24) != 1) {
        uint64_t v29 = *(void *)(v29 + 8);
      }
      uint64_t v30 = +[PFUbiquityLocation createUbiquityExternalDataReferenceStoreLocationForStoreName:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(v2 + 120), v29);
      id v31 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v30, (uint64_t)&v55);
      uint64_t v32 = v31;
      if (v31)
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v65 count:16];
        if (!v33) {
          goto LABEL_50;
        }
        uint64_t v34 = *(void *)v52;
        BOOL v35 = 1;
        do
        {
          uint64_t v36 = 0;
          do
          {
            if (*(void *)v52 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * v36);
            if (v37) {
              uint64_t v38 = *(void *)(v37 + 56);
            }
            else {
              uint64_t v38 = 0;
            }
            if (([v20 containsObject:v38] & 1) == 0) {
              BOOL v35 = -[PFUbiquityLocation removeFileAtLocation:error:](v37, *(void *)(v2 + 32), &v55);
            }
            ++v36;
          }
          while (v33 != v36);
          uint64_t v39 = [v32 countByEnumeratingWithState:&v51 objects:v65 count:16];
          uint64_t v33 = v39;
        }
        while (v39);
        if (v35)
        {
LABEL_50:
          uint64_t v2 = 1;
LABEL_58:

          return v2;
        }
      }
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v30 = 0;
    }
    if (v55)
    {
      if (a2)
      {
        uint64_t v2 = 0;
        *a2 = v55;
        goto LABEL_58;
      }
    }
    else
    {
      uint64_t v40 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m");
      id v47 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v68 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Baseline/PFUbiquityBaseline.m";
        __int16 v69 = 1024;
        int v70 = 1677;
        _os_log_fault_impl(&dword_18AB82000, v47, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v2 = 0;
    goto LABEL_58;
  }
  return v2;
}

@end