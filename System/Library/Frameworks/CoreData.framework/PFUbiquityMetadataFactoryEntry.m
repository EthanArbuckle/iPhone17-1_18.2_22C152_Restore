@interface PFUbiquityMetadataFactoryEntry
- (PFUbiquityMetadataFactoryEntry)init;
- (PFUbiquityMetadataFactoryEntry)initWithMetadataStoreFileLocation:(id)a3;
- (id)description;
- (uint64_t)initializePersistentStoreCoordinator:(uint64_t)a1;
- (void)dealloc;
@end

@implementation PFUbiquityMetadataFactoryEntry

- (PFUbiquityMetadataFactoryEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryEntry;
  result = [(PFUbiquityMetadataFactoryEntry *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_store = 0u;
    *(_OWORD *)&result->_metadataStoreFileLocation = 0u;
  }
  return result;
}

- (PFUbiquityMetadataFactoryEntry)initWithMetadataStoreFileLocation:(id)a3
{
  v4 = [(PFUbiquityMetadataFactoryEntry *)self init];
  if (v4)
  {
    v4->_metadataStoreFileLocation = (PFUbiquityLocation *)a3;
    v5 = [[PFUbiquityMetadataFactoryFilePresenter alloc] initWithMetadataStoreFileLocation:a3];
    v4->_filePresenter = v5;
    [MEMORY[0x1E4F28CA0] addFilePresenter:v5];
  }
  return v4;
}

- (void)dealloc
{
  [MEMORY[0x1E4F28CA0] removeFilePresenter:self->_filePresenter];

  self->_metadataStoreFileLocation = 0;
  self->_store = 0;
  self->_filePresenter = 0;

  self->_psc = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryEntry;
  [(PFUbiquityMetadataFactoryEntry *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryEntry;
  return (id)[NSString stringWithFormat:@"%@\n\tmetadataStoreFileLocation: %@\n\tpsc: %@\n\tstore: %@\n\tfilePresenter: %@\n", -[PFUbiquityMetadataFactoryEntry description](&v3, sel_description), self->_metadataStoreFileLocation, self->_psc, self->_store, self->_filePresenter];
}

- (uint64_t)initializePersistentStoreCoordinator:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v49 = 0;
  self;
  id v3 = -[PFUbiquityMetadataFactory newMetadataManagedObjectModel](_sharedFactory);
  if (v3)
  {
    v4 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v3];
    *(void *)(a1 + 16) = v4;
    v5 = v4;

    v39 = v5;
  }
  else
  {
    v39 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = *(void *)(v6 + 32);
    uint64_t v8 = *(void *)(v6 + 40);
    if (*(_DWORD *)(v6 + 24) != 1) {
      uint64_t v6 = *(void *)(v6 + 8);
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = +[PFUbiquityLocation createMetadataPeerStoreLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v7, v8, (void *)v6);
  v10 = -[PFUbiquityLocation createFullPath]((uint64_t)v9);
  v38 = -[PFUbiquityLocation createFullPath](*(void *)(a1 + 8));
  v40 = v10;
  v42 = v9;
  v11 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v51 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  v12 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v9);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __71__PFUbiquityMetadataFactoryEntry_initializePersistentStoreCoordinator___block_invoke;
  v44[3] = &unk_1E544FC58;
  v44[5] = &v45;
  v44[6] = buf;
  v44[4] = v11;
  v41 = v12;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v12, (uint64_t)v9, 1, 0, &v49, (uint64_t)v44);
  if (!*((unsigned char *)v46 + 24))
  {
    if ([v49 code] == 4 || objc_msgSend(v49, "code") == 260)
    {
      v20 = (void *)[v49 domain];
      if ([v20 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
        id v49 = 0;
        if (v3) {
          goto LABEL_10;
        }
      }
    }
LABEL_20:
    v14 = 0;
    v18 = 0;
    v16 = 0;
    v15 = 0;
    char v13 = 1;
    goto LABEL_21;
  }
  if (!v3) {
    goto LABEL_20;
  }
LABEL_10:
  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    goto LABEL_14;
  }
  char v13 = 1;
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Creating file: %@", "-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]", 122, v10);
  }
  if ([v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v49])
  {
LABEL_14:
    char v13 = 1;
    v14 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(a1 + 8));
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"WAL", @"journal_mode", 0);
    v16 = (void *)[objc_alloc(NSNumber) initWithBool:1];
    id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v18 = objc_msgSend(v17, "initWithObjectsAndKeys:", v15, @"NSSQLitePragmasOption", v16, @"NSSQLitePersistWALOption", *MEMORY[0x1E4F28378], @"NSPersistentStoreFileProtectionKey", 0);
    uint64_t v19 = [*(id *)(a1 + 16) addPersistentStoreWithType:@"SQLite" configuration:0 URL:v14 options:v18 error:&v49];
    *(void *)(a1 + 24) = v19;
    if (v19) {
      goto LABEL_15;
    }
    if (!v49) {
      goto LABEL_46;
    }
    uint64_t v43 = 0;
    int v34 = [*(id *)(a1 + 16) destroyPersistentStoreAtURL:v14 withType:@"SQLite" options:v18 error:&v43];
    if (v43) {
      int v35 = v34;
    }
    else {
      int v35 = 0;
    }
    if (v35 == 1
      && +[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing metaDataStore: %@", "-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]", 147, a1, v43);
    }
    uint64_t v36 = [*(id *)(a1 + 16) addPersistentStoreWithType:@"SQLite" configuration:0 URL:v14 options:v18 error:&v49];
    *(void *)(a1 + 24) = v36;
    if (v36)
    {
LABEL_15:
      char v13 = 0;
    }
    else
    {
LABEL_46:
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nTrouble adding the metadata store to the coordinator: %@\nuserInfo: %@", "-[PFUbiquityMetadataFactoryEntry initializePersistentStoreCoordinator:]", 158, a1, v49, [v49 userInfo]);
      }
    }
  }
  else
  {
    v14 = 0;
    v18 = 0;
    v16 = 0;
    v15 = 0;
  }
LABEL_21:
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(buf, 8);
  if ((v13 & 1) == 0)
  {
    uint64_t v24 = 1;
    v23 = v38;
    v22 = v39;
    v21 = v42;
    goto LABEL_29;
  }
  v21 = v42;
  if (!v49)
  {
    uint64_t v25 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    v23 = v38;
    v22 = v39;
    _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityMetadataFactoryEntry.m");
    v32 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbi"
                           "quityMetadataFactoryEntry.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 166;
      _os_log_fault_impl(&dword_18AB82000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  v23 = v38;
  v22 = v39;
  if (!a2)
  {
LABEL_28:
    uint64_t v24 = 0;
    goto LABEL_29;
  }
  uint64_t v24 = 0;
  *a2 = v49;
LABEL_29:

  return v24;
}

uint64_t __71__PFUbiquityMetadataFactoryEntry_initializePersistentStoreCoordinator___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end