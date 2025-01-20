@interface PFUbiquityFileCoordinator
+ (uint64_t)newFileCoordinatorForUbiquitousExternalDataReferenceLocation:(uint64_t)a1;
+ (uint64_t)newFileCoordinatorForUbiquityRootLocation:(uint64_t)a1;
+ (uint64_t)newFileCoordinatorForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:;
- (BOOL)shouldRetryForError:(id)a3 ignoreFile:(BOOL *)a4;
- (PFUbiquityFileCoordinator)initWithFilePresenter:(id)a3;
- (uint64_t)coordinateReadingItemAtLocation:(uint64_t)a3 options:(int)a4 retryOnError:(void *)a5 error:(uint64_t)a6 byAccessor:;
- (void)dealloc;
@end

@implementation PFUbiquityFileCoordinator

- (PFUbiquityFileCoordinator)initWithFilePresenter:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityFileCoordinator;
  v4 = -[PFUbiquityFileCoordinator initWithFilePresenter:](&v7, sel_initWithFilePresenter_);
  if (v4)
  {
    if (a3) {
      v5 = (void *)*((void *)a3 + 2);
    }
    else {
      v5 = 0;
    }
    v4->_localPeerID = (NSString *)v5;
  }
  return v4;
}

- (void)dealloc
{
  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityFileCoordinator;
  [(PFUbiquityFileCoordinator *)&v3 dealloc];
}

- (uint64_t)coordinateReadingItemAtLocation:(uint64_t)a3 options:(int)a4 retryOnError:(void *)a5 error:(uint64_t)a6 byAccessor:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v10 = a2;
  v12 = (void *)-[PFUbiquityLocation createFullURL](a2);
  id v50 = 0;
  [a1 coordinateReadingItemAtURL:v12 options:a3 error:&v50 byAccessor:a6];
  if (!v50)
  {
LABEL_31:
    uint64_t v25 = 1;
    goto LABEL_50;
  }
  v46 = a5;
  if (a4) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = 2;
  }
  uint64_t v47 = *MEMORY[0x1E4F281F8];
  uint64_t v45 = *MEMORY[0x1E4F28A50];
  while (1)
  {
    uint64_t v49 = 0;
    if (!v10 || !*(unsigned char *)(v10 + 88))
    {
LABEL_17:
      id v22 = v50;
      goto LABEL_22;
    }
    int v14 = +[_PFRoutines isUbiquitousURLUploaded:error:]((uint64_t)_PFRoutines, v12, (uint64_t)&v49);
    if (v49
      && +[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error checking the uploaded status for: %@\nError: %@", "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 84, v12, v49);
      if (v14) {
        goto LABEL_17;
      }
    }
    else if (v14)
    {
      goto LABEL_17;
    }
    int v15 = [*(id *)(v10 + 32) isEqualToString:a1[8]];
    BOOL v16 = +[PFUbiquityLogging canLogMessageAtLevel:1];
    if (v15)
    {
      if (v16) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unlinking orphaned file: %@", "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 92, a1);
      }
      unlink((const char *)objc_msgSend((id)objc_msgSend(v12, "path"), "fileSystemRepresentation"));
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:@"NSAffectedObjectsErrorKey"];
      v19 = v17;
      uint64_t v20 = v47;
      uint64_t v21 = 134320;
    }
    else
    {
      if (v16) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nReplacing error with file upload error: %@\n", "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 99, a1, v50);
      }
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:@"NSAffectedObjectsErrorKey"];
      uint64_t v21 = 134323;
      v19 = v23;
      uint64_t v20 = v47;
    }
    id v22 = (id)[v19 errorWithDomain:v20 code:v21 userInfo:v18];
    id v50 = v22;
LABEL_22:
    char v48 = 0;
    if (!a4) {
      goto LABEL_33;
    }
    if (([a1 shouldRetryForError:v22 ignoreFile:&v48] & 1) == 0) {
      break;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCoordinated read returned an error: %@\nuserInfo: %@\n Retrying (%u).", "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 108, a1, v50, [v50 userInfo], v13);
    }
    if (v13 >= 2)
    {
      if (v50)
      {
        if (v46) {
          void *v46 = v50;
        }
      }
      else
      {
        uint64_t v36 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m");
        v43 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m";
          __int16 v55 = 1024;
          int v56 = 114;
          _os_log_fault_impl(&dword_18AB82000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      goto LABEL_49;
    }
    if (v13)
    {
      sleep(0xFu);
      uint64_t v13 = 2;
      unsigned int v24 = 30;
    }
    else
    {
      uint64_t v13 = 1;
      unsigned int v24 = 5;
    }
    sleep(v24);
    [a1 coordinateReadingItemAtURL:v12 options:a3 error:&v50 byAccessor:a6];
    if (!v50) {
      goto LABEL_31;
    }
  }
  id v22 = v50;
LABEL_33:
  if (v22)
  {
    if (v46) {
      void *v46 = v22;
    }
  }
  else
  {
    uint64_t v26 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m");
    v33 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m";
      __int16 v55 = 1024;
      int v56 = 132;
      _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  if (v48)
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    v51[0] = @"NSAffectedObjectsErrorKey";
    if (!v10) {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    }
    v51[1] = v45;
    v52[0] = v10;
    uint64_t v35 = (uint64_t)v50;
    if (!v50) {
      uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
    }
    v52[1] = v35;
    id v50 = (id)objc_msgSend(v34, "errorWithDomain:code:userInfo:", v47, 134324, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
  }
LABEL_49:
  uint64_t v25 = 0;
LABEL_50:

  return v25;
}

- (BOOL)shouldRetryForError:(id)a3 ignoreFile:(BOOL *)a4
{
  objc_super v7 = (void *)[a3 domain];
  if ([v7 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    [a3 code];
LABEL_3:
    BOOL v8 = 0;
    goto LABEL_20;
  }
  if (![v7 isEqualToString:@"LibrarianErrorDomain"])
  {
    if ([v7 isEqualToString:@"UBErrorDomain"])
    {
      unint64_t v11 = [a3 code];
      if (v11 < 0xA)
      {
        BOOL v8 = (v11 & 0x3FF) == 0;
        goto LABEL_20;
      }
      BOOL v13 = +[PFUbiquityLogging canLogMessageAtLevel:0];
      BOOL v8 = 0;
      if (!v13) {
        goto LABEL_20;
      }
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nEncountered unknown ubiquity error: %@\nuserInfo: %@", "-[PFUbiquityFileCoordinator shouldRetryForError:ignoreFile:]", 248, self, a3, [a3 userInfo]);
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      BOOL v12 = +[PFUbiquityLogging canLogMessageAtLevel:0];
      BOOL v8 = 0;
      if (!v12) {
        goto LABEL_20;
      }
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nEncountered unrecoverable error: %@\nuserInfo: %@", "-[PFUbiquityFileCoordinator shouldRetryForError:ignoreFile:]", 254, self, a3, [a3 userInfo]);
    }
    goto LABEL_3;
  }
  unint64_t v9 = [a3 code];
  BOOL v8 = 0;
  if ((v9 > 7 || ((1 << v9) & 0xFA) == 0) && v9 != 134320 && v9 != 134323)
  {
    BOOL v10 = +[PFUbiquityLogging canLogMessageAtLevel:0];
    BOOL v8 = 0;
    if (v10)
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nEncountered unknown librarian error: %@\nuserInfo: %@", "-[PFUbiquityFileCoordinator shouldRetryForError:ignoreFile:]", 214, self, a3, [a3 userInfo]);
      goto LABEL_3;
    }
  }
LABEL_20:
  *a4 = v8;
  return 0;
}

+ (uint64_t)newFileCoordinatorForUbiquityRootLocation:(uint64_t)a1
{
  self;

  return +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a2, 0);
}

+ (uint64_t)newFileCoordinatorForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  self;
  if (!a2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 24) != 1) {
    a2 = *(void *)(a2 + 8);
  }
  self;
  uint64_t v5 = -[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, a2, a3);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  objc_super v7 = [PFUbiquityFileCoordinator alloc];

  return (uint64_t)[(PFUbiquityFileCoordinator *)v7 initWithFilePresenter:v6];
}

+ (uint64_t)newFileCoordinatorForUbiquitousExternalDataReferenceLocation:(uint64_t)a1
{
  self;
  self;

  return +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a2, 0);
}

@end