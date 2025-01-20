@interface PFCloudKitHistoryAnalyzer
+ (BOOL)isPrivateContextName:(id)a3;
+ (BOOL)isPrivateTransaction:(id)a3;
+ (BOOL)isPrivateTransactionAuthor:(id)a3;
- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5;
- (PFCloudKitHistoryAnalyzer)initWithOptions:(id)a3 managedObjectContext:(id)a4;
- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3;
- (void)dealloc;
@end

@implementation PFCloudKitHistoryAnalyzer

- (PFCloudKitHistoryAnalyzer)initWithOptions:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Attempt to init PFCloudKitHistoryAnalyzer with the wrong options class: %@"];
    uint64_t v8 = objc_opt_class();
    _NSCoreDataLog(17, v7, v9, v10, v11, v12, v13, v14, v8);
    v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = objc_opt_class();
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Attempt to init PFCloudKitHistoryAnalyzer with the wrong options class: %@", buf, 0xCu);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PFCloudKitHistoryAnalyzer;
  v16 = [(PFHistoryAnalyzer *)&v18 initWithOptions:a3];
  if (v16) {
    v16->_managedObjectContext = (NSManagedObjectContext *)a4;
  }
  return v16;
}

- (void)dealloc
{
  self->_lastProcessedToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitHistoryAnalyzer;
  [(PFHistoryAnalyzer *)&v3 dealloc];
}

- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3
{
  v5 = [PFCloudKitHistoryAnalyzerContext alloc];
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  managedObjectContext = self->_managedObjectContext;

  return [(PFCloudKitHistoryAnalyzerContext *)v5 initWithOptions:options managedObjectContext:managedObjectContext store:a3];
}

- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  v33 = 0;
  if (!+[PFCloudKitHistoryAnalyzer isPrivateTransaction:](PFCloudKitHistoryAnalyzer, "isPrivateTransaction:")|| (objc_msgSend((id)objc_msgSend(a3, "author"), "isEqualToString:", @"NSCloudKitMirroringDelegate.import") & 1) != 0|| (objc_msgSend((id)objc_msgSend(a3, "contextName"), "isEqualToString:", @"NSCloudKitMirroringDelegate.import") & 1) != 0|| objc_msgSend((id)objc_msgSend(a3, "author"), "isEqualToString:", @"NSCloudKitMirroringDelegate.reset"))
  {
    if (self)
    {
      options = self->super._options;
      if (options)
      {
        uint64_t v10 = *(void *)&options[1]._automaticallyPruneTransientRecords;
        if (v10)
        {
          if (([*(id *)(v10 + 64) shouldDefer] & 1) != 0 || *(unsigned char *)(v10 + 40))
          {
            uint64_t v11 = *MEMORY[0x1E4F281F8];
            uint64_t v38 = *MEMORY[0x1E4F28588];
            v39[0] = @"History analysis was aborted because the activity was deferred by the system.";
            uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v11, 134419, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1));
            v33 = v12;
            if (v12) {
              goto LABEL_11;
            }
            goto LABEL_17;
          }
        }
      }
    }
    v32.receiver = self;
    v32.super_class = (Class)PFCloudKitHistoryAnalyzer;
    if (![(PFHistoryAnalyzer *)&v32 processTransaction:a3 withContext:a4 error:&v33])
    {
      uint64_t v12 = v33;
      if (v33)
      {
LABEL_11:
        if (a5)
        {
          LOBYTE(v13) = 0;
          *a5 = v12;
          return v13;
        }
LABEL_19:
        LOBYTE(v13) = 0;
        return v13;
      }
LABEL_17:
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzer.m");
      v22 = __pflogFaultLog;
      BOOL v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v13) {
        return v13;
      }
      *(_DWORD *)buf = 136315394;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzer.m";
      __int16 v36 = 1024;
      int v37 = 101;
      _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_19;
    }
  }
  lastProcessedToken = self->_lastProcessedToken;
  if (lastProcessedToken == (NSPersistentHistoryToken *)[a3 token])
  {
    if ([a3 token])
    {
      uint64_t v23 = [NSString stringWithUTF8String:"Transaction appears to have been processed twice: %@"];
      _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a3);
      v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = (const char *)a3;
        _os_log_fault_impl(&dword_18AB82000, v30, OS_LOG_TYPE_FAULT, "CoreData: Transaction appears to have been processed twice: %@", buf, 0xCu);
      }
    }
  }
  else
  {

    self->_lastProcessedToken = (NSPersistentHistoryToken *)(id)[a3 token];
  }
  LOBYTE(v13) = 1;
  return v13;
}

+ (BOOL)isPrivateTransaction:(id)a3
{
  if (+[PFCloudKitHistoryAnalyzer isPrivateTransactionAuthor:](PFCloudKitHistoryAnalyzer, "isPrivateTransactionAuthor:", [a3 author]))
  {
    return 1;
  }
  uint64_t v5 = [a3 contextName];

  return +[PFCloudKitHistoryAnalyzer isPrivateContextName:v5];
}

+ (BOOL)isPrivateTransactionAuthor:(id)a3
{
  if (([a3 isEqualToString:@"NSCloudKitMirroringDelegate.export"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.import"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.reset"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.migration"] & 1) != 0
    || ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.setup"] & 1) != 0)
  {
    return 1;
  }

  return [a3 isEqualToString:@"NSCloudKitMirroringDelegate.event"];
}

+ (BOOL)isPrivateContextName:(id)a3
{
  if ([a3 isEqualToString:@"NSCloudKitMirroringDelegate.export"]) {
    return 1;
  }

  return [a3 isEqualToString:@"NSCloudKitMirroringDelegate.import"];
}

@end