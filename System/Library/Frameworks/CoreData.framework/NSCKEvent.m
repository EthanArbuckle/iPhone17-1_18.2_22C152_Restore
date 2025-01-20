@interface NSCKEvent
+ (NSString)entityPath;
+ (uint64_t)beginEventForRequest:(uint64_t)a3 withMonitor:(void *)a4 error:;
+ (uint64_t)finishEventForResult:(uint64_t)a3 withMonitor:(void *)a4 error:;
@end

@implementation NSCKEvent

+ (NSString)entityPath
{
  v2 = NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

+ (uint64_t)beginEventForRequest:(uint64_t)a3 withMonitor:(void *)a4 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  uint64_t v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke;
  v18[3] = &unk_1E544BB50;
  v18[4] = a3;
  v18[5] = a2;
  v18[6] = &v25;
  v18[7] = &v19;
  -[PFCloudKitStoreMonitor performBlock:](a3, (uint64_t)v18);
  if (!v26[5])
  {
    id v9 = (id)v20[5];
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m");
      v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m";
        __int16 v33 = 1024;
        int v34 = 92;
        _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v20[5] = 0;
  uint64_t v7 = v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    id v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.event"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke_2;
    v7[3] = &unk_1E544BA50;
    uint64_t v4 = *(void *)(a1 + 40);
    v7[4] = v3;
    v7[5] = v4;
    v7[6] = v2;
    long long v8 = *(_OWORD *)(a1 + 48);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v9 = *MEMORY[0x1E4F28588];
    v10[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1 + 40), "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134407, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
}

NSPersistentCloudKitContainerEvent *__52__NSCKEvent_beginEventForRequest_withMonitor_error___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  v2 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKEvent entityPath], *(void *)(a1 + 32));
  -[NSManagedObject setEventIdentifier:](v2, "setEventIdentifier:", [*(id *)(a1 + 40) requestIdentifier]);
  uint64_t v3 = *(void *)(a1 + 40);
  self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 0;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = 2;
      }
      else
      {
        uint64_t v6 = [NSString stringWithUTF8String:"Cannot create persistent event for request: %@"];
        _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v3);
        uint64_t v13 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v3;
          _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Cannot create persistent event for request: %@", buf, 0xCu);
        }
        uint64_t v5 = 0;
      }
    }
  }
  [(NSManagedObject *)v2 setCloudKitEventType:v5];
  -[NSManagedObject setStartedAt:](v2, "setStartedAt:", [MEMORY[0x1E4F1C9C8] date]);
  [*(id *)(a1 + 32) assignObject:v2 toPersistentStore:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) save:&v16])
  {
    result = [[NSPersistentCloudKitContainerEvent alloc] initWithCKEvent:v2];
    uint64_t v15 = *(void *)(a1 + 56);
  }
  else
  {
    result = (NSPersistentCloudKitContainerEvent *)v16;
    uint64_t v15 = *(void *)(a1 + 64);
  }
  *(void *)(*(void *)(v15 + 8) + 40) = result;
  return result;
}

+ (uint64_t)finishEventForResult:(uint64_t)a3 withMonitor:(void *)a4 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  uint64_t v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke;
  v18[3] = &unk_1E544BB50;
  v18[4] = a3;
  v18[5] = a2;
  v18[6] = &v25;
  v18[7] = &v19;
  -[PFCloudKitStoreMonitor performBlock:](a3, (uint64_t)v18);
  if (!v26[5])
  {
    id v9 = (id)v20[5];
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m");
      v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCKEvent.m";
        __int16 v33 = 1024;
        int v34 = 149;
        _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v20[5] = 0;
  uint64_t v7 = v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.event"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke_2;
    v6[3] = &unk_1E544BA50;
    v6[4] = *(void *)(a1 + 40);
    v6[5] = v2;
    v6[6] = v3;
    long long v7 = *(_OWORD *)(a1 + 48);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v6];
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v5 = *MEMORY[0x1E4F281F8];
    uint64_t v8 = *MEMORY[0x1E4F28588];
    v9[0] = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "request"), "requestIdentifier")];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 134407, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  }
}

void __52__NSCKEvent_finishEventForResult_withMonitor_error___block_invoke_2(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v30[0] = 0;
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "request"), "requestIdentifier");
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  self;
  uint64_t v5 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKEvent entityPath]);
  -[NSFetchRequest setPredicate:](v5, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"eventIdentifier = %@", v2]);
  v35[0] = v4;
  -[NSFetchRequest setAffectedStores:](v5, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1]);
  uint64_t v6 = (void *)[v3 executeFetchRequest:v5 error:v30];
  long long v7 = v6;
  if (v6)
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Found multiple NSPersistentCloudKitContainerEvents for the identifier '%@'"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, v2);
      uint64_t v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v2;
        _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Found multiple NSPersistentCloudKitContainerEvents for the identifier '%@'", buf, 0xCu);
      }
    }
    uint64_t v16 = (void *)[v7 lastObject];
    if (v16)
    {
      objc_msgSend(v16, "setEndedAt:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
      objc_msgSend(v16, "setSucceeded:", objc_msgSend(*(id *)(a1 + 32), "success"));
      objc_msgSend(v16, "setErrorDomain:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "domain"));
      objc_msgSend(v16, "setErrorCode:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "code"));
      if ([*(id *)(a1 + 48) save:v30])
      {
        v17 = [[NSPersistentCloudKitContainerEvent alloc] initWithCKEvent:v16];
        uint64_t v18 = *(void *)(a1 + 56);
LABEL_12:
        *(void *)(*(void *)(v18 + 8) + 40) = v17;
        return;
      }
LABEL_11:
      v17 = (NSPersistentCloudKitContainerEvent *)v30[0];
      uint64_t v18 = *(void *)(a1 + 64);
      goto LABEL_12;
    }
  }
  if (v30[0]) {
    goto LABEL_11;
  }
  uint64_t v19 = [NSString stringWithUTF8String:"No event was found for the identifier '%@' in this result: %@"];
  uint64_t v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "request"), "requestIdentifier");
  _NSCoreDataLog(17, v19, v21, v22, v23, v24, v25, v26, v20);
  uint64_t v27 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v28 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "request"), "requestIdentifier");
    uint64_t v29 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v32 = v28;
    __int16 v33 = 2112;
    uint64_t v34 = v29;
    _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: No event was found for the identifier '%@' in this result: %@", buf, 0x16u);
  }
}

@end