@interface PFHistoryAnalyzerContext
- (BOOL)finishProcessing:(id *)a3;
- (BOOL)processChange:(id)a3 error:(id *)a4;
- (BOOL)processTransaction:(id)a3 error:(id *)a4;
- (BOOL)reset:(id *)a3;
- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4;
- (PFHistoryAnalyzerContext)initWithOptions:(id)a3;
- (id)analyzerStateForChangedObjectID:(id)a3 error:(id *)a4;
- (id)fetchSortedStates:(id *)a3;
- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation PFHistoryAnalyzerContext

- (PFHistoryAnalyzerContext)initWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFHistoryAnalyzerContext;
  v4 = [(PFHistoryAnalyzerContext *)&v6 init];
  if (v4)
  {
    v4->_objectIDToState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_processedTransactionIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_options = (PFHistoryAnalyzerOptions *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_sortedStates = 0;
  self->_finalHistoryToken = 0;

  v3.receiver = self;
  v3.super_class = (Class)PFHistoryAnalyzerContext;
  [(PFHistoryAnalyzerContext *)&v3 dealloc];
}

- (BOOL)reset:(id *)a3
{
  self->_objectIDToState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_processedTransactionIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);

  self->_sortedStates = 0;
  self->_isFinished = 0;

  self->_finalHistoryToken = 0;
  return 1;
}

- (BOOL)processTransaction:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a3, "transactionNumber"));
  if ([(NSMutableSet *)self->_processedTransactionIDs containsObject:v8])
  {
    v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3B8];
    uint64_t v27 = [NSString stringWithFormat:@"Invalid attempt to process transaction '%@' twice.", v8, v30];
    goto LABEL_20;
  }
  if (self->_isFinished)
  {
    v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3B8];
    v28 = NSString;
    v29 = NSStringFromSelector(a2);
    uint64_t v27 = [v28 stringWithFormat:@"Invalid invocation of '%@', cannot be called after '%@'", v29, NSStringFromSelector(sel_finishProcessing_)];
LABEL_20:
    objc_exception_throw((id)[v25 exceptionWithName:v26 reason:v27 userInfo:0]);
  }
  [(NSMutableSet *)self->_processedTransactionIDs addObject:v8];
  v9 = (void *)[a3 changes];
  uint64_t v10 = [v9 count];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (v10)
  {
    unint64_t v12 = 0;
    while (-[PFHistoryAnalyzerContext processChange:error:](self, "processChange:error:", [v9 objectAtIndexedSubscript:v12], &v31))
    {
      if (1000 * (v12 / 0x3E8) == v12)
      {

        id v11 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      }
      if (v10 == ++v12) {
        goto LABEL_9;
      }
    }
    id v14 = v31;
    BOOL v13 = 0;
  }
  else
  {
LABEL_9:
    BOOL v13 = 1;
  }

  self->_finalHistoryToken = (NSPersistentHistoryToken *)(id)[a3 token];
  if (!v13)
  {
    id v15 = v31;
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
    }
    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m";
        __int16 v34 = 1024;
        int v35 = 97;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v13;
}

- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)processChange:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  id v7 = -[PFHistoryAnalyzerContext analyzerStateForChangedObjectID:error:](self, "analyzerStateForChangedObjectID:error:", [a3 changedObjectID], &v21);
  if (!v7)
  {
    id v11 = v21;
    if (v21) {
      goto LABEL_6;
    }
    id v12 = [(PFHistoryAnalyzerContext *)self newAnalyzerStateForChange:a3 error:&v21];
    if (v12)
    {
      uint64_t v8 = v12;
      goto LABEL_3;
    }
    id v11 = v21;
    if (v21)
    {
LABEL_6:
      if (a4)
      {
        BOOL v9 = 0;
        uint64_t v8 = 0;
        *a4 = v11;
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m");
      uint64_t v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m";
        __int16 v24 = 1024;
        int v25 = 128;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    BOOL v9 = 0;
    uint64_t v8 = 0;
    goto LABEL_4;
  }
  uint64_t v8 = v7;
  [v7 updateWithChange:a3];
LABEL_3:
  BOOL v9 = 1;
LABEL_4:

  return v9;
}

- (id)analyzerStateForChangedObjectID:(id)a3 error:(id *)a4
{
  return (id)-[NSMutableDictionary objectForKey:](self->_objectIDToState, "objectForKey:", a3, a4);
}

- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4
{
  objc_super v6 = [[PFHistoryAnalyzerDefaultObjectState alloc] initWithOriginalChange:a3];
  -[NSMutableDictionary setObject:forKey:](self->_objectIDToState, "setObject:forKey:", v6, [a3 changedObjectID]);
  return v6;
}

- (BOOL)finishProcessing:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = objc_msgSend((id)-[NSMutableDictionary allValues](self->_objectIDToState, "allValues"), "mutableCopy");
  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count] == 1)
    {
      objc_super v6 = (void *)[v5 lastObject];
      options = self->_options;
      if (options)
      {
        if (options->_automaticallyPruneTransientRecords)
        {
          uint64_t v8 = v6;
          if (![v6 originalChangeType] && objc_msgSend(v8, "finalChangeType") == 2) {
            [v5 removeAllObjects];
          }
        }
      }
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke;
    v12[3] = &unk_1E544FBE8;
    v12[4] = self;
    v12[5] = v4;
    [v5 sortUsingComparator:v12];
    [v5 removeObjectsInArray:v4];
  }
  BOOL v9 = (NSArray *)[v5 copy];
  self->_sortedStates = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke_2;
  v11[3] = &unk_1E544FC10;
  v11[4] = self;
  [(NSArray *)v9 enumerateObjectsUsingBlock:v11];

  self->_isFinished = 1;
  return 1;
}

uint64_t __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v19[0] = a2;
  v19[1] = a3;
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 2, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11)
        {
          uint64_t v12 = *(void *)(v11 + 16);
          if (v12)
          {
            if (*(unsigned char *)(v12 + 8))
            {
              uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              if (![v13 originalChangeType] && objc_msgSend(v13, "finalChangeType") == 2) {
                [*(id *)(a1 + 40) addObject:v13];
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
  return objc_msgSend((id)objc_msgSend(a2, "finalTransactionNumber"), "compare:", objc_msgSend(a3, "finalTransactionNumber"));
}

void __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke_2()
{
  v0 = (void *)MEMORY[0x18C127630]();
}

- (id)fetchSortedStates:(id *)a3
{
  return self->_sortedStates;
}

@end