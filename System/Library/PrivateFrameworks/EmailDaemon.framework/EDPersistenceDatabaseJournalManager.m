@interface EDPersistenceDatabaseJournalManager
+ (OS_os_log)log;
- (EDPersistenceDatabaseJournal)oldestJournal;
- (EDPersistenceDatabaseJournalManager)initWithBasePath:(id)a3;
- (NSString)journalDirectoryPath;
- (OS_dispatch_queue)checkExistingQueue;
- (OS_dispatch_queue)deleteQueue;
- (id)_getJournalWithBlock:(id)a3;
- (id)currentJournalCreateIfNeeded:(BOOL)a3;
- (void)_deleteJournalNumber:(unint64_t)a3;
- (void)_journalNoLongerReferenced:(id)a3;
- (void)mergedJournal:(id)a3;
- (void)test_tearDown;
- (void)waitForDeletes;
@end

@implementation EDPersistenceDatabaseJournalManager

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EDPersistenceDatabaseJournalManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_69 != -1) {
    dispatch_once(&log_onceToken_69, block);
  }
  v2 = (void *)log_log_69;

  return (OS_os_log *)v2;
}

void __42__EDPersistenceDatabaseJournalManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_69;
  log_log_69 = (uint64_t)v1;
}

- (EDPersistenceDatabaseJournalManager)initWithBasePath:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDPersistenceDatabaseJournalManager;
  id v5 = [(EDPersistenceDatabaseJournalManager *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"Protected Index Journals"];
    v7 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v6;

    *((_DWORD *)v5 + 2) = 0;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.email.persistenceDatabaseJournalManager.checkExistingQueue", v9);
    v11 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.email.persistenceDatabaseJournalManager.deleteQueue", v13);
    v15 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v14;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    id v19 = v5;
    dispatch_block_t v16 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(*((dispatch_queue_t *)v5 + 8), v16);
  }
  return (EDPersistenceDatabaseJournalManager *)v5;
}

void __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = +[EDPersistenceDatabaseJournalManager log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Checking for existing journals", buf, 2u);
  }

  v31 = [MEMORY[0x1E4F28CB8] defaultManager];
  v28 = [*(id *)(a1 + 32) journalDirectoryPath];
  if (objc_msgSend(v31, "fileExistsAtPath:"))
  {
    id v29 = 0;
  }
  else
  {
    id v37 = 0;
    int v3 = [v31 createDirectoryAtPath:v28 withIntermediateDirectories:1 attributes:0 error:&v37];
    id v29 = v37;
    if (v3)
    {
      id v4 = +[EDPersistenceDatabaseJournalManager log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Created journal directory", buf, 2u);
      }
    }
    else
    {
      id v4 = +[EDPersistenceDatabaseJournalManager log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = objc_msgSend(v29, "ef_publicDescription");
        __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke_cold_1(v5, buf, v4);
      }
    }
  }
  if (v28)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
    uint64_t v41 = *MEMORY[0x1E4F1C590];
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    id v36 = v29;
    v30 = [v31 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v7 options:0 error:&v36];
    id v8 = v36;

    id v29 = v8;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E4F1CBF0];
  }
  lock = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(lock);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v9;

  id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v13 = *(void *)(a1 + 32);
  dispatch_queue_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 48);
  *(void *)(v16 + 48) = v15;

  if ([v30 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = v30;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = [*(id *)(*((void *)&v32 + 1) + 8 * i) lastPathComponent];
          if (([v22 hasSuffix:@"-wal"] & 1) == 0
            && ([v22 hasSuffix:@"-shm"] & 1) == 0)
          {
            uint64_t v23 = [v22 integerValue];
            if (v23 >= 1) {
              [*(id *)(*(void *)(a1 + 32) + 32) addIndex:v23];
            }
            EFVerifyFileProtectionType();
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v19);
    }

    v24 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(void **)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)v38 = 138543362;
      v39 = v25;
      _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "Found journal numbers: %{public}@", v38, 0xCu);
    }
  }
  else
  {
    v24 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v29, "ef_publicDescription");
      *(_DWORD *)v38 = 138543362;
      v39 = v26;
      _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "Unable to iterate journal directory: %{public}@", v38, 0xCu);
    }
  }

  os_unfair_lock_unlock(lock);
}

- (id)currentJournalCreateIfNeeded:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__EDPersistenceDatabaseJournalManager_currentJournalCreateIfNeeded___block_invoke;
  v5[3] = &unk_1E6C04458;
  v5[4] = self;
  v5[5] = a2;
  BOOL v6 = a3;
  int v3 = [(EDPersistenceDatabaseJournalManager *)self _getJournalWithBlock:v5];

  return v3;
}

id __68__EDPersistenceDatabaseJournalManager_currentJournalCreateIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    if (![v2 referenceCount])
    {
      int v3 = [MEMORY[0x1E4F28B00] currentHandler];
      [v3 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"EDPersistenceDatabaseJournal.m", 166, @"_currentJournal exists, but has no reference count" object file lineNumber description];
    }
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    id v4 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Creating a new journal", (uint8_t *)&v21, 2u);
    }

    id v5 = (void *)(a1 + 32);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) lastIndex];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = v6;
    }
    uint64_t v8 = [*(id *)(*v5 + 40) lastIndex];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = v8;
    }
    if (v7 <= v9) {
      unint64_t v7 = v9;
    }
    unint64_t v10 = v7 + 1;
    v11 = [[EDPersistenceDatabaseJournal alloc] initWithJournalManager:*v5 number:v10];
    id v12 = *(void **)(*v5 + 16);
    *(void *)(*v5 + 16) = v11;

    [*(id *)(*v5 + 32) addIndex:v10];
    uint64_t v13 = *v5;
    dispatch_queue_t v14 = *(void **)(*v5 + 48);
    uint64_t v15 = *(void *)(v13 + 16);
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v10];
    [v14 setObject:v15 forKey:v16];
  }
  v17 = +[EDPersistenceDatabaseJournalManager log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 16);
    int v21 = 138412290;
    uint64_t v22 = v18;
    _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Returning current journal %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 16);

  return v19;
}

- (void)_journalNoLongerReferenced:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (EDPersistenceDatabaseJournal *)a3;
  os_unfair_lock_lock(&self->_journalLock);
  if (self->_currentJournal == v4)
  {
    if (self->_shouldDeleteCurrentJournal)
    {
      uint64_t v5 = [(EDPersistenceDatabaseJournal *)v4 number];
      [(NSMutableIndexSet *)self->_journalNumbers removeIndex:v5];
      [(NSMutableIndexSet *)self->_pendingDeleteJournalNumbers addIndex:v5];
      journalsByIndexes = self->_journalsByIndexes;
      unint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
      [(NSMapTable *)journalsByIndexes removeObjectForKey:v7];

      self->_shouldDeleteCurrentJournal = 0;
      currentJournal = self->_currentJournal;
    }
    else
    {
      uint64_t v5 = 0;
      currentJournal = v4;
    }
    self->_currentJournal = 0;

    unint64_t v9 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = @"YES";
      if (!v5) {
        unint64_t v10 = @"NO";
      }
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2114;
      dispatch_queue_t v14 = v10;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Unsetting current journal %@ - should delete: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    os_unfair_lock_unlock(&self->_journalLock);
    if (v5) {
      [(EDPersistenceDatabaseJournalManager *)self _deleteJournalNumber:v5];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_journalLock);
  }
}

- (EDPersistenceDatabaseJournal)oldestJournal
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__EDPersistenceDatabaseJournalManager_oldestJournal__block_invoke;
  v4[3] = &unk_1E6C04480;
  v4[4] = self;
  v2 = [(EDPersistenceDatabaseJournalManager *)self _getJournalWithBlock:v4];

  return (EDPersistenceDatabaseJournal *)v2;
}

EDPersistenceDatabaseJournal *__52__EDPersistenceDatabaseJournalManager_oldestJournal__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) firstIndex];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v3 = 0;
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:v2];
    int v3 = [v4 objectForKey:v5];

    if (!v3)
    {
      uint64_t v6 = +[EDPersistenceDatabaseJournalManager log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        uint64_t v12 = v2;
        _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Oldest journal %lu does not already exist. Creating...", (uint8_t *)&v11, 0xCu);
      }

      int v3 = [[EDPersistenceDatabaseJournal alloc] initWithJournalManager:*(void *)(a1 + 32) number:v2];
      unint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v2];
      [v7 setObject:v3 forKey:v8];
    }
    unint64_t v9 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = v2;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Getting oldest journal %lu", (uint8_t *)&v11, 0xCu);
    }
  }

  return v3;
}

- (void)mergedJournal:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (EDPersistenceDatabaseJournal *)a3;
  uint64_t v5 = [(EDPersistenceDatabaseJournal *)v4 number];
  os_unfair_lock_lock(&self->_journalLock);
  currentJournal = self->_currentJournal;
  if (currentJournal == v4)
  {
    self->_shouldDeleteCurrentJournal = 1;
  }
  else
  {
    [(NSMutableIndexSet *)self->_journalNumbers removeIndex:v5];
    [(NSMutableIndexSet *)self->_pendingDeleteJournalNumbers addIndex:v5];
    journalsByIndexes = self->_journalsByIndexes;
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    [(NSMapTable *)journalsByIndexes removeObjectForKey:v8];
  }
  os_unfair_lock_unlock(&self->_journalLock);
  unint64_t v9 = +[EDPersistenceDatabaseJournalManager log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = @"YES";
    if (currentJournal == v4) {
      unint64_t v10 = @"NO";
    }
    int v11 = 134218242;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    dispatch_queue_t v14 = v10;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Merged journal %lu - should delete: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (currentJournal != v4) {
    [(EDPersistenceDatabaseJournalManager *)self _deleteJournalNumber:v5];
  }
}

- (void)_deleteJournalNumber:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[EDPersistenceDatabaseJournalManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = a3;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Start to delete journalNumber %lu", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke;
  aBlock[3] = &unk_1E6BFFA50;
  aBlock[4] = self;
  aBlock[5] = a3;
  uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
  unint64_t v7 = [(EDPersistenceDatabaseJournalManager *)self journalDirectoryPath];
  uint64_t v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2;
    block[3] = &unk_1E6C044A8;
    unint64_t v14 = a3;
    id v12 = v7;
    __int16 v13 = v6;
    dispatch_block_t v9 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_BACKGROUND, 0, block);
    unint64_t v10 = [(EDPersistenceDatabaseJournalManager *)self deleteQueue];
    dispatch_async(v10, v9);
  }
  else
  {
    v6[2](v6);
  }
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(v2);
  [*(id *)(*(void *)(a1 + 32) + 40) removeIndex:*(void *)(a1 + 40)];

  os_unfair_lock_unlock(v2);
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  int v3 = [v2 stringValue];

  uint64_t v4 = [v3 stringByAppendingString:@"-wal"];
  uint64_t v19 = (void *)v4;
  uint64_t v20 = [v3 stringByAppendingString:@"-shm"];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [*(id *)(a1 + 32) stringByAppendingPathComponent:v3];
  uint64_t v18 = v23 = 0;
  int v6 = objc_msgSend(v5, "removeItemAtPath:error:");
  id v7 = v23;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_3();
    }

    uint64_t v4 = (uint64_t)v19;
  }
  dispatch_block_t v9 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v4];
  id v22 = v7;
  int v10 = [v5 removeItemAtPath:v9 error:&v22];
  id v11 = v22;

  if ((v10 & 1) == 0)
  {
    id v12 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_2();
    }
  }
  __int16 v13 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v20];
  id v21 = v11;
  char v14 = [v5 removeItemAtPath:v13 error:&v21];
  id v15 = v21;

  if ((v14 & 1) == 0)
  {
    uint64_t v16 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_1();
    }
    goto LABEL_15;
  }
  if ((v6 & v10) == 1)
  {
    uint64_t v16 = +[EDPersistenceDatabaseJournalManager log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Deleted journal %lu", buf, 0xCu);
    }
LABEL_15:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_getJournalWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  p_journalLock = &self->_journalLock;
  os_unfair_lock_lock(&self->_journalLock);
  if (!self->_journalNumbers)
  {
    os_unfair_lock_unlock(&self->_journalLock);
    int v6 = [(EDPersistenceDatabaseJournalManager *)self checkExistingQueue];
    dispatch_sync(v6, &__block_literal_global_55);

    os_unfair_lock_lock(p_journalLock);
  }
  id v7 = v4[2](v4);
  os_unfair_lock_unlock(p_journalLock);

  return v7;
}

- (void)waitForDeletes
{
  uint64_t v2 = [(EDPersistenceDatabaseJournalManager *)self deleteQueue];
  dispatch_barrier_sync(v2, &__block_literal_global_71);
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDPersistenceDatabaseJournal.m", 321, @"%s can only be called from unit tests", "-[EDPersistenceDatabaseJournalManager test_tearDown]");
  }
  [(EDPersistenceDatabaseJournalManager *)self waitForDeletes];
  uint64_t v5 = [(EDPersistenceDatabaseJournalManager *)self checkExistingQueue];
  dispatch_barrier_sync(v5, &__block_literal_global_76_0);
}

- (NSString)journalDirectoryPath
{
  return self->_journalDirectoryPath;
}

- (OS_dispatch_queue)checkExistingQueue
{
  return self->_checkExistingQueue;
}

- (OS_dispatch_queue)deleteQueue
{
  return self->_deleteQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteQueue, 0);
  objc_storeStrong((id *)&self->_checkExistingQueue, 0);
  objc_storeStrong((id *)&self->_journalDirectoryPath, 0);
  objc_storeStrong((id *)&self->_journalsByIndexes, 0);
  objc_storeStrong((id *)&self->_pendingDeleteJournalNumbers, 0);
  objc_storeStrong((id *)&self->_journalNumbers, 0);

  objc_storeStrong((id *)&self->_currentJournal, 0);
}

void __56__EDPersistenceDatabaseJournalManager_initWithBasePath___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Unable to create journal directory: %{public}@", buf, 0xCu);
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to delete shm for journal %lu: %{public}@", v4, v5);
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to delete wal for journal %lu: %{public}@", v4, v5);
}

void __60__EDPersistenceDatabaseJournalManager__deleteJournalNumber___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to delete journal %lu: %{public}@", v4, v5);
}

@end