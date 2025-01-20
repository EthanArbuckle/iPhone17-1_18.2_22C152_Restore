@interface GEOConfigStorageDirectReadWrite
- (GEOConfigStorageDirectReadWrite)initWithPath:(id)a3 forSource:(int64_t)a4;
- (void)_clearWriteTransaction;
- (void)dealloc;
- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation GEOConfigStorageDirectReadWrite

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  unint64_t v24 = (unint64_t)a3;
  id v8 = a4;
  p_valueStoreLock = &self->super._valueStoreLock;
  os_unfair_lock_lock_with_options();
  uint64_t v10 = [(NSMutableDictionary *)self->super._valueStore objectForKeyedSubscript:v8];
  [(NSMutableDictionary *)self->super._valueStore setObject:v24 forKeyedSubscript:v8];
  if (!(v24 | v10)) {
    goto LABEL_9;
  }
  char v11 = objc_msgSend((id)v10, "isEqual:");
  os_unfair_lock_unlock(&self->super._valueStoreLock);
  if (v11) {
    goto LABEL_10;
  }
  p_valueStoreLock = (os_unfair_lock_s *)(&self->super._isReading + 4);
  os_unfair_lock_lock_with_options();
  writeTimer = self->_writeTimer;
  if (!writeTimer)
  {
    v13 = (OS_dispatch_source *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:5];
    v14 = self->_writeTimer;
    self->_writeTimer = v13;

    writeTimer = self->_writeTimer;
  }
  [(OS_dispatch_source *)writeTimer addObject:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)&self->super._isReading + 1);
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._isReading + 1);
  writeTransaction = self->_writeTransaction;
  v16 = writeTransaction;
  if (!writeTransaction)
  {
    objc_initWeak(&location, self);
    global_queue = geo_get_global_queue();
    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
    id v19 = self->_writeTransaction;
    self->_writeTransaction = v18;

    v20 = self->_writeTransaction;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__GEOConfigStorageDirectReadWrite__scheduleWriteDirectStore__block_invoke;
    handler[3] = &unk_1E53D7B90;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v20, handler);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    v16 = self->_writeTransaction;
  }
  dispatch_time_t v21 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v16, v21, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
  if (!*(void *)&self->_writeLock._os_unfair_lock_opaque)
  {
    uint64_t v22 = _GEOCreateTransaction();
    v23 = *(void **)&self->_writeLock._os_unfair_lock_opaque;
    *(void *)&self->_writeLock._os_unfair_lock_opaque = v22;

    if (writeTransaction) {
      goto LABEL_9;
    }
LABEL_14:
    dispatch_activate((dispatch_object_t)self->_writeTransaction);
    goto LABEL_9;
  }
  if (!writeTransaction) {
    goto LABEL_14;
  }
LABEL_9:
  os_unfair_lock_unlock(p_valueStoreLock);
LABEL_10:
}

void __60__GEOConfigStorageDirectReadWrite__scheduleWriteDirectStore__block_invoke(uint64_t a1)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28CB8] defaultManager];
    v2 = [*((id *)WeakRetained + 2) URLByDeletingLastPathComponent];
    id v26 = 0;
    char v3 = [v1 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v4 = v26;

    if ((v3 & 1) == 0)
    {
      v5 = j__GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v4;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Failed to create parent directory for direct config store: %{public}@", buf, 0xCu);
      }
    }
    uint64_t v6 = *MEMORY[0x1E4F28378];
    uint64_t v7 = *MEMORY[0x1E4F28330];
    v31[0] = *MEMORY[0x1E4F28370];
    v31[1] = v7;
    v32[0] = v6;
    v32[1] = &unk_1ED73E2A8;
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, v31, 2, WeakRetained);
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = [*((id *)WeakRetained + 2) absoluteURL];
    char v11 = [v10 path];
    [v9 createFileAtPath:v11 contents:0 attributes:v8];

    os_unfair_lock_lock_with_options();
    uint64_t v12 = *((void *)WeakRetained + 4);
    id v25 = 0;
    v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:200 options:0 error:&v25];
    id v14 = v25;

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
    if (!v13 || v14)
    {
      -[GEOConfigStorageDirectReadWrite _clearWriteTransaction]((uint64_t)WeakRetained);
      v15 = j__GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v14;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Unable to generate plist from direct store: %@", buf, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_lock_with_options();
      v15 = [*((id *)WeakRetained + 8) copy];
      [*((id *)WeakRetained + 8) removeAllObjects];
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 11);
      uint64_t v16 = *((void *)WeakRetained + 2);
      id v24 = 0;
      char v17 = [v13 writeToURL:v16 options:268435457 error:&v24];
      id v14 = v24;
      if ((v17 & 1) == 0)
      {
        dispatch_source_t v18 = j__GEOGetUserDefaultsLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = (void *)*((void *)WeakRetained + 2);
          *(_DWORD *)buf = 138412546;
          id v28 = v19;
          __int16 v29 = 2112;
          id v30 = v14;
          _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Unable to write direct store %@: %@", buf, 0x16u);
        }
      }
      if ([v15 count])
      {
        unint64_t v20 = *((void *)WeakRetained + 1);
        if (v20 > 9) {
          uint64_t v21 = 991232;
        }
        else {
          uint64_t v21 = qword_18A640198[v20];
        }
        uint64_t v22 = [v15 allObjects];
        _GEOConfigPostKeysChangedNotification(v22, v21);
      }
      -[GEOConfigStorageDirectReadWrite _clearWriteTransaction]((uint64_t)WeakRetained);
    }
  }
}

- (void)_clearWriteTransaction
{
  v2 = (os_unfair_lock_s *)(a1 + 44);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
  char v3 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;

  os_unfair_lock_unlock(v2);
}

- (GEOConfigStorageDirectReadWrite)initWithPath:(id)a3 forSource:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GEOConfigStorageDirectReadWrite;
  result = [(GEOConfigStorageDirectReadOnly *)&v5 initWithPath:a3 forSource:a4];
  if (result) {
    *((_DWORD *)&result->super._isReading + 1) = 0;
  }
  return result;
}

- (void)dealloc
{
  writeTransaction = self->_writeTransaction;
  if (writeTransaction)
  {
    dispatch_source_set_event_handler(writeTransaction, &__block_literal_global_181);
    dispatch_source_cancel((dispatch_source_t)self->_writeTransaction);
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOConfigStorageDirectReadWrite;
  [(GEOConfigStorageDirectReadWrite *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeTimer, 0);
  objc_storeStrong(&self->_writeTransaction, 0);

  objc_storeStrong((id *)&self->_writeLock, 0);
}

@end