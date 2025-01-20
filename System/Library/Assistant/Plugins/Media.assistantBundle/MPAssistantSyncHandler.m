@interface MPAssistantSyncHandler
+ (id)_widthLimitedOperationQueue;
- (MPAssistantSyncHandler)init;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation MPAssistantSyncHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextChange, 0);
  objc_storeStrong((id *)&self->_resultProcessingSemaphore, 0);
  objc_storeStrong((id *)&self->_changeEnumerationSemaphore, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)syncDidEnd
{
  v3 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D422A000, v3, OS_LOG_TYPE_DEFAULT, "Sync Handler (end): sync ended", v4, 2u);
  }

  *(_WORD *)&self->_resetSync = 256;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultProcessingSemaphore);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_changeEnumerationSemaphore);
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_abortSync)
  {
    v8 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_ERROR, "Sync Handler (get): sync already ended", buf, 2u);
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F4E538] sharedPreferences];
    char v10 = [v9 isMediaEntitySyncDisabled];

    if (v10)
    {
      v12 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "Sync Handler (get): media entity sync disabled - resetting anchor", buf, 2u);
      }

      [v7 setObject:0];
      [v7 setPostAnchor:@"0"];
    }
    else
    {
      *(void *)&long long v11 = 138543362;
      long long v26 = v11;
      while (1)
      {
        v13 = (void *)MEMORY[0x1D9445100]();
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_changeEnumerationSemaphore);
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultProcessingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        if (self->_abortSync) {
          break;
        }
        nextChange = self->_nextChange;
        if (nextChange)
        {
          v15 = nextChange;
          v16 = [v15 entity];
          v17 = [v15 anchor];
          uint64_t v18 = [v15 deletionType];
          if (self->_deleteNextChange)
          {
            self->_deleteNextChange = 0;
LABEL_27:
            uint64_t v23 = 1;
            v19 = -[NSObject SAMPMediaEntityRepresentationUsingIdentifierType:](v16, "SAMPMediaEntityRepresentationUsingIdentifierType:", 1, v26);
LABEL_28:
            objc_msgSend(v7, "setPostAnchor:", v17, v26);
            [v7 setIsDelete:v23];
            [v7 setObject:v19];
            v24 = _MPLogCategoryAssistant();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v25 = [v16 persistentID];
              *(_DWORD *)buf = 138543618;
              v28 = v17;
              __int16 v29 = 2048;
              uint64_t v30 = v25;
              _os_log_impl(&dword_1D422A000, v24, OS_LOG_TYPE_DEBUG, "Sync Handler (get): revision %{public}@, pid %lld", buf, 0x16u);
            }

            goto LABEL_31;
          }
          if (v18) {
            goto LABEL_27;
          }
          if (sub_1D425669C(v16))
          {
            v19 = [v16 SAMPMediaEntityRepresentationUsingIdentifierType:1];
            v20 = [v19 title];
            uint64_t v21 = [v20 length];

            if (v21)
            {
              uint64_t v23 = 0;
              goto LABEL_28;
            }
            v22 = _MPLogCategoryAssistant();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v28 = v19;
              _os_log_impl(&dword_1D422A000, v22, OS_LOG_TYPE_DEFAULT, "Sync Handler (get): no title %{public}@", buf, 0xCu);
            }
          }
          else
          {
            v19 = _MPLogCategoryAssistant();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v28 = v16;
              _os_log_impl(&dword_1D422A000, v19, OS_LOG_TYPE_DEFAULT, "Sync Handler (get): not for Assistant %{public}@", buf, 0xCu);
            }
          }
        }
        if (!self->_nextChange) {
          goto LABEL_32;
        }
      }
      v15 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D422A000, v15, OS_LOG_TYPE_ERROR, "Sync Handler (get): aborted", buf, 2u);
      }
LABEL_31:
    }
  }
LABEL_32:
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v9 = (__CFString *)a3;
  id v10 = a4;
  id v11 = a6;
  v12 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    uint64_t v37 = (uint64_t)v9;
    __int16 v38 = 2114;
    uint64_t v39 = (uint64_t)v10;
    _os_log_impl(&dword_1D422A000, v12, OS_LOG_TYPE_DEFAULT, "Sync Handler (begin): anchor: %{private}@, validity: %{public}@", buf, 0x16u);
  }

  if (self->_abortSync)
  {
    v13 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D422A000, v13, OS_LOG_TYPE_ERROR, "Sync Handler (enumeration): sync already ended", buf, 2u);
    }
    goto LABEL_28;
  }
  v13 = [(MPMediaLibrary *)self->_library _syncValidity];
  uint64_t v14 = [(MPMediaLibrary *)self->_library currentEntityRevision];
  v15 = [(MPMediaLibrary *)self->_library valueForDatabaseProperty:@"ForceSiriResetSync"];
  int v16 = [v15 BOOLValue];

  if ([v13 isEqualToString:v10])
  {
    if (v14 >= [(__CFString *)v9 longLongValue])
    {
      if (!v16)
      {
        p_resetSync = &self->_resetSync;
        if (!self->_resetSync) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      v17 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "Sync Handler (validity): forced reset";
        v20 = v17;
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        uint32_t v22 = 2;
        goto LABEL_13;
      }
    }
    else
    {
      v17 = _MPLogCategoryAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [(__CFString *)v9 longLongValue];
        *(_DWORD *)buf = 134218240;
        uint64_t v37 = v14;
        __int16 v38 = 2048;
        uint64_t v39 = v18;
        v19 = "Sync Handler (validity): (db revision = %lli, anchor = %lli)";
LABEL_12:
        v20 = v17;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        uint32_t v22 = 22;
LABEL_13:
        _os_log_impl(&dword_1D422A000, v20, v21, v19, buf, v22);
      }
    }
  }
  else
  {
    v17 = _MPLogCategoryAssistant();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = (uint64_t)v13;
      __int16 v38 = 2114;
      uint64_t v39 = (uint64_t)v10;
      v19 = "Sync Handler (validity): (libraryValidity:%{public}@ != siriValidity:%{public}@)";
      goto LABEL_12;
    }
  }

  [v11 resetWithValidity:v13];
  self->_resetSync = 1;
  p_resetSync = &self->_resetSync;
  v9 = @"0";
LABEL_15:
  [(MPMediaLibrary *)self->_library deleteDatabaseProperty:@"ForceSiriResetSync"];
LABEL_16:
  v24 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v25 = [v24 isMediaEntitySyncDisabled];

  if (v25)
  {
    int v26 = [(__CFString *)v9 intValue];
    v27 = _MPLogCategoryAssistant();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D422A000, v27, OS_LOG_TYPE_DEFAULT, "Sync Handler (validity): media entity sync disabled - resetting", buf, 2u);
      }

      BOOL *p_resetSync = 1;
      [v11 resetWithValidity:v13];

      v9 = @"0";
    }
    else
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D422A000, v27, OS_LOG_TYPE_DEFAULT, "Sync Handler (validity): media entity sync disabled - ignoring sync", buf, 2u);
      }

      self->_abortSync = 1;
    }
  }
  __int16 v29 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  changeEnumerationSemaphore = self->_changeEnumerationSemaphore;
  self->_changeEnumerationSemaphore = v29;

  uint64_t v31 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  resultProcessingSemaphore = self->_resultProcessingSemaphore;
  self->_resultProcessingSemaphore = v31;

  v33 = [(id)objc_opt_class() _widthLimitedOperationQueue];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1D4256D38;
  v34[3] = &unk_1E69E3B00;
  v34[4] = self;
  v9 = v9;
  v35 = v9;
  [v33 addOperationWithBlock:v34];

LABEL_28:
}

- (MPAssistantSyncHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPAssistantSyncHandler;
  v2 = [(MPAssistantSyncHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
    library = v2->_library;
    v2->_library = (MPMediaLibrary *)v3;

    [MEMORY[0x1E4F31970] setFilteringDisabled:1];
  }
  return v2;
}

+ (id)_widthLimitedOperationQueue
{
  if (qword_1EBD857D0 != -1) {
    dispatch_once(&qword_1EBD857D0, &unk_1F2BFA220);
  }
  v2 = (void *)qword_1EBD857D8;

  return v2;
}

@end