@interface SHLShazamLibrary
+ (SHLShazamLibrary)defaultLibrary;
- (BOOL)isValidCallingProcessIdentifier:(id)a3;
- (BOOL)shouldPerformFetch;
- (NSProgress)syncProgress;
- (SHLFailedTaskRetryHandler)retryHandler;
- (SHLLibraryStore)store;
- (SHLShazamLibrary)initWithCallingProcessIdentifier:(id)a3;
- (SHLShazamLibrary)initWithScope:(int64_t)a3 callingProcessIdentifier:(id)a4;
- (SHLShazamLibraryDelegate)delegate;
- (SHLSyncSession)syncSession;
- (SHLSyncSessionConfiguration)configuration;
- (id)newFetchTaskWithStartCondition:(id)a3;
- (id)newModifyTaskWithChanges:(id)a3 startCondition:(id)a4;
- (id)taskWithFailedItemsAndCurrentChanges:(id)a3;
- (int64_t)syncActionForTaskType:(int64_t)a3;
- (void)clearCachedSyncStatus;
- (void)finishSession:(id)a3;
- (void)migrateCacheIfNeeded;
- (void)retryFailedTasks:(id)a3;
- (void)session:(id)a3 task:(id)a4 didDeleteItemsWithIdentifiers:(id)a5;
- (void)session:(id)a3 task:(id)a4 didFetchDeletedItemsWithIdentifiers:(id)a5;
- (void)session:(id)a3 task:(id)a4 didFetchGroups:(id)a5;
- (void)session:(id)a3 task:(id)a4 didFetchTracks:(id)a5;
- (void)session:(id)a3 task:(id)a4 didModifyGroups:(id)a5;
- (void)session:(id)a3 task:(id)a4 didModifyTracks:(id)a5;
- (void)session:(id)a3 task:(id)a4 didProduceOutcome:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRetryHandler:(id)a3;
- (void)setShouldPerformFetch:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)setSyncProgress:(id)a3;
- (void)setSyncSession:(id)a3;
- (void)synchronizeChanges:(id)a3 startCondition:(id)a4;
- (void)synchronizeWithStartCondition:(id)a3;
- (void)updateProgressWithTask:(id)a3;
@end

@implementation SHLShazamLibrary

- (SHLShazamLibrary)initWithCallingProcessIdentifier:(id)a3
{
  return [(SHLShazamLibrary *)self initWithScope:1 callingProcessIdentifier:a3];
}

- (SHLShazamLibrary)initWithScope:(int64_t)a3 callingProcessIdentifier:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SHLShazamLibrary;
  v7 = [(SHLShazamLibrary *)&v21 init];
  if (v7)
  {
    v8 = [SHLSyncSessionConfiguration alloc];
    v9 = +[NSUUID UUID];
    v10 = [(SHLSyncSessionConfiguration *)v8 initWithType:0 scope:a3 callingProcessIdentifier:v6 sessionIdentifier:v9];
    configuration = v7->_configuration;
    v7->_configuration = v10;

    v12 = [[SHLLibraryStore alloc] initWithConfiguration:v7->_configuration];
    store = v7->_store;
    v7->_store = v12;

    [(SHLShazamLibrary *)v7 migrateCacheIfNeeded];
    uint64_t v14 = +[NSProgress progressWithTotalUnitCount:0];
    syncProgress = v7->_syncProgress;
    v7->_syncProgress = (NSProgress *)v14;

    v7->_shouldPerformFetch = 1;
    v16 = [[SHLSyncSession alloc] initWithConfiguration:v7->_configuration];
    syncSession = v7->_syncSession;
    v7->_syncSession = v16;

    [(SHLSyncSession *)v7->_syncSession setDelegate:v7];
    v18 = objc_alloc_init(SHLFailedTaskRetryHandler);
    retryHandler = v7->_retryHandler;
    v7->_retryHandler = v18;
  }
  return v7;
}

- (void)synchronizeWithStartCondition:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SHLLibraryChangeset);
  [(SHLShazamLibrary *)self synchronizeChanges:v5 startCondition:v4];
}

- (void)synchronizeChanges:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10003260C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sync started with startCondition: %{public}@", buf, 0xCu);
  }

  v9 = [(SHLShazamLibrary *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(SHLShazamLibrary *)self delegate];
    [v11 libraryWillBeginSync:self];
  }
  v12 = [(SHLShazamLibrary *)self syncSession];
  id v39 = 0;
  unsigned __int8 v13 = [v12 startTransactionWithError:&v39];
  id v14 = v39;

  if (v13)
  {
    if ([(SHLShazamLibrary *)self shouldPerformFetch])
    {
      id v15 = [(SHLShazamLibrary *)self newFetchTaskWithStartCondition:v7];
      [(SHLShazamLibrary *)self updateProgressWithTask:v15];
      v16 = [(SHLShazamLibrary *)self syncSession];
      [v16 executeTask:v15];
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v17 = [(SHLShazamLibrary *)self newModifyTaskWithChanges:v6 startCondition:v7];
    id v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          -[SHLShazamLibrary updateProgressWithTask:](self, "updateProgressWithTask:", v22, (void)v35);
          v23 = [(SHLShazamLibrary *)self syncSession];
          [v23 executeTask:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v19);
    }

    if (!-[SHLShazamLibrary shouldPerformFetch](self, "shouldPerformFetch") && ![v17 count])
    {
      v24 = [(SHLShazamLibrary *)self syncProgress];
      objc_msgSend(v24, "shl_markIndeterminate");

      v25 = [(SHLShazamLibrary *)self syncSession];
      [v25 commitTransactionWithError:0];

      v26 = [(SHLShazamLibrary *)self delegate];
      char v27 = objc_opt_respondsToSelector();

      if (v27)
      {
        v28 = [(SHLShazamLibrary *)self delegate];
        [v28 library:self didCompleteSyncWithCompletionHandler:&stru_100075C98];
      }
    }
    goto LABEL_24;
  }
  if (v14)
  {
    v29 = [(SHLShazamLibrary *)self delegate];
    char v30 = objc_opt_respondsToSelector();

    if (v30)
    {
      v31 = +[SHLError errorWithCode:5 underlyingError:v14];
      v32 = [(SHLShazamLibrary *)self delegate];
      [v32 library:self didProduceError:v31 withFailedItemIdentifiers:&__NSArray0__struct syncAction:1];
    }
  }
  v33 = [(SHLShazamLibrary *)self delegate];
  char v34 = objc_opt_respondsToSelector();

  if (v34)
  {
    id v17 = [(SHLShazamLibrary *)self delegate];
    [v17 library:self didCompleteSyncWithCompletionHandler:&stru_100075C78];
LABEL_24:
  }
}

- (void)clearCachedSyncStatus
{
  id v3 = [(SHLShazamLibrary *)self store];
  v2 = [v3 currentCache];
  [v2 resetWithError:0];
}

- (void)session:(id)a3 task:(id)a4 didProduceOutcome:(id)a5
{
  id v41 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [v9 error];
  v11 = [v10 userInfo];
  v12 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

  unsigned __int8 v13 = [v9 tasksToRetry];
  if ([v13 count])
  {
    BOOL v14 = 0;
  }
  else
  {
    id v15 = [v9 error];
    BOOL v14 = v15 == 0;
  }
  if (+[SHLError canRetryForError:v12])
  {
    v16 = [v9 tasksToRetry];
    if ([v16 count]) {
      BOOL v17 = (uint64_t)[v8 retryCount] < 5;
    }
    else {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }
  if (!v14 && !v17)
  {
    id v18 = sub_10003260C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      objc_super v21 = [v8 identifier];
      uint64_t v22 = [v9 error];
      *(_DWORD *)buf = 138543874;
      v46 = v20;
      __int16 v47 = 2112;
      v48 = v21;
      __int16 v49 = 2112;
      v50 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to complete <task: %{public}@ %@> and not retrying due to <error: %@>", buf, 0x20u);
    }
    v23 = [(SHLShazamLibrary *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      v25 = [(SHLShazamLibrary *)self delegate];
      v26 = [v9 error];
      char v27 = [v9 failedItemIdentifiers];
      objc_msgSend(v25, "library:didProduceError:withFailedItemIdentifiers:syncAction:", self, v26, v27, -[SHLShazamLibrary syncActionForTaskType:](self, "syncActionForTaskType:", objc_msgSend(v8, "type")));
    }
  }
  v28 = [(SHLShazamLibrary *)self syncProgress];
  unsigned int v29 = [v28 isFinished];

  if (v29)
  {
    char v30 = sub_10003260C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      v33 = [v8 identifier];
      *(_DWORD *)buf = 138543618;
      v46 = v32;
      __int16 v47 = 2112;
      v48 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Finished <task: %{public}@ %@> and sync complete", buf, 0x16u);
    }
    [(SHLShazamLibrary *)self finishSession:v8];
  }
  else if (v14 || !v17)
  {
    char v34 = sub_10003260C();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      long long v35 = (objc_class *)objc_opt_class();
      long long v36 = NSStringFromClass(v35);
      long long v37 = [v8 identifier];
      *(_DWORD *)buf = 138543618;
      v46 = v36;
      __int16 v47 = 2112;
      v48 = v37;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Finished <task: %{public}@ %@>, still syncing", buf, 0x16u);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    long long v38 = [SHLTaskRetryContext alloc];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100039928;
    v42[3] = &unk_100074E10;
    objc_copyWeak(&v44, (id *)buf);
    id v43 = v9;
    id v39 = [(SHLTaskRetryContext *)v38 initWithOutcome:v43 retryBlock:v42];
    v40 = [(SHLShazamLibrary *)self retryHandler];
    [v40 retryTask:v8 withContext:v39];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
  }
}

- (void)finishSession:(id)a3
{
  id v4 = a3;
  v5 = [(SHLShazamLibrary *)self syncProgress];
  objc_msgSend(v5, "shl_markIndeterminate");

  id v6 = [(SHLShazamLibrary *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SHLShazamLibrary *)self delegate];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100039AA4;
    v10[3] = &unk_100075CC0;
    id v11 = v4;
    v12 = self;
    [v8 library:self didCompleteSyncWithCompletionHandler:v10];
  }
  else
  {
    id v9 = [(SHLShazamLibrary *)self syncSession];
    [v9 commitTransactionWithError:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didModifyTracks:(id)a5
{
  id v6 = a5;
  char v7 = sub_10003260C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    id v12 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Uploaded %lu modified tracks", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(SHLShazamLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SHLShazamLibrary *)self delegate];
    [v10 library:self didChangeTracks:v6 syncAction:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didModifyGroups:(id)a5
{
  id v6 = a5;
  char v7 = sub_10003260C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    id v12 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Uploaded %lu modified groups", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(SHLShazamLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SHLShazamLibrary *)self delegate];
    [v10 library:self didChangeGroups:v6 syncAction:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didDeleteItemsWithIdentifiers:(id)a5
{
  id v6 = a5;
  char v7 = sub_10003260C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    id v12 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Deleted %lu items", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(SHLShazamLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SHLShazamLibrary *)self delegate];
    [v10 library:self didDeleteItemsWithIdentifiers:v6 syncAction:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didFetchTracks:(id)a5
{
  id v6 = a5;
  char v7 = sub_10003260C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    id v12 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Fetched %lu tracks", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(SHLShazamLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SHLShazamLibrary *)self delegate];
    [v10 library:self didChangeTracks:v6 syncAction:1];
  }
}

- (void)session:(id)a3 task:(id)a4 didFetchGroups:(id)a5
{
  id v6 = a5;
  char v7 = sub_10003260C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    id v12 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Fetched %lu groups", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(SHLShazamLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SHLShazamLibrary *)self delegate];
    [v10 library:self didChangeGroups:v6 syncAction:1];
  }
}

- (void)session:(id)a3 task:(id)a4 didFetchDeletedItemsWithIdentifiers:(id)a5
{
  id v6 = a5;
  char v7 = sub_10003260C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    id v12 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Fetched %lu deleted items", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(SHLShazamLibrary *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(SHLShazamLibrary *)self delegate];
    [v10 library:self didDeleteItemsWithIdentifiers:v6 syncAction:1];
  }
}

- (id)newModifyTaskWithChanges:(id)a3 startCondition:(id)a4
{
  id v6 = a4;
  char v7 = [(SHLShazamLibrary *)self taskWithFailedItemsAndCurrentChanges:a3];
  id v8 = v7;
  if (v7)
  {
    [v7 setSyncStartCondition:v6];
    if ((uint64_t)[v8 size] <= 200)
    {
      id v12 = v8;
      uint64_t v9 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      uint64_t v9 = objc_msgSend(v8, "subdivideTaskIntoBatchesOfSize:");
    }
    char v10 = (void *)v9;
  }
  else
  {
    char v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)newFetchTaskWithStartCondition:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SHLSyncSessionFetchTask);
  [(SHLSyncSessionFetchTask *)v4 setSyncStartCondition:v3];
  unsigned int v5 = [v3 isEqualToString:@"InitialFetch"];

  [(SHLSyncSessionFetchTask *)v4 setFetchType:v5 ^ 1];
  return v4;
}

- (id)taskWithFailedItemsAndCurrentChanges:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 tracksToAdd];
  id v43 = +[NSMutableSet setWithArray:v5];

  id v6 = [v4 trackIDsToDelete];
  char v7 = +[NSMutableSet setWithArray:v6];

  id v8 = [v4 groupsToAdd];
  uint64_t v9 = +[NSMutableSet setWithArray:v8];

  id v42 = v4;
  char v10 = [v4 groupIDsToDelete];
  int v11 = +[NSMutableSet setWithArray:v10];

  id v12 = [(SHLShazamLibrary *)self store];
  unsigned __int8 v13 = [v12 currentCache];
  BOOL v14 = [v13 tasksOfType:1];

  id v15 = [(SHLShazamLibrary *)self store];
  v16 = [v15 currentCache];
  [v16 removeAllTasksOfType:1];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v17 = v14;
  id v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v45;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (![v22 type])
        {
          id v23 = v22;
          char v24 = [v23 tracksToModify];
          v25 = [v24 insertions];
          [v43 unionSet:v25];

          v26 = [v23 tracksToModify];
          char v27 = [v26 deletions];
          [v7 unionSet:v27];

          v28 = [v23 groupsToModify];
          unsigned int v29 = [v28 insertions];
          [v9 unionSet:v29];

          char v30 = [v23 groupsToModify];

          v31 = [v30 deletions];
          [v11 unionSet:v31];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v19);
  }

  v32 = [SHLLibraryBatch alloc];
  id v33 = [v43 copy];
  id v34 = [v7 copy];
  long long v35 = [(SHLLibraryBatch *)v32 initWithInsertions:v33 deletions:v34];

  long long v36 = [SHLLibraryBatch alloc];
  id v37 = [v9 copy];
  id v38 = [v11 copy];
  id v39 = [(SHLLibraryBatch *)v36 initWithInsertions:v37 deletions:v38];

  if ([(SHLLibraryBatch *)v35 hasChanges] || [(SHLLibraryBatch *)v39 hasChanges]) {
    v40 = [[SHLSyncSessionModifyTask alloc] initWithTracksToModify:v35 groupsToModify:v39];
  }
  else {
    v40 = 0;
  }

  return v40;
}

- (BOOL)isValidCallingProcessIdentifier:(id)a3
{
  return [a3 length] != 0;
}

- (void)migrateCacheIfNeeded
{
  id v3 = [(SHLLibraryStore *)self->_store currentCache];
  unsigned int v4 = [v3 needsMigration];

  if (v4)
  {
    unsigned int v5 = sub_10003260C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current local cache requires migration", buf, 2u);
    }

    id v6 = [(SHLLibraryStore *)self->_store currentCache];
    id v15 = 0;
    unsigned int v7 = [v6 migrateWithError:&v15];
    id v8 = v15;

    uint64_t v9 = sub_10003260C();
    char v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v11 = "Successfully migrated local cache";
        id v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      int v11 = "Failed to migrate current local cache %@";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 12;
      goto LABEL_9;
    }
  }
}

- (void)updateProgressWithTask:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SHLShazamLibrary *)self syncProgress];
  id v6 = (char *)[v5 totalUnitCount];
  unsigned int v7 = [v4 progress];
  id v8 = &v6[(void)[v7 totalUnitCount]];

  uint64_t v9 = [(SHLShazamLibrary *)self syncProgress];
  [v9 setTotalUnitCount:v8];

  id v12 = [(SHLShazamLibrary *)self syncProgress];
  char v10 = [v4 progress];
  int v11 = [v4 progress];

  objc_msgSend(v12, "addChild:withPendingUnitCount:", v10, objc_msgSend(v11, "totalUnitCount"));
}

- (int64_t)syncActionForTaskType:(int64_t)a3
{
  return a3 == 1;
}

- (void)retryFailedTasks:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setRetryCount:", (char *)objc_msgSend(v9, "retryCount") + 1);
        char v10 = [(SHLShazamLibrary *)self syncSession];
        [v10 executeTask:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

+ (SHLShazamLibrary)defaultLibrary
{
  if (qword_100090AD8 != -1) {
    dispatch_once(&qword_100090AD8, &stru_100075CE0);
  }
  v2 = (void *)qword_100090AD0;

  return (SHLShazamLibrary *)v2;
}

- (SHLShazamLibraryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHLShazamLibraryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSProgress)syncProgress
{
  return self->_syncProgress;
}

- (void)setSyncProgress:(id)a3
{
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SHLSyncSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (SHLLibraryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (SHLFailedTaskRetryHandler)retryHandler
{
  return self->_retryHandler;
}

- (void)setRetryHandler:(id)a3
{
}

- (BOOL)shouldPerformFetch
{
  return self->_shouldPerformFetch;
}

- (void)setShouldPerformFetch:(BOOL)a3
{
  self->_shouldPerformFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryHandler, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncProgress, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end