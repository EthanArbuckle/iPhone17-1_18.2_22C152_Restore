@interface MSObjectQueue
- (MSObjectQueue)initWithPath:(id)a3;
- (id)_objectWrapperFromQueueQuery:(sqlite3_stmt *)a3 outSize:(int64_t *)a4;
- (id)allObjectWrappersMaxCount:(int64_t)a3;
- (id)allObjectWrappersOrderedByDescendingErrorCountMaxCount:(int64_t)a3;
- (id)objectWrappersWithZeroSizeMaxCount:(int64_t)a3;
- (id)smallestObjectWrappersTargetTotalSize:(int64_t)a3 maxCount:(int64_t)a4;
- (int64_t)count;
- (sqlite3_stmt)_statementLabel:(id)a3 query:(const char *)a4;
- (void)appendObjectWrappers:(id)a3;
- (void)commitErrorCountsForObjectWrappers:(id)a3;
- (void)commitObjectsWrappers:(id)a3;
- (void)dealloc;
- (void)removeAllObjectWrappersFromQueue;
- (void)removeObjectWrappersFromQueue:(id)a3;
@end

@implementation MSObjectQueue

- (void)commitObjectsWrappers:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = [v4 count];
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Updating objects for %ld items.", buf, 0xCu);
  }
  v5 = [(MSObjectQueue *)self _statementLabel:@"commitObjectWrappers", "update or ignore Queue set size = ?, object = ?, errorCount = ? where rowid = ?;" query];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    v10 = MEMORY[0x1E4F14500];
    id v31 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E019E3B0]();
        int v14 = sqlite3_reset(v5);
        if (v14)
        {
          int v15 = v14;
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_32;
          }
LABEL_13:
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v15;
          _os_log_error_impl(&dword_1DC434000, v10, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
          goto LABEL_32;
        }
        int v16 = sqlite3_bind_int64(v5, 1, [v12 size]);
        if (v16)
        {
          int v15 = v16;
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_32;
          }
          goto LABEL_13;
        }
        v17 = (void *)MEMORY[0x1E4F28DB0];
        v18 = [v12 object];
        id v33 = 0;
        v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v33];
        id v32 = v33;

        if (!v19)
        {
          v20 = NSString;
          v21 = [v32 userInfo];
          v22 = [v20 stringWithFormat:@"Failed to archive an MSObjectWrapper object. Error: %@ Info: %@", v32, v21];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v40 = (uint64_t)v22;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }
        unint64_t v23 = [v19 length];
        if (v23 >> 31) {
          __assert_rtn("-[MSObjectQueue commitObjectsWrappers:]", "MSObjectQueue.m", 429, "objectDataLength <= INT_MAX");
        }
        int v24 = v23;
        id v25 = v19;
        int v26 = sqlite3_bind_blob(v5, 2, (const void *)[v25 bytes], v24, 0);
        if (v26)
        {
          int v27 = v26;
          v10 = MEMORY[0x1E4F14500];
          id v6 = v31;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_30;
          }
        }
        else
        {
          int v28 = sqlite3_bind_int(v5, 3, [v12 errorCount]);
          id v6 = v31;
          if (v28)
          {
            int v27 = v28;
            v10 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_30;
            }
          }
          else
          {
            int v29 = sqlite3_bind_int64(v5, 4, [v12 uniqueID]);
            v10 = MEMORY[0x1E4F14500];
            if (!v29)
            {
              int v30 = sqlite3_step(v5);
              if (v30 == 101) {
                goto LABEL_31;
              }
              int v27 = v30;
              if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                goto LABEL_31;
              }
LABEL_30:
              *(_DWORD *)buf = 67109120;
              LODWORD(v40) = v27;
              _os_log_error_impl(&dword_1DC434000, v10, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
              goto LABEL_31;
            }
            int v27 = v29;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_30;
            }
          }
        }
LABEL_31:

LABEL_32:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }

  sqlite3_reset(v5);
}

- (void)commitErrorCountsForObjectWrappers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = [v4 count];
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Commiting error counts for %ld items.", buf, 0xCu);
  }
  v5 = [(MSObjectQueue *)self _statementLabel:@"commitErrorCountsForObjectWrappers" query:"update or ignore Queue set errorCount = ? where rowid = ?;"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v7) {
    goto LABEL_24;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      int v12 = sqlite3_reset(v5);
      if (v12)
      {
        int v16 = v12;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v16;
        v17 = MEMORY[0x1E4F14500];
LABEL_23:
        _os_log_error_impl(&dword_1DC434000, v17, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
        goto LABEL_24;
      }
      int v13 = sqlite3_bind_int(v5, 1, objc_msgSend(v11, "errorCount", (void)v21));
      if (v13)
      {
        int v18 = v13;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v18;
        v17 = MEMORY[0x1E4F14500];
        goto LABEL_23;
      }
      int v14 = sqlite3_bind_int64(v5, 2, [v11 uniqueID]);
      if (v14)
      {
        int v19 = v14;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v19;
        v17 = MEMORY[0x1E4F14500];
        goto LABEL_23;
      }
      int v15 = sqlite3_step(v5);
      if (v15 != 101)
      {
        int v20 = v15;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v20;
        v17 = MEMORY[0x1E4F14500];
        goto LABEL_23;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_24:

  sqlite3_reset(v5);
}

- (void)removeAllObjectWrappersFromQueue
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6[0]) = 0;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Removing all entries from the queue.", (uint8_t *)v6, 2u);
  }
  v3 = [(MSObjectQueue *)self _statementLabel:@"removeAllObjectWrappersFromQueue" query:"delete from Queue;"];
  int v4 = sqlite3_step(v3);
  if (v4 != 101)
  {
    int v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)v6, 8u);
    }
  }
  sqlite3_reset(v3);
}

- (void)removeObjectWrappersFromQueue:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = [v4 count];
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Removing %ld entries from the queue.", buf, 0xCu);
  }
  int v5 = [(MSObjectQueue *)self _statementLabel:@"removeObjectWrappersFromQueue" query:"delete from Queue where rowid = ?;"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      int v12 = sqlite3_reset(v5);
      if (v12)
      {
        int v15 = v12;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v15;
        int v16 = MEMORY[0x1E4F14500];
LABEL_21:
        _os_log_error_impl(&dword_1DC434000, v16, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
        goto LABEL_19;
      }
      int v13 = sqlite3_bind_int64(v5, 1, objc_msgSend(v11, "uniqueID", (void)v19));
      if (v13)
      {
        int v17 = v13;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v17;
        int v16 = MEMORY[0x1E4F14500];
        goto LABEL_21;
      }
      int v14 = sqlite3_step(v5);
      if (v14 != 101)
      {
        int v18 = v14;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v18;
        int v16 = MEMORY[0x1E4F14500];
        goto LABEL_21;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_19:

  sqlite3_reset(v5);
}

- (id)allObjectWrappersOrderedByDescendingErrorCountMaxCount:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    int64_t v19 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue ordered by errorCount.", (uint8_t *)&v18, 0xCu);
  }
  int v5 = [(MSObjectQueue *)self _statementLabel:@"allObjectsWrapperOrderedByDescendingErrorCountMaxCount", "select rowid, size, errorCount, object from Queue order by errorCount desc limit ?;" query];
  int v6 = sqlite3_reset(v5);
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v7;
      uint64_t v8 = MEMORY[0x1E4F14500];
LABEL_24:
      _os_log_error_impl(&dword_1DC434000, v8, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)&v18, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v9 = sqlite3_bind_int64(v5, 1, a3);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v10;
      uint64_t v8 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
LABEL_8:
    id v11 = 0;
    goto LABEL_9;
  }
  int v13 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v14 = sqlite3_step(v5);
    if (v14 != 100) {
      break;
    }
    int v15 = [(MSObjectQueue *)self _objectWrapperFromQueueQuery:v5 outSize:0];
    [v13 addObject:v15];
  }
  int v16 = v14;
  if (v14 == 101)
  {
    sqlite3_reset(v5);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v13 count];
      int v18 = 134217984;
      int64_t v19 = v17;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", (uint8_t *)&v18, 0xCu);
    }
    id v11 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v16;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", (uint8_t *)&v18, 8u);
    }
    sqlite3_reset(v5);
    id v11 = 0;
  }

LABEL_9:
  return v11;
}

- (id)smallestObjectWrappersTargetTotalSize:(int64_t)a3 maxCount:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long v23 = 134218240;
    *(void *)&v23[4] = a4;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue, target size: %lld bytes.", v23, 0x16u);
  }
  int v7 = [(MSObjectQueue *)self _statementLabel:@"smallestObjectReferencesTargetTotalSize", "select rowid, size, errorCount, object from Queue where size != 0 order by size asc limit ?;" query];
  int v8 = sqlite3_reset(v7);
  if (v8)
  {
    int v9 = v8;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v23 = 67109120;
      *(_DWORD *)&v23[4] = v9;
      int v10 = MEMORY[0x1E4F14500];
LABEL_30:
      _os_log_error_impl(&dword_1DC434000, v10, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", v23, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v11 = sqlite3_bind_int64(v7, 1, a4);
  if (v11)
  {
    int v12 = v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v23 = 67109120;
      *(_DWORD *)&v23[4] = v12;
      int v10 = MEMORY[0x1E4F14500];
      goto LABEL_30;
    }
LABEL_8:
    id v13 = 0;
    goto LABEL_9;
  }
  int v15 = [MEMORY[0x1E4F1CA48] array];
  if ([v15 count] >= (unint64_t)a4 || a3 < 1) {
    goto LABEL_22;
  }
  int64_t v17 = 0;
  while (1)
  {
    int v18 = sqlite3_step(v7);
    if (v18 != 100) {
      break;
    }
    *(void *)long long v23 = 0;
    int64_t v19 = [(MSObjectQueue *)self _objectWrapperFromQueueQuery:v7 outSize:v23];
    [v15 addObject:v19];

    uint64_t v20 = *(void *)v23;
    if ([v15 count] < (unint64_t)a4)
    {
      v17 += v20;
      if (v17 < a3) {
        continue;
      }
    }
    goto LABEL_22;
  }
  int v21 = v18;
  if (v18 == 101)
  {
LABEL_22:
    sqlite3_reset(v7);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = [v15 count];
      *(_DWORD *)long long v23 = 134217984;
      *(void *)&v23[4] = v22;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", v23, 0xCu);
    }
    id v13 = v15;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v23 = 67109120;
      *(_DWORD *)&v23[4] = v21;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", v23, 8u);
    }
    sqlite3_reset(v7);
    id v13 = 0;
  }

LABEL_9:
  return v13;
}

- (id)objectWrappersWithZeroSizeMaxCount:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    int64_t v19 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue with zero size.", (uint8_t *)&v18, 0xCu);
  }
  int v5 = [(MSObjectQueue *)self _statementLabel:@"objectWrappersWithZeroSizeMaxCount", "select rowid, size, errorCount, object from Queue where size = 0 limit ?;" query];
  int v6 = sqlite3_reset(v5);
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v7;
      int v8 = MEMORY[0x1E4F14500];
LABEL_24:
      _os_log_error_impl(&dword_1DC434000, v8, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)&v18, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v9 = sqlite3_bind_int64(v5, 1, a3);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v10;
      int v8 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
LABEL_8:
    id v11 = 0;
    goto LABEL_9;
  }
  id v13 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v14 = sqlite3_step(v5);
    if (v14 != 100) {
      break;
    }
    int v15 = [(MSObjectQueue *)self _objectWrapperFromQueueQuery:v5 outSize:0];
    [v13 addObject:v15];
  }
  int v16 = v14;
  if (v14 == 101)
  {
    sqlite3_reset(v5);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v13 count];
      int v18 = 134217984;
      int64_t v19 = v17;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", (uint8_t *)&v18, 0xCu);
    }
    id v11 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v16;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", (uint8_t *)&v18, 8u);
    }
    sqlite3_reset(v5);
    id v11 = 0;
  }

LABEL_9:
  return v11;
}

- (id)allObjectWrappersMaxCount:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    int64_t v19 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Retrieving up to %lld items from queue.", (uint8_t *)&v18, 0xCu);
  }
  int v5 = [(MSObjectQueue *)self _statementLabel:@"allObjectWrappersMaxCount", "select rowid, size, errorCount, object from Queue limit ?;" query];
  int v6 = sqlite3_reset(v5);
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v7;
      int v8 = MEMORY[0x1E4F14500];
LABEL_24:
      _os_log_error_impl(&dword_1DC434000, v8, OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", (uint8_t *)&v18, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v9 = sqlite3_bind_int64(v5, 1, a3);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v10;
      int v8 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
LABEL_8:
    id v11 = 0;
    goto LABEL_9;
  }
  id v13 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v14 = sqlite3_step(v5);
    if (v14 != 100) {
      break;
    }
    int v15 = [(MSObjectQueue *)self _objectWrapperFromQueueQuery:v5 outSize:0];
    [v13 addObject:v15];
  }
  int v16 = v14;
  if (v14 == 101)
  {
    sqlite3_reset(v5);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v13 count];
      int v18 = 134217984;
      int64_t v19 = v17;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Fetched %ld objects from the queue.", (uint8_t *)&v18, 0xCu);
    }
    id v11 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109120;
      LODWORD(v19) = v16;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "sqlite error while fetching objects from the queue. Status: %d", (uint8_t *)&v18, 8u);
    }
    sqlite3_reset(v5);
    id v11 = 0;
  }

LABEL_9:
  return v11;
}

- (id)_objectWrapperFromQueueQuery:(sqlite3_stmt *)a3 outSize:(int64_t *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v6 = sqlite3_column_int64(a3, 0);
  sqlite3_int64 v7 = sqlite3_column_int64(a3, 1);
  uint64_t v8 = sqlite3_column_int(a3, 2);
  int v9 = sqlite3_column_blob(a3, 3);
  int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", v9, sqlite3_column_bytes(a3, 3), 0);
  id v15 = 0;
  id v11 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v10 outError:&v15];
  id v12 = v15;
  if (!v12 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)buf = 138543362;
  id v17 = v12;
  _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to unarchive object. Error: %{public}@", buf, 0xCu);
  if (a4) {
LABEL_4:
  }
    *a4 = v7;
LABEL_5:
  id v13 = +[MSObjectWrapper wrapperWithObject:v11 size:v7];
  [v13 setUniqueID:v6];
  [v13 setErrorCount:v8];

  return v13;
}

- (void)appendObjectWrappers:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v30 = self;
  int v5 = [(MSObjectQueue *)self _statementLabel:@"appendObjectWrappers" query:"insert into Queue (size, object) values (?, ?);"];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    unint64_t v9 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1E019E3B0]();
        id v13 = *(void **)(v9 + 3504);
        int v14 = [v11 object];
        id v33 = 0;
        id v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v33];
        id v16 = v33;

        if (!v15)
        {
          id v32 = v12;
          id v17 = v5;
          uint64_t v18 = v7;
          uint64_t v19 = v8;
          unint64_t v20 = v9;
          int v21 = NSString;
          uint64_t v22 = [v16 userInfo];
          long long v23 = [v21 stringWithFormat:@"Failed to archive an MSObjectWrapper object. Error: %@ Info: %@", v16, v22];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v23;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

          unint64_t v9 = v20;
          uint64_t v8 = v19;
          uint64_t v7 = v18;
          int v5 = v17;
          id v12 = v32;
        }
        int v24 = sqlite3_reset(v5);
        if (v24)
        {
          int v25 = v24;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
LABEL_23:
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = v25;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "SQL operation failed with code %d", buf, 8u);
          goto LABEL_24;
        }
        int v26 = sqlite3_bind_int64(v5, 1, [v11 size]);
        if (v26)
        {
          int v25 = v26;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        unint64_t v27 = [v15 length];
        if (v27 >> 31) {
          __assert_rtn("-[MSObjectQueue appendObjectWrappers:]", "MSObjectQueue.m", 175, "objectDataLength <= INT_MAX");
        }
        int v28 = sqlite3_bind_blob(v5, 2, (const void *)[v15 bytes], v27, 0);
        if (v28)
        {
          int v25 = v28;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        int v29 = sqlite3_step(v5);
        if (v29 == 101)
        {
          [v11 setUniqueID:sqlite3_last_insert_rowid(v30->_db)];
          goto LABEL_24;
        }
        int v25 = v29;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
LABEL_24:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  sqlite3_reset(v5);
}

- (int64_t)count
{
  v2 = [(MSObjectQueue *)self _statementLabel:@"count" query:"select count(*) from Queue;"];
  if (sqlite3_step(v2) == 100)
  {
    sqlite3_int64 v3 = sqlite3_column_int64(v2, 0);
    if (!v2) {
      return v3;
    }
    goto LABEL_5;
  }
  sqlite3_int64 v3 = 0;
  if (v2) {
LABEL_5:
  }
    sqlite3_reset(v2);
  return v3;
}

- (sqlite3_stmt)_statementLabel:(id)a3 query:(const char *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (CFDictionaryContainsKey(self->_statements, v6))
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_statements, v6);
  }
  else
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(self->_db, a4, -1, &ppStmt, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        id v11 = a4;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not compile SQL query: %{public}s", buf, 0xCu);
      }
      __assert_rtn("-[MSObjectQueue _statementLabel:query:]", "MSObjectQueue.m", 141, "0");
    }
    CFDictionarySetValue(self->_statements, v6, ppStmt);
    Value = ppStmt;
  }

  return Value;
}

- (void)dealloc
{
  statements = self->_statements;
  if (statements)
  {
    CFIndex Count = CFDictionaryGetCount(statements);
    if (Count)
    {
      uint64_t v5 = Count;
      size_t v6 = 8 * Count;
      uint64_t v7 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      uint64_t v8 = (const void **)malloc_type_malloc(v6, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(self->_statements, v7, v8);
      if (v5 >= 1)
      {
        unint64_t v9 = (sqlite3_stmt **)v8;
        do
        {
          int v10 = *v9++;
          sqlite3_finalize(v10);
          --v5;
        }
        while (v5);
      }
      free(v7);
      free(v8);
    }
    CFRelease(self->_statements);
  }
  sqlite3_close(self->_db);
  v11.receiver = self;
  v11.super_class = (Class)MSObjectQueue;
  [(MSObjectQueue *)&v11 dealloc];
}

- (MSObjectQueue)initWithPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MSObjectQueue;
  ppStmt = 0;
  uint64_t v5 = [(MSObjectQueue *)&v24 init];
  if (!v5) {
    goto LABEL_19;
  }
  size_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [v4 stringByDeletingLastPathComponent];
  [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

  id v8 = v4;
  p_db = &v5->_db;
  if (!sqlite3_open((const char *)[v8 fileSystemRepresentation], &v5->_db))
  {
    long long v23 = 0;
    if (sqlite3_exec(*p_db, "pragma journal_mode = wal;", 0, 0, (char **)&v23)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v27 = v5;
      __int16 v28 = 2082;
      int v29 = v23;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not set journal mode. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (sqlite3_exec(*p_db, "create table if not exists Properties(\n   key             text primary key,\n   value           text\n);\n"
           "create table if not exists Queue (\n"
           "   size            integer,\n"
           "   object          blob,\n"
           "   errorCount      integer\n"
           ");\n"
           "create index if not exists QueueBySize on Queue (size asc);\n",
           0,
           0,
           (char **)&v23))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        sqlite3_free(v23);
LABEL_13:
        char v12 = 1;
LABEL_14:
        if (ppStmt) {
          sqlite3_finalize(ppStmt);
        }
        if (v12) {
          goto LABEL_17;
        }
        v5->_statements = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], &initWithPath__doNothingCallbacks);
LABEL_19:
        id v13 = v5;
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446210;
      unint64_t v27 = v23;
      id v17 = MEMORY[0x1E4F14500];
      uint64_t v18 = "Could not create tables. Error: %{public}s";
LABEL_34:
      _os_log_error_impl(&dword_1DC434000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
      goto LABEL_10;
    }
    int v10 = sqlite3_prepare_v2(*p_db, "select value from Properties where key = 'version';", -1, &ppStmt, 0);
    if (v10)
    {
      int v11 = v10;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v11;
      unint64_t v20 = MEMORY[0x1E4F14500];
      int v21 = "SQL operation failed with code %d";
      goto LABEL_37;
    }
    int v15 = sqlite3_step(ppStmt);
    if (v15 == 100)
    {
      uint64_t v19 = sqlite3_column_text(ppStmt, 0);
      if (strcmp((const char *)v19, "0"))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136446210;
        unint64_t v27 = (void *)v19;
        unint64_t v20 = MEMORY[0x1E4F14500];
        int v21 = "Wrong database version. Expected 0. Actual: %{public}s";
        uint32_t v22 = 12;
LABEL_38:
        _os_log_error_impl(&dword_1DC434000, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
        goto LABEL_13;
      }
    }
    else
    {
      int v16 = v15;
      if (v15 != 101)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v16;
        unint64_t v20 = MEMORY[0x1E4F14500];
        int v21 = "Could not retrieve database version. SQLITE error: %d";
LABEL_37:
        uint32_t v22 = 8;
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Setting version number in queue database", buf, 2u);
      }
      if (sqlite3_exec(*p_db, "insert or replace into Properties (key, value) values ('version', '0');",
             0,
             0,
             (char **)&v23))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        *(_DWORD *)buf = 136446210;
        unint64_t v27 = v23;
        id v17 = MEMORY[0x1E4F14500];
        uint64_t v18 = "Could not update version number. Error: %{public}s";
        goto LABEL_34;
      }
    }
    char v12 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v27 = v8;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not create sqlite3 object queue at path %@", buf, 0xCu);
  }
LABEL_17:
  id v13 = 0;
LABEL_20:

  return v13;
}

@end