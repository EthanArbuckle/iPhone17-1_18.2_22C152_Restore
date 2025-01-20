@interface HDIDSPersistentDictionary
- (BOOL)_reallyOpenDB;
- (HDIDSPersistentDictionary)initWithURL:(id)a3 objectClass:(Class)a4;
- (id)_objectFromData:(uint64_t)a1;
- (id)messageIDsForPendingOutgoingMessagesWithType:(int)a3 deviceID:(id)a4;
- (id)objectForKey:(id)a3;
- (uint64_t)_openDB;
- (void)_handleError:(void *)a3 format:(uint64_t)a4;
- (void)_obliterateWithReason:(uint64_t)a3 preserveCopy:(int)a4 generateStackshot:;
- (void)_recordMappingOfRequest:(void *)a3 toResponse:;
- (void)_recordMessage:(void *)a3 deviceID:(int)a4 type:(int)a5 outgoing:(int)a6 request:(uint64_t)a7 length:;
- (void)dealloc;
- (void)didCancel:(id)a3;
- (void)didFinishSending:(id)a3;
- (void)didReceiveError:(id)a3 forMessageID:(id)a4;
- (void)didReceiveRequest:(id)a3 deviceID:(id)a4 type:(int)a5 length:(int64_t)a6;
- (void)didReceiveResponse:(id)a3 toRequest:(id)a4 deviceID:(id)a5 type:(int)a6 length:(int64_t)a7;
- (void)didSendRequest:(id)a3 deviceID:(id)a4 type:(int)a5 length:(int64_t)a6;
- (void)didSendResponse:(id)a3 toRequest:(id)a4 deviceID:(id)a5 type:(int)a6 length:(int64_t)a7;
- (void)enumerateObjectsSortedByExpirationDate:(id)a3;
- (void)invalidate;
- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 expires:(double)a5;
@end

@implementation HDIDSPersistentDictionary

- (void)didSendRequest:(id)a3 deviceID:(id)a4 type:(int)a5 length:(int64_t)a6
{
}

- (void)_recordMessage:(void *)a3 deviceID:(int)a4 type:(int)a5 outgoing:(int)a6 request:(uint64_t)a7 length:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  if (a1)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219522;
      CFAbsoluteTime v45 = Current;
      __int16 v46 = 2112;
      id v47 = v13;
      __int16 v48 = 2112;
      id v49 = v14;
      __int16 v50 = 1024;
      int v51 = a4;
      __int16 v52 = 1024;
      int v53 = a5;
      __int16 v54 = 1024;
      int v55 = a6;
      __int16 v56 = 2048;
      uint64_t v57 = a7;
      _os_log_debug_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) message='%@' deviceID:'%@' type=%d outgoing=%d request=%d length=%lld", buf, 0x3Cu);
    }
    v17 = *(void **)(a1 + 24);
    id v43 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke;
    v35[3] = &unk_1E62FB8B0;
    id v36 = v13;
    int v40 = a4;
    CFAbsoluteTime v38 = Current;
    char v41 = a5;
    char v42 = a6;
    uint64_t v39 = a7;
    id v37 = v14;
    char v18 = [v17 executeSQL:@"INSERT OR IGNORE INTO message_records (uuid, type, timestamp, outgoing, is_request, length, device_id) VALUES (?, ?, ?, ?, ?, ?, ?)", &v43, v35, 0 error bindingHandler enumerationHandler];
    id v24 = v43;
    if ((v18 & 1) == 0) {
      [(HDIDSPersistentDictionary *)a1 _handleError:@"failed to record message event", v19, v20, v21, v22, v23, v33[0] format];
    }
    v25 = *(void **)(a1 + 24);
    id v34 = v24;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = (uint64_t)__82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke_2;
    v33[3] = (uint64_t)&__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    *(CFAbsoluteTime *)&v33[4] = Current;
    char v26 = [v25 executeSQL:@"DELETE FROM message_records WHERE timestamp < ?" error:&v34 bindingHandler:v33 enumerationHandler:0];
    id v27 = v34;

    if ((v26 & 1) == 0) {
      [(HDIDSPersistentDictionary *)a1 _handleError:@"failed to prune message event database", v28, v29, v30, v31, v32, v33[0] format];
    }
  }
}

uint64_t __82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 64));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  sqlite3_bind_int(a2, 4, *(unsigned __int8 *)(a1 + 68));
  sqlite3_bind_int(a2, 5, *(unsigned __int8 *)(a1 + 69));
  sqlite3_bind_int64(a2, 6, *(void *)(a1 + 56));

  return HDSQLiteBindFoundationValueToStatement();
}

- (void)setObject:(id)a3 forKey:(id)a4 expires:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDIDSPersistentDictionary.m", 194, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"HDIDSPersistentDictionary.m", 195, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  database = self->_database;
  id v29 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__HDIDSPersistentDictionary_setObject_forKey_expires___block_invoke;
  v24[3] = &unk_1E62F4098;
  id v13 = v11;
  double v28 = a5;
  id v25 = v13;
  char v26 = self;
  id v14 = v9;
  id v27 = v14;
  char v15 = [(HDSQLiteDatabase *)database executeSQL:@"INSERT OR REPLACE INTO key_value_store (key, expiration, value) VALUES (?, ?, ?)" error:&v29 bindingHandler:v24 enumerationHandler:0];
  id v21 = v29;
  if ((v15 & 1) == 0) {
    [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to store value for key '%@'", v16, v17, v18, v19, v20, (uint64_t)v13 format];
  }
}

void __54__HDIDSPersistentDictionary_setObject_forKey_expires___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 56));
  if (*(void *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 48);
    v5 = (objc_class *)MEMORY[0x1E4F28DB0];
    id v6 = v4;
    v7 = (void *)[[v5 alloc] initRequiringSecureCoding:1];
    [v6 encodeWithCoder:v7];

    id v8 = [v7 encodedData];
  }
  else
  {
    id v8 = 0;
  }
  HDSQLiteBindFoundationValueToStatement();
}

- (id)objectForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDIDSPersistentDictionary.m", 212, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__62;
  char v26 = __Block_byref_object_dispose__62;
  id v27 = 0;
  database = self->_database;
  id v21 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__HDIDSPersistentDictionary_objectForKey___block_invoke;
  v19[3] = &unk_1E62F43C8;
  id v7 = v5;
  id v20 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__HDIDSPersistentDictionary_objectForKey___block_invoke_2;
  v18[3] = &unk_1E62F3640;
  v18[4] = &v22;
  char v8 = [(HDSQLiteDatabase *)database executeSQL:@"SELECT value FROM key_value_store WHERE key = ?" error:&v21 bindingHandler:v19 enumerationHandler:v18];
  id v14 = v21;
  if ((v8 & 1) == 0) {
    [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to lookup value for key '%@'", v9, v10, v11, v12, v13, (uint64_t)v7 format];
  }
  char v15 = -[HDIDSPersistentDictionary _objectFromData:]((uint64_t)self, (void *)v23[5]);

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __42__HDIDSPersistentDictionary_objectForKey___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (id)_objectFromData:(uint64_t)a1
{
  v2 = 0;
  if (a1 && a2)
  {
    v4 = (objc_class *)MEMORY[0x1E4F28DC0];
    id v5 = a2;
    id v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:0];

    v2 = (void *)[objc_alloc(*(Class *)(a1 + 8)) initWithCoder:v6];
    [v6 finishDecoding];
  }

  return v2;
}

- (void)didFinishSending:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    CFAbsoluteTime v22 = Current;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) sent message='%@'", buf, 0x16u);
  }
  database = self->_database;
  id v20 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__HDIDSPersistentDictionary_didFinishSending___block_invoke;
  v17[3] = &unk_1E62F33F8;
  CFAbsoluteTime v19 = Current;
  id v8 = v4;
  id v18 = v8;
  char v9 = [(HDSQLiteDatabase *)database executeSQL:@"UPDATE message_records SET send_timestamp=? WHERE uuid=?" error:&v20 bindingHandler:v17 enumerationHandler:0];
  id v15 = v20;
  if ((v9 & 1) == 0) {
    [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to record message sent", v10, v11, v12, v13, v14, v16 format];
  }
}

uint64_t __46__HDIDSPersistentDictionary_didFinishSending___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_double(a2, 1, *(double *)(a1 + 40));

  return HDSQLiteBindFoundationValueToStatement();
}

- (void)didReceiveResponse:(id)a3 toRequest:(id)a4 deviceID:(id)a5 type:(int)a6 length:(int64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  -[HDIDSPersistentDictionary _recordMessage:deviceID:type:outgoing:request:length:]((uint64_t)self, v13, a5, a6, 0, 0, a7);
  -[HDIDSPersistentDictionary _recordMappingOfRequest:toResponse:]((uint64_t)self, v12, v13);
}

- (void)_recordMappingOfRequest:(void *)a3 toResponse:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      CFAbsoluteTime v23 = Current;
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_debug_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) request='%@' response='%@'", buf, 0x20u);
    }
    char v9 = *(void **)(a1 + 24);
    id v21 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__HDIDSPersistentDictionary__recordMappingOfRequest_toResponse___block_invoke;
    v18[3] = &unk_1E62F2900;
    id v19 = v5;
    id v20 = v6;
    char v10 = [v9 executeSQL:@"INSERT INTO request_response_mappings (request, response) VALUES (?, ?)", &v21, v18, 0 error bindingHandler enumerationHandler];
    id v16 = v21;
    if ((v10 & 1) == 0) {
      [(HDIDSPersistentDictionary *)a1 _handleError:@"failed to record message response mapping", v11, v12, v13, v14, v15, v17 format];
    }
  }
}

uint64_t __64__HDIDSPersistentDictionary__recordMappingOfRequest_toResponse___block_invoke()
{
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

- (void)removeObjectForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDIDSPersistentDictionary.m", 233, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  database = self->_database;
  id v18 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__HDIDSPersistentDictionary_removeObjectForKey___block_invoke;
  v16[3] = &unk_1E62F43C8;
  id v7 = v5;
  id v17 = v7;
  char v8 = [(HDSQLiteDatabase *)database executeSQL:@"DELETE FROM key_value_store WHERE key = ?" error:&v18 bindingHandler:v16 enumerationHandler:0];
  id v14 = v18;
  if ((v8 & 1) == 0) {
    [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to delete value for key '%@'", v9, v10, v11, v12, v13, (uint64_t)v7 format];
  }
}

uint64_t __48__HDIDSPersistentDictionary_removeObjectForKey___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (void)didReceiveRequest:(id)a3 deviceID:(id)a4 type:(int)a5 length:(int64_t)a6
{
}

- (HDIDSPersistentDictionary)initWithURL:(id)a3 objectClass:(Class)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDIDSPersistentDictionary.m", 39, @"Invalid parameter not satisfying: %@", @"databaseURL" object file lineNumber description];
  }
  if (([(objc_class *)a4 supportsSecureCoding] & 1) == 0)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDIDSPersistentDictionary.m", 40, @"Invalid parameter not satisfying: %@", @"[objectClass supportsSecureCoding]" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)HDIDSPersistentDictionary;
  uint64_t v9 = [(HDIDSPersistentDictionary *)&v26 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseURL, a3);
    v10->_objectClass = a4;
    if ((-[HDIDSPersistentDictionary _openDB]((uint64_t)v10) & 1) == 0)
    {
      database = v10->_database;
      v10->_database = 0;

      -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:]((uint64_t)v10, @"Failed to open database", 0, 1);
    }
    uint64_t v22 = 0;
    CFAbsoluteTime v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v12 = v10->_database;
    v20[4] = &v22;
    id v21 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__HDIDSPersistentDictionary_initWithURL_objectClass___block_invoke;
    v20[3] = &unk_1E62FB860;
    int v13 = [(HDSQLiteDatabase *)v12 performIntegrityCheckOnDatabase:@"main" error:&v21 integrityErrorHandler:v20];
    id v14 = v21;
    if (v13)
    {
      if (*((unsigned char *)v23 + 24))
      {
        [(HDSQLiteDatabase *)v10->_database close];
        uint64_t v15 = v10->_database;
        v10->_database = 0;

        -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:]((uint64_t)v10, @"Found integrity issues in IDS message database.", 0, 1);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v16 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v14;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "Failed to check IDS message database integrity: %{public}@", buf, 0xCu);
      }
    }
    if (!v10->_database)
    {

      uint64_t v10 = 0;
    }
    _Block_object_dispose(&v22, 8);
  }
  return v10;
}

- (uint64_t)_openDB
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v3 = [*(id *)(a1 + 16) URLByDeletingLastPathComponent];
  id v28 = 0;
  char v4 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v28];
  id v5 = v28;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      CFAbsoluteTime v23 = v6;
      uint64_t v24 = [v3 absoluteString];
      *(_DWORD *)buf = 138543618;
      id v35 = v24;
      __int16 v36 = 2114;
      id v37 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "failed to create directory '%{public}@': %{public}@", buf, 0x16u);
    }
  }
  if (!-[HDIDSPersistentDictionary _reallyOpenDB](a1)) {
    goto LABEL_31;
  }
  id v7 = *(void **)(a1 + 24);
  id v27 = v5;
  uint64_t v8 = [v7 userVersionWithDatabaseName:0 error:&v27];
  id v9 = v27;

  if (v8 != 3)
  {
    if (v8 < 1)
    {
      if (v8 < 0)
      {
        _HKInitializeLogging();
        uint64_t v12 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v9;
          _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Failed to look up existing schema version for IDS persistent database: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 24) close];
      uint64_t v10 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Re-creating IDS persistent database with version %ld", v8);
      -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:](a1, v11, 0, 0);

      if (!-[HDIDSPersistentDictionary _reallyOpenDB](a1))
      {
        unsigned __int8 v29 = 0;
        goto LABEL_7;
      }
    }
    id v26 = v9;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v13 = [&unk_1F17E9528 countByEnumeratingWithState:&v30 objects:buf count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(&unk_1F17E9528);
          }
          if (![*(id *)(a1 + 24) executeUncachedSQL:*(void *)(*((void *)&v30 + 1) + 8 * v16) error:&v26 bindingHandler:0 enumerationHandler:0])
          {
            char v17 = 0;
            goto LABEL_24;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [&unk_1F17E9528 countByEnumeratingWithState:&v30 objects:buf count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    char v17 = 1;
LABEL_24:
    id v5 = v26;

    if (v17)
    {
      id v18 = *(void **)(a1 + 24);
      id v25 = v5;
      char v19 = [v18 setUserVersion:3 withDatabaseName:0 error:&v25];
      id v9 = v25;

      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        id v20 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v9;
          _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to update schema version for IDS persistent database: %{public}@", buf, 0xCu);
        }
      }
      goto LABEL_6;
    }
    _HKInitializeLogging();
    id v21 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "failed to create schema: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 24) close];
LABEL_31:
    unsigned __int8 v29 = 0;
    goto LABEL_32;
  }
LABEL_6:
  unsigned __int8 v29 = 1;
LABEL_7:
  id v5 = v9;
LABEL_32:

  return v29;
}

- (BOOL)_reallyOpenDB
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 24))
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel__reallyOpenDB, a1, @"HDIDSPersistentDictionary.m", 154, @"Invalid parameter not satisfying: %@", @"_database == nil" object file lineNumber description];
  }
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F65D18]) initWithDatabaseURL:*(void *)(a1 + 16)];
  v3 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v2;

  char v4 = *(void **)(a1 + 24);
  id v10 = 0;
  int v5 = [v4 openWithError:&v10];
  id v6 = v10;
  if (v5)
  {
    [*(id *)(a1 + 24) close];
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v12 = v5;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_fault_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_FAULT, "Failed to create database for IDS persistent storage (%d): %{public}@", buf, 0x12u);
    }
  }

  return v5 == 0;
}

- (void)enumerateObjectsSortedByExpirationDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = @"iterator";
    [v15 handleFailureInMethod:a2 object:self file:@"HDIDSPersistentDictionary.m" lineNumber:257 description:@"Invalid parameter not satisfying: %@"];
  }
  database = self->_database;
  id v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__HDIDSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke;
  v17[3] = &unk_1E62FB888;
  id v7 = v5;
  void v17[4] = self;
  id v18 = v7;
  char v8 = [(HDSQLiteDatabase *)database executeSQL:@"SELECT key, value, expiration FROM key_value_store ORDER BY expiration ASC" error:&v19 bindingHandler:0 enumerationHandler:v17];
  id v14 = v19;
  if ((v8 & 1) == 0) {
    [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to iterate over all keys and values", v9, v10, v11, v12, v13, (uint64_t)v16 format];
  }
}

- (void)didSendResponse:(id)a3 toRequest:(id)a4 deviceID:(id)a5 type:(int)a6 length:(int64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  -[HDIDSPersistentDictionary _recordMessage:deviceID:type:outgoing:request:length:]((uint64_t)self, v13, a5, a6, 1, 0, a7);
  -[HDIDSPersistentDictionary _recordMappingOfRequest:toResponse:]((uint64_t)self, v12, v13);
}

- (void)_obliterateWithReason:(uint64_t)a3 preserveCopy:(int)a4 generateStackshot:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  int v8 = _HDIsUnitTesting;
  _HKInitializeLogging();
  uint64_t v9 = (void *)*MEMORY[0x1E4F29FA8];
  uint64_t v10 = *MEMORY[0x1E4F29FA8];
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = a4 == 0;
  }
  if (v11)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    id v12 = *(void **)(a1 + 16);
    id v13 = v9;
    id v14 = [v12 absoluteString];
    *(_DWORD *)buf = 138543618;
    id v21 = v14;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Obliterating NanoSync persistent dictionary at \"%{public}@\": %{public}@", buf, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    id v18 = *(void **)(a1 + 16);
    id v13 = v9;
    id v14 = [v18 absoluteString];
    *(_DWORD *)buf = 138543618;
    id v21 = v14;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "Obliterating NanoSync persistent dictionary at \"%{public}@\": %{public}@", buf, 0x16u);
  }

LABEL_11:
  uint64_t v16 = *(void **)(a1 + 24);
  if (v16 && [v16 isOpen])
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__obliterateWithReason_preserveCopy_generateStackshot_, a1, @"HDIDSPersistentDictionary.m", 99, @"Invalid parameter not satisfying: %@", @"(_database == nil) || ([_database isOpen] == NO)" object file lineNumber description];
  }
  char v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v17, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", *(void *)(a1 + 16), a3);

LABEL_15:
}

void __53__HDIDSPersistentDictionary_initWithURL_objectClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  char v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Found integrity issues in IDS message database: %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (void)dealloc
{
  [(HDIDSPersistentDictionary *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDIDSPersistentDictionary;
  [(HDIDSPersistentDictionary *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4
{
}

- (void)_handleError:(void *)a3 format:(uint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = v11;
  if (a1 && v11)
  {
    id v13 = (objc_class *)NSString;
    id v14 = a3;
    uint64_t v15 = (void *)[[v13 alloc] initWithFormat:v14 arguments:&a9];

    _HKInitializeLogging();
    uint64_t v16 = (os_log_t *)MEMORY[0x1E4F29FA8];
    char v17 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v15;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v12, "hd_isDatabaseCorruptionError"))
    {
      [*(id *)(a1 + 24) close];
      id v18 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:](a1, @"Corrupt database", 0, 1);
      if ((-[HDIDSPersistentDictionary _openDB](a1) & 1) == 0)
      {
        _HKInitializeLogging();
        id v19 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "failed to re-create database", buf, 2u);
        }
      }
    }
  }
}

uint64_t __42__HDIDSPersistentDictionary_objectForKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F20](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (void)removeAllObjects
{
  database = self->_database;
  id v12 = 0;
  char v4 = [(HDSQLiteDatabase *)database executeSQL:@"DELETE FROM key_value_store" error:&v12 bindingHandler:0 enumerationHandler:0];
  id v10 = v12;
  if ((v4 & 1) == 0) {
    [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to delete all keys and values", v5, v6, v7, v8, v9, v11 format];
  }
}

BOOL __68__HDIDSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v5 = MEMORY[0x1C1879F20](a2, 1);
  double v6 = MEMORY[0x1C1879F40](a2, 2);
  char v11 = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = -[HDIDSPersistentDictionary _objectFromData:](*(void *)(a1 + 32), v5);
  (*(void (**)(uint64_t, void *, void *, char *, double))(v7 + 16))(v7, v4, v8, &v11, v6);

  BOOL v9 = v11 == 0;
  return v9;
}

uint64_t __82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_double(a2, 1, *(double *)(a1 + 32) + -2592000.0);
}

- (void)didReceiveError:(id)a3 forMessageID:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  BOOL v9 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    id v20 = v9;
    id v21 = [v6 domain];
    *(_DWORD *)buf = 134218754;
    CFAbsoluteTime v28 = Current;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2112;
    long long v32 = v21;
    __int16 v33 = 2048;
    uint64_t v34 = [v6 code];
    _os_log_debug_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) message='%@' error domain='%@' code=%ld", buf, 0x2Au);
  }
  database = self->_database;
  id v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__58__HDIDSPersistentDictionary_didReceiveError_forMessageID___block_invoke;
  v22[3] = (uint64_t)&unk_1E62F9A10;
  id v11 = v6;
  id v23 = v11;
  CFAbsoluteTime v25 = Current;
  id v12 = v7;
  id v24 = v12;
  char v13 = [(HDSQLiteDatabase *)database executeSQL:@"UPDATE message_records SET error_domain=?, error_code=?, error_timestamp=? WHERE uuid=?" error:&v26 bindingHandler:v22 enumerationHandler:0];
  id v19 = v26;
  if ((v13 & 1) == 0) {
    [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to record message error", v14, v15, v16, v17, v18, v22[0] format];
  }
}

uint64_t __58__HDIDSPersistentDictionary_didReceiveError_forMessageID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  char v4 = [*(id *)(a1 + 32) domain];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) code]);
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));

  return HDSQLiteBindFoundationValueToStatement();
}

- (void)didCancel:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    database = self->_database;
    id v18 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__HDIDSPersistentDictionary_didCancel___block_invoke;
    v15[3] = &unk_1E62FB8D8;
    id v16 = v4;
    CFAbsoluteTime v17 = Current;
    char v7 = [(HDSQLiteDatabase *)database performTransactionWithType:1 error:&v18 usingBlock:v15];
    id v13 = v18;
    if ((v7 & 1) == 0) {
      [(HDIDSPersistentDictionary *)(uint64_t)self _handleError:@"failed to mark messages as canceled", v8, v9, v10, v11, v12, v14 format];
    }
  }
}

uint64_t __39__HDIDSPersistentDictionary_didCancel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F65D80]) initWithSQL:@"UPDATE message_records SET canceled=1 WHERE uuid=?" database:v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        _HKInitializeLogging();
        id v13 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          uint64_t v23 = v14;
          __int16 v24 = 2112;
          uint64_t v25 = v12;
          _os_log_debug_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) canceled message='%@'", buf, 0x16u);
        }
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __39__HDIDSPersistentDictionary_didCancel___block_invoke_412;
        v17[3] = &unk_1E62F43C8;
        void v17[4] = v12;
        if (![v6 performStatementWithError:a3 bindingHandler:v17])
        {
          uint64_t v15 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 1;
  }
LABEL_14:

  [v6 finish];
  return v15;
}

uint64_t __39__HDIDSPersistentDictionary_didCancel___block_invoke_412()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (id)messageIDsForPendingOutgoingMessagesWithType:(int)a3 deviceID:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", *(void *)&a3, a4);
  database = self->_database;
  id v17 = 0;
  id v14 = v6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke;
  v15[3] = &__block_descriptor_36_e23_v16__0__sqlite3_stmt__8l;
  int v16 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke_2;
  v13[3] = &unk_1E62F3D38;
  id v8 = v6;
  LODWORD(database) = [(HDSQLiteDatabase *)database executeSQL:@"SELECT uuid FROM message_records WHERE type=? AND outgoing=1 AND canceled=0 AND send_timestamp IS NULL AND error_timestamp IS NULL" error:&v17 bindingHandler:v15 enumerationHandler:v13];
  id v9 = v17;
  if (database) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

uint64_t __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 32));
}

uint64_t __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end