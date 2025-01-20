@interface WKWebExtensionStorageSQLiteStore
@end

@implementation WKWebExtensionStorageSQLiteStore

void __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v24, (id *)(a1 + 56));
  v2 = v24;
  if (v24)
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    v4 = *(void **)(a1 + 40);
    if (v3)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v23 = 0;
      v6 = (id *)&v23;
      uint64_t v7 = [v4 _getValuesForKeys:v5 outErrorMessage:&v23];
    }
    else
    {
      uint64_t v22 = 0;
      v6 = (id *)&v22;
      uint64_t v7 = [v4 _getValuesForAllKeysReturningErrorMessage:&v22];
    }
    v11 = (void *)v7;
    id v12 = *v6;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke_1;
    block[3] = &unk_1E5811028;
    id v13 = *(id *)(a1 + 48);
    id v20 = v12;
    id v21 = v13;
    id v19 = v11;
    id v14 = v12;
    id v15 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);

    CFRelease(v2);
  }
  else
  {
    v8 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      *(_DWORD *)buf = 138478083;
      uint64_t v26 = v16;
      __int16 v27 = 2113;
      uint64_t v28 = v17;
      _os_log_error_impl(&dword_1985F2000, v8, OS_LOG_TYPE_ERROR, "Failed to retrieve keys: %{private}@ for extension %{private}@.", buf, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    v10 = [NSString stringWithFormat:@"Failed to retrieve keys %@", *(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

uint64_t __72___WKWebExtensionStorageSQLiteStore_getValuesForKeys_completionHandler___block_invoke_1(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v46, (id *)(a1 + 56));
  v2 = v46;
  if (v46)
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    v4 = *(void **)(a1 + 40);
    if (v3)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v45 = 0;
      v6 = [v4 _getValuesForKeys:v5 outErrorMessage:&v45];
      id v7 = v45;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_6;
      block[3] = &unk_1E5811028;
      id v44 = *(id *)(a1 + 48);
      id v42 = v6;
      id v8 = v7;
      id v43 = v8;
      id v9 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_18:
      CFRelease(v2);
      return;
    }
    id v40 = 0;
    char v13 = [v4 _openDatabaseIfNecessaryReturningErrorMessage:&v40 createIfNecessary:0];
    id v8 = v40;
    if ((v13 & 1) == 0)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_2;
      v37[3] = &unk_1E5811000;
      id v39 = *(id *)(a1 + 48);
      id v8 = v8;
      id v38 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v37);

      id v9 = v39;
      goto LABEL_18;
    }
    id v14 = *(void **)(*(void *)(a1 + 40) + 24);
    id v36 = 0;
    id v15 = v14;
    uint64_t v16 = @"SELECT SUM(LENGTH(key) + LENGTH(value)) FROM extension_storage";
    uint64_t v17 = [[_WKWebExtensionSQLiteStatement alloc] initWithDatabase:v15 query:@"SELECT SUM(LENGTH(key) + LENGTH(value)) FROM extension_storage" error:&v36];
    v18 = v17;
    if (!v17)
    {
      sqlite3_int64 v22 = 0;
      char v23 = 0;
LABEL_17:

      id v24 = v36;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_3;
      v29[3] = &unk_1E5811150;
      char v35 = v23;
      id v33 = *(id *)(a1 + 48);
      sqlite3_int64 v34 = v22;
      id v25 = *(id *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      id v30 = v25;
      uint64_t v31 = v26;
      id v32 = v24;
      id v9 = v24;
      dispatch_async(MEMORY[0x1E4F14428], v29);

      goto LABEL_18;
    }
    id v19 = [(_WKWebExtensionSQLiteStatement *)v17 handle];
    id v20 = v15;
    uint64_t v21 = sqlite3_step(v19);
    if (v21 == 100)
    {
      sqlite3_int64 v22 = sqlite3_column_int64(v19, 0);
      uint64_t v21 = sqlite3_step(v19);
      if (v21 == 101)
      {
        char v23 = 1;
LABEL_16:

        [(_WKWebExtensionSQLiteStatement *)v18 invalidate];
        goto LABEL_17;
      }
    }
    else
    {
      sqlite3_int64 v22 = 0;
    }
    [v20 reportErrorWithCode:v21 statement:v19 error:&v36];
    char v23 = 0;
    goto LABEL_16;
  }
  v10 = qword_1EB357DF8;
  if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_DWORD *)buf = 138478083;
    uint64_t v48 = v27;
    __int16 v49 = 2113;
    uint64_t v50 = v28;
    _os_log_error_impl(&dword_1985F2000, v10, OS_LOG_TYPE_ERROR, "Failed to calculate storage size for keys: %{private}@ for extension %{private}@.", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [NSString stringWithFormat:@"Failed to caluclate storage size for keys: %@", *(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
}

uint64_t __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = WebKit::storageSizeOf(*(void **)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

uint64_t __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __77___WKWebExtensionStorageSQLiteStore_getStorageSizeForKeys_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    unint64_t v3 = (id)qword_1EB357DF8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = [*(id *)(a1 + 48) localizedDescription];
      int v9 = 138478339;
      uint64_t v10 = v6;
      __int16 v11 = 2113;
      uint64_t v12 = v7;
      __int16 v13 = 2113;
      id v14 = v8;
      _os_log_error_impl(&dword_1985F2000, v3, OS_LOG_TYPE_ERROR, "Failed to calculate storage size for keys: %{private}@ for extension %{private}@. %{private}@", (uint8_t *)&v9, 0x20u);
    }
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 48) localizedDescription];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

void __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([v5 length])
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_initWeak(&location, a1[4]);
    uint64_t v6 = *((void *)a1[4] + 4);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3321888768;
    v7[2] = __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_2;
    v7[3] = &unk_1EE9B28B8;
    objc_copyWeak(v10, &location);
    v7[4] = a1[4];
    id v9 = a1[6];
    id v8 = a1[5];
    v10[1] = a2;
    dispatch_async(v6, v7);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v31, (id *)(a1 + 56));
  uint64_t v2 = v31;
  if (v31)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) allKeys];
    id v30 = 0;
    id v5 = [v3 _getValuesForKeys:v4 outErrorMessage:&v30];
    id v6 = v30;

    unint64_t v7 = WebKit::storageSizeOf(v5);
    unint64_t v8 = WebKit::storageSizeOf(*(void **)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA80];
    __int16 v11 = *(void **)(a1 + 32);
    id v29 = v6;
    uint64_t v12 = [v11 _getAllKeysReturningErrorMessage:&v29];
    id v13 = v29;

    id v14 = [v10 setWithSet:v12];

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = [*(id *)(a1 + 40) allKeys];
    uint64_t v17 = [v15 setWithArray:v16];
    [v14 unionSet:v17];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_15;
    v23[3] = &unk_1E5811178;
    id v27 = *(id *)(a1 + 48);
    uint64_t v28 = v8 - v7 + v9;
    id v24 = v14;
    id v25 = v5;
    id v26 = v13;
    id v18 = v13;
    id v19 = v5;
    id v20 = v14;
    dispatch_async(MEMORY[0x1E4F14428], v23);

    CFRelease(v2);
  }
  else
  {
    uint64_t v21 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138477827;
      uint64_t v33 = v22;
      _os_log_error_impl(&dword_1985F2000, v21, OS_LOG_TYPE_ERROR, "Failed to calculate storage size for extension %{private}@.", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __102___WKWebExtensionStorageSQLiteStore_getStorageSizeForAllKeysIncludingKeyedData_withCompletionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = [*(id *)(a1 + 32) count];
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);

  return v5(v2, v3, v4, v6, v7);
}

void __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&cf, (id *)(a1 + 56));
  if (cf)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    id v29 = 0;
    char v3 = [v2 _openDatabaseIfNecessaryReturningErrorMessage:&v29];
    id v4 = v29;
    if (v3)
    {
      id v5 = [MEMORY[0x1E4F1CA48] array];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v23;
LABEL_5:
        uint64_t v9 = 0;
        uint64_t v10 = v4;
        while (1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
          uint64_t v12 = *(void **)(a1 + 40);
          id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
          id v4 = [v12 _insertOrUpdateValue:v13 forKey:v11 inDatabase:*(void *)(*(void *)(a1 + 40) + 24)];

          if ([v4 length]) {
            break;
          }
          [v5 addObject:v11];
          ++v9;
          uint64_t v10 = v4;
          if (v7 == v9)
          {
            uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v31 count:16];
            if (v7) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_3;
      block[3] = &unk_1E5811028;
      id v21 = *(id *)(a1 + 48);
      id v19 = v5;
      id v14 = v4;
      id v20 = v14;
      id v15 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_2;
      v26[3] = &unk_1E5811000;
      id v28 = *(id *)(a1 + 48);
      id v14 = v4;
      id v27 = v14;
      dispatch_async(MEMORY[0x1E4F14428], v26);

      id v15 = v28;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = NSString;
    id v14 = [*(id *)(a1 + 32) allKeys];
    id v15 = [v17 stringWithFormat:@"Failed to set keys %@", v14];
    (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v15);
  }

  if (cf) {
    CFRelease(cf);
  }
}

uint64_t __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __68___WKWebExtensionStorageSQLiteStore_setKeyedData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke(void **a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionStorageSQLiteStore>::get(&v25, a1 + 7);
  if (v25)
  {
    id v2 = a1[5];
    id v24 = 0;
    char v3 = [v2 _openDatabaseIfNecessaryReturningErrorMessage:&v24 createIfNecessary:0];
    id v4 = v24;
    if (v3)
    {
      id v5 = (void *)*((void *)a1[5] + 3);
      id v6 = NSString;
      uint64_t v7 = rowFilterStringFromRowKeys(a1[4]);
      uint64_t v8 = [v6 stringWithFormat:@"DELETE FROM extension_storage WHERE key in (%@)", v7];
      LODWORD(v5) = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v5, 0, v8);

      if (v5 != 101)
      {
        uint64_t v9 = qword_1EB357DF8;
        if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_ERROR))
        {
          id v15 = a1[4];
          uint64_t v16 = *((void *)a1[5] + 1);
          *(_DWORD *)buf = 138478083;
          id v27 = v15;
          __int16 v28 = 2113;
          uint64_t v29 = v16;
          _os_log_error_impl(&dword_1985F2000, v9, OS_LOG_TYPE_ERROR, "Failed to delete keys %{private}@ for extension %{private}@.", buf, 0x16u);
        }
        uint64_t v10 = [NSString stringWithFormat:@"Failed to delete keys %@", a1[4]];

        id v4 = (id)v10;
      }
      uint64_t v11 = [a1[5] _deleteDatabaseIfEmpty];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_29;
      block[3] = &unk_1E5811028;
      id v20 = a1[6];
      id v12 = v4;
      id v18 = v12;
      id v19 = v11;
      id v13 = v11;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_2;
      v21[3] = &unk_1E5811000;
      id v23 = a1[6];
      id v12 = v4;
      id v22 = v12;
      dispatch_async(MEMORY[0x1E4F14428], v21);

      id v13 = v23;
    }
  }
  else
  {
    id v14 = (void (**)(void *, id))a1[6];
    id v12 = [NSString stringWithFormat:@"Failed to delete keys %@", a1[4]];
    v14[2](v14, v12);
  }

  if (v25) {
    CFRelease(v25);
  }
}

uint64_t __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75___WKWebExtensionStorageSQLiteStore_deleteValuesForKeys_completionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) length];
  uint64_t v4 = 32;
  if (!v3) {
    uint64_t v4 = 40;
  }
  uint64_t v5 = *(void *)(a1 + v4);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v6(v2, v5);
}

@end