@interface WKWebExtensionSQLiteStore
@end

@implementation WKWebExtensionSQLiteStore

uint64_t __35___WKWebExtensionSQLiteStore_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

void __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _deleteDatabase];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E5811000;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __66___WKWebExtensionSQLiteStore_deleteDatabaseWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionSQLiteStore>::get(&v26, a1 + 6);
  v2 = (id *)v26;
  if (v26)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v26);
    id v25 = 0;
    char v3 = [(id)objc_claimAutoreleasedReturnValue() _openDatabaseIfNecessaryReturningErrorMessage:&v25];
    id v4 = (__CFString *)v25;

    if (v3)
    {
      v5 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      id v6 = v2[3];
      id v7 = NSString;
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      v8 = [(id)objc_claimAutoreleasedReturnValue() _savepointNameFromUUID:a1[4]];
      v9 = [v7 stringWithFormat:@"SAVEPOINT %@", v8];
      int v10 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v9);

      if (v10 != 101)
      {
        v11 = (id)qword_1EB357DF8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v15 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          id v16 = v2[1];
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v15);
          objc_claimAutoreleasedReturnValue();
          v17 = [v2[3] lastErrorMessage];
          *(_DWORD *)buf = 138478339;
          id v28 = v16;
          __int16 v29 = 2114;
          v30 = v17;
          __int16 v31 = 1024;
          int v32 = v10;
          _os_log_error_impl(&dword_1985F2000, v11, OS_LOG_TYPE_ERROR, "Failed to create storage savepoint for extension %{private}@. %{public}@ (%d)", buf, 0x1Cu);
        }
        id v4 = @"Failed to create savepoint.";
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_49;
      block[3] = &unk_1E5811028;
      id v21 = a1[5];
      v12 = v4;
      v19 = v12;
      id v20 = a1[4];
      dispatch_async(MEMORY[0x1E4F14428], block);

      v13 = &v21;
      v14 = (id *)&v19;
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_2;
      v22[3] = &unk_1E5811000;
      v13 = &v24;
      id v24 = a1[5];
      v14 = (id *)&v23;
      v12 = v4;
      v23 = v12;
      dispatch_async(MEMORY[0x1E4F14428], v22);
    }

    if (v26) {
      CFRelease(v26);
    }
  }
}

uint64_t __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __67___WKWebExtensionSQLiteStore_createSavepointWithCompletionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 32) length]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

void __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionSQLiteStore>::get(&v20, (id *)(a1 + 48));
  uint64_t v2 = (id *)v20;
  if (v20)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v20);
    id v19 = 0;
    char v3 = [(id)objc_claimAutoreleasedReturnValue() _openDatabaseIfNecessaryReturningErrorMessage:&v19];
    uint64_t v4 = (__CFString *)v19;

    if (v3)
    {
      v5 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      id v6 = v2[3];
      id v7 = NSString;
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      v8 = [(id)objc_claimAutoreleasedReturnValue() _savepointNameFromUUID:*(void *)(a1 + 32)];
      v9 = [v7 stringWithFormat:@"RELEASE SAVEPOINT %@", v8];
      int v10 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v9);

      if (v10 != 101)
      {
        v11 = (id)qword_1EB357DF8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v14 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          id v15 = v2[1];
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v14);
          objc_claimAutoreleasedReturnValue();
          id v16 = [v2[3] lastErrorMessage];
          *(_DWORD *)buf = 138478339;
          id v22 = v15;
          __int16 v23 = 2114;
          id v24 = v16;
          __int16 v25 = 1024;
          int v26 = v10;
          _os_log_error_impl(&dword_1985F2000, v11, OS_LOG_TYPE_ERROR, "Failed to release storage savepoint for extension %{private}@. %{public}@ (%d)", buf, 0x1Cu);
        }
        uint64_t v4 = @"Failed to release savepoint.";
      }
      v12 = (id *)v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_56;
      v17[3] = &unk_1E5811000;
      v17[5] = *(id *)(a1 + 40);
      v13 = v4;
      v17[4] = v13;
    }
    else
    {
      v12 = (id *)v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_2;
      v18[3] = &unk_1E5811000;
      v18[5] = *(id *)(a1 + 40);
      v13 = v4;
      v18[4] = v13;
    }
    dispatch_async(MEMORY[0x1E4F14428], v12);

    if (v20) {
      CFRelease(v20);
    }
  }
}

uint64_t __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __64___WKWebExtensionSQLiteStore_commitSavepoint_completionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionSQLiteStore>::get(&v20, (id *)(a1 + 48));
  uint64_t v2 = (id *)v20;
  if (v20)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v20);
    id v19 = 0;
    char v3 = [(id)objc_claimAutoreleasedReturnValue() _openDatabaseIfNecessaryReturningErrorMessage:&v19];
    uint64_t v4 = (__CFString *)v19;

    if (v3)
    {
      v5 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      id v6 = v2[3];
      id v7 = NSString;
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      v8 = [(id)objc_claimAutoreleasedReturnValue() _savepointNameFromUUID:*(void *)(a1 + 32)];
      v9 = [v7 stringWithFormat:@"ROLLBACK TO SAVEPOINT %@", v8];
      int v10 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v9);

      if (v10 != 101)
      {
        v11 = (id)qword_1EB357DF8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v14 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          id v15 = v2[1];
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v14);
          objc_claimAutoreleasedReturnValue();
          id v16 = [v2[3] lastErrorMessage];
          *(_DWORD *)buf = 138478339;
          id v22 = v15;
          __int16 v23 = 2114;
          id v24 = v16;
          __int16 v25 = 1024;
          int v26 = v10;
          _os_log_error_impl(&dword_1985F2000, v11, OS_LOG_TYPE_ERROR, "Failed to rollback to storage savepoint for extension %{private}@. %{public}@ (%d)", buf, 0x1Cu);
        }
        uint64_t v4 = @"Failed to rollback to savepoint.";
      }
      v12 = (id *)v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_63;
      v17[3] = &unk_1E5811000;
      v17[5] = *(id *)(a1 + 40);
      v13 = v4;
      v17[4] = v13;
    }
    else
    {
      v12 = (id *)v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_2;
      v18[3] = &unk_1E5811000;
      v18[5] = *(id *)(a1 + 40);
      v13 = v4;
      v18[4] = v13;
    }
    dispatch_async(MEMORY[0x1E4F14428], v12);

    if (v20) {
      CFRelease(v20);
    }
  }
}

uint64_t __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __68___WKWebExtensionSQLiteStore_rollbackToSavepoint_completionHandler___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end