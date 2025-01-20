@interface MCMSQLiteDB
+ (BOOL)moveDBWithURL:(id)a3 toURL:(id)a4 queue:(id)a5 error:(id *)a6;
+ (sqlite3)openDBWithURL:(id)a3 queue:(id)a4 error:(id *)a5;
- (BOOL)_deleteCodeSigningWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_insertChildIdentifier:(id)a3 forParentIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_insertCodeSigningData:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_insertCodeSigningInfo:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_performInsertOrUpdateQuery:(const char *)a3 withCodeSigningEntry:(id)a4 forIdentifier:(id)a5 isUpdate:(BOOL)a6 error:(id *)a7;
- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 error:(id *)a5;
- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 expectedChanges:(int)a5 error:(id *)a6;
- (BOOL)_performTwoParameterQuery:(const char *)a3 withTextInputOne:(id)a4 andTextInputTwo:(id)a5 expectedChanges:(int)a6 error:(id *)a7;
- (BOOL)_sqliteExec:(id)a3 error:(id *)a4;
- (BOOL)addCodeSigningEntry:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
- (BOOL)deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:(id *)a3;
- (BOOL)deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:(int *)a3 error:(id *)a4;
- (BOOL)deleteCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)invalidateCodeSigningForIdentifierAndAllChildren:(id)a3 error:(id *)a4;
- (BOOL)invalidateCodeSigningWithIdentifier:(id)a3 error:(id *)a4;
- (MCMSQLiteDB)initWithURL:(id)a3 queue:(id)a4 error:(id *)a5;
- (MCMSQLiteDBCodeSigningPeerageDelegate)peerageDelegate;
- (NSURL)url;
- (OS_dispatch_queue)queue;
- (id)_codeSigningEntryFromStatementRow:(sqlite3_stmt *)a3 error:(id *)a4;
- (id)_selectCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4;
- (id)childIdentifiersForParentIdentifier:(id)a3 error:(id *)a4;
- (id)childParentMapWithError:(id *)a3;
- (id)codeSigningEntryWithIdentifier:(id)a3 error:(id *)a4;
- (id)enumerateIdentifiersAndCodeSigningInfoUsingBlock:(id)a3;
- (id)identifiersWithError:(id *)a3;
- (id)parentIdentifierForChildIdentifier:(id)a3 error:(id *)a4;
- (sqlite3)db;
- (void)closeDB;
- (void)dealloc;
- (void)setDb:(sqlite3 *)a3;
- (void)setPeerageDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation MCMSQLiteDB

- (id)codeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v19 = 0;
  v7 = [(MCMSQLiteDB *)self _selectCodeSigningEntryWithIdentifier:v6 error:&v19];
  id v8 = v19;
  v9 = v8;
  if (v7)
  {
    id v16 = v8;
    v10 = [(MCMSQLiteDB *)self childIdentifiersForParentIdentifier:v6 error:&v16];
    id v11 = v16;

    if (v10)
    {
LABEL_3:
      [v7 setChildBundleIdentifiers:v10];
      goto LABEL_19;
    }
    v12 = [v11 domain];
    if ([v12 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 67)
      {

        id v11 = 0;
        goto LABEL_3;
      }
    }
    else
    {
    }
    v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Error retrieving childBundleIds: %@", buf, 0xCu);
    }
  }
  else if (v8)
  {
    v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Error retrieving code signing entry: %@", buf, 0xCu);
    }
    id v11 = v9;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke;
    v17[3] = &unk_1E6A80A30;
    v18 = v6;
    __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v18;
  }

  if (a4)
  {
    id v11 = v11;
    v10 = 0;
    v7 = 0;
    *a4 = v11;
  }
  else
  {
    v10 = 0;
    v7 = 0;
  }
LABEL_19:

  return v7;
}

- (id)_selectCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  ppStmt = 0;
  v7 = [(MCMSQLiteDB *)self db];
  if (sqlite3_prepare_v2(v7, "SELECT code_signing_data.data, code_signing_info.invalid, code_signing_info.placeholder, code_signing_info.registered_by_caller, code_signing_info.data_container_class FROM code_signing_info, code_signing_data WHERE code_signing_info.id = code_signing_data.cs_info_id AND code_signing_info.code_signing_id_text = ?;",
         -1,
         &ppStmt,
         0))
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke;
    v25[3] = &unk_1E6A80498;
    v25[4] = self;
    v25[5] = v7;
    uint64_t v8 = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v25);
LABEL_3:
    id v9 = (id)v8;
    goto LABEL_6;
  }
  v10 = ppStmt;
  id v11 = v6;
  if (sqlite3_bind_text(v10, 1, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_166;
    v21[3] = &unk_1E6A80470;
    id v22 = v11;
    v23 = self;
    v24 = v7;
    __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_166((uint64_t)v21);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  int v15 = sqlite3_step(ppStmt);
  if ((v15 - 102) <= 0xFFFFFFFD)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_169;
    v20[3] = &unk_1E6A80498;
    v20[4] = self;
    v20[5] = v7;
    uint64_t v8 = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_169((uint64_t)v20);
    goto LABEL_3;
  }
  if (v15 == 100)
  {
    id v19 = 0;
    v12 = [(MCMSQLiteDB *)self _codeSigningEntryFromStatementRow:ppStmt error:&v19];
    id v9 = v19;
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_6:
  v12 = 0;
LABEL_7:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    uint64_t v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(MCMSQLiteDB *)self url];
      v17 = [v16 path];
      int v18 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      v28 = v17;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (a4 && !v12) {
    *a4 = v9;
  }

  return v12;
}

- (id)childIdentifiersForParentIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v7 = [(MCMSQLiteDB *)self db];
  if (sqlite3_prepare_v2(v7, "SELECT child_bundles.child_code_signing_id_text FROM child_bundles, code_signing_info WHERE code_signing_info.code_signing_id_text = ? AND child_bundles.parent_id=code_signing_info.id;",
         -1,
         &ppStmt,
         0))
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke;
    v34[3] = &unk_1E6A80498;
    v34[4] = self;
    v34[5] = v7;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke((uint64_t)v34);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v11 = 0;
    goto LABEL_6;
  }
  id v9 = ppStmt;
  id v10 = v6;
  if (sqlite3_bind_text(v9, 1, (const char *)[v10 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_283;
    v30[3] = &unk_1E6A80470;
    id v31 = v10;
    v32 = self;
    v33 = v7;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_283((uint64_t)v30);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  id v11 = 0;
  while (1)
  {
    do
    {
      int v15 = sqlite3_step(ppStmt);
      if ((v15 - 102) <= 0xFFFFFFFD)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_286;
        v29[3] = &unk_1E6A80498;
        v29[4] = self;
        v29[5] = v7;
        __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_286((uint64_t)v29);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      if (v15 != 100)
      {
        id v8 = 0;
        goto LABEL_6;
      }
      id v16 = sqlite3_column_text(ppStmt, 0);
    }
    while (!v16);
    v17 = v16;
    int v18 = (void *)[[NSString alloc] initWithUTF8String:v16];
    if (!v18)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_289;
      v28[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v28[4] = v17;
      uint64_t v22 = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_289((uint64_t)v28);
      goto LABEL_33;
    }
    if (!v11)
    {
      id v11 = objc_opt_new();
      if (!v11) {
        break;
      }
    }
    [v11 addObject:v18];
  }
  uint64_t v22 = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_295();
LABEL_33:
  id v8 = (id)v22;

LABEL_6:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(MCMSQLiteDB *)self url];
      v20 = [v19 path];
      int v21 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      v37 = v20;
      __int16 v38 = 1024;
      int v39 = v21;
      _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (!v8)
  {
    if (v11)
    {
      id v8 = 0;
      goto LABEL_17;
    }
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_303;
    v26 = &unk_1E6A80A30;
    id v27 = v6;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_303((uint64_t)&v23);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v27;
  }

  if (a4)
  {
    id v8 = v8;
    id v11 = 0;
    *a4 = v8;
  }
  else
  {
    id v11 = 0;
  }
LABEL_17:
  uint64_t v13 = objc_msgSend(v11, "copy", v23, v24, v25, v26);

  return v13;
}

- (sqlite3)db
{
  return self->_db;
}

- (id)_codeSigningEntryFromStatementRow:(sqlite3_stmt *)a3 error:(id *)a4
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v6 = sqlite3_column_blob(a3, 0);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", v6, sqlite3_column_bytes(a3, 0), 0);
    id v27 = 0;
    id v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v27];
    id v9 = v27;
    objc_opt_class();
    id v10 = v8;
    id v11 = 0;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }

    if (v11)
    {
      v12 = [[MCMCodeSigningEntry alloc] initWithCodeSigningInfo:v10];
      if (v12)
      {
        uint64_t v13 = v12;
        [(MCMCodeSigningEntry *)v12 setInvalid:sqlite3_column_int(a3, 1) != 0];
        unsigned int v14 = sqlite3_column_int(a3, 2);
        [(MCMCodeSigningEntry *)v13 setPlaceholder:v14 & 1];
        [(MCMCodeSigningEntry *)v13 setAdvanceCopy:(v14 >> 1) & 1];
        [(MCMCodeSigningEntry *)v13 setRegisteredByKernel:(v14 >> 2) & 1];
        [(MCMCodeSigningEntry *)v13 setRegisteredByCaller:sqlite3_column_int(a3, 3) != 0];
        [(MCMCodeSigningEntry *)v13 setDataContainerClass:sqlite3_column_int(a3, 4)];

        goto LABEL_16;
      }
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to allocate codeSigningEntry"];
      v30[0] = @"FunctionName";
      int v18 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke"];
      v31[0] = v18;
      v31[1] = &unk_1F2F11F18;
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v30[1] = @"SourceFileLine";
      v30[2] = v19;
      v31[2] = v17;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

      int v21 = container_log_handle_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v29 = v17;
        _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v20];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke;
      v25[3] = &unk_1E6A80A30;
      v26 = (void *)v15;
      uint64_t v16 = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke((uint64_t)v25);
      id v9 = v26;
    }

    id v9 = (id)v16;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_154;
    v23[3] = &unk_1E6A80A30;
    uint64_t v24 = 0;
    __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_154((uint64_t)v23);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v24;
  }

  if (a4)
  {
    id v9 = v9;
    uint64_t v13 = 0;
    *a4 = v9;
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_16:

  return v13;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_303(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"Children for parent identifier: \"%@\" Not Found in DB", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F12200;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:67 userInfo:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_destroyWeak((id *)&self->_peerageDelegate);
}

- (void)setQueue:(id)a3
{
  p_queue = &self->_queue;

  objc_storeStrong((id *)p_queue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setUrl:(id)a3
{
  p_url = &self->_url;

  objc_storeStrong((id *)p_url, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (void)setPeerageDelegate:(id)a3
{
  p_peerageDelegate = &self->_peerageDelegate;

  objc_storeWeak((id *)p_peerageDelegate, a3);
}

- (MCMSQLiteDBCodeSigningPeerageDelegate)peerageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peerageDelegate);

  return (MCMSQLiteDBCodeSigningPeerageDelegate *)WeakRetained;
}

- (BOOL)deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:(int *)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  v7 = [(MCMSQLiteDB *)self db];
  if (sqlite3_prepare_v2(v7, "DELETE FROM code_signing_info WHERE placeholder = 0 AND invalid = 1 AND data_container_class = ?;",
         -1,
         &ppStmt,
         0))
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke;
    v22[3] = &unk_1E6A80498;
    v22[4] = self;
    v22[5] = v7;
    uint64_t v8 = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke((uint64_t)v22);
LABEL_12:
    id v11 = (void *)v8;
    BOOL v12 = 0;
    int v9 = 0;
    goto LABEL_13;
  }
  if (sqlite3_bind_int(ppStmt, 1, 4))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_370;
    v21[3] = &unk_1E6A80498;
    void v21[4] = self;
    v21[5] = v7;
    uint64_t v8 = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_370((uint64_t)v21);
    goto LABEL_12;
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_376;
    v20[3] = &unk_1E6A80498;
    v20[4] = self;
    v20[5] = v7;
    uint64_t v8 = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_376((uint64_t)v20);
    goto LABEL_12;
  }
  int v9 = sqlite3_changes(v7);
  if (v9 >= 1)
  {
    id v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v9;
      _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "Deleted %d invalid plugin code signing entries.", buf, 8u);
    }
  }
  id v11 = 0;
  BOOL v12 = 1;
LABEL_13:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    uint64_t v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = [(MCMSQLiteDB *)self url];
      int v18 = [v17 path];
      uint64_t v19 = sqlite3_errmsg(v7);
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      __int16 v26 = 2080;
      id v27 = v19;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %s", buf, 0x16u);
    }
  }
  char v14 = !v12;
  if (!a3) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    *a3 = v9;
  }
  if (a4) {
    char v15 = v12;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a4 = v11;
  }

  return v12;
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(delete) for %@ failed: %s", v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12338;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_370(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for plugin data container class at %@ failed: %s", v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12350;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_376(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %s", v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12368;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

- (id)childParentMapWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = objc_opt_new();
  ppStmt = 0;
  id v6 = [(MCMSQLiteDB *)self db];
  if (!sqlite3_prepare_v2(v6, "SELECT child_code_signing_id_text, code_signing_info.code_signing_id_text FROM child_bundles, code_signing_info WHERE child_bundles.parent_id=code_signing_info.id;",
          -1,
          &ppStmt,
          0))
  {
    while (1)
    {
      int v12 = sqlite3_step(ppStmt);
      if ((v12 - 102) <= 0xFFFFFFFD)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_352;
        v25[3] = &unk_1E6A80498;
        void v25[4] = self;
        v25[5] = v6;
        uint64_t v7 = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_352((uint64_t)v25);
        goto LABEL_3;
      }
      if (v12 != 100)
      {
        uint64_t v8 = 0;
        goto LABEL_4;
      }
      uint64_t v13 = sqlite3_column_text(ppStmt, 0);
      if (v13)
      {
        char v14 = v13;
        char v15 = (void *)[[NSString alloc] initWithUTF8String:v13];
        if (!v15)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_355;
          v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v24[4] = v14;
          uint64_t v7 = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_355((uint64_t)v24);
          goto LABEL_3;
        }
      }
      else
      {
        char v15 = 0;
      }
      uint64_t v16 = sqlite3_column_text(ppStmt, 1);
      if (v16)
      {
        v17 = v16;
        uint64_t v18 = [[NSString alloc] initWithUTF8String:v16];
        if (!v18)
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_361;
          v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
          void v23[4] = v17;
          uint64_t v8 = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_361((uint64_t)v23);

          goto LABEL_4;
        }
        uint64_t v19 = (void *)v18;
        if (v15) {
          [v5 setObject:v18 forKeyedSubscript:v15];
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke;
  v26[3] = &unk_1E6A80498;
  v26[4] = self;
  v26[5] = v6;
  uint64_t v7 = __39__MCMSQLiteDB_childParentMapWithError___block_invoke((uint64_t)v26);
LABEL_3:
  uint64_t v8 = (void *)v7;
LABEL_4:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    int v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v20 = [(MCMSQLiteDB *)self url];
      int v21 = [v20 path];
      int v22 = sqlite3_extended_errcode(v6);
      *(_DWORD *)buf = 138412546;
      __int16 v29 = v21;
      __int16 v30 = 1024;
      int v31 = v22;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (a3 && !v5) {
    *a3 = v8;
  }
  id v10 = (void *)[v5 copy];

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F122D8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_352(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F122F0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_355(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to allocate childIdentifier for text: %s", *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F12308;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];

  return v6;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_361(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to allocate parentIdentifier for text: %s", *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F12320;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];

  return v6;
}

- (BOOL)deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v5 = [(MCMSQLiteDB *)self db];
  if (sqlite3_prepare_v2(v5, "DELETE FROM code_signing_info WHERE (placeholder & ?) > 0;", -1, &ppStmt, 0))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke;
    v20[3] = &unk_1E6A80498;
    v20[4] = self;
    v20[5] = v5;
    uint64_t v6 = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke((uint64_t)v20);
LABEL_12:
    id v10 = (void *)v6;
    BOOL v11 = 0;
    goto LABEL_13;
  }
  if (sqlite3_bind_int(ppStmt, 1, 2))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_339;
    v19[3] = &unk_1E6A80498;
    v19[4] = self;
    v19[5] = v5;
    uint64_t v6 = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_339((uint64_t)v19);
    goto LABEL_12;
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_345;
    v18[3] = &unk_1E6A80498;
    v18[4] = self;
    v18[5] = v5;
    uint64_t v6 = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_345((uint64_t)v18);
    goto LABEL_12;
  }
  int v7 = sqlite3_changes(v5);
  if (v7 >= 1)
  {
    int v8 = v7;
    int v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v8;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Deleted %d advance copies of code signing info.", buf, 8u);
    }
  }
  id v10 = 0;
  BOOL v11 = 1;
LABEL_13:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    int v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v15 = [(MCMSQLiteDB *)self url];
      uint64_t v16 = [v15 path];
      int v17 = sqlite3_extended_errcode(v5);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (a3) {
    char v13 = v11;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0) {
    *a3 = v10;
  }

  return v11;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(delete) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12290;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_339(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for flags=%d at %@ failed: %d", 2, v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F122A8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_345(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F122C0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

- (id)parentIdentifierForChildIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  uint64_t v7 = [(MCMSQLiteDB *)self db];
  if (sqlite3_prepare_v2(v7, "SELECT code_signing_info.code_signing_id_text FROM child_bundles, code_signing_info WHERE child_bundles.child_code_signing_id_text = ? AND child_bundles.parent_id=code_signing_info.id;",
         -1,
         &ppStmt,
         0))
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke;
    void v30[3] = &unk_1E6A80498;
    void v30[4] = self;
    v30[5] = v7;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke((uint64_t)v30);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  int v9 = ppStmt;
  id v10 = v6;
  if (sqlite3_bind_text(v9, 1, (const char *)[v10 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_312;
    v26[3] = &unk_1E6A80470;
    id v27 = v10;
    uint64_t v28 = self;
    __int16 v29 = v7;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_312((uint64_t)v26);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  BOOL v11 = 0;
  while (1)
  {
    int v14 = sqlite3_step(ppStmt);
    if ((v14 - 102) <= 0xFFFFFFFD)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_318;
      v25[3] = &unk_1E6A80498;
      void v25[4] = self;
      v25[5] = v7;
      uint64_t v18 = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_318((uint64_t)v25);
      goto LABEL_28;
    }
    if (v14 != 100) {
      break;
    }
    char v15 = sqlite3_column_text(ppStmt, 0);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = [[NSString alloc] initWithUTF8String:v15];

      BOOL v11 = (void *)v17;
      if (!v17)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_321;
        v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v24[4] = v16;
        uint64_t v18 = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_321((uint64_t)v24);
LABEL_28:
        id v8 = (id)v18;
        goto LABEL_6;
      }
    }
  }
  id v8 = 0;
LABEL_6:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    int v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(MCMSQLiteDB *)self url];
      v20 = [v19 path];
      int v21 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      v33 = v20;
      __int16 v34 = 1024;
      int v35 = v21;
      _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (!v8)
  {
    if (v11)
    {
      id v8 = 0;
      goto LABEL_17;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_327;
    v22[3] = &unk_1E6A80A30;
    id v23 = v6;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_327((uint64_t)v22);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v11 = v23;
  }

  if (a4)
  {
    id v8 = v8;
    BOOL v11 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12218;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_312(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) url];
  v5 = [v4 path];
  id v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for child_code_signing_id_text=%@ at %@ failed: %s", v3, v5, sqlite3_errmsg(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F12230;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  v15[2] = v8;
  v16[2] = v6;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_318(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12248;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_321(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to allocate parentIdentifier for text: %s", *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F12260;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];

  return v6;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_327(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"Parent identifier for: \"%@\" Not Found in DB", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F12278;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:67 userInfo:v4];

  return v5;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12188;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_283(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) url];
  v5 = [v4 path];
  id v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F121A0;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  v15[2] = v8;
  v16[2] = v6;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_286(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F121B8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_289(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to allocate thisChildBundleId for text: %s", *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F121D0;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];

  return v6;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_295()
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Failed to allocate childBundleIds"];
  v9[0] = @"FunctionName";
  v1 = [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  v10[0] = v1;
  v10[1] = &unk_1F2F121E8;
  uint64_t v2 = *MEMORY[0x1E4F28568];
  v9[1] = @"SourceFileLine";
  v9[2] = v2;
  v10[2] = v0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  v4 = container_log_handle_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    uint64_t v8 = v0;
    _os_log_error_impl(&dword_1D7739000, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v3];

  return v5;
}

- (id)identifiersWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v5 = [(MCMSQLiteDB *)self db];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  if (!sqlite3_prepare_v2(v5, "SELECT code_signing_info.code_signing_id_text FROM code_signing_info;",
          -1,
          &ppStmt,
          0))
  {
    while (1)
    {
      int v13 = sqlite3_step(ppStmt);
      if ((v13 - 102) <= 0xFFFFFFFD)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke_274;
        v22[3] = &unk_1E6A80498;
        void v22[4] = self;
        v22[5] = v5;
        uint64_t v7 = __36__MCMSQLiteDB_identifiersWithError___block_invoke_274((uint64_t)v22);
        goto LABEL_3;
      }
      if (v13 != 100)
      {
        uint64_t v8 = 0;
        goto LABEL_4;
      }
      int v14 = sqlite3_column_text(ppStmt, 0);
      if (v14)
      {
        char v15 = v14;
        uint64_t v16 = [[NSString alloc] initWithUTF8String:v14];
        if (!v16)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke_277;
          v21[3] = &__block_descriptor_40_e14___NSError_8__0l;
          void v21[4] = v15;
          uint64_t v7 = __36__MCMSQLiteDB_identifiersWithError___block_invoke_277((uint64_t)v21);
          goto LABEL_3;
        }
        uint64_t v17 = v16;
        [v6 addObject:v16];
      }
      else
      {
        uint64_t v17 = container_log_handle_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Error retrieving code_signing_id_text from DB", buf, 2u);
        }
      }
    }
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke;
  v23[3] = &unk_1E6A80498;
  void v23[4] = self;
  void v23[5] = v5;
  uint64_t v7 = __36__MCMSQLiteDB_identifiersWithError___block_invoke((uint64_t)v23);
LABEL_3:
  uint64_t v8 = (void *)v7;
LABEL_4:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    int v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [(MCMSQLiteDB *)self url];
      uint64_t v19 = [v18 path];
      int v20 = sqlite3_extended_errcode(v5);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v19;
      __int16 v27 = 1024;
      int v28 = v20;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  uint64_t v10 = [v6 count];
  if (a3 && !v10)
  {

    id v6 = 0;
    *a3 = v8;
  }
  BOOL v11 = (void *)[v6 copy];

  return v11;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB identifiersWithError:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12140;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke_274(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB identifiersWithError:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12158;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke_277(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to allocate identifier for text: %s", *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB identifiersWithError:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F12170;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];

  return v6;
}

- (id)enumerateIdentifiersAndCodeSigningInfoUsingBlock:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v5 = [(MCMSQLiteDB *)self db];
  int v35 = (void (**)(void, void, void))v4;
  db = v5;
  if (!sqlite3_prepare_v2(v5, "SELECT code_signing_data.data, code_signing_info.invalid, code_signing_info.placeholder, code_signing_info.registered_by_caller, code_signing_info.data_container_class, code_signing_info.code_signing_id_text FROM code_signing_info, code_signing_data WHERE code_signing_info.id = code_signing_data.cs_info_id;",
          -1,
          &ppStmt,
          0))
  {
    uint64_t v7 = 0;
    uint64_t v34 = *MEMORY[0x1E4F28568];
    *(void *)&long long v6 = 138543362;
    long long v32 = v6;
    while (1)
    {
      uint64_t v10 = (void *)MEMORY[0x1D9478DF0]();
      int v11 = sqlite3_step(ppStmt);
      if ((v11 - 102) <= 0xFFFFFFFD)
      {
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_247;
        v41[3] = &unk_1E6A80498;
        v41[4] = self;
        v41[5] = db;
        uint64_t v28 = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_247((uint64_t)v41);

        uint64_t v7 = (void *)v28;
        goto LABEL_3;
      }
      if (v11 != 100)
      {
        goto LABEL_3;
      }
      id v40 = 0;
      int v12 = [(MCMSQLiteDB *)self _codeSigningEntryFromStatementRow:ppStmt error:&v40];
      id v13 = v40;
      if (v12) {
        break;
      }
      int v21 = 4;
LABEL_31:

      if (v21 == 3) {
        goto LABEL_3;
      }
    }
    int v14 = sqlite3_column_text(ppStmt, 5);
    if (!v14)
    {
      uint64_t v18 = v7;
      int v22 = (void *)[[NSString alloc] initWithFormat:@"Error retrieving code_signing_id_text from DB"];
      v46[0] = @"FunctionName";
      id v23 = [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
      *(void *)v47 = v23;
      *(void *)&v47[8] = &unk_1F2F120F8;
      v46[1] = @"SourceFileLine";
      v46[2] = v34;
      *(void *)&v47[16] = v22;
      __int16 v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];

      int v25 = container_log_handle_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v32;
        v45 = v22;
        _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v24];

      int v21 = 4;
      uint64_t v17 = v13;
      goto LABEL_23;
    }
    char v15 = v14;
    uint64_t v16 = [[NSString alloc] initWithUTF8String:v14];
    if (!v16)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_258;
      v39[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v39[4] = v15;
      __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_258((uint64_t)v39);
      uint64_t v17 = v7;
      v7 = int v21 = 3;
      goto LABEL_30;
    }
    uint64_t v17 = (void *)v16;
    uint64_t v18 = v7;
    id v38 = v13;
    uint64_t v19 = [(MCMSQLiteDB *)self childIdentifiersForParentIdentifier:v16 error:&v38];
    id v20 = v38;

    if (v19)
    {
LABEL_18:
      objc_msgSend(v12, "setChildBundleIdentifiers:", v19, v32);
      ((void (**)(void, void *, void *))v35)[2](v35, v17, v12);

      int v21 = 0;
      uint64_t v17 = (void *)v19;
LABEL_23:
      id v13 = v20;
      uint64_t v7 = v18;
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v26 = [v20 domain];
    if ([v26 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v27 = [v20 code];

      if (v27 == 67)
      {

        id v20 = 0;
        goto LABEL_18;
      }
    }
    else
    {
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_264;
    v36[3] = &unk_1E6A80A30;
    id v13 = v20;
    id v37 = v13;
    uint64_t v7 = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_264((uint64_t)v36);

    int v21 = 4;
    goto LABEL_30;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke;
  v42[3] = &unk_1E6A80498;
  v42[4] = self;
  v42[5] = v5;
  uint64_t v7 = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke((uint64_t)v42);
LABEL_3:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    uint64_t v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [(MCMSQLiteDB *)self url];
      __int16 v30 = [v29 path];
      int v31 = sqlite3_extended_errcode(db);
      *(_DWORD *)v47 = 138412546;
      *(void *)&v47[4] = v30;
      *(_WORD *)&v47[12] = 1024;
      *(_DWORD *)&v47[14] = v31;
      _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", v47, 0x12u);
    }
  }

  return v7;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  id v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  long long v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F120C8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_247(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  id v4 = [v3 path];
  v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  long long v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F120E0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_258(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to allocate identifier for text: %s", *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F12110;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  long long v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];

  return v6;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_264(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"Error retrieving childBundleIds: %@", *(void *)(a1 + 32)];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F12128;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    long long v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "%{public}@ (%{public}@)";
      int v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = v5;
  }
  uint64_t v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v16 = v2;
  uint64_t v10 = "%{public}@";
  int v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

- (BOOL)invalidateCodeSigningForIdentifierAndAllChildren:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v31 = objc_opt_new();
  id v43 = 0;
  long long v32 = v5;
  uint64_t v6 = [(MCMSQLiteDB *)self childIdentifiersForParentIdentifier:v5 error:&v43];
  id v7 = v43;
  uint64_t v8 = v7;
  __int16 v30 = (void *)v6;
  if (v6) {
    goto LABEL_2;
  }
  id v23 = [v7 domain];
  if (![v23 isEqualToString:@"MCMErrorDomain"])
  {

    goto LABEL_27;
  }
  BOOL v24 = [v8 code] == 67;

  if (!v24)
  {
LABEL_27:
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke;
    v40[3] = &unk_1E6A80510;
    id v41 = v32;
    uint64_t v27 = v8;
    v42 = v27;
    int v21 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke((uint64_t)v40);

    __int16 v30 = 0;
    uint64_t v26 = &v41;
    int v25 = v42;
    goto LABEL_28;
  }

  uint64_t v8 = 0;
  uint64_t v6 = 0;
LABEL_2:
  [v31 addObject:v32];
  if (v6) {
    [v31 addObjectsFromArray:v6];
  }
  id v39 = v8;
  BOOL v9 = [(MCMSQLiteDB *)self _sqliteExec:@"BEGIN;" error:&v39];
  uint64_t v10 = v39;

  if (v9)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v11 = v31;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v50 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v36 = v10;
          BOOL v16 = [(MCMSQLiteDB *)self invalidateCodeSigningWithIdentifier:v15 error:&v36];
          __int16 v17 = v36;

          if (v16)
          {
            uint64_t v18 = container_log_handle_for_category();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v45 = v32;
              __int16 v46 = 2112;
              uint64_t v47 = v15;
              _os_log_debug_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEBUG, "Invalidating code signing info for %@ child: %@", buf, 0x16u);
            }
            uint64_t v10 = v17;
          }
          else
          {
            uint64_t v19 = container_log_handle_for_category();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v45 = v32;
              __int16 v46 = 2112;
              uint64_t v47 = v15;
              __int16 v48 = 2112;
              v49 = v17;
              _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "Failed to invalidate code signing info for %@ child %@ : %@", buf, 0x20u);
            }

            uint64_t v10 = 0;
            uint64_t v18 = v17;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v50 count:16];
      }
      while (v12);
    }

    v35[0] = v10;
    BOOL v20 = [(MCMSQLiteDB *)self _sqliteExec:@"COMMIT;" error:v35];
    int v21 = v35[0];

    if (!v20)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_238;
      v33[3] = &unk_1E6A80A30;
      uint64_t v34 = v21;
      int v21 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_238((uint64_t)v33);
    }
    BOOL v22 = 1;
    goto LABEL_31;
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_232;
  v37[3] = &unk_1E6A80A30;
  int v25 = v10;
  id v38 = v25;
  int v21 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_232((uint64_t)v37);
  uint64_t v26 = (id *)&v38;
LABEL_28:

  if (a4)
  {
    int v21 = v21;
    *a4 = v21;
  }
  BOOL v22 = 0;
LABEL_31:

  return v22;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"Error retrieving child bundles ids from DB with identifier %@ : %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F12050;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 40))
    {
      uint64_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      BOOL v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  BOOL v16 = v2;
  uint64_t v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
LABEL_7:

  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_232(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed _sqliteExec begin"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F12068;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      BOOL v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  BOOL v16 = v2;
  uint64_t v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_238(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed _sqliteExec commit"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F12098;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      BOOL v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  BOOL v16 = v2;
  uint64_t v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_235(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 callStackSymbols];
  id v5 = (void *)[v2 initWithFormat:@"Got exception: %@ : %@", v3, v4];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F12080;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  uint64_t v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:40 userInfo:v8];

  return v10;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_241(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed _sqliteExec rollback"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F120B0;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      BOOL v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = v5;
  }
  uint64_t v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  BOOL v16 = v2;
  uint64_t v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

- (BOOL)invalidateCodeSigningWithIdentifier:(id)a3 error:(id *)a4
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14[0] = 0;
  BOOL v7 = -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:error:](self, "_performSingleParameterQuery:withTextInput:error:", "UPDATE code_signing_info SET invalid=1 WHERE code_signing_id_text = ?;",
         v6,
         v14);
  id v8 = v14[0];
  if (!v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke;
    v11[3] = &unk_1E6A80510;
    id v12 = v6;
    id v13 = v8;
    id v9 = v8;
    __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke((uint64_t)v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
  }

  return v7;
}

id __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed to invalidate identifier %@", *(void *)(a1 + 32)];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningWithIdentifier:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F12038;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 40))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    BOOL v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 40))
    {
      id v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      BOOL v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      uint64_t v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v7 = v5;
  }
  id v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  BOOL v16 = v2;
  uint64_t v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"Identifier: \"%@\" Not Found in DB", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB codeSigningEntryWithIdentifier:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F12020;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:67 userInfo:v4];

  return v5;
}

- (BOOL)deleteCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    BOOL v7 = [(MCMSQLiteDB *)self _deleteCodeSigningWithIdentifier:v6 error:a4];
    id v8 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke;
    void v10[3] = &unk_1E6A80A30;
    id v11 = 0;
    id v8 = __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v10);

    BOOL v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v7) {
    *a4 = v8;
  }
LABEL_7:

  return v7;
}

id __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"\bidentifier %@ cannot be nil", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F12008;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:38 userInfo:v4];

  return v6;
}

- (BOOL)addCodeSigningEntry:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8 || !v9)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke;
    v34[3] = &unk_1E6A80510;
    id v35 = v8;
    id v36 = v9;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke((uint64_t)v34);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    int v21 = &v35;
    id v22 = v36;
LABEL_22:

    goto LABEL_23;
  }
  id v33 = 0;
  BOOL v10 = [(MCMSQLiteDB *)self _sqliteExec:@"BEGIN;" error:&v33];
  id v11 = v33;
  uint64_t v12 = v11;
  if (!v10)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_180;
    v31[3] = &unk_1E6A80A30;
    id v22 = v11;
    id v32 = v22;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_180((uint64_t)v31);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    int v21 = &v32;
    goto LABEL_22;
  }
  if ([(MCMSQLiteDB *)self _insertCodeSigningInfo:v8 forIdentifier:v9 error:a5]&& [(MCMSQLiteDB *)self _insertCodeSigningData:v8 forIdentifier:v9 error:a5])
  {
    id v13 = [v8 childBundleIdentifiers];

    if (v13)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      int v14 = [v8 childBundleIdentifiers];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v14);
            }
            [(MCMSQLiteDB *)self _insertChildIdentifier:*(void *)(*((void *)&v38 + 1) + 8 * i) forParentIdentifier:v9 error:0];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v37 count:16];
        }
        while (v15);
      }
    }
    v30[0] = v12;
    BOOL v18 = [(MCMSQLiteDB *)self _sqliteExec:@"COMMIT;" error:v30];
    id v19 = v30[0];

    if (!v18)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_195;
      v28[3] = &unk_1E6A80A30;
      id v29 = v19;
      __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_195((uint64_t)v28);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v20 = 1;
    goto LABEL_26;
  }
  id v27 = v12;
  BOOL v23 = [(MCMSQLiteDB *)self _sqliteExec:@"ROLLBACK;" error:&v27];
  id v19 = v27;

  if (!v23)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_204;
    v25[3] = &unk_1E6A80A30;
    id v22 = v19;
    id v26 = v22;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_204((uint64_t)v25);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    int v21 = &v26;
    goto LABEL_22;
  }
LABEL_23:
  if (a5)
  {
    id v19 = v19;
    *a5 = v19;
  }
  BOOL v20 = 0;
LABEL_26:

  return v20;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"codeSigningEntry %@ and identifier %@ cannot be nil", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11F90;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:38 userInfo:v4];

  return v6;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_180(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed _sqliteExec begin"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F11FA8;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    BOOL v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      id v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      BOOL v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v7 = v5;
  }
  id v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  uint64_t v16 = v2;
  BOOL v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_195(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed _sqliteExec commit"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F11FD8;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    BOOL v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      id v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      BOOL v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v7 = v5;
  }
  id v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  uint64_t v16 = v2;
  BOOL v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_186(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 callStackSymbols];
  id v5 = (void *)[v2 initWithFormat:@"Got exception: %@ : %@", v3, v4];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11FC0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  uint64_t v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:40 userInfo:v8];

  return v10;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_204(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed _sqliteExec rollback"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F11FF0;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      id v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      BOOL v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = v5;
  }
  id v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  uint64_t v16 = v2;
  BOOL v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  uint64_t v4 = [v3 path];
  id v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11F48;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  uint64_t v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_166(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) url];
  id v5 = [v4 path];
  id v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11F60;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  v15[2] = v8;
  v16[2] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  BOOL v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_169(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  uint64_t v4 = [v3 path];
  id v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11F78;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  uint64_t v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"Error formatting info data from DB"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F11F00;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      BOOL v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = v5;
  }
  uint64_t v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  uint64_t v16 = v2;
  BOOL v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

id __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_154(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"Failed to create code signing entry from statement row"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F11F30;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      BOOL v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = v5;
  }
  uint64_t v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  uint64_t v16 = v2;
  BOOL v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

- (BOOL)_deleteCodeSigningWithIdentifier:(id)a3 error:(id *)a4
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15[0] = 0;
  BOOL v7 = -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:expectedChanges:error:](self, "_performSingleParameterQuery:withTextInput:expectedChanges:error:", "DELETE FROM code_signing_info WHERE code_signing_id_text=?;",
         v6,
         1,
         v15);
  id v8 = v15[0];
  id v9 = v8;
  if (v7)
  {
    BOOL v10 = [(MCMSQLiteDB *)self peerageDelegate];
    [v10 codeSigningDB:self removeParentIdentifier:v6];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke;
    v13[3] = &unk_1E6A80A30;
    id v14 = v8;
    id v11 = v8;
    __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke((uint64_t)v13);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v9 = v9;
      *a4 = v9;
    }
  }

  return v7;
}

id __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithFormat:@"failed to delete from code_signing_info"];
  v19[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _deleteCodeSigningWithIdentifier:error:]_block_invoke"];
  v20[0] = v3;
  v20[1] = &unk_1F2F11EE8;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  if (*(void *)(a1 + 32))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    BOOL v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      id v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v2;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      BOOL v10 = "%{public}@ (%{public}@)";
      id v11 = v8;
      uint32_t v12 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v7 = v5;
  }
  id v8 = container_log_handle_for_category();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  int v15 = 138543362;
  uint64_t v16 = v2;
  BOOL v10 = "%{public}@";
  id v11 = v8;
  uint32_t v12 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
LABEL_7:

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v7];

  return v13;
}

- (BOOL)_insertCodeSigningData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  ppStmt = 0;
  BOOL v10 = [(MCMSQLiteDB *)self db];
  if (!sqlite3_prepare_v2(v10, "INSERT OR REPLACE INTO code_signing_data (cs_info_id, data) SELECT id, ? FROM code_signing_info WHERE code_signing_id_text = ?;",
          -1,
          &ppStmt,
          0))
  {
    id v14 = (void *)MEMORY[0x1E4F28F98];
    int v15 = [v8 codeSigningInfo];
    id v38 = 0;
    uint64_t v16 = [v14 dataWithPropertyList:v15 format:200 options:0 error:&v38];
    id v11 = v38;

    if (!v16)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_114;
      v35[3] = &unk_1E6A80510;
      id v36 = v8;
      id v37 = v11;
      id v20 = v11;
      __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_114((uint64_t)v35);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_3;
    }
    __int16 v17 = ppStmt;
    id v13 = v16;
    if (sqlite3_bind_blob64(v17, 1, (const void *)[v13 bytes], objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_120;
      v34[3] = &unk_1E6A80498;
      void v34[4] = self;
      v34[5] = v10;
      uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_120((uint64_t)v34);
    }
    else
    {
      int v21 = ppStmt;
      id v22 = v9;
      if (sqlite3_bind_text(v21, 2, (const char *)[v22 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_126;
        void v30[3] = &unk_1E6A80470;
        id v31 = v22;
        id v32 = self;
        id v33 = v10;
        uint64_t v19 = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_126((uint64_t)v30);

        goto LABEL_11;
      }
      if (sqlite3_step(ppStmt) == 101)
      {
        BOOL v12 = 1;
        goto LABEL_12;
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_132;
      v29[3] = &unk_1E6A80498;
      v29[4] = self;
      v29[5] = v10;
      uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_132((uint64_t)v29);
    }
    uint64_t v19 = v18;

LABEL_11:
    BOOL v12 = 0;
    id v11 = (id)v19;
    goto LABEL_12;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke;
  v39[3] = &unk_1E6A80498;
  v39[4] = self;
  void v39[5] = v10;
  __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke((uint64_t)v39);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  BOOL v12 = 0;
  id v13 = 0;
LABEL_12:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    BOOL v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v26 = [(MCMSQLiteDB *)self url];
      id v27 = [v26 path];
      int v28 = sqlite3_extended_errcode(v10);
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v27;
      __int16 v43 = 1024;
      int v44 = v28;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (a5) {
    char v24 = v12;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0) {
    *a5 = v11;
  }

  return v12;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  uint64_t v4 = [v3 path];
  id v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(insert) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11E70;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_114(uint64_t a1)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) codeSigningInfo];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Error creating NSData from code signing info: %@", v3];

  v21[0] = @"FunctionName";
  id v5 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11E88;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 40))
  {
    id v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 40))
    {
      BOOL v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      BOOL v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  BOOL v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  BOOL v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  int v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v15;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_120(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  uint64_t v4 = [v3 path];
  id v5 = (void *)[v2 initWithFormat:@"sqlite3_bind_blob64 for codeSigningInfoData at %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11EA0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_126(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) url];
  id v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11EB8;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  BOOL v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_132(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  uint64_t v4 = [v3 path];
  id v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11ED0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

- (BOOL)_insertCodeSigningInfo:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  v26[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v26[0] = 0;
  BOOL v10 = 1;
  BOOL v11 = -[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:](self, "_performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:", "UPDATE code_signing_info SET invalid=?, placeholder=?, registered_by_caller=?, data_container_class=? WHERE code_signing_id_text=?;",
          v8,
          v9,
          1,
          v26);
  id v12 = v26[0];
  id v13 = v12;
  if (!v11)
  {
    uint32_t v14 = [v12 domain];
    if ([v14 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v15 = [v13 code];

      if (v15 == 68)
      {

        id v23 = 0;
        BOOL v16 = -[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:](self, "_performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:", "INSERT INTO code_signing_info (invalid, placeholder, registered_by_caller, data_container_class, code_signing_id_text) VALUES (?, ?, ?, ?, ?);",
                v8,
                v9,
                0,
                &v23);
        id v13 = v23;
        if (v16)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_104;
        void v21[3] = &unk_1E6A80A30;
        __int16 v17 = &v22;
        id v22 = v9;
        uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_104((uint64_t)v21);
        goto LABEL_8;
      }
    }
    else
    {
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke;
    v24[3] = &unk_1E6A80A30;
    __int16 v17 = &v25;
    id v25 = v9;
    uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke((uint64_t)v24);
LABEL_8:
    __int16 v19 = (void *)v18;

    if (a5)
    {
      id v13 = v19;
      BOOL v10 = 0;
      *a5 = v13;
    }
    else
    {
      BOOL v10 = 0;
      id v13 = v19;
    }
  }
LABEL_11:

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"Error performing UPDATE operation for %@", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11E40;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v4];

  return v6;
}

id __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_104(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"Error performing INSERT operation for %@", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11E58;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v4];

  return v6;
}

- (BOOL)_performInsertOrUpdateQuery:(const char *)a3 withCodeSigningEntry:(id)a4 forIdentifier:(id)a5 isUpdate:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  ppStmt = 0;
  uint32_t v14 = [(MCMSQLiteDB *)self db];
  if (!sqlite3_prepare_v2(v14, a3, -1, &ppStmt, 0))
  {
    if (sqlite3_bind_int(ppStmt, 1, [v12 isInvalid]))
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_58;
      v53[3] = &unk_1E6A80470;
      id v54 = v12;
      uint64_t v55 = self;
      v56 = v14;
      BOOL v16 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_58((uint64_t)v53);
      __int16 v17 = v54;
    }
    else
    {
      int v18 = [v12 isPlaceholder];
      if ([v12 isAdvanceCopy]) {
        int v19 = 2;
      }
      else {
        int v19 = 0;
      }
      int v20 = v19 | v18;
      if ([v12 isRegisteredByKernel]) {
        int v21 = 4;
      }
      else {
        int v21 = 0;
      }
      int v22 = v20 | v21;
      if (sqlite3_bind_int(ppStmt, 2, v22))
      {
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_64;
        v48[3] = &unk_1E6A804E8;
        int v52 = v22;
        id v49 = v12;
        v50 = self;
        long long v51 = v14;
        BOOL v16 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_64((uint64_t)v48);
        __int16 v17 = v49;
      }
      else if (sqlite3_bind_int(ppStmt, 3, [v12 isRegisteredByCaller]))
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_70;
        v44[3] = &unk_1E6A80470;
        id v45 = v12;
        __int16 v46 = self;
        uint64_t v47 = v14;
        BOOL v16 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_70((uint64_t)v44);
        __int16 v17 = v45;
      }
      else if (sqlite3_bind_int(ppStmt, 4, [v12 dataContainerClass]))
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_76;
        v40[3] = &unk_1E6A80470;
        id v41 = v12;
        uint64_t v42 = self;
        __int16 v43 = v14;
        BOOL v16 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_76((uint64_t)v40);
        __int16 v17 = v41;
      }
      else
      {
        id v23 = ppStmt;
        id v24 = v13;
        if (!sqlite3_bind_text(v23, 5, (const char *)[v24 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
        {
          if (sqlite3_step(ppStmt) == 101)
          {
            if (!v8 || (int v32 = sqlite3_changes(v14), v32 == 1))
            {
              BOOL v16 = 0;
              BOOL v25 = 1;
              goto LABEL_22;
            }
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_91;
            v33[3] = &unk_1E6A80448;
            void v33[4] = self;
            v33[5] = a3;
            int v34 = v32;
            uint64_t v15 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_91((uint64_t)v33);
          }
          else
          {
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_88;
            v35[3] = &unk_1E6A80498;
            void v35[4] = self;
            v35[5] = v14;
            uint64_t v15 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_88((uint64_t)v35);
          }
          goto LABEL_3;
        }
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_82;
        v36[3] = &unk_1E6A80470;
        id v37 = v24;
        id v38 = self;
        long long v39 = v14;
        BOOL v16 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_82((uint64_t)v36);
        __int16 v17 = v37;
      }
    }

    goto LABEL_21;
  }
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke;
  v57[3] = &unk_1E6A80498;
  v57[4] = self;
  v57[5] = v14;
  uint64_t v15 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke((uint64_t)v57);
LABEL_3:
  BOOL v16 = (void *)v15;
LABEL_21:
  BOOL v25 = 0;
LABEL_22:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    id v26 = container_log_handle_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v29 = [(MCMSQLiteDB *)self url];
      __int16 v30 = [v29 path];
      int v31 = sqlite3_extended_errcode(v14);
      *(_DWORD *)buf = 138412546;
      v60 = v30;
      __int16 v61 = 1024;
      int v62 = v31;
      _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (a7) {
    char v27 = v25;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0) {
    *a7 = v16;
  }

  return v25;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  uint64_t v4 = [v3 path];
  id v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(insert) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11D80;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_58(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  unsigned int v3 = [*(id *)(a1 + 32) isInvalid];
  uint64_t v4 = [*(id *)(a1 + 40) url];
  id v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for invalid=%d at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11D98;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  BOOL v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_64(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  unsigned int v3 = [*(id *)(a1 + 32) isPlaceholder];
  unsigned int v4 = [*(id *)(a1 + 32) isAdvanceCopy];
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 40) url];
  uint64_t v7 = [v6 path];
  uint64_t v8 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for placeholder=%d, advance_copy=%d (flags=%d) at %@ failed: %d", v3, v4, v5, v7, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v17[0] = @"FunctionName";
  id v9 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v18[0] = v9;
  v18[1] = &unk_1F2F11DB0;
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v17[1] = @"SourceFileLine";
  v17[2] = v10;
  v18[2] = v8;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  id v12 = container_log_handle_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v16 = v8;
    _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v11];

  return v13;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_70(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  unsigned int v3 = [*(id *)(a1 + 32) isRegisteredByCaller];
  unsigned int v4 = [*(id *)(a1 + 40) url];
  uint64_t v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for registered_by_caller=%d at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11DC8;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  uint64_t v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_76(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) dataContainerClass];
  unsigned int v4 = [*(id *)(a1 + 40) url];
  uint64_t v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for data_container_class=%llu at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11DE0;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  uint64_t v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_82(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = [*(id *)(a1 + 40) url];
  uint64_t v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11DF8;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  uint64_t v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_88(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  unsigned int v4 = [v3 path];
  uint64_t v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11E10;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_91(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  unsigned int v4 = [*(id *)(a1 + 32) url];
  uint64_t v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_changes for %s in %@: %d, but expecting 1", v3, v5, *(unsigned int *)(a1 + 48)];

  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F11E28;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:68 userInfo:v9];

  return v10;
}

- (BOOL)_insertChildIdentifier:(id)a3 forParentIdentifier:(id)a4 error:(id *)a5
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v17[0] = 0;
  BOOL v10 = -[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:](self, "_performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:", "INSERT OR REPLACE INTO child_bundles (parent_id, child_code_signing_id_text) SELECT id, ? FROM code_signing_info WHERE code_signing_id_text = ?;",
          v8,
          v9,
          0xFFFFFFFFLL,
          v17);
  id v11 = v17[0];
  if (v10)
  {
    id v12 = [(MCMSQLiteDB *)self peerageDelegate];
    [v12 codeSigningDB:self addChildIdentifier:v8 forParentIdentifier:v9];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke;
    void v15[3] = &unk_1E6A80A30;
    id v16 = v8;
    id v13 = __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke((uint64_t)v15);

    if (a5)
    {
      id v11 = v13;
      *a5 = v11;
    }
    else
    {
      id v11 = v13;
    }
  }

  return v10;
}

id __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"Error performing INSERT operation for child %@", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertChildIdentifier:forParentIdentifier:error:]_block_invoke"];
  v11[0] = v2;
  v11[1] = &unk_1F2F11D68;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  unsigned int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  uint64_t v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v1;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v4];

  return v6;
}

- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 error:(id *)a5
{
  return [(MCMSQLiteDB *)self _performSingleParameterQuery:a3 withTextInput:a4 expectedChanges:0xFFFFFFFFLL error:a5];
}

- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 expectedChanges:(int)a5 error:(id *)a6
{
  return [(MCMSQLiteDB *)self _performTwoParameterQuery:a3 withTextInputOne:a4 andTextInputTwo:0 expectedChanges:*(void *)&a5 error:a6];
}

- (BOOL)_performTwoParameterQuery:(const char *)a3 withTextInputOne:(id)a4 andTextInputTwo:(id)a5 expectedChanges:(int)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  ppStmt = 0;
  uint32_t v14 = [(MCMSQLiteDB *)self db];
  if (!sqlite3_prepare_v2(v14, a3, -1, &ppStmt, 0))
  {
    __int16 v17 = ppStmt;
    id v18 = v12;
    if (sqlite3_bind_text(v17, 1, (const char *)[v18 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_29;
      v38[3] = &unk_1E6A80470;
      id v39 = v18;
      long long v40 = self;
      id v41 = v14;
      id v16 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_29((uint64_t)v38);
      int v19 = v39;
    }
    else
    {
      if (!v13
        || (id v24 = ppStmt,
            id v25 = v13,
            !sqlite3_bind_text(v24, 2, (const char *)[v25 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)))
      {
        if (sqlite3_step(ppStmt) == 101)
        {
          if (a6 == -1 || (int v26 = sqlite3_changes(v14), v26 == a6))
          {
            id v16 = 0;
            BOOL v20 = 1;
            goto LABEL_8;
          }
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_44;
          void v30[3] = &unk_1E6A804C0;
          void v30[4] = self;
          v30[5] = a3;
          int v31 = v26;
          int v32 = a6;
          uint64_t v15 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_44((uint64_t)v30);
        }
        else
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_38;
          v33[3] = &unk_1E6A80498;
          void v33[4] = self;
          v33[5] = v14;
          uint64_t v15 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_38((uint64_t)v33);
        }
        goto LABEL_3;
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_35;
      v34[3] = &unk_1E6A80470;
      id v35 = v25;
      id v36 = self;
      id v37 = v14;
      id v16 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_35((uint64_t)v34);
      int v19 = v35;
    }

    goto LABEL_7;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke;
  v42[3] = &unk_1E6A80498;
  v42[4] = self;
  v42[5] = v14;
  uint64_t v15 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke((uint64_t)v42);
LABEL_3:
  id v16 = (void *)v15;
LABEL_7:
  BOOL v20 = 0;
LABEL_8:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    int v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v27 = [(MCMSQLiteDB *)self url];
      int v28 = [v27 path];
      int v29 = sqlite3_extended_errcode(v14);
      *(_DWORD *)buf = 138412546;
      id v45 = v28;
      __int16 v46 = 1024;
      int v47 = v29;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }
  if (a7) {
    char v22 = v20;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0) {
    *a7 = v16;
  }

  return v20;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  unsigned int v4 = [v3 path];
  uint64_t v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(insert) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11CF0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_29(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = [*(id *)(a1 + 40) url];
  uint64_t v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for identifier=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11D08;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  BOOL v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_35(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = [*(id *)(a1 + 40) url];
  uint64_t v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for identifier=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  v16[0] = v7;
  v16[1] = &unk_1F2F11D20;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  BOOL v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];

  return v11;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_38(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) url];
  unsigned int v4 = [v3 path];
  uint64_t v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11D38;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_44(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  unsigned int v4 = [*(id *)(a1 + 32) url];
  uint64_t v5 = [v4 path];
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_changes for %s in %@: %d, but expecting %d", v3, v5, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52)];

  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F11D50;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:68 userInfo:v9];

  return v10;
}

- (void)closeDB
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = container_log_handle_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(MCMSQLiteDB *)self url];
    uint64_t v8 = [v7 path];
    int v11 = 138412290;
    id v12 = v8;
    _os_log_debug_impl(&dword_1D7739000, v3, OS_LOG_TYPE_DEBUG, "closing %@", (uint8_t *)&v11, 0xCu);
  }
  int v4 = sqlite3_close([(MCMSQLiteDB *)self db]);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(MCMSQLiteDB *)self url];
      BOOL v10 = [v9 path];
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "sqlite3_close for %@ failed: %d", (uint8_t *)&v11, 0x12u);
    }
  }
  [(MCMSQLiteDB *)self setDb:0];
}

- (BOOL)_sqliteExec:(id)a3 error:(id *)a4
{
  errmsg[1] = *(char **)MEMORY[0x1E4F143B8];
  id v6 = a3;
  errmsg[0] = 0;
  uint64_t v7 = [(MCMSQLiteDB *)self db];
  id v8 = v6;
  int v9 = sqlite3_exec(v7, (const char *)[v8 UTF8String], 0, 0, errmsg);
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__MCMSQLiteDB__sqliteExec_error___block_invoke;
    void v12[3] = &unk_1E6A80470;
    id v13 = v8;
    int v14 = self;
    uint64_t v15 = errmsg[0];
    __33__MCMSQLiteDB__sqliteExec_error___block_invoke((uint64_t)v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_free(errmsg[0]);

    if (a4)
    {
      id v10 = v10;
      *a4 = v10;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v9 == 0;
}

id __33__MCMSQLiteDB__sqliteExec_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) url];
  int v5 = (void *)[v2 initWithFormat:@"%@ on %@ failed: %s", v3, v4, *(void *)(a1 + 48)];

  v14[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMSQLiteDB _sqliteExec:error:]_block_invoke"];
  v15[0] = v6;
  v15[1] = &unk_1F2F11CD8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  int v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(MCMSQLiteDB *)self closeDB];
  v3.receiver = self;
  v3.super_class = (Class)MCMSQLiteDB;
  [(MCMSQLiteDB *)&v3 dealloc];
}

- (MCMSQLiteDB)initWithURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2(v10);
  v17.receiver = self;
  v17.super_class = (Class)MCMSQLiteDB;
  int v11 = [(MCMSQLiteDB *)&v17 init];
  id v12 = v11;
  if (v11
    && ((objc_storeStrong((id *)&v11->_queue, a4), objc_storeStrong((id *)&v12->_url, a3), !v12->_url)
     || ((uint64_t v13 = [(id)objc_opt_class() openDBWithURL:v12->_url queue:v10 error:a5],
          v12->_db = (sqlite3 *)v13,
          v12->_url)
       ? (BOOL v14 = v13 == 0)
       : (BOOL v14 = 1),
         v14)))
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = v12;
  }

  return v15;
}

+ (sqlite3)openDBWithURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(v8);
  ppDb = 0;
  id v9 = container_log_handle_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 path];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEFAULT, "Opening [%@]", buf, 0xCu);
  }
  id v11 = v7;
  if (sqlite3_open_v2((const char *)[v11 fileSystemRepresentation], &ppDb, 4194310, 0))
  {
    int v12 = sqlite3_extended_errcode(ppDb);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke;
    v25[3] = &unk_1E6A80448;
    char v27 = ppDb;
    id v13 = v11;
    id v26 = v13;
    int v28 = v12;
    BOOL v14 = __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke((uint64_t)v25);
    uint64_t v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = [v13 path];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "opening %@ failed: xerr = %d", buf, 0x12u);
    }
    sqlite3_close(ppDb);

    goto LABEL_8;
  }
  errmsg = 0;
  int v16 = sqlite3_exec(ppDb, "PRAGMA locking_mode = EXCLUSIVE;PRAGMA journal_mode = WAL;PRAGMA foreign_keys = ON;PRAGMA auto_vacuum = FULL;C"
          "REATE TABLE IF NOT EXISTS code_signing_info(id INTEGER PRIMARY KEY AUTOINCREMENT,code_signing_id_text TEXT NOT"
          " NULL UNIQUE,invalid INTEGER NOT NULL DEFAULT 0,placeholder INTEGER NOT NULL DEFAULT 0,registered_by_caller IN"
          "TEGER NOT NULL DEFAULT 0,data_container_class INTEGER NOT NULL DEFAULT 0);CREATE TABLE IF NOT EXISTS code_sign"
          "ing_data(id INTEGER PRIMARY KEY AUTOINCREMENT,cs_info_id INTEGER NOT NULL UNIQUE,data BLOB NOT NULL,FOREIGN KE"
          "Y(cs_info_id) REFERENCES code_signing_info(id) ON DELETE CASCADE);CREATE TABLE IF NOT EXISTS child_bundles(id "
          "INTEGER PRIMARY KEY AUTOINCREMENT,child_code_signing_id_text TEXT NOT NULL UNIQUE,parent_id INTEGER NOT NULL,F"
          "OREIGN KEY(parent_id) REFERENCES code_signing_info(id) ON DELETE CASCADE);CREATE INDEX IF NOT EXISTS code_sign"
          "ing_id_text_idx ON code_signing_info(code_signing_id_text);CREATE INDEX IF NOT EXISTS cs_info_id_idx ON code_s"
          "igning_data(cs_info_id);CREATE INDEX IF NOT EXISTS parent_id_idx ON child_bundles(parent_id);",
          0,
          0,
          &errmsg);
  BOOL v14 = 0;
  if (!v16)
  {
LABEL_8:
    objc_super v17 = ppDb;
    if (a5)
    {
      if (!ppDb)
      {
        *a5 = v14;
        objc_super v17 = ppDb;
      }
    }

    return v17;
  }
  int v20 = v16;
  int v21 = sqlite3_extended_errcode(ppDb);
  char v22 = container_log_handle_for_category();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = [v11 path];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = errmsg;
    _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "table create for %@ failed: %s", buf, 0x16u);
  }
  sqlite3_free(errmsg);
  int v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  memset(buf, 0, sizeof(buf));
  snprintf((char *)buf, 0x64uLL, "Failed to initialize database, err = %d, xerr = %d", v20, v21);
  sqlite3_close(ppDb);
  result = (sqlite3 *)_os_crash();
  __break(1u);
  return result;
}

id __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  objc_super v3 = [@"opening %@ failed: xerr = %d" stringByAppendingFormat:@", errmsg: %s", sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];
  uint64_t v4 = [*(id *)(a1 + 32) path];
  int v5 = objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"+[MCMSQLiteDB openDBWithURL:queue:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11CC0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.containermanagerd.SQLite" code:sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)) userInfo:v8];

  return v9;
}

+ (BOOL)moveDBWithURL:(id)a3 toURL:(id)a4 queue:(id)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)a5);
  ppDb = 0;
  id v11 = v9;
  if (sqlite3_open_v2((const char *)[v11 fileSystemRepresentation], &ppDb, 1, 0))
  {
    int v12 = sqlite3_extended_errcode(ppDb);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke;
    v33[3] = &unk_1E6A80448;
    int v35 = ppDb;
    id v13 = v11;
    long long v34 = v13;
    int v36 = v12;
    BOOL v14 = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke((uint64_t)v33);
    uint64_t v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v13 path];
      *(_DWORD *)buf = 138412546;
      id v39 = v26;
      __int16 v40 = 1024;
      LODWORD(v41) = v12;
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "opening %@ failed: xerr = %d", buf, 0x12u);
    }
    BOOL v16 = 0;
    objc_super v17 = v34;
  }
  else
  {
    id v18 = v10;
    [v18 fileSystemRepresentation];
    if (_sqlite3_db_copy_compact())
    {
      int v19 = sqlite3_extended_errcode(ppDb);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_8;
      v29[3] = &unk_1E6A80448;
      long long v31 = ppDb;
      int v20 = v11;
      __int16 v30 = v20;
      int v32 = v19;
      BOOL v14 = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_8((uint64_t)v29);
      int v21 = container_log_handle_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        char v27 = [v20 path];
        int v28 = [v18 path];
        *(_DWORD *)buf = 138412802;
        id v39 = v27;
        __int16 v40 = 2112;
        id v41 = v28;
        __int16 v42 = 1024;
        int v43 = v19;
        _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "copying [%@] to [%@] failed: xerr = %d", buf, 0x1Cu);
      }
      BOOL v16 = 0;
      objc_super v17 = v30;
    }
    else
    {
      objc_super v17 = container_log_handle_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        char v22 = [v11 path];
        id v23 = [v18 path];
        *(_DWORD *)buf = 138412546;
        id v39 = v22;
        __int16 v40 = 2112;
        id v41 = v23;
        _os_log_impl(&dword_1D7739000, v17, OS_LOG_TYPE_DEFAULT, "Moved [%@] to [%@]", buf, 0x16u);
      }
      BOOL v14 = 0;
      BOOL v16 = 1;
    }
  }

  if (ppDb) {
    sqlite3_close(ppDb);
  }
  if (a6) {
    char v24 = v16;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0) {
    *a6 = v14;
  }

  return v16;
}

id __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  objc_super v3 = [@"opening %@ failed: xerr = %x" stringByAppendingFormat:@", errmsg: %s", sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];
  uint64_t v4 = [*(id *)(a1 + 32) path];
  int v5 = objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"+[MCMSQLiteDB moveDBWithURL:toURL:queue:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11C90;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.containermanagerd.SQLite" code:sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)) userInfo:v8];

  return v9;
}

id __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_8(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  objc_super v3 = [@"opening %@ failed: xerr = %x" stringByAppendingFormat:@", errmsg: %s", sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];
  uint64_t v4 = [*(id *)(a1 + 32) path];
  int v5 = objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"+[MCMSQLiteDB moveDBWithURL:toURL:queue:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11CA8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.containermanagerd.SQLite" code:sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)) userInfo:v8];

  return v9;
}

@end