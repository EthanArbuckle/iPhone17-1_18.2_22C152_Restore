@interface IMDAbstractDatabaseDowngrader
- (BOOL)copyDatabase:(id)a3;
- (id)createDowngradeHelper;
@end

@implementation IMDAbstractDatabaseDowngrader

- (id)createDowngradeHelper
{
  return 0;
}

- (BOOL)copyDatabase:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMDAbstractDatabaseDowngrader *)self createDowngradeHelper];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3052000000;
  v38 = sub_1AFBED1C4;
  v39 = sub_1AFBED1D4;
  uint64_t v40 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1AFBED1E0;
  v34[3] = &unk_1E5F8D498;
  v34[4] = &v35;
  [v5 open:v34];
  v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Downgrade: Opening new coral database", (uint8_t *)buf, 2u);
  }
  if (!v36[5])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1AFBED1F0;
    v33[3] = &unk_1E5F8D498;
    v33[4] = &v35;
    [v5 beginTransaction:v33];
    if (!v36[5])
    {
      v7 = IMLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Downgrade: Creating Tables", (uint8_t *)buf, 2u);
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = sub_1AFBED200;
      v32[3] = &unk_1E5F8D498;
      v32[4] = &v35;
      [v5 createTables:v32];
      if (v36[5]) {
        goto LABEL_11;
      }
      v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Downgrade: Creating Indexes", (uint8_t *)buf, 2u);
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1AFBED210;
      v31[3] = &unk_1E5F8D498;
      v31[4] = &v35;
      [v5 createIndexes:v31];
      if (v36[5])
      {
LABEL_11:
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = sub_1AFBED220;
        v30[3] = &unk_1E5F8D498;
        v30[4] = &v35;
        [v5 revertTransaction:v30];
      }
      else
      {
        v21 = IMLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "Downgrade: Committing phase 1", (uint8_t *)buf, 2u);
        }
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = sub_1AFBED230;
        v29[3] = &unk_1E5F8D498;
        v29[4] = &v35;
        [v5 commitTransaction:v29];
      }
      if (!v36[5])
      {
        v9 = IMLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Downgrade: Beginning to copy tables", (uint8_t *)buf, 2u);
        }
        memset(buf, 0, sizeof(buf));
        IMDSqlOperationInitAndCreateIfNeededWithPath((uint64_t)[(IMAbstractDatabaseArchiver *)self sourcePath], buf);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = sub_1AFBED240;
        v28[3] = &unk_1E5F8D498;
        v28[4] = &v35;
        [v5 importDataFromWhitetailDatabaseWithSqlOperation:buf resultBlock:v28];
        IMDSqlOperationRelease((uint64_t)buf, v36 + 5);
        if (v36[5]) {
          goto LABEL_23;
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = sub_1AFBED250;
        v27[3] = &unk_1E5F8D498;
        v27[4] = &v35;
        [v5 beginTransaction:v27];
        if (v36[5]) {
          goto LABEL_23;
        }
        v10 = IMLogHandleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Downgrade: Creating triggers", v26, 2u);
        }
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_1AFBED260;
        v25[3] = &unk_1E5F8D498;
        v25[4] = &v35;
        [v5 createTriggers:v25];
        if (v36[5]) {
          goto LABEL_23;
        }
        v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Downgrade: Updating Version", v26, 2u);
        }
        uint64_t v12 = [v5 downgradesToVersion];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = sub_1AFBED270;
        v24[3] = &unk_1E5F8D498;
        v24[4] = &v35;
        [v5 writeDatabaseVersion:v12 resultBlock:v24];
        if (v36[5])
        {
LABEL_23:
          [v5 revertTransaction:&unk_1F084CEE0];
        }
        else
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = sub_1AFBED284;
          v23[3] = &unk_1E5F8D498;
          v23[4] = &v35;
          [v5 commitTransaction:v23];
          v22 = IMLogHandleForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Downgrade: Committing phase 2", v26, 2u);
          }
        }
      }
    }
  }
  if ([v5 isOpen]) {
    [v5 close:&unk_1F084D0C0];
  }

  if (!v36[5])
  {
    v18 = IMLogHandleForCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    LOWORD(buf[0]) = 0;
    v15 = "Downgrade completed ok! :-D";
    v16 = v18;
    uint32_t v17 = 2;
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(id)v36[5] localizedDescription];
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v14;
      v15 = "Database downgrade failed with error: %@";
      v16 = v13;
      uint32_t v17 = 12;
LABEL_32:
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)buf, v17);
    }
  }
LABEL_33:
  if (a3) {
    (*((void (**)(id, BOOL))a3 + 2))(a3, v36[5] == 0);
  }
  BOOL v19 = v36[5] == 0;
  _Block_object_dispose(&v35, 8);
  return v19;
}

@end