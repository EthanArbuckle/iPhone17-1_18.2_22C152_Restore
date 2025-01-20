@interface CKPackageDB
+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6;
+ (BOOL)moveSQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6;
@end

@implementation CKPackageDB

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v14 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12, v13);
  id v15 = v9;
  v19 = (const char *)objc_msgSend_fileSystemRepresentation(v15, v16, v17, v18);
  id v20 = v10;
  v24 = (const char *)objc_msgSend_fileSystemRepresentation(v20, v21, v22, v23);
  db = 0;
  ppDb = 0;
  uint64_t v25 = sqlite3_open_v2(v19, &ppDb, 1, 0);
  if (v25)
  {
    if (a6)
    {
      uint64_t v27 = v25;
      v28 = ppDb;
      if (ppDb) {
        v28 = (void *)sqlite3_errmsg(ppDb);
      }
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 7000, @"Error opening SQLite file: %s (%d)", v28, v27);
      BOOL v29 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v29 = 0;
    }
    goto LABEL_51;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v30 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v97 = v15;
    _os_log_debug_impl(&dword_18AF10000, v30, OS_LOG_TYPE_DEBUG, "Opened SQLite file at %{public}@", buf, 0xCu);
  }
  v34 = objc_msgSend_stringByDeletingLastPathComponent(v20, v31, v32, v33);
  char DirectoryAtPath_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v35, (uint64_t)v34, 1, 0, a6);

  if ((DirectoryAtPath_withIntermediateDirectories_attributes_error & 1) == 0)
  {
LABEL_36:
    BOOL v29 = 0;
    goto LABEL_51;
  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v26, v37, v38);
  double v40 = v39;
  while (1)
  {
    uint64_t v41 = _sqlite3_db_clone();
    if (v41 != 5)
    {
      uint64_t v49 = v41;
      if (!v41)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v50 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          id v97 = v20;
          _os_log_debug_impl(&dword_18AF10000, v50, OS_LOG_TYPE_DEBUG, "Cloning SQLite file to %{public}@", buf, 0xCu);
        }
        uint64_t v51 = sqlite3_open_v2(v24, &db, 2, 0);
        if (v51)
        {
          if (a6)
          {
            uint64_t v52 = v51;
            if (db)
            {
              v53 = sqlite3_errmsg(db);
              if (db)
              {
                uint64_t v54 = sqlite3_extended_errcode(db);
LABEL_49:
                objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 7000, @"Error opening SQLite file: %s,%d (%d)", v53, v54, v52);
                goto LABEL_50;
              }
            }
            else
            {
              v53 = 0;
            }
            uint64_t v54 = 0xFFFFFFFFLL;
            goto LABEL_49;
          }
LABEL_90:
          BOOL v29 = 0;
          goto LABEL_51;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v57 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          id v97 = v20;
          __int16 v98 = 1024;
          int v99 = 2;
          _os_log_debug_impl(&dword_18AF10000, v57, OS_LOG_TYPE_DEBUG, "Opened SQLite file for copying at %{public}@ with flags 0x%x", buf, 0x12u);
        }
        uint64_t v58 = sqlite3_wal_checkpoint_v2(db, 0, 2, 0, 0);
        if (!v58)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v81 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v97 = v15;
            _os_log_debug_impl(&dword_18AF10000, v81, OS_LOG_TYPE_DEBUG, "Checkpointed copied SQLite file at %{public}@", buf, 0xCu);
          }
          uint64_t v82 = sqlite3_close(db);
          db = 0;
          if (!v82)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v86 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v97 = v20;
              _os_log_debug_impl(&dword_18AF10000, v86, OS_LOG_TYPE_DEBUG, "Closed SQLite file at %{public}@", buf, 0xCu);
            }
            BOOL v29 = 1;
            goto LABEL_51;
          }
          if (a6)
          {
            uint64_t v83 = v82;
            v84 = sqlite3_errmsg(0);
            uint64_t v88 = sqlite3_extended_errcode(db);
            objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v85, @"CKInternalErrorDomain", 7004, v15, @"Error closing copied SQLite file: %s,%d (%d)", v84, v88, v83);
            goto LABEL_50;
          }
          goto LABEL_90;
        }
        if (!a6) {
          goto LABEL_90;
        }
        uint64_t v59 = v58;
        v60 = sqlite3_errmsg(db);
        uint64_t v87 = sqlite3_extended_errcode(db);
        objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v61, @"CKInternalErrorDomain", 7003, v15, @"Error checkpointing copied SQLite file: %s,%d (%d)", v60, v87, v59);
LABEL_50:
        BOOL v29 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
      if (!a6) {
        goto LABEL_90;
      }
      if (ppDb)
      {
        v55 = sqlite3_errmsg(ppDb);
        if (ppDb)
        {
          uint64_t v56 = sqlite3_extended_errcode(ppDb);
LABEL_46:
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 7002, @"Error cloning SQLite file: %s,%d (%d)", v55, v56, v49);
          goto LABEL_50;
        }
      }
      else
      {
        v55 = 0;
      }
      uint64_t v56 = 0xFFFFFFFFLL;
      goto LABEL_46;
    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v26, v42, v43);
    if (v44 - v40 >= a5) {
      break;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v45 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v97 = v15;
      _os_log_debug_impl(&dword_18AF10000, v45, OS_LOG_TYPE_DEBUG, "Waiting for busy SQLite database at %{public}@", buf, 0xCu);
    }
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E4F29060], v46, v47, v48, 0.1);
  }
  if (!a6) {
    goto LABEL_36;
  }
  objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 7001, v15, @"SQLite file is busy");
  BOOL v29 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:
  if (ppDb)
  {
    int v62 = sqlite3_close(ppDb);
    if (v62)
    {
      int v63 = v62;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v64 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v97 = v15;
        __int16 v98 = 1024;
        int v99 = v63;
        _os_log_impl(&dword_18AF10000, v64, OS_LOG_TYPE_INFO, "Warn: Error closing SQLite file at %@: %d", buf, 0x12u);
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v65 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v97 = v15;
        _os_log_debug_impl(&dword_18AF10000, v65, OS_LOG_TYPE_DEBUG, "Closed SQLite file at %{public}@", buf, 0xCu);
      }
    }
  }
  if (!db) {
    goto LABEL_71;
  }
  int v66 = sqlite3_close(db);
  if (!v66)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v69 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v97 = v20;
      _os_log_debug_impl(&dword_18AF10000, v69, OS_LOG_TYPE_DEBUG, "Closed SQLite file at %{public}@", buf, 0xCu);
      if (v29) {
        goto LABEL_80;
      }
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  int v67 = v66;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v68 = ck_log_facility_ck;
  if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
LABEL_71:
    if (!v29) {
      goto LABEL_72;
    }
    goto LABEL_80;
  }
  *(_DWORD *)buf = 138543618;
  id v97 = v20;
  __int16 v98 = 1024;
  int v99 = v67;
  _os_log_impl(&dword_18AF10000, v68, OS_LOG_TYPE_INFO, "Warn: Error closing SQLite file at %{public}@: %d", buf, 0x12u);
  if (v29) {
    goto LABEL_80;
  }
LABEL_72:
  objc_msgSend_removeItemAtPath_error_(v14, v26, (uint64_t)v20, 0);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v70 = CKSQLiteJournalSuffixes();
  uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v89, (uint64_t)v95, 16);
  if (v72)
  {
    uint64_t v75 = v72;
    uint64_t v76 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v90 != v76) {
          objc_enumerationMutation(v70);
        }
        v78 = objc_msgSend_stringByAppendingString_(v20, v73, *(void *)(*((void *)&v89 + 1) + 8 * i), v74);
        objc_msgSend_removeItemAtPath_error_(v14, v79, (uint64_t)v78, 0);
      }
      uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v89, (uint64_t)v95, 16);
    }
    while (v75);
  }

LABEL_80:
  return v29;
}

+ (BOOL)moveSQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v8 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v9 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v64 = v9;
    v68 = objc_msgSend_CKSanitizedPath(v77, v65, v66, v67);
    uint64_t v72 = objc_msgSend_CKSanitizedPath(v8, v69, v70, v71);
    *(_DWORD *)buf = 138543618;
    id v90 = v68;
    __int16 v91 = 2114;
    id v92 = v72;
    _os_log_debug_impl(&dword_18AF10000, v64, OS_LOG_TYPE_DEBUG, "Moving db at %{public}@ to %{public}@", buf, 0x16u);
  }
  uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v10, v11, v12);
  uint64_t v17 = objc_msgSend_stringByDeletingLastPathComponent(v8, v14, v15, v16);
  id v88 = 0;
  int v19 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v13, v18, (uint64_t)v17, 1, 0, &v88);
  id v20 = v88;

  if (v19)
  {
    v73 = a6;
    objc_msgSend_removeItemAtPath_error_(v13, v21, (uint64_t)v8, 0);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v22 = CKSQLiteJournalSuffixes();
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v84, (uint64_t)v96, 16);
    if (v24)
    {
      uint64_t v27 = v24;
      uint64_t v28 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v85 != v28) {
            objc_enumerationMutation(v22);
          }
          v30 = objc_msgSend_stringByAppendingString_(v8, v25, *(void *)(*((void *)&v84 + 1) + 8 * i), v26);
          objc_msgSend_removeItemAtPath_error_(v13, v31, (uint64_t)v30, 0);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v84, (uint64_t)v96, 16);
      }
      while (v27);
    }

    id v83 = v20;
    char v74 = objc_msgSend_moveItemAtPath_toPath_error_(v13, v32, (uint64_t)v77, (uint64_t)v8, &v83);
    id v33 = v83;

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    CKSQLiteJournalSuffixes();
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v79, (uint64_t)v95, 16);
    if (v35)
    {
      uint64_t v38 = v35;
      uint64_t v39 = *(void *)v80;
      uint64_t v75 = *MEMORY[0x1E4F281F8];
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v80 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = *(void *)(*((void *)&v79 + 1) + 8 * j);
          uint64_t v42 = objc_msgSend_stringByAppendingString_(v77, v36, v41, v37);
          v45 = objc_msgSend_stringByAppendingString_(v8, v43, v41, v44);
          id v78 = 0;
          char v47 = objc_msgSend_moveItemAtPath_toPath_error_(v13, v46, (uint64_t)v42, (uint64_t)v45, &v78);
          id v48 = v78;

          if ((v47 & 1) == 0)
          {
            uint64_t v52 = objc_msgSend_domain(v48, v49, v50, v51);
            if (objc_msgSend_isEqualToString_(v52, v53, v75, v54))
            {
              uint64_t v58 = objc_msgSend_code(v48, v55, v56, v57);

              if (v58 == 4) {
                goto LABEL_27;
              }
            }
            else
            {
            }
            if (v33) {
              uint64_t v59 = v33;
            }
            else {
              uint64_t v59 = v48;
            }
            id v60 = v59;

            char v74 = 0;
            id v33 = v60;
          }
LABEL_27:
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v79, (uint64_t)v95, 16);
      }
      while (v38);
    }

    if (v74)
    {
      BOOL v62 = 1;
      goto LABEL_40;
    }
    a6 = v73;
  }
  else
  {
    id v33 = v20;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v61 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v90 = v77;
    __int16 v91 = 2114;
    id v92 = v8;
    __int16 v93 = 2112;
    id v94 = v33;
    _os_log_impl(&dword_18AF10000, v61, OS_LOG_TYPE_INFO, "Failed to move sqlite DB from: %{public}@, to %{public}@, due to: %@", buf, 0x20u);
  }
  if (a6)
  {
    id v33 = v33;
    BOOL v62 = 0;
    *a6 = v33;
  }
  else
  {
    BOOL v62 = 0;
  }
LABEL_40:

  return v62;
}

@end