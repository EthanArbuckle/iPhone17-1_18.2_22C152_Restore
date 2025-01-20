@interface CKSQLiteDatabase
+ (BOOL)databaseDidDealloc:(id)a3 timeout:(double)a4;
+ (id)databaseArchiveWithObject:(id)a3 error:(id *)a4;
+ (id)databaseFilePathInDirectory:(id)a3;
+ (id)databaseInDirectory:(id)a3 registryDatabase:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (id)newInMemoryDatabase:(id *)a3;
+ (id)temporaryDatabaseDirectory;
+ (id)unarchivedObjectOfClass:(id)a3 fromDatabaseArchive:(id)a4 error:(id *)a5;
+ (id)uniquingKeyForDatabaseDirectory:(id)a3;
+ (void)initialize;
+ (void)removeLegacyDatabaseAtPath:(id)a3;
+ (void)resetValidatedDatabases;
- (BOOL)databaseWasCreated;
- (BOOL)isEmpty;
- (BOOL)removeWhenClosed;
- (BOOL)tableGroupWasPreviouslyValidated:(id)a3;
- (CKSQLiteDatabase)initWithDatabaseDirectory:(id)a3 registryDatabase:(id)a4 options:(unint64_t)a5;
- (CKSQLiteDatabaseManagerTimer)databaseManagerTimer;
- (NSData)uniquingKey;
- (NSMapTable)tableGroupCache;
- (NSObject)databaseManagerData;
- (NSString)databaseDirectory;
- (id)UUIDValueForKey:(id)a3 error:(id *)a4;
- (id)_executeSQL:(const char *)a3;
- (id)_pruneTables;
- (id)_validateVersionNumbers;
- (id)allTableNames:(id *)a3;
- (id)bootstrap;
- (id)createNewDatabase;
- (id)dataValueForKey:(id)a3 error:(id *)a4;
- (id)databaseFilePath;
- (id)databaseManager:(id *)a3;
- (id)dateValueForKey:(id)a3 error:(id *)a4;
- (id)deallocToken;
- (id)description;
- (id)dropTable:(id)a3;
- (id)executeSQL:(id)a3;
- (id)keyValueCleaner;
- (id)numberValueForKey:(id)a3 error:(id *)a4;
- (id)openExistingDatabase:(BOOL)a3;
- (id)performDatabaseTransaction:(id)a3;
- (id)performInDatabaseTransaction:(id)a3;
- (id)removeDatabaseDirectory;
- (id)setDataValue:(id)a3 forKey:(id)a4;
- (id)setDateValue:(id)a3 forKey:(id)a4;
- (id)setNumberValue:(id)a3 forKey:(id)a4;
- (id)setStringValue:(id)a3 forKey:(id)a4;
- (id)setUUIDValue:(id)a3 forKey:(id)a4;
- (id)sqlErrorWithMessage:(id)a3;
- (id)stringValueForKey:(id)a3 error:(id *)a4;
- (id)tocTableGroup;
- (id)validateOpenDatabase;
- (int64_t)lastInsertRowID;
- (unint64_t)changeCount;
- (unint64_t)options;
- (void)addTransactionCompletionHandler:(id)a3;
- (void)assertInTransaction;
- (void)closeDatabase;
- (void)compiledStatementWithSQL:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)finalizeHandle:(void *)a3;
- (void)handleDatabaseBusy:(id)a3;
- (void)removeValidatedTableGroup:(id)a3;
- (void)setDatabaseManagerData:(id)a3;
- (void)setDatabaseManagerTimer:(id)a3;
- (void)setIsEmpty:(BOOL)a3;
- (void)setRemoveWhenClosed:(BOOL)a3;
- (void)setupDatabaseConnection;
- (void)tableGroupPassedValidation:(id)a3;
- (void)traceSQL;
- (void)usingTableGroupCachePerformBlock:(id)a3;
@end

@implementation CKSQLiteDatabase

- (id)numberValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v8 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v10 = objc_msgSend_numberValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1ED7F5C98, a4);

  return v10;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4
{
  BOOL v6 = a3 != 0;
  id v7 = a4;
  id v8 = a3;
  v10 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v12 = objc_msgSend_setNumberValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1ED7F5C98);

  return v12;
}

- (id)stringValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v10 = objc_msgSend_stringValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1ED7F5C98, a4);

  return v10;
}

- (id)setStringValue:(id)a3 forKey:(id)a4
{
  BOOL v6 = a3 != 0;
  id v7 = a4;
  id v8 = a3;
  v10 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v12 = objc_msgSend_setStringValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1ED7F5C98);

  return v12;
}

- (id)dataValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v10 = objc_msgSend_dataValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1ED7F5C98, a4);

  return v10;
}

- (id)setDataValue:(id)a3 forKey:(id)a4
{
  BOOL v6 = a3 != 0;
  id v7 = a4;
  id v8 = a3;
  v10 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v12 = objc_msgSend_setDataValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1ED7F5C98);

  return v12;
}

- (id)dateValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v10 = objc_msgSend_dateValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1ED7F5C98, a4);

  return v10;
}

- (id)setDateValue:(id)a3 forKey:(id)a4
{
  BOOL v6 = a3 != 0;
  id v7 = a4;
  id v8 = a3;
  v10 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v12 = objc_msgSend_setDateValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1ED7F5C98);

  return v12;
}

- (id)UUIDValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v10 = objc_msgSend_UUIDValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1ED7F5C98, a4);

  return v10;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4
{
  BOOL v6 = a3 != 0;
  id v7 = a4;
  id v8 = a3;
  v10 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v12 = objc_msgSend_setUUIDValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1ED7F5C98);

  return v12;
}

- (id)keyValueCleaner
{
  return (id)objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, a2, (uint64_t)self, 0);
}

+ (void)initialize
{
  if (!qword_1EB279EE8)
  {
    uint64_t v4 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E4F28E10], a2, v2, v3);
    v5 = (void *)qword_1EB279EE8;
    qword_1EB279EE8 = v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = (void *)qword_1EB279EF0;
    qword_1EB279EF0 = (uint64_t)v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = qword_1EB279EF8;
    qword_1EB279EF8 = (uint64_t)v8;
    MEMORY[0x1F41817F8](v8, v9);
  }
}

+ (void)resetValidatedDatabases
{
  objc_msgSend_removeAllObjects((void *)qword_1EB279EF8, a2, v2, v3);
}

+ (id)databaseArchiveWithObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(CKSQLiteDatabaseKeyedArchiver, a2, (uint64_t)a3, 1, a4);
}

+ (id)unarchivedObjectOfClass:(id)a3 fromDatabaseArchive:(id)a4 error:(id *)a5
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  objc_msgSend_addObject_(v8, v10, v9, v11);
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  v23[5] = objc_opt_class();
  v23[6] = objc_opt_class();
  v23[7] = objc_opt_class();
  v23[8] = objc_opt_class();
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v23, 9);
  objc_msgSend_addObjectsFromArray_(v8, v14, (uint64_t)v13, v15);

  v17 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(CKSQLiteDatabaseKeyedUnarchiver, v16, (uint64_t)v8, (uint64_t)v7, a5);

  if (!v17 && *a5)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v18 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      id v20 = *a5;
      int v21 = 138412290;
      id v22 = v20;
      _os_log_fault_impl(&dword_18AF10000, v18, OS_LOG_TYPE_FAULT, "Database unarchiving error (missing allowed class for NSSecureCoding?): %@", (uint8_t *)&v21, 0xCu);
    }
  }

  return v17;
}

+ (void)removeLegacyDatabaseAtPath:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  objc_msgSend_defaultManager(v3, v5, v6, v7);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtPath_error_(v21, v8, (uint64_t)v4, 0);
  uint64_t v11 = objc_msgSend_stringByAppendingString_(v4, v9, @"-journal", v10);
  objc_msgSend_removeItemAtPath_error_(v21, v12, (uint64_t)v11, 0);

  uint64_t v15 = objc_msgSend_stringByAppendingString_(v4, v13, @"-wal", v14);
  objc_msgSend_removeItemAtPath_error_(v21, v16, (uint64_t)v15, 0);

  v19 = objc_msgSend_stringByAppendingString_(v4, v17, @"-shm", v18);

  objc_msgSend_removeItemAtPath_error_(v21, v20, (uint64_t)v19, 0);
}

+ (id)uniquingKeyForDatabaseDirectory:(id)a3
{
  id v4 = objc_msgSend_databaseFilePathInDirectory_(a1, a2, (uint64_t)a3, v3);
  id v8 = v4;
  memset(&v15, 0, sizeof(v15));
  if (v4 && (uint64_t v9 = (const char *)objc_msgSend_fileSystemRepresentation(v4, v5, v6, v7), !stat(v9, &v15)))
  {
    v14[1] = v15.st_ino;
    v14[0] = v15.st_dev;
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v10 = objc_msgSend_initWithBytes_length_(v11, v12, (uint64_t)v14, 16);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)databaseManager:(id *)a3
{
  v5 = sub_18B14876C(self);
  if (v5)
  {
    uint64_t v6 = objc_msgSend_managerInDatabase_error_(CKSQLiteDatabaseManager, v4, (uint64_t)v5, (uint64_t)a3);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)databaseInDirectory:(id)a3 registryDatabase:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v122 = 0;
  v120 = (unsigned __int8 *)a4;
  v117 = a6;
  uint64_t v118 = MEMORY[0x18C12ADA0]();
  if (byte_1E912FED0)
  {
    v13 = NSString;
    uint64_t v14 = getpid();
    objc_msgSend_stringWithFormat_(v13, v15, @"_TestHost_%d", v16, v14);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      char hasSuffix = objc_msgSend_hasSuffix_(v10, v17, (uint64_t)v19, v18);
      goto LABEL_4;
    }
  }
  else
  {
    if (_sCKUseSystemInstalledBinariesPredicate != -1) {
      dispatch_once(&_sCKUseSystemInstalledBinariesPredicate, &unk_1ED7EF538);
    }
    if (!_sCKUseSystemInstalledBinaries)
    {
      v19 = @"_debug";
      char hasSuffix = objc_msgSend_hasSuffix_(v10, v11, @"_debug", v12);
LABEL_4:
      v119 = v19;
      if ((hasSuffix & 1) == 0)
      {
        uint64_t v23 = objc_msgSend_stringByAppendingString_(v10, v21, (uint64_t)v19, v22);

        id v10 = (id)v23;
      }
      goto LABEL_10;
    }
  }
  v119 = 0;
LABEL_10:
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB279EE0);
  v26 = 0;
  v27 = 0;
  if (v10) {
    unint64_t v28 = a5;
  }
  else {
    unint64_t v28 = a5 | 0x28;
  }
  while (1)
  {
    if (v10)
    {
      uint64_t v29 = objc_msgSend_uniquingKeyForDatabaseDirectory_(a1, v24, (uint64_t)v10, v25);

      v26 = (void *)v29;
      if (v29)
      {
        while ((v28 & 0x20) == 0)
        {
          objc_msgSend_objectForKey_((void *)qword_1EB279EE8, v30, (uint64_t)v26, v32);
          v33 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
          v34 = v122;
          v122 = v33;

          if (v122)
          {
            int v68 = 0;
            goto LABEL_46;
          }
          uint64_t v35 = objc_msgSend_objectForKey_((void *)qword_1EB279EF0, v30, (uint64_t)v26, v32);
          if (!v35) {
            goto LABEL_29;
          }
          v36 = v35;
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB279EE0);
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v37 = (void *)ck_log_facility_sql;
          if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
          {
            v38 = v37;
            objc_msgSend_CKSanitizedPath(v10, v39, v40, v41);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v124 = v42;
            _os_log_impl(&dword_18AF10000, v38, OS_LOG_TYPE_INFO, "Waiting for database to close at path: %{public}@", buf, 0xCu);
          }
          dispatch_group_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
          os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB279EE0);

          uint64_t v45 = objc_msgSend_uniquingKeyForDatabaseDirectory_(a1, v43, (uint64_t)v10, v44);

          v26 = (void *)v45;
          if (!v45) {
            goto LABEL_25;
          }
        }
        v55 = v122;
        v122 = 0;

        v26 = (void *)v29;
LABEL_29:
        id v56 = objc_alloc((Class)a1);
        v58 = (unsigned __int8 *)objc_msgSend_initWithDatabaseDirectory_registryDatabase_options_(v56, v57, (uint64_t)v10, (uint64_t)v120, v28);
        v59 = v122;
        v122 = v58;

        v62 = objc_msgSend_objectForKey_((void *)qword_1EB279EF8, v60, (uint64_t)v26, v61);
        BOOL v63 = v62 == 0;

        uint64_t v53 = objc_msgSend_openExistingDatabase_(v122, v64, v63, v65);

        if (v53) {
          BOOL v66 = (v28 & 2) == 0;
        }
        else {
          BOOL v66 = 0;
        }
        if (v66)
        {
          v28 |= 2uLL;
          char v54 = 1;
          goto LABEL_35;
        }
        v71 = v122;
        if (v53) {
          BOOL v101 = 1;
        }
        else {
          BOOL v101 = v122 == 0;
        }
        if (!v101)
        {
          v69 = v120;
LABEL_49:
          objc_msgSend_setupDatabaseConnection(v71, v30, v31, v32);
          objc_storeStrong((id *)v122 + 18, v26);
          objc_msgSend_setObject_forKey_((void *)qword_1EB279EE8, v72, (uint64_t)v122, (uint64_t)v26);
          objc_msgSend_setObject_forKey_((void *)qword_1EB279EF0, v73, *((void *)v122 + 17), (uint64_t)v26);
          objc_msgSend_objectForKey_((void *)qword_1EB279EF8, v74, (uint64_t)v26, v75);
          id v76 = (id)objc_claimAutoreleasedReturnValue();
          if (!v76)
          {
            id v76 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            objc_msgSend_setObject_forKey_((void *)qword_1EB279EF8, v77, (uint64_t)v76, (uint64_t)v26);
          }
          v78 = (void *)*((void *)v122 + 16);
          *((void *)v122 + 16) = v76;

          int v79 = v122[168];
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v80 = ck_log_facility_sql;
          int v68 = 1;
          if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
          {
            v81 = @"created new";
            if (!v79) {
              v81 = @"opened existing";
            }
            *(_DWORD *)buf = 138412546;
            v124 = v81;
            __int16 v125 = 2114;
            v126 = v122;
            _os_log_impl(&dword_18AF10000, v80, OS_LOG_TYPE_INFO, "CKSQLiteDatabase %@ database: %{public}@", buf, 0x16u);
          }
          goto LABEL_57;
        }
        int v68 = 1;
        v27 = (unsigned __int8 *)v53;
LABEL_37:
        v69 = v120;
LABEL_58:
        v82 = (void *)v118;
        goto LABEL_84;
      }
    }
    else
    {
    }
LABEL_25:
    if (v28) {
      break;
    }
    id v46 = objc_alloc((Class)a1);
    v48 = (unsigned __int8 *)objc_msgSend_initWithDatabaseDirectory_registryDatabase_options_(v46, v47, (uint64_t)v10, (uint64_t)v120, v28);
    v49 = v122;
    v122 = v48;

    uint64_t v53 = objc_msgSend_createNewDatabase(v122, v50, v51, v52);

    if (!v53)
    {
      if (!v10 || (v28 & 0x20) != 0)
      {
        uint64_t v70 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v30, (uint64_t)&v122, 8);
      }
      else
      {
        uint64_t v70 = objc_msgSend_uniquingKeyForDatabaseDirectory_(a1, v30, (uint64_t)v10, v32);
      }
      v26 = (void *)v70;
      v27 = 0;
      goto LABEL_45;
    }
    char v54 = 0;
    v26 = 0;
LABEL_35:
    v27 = (unsigned __int8 *)v53;
    id v67 = (id)objc_msgSend_removeDatabaseDirectory(v122, v30, v31, v32);
    if ((v54 & 1) == 0)
    {
      int v68 = 1;
      goto LABEL_37;
    }
  }
  v26 = 0;
LABEL_45:
  int v68 = 1;
LABEL_46:
  v69 = v120;
  v71 = v122;
  if (!v122 || v27) {
    goto LABEL_58;
  }
  if (v68) {
    goto LABEL_49;
  }
  if ((v28 & 8) == 0)
  {
    v69 = v120;
    goto LABEL_62;
  }
  v83 = v122;

  v71 = v122;
  v84 = v83;
  v69 = v84;
  if (!v71)
  {

    int v68 = 0;
LABEL_57:
    v82 = (void *)v118;
    goto LABEL_83;
  }
LABEL_62:
  sub_18B14876C(v71);
  v85 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v89 = v85;
  if (v85 == v69)
  {
    v27 = 0;
    v82 = (void *)v118;
  }
  else
  {
    objc_msgSend_databaseDirectory(v85, v86, v87, v88);
    v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_databaseDirectory(v69, v91, v92, v93);
    int isEqualToString = objc_msgSend_isEqualToString_(v90, v95, (uint64_t)v94, v96);

    if (isEqualToString)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v99 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v124 = v90;
        _os_log_error_impl(&dword_18AF10000, v99, OS_LOG_TYPE_ERROR, "Detected that the database at %{public}@ has been unexpectedly deleted. This process must now exit.", buf, 0xCu);
      }
      if ((v71[176] & 0x40) == 0) {
        exit(1);
      }
      v100 = @"Registry database changed";
LABEL_80:
      v82 = (void *)v118;
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v98, @"CKErrorDomain", 1, v100);
      v27 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v71[176] & 0x40) != 0)
      {
        v100 = @"Mismatched registry database";
        goto LABEL_80;
      }
      objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v98, *MEMORY[0x1E4F1C3C8], @"Mismatched registry database");
      v27 = 0;
      v82 = (void *)v118;
    }
  }
  int v68 = 0;
  if (!v27) {
LABEL_83:
  }
    v27 = 0;
LABEL_84:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB279EE0);
  if (v68 && v122 && v122[168] && v27 == 0)
  {
    id v121 = 0;
    v105 = objc_msgSend_databaseManager_(v122, v102, (uint64_t)&v121, v103);
    v27 = (unsigned __int8 *)v121;
    if (!v27)
    {
      objc_msgSend_registerDatabase_(v105, v106, (uint64_t)v122, v107);
      v27 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v27)
  {
    v108 = v122;
    v122 = 0;

    if (v117) {
      id *v117 = v27;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v109 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v112 = v109;
      objc_msgSend_CKSanitizedPath(v10, v113, v114, v115);
      v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v124 = v116;
      __int16 v125 = 2112;
      v126 = v27;
      _os_log_error_impl(&dword_18AF10000, v112, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase: failed to open/create database at %{public}@: %@", buf, 0x16u);
    }
  }
  v110 = v122;

  return v110;
}

+ (id)temporaryDatabaseDirectory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!byte_1E912FED0)
  {
    id v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)a1, @"CKSQLiteDatabase.m", 352, @"For unit test use only");
  }
  id v4 = NSTemporaryDirectory();
  objc_msgSend_getCString_maxLength_encoding_(v4, v5, (uint64_t)v13, 1024, 1);

  __strlcat_chk();
  mkdtemp(v13);
  uint64_t v7 = objc_msgSend_stringWithCString_encoding_(NSString, v6, (uint64_t)v13, 1);

  return v7;
}

+ (id)newInMemoryDatabase:(id *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CKSQLiteDatabase)initWithDatabaseDirectory:(id)a3 registryDatabase:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_init(self, v10, v11, v12);
  uint64_t v14 = v13;
  if (v13)
  {
    pthread_mutex_init((pthread_mutex_t *)(v13 + 8), 0);
    *(void *)(v14 + 72) = 0;
    uint64_t v18 = objc_msgSend_copy(v8, v15, v16, v17);
    v19 = *(void **)(v14 + 88);
    *(void *)(v14 + 88) = v18;

    *(void *)(v14 + 176) = a5;
    uint64_t v23 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E4F28E10], v20, v21, v22);
    v24 = *(void **)(v14 + 152);
    *(void *)(v14 + 152) = v23;

    dispatch_group_t v25 = dispatch_group_create();
    v26 = *(void **)(v14 + 136);
    *(void *)(v14 + 136) = v25;

    objc_storeStrong((id *)(v14 + 160), a4);
    dispatch_group_enter(*(dispatch_group_t *)(v14 + 136));
  }

  return (CKSQLiteDatabase *)v14;
}

- (void)dealloc
{
  objc_msgSend_closeDatabase(self, a2, v2, v3);
  databaseGroup = self->_databaseGroup;
  if (databaseGroup) {
    dispatch_group_leave(databaseGroup);
  }
  v6.receiver = self;
  v6.super_class = (Class)CKSQLiteDatabase;
  [(CKSQLiteDatabase *)&v6 dealloc];
}

+ (BOOL)databaseDidDealloc:(id)a3 timeout:(double)a4
{
  int64_t v4 = (uint64_t)(a4 * 1000000000.0);
  v5 = a3;
  dispatch_time_t v6 = dispatch_time(0, v4);
  intptr_t v7 = dispatch_group_wait(v5, v6);

  if (v7)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v8 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_18AF10000, v8, OS_LOG_TYPE_INFO, "Timed out waiting for database dealloc", v10, 2u);
    }
  }
  return v7 == 0;
}

- (id)deallocToken
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB279EE0);
  v5 = objc_msgSend_objectForKey_((void *)qword_1EB279EF0, v3, (uint64_t)self->_uniquingKey, v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB279EE0);

  return v5;
}

- (void)setupDatabaseConnection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  sqlite3_extended_result_codes(self->_db, 1);
  intptr_t v7 = objc_msgSend__executeSQL_(self, v3, (uint64_t)"pragma synchronous = normal", v4);
  if (v7)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v8 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138543362;
      uint64_t v16 = v7;
      _os_log_fault_impl(&dword_18AF10000, v8, OS_LOG_TYPE_FAULT, "Error setting pragma synchronous = normal: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v9 = objc_msgSend__executeSQL_(self, v5, (uint64_t)"pragma foreign_keys = ON", v6);

  if (v9)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v10 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138543362;
      uint64_t v16 = v9;
      _os_log_fault_impl(&dword_18AF10000, v10, OS_LOG_TYPE_FAULT, "Error setting pragma foreign_keys = ON: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (_sqlite3_maintain_load_factor())
  {
    uint64_t v13 = objc_msgSend_sqlErrorWithMessage_(self, v11, @"_sqlite3_maintain_load_factor failed", v12);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v14 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_fault_impl(&dword_18AF10000, v14, OS_LOG_TYPE_FAULT, "Failed to enable automatic incremental vacuum: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (id)openExistingDatabase:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_databaseFilePath(self, a2, a3, v3);
  id v10 = (const char *)objc_msgSend_fileSystemRepresentation(v6, v7, v8, v9);
  ssize_t v11 = getxattr(v10, "CKSQLiteDatabaseCorrupt", 0, 0, 0, 0);
  if (!v11) {
    goto LABEL_4;
  }
  if (v11 == -1)
  {
    if (*__error() == 93)
    {
LABEL_4:
      int v15 = 0;
      goto LABEL_8;
    }
    uint64_t v17 = __error();
    uint64_t v18 = strerror(*v17);
    uint64_t v16 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, @"CKErrorDomain", 1, @"getxattr() failed at path: %@. error = %s", v6, v18);
  }
  else
  {
    uint64_t v16 = objc_msgSend_databaseCorruptError(CKPrettyError, v12, v13, v14);
  }
  int v15 = (void *)v16;
LABEL_8:
  if (getxattr(v10, "CKSQLiteDatabaseIsOpening", 0, 0, 0, 0) == -1)
  {
    if (*__error() != 93)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v22 = (void *)ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        v33 = v22;
        v34 = __error();
        uint64_t v35 = strerror(*v34);
        *(_DWORD *)buf = 134218498;
        v38 = self;
        __int16 v39 = 2112;
        uint64_t v40 = (NSString *)v6;
        __int16 v41 = 2080;
        v42 = v35;
        _os_log_error_impl(&dword_18AF10000, v33, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: getxattr() failed checking for open crash at path: %@. error = %s", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v21 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v20, @"CKErrorDomain", 1, @"Crash during database open detected. Will not use database.");

    int v15 = (void *)v21;
  }
  uint64_t v23 = (char *)v15;
  if (!v15)
  {
    setxattr(v10, "CKSQLiteDatabaseIsOpening", "1", 1uLL, 0, 0);
    uint64_t v24 = sqlite3_open_v2(v10, &self->_db, 3211266, 0);
    if (v24)
    {
      objc_msgSend_sqlErrorWithMessage_(self, v25, @"Error opening db %@, rc=%d", v27, self, v24);
      uint64_t v23 = (char *)objc_claimAutoreleasedReturnValue();
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      unint64_t v28 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        databaseDirectory = self->_databaseDirectory;
        *(_DWORD *)buf = 134218498;
        v38 = self;
        __int16 v39 = 2114;
        uint64_t v40 = databaseDirectory;
        __int16 v41 = 2114;
        v42 = v23;
        _os_log_error_impl(&dword_18AF10000, v28, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: Could not open existing database at %{public}@ - %{public}@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    if (!v23 && v4)
    {
      objc_msgSend_validateOpenDatabase(self, v25, v26, v27);
      uint64_t v23 = (char *)objc_claimAutoreleasedReturnValue();
    }
    if (!v23) {
      goto LABEL_40;
    }
  }
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
  if (!v15)
  {
LABEL_40:
    if ((self->_options & 0x10) == 0 && removexattr(v10, "CKSQLiteDatabaseIsOpening", 0))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v31 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        v36 = self->_databaseDirectory;
        *(_DWORD *)buf = 134218498;
        v38 = self;
        __int16 v39 = 2114;
        uint64_t v40 = v36;
        __int16 v41 = 2114;
        v42 = v23;
        _os_log_error_impl(&dword_18AF10000, v31, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: removexattr() failed removing open crash detection attribute %{public}@ - %{public}@", buf, 0x20u);
      }
    }
  }

  return v23;
}

- (id)_validateVersionNumbers
{
  v98[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(CKSQLiteTOCTableEntry);
  intptr_t v7 = objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v4, v5, v6);
  objc_msgSend_setDbTableName_(v3, v8, (uint64_t)v7, v9);

  v98[0] = CKSQLiteTOCTableEntryDbVersionPropertyName;
  v98[1] = CKSQLiteTOCTableEntrySchemaPropertyName;
  ssize_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v98, 2);
  int v15 = objc_msgSend_tocTableGroup(self, v12, v13, v14);
  v19 = objc_msgSend_tocTable(v15, v16, v17, v18);
  v97 = CKSQLiteTOCTableEntryDbTablePropertyName;
  uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v97, 1);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(v19, v22, (uint64_t)v11, (uint64_t)v3, v21, 0);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v24, (uint64_t)v23, v25))
  {
    uint64_t v29 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKErrorDomain", 1, @"Missing TableGroup table in %@", self);

    id v23 = (id)v29;
  }
  if (!v23)
  {
    v30 = objc_msgSend_dbVersion(v3, v26, v27, v28);
    uint64_t v34 = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33);
    uint64_t v38 = objc_msgSend_dbVersion(CKSQLiteTOCTableGroupTable, v35, v36, v37);

    if (v34 != v38)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, @"CKErrorDomain", 1, @"CKSQLiteTOCTableGroupTable version changed for %@", self);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v42 = objc_msgSend_tocTableGroupTable(v15, v39, v40, v41);
    id v46 = objc_msgSend_schema(v3, v43, v44, v45);
    v50 = objc_msgSend_createTableSQL(v42, v47, v48, v49);
    char isEqualToString = objc_msgSend_isEqualToString_(v46, v51, (uint64_t)v50, v52);

    if ((isEqualToString & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v54, @"CKErrorDomain", 1, @"CKSQLiteTOCTableGroupTable schema changed for %@", self);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }
    v55 = objc_alloc_init(CKSQLiteTOCTableEntry);
    v59 = objc_msgSend_dbTableName(CKSQLiteTOCTable, v56, v57, v58);
    objc_msgSend_setDbTableName_(v55, v60, (uint64_t)v59, v61);

    uint64_t v96 = CKSQLiteTOCTableEntryDbTablePropertyName;
    v62 = v55;
    v64 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v63, (uint64_t)&v96, 1);
    BOOL v66 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(v19, v65, (uint64_t)v11, (uint64_t)v62, v64, 0);

    if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v67, (uint64_t)v66, v68))
    {
      uint64_t v72 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v69, @"CKErrorDomain", 1, @"Missing TOC table in %@", self);

      BOOL v66 = (void *)v72;
    }
    if (v66)
    {
      id v23 = v66;
LABEL_19:

      goto LABEL_20;
    }
    v73 = objc_msgSend_dbVersion(v62, v69, v70, v71);
    v95 = v62;
    uint64_t v77 = objc_msgSend_unsignedIntegerValue(v73, v74, v75, v76);
    uint64_t v81 = objc_msgSend_dbVersion(CKSQLiteTOCTable, v78, v79, v80);

    if (v77 == v81)
    {
      v85 = objc_msgSend_schema(v95, v82, v83, v84);
      v89 = objc_msgSend_createTableSQL(v19, v86, v87, v88);
      char v92 = objc_msgSend_isEqualToString_(v85, v90, (uint64_t)v89, v91);

      if (v92)
      {
        id v23 = 0;
LABEL_18:
        v62 = v95;
        goto LABEL_19;
      }
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v93, @"CKErrorDomain", 1, @"CKSQLiteTOCTable schema changed for %@", self);
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v82, @"CKErrorDomain", 1, @"CKSQLiteTOCTable version changed for %@", self);
    }
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_21:

  return v23;
}

- (id)_pruneTables
{
  uint64_t v5 = objc_msgSend_tocTableGroup(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_tocTableGroupTable(v5, v6, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B14A088;
  v16[3] = &unk_1E54636F8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v5;
  id v10 = v5;
  id v11 = v9;
  uint64_t v14 = objc_msgSend_performTransaction_(v11, v12, (uint64_t)v16, v13);

  return v14;
}

- (id)validateOpenDatabase
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend__validateVersionNumbers(self, a2, v2, v3);
  if (v8 || (objc_msgSend__pruneTables(self, v5, v6, v7), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v9 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218242;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_18AF10000, v9, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: failed validation: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v8;
}

- (id)bootstrap
{
  return (id)((uint64_t (*)(__objc2_class *, char *, CKSQLiteDatabase *))MEMORY[0x1F4181798])(CKSQLiteTOCTableGroup, sel_bootstrapNewDatabase_, self);
}

- (id)createNewDatabase
{
  databaseDirectory = self->_databaseDirectory;
  if (!databaseDirectory) {
    goto LABEL_5;
  }
  id v24 = 0;
  CKCreateDirectoryAtPathWithAttributes(databaseDirectory, 0, &v24);
  id v6 = v24;
  if (v6) {
    goto LABEL_14;
  }
  if (self->_databaseDirectory)
  {
    objc_msgSend_databaseFilePath(self, a2, v2, v3);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v11 = (const char *)objc_msgSend_fileSystemRepresentation(v7, v8, v9, v10);
  }
  else
  {
LABEL_5:
    uint64_t v7 = @":memory:";
    int v11 = (const char *)objc_msgSend_fileSystemRepresentation(@":memory:", a2, v2, v3);
  }
  if (!sqlite3_open_v2(v11, &self->_db, 3211270, 0))
  {

    goto LABEL_10;
  }
  objc_msgSend_sqlErrorWithMessage_(self, v12, @"Error opening db at %@", v13, self->_databaseDirectory);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_14:
    sqlite3_close(self->_db);
    self->_db = 0;
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v16 = objc_msgSend__executeSQL_(self, v14, (uint64_t)"pragma journal_mode = WAL", v15);
  if (v16)
  {
    id v19 = (void *)v16;
    objc_msgSend_sqlErrorWithMessage_(self, v17, @"Error setting pragma journal_mode = WAL", v18);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6) {
      goto LABEL_14;
    }
  }
  objc_msgSend__executeSQL_(self, v17, (uint64_t)"pragma encoding = 'UTF-16'", v18);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    goto LABEL_14;
  }
  objc_msgSend_bootstrap(self, v20, v21, v22);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    goto LABEL_14;
  }
  self->_databaseWasCreated = 1;
  self->_isEmpty = 1;
LABEL_15:

  return v6;
}

- (void)closeDatabase
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_db)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB279EE0);
    id v6 = objc_msgSend_databaseFilePath(self, v3, v4, v5);
    int v7 = sqlite3_close(self->_db);
    self->_db = 0;
    if (v7)
    {
      uint64_t v24 = objc_msgSend_sqlErrorWithMessage_(self, v8, @"sqlite3_close() failed", v9);
      if (ck_log_initialization_predicate != -1) {
        goto LABEL_21;
      }
      while (1)
      {
        uint64_t v25 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = self;
          __int16 v34 = 2112;
          uint64_t v35 = v24;
          _os_log_error_impl(&dword_18AF10000, v25, OS_LOG_TYPE_ERROR, "Failed to close database %@, error = %@", buf, 0x16u);
        }
        uint64_t v28 = objc_msgSend_stringWithFormat_(NSString, v26, @"Failed to close database %@, error = %@", v27, self, v24);
        objc_msgSend_UTF8String(v28, v29, v30, v31);
        _os_crash();
        __break(1u);
LABEL_21:
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
    }
    uniquingKey = self->_uniquingKey;
    if (uniquingKey)
    {
      objc_msgSend_removeObjectForKey_((void *)qword_1EB279EE8, v8, (uint64_t)uniquingKey, v9);
      objc_msgSend_removeObjectForKey_((void *)qword_1EB279EF0, v11, (uint64_t)self->_uniquingKey, v12);
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v13 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
    {
      if (self->_isEmpty) {
        uint64_t v18 = @" (empty)";
      }
      else {
        uint64_t v18 = &stru_1ED7F5C98;
      }
      id v19 = (void *)qword_1EB279EE8;
      id v20 = v13;
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = self;
      __int16 v34 = 2114;
      uint64_t v35 = (uint64_t)v18;
      __int16 v36 = 2048;
      uint64_t v37 = objc_msgSend_count(v19, v21, v22, v23);
      _os_log_debug_impl(&dword_18AF10000, v20, OS_LOG_TYPE_DEBUG, "Closed db %{public}@%{public}@. allDatabases.count is now %lu.", buf, 0x20u);
    }
    if (self->_isEmpty || self->_removeWhenClosed) {
      id v17 = (id)objc_msgSend_removeDatabaseDirectory(self, v14, v15, v16);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB279EE0);
  }
}

- (id)removeDatabaseDirectory
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, v2, v3);
  uint64_t v12 = objc_msgSend_databaseDirectory(self, v6, v7, v8);
  if (v12
    && (objc_msgSend_databaseFilePath(self, v9, v10, v11),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend_fileExistsAtPath_(v5, v14, (uint64_t)v13, v15),
        v13,
        v16))
  {
    objc_msgSend_CKSanitizedPath(v12, v17, v18, v19);
    id v20 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v21 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v20;
      _os_log_debug_impl(&dword_18AF10000, v21, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabase: Removing db at %{public}@", buf, 0xCu);
    }
    id v26 = 0;
    objc_msgSend_removeItemAtPath_error_(v5, v22, (uint64_t)v12, (uint64_t)&v26);
    id v23 = v26;
    if (v23)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v24 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v28 = self;
        __int16 v29 = 2114;
        uint64_t v30 = v20;
        __int16 v31 = 2114;
        id v32 = v23;
        _os_log_error_impl(&dword_18AF10000, v24, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: Removal of database at %{public}@ failed: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)tocTableGroup
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E9129D10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tocTableGroup);
  if (!WeakRetained)
  {
    WeakRetained = objc_msgSend_TOCTableGroupInDatabase_(CKSQLiteTOCTableGroup, v3, (uint64_t)self, v4);
    objc_storeWeak((id *)&self->_tocTableGroup, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E9129D10);

  return WeakRetained;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"%@(%p)", v7, v5, self);

  if (self->_databaseDirectory)
  {
    uint64_t v12 = objc_msgSend_databaseFilePath(self, v9, v10, v11);
    int v16 = objc_msgSend_CKSanitizedPath(v12, v13, v14, v15);
    objc_msgSend_appendFormat_(v8, v17, @" path=%@", v18, v16);
  }
  else
  {
    objc_msgSend_appendString_(v8, v9, @" (in memory)", v11);
  }

  return v8;
}

+ (id)databaseFilePathInDirectory:(id)a3
{
  return (id)objc_msgSend_stringByAppendingPathComponent_(a3, a2, @"db", v3);
}

- (id)databaseFilePath
{
  uint64_t v3 = objc_opt_class();
  databaseDirectory = self->_databaseDirectory;

  return (id)objc_msgSend_databaseFilePathInDirectory_(v3, v4, (uint64_t)databaseDirectory, v5);
}

- (id)sqlErrorWithMessage:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = objc_msgSend_errorForSQLite_message_args_(CKPrettyError, v5, (uint64_t)self->_db, (uint64_t)v4, &v52);
  if (objc_msgSend_CKSQLiteCode(v6, v7, v8, v9) == 11)
  {
    objc_msgSend_databaseFilePath(self, v10, v11, v12);
    uint64_t v13 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v14 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v47 = self;
      __int16 v48 = 2114;
      uint64_t v49 = (char *)v13;
      _os_log_error_impl(&dword_18AF10000, v14, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: Database corrupt: %{public}@", buf, 0x16u);
    }
    uint64_t v18 = (const char *)objc_msgSend_fileSystemRepresentation(v13, v15, v16, v17);
    if (setxattr(v18, "CKSQLiteDatabaseCorrupt", "1", 1uLL, 0, 0))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v22 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
      {
        __int16 v31 = v22;
        id v32 = __error();
        uint64_t v33 = strerror(*v32);
        *(_DWORD *)buf = 138412546;
        v47 = v13;
        __int16 v48 = 2080;
        uint64_t v49 = v33;
        _os_log_fault_impl(&dword_18AF10000, v31, OS_LOG_TYPE_FAULT, "setxattr failed at path: %@. Removing database instead. error = %s", buf, 0x16u);
      }
      id v26 = (id)objc_msgSend_removeDatabaseDirectory(self, v23, v24, v25);
    }
    if ((objc_msgSend_options(self, v19, v20, v21) & 4) == 0)
    {
      __int16 v34 = objc_msgSend_sharedOptions(CKBehaviorOptions, v27, v28, v29);
      int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v34, v35, v36, v37);

      if (isAppleInternalInstall)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        __int16 v39 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18AF10000, v39, OS_LOG_TYPE_ERROR, "Database corrupt", buf, 2u);
        }
        v42 = objc_msgSend_stringWithFormat_(NSString, v40, @"Database corrupt", v41);
        objc_msgSend_UTF8String(v42, v43, v44, v45);
        _os_crash();
        __break(1u);
      }
      exit(1);
    }
  }

  return v6;
}

- (id)allTableNames:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B14B73C;
  v12[3] = &unk_1E5460E18;
  v12[4] = self;
  id v6 = v5;
  id v13 = v6;
  uint64_t v9 = objc_msgSend_performDatabaseTransaction_(self, v7, (uint64_t)v12, v8);
  if (v9)
  {

    id v6 = 0;
    if (a3) {
      *a3 = v9;
    }
  }
  id v10 = v6;

  return v10;
}

- (id)_executeSQL:(const char *)a3
{
  uint64_t v5 = sqlite3_exec(self->_db, a3, 0, 0, 0);
  if (v5)
  {
    uint64_t v8 = objc_msgSend_sqlErrorWithMessage_(self, v6, @"Error executing SQL: \"%s\" (%d)", v7, a3, v5);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)executeSQL:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_UTF8String(v4, v5, v6, v7);

  return (id)objc_msgSend__executeSQL_(self, v8, v9, v10);
}

- (int64_t)lastInsertRowID
{
  return sqlite3_last_insert_rowid(self->_db);
}

- (unint64_t)changeCount
{
  return sqlite3_changes(self->_db);
}

- (void)compiledStatementWithSQL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  ppStmt = 0;
  db = self->_db;
  id v8 = v6;
  uint64_t v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  if (sqlite3_prepare_v2(db, v12, -1, &ppStmt, 0))
  {
    objc_msgSend_sqlErrorWithMessage_(self, v13, @"Error preparing statement: %@", v14, v8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      id v15 = v15;
      *a4 = v15;
    }
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = ppStmt;

  return v16;
}

- (void)finalizeHandle:(void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (sqlite3_finalize((sqlite3_stmt *)a3))
  {
    id v6 = objc_msgSend_sqlErrorWithMessage_(self, v4, @"Error finalizing compiled statement", v5);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v7 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_fault_impl(&dword_18AF10000, v7, OS_LOG_TYPE_FAULT, "-[SQLiteDatabase finalizeHandle]: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)dropTable:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v5, @"DROP TABLE '%@'", v6, v4);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  int v8 = ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_18AF10000, v8, OS_LOG_TYPE_INFO, "Dropping table %{public}@", buf, 0xCu);
  }
  uint64_t v11 = objc_msgSend_executeSQL_(self, v9, (uint64_t)v7, v10);

  return v11;
}

- (void)traceSQL
{
}

- (void)usingTableGroupCachePerformBlock:(id)a3
{
}

- (void)assertInTransaction
{
  accessThread = (_opaque_pthread_t *)self->_serializer.accessThread;
  if (accessThread != pthread_self())
  {
    int v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    uint64_t v11 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)"void CKSQLDAssertSerialized(CKSQLDBRecursiveSerializer * _Nonnull)", v10);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v8, v12, (uint64_t)v11, @"CKSQLiteDatabaseSerializer.h", 94, @"Expected to be serialized");
  }
  if (!self->_transactionNestCount)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v13, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabase.m", 911, @"Expected to be in a transaction");
  }
}

- (void)handleDatabaseBusy:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    databaseDirectory = self->_databaseDirectory;
    uint64_t v10 = v5;
    id v14 = objc_msgSend_CKSanitizedPath(databaseDirectory, v11, v12, v13);
    int v15 = 134218242;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    _os_log_impl(&dword_18AF10000, v10, OS_LOG_TYPE_INFO, "SQLitDatabase(%p): Database busy at %{public}@", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E4F29060], v6, v7, v8, 0.1);
}

- (id)performDatabaseTransaction:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v104 = v4;
  v105 = _CKSQLDBSerializerLock((uint64_t)&self->_serializer);
  if (self->_transactionNestCount)
  {
    uint64_t v103 = (void (**)(void))v4;
    transactionSignpost = self->_transactionSignpost;
    if (transactionSignpost)
    {
      uint64_t v9 = objc_msgSend_log(transactionSignpost, v5, v6, v7);
      os_signpost_id_t v13 = objc_msgSend_identifier(self->_transactionSignpost, v10, v11, v12);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        objc_msgSend_numberWithUnsignedLong_(NSNumber, v14, self->_transactionNestCount, v15);
        uint64_t v16 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v112 = v16;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v9, OS_SIGNPOST_EVENT, v13, "Transaction", "Starting execution with NestCount=%{signpost.description:attribute,public}@ ", buf, 0xCu);
      }
    }
    ++self->_transactionNestCount;
    p_transactionCompletionHandlers = &self->_transactionCompletionHandlers;
    transactionCompletionHandlers = self->_transactionCompletionHandlers;
    uint64_t v19 = transactionCompletionHandlers;
    uint64_t v20 = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = 0;

    snprintf(__str, 0x20uLL, "SAVEPOINT S%lu", self->_transactionNestCount);
    objc_msgSend__executeSQL_(self, v21, (uint64_t)__str, v22);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23
      || (uint64_t v24 = (void *)MEMORY[0x18C12ADA0](),
          v103[2](),
          id v23 = (id)objc_claimAutoreleasedReturnValue(),
          v23))
    {
      snprintf(__str, 0x20uLL, "ROLLBACK TO S%lu", self->_transactionNestCount);
      uint64_t v27 = objc_msgSend__executeSQL_(self, v25, (uint64_t)__str, v26);
      if (v27)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v28 = ck_log_facility_sql;
        if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v112 = self;
          __int16 v113 = 2114;
          id v114 = v27;
          _os_log_error_impl(&dword_18AF10000, v28, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: ROLLBACK failed with %{public}@", buf, 0x16u);
        }
      }

      int v29 = 0;
    }
    else
    {
      int v29 = 1;
    }
    snprintf(__str, 0x20uLL, "RELEASE S%lu", self->_transactionNestCount);
    __int16 v34 = objc_msgSend__executeSQL_(self, v30, (uint64_t)__str, v31);
    if (!v34) {
      goto LABEL_21;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v35 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v112 = self;
      __int16 v113 = 2114;
      id v114 = v34;
      _os_log_error_impl(&dword_18AF10000, v35, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: RELEASE failed with %{public}@", buf, 0x16u);
      if (!v29) {
        goto LABEL_21;
      }
    }
    else if (!v29)
    {
LABEL_21:
      uint64_t v36 = *p_transactionCompletionHandlers;
      if (*p_transactionCompletionHandlers)
      {
        if (v23)
        {
          uint64_t v37 = v36;
          objc_storeStrong((id *)&self->_transactionCompletionHandlers, transactionCompletionHandlers);
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          uint64_t v38 = v37;
          uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v107, (uint64_t)buf, 16);
          if (v40)
          {
            uint64_t v41 = *(void *)v108;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v108 != v41) {
                  objc_enumerationMutation(v38);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v107 + 1) + 8 * i) + 16))();
              }
              uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v43, (uint64_t)&v107, (uint64_t)buf, 16);
            }
            while (v40);
          }
        }
        else if (v19)
        {
          objc_msgSend_addObjectsFromArray_(v19, v32, (uint64_t)v36, v33);
          objc_storeStrong((id *)&self->_transactionCompletionHandlers, transactionCompletionHandlers);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_transactionCompletionHandlers, transactionCompletionHandlers);
      }
      uint64_t v76 = self->_transactionSignpost;
      if (v76)
      {
        uint64_t v77 = objc_msgSend_log(v76, v32, (uint64_t)v36, v33);
        os_signpost_id_t v81 = objc_msgSend_identifier(self->_transactionSignpost, v78, v79, v80);
        if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
        {
          *(_WORD *)v106 = 0;
          _os_signpost_emit_with_name_impl(&dword_18AF10000, v77, OS_SIGNPOST_EVENT, v81, "Transaction", "Finished execution", v106, 2u);
        }
      }
      --self->_transactionNestCount;
      id v65 = v23;

      goto LABEL_79;
    }
    id v23 = v34;
    goto LABEL_21;
  }
  uint64_t v44 = (void (**)(void))v4;
  uint64_t v45 = [CKSignpost alloc];
  __int16 v48 = (CKSignpost *)objc_msgSend_initWithLog_(v45, v46, ck_log_facility_sql, v47);
  uint64_t v49 = self->_transactionSignpost;
  self->_transactionSignpost = v48;

  uint64_t v53 = self->_transactionSignpost;
  if (v53)
  {
    char v54 = objc_msgSend_log(v53, v50, v51, v52);
    os_signpost_id_t v58 = objc_msgSend_identifier(self->_transactionSignpost, v55, v56, v57);
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      objc_msgSend_databaseDirectory(self, v59, v60, v61);
      v62 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v112 = v62;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v58, "Transaction", "Directory=%{signpost.description:attribute,public}@ ", buf, 0xCu);
    }
  }
  ++self->_transactionNestCount;
  objc_msgSend__executeSQL_(self, v50, (uint64_t)"BEGIN EXCLUSIVE TRANSACTION", v52);
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    while (objc_msgSend_CKIsBusyDatabaseError_(MEMORY[0x1E4F28C58], v63, (uint64_t)v65, v64))
    {
      objc_msgSend_handleDatabaseBusy_(self, v66, (uint64_t)v65, v67);
      uint64_t v70 = objc_msgSend__executeSQL_(self, v68, (uint64_t)"BEGIN EXCLUSIVE TRANSACTION", v69);

      id v65 = (id)v70;
      if (!v70) {
        goto LABEL_39;
      }
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v74 = ck_log_facility_sql;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 134218242;
    v112 = self;
    __int16 v113 = 2114;
    id v114 = v65;
    uint64_t v75 = "CKSQLiteDatabase<%p>: failed to begin transaction: %{public}@";
LABEL_88:
    _os_log_error_impl(&dword_18AF10000, v74, OS_LOG_TYPE_ERROR, v75, buf, 0x16u);
    goto LABEL_57;
  }
LABEL_39:
  uint64_t v71 = (void *)MEMORY[0x18C12ADA0]();
  v44[2](v44);
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
LABEL_57:
    v82 = objc_msgSend__executeSQL_(self, v72, (uint64_t)"ROLLBACK TRANSACTION", v73);
    if (v82)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v83 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v112 = self;
        __int16 v113 = 2114;
        id v114 = v82;
        _os_log_error_impl(&dword_18AF10000, v83, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: transaction rollback failed with %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_63;
  }
  objc_msgSend__executeSQL_(self, v72, (uint64_t)"COMMIT TRANSACTION", v73);
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v74 = ck_log_facility_sql;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 134218242;
    v112 = self;
    __int16 v113 = 2114;
    id v114 = v65;
    uint64_t v75 = "CKSQLiteDatabase<%p>: transaction commit failed with %{public}@";
    goto LABEL_88;
  }
LABEL_63:
  uint64_t v87 = self->_transactionCompletionHandlers;
  if (v87)
  {
    uint64_t v88 = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = 0;

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v89 = v87;
    uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v107, (uint64_t)buf, 16);
    if (v91)
    {
      uint64_t v92 = *(void *)v108;
      do
      {
        for (uint64_t j = 0; j != v91; ++j)
        {
          if (*(void *)v108 != v92) {
            objc_enumerationMutation(v89);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v107 + 1) + 8 * j) + 16))();
        }
        uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v94, (uint64_t)&v107, (uint64_t)buf, 16);
      }
      while (v91);
    }
  }
  v95 = self->_transactionSignpost;
  if (v95)
  {
    uint64_t v96 = objc_msgSend_log(v95, v84, v85, v86);
    os_signpost_id_t v100 = objc_msgSend_identifier(self->_transactionSignpost, v97, v98, v99);
    if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
    {
      *(_DWORD *)__str = 138412290;
      id v116 = v65;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v96, OS_SIGNPOST_INTERVAL_END, v100, "Transaction", "error=%{signpost.description:attribute}@ ", (uint8_t *)__str, 0xCu);
    }

    BOOL v101 = self->_transactionSignpost;
  }
  else
  {
    BOOL v101 = 0;
  }
  self->_transactionSignpost = 0;

  --self->_transactionNestCount;
LABEL_79:
  if (v105)
  {
    v105[1].__sig = 0;
    pthread_mutex_unlock(v105);
  }

  return v65;
}

- (id)performInDatabaseTransaction:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v7 = _CKSQLDBSerializerLock((uint64_t)&self->_serializer);
  if (self->_transactionNestCount) {
    v4[2](v4);
  }
  else {
  uint64_t v8 = objc_msgSend_performDatabaseTransaction_(self, v5, (uint64_t)v4, v6);
  }
  if (v7)
  {
    v7[1].__sig = 0;
    pthread_mutex_unlock(v7);
  }

  return v8;
}

- (void)addTransactionCompletionHandler:(id)a3
{
  id v5 = a3;
  aBlock = v5;
  if (!self->_transactionNestCount)
  {
    uint64_t v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabase.m", 1094, @"Must be in a transaction");

    id v5 = aBlock;
  }
  transactionCompletionHandlers = self->_transactionCompletionHandlers;
  if (!transactionCompletionHandlers)
  {
    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = v10;

    id v5 = aBlock;
    transactionCompletionHandlers = self->_transactionCompletionHandlers;
  }
  uint64_t v12 = _Block_copy(v5);
  objc_msgSend_addObject_(transactionCompletionHandlers, v13, (uint64_t)v12, v14);
}

- (void)tableGroupPassedValidation:(id)a3
{
  id v12 = a3;
  id v4 = self->_validatedTableGroups;
  objc_sync_enter(v4);
  validatedTableGroups = self->_validatedTableGroups;
  uint64_t v9 = objc_msgSend_groupID(v12, v6, v7, v8);
  objc_msgSend_addObject_(validatedTableGroups, v10, (uint64_t)v9, v11);

  objc_sync_exit(v4);
}

- (BOOL)tableGroupWasPreviouslyValidated:(id)a3
{
  id v4 = a3;
  id v5 = self->_validatedTableGroups;
  objc_sync_enter(v5);
  validatedTableGroups = self->_validatedTableGroups;
  uint64_t v10 = objc_msgSend_groupID(v4, v7, v8, v9);
  LOBYTE(validatedTableGroups) = objc_msgSend_containsObject_(validatedTableGroups, v11, (uint64_t)v10, v12);

  objc_sync_exit(v5);
  return (char)validatedTableGroups;
}

- (void)removeValidatedTableGroup:(id)a3
{
  id v12 = a3;
  id v4 = self->_validatedTableGroups;
  objc_sync_enter(v4);
  validatedTableGroups = self->_validatedTableGroups;
  uint64_t v9 = objc_msgSend_groupID(v12, v6, v7, v8);
  objc_msgSend_removeObject_(validatedTableGroups, v10, (uint64_t)v9, v11);

  objc_sync_exit(v4);
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (BOOL)databaseWasCreated
{
  return self->_databaseWasCreated;
}

- (BOOL)removeWhenClosed
{
  return self->_removeWhenClosed;
}

- (void)setRemoveWhenClosed:(BOOL)a3
{
  self->_removeWhenClosed = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSData)uniquingKey
{
  return self->_uniquingKey;
}

- (NSMapTable)tableGroupCache
{
  return self->_tableGroupCache;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (void)setIsEmpty:(BOOL)a3
{
  self->_isEmpty = a3;
}

- (CKSQLiteDatabaseManagerTimer)databaseManagerTimer
{
  return self->_databaseManagerTimer;
}

- (void)setDatabaseManagerTimer:(id)a3
{
}

- (NSObject)databaseManagerData
{
  return self->_databaseManagerData;
}

- (void)setDatabaseManagerData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManagerData, 0);
  objc_storeStrong((id *)&self->_databaseManagerTimer, 0);
  objc_storeStrong((id *)&self->_registryDatabase, 0);
  objc_storeStrong((id *)&self->_tableGroupCache, 0);
  objc_storeStrong((id *)&self->_uniquingKey, 0);
  objc_storeStrong((id *)&self->_databaseGroup, 0);
  objc_storeStrong((id *)&self->_validatedTableGroups, 0);
  objc_storeStrong((id *)&self->_transactionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_transactionSignpost, 0);
  objc_destroyWeak((id *)&self->_tocTableGroup);

  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

@end