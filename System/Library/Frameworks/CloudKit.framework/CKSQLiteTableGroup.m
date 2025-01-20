@interface CKSQLiteTableGroup
+ (BOOL)rebootShouldClearData;
+ (CKSQLiteTableGroup)tableGroupWithEntry:(id)a3 database:(id)a4 options:(unint64_t)a5;
+ (id)groupEntryInDatabase:(id)a3 withGroupName:(id)a4 error:(id *)a5;
+ (id)groupNameWithDomain:(int)a3 domainIdentifier:(id)a4 groupName:(id)a5;
+ (id)lookupTableGroupInstanceInCache:(id)a3 withName:(id)a4 options:(unint64_t)a5;
+ (id)tableGroupInDatabase:(id)a3 withID:(id)a4 error:(id *)a5;
+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 error:(id *)a5;
+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (void)enumerateGroupsInDatabase:(id)a3 block:(id)a4;
+ (void)expireGroup:(id)a3 reason:(id)a4 database:(id)a5;
+ (void)groupWillExpire:(id)a3;
+ (void)purgeGroup:(id)a3;
+ (void)purgeGroupWithName:(id)a3 inDatabase:(id)a4;
- (BOOL)isFirstInstance;
- (BOOL)isNew;
- (CKSQLiteDatabase)activityPersistenceDatabase;
- (CKSQLiteDatabase)db;
- (CKSQLiteTOCTableGroup)tocTableGroup;
- (CKSQLiteTableGroup)init;
- (CKSQLiteTableGroup)initWithName:(id)a3 options:(unint64_t)a4 database:(id)a5;
- (NSObject)databaseManagerData;
- (id)UUIDValueForKey:(id)a3 error:(id *)a4;
- (id)_purge;
- (id)_tablesByNameInitializer;
- (id)allTables;
- (id)createDBTable:(id)a3;
- (id)createTables:(id *)a3;
- (id)dataValueForKey:(id)a3 error:(id *)a4;
- (id)databaseManager:(id *)a3;
- (id)dateValueForKey:(id)a3 error:(id *)a4;
- (id)dbTableNameForLogicalTableName:(id)a3;
- (id)finishInitializing;
- (id)migrateDataFromGroup:(id)a3;
- (id)numberValueForKey:(id)a3 error:(id *)a4;
- (id)performDataMigration:(id)a3;
- (id)performInTransaction:(id)a3;
- (id)performTransaction:(id)a3;
- (id)prepareExistingTables;
- (id)prepareNewTables;
- (id)prepareTables;
- (id)requestCallbackForTarget:(id)a3 withDate:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6;
- (id)requestCallbackWithDate:(id)a3 coalescingInterval:(double)a4 minimumSeparation:(double)a5;
- (id)setDataValue:(id)a3 forKey:(id)a4;
- (id)setDateValue:(id)a3 forKey:(id)a4;
- (id)setNumberValue:(id)a3 forKey:(id)a4;
- (id)setStringValue:(id)a3 forKey:(id)a4;
- (id)setUUIDValue:(id)a3 forKey:(id)a4;
- (id)stringValueForKey:(id)a3 error:(id *)a4;
- (id)tableWithName:(id)a3;
- (id)tocTable;
- (id)tocTableGroupInitValue;
- (id)tocTableGroupTable;
- (id)updateGroupData:(id)a3;
- (int64_t)validateTableMatchesTOCEntry:(id)a3;
- (unint64_t)options;
- (void)_addExtraTablesForTable:(id)a3;
- (void)_setupActivityEntry:(id)a3;
- (void)dealloc;
- (void)serialize:(id)a3;
- (void)setActivityPersistenceDatabase:(id)a3;
- (void)setDatabaseManagerData:(id)a3;
- (void)updateLastUsedDate;
@end

@implementation CKSQLiteTableGroup

+ (id)groupNameWithDomain:(int)a3 domainIdentifier:(id)a4 groupName:(id)a5
{
  id v7 = a4;
  id v10 = a5;
  switch(a3)
  {
    case 0:
      objc_msgSend_stringWithFormat_(NSString, v8, @"%@_%@", v9, @"global", v10);
      goto LABEL_8;
    case 1:
      v11 = @"account";
      goto LABEL_7;
    case 2:
      v11 = @"container";
      goto LABEL_7;
    case 3:
      v11 = @"custom";
      goto LABEL_7;
    default:
      v11 = 0;
LABEL_7:
      objc_msgSend_stringWithFormat_(NSString, v8, @"%@_%@_%@", v9, v11, v7, v10);
      v12 = LABEL_8:;

      return v12;
  }
}

- (id)_purge
{
  objc_msgSend_groupWillPurge(self, a2, v2, v3);
  v8 = objc_msgSend_db(self, v5, v6, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B055420;
  v13[3] = &unk_1E5462288;
  v13[4] = self;
  v11 = objc_msgSend_performDatabaseTransaction_(v8, v9, (uint64_t)v13, v10);

  return v11;
}

+ (void)purgeGroup:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12 = objc_msgSend_db(v5, v6, v7, v8);
  if (!v12)
  {
    v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10, v11);
    v20 = NSStringFromSelector(a2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v21, (uint64_t)a2, (uint64_t)a1, @"CKSQLiteTableGroup.m", 187, @"%@ requires a database.", v20);
  }
  v13 = objc_msgSend_name(v5, v9, v10, v11);
  v17 = objc_msgSend__purge(v5, v14, v15, v16);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v18 = ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v13;
    __int16 v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_18AF10000, v18, OS_LOG_TYPE_INFO, "Purge of existing table group: %{public}@, error = %{public}@", buf, 0x16u);
  }
}

+ (void)purgeGroupWithName:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B0557CC;
  v13[3] = &unk_1E5460AA0;
  id v14 = v7;
  id v15 = v6;
  id v16 = a1;
  id v8 = v6;
  id v9 = v7;
  id v12 = (id)objc_msgSend_performDatabaseTransaction_(v9, v10, (uint64_t)v13, v11);
}

+ (id)groupEntryInDatabase:(id)a3 withGroupName:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v11 = objc_msgSend_tocTableGroup(a3, v8, v9, v10);
  id v15 = objc_msgSend_tocTableGroupTable(v11, v12, v13, v14);
  v17 = objc_msgSend_entryWithGroupName_error_(v15, v16, (uint64_t)v7, (uint64_t)a5);

  return v17;
}

+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, a2, (uint64_t)a3, (uint64_t)a4, 0, a5);
}

+ (void)enumerateGroupsInDatabase:(id)a3 block:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, unsigned char *))a4;
  v30 = objc_msgSend_tocTableGroup(v6, v8, v9, v10);
  uint64_t v14 = objc_msgSend_tocTableGroupTable(v30, v11, v12, v13);
  id v15 = NSStringFromClass((Class)a1);
  v18 = objc_msgSend_tableGroupsWithClass_(v14, v16, (uint64_t)v15, v17);

  unsigned __int8 v36 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v18;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
LABEL_3:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v33 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * v23);
      v25 = (void *)MEMORY[0x18C12ADA0]();
      v27 = objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v26, (uint64_t)v6, v24, 196608, 0);
      if (v27) {
        v7[2](v7, v27, &v36);
      }
      int v28 = v36;

      if (v28) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v32, (uint64_t)v37, 16);
        if (v21) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (CKSQLiteTableGroup)tableGroupWithEntry:(id)a3 database:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_tocTableGroup(v8, v9, v10, v11);
  id v16 = objc_msgSend_tocTableGroupTable(v12, v13, v14, v15);

  objc_msgSend_creatingClass(v7, v17, v18, v19);
  uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  Class v21 = NSClassFromString(v20);

  if (v21 == (Class)objc_opt_class()) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v21;
  }
  id v23 = [v22 alloc];
  v27 = objc_msgSend_name(v7, v24, v25, v26);
  v29 = objc_msgSend_initWithName_options_database_(v23, v28, (uint64_t)v27, a5, v8);

  if (v29)
  {
    long long v33 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_18B055DB8;
    v39[3] = &unk_1E5460888;
    id v40 = v16;
    id v41 = v7;
    id v42 = v29;
    objc_msgSend_enumeratePropertyDataWithBlock_(v33, v34, (uint64_t)v39, v35);
  }
  else
  {
    unsigned __int8 v36 = objc_msgSend_name(v7, v30, v31, v32);
    objc_msgSend_purgeGroupWithName_inDatabase_(CKSQLiteTableGroup, v37, (uint64_t)v36, (uint64_t)v8);
  }

  return (CKSQLiteTableGroup *)v29;
}

+ (id)lookupTableGroupInstanceInCache:(id)a3 withName:(id)a4 options:(unint64_t)a5
{
  int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  Class v21 = sub_18AF13BC4;
  uint64_t v22 = sub_18AF13878;
  id v23 = 0;
  if ((v5 & 0x40000) == 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_18B055F9C;
    v15[3] = &unk_1E54622B0;
    uint64_t v17 = &v18;
    id v16 = v8;
    objc_msgSend_usingTableGroupCachePerformBlock_(v7, v11, (uint64_t)v15, v12);

    uint64_t v10 = (void *)v19[5];
  }
  id v13 = v10;
  _Block_object_dispose(&v18, 8);

  return v13;
}

+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v14 = a4;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_18AF13BC4;
  unsigned __int8 v36 = sub_18AF13878;
  id v37 = 0;
  if (v10
    || (objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v11, @"CKErrorDomain", 1, @"table group lookup requires a database"), (id v20 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend_length(v14, v11, v12, v13)
      || (objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, @"CKErrorDomain", 1, @"table group requires a non empty name"), (id v20 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v16 = _CKSQLDBSerializerLock((uint64_t)v10 + 8);
      uint64_t v18 = objc_msgSend_lookupTableGroupInstanceInCache_withName_options_(a1, v17, (uint64_t)v10, (uint64_t)v14, a5);
      uint64_t v19 = (void *)v33[5];
      v33[5] = v18;

      if (v33[5])
      {
        id v20 = 0;
        if (!v16)
        {
LABEL_12:
          if (!v20) {
            goto LABEL_15;
          }
          goto LABEL_13;
        }
      }
      else
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_18B0564EC;
        v26[3] = &unk_1E54622D8;
        id v27 = v10;
        v29 = &v32;
        id v30 = a1;
        id v28 = v14;
        unint64_t v31 = a5;
        objc_msgSend_performDatabaseTransaction_(v27, v21, (uint64_t)v26, v22);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        if (!v16) {
          goto LABEL_12;
        }
      }
      v16[1].__sig = 0;
      pthread_mutex_unlock(v16);
      goto LABEL_12;
    }
  }
LABEL_13:
  id v23 = (void *)v33[5];
  v33[5] = 0;

  if (a6)
  {
    id v20 = v20;
    *a6 = v20;
  }
LABEL_15:
  id v24 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v24;
}

+ (id)tableGroupInDatabase:(id)a3 withID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_tocTableGroup(v8, v10, v11, v12);
  uint64_t v17 = objc_msgSend_tocTableGroupTable(v13, v14, v15, v16);
  id v34 = 0;
  uint64_t v19 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(v17, v18, (uint64_t)v9, 0, off_1E54622F8, &v34);

  id v23 = v34;
  if (v19
    && (objc_msgSend_name(v19, v20, v21, v22), id v24 = objc_claimAutoreleasedReturnValue(), v24, v24))
  {
    id v28 = objc_msgSend_name(v19, v25, v26, v27);
    id v33 = v23;
    id v30 = objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v29, (uint64_t)v8, (uint64_t)v28, 0x10000, &v33);
    id v31 = v33;

    id v23 = v31;
    if (!a5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v30 = 0;
    if (!a5) {
      goto LABEL_8;
    }
  }
  if (v23) {
    *a5 = v23;
  }
LABEL_8:

  return v30;
}

- (id)_tablesByNameInitializer
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);

  return v2;
}

- (CKSQLiteTableGroup)init
{
  v10.receiver = self;
  v10.super_class = (Class)CKSQLiteTableGroup;
  id v2 = [(CKSQLiteTableGroup *)&v10 init];
  id v6 = v2;
  if (v2)
  {
    uint64_t v7 = objc_msgSend__tablesByNameInitializer(v2, v3, v4, v5);
    tablesByName = v6->_tablesByName;
    v6->_tablesByName = (NSDictionary *)v7;

    v6->_valid = 1;
  }
  return v6;
}

- (id)tocTableGroupInitValue
{
  return (id)objc_msgSend_tocTableGroup(self->_db, a2, v2, v3);
}

- (CKSQLiteTableGroup)initWithName:(id)a3 options:(unint64_t)a4 database:(id)a5
{
  id v9 = a5;
  self->_options = a4;
  uint64_t v12 = objc_msgSend_initWithName_(self, v10, (uint64_t)a3, v11);
  uint64_t v13 = (CKSQLiteTableGroup *)v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 104), a5);
    uint64_t v17 = objc_msgSend_tocTableGroupInitValue(v13, v14, v15, v16);
    tocTableGroup = v13->_tocTableGroup;
    v13->_tocTableGroup = (CKSQLiteTOCTableGroup *)v17;
  }
  return v13;
}

- (id)finishInitializing
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = sub_18AF13BC4;
  uint64_t v11 = sub_18AF13878;
  id v12 = 0;
  tablesByName = self->_tablesByName;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_18B056CD4;
  v6[3] = &unk_1E5462318;
  v6[4] = &v7;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(tablesByName, a2, (uint64_t)v6, v2);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)dealloc
{
  id v8 = objc_msgSend_db(self, a2, v2, v3);
  if (self->_deleteTablesOnDealloc) {
    objc_msgSend_deleteTables_(self, v5, (uint64_t)v8, v7);
  }
  if ((self->_options & 0x20000) == 0) {
    objc_msgSend_updateLastUsedDate(self, v5, v6, v7);
  }

  v9.receiver = self;
  v9.super_class = (Class)CKSQLiteTableGroup;
  [(CKSQLiteTableGroup *)&v9 dealloc];
}

- (id)tocTableGroupTable
{
  id v4 = objc_msgSend_tocTableGroup(self, a2, v2, v3);
  id v8 = objc_msgSend_tocTableGroupTable(v4, v5, v6, v7);

  return v8;
}

- (id)tocTable
{
  id v4 = objc_msgSend_tocTableGroup(self, a2, v2, v3);
  id v8 = objc_msgSend_tocTable(v4, v5, v6, v7);

  return v8;
}

- (void)updateLastUsedDate
{
  uint64_t v5 = objc_msgSend_groupID(self, a2, v2, v3);

  if (v5)
  {
    objc_msgSend_date(MEMORY[0x1E4F1C9C8], v6, v7, v8);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = objc_msgSend_lastUsed(self, v9, v10, v11);
    uint64_t v13 = objc_opt_class();
    objc_msgSend_expirationTime(v13, v14, v15, v16);
    if (v19 <= 0.0) {
      double v20 = 86400.0;
    }
    else {
      double v20 = v19 * 0.05;
    }
    objc_msgSend_timeIntervalSinceDate_(v30, v17, (uint64_t)v12, v18);
    if (v23 > v20)
    {
      objc_msgSend_setLastUsed_(self, v21, (uint64_t)v30, v22);
      uint64_t v27 = objc_msgSend_tocTableGroupTable(self, v24, v25, v26);
      objc_msgSend_updateLastUsedDate_(v27, v28, (uint64_t)self, v29);
    }
  }
}

+ (BOOL)rebootShouldClearData
{
  return 0;
}

+ (void)groupWillExpire:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_objectForKey_(a3, a2, CKSQLiteTableGroupExpiryFileRemovalKey, v3);
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v8, v9, v10);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v22 = v4;
    id v12 = v4;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v32, 16);
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v18);
          id v23 = 0;
          objc_msgSend_removeItemAtPath_error_(v11, v15, v19, (uint64_t)&v23);
          id v20 = v23;
          if (v20)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            uint64_t v21 = ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v29 = v19;
              __int16 v30 = 2114;
              id v31 = v20;
              _os_log_error_impl(&dword_18AF10000, v21, OS_LOG_TYPE_ERROR, "failed to remove at path: %{public}@ error=%{public}@", buf, 0x16u);
            }
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, (uint64_t)v32, 16);
      }
      while (v16);
    }

    id v4 = v22;
  }
}

+ (void)expireGroup:(id)a3 reason:(id)a4 database:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v11 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v11;
    uint64_t v19 = objc_msgSend_name(v8, v16, v17, v18);
    int v33 = 138543618;
    id v34 = v19;
    __int16 v35 = 2114;
    id v36 = v9;
    _os_log_impl(&dword_18AF10000, v15, OS_LOG_TYPE_INFO, "Table group: %{public}@ expired due to: %{public}@", (uint8_t *)&v33, 0x16u);
  }
  id v23 = objc_msgSend_groupData(v8, v12, v13, v14);
  if (v23)
  {
    objc_msgSend_creatingClass(v8, v20, v21, v22);
    long long v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    long long v25 = NSClassFromString(v24);
    if (!v25) {
      long long v25 = (objc_class *)objc_opt_class();
    }

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    long long v26 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = v26;
      __int16 v30 = NSStringFromClass(v25);
      int v33 = 138543618;
      id v34 = v30;
      __int16 v35 = 2114;
      id v36 = v23;
      _os_log_impl(&dword_18AF10000, v29, OS_LOG_TYPE_INFO, "Notifying class %{public}@ of group expiry. groupData = %{public}@", (uint8_t *)&v33, 0x16u);
    }
    objc_msgSend_groupWillExpire_(v25, v27, (uint64_t)v23, v28);
  }
  id v31 = objc_msgSend_name(v8, v20, v21, v22);
  objc_msgSend_purgeGroupWithName_inDatabase_(a1, v32, (uint64_t)v31, (uint64_t)v10);
}

- (id)createTables:(id *)a3
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = ck_log_initialization_block;
  uint64_t v6 = ck_log_initialization_predicate;
  if (v3 != v4) {
    goto LABEL_6;
  }
  if (ck_log_initialization_predicate != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v7 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AF10000, v7, OS_LOG_TYPE_ERROR, "-createTables called on an instance of CKSQLiteTableGroup", buf, 2u);
    }
    id v10 = objc_msgSend_stringWithFormat_(NSString, v8, @"-createTables called on an instance of CKSQLiteTableGroup", v9);
    objc_msgSend_UTF8String(v10, v11, v12, v13);
    _os_crash();
    __break(1u);
LABEL_6:
    if (v6 != -1) {
      dispatch_once(&ck_log_initialization_predicate, v5);
    }
    uint64_t v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v14;
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      *(_DWORD *)long long v27 = 138412290;
      uint64_t v28 = v17;
      _os_log_error_impl(&dword_18AF10000, v15, OS_LOG_TYPE_ERROR, "-[CKSQLiteTableGroup createTables] was not overridden by %@", v27, 0xCu);
    }
    uint64_t v18 = NSString;
    uint64_t v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    id v23 = objc_msgSend_stringWithFormat_(v18, v21, @"-[CKSQLiteTableGroup createTables] was not overridden by %@", v22, v20);

    objc_msgSend_UTF8String(v23, v24, v25, v26);
    _os_crash();
    __break(1u);
LABEL_11:
    dispatch_once(&ck_log_initialization_predicate, v5);
  }
}

- (id)dbTableNameForLogicalTableName:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_groupID(self, v10, v11, v12);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v4, v14, @"%@_%@_%@", v15, v9, v13, v5);

  return v16;
}

- (id)prepareNewTables
{
  self->_isFirstInstance = 1;
  pendingTables = self->_pendingTables;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B057690;
  v5[3] = &unk_1E5462340;
  v5[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(pendingTables, a2, (uint64_t)v5, v2);
  return 0;
}

- (id)prepareExistingTables
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  self->_BOOL isFirstInstance = objc_msgSend_tableGroupWasPreviouslyValidated_(self->_db, a2, (uint64_t)self, v2) ^ 1;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v8 = objc_msgSend_tocTable(self, v5, v6, v7);
  BOOL isFirstInstance = self->_isFirstInstance;
  uint64_t v14 = objc_msgSend_groupID(self, v10, v11, v12);
  v73 = v8;
  if (isFirstInstance)
  {
    uint64_t v86 = 0;
    uint64_t v15 = (id *)&v86;
    uint64_t v16 = objc_msgSend_validationTocEntriesWithGroupID_error_(v8, v13, (uint64_t)v14, (uint64_t)&v86);
  }
  else
  {
    uint64_t v85 = 0;
    uint64_t v15 = (id *)&v85;
    uint64_t v16 = objc_msgSend_tocEntriesWithGroupID_error_(v8, v13, (uint64_t)v14, (uint64_t)&v85);
  }
  uint64_t v17 = (void *)v16;
  id v72 = *v15;

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v18 = v17;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v81, (uint64_t)v92, 16);
  if (v20)
  {
    uint64_t v24 = v20;
    uint64_t v25 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v82 != v25) {
          objc_enumerationMutation(v18);
        }
        long long v27 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        uint64_t v28 = objc_msgSend_logicalTableName(v27, v21, v22, v23);
        id v31 = objc_msgSend_objectForKey_(self->_pendingTables, v29, (uint64_t)v28, v30);
        objc_msgSend_setTocTableEntry_(v31, v32, (uint64_t)v27, v33);
        uint64_t v37 = objc_msgSend_dbTableName(v27, v34, v35, v36);
        objc_msgSend_setDbTableName_(v31, v38, (uint64_t)v37, v39);
        objc_msgSend_addObject_(v4, v40, (uint64_t)v28, v41);
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v81, (uint64_t)v92, 16);
    }
    while (v24);
  }

  if (self->_isFirstInstance && !self->_isNew)
  {
    v45 = objc_msgSend_allKeys(self->_pendingTables, v42, v43, v44);
    objc_msgSend_addObjectsFromArray_(v4, v46, (uint64_t)v45, v47);

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = v4;
    uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v77, (uint64_t)v91, 16);
    if (v49)
    {
      uint64_t v52 = v49;
      uint64_t v53 = *(void *)v78;
      do
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v78 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v55 = *(void *)(*((void *)&v77 + 1) + 8 * v54);
          v59 = objc_msgSend_objectForKey_(self->_pendingTables, v50, v55, v51);
          if (!v59)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v60 = (void *)ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              v63 = v60;
              objc_msgSend_name(self, v64, v65, v66);
              os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              os_log_t v88 = log;
              __int16 v89 = 2114;
              uint64_t v90 = v55;
              _os_log_error_impl(&dword_18AF10000, v63, OS_LOG_TYPE_ERROR, "Table group %@ failed validation - no table instance named %{public}@", buf, 0x16u);
            }
            self->_valid = 0;
          }
          v61 = objc_msgSend_tocTableEntry(v59, v56, v57, v58);

          if (!v61)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v62 = (void *)ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              loga = v62;
              v70 = objc_msgSend_name(self, v67, v68, v69);
              *(_DWORD *)buf = 138412546;
              os_log_t v88 = v70;
              __int16 v89 = 2114;
              uint64_t v90 = v55;
              _os_log_error_impl(&dword_18AF10000, loga, OS_LOG_TYPE_ERROR, "Table group %@ failed validation - no TOC entry for %{public}@", buf, 0x16u);
            }
            self->_valid = 0;
          }

          ++v54;
        }
        while (v52 != v54);
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v77, (uint64_t)v91, 16);
      }
      while (v52);
    }
  }

  return v72;
}

- (void)_addExtraTablesForTable:(id)a3
{
  id v5 = objc_msgSend_extraGroupTables_(a3, a2, (uint64_t)self->_pendingTables, v3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B057CBC;
  v11[3] = &unk_1E5462340;
  v11[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v6, (uint64_t)v11, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B057CD4;
  v10[3] = &unk_1E5462340;
  v10[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v8, (uint64_t)v10, v9);
}

- (id)prepareTables
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v52 = 0;
  id v4 = objc_msgSend_createTables_(self, a2, (uint64_t)&v52, v2);
  id v5 = v52;
  uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pendingTables = self->_pendingTables;
  self->_pendingTables = v6;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v48, (uint64_t)v54, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v18 = objc_msgSend_logicalTableName(v17, v11, v12, v13);
        objc_msgSend_setObject_forKey_(self->_pendingTables, v19, (uint64_t)v17, (uint64_t)v18);
        objc_msgSend__addExtraTablesForTable_(self, v20, (uint64_t)v17, v21);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v48, (uint64_t)v54, 16);
    }
    while (v14);
  }

  if (self->_isNew) {
    objc_msgSend_prepareNewTables(self, v22, v23, v24);
  }
  else {
  uint64_t v25 = objc_msgSend_prepareExistingTables(self, v22, v23, v24);
  }

  if (self->_valid)
  {
    uint64_t v43 = v25;
    objc_msgSend_allKeys(self->_pendingTables, v26, v27, v28);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v44, (uint64_t)v53, 16);
    if (v31)
    {
      uint64_t v34 = v31;
      uint64_t v35 = *(void *)v45;
LABEL_14:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v29);
        }
        uint64_t v37 = objc_msgSend_tableWithName_(self, v32, *(void *)(*((void *)&v44 + 1) + 8 * v36), v33);
        objc_msgSend_setTocTableEntry_(v37, v38, 0, v39);
        addTableError = self->_addTableError;

        if (addTableError) {
          break;
        }
        if (v34 == ++v36)
        {
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v44, (uint64_t)v53, 16);
          if (v34) {
            goto LABEL_14;
          }
          break;
        }
      }
    }

    uint64_t v25 = v43;
  }
  uint64_t v41 = self->_pendingTables;
  self->_pendingTables = 0;

  return v25;
}

- (id)createDBTable:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_createTableSQL(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_db(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_tocTable(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_executeSQL_(v12, v17, (uint64_t)v8, v18);
  if (!v19)
  {
    uint64_t v20 = objc_alloc_init(CKSQLiteTOCTableEntry);
    uint64_t v24 = objc_msgSend_logicalTableName(v4, v21, v22, v23);
    objc_msgSend_setLogicalTableName_(v20, v25, (uint64_t)v24, v26);

    uint64_t v30 = objc_msgSend_dbTableName(v4, v27, v28, v29);
    objc_msgSend_setDbTableName_(v20, v31, (uint64_t)v30, v32);

    uint64_t v36 = objc_msgSend_groupID(self, v33, v34, v35);
    objc_msgSend_setGroupID_(v20, v37, (uint64_t)v36, v38);

    objc_msgSend_setSchema_(v20, v39, (uint64_t)v8, v40);
    uint64_t v41 = objc_opt_class();
    id v42 = NSNumber;
    uint64_t v46 = objc_msgSend_dbVersion(v41, v43, v44, v45);
    long long v49 = objc_msgSend_numberWithUnsignedInteger_(v42, v47, v46, v48);
    objc_msgSend_setDbVersion_(v20, v50, (uint64_t)v49, v51);

    id v52 = NSStringFromClass((Class)v41);
    objc_msgSend_setCreatingClass_(v20, v53, (uint64_t)v52, v54);

    uint64_t v58 = objc_msgSend_flattenedDBProperties(v41, v55, v56, v57);
    objc_msgSend_setPropertyData_(v20, v59, (uint64_t)v58, v60);

    uint64_t v19 = objc_msgSend_insertObject_(v16, v61, (uint64_t)v20, v62);
    if (!v19)
    {
      uint64_t v19 = objc_msgSend_didCreateDatabaseTable(v4, v63, v64, v65);
    }
  }

  return v19;
}

- (int64_t)validateTableMatchesTOCEntry:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_tocTableEntry(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_dbVersion(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);

  uint64_t v17 = objc_opt_class();
  uint64_t v21 = objc_msgSend_dbVersion(v17, v18, v19, v20);
  if (v16 == v21)
  {
    uint64_t v25 = objc_msgSend_schema(v8, v22, v23, v24);
    uint64_t v29 = objc_msgSend_createTableSQL(v4, v26, v27, v28);
    if (objc_msgSend_isEqualToString_(v25, v30, (uint64_t)v29, v31))
    {
      uint64_t v35 = objc_msgSend_propertyData(v8, v32, v33, v34);
      uint64_t v36 = objc_opt_class();
      uint64_t v40 = objc_msgSend_flattenedDBProperties(v36, v37, v38, v39);
      char isEqual = objc_msgSend_isEqual_(v35, v41, (uint64_t)v40, v42);

      if (isEqual)
      {
        int64_t v44 = 1;
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v48 = (void *)ck_log_facility_sql;
        if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
        {
          uint64_t v68 = v48;
          id v72 = objc_msgSend_name(self, v69, v70, v71);
          v76 = objc_msgSend_logicalTableName(v4, v73, v74, v75);
          int v77 = 138544130;
          long long v78 = v72;
          __int16 v79 = 2114;
          long long v80 = v76;
          __int16 v81 = 2114;
          *(void *)long long v82 = v25;
          *(_WORD *)&v82[8] = 2114;
          long long v83 = v29;
          _os_log_error_impl(&dword_18AF10000, v68, OS_LOG_TYPE_ERROR, "Table group %{public}@ failed validation - property data changed for table %{public}@ (%{public}@ vs %{public}@)", (uint8_t *)&v77, 0x2Au);
        }
        int64_t v44 = 0;
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      long long v47 = (void *)ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        v59 = v47;
        v63 = objc_msgSend_name(self, v60, v61, v62);
        v67 = objc_msgSend_logicalTableName(v4, v64, v65, v66);
        int v77 = 138544130;
        long long v78 = v63;
        __int16 v79 = 2114;
        long long v80 = v67;
        __int16 v81 = 2114;
        *(void *)long long v82 = v25;
        *(_WORD *)&v82[8] = 2114;
        long long v83 = v29;
        _os_log_error_impl(&dword_18AF10000, v59, OS_LOG_TYPE_ERROR, "Table group %{public}@ failed validation - schema changed for table %{public}@ (%{public}@ vs %{public}@)", (uint8_t *)&v77, 0x2Au);
      }
      int64_t v44 = 0;
    }
  }
  else
  {
    int v45 = v21;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v46 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      long long v50 = v46;
      uint64_t v54 = objc_msgSend_name(self, v51, v52, v53);
      uint64_t v58 = objc_msgSend_logicalTableName(v4, v55, v56, v57);
      int v77 = 138544130;
      long long v78 = v54;
      __int16 v79 = 2114;
      long long v80 = v58;
      __int16 v81 = 1024;
      *(_DWORD *)long long v82 = v16;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v45;
      _os_log_error_impl(&dword_18AF10000, v50, OS_LOG_TYPE_ERROR, "Table group %{public}@ failed validation - version changed table %{public}@ (%d vs %d)", (uint8_t *)&v77, 0x22u);
    }
    int64_t v44 = 0;
  }

  return v44;
}

- (id)allTables
{
  return (id)objc_msgSend_allValues(self->_tablesByName, a2, v2, v3);
}

- (id)tableWithName:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_objectForKey_(self->_tablesByName, v5, (uint64_t)v4, v6);
  if (v9) {
    goto LABEL_15;
  }
  uint64_t v9 = objc_msgSend_objectForKey_(self->_pendingTables, v7, (uint64_t)v4, v8);
  if (!v9) {
    goto LABEL_15;
  }
  objc_msgSend_removeObjectForKey_(self->_pendingTables, v10, (uint64_t)v4, v11);
  objc_msgSend_setTableGroup_(v9, v12, (uint64_t)self, v13);
  if (self->_isNew)
  {
    uint64_t v17 = objc_msgSend_createDBTable_(self, v14, (uint64_t)v9, v16);
LABEL_8:
    uint64_t v18 = (void *)v17;
    goto LABEL_9;
  }
  if (!self->_isFirstInstance || objc_msgSend_validateTableMatchesTOCEntry_(self, v14, (uint64_t)v9, v16))
  {
    uint64_t v17 = objc_msgSend_wakeFromDatabase(v9, v14, v15, v16);
    goto LABEL_8;
  }
  uint64_t v18 = 0;
  self->_valid = 0;
LABEL_9:
  uint64_t v19 = objc_msgSend_mutableCopy(self->_tablesByName, v14, v15, v16);
  objc_msgSend_setObject_forKey_(v19, v20, (uint64_t)v9, (uint64_t)v4);
  uint64_t v24 = (NSDictionary *)objc_msgSend_copy(v19, v21, v22, v23);
  tablesByName = self->_tablesByName;
  self->_tablesByName = v24;

  if (v18 && !self->_addTableError) {
    objc_storeStrong((id *)&self->_addTableError, v18);
  }
  if (self->_addTableError)
  {

    uint64_t v9 = 0;
  }

LABEL_15:

  return v9;
}

- (id)performDataMigration:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_db(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_tableGroupWithEntry_database_options_(CKSQLiteTableGroup, v9, (uint64_t)v4, (uint64_t)v8, 0);

  if (v10)
  {
    uint64_t v16 = objc_msgSend_prepareTables(v10, v11, v12, v13);
    if (!v16)
    {
      uint64_t v16 = objc_msgSend_migrateDataFromGroup_(self, v14, (uint64_t)v10, v15);
      if (!v16) {
        objc_msgSend_purgeGroup_(CKSQLiteTableGroup, v17, (uint64_t)v10, v18);
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)migrateDataFromGroup:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v80 = 0;
  __int16 v81 = &v80;
  uint64_t v82 = 0x3032000000;
  long long v83 = sub_18AF13BC4;
  uint64_t v84 = sub_18AF13878;
  id v85 = 0;
  uint64_t v8 = objc_msgSend_allTables(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_allTables(v4, v9, v10, v11);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v77 = 0u;
  long long v76 = 0u;
  id v14 = v8;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v76, (uint64_t)v95, 16);
  if (v19)
  {
    uint64_t v20 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v77 != v20) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = objc_msgSend_logicalTableName(*(void **)(*((void *)&v76 + 1) + 8 * i), v16, v17, v18);
        objc_msgSend_addObject_(v13, v23, (uint64_t)v22, v24);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v76, (uint64_t)v95, 16);
    }
    while (v19);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v25 = v12;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v72, (uint64_t)v94, 16);
  if (v30)
  {
    uint64_t v31 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v73 != v31) {
          objc_enumerationMutation(v25);
        }
        uint64_t v33 = objc_msgSend_logicalTableName(*(void **)(*((void *)&v72 + 1) + 8 * j), v27, v28, v29);
        objc_msgSend_addObject_(v13, v34, (uint64_t)v33, v35);
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v72, (uint64_t)v94, 16);
    }
    while (v30);
  }

  uint64_t v39 = objc_msgSend_count(v25, v36, v37, v38);
  if (v39 == objc_msgSend_count(v14, v40, v41, v42) && v39 == objc_msgSend_count(v13, v43, v44, v45))
  {
    long long v49 = objc_msgSend_db(self, v46, v47, v48);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = sub_18B058CA8;
    v68[3] = &unk_1E5460ED0;
    id v69 = v25;
    uint64_t v70 = self;
    uint64_t v71 = &v80;
    uint64_t v52 = objc_msgSend_performDatabaseTransaction_(v49, v50, (uint64_t)v68, v51);

    if (v81[5])
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v53 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        id v55 = (id)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend_name(self, v56, v57, v58);
        *(_DWORD *)buf = 138544130;
        id v87 = v55;
        __int16 v88 = 2048;
        __int16 v89 = self;
        __int16 v90 = 2114;
        v91 = v59;
        __int16 v92 = 2114;
        uint64_t v93 = v52;
        _os_log_error_impl(&dword_18AF10000, v53, OS_LOG_TYPE_ERROR, "%{public}@(%p): Data migration failed for group: %{public}@: %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      if (!v52)
      {
LABEL_28:

        goto LABEL_29;
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v53 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        uint64_t v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        id v63 = (id)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend_name(self, v64, v65, v66);
        *(_DWORD *)buf = 138544130;
        id v87 = v63;
        __int16 v88 = 2048;
        __int16 v89 = self;
        __int16 v90 = 2114;
        v91 = v67;
        __int16 v92 = 2114;
        uint64_t v93 = v52;
        _os_log_error_impl(&dword_18AF10000, v53, OS_LOG_TYPE_ERROR, "%{public}@(%p): Data migration dropped data for group: %{public}@: %{public}@", buf, 0x2Au);
      }
    }

    goto LABEL_28;
  }
LABEL_29:
  id v60 = (id)v81[5];

  _Block_object_dispose(&v80, 8);

  return v60;
}

- (id)updateGroupData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_groupData(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v4, v9, v10, v11);

  objc_msgSend_setGroupData_(self, v13, (uint64_t)v12, v14);
  uint64_t v18 = objc_msgSend_tocTableGroupTable(self, v15, v16, v17);
  uint64_t v23 = objc_msgSend_updateGroupData_(v18, v19, (uint64_t)self, v20);
  if (v23) {
    objc_msgSend_setGroupData_(self, v21, (uint64_t)v8, v22);
  }

  return v23;
}

- (void)serialize:(id)a3
{
  id v5 = (void (**)(void))a3;
  id v4 = _CKSQLDBSerializerLock((uint64_t)&self->_db->_serializer);
  v5[2]();
  if (v4)
  {
    v4[1].__sig = 0;
    pthread_mutex_unlock(v4);
  }
}

- (id)databaseManager:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  databaseManager = v4->_databaseManager;
  if (!databaseManager)
  {
    uint64_t v9 = objc_msgSend_db(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_databaseManager_(v9, v10, (uint64_t)a3, v11);
    id v13 = v4->_databaseManager;
    v4->_databaseManager = (CKSQLiteDatabaseManager *)v12;

    databaseManager = v4->_databaseManager;
  }
  uint64_t v14 = databaseManager;
  objc_sync_exit(v4);

  return v14;
}

- (id)requestCallbackForTarget:(id)a3 withDate:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v21 = 0;
  uint64_t v14 = objc_msgSend_databaseManager_(self, v12, (uint64_t)&v21, v13);
  id v16 = v21;
  if (!v16)
  {
    if (v14)
    {
      objc_msgSend_addActivityTriggerWithTarget_date_coalescingInterval_minimumSeparation_(v14, v15, (uint64_t)v10, (uint64_t)v11, a5, a6);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, @"CKErrorDomain", 1, @"%@ has no database manager", v18);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (id)requestCallbackWithDate:(id)a3 coalescingInterval:(double)a4 minimumSeparation:(double)a5
{
  return (id)objc_msgSend_requestCallbackForTarget_withDate_coalescingInterval_minimumSeparation_(self, a2, (uint64_t)self, (uint64_t)a3, a4, a5);
}

- (id)performTransaction:(id)a3
{
  return (id)objc_msgSend_performDatabaseTransaction_(self->_db, a2, (uint64_t)a3, v3);
}

- (id)performInTransaction:(id)a3
{
  return (id)((uint64_t (*)(CKSQLiteDatabase *, char *, id))MEMORY[0x1F4181798])(self->_db, sel_performInDatabaseTransaction_, a3);
}

- (CKSQLiteDatabase)db
{
  return self->_db;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (BOOL)isFirstInstance
{
  return self->_isFirstInstance;
}

- (unint64_t)options
{
  return self->_options;
}

- (CKSQLiteDatabase)activityPersistenceDatabase
{
  return self->_activityPersistenceDatabase;
}

- (void)setActivityPersistenceDatabase:(id)a3
{
}

- (CKSQLiteTOCTableGroup)tocTableGroup
{
  return self->_tocTableGroup;
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
  objc_storeStrong((id *)&self->_tocTableGroup, 0);
  objc_storeStrong((id *)&self->_activityPersistenceDatabase, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_tablesByName, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_addTableError, 0);

  objc_storeStrong((id *)&self->_pendingTables, 0);
}

- (id)numberValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_db(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  id v16 = objc_msgSend_name(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_numberValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);

  return v18;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  uint64_t v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  uint64_t v17 = objc_msgSend_name(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_setNumberValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);

  return v19;
}

- (id)stringValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_name(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_stringValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);

  return v18;
}

- (id)setStringValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  uint64_t v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  uint64_t v17 = objc_msgSend_name(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_setStringValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);

  return v19;
}

- (id)dataValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_name(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_dataValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);

  return v18;
}

- (id)setDataValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  uint64_t v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  uint64_t v17 = objc_msgSend_name(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_setDataValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);

  return v19;
}

- (id)dateValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_name(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_dateValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);

  return v18;
}

- (id)setDateValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  uint64_t v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  uint64_t v17 = objc_msgSend_name(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_setDateValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);

  return v19;
}

- (id)UUIDValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  uint64_t v16 = objc_msgSend_name(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_UUIDValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);

  return v18;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_db(self, v8, v9, v10);
  uint64_t v13 = objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  uint64_t v17 = objc_msgSend_name(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_setUUIDValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);

  return v19;
}

- (void)_setupActivityEntry:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_groupID(self, v5, v6, v7);
  objc_msgSend_setGroupID_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_name(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupName_(v4, v14, (uint64_t)v16, v15);
}

@end