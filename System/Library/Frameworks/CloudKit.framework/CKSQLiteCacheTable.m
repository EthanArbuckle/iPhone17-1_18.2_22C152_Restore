@interface CKSQLiteCacheTable
+ (id)dataSizeProperties;
+ (id)dbProperties;
- (CKSQLiteCacheTable)initWithLogicalTableName:(id)a3 entryCountLimit:(unint64_t)a4 dataSizeLimit:(unint64_t)a5 expirationTime:(double)a6 expireDelay:(double)a7;
- (double)cacheExpirationTime;
- (double)expireDelay;
- (id)createTableSQL;
- (id)didCreateDatabaseTable;
- (id)extendExpiration:(id)a3;
- (id)extraGroupTables:(id)a3;
- (id)insertObject:(id)a3;
- (id)insertObject:(id)a3 orUpdateProperties:(id)a4 label:(id *)a5;
- (id)oldestFirstEnumerator;
- (id)setEntryExpiration:(id)a3 date:(id)a4;
- (id)trackingEntry;
- (id)wakeFromDatabase;
- (unint64_t)dataSizeLimit;
- (unint64_t)entryCount;
- (unint64_t)entryCountLimit;
- (unint64_t)entryDataSize;
- (unint64_t)expireByCount:(id)a3;
- (unint64_t)expireByDataSize:(id)a3;
- (unint64_t)expireByTime:(id)a3;
- (unint64_t)setProperties:(id)a3 valuesToStore:(id)a4 inEntriesMatching:(id)a5 label:(id *)a6 error:(id *)a7 predicate:(id)a8;
- (void)activityTriggerWasRolledBack;
- (void)activityTriggered:(id)a3;
- (void)expire:(id)a3;
- (void)fetchExpirationDate:(id)a3;
- (void)periodicExpire;
- (void)transactionExpireCheck;
@end

@implementation CKSQLiteCacheTable

+ (id)dbProperties
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"expirationDate";
  v5[0] = &unk_1ED846798;
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, (uint64_t)&v4, 1);

  return v2;
}

+ (id)dataSizeProperties
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B09FDE8;
  v8[3] = &unk_1E54605A8;
  id v4 = v2;
  id v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(v3, v5, (uint64_t)v8, v6);

  return v4;
}

- (CKSQLiteCacheTable)initWithLogicalTableName:(id)a3 entryCountLimit:(unint64_t)a4 dataSizeLimit:(unint64_t)a5 expirationTime:(double)a6 expireDelay:(double)a7
{
  v28.receiver = self;
  v28.super_class = (Class)CKSQLiteCacheTable;
  v12 = [(CKSQLiteTable *)&v28 initWithLogicalTableName:a3];
  v16 = v12;
  if (v12)
  {
    v12->_entryCountLimit = a4;
    v12->_dataSizeLimit = a5;
    v12->_cacheExpirationTime = a6;
    v12->_expireDelay = a7;
    v17 = objc_msgSend_primaryKeyProperties(v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_count(v17, v18, v19, v20);

    if (v21 != 1)
    {
      v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23, v24);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)v16, @"CKSQLiteCacheTable.m", 102, @"CKSQLiteCacheTable does not support compound primary keys");
    }
  }
  return v16;
}

- (id)createTableSQL
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v87.receiver = self;
  v87.super_class = (Class)CKSQLiteCacheTable;
  v7 = [(CKSQLiteTable *)&v87 createTableSQL];
  unint64_t entryCountLimit = self->_entryCountLimit;
  unint64_t dataSizeLimit = self->_dataSizeLimit;
  double cacheExpirationTime = self->_cacheExpirationTime;
  BOOL v12 = cacheExpirationTime != 0.0 || dataSizeLimit != 0;
  if (!entryCountLimit && !v12)
  {
    v71 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v71, v72, (uint64_t)a2, (uint64_t)self, @"CKSQLiteCacheTable.m", 112, @"Cache has no expiration policies");
  }
  v13 = objc_msgSend_tableGroup(self, v4, v5, v6);
  v16 = objc_msgSend_tableWithName_(v13, v14, @"CKSQLiteCacheTableTrackingTable", v15);
  uint64_t v20 = objc_msgSend_dbTableName(v16, v17, v18, v19);

  uint64_t v24 = objc_msgSend_logicalTableName(self, v21, v22, v23);
  objc_super v28 = objc_msgSend_dbTableName(self, v25, v26, v27);
  v29 = objc_opt_class();
  v33 = objc_msgSend_dataSizeProperties(v29, v30, v31, v32);
  objc_msgSend_appendFormat_(v7, v34, @"CREATE TRIGGER '%@_insert' AFTER INSERT ON '%@' BEGIN ", v35, v28, v28);
  if (entryCountLimit) {
    objc_msgSend_appendFormat_(v7, v36, @"UPDATE '%@' SET entryCount = entryCount + 1 WHERE tableName = \"%@\";",
  }
      v37,
      v20,
      v24);
  BOOL v74 = v12;
  if (dataSizeLimit)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v73 = v33;
    id v38 = v33;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v83, (uint64_t)v90, 16);
    if (v40)
    {
      uint64_t v43 = v40;
      uint64_t v44 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v84 != v44) {
            objc_enumerationMutation(v38);
          }
          objc_msgSend_appendFormat_(v7, v41, @"UPDATE '%@' SET dataSize = dataSize + LENGTH(NEW.%@) WHERE tableName = \"%@\";",
            v42,
            v20,
            *(void *)(*((void *)&v83 + 1) + 8 * i),
            v24);
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v83, (uint64_t)v90, 16);
      }
      while (v43);
    }

    v33 = v73;
    BOOL v12 = v74;
  }
  if (cacheExpirationTime != 0.0) {
    objc_msgSend_appendFormat_(v7, v36, @"UPDATE '%@' SET oldestExpireDate = CASE WHEN oldestExpireDate IS NULL OR oldestExpireDate > NEW.expirationDate THEN NEW.expirationDate ELSE oldestExpireDate END WHERE tableName = \"%@\";",
  }
      v37,
      v20,
      v24);
  objc_msgSend_appendString_(v7, v36, @"END;", v37);
  if (entryCountLimit | dataSizeLimit)
  {
    objc_msgSend_appendFormat_(v7, v46, @"CREATE TRIGGER '%@_delete' AFTER DELETE ON '%@' BEGIN ", v47, v28, v28);
    if (entryCountLimit) {
      objc_msgSend_appendFormat_(v7, v48, @"UPDATE '%@' SET entryCount = entryCount - 1 WHERE tableName = \"%@\";",
    }
        v49,
        v20,
        v24);
    if (dataSizeLimit)
    {
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v50 = v33;
      id v51 = v33;
      uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v79, (uint64_t)v89, 16);
      if (v53)
      {
        uint64_t v56 = v53;
        uint64_t v57 = *(void *)v80;
        do
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            if (*(void *)v80 != v57) {
              objc_enumerationMutation(v51);
            }
            objc_msgSend_appendFormat_(v7, v54, @"UPDATE '%@' SET dataSize = dataSize - LENGTH(OLD.%@) WHERE tableName = \"%@\";",
              v55,
              v20,
              *(void *)(*((void *)&v79 + 1) + 8 * j),
              v24);
          }
          uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v79, (uint64_t)v89, 16);
        }
        while (v56);
      }

      v33 = v50;
      BOOL v12 = v74;
    }
    objc_msgSend_appendString_(v7, v48, @"END;", v49);
  }
  if (v12)
  {
    objc_msgSend_appendFormat_(v7, v46, @"CREATE TRIGGER '%@_update' AFTER UPDATE ON '%@' BEGIN ", v47, v28, v28);
    if (dataSizeLimit)
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v61 = v33;
      id v62 = v33;
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v75, (uint64_t)v88, 16);
      if (v64)
      {
        uint64_t v67 = v64;
        uint64_t v68 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v67; ++k)
          {
            if (*(void *)v76 != v68) {
              objc_enumerationMutation(v62);
            }
            objc_msgSend_appendFormat_(v7, v65, @"UPDATE '%@' SET dataSize = dataSize + LENGTH(NEW.%@) - LENGTH(OLD.%@) WHERE tableName = \"%@\";",
              v66,
              v20,
              *(void *)(*((void *)&v75 + 1) + 8 * k),
              *(void *)(*((void *)&v75 + 1) + 8 * k),
              v24);
          }
          uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v75, (uint64_t)v88, 16);
        }
        while (v67);
      }

      v33 = v61;
    }
    if (cacheExpirationTime != 0.0) {
      objc_msgSend_appendFormat_(v7, v59, @"UPDATE '%@' SET oldestExpireDate = CASE WHEN oldestExpireDate IS NULL OR oldestExpireDate > NEW.expirationDate THEN NEW.expirationDate ELSE oldestExpireDate END WHERE tableName = \"%@\";",
    }
        v60,
        v20,
        v24);
    objc_msgSend_appendString_(v7, v59, @"END;", v60);
  }

  return v7;
}

- (id)didCreateDatabaseTable
{
  v28.receiver = self;
  v28.super_class = (Class)CKSQLiteCacheTable;
  v3 = [(CKSQLiteTable *)&v28 didCreateDatabaseTable];
  if (!v3)
  {
    id v4 = objc_alloc_init(CKSQLiteCacheTableTrackingEntry);
    v8 = objc_msgSend_logicalTableName(self, v5, v6, v7);
    objc_msgSend_setTableName_(v4, v9, (uint64_t)v8, v10);

    objc_msgSend_setEntryCount_(v4, v11, (uint64_t)&unk_1ED8467B0, v12);
    objc_msgSend_setDataSize_(v4, v13, (uint64_t)&unk_1ED8467B0, v14);
    uint64_t v18 = objc_msgSend_tableGroup(self, v15, v16, v17);
    objc_msgSend_tableWithName_(v18, v19, @"CKSQLiteCacheTableTrackingTable", v20);
    uint64_t v21 = (CKSQLiteCacheTableTrackingTable *)objc_claimAutoreleasedReturnValue();
    trackingTable = self->_trackingTable;
    self->_trackingTable = v21;

    v3 = objc_msgSend_insertObject_(self->_trackingTable, v23, (uint64_t)v4, v24);
    objc_msgSend_count_(self, v25, 0, v26);
  }

  return v3;
}

- (id)wakeFromDatabase
{
  v13.receiver = self;
  v13.super_class = (Class)CKSQLiteCacheTable;
  v3 = [(CKSQLiteTable *)&v13 wakeFromDatabase];
  uint64_t v7 = objc_msgSend_tableGroup(self, v4, v5, v6);
  objc_msgSend_tableWithName_(v7, v8, @"CKSQLiteCacheTableTrackingTable", v9);
  uint64_t v10 = (CKSQLiteCacheTableTrackingTable *)objc_claimAutoreleasedReturnValue();
  trackingTable = self->_trackingTable;
  self->_trackingTable = v10;

  return v3;
}

- (id)extraGroupTables:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CKSQLiteCacheTable;
  id v3 = a3;
  id v4 = [(CKSQLiteTable *)&v14 extraGroupTables:v3];
  uint64_t v7 = objc_msgSend_objectForKey_(v3, v5, @"CKSQLiteCacheTableTrackingTable", v6, v14.receiver, v14.super_class);

  if (!v7)
  {
    v8 = [CKSQLiteCacheTableTrackingTable alloc];
    v11 = objc_msgSend_initWithLogicalTableName_(v8, v9, @"CKSQLiteCacheTableTrackingTable", v10);
    objc_msgSend_setObject_forKey_(v4, v12, (uint64_t)v11, @"CKSQLiteCacheTableTrackingTable");
  }

  return v4;
}

- (id)oldestFirstEnumerator
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_18B0A06F0;
  v4[3] = &unk_1E54608B0;
  v4[4] = self;
  id v2 = objc_msgSend_entriesWithValues_label_error_setupBlock_(self, a2, 0, (uint64_t)off_1E5463618, 0, v4);

  return v2;
}

- (void)fetchExpirationDate:(id)a3
{
  id v10 = a3;
  uint64_t v7 = objc_msgSend_primaryKeyProperties(self, v4, v5, v6);
  id v9 = (id)objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v8, (uint64_t)&unk_1ED845F58, (uint64_t)v10, v7, off_1E5463630);
}

- (unint64_t)expireByCount:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);

  v11 = objc_msgSend_entryCount(v4, v8, v9, v10);
  int64_t v15 = objc_msgSend_unsignedLongLongValue(v11, v12, v13, v14) - self->_entryCountLimit;

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if (v15 < 1)
  {
    unint64_t v23 = 0;
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_18B0A0A10;
    v28[3] = &unk_1E5463678;
    v28[4] = self;
    v28[5] = &v29;
    v28[6] = v15;
    id v18 = (id)objc_msgSend_performInTransaction_(self, v16, (uint64_t)v28, v17);
    if (objc_msgSend_logOperations(self, v19, v20, v21))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v22 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v25 = (objc_class *)objc_opt_class();
        uint64_t v26 = NSStringFromClass(v25);
        uint64_t v27 = v30[3];
        *(_DWORD *)buf = 138543874;
        v34 = v26;
        __int16 v35 = 2048;
        v36 = self;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "%{public}@(%p) count expiration removed %llu entries", buf, 0x20u);
      }
    }
    unint64_t v23 = v30[3];
  }
  _Block_object_dispose(&v29, 8);

  return v23;
}

- (unint64_t)expireByDataSize:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);

  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  v11 = objc_msgSend_dataSize(v4, v8, v9, v10);
  BOOL v15 = objc_msgSend_unsignedLongLongValue(v11, v12, v13, v14) > self->_dataSizeLimit;

  if (v15)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_18B0A0E84;
    v28[3] = &unk_1E5460ED0;
    v28[4] = self;
    id v29 = v4;
    v30 = &v31;
    id v18 = (id)objc_msgSend_performInTransaction_(self, v16, (uint64_t)v28, v17);
    if (objc_msgSend_logOperations(self, v19, v20, v21))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v22 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v25 = (objc_class *)objc_opt_class();
        uint64_t v26 = NSStringFromClass(v25);
        uint64_t v27 = v32[3];
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 2048;
        uint64_t v40 = v27;
        _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "%{public}@(%p) size expiration removed %llu entries", buf, 0x20u);
      }
    }
  }
  unint64_t v23 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v23;
}

- (unint64_t)expireByTime:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_18B0A1178;
  v21[3] = &unk_1E54636B8;
  id v8 = v4;
  unint64_t v23 = self;
  uint64_t v24 = &v25;
  id v22 = v8;
  id v11 = (id)objc_msgSend_performInTransaction_(self, v9, (uint64_t)v21, v10);
  if (objc_msgSend_logOperations(self, v12, v13, v14))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    BOOL v15 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      uint64_t v20 = v26[3];
      *(_DWORD *)buf = 138543874;
      v30 = v19;
      __int16 v31 = 2048;
      uint64_t v32 = self;
      __int16 v33 = 2048;
      uint64_t v34 = v20;
      _os_log_debug_impl(&dword_18AF10000, v15, OS_LOG_TYPE_DEBUG, "%{public}@(%p) time expiration removed %llu entries", buf, 0x20u);
    }
  }
  unint64_t v16 = v26[3];

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (id)trackingEntry
{
  trackingTable = self->_trackingTable;
  uint64_t v5 = objc_msgSend_logicalTableName(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(trackingTable, v6, (uint64_t)v5, 0, off_1E54636D8, 0);

  return v7;
}

- (unint64_t)entryCount
{
  id v4 = objc_msgSend_trackingEntry(self, a2, v2, v3);
  id v8 = objc_msgSend_entryCount(v4, v5, v6, v7);
  unint64_t v12 = objc_msgSend_unsignedLongLongValue(v8, v9, v10, v11);

  return v12;
}

- (unint64_t)entryDataSize
{
  id v4 = objc_msgSend_trackingEntry(self, a2, v2, v3);
  id v8 = objc_msgSend_dataSize(v4, v5, v6, v7);
  unint64_t v12 = objc_msgSend_unsignedLongLongValue(v8, v9, v10, v11);

  return v12;
}

- (void)expire:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0A1408;
  v8[3] = &unk_1E5461F80;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_serialize_(self, v6, (uint64_t)v8, v7);
}

- (void)activityTriggered:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0A1884;
  v8[3] = &unk_1E5461F80;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_serialize_(self, v6, (uint64_t)v8, v7);
}

- (void)activityTriggerWasRolledBack
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_18B0A192C;
  v3[3] = &unk_1E5460350;
  v3[4] = self;
  objc_msgSend_serialize_(self, a2, (uint64_t)v3, v2);
}

- (void)periodicExpire
{
  if (!self->_dataExpireScheduled)
  {
    id v5 = objc_msgSend_trackingEntry(self, a2, v2, v3);
    id v28 = v5;
    if (self->_entryCountLimit)
    {
      id v9 = objc_msgSend_entryCount(v5, v6, v7, v8);
      BOOL v13 = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12) > self->_entryCountLimit;
    }
    else
    {
      BOOL v13 = 0;
    }
    if (self->_dataSizeLimit)
    {
      uint64_t v14 = objc_msgSend_dataSize(v28, v6, v7, v8);
      BOOL v18 = objc_msgSend_unsignedLongLongValue(v14, v15, v16, v17) > self->_dataSizeLimit;
    }
    else
    {
      BOOL v18 = 0;
    }
    uint64_t v19 = v28;
    if (v13 || v18)
    {
      uint64_t v20 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v6, v7, v8);
      unint64_t v23 = objc_msgSend_requestCallbackWithDate_coalescingInterval_minimumSeparation_(self, v21, (uint64_t)v20, v22, self->_expireDelay, self->_expireDelay);

      if (!v23) {
        self->_dataExpireScheduled = 1;
      }

      uint64_t v19 = v28;
    }
    if (self->_cacheExpirationTime != 0.0 && !self->_dataExpireScheduled)
    {
      uint64_t v24 = objc_msgSend_oldestExpireDate(v28, v6, v7, v8);
      id v27 = (id)objc_msgSend_requestCallbackWithDate_coalescingInterval_minimumSeparation_(self, v25, (uint64_t)v24, v26, self->_expireDelay, self->_expireDelay);

      uint64_t v19 = v28;
    }
  }
}

- (id)extendExpiration:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  double cacheExpirationTime = self->_cacheExpirationTime;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_dateWithTimeIntervalSinceNow_(v4, v7, v8, v9, cacheExpirationTime);
  uint64_t v12 = objc_msgSend_setEntryExpiration_date_(self, v11, (uint64_t)v6, (uint64_t)v10);

  return v12;
}

- (id)setEntryExpiration:(id)a3 date:(id)a4
{
  id v6 = a3;
  objc_msgSend_setExpirationDate_(v6, v7, (uint64_t)a4, v8);
  uint64_t v10 = objc_msgSend_updateProperties_usingObject_label_(self, v9, (uint64_t)&unk_1ED845F70, (uint64_t)v6, off_1E5463730);

  return v10;
}

- (void)transactionExpireCheck
{
  if (!self->_expireCheckPending)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_18B0A1C98;
    v6[3] = &unk_1E5460240;
    v6[4] = self;
    uint64_t v3 = self;
    objc_msgSend_addTransactionCompletionHandler_(v3, v4, (uint64_t)v6, v5);
    self->_expireCheckPending = 1;
  }
}

- (id)insertObject:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_expirationDate(v4, v5, v6, v7);

  if (!v8)
  {
    uint64_t v12 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v9, v10, v11, self->_cacheExpirationTime);
    objc_msgSend_setExpirationDate_(v4, v13, (uint64_t)v12, v14);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_18B0A1DD4;
  v20[3] = &unk_1E5460E18;
  id v21 = v4;
  uint64_t v22 = self;
  id v15 = v4;
  BOOL v18 = objc_msgSend_performInTransaction_(self, v16, (uint64_t)v20, v17);

  return v18;
}

- (id)insertObject:(id)a3 orUpdateProperties:(id)a4 label:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v13 = objc_msgSend_expirationDate(v8, v10, v11, v12);

  if (!v13)
  {
    uint64_t v17 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v14, v15, v16, self->_cacheExpirationTime);
    objc_msgSend_setExpirationDate_(v8, v18, (uint64_t)v17, v19);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_18B0A1F78;
  v26[3] = &unk_1E5460CA0;
  id v27 = v8;
  id v28 = v9;
  id v29 = self;
  v30 = a5;
  id v20 = v9;
  id v21 = v8;
  uint64_t v24 = objc_msgSend_performInTransaction_(self, v22, (uint64_t)v26, v23);

  return v24;
}

- (unint64_t)setProperties:(id)a3 valuesToStore:(id)a4 inEntriesMatching:(id)a5 label:(id *)a6 error:(id *)a7 predicate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v36 = 0;
  __int16 v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_18B0A2188;
  v28[3] = &unk_1E5463750;
  uint64_t v34 = &v36;
  id v18 = v14;
  id v29 = v18;
  id v19 = v15;
  id v30 = v19;
  id v20 = v16;
  id v31 = v20;
  uint64_t v35 = a6;
  id v21 = v17;
  uint64_t v32 = self;
  id v33 = v21;
  uint64_t v24 = objc_msgSend_performInTransaction_(self, v22, (uint64_t)v28, v23);
  uint64_t v25 = v24;
  if (a7 && v24) {
    *a7 = v24;
  }
  unint64_t v26 = v37[3];

  _Block_object_dispose(&v36, 8);
  return v26;
}

- (unint64_t)entryCountLimit
{
  return self->_entryCountLimit;
}

- (unint64_t)dataSizeLimit
{
  return self->_dataSizeLimit;
}

- (double)cacheExpirationTime
{
  return self->_cacheExpirationTime;
}

- (double)expireDelay
{
  return self->_expireDelay;
}

- (void).cxx_destruct
{
}

@end