@interface CKSQLiteTOCTableGroupTable
+ (Class)entryClass;
+ (id)dbProperties;
+ (id)dbTableName;
+ (unint64_t)dbVersion;
- (id)db;
- (id)deleteObject:(id)a3;
- (id)entryWithGroupName:(id)a3 error:(id *)a4;
- (id)insertObject:(id)a3;
- (id)invalidateGroup:(id)a3;
- (id)tableGroupsWithClass:(id)a3;
- (id)updateGroupData:(id)a3;
- (void)setTableGroup:(id)a3;
- (void)updateLastUsedDate:(id)a3;
@end

@implementation CKSQLiteTOCTableGroupTable

+ (unint64_t)dbVersion
{
  return objc_msgSend_dbVersion(CKSQLiteTOCTableGroup, a2, v2, v3);
}

+ (id)dbTableName
{
  return @"TOCTableGroup";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

+ (id)dbProperties
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = CKSQLiteTOCTableGroupTableGroupIDPropertyName;
  v4[1] = CKSQLiteTOCTableGroupTableGroupNamePropertyName;
  v5[0] = &unk_1ED846198;
  v5[1] = &unk_1ED8461B0;
  v4[2] = CKSQLiteTOCTableGroupTableLastUsedPropertyName;
  v4[3] = CKSQLiteTOCTableGroupTableCreatingClassPropertyName;
  v5[2] = &unk_1ED8461C8;
  v5[3] = &unk_1ED846120;
  v4[4] = CKSQLiteTOCTableGroupTableGroupDataPropertyName;
  v5[4] = &unk_1ED8461E0;
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, (uint64_t)v4, 5);

  return v2;
}

- (id)insertObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKSQLiteTOCTableGroupTable;
  v6 = [(CKSQLiteTable *)&v8 insertObject:a3];
  if (!v6) {
    objc_msgSend_setIsEmpty_(self->_strongDatabase, v4, 0, v5);
  }

  return v6;
}

- (id)deleteObject:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B02B99C;
  v10[3] = &unk_1E5460E18;
  id v11 = v4;
  v12 = self;
  id v5 = v4;
  objc_super v8 = objc_msgSend_performInTransaction_(self, v6, (uint64_t)v10, v7);

  return v8;
}

- (void)setTableGroup:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKSQLiteTOCTableGroupTable;
  id v4 = a3;
  [(CKSQLiteTable *)&v10 setTableGroup:v4];
  objc_msgSend_db(v4, v5, v6, v7, v10.receiver, v10.super_class);
  objc_super v8 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();

  strongDatabase = self->_strongDatabase;
  self->_strongDatabase = v8;
}

- (id)db
{
  return self->_strongDatabase;
}

- (id)entryWithGroupName:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [CKSQLiteTableGroupEntry alloc];
  objc_super v10 = objc_msgSend_initWithName_(v7, v8, (uint64_t)v6, v9);
  objc_msgSend_setName_(v10, v11, (uint64_t)v6, v12);

  v20[0] = CKSQLiteTOCTableGroupTableGroupNamePropertyName;
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v20, 1);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v15, 0, (uint64_t)v10, v14, off_1E5460F20);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {

    if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v17, (uint64_t)v16, v18))
    {

      id v16 = 0;
    }
    else if (a4)
    {
      id v16 = v16;
      objc_super v10 = 0;
      *a4 = v16;
      goto LABEL_7;
    }
    objc_super v10 = 0;
  }
LABEL_7:

  return v10;
}

- (id)invalidateGroup:(id)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v8 = objc_msgSend_name(v4, v5, v6, v7);
  objc_msgSend_setName_(v4, v9, 0, v10);
  id v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  objc_msgSend_setCreatingClass_(v4, v13, (uint64_t)v12, v14);

  uint64_t v18 = objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v15, v16, v17);
  objc_msgSend_setLastUsed_(v4, v19, (uint64_t)v18, v20);

  v31[0] = CKSQLiteTOCTableGroupTableGroupNamePropertyName;
  v31[1] = CKSQLiteTOCTableGroupTableCreatingClassPropertyName;
  v31[2] = CKSQLiteTOCTableGroupTableLastUsedPropertyName;
  v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v31, 3);
  v24 = objc_msgSend_updateProperties_usingObject_label_(self, v23, (uint64_t)v22, (uint64_t)v4, off_1E5460F38);

  if (v24)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v25 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412546;
      v28 = v8;
      __int16 v29 = 2114;
      v30 = v24;
      _os_log_error_impl(&dword_18AF10000, v25, OS_LOG_TYPE_ERROR, "failed to invalidate group %{publid}@: %{public}@", (uint8_t *)&v27, 0x16u);
    }
  }

  return v24;
}

- (void)updateLastUsedDate:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9[0] = CKSQLiteTOCTableGroupTableLastUsedPropertyName;
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v9, 1);
  id v8 = (id)objc_msgSend_updateProperties_usingObject_label_(self, v7, (uint64_t)v6, (uint64_t)v4, off_1E5460F50);
}

- (id)updateGroupData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = CKSQLiteTOCTableGroupTableGroupDataPropertyName;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)&v11, 1);
  uint64_t v9 = objc_msgSend_updateProperties_usingObject_label_(self, v8, (uint64_t)v7, (uint64_t)v5, off_1E5460F68, v11, v12);

  return v9;
}

- (id)tableGroupsWithClass:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_18AF13B00;
  v19 = sub_18AF13840;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B02C19C;
  v11[3] = &unk_1E5460ED0;
  id v5 = v4;
  id v12 = v5;
  v13 = self;
  uint64_t v14 = &v15;
  id v8 = (id)objc_msgSend_performInTransaction_(self, v6, (uint64_t)v11, v7);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void).cxx_destruct
{
}

@end