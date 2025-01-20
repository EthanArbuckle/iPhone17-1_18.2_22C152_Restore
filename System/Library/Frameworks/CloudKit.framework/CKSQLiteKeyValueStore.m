@interface CKSQLiteKeyValueStore
+ (Class)entryClass;
+ (id)dbProperties;
- (id)UUIDValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6;
- (id)dataValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6;
- (id)dateValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6;
- (id)numberValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6;
- (id)setDataValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6;
- (id)setDateValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6;
- (id)setNumberValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6;
- (id)setStringValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6;
- (id)setUUIDValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6;
- (id)stringValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6;
- (id)wakeFromDatabase;
- (void)deleteKeyValuePropertiesWithScope:(unint64_t)a3 identifiers:(id)a4;
- (void)purgeKeyValuePropertiesForGroupName:(id)a3 tableNames:(id)a4;
- (void)purgeOrphanedKeyValuePropertiesWithScope:(unint64_t)a3 identifiersToKeep:(id)a4;
- (void)purgeOrphanedKeys;
- (void)purgeOrphanedTableGroupKeys;
- (void)purgeOrphanedTableKeys;
@end

@implementation CKSQLiteKeyValueStore

+ (id)dbProperties
{
  return &unk_1ED8469A8;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (void)deleteKeyValuePropertiesWithScope:(unint64_t)a3 identifiers:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B05A1F4;
  v9[3] = &unk_1E5462368;
  id v10 = v6;
  unint64_t v11 = a3;
  id v7 = v6;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v8, 0, 0, 0, v9);
}

- (void)purgeOrphanedKeyValuePropertiesWithScope:(unint64_t)a3 identifiersToKeep:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B05A2D4;
  v9[3] = &unk_1E5462368;
  id v10 = v6;
  unint64_t v11 = a3;
  id v7 = v6;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v8, 0, 0, 0, v9);
}

- (void)purgeKeyValuePropertiesForGroupName:(id)a3 tableNames:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (v6)
  {
    v14[0] = v6;
    unint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v14, 1);
    objc_msgSend_deleteKeyValuePropertiesWithScope_identifiers_(self, v12, 1, (uint64_t)v11);
  }
  if (objc_msgSend_count(v10, v7, v8, v9)) {
    objc_msgSend_deleteKeyValuePropertiesWithScope_identifiers_(self, v13, 2, (uint64_t)v10);
  }
}

- (void)purgeOrphanedTableGroupKeys
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_tableGroup(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_tocTableGroupTable(v5, v6, v7, v8);

  id v29 = 0;
  v12 = objc_msgSend_fetchAllEntries_(v9, v10, (uint64_t)&v29, v11);
  id v16 = v29;
  if (v16)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v17 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v16;
      _os_log_fault_impl(&dword_18AF10000, v17, OS_LOG_TYPE_FAULT, "Error purging orphaned table group properties: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v18 = objc_msgSend_count(v12, v13, v14, v15);
    if (v18)
    {
      uint64_t v21 = v18;
      for (uint64_t i = 0; i != v21; ++i)
      {
        v23 = objc_msgSend_objectAtIndex_(v12, v19, i, v20);
        v27 = objc_msgSend_name(v23, v24, v25, v26);
        objc_msgSend_replaceObjectAtIndex_withObject_(v12, v28, i, (uint64_t)v27);
      }
    }
    objc_msgSend_purgeOrphanedKeyValuePropertiesWithScope_identifiersToKeep_(self, v19, 1, (uint64_t)v12);
  }
}

- (void)purgeOrphanedTableKeys
{
  v5 = objc_msgSend_tableGroup(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_tocTable(v5, v6, v7, v8);

  uint64_t v28 = 0;
  v12 = objc_msgSend_fetchAllEntries_(v9, v10, (uint64_t)&v28, v11);
  id v16 = v12;
  if (!v28)
  {
    uint64_t v17 = objc_msgSend_count(v12, v13, v14, v15);
    if (v17)
    {
      uint64_t v20 = v17;
      for (uint64_t i = 0; i != v20; ++i)
      {
        v22 = objc_msgSend_objectAtIndex_(v16, v18, i, v19);
        uint64_t v26 = objc_msgSend_dbTableName(v22, v23, v24, v25);
        objc_msgSend_replaceObjectAtIndex_withObject_(v16, v27, i, (uint64_t)v26);
      }
    }
    objc_msgSend_purgeOrphanedKeyValuePropertiesWithScope_identifiersToKeep_(self, v18, 2, (uint64_t)v16);
  }
}

- (void)purgeOrphanedKeys
{
  objc_msgSend_purgeOrphanedTableGroupKeys(self, a2, v2, v3);
  objc_msgSend_purgeOrphanedTableKeys(self, v5, v6, v7);
  objc_msgSend_dictionary(MEMORY[0x1E4F1C9E8], v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v11, (uint64_t)v12, 0, 0, &unk_1ED7EEFF8);
}

- (id)wakeFromDatabase
{
  v16.receiver = self;
  v16.super_class = (Class)CKSQLiteKeyValueStore;
  uint64_t v3 = [(CKSQLiteTable *)&v16 wakeFromDatabase];
  uint64_t v7 = objc_msgSend_tableGroup(self, v4, v5, v6);
  uint64_t v11 = v7;
  if (!v3 && objc_msgSend_isFirstInstance(v7, v8, v9, v10)) {
    objc_msgSend_purgeOrphanedKeys(self, v12, v13, v14);
  }

  return v3;
}

- (id)numberValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, a4, v16);
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  uint64_t v26 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1ED845DC0, (uint64_t)v12, &unk_1ED845DD8, off_1E5462388);
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6) {
      *a6 = v26;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138543618;
      id v31 = v10;
      __int16 v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  uint64_t v28 = objc_msgSend_number(v12, v23, v24, v25);

  return v28;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, a5, v17);
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setNumber_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B05AB94;
  v31[3] = &unk_1E5460E18;
  v31[4] = self;
  uint64_t v25 = v13;
  __int16 v32 = v25;
  uint64_t v28 = objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  if (v28)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v10;
      __int16 v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)stringValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, a4, v16);
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  uint64_t v26 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1ED845DF0, (uint64_t)v12, &unk_1ED845E08, off_1E54623B8);
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6) {
      *a6 = v26;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138543618;
      id v31 = v10;
      __int16 v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  uint64_t v28 = objc_msgSend_string(v12, v23, v24, v25);

  return v28;
}

- (id)setStringValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, a5, v17);
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setString_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B05AFB4;
  v31[3] = &unk_1E5460E18;
  v31[4] = self;
  uint64_t v25 = v13;
  __int16 v32 = v25;
  uint64_t v28 = objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  if (v28)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v10;
      __int16 v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)dataValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, a4, v16);
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  uint64_t v26 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1ED845E20, (uint64_t)v12, &unk_1ED845E38, off_1E54623E8);
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6) {
      *a6 = v26;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138543618;
      id v31 = v10;
      __int16 v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  uint64_t v28 = objc_msgSend_data(v12, v23, v24, v25);

  return v28;
}

- (id)setDataValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, a5, v17);
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setData_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B05B3D4;
  v31[3] = &unk_1E5460E18;
  v31[4] = self;
  uint64_t v25 = v13;
  __int16 v32 = v25;
  uint64_t v28 = objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  if (v28)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v10;
      __int16 v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)dateValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, a4, v16);
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  uint64_t v26 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1ED845E50, (uint64_t)v12, &unk_1ED845E68, off_1E5462418);
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6) {
      *a6 = v26;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138543618;
      id v31 = v10;
      __int16 v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  uint64_t v28 = objc_msgSend_date(v12, v23, v24, v25);

  return v28;
}

- (id)setDateValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, a5, v17);
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setDate_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B05B7F4;
  v31[3] = &unk_1E5460E18;
  v31[4] = self;
  uint64_t v25 = v13;
  __int16 v32 = v25;
  uint64_t v28 = objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  if (v28)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v10;
      __int16 v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)UUIDValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, a4, v16);
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  uint64_t v26 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1ED845E80, (uint64_t)v12, &unk_1ED845E98, off_1E5462448);
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6) {
      *a6 = v26;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138543618;
      id v31 = v10;
      __int16 v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18AF10000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  uint64_t v28 = objc_msgSend_UUID(v12, v23, v24, v25);

  return v28;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, a5, v17);
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setUUID_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B05BC14;
  v31[3] = &unk_1E5460E18;
  v31[4] = self;
  uint64_t v25 = v13;
  __int16 v32 = v25;
  uint64_t v28 = objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  if (v28)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v10;
      __int16 v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

@end