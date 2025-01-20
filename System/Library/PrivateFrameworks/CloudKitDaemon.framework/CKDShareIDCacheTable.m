@interface CKDShareIDCacheTable
+ (Class)entryClass;
+ (id)dbProperties;
- (BOOL)removeRowID:(id)a3 error:(id *)a4;
- (CKDShareIDCacheTable)initWithZoneIDTable:(id)a3;
- (CKDZoneIDCacheTable)zoneIDTable;
- (id)entryForShareID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5;
- (id)shareIDForRowID:(id)a3 error:(id *)a4;
- (id)shareIDsForZoneRowID:(id)a3 zoneID:(id)a4 error:(id *)a5;
- (unint64_t)removeSharesWithZoneRowID:(id)a3 error:(id *)a4;
- (unint64_t)removeSharesWithZoneRowID:(id)a3 exceptRowID:(id)a4 error:(id *)a5;
@end

@implementation CKDShareIDCacheTable

+ (id)dbProperties
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"rowID";
  v4[1] = @"zoneRowID";
  v5[0] = &unk_1F20AC5E8;
  v5[1] = &unk_1F20AC618;
  v4[2] = @"recordName";
  v5[2] = &unk_1F20AC630;
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, v4, 3);
  return v2;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDShareIDCacheTable)initWithZoneIDTable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDShareIDCacheTable;
  v6 = [(CKSQLiteCacheTable *)&v9 initWithLogicalTableName:@"ShareIDCacheTable" entryCountLimit:0x2000 dataSizeLimit:0 expirationTime:0.0 expireDelay:86400.0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_zoneIDTable, a3);
  }

  return v7;
}

- (id)entryForShareID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v35[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11 = objc_msgSend_zoneIDTable(self, v9, v10);
  v14 = objc_msgSend_zoneID(v8, v12, v13);
  id v33 = 0;
  v16 = objc_msgSend_rowIDForZoneID_addIfNotFound_error_(v11, v15, (uint64_t)v14, v6, &v33);
  id v17 = v33;

  id v20 = 0;
  if (!v17 && v16)
  {
    v21 = objc_msgSend_recordName(v8, v18, v19);
    v34[0] = @"recordName";
    v34[1] = @"zoneRowID";
    v35[0] = v21;
    v35[1] = v16;
    v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v35, v34, 2);
    id v32 = 0;
    uint64_t v25 = objc_msgSend_entryWithValues_label_error_setupBlock_(self, v24, (uint64_t)v23, off_1E64F1F10, &v32, &unk_1F2042D10);
    unint64_t v26 = (unint64_t)v32;
    if (v26 | v25) {
      id v17 = (id)v26;
    }
    else {
      id v17 = 0;
    }
    if (v26 | v25) {
      v27 = (void *)v25;
    }
    else {
      v27 = 0;
    }
    if (!(v26 | v25) && v6)
    {
      v28 = [CKDShareIDCacheEntry alloc];
      v27 = objc_msgSend_initWithRecordName_zoneRowID_(v28, v29, (uint64_t)v21, v16);
      objc_msgSend_insertObject_(self, v30, (uint64_t)v27);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v17) {
      id v20 = 0;
    }
    else {
      id v20 = v27;
    }
  }
  if (a5) {
    *a5 = v17;
  }

  return v20;
}

- (id)shareIDForRowID:(id)a3 error:(id *)a4
{
  id v31 = 0;
  BOOL v6 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E64F1F28, &v31);
  id v7 = v31;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 0;
  }
  if (v10)
  {
    id v11 = v7;
    goto LABEL_14;
  }
  uint64_t v12 = objc_msgSend_zoneRowID(v6, v8, v9);
  id v11 = (id)v12;
  if (!v12)
  {
LABEL_14:
    v15 = 0;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v15 = objc_msgSend_recordName(v6, v13, v14);

  if (!v15)
  {
    id v11 = 0;
    if (!a4) {
      goto LABEL_16;
    }
LABEL_15:
    *a4 = v11;
    goto LABEL_16;
  }
  v18 = objc_msgSend_zoneIDTable(self, v16, v17);
  v21 = objc_msgSend_zoneRowID(v6, v19, v20);
  id v30 = 0;
  v23 = objc_msgSend_zoneIDForRowID_error_(v18, v22, (uint64_t)v21, &v30);
  id v11 = v30;

  v15 = 0;
  if (!v11 && v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v27 = objc_msgSend_recordName(v6, v25, v26);
    v15 = objc_msgSend_initWithRecordName_zoneID_(v24, v28, (uint64_t)v27, v23);
  }
  if (a4) {
    goto LABEL_15;
  }
LABEL_16:

  return v15;
}

- (id)shareIDsForZoneRowID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = objc_opt_new();
  id v33 = @"zoneRowID";
  v34[0] = v8;
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v34, &v33, 1);
  id v32 = 0;
  uint64_t v14 = objc_msgSend_entriesWithValues_label_error_setupBlock_(self, v13, (uint64_t)v12, off_1E64F1F40, &v32, &unk_1F2042D30);
  id v15 = v32;

  if (!v15 && v14)
  {
    context = (void *)MEMORY[0x1C8789E70]();
    uint64_t v18 = objc_msgSend_nextObject(v14, v16, v17);
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      do
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        v23 = objc_msgSend_recordName(v19, v21, v22);
        uint64_t v25 = objc_msgSend_initWithRecordName_zoneID_(v20, v24, (uint64_t)v23, v9);

        objc_msgSend_addObject_(v10, v26, (uint64_t)v25);
        uint64_t v29 = objc_msgSend_nextObject(v14, v27, v28);

        uint64_t v19 = (void *)v29;
      }
      while (v29);
    }
  }
  if (a5) {
    *a5 = v15;
  }

  return v10;
}

- (BOOL)removeRowID:(id)a3 error:(id *)a4
{
  BOOL v6 = objc_msgSend_deletePrimaryKeyValue_(self, a2, (uint64_t)a3);
  if (v6 && objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v5, (uint64_t)v6))
  {

    BOOL v6 = 0;
  }
  if (a4) {
    *a4 = v6;
  }

  return v6 == 0;
}

- (unint64_t)removeSharesWithZoneRowID:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v15 = @"zoneRowID";
  v16[0] = a3;
  BOOL v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v6, v8, (uint64_t)v16, &v15, 1);
  id v14 = 0;
  unint64_t v11 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v10, (uint64_t)v9, off_1E64F1F58, &v14, &unk_1F2042D50);
  id v12 = v14;

  if (a4) {
    *a4 = v12;
  }

  return v11;
}

- (unint64_t)removeSharesWithZoneRowID:(id)a3 exceptRowID:(id)a4 error:(id *)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v18[0] = @"zoneRowID";
  v18[1] = @"rowID";
  v19[0] = v8;
  v19[1] = v9;
  unint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v19, v18, 2);
  id v17 = 0;
  unint64_t v13 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v12, (uint64_t)v11, off_1E64F1F70, &v17, &unk_1F2042D70);
  id v14 = v17;
  id v15 = v14;
  if (a5) {
    *a5 = v14;
  }

  return v13;
}

- (CKDZoneIDCacheTable)zoneIDTable
{
  return self->_zoneIDTable;
}

- (void).cxx_destruct
{
}

@end