@interface CKDShareIDCacheRecordTable
+ (Class)entryClass;
+ (id)dbProperties;
- (BOOL)addOrUpdateRecordID:(id)a3 withParentID:(id)a4 error:(id *)a5;
- (BOOL)addShareID:(id)a3 forRootRecordID:(id)a4 error:(id *)a5;
- (BOOL)propagateShareRowID:(id)a3 toChildrenOfRowID:(id)a4 error:(id *)a5;
- (BOOL)removeRecordID:(id)a3 error:(id *)a4;
- (BOOL)removeRecordsWithShareRowID:(id)a3 error:(id *)a4;
- (CKDShareIDCacheRecordTable)initWithShareIDTable:(id)a3;
- (CKDShareIDCacheTable)shareIDTable;
- (id)entryForRecordID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5;
- (id)shareIDForRecordID:(id)a3 error:(id *)a4;
- (id)shareIDsForZoneID:(id)a3 error:(id *)a4;
- (unint64_t)removeRecordsWithZoneRowID:(id)a3 error:(id *)a4;
- (unint64_t)removeZoneID:(id)a3 error:(id *)a4;
@end

@implementation CKDShareIDCacheRecordTable

+ (id)dbProperties
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"rowID";
  v4[1] = @"zoneRowID";
  v5[0] = &unk_1F20AC5E8;
  v5[1] = &unk_1F20AC618;
  v4[2] = @"recordName";
  v4[3] = @"shareRowID";
  v5[2] = &unk_1F20AC630;
  v5[3] = &unk_1F20AC660;
  v4[4] = @"parentRowID";
  v5[4] = &unk_1F20AC660;
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, v4, 5);
  return v2;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDShareIDCacheRecordTable)initWithShareIDTable:(id)a3
{
  id v5 = a3;
  v8 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v6, v7);
  uint64_t v11 = objc_msgSend_deviceCapabilityShareIDSQLCacheCountLimit(v8, v9, v10);
  double v14 = (double)(int)objc_msgSend_deviceCapabilityShareIDSQLCacheExpiryTime(v8, v12, v13);
  objc_msgSend_deviceCapabilityShareIDSQLCacheExpireDelay(v8, v15, v16);
  v21.receiver = self;
  v21.super_class = (Class)CKDShareIDCacheRecordTable;
  v18 = [(CKSQLiteCacheTable *)&v21 initWithLogicalTableName:@"ShareIDCacheRecordTable" entryCountLimit:v11 dataSizeLimit:0 expirationTime:v14 expireDelay:v17];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_shareIDTable, a3);
  }

  return v19;
}

- (id)entryForRecordID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v39[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v11 = objc_msgSend_recordName(v8, v9, v10);
  double v14 = objc_msgSend_zoneID(v8, v12, v13);

  id v17 = 0;
  if (v11 && v14)
  {
    v18 = objc_msgSend_shareIDTable(self, v15, v16);
    objc_super v21 = objc_msgSend_zoneIDTable(v18, v19, v20);
    id v37 = 0;
    v23 = objc_msgSend_rowIDForZoneID_addIfNotFound_error_(v21, v22, (uint64_t)v14, v6, &v37);
    id v24 = v37;

    id v26 = 0;
    if (!v24 && v23)
    {
      v38[0] = @"zoneRowID";
      v38[1] = @"recordName";
      v39[0] = v23;
      v39[1] = v11;
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v39, v38, 2);
      id v36 = 0;
      uint64_t v29 = objc_msgSend_entryWithValues_label_error_setupBlock_(self, v28, (uint64_t)v27, off_1E64F1FB8, &v36, &unk_1F2042D90);
      unint64_t v30 = (unint64_t)v36;
      unint64_t v31 = v30 | v29;
      if (v30 | v29) {
        id v24 = (id)v30;
      }
      else {
        id v24 = 0;
      }
      if (!(v30 | v29)) {
        uint64_t v29 = 0;
      }
      if (!v31 && v6)
      {
        v32 = [CKDShareIDCacheRecordEntry alloc];
        uint64_t v29 = objc_msgSend_initWithZoneRowID_recordName_(v32, v33, (uint64_t)v23, v11);
        objc_msgSend_insertObject_(self, v34, v29);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v24) {
        id v26 = 0;
      }
      else {
        id v26 = (id)v29;
      }
    }
    if (a5) {
      *a5 = v24;
    }
    id v17 = v26;
  }
  return v17;
}

- (id)shareIDForRecordID:(id)a3 error:(id *)a4
{
  id v23 = 0;
  BOOL v6 = objc_msgSend_entryForRecordID_addIfNotFound_error_(self, a2, (uint64_t)a3, 0, &v23);
  id v7 = v23;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 0;
  }
  if (v10)
  {
    id v11 = v7;
    goto LABEL_12;
  }
  objc_msgSend_shareRowID(v6, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    id v20 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  double v14 = objc_msgSend_shareIDTable(self, v12, v13);
  id v17 = objc_msgSend_shareRowID(v6, v15, v16);
  id v22 = 0;
  v19 = objc_msgSend_shareIDForRowID_error_(v14, v18, (uint64_t)v17, &v22);
  id v11 = v22;

  id v20 = 0;
  if (!v11) {
    id v20 = v19;
  }

  if (a4) {
LABEL_13:
  }
    *a4 = v11;
LABEL_14:

  return v20;
}

- (id)shareIDsForZoneID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_shareIDTable(self, v7, v8);
  v12 = objc_msgSend_zoneIDTable(v9, v10, v11);
  id v24 = 0;
  double v14 = objc_msgSend_rowIDForZoneID_addIfNotFound_error_(v12, v13, (uint64_t)v6, 0, &v24);
  id v15 = v24;

  id v18 = 0;
  if (!v15 && v14)
  {
    v19 = objc_msgSend_shareIDTable(self, v16, v17);
    id v23 = 0;
    objc_super v21 = objc_msgSend_shareIDsForZoneRowID_zoneID_error_(v19, v20, (uint64_t)v14, v6, &v23);
    id v15 = v23;

    id v18 = 0;
    if (!v15) {
      id v18 = v21;
    }
  }
  if (a4) {
    *a4 = v15;
  }

  return v18;
}

- (BOOL)addOrUpdateRecordID:(id)a3 withParentID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v51 = 0;
  BOOL v10 = objc_msgSend_entryForRecordID_addIfNotFound_error_(self, v9, (uint64_t)a4, 1, &v51);
  id v12 = v51;
  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (!v13)
  {
    id v50 = 0;
    double v14 = objc_msgSend_entryForRecordID_addIfNotFound_error_(self, v11, (uint64_t)v8, 0, &v50);
    id v15 = v50;
    if (v15)
    {
      id v12 = v15;
    }
    else
    {
      if (!v14)
      {
        id v18 = [CKDShareIDCacheRecordEntry alloc];
        objc_super v21 = objc_msgSend_zoneRowID(v10, v19, v20);
        id v24 = objc_msgSend_recordName(v8, v22, v23);
        double v14 = objc_msgSend_initWithZoneRowID_recordName_(v18, v25, (uint64_t)v21, v24);
      }
      id v26 = objc_msgSend_rowID(v10, v16, v17);
      objc_msgSend_setParentRowID_(v14, v27, (uint64_t)v26);

      unint64_t v30 = objc_msgSend_shareRowID(v14, v28, v29);
      v33 = objc_msgSend_shareRowID(v10, v31, v32);
      char isEqual = objc_msgSend_isEqual_(v30, v34, (uint64_t)v33);

      v38 = objc_msgSend_shareRowID(v10, v36, v37);
      objc_msgSend_setShareRowID_(v14, v39, (uint64_t)v38);

      objc_msgSend_insertObject_orUpdateProperties_label_(self, v40, (uint64_t)v14, 0, off_1E64F1FD0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12 && (isEqual & 1) == 0)
      {
        v43 = objc_msgSend_shareRowID(v14, v41, v42);
        v46 = objc_msgSend_rowID(v14, v44, v45);
        id v49 = 0;
        objc_msgSend_propagateShareRowID_toChildrenOfRowID_error_(self, v47, (uint64_t)v43, v46, &v49);
        id v12 = v49;
      }
    }
  }
  if (a5) {
    *a5 = v12;
  }

  return v12 == 0;
}

- (BOOL)propagateShareRowID:(id)a3 toChildrenOfRowID:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v39 = @"parentRowID";
  v40[0] = v9;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v40, &v39, 1);
  id v37 = 0;
  BOOL v13 = objc_msgSend_entriesWithValues_label_error_setupBlock_(self, v12, (uint64_t)v11, off_1E64F1FE8, &v37, &unk_1F2042DB0);
  id v14 = v37;

  if (!v14 && v13)
  {
    id v15 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v18 = objc_msgSend_nextObject(v13, v16, v17);
    if (v18)
    {
      objc_super v21 = (void *)v18;
      v34 = v15;
      v35 = a5;
      do
      {
        id v22 = objc_msgSend_shareRowID(v21, v19, v20, v34, v35);
        char isEqual = objc_msgSend_isEqual_(v22, v23, (uint64_t)v8);

        if (isEqual)
        {
          id v14 = 0;
        }
        else
        {
          objc_msgSend_setShareRowID_(v21, v25, (uint64_t)v8);
          v38 = @"shareRowID";
          v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)&v38, 1);
          objc_msgSend_updateProperties_usingObject_label_(self, v29, (uint64_t)v28, v21, off_1E64F2000);
          id v14 = (id)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            unint64_t v30 = objc_msgSend_rowID(v21, v25, v26);
            id v36 = 0;
            objc_msgSend_propagateShareRowID_toChildrenOfRowID_error_(self, v31, (uint64_t)v8, v30, &v36);
            id v14 = v36;
          }
        }
        uint64_t v32 = objc_msgSend_nextObject(v13, v25, v26);

        if (v14) {
          break;
        }
        objc_super v21 = v32;
      }
      while (v32);

      id v15 = v34;
      a5 = v35;
    }
    else
    {
      id v14 = 0;
    }
  }
  if (a5) {
    *a5 = v14;
  }

  return v14 == 0;
}

- (BOOL)removeRecordsWithShareRowID:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v17 = @"shareRowID";
  v18[0] = v6;
  id v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v18, &v17, 1);
  id v14 = 0;
  uint64_t v10 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v9, (uint64_t)v8, off_1E64F2018, &v14, &unk_1F2042DD0);
  id v11 = v14;

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v10;
      _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Deleted %zu records for the share from the shareID records cache.", buf, 0xCu);
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  if (a4) {
LABEL_6:
  }
    *a4 = v11;
LABEL_7:

  return v11 == 0;
}

- (BOOL)removeRecordID:(id)a3 error:(id *)a4
{
  id v11 = 0;
  id v6 = objc_msgSend_entryForRecordID_addIfNotFound_error_(self, a2, (uint64_t)a3, 0, &v11);
  id v8 = v11;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (!v9)
  {
    objc_msgSend_deleteObject_(self, v7, (uint64_t)v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4) {
    *a4 = v8;
  }

  return v8 == 0;
}

- (unint64_t)removeZoneID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v9 = objc_msgSend_shareIDTable(self, v7, v8);
  id v12 = objc_msgSend_zoneIDTable(v9, v10, v11);
  id v20 = 0;
  id v14 = objc_msgSend_rowIDForZoneID_addIfNotFound_error_(v12, v13, (uint64_t)v6, 0, &v20);

  id v15 = v20;
  unint64_t v17 = 0;
  if (!v15 && v14)
  {
    id v19 = 0;
    unint64_t v17 = objc_msgSend_removeRecordsWithZoneRowID_error_(self, v16, (uint64_t)v14, &v19);
    id v15 = v19;
  }
  if (a4) {
    *a4 = v15;
  }

  return v17;
}

- (unint64_t)removeRecordsWithZoneRowID:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v15 = @"zoneRowID";
  v16[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  BOOL v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v6, v8, (uint64_t)v16, &v15, 1);
  id v14 = 0;
  unint64_t v11 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v10, (uint64_t)v9, off_1E64F2030, &v14, &unk_1F2042DF0);
  id v12 = v14;

  if (a4) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)addShareID:(id)a3 forRootRecordID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v12 = objc_msgSend_shareIDTable(self, v10, v11);
  id v44 = 0;
  id v14 = objc_msgSend_entryForShareID_addIfNotFound_error_(v12, v13, (uint64_t)v9, 1, &v44);

  id v15 = v44;
  if (!v15 && v14)
  {
    id v43 = 0;
    unint64_t v17 = objc_msgSend_entryForRecordID_addIfNotFound_error_(self, v16, (uint64_t)v8, 0, &v43);
    id v18 = v43;
    if (v18)
    {
      id v15 = v18;
    }
    else
    {
      if (!v17)
      {
        objc_super v21 = [CKDShareIDCacheRecordEntry alloc];
        id v24 = objc_msgSend_zoneRowID(v14, v22, v23);
        v27 = objc_msgSend_recordName(v8, v25, v26);
        unint64_t v17 = objc_msgSend_initWithZoneRowID_recordName_(v21, v28, (uint64_t)v24, v27);
      }
      uint64_t v29 = objc_msgSend_rowID(v14, v19, v20);
      uint64_t v32 = objc_msgSend_shareRowID(v17, v30, v31);
      char isEqual = objc_msgSend_isEqual_(v29, v33, (uint64_t)v32);

      if (isEqual)
      {
        id v15 = 0;
      }
      else
      {
        objc_msgSend_setShareRowID_(v17, v35, (uint64_t)v29);
        objc_msgSend_insertObject_orUpdateProperties_label_(self, v36, (uint64_t)v17, 0, off_1E64F2048);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v39 = objc_msgSend_rowID(v17, v37, v38);
          id v42 = 0;
          objc_msgSend_propagateShareRowID_toChildrenOfRowID_error_(self, v40, (uint64_t)v29, v39, &v42);
          id v15 = v42;
        }
      }
    }
  }
  if (a5) {
    *a5 = v15;
  }

  return v15 == 0;
}

- (CKDShareIDCacheTable)shareIDTable
{
  return self->_shareIDTable;
}

- (void).cxx_destruct
{
}

@end