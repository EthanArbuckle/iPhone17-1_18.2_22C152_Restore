@interface CKDZoneShareCacheTable
+ (Class)entryClass;
+ (id)dbProperties;
- (BOOL)addZoneShareID:(id)a3 error:(id *)a4;
- (BOOL)hasZoneID:(id)a3 error:(id *)a4;
- (BOOL)removeRowID:(id)a3 error:(id *)a4;
- (CKDShareIDCacheTable)shareIDTable;
- (CKDZoneShareCacheTable)initWithShareIDTable:(id)a3;
- (id)entryForZoneID:(id)a3 error:(id *)a4;
- (id)shareIDForZoneID:(id)a3 error:(id *)a4;
@end

@implementation CKDZoneShareCacheTable

+ (id)dbProperties
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"zoneRowID";
  v4[1] = @"shareRowID";
  v5[0] = &unk_1F20AC5E8;
  v5[1] = &unk_1F20AC648;
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, v4, 2);
  return v2;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDZoneShareCacheTable)initWithShareIDTable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDZoneShareCacheTable;
  v6 = [(CKSQLiteCacheTable *)&v9 initWithLogicalTableName:@"ZoneShareTable" entryCountLimit:0x2000 dataSizeLimit:0 expirationTime:0.0 expireDelay:86400.0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shareIDTable, a3);
  }

  return v7;
}

- (id)entryForZoneID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v9 = objc_msgSend_shareIDTable(self, v7, v8);
  v12 = objc_msgSend_zoneIDTable(v9, v10, v11);
  id v21 = 0;
  v14 = objc_msgSend_rowIDForZoneID_addIfNotFound_error_(v12, v13, (uint64_t)v6, 0, &v21);

  id v15 = v21;
  id v17 = 0;
  if (!v15 && v14)
  {
    id v20 = 0;
    v18 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, v16, (uint64_t)v14, 0, off_1E64F1F88, &v20);
    id v15 = v20;
    id v17 = 0;
    if (!v15 && v18) {
      id v17 = v18;
    }
  }
  if (a4) {
    *a4 = v15;
  }

  return v17;
}

- (id)shareIDForZoneID:(id)a3 error:(id *)a4
{
  id v23 = 0;
  id v6 = objc_msgSend_entryForZoneID_error_(self, a2, (uint64_t)a3, &v23);
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
  v14 = objc_msgSend_shareIDTable(self, v12, v13);
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

- (BOOL)hasZoneID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_shareIDTable(self, v7, v8);
  v12 = objc_msgSend_zoneIDTable(v9, v10, v11);
  id v22 = 0;
  v14 = objc_msgSend_rowIDForZoneID_addIfNotFound_error_(v12, v13, (uint64_t)v6, 0, &v22);

  id v15 = v22;
  BOOL v17 = 0;
  if (!v15 && v14)
  {
    id v21 = 0;
    v18 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, v16, (uint64_t)v14, MEMORY[0x1E4F1CBF0], off_1E64F1FA0, &v21);
    id v15 = v21;
    if (v15) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v18 == 0;
    }
    BOOL v17 = !v19;
  }
  if (a4) {
    *a4 = v15;
  }

  return v17;
}

- (BOOL)addZoneShareID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_shareIDTable(self, v7, v8);
  id v51 = 0;
  uint64_t v11 = objc_msgSend_entryForShareID_addIfNotFound_error_(v9, v10, (uint64_t)v6, 1, &v51);

  id v12 = v51;
  if (v12) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v11 == 0;
  }
  if (v15)
  {
    BOOL v16 = 0;
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v17 = objc_msgSend_zoneRowID(v11, v13, v14);
  id v50 = 0;
  BOOL v19 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, v18, (uint64_t)v17, 0, 0, &v50);
  id v12 = v50;

  if (v12)
  {
    BOOL v16 = 0;
    goto LABEL_22;
  }
  v24 = objc_msgSend_rowID(v11, v20, v21);
  if (!v19)
  {
    v30 = [CKDZoneShareCacheEntry alloc];
    v33 = objc_msgSend_zoneRowID(v11, v31, v32);
    v36 = objc_msgSend_rowID(v11, v34, v35);
    v38 = objc_msgSend_initWithZoneRowID_shareRowID_(v30, v37, (uint64_t)v33, v36);

    objc_msgSend_insertObject_(self, v39, (uint64_t)v38);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v40 = v12 == 0;
    goto LABEL_17;
  }
  v25 = objc_msgSend_shareRowID(v19, v22, v23);
  char isEqual = objc_msgSend_isEqual_(v25, v26, (uint64_t)v24);

  if ((isEqual & 1) == 0)
  {
    v38 = objc_msgSend_shareRowID(v19, v28, v29);
    objc_msgSend_setShareRowID_(v19, v41, (uint64_t)v24);
    uint64_t v43 = objc_msgSend_updateUsingObject_(self, v42, (uint64_t)v19);
    if (v43)
    {
      id v12 = (id)v43;
      BOOL v16 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v46 = objc_msgSend_shareIDTable(self, v44, v45);
    id v49 = 0;
    objc_msgSend_removeRowID_error_(v46, v47, (uint64_t)v38, &v49);
    id v12 = v49;

    BOOL v40 = v12 == 0;
LABEL_17:
    BOOL v16 = v40;
    goto LABEL_20;
  }
  BOOL v16 = 0;
  id v12 = 0;
LABEL_21:

LABEL_22:
  if (a4) {
LABEL_23:
  }
    *a4 = v12;
LABEL_24:

  return v16;
}

- (BOOL)removeRowID:(id)a3 error:(id *)a4
{
  id v6 = objc_msgSend_deletePrimaryKeyValue_(self, a2, (uint64_t)a3);
  if (v6 && objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v5, (uint64_t)v6))
  {

    id v6 = 0;
  }
  if (a4) {
    *a4 = v6;
  }

  return v6 == 0;
}

- (CKDShareIDCacheTable)shareIDTable
{
  return self->_shareIDTable;
}

- (void).cxx_destruct
{
}

@end