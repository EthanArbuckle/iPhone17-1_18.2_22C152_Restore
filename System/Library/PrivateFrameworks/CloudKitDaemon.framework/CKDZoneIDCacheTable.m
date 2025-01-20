@interface CKDZoneIDCacheTable
+ (Class)entryClass;
+ (id)dbProperties;
- (BOOL)removeRowID:(id)a3 error:(id *)a4;
- (CKDZoneIDCacheTable)init;
- (id)entryForZoneID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5;
- (id)rowIDForZoneID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5;
- (id)zoneIDForRowID:(id)a3 error:(id *)a4;
@end

@implementation CKDZoneIDCacheTable

+ (id)dbProperties
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"rowID";
  v4[1] = @"zoneIDString";
  v5[0] = &unk_1F20AC5E8;
  v5[1] = &unk_1F20AC600;
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, v4, 2);
  return v2;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDZoneIDCacheTable)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDZoneIDCacheTable;
  return [(CKSQLiteCacheTable *)&v3 initWithLogicalTableName:@"ZoneIDCacheTable" entryCountLimit:0x2000 dataSizeLimit:0 expirationTime:0.0 expireDelay:86400.0];
}

- (id)entryForZoneID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v22[1] = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend_sqliteRepresentation(a3, a2, (uint64_t)a3);
  v21 = @"zoneIDString";
  v22[0] = v8;
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v22, &v21, 1);
  id v20 = 0;
  v12 = objc_msgSend_entryWithValues_label_error_setupBlock_(self, v11, (uint64_t)v10, off_1E64F1EE0, &v20, &unk_1F2042CF0);
  id v13 = v20;

  if (v13)
  {
LABEL_2:
    v14 = 0;
    if (!a5) {
      goto LABEL_8;
    }
LABEL_7:
    *a5 = v13;
    goto LABEL_8;
  }
  if (v12)
  {
    id v15 = v12;
    v14 = v15;
    id v13 = 0;
    goto LABEL_6;
  }
  if (v6)
  {
    v17 = [CKDZoneIDCacheEntry alloc];
    v12 = objc_msgSend_initWithZoneIDString_(v17, v18, (uint64_t)v8);
    objc_msgSend_insertObject_(self, v19, (uint64_t)v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13) {
      goto LABEL_2;
    }
    id v15 = v12;
    v14 = v15;
LABEL_6:
    v12 = v15;
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v14 = 0;
  id v13 = 0;
  v12 = 0;
  if (a5) {
    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

- (id)rowIDForZoneID:(id)a3 addIfNotFound:(BOOL)a4 error:(id *)a5
{
  id v13 = 0;
  BOOL v6 = objc_msgSend_entryForZoneID_addIfNotFound_error_(self, a2, (uint64_t)a3, a4, &v13);
  id v9 = v13;
  v10 = 0;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v6 == 0;
  }
  if (!v11)
  {
    v10 = objc_msgSend_rowID(v6, v7, v8);
  }
  if (a5) {
    *a5 = v9;
  }

  return v10;
}

- (id)zoneIDForRowID:(id)a3 error:(id *)a4
{
  id v17 = 0;
  v5 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E64F1EF8, &v17);
  id v8 = v17;
  id v9 = 0;
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v5 == 0;
  }
  if (!v10)
  {
    id v9 = objc_msgSend_zoneIDString(v5, v6, v7);

    if (v9)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1A320]);
      v14 = objc_msgSend_zoneIDString(v5, v12, v13);
      id v9 = objc_msgSend_initWithSqliteRepresentation_(v11, v15, (uint64_t)v14);
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v9;
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

@end