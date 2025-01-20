@interface CKSQLiteDatabaseRegistry
+ (Class)entryClass;
+ (id)dbProperties;
- (id)databaseIDForDatabase:(id)a3 error:(id *)a4;
- (id)databaseWithID:(id)a3;
- (id)entryForDatabase:(id)a3 refresh:(BOOL)a4 error:(id *)a5;
- (id)registerDatabase:(id)a3;
@end

@implementation CKSQLiteDatabaseRegistry

+ (id)dbProperties
{
  return &unk_1ED846A70;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)registerDatabase:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CKSQLiteDatabaseRegistryEntry);
  v9 = objc_msgSend_databaseDirectory(v4, v6, v7, v8);
  objc_msgSend_setDatabaseDirectory_(v5, v10, (uint64_t)v9, v11);

  v15 = objc_msgSend_uniquingKey(v4, v12, v13, v14);

  objc_msgSend_setUniquingKey_(v5, v16, (uint64_t)v15, v17);
  v20 = objc_msgSend_insertObject_(self, v18, (uint64_t)v5, v19);

  return v20;
}

- (id)databaseWithID:(id)a3
{
  id v4 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E5464F10, 0);
  uint64_t v8 = v4;
  if (!v4)
  {
    v15 = 0;
    goto LABEL_12;
  }
  v12 = objc_msgSend_databaseDirectory(v4, v5, v6, v7);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_db(self, v9, v10, v11);
    v15 = objc_msgSend_databaseInDirectory_registryDatabase_options_error_(CKSQLiteDatabase, v14, (uint64_t)v12, (uint64_t)v13, 1, 0);

    if (!v15) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v19 = objc_msgSend_uniquingKey(v8, v16, v17, v18);
    v23 = objc_msgSend_uniquingKey(v15, v20, v21, v22);
    char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

    if ((isEqual & 1) == 0)
    {

      v30 = objc_msgSend_tableGroup(self, v27, v28, v29);
      objc_msgSend_databaseWasRemoved_(v30, v31, (uint64_t)v8, v32);

      id v35 = (id)objc_msgSend_deleteObject_(self, v33, (uint64_t)v8, v34);
      v15 = 0;
    }
    goto LABEL_9;
  }
  v15 = objc_msgSend_db(self, v9, v10, v11);
  if (v15) {
    goto LABEL_7;
  }
LABEL_9:
  v36 = objc_msgSend_databaseManagerData(v15, v16, v17, v18);

  if (!v36) {
    objc_msgSend_setDatabaseManagerData_(v15, v37, (uint64_t)v8, v38);
  }

LABEL_12:

  return v15;
}

- (id)entryForDatabase:(id)a3 refresh:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_msgSend_db(self, v9, v10, v11);

  uint64_t v15 = objc_msgSend_databaseManagerData(v8, v12, v13, v14);
  if (v15)
  {
    uint64_t v19 = (CKSQLiteDatabaseRegistryEntry *)v15;
    if (v6) {
      id v20 = (id)objc_msgSend_fetchAllProperties_(self, v16, v15, v18);
    }
  }
  else
  {
    uint64_t v21 = objc_msgSend_uniquingKey(v8, v16, v17, v18);
    v39 = @"KEY";
    v40[0] = v21;
    v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v40, (uint64_t)&v39, 1);
    objc_msgSend_entryWithValues_label_error_setupBlock_(self, v24, (uint64_t)v23, (uint64_t)off_1E5464F28, 0, &unk_1ED7EF478);
    uint64_t v19 = (CKSQLiteDatabaseRegistryEntry *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      uint64_t v19 = objc_alloc_init(CKSQLiteDatabaseRegistryEntry);
      v30 = objc_msgSend_databaseDirectory(v8, v27, v28, v29);
      objc_msgSend_setDatabaseDirectory_(v19, v31, (uint64_t)v30, v32);

      objc_msgSend_setUniquingKey_(v19, v33, (uint64_t)v21, v34);
      v37 = objc_msgSend_insertObject_(self, v35, (uint64_t)v19, v36);
      if (v37)
      {

        uint64_t v19 = 0;
        if (a5) {
          *a5 = v37;
        }
      }
    }
    objc_msgSend_setDatabaseManagerData_(v8, v25, (uint64_t)v19, v26);
  }

  return v19;
}

- (id)databaseIDForDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);

  uint64_t v11 = objc_msgSend_entryForDatabase_refresh_error_(self, v10, (uint64_t)v6, 0, a4);

  uint64_t v15 = objc_msgSend_databaseID(v11, v12, v13, v14);

  return v15;
}

@end