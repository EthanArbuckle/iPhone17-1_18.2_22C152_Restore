@interface CKDatabaseOperation
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)zoneIDHasCorrectDatabaseScope:(id)a3 error:(id *)a4;
- (CKDatabase)database;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)databaseIfNotNil;
- (int64_t)databaseScope;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)setDatabase:(CKDatabase *)database;
@end

@implementation CKDatabaseOperation

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  v23.receiver = self;
  v23.super_class = (Class)CKDatabaseOperation;
  v6 = [(CKOperation *)&v23 CKDescriptionPropertiesWithPublic:a3 private:a4 shouldExpand:a5];
  v10 = objc_msgSend_mutableCopy(v6, v7, v8, v9);

  v14 = objc_msgSend_databaseIfNotNil(self, v11, v12, v13);
  v18 = v14;
  if (v14)
  {
    unint64_t v19 = objc_msgSend_databaseScope(v14, v15, v16, v17);
    v20 = CKDatabaseScopeString(v19);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v21, (uint64_t)v20, @"databaseScope");
  }

  return v10;
}

- (CKDatabase)database
{
  v2 = self;
  objc_sync_enter(v2);
  database = v2->_database;
  if (!database)
  {
    v7 = objc_msgSend_configuration(v2, v3, v4, v5);
    v11 = objc_msgSend_container(v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_privateCloudDatabase(v11, v12, v13, v14);
    uint64_t v16 = v2->_database;
    v2->_database = (CKDatabase *)v15;

    database = v2->_database;
  }
  uint64_t v17 = database;
  objc_sync_exit(v2);

  return v17;
}

- (id)databaseIfNotNil
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_database;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDatabase:(CKDatabase *)database
{
  uint64_t v16 = database;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_database, database);
  uint64_t v9 = objc_msgSend_container(v16, v6, v7, v8);
  uint64_t v13 = objc_msgSend_configuration(v5, v10, v11, v12);
  objc_msgSend_setContainer_(v13, v14, (uint64_t)v9, v15);

  objc_sync_exit(v5);
}

- (void)fillOutOperationInfo:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDatabaseOperation;
  id v4 = a3;
  [(CKOperation *)&v15 fillOutOperationInfo:v4];
  uint64_t v8 = objc_msgSend_database(self, v5, v6, v7, v15.receiver, v15.super_class);
  uint64_t v12 = objc_msgSend_scope(v8, v9, v10, v11);
  objc_msgSend_setDatabaseScope_(v4, v13, v12, v14);
}

- (void)fillFromOperationInfo:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CKDatabaseOperation;
  id v4 = a3;
  [(CKOperation *)&v22 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_databaseScope(v4, v5, v6, v7, v22.receiver, v22.super_class);

  uint64_t v12 = objc_msgSend_configuration(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_container(v12, v13, v14, v15);
  unint64_t v19 = objc_msgSend_databaseWithDatabaseScope_(v16, v17, v8, v18);
  objc_msgSend_setDatabase_(self, v20, (uint64_t)v19, v21);
}

- (BOOL)zoneIDHasCorrectDatabaseScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (v6
    && objc_msgSend_databaseScope(v6, v7, v8, v9)
    && (uint64_t v14 = objc_msgSend_databaseScope(v10, v11, v12, v13), v14 != objc_msgSend_databaseScope(self, v15, v16, v17)))
  {
    if (a4)
    {
      unint64_t v22 = objc_msgSend_databaseScope(v10, v18, v19, v20);
      objc_super v23 = CKDatabaseScopeString(v22);
      unint64_t v27 = objc_msgSend_databaseScope(self, v24, v25, v26);
      v28 = CKDatabaseScopeString(v27);
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, @"CKErrorDomain", 12, @"zoneID had database scope \"%@\", expected \"%@\" in %@: %@", v23, v28, v30, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  id v6 = objc_msgSend_database(self, a2, (uint64_t)a3, v3);

  if (!v6)
  {
    if (a3)
    {
      uint64_t v26 = objc_msgSend_operationID(self, v7, v8, v9);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v28, @"CKErrorDomain", 12, @"There is no database set on operation %@.", v26);
      goto LABEL_7;
    }
    return 0;
  }
  uint64_t v10 = objc_msgSend_configuration(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_container(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_database(self, v15, v16, v17);
  unint64_t v22 = objc_msgSend_container(v18, v19, v20, v21);

  if (v14 != v22)
  {
    if (a3)
    {
      uint64_t v26 = objc_msgSend_operationID(self, v23, v24, v25);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v27, @"CKErrorDomain", 12, @"The container set on operation %@ does not match the container of the database set on that operation.", v26);
LABEL_7:
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
    return 0;
  }
  v30.receiver = self;
  v30.super_class = (Class)CKDatabaseOperation;
  return [(CKOperation *)&v30 CKOperationShouldRun:a3];
}

- (int64_t)databaseScope
{
  id v4 = objc_msgSend_database(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_databaseScope(v4, v5, v6, v7);

  return v8;
}

- (void).cxx_destruct
{
}

@end