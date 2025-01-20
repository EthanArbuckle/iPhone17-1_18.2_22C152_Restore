@interface CKSQLite
+ (id)equalityClauseAndBindingsForDict:(id)a3;
- (BOOL)deleteExactObject:(id)a3;
- (BOOL)hasMigrated;
- (BOOL)invalid;
- (BOOL)isCorrupt;
- (BOOL)isOpen;
- (BOOL)openWithError:(id *)a3;
- (BOOL)remove;
- (BOOL)shouldVacuum;
- (BOOL)traced;
- (CKSQLite)initWithPath:(id)a3 schema:(id)a4;
- (CKSQLiteDelegate)delegate;
- (NSString)objectClassPrefix;
- (NSString)path;
- (NSString)schema;
- (NSString)schemaVersion;
- (id)_boxedPropertyDictionary:(id)a3 forObjCClass:(id)a4;
- (id)_boxedValue:(id)a3 forObjcCProperty:(id)a4;
- (id)_performDatabaseOperation_locked:(id)a3 withErrorHandler:(id)a4;
- (id)_prepareDatabase;
- (id)_tableNameForClass:(Class)a3;
- (id)allTableNames;
- (id)columnNamesForTable:(id)a3;
- (id)creationDate;
- (id)datePropertyForKey:(id)a3;
- (id)handleDatabaseError:(id)a3;
- (id)handleDatabaseError:(id)a3 args:(char *)a4;
- (id)handleError:(id)a3;
- (id)invalidationHandler;
- (id)performDatabaseOperation:(id)a3;
- (id)performDatabaseOperation:(id)a3 withErrorHandler:(id)a4;
- (id)propertyForKey:(id)a3;
- (id)select:(id)a3 from:(id)a4;
- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6;
- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7;
- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8;
- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (id)selectAllObjectsOfClass:(Class)a3;
- (id)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5;
- (id)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6;
- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6;
- (id)selectObjectOfClass:(Class)a3 where:(id)a4 bindings:(id)a5;
- (id)sqlErrorWithMessage:(id)a3;
- (int)changes;
- (int)dbUserVersion;
- (int)deleteAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5;
- (int)userVersion;
- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4;
- (int64_t)insertOrReplaceObject:(id)a3;
- (int64_t)lastInsertRowID;
- (int64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (int64_t)synchronousMode;
- (int64_t)upsertInto:(id)a3 values:(id)a4 onConflict:(id)a5 doUpdate:(id)a6 where:(id)a7;
- (sqlite3)db;
- (unint64_t)openCount;
- (void)_dropAllTables;
- (void)_forceClosed_locked;
- (void)_forceClosed_unlocked;
- (void)_recursiveOperationLock:(id)a3;
- (void)assertInOperation:(SEL)a3;
- (void)close;
- (void)dealloc;
- (void)deleteFrom:(id)a3 matchingValues:(id)a4;
- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)executeSQL:(id)a3;
- (void)executeSQL:(id)a3 arguments:(char *)a4;
- (void)markCorrupt;
- (void)removePropertyForKey:(id)a3;
- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9;
- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 offset:(id)a9 block:(id)a10;
- (void)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8;
- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setDb:(sqlite3 *)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setObjectClassPrefix:(id)a3;
- (void)setOpenCount:(unint64_t)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setShouldVacuum:(BOOL)a3;
- (void)setSynchronousMode:(int64_t)a3;
- (void)setTraced:(BOOL)a3;
- (void)setUserVersion:(int)a3;
- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7;
- (void)updateAllObjectsOfClass:(Class)a3 set:(id)a4 where:(id)a5 bindings:(id)a6;
- (void)usingStatementForSQL:(id)a3 performBlock:(id)a4;
- (void)vacuum;
@end

@implementation CKSQLite

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_select_from_where_bindings_orderBy_limit_, a3, a4);
}

+ (id)equalityClauseAndBindingsForDict:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    v7 = objc_opt_new();
    v8 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v3;
    id v9 = v3;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v18 = objc_msgSend_objectForKeyedSubscript_(v9, v12, v17, v13);
          if (objc_msgSend_count(v8, v19, v20, v21)) {
            objc_msgSend_appendFormat_(v7, v22, @" AND %@ = ?", v23, v17);
          }
          else {
            objc_msgSend_appendFormat_(v7, v22, @"%@ = ?", v23, v17);
          }
          objc_msgSend_addObject_(v8, v24, (uint64_t)v18, v25);
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v33, (uint64_t)v37, 16);
      }
      while (v14);
    }

    v26 = [CKTuple2 alloc];
    v28 = objc_msgSend_initWithObject1_object2_(v26, v27, (uint64_t)v7, (uint64_t)v8);

    id v3 = v32;
  }
  else
  {
    v29 = [CKTuple2 alloc];
    v28 = objc_msgSend_initWithObject1_object2_(v29, v30, (uint64_t)&stru_1ED7F5C98, MEMORY[0x1E4F1CBF0]);
  }

  return v28;
}

- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend_assertInOperation_(self, v9, (uint64_t)a2, v10);
  uint64_t v14 = objc_msgSend_allKeys(v8, v11, v12, v13);
  uint64_t v17 = objc_msgSend_sortedArrayUsingSelector_(v14, v15, (uint64_t)sel_compare_, v16);

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (objc_msgSend_count(v17, v19, v20, v21))
  {
    unint64_t v24 = 0;
    do
    {
      uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v17, v22, v24, v23);
      v28 = objc_msgSend_objectForKeyedSubscript_(v8, v26, (uint64_t)v25, v27);
      objc_msgSend_setObject_atIndexedSubscript_(v18, v29, (uint64_t)v28, v24);

      ++v24;
    }
    while (v24 < objc_msgSend_count(v17, v30, v31, v32));
  }
  id v33 = objc_alloc(MEMORY[0x1E4F28E78]);
  long long v36 = objc_msgSend_initWithString_(v33, v34, @"insert or replace into ", v35);
  objc_msgSend_appendString_(v36, v37, (uint64_t)v7, v38);
  objc_msgSend_appendString_(v36, v39, @" ("), v40;
  uint64_t v44 = objc_msgSend_count(v17, v41, v42, v43);
  if (v44)
  {
    uint64_t v47 = v44;
    for (uint64_t i = 0; i != v47; ++i)
    {
      v49 = objc_msgSend_objectAtIndexedSubscript_(v17, v45, i, v46);
      objc_msgSend_appendString_(v36, v50, (uint64_t)v49, v51);

      if (i != objc_msgSend_count(v17, v52, v53, v54) - 1) {
        objc_msgSend_appendString_(v36, v45, @",", v46);
      }
    }
    objc_msgSend_appendString_(v36, v45, @" values ("), v46);
    for (uint64_t j = 0; j != v47; ++j)
    {
      if (j == objc_msgSend_count(v17, v55, v56, v57) - 1) {
        objc_msgSend_appendString_(v36, v59, @"?", v60);
      }
      else {
        objc_msgSend_appendString_(v36, v59, @"?,", v60);
      }
    }
  }
  else
  {
    objc_msgSend_appendString_(v36, v45, @" values ("), v46);
  }
  objc_msgSend_appendString_(v36, v55, @""), v57);
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = sub_18AF28560;
  v65[3] = &unk_1E5462EB0;
  id v61 = v18;
  v67 = self;
  v68 = &v69;
  id v66 = v61;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v62, (uint64_t)v36, (uint64_t)v65);
  int64_t v63 = v70[3];

  _Block_object_dispose(&v69, 8);
  return v63;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 offset:(id)a9 block:(id)a10
{
  id v17 = a3;
  id v54 = a4;
  id v18 = a5;
  id v53 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  objc_msgSend_assertInOperation_(self, v23, (uint64_t)a2, v24);
  id v25 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (objc_msgSend_count(v17, v26, v27, v28))
  {
    objc_msgSend_componentsJoinedByString_(v17, v29, @", ", v30);
    uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v31 = @"*";
  }
  objc_msgSend_appendFormat_(v25, v29, @"select %@ from %@", v30, v31, v54);
  if (objc_msgSend_length(v18, v32, v33, v34)) {
    objc_msgSend_appendFormat_(v25, v35, @" where %@", v37, v18);
  }
  if (v19)
  {
    uint64_t v38 = objc_msgSend_componentsJoinedByString_(v19, v35, @", ", v37);
    objc_msgSend_appendFormat_(v25, v39, @" order by %@", v40, v38);
  }
  if (v20)
  {
    uint64_t v41 = objc_msgSend_longValue(v20, v35, v36, v37);
    objc_msgSend_appendFormat_(v25, v42, @" limit %ld", v43, v41);
    if (v21)
    {
      uint64_t v47 = objc_msgSend_longValue(v21, v44, v45, v46);
      objc_msgSend_appendFormat_(v25, v48, @" offset %ld", v49, v47);
    }
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_18AF27680;
  v55[3] = &unk_1E5462E38;
  id v56 = v53;
  id v57 = v22;
  id v50 = v22;
  id v51 = v53;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v52, (uint64_t)v25, (uint64_t)v55);
}

- (void)usingStatementForSQL:(id)a3 performBlock:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id *))a4;
  objc_msgSend_assertInOperation_(self, v9, (uint64_t)a2, v10);
  ppStmt = 0;
  id v11 = v7;
  db = self->_db;
  uint64_t v16 = (const char *)objc_msgSend_UTF8String(v11, v13, v14, v15);
  if (sqlite3_prepare_v2(db, v16, -1, &ppStmt, 0))
  {
    id v19 = objc_msgSend_sqlErrorWithMessage_(self, v17, @"Error preparing statement: %@", v18, v11, ppStmt);
    id v22 = (id)objc_msgSend_handleError_(self, v20, (uint64_t)v19, v21);

    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v24 = [CKSQLiteStatement alloc];
    uint64_t v23 = sub_18AF274CC((id *)&v24->super.isa, self, v11, ppStmt);
  }
  v8[2](v8, v23);

  sub_18AF27574((uint64_t)v23);
}

- (void)assertInOperation:(SEL)a3
{
  os_unfair_lock_assert_owner(&self->_operationLock);
  operationThread = (_opaque_pthread_t *)self->_operationThread;
  if (!operationThread)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    id v8 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v6, v9, v7, @"%@ called but not in a database operation context", v8);
  }
  if (operationThread != pthread_self())
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3A8];
    NSStringFromSelector(a2);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v12, v11, @"%@ called but some other thread is running a database operation", v13);
  }
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_18AF13CEC;
  uint64_t v41 = sub_18AF138B8;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_18AF28434;
  v30[3] = &unk_1E5462E88;
  id v20 = v14;
  id v31 = v20;
  id v21 = v15;
  id v32 = v21;
  id v22 = v16;
  id v33 = v22;
  id v23 = v17;
  id v34 = v23;
  id v24 = v18;
  id v35 = v24;
  uint64_t v36 = &v37;
  id v27 = (id)objc_msgSend_performDatabaseOperation_(self, v25, (uint64_t)v30, v26);
  id v28 = (id)v38[5];

  _Block_object_dispose(&v37, 8);

  return v28;
}

- (id)performDatabaseOperation:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_18AF13CEC;
  uint64_t v37 = sub_18AF138B8;
  id v38 = 0;
  if (v7) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = &unk_1ED7EF0B8;
  }
  if (objc_msgSend_invalid(self, v8, v9, v10))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v15 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v14, @"CKInternalErrorDomain", 1027, @"Database operation attempted with invalid %@ instance", v13);
    id v16 = (void *)v34[5];
    v34[5] = v15;
  }
  else
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = sub_18B07F208;
    id v31 = sub_18B07F234;
    id v32 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_18AF28070;
    v22[3] = &unk_1E5462C30;
    v22[4] = self;
    id v25 = &v33;
    id v23 = v6;
    id v24 = v11;
    uint64_t v26 = &v27;
    objc_msgSend__recursiveOperationLock_(self, v17, (uint64_t)v22, v18);
    uint64_t v19 = v28[5];
    if (v19) {
      (*(void (**)(uint64_t, CKSQLite *, NSError *))(v19 + 16))(v19, self, self->_invalidationError);
    }

    _Block_object_dispose(&v27, 8);
  }
  id v20 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (void)_recursiveOperationLock:(id)a3
{
  id v6 = (void (**)(id, void))a3;
  pthread_t v4 = pthread_self();
  if ((pthread_t)self->_operationThread == v4)
  {
    v6[2](v6, 0);
  }
  else
  {
    unint64_t v5 = (unint64_t)v4;
    os_unfair_lock_lock(&self->_operationLock);
    self->_operationThread = v5;
    v6[2](v6, 1);
    self->_operationThread = 0;
    os_unfair_lock_unlock(&self->_operationLock);
  }
}

- (id)performDatabaseOperation:(id)a3
{
  return (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, a2, (uint64_t)a3, 0);
}

- (id)_performDatabaseOperation_locked:(id)a3 withErrorHandler:(id)a4
{
  id v7 = (void (**)(id, CKSQLite *, void *))a3;
  id v8 = a4;
  objc_msgSend_assertInOperation_(self, v9, (uint64_t)a2, v10);
  if (objc_msgSend_invalid(self, v11, v12, v13))
  {
    id v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, @"CKSQLite.m", 202, @"expected a valid instance");
  }
  id v17 = _Block_copy(v8);
  id errorHandlerBlock = self->_errorHandlerBlock;
  self->_id errorHandlerBlock = v17;

  uint64_t v19 = (void *)MEMORY[0x18C12ADA0]();
  if (sqlite3_exec(self->_db, "begin exclusive", 0, 0, 0))
  {
    objc_msgSend_sqlErrorWithMessage_(self, v20, @"Failed to start transaction", v21);
    id v22 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v22;

    self->_cancelled = 1;
    id v24 = self->_error;
  }
  else
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_18AF28530;
    v33[3] = &unk_1E5462BE8;
    v33[4] = self;
    v7[2](v7, self, v33);
    id v24 = self->_error;
    if (self->_cancelled || objc_msgSend_invalid(self, v25, v26, v27))
    {
      db = self->_db;
      uint64_t v29 = "rollback";
    }
    else
    {
      db = self->_db;
      uint64_t v29 = "end";
    }
    sqlite3_exec(db, v29, 0, 0, 0);
  }

  return v24;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
}

- (int64_t)lastInsertRowID
{
  int64_t result = (int64_t)self->_db;
  if (result) {
    return sqlite3_last_insert_rowid((sqlite3 *)result);
  }
  return result;
}

- (CKSQLite)initWithPath:(id)a3 schema:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CKSQLite;
  uint64_t v12 = [(CKSQLite *)&v44 init];
  if (v12)
  {
    if (!objc_msgSend_length(v7, v9, v10, v11))
    {
      id v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, (uint64_t)v12, @"CKSQLite.m", 97, @"Can't init a database with a zero-length path");
    }
    v12->_operationLock._os_unfair_lock_opaque = 0;
    uint64_t v16 = objc_msgSend_copy(v7, v13, v14, v15);
    path = v12->_path;
    v12->_path = (NSString *)v16;

    objc_storeStrong((id *)&v12->_schema, a4);
    *(_OWORD *)md = 0u;
    long long v46 = 0u;
    uint64_t v19 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v18, (uint64_t)md, 32, 0);
    id v23 = objc_msgSend_schema(v12, v20, v21, v22);
    uint64_t v26 = objc_msgSend_dataUsingEncoding_(v23, v24, 4, v25);

    uint64_t v30 = (const void *)objc_msgSend_bytes(v26, v27, v28, v29);
    CC_LONG v34 = objc_msgSend_length(v26, v31, v32, v33);
    CC_SHA256(v30, v34, md);
    uint64_t v38 = objc_msgSend_CKUppercaseHexStringWithoutSpaces(v19, v35, v36, v37);
    schemaVersion = v12->_schemaVersion;
    v12->_schemaVersion = (NSString *)v38;

    objectClassPrefix = v12->_objectClassPrefix;
    v12->_objectClassPrefix = (NSString *)@"CK";

    v12->_synchronousMode = 1;
    *(_WORD *)&v12->_hasMigrated = 256;
  }
  return v12;
}

- (void)dealloc
{
  id v3 = (void *)MEMORY[0x18C12ADA0](self, a2);
  objc_msgSend__forceClosed_unlocked(self, v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)CKSQLite;
  [(CKSQLite *)&v7 dealloc];
}

- (id)sqlErrorWithMessage:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_db(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_errorForSQLite_message_args_(CKPrettyError, v9, v8, (uint64_t)v4, &v13);

  return v10;
}

- (int)userVersion
{
  uint64_t v5 = objc_msgSend_delegate(self, a2, v2, v3);

  if (!v5) {
    return self->_userVersion;
  }
  uint64_t v9 = objc_msgSend_delegate(self, v6, v7, v8);
  int v13 = objc_msgSend_userVersion(v9, v10, v11, v12);

  return v13;
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (void)vacuum
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_18B07EDF0;
  v3[3] = &unk_1E5462BC0;
  v3[4] = self;
  objc_msgSend__recursiveOperationLock_(self, a2, (uint64_t)v3, v2);
}

- (void)markCorrupt
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_msgSend_assertInOperation_(self, a2, (uint64_t)a2, v2);
  id v4 = self->_path;
  uint64_t v8 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  if (setxattr(v8, "CKSQLiteDatabaseInvalid", "1", 1uLL, 0, 0))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v9 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      path = self->_path;
      uint64_t v14 = v9;
      uint64_t v15 = __error();
      uint64_t v16 = strerror(*v15);
      int v17 = 138412546;
      uint64_t v18 = path;
      __int16 v19 = 2080;
      id v20 = v16;
      _os_log_fault_impl(&dword_18AF10000, v14, OS_LOG_TYPE_FAULT, "setxattr failed at path: %@. Removing database instead. error = %s", (uint8_t *)&v17, 0x16u);
    }
    objc_msgSend_remove(self, v10, v11, v12);
  }
}

- (BOOL)isCorrupt
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_path;
  uint64_t v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  ssize_t v8 = getxattr(v7, "CKSQLiteDatabaseInvalid", 0, 0, 0, 0);
  if (!v8) {
    goto LABEL_5;
  }
  if (v8 != -1)
  {
LABEL_10:
    BOOL v9 = 1;
    goto LABEL_11;
  }
  if (*__error() != 2 && *__error() != 93)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v10 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      path = self->_path;
      int v13 = v10;
      uint64_t v14 = __error();
      uint64_t v15 = strerror(*v14);
      int v16 = 138412546;
      int v17 = path;
      __int16 v18 = 2080;
      __int16 v19 = v15;
      _os_log_fault_impl(&dword_18AF10000, v13, OS_LOG_TYPE_FAULT, "getxattr failed at path: %@. error = %s", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_10;
  }
LABEL_5:
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)handleError:(id)a3
{
  id v6 = a3;
  objc_msgSend_assertInOperation_(self, v7, (uint64_t)a2, v8);
  if (objc_msgSend_invalid(self, v9, v10, v11))
  {
    id v14 = v6;
    goto LABEL_18;
  }
  int v18 = objc_msgSend_CKIsCorruptDatabaseError_(MEMORY[0x1E4F28C58], v12, (uint64_t)v6, v13);
  id errorHandlerBlock = (uint64_t (**)(id, id))self->_errorHandlerBlock;
  if (!errorHandlerBlock)
  {
    if (v18)
    {
      objc_msgSend__forceClosed_unlocked(self, v15, v16, v17);
      objc_msgSend_remove(self, v25, v26, v27);
    }
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v15, *MEMORY[0x1E4F1C3A8], @"%@", v6);
    goto LABEL_17;
  }
  uint64_t v20 = errorHandlerBlock[2](errorHandlerBlock, v6);
  if ((v18 & (v20 < 3)) != 0) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = v20;
  }
  if (v21 < 1)
  {
LABEL_17:
    id v14 = 0;
    goto LABEL_18;
  }
  error = self->_error;
  self->_cancelled = 1;
  if (!error) {
    objc_storeStrong((id *)&self->_error, a3);
  }
  id v14 = v6;
  if ((unint64_t)v21 >= 2)
  {
    objc_msgSend_setInvalid_(self, v23, 1, v24);
    objc_storeStrong((id *)&self->_invalidationError, a3);
    if (v21 != 2)
    {
      self->_needsMarkCorrupt = 1;
      if ((unint64_t)v21 >= 4) {
        self->_needsRemove = 1;
      }
    }
  }
LABEL_18:

  return v14;
}

- (id)handleDatabaseError:(id)a3 args:(char *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_db(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_errorForSQLite_message_args_(CKPrettyError, v11, v10, (uint64_t)v6, a4);

  uint64_t v15 = objc_msgSend_handleError_(self, v13, (uint64_t)v12, v14);

  return v15;
}

- (id)handleDatabaseError:(id)a3
{
  uint64_t v3 = objc_msgSend_handleDatabaseError_args_(self, a2, (uint64_t)a3, (uint64_t)&v6);

  return v3;
}

- (id)_prepareDatabase
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_18B07F504;
  v4[3] = &unk_1E5462C58;
  v4[4] = self;
  uint64_t v2 = objc_msgSend__performDatabaseOperation_locked_withErrorHandler_(self, a2, (uint64_t)v4, (uint64_t)&unk_1ED7F0C18);

  return v2;
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_18AF13CEC;
  uint64_t v13 = sub_18AF138B8;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B07FD38;
  v8[3] = &unk_1E5462C80;
  v8[5] = &v9;
  v8[6] = a2;
  v8[4] = self;
  objc_msgSend__recursiveOperationLock_(self, a2, (uint64_t)v8, v3);
  uint64_t v5 = (void *)v10[5];
  if (a3 && v5)
  {
    *a3 = v5;
    uint64_t v5 = (void *)v10[5];
  }
  BOOL v6 = v5 == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_forceClosed_locked
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_operationLock);
  db = self->_db;
  if (db)
  {
    if (sqlite3_close(db))
    {
      objc_msgSend_sqlErrorWithMessage_(self, v4, @"sqlite3_close() failed", v5);
      BOOL v6 = (CKSQLite *)objc_claimAutoreleasedReturnValue();
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v7 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        uint64_t v16 = v6;
        _os_log_error_impl(&dword_18AF10000, v7, OS_LOG_TYPE_ERROR, "Error closing database: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    self->_db = 0;
    self->_openCount = 0;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v8 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
    {
      path = self->_path;
      uint64_t v10 = v8;
      id v14 = objc_msgSend_CKSanitizedPath(path, v11, v12, v13);
      int v15 = 134218242;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      int v18 = v14;
      _os_log_debug_impl(&dword_18AF10000, v10, OS_LOG_TYPE_DEBUG, "Closed db (%p) at %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_forceClosed_unlocked
{
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  objc_msgSend__forceClosed_locked(self, v4, v5, v6);

  os_unfair_lock_unlock(p_operationLock);
}

- (void)close
{
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  unint64_t openCount = self->_openCount;
  if (openCount)
  {
    unint64_t v8 = openCount - 1;
    if (v8) {
      self->_unint64_t openCount = v8;
    }
    else {
      objc_msgSend__forceClosed_locked(self, v4, v5, v6);
    }
  }

  os_unfair_lock_unlock(p_operationLock);
}

- (BOOL)remove
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B080780;
  v5[3] = &unk_1E5462CA8;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend__recursiveOperationLock_(self, a2, (uint64_t)v5, v2);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTraced:(BOOL)a3
{
  BOOL v3 = a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  db = self->_db;
  if (db)
  {
    if (v3)
    {
      uint64_t v7 = (int (__cdecl *)(unsigned int, void *, void *, void *))sub_18B080A10;
      unsigned int v8 = 9;
    }
    else
    {
      unsigned int v8 = 0;
      uint64_t v7 = 0;
    }
    sqlite3_trace_v2(db, v8, v7, self);
  }
  self->_traced = v3;

  os_unfair_lock_unlock(p_operationLock);
}

- (int)changes
{
  objc_msgSend_assertInOperation_(self, a2, (uint64_t)a2, v2);
  db = self->_db;
  if (db)
  {
    LODWORD(db) = sqlite3_changes(db);
  }
  return (int)db;
}

- (void)executeSQL:(id)a3
{
  objc_msgSend_executeSQL_arguments_(self, a2, (uint64_t)a3, (uint64_t)&v3);
}

- (void)executeSQL:(id)a3 arguments:(char *)a4
{
  id v27 = a3;
  objc_msgSend_assertInOperation_(self, v7, (uint64_t)a2, v8);
  if ((objc_msgSend_invalid(self, v9, v10, v11) & 1) == 0)
  {
    id v12 = [NSString alloc];
    id v14 = objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v27, (uint64_t)a4);
    db = self->_db;
    uint64_t v19 = (const char *)objc_msgSend_UTF8String(v14, v16, v17, v18);
    uint64_t v20 = sqlite3_exec(db, v19, 0, 0, 0);
    if (v20)
    {
      id v23 = objc_msgSend_sqlErrorWithMessage_(self, v21, @"Error executing SQL: \"%@\" (%d)", v22, v14, v20);
      id v26 = (id)objc_msgSend_handleError_(self, v24, (uint64_t)v23, v25);
    }
  }
}

- (id)allTableNames
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_18AF13CEC;
  uint64_t v13 = sub_18AF138B8;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[4] = &v9;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B080E54;
  v8[3] = &unk_1E5462CF8;
  v8[4] = &v9;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B080F9C;
  v7[3] = &unk_1E5462D20;
  id v4 = (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, v3, (uint64_t)v8, (uint64_t)v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void)_dropAllTables
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_18B081044;
  v3[3] = &unk_1E5462C58;
  v3[4] = self;
  id v2 = (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, a2, (uint64_t)v3, (uint64_t)&unk_1ED7EF938);
}

- (id)propertyForKey:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    int v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, @"CKSQLite.m", 664, @"Null key");
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_18AF13CEC;
  uint64_t v24 = sub_18AF138B8;
  id v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B0812E0;
  v17[3] = &unk_1E5462D70;
  id v9 = v8;
  id v18 = v9;
  uint64_t v19 = &v20;
  id v12 = (id)objc_msgSend_performDatabaseOperation_(self, v10, (uint64_t)v17, v11);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v12 = v8;
  if (v8)
  {
    if (v7)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_18B081520;
      v18[3] = &unk_1E5462DC0;
      id v19 = v8;
      id v20 = v7;
      id v15 = (id)objc_msgSend_performDatabaseOperation_(self, v13, (uint64_t)v18, v14);
    }
    else
    {
      objc_msgSend_removePropertyForKey_(self, v9, (uint64_t)v8, v11);
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, @"CKSQLite.m", 678, @"Null key");
  }
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = objc_msgSend_propertyForKey_(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    id v8 = objc_opt_new();
    objc_msgSend_setDateFormat_(v8, v9, @"yyyy-MM-dd'T'HH:mm:ssZZZZZ", v10);
    id v13 = objc_msgSend_dateFromString_(v8, v11, (uint64_t)v4, v12);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v13 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = objc_opt_new();
    objc_msgSend_setDateFormat_(v8, v9, @"yyyy-MM-dd'T'HH:mm:ssZZZZZ", v10);
    objc_msgSend_stringFromDate_(v8, v11, (uint64_t)v7, v12);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_setProperty_forKey_(self, v6, (uint64_t)a3, (uint64_t)v13);
}

- (void)removePropertyForKey:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (v5)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_18B081858;
    v15[3] = &unk_1E5462C58;
    id v16 = v5;
    id v12 = (id)objc_msgSend_performDatabaseOperation_(self, v10, (uint64_t)v15, v11);
  }
  else
  {
    id v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, @"CKSQLite.m", 720, @"Null key");
  }
}

- (id)creationDate
{
  uint64_t v3 = objc_msgSend_propertyForKey_(self, a2, @"Created", v2);
  uint64_t v7 = v3;
  if (v3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_floatValue(v3, v4, v5, v6);
    id v13 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v8, v10, v11, v12, v9);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)columnNamesForTable:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B081B68;
  v14[3] = &unk_1E5462E10;
  id v6 = v4;
  id v15 = v6;
  id v16 = self;
  id v7 = v5;
  id v17 = v7;
  uint64_t v10 = objc_msgSend_performDatabaseOperation_(self, v8, (uint64_t)v14, v9);
  if (v10)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v11 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      _os_log_error_impl(&dword_18AF10000, v11, OS_LOG_TYPE_ERROR, "Error fetching column names for table %{public}@: %{public}@", buf, 0x16u);
    }

    id v7 = 0;
  }
  id v12 = v7;

  return v12;
}

- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
}

- (id)select:(id)a3 from:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_select_from_where_bindings_orderBy_limit_, a3, a4);
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_select_from_where_bindings_orderBy_limit_, a3, a4);
}

- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_select_from_where_bindings_orderBy_limit_, 0, a3);
}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_selectFrom_where_bindings_limit_, a3, a4);
}

- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a3;
  objc_msgSend_assertInOperation_(self, v18, (uint64_t)a2, v19);
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendFormat_(v20, v21, @"update %@", v22, v17);

  if (!objc_msgSend_length(v13, v23, v24, v25))
  {
    uint64_t v40 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v26, v27, v28);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, (uint64_t)self, @"CKSQLite.m", 862, @"null set expression");
  }
  objc_msgSend_appendFormat_(v20, v26, @" set %@", v28, v13);
  if (objc_msgSend_length(v14, v29, v30, v31)) {
    objc_msgSend_appendFormat_(v20, v32, @" where %@", v34, v14);
  }
  if (v16)
  {
    uint64_t v35 = objc_msgSend_integerValue(v16, v32, v33, v34);
    objc_msgSend_appendFormat_(v20, v36, @" limit %ld", v37, v35);
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_18B081F34;
  v42[3] = &unk_1E5462DE8;
  id v43 = v15;
  id v38 = v15;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v39, (uint64_t)v20, (uint64_t)v42);
}

- (int64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v5 = objc_msgSend_select_from_where_bindings_(self, a2, (uint64_t)&unk_1ED845F10, (uint64_t)a3, a4, a5);
  uint64_t v8 = v5;
  if (v5)
  {
    uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(v5, v6, 0, v7);
    id v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"n", v11);
    int64_t v16 = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);
  }
  else
  {
    int64_t v16 = -1;
  }

  return v16;
}

- (int64_t)upsertInto:(id)a3 values:(id)a4 onConflict:(id)a5 doUpdate:(id)a6 where:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v105 = a5;
  id v15 = a6;
  id v103 = a7;
  objc_msgSend_assertInOperation_(self, v16, (uint64_t)a2, v17);
  uint64_t v21 = objc_msgSend_allKeys(v14, v18, v19, v20);
  uint64_t v24 = objc_msgSend_sortedArrayUsingSelector_(v21, v22, (uint64_t)sel_compare_, v23);

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (objc_msgSend_count(v24, v26, v27, v28))
  {
    unint64_t v31 = 0;
    do
    {
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v24, v29, v31, v30);
      uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v14, v33, (uint64_t)v32, v34);
      objc_msgSend_setObject_atIndexedSubscript_(v25, v36, (uint64_t)v35, v31);

      ++v31;
    }
    while (v31 < objc_msgSend_count(v24, v37, v38, v39));
  }
  id v40 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v43 = objc_msgSend_initWithString_(v40, v41, @"insert into ", v42);
  objc_msgSend_appendString_(v43, v44, (uint64_t)v13, v45);
  objc_msgSend_appendString_(v43, v46, @" ("), v47;
  if (objc_msgSend_count(v24, v48, v49, v50))
  {
    unint64_t v53 = 0;
    do
    {
      id v54 = objc_msgSend_objectAtIndexedSubscript_(v24, v51, v53, v52);
      objc_msgSend_appendString_(v43, v55, (uint64_t)v54, v56);

      if (v53 != objc_msgSend_count(v24, v57, v58, v59) - 1) {
        objc_msgSend_appendString_(v43, v60, @",", v62);
      }
      ++v53;
    }
    while (v53 < objc_msgSend_count(v24, v60, v61, v62));
  }
  v104 = v13;
  objc_msgSend_appendString_(v43, v51, @" values ("), v52);
  if (objc_msgSend_count(v24, v63, v64, v65))
  {
    unint64_t v69 = 0;
    do
    {
      if (v69 == objc_msgSend_count(v24, v66, v67, v68) - 1) {
        objc_msgSend_appendString_(v43, v70, @"?", v71);
      }
      else {
        objc_msgSend_appendString_(v43, v70, @"?,", v71);
      }
      ++v69;
    }
    while (v69 < objc_msgSend_count(v24, v72, v73, v74));
  }
  objc_msgSend_appendString_(v43, v66, @""), v68);
  v77 = objc_msgSend_componentsJoinedByString_(v105, v75, @",", v76);
  objc_msgSend_appendFormat_(v43, v78, @" on conflict (%@) ", v79, v77);

  objc_msgSend_appendString_(v43, v80, @"do update set ", v81);
  if (objc_msgSend_count(v15, v82, v83, v84))
  {
    unint64_t v87 = 0;
    do
    {
      v88 = objc_msgSend_objectAtIndexedSubscript_(v15, v85, v87, v86);
      objc_msgSend_appendFormat_(v43, v89, @"%@ = excluded.%@", v90, v88, v88);
      if (v87 != objc_msgSend_count(v15, v91, v92, v93) - 1) {
        objc_msgSend_appendString_(v43, v94, @", ", v95);
      }

      ++v87;
    }
    while (v87 < objc_msgSend_count(v15, v96, v97, v98));
  }
  if (v103) {
    objc_msgSend_appendFormat_(v43, v85, @" where %@", v86, v103);
  }
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  uint64_t v113 = 0;
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = sub_18B082434;
  v106[3] = &unk_1E5462EB0;
  id v99 = v25;
  v108 = self;
  v109 = &v110;
  id v107 = v99;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v100, (uint64_t)v43, (uint64_t)v106);
  int64_t v101 = v111[3];

  _Block_object_dispose(&v110, 8);
  return v101;
}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_msgSend_assertInOperation_(self, v12, (uint64_t)a2, v13);
  int64_t v16 = objc_msgSend_stringWithFormat_(NSString, v14, @"delete from %@ where %@", v15, v11, v10);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B0825B0;
  v19[3] = &unk_1E5462DE8;
  id v20 = v9;
  id v17 = v9;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v18, (uint64_t)v16, (uint64_t)v19);
}

- (void)deleteFrom:(id)a3 matchingValues:(id)a4
{
  v48 = self;
  id v49 = a3;
  id v5 = a4;
  id v9 = objc_msgSend_allKeys(v5, v6, v7, v8);
  id v12 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_compare_, v11);

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (objc_msgSend_count(v12, v15, v16, v17))
  {
    int v20 = 0;
    unint64_t v21 = 0;
    do
    {
      uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v12, v18, v21, v19, v48);
      id v25 = objc_msgSend_objectForKeyedSubscript_(v5, v23, (uint64_t)v22, v24);

      uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(v12, v26, v21, v27);
      objc_msgSend_appendString_(v14, v29, (uint64_t)v28, v30);

      if (v25
        && (objc_msgSend_null(MEMORY[0x1E4F1CA98], v31, v32, v33),
            uint64_t v34 = objc_claimAutoreleasedReturnValue(),
            char isEqual = objc_msgSend_isEqual_(v34, v35, (uint64_t)v25, v36),
            v34,
            (isEqual & 1) == 0))
      {
        objc_msgSend_setObject_atIndexedSubscript_(v13, v31, (uint64_t)v25, v20++);
        objc_msgSend_appendString_(v14, v41, @"=?", v42);
      }
      else
      {
        objc_msgSend_appendString_(v14, v31, @" is NULL", v33);
      }
      if (v21 != objc_msgSend_count(v12, v38, v39, v40) - 1) {
        objc_msgSend_appendString_(v14, v43, @" AND ", v44);
      }

      ++v21;
    }
    while (v21 < objc_msgSend_count(v12, v45, v46, v47));
  }
  objc_msgSend_deleteFrom_where_bindings_(v48, v18, (uint64_t)v49, (uint64_t)v14, v13, v48);
}

- (id)_tableNameForClass:(Class)a3
{
  id v5 = objc_msgSend_CKSQLiteClassName(a3, a2, (uint64_t)a3, v3);
  if ((objc_msgSend_hasPrefix_(v5, v6, (uint64_t)self->_objectClassPrefix, v7) & 1) == 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v8, *MEMORY[0x1E4F1C3C8], @"Object class \"%@\" does not have prefix \"%@\"", v5, self->_objectClassPrefix);
  }
  uint64_t v11 = objc_msgSend_length(self->_objectClassPrefix, v8, v9, v10);
  id v14 = objc_msgSend_substringFromIndex_(v5, v12, v11, v13);

  return v14;
}

- (int64_t)insertOrReplaceObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend__tableNameForClass_(self, v6, v5, v7);
  id v12 = objc_msgSend_dictionaryPropertyEncoding(v4, v9, v10, v11);

  int64_t v14 = objc_msgSend_insertOrReplaceInto_values_(self, v13, (uint64_t)v8, (uint64_t)v12);
  return v14;
}

- (BOOL)deleteExactObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend__tableNameForClass_(self, v7, v6, v8);
  uint64_t v13 = objc_msgSend_dictionaryPropertyEncoding(v4, v10, v11, v12);
  objc_msgSend_deleteFrom_matchingValues_(self, v14, (uint64_t)v9, (uint64_t)v13);
  LODWORD(self) = objc_msgSend_changes(self, v15, v16, v17);

  return self == 1;
}

- (int)deleteAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B082AC8;
  v16[3] = &unk_1E5462F00;
  v16[4] = self;
  Class v20 = a3;
  id v10 = v8;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  uint64_t v19 = &v21;
  id v14 = (id)objc_msgSend_performDatabaseOperation_(self, v12, (uint64_t)v16, v13);
  LODWORD(self) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)self;
}

- (id)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v15 = objc_msgSend_classForHandle_(CKObjCClass, v13, (uint64_t)a3, v14);
  id v18 = objc_msgSend__tableNameForClass_(self, v16, (uint64_t)a3, v17);
  uint64_t v22 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_18B082EB8;
  v35[3] = &unk_1E5462F50;
  id v23 = v18;
  id v36 = v23;
  id v24 = v10;
  id v37 = v24;
  id v25 = v11;
  id v38 = v25;
  id v26 = v12;
  id v39 = v26;
  uint64_t v40 = self;
  id v27 = v15;
  id v41 = v27;
  Class v43 = a3;
  id v28 = v22;
  id v42 = v28;
  unint64_t v31 = objc_msgSend_performDatabaseOperation_(self, v29, (uint64_t)v35, v30);
  if (v31)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v32 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v31;
      _os_log_error_impl(&dword_18AF10000, v32, OS_LOG_TYPE_ERROR, "Database select failed with error: %{public}@", buf, 0xCu);
    }

    id v28 = 0;
  }
  id v33 = v28;

  return v33;
}

- (id)selectAllObjectsOfClass:(Class)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_selectAllObjectsOfClass_where_bindings_limit_, a3, 0);
}

- (id)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_selectAllObjectsOfClass_where_bindings_limit_, a3, a4);
}

- (void)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v22 = objc_msgSend_classForHandle_(CKObjCClass, v20, (uint64_t)a3, v21);
  id v25 = objc_msgSend__tableNameForClass_(self, v23, (uint64_t)a3, v24);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_18B0831E8;
  v29[3] = &unk_1E5462F78;
  v29[4] = self;
  id v30 = v22;
  Class v32 = a3;
  id v26 = v18;
  id v31 = v26;
  id v27 = v22;
  objc_msgSend_selectFrom_where_bindings_orderBy_limit_block_(self, v28, (uint64_t)v25, (uint64_t)v14, v15, v16, v17, v29);
}

- (id)selectObjectOfClass:(Class)a3 where:(id)a4 bindings:(id)a5
{
  uint64_t v7 = objc_msgSend_selectAllObjectsOfClass_where_bindings_(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  if (objc_msgSend_count(v7, v8, v9, v10))
  {
    if (objc_msgSend_count(v7, v11, v12, v13) != 1)
    {
      uint64_t v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15, v16);
      uint64_t v23 = objc_msgSend_count(v7, v20, v21, v22);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v24, (uint64_t)a2, (uint64_t)self, @"CKSQLite.m", 1106, @"%lu results matching query", v23);
    }
    id v17 = objc_msgSend_objectAtIndexedSubscript_(v7, v14, 0, v16);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)updateAllObjectsOfClass:(Class)a3 set:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  objc_msgSend__tableNameForClass_(self, v13, (uint64_t)a3, v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_update_set_where_bindings_limit_(self, v15, (uint64_t)v16, (uint64_t)v12, v11, v10, 0);
}

- (id)_boxedPropertyDictionary:(id)a3 forObjCClass:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B0834D8;
  v12[3] = &unk_1E5462FA0;
  v12[4] = self;
  id v13 = v6;
  id v7 = v6;
  id v10 = objc_msgSend_CKMapValues_(a3, v8, (uint64_t)v12, v9);

  return v10;
}

- (id)_boxedValue:(id)a3 forObjcCProperty:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_type(v6, v7, v8, v9);
  if (!v10)
  {
    uint64_t v56 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = v10[1];

  if (v11 != 15) {
    goto LABEL_22;
  }
  uint64_t v15 = objc_msgSend_type(v6, v12, v13, v14);
  uint64_t v19 = objc_msgSend_className(v15, v16, v17, v18);
  if (!objc_msgSend_isEqualToString_(v19, v20, @"NSDate", v21))
  {

    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    id v31 = objc_msgSend_type(v6, v23, v24, v25);
    uint64_t v35 = objc_msgSend_className(v31, v32, v33, v34);
    if (objc_msgSend_isEqualToString_(v35, v36, @"NSError", v37))
    {
      objc_opt_class();
      char v38 = objc_opt_isKindOfClass();

      if (v38)
      {
        id v42 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v43 = objc_opt_class();
        objc_msgSend_unarchivedObjectOfClass_fromData_error_(v42, v44, v43, (uint64_t)v5, 0);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v45 = objc_msgSend_type(v6, v39, v40, v41);
    id v49 = objc_msgSend_className(v45, v46, v47, v48);
    if (objc_msgSend_isEqualToString_(v49, v50, @"NSURL", v51))
    {
      objc_opt_class();
      char v52 = objc_opt_isKindOfClass();

      if (v52)
      {
        objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v53, (uint64_t)v5, v55);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v56 = objc_msgSend_type(v6, v53, v54, v55);
    objc_msgSend_className(v56, v57, v58, v59);
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v60, v61, @"NSUUID", v62)) {
      goto LABEL_20;
    }
    objc_opt_class();
    char v63 = objc_opt_isKindOfClass();

    if (v63)
    {
      id v60 = v5;
      if (objc_msgSend_length(v60, v64, v65, v66) == 16)
      {
        id v67 = objc_alloc(MEMORY[0x1E4F29128]);
        id v5 = v60;
        uint64_t v71 = objc_msgSend_bytes(v5, v68, v69, v70);
        uint64_t v74 = objc_msgSend_initWithUUIDBytes_(v67, v72, v71, v73);

        goto LABEL_24;
      }
      id v5 = 0;
      uint64_t v56 = v60;
LABEL_20:

LABEL_21:
    }
LABEL_22:
    id v30 = v5;
    id v5 = v30;
    goto LABEL_23;
  }
  id v26 = (void *)MEMORY[0x1E4F1C9C8];
  objc_msgSend_doubleValue(v5, v23, v24, v25);
  objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v26, v27, v28, v29);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
  uint64_t v74 = v30;
LABEL_24:

  return v74;
}

- (int)dbUserVersion
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_18B0838D0;
  v6[3] = &unk_1E5462CF8;
  v6[4] = &v7;
  id v3 = (id)objc_msgSend_performDatabaseOperation_(self, a2, (uint64_t)v6, v2);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)schema
{
  return self->_schema;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectClassPrefix
{
  return self->_objectClassPrefix;
}

- (void)setObjectClassPrefix:(id)a3
{
}

- (void)setUserVersion:(int)a3
{
  self->_userVersion = a3;
}

- (int64_t)synchronousMode
{
  return self->_synchronousMode;
}

- (void)setSynchronousMode:(int64_t)a3
{
  self->_synchronousMode = a3;
}

- (BOOL)hasMigrated
{
  return self->_hasMigrated;
}

- (BOOL)shouldVacuum
{
  return self->_shouldVacuum;
}

- (void)setShouldVacuum:(BOOL)a3
{
  self->_shouldVacuum = a3;
}

- (BOOL)traced
{
  return self->_traced;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (CKSQLiteDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (unint64_t)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(unint64_t)a3
{
  self->_unint64_t openCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_objectClassPrefix, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_errorHandlerBlock, 0);
}

@end