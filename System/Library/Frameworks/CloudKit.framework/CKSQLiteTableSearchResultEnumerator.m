@interface CKSQLiteTableSearchResultEnumerator
- (CKSQLiteCompiledStatement)statement;
- (CKSQLiteTableSearchResultEnumerator)initWithTable:(id)a3 statement:(id)a4;
- (NSError)error;
- (id)cksqlcs_appendSQLConstantValueToString:(id)a3;
- (id)currentObject;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)invalidate;
- (void)setStatement:(id)a3;
@end

@implementation CKSQLiteTableSearchResultEnumerator

- (id)cksqlcs_appendSQLConstantValueToString:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_statement(self, v5, v6, v7);
  v11 = objc_msgSend_cksqlcs_appendSQLConstantValueToString_(v8, v9, (uint64_t)v4, v10);

  objc_msgSend_invalidate(self, v12, v13, v14);

  return v11;
}

- (CKSQLiteTableSearchResultEnumerator)initWithTable:(id)a3 statement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CKSQLiteTableSearchResultEnumerator;
  v9 = [(CKSQLiteTableSearchResultEnumerator *)&v26 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_table, a3);
    uint64_t v14 = objc_msgSend_tableGroup(v7, v11, v12, v13);
    uint64_t v18 = objc_msgSend_name(v14, v15, v16, v17);
    groupName = v10->_groupName;
    v10->_groupName = (NSString *)v18;

    uint64_t v23 = objc_msgSend_logicalTableName(v7, v20, v21, v22);
    tableName = v10->_tableName;
    v10->_tableName = (NSString *)v23;

    objc_storeStrong((id *)&v10->_statement, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKSQLiteTableSearchResultEnumerator;
  [(CKSQLiteTableSearchResultEnumerator *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  statement = self->_statement;
  if (statement)
  {
    objc_msgSend_resetAndClearBindings(statement, a2, v2, v3);
    uint64_t v6 = self->_statement;
    self->_statement = 0;

    if (objc_msgSend_logOperations(self->_table, v7, v8, v9))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v10 = (void *)ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        uint64_t v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        int v15 = 138543618;
        uint64_t v16 = v13;
        __int16 v17 = 2048;
        uint64_t v18 = self;
        _os_log_impl(&dword_18AF10000, v11, OS_LOG_TYPE_INFO, "%{public}@(%p): End enumeration", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  table = self->_table;
  self->_table = 0;
}

- (id)currentObject
{
  return self->_entry;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0)
  {
    a3->var0 = 1;
    a3->var1 = &self->_entry;
    a3->var2 = a3->var3;
  }
  return self->_entry != 0;
}

- (id)nextObject
{
  sub_18B01AB0C((uint64_t)self, a2, v2, v3);
  id entry = self->_entry;

  return entry;
}

- (NSError)error
{
  return self->_error;
}

- (CKSQLiteCompiledStatement)statement
{
  return self->_statement;
}

- (void)setStatement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong(&self->_entry, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_table, 0);
}

@end