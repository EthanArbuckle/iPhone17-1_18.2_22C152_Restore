@interface CKSQLiteCompiledStatementCacheKey
- (BOOL)isEqual:(id)a3;
- (CKSQLiteCompiledStatementCacheKey)initWithTable:(id)a3 label:(id *)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation CKSQLiteCompiledStatementCacheKey

- (CKSQLiteCompiledStatementCacheKey)initWithTable:(id)a3 label:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKSQLiteCompiledStatementCacheKey;
  v10 = [(CKSQLiteCompiledStatementCacheKey *)&v19 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_db(v6, v7, v8, v9);
    db = v10->_db;
    v10->_db = (CKSQLiteDatabase *)v11;

    uint64_t v16 = objc_msgSend_dbTableName(v6, v13, v14, v15);
    dbTableName = v10->_dbTableName;
    v10->_dbTableName = (NSString *)v16;

    v10->_statementLabel = a4;
  }

  return v10;
}

- (id)description
{
  return sub_18B01A394((uint64_t *)self->_statementLabel, a2);
}

- (unint64_t)hash
{
  return (unint64_t)self->_statementLabel;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  v7 = v4;
  if (self->_db == (CKSQLiteDatabase *)v4[1]
    && self->_statementLabel == (const $BA24BB89C84EB3F65F0C807C16FE2DC6 *)v4[3])
  {
    char isEqualToString = objc_msgSend_isEqualToString_(self->_dbTableName, v5, v4[2], v6);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbTableName, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end