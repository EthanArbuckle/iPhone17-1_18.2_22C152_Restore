@interface _GEOConfigDBClearExpireOperation
- (BOOL)performOperation;
- (id)init:(id)a3 keyPath:(id)a4;
@end

@implementation _GEOConfigDBClearExpireOperation

- (id)init:(id)a3 keyPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOConfigDBClearExpireOperation;
  v9 = [(_GEOConfigDBOperationBase *)&v12 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_db, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (BOOL)performOperation
{
  keyPath = self->_keyPath;
  v3 = self->_db;
  v4 = keyPath;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __ClearExpireForKey_block_invoke;
  v9[3] = &unk_1E53D7E08;
  v5 = v3;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  objc_super v12 = v13;
  BOOL v7 = [(GEOSQLiteDB *)v5 executeStatement:@"ClearExpireForKey" statementBlock:v9];

  _Block_object_dispose(v13, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end