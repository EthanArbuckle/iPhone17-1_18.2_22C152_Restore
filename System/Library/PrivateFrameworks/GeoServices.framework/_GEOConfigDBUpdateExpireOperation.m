@interface _GEOConfigDBUpdateExpireOperation
- (BOOL)performOperation;
- (id)init:(id)a3 expire:(id)a4;
@end

@implementation _GEOConfigDBUpdateExpireOperation

- (id)init:(id)a3 expire:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOConfigDBUpdateExpireOperation;
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
  db = self->_db;
  v4 = [(GEOConfigExpiringKey *)self->_expire keyPath];
  v5 = [(GEOConfigExpiringKey *)self->_expire expireTime];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v7 = (uint64_t)v6;
  id v8 = [(GEOConfigExpiringKey *)self->_expire expireOSVersion];
  v9 = db;
  id v10 = v4;
  id v11 = v8;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __SetExpire_block_invoke;
  v16[3] = &unk_1E53D7DE0;
  objc_super v12 = v9;
  v17 = v12;
  id v13 = v10;
  id v18 = v13;
  v20 = v22;
  uint64_t v21 = v7;
  id v14 = v11;
  id v19 = v14;
  LOBYTE(v10) = [(GEOSQLiteDB *)v12 executeStatement:@"SetExpire" statementBlock:v16];

  _Block_object_dispose(v22, 8);
  return (char)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expire, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end