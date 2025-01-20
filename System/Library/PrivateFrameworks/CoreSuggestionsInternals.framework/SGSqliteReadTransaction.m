@interface SGSqliteReadTransaction
- (SGSqliteDatabase)db;
- (SGSqliteReadTransaction)initWithHandle:(id)a3;
@end

@implementation SGSqliteReadTransaction

- (void).cxx_destruct
{
}

- (SGSqliteDatabase)db
{
  return self->_db;
}

- (SGSqliteReadTransaction)initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGSqliteReadTransaction;
  v6 = [(SGSqliteReadTransaction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_db, a3);
  }

  return v7;
}

@end