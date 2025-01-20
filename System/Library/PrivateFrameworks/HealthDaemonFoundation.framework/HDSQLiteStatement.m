@interface HDSQLiteStatement
- (BOOL)enumerateStatementWithError:(id *)a3 bindingHandler:(id)a4 block:(id)a5;
- (BOOL)performStatementWithError:(id *)a3 bindingHandler:(id)a4;
- (HDSQLiteDatabase)database;
- (HDSQLiteStatement)initWithSQL:(id)a3 database:(id)a4;
- (id)description;
@end

@implementation HDSQLiteStatement

- (HDSQLiteDatabase)database
{
  return self->_database;
}

- (BOOL)enumerateStatementWithError:(id *)a3 bindingHandler:(id)a4 block:(id)a5
{
  return [(HDSQLiteDatabase *)self->_database executeSQL:self->_sql error:a3 bindingHandler:a4 enumerationHandler:a5];
}

- (HDSQLiteStatement)initWithSQL:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSQLiteStatement;
  v8 = [(HDSQLiteStatement *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_database, a4);
    uint64_t v10 = [v6 copy];
    sql = v9->_sql;
    v9->_sql = (NSString *)v10;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sql, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (BOOL)performStatementWithError:(id *)a3 bindingHandler:(id)a4
{
  return [(HDSQLiteStatement *)self enumerateStatementWithError:a3 bindingHandler:a4 block:0];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p \"%@\">", objc_opt_class(), self, self->_sql];
}

@end