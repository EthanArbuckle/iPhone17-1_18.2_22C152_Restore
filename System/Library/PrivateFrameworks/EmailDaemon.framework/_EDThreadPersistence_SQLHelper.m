@interface _EDThreadPersistence_SQLHelper
- (BOOL)executeSQL:(id)a3 errorHandler:(id)a4;
- (BOOL)executeSQL:(id)a3 indexBindings:(id)a4 errorHandler:(id)a5;
- (BOOL)executeSelectSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5 rowHandler:(id)a6;
- (EDPersistenceDatabaseConnection)connection;
- (_EDThreadPersistence_SQLHelper)initWithCache:(id)a3;
- (_EDThreadPersistence_StatementCache)cache;
- (int64_t)executeUpdateSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5;
- (int64_t)executeUpsertSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5;
@end

@implementation _EDThreadPersistence_SQLHelper

- (_EDThreadPersistence_SQLHelper)initWithCache:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EDThreadPersistence_SQLHelper;
  v6 = [(_EDThreadPersistence_SQLHelper *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 connection];
    connection = v6->_connection;
    v6->_connection = (EDPersistenceDatabaseConnection *)v7;

    objc_storeStrong((id *)&v6->_cache, a3);
  }

  return v6;
}

- (int64_t)executeUpdateSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *))a4;
  objc_super v10 = (void (**)(id, id))a5;
  v11 = [(_EDThreadPersistence_SQLHelper *)self cache];
  v12 = [v11 preparedStatementForQueryString:v8];

  if (!v12) {
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeUpdateSQL:bindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1323, "statement");
  }
  uint64_t v19 = 0;
  v13 = createBindingsDictionary();
  v9[2](v9, v13);
  id v18 = 0;
  char v14 = [v12 executeWithNamedBindings:v13 rowsChanged:&v19 error:&v18];
  id v15 = v18;
  if (v14)
  {
    if (v19) {
      int64_t v16 = 2;
    }
    else {
      int64_t v16 = 1;
    }
  }
  else
  {
    v10[2](v10, v15);
    int64_t v16 = 0;
  }

  return v16;
}

- (int64_t)executeUpsertSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *))a4;
  objc_super v10 = (void (**)(id, id))a5;
  v11 = [(_EDThreadPersistence_SQLHelper *)self cache];
  v12 = [v11 preparedStatementForQueryString:v8];

  if (!v12) {
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeUpsertSQL:bindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1341, "statement");
  }
  v13 = [(_EDThreadPersistence_SQLHelper *)self connection];
  [v13 clearLastInsertedDatabaseID];

  char v14 = [(_EDThreadPersistence_SQLHelper *)self connection];
  if ([v14 lastInsertedDatabaseID]) {
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeUpsertSQL:bindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1346, "self.connection.lastInsertedDatabaseID == 0");
  }

  uint64_t v22 = 0;
  id v15 = createBindingsDictionary();
  v9[2](v9, v15);
  id v21 = 0;
  char v16 = [v12 executeWithNamedBindings:v15 rowsChanged:&v22 error:&v21];
  id v17 = v21;
  if (v16)
  {
    id v18 = [(_EDThreadPersistence_SQLHelper *)self connection];
    int64_t v19 = [v18 lastInsertedDatabaseID];
  }
  else
  {
    v10[2](v10, v17);
    int64_t v19 = *MEMORY[0x1E4F5FCC8];
  }

  return v19;
}

- (BOOL)executeSelectSQL:(id)a3 bindings:(id)a4 errorHandler:(id)a5 rowHandler:(id)a6
{
  id v10 = a3;
  v11 = (void (**)(id, void *))a4;
  v12 = (void (**)(id, id))a5;
  id v13 = a6;
  char v14 = [(_EDThreadPersistence_SQLHelper *)self cache];
  id v15 = [v14 preparedStatementForQueryString:v10];

  if (!v15) {
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeSelectSQL:bindings:errorHandler:rowHandler:]", "EDThreadPersistence_ThreadMessages.m", 1363, "statement");
  }
  char v16 = createBindingsDictionary();
  v11[2](v11, v16);
  id v20 = 0;
  char v17 = [v15 executeWithNamedBindings:v16 usingBlock:v13 error:&v20];
  id v18 = v20;
  if ((v17 & 1) == 0) {
    v12[2](v12, v18);
  }

  return v17;
}

- (BOOL)executeSQL:(id)a3 indexBindings:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  v11 = [(_EDThreadPersistence_SQLHelper *)self cache];
  v12 = [v11 preparedStatementForQueryString:v8];

  if (!v12) {
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeSQL:indexBindings:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1378, "statement");
  }
  id v16 = 0;
  char v13 = [v12 executeWithIndexedBindings:v9 usingBlock:&__block_literal_global_465 error:&v16];
  id v14 = v16;
  if ((v13 & 1) == 0) {
    v10[2](v10, v14);
  }

  return v13;
}

- (BOOL)executeSQL:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  id v8 = [(_EDThreadPersistence_SQLHelper *)self cache];
  id v9 = [v8 preparedStatementForQueryString:v6];

  if (!v9) {
    __assert_rtn("-[_EDThreadPersistence_SQLHelper executeSQL:errorHandler:]", "EDThreadPersistence_ThreadMessages.m", 1389, "statement");
  }
  id v13 = 0;
  char v10 = [v9 executeUsingBlock:&__block_literal_global_467 error:&v13];
  id v11 = v13;
  if ((v10 & 1) == 0) {
    v7[2](v7, v11);
  }

  return v10;
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (_EDThreadPersistence_StatementCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end