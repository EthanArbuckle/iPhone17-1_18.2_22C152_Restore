@interface _EDThreadPersistence_StatementCache
- (EDPersistenceDatabaseConnection)connection;
- (NSMutableDictionary)preparedStatements;
- (_EDThreadPersistence_StatementCache)initWithConnection:(id)a3;
- (id)preparedStatementForQueryString:(id)a3;
@end

@implementation _EDThreadPersistence_StatementCache

- (_EDThreadPersistence_StatementCache)initWithConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EDThreadPersistence_StatementCache;
  v6 = [(_EDThreadPersistence_StatementCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    preparedStatements = v7->_preparedStatements;
    v7->_preparedStatements = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)preparedStatementForQueryString:(id)a3
{
  id v4 = a3;
  id v5 = [(_EDThreadPersistence_StatementCache *)self preparedStatements];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [(_EDThreadPersistence_StatementCache *)self connection];
    v6 = [v7 preparedStatementForQueryString:v4];

    if (!v6) {
      __assert_rtn("-[_EDThreadPersistence_StatementCache preparedStatementForQueryString:]", "EDThreadPersistence_ThreadMessages.m", 1244, "statement");
    }
    uint64_t v8 = [(_EDThreadPersistence_StatementCache *)self preparedStatements];
    [v8 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (NSMutableDictionary)preparedStatements
{
  return self->_preparedStatements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedStatements, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end