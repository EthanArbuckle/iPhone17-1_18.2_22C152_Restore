@interface _EDThreadPersistence_ThreadScope
- (BOOL)_dropTemporaryView;
- (BOOL)_ensureTempScopeView;
- (BOOL)createMessagesWithThreadObjectID:(id)a3 wrappedMessages:(id)a4 threadMessages:(id *)a5;
- (EDMessagePersistence)messagePersistence;
- (EFSQLExpressable)threadScopeExpression;
- (_EDThreadPersistence_SQLHelper)sqlHelper;
- (_EDThreadPersistence_ThreadScope)initWithCache:(id)a3 messagePersistence:(id)a4 threadScopeDatabaseID:(int64_t)a5 threadScopeExpression:(id)a6;
- (int64_t)threadScopeDatabaseID;
- (void)_dropTemporaryView;
- (void)_ensureTempScopeView;
@end

@implementation _EDThreadPersistence_ThreadScope

- (_EDThreadPersistence_ThreadScope)initWithCache:(id)a3 messagePersistence:(id)a4 threadScopeDatabaseID:(int64_t)a5 threadScopeExpression:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_EDThreadPersistence_ThreadScope;
  v13 = [(_EDThreadPersistence_ThreadScope *)&v17 init];
  if (v13)
  {
    v14 = [[_EDThreadPersistence_SQLHelper alloc] initWithCache:v10];
    sqlHelper = v13->_sqlHelper;
    v13->_sqlHelper = v14;

    objc_storeStrong((id *)&v13->_messagePersistence, a4);
    v13->_threadScopeDatabaseID = a5;
    objc_storeStrong((id *)&v13->_threadScopeExpression, a6);
  }

  return v13;
}

- (BOOL)createMessagesWithThreadObjectID:(id)a3 wrappedMessages:(id)a4 threadMessages:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(_EDThreadPersistence_ThreadScope *)self _ensureTempScopeView];
  char v11 = !v10;
  if (!a5) {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    id v12 = [_EDThreadPersistence_ThreadMessages alloc];
    v13 = [(_EDThreadPersistence_ThreadScope *)self sqlHelper];
    v14 = [(_EDThreadPersistence_ThreadScope *)self messagePersistence];
    *a5 = [(_EDThreadPersistence_ThreadMessages *)v12 initWithSQLHelper:v13 messagePersistence:v14 threadScopeDatabaseID:[(_EDThreadPersistence_ThreadScope *)self threadScopeDatabaseID] threadObjectID:v8 wrappedMessages:v9];
  }
  return v10;
}

- (BOOL)_ensureTempScopeView
{
  char v2 = 1;
  if (!self->_didCreateTempScopeView)
  {
    self->_didCreateTempScopeView = 1;
    v4 = (void *)MEMORY[0x1E0190280]();
    if ([(_EDThreadPersistence_ThreadScope *)self _dropTemporaryView])
    {
      v5 = NSString;
      v6 = [(_EDThreadPersistence_ThreadScope *)self threadScopeExpression];
      v7 = objc_msgSend(v6, "ef_SQLExpression");
      objc_msgSend(v5, "stringWithFormat:", @"CREATE TEMP VIEW temp_thread_scope_message AS SELECT * FROM messages WHERE %@;",
      id v8 = v7);

      id v9 = [(_EDThreadPersistence_ThreadScope *)self sqlHelper];
      BOOL v10 = [v9 connection];
      char v2 = [v10 executeStatementString:v8 errorMessage:@"CREATE TEMP VIEW"];

      if ((v2 & 1) == 0)
      {
        char v11 = +[EDThreadPersistence log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[_EDThreadPersistence_ThreadScope _ensureTempScopeView]();
        }
      }
    }
    else
    {
      char v2 = 0;
    }
  }
  return v2;
}

- (BOOL)_dropTemporaryView
{
  char v2 = [(_EDThreadPersistence_ThreadScope *)self sqlHelper];
  v3 = [v2 connection];
  char v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"DROP VIEW IF EXISTS temp_thread_scope_message;",
         @"DROP TEMP VIEW");

  if ((v4 & 1) == 0)
  {
    v5 = +[EDThreadPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_EDThreadPersistence_ThreadScope _dropTemporaryView]();
    }
  }
  return v4;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (int64_t)threadScopeDatabaseID
{
  return self->_threadScopeDatabaseID;
}

- (EFSQLExpressable)threadScopeExpression
{
  return self->_threadScopeExpression;
}

- (_EDThreadPersistence_SQLHelper)sqlHelper
{
  return self->_sqlHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqlHelper, 0);
  objc_storeStrong((id *)&self->_threadScopeExpression, 0);

  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

- (void)_ensureTempScopeView
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1DB39C000, v0, v1, "Failed to create temp_thread_scope_message temp view", v2, v3, v4, v5, v6);
}

- (void)_dropTemporaryView
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1DB39C000, v0, v1, "Failed to drop temp_thread_scope_message temp view", v2, v3, v4, v5, v6);
}

@end