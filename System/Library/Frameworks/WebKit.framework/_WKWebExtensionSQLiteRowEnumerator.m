@interface _WKWebExtensionSQLiteRowEnumerator
- (_WKWebExtensionSQLiteRowEnumerator)initWithResultsOfStatement:(id)a3;
- (_WKWebExtensionSQLiteStatement)statement;
- (id)nextObject;
- (int)lastResultCode;
@end

@implementation _WKWebExtensionSQLiteRowEnumerator

- (_WKWebExtensionSQLiteRowEnumerator)initWithResultsOfStatement:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionSQLiteRowEnumerator;
  v6 = [(_WKWebExtensionSQLiteRowEnumerator *)&v11 init];
  if (v6)
  {
    v7 = [v5 database];
    v8 = [v7 queue];
    dispatch_assert_queue_V2(v8);

    objc_storeStrong((id *)&v6->_statement, a3);
    v9 = v6;
  }

  return v6;
}

- (id)nextObject
{
  v3 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  int v5 = sqlite3_step([(_WKWebExtensionSQLiteStatement *)self->_statement handle]);
  v6 = 0;
  self->_lastResultCode = v5;
  if (v5)
  {
    if (v5 == 100)
    {
      row = self->_row;
      if (!row)
      {
        v9 = [[_WKWebExtensionSQLiteRow alloc] initWithCurrentRowOfEnumerator:self];
        v10 = self->_row;
        self->_row = v9;

        row = self->_row;
      }
      v6 = row;
    }
    else if (v5 != 101)
    {
      v7 = [(_WKWebExtensionSQLiteStatement *)self->_statement database];
      objc_msgSend(v7, "reportErrorWithCode:statement:error:", self->_lastResultCode, -[_WKWebExtensionSQLiteStatement handle](self->_statement, "handle"), 0);

      v6 = 0;
    }
  }

  return v6;
}

- (_WKWebExtensionSQLiteStatement)statement
{
  return self->_statement;
}

- (int)lastResultCode
{
  return self->_lastResultCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row, 0);

  objc_storeStrong((id *)&self->_statement, 0);
}

@end