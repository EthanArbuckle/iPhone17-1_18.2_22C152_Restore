@interface SQLiteSchemaMigration
- (BOOL)success;
- (NSError)error;
- (SQLiteSchemaMigration)initWithConnection:(id)a3;
- (void)_executeStatement:(id)a3 canFailMigration:(BOOL)a4 bindings:(id)a5;
- (void)executeOptionalStatement:(id)a3;
- (void)executeOptionalStatement:(id)a3 bindings:(id)a4;
- (void)executeStatement:(id)a3;
- (void)executeStatement:(id)a3 bindings:(id)a4;
@end

@implementation SQLiteSchemaMigration

- (SQLiteSchemaMigration)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteSchemaMigration;
  v6 = [(SQLiteSchemaMigration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_success = 1;
  }

  return v7;
}

- (void)executeOptionalStatement:(id)a3
{
}

- (void)executeOptionalStatement:(id)a3 bindings:(id)a4
{
}

- (void)executeStatement:(id)a3
{
}

- (void)executeStatement:(id)a3 bindings:(id)a4
{
}

- (void)_executeStatement:(id)a3 canFailMigration:(BOOL)a4 bindings:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (self->_success)
  {
    connection = self->_connection;
    id v15 = 0;
    unsigned __int8 v11 = [(SQLiteConnection *)connection executeStatement:v8 error:&v15 bindings:v9];
    id v12 = v15;
    id v13 = v15;
    if (v6)
    {
      if (self->_success) {
        BOOL v14 = v11;
      }
      else {
        BOOL v14 = 0;
      }
      self->_success = v14;
    }
    if ((v11 & 1) == 0) {
      objc_storeStrong((id *)&self->_error, v12);
    }
  }
  else
  {
    id v13 = 0;
  }
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end