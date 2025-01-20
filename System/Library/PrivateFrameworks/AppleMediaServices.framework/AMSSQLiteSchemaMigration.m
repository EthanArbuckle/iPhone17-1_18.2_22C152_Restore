@interface AMSSQLiteSchemaMigration
- (AMSSQLiteSchemaMigration)initWithConnection:(id)a3;
- (BOOL)_executeStatement:(id)a3 canFailMigration:(BOOL)a4 bindings:(id)a5 error:(id *)a6;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)success;
- (NSError)error;
- (void)executeOptionalStatement:(id)a3;
- (void)executeOptionalStatement:(id)a3 bindings:(id)a4;
- (void)executeStatement:(id)a3;
- (void)executeStatement:(id)a3 bindings:(id)a4;
@end

@implementation AMSSQLiteSchemaMigration

- (AMSSQLiteSchemaMigration)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteSchemaMigration;
  v6 = [(AMSSQLiteSchemaMigration *)&v9 init];
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

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return [(AMSSQLiteSchemaMigration *)self _executeStatement:a3 canFailMigration:1 bindings:0 error:0];
}

- (void)executeStatement:(id)a3 bindings:(id)a4
{
}

- (BOOL)_executeStatement:(id)a3 canFailMigration:(BOOL)a4 bindings:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (self->_success)
  {
    connection = self->_connection;
    id v19 = 0;
    BOOL v13 = [(AMSSQLiteConnection *)connection executeStatement:v10 error:&v19 bindings:v11];
    id v14 = v19;
    id v15 = v19;
    if (v8)
    {
      BOOL v16 = self->_success && v13;
      self->_success = v16;
    }
    if (v13)
    {
      BOOL v17 = 1;
    }
    else
    {
      objc_storeStrong((id *)&self->_error, v14);
      if (a6)
      {
        id v15 = v15;
        BOOL v17 = 0;
        *a6 = v15;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
  }
  else
  {
    BOOL v17 = 0;
    id v15 = 0;
  }

  return v17;
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