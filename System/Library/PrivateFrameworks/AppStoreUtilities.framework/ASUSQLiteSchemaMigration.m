@interface ASUSQLiteSchemaMigration
- (ASUSQLiteSchemaMigration)initWithConnection:(id)a3;
- (BOOL)success;
- (NSError)error;
- (void)_executeStatement:(int)a3 canFailMigration:(void *)a4 bindings:;
- (void)executeOptionalStatement:(id)a3;
- (void)executeOptionalStatement:(id)a3 bindings:(id)a4;
- (void)executeStatement:(id)a3;
- (void)executeStatement:(id)a3 bindings:(id)a4;
@end

@implementation ASUSQLiteSchemaMigration

- (ASUSQLiteSchemaMigration)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteSchemaMigration;
  v6 = [(ASUSQLiteSchemaMigration *)&v9 init];
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

- (void)_executeStatement:(int)a3 canFailMigration:(void *)a4 bindings:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      objc_super v9 = *(void **)(a1 + 8);
      id v14 = 0;
      char v10 = [v9 executeStatement:v7 error:&v14 bindings:v8];
      id v11 = v14;
      id v12 = v14;
      if (a3)
      {
        if (*(unsigned char *)(a1 + 24)) {
          char v13 = v10;
        }
        else {
          char v13 = 0;
        }
        *(unsigned char *)(a1 + 24) = v13;
      }
      if ((v10 & 1) == 0) {
        objc_storeStrong((id *)(a1 + 16), v11);
      }
    }
    else
    {
      id v12 = 0;
    }
  }
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