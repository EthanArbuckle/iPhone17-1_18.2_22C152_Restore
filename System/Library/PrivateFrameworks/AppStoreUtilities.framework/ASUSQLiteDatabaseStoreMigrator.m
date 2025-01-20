@interface ASUSQLiteDatabaseStoreMigrator
- (ASUSQLiteConnection)connection;
- (ASUSQLiteDatabaseStoreMigrator)initWithConnection:(id)a3 tableNames:(id)a4;
- (BOOL)success;
- (void)_executeQuery:(char)a3 canFailMigration:(void *)a4 withResults:;
- (void)_executeStatement:(int)a3 canFailMigration:(void *)a4 bindings:;
- (void)executeOptionalQuery:(id)a3 withResults:(id)a4;
- (void)executeOptionalStatement:(id)a3;
- (void)executeOptionalStatement:(id)a3 bindings:(id)a4;
- (void)executeQuery:(id)a3 withResults:(id)a4;
- (void)executeStatement:(id)a3;
- (void)executeStatement:(id)a3 bindings:(id)a4;
@end

@implementation ASUSQLiteDatabaseStoreMigrator

- (ASUSQLiteDatabaseStoreMigrator)initWithConnection:(id)a3 tableNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASUSQLiteDatabaseStoreMigrator;
  v9 = [(ASUSQLiteDatabaseStoreMigrator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    uint64_t v11 = [v8 copy];
    tableNames = v10->_tableNames;
    v10->_tableNames = (NSArray *)v11;

    v10->_success = 1;
  }

  return v10;
}

- (ASUSQLiteConnection)connection
{
  return self->_connection;
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
      v9 = *(void **)(a1 + 8);
      id v12 = 0;
      char v10 = [v9 executeStatement:v7 error:&v12 bindings:v8];
      id v11 = v12;
      if ((v10 & 1) == 0 && a3) {
        *(unsigned char *)(a1 + 24) = 0;
      }
    }
    else
    {
      id v11 = 0;
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

- (void)executeOptionalQuery:(id)a3 withResults:(id)a4
{
}

- (void)_executeQuery:(char)a3 canFailMigration:(void *)a4 withResults:
{
  id v7 = a2;
  id v8 = a4;
  v9 = v8;
  if (a1 && *(unsigned char *)(a1 + 24))
  {
    char v10 = *(void **)(a1 + 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __77__ASUSQLiteDatabaseStoreMigrator__executeQuery_canFailMigration_withResults___block_invoke;
    v11[3] = &unk_26522FB30;
    char v13 = a3;
    v11[4] = a1;
    id v12 = v8;
    [v10 executeQuery:v7 withResults:v11];
  }
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
}

uint64_t __77__ASUSQLiteDatabaseStoreMigrator__executeQuery_canFailMigration_withResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 && *(unsigned char *)(a1 + 48)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end