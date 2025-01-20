@interface CCDatabaseEnumerationResult
- (CCDatabaseCommand)command;
- (CCDatabaseEnumerationResult)init;
- (CCDatabaseEnumerationResult)initWithStatement:(id)a3 database:(id)a4 command:(id)a5 error:(id)a6;
- (CCSQLiteDatabase)database;
- (CCSQLitePreparedStatement)statement;
- (NSArray)peekedNext;
- (NSError)error;
- (id)_next;
- (id)next;
- (id)peek;
- (int)column_count;
- (void)setError:(id)a3;
@end

@implementation CCDatabaseEnumerationResult

- (id)_next
{
  statement = self->_statement;
  if (!statement) {
    goto LABEL_12;
  }
  int v4 = sqlite3_step([(CCSQLitePreparedStatement *)statement stmt]);
  if (v4 == 101)
  {
    error = self->_statement;
    self->_statement = 0;
LABEL_11:

LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  if (v4 != 100)
  {
    v9 = (NSError *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.CascadeSets.CCDatabase" code:2 userInfo:0];
    error = self->_error;
    self->_error = v9;
    goto LABEL_11;
  }
  if (self->_column_count < 1)
  {
    v5 = [MEMORY[0x263EFF980] array];
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_column_count];
    if (self->_column_count >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        v7 = _columnValueFromSQLiteStatement([(CCSQLitePreparedStatement *)self->_statement stmt], v6);
        [v5 addObject:v7];

        uint64_t v6 = (v6 + 1);
      }
      while ((int)v6 < self->_column_count);
    }
  }
LABEL_13:

  return v5;
}

- (id)next
{
  if (self->_error)
  {
    v2 = 0;
  }
  else
  {
    peekedNext = self->_peekedNext;
    if (peekedNext)
    {
      v2 = peekedNext;
      v5 = self->_peekedNext;
      self->_peekedNext = 0;
    }
    else
    {
      v2 = [(CCDatabaseEnumerationResult *)self _next];
    }
  }

  return v2;
}

- (NSError)error
{
  return self->_error;
}

- (CCDatabaseEnumerationResult)initWithStatement:(id)a3 database:(id)a4 command:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CCDatabaseEnumerationResult;
  v15 = [(CCDatabaseEnumerationResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a4);
    objc_storeStrong((id *)&v16->_command, a5);
    objc_storeStrong((id *)&v16->_statement, a3);
    v16->_column_count = sqlite3_column_count((sqlite3_stmt *)[v11 stmt]);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_statement, 0);

  objc_storeStrong((id *)&self->_peekedNext, 0);
}

- (CCDatabaseEnumerationResult)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (id)peek
{
  peekedNext = self->_peekedNext;
  if (!peekedNext)
  {
    int v4 = (void *)MEMORY[0x24C5B1100]();
    v5 = [(CCDatabaseEnumerationResult *)self _next];
    uint64_t v6 = self->_peekedNext;
    self->_peekedNext = v5;

    peekedNext = self->_peekedNext;
  }
  v7 = peekedNext;

  return v7;
}

- (NSArray)peekedNext
{
  return self->_peekedNext;
}

- (CCSQLitePreparedStatement)statement
{
  return self->_statement;
}

- (int)column_count
{
  return self->_column_count;
}

- (void)setError:(id)a3
{
}

- (CCSQLiteDatabase)database
{
  return self->_database;
}

- (CCDatabaseCommand)command
{
  return self->_command;
}

@end