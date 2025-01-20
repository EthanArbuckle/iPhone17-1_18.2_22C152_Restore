@interface APDatabaseCursor
- (APDatabaseCursor)initWithStatement:(sqlite3_stmt *)a3 lock:(id)a4;
- (APUnfairLock)lock;
- (int)lastStepResult;
- (sqlite3_stmt)statement;
- (void)setLastStepResult:(int)a3;
- (void)setLock:(id)a3;
- (void)setStatement:(sqlite3_stmt *)a3;
@end

@implementation APDatabaseCursor

- (APDatabaseCursor)initWithStatement:(sqlite3_stmt *)a3 lock:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APDatabaseCursor;
  v8 = [(APDatabaseCursor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_statement = a3;
    objc_storeStrong((id *)&v8->_lock, a4);
  }

  return v9;
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (int)lastStepResult
{
  return self->_lastStepResult;
}

- (void)setLastStepResult:(int)a3
{
  self->_lastStepResult = a3;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end