@interface DBMigrationResult
- (DBMigrationResult)initWithErrorCode:(int64_t)a3 andDBVersion:(int64_t)a4;
- (int64_t)dbVersion;
- (int64_t)errorCode;
- (void)setDbVersion:(int64_t)a3;
- (void)setErrorCode:(int64_t)a3;
@end

@implementation DBMigrationResult

- (DBMigrationResult)initWithErrorCode:(int64_t)a3 andDBVersion:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DBMigrationResult;
  result = [(DBMigrationResult *)&v7 init];
  if (result)
  {
    result->_errorCode = a3;
    result->_dbVersion = a4;
  }
  return result;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)dbVersion
{
  return self->_dbVersion;
}

- (void)setDbVersion:(int64_t)a3
{
  self->_dbVersion = a3;
}

@end