@interface HMBSQLCachedPreparedStatement
- (HMBSQLCachedPreparedStatement)initWithStatement:(sqlite3_stmt *)a3;
- (sqlite3_stmt)statement;
@end

@implementation HMBSQLCachedPreparedStatement

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (HMBSQLCachedPreparedStatement)initWithStatement:(sqlite3_stmt *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMBSQLCachedPreparedStatement;
  result = [(HMBSQLCachedPreparedStatement *)&v5 init];
  if (result) {
    result->_statement = a3;
  }
  return result;
}

@end