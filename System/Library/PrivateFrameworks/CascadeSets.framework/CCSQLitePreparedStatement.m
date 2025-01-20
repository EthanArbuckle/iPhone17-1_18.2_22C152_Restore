@interface CCSQLitePreparedStatement
- (CCSQLitePreparedStatement)init;
- (CCSQLitePreparedStatement)initWithStmt:(sqlite3_stmt *)a3;
- (sqlite3_stmt)stmt;
- (void)dealloc;
@end

@implementation CCSQLitePreparedStatement

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (CCSQLitePreparedStatement)initWithStmt:(sqlite3_stmt *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCSQLitePreparedStatement;
  result = [(CCSQLitePreparedStatement *)&v5 init];
  if (result) {
    result->_stmt = a3;
  }
  return result;
}

- (void)dealloc
{
  stmt = self->_stmt;
  if (stmt)
  {
    sqlite3_finalize(stmt);
    self->_stmt = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CCSQLitePreparedStatement;
  [(CCSQLitePreparedStatement *)&v4 dealloc];
}

- (CCSQLitePreparedStatement)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

@end