@interface AMSSQLitePreparedStatement
- (AMSSQLitePreparedStatement)initWithConnection:(const void *)a3 SQL:(id)a4;
- (NSString)SQL;
- (const)connectionPointer;
@end

@implementation AMSSQLitePreparedStatement

- (void).cxx_destruct
{
}

- (AMSSQLitePreparedStatement)initWithConnection:(const void *)a3 SQL:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSQLitePreparedStatement;
  v7 = [(AMSSQLitePreparedStatement *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_connectionPointer = a3;
    uint64_t v9 = [v6 copy];
    SQL = v8->_SQL;
    v8->_SQL = (NSString *)v9;
  }
  return v8;
}

- (const)connectionPointer
{
  return self->_connectionPointer;
}

- (NSString)SQL
{
  return self->_SQL;
}

@end