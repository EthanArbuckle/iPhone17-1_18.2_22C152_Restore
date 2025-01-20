@interface SQLitePreparedStatement
- (NSString)SQL;
- (SQLitePreparedStatement)initWithConnection:(const void *)a3 SQL:(id)a4;
- (const)connectionPointer;
@end

@implementation SQLitePreparedStatement

- (SQLitePreparedStatement)initWithConnection:(const void *)a3 SQL:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SQLitePreparedStatement;
  v7 = [(SQLitePreparedStatement *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_connectionPointer = a3;
    v9 = (NSString *)[v6 copy];
    SQL = v8->_SQL;
    v8->_SQL = v9;
  }
  return v8;
}

- (void).cxx_destruct
{
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