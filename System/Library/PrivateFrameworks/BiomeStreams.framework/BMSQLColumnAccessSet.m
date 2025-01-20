@interface BMSQLColumnAccessSet
- (BMSQLColumnAccessSet)initWithTable:(id)a3 columns:(id)a4;
- (BOOL)checkTable:(id)a3 column:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)columns;
- (NSString)table;
- (id)description;
@end

@implementation BMSQLColumnAccessSet

- (BMSQLColumnAccessSet)initWithTable:(id)a3 columns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSQLColumnAccessSet;
  v8 = [(BMSQLColumnAccessSet *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    table = v8->_table;
    v8->_table = (NSString *)v9;

    objc_storeStrong((id *)&v8->_columns, a4);
  }

  return v8;
}

- (BOOL)checkTable:(id)a3 column:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 0;
  if (a3 && v6)
  {
    if ([(NSString *)self->_table isEqualToString:a3]) {
      BOOL v8 = [(NSSet *)self->_columns containsObject:v7];
    }
    else {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p> table: %@, columns: %@", objc_opt_class(), self, self->_table, self->_columns];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMSQLColumnAccessSet *)self table];
    id v7 = [v5 table];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = [(BMSQLColumnAccessSet *)self columns];
      uint64_t v9 = [v5 columns];
      char v10 = [v8 isEqualToSet:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)table
{
  return self->_table;
}

- (NSSet)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_table, 0);
}

@end