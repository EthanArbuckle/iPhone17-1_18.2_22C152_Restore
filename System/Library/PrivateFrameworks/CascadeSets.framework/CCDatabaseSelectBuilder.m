@interface CCDatabaseSelectBuilder
- (CCDatabaseSelectBuilder)initWithTableName:(id)a3;
- (id)build;
- (void)setColumns:(id)a3;
- (void)setColumns:(id)a3 withTablePrefixes:(id)a4;
- (void)setCommandCriterion:(id)a3;
- (void)setCommandOrder:(id)a3;
- (void)setCount:(BOOL)a3;
- (void)setJoinWithType:(int64_t)a3 tables:(id)a4;
- (void)setLimit:(id)a3;
- (void)setOffset:(id)a3;
@end

@implementation CCDatabaseSelectBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_order, 0);

  objc_storeStrong((id *)&self->_join, 0);
}

- (void)setColumns:(id)a3
{
  self->_columns = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (CCDatabaseSelectBuilder)initWithTableName:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CCDatabaseSelectBuilder;
  v3 = [(CCDatabaseCommandBuilder *)&v10 initWithTableName:a3];
  v4 = v3;
  if (v3)
  {
    join = v3->_join;
    v3->_join = 0;

    order = v4->_order;
    v4->_order = 0;

    v4->_count = 0;
    limit = v4->_limit;
    v4->_limit = 0;

    offset = v4->_offset;
    v4->_offset = 0;
  }
  return v4;
}

- (void)setCommandCriterion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CCDatabaseSelectBuilder;
  [(CCDatabaseCommandBuilder *)&v3 setCommandCriterion:a3];
}

- (void)setJoinWithType:(int64_t)a3 tables:(id)a4
{
  id v6 = a4;
  v7 = [[CCSQLCommandJoin alloc] initWithJoinType:a3 joinTables:v6];

  join = self->_join;
  self->_join = v7;
}

- (void)setCount:(BOOL)a3
{
  self->_count = a3;
}

- (void)setColumns:(id)a3 withTablePrefixes:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v12, "count"));
  if ([v12 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v12 objectAtIndex:v8];
      if ([v6 count] <= v8)
      {
        objc_super v10 = 0;
      }
      else
      {
        objc_super v10 = [v6 objectAtIndex:v8];
      }
      v11 = +[CCSQLCommandGenerator prefixColumnName:v9 withTableName:v10];
      [v7 addObject:v11];

      ++v8;
    }
    while (v8 < [v12 count]);
  }
  [(CCDatabaseSelectBuilder *)self setColumns:v7];
}

- (id)build
{
  objc_super v3 = [(CCDatabaseCommandBuilder *)self tableName];
  columns = self->_columns;
  BOOL count = self->_count;
  join = self->_join;
  v7 = [(CCDatabaseCommandBuilder *)self criterion];
  unint64_t v8 = +[CCSQLCommandGenerator selectFromTableWithName:v3 columns:columns count:count join:join criterion:v7 order:self->_order limit:self->_limit offset:self->_offset];

  return v8;
}

- (void)setCommandOrder:(id)a3
{
  self->_order = (CCSQLCommandOrder *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setLimit:(id)a3
{
}

- (void)setOffset:(id)a3
{
}

@end