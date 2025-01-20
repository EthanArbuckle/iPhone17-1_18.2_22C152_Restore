@interface HDSQLiteDatabaseSchema
- (BOOL)isEqual:(id)a3;
- (NSDictionary)tables;
- (id)description;
- (unint64_t)hash;
- (void)setTables:(id)a3;
@end

@implementation HDSQLiteDatabaseSchema

- (unint64_t)hash
{
  return [(NSDictionary *)self->_tables hash];
}

- (BOOL)isEqual:(id)a3
{
  tables = self->_tables;
  v4 = (NSDictionary *)*((void *)a3 + 1);
  if (tables == v4) {
    return 1;
  }
  if (v4) {
    return -[NSDictionary isEqual:](tables, "isEqual:");
  }
  return 0;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteDatabaseSchema;
  v4 = [(HDSQLiteDatabaseSchema *)&v9 description];
  v5 = [(NSDictionary *)self->_tables allValues];
  v6 = [v5 componentsJoinedByString:@"\n"];
  v7 = [v3 stringWithFormat:@"<%@: \n%@\n>", v4, v6];

  return v7;
}

- (NSDictionary)tables
{
  return self->_tables;
}

- (void)setTables:(id)a3
{
}

- (void).cxx_destruct
{
}

@end