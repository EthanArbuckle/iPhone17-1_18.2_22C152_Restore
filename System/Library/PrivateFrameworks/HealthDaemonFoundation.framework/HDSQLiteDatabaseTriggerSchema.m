@interface HDSQLiteDatabaseTriggerSchema
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)sql;
- (NSString)tableName;
- (id)description;
- (unint64_t)hash;
- (void)setName:(id)a3;
- (void)setSql:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation HDSQLiteDatabaseTriggerSchema

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tableName hash];
  return [(NSString *)self->_sql hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  tableName = self->_tableName;
  v6 = (NSString *)v4[2];
  if (tableName != v6 && (!v6 || !-[NSString isEqual:](tableName, "isEqual:"))) {
    goto LABEL_7;
  }
  sql = self->_sql;
  v8 = (NSString *)v4[3];
  if (sql == v8)
  {
    char v9 = 1;
    goto LABEL_9;
  }
  if (v8) {
    char v9 = -[NSString isEqual:](sql, "isEqual:");
  }
  else {
LABEL_7:
  }
    char v9 = 0;
LABEL_9:

  return v9;
}

- (id)description
{
  return (id)[MEMORY[0x263F089D8] stringWithFormat:@"%@: %@", self->_name, self->_sql];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (NSString)sql
{
  return self->_sql;
}

- (void)setSql:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end