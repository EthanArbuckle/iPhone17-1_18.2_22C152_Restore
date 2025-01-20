@interface HDSQLiteDatabaseTableSchema
- (BOOL)isEqual:(id)a3;
- (NSDictionary)columns;
- (NSSet)indices;
- (NSSet)triggers;
- (NSString)createTableSchema;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)setColumns:(id)a3;
- (void)setCreateTableSchema:(id)a3;
- (void)setIndices:(id)a3;
- (void)setName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation HDSQLiteDatabaseTableSchema

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = [(NSDictionary *)self->_columns hash] ^ v3;
  return v4 ^ [(NSSet *)self->_indices hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  name = self->_name;
  v6 = (NSString *)v4[1];
  if (name != v6 && (!v6 || !-[NSString isEqual:](name, "isEqual:"))) {
    goto LABEL_10;
  }
  columns = self->_columns;
  v8 = (NSDictionary *)v4[2];
  if (columns != v8 && (!v8 || !-[NSDictionary isEqual:](columns, "isEqual:"))) {
    goto LABEL_10;
  }
  indices = self->_indices;
  v10 = (NSSet *)v4[3];
  if (indices == v10)
  {
    char v11 = 1;
    goto LABEL_11;
  }
  if (v10) {
    char v11 = -[NSSet isEqual:](indices, "isEqual:");
  }
  else {
LABEL_10:
  }
    char v11 = 0;
LABEL_11:

  return v11;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  NSUInteger v3 = (void *)MEMORY[0x263F089D8];
  name = self->_name;
  v5 = [(NSDictionary *)self->_columns allValues];
  v6 = [v5 componentsJoinedByString:@", "];
  v7 = [v3 stringWithFormat:@"CREATE TABLE %@ (%@);", name, v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = self->_indices;
  uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v13 name];
        if ([v13 isUnique]) {
          v15 = @"UNIQUE ";
        }
        else {
          v15 = &stru_26CC1AE10;
        }
        [v7 appendFormat:@" CREATE %@INDEX %@ on %@;", v14, v15, v13];
      }
      uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (NSSet)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
}

- (NSSet)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (NSString)createTableSchema
{
  return self->_createTableSchema;
}

- (void)setCreateTableSchema:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createTableSchema, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end