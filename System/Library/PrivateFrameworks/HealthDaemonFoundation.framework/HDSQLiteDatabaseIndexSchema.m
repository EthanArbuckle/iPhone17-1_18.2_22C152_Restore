@interface HDSQLiteDatabaseIndexSchema
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnique;
- (NSArray)columns;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)setColumns:(id)a3;
- (void)setIsUnique:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation HDSQLiteDatabaseIndexSchema

- (unint64_t)hash
{
  return [(NSArray *)self->_columns hash] ^ self->_isUnique;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  columns = self->_columns;
  v6 = (NSArray *)v4[3];
  if (columns == v6 || v6 && -[NSArray isEqual:](columns, "isEqual:")) {
    BOOL v7 = self->_isUnique ^ (*((unsigned char *)v4 + 8) == 0);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v2 = (void *)MEMORY[0x263F089D8];
  if (self->_isUnique) {
    v3 = @"UNIQUE";
  }
  else {
    v3 = @"INDEX";
  }
  v4 = [(NSArray *)self->_columns componentsJoinedByString:@", "];
  v5 = [v2 stringWithFormat:@"%@ (%@)", v3, v4];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (BOOL)isUnique
{
  return self->_isUnique;
}

- (void)setIsUnique:(BOOL)a3
{
  self->_isUnique = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end