@interface HDSQLiteDatabaseColumnSchema
- (BOOL)isAutoincrement;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNullable;
- (BOOL)isPrimaryKey;
- (NSString)defaultValue;
- (NSString)foreignKeyTargetColumn;
- (NSString)foreignKeyTargetTable;
- (NSString)name;
- (NSString)type;
- (id)description;
- (int64_t)deletionAction;
- (unint64_t)hash;
- (void)setDefaultValue:(id)a3;
- (void)setDeletionAction:(int64_t)a3;
- (void)setForeignKeyTargetColumn:(id)a3;
- (void)setForeignKeyTargetTable:(id)a3;
- (void)setIsAutoincrement:(BOOL)a3;
- (void)setIsNullable:(BOOL)a3;
- (void)setIsPrimaryKey:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HDSQLiteDatabaseColumnSchema

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_type hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_defaultValue hash] ^ self->_isAutoincrement;
  unint64_t v6 = self->_isPrimaryKey ^ (unint64_t)self->_isNullable;
  NSUInteger v7 = v6 ^ [(NSString *)self->_foreignKeyTargetTable hash];
  return v5 ^ v7 ^ [(NSString *)self->_foreignKeyTargetColumn hash] ^ self->_deletionAction;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  name = self->_name;
  unint64_t v6 = (NSString *)v4[2];
  if (name != v6 && (!v6 || !-[NSString isEqual:](name, "isEqual:"))) {
    goto LABEL_20;
  }
  type = self->_type;
  v8 = (NSString *)v4[3];
  if (type != v8 && (!v8 || !-[NSString isEqual:](type, "isEqual:"))) {
    goto LABEL_20;
  }
  if (((defaultValue = self->_defaultValue, v10 = (NSString *)v4[4], defaultValue == v10)
     || v10 && -[NSString isEqual:](defaultValue, "isEqual:"))
    && self->_isAutoincrement == *((unsigned __int8 *)v4 + 8)
    && self->_isPrimaryKey == *((unsigned __int8 *)v4 + 9)
    && self->_isNullable == *((unsigned __int8 *)v4 + 10)
    && ((foreignKeyTargetTable = self->_foreignKeyTargetTable, v12 = (NSString *)v4[5], foreignKeyTargetTable == v12)
     || v12 && -[NSString isEqual:](foreignKeyTargetTable, "isEqual:"))
    && ((foreignKeyTargetColumn = self->_foreignKeyTargetColumn, v14 = (NSString *)v4[6], foreignKeyTargetColumn == v14)
     || v14 && -[NSString isEqual:](foreignKeyTargetColumn, "isEqual:")))
  {
    BOOL v15 = self->_deletionAction == v4[7];
  }
  else
  {
LABEL_20:
    BOOL v15 = 0;
  }

  return v15;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x263F089D8] stringWithFormat:@"%@ %@", self->_name, self->_type];
  NSUInteger v4 = v3;
  if (self->_isPrimaryKey) {
    [v3 appendString:@" PRIMARY KEY"];
  }
  if (self->_isAutoincrement) {
    [v4 appendString:@" AUTOINCREMENT"];
  }
  if (!self->_isNullable) {
    [v4 appendString:@" NOT NULL"];
  }
  foreignKeyTargetTable = self->_foreignKeyTargetTable;
  if (foreignKeyTargetTable)
  {
    foreignKeyTargetColumn = self->_foreignKeyTargetColumn;
    NSUInteger v7 = HDSQLForForeignKeyDeletionAction(self->_deletionAction);
    [v4 appendFormat:@" REFERENCES %@(%@) ON DELETE %@", foreignKeyTargetTable, foreignKeyTargetColumn, v7];
  }

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (BOOL)isAutoincrement
{
  return self->_isAutoincrement;
}

- (void)setIsAutoincrement:(BOOL)a3
{
  self->_isAutoincrement = a3;
}

- (BOOL)isPrimaryKey
{
  return self->_isPrimaryKey;
}

- (void)setIsPrimaryKey:(BOOL)a3
{
  self->_isPrimaryKey = a3;
}

- (BOOL)isNullable
{
  return self->_isNullable;
}

- (void)setIsNullable:(BOOL)a3
{
  self->_isNullable = a3;
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSString)foreignKeyTargetTable
{
  return self->_foreignKeyTargetTable;
}

- (void)setForeignKeyTargetTable:(id)a3
{
}

- (NSString)foreignKeyTargetColumn
{
  return self->_foreignKeyTargetColumn;
}

- (void)setForeignKeyTargetColumn:(id)a3
{
}

- (int64_t)deletionAction
{
  return self->_deletionAction;
}

- (void)setDeletionAction:(int64_t)a3
{
  self->_deletionAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKeyTargetColumn, 0);
  objc_storeStrong((id *)&self->_foreignKeyTargetTable, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end