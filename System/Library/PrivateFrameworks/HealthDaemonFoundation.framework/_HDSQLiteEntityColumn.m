@interface _HDSQLiteEntityColumn
- (HDSQLiteEntityForeignKey)foreignKey;
- (NSString)columnType;
- (NSString)name;
- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5;
- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5 foreignKey:(id)a6;
- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5 targetEntityClass:(Class)a6 targetProperty:(id)a7 deletionAction:(int64_t)a8;
- (id)_columnNameAndTypeString;
- (id)creationSQL;
- (id)description;
- (unsigned)keyPathType;
@end

@implementation _HDSQLiteEntityColumn

- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5
{
  return [(_HDSQLiteEntityColumn *)self initWithName:a3 columnType:a4 keyPathType:a5 foreignKey:0];
}

- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5 foreignKey:(id)a6
{
  int v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  BOOL HasForeignKey = HDKeyPathTypeHasForeignKey(v7);
  if (!v13 && HasForeignKey)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDSQLiteEntityColumn.m", 33, @"Invalid parameter not satisfying: %@", @"foreignKey != nil" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)_HDSQLiteEntityColumn;
  v15 = [(_HDSQLiteEntityColumn *)&v22 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    columnType = v15->_columnType;
    v15->_columnType = (NSString *)v18;

    v15->_keyPathType = v7;
    objc_storeStrong((id *)&v15->_foreignKey, a6);
  }

  return v15;
}

- (_HDSQLiteEntityColumn)initWithName:(id)a3 columnType:(id)a4 keyPathType:(unsigned __int8)a5 targetEntityClass:(Class)a6 targetProperty:(id)a7 deletionAction:(int64_t)a8
{
  uint64_t v11 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  uint64_t v18 = v17;
  if (a6)
  {
    if (!v17)
    {
      objc_super v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"HDSQLiteEntityColumn.m", 56, @"Invalid parameter not satisfying: %@", @"targetProperty != nil" object file lineNumber description];
    }
    v19 = [[HDSQLiteEntityForeignKey alloc] initWithEntityClass:a6 property:v18 deletionAction:a8];
  }
  else
  {
    v19 = 0;
  }
  v20 = [(_HDSQLiteEntityColumn *)self initWithName:v15 columnType:v16 keyPathType:v11 foreignKey:v19];

  return v20;
}

- (id)creationSQL
{
  if (self->_foreignKey)
  {
    v3 = NSString;
    v4 = -[_HDSQLiteEntityColumn _columnNameAndTypeString]((uint64_t)self);
    v5 = [(HDSQLiteEntityForeignKey *)self->_foreignKey creationSQL];
    v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];
  }
  else
  {
    v6 = -[_HDSQLiteEntityColumn _columnNameAndTypeString]((uint64_t)self);
  }

  return v6;
}

- (id)_columnNameAndTypeString
{
  if (a1)
  {
    uint64_t v2 = a1;
    v3 = NSString;
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = [*(id *)(a1 + 24) length];
    v6 = " ";
    if (!v5) {
      v6 = "";
    }
    int v7 = *(__CFString **)(v2 + 24);
    if (!v7) {
      int v7 = &stru_26CC1AE10;
    }
    a1 = [v3 stringWithFormat:@"%@%s%@", v4, v6, v7];
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = -[_HDSQLiteEntityColumn _columnNameAndTypeString]((uint64_t)self);
  uint64_t v5 = [NSNumber numberWithUnsignedChar:self->_keyPathType];
  v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)columnType
{
  return self->_columnType;
}

- (unsigned)keyPathType
{
  return self->_keyPathType;
}

- (HDSQLiteEntityForeignKey)foreignKey
{
  return self->_foreignKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKey, 0);
  objc_storeStrong((id *)&self->_columnType, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end