@interface EDPersistenceForeignKeyPlaceholder
- (BOOL)resolveToStringForTableNames:(id)a3;
- (BOOL)resolveWithSchema:(id)a3;
- (EDPersistenceForeignKeyPlaceholder)initWithColumn:(id)a3 tableName:(id)a4 onDelete:(unint64_t)a5 onUpdate:(unint64_t)a6;
- (EFSQLColumnSchema)column;
- (NSString)tableName;
- (id)description;
- (unint64_t)deleteAction;
- (unint64_t)updateAction;
@end

@implementation EDPersistenceForeignKeyPlaceholder

- (EDPersistenceForeignKeyPlaceholder)initWithColumn:(id)a3 tableName:(id)a4 onDelete:(unint64_t)a5 onUpdate:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EDPersistenceForeignKeyPlaceholder;
  v13 = [(EDPersistenceForeignKeyPlaceholder *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_column, a3);
    uint64_t v15 = [v12 copy];
    tableName = v14->_tableName;
    v14->_tableName = (NSString *)v15;

    v14->_deleteAction = a5;
    v14->_updateAction = a6;
  }

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)EDPersistenceForeignKeyPlaceholder;
  v4 = [(EDPersistenceForeignKeyPlaceholder *)&v10 description];
  v5 = [(EDPersistenceForeignKeyPlaceholder *)self column];
  v6 = [v5 fullNameWithDatabaseName:0];
  v7 = [(EDPersistenceForeignKeyPlaceholder *)self tableName];
  v8 = (void *)[v3 initWithFormat:@"%@ %@ -> %@", v4, v6, v7];

  return v8;
}

- (BOOL)resolveWithSchema:(id)a3
{
  id v4 = a3;
  v5 = [(EDPersistenceForeignKeyPlaceholder *)self tableName];
  v6 = [v4 tableForName:v5];

  if (v6)
  {
    v7 = [(EDPersistenceForeignKeyPlaceholder *)self column];
    objc_msgSend(v7, "setAsForeignKeyForTable:onDelete:onUpdate:", v6, -[EDPersistenceForeignKeyPlaceholder deleteAction](self, "deleteAction"), -[EDPersistenceForeignKeyPlaceholder updateAction](self, "updateAction"));
  }
  return v6 != 0;
}

- (BOOL)resolveToStringForTableNames:(id)a3
{
  id v4 = a3;
  v5 = [(EDPersistenceForeignKeyPlaceholder *)self tableName];
  char v6 = [v4 containsObject:v5];
  if (v6)
  {
    id v7 = [NSString alloc];
    v8 = (void *)[v7 initWithFormat:@"%@(%@)", v5, *MEMORY[0x1E4F60D08]];
    v9 = [(EDPersistenceForeignKeyPlaceholder *)self column];
    objc_msgSend(v9, "setAsForeignKeyForString:onDelete:onUpdate:", v8, -[EDPersistenceForeignKeyPlaceholder deleteAction](self, "deleteAction"), -[EDPersistenceForeignKeyPlaceholder updateAction](self, "updateAction"));
  }
  return v6;
}

- (EFSQLColumnSchema)column
{
  return self->_column;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (unint64_t)deleteAction
{
  return self->_deleteAction;
}

- (unint64_t)updateAction
{
  return self->_updateAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_column, 0);
}

@end