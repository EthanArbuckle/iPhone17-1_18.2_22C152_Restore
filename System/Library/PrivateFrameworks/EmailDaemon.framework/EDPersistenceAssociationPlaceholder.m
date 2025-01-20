@interface EDPersistenceAssociationPlaceholder
- (BOOL)resolveWithSchema:(id)a3;
- (EDPersistenceAssociationPlaceholder)initWithColumn:(id)a3 tableName:(id)a4;
- (EFSQLColumnSchema)column;
- (NSString)tableName;
- (id)description;
@end

@implementation EDPersistenceAssociationPlaceholder

- (EDPersistenceAssociationPlaceholder)initWithColumn:(id)a3 tableName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDPersistenceAssociationPlaceholder;
  v9 = [(EDPersistenceAssociationPlaceholder *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_column, a3);
    uint64_t v11 = [v8 copy];
    tableName = v10->_tableName;
    v10->_tableName = (NSString *)v11;
  }
  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)EDPersistenceAssociationPlaceholder;
  v4 = [(EDPersistenceAssociationPlaceholder *)&v10 description];
  v5 = [(EDPersistenceAssociationPlaceholder *)self column];
  v6 = [v5 fullNameWithDatabaseName:0];
  id v7 = [(EDPersistenceAssociationPlaceholder *)self tableName];
  id v8 = (void *)[v3 initWithFormat:@"%@ %@ -> %@", v4, v6, v7];

  return v8;
}

- (BOOL)resolveWithSchema:(id)a3
{
  id v4 = a3;
  v5 = [(EDPersistenceAssociationPlaceholder *)self tableName];
  v6 = [v4 tableForName:v5];

  if (v6)
  {
    id v7 = [(EDPersistenceAssociationPlaceholder *)self column];
    [v7 associateWithTable:v6];
  }
  return v6 != 0;
}

- (EFSQLColumnSchema)column
{
  return self->_column;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_column, 0);
}

@end