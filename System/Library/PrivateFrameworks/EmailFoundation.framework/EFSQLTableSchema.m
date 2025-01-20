@interface EFSQLTableSchema
- (EFSQLColumnSchema)rowIDColumn;
- (EFSQLTableSchema)initWithName:(id)a3 columns:(id)a4 primaryKeyColumns:(id)a5;
- (EFSQLTableSchema)initWithName:(id)a3 columns:(id)a4 primaryKeyColumns:(id)a5 conflictResolution:(unint64_t)a6;
- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 columns:(id)a5;
- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 rowIDAlias:(id)a5 columns:(id)a6;
- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 rowIDAlias:(id)a5 columns:(id)a6 primaryKeyColumns:(id)a7 conflictResolution:(unint64_t)a8;
- (NSArray)checkConstraints;
- (NSArray)columns;
- (NSArray)indexes;
- (NSArray)primaryKeyColumns;
- (NSArray)uniqueColumns;
- (NSSet)associatedColumns;
- (NSSet)foreignKeyReferences;
- (NSString)name;
- (NSString)rowIDColumnName;
- (id)_columnsForColumnNames:(id)a3;
- (id)columnForName:(id)a3;
- (id)definitionWithDatabaseName:(id)a3;
- (id)definitionWithDatabaseName:(id)a3 includeIndexes:(BOOL)a4;
- (id)description;
- (id)fullNameWithDatabaseName:(id)a3;
- (id)indexDefinitionsWithDatabaseName:(id)a3;
- (unint64_t)primaryKeyConflictResolution;
- (void)addAssociatedColumn:(id)a3;
- (void)addCheckConstraintForExpression:(id)a3;
- (void)addColumn:(id)a3;
- (void)addForeignKeyReference:(id)a3;
- (void)addIndex:(id)a3;
- (void)addIndexForColumns:(id)a3;
- (void)addUniquenessConstraintForColumns:(id)a3 conflictResolution:(unint64_t)a4;
- (void)removeColumn:(id)a3;
@end

@implementation EFSQLTableSchema

- (NSString)name
{
  return self->_name;
}

- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 columns:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!a4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EFSQLTableSchema.m", 41, @"Invalid parameter not satisfying: %@", @"rowIDType != EFSQLRowIDTypeNone" object file lineNumber description];
  }
  v11 = [(EFSQLTableSchema *)self initWithName:v9 rowIDType:a4 rowIDAlias:0 columns:v10 primaryKeyColumns:0 conflictResolution:0];

  return v11;
}

- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 rowIDAlias:(id)a5 columns:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!a4)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"EFSQLTableSchema.m", 46, @"Invalid parameter not satisfying: %@", @"rowIDType != EFSQLRowIDTypeNone" object file lineNumber description];
  }
  v14 = [(EFSQLTableSchema *)self initWithName:v11 rowIDType:a4 rowIDAlias:v12 columns:v13 primaryKeyColumns:0 conflictResolution:0];

  return v14;
}

- (EFSQLTableSchema)initWithName:(id)a3 columns:(id)a4 primaryKeyColumns:(id)a5
{
  return [(EFSQLTableSchema *)self initWithName:a3 rowIDType:0 rowIDAlias:0 columns:a4 primaryKeyColumns:a5 conflictResolution:0];
}

- (EFSQLTableSchema)initWithName:(id)a3 columns:(id)a4 primaryKeyColumns:(id)a5 conflictResolution:(unint64_t)a6
{
  return [(EFSQLTableSchema *)self initWithName:a3 rowIDType:0 rowIDAlias:0 columns:a4 primaryKeyColumns:a5 conflictResolution:a6];
}

- (EFSQLTableSchema)initWithName:(id)a3 rowIDType:(unint64_t)a4 rowIDAlias:(id)a5 columns:(id)a6 primaryKeyColumns:(id)a7 conflictResolution:(unint64_t)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v48 = a5;
  id v14 = a6;
  id v49 = a7;
  v54.receiver = self;
  v54.super_class = (Class)EFSQLTableSchema;
  v15 = [(EFSQLTableSchema *)&v54 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    uint64_t v17 = [v14 mutableCopy];
    columns = v16->_columns;
    v16->_columns = (NSMutableArray *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    columnsByName = v16->_columnsByName;
    v16->_columnsByName = v19;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v21 = v14;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          [v25 setTable:v16];
          v26 = v16->_columnsByName;
          v27 = [v25 name];
          [(NSMutableDictionary *)v26 setObject:v25 forKeyedSubscript:v27];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v22);
    }

    if (a4 - 1 >= 2)
    {
      if (!a4)
      {
        if (![v49 count])
        {
          v44 = [MEMORY[0x1E4F28B00] currentHandler];
          [v44 handleFailureInMethod:a2 object:v16 file:@"EFSQLTableSchema.m" lineNumber:72 description:@"No primary key columns specified"];
        }
        uint64_t v31 = [(EFSQLTableSchema *)v16 _columnsForColumnNames:v49];
        primaryKeyColumns = v16->_primaryKeyColumns;
        v16->_primaryKeyColumns = (NSArray *)v31;

        v16->_primaryKeyConflictResolution = a8;
      }
    }
    else
    {
      id v28 = [[EFSQLColumnSchema alloc] initRowIDWithAlias:v48 isAutoincrementing:a4 == 2];
      [v28 setTable:v16];
      [(NSMutableArray *)v16->_columns insertObject:v28 atIndex:0];
      uint64_t v29 = [v28 name];
      rowIDColumnName = v16->_rowIDColumnName;
      v16->_rowIDColumnName = (NSString *)v29;

      [(NSMutableDictionary *)v16->_columnsByName setObject:v28 forKeyedSubscript:v16->_rowIDColumnName];
    }
    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uniquenessConstraints = v16->_uniquenessConstraints;
    v16->_uniquenessConstraints = v33;

    v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    checkConstraints = v16->_checkConstraints;
    v16->_checkConstraints = v35;

    uint64_t v37 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    foreignKeyReferences = v16->_foreignKeyReferences;
    v16->_foreignKeyReferences = (NSHashTable *)v37;

    uint64_t v39 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    associatedColumns = v16->_associatedColumns;
    v16->_associatedColumns = (NSHashTable *)v39;

    v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    indexes = v16->_indexes;
    v16->_indexes = v41;
  }
  return v16;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)EFSQLTableSchema;
  v4 = [(EFSQLTableSchema *)&v8 description];
  v5 = [(EFSQLTableSchema *)self name];
  v6 = (void *)[v3 initWithFormat:@"%@ %@ [%@]", v4, v5, self->_columns];

  return v6;
}

- (id)definitionWithDatabaseName:(id)a3
{
  id v3 = [(EFSQLTableSchema *)self definitionWithDatabaseName:a3 includeIndexes:1];
  return v3;
}

- (id)definitionWithDatabaseName:(id)a3 includeIndexes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  v41 = [(NSMutableArray *)self->_columns ef_map:&__block_literal_global_36];
  v44 = self;
  v6 = [(EFSQLTableSchema *)self primaryKeyColumns];
  v40 = v6;
  if (v6)
  {
    v7 = objc_msgSend(v6, "ef_map:", &__block_literal_global_25_0);
    objc_super v8 = &stru_1F0EAE5A8;
    uint64_t v9 = [(EFSQLTableSchema *)v44 primaryKeyConflictResolution];
    if (v9)
    {
      id v10 = [NSString alloc];
      id v11 = EFSQLStringForConflictResolution(v9);
      objc_super v8 = (__CFString *)[v10 initWithFormat:@" ON CONFLICT %@", v11];
    }
    id v12 = [NSString alloc];
    id v13 = [v7 componentsJoinedByString:@", "];
    v42 = (__CFString *)[v12 initWithFormat:@",\nPRIMARY KEY(%@)%@", v13, v8];

    id v14 = @" WITHOUT ROWID";
  }
  else
  {
    id v14 = &stru_1F0EAE5A8;
    v42 = &stru_1F0EAE5A8;
  }
  uint64_t v39 = v14;
  BOOL v38 = v4;
  if ([(NSMutableArray *)v44->_uniquenessConstraints count])
  {
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](v44->_uniquenessConstraints, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obj = v44->_uniquenessConstraints;
    uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v19 = [v18 first];
          v20 = objc_msgSend(v19, "ef_map:", &__block_literal_global_39);
          id v21 = [v20 componentsJoinedByString:@", "];

          id v22 = [NSString alloc];
          uint64_t v23 = [v18 second];
          v24 = EFSQLStringForConflictResolution([v23 unsignedIntegerValue]);
          v25 = (void *)[v22 initWithFormat:@"UNIQUE(%@) ON CONFLICT %@", v21, v24];

          [v46 addObject:v25];
        }
        uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v15);
    }

    id v26 = [NSString alloc];
    v27 = [v46 componentsJoinedByString:@",\n"];
    id v28 = (__CFString *)[v26 initWithFormat:@",\n%@", v27];
  }
  else
  {
    id v28 = &stru_1F0EAE5A8;
  }
  uint64_t v29 = [(EFSQLTableSchema *)v44 checkConstraints];
  v30 = [MEMORY[0x1E4F28E78] string];
  if ([v29 count])
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_4;
    v47[3] = &unk_1E6123568;
    id v48 = v30;
    [v29 enumerateObjectsUsingBlock:v47];
  }
  uint64_t v31 = [(EFSQLTableSchema *)v44 fullNameWithDatabaseName:v43];
  id v32 = [NSString alloc];
  v33 = [v41 componentsJoinedByString:@",\n"];
  v34 = objc_msgSend(v32, "initWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (%@%@%@%@)%@;",
                  v31,
                  v33,
                  v42,
                  v28,
                  v30,
                  v39);

  if (v38)
  {
    v35 = [(EFSQLTableSchema *)v44 indexDefinitionsWithDatabaseName:v43];
    if ([v35 length])
    {
      uint64_t v36 = [[NSString alloc] initWithFormat:@"%@\n%@", v34, v35];

      v34 = (void *)v36;
    }
  }
  return v34;
}

id __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 definition];
  return v2;
}

id __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  return v2;
}

id __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  return v2;
}

void __62__EFSQLTableSchema_definitionWithDatabaseName_includeIndexes___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) appendString:@",\n"];
  objc_msgSend(*(id *)(a1 + 32), "appendString:", @"CHECK(");
  id v3 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  objc_msgSend(v3, "ef_renderSQLExpressionInto:", *(void *)(a1 + 32));

  [*(id *)(a1 + 32) appendString:@""]);
}

- (id)indexDefinitionsWithDatabaseName:(id)a3
{
  id v4 = a3;
  v5 = [(EFSQLTableSchema *)self indexes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__EFSQLTableSchema_indexDefinitionsWithDatabaseName___block_invoke;
  v10[3] = &unk_1E6123590;
  id v6 = v4;
  id v11 = v6;
  v7 = objc_msgSend(v5, "ef_map:", v10);

  if ([v7 count])
  {
    objc_super v8 = [v7 componentsJoinedByString:@"\n"];
  }
  else
  {
    objc_super v8 = &stru_1F0EAE5A8;
  }

  return v8;
}

id __53__EFSQLTableSchema_indexDefinitionsWithDatabaseName___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 definitionWithDatabaseName:*(void *)(a1 + 32)];
  return v2;
}

- (id)fullNameWithDatabaseName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [NSString alloc];
    id v6 = [(EFSQLTableSchema *)self name];
    v7 = (void *)[v5 initWithFormat:@"%@.%@", v4, v6];
  }
  else
  {
    v7 = [(EFSQLTableSchema *)self name];
  }

  return v7;
}

- (EFSQLColumnSchema)rowIDColumn
{
  columnsByName = self->_columnsByName;
  id v3 = [(EFSQLTableSchema *)self rowIDColumnName];
  id v4 = [(NSMutableDictionary *)columnsByName objectForKeyedSubscript:v3];

  return (EFSQLColumnSchema *)v4;
}

- (NSArray)columns
{
  v2 = (void *)[(NSMutableArray *)self->_columns copy];
  return (NSArray *)v2;
}

- (NSArray)uniqueColumns
{
  v2 = [(NSMutableArray *)self->_uniquenessConstraints ef_map:&__block_literal_global_72];
  id v3 = objc_msgSend(v2, "ef_notEmpty");

  return (NSArray *)v3;
}

id __33__EFSQLTableSchema_uniqueColumns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 first];
  return v2;
}

- (NSArray)checkConstraints
{
  return (NSArray *)[(NSMutableArray *)self->_checkConstraints ef_notEmpty];
}

- (id)columnForName:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_columnsByName objectForKeyedSubscript:a3];
  return v3;
}

- (void)addColumn:(id)a3
{
  id v6 = a3;
  [v6 setTable:self];
  [(NSMutableArray *)self->_columns addObject:v6];
  columnsByName = self->_columnsByName;
  id v5 = [v6 name];
  [(NSMutableDictionary *)columnsByName setObject:v6 forKeyedSubscript:v5];
}

- (void)removeColumn:(id)a3
{
  id v6 = a3;
  [v6 setTable:0];
  [(NSMutableArray *)self->_columns removeObject:v6];
  columnsByName = self->_columnsByName;
  id v5 = [v6 name];
  [(NSMutableDictionary *)columnsByName setObject:0 forKeyedSubscript:v5];
}

- (void)addUniquenessConstraintForColumns:(id)a3 conflictResolution:(unint64_t)a4
{
  id v9 = [(EFSQLTableSchema *)self _columnsForColumnNames:a3];
  uniquenessConstraints = self->_uniquenessConstraints;
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  objc_super v8 = +[EFPair pairWithFirst:v9 second:v7];
  [(NSMutableArray *)uniquenessConstraints addObject:v8];
}

- (id)_columnsForColumnNames:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__EFSQLTableSchema__columnsForColumnNames___block_invoke;
  v5[3] = &unk_1E61235D8;
  v5[4] = self;
  v5[5] = a2;
  id v3 = objc_msgSend(a3, "ef_map:", v5);
  return v3;
}

id __43__EFSQLTableSchema__columnsForColumnNames___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) columnForName:v3];
  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"EFSQLTableSchema.m", 218, @"No matching column for column name: %@", v3 object file lineNumber description];
  }
  return v4;
}

- (void)addCheckConstraintForExpression:(id)a3
{
}

- (NSSet)foreignKeyReferences
{
  v2 = [(NSHashTable *)self->_foreignKeyReferences setRepresentation];
  id v3 = objc_msgSend(v2, "ef_notEmpty");

  return (NSSet *)v3;
}

- (void)addForeignKeyReference:(id)a3
{
}

- (NSSet)associatedColumns
{
  v2 = [(NSHashTable *)self->_associatedColumns setRepresentation];
  id v3 = objc_msgSend(v2, "ef_notEmpty");

  return (NSSet *)v3;
}

- (void)addAssociatedColumn:(id)a3
{
}

- (NSArray)indexes
{
  return (NSArray *)[(NSMutableArray *)self->_indexes ef_notEmpty];
}

- (void)addIndex:(id)a3
{
  id v7 = a3;
  id v4 = [v7 tableName];
  id v5 = [(EFSQLTableSchema *)self name];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    [(NSMutableArray *)self->_indexes addObject:v7];
  }
}

- (void)addIndexForColumns:(id)a3
{
  id v7 = a3;
  id v4 = [EFSQLIndexSchema alloc];
  id v5 = [(EFSQLTableSchema *)self name];
  int v6 = [(EFSQLIndexSchema *)v4 initWithTableName:v5 columnNames:v7];

  [(NSMutableArray *)self->_indexes addObject:v6];
}

- (NSArray)primaryKeyColumns
{
  return self->_primaryKeyColumns;
}

- (NSString)rowIDColumnName
{
  return self->_rowIDColumnName;
}

- (unint64_t)primaryKeyConflictResolution
{
  return self->_primaryKeyConflictResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowIDColumnName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_primaryKeyColumns, 0);
  objc_storeStrong((id *)&self->_indexes, 0);
  objc_storeStrong((id *)&self->_associatedColumns, 0);
  objc_storeStrong((id *)&self->_foreignKeyReferences, 0);
  objc_storeStrong((id *)&self->_checkConstraints, 0);
  objc_storeStrong((id *)&self->_uniquenessConstraints, 0);
  objc_storeStrong((id *)&self->_columnsByName, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

@end