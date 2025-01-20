@interface HDSQLiteSchemaEntity
+ (BOOL)hasColumnWithName:(id)a3;
+ (BOOL)hasROWID;
+ (BOOL)isTemporary;
+ (Class)entityForProperty:(id)a3;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)checkConstraints;
+ (id)createTableSQL;
+ (id)databaseName;
+ (id)databaseTable;
+ (id)deleteStatementWithProperty:(id)a3 database:(id)a4;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignKeys;
+ (id)indices;
+ (id)insertSQLForProperties:(id)a3 shouldReplace:(BOOL)a4;
+ (id)joinClausesForProperty:(id)a3;
+ (id)orderingTermForSortDescriptor:(id)a3;
+ (id)primaryKeyColumns;
+ (id)privateSubEntities;
+ (id)tableAliases;
+ (id)triggers;
+ (id)uniquedColumns;
+ (id)updateSQLForProperties:(id)a3 predicate:(id)a4;
+ (uint64_t)_copyDeleteSQLWithTableName:(void *)a3 columnName:;
+ (void)enumerateColumnsWithBlock:(id)a3;
@end

@implementation HDSQLiteSchemaEntity

+ (Class)entityForProperty:(id)a3
{
  v3 = HDSQLiteEntityForProperty(a1, a3);

  return (Class)v3;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  v3 = HDSQLiteEntityDisambiguatedSQLForProperty(a1, a3);

  return v3;
}

+ (id)joinClausesForProperty:(id)a3
{
  return 0;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 0;
  return (const $48FC7E0170F5E23E940B831877C707BE *)&+[HDSQLiteSchemaEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (BOOL)hasColumnWithName:(id)a3
{
  return HDSQLiteEntityHasColumnWithName(a1, a3);
}

+ (id)insertSQLForProperties:(id)a3 shouldReplace:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F089D8];
  if (v4) {
    v8 = @" OR REPLACE";
  }
  else {
    v8 = &stru_26CC1AE10;
  }
  v9 = [a1 disambiguatedDatabaseTable];
  v10 = [v6 componentsJoinedByString:@", "];
  v11 = objc_msgSend(v7, "stringWithFormat:", @"INSERT%@ INTO %@ (%@) VALUES ("), v8, v9, v10;

  uint64_t v12 = [v6 count];
  if (v12)
  {
    v13 = @"?";
    do
    {
      [v11 appendString:v13];
      v13 = @", ?";
      --v12;
    }
    while (v12);
  }
  [v11 appendString:@""]);

  return v11;
}

+ (id)updateSQLForProperties:(id)a3 predicate:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a3, "hk_map:", &__block_literal_global_5);
  v8 = NSString;
  v9 = [a1 disambiguatedDatabaseTable];
  v10 = [v7 componentsJoinedByString:@", "];
  v11 = &stru_26CC1AE10;
  if (v6) {
    uint64_t v12 = @" WHERE ";
  }
  else {
    uint64_t v12 = &stru_26CC1AE10;
  }
  if (v6)
  {
    v11 = [v6 SQLForEntityClass:objc_opt_class()];
  }
  v13 = [v8 stringWithFormat:@"UPDATE %@ SET %@%@%@", v9, v10, v12, v11];
  if (v6) {

  }
  return v13;
}

id __57__HDSQLiteSchemaEntity_updateSQLForProperties_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [NSString stringWithFormat:@"%@ = ?", a2];

  return v2;
}

+ (id)databaseName
{
  return 0;
}

+ (id)tableAliases
{
  return (id)MEMORY[0x263EFFA68];
}

+ (BOOL)isTemporary
{
  return 0;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  return 0;
}

+ (id)privateSubEntities
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)uniquedColumns
{
  return 0;
}

+ (id)checkConstraints
{
  return 0;
}

+ (id)foreignKeys
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)indices
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)triggers
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)createTableSQL
{
  uint64_t v12 = 0;
  uint64_t v3 = [a1 columnDefinitionsWithCount:&v12];
  BOOL v4 = [a1 disambiguatedDatabaseTable];
  uint64_t v5 = v12;
  id v6 = [a1 foreignKeys];
  v7 = [a1 primaryKeyColumns];
  v8 = [a1 uniquedColumns];
  v9 = [a1 checkConstraints];
  v10 = HDSQLiteEntityCreateTableSQL(v4, v3, v5, v6, v7, v8, v9, [a1 hasROWID]);

  return v10;
}

+ (void)enumerateColumnsWithBlock:(id)a3
{
}

+ (uint64_t)_copyDeleteSQLWithTableName:(void *)a3 columnName:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = [[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE %@ = ?;", v4, v5];

  return v6;
}

+ (id)deleteStatementWithProperty:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 disambiguatedDatabaseTable];
  v9 = (void *)+[HDSQLiteSchemaEntity _copyDeleteSQLWithTableName:columnName:]((uint64_t)a1, v8, v6);

  v10 = [[HDSQLiteStatement alloc] initWithSQL:v9 database:v7];

  return v10;
}

+ (id)databaseTable
{
  return 0;
}

+ (BOOL)hasROWID
{
  return 1;
}

+ (id)primaryKeyColumns
{
  return 0;
}

@end