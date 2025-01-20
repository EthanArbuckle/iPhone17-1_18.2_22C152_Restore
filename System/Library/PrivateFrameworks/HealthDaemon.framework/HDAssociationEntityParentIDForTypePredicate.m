@interface HDAssociationEntityParentIDForTypePredicate
+ (id)predicateWithParentID:(int64_t)a3 type:(unint64_t)a4;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDAssociationEntityParentIDForTypePredicate

+ (id)predicateWithParentID:(int64_t)a3 type:(unint64_t)a4
{
  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = a3;
  v6[2] = a4;

  return v6;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  v3 = (void *)MEMORY[0x1E4F65D38];
  v4 = objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
  v5 = [v3 innerJoinClauseFromTable:v4 toTargetEntity:objc_opt_class() as:0 localReference:@"data_id" targetKey:@"source_object_id"];

  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  v4 = NSString;
  v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v6 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v7 = [v4 stringWithFormat:@"%@.%@ = ? AND %@.%@ = %lld", v5, @"destination_object_id", v6, @"type", self->_type];

  return v7;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
}

@end