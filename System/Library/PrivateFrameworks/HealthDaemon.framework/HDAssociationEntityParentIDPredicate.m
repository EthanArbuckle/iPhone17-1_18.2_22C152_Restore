@interface HDAssociationEntityParentIDPredicate
+ (id)predicateWithParentID:(int64_t)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)description;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDAssociationEntityParentIDPredicate

+ (id)predicateWithParentID:(int64_t)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = a3;

  return v4;
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
  v3 = NSString;
  v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v5 = [v3 stringWithFormat:@"%@.%@ = ?", v4, @"destination_object_id"];

  return v5;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<\"%@\" = %lld>", @"destination_object_id", self->_parentID];
}

@end