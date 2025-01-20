@interface HDWorkoutBuilderAssociatedSamplePredicate
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
@end

@implementation HDWorkoutBuilderAssociatedSamplePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return @"(1=1)";
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  v3 = [(objc_class *)a3 joinClausesForProperty:@"uuid"];
  v4 = (void *)MEMORY[0x1E4F65D38];
  v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v6 = [v4 innerJoinClauseFromTable:v5 toTargetEntity:objc_opt_class() as:0 localReference:@"uuid" targetKey:@"uuid"];

  v7 = [v3 setByAddingObject:v6];

  return v7;
}

@end