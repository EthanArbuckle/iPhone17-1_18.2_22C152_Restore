@interface HDWorkoutActivityPredicate
+ (id)predicateForSubPredicate:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDWorkoutActivityPredicate

+ (id)predicateForSubPredicate:(id)a3
{
  id v3 = a3;
  v4 = [HDWorkoutActivityPredicate alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)HDWorkoutActivityPredicate;
    v5 = objc_msgSendSuper2(&v8, sel_init);
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)v5[1];
  v5[1] = v3;

  return v5;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
}

- (id)SQLForEntityClass:(Class)a3
{
  id v3 = [(HDSQLitePredicate *)self->_subPredicate SQLForEntityClass:objc_opt_class()];
  v14 = NSString;
  v4 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v5 = *MEMORY[0x1E4F65C70];
  v6 = +[HDDataEntity disambiguatedSQLForProperty:*MEMORY[0x1E4F65C70]];
  v7 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"owner_id"];
  objc_super v8 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"is_primary_activity"];
  v9 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v10 = +[HDDataEntity disambiguatedSQLForProperty:v5];
  v11 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"owner_id"];
  v12 = [v14 stringWithFormat:@"(EXISTS (SELECT 1 FROM %@ WHERE %@ = %@ AND (%@) AND (%@ = 0 OR (SELECT COUNT(*) FROM %@ WHERE %@ = %@) = 1)))", v4, v6, v7, v3, v8, v9, v10, v11];

  return v12;
}

- (void).cxx_destruct
{
}

@end