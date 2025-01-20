@interface HDAssociationEntityIsAssociatedPredicate
+ (id)predicateWithInvertedCondition:(BOOL)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
@end

@implementation HDAssociationEntityIsAssociatedPredicate

+ (id)predicateWithInvertedCondition:(BOOL)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = a3;

  return v4;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v6 = NSString;
  v7 = objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
  v8 = [v6 stringWithFormat:@"%@.%@", v7, @"data_id"];

  v9 = [NSString stringWithFormat:@"%@.%@", v5, @"source_object_id"];
  if (self->_inverted) {
    v10 = @"IS NULL";
  }
  else {
    v10 = @"IS NOT NULL";
  }
  v11 = [NSString stringWithFormat:@"((SELECT 1 FROM %@ WHERE (%@ = %@) LIMIT 1) %@)", v5, v8, v9, v10];

  return v11;
}

@end