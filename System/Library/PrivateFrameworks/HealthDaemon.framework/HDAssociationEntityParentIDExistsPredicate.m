@interface HDAssociationEntityParentIDExistsPredicate
+ (id)predicateWithParentID:(int64_t)a3 exists:(BOOL)a4;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDAssociationEntityParentIDExistsPredicate

+ (id)predicateWithParentID:(int64_t)a3 exists:(BOOL)a4
{
  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = a3;
  *((unsigned char *)v6 + 16) = a4;

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v6 = NSString;
  if (self->_exists) {
    v7 = CFSTR("(EXISTS");
  }
  else {
    v7 = CFSTR("(NOT EXISTS");
  }
  v8 = objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedSQLForProperty:", @"data_id");
  v9 = [v6 stringWithFormat:@"%@ (SELECT 1 FROM %@ cor WHERE ((cor.%@ = ?) AND (%@=cor.%@)) LIMIT 1)"], v7, v5, @"destination_object_id", v8, @"source_object_id", 0);

  return v9;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
}

- (id)description
{
  if (self->_exists) {
    v2 = @"exits";
  }
  else {
    v2 = @"does not exist";
  }
  return (id)[NSString stringWithFormat:@"<\"%@\" = %lld %@>", @"destination_object_id", self->_parentID, v2];
}

@end