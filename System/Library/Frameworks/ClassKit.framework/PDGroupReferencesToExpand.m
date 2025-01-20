@interface PDGroupReferencesToExpand
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDGroupReferencesToExpand)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDGroupReferencesToExpand

+ (NSString)entityName
{
  return (NSString *)@"PDGroupReferencesToExpand";
}

- (PDGroupReferencesToExpand)initWithDatabaseRow:(id)a3
{
  v4 = sub_100003BF0((uint64_t *)a3, @"objectID");
  v5 = (PDGroupReferencesToExpand *)sub_1000C630C((id *)&self->super.isa, v4);

  return v5;
}

- (void)bindTo:(id)a3
{
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDGroupReferencesToExpand (\n    objectID text not null\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDGroupReferencesToExpand_objectID on PDGroupReferencesToExpand (objectID)", 0, 0, 0))
    {
      a3 = 1;
LABEL_2:
      *a4 = a3;
      LOBYTE(a3) = 1;
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"objectID";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_objectID;
}

- (void).cxx_destruct
{
}

@end