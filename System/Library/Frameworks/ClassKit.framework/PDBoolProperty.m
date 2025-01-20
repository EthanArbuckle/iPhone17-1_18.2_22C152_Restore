@interface PDBoolProperty
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)valueSQLType;
- (PDBoolProperty)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDBoolProperty

+ (id)entityName
{
  return @"PDBoolProperty";
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PDBoolProperty;
  unsigned int v9 = objc_msgSendSuper2(&v13, "migrateFromVersion:finalVersion:inDatabase:", a3, a4, v8);
  if (v9)
  {
    v10 = +[NSString stringWithFormat:@"INSERT INTO PDBoolProperty(name,value) SELECT \"%@\", 1 WHERE NOT EXISTS(SELECT 1 FROM PDBoolProperty WHERE name=\"%@\")", @"syncTeacherContexts", @"syncTeacherContexts"];
    if ((sub_100007540(v8, v10, 0, 0, 0) & 1) == 0)
    {
      CLSInitLog();
      v11 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v15 = @"syncTeacherContexts";
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to set a default value for %@", buf, 0xCu);
      }
    }
  }
  return v9;
}

- (PDBoolProperty)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PDBoolProperty;
  v5 = [(PDProperty *)&v8 initWithDatabaseRow:v4];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"value");
    v5->_value = [v6 BOOLValue];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDBoolProperty;
  id v4 = a3;
  [(PDProperty *)&v6 bindTo:v4];
  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_value, v6.receiver, v6.super_class);
  sub_10008C524((uint64_t)v4, v5, @"value");
}

+ (id)valueSQLType
{
  return @"integer";
}

@end