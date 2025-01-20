@interface PDProperty
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (id)valueSQLType;
- (PDDatabaseValue)identityValue;
- (PDProperty)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDProperty

+ (NSString)entityName
{
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromSelector(a2);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (NSString)identityColumnName
{
  return (NSString *)@"name";
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDProperty *)self->_name;
  }
  return (PDDatabaseValue *)self;
}

- (PDProperty)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PDProperty;
  v5 = [(PDProperty *)&v9 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
}

+ (id)valueSQLType
{
  return &stru_1001F6580;
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = [objc_alloc((Class)NSMutableString) initWithString:@"create table "];
    v11 = NSStringFromClass((Class)a1);
    [v10 appendString:v11];
    objc_msgSend(v10, "appendString:", @" (");
    [v10 appendString:@" name text not null,"];
    [v10 appendString:@" value "];
    v12 = [a1 valueSQLType];
    [v10 appendString:v12];
    [v10 appendString:@""]);
    BOOL v9 = 0;
    if (sub_100007540(v8, v10, 0, 0, 0))
    {
      [v10 setString:@"create unique index "];
      [v10 appendString:v11];
      [v10 appendString:@"_name on "];
      [v10 appendString:v11];
      [v10 appendString:@" (name)"];
      BOOL v9 = 0;
      if (sub_100007540(v8, v10, 0, 0, 0))
      {
        BOOL v9 = 1;
        *a4 = 1;
      }
    }
  }
  return v9;
}

- (void).cxx_destruct
{
}

@end