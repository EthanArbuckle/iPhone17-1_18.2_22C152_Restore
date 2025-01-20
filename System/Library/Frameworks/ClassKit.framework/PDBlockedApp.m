@interface PDBlockedApp
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDBlockedApp)init;
- (PDBlockedApp)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (void)bindTo:(id)a3;
@end

@implementation PDBlockedApp

+ (NSString)entityName
{
  return (NSString *)@"PDBlockedApp";
}

- (PDBlockedApp)init
{
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromSelector(a2);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (PDBlockedApp)initWithDatabaseRow:(id)a3
{
  v4 = sub_100003BF0((uint64_t *)a3, @"appIdentifier");
  v5 = (PDBlockedApp *)sub_1000C72E4(self, v4);

  return v5;
}

- (void)bindTo:(id)a3
{
  if (self) {
    appIdentifier = self->_appIdentifier;
  }
  else {
    appIdentifier = 0;
  }
  sub_10008C524((uint64_t)a3, appIdentifier, @"appIdentifier");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table PDBlockedApp(   appIdentifier text not null)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDBlockedApp_appIdentifier on PDBlockedApp (appIdentifier)", 0, 0, 0))
    {
      LOBYTE(a3) = 1;
      *a4 = 1;
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"appIdentifier";
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDBlockedApp *)self->_appIdentifier;
  }
  return (PDDatabaseValue *)self;
}

- (void).cxx_destruct
{
}

@end