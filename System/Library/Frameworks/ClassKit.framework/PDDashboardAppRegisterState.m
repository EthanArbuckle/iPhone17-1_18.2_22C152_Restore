@interface PDDashboardAppRegisterState
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (NSString)description;
- (PDDashboardAppRegisterState)init;
- (PDDashboardAppRegisterState)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (void)bindTo:(id)a3;
@end

@implementation PDDashboardAppRegisterState

- (PDDashboardAppRegisterState)init
{
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromSelector(a2);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)PDDashboardAppRegisterState;
  uint64_t v3 = [(PDDashboardAppRegisterState *)&v9 description];
  if (self)
  {
    v4 = self->_appIdentifier;
    int64_t state = self->_state;
  }
  else
  {
    v4 = 0;
    int64_t state = 0;
  }
  id v6 = +[NSNumber numberWithInteger:state];
  v7 = +[NSString stringWithFormat:@"%@ appIdentifier: %@ state: %@", v3, v4, v6];

  return (NSString *)v7;
}

- (PDDashboardAppRegisterState)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"appIdentifier");
  id v6 = (PDDashboardAppRegisterState *)sub_10013BF50(self, v5);

  if (v6)
  {
    v7 = sub_100003BF0(v4, @"state");
    v6->_int64_t state = (int64_t)[v7 integerValue];
  }
  return v6;
}

+ (NSString)entityName
{
  return (NSString *)@"PDDashboardAppRegisterState";
}

+ (NSString)identityColumnName
{
  return (NSString *)@"appIdentifier";
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table PDDashboardAppRegisterState(   appIdentifier text not null,    state integer not null)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDDashboardAppRegisterState_appIdentifier on PDDashboardAppRegisterState (appIdentifier)", 0, 0, 0))
    {
      LOBYTE(a3) = 1;
      *a4 = 1;
    }
  }

  return a3;
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDDashboardAppRegisterState *)self->_appIdentifier;
  }
  return (PDDatabaseValue *)self;
}

- (void)bindTo:(id)a3
{
  if (self) {
    appIdentifier = self->_appIdentifier;
  }
  else {
    appIdentifier = 0;
  }
  id v5 = a3;
  sub_10008C524((uint64_t)v5, appIdentifier, @"appIdentifier");
  id v6 = +[NSNumber numberWithInteger:self->_state];
  sub_10008C524((uint64_t)v5, v6, @"state");
}

- (void).cxx_destruct
{
}

@end