@interface PDAllowedHost
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDAllowedHost)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (void)bindTo:(id)a3;
@end

@implementation PDAllowedHost

+ (NSString)entityName
{
  return (NSString *)@"PDAllowedHost";
}

- (PDAllowedHost)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAllowedHost;
  v5 = [(PDAllowedHost *)&v9 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"host");
    host = v5->_host;
    v5->_host = (NSString *)v6;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  if (self) {
    host = self->_host;
  }
  else {
    host = 0;
  }
  sub_10008C524((uint64_t)a3, host, @"host");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
      BOOL v9 = 0;
      if (sub_100007540(v7, @"create table PDAllowedHost(   host text not null)", 0, 0, 0))
      {
        BOOL v9 = 0;
        if (sub_100007540(v8, @"create unique index PDAllowedHost_host on PDAllowedHost (host)", 0, 0, 0))
        {
          BOOL v9 = 0;
          if (sub_100007540(v8, @"insert into PDAllowedHost (host) values (?), (?)", 0, &off_10020B170, 0))goto LABEL_5; {
        }
          }
      }
      break;
    case 1uLL:
LABEL_5:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"insert into PDAllowedHost (host) values (?), (?)", 0, &off_10020B188, 0))goto LABEL_6; {
      break;
      }
    case 2uLL:
LABEL_6:
      CFStringRef v13 = @"ws-ee-maidsvc.icloud.com";
      v10 = +[NSArray arrayWithObjects:&v13 count:1];
      int v11 = sub_100007540(v8, @"insert into PDAllowedHost (host) values (?)", 0, v10, 0);

      BOOL v9 = 0;
      if (v11) {
        goto LABEL_7;
      }
      break;
    case 3uLL:
LABEL_7:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"insert into PDAllowedHost (host) values (?)", 0, &off_10020B1A0, 0)) {
        goto LABEL_8;
      }
      break;
    case 4uLL:
LABEL_8:
      BOOL v9 = 0;
      if (sub_100007540(v8, @"insert into PDAllowedHost (host) values (?)", 0, &off_10020B1B8, 0))
      {
        a3 = 5;
        goto LABEL_10;
      }
      break;
    default:
LABEL_10:
      *a4 = a3;
      BOOL v9 = 1;
      break;
  }

  return v9;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"host";
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDAllowedHost *)self->_host;
  }
  return (PDDatabaseValue *)self;
}

- (void).cxx_destruct
{
}

@end