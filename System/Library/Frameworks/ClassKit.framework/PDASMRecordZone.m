@interface PDASMRecordZone
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDASMRecordZone)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (id)dictionaryRepresentation;
- (void)bindTo:(id)a3;
@end

@implementation PDASMRecordZone

+ (NSString)entityName
{
  return (NSString *)@"PDASMRecordZone";
}

- (PDASMRecordZone)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"zoneName");
  v6 = (PDASMRecordZone *)sub_100099F54(self, v5);

  if (v6)
  {
    uint64_t v7 = sub_100003BF0(v4, @"serverChangeToken");
    serverChangeToken = v6->_serverChangeToken;
    v6->_serverChangeToken = (NSData *)v7;

    v9 = sub_100003BF0(v4, @"status");
    v6->_status = (int64_t)[v9 integerValue];
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  zoneName = self->_zoneName;
  id v5 = a3;
  sub_10008C524((uint64_t)v5, zoneName, @"zoneName");
  sub_10008C524((uint64_t)v5, self->_serverChangeToken, @"serverChangeToken");
  id v6 = +[NSNumber numberWithInteger:self->_status];
  sub_10008C524((uint64_t)v5, v6, @"status");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table PDASMRecordZone(   zoneName text not null,    serverChangeToken blob,    status integer default 0)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDASMRecordZone_zoneName on PDASMRecordZone (zoneName)", 0, 0, 0))
    {
      LOBYTE(a3) = 1;
      *a4 = 1;
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"zoneName";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_zoneName;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSNumber numberWithLong:self->_status];
  CFStringRef zoneName = &stru_1001F6580;
  serverChangeToken = self->_serverChangeToken;
  if (self->_zoneName) {
    CFStringRef zoneName = (const __CFString *)self->_zoneName;
  }
  v10[0] = zoneName;
  v9[0] = @"zoneName";
  v9[1] = @"serverChangeToken";
  id v6 = serverChangeToken;
  if (!serverChangeToken) {
    id v6 = objc_opt_new();
  }
  v9[2] = @"status";
  v10[1] = v6;
  v10[2] = v3;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  if (!serverChangeToken) {

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverChangeToken, 0);

  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end