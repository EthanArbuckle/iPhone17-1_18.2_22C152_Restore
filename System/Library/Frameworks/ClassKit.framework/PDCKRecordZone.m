@interface PDCKRecordZone
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDCKRecordZone)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (void)bindTo:(id)a3;
@end

@implementation PDCKRecordZone

+ (NSString)entityName
{
  return (NSString *)@"PDCKRecordZone";
}

- (PDCKRecordZone)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v14.receiver = self;
  v14.super_class = (Class)PDCKRecordZone;
  v5 = [(PDCKRecordZone *)&v14 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"zoneName");
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    uint64_t v8 = sub_100003BF0(v4, @"clientChangeTokenData");
    clientChangeTokenData = v5->_clientChangeTokenData;
    v5->_clientChangeTokenData = (NSData *)v8;

    v10 = sub_100003BF0(v4, @"serverChangeToken");
    if (v10)
    {
      v11 = (CKServerChangeToken *)[objc_alloc((Class)CKServerChangeToken) initWithData:v10];
      serverChangeToken = v5->_serverChangeToken;
      v5->_serverChangeToken = v11;
    }
  }

  return v5;
}

- (void)bindTo:(id)a3
{
  id v6 = a3;
  sub_10008C524((uint64_t)v6, self->_zoneName, @"zoneName");
  sub_10008C524((uint64_t)v6, self->_clientChangeTokenData, @"clientChangeTokenData");
  serverChangeToken = self->_serverChangeToken;
  if (serverChangeToken)
  {
    v5 = [(CKServerChangeToken *)serverChangeToken data];
  }
  else
  {
    v5 = 0;
  }
  sub_10008C524((uint64_t)v6, v5, @"serverChangeToken");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table PDCKRecordZone(   zoneName text not null,    serverChangeToken blob,    clientChangeTokenData blob)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDCKRecordZone_zoneName on PDCKRecordZone (zoneName)", 0, 0, 0))
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);

  objc_storeStrong((id *)&self->_serverChangeToken, 0);
}

@end