@interface PDConfig
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (int64_t)migrationOrder;
- (PDConfig)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (id)dictionaryRepresentation;
- (void)bindTo:(id)a3;
@end

@implementation PDConfig

+ (NSString)entityName
{
  return (NSString *)@"PDConfig";
}

- (PDConfig)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v13.receiver = self;
  v13.super_class = (Class)PDConfig;
  v5 = [(PDConfig *)&v13 init];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"mayRecordUserActivity");
    v5->_mayRecordUserActivity = [v6 BOOLValue];

    v7 = sub_100003BF0(v4, @"maySyncWithCloudKit");
    v5->_maySyncWithCloudKit = [v7 BOOLValue];

    v8 = sub_100003BF0(v4, @"maySendToIngest");
    v5->_maySendToIngest = [v8 BOOLValue];

    v9 = sub_100003BF0(v4, @"isContextTrackingAllowed");
    v5->_contextTrackingAllowed = [v9 BOOLValue];

    v10 = sub_100003BF0(v4, @"cloudKitSyncFetchGracePeriod");
    [v10 doubleValue];
    v5->_cloudKitSyncFetchGracePeriod = v11;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v5 = [(PDConfig *)self identityValue];
  sub_10008C524((uint64_t)v4, v5, @"identity");

  v6 = +[NSNumber numberWithBool:self->_mayRecordUserActivity];
  sub_10008C524((uint64_t)v4, v6, @"mayRecordUserActivity");

  v7 = +[NSNumber numberWithBool:self->_maySyncWithCloudKit];
  sub_10008C524((uint64_t)v4, v7, @"maySyncWithCloudKit");

  v8 = +[NSNumber numberWithBool:self->_maySendToIngest];
  sub_10008C524((uint64_t)v4, v8, @"maySendToIngest");

  v9 = +[NSNumber numberWithBool:self->_contextTrackingAllowed];
  sub_10008C524((uint64_t)v4, v9, @"isContextTrackingAllowed");

  id v10 = +[NSNumber numberWithDouble:self->_cloudKitSyncFetchGracePeriod];
  sub_10008C524((uint64_t)v4, v10, @"cloudKitSyncFetchGracePeriod");
}

+ (int64_t)migrationOrder
{
  return 1;
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDConfig(   identity text not null,    mayRecordUserActivity integer not null,    isContextTrackingAllowed integer not null,    maySyncWithCloudKit integer not null,    maySendToIngest integer not null,    cloudKitSyncFetchGracePeriod real not null)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDConfig_identity on PDConfig (identity)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"insert into PDConfig (identity, mayRecordUserActivity, isContextTrackingAllowed, maySyncWithCloudKit, maySendToIngest, cloudKitSyncFetchGracePeriod) values (?,?,?,?,?,?)", 0, &off_10020B140, 0))
      {
        a3 = 1;
LABEL_2:
        *a4 = a3;
        LOBYTE(a3) = 1;
      }
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"identity";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)@"There can be only one!⚡️⚡️⚡️";
}

- (id)dictionaryRepresentation
{
  v10[0] = @"mayRecordUserActivity";
  v3 = +[NSNumber numberWithBool:self->_mayRecordUserActivity];
  v11[0] = v3;
  v10[1] = @"maySyncWithCloudKit";
  id v4 = +[NSNumber numberWithBool:self->_maySyncWithCloudKit];
  v11[1] = v4;
  v10[2] = @"maySendToIngest";
  v5 = +[NSNumber numberWithBool:self->_maySendToIngest];
  v11[2] = v5;
  v10[3] = @"isContextTrackingAllowed";
  v6 = +[NSNumber numberWithBool:self->_contextTrackingAllowed];
  v11[3] = v6;
  v10[4] = @"cloudKitSyncFetchGracePeriod";
  id v7 = +[NSNumber numberWithDouble:self->_cloudKitSyncFetchGracePeriod];
  v11[4] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

@end