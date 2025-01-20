@interface CLSTimeInterval
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int)entityType;
+ (int)syncType;
+ (int64_t)migrationOrder;
- (CLSTimeInterval)initWithCKRecord:(id)a3;
- (NSString)parentReferenceName;
- (id)generateInsightEventsWithDatabase:(id)a3;
- (id)initWithDatabaseRow:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSTimeInterval

+ (int)syncType
{
  return 1;
}

+ (int)entityType
{
  return 1;
}

+ (id)recordType
{
  return @"CLSTimeInterval";
}

- (CLSTimeInterval)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSTimeInterval *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    v7 = [v4 objectForKeyedSubscript:@"startTime"];
    [v6 setStartTime:v7];

    v8 = [v4 objectForKeyedSubscript:@"length"];
    [v8 doubleValue];
    objc_msgSend(v6, "setLength:");
  }
  return (CLSTimeInterval *)v6;
}

- (void)populate:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSTimeInterval;
  [(CLSTimeInterval *)&v22 populate:v5];
  v6 = [v5 objectForKeyedSubscript:@"startTime"];
  if (!v6)
  {
    v3 = [(CLSTimeInterval *)self startTime];
    if (!v3) {
      goto LABEL_13;
    }
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"startTime"];
  if (!v7)
  {
LABEL_9:
    if (!v6) {

    }
    goto LABEL_12;
  }
  v8 = (void *)v7;
  uint64_t v9 = [(CLSTimeInterval *)self startTime];
  if (!v9)
  {

    goto LABEL_9;
  }
  v10 = (void *)v9;
  v11 = [v5 objectForKeyedSubscript:@"startTime"];
  v12 = [(CLSTimeInterval *)self startTime];
  unsigned __int8 v13 = [v11 isEqualToDate:v12];

  if (v6)
  {

    if (v13) {
      goto LABEL_13;
    }
LABEL_12:
    v14 = [(CLSTimeInterval *)self startTime];
    [v5 setObject:v14 forKeyedSubscript:@"startTime"];

    goto LABEL_13;
  }

  if ((v13 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_13:
  [(CLSTimeInterval *)self length];
  uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v16 = [v5 objectForKeyedSubscript:@"length"];
  if (v16 | v15)
  {
    v17 = (void *)v16;
    v18 = [v5 objectForKeyedSubscript:@"length"];
    v19 = v18;
    if (v18 && v15)
    {
      v20 = [v5 objectForKeyedSubscript:@"length"];
      unsigned __int8 v21 = [v20 isEqualToNumber:v15];

      if (v21) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    [v5 setObject:v15 forKeyedSubscript:@"length"];
  }
LABEL_20:
  [(CLSTimeInterval *)self updateParentReferencesForRecord:v5];
}

- (int64_t)syncOrder
{
  return 20;
}

- (int64_t)syncableItemType
{
  return 1;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"activity";
}

- (id)generateInsightEventsWithDatabase:(id)a3
{
  id v4 = a3;
  [(CLSTimeInterval *)self length];
  if (v5 < 1.0)
  {
LABEL_14:
    id v12 = &__NSArray0__struct;
    goto LABEL_15;
  }
  uint64_t v7 = objc_opt_class();
  v8 = [(CLSTimeInterval *)self parentObjectID];
  uint64_t v9 = [v4 select:v7 identity:v8];

  if (!v9)
  {
    CLSInitLog();
    v19 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v21 = v19;
      objc_super v22 = [(CLSTimeInterval *)self parentObjectID];
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "CLSTimeInterval failed to find parent activity: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v10 = [(CLSTimeInterval *)self objectID];
  v11 = sub_10004C864(v4, v9, 202, v10);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v17, "setTimeIntervalInfo:", self, (void)v23);
        v18 = [(CLSTimeInterval *)self parentObjectID];
        [v17 setParentObjectID:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

LABEL_15:

  return v12;
}

+ (id)entityName
{
  return @"CLSTimeInterval";
}

- (id)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSTimeInterval *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    uint64_t v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    v8 = sub_1001630C8(v4, @"startTime");
    [v6 setStartTime:v8];

    uint64_t v9 = sub_100003BF0(v4, @"length");
    [v9 doubleValue];
    objc_msgSend(v6, "setLength:");
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSTimeInterval;
  id v4 = a3;
  [(CLSTimeInterval *)&v8 bindTo:v4];
  id v5 = [(CLSTimeInterval *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  v6 = [(CLSTimeInterval *)self startTime];
  sub_10008C524((uint64_t)v4, v6, @"startTime");

  [(CLSTimeInterval *)self length];
  uint64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v7, @"length");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table CLSTimeInterval(   objectID          text not null,    parentObjectID    text not null,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    startTime         real not null,    length            real not null,    foreign key (parentObjectID) references CLSActivity(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSTimeInterval_objectID on CLSTimeInterval (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index CLSTimeInterval_parentObjectID on CLSTimeInterval (parentObjectID)", 0, 0, 0))
      {
        LOBYTE(a3) = 1;
        *a4 = 1;
      }
    }
  }

  return a3;
}

+ (int64_t)migrationOrder
{
  return 2;
}

@end