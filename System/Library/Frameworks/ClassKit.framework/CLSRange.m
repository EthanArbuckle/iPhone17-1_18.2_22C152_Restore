@interface CLSRange
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int)entityType;
+ (int)syncType;
+ (int64_t)migrationOrder;
- (CLSRange)initWithCKRecord:(id)a3;
- (CLSRange)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)generateInsightEventsWithDatabase:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSRange

+ (id)entityName
{
  return @"CLSRange";
}

- (CLSRange)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"start");
  [v5 doubleValue];
  double v7 = v6;

  v8 = sub_100003BF0(v4, @"end");
  [v8 doubleValue];
  double v10 = v9;

  v11 = [(CLSRange *)self initWithStart:v7 end:v10];
  v12 = v11;
  if (v11)
  {
    [(CLSRange *)v11 _initCommonPropsWithDatabaseRow:v4];
    v13 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSRange *)v12 setParentObjectID:v13];
  }
  return v12;
}

- (void)bindTo:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSRange;
  id v4 = a3;
  [(CLSRange *)&v8 bindTo:v4];
  v5 = [(CLSRange *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  [(CLSRange *)self start];
  double v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v6, @"start");

  [(CLSRange *)self end];
  double v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v7, @"end");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table CLSRange(   objectID          text not null,    parentObjectID    text not null,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    start             real not null,    end               real not null,    foreign key (parentObjectID) references CLSActivity(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSRange_objectID on CLSRange (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index CLSRange_parentObjectID on CLSRange (parentObjectID)", 0, 0, 0))
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

+ (id)recordType
{
  return @"CLSRange";
}

- (CLSRange)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"start"];
  [v5 doubleValue];
  double v7 = v6;
  objc_super v8 = [v4 objectForKeyedSubscript:@"end"];
  [v8 doubleValue];
  double v10 = [(CLSRange *)self initWithStart:v7 end:v9];

  if (v10) {
    [(CLSRange *)v10 _initCommonPropsWithRecord:v4];
  }

  return v10;
}

- (void)populate:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLSRange;
  [(CLSRange *)&v19 populate:v4];
  [(CLSRange *)self end];
  uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v6 = [v4 objectForKeyedSubscript:@"end"];
  if (v6 | v5)
  {
    double v7 = (void *)v6;
    objc_super v8 = [v4 objectForKeyedSubscript:@"end"];
    double v9 = v8;
    if (v8 && v5)
    {
      double v10 = [v4 objectForKeyedSubscript:@"end"];
      unsigned __int8 v11 = [v10 isEqualToNumber:v5];

      if (v11) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    [v4 setObject:v5 forKeyedSubscript:@"end"];
  }
LABEL_8:
  [(CLSRange *)self start];
  uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v13 = [v4 objectForKeyedSubscript:@"start"];
  if (v13 | v12)
  {
    v14 = (void *)v13;
    v15 = [v4 objectForKeyedSubscript:@"start"];
    v16 = v15;
    if (v15 && v12)
    {
      v17 = [v4 objectForKeyedSubscript:@"start"];
      unsigned __int8 v18 = [v17 isEqualToNumber:v12];

      if (v18) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    [v4 setObject:v12 forKeyedSubscript:@"start"];
  }
LABEL_15:
  [(CLSRange *)self updateParentReferencesForRecord:v4];
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
  uint64_t v6 = objc_opt_class();
  double v7 = [(CLSRange *)self parentObjectID];
  objc_super v8 = [v4 select:v6 identity:v7];

  if (v8)
  {
    double v9 = [(CLSRange *)self objectID];
    double v10 = sub_10004C864(v4, v8, 205, v9);

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v16, "setRangeInfo:", self, (void)v22);
          v17 = [(CLSRange *)self parentObjectID];
          [v16 setParentObjectID:v17];
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
  else
  {
    CLSInitLog();
    unsigned __int8 v18 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v20 = v18;
      v21 = [(CLSRange *)self parentObjectID];
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "CLSRange failed to find parent activity: %@", buf, 0xCu);
    }
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

+ (int)syncType
{
  return 4;
}

+ (int)entityType
{
  return 6;
}

@end