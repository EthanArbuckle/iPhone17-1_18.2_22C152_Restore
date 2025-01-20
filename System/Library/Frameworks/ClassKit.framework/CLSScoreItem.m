@interface CLSScoreItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int)entityType;
+ (int)syncType;
+ (int64_t)migrationOrder;
- (CLSScoreItem)initWithCKRecord:(id)a3;
- (CLSScoreItem)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)generateInsightEventsWithDatabase:(id)a3;
- (id)generateReportFromDataInDatabase:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)_populateReportItem:(id)a3;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSScoreItem

- (id)generateInsightEventsWithDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = [(CLSScoreItem *)self parentObjectID];
  v8 = [v4 select:v6 identity:v7];

  if (v8)
  {
    v9 = [(CLSScoreItem *)self objectID];
    v10 = sub_10004C864(v4, v8, 201, v9);

    v11 = [(CLSScoreItem *)self generateReportFromDataInDatabase:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v10;
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
          objc_msgSend(v17, "setActivityItemInfo:", v11, (void)v23);
          v18 = [(CLSScoreItem *)self parentObjectID];
          [v17 setParentObjectID:v18];
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }
  }
  else
  {
    CLSInitLog();
    v19 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v21 = v19;
      v22 = [(CLSScoreItem *)self parentObjectID];
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "CLSScoreItem failed to find parent activity: %@", buf, 0xCu);
    }
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

+ (id)entityName
{
  return @"CLSScoreItem";
}

- (CLSScoreItem)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"identifier");
  uint64_t v6 = sub_100003BF0(v4, @"title");
  v7 = sub_100003BF0(v4, @"score");
  [v7 doubleValue];
  double v9 = v8;

  v10 = sub_100003BF0(v4, @"maxScore");
  [v10 doubleValue];
  double v12 = v11;

  id v13 = [(CLSScoreItem *)self initWithIdentifier:v5 title:v6 score:v9 maxScore:v12];
  id v14 = v13;
  if (v13)
  {
    [(CLSScoreItem *)v13 _initCommonPropsWithDatabaseRow:v4];
    uint64_t v15 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSScoreItem *)v14 setParentObjectID:v15];
  }
  return v14;
}

- (void)bindTo:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSScoreItem;
  id v4 = a3;
  [(CLSScoreItem *)&v10 bindTo:v4];
  v5 = [(CLSScoreItem *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  uint64_t v6 = [(CLSScoreItem *)self identifier];
  sub_10008C524((uint64_t)v4, v6, @"identifier");

  v7 = [(CLSScoreItem *)self title];
  sub_10008C524((uint64_t)v4, v7, @"title");

  [(CLSScoreItem *)self score];
  double v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v8, @"score");

  [(CLSScoreItem *)self maxScore];
  double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v9, @"maxScore");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  double v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table CLSScoreItem(   objectID           text not null,    parentObjectID     text not null,    appIdentifier      text not null,    dateCreated        real not null,    identifier         text not null,    dateLastModified   real not null,    title              text,    score              real,    maxScore           real,    foreign key(parentObjectID) references CLSActivity(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSScoreItem_objectID on CLSScoreItem (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index CLSScoreItem_parentObjectID on CLSScoreItem (parentObjectID)", 0, 0, 0))
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
  return 3;
}

+ (int)syncType
{
  return 3;
}

+ (int)entityType
{
  return 5;
}

+ (id)recordType
{
  return @"CLSScoreItem";
}

- (CLSScoreItem)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"identifier"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"title"];
  id v7 = [v4 objectForKeyedSubscript:@"score"];
  [v7 doubleValue];
  double v9 = v8;
  objc_super v10 = [v4 objectForKeyedSubscript:@"maxScore"];
  [v10 doubleValue];
  double v12 = [(CLSScoreItem *)self initWithIdentifier:v5 title:v6 score:v9 maxScore:v11];

  if (v12)
  {
    [(CLSScoreItem *)v12 _initCommonPropsWithRecord:v4];
    id v13 = [v4 objectForKeyedSubscript:@"identifier"];
    [(CLSScoreItem *)v12 setIdentifier:v13];

    id v14 = [v4 objectForKeyedSubscript:@"title"];
    [(CLSScoreItem *)v12 setTitle:v14];
  }
  return v12;
}

- (void)populate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSScoreItem;
  id v4 = a3;
  [(CLSScoreItem *)&v9 populate:v4];
  v5 = [(CLSScoreItem *)self identifier];
  [v4 setObject:v5 forKeyedSubscript:@"identifier"];

  uint64_t v6 = [(CLSScoreItem *)self title];
  [v4 setObject:v6 forKeyedSubscript:@"title"];

  [(CLSScoreItem *)self score];
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v7 forKeyedSubscript:@"score"];

  [(CLSScoreItem *)self maxScore];
  double v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:@"maxScore"];

  [(CLSScoreItem *)self updateParentReferencesForRecord:v4];
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

- (id)generateReportFromDataInDatabase:(id)a3
{
  id v4 = objc_opt_new();
  [(CLSScoreItem *)self _populateReportItem:v4];

  return v4;
}

- (void)_populateReportItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLSScoreItem;
  id v4 = a3;
  [(CLSScoreItem *)&v5 _populateReportItem:v4];
  [(CLSScoreItem *)self score];
  objc_msgSend(v4, "setValue:");
  [(CLSScoreItem *)self maxScore];
  objc_msgSend(v4, "setMaxValue:");
}

@end