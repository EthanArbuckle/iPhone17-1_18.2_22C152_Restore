@interface CLSQuantityItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int)entityType;
+ (int)syncType;
+ (int64_t)migrationOrder;
- (CLSQuantityItem)initWithCKRecord:(id)a3;
- (CLSQuantityItem)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)generateInsightEventsWithDatabase:(id)a3;
- (id)generateReportFromDataInDatabase:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)_populateReportItem:(id)a3;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSQuantityItem

+ (id)recordType
{
  return @"CLSQuantityItem";
}

- (CLSQuantityItem)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"identifier"];
  v6 = [v4 objectForKeyedSubscript:@"title"];
  v7 = [(CLSQuantityItem *)self initWithIdentifier:v5 title:v6];

  if (v7)
  {
    [(CLSQuantityItem *)v7 _initCommonPropsWithRecord:v4];
    v8 = [v4 objectForKeyedSubscript:@"quantity"];
    [v8 doubleValue];
    -[CLSQuantityItem setQuantity:](v7, "setQuantity:");
  }
  return v7;
}

- (void)populate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSQuantityItem;
  id v4 = a3;
  [(CLSQuantityItem *)&v8 populate:v4];
  v5 = [(CLSQuantityItem *)self identifier];
  [v4 setObject:v5 forKeyedSubscript:@"identifier"];

  v6 = [(CLSQuantityItem *)self title];
  [v4 setObject:v6 forKeyedSubscript:@"title"];

  [(CLSQuantityItem *)self quantity];
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v7 forKeyedSubscript:@"quantity"];

  [(CLSQuantityItem *)self updateParentReferencesForRecord:v4];
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
  v7 = [(CLSQuantityItem *)self parentObjectID];
  objc_super v8 = [v4 select:v6 identity:v7];

  if (v8)
  {
    v9 = [(CLSQuantityItem *)self objectID];
    v10 = sub_10004C864(v4, v8, 204, v9);

    v11 = [(CLSQuantityItem *)self generateReportFromDataInDatabase:v4];
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
          v18 = [(CLSQuantityItem *)self parentObjectID];
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
      v22 = [(CLSQuantityItem *)self parentObjectID];
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "CLSQuantityItem failed to find parent activity: %@", buf, 0xCu);
    }
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

+ (int)syncType
{
  return 3;
}

+ (int)entityType
{
  return 3;
}

+ (id)entityName
{
  return @"CLSQuantityItem";
}

- (CLSQuantityItem)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"identifier");
  uint64_t v6 = sub_100003BF0(v4, @"title");
  v7 = [(CLSQuantityItem *)self initWithIdentifier:v5 title:v6];
  objc_super v8 = v7;
  if (v7)
  {
    [(CLSQuantityItem *)v7 _initCommonPropsWithDatabaseRow:v4];
    v9 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSQuantityItem *)v8 setParentObjectID:v9];

    v10 = sub_100003BF0(v4, @"quantity");
    [v10 doubleValue];
    -[CLSQuantityItem setQuantity:](v8, "setQuantity:");
  }
  return v8;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSQuantityItem;
  id v4 = a3;
  [(CLSQuantityItem *)&v9 bindTo:v4];
  v5 = [(CLSQuantityItem *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  uint64_t v6 = [(CLSQuantityItem *)self identifier];
  sub_10008C524((uint64_t)v4, v6, @"identifier");

  v7 = [(CLSQuantityItem *)self title];
  sub_10008C524((uint64_t)v4, v7, @"title");

  [(CLSQuantityItem *)self quantity];
  objc_super v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v8, @"quantity");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table CLSQuantityItem(   objectID          text not null,    parentObjectID    text not null,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    identifier        text not null,    quantity          real,    title             text,    foreign key(parentObjectID) references CLSActivity(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSQuantityItem_objectID on CLSQuantityItem (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index CLSQuantityItem_parentObjectID on CLSQuantityItem (parentObjectID)", 0, 0, 0))
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

- (id)generateReportFromDataInDatabase:(id)a3
{
  id v4 = objc_opt_new();
  [(CLSQuantityItem *)self _populateReportItem:v4];

  return v4;
}

- (void)_populateReportItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLSQuantityItem;
  id v4 = a3;
  [(CLSQuantityItem *)&v5 _populateReportItem:v4];
  [(CLSQuantityItem *)self quantity];
  objc_msgSend(v4, "setQuantity:");
}

@end