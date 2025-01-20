@interface CLSBlob
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (CLSBlob)initWithCKRecord:(id)a3;
- (NSString)parentReferenceName;
- (id)initWithDatabaseRow:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSBlob

+ (id)recordType
{
  return @"CLSBlob";
}

- (CLSBlob)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSBlob *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    v7 = [v4 objectForKeyedSubscript:CLSBlobPropertyType];
    if (!v7)
    {
      CLSInitLog();
      v8 = CLSLogSync;
      if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLSBlob synced from CloudKit is missing type information", v11, 2u);
      }
    }
    objc_msgSend(v6, "setType:", objc_msgSend(v7, "intValue"));
    v9 = [v4 objectForKeyedSubscript:CLSBlobPropertyData];
    [v6 setData:v9];
  }
  return (CLSBlob *)v6;
}

- (void)populate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSBlob;
  id v4 = a3;
  [(CLSBlob *)&v7 populate:v4];
  id v5 = +[NSNumber numberWithInt:[(CLSBlob *)self type]];
  [v4 setObject:v5 forKeyedSubscript:CLSBlobPropertyType];

  v6 = [(CLSBlob *)self data];
  [v4 setObject:v6 forKeyedSubscript:CLSBlobPropertyData];

  [(CLSBlob *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncOrder
{
  return 15;
}

- (int64_t)syncableItemType
{
  return 1;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"parentContext";
}

+ (id)entityName
{
  return @"CLSBlob";
}

- (id)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSBlob *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    objc_super v7 = sub_100003BF0(v4, CLSPredicateKeyPathParentObjectID);
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", objc_msgSend(v8, "intValue"));

    v9 = sub_100003BF0(v4, @"data");
    [v6 setData:v9];
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSBlob;
  id v4 = a3;
  [(CLSBlob *)&v9 bindTo:v4];
  CFStringRef v10 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9.receiver, v9.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSBlob *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, CLSPredicateKeyPathParentObjectID);

  objc_super v7 = +[NSNumber numberWithInt:[(CLSBlob *)self type]];
  sub_10008C524((uint64_t)v4, v7, @"type");

  v8 = [(CLSBlob *)self data];
  sub_10008C524((uint64_t)v4, v8, @"data");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSBlob(   objectID          text not null,    parentObjectID    text not null,    dateCreated       real not null,    dateLastModified  real not null,    type              integer,    data              blob not null,    foreign key (parentObjectID) references CLSContext(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSBlob_objectID on CLSBlob (objectID)", 0, 0, 0))
    {
      a3 = 1;
LABEL_2:
      *a4 = a3;
      LOBYTE(a3) = 1;
    }
  }

  return a3;
}

+ (int64_t)migrationOrder
{
  return 2;
}

@end