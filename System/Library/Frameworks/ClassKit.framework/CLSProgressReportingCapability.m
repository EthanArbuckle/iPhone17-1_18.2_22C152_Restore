@interface CLSProgressReportingCapability
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (CLSProgressReportingCapability)initWithCKRecord:(id)a3;
- (CLSProgressReportingCapability)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSProgressReportingCapability

+ (id)entityName
{
  return @"CLSProgressReportingCapability";
}

- (CLSProgressReportingCapability)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = (CLSProgressReportingCapability *)[(CLSProgressReportingCapability *)self _init];
  v6 = v5;
  if (v5)
  {
    [(CLSProgressReportingCapability *)v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, CLSPredicateKeyPathParentObjectID);
    [(CLSProgressReportingCapability *)v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, CLSProgressReportingCapabilityPropertyKind);
    -[CLSProgressReportingCapability setKind:](v6, "setKind:", (int)[v8 intValue]);

    v9 = sub_100003BF0(v4, CLSProgressReportingCapabilityPropertyDetails);
    [(CLSProgressReportingCapability *)v6 setDetails:v9];
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSProgressReportingCapability;
  id v4 = a3;
  [(CLSProgressReportingCapability *)&v9 bindTo:v4];
  CFStringRef v10 = @"appIdentifier";
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9.receiver, v9.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSProgressReportingCapability *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, CLSPredicateKeyPathParentObjectID);

  v7 = +[NSNumber numberWithInteger:[(CLSProgressReportingCapability *)self kind]];
  sub_10008C524((uint64_t)v4, v7, CLSProgressReportingCapabilityPropertyKind);

  v8 = [(CLSProgressReportingCapability *)self details];
  sub_10008C524((uint64_t)v4, v8, CLSProgressReportingCapabilityPropertyDetails);
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSProgressReportingCapability(   objectID          text not null,    parentObjectID    text not null,    dateCreated       real not null,    dateLastModified  real not null,    kind              integer,    details           text,    foreign key (parentObjectID) references CLSContext(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSProgressReportingCapability_objectID on CLSProgressReportingCapability (objectID)", 0, 0, 0))
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

+ (id)recordType
{
  return @"CLSProgressReportingCapability";
}

- (CLSProgressReportingCapability)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = (CLSProgressReportingCapability *)[(CLSProgressReportingCapability *)self _init];
  v6 = v5;
  if (v5)
  {
    [(CLSProgressReportingCapability *)v5 _initCommonPropsWithRecord:v4];
    id v7 = [v4 objectForKeyedSubscript:CLSProgressReportingCapabilityPropertyKind];
    if (!v7)
    {
      CLSInitLog();
      v8 = CLSLogSync;
      if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLSProgressReportingCapability synced from CloudKit is missing kind information", v11, 2u);
      }
    }
    -[CLSProgressReportingCapability setKind:](v6, "setKind:", (int)[v7 intValue]);
    objc_super v9 = [v4 objectForKeyedSubscript:CLSProgressReportingCapabilityPropertyDetails];
    [(CLSProgressReportingCapability *)v6 setDetails:v9];
  }
  return v6;
}

- (void)populate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSProgressReportingCapability;
  id v4 = a3;
  [(CLSProgressReportingCapability *)&v7 populate:v4];
  v5 = +[NSNumber numberWithInteger:[(CLSProgressReportingCapability *)self kind]];
  [v4 setObject:v5 forKeyedSubscript:CLSProgressReportingCapabilityPropertyKind];

  v6 = [(CLSProgressReportingCapability *)self details];
  [v4 setObject:v6 forKeyedSubscript:CLSProgressReportingCapabilityPropertyDetails];

  [(CLSProgressReportingCapability *)self updateParentReferencesForRecord:v4];
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

@end