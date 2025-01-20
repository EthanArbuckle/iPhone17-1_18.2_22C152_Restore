@interface CLSInsightEvent
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (int64_t)migrationOrder;
- (id)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation CLSInsightEvent

+ (id)entityName
{
  return @"CLSInsightEvent";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"data");
  if (v5)
  {
    v6 = +[CLSInsightEvent supportedInfoDictionaryClasses];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v7 = +[NSArray arrayWithObjects:v19 count:4];
    v8 = +[NSSet setWithArray:v7];
    v9 = [v6 setByAddingObjectsFromSet:v8];

    v10 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v9 withData:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v10;
      [(CLSInsightEvent *)v11 _initCommonPropsWithDatabaseRow:v4];

      goto LABEL_10;
    }
  }
  CLSInitLog();
  v12 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v18 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to read insight event from db.", v18, 2u);
  }
  v13 = sub_100003BF0(v4, @"type");
  id v14 = [v13 integerValue];

  v15 = [(CLSInsightEvent *)self initWithType:v14];
  v16 = v15;
  if (v15) {
    [(CLSInsightEvent *)v15 _initCommonPropsWithDatabaseRow:v4];
  }
  self = v16;
  v11 = self;
LABEL_10:

  return v11;
}

- (void)bindTo:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSInsightEvent;
  id v4 = a3;
  [(CLSInsightEvent *)&v10 bindTo:v4];
  id v9 = 0;
  v5 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  id v6 = v9;
  if (v6)
  {
    CLSInitLog();
    v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to write insight event to db: %@.", buf, 0xCu);
    }
  }
  sub_10008C524((uint64_t)v4, v5, @"data");
  v8 = +[NSNumber numberWithInteger:[(CLSInsightEvent *)self type]];
  sub_10008C524((uint64_t)v4, v8, @"type");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table CLSInsightEvent(   objectID           text not null,    dateCreated        real not null,    dateLastModified   real not null,    appIdentifier      text,    type               integer,    data               blob)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSInsightEvent_objectID on CLSInsightEvent (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 1;
      *a4 = 1;
    }
  }

  return a3;
}

+ (int64_t)migrationOrder
{
  return 5;
}

@end