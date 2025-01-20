@interface CLSMultipleChoiceAnswerItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (CLSMultipleChoiceAnswerItem)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)initWithCKRecord:(id)a3;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSMultipleChoiceAnswerItem

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(CLSMultipleChoiceAnswerItem *)self parentObjectID];
  v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

+ (id)entityName
{
  return @"CLSMultipleChoiceAnswerItem";
}

- (CLSMultipleChoiceAnswerItem)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSMultipleChoiceAnswerItem *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"itemText");
    [v6 setItemText:v8];

    v9 = sub_100003BF0(v4, @"displayOrder");
    objc_msgSend(v6, "setDisplayOrder:", objc_msgSend(v9, "integerValue"));
  }
  return (CLSMultipleChoiceAnswerItem *)v6;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSMultipleChoiceAnswerItem;
  id v4 = a3;
  [(CLSMultipleChoiceAnswerItem *)&v9 bindTo:v4];
  CFStringRef v10 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9.receiver, v9.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSMultipleChoiceAnswerItem *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = [(CLSMultipleChoiceAnswerItem *)self itemText];
  sub_10008C524((uint64_t)v4, v7, @"itemText");

  v8 = +[NSNumber numberWithInteger:[(CLSMultipleChoiceAnswerItem *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v8, @"displayOrder");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSMultipleChoiceAnswerItem (\n    objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    itemText          text,\n    displayOrder      integer,\nforeign key (parentObjectID) references CLSMultipleChoiceAnswerFormat(objectID) on delete cascade on update cascade\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSMultipleChoiceAnswerItem_objectID on CLSMultipleChoiceAnswerItem (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSMultipleChoiceAnswerItem_parentObjectID on CLSMultipleChoiceAnswerItem (parentObjectID)", 0, 0, 0))
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

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSMultipleChoiceAnswerItem *)self objectID];
  id v7 = v5;
  v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
}

+ (int64_t)migrationOrder
{
  return 5;
}

+ (id)recordType
{
  return @"CLSMultipleChoiceAnswerItem";
}

- (id)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"itemText"];
  v6 = [v4 objectForKeyedSubscript:@"displayOrder"];
  id v7 = [v6 integerValue];

  v8 = [(CLSMultipleChoiceAnswerItem *)self initWithText:v5];
  objc_super v9 = v8;
  if (v8)
  {
    [(CLSMultipleChoiceAnswerItem *)v8 _initCommonPropsWithRecord:v4];
    [(CLSMultipleChoiceAnswerItem *)v9 setDisplayOrder:v7];
  }

  return v9;
}

- (void)populate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSMultipleChoiceAnswerItem;
  id v4 = a3;
  [(CLSMultipleChoiceAnswerItem *)&v7 populate:v4];
  id v5 = [(CLSMultipleChoiceAnswerItem *)self itemText];
  [v4 setObject:v5 forKeyedSubscript:@"itemText"];

  v6 = +[NSNumber numberWithInteger:[(CLSMultipleChoiceAnswerItem *)self displayOrder]];
  [v4 setObject:v6 forKeyedSubscript:@"displayOrder"];

  [(CLSMultipleChoiceAnswerItem *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSMultipleChoiceAnswerItem *)self parentObjectID];
  if (v5)
  {
    v6 = [v4 select:objc_opt_class() identity:v5];
    objc_super v7 = v6;
    if (v6) {
      int64_t v8 = (int64_t)[v6 syncBackend:v4];
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)syncOrder
{
  return 5;
}

- (int64_t)syncableItemType
{
  return 0;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"multipleChoiceAnswerFormat";
}

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  CFStringRef v10 = objc_opt_new();
  v12 = v11;
  if (v7)
  {
    v43 = v11;
    v44 = v10;
    v13 = objc_alloc_init(PDDPPayload);
    [(PDDPPayload *)v13 setType:26];
    v14 = (char *)[v8 state] - 1;
    if ((unint64_t)v14 < 3) {
      uint64_t v15 = (v14 + 1);
    }
    else {
      uint64_t v15 = 0;
    }
    [(PDDPPayload *)v13 setAction:v15];
    v16 = [v7 parentObjectID];
    v17 = sub_10010EAA8(v9, v16);

    v18 = [v17 parentObjectID];
    v19 = sub_100066060(v9, v18);

    uint64_t v20 = objc_opt_class();
    v21 = [v19 objectID];
    v47 = v21;
    v22 = +[NSArray arrayWithObjects:&v47 count:1];
    v23 = [v9 select:v20 where:@"entityIdentity = ?" bindings:v22];

    if (!v23)
    {
      v24 = [v17 objectID];
      v25 = sub_10010E948(v9, v24);

      v42 = v25;
      v26 = sub_10002175C(v19, v17, v25);
      [(PDDPPayload *)v13 setSurveyStep:v26];

      v27 = [v19 objectID];
      v28 = sub_100065A04(v9, v27);

      v41 = v28;
      id v29 = [v28 mutableCopy];
      v30 = [(PDDPPayload *)v13 surveyStep];
      [v30 setClassIds:v29];

      v31 = [v19 parentObjectID];
      if (v31)
      {
        v40 = sub_1000BB474(v9, v31);
        v32 = +[CLSSurvey payloadForObject:v40 action:2 database:v9];
        v46 = v31;
        v33 = +[NSArray arrayWithObjects:&v46 count:1];
        sub_1000BB668(v9, v33, 1);

        v45[0] = v13;
        v45[1] = v32;
        v34 = +[NSArray arrayWithObjects:v45 count:2];
        [v44 addObjectsFromArray:v34];
      }
      else
      {
        [v44 addObject:v13];
      }
    }
    v12 = v43;
    CFStringRef v10 = v44;
  }
  else
  {
    CLSInitLog();
    v35 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      v37 = objc_opt_class();
      id v38 = v37;
      *(_DWORD *)buf = 138543618;
      v49 = v37;
      __int16 v50 = 2050;
      id v51 = [v8 state];
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "'%{public}@': Do not expect CLSMultipleChoiceAnswerItem object to be nil with action %{public}ld", buf, 0x16u);
    }
  }

  return v10;
}

@end