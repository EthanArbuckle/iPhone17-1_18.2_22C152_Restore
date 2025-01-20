@interface CLSSurvey
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)hashableColumnNames;
+ (id)payloadForObject:(id)a3 action:(int)a4 database:(id)a5;
+ (id)payloadsForDeletedSurvey:(id)a3 classIDs:(id)a4 database:(id)a5;
+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (CLSSurvey)initWithCKRecord:(id)a3;
- (CLSSurvey)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSSurvey

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(CLSSurvey *)self parentObjectID];
  v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

+ (id)entityName
{
  return @"CLSSurvey";
}

+ (id)hashableColumnNames
{
  v4[0] = @"rowid";
  v4[1] = @"dateLastModified";
  v4[2] = @"surveyUpdateStatus";
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (CLSSurvey)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSSurvey *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", (int)objc_msgSend(v8, "intValue"));

    v9 = sub_100003BF0(v4, @"title");
    [v6 setTitle:v9];

    v10 = sub_100003BF0(v4, @"authorID");
    [v6 setAuthorID:v10];

    v11 = sub_1001630C8(v4, @"studentFirstSubmissionDate");
    [v6 setStudentFirstSubmissionDate:v11];

    v12 = sub_1001630C8(v4, @"teacherLastModifiedDate");
    [v6 setTeacherLastModifiedDate:v12];

    v13 = sub_100003BF0(v4, @"serverETag");
    [v6 setServerETag:v13];

    v14 = sub_100003BF0(v4, @"surveyUpdateStatus");
    objc_msgSend(v6, "setSurveyUpdateStatus:", objc_msgSend(v14, "integerValue"));
  }
  return (CLSSurvey *)v6;
}

- (void)bindTo:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLSSurvey;
  id v4 = a3;
  [(CLSSurvey *)&v14 bindTo:v4];
  CFStringRef v15 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1, v14.receiver, v14.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSSurvey *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = +[NSNumber numberWithInteger:[(CLSSurvey *)self type]];
  sub_10008C524((uint64_t)v4, v7, @"type");

  v8 = [(CLSSurvey *)self title];
  sub_10008C524((uint64_t)v4, v8, @"title");

  v9 = [(CLSSurvey *)self authorID];
  sub_10008C524((uint64_t)v4, v9, @"authorID");

  v10 = [(CLSSurvey *)self serverETag];
  sub_10008C524((uint64_t)v4, v10, @"serverETag");

  v11 = [(CLSSurvey *)self teacherLastModifiedDate];
  sub_10008C524((uint64_t)v4, v11, @"teacherLastModifiedDate");

  v12 = [(CLSSurvey *)self studentFirstSubmissionDate];
  sub_10008C524((uint64_t)v4, v12, @"studentFirstSubmissionDate");

  v13 = +[NSNumber numberWithInteger:[(CLSSurvey *)self surveyUpdateStatus]];
  sub_10008C524((uint64_t)v4, v13, @"surveyUpdateStatus");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSSurvey (\n    objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    title             text not null,\n    authorID          text not null,\n    type              integer,\n    serverETag        text,\n    teacherLastModifiedDate     real,\n    studentFirstSubmissionDate  real,\n    surveyUpdateStatus  integer,\n    foreign key (parentObjectID) references CLSHandoutAttachment(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSSurvey_objectID on CLSSurvey (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSSurvey_parentObjectID on CLSSurvey (parentObjectID)", 0, 0, 0))
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

+ (int64_t)migrationOrder
{
  return 2;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSSurvey *)self objectID];
  v6 = [v4 select:objc_opt_class() identity:v5];
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = v6[2];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    v9 = (id *)objc_opt_new();
    v6 = v9;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v10, v5, 8);
    }
  }
  v11 = sub_1000BB1D8(v4, v5);
  [v7 addObjectsFromArray:v11];

  v12 = [v7 allObjects];
  sub_100075F40((uint64_t)v6, v12);

  if ([v4 insertOrUpdateObject:v6])
  {
    v23 = v5;
    v13 = +[NSArray arrayWithObjects:&v23 count:1];
    objc_super v14 = objc_opt_new();
    CFStringRef v15 = objc_opt_new();
    v17 = v15;
    if (v15) {
      objc_setProperty_nonatomic_copy(v15, v16, v5, 8);
    }
    uint64_t v18 = objc_opt_class();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000BB2C0;
    v21[3] = &unk_1001F3038;
    id v22 = v14;
    id v19 = v14;
    [v4 selectAll:v18 where:@"parentObjectID = ?" bindings:v13 block:v21];
    v20 = [v19 allObjects];
    sub_100075F40((uint64_t)v17, v20);

    [v4 insertOrUpdateObject:v17];
    [v4 deleteAllWithoutTracking:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
  }
}

+ (id)recordType
{
  return @"CLSSurvey";
}

- (CLSSurvey)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"type"];
  if (v5)
  {
    uint64_t v6 = CLSSurveyTypeFromString();
    id v7 = [v4 objectForKeyedSubscript:@"authorID"];
    id v8 = [(CLSSurvey *)self initWithType:v6 authorID:v7];
    v9 = v8;
    if (v8)
    {
      [(CLSSurvey *)v8 _initCommonPropsWithRecord:v4];
      v10 = [v4 objectForKeyedSubscript:@"title"];
      [(CLSSurvey *)v9 setTitle:v10];
    }
    self = v9;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)populate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSSurvey;
  id v4 = a3;
  [(CLSSurvey *)&v8 populate:v4];
  id v5 = [(CLSSurvey *)self authorID];
  [v4 setObject:v5 forKeyedSubscript:@"authorID"];

  [(CLSSurvey *)self type];
  uint64_t v6 = NSStringFromSurveyType();
  [v4 setObject:v6 forKeyedSubscript:@"type"];

  id v7 = [(CLSSurvey *)self title];
  [v4 setObject:v7 forKeyedSubscript:@"title"];

  [(CLSSurvey *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSSurvey *)self parentObjectID];
  if (v5)
  {
    uint64_t v6 = [v4 select:objc_opt_class() identity:v5];
    id v7 = v6;
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
  return 3;
}

- (int64_t)syncableItemType
{
  return 0;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"owner";
}

+ (id)payloadForObject:(id)a3 action:(int)a4 database:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  v9 = [v8 objectID];
  v10 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v10 setType:25];
  [(PDDPPayload *)v10 setAction:v5];
  v11 = sub_100021588(v8);

  [(PDDPPayload *)v10 setSurvey:v11];
  v12 = sub_1000BB1D8(v7, v9);

  id v13 = [v12 mutableCopy];
  objc_super v14 = [(PDDPPayload *)v10 survey];
  [v14 setClassIds:v13];

  return v10;
}

+ (id)payloadsForDeletedSurvey:(id)a3 classIDs:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 select:objc_opt_class() identity:v7];
  if (v10)
  {
    id v26 = v9;
    id v27 = v7;
    v11 = objc_opt_new();
    v25 = v10;
    id v12 = v10[2];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v19 = objc_alloc_init(PDDPPayload);
          [(PDDPPayload *)v19 setType:26];
          [(PDDPPayload *)v19 setAction:3];
          v20 = objc_opt_new();
          [(PDDPPayload *)v19 setSurveyStep:v20];

          v21 = [(PDDPPayload *)v19 surveyStep];
          [v21 setObjectId:v17];

          id v22 = [v8 mutableCopy];
          v23 = [(PDDPPayload *)v19 surveyStep];
          [v23 setClassIds:v22];

          [v11 addObject:v19];
        }
        id v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    id v9 = v26;
    id v7 = v27;
    v10 = v25;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v10 setType:25];
  v11 = (char *)[v8 state] - 1;
  if ((unint64_t)v11 < 3) {
    uint64_t v12 = (v11 + 1);
  }
  else {
    uint64_t v12 = 0;
  }
  [(PDDPPayload *)v10 setAction:v12];
  if ([v8 state] == (id)3)
  {
    id v13 = objc_opt_new();
    [(PDDPPayload *)v10 setSurvey:v13];

    id v14 = [v8 entityIdentity];
    uint64_t v15 = [(PDDPPayload *)v10 survey];
    [v15 setObjectId:v14];

    uint64_t v16 = [v9 select:objc_opt_class() identity:v14];
    uint64_t v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = *(void **)(v16 + 16);
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = v18;
    id v20 = [v19 mutableCopy];
    v21 = [(PDDPPayload *)v10 survey];
    [v21 setClassIds:v20];

    if (v17) {
      id v22 = (void *)v17[2];
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;
    v24 = +[CLSSurvey payloadsForDeletedSurvey:v14 classIDs:v23 database:v9];

    if (v24)
    {
      v25 = +[NSMutableArray arrayWithObject:v10];
      [v25 addObjectsFromArray:v24];
      id v26 = [v25 copy];

      goto LABEL_15;
    }
  }
  else
  {
    id v27 = sub_100021588(v7);
    [(PDDPPayload *)v10 setSurvey:v27];

    v28 = [v7 objectID];
    id v14 = sub_1000BB1D8(v9, v28);

    uint64_t v17 = [v14 mutableCopy];
    long long v29 = [(PDDPPayload *)v10 survey];
    [v29 setClassIds:v17];
  }
  if (v7)
  {
    long long v30 = [v7 objectID];
    v34 = v30;
    long long v31 = +[NSArray arrayWithObjects:&v34 count:1];
    sub_1000BB668(v9, v31, 1);
  }
  v33 = v10;
  id v26 = +[NSArray arrayWithObjects:&v33 count:1];
LABEL_15:

  return v26;
}

- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v6 setType:25];
  id v7 = sub_100021588(self);
  [(PDDPPayload *)v6 setSurvey:v7];

  id v8 = [v5 mutableCopy];
  id v9 = [(PDDPPayload *)v6 survey];
  [v9 setClassIds:v8];

  uint64_t v12 = v6;
  v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

@end