@interface CLSHandout
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityDidInsertNotificationName;
+ (id)entityName;
+ (id)entityWillChangeNotificationName;
+ (id)hashableColumnNames;
+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (BOOL)writeInDatabase:(id)a3;
- (CLSHandout)initWithCKRecord:(id)a3;
- (CLSHandout)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSHandout

- (BOOL)canCopyToDatabase:(id)a3
{
  return [(CLSHandout *)self state] == (id)1;
}

- (BOOL)writeInDatabase:(id)a3
{
  id v4 = a3;
  if ([(CLSHandout *)self isReviewed]) {
    char v5 = 0;
  }
  else {
    char v5 = [(CLSHandout *)self isDeleted] ^ 1;
  }
  uint64_t v6 = objc_opt_class();
  v7 = [(CLSHandout *)self objectID];
  v16 = v7;
  v8 = +[NSArray arrayWithObjects:&v16 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B29D8;
  v13[3] = &unk_1001F4060;
  id v14 = v4;
  char v15 = v5;
  id v9 = v4;
  [v9 selectAll:v6 where:@"parentObjectID = ?" bindings:v8 block:v13];

  v12.receiver = self;
  v12.super_class = (Class)CLSHandout;
  BOOL v10 = [(CLSHandout *)&v12 writeInDatabase:v9];

  return v10;
}

+ (id)recordType
{
  return @"CLSHandout";
}

- (int64_t)syncableItemType
{
  return 0;
}

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v10 setType:2];
  v11 = (char *)[v8 state] - 1;
  if ((unint64_t)v11 < 3) {
    uint64_t v12 = (v11 + 1);
  }
  else {
    uint64_t v12 = 0;
  }
  [(PDDPPayload *)v10 setAction:v12];
  if ([(PDDPPayload *)v10 action] == 3 && sub_1000A5D60()) {
    [(PDDPPayload *)v10 setActionFlags:1];
  }
  if ([v8 state] == (id)3)
  {
    v13 = objc_opt_new();
    [(PDDPPayload *)v10 setHandout:v13];

    id v14 = [v8 entityIdentity];
    char v15 = [(PDDPPayload *)v10 handout];
    [v15 setObjectId:v14];

    uint64_t v16 = [v9 select:objc_opt_class() identity:v14];
    id v17 = (id)v16;
    if (v16) {
      v18 = *(void **)(v16 + 16);
    }
    else {
      v18 = 0;
    }
    id v19 = v18;
    id v20 = [v19 mutableCopy];
    v21 = [(PDDPPayload *)v10 handout];
    [v21 setClassIds:v20];
  }
  else
  {
    v22 = sub_10001F44C(v7);
    [(PDDPPayload *)v10 setHandout:v22];

    v23 = [v7 objectID];
    id v14 = sub_10016B0FC(v9, v23);

    id v17 = [v14 mutableCopy];
    id v19 = [(PDDPPayload *)v10 handout];
    [v19 setClassIds:v17];
  }

  v26 = v10;
  v24 = +[NSArray arrayWithObjects:&v26 count:1];

  return v24;
}

- (CLSHandout)initWithCKRecord:(id)a3
{
  id v4 = a3;
  char v5 = [(CLSHandout *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(CLSHandout *)v5 _initCommonPropsWithRecord:v4];
    id v7 = [v4 objectForKeyedSubscript:@"dueDate"];
    [(CLSHandout *)v6 setDueDate:v7];

    id v8 = [v4 objectForKeyedSubscript:@"instructions"];
    [(CLSHandout *)v6 setInstructions:v8];

    id v9 = [v4 objectForKeyedSubscript:@"title"];
    [(CLSHandout *)v6 setTitle:v9];

    id v10 = [v4 objectForKeyedSubscript:@"type"];
    self;
    if ([v10 isEqualToString:@"Private"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"Public"])
    {
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 1;
    }

    [(CLSHandout *)v6 setType:v11];
    uint64_t v12 = [v4 objectForKeyedSubscript:@"version"];
    -[CLSHandout setVersion:](v6, "setVersion:", [v12 integerValue]);
  }
  return v6;
}

- (void)populate:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLSHandout;
  id v4 = a3;
  [(CLSHandout *)&v12 populate:v4];
  char v5 = [(CLSHandout *)self dueDate];
  [v4 setObject:v5 forKeyedSubscript:@"dueDate"];

  uint64_t v6 = [(CLSHandout *)self instructions];
  [v4 setObject:v6 forKeyedSubscript:@"instructions"];

  id v7 = [(CLSHandout *)self title];
  [v4 setObject:v7 forKeyedSubscript:@"title"];

  id v8 = [(CLSHandout *)self type];
  self;
  CFStringRef v9 = @"Private";
  if (v8 == (id)2) {
    CFStringRef v9 = @"Public";
  }
  if (v8) {
    CFStringRef v10 = v9;
  }
  else {
    CFStringRef v10 = @"Unknown";
  }
  [v4 setObject:v10 forKeyedSubscript:@"type"];
  uint64_t v11 = +[NSNumber numberWithInteger:[(CLSHandout *)self version]];
  [v4 setObject:v11 forKeyedSubscript:@"version"];
}

- (int64_t)syncOrder
{
  return 1;
}

- (int64_t)syncBackend:(id)a3
{
  return [(CLSHandout *)self state] != (id)1;
}

- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v6 setType:2];
  id v7 = sub_10001F44C(self);
  [(PDDPPayload *)v6 setHandout:v7];

  id v8 = [v5 mutableCopy];
  CFStringRef v9 = [(PDDPPayload *)v6 handout];
  [v9 setClassIds:v8];

  objc_super v12 = v6;
  CFStringRef v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

- (NSString)parentReferenceName
{
  return 0;
}

+ (id)entityName
{
  return @"CLSHandout";
}

+ (id)hashableColumnNames
{
  v4[0] = @"rowid";
  v4[1] = @"dateLastModified";
  v4[2] = @"state";
  v4[3] = @"substate";
  v4[4] = @"publishingState";
  v4[5] = @"flags";
  v4[6] = @"version";
  v2 = +[NSArray arrayWithObjects:v4 count:7];

  return v2;
}

- (unint64_t)changeHash
{
  v8.receiver = self;
  v8.super_class = (Class)CLSHandout;
  unint64_t v3 = [(CLSHandout *)&v8 changeHash];
  uint64_t v4 = v3 ^ (2 * (void)[(CLSHandout *)self state]);
  uint64_t v5 = v4 ^ (4 * (void)[(CLSHandout *)self publishingState]);
  uint64_t v6 = v5 ^ (8 * (void)[(CLSHandout *)self flags]);
  return v6 ^ (16 * (void)[(CLSHandout *)self version]);
}

- (CLSHandout)initWithDatabaseRow:(id)a3
{
  uint64_t v4 = (uint64_t *)a3;
  uint64_t v5 = [(CLSHandout *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(CLSHandout *)v5 _initCommonPropsWithDatabaseRow:v4];
    id v7 = sub_100003BF0(v4, @"title");
    [(CLSHandout *)v6 setTitle:v7];

    objc_super v8 = sub_100003BF0(v4, @"instructions");
    [(CLSHandout *)v6 setInstructions:v8];

    CFStringRef v9 = sub_1001630C8(v4, @"dateOfPublication");
    [(CLSHandout *)v6 setDateOfPublication:v9];

    CFStringRef v10 = sub_1001630C8(v4, @"dueDate");
    [(CLSHandout *)v6 setDueDate:v10];

    uint64_t v11 = sub_100003BF0(v4, @"reviewed");
    -[CLSHandout setReviewed:](v6, "setReviewed:", [v11 BOOLValue]);

    objc_super v12 = sub_100003BF0(v4, @"state");
    -[CLSHandout setState:](v6, "setState:", [v12 integerValue]);

    v13 = sub_100003BF0(v4, @"substate");
    -[CLSHandout setSubstate:](v6, "setSubstate:", [v13 integerValue]);

    id v14 = sub_100003BF0(v4, @"flags");
    -[CLSHandout setFlags:](v6, "setFlags:", [v14 unsignedIntegerValue]);

    char v15 = sub_1001630C8(v4, @"dateLastReviewed");
    [(CLSHandout *)v6 setLastReviewedDate:v15];

    uint64_t v16 = sub_100003BF0(v4, @"publishingState");
    -[CLSHandout setPublishingState:](v6, "setPublishingState:", [v16 integerValue]);

    id v17 = sub_100003BF0(v4, @"publishError");
    v18 = +[CLSUtil errorFromData:v17];
    [(CLSHandout *)v6 setPublishError:v18];

    id v19 = sub_100003BF0(v4, @"type");
    -[CLSHandout setType:](v6, "setType:", [v19 integerValue]);

    id v20 = sub_100003BF0(v4, @"version");
    -[CLSHandout setVersion:](v6, "setVersion:", [v20 integerValue]);
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CLSHandout;
  id v4 = a3;
  [(CLSHandout *)&v19 bindTo:v4];
  uint64_t v5 = [(CLSHandout *)self dateOfPublication];
  sub_10008C524((uint64_t)v4, v5, @"dateOfPublication");

  uint64_t v6 = [(CLSHandout *)self dueDate];
  sub_10008C524((uint64_t)v4, v6, @"dueDate");

  id v7 = [(CLSHandout *)self instructions];
  sub_10008C524((uint64_t)v4, v7, @"instructions");

  objc_super v8 = [(CLSHandout *)self title];
  sub_10008C524((uint64_t)v4, v8, @"title");

  CFStringRef v9 = +[NSNumber numberWithBool:[(CLSHandout *)self isReviewed]];
  sub_10008C524((uint64_t)v4, v9, @"reviewed");

  CFStringRef v10 = +[NSNumber numberWithInteger:[(CLSHandout *)self state]];
  sub_10008C524((uint64_t)v4, v10, @"state");

  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:[(CLSHandout *)self substate]];
  sub_10008C524((uint64_t)v4, v11, @"substate");

  objc_super v12 = +[NSNumber numberWithUnsignedInteger:[(CLSHandout *)self flags]];
  sub_10008C524((uint64_t)v4, v12, @"flags");

  v13 = [(CLSHandout *)self lastReviewedDate];
  sub_10008C524((uint64_t)v4, v13, @"dateLastReviewed");

  id v14 = +[NSNumber numberWithInteger:[(CLSHandout *)self publishingState]];
  sub_10008C524((uint64_t)v4, v14, @"publishingState");

  char v15 = [(CLSHandout *)self publishError];
  uint64_t v16 = +[CLSUtil dataFromError:v15];

  sub_10008C524((uint64_t)v4, v16, @"publishError");
  id v17 = +[NSNumber numberWithInteger:[(CLSHandout *)self type]];
  sub_10008C524((uint64_t)v4, v17, @"type");

  v18 = +[NSNumber numberWithInteger:[(CLSHandout *)self version]];
  sub_10008C524((uint64_t)v4, v18, @"version");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  switch(a3)
  {
    case 2uLL:
LABEL_7:
      LOBYTE(a3) = 0;
      if ((sub_100007540(v8, @"alter table CLSHandout add column flags integer", 0, 0, 0) & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_10;
    case 1uLL:
LABEL_6:
      LOBYTE(a3) = 0;
      if (!sub_100007540(v8, @"create trigger if not exists trigger_cleanup_cached_reports_for_due_date_change  after update  on CLSHandout  when OLD.dueDate != NEW.dueDate begin  delete from CLSHandoutReportItem where handoutID=OLD.objectID; end",
                            0,
                            0,
                            0))
        goto LABEL_18;
      goto LABEL_7;
    case 0uLL:
      if (!sub_100007540(v7, @"create table CLSHandout(   objectID            text not null,    appIdentifier       text not null,    dateCreated         real not null,    dateLastModified    real not null,    dateOfPublication   real,    dateLastReviewed    real,    dueDate             real,    instructions        text,    title               text,    reviewed            integer,    state               integer,    publishingState     integer,    publishError        blob)", 0, 0, 0))goto LABEL_18; {
      LOBYTE(a3) = 0;
      }
      if (!sub_100007540(v8, @"create unique index if not exists CLSHandout_objectID on CLSHandout (objectID)", 0, 0, 0))goto LABEL_18; {
      goto LABEL_6;
      }
  }
  if (a3 - 3 <= 1)
  {
LABEL_10:
    LOBYTE(a3) = 0;
    if ((sub_100007540(v8, @"alter table CLSHandout add column substate integer", 0, 0, 0) & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (a3 != 6)
  {
    if (a3 != 5)
    {
LABEL_17:
      *a4 = a3;
      LOBYTE(a3) = 1;
      goto LABEL_18;
    }
LABEL_14:
    LOBYTE(a3) = 0;
    if (!sub_100007540(v8, @"alter table CLSHandout add column type integer default 1", 0, 0, 0))goto LABEL_18; {
  }
    }
  LOBYTE(a3) = 0;
  if (sub_100007540(v8, @"alter table CLSHandout add column version integer default 0", 0, 0, 0))
  {
    a3 = 7;
    goto LABEL_17;
  }
LABEL_18:

  return a3;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLSHandout *)self objectID];
  uint64_t v6 = [v4 select:objc_opt_class() identity:v5];
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = v6[2];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    CFStringRef v9 = (id *)objc_opt_new();
    uint64_t v6 = v9;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v10, v5, 8);
    }
  }
  uint64_t v11 = sub_10016B0FC(v4, v5);
  [v7 addObjectsFromArray:v11];

  objc_super v12 = [v7 allObjects];
  sub_100075F40((uint64_t)v6, v12);

  if ([v4 insertOrUpdateObject:v6])
  {
    id v14 = v5;
    v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
  }
}

+ (int64_t)migrationOrder
{
  return 1;
}

+ (id)entityDidInsertNotificationName
{
  return @"PDDatabaseEntityHandoutDidInsertNotification";
}

+ (id)entityWillChangeNotificationName
{
  return @"PDDatabaseEntityHandoutWillChangeNotification";
}

@end