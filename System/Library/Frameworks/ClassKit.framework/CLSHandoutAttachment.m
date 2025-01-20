@interface CLSHandoutAttachment
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
- (CLSHandoutAttachment)initWithCKRecord:(id)a3;
- (CLSHandoutAttachment)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)updateAuthorizationInDatabase:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSHandoutAttachment

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(CLSHandoutAttachment *)self parentObjectID];
  v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

- (BOOL)writeInDatabase:(id)a3
{
  id v4 = a3;
  [(CLSHandoutAttachment *)self updateAuthorizationInDatabase:v4];
  v6.receiver = self;
  v6.super_class = (Class)CLSHandoutAttachment;
  LOBYTE(self) = [(CLSHandoutAttachment *)&v6 writeInDatabase:v4];

  return (char)self;
}

- (void)updateAuthorizationInDatabase:(id)a3
{
  id v4 = a3;
  if ([(CLSHandoutAttachment *)self isDeleted]) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = [(CLSHandoutAttachment *)self isLocked] ^ 1;
  }
  id v6 = [(CLSHandoutAttachment *)self objectID];
  sub_1001565D8(v4, v6, v5);
}

+ (id)recordType
{
  return @"CLSHandoutAttachment";
}

- (CLSHandoutAttachment)initWithCKRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"type"];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = CLSHandoutAttachmentTypeFromString();
    v8 = [v4 objectForKeyedSubscript:@"title"];
    v9 = [(CLSHandoutAttachment *)self initWithType:v7 title:v8];
    self = v9;
    if (!v9)
    {
LABEL_15:
      v21 = self;
LABEL_18:

      goto LABEL_19;
    }
    v28.receiver = v9;
    v28.super_class = (Class)CLSHandoutAttachment;
    [(CLSHandoutAttachment *)&v28 _initCommonPropsWithRecord:v4];
    v10 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    [(CLSHandoutAttachment *)self setBundleIdentifier:v10];

    v11 = [v4 objectForKeyedSubscript:@"applicationName"];
    [(CLSHandoutAttachment *)self setApplicationName:v11];

    v12 = [v4 objectForKeyedSubscript:@"URL"];
    if (v12)
    {
      v13 = +[NSURL URLWithString:v12];
      [(CLSHandoutAttachment *)self setURL:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"contextPath"];
    [(CLSHandoutAttachment *)self setContextPath:v14];

    v15 = [v4 objectForKeyedSubscript:@"storeIdentifier"];
    [(CLSHandoutAttachment *)self setStoreIdentifier:v15];

    v16 = [v4 objectForKeyedSubscript:@"contentStoreIdentifier"];
    [(CLSHandoutAttachment *)self setContentStoreIdentifier:v16];

    v17 = [v4 objectForKeyedSubscript:@"displayOrder"];
    -[CLSHandoutAttachment setDisplayOrder:](self, "setDisplayOrder:", [v17 integerValue]);

    if (v7 == 1)
    {
      uint64_t v22 = [v4 objectForKeyedSubscript:@"contextType"];

      if (v22)
      {
        [(CLSHandoutAttachment *)self setContextType:CLSContextTypeFromDefaultName()];
        id v6 = (void *)v22;
        goto LABEL_14;
      }
      id v6 = 0;
    }
    else
    {
      if (v7 != 4 && v7 != 2) {
        goto LABEL_14;
      }
      uint64_t v18 = [v4 objectForKeyedSubscript:@"shareType"];
      if (v18)
      {
        v19 = (void *)v18;
        [(CLSHandoutAttachment *)self setShareType:CLSShareTypeFromString()];
        v20 = [v4 objectForKeyedSubscript:@"permissionType"];

        if (v20)
        {
          [(CLSHandoutAttachment *)self setPermissionType:CLSPermissionTypeFromString()];

LABEL_14:
          v23 = [v4 objectForKeyedSubscript:@"contextSummary"];
          [(CLSHandoutAttachment *)self setContextSummary:v23];

          v24 = [v4 objectForKeyedSubscript:@"contextCustomTypeName"];
          [(CLSHandoutAttachment *)self setContextCustomTypeName:v24];

          v25 = [v4 objectForKeyedSubscript:@"contextSourceIsCatalog"];
          -[CLSHandoutAttachment setContextSourceIsCatalog:](self, "setContextSourceIsCatalog:", [v25 BOOLValue]);

          v26 = [v4 objectForKeyedSubscript:@"timeExpectation"];
          [v26 doubleValue];
          -[CLSHandoutAttachment setTimeExpectation:](self, "setTimeExpectation:");

          goto LABEL_15;
        }
      }
    }

    v21 = 0;
    goto LABEL_18;
  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (void)populate:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CLSHandoutAttachment;
  id v4 = a3;
  [(CLSHandoutAttachment *)&v26 populate:v4];
  [(CLSHandoutAttachment *)self type];
  uint64_t v5 = NSStringFromHandoutAttachmentType();
  [v4 setObject:v5 forKeyedSubscript:@"type"];

  id v6 = [(CLSHandoutAttachment *)self title];
  [v4 setObject:v6 forKeyedSubscript:@"title"];

  uint64_t v7 = [(CLSHandoutAttachment *)self bundleIdentifier];
  [v4 setObject:v7 forKeyedSubscript:@"bundleIdentifier"];

  v8 = [(CLSHandoutAttachment *)self applicationName];
  [v4 setObject:v8 forKeyedSubscript:@"applicationName"];

  v9 = [(CLSHandoutAttachment *)self URL];
  v10 = [v9 absoluteString];
  [v4 setObject:v10 forKeyedSubscript:@"URL"];

  v11 = [(CLSHandoutAttachment *)self contextPath];
  [v4 setObject:v11 forKeyedSubscript:@"contextPath"];
  v12 = +[CLSContext objectIDPathFromIdentifierPath:v11];
  v13 = [v12 componentsJoinedByString:@"/"];
  [v4 setObject:v13 forKeyedSubscript:@"objectIDPath"];

  v14 = +[CLSContext stableObjectIDPathFromIdentifierPath:v11];
  v15 = [v14 componentsJoinedByString:@"/"];
  [v4 setObject:v15 forKeyedSubscript:@"stableObjectIDPath"];

  v16 = [(CLSHandoutAttachment *)self storeIdentifier];
  [v4 setObject:v16 forKeyedSubscript:@"storeIdentifier"];

  v17 = [(CLSHandoutAttachment *)self contentStoreIdentifier];
  [v4 setObject:v17 forKeyedSubscript:@"contentStoreIdentifier"];

  uint64_t v18 = +[NSNumber numberWithInteger:[(CLSHandoutAttachment *)self displayOrder]];
  [v4 setObject:v18 forKeyedSubscript:@"displayOrder"];

  [(CLSHandoutAttachment *)self shareType];
  v19 = NSStringFromShareType();
  [v4 setObject:v19 forKeyedSubscript:@"shareType"];

  [(CLSHandoutAttachment *)self permissionType];
  v20 = NSStringFromPermissionType();
  [v4 setObject:v20 forKeyedSubscript:@"permissionType"];

  [(CLSHandoutAttachment *)self contextType];
  v21 = DefaultNameFromContextType();
  [v4 setObject:v21 forKeyedSubscript:@"contextType"];

  [(CLSHandoutAttachment *)self updateParentReferencesForRecord:v4];
  uint64_t v22 = [(CLSHandoutAttachment *)self contextSummary];
  [v4 setObject:v22 forKeyedSubscript:@"contextSummary"];

  v23 = [(CLSHandoutAttachment *)self contextCustomTypeName];
  [v4 setObject:v23 forKeyedSubscript:@"contextCustomTypeName"];

  v24 = +[NSNumber numberWithBool:[(CLSHandoutAttachment *)self contextSourceIsCatalog]];
  [v4 setObject:v24 forKeyedSubscript:@"contextSourceIsCatalog"];

  [(CLSHandoutAttachment *)self timeExpectation];
  v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v25 forKeyedSubscript:@"timeExpectation"];
}

- (int64_t)syncOrder
{
  return 2;
}

- (int64_t)syncableItemType
{
  return 0;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"handout";
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLSHandoutAttachment *)self parentObjectID];
  if (v5)
  {
    id v6 = [v4 select:objc_opt_class() identity:v5];
    uint64_t v7 = v6;
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

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  [v10 setType:3];
  v11 = (char *)[v8 state] - 1;
  if ((unint64_t)v11 < 3) {
    uint64_t v12 = (v11 + 1);
  }
  else {
    uint64_t v12 = 0;
  }
  [v10 setAction:v12];
  if ([v10 action] == 3 && sub_1000A5D60()) {
    [v10 setActionFlags:1];
  }
  if ([v8 state] == (id)3)
  {
    v13 = objc_opt_new();
    [v10 setAttachment:v13];

    v14 = [v8 entityIdentity];
    v15 = [v10 attachment];
    [v15 setObjectId:v14];

    uint64_t v16 = [v9 select:objc_opt_class() identity:v14];
    id v17 = (id)v16;
    if (v16) {
      uint64_t v18 = *(void **)(v16 + 16);
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = v18;
    id v20 = [v19 mutableCopy];
    v21 = [v10 attachment];
    [v21 setClassIds:v20];
  }
  else
  {
    uint64_t v22 = sub_10001F724(v7);
    [v10 setAttachment:v22];

    v23 = [v7 objectID];
    v14 = sub_1001564D8(v9, v23);

    id v17 = [v14 mutableCopy];
    id v19 = [v10 attachment];
    [v19 setClassIds:v17];
  }

  objc_super v26 = v10;
  v24 = +[NSArray arrayWithObjects:&v26 count:1];

  return v24;
}

- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 setType:3];
  id v7 = sub_10001F724(self);
  [v6 setAttachment:v7];

  id v8 = [v5 mutableCopy];
  id v9 = [v6 attachment];
  [v9 setClassIds:v8];

  uint64_t v12 = v6;
  v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

+ (id)entityName
{
  return @"CLSHandoutAttachment";
}

+ (id)hashableColumnNames
{
  v4[0] = @"rowid";
  v4[1] = @"dateLastModified";
  v4[2] = @"completionStatus";
  v4[3] = @"dateLastCompleted";
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

- (unint64_t)changeHash
{
  v8.receiver = self;
  v8.super_class = (Class)CLSHandoutAttachment;
  unint64_t v3 = [(CLSHandoutAttachment *)&v8 changeHash];
  uint64_t v4 = (int)(2 * [(CLSHandoutAttachment *)self completionStatus]);
  id v5 = [(CLSHandoutAttachment *)self dateLastCompleted];
  unint64_t v6 = v3 ^ v4 ^ (unint64_t)[v5 hash];

  return v6;
}

- (CLSHandoutAttachment)initWithDatabaseRow:(id)a3
{
  uint64_t v4 = (uint64_t *)a3;
  id v5 = sub_100003BF0(v4, @"type");
  id v6 = [v5 intValue];
  id v7 = sub_100003BF0(v4, @"title");
  objc_super v8 = [(CLSHandoutAttachment *)self initWithType:v6 title:v7];

  if (v8)
  {
    [(CLSHandoutAttachment *)v8 _initCommonPropsWithDatabaseRow:v4];
    id v9 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSHandoutAttachment *)v8 setParentObjectID:v9];

    v10 = sub_100003BF0(v4, @"bundleIdentifier");
    [(CLSHandoutAttachment *)v8 setBundleIdentifier:v10];

    v11 = sub_100003BF0(v4, @"applicationName");
    [(CLSHandoutAttachment *)v8 setApplicationName:v11];

    uint64_t v12 = sub_100003BF0(v4, @"URL");
    if (v12)
    {
      v13 = +[NSURL URLWithString:v12];
      [(CLSHandoutAttachment *)v8 setURL:v13];
    }
    v14 = sub_100003BF0(v4, @"completionStatus");
    -[CLSHandoutAttachment setCompletionStatus:](v8, "setCompletionStatus:", [v14 intValue]);

    v15 = sub_100003BF0(v4, @"contextPath");
    if (v15)
    {
      uint64_t v16 = +[CLSUtil pathFromData:v15];
      [(CLSHandoutAttachment *)v8 setContextPath:v16];
    }
    id v17 = sub_100003BF0(v4, @"contextSummary");
    [(CLSHandoutAttachment *)v8 setContextSummary:v17];

    uint64_t v18 = sub_100003BF0(v4, @"contextCustomTypeName");
    [(CLSHandoutAttachment *)v8 setContextCustomTypeName:v18];

    id v19 = sub_100003BF0(v4, @"contextSourceIsCatalog");
    -[CLSHandoutAttachment setContextSourceIsCatalog:](v8, "setContextSourceIsCatalog:", [v19 BOOLValue]);

    id v20 = sub_100003BF0(v4, @"storeIdentifier");
    [(CLSHandoutAttachment *)v8 setStoreIdentifier:v20];

    v21 = sub_100003BF0(v4, @"contentStoreIdentifier");
    [(CLSHandoutAttachment *)v8 setContentStoreIdentifier:v21];

    uint64_t v22 = sub_100003BF0(v4, @"locked");
    -[CLSHandoutAttachment setLocked:](v8, "setLocked:", [v22 BOOLValue]);

    v23 = sub_100003BF0(v4, @"shareType");
    -[CLSHandoutAttachment setShareType:](v8, "setShareType:", [v23 intValue]);

    v24 = sub_100003BF0(v4, @"permissionType");
    -[CLSHandoutAttachment setPermissionType:](v8, "setPermissionType:", [v24 intValue]);

    v25 = sub_100003BF0(v4, @"displayOrder");
    -[CLSHandoutAttachment setDisplayOrder:](v8, "setDisplayOrder:", [v25 integerValue]);

    objc_super v26 = sub_100003BF0(v4, @"contextType");
    -[CLSHandoutAttachment setContextType:](v8, "setContextType:", [v26 integerValue]);

    v27 = sub_1001630C8(v4, @"dateLastCompleted");
    [(CLSHandoutAttachment *)v8 setDateLastCompleted:v27];

    objc_super v28 = sub_100003BF0(v4, @"timeExpectation");
    [v28 doubleValue];
    -[CLSHandoutAttachment setTimeExpectation:](v8, "setTimeExpectation:");
  }
  return v8;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSHandoutAttachment;
  [(CLSHandoutAttachment *)&v29 bindTo:v4];
  id v5 = [(CLSHandoutAttachment *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  id v6 = [(CLSHandoutAttachment *)self contextPath];
  id v7 = [v6 count];

  if (v7)
  {
    objc_super v8 = [(CLSHandoutAttachment *)self contextPath];
    id v9 = +[CLSUtil dataFromPath:v8 makeBackwardCompatible:1 error:0];
  }
  else
  {
    id v9 = 0;
  }
  sub_10008C524((uint64_t)v4, v9, @"contextPath");
  v10 = [(CLSHandoutAttachment *)self contextSummary];
  sub_10008C524((uint64_t)v4, v10, @"contextSummary");

  v11 = [(CLSHandoutAttachment *)self contextCustomTypeName];
  sub_10008C524((uint64_t)v4, v11, @"contextCustomTypeName");

  uint64_t v12 = +[NSNumber numberWithBool:[(CLSHandoutAttachment *)self contextSourceIsCatalog]];
  sub_10008C524((uint64_t)v4, v12, @"contextSourceIsCatalog");

  v13 = [(CLSHandoutAttachment *)self URL];
  v14 = [v13 absoluteString];
  sub_10008C524((uint64_t)v4, v14, @"URL");

  v15 = [(CLSHandoutAttachment *)self title];
  sub_10008C524((uint64_t)v4, v15, @"title");

  uint64_t v16 = [(CLSHandoutAttachment *)self bundleIdentifier];
  sub_10008C524((uint64_t)v4, v16, @"bundleIdentifier");

  id v17 = [(CLSHandoutAttachment *)self applicationName];
  sub_10008C524((uint64_t)v4, v17, @"applicationName");

  uint64_t v18 = [(CLSHandoutAttachment *)self storeIdentifier];
  sub_10008C524((uint64_t)v4, v18, @"storeIdentifier");

  id v19 = +[NSNumber numberWithInt:[(CLSHandoutAttachment *)self type]];
  sub_10008C524((uint64_t)v4, v19, @"type");

  id v20 = +[NSNumber numberWithInt:[(CLSHandoutAttachment *)self completionStatus]];
  sub_10008C524((uint64_t)v4, v20, @"completionStatus");

  v21 = [(CLSHandoutAttachment *)self contentStoreIdentifier];
  sub_10008C524((uint64_t)v4, v21, @"contentStoreIdentifier");

  uint64_t v22 = +[NSNumber numberWithBool:[(CLSHandoutAttachment *)self isLocked]];
  sub_10008C524((uint64_t)v4, v22, @"locked");

  v23 = +[NSNumber numberWithInt:[(CLSHandoutAttachment *)self shareType]];
  sub_10008C524((uint64_t)v4, v23, @"shareType");

  v24 = +[NSNumber numberWithInt:[(CLSHandoutAttachment *)self permissionType]];
  sub_10008C524((uint64_t)v4, v24, @"permissionType");

  v25 = +[NSNumber numberWithInteger:[(CLSHandoutAttachment *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v25, @"displayOrder");

  objc_super v26 = +[NSNumber numberWithInteger:[(CLSHandoutAttachment *)self contextType]];
  sub_10008C524((uint64_t)v4, v26, @"contextType");

  v27 = [(CLSHandoutAttachment *)self dateLastCompleted];
  sub_10008C524((uint64_t)v4, v27, @"dateLastCompleted");

  [(CLSHandoutAttachment *)self timeExpectation];
  objc_super v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v28, @"timeExpectation");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  switch(a3)
  {
    case 0uLL:
      BOOL v9 = 0;
      if (sub_100007540(v7, @"create table CLSHandoutAttachment(   objectID          text not null,    parentObjectID    text not null,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    dateLastCompleted real,    bundleIdentifier  text,    title             text,    type              integer,    complete          integer,    displayOrder      integer,    locked            integer,    shareType         integer,    permissionType    integer,    completionStatus  integer,    contextType       integer,    URL               text,    contextPath       blob,    storeIdentifier   text,    contentStoreIdentifier text,    foreign key (parentObjectID) references CLSHandout(objectID) on delete cascade on update cascade)", 0, 0, 0))
      {
        BOOL v9 = 0;
        if (sub_100007540(v8, @"create unique index if not exists CLSHandoutAttachment_objectID on CLSHandoutAttachment (objectID)", 0, 0, 0))
        {
          BOOL v9 = 0;
          if (sub_100007540(v8, @"create index if not exists CLSHandoutAttachment_parentObjectID on CLSHandoutAttachment (parentObjectID)", 0, 0, 0))goto LABEL_5; {
        }
          }
      }
      goto LABEL_24;
    case 1uLL:
LABEL_5:
      if ((sub_100007540(v8, @"alter table CLSHandoutAttachment add column contextSummary text", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        v10 = CLSLogDatabase;
        if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        __int16 v18 = 0;
        v11 = "Failed to migrate CLSHandoutAttachment(1): Could not add column summary";
        uint64_t v12 = (uint8_t *)&v18;
        goto LABEL_22;
      }
      if (sub_100007540(v8, @"alter table CLSHandoutAttachment add column contextCustomTypeName text", 0, 0, 0))goto LABEL_7; {
      CLSInitLog();
      }
      v10 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v11 = "Failed to migrate CLSHandoutAttachment(1): Could not add column customTypeName";
        uint64_t v12 = buf;
        goto LABEL_22;
      }
      goto LABEL_23;
    case 2uLL:
LABEL_7:
      if (sub_100007540(v8, @"alter table CLSHandoutAttachment add column applicationName text", 0, 0, 0)) {
        goto LABEL_8;
      }
      CLSInitLog();
      v10 = CLSLogDatabase;
      if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      __int16 v16 = 0;
      v11 = "Failed to migrate CLSHandoutAttachment(2): Could not add column 'applicationName'";
      uint64_t v12 = (uint8_t *)&v16;
      goto LABEL_22;
    case 3uLL:
LABEL_8:
      if (sub_100007540(v8, @"alter table CLSHandoutAttachment add column contextSourceIsCatalog integer", 0, 0, 0))goto LABEL_9; {
      CLSInitLog();
      }
      v10 = CLSLogDatabase;
      if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      __int16 v15 = 0;
      v11 = "Failed to migrate CLSHandoutAttachment(3): Could not add column contextSourceIsCatalog";
      uint64_t v12 = (uint8_t *)&v15;
      goto LABEL_22;
    case 4uLL:
LABEL_9:
      if (sub_100007540(v8, @"alter table CLSHandoutAttachment add column timeExpectation real", 0, 0, 0))
      {
        a3 = 5;
LABEL_11:
        *a4 = a3;
        BOOL v9 = 1;
      }
      else
      {
        CLSInitLog();
        v10 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          __int16 v14 = 0;
          v11 = "Failed to migrate CLSHandoutAttachment(4): Could not add column timeExpectation";
          uint64_t v12 = (uint8_t *)&v14;
LABEL_22:
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
        }
LABEL_23:
        BOOL v9 = 0;
      }
LABEL_24:

      return v9;
    default:
      goto LABEL_11;
  }
}

+ (int64_t)migrationOrder
{
  return 2;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSHandoutAttachment *)self objectID];
  id v6 = [v4 select:objc_opt_class() identity:v5];
  id v7 = objc_opt_new();
  if (v6)
  {
    id v8 = v6[2];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    BOOL v9 = (id *)objc_opt_new();
    id v6 = v9;
    if (v9) {
      objc_setProperty_nonatomic_copy(v9, v10, v5, 8);
    }
  }
  v11 = sub_1001564D8(v4, v5);
  [v7 addObjectsFromArray:v11];

  uint64_t v12 = [v7 allObjects];
  sub_100075F40((uint64_t)v6, v12);

  if ([v4 insertOrUpdateObject:v6])
  {
    __int16 v14 = v5;
    v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v13];
    [v4 deleteAllWithoutTracking:objc_opt_class() where:@"attachmentID = ?" bindings:v13];
  }
}

+ (id)entityDidInsertNotificationName
{
  return @"PDDatabaseEntityAttachmentDidInsertNotification";
}

+ (id)entityWillChangeNotificationName
{
  return @"PDDatabaseEntityAttachmentWillChangeNotification";
}

@end