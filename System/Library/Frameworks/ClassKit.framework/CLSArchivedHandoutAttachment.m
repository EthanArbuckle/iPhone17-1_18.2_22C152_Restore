@interface CLSArchivedHandoutAttachment
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (int64_t)migrationOrder;
- (id)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSArchivedHandoutAttachment

+ (id)entityName
{
  return @"CLSArchivedHandoutAttachment";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"type");
  id v6 = [v5 intValue];
  v7 = sub_100003BF0(v4, @"title");
  v8 = [(CLSArchivedHandoutAttachment *)self initWithType:v6 title:v7];

  if (v8)
  {
    [(CLSArchivedHandoutAttachment *)v8 _initCommonPropsWithDatabaseRow:v4];
    v9 = sub_100003BF0(v4, @"bundleIdentifier");
    [(CLSArchivedHandoutAttachment *)v8 setBundleIdentifier:v9];

    v10 = sub_100003BF0(v4, @"URL");
    if (v10)
    {
      v11 = +[NSURL URLWithString:v10];
      [(CLSArchivedHandoutAttachment *)v8 setURL:v11];
    }
    v12 = sub_100003BF0(v4, @"contextPath");
    if (v12)
    {
      v13 = +[CLSUtil pathFromData:v12];
      [(CLSArchivedHandoutAttachment *)v8 setContextPath:v13];
    }
    v14 = sub_100003BF0(v4, @"contextSummary");
    [(CLSArchivedHandoutAttachment *)v8 setContextSummary:v14];

    v15 = sub_100003BF0(v4, @"contextCustomTypeName");
    [(CLSArchivedHandoutAttachment *)v8 setContextCustomTypeName:v15];

    v16 = sub_100003BF0(v4, @"contextSourceIsCatalog");
    -[CLSArchivedHandoutAttachment setContextSourceIsCatalog:](v8, "setContextSourceIsCatalog:", [v16 BOOLValue]);

    v17 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSArchivedHandoutAttachment *)v8 setParentObjectID:v17];

    v18 = sub_100003BF0(v4, @"storeIdentifier");
    [(CLSArchivedHandoutAttachment *)v8 setStoreIdentifier:v18];

    v19 = sub_100003BF0(v4, @"contentStoreIdentifier");
    [(CLSArchivedHandoutAttachment *)v8 setContentStoreIdentifier:v19];

    v20 = sub_100003BF0(v4, @"shareType");
    -[CLSArchivedHandoutAttachment setShareType:](v8, "setShareType:", [v20 intValue]);

    v21 = sub_100003BF0(v4, @"permissionType");
    -[CLSArchivedHandoutAttachment setPermissionType:](v8, "setPermissionType:", [v21 intValue]);

    v22 = sub_100003BF0(v4, @"displayOrder");
    -[CLSArchivedHandoutAttachment setDisplayOrder:](v8, "setDisplayOrder:", [v22 integerValue]);

    v23 = sub_100003BF0(v4, @"contextType");
    -[CLSArchivedHandoutAttachment setContextType:](v8, "setContextType:", [v23 integerValue]);

    v24 = sub_100003BF0(v4, @"title");
    [(CLSArchivedHandoutAttachment *)v8 setTitle:v24];

    v25 = sub_100003BF0(v4, @"timeExpectation");
    [v25 doubleValue];
    -[CLSArchivedHandoutAttachment setTimeExpectation:](v8, "setTimeExpectation:");
  }
  return v8;
}

- (void)bindTo:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CLSArchivedHandoutAttachment;
  id v4 = a3;
  [(CLSArchivedHandoutAttachment *)&v25 bindTo:v4];
  v5 = [(CLSArchivedHandoutAttachment *)self contextPath];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = [(CLSArchivedHandoutAttachment *)self contextPath];
    v8 = +[CLSUtil dataFromPath:v7 makeBackwardCompatible:1 error:0];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(CLSArchivedHandoutAttachment *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v9, @"parentObjectID");

  sub_10008C524((uint64_t)v4, v8, @"contextPath");
  v10 = [(CLSArchivedHandoutAttachment *)self contextSummary];
  sub_10008C524((uint64_t)v4, v10, @"contextSummary");

  v11 = [(CLSArchivedHandoutAttachment *)self contextCustomTypeName];
  sub_10008C524((uint64_t)v4, v11, @"contextCustomTypeName");

  v12 = +[NSNumber numberWithBool:[(CLSArchivedHandoutAttachment *)self contextSourceIsCatalog]];
  sub_10008C524((uint64_t)v4, v12, @"contextSourceIsCatalog");

  v13 = [(CLSArchivedHandoutAttachment *)self URL];
  v14 = [v13 absoluteString];
  sub_10008C524((uint64_t)v4, v14, @"URL");

  v15 = [(CLSArchivedHandoutAttachment *)self title];
  sub_10008C524((uint64_t)v4, v15, @"title");

  v16 = [(CLSArchivedHandoutAttachment *)self bundleIdentifier];
  sub_10008C524((uint64_t)v4, v16, @"bundleIdentifier");

  v17 = [(CLSArchivedHandoutAttachment *)self storeIdentifier];
  sub_10008C524((uint64_t)v4, v17, @"storeIdentifier");

  v18 = +[NSNumber numberWithInt:[(CLSArchivedHandoutAttachment *)self type]];
  sub_10008C524((uint64_t)v4, v18, @"type");

  v19 = [(CLSArchivedHandoutAttachment *)self contentStoreIdentifier];
  sub_10008C524((uint64_t)v4, v19, @"contentStoreIdentifier");

  v20 = +[NSNumber numberWithInt:[(CLSArchivedHandoutAttachment *)self shareType]];
  sub_10008C524((uint64_t)v4, v20, @"shareType");

  v21 = +[NSNumber numberWithInt:[(CLSArchivedHandoutAttachment *)self permissionType]];
  sub_10008C524((uint64_t)v4, v21, @"permissionType");

  v22 = +[NSNumber numberWithInteger:[(CLSArchivedHandoutAttachment *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v22, @"displayOrder");

  v23 = +[NSNumber numberWithInteger:[(CLSArchivedHandoutAttachment *)self contextType]];
  sub_10008C524((uint64_t)v4, v23, @"contextType");

  [(CLSArchivedHandoutAttachment *)self timeExpectation];
  v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10008C524((uint64_t)v4, v24, @"timeExpectation");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 2) {
    goto LABEL_8;
  }
  if (a3 == 1) {
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_10:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_15;
  }
  if (sub_100007540(v7, @"create table CLSArchivedHandoutAttachment(   objectID          text not null,    parentObjectID    text not null,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    bundleIdentifier  text,    title             text,    type              integer,    complete          integer,    displayOrder      integer,    shareType         integer,    permissionType    integer,    completionStatus  integer,    contextType       integer,    URL               text,    contextPath       blob,    contextSummary    text,    contextCustomTypeName  text,    storeIdentifier   text,    contentStoreIdentifier text,    foreign key (parentObjectID) references CLSArchivedHandout(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSArchivedHandoutAttachment_objectID on CLSArchivedHandoutAttachment (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSArchivedHandoutAttachment_parentObjectID on CLSArchivedHandoutAttachment (parentObjectID)", 0, 0, 0))
      {
LABEL_7:
        if ((sub_100007540(v8, @"alter table CLSArchivedHandoutAttachment add column contextSourceIsCatalog integer", 0, 0, 0) & 1) == 0)
        {
          CLSInitLog();
          v9 = CLSLogDatabase;
          if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v10 = "Failed to migrate CLSArchivedHandoutAttachment(1): Could not add column contextSourceIsCatalog";
            v11 = buf;
            goto LABEL_17;
          }
LABEL_14:
          LOBYTE(a3) = 0;
          goto LABEL_15;
        }
LABEL_8:
        if (sub_100007540(v8, @"alter table CLSArchivedHandoutAttachment add column timeExpectation real", 0, 0, 0))
        {
          a3 = 3;
          goto LABEL_10;
        }
        CLSInitLog();
        v9 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          __int16 v13 = 0;
          v10 = "Failed to migrate CLSArchivedHandoutAttachment(2): Could not add column timeExpectation";
          v11 = (uint8_t *)&v13;
LABEL_17:
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
  }
LABEL_15:

  return a3;
}

+ (int64_t)migrationOrder
{
  return 4;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  v5 = [(CLSArchivedHandoutAttachment *)self objectID];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
}

@end