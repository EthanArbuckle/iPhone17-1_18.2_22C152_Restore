@interface CLSArchivedHandout
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (int64_t)migrationOrder;
- (id)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSArchivedHandout

+ (id)entityName
{
  return @"CLSArchivedHandout";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = [(CLSArchivedHandout *)self init];
  v6 = v5;
  if (v5)
  {
    [(CLSArchivedHandout *)v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"title");
    [(CLSArchivedHandout *)v6 setTitle:v7];

    v8 = sub_100003BF0(v4, @"instructions");
    [(CLSArchivedHandout *)v6 setInstructions:v8];

    v9 = sub_1001630C8(v4, @"dueDate");
    [(CLSArchivedHandout *)v6 setDueDate:v9];

    v10 = sub_100003BF0(v4, @"appIdentifier");
    [(CLSArchivedHandout *)v6 setAppIdentifier:v10];

    v11 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSArchivedHandout *)v6 setParentObjectID:v11];

    v12 = sub_1001630C8(v4, @"dateOfPublication");
    [(CLSArchivedHandout *)v6 setDateOfPublication:v12];

    v13 = sub_100003BF0(v4, @"version");
    -[CLSArchivedHandout setVersion:](v6, "setVersion:", [v13 integerValue]);
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLSArchivedHandout;
  id v4 = a3;
  [(CLSArchivedHandout *)&v12 bindTo:v4];
  v5 = [(CLSArchivedHandout *)self dueDate];
  sub_10008C524((uint64_t)v4, v5, @"dueDate");

  v6 = [(CLSArchivedHandout *)self instructions];
  sub_10008C524((uint64_t)v4, v6, @"instructions");

  v7 = [(CLSArchivedHandout *)self title];
  sub_10008C524((uint64_t)v4, v7, @"title");

  v8 = [(CLSArchivedHandout *)self appIdentifier];
  sub_10008C524((uint64_t)v4, v8, @"appIdentifier");

  v9 = [(CLSArchivedHandout *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v9, @"parentObjectID");

  v10 = [(CLSArchivedHandout *)self dateOfPublication];
  sub_10008C524((uint64_t)v4, v10, @"dateOfPublication");

  v11 = +[NSNumber numberWithInteger:[(CLSArchivedHandout *)self version]];
  sub_10008C524((uint64_t)v4, v11, @"version");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 1) {
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_7:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_8;
  }
  if (sub_100007540(v7, @"create table CLSArchivedHandout(   objectID            text not null,    appIdentifier       text not null,    dateCreated         real not null,    dateLastModified    real not null,    dateOfPublication   real,    dueDate             real,    instructions        text,    title               text,    parentObjectID      text)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSArchivedHandout_objectID on CLSArchivedHandout (objectID)", 0, 0, 0))
    {
LABEL_5:
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"alter table CLSArchivedHandout add column version integer default 0", 0, 0, 0))
      {
        a3 = 2;
        goto LABEL_7;
      }
    }
  }
LABEL_8:

  return a3;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  v5 = [(CLSArchivedHandout *)self objectID];
  id v7 = v5;
  v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
}

+ (int64_t)migrationOrder
{
  return 3;
}

@end