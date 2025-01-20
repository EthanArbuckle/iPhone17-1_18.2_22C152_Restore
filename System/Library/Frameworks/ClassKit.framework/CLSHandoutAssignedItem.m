@interface CLSHandoutAssignedItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (CLSHandoutAssignedItem)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)initWithCKRecord:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSHandoutAssignedItem

+ (id)entityName
{
  return @"CLSHandoutAssignedItem";
}

- (CLSHandoutAssignedItem)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"type");
  id v6 = [v5 intValue];
  v7 = sub_100003BF0(v4, @"title");
  v8 = sub_100003BF0(v4, @"parentObjectID");
  v9 = [(CLSHandoutAssignedItem *)self initWithType:v6 title:v7 handoutAttachmentID:v8];

  if (v9)
  {
    [(CLSHandoutAssignedItem *)v9 _initCommonPropsWithDatabaseRow:v4];
    v10 = sub_100003BF0(v4, @"currentActivityID");
    [(CLSHandoutAssignedItem *)v9 setCurrentActivityID:v10];

    v11 = sub_100003BF0(v4, @"identifier");
    [(CLSHandoutAssignedItem *)v9 setIdentifier:v11];

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v15 = sub_100003BF0(v4, @"bundleIDs");
    if (v15)
    {
      v16 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v14 withData:v15];
      if (v16) {
        [(CLSHandoutAssignedItem *)v9 addBundleIDs:v16];
      }
    }
  }

  return v9;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSHandoutAssignedItem;
  [(CLSHandoutAssignedItem *)&v15 bindTo:v4];
  v5 = [(CLSHandoutAssignedItem *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v5, @"parentObjectID");

  id v6 = [(CLSHandoutAssignedItem *)self title];
  sub_10008C524((uint64_t)v4, v6, @"title");

  v7 = +[NSNumber numberWithInt:[(CLSHandoutAssignedItem *)self type]];
  sub_10008C524((uint64_t)v4, v7, @"type");

  v8 = [(CLSHandoutAssignedItem *)self identifier];
  sub_10008C524((uint64_t)v4, v8, @"identifier");

  v9 = [(CLSHandoutAssignedItem *)self currentActivityID];
  sub_10008C524((uint64_t)v4, v9, @"currentActivityID");

  v10 = [(CLSHandoutAssignedItem *)self bundleIDs];
  if (v10)
  {
    id v14 = 0;
    v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v14];
    id v12 = v14;
    uint64_t v13 = v12;
    if (v12) {
      objc_msgSend(v12, "cls_debug:", CLSLogDatabase);
    }
    sub_10008C524((uint64_t)v4, v11, @"bundleIDs");
  }
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 1) {
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_9:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_10;
  }
  if (sub_100007540(v7, @"create table CLSHandoutAssignedItem (\n    objectID            text not null,\n    parentObjectID      text not null,\n    dateCreated         real not null,\n    dateLastModified    real not null,\n    title               text,\n    identifier          text,\n    appIdentifier       text,\n    type                integer,\n    currentActivityID   text\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSHandoutAssignedItem_objectID on CLSHandoutAssignedItem (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSHandoutAssignedItem_parentObjectID on CLSHandoutAssignedItem (parentObjectID)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create trigger if not exists trigger_cascade_delete_activity_for_delete_objectID\n  after delete\n  on CLSHandoutAssignedItem\n  for each row\n  begin\n  delete from CLSActivity where parentObjectID=OLD.objectID;\n end\n",
                             0,
                             0,
                             0))
        {
LABEL_7:
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"alter table CLSHandoutAssignedItem add column bundleIDs blob", 0, 0, 0))
          {
            a3 = 2;
            goto LABEL_9;
          }
        }
      }
    }
  }
LABEL_10:

  return a3;
}

+ (int64_t)migrationOrder
{
  return 1;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  v5 = [(CLSHandoutAssignedItem *)self objectID];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];

  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
}

+ (id)recordType
{
  return @"CLSHandoutAssignedItem";
}

- (id)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"parentObjectType"];
  uint64_t v6 = CLSHandoutAttachmentTypeFromString();

  id v7 = [v4 objectForKeyedSubscript:@"parentObjectID"];
  v8 = [v4 objectForKeyedSubscript:@"title"];
  v9 = [(CLSHandoutAssignedItem *)self initWithType:v6 title:v8 handoutAttachmentID:v7];
  v10 = v9;
  if (v9)
  {
    [(CLSHandoutAssignedItem *)v9 _initCommonPropsWithRecord:v4];
    v11 = [v4 objectForKeyedSubscript:@"identifier"];
    [(CLSHandoutAssignedItem *)v10 setIdentifier:v11];

    id v12 = [v4 objectForKeyedSubscript:@"currentActivityID"];
    [(CLSHandoutAssignedItem *)v10 setCurrentActivityID:v12];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"bundleIDs"];
    if (v13) {
      [(CLSHandoutAssignedItem *)v10 addBundleIDs:v13];
    }
  }
  return v10;
}

- (void)populate:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLSHandoutAssignedItem;
  id v4 = a3;
  [(CLSHandoutAssignedItem *)&v12 populate:v4];
  v5 = [(CLSHandoutAssignedItem *)self title];
  [v4 setObject:v5 forKeyedSubscript:@"title"];

  uint64_t v6 = [(CLSHandoutAssignedItem *)self identifier];
  [v4 setObject:v6 forKeyedSubscript:@"identifier"];

  id v7 = [(CLSHandoutAssignedItem *)self currentActivityID];
  [v4 setObject:v7 forKeyedSubscript:@"currentActivityID"];

  v8 = [(CLSHandoutAssignedItem *)self parentObjectID];
  [v4 setObject:v8 forKeyedSubscript:@"parentObjectID"];

  [(CLSHandoutAssignedItem *)self type];
  v9 = NSStringFromHandoutAttachmentType();
  [v4 setObject:v9 forKeyedSubscript:@"parentObjectType"];

  v10 = [(CLSHandoutAssignedItem *)self bundleIDs];
  v11 = [v10 allObjects];

  [v4 setObject:v11 forKeyedSubscript:@"bundleIDs"];
}

- (int64_t)syncOrder
{
  return 2;
}

- (int64_t)syncableItemType
{
  return 1;
}

- (NSString)parentReferenceName
{
  return 0;
}

@end