@interface CLSCollectionItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (CLSCollectionItem)initWithCKRecord:(id)a3;
- (CLSCollectionItem)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSCollectionItem

+ (id)recordType
{
  return @"CLSCollectionItem";
}

- (int64_t)syncableItemType
{
  return 1;
}

- (CLSCollectionItem)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSCollectionItem *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    v7 = [v4 objectForKeyedSubscript:@"type"];
    [v6 setType:CLSCollectionItemTypeFromString()];

    v8 = [v4 objectForKeyedSubscript:@"referenceObjectID"];
    [v6 setReferenceObjectID:v8];

    v9 = [v4 objectForKeyedSubscript:@"displayOrder"];
    objc_msgSend(v6, "setDisplayOrder:", objc_msgSend(v9, "unsignedIntegerValue"));
  }
  return (CLSCollectionItem *)v6;
}

- (void)populate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSCollectionItem;
  id v4 = a3;
  [(CLSCollectionItem *)&v8 populate:v4];
  [(CLSCollectionItem *)self type];
  id v5 = NSStringFromCollectionItemType();
  [v4 setObject:v5 forKeyedSubscript:@"type"];

  v6 = [(CLSCollectionItem *)self referenceObjectID];
  [v4 setObject:v6 forKeyedSubscript:@"referenceObjectID"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(CLSCollectionItem *)self displayOrder]];
  [v4 setObject:v7 forKeyedSubscript:@"displayOrder"];

  [(CLSCollectionItem *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  v3 = [(CLSCollectionItem *)self parent];
  int64_t v4 = [v3 type] != (id)2 && objc_msgSend(v3, "type") != (id)5;

  return v4;
}

- (int64_t)syncOrder
{
  return 21;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"parentCollection";
}

+ (id)entityName
{
  return @"CLSCollectionItem";
}

- (void)bindTo:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSCollectionItem;
  id v4 = a3;
  [(CLSCollectionItem *)&v10 bindTo:v4];
  CFStringRef v11 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, v10.receiver, v10.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSCollectionItem *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = +[NSNumber numberWithInteger:[(CLSCollectionItem *)self type]];
  sub_10008C524((uint64_t)v4, v7, @"type");

  objc_super v8 = [(CLSCollectionItem *)self referenceObjectID];
  sub_10008C524((uint64_t)v4, v8, @"referenceObjectID");

  v9 = +[NSNumber numberWithUnsignedInteger:[(CLSCollectionItem *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v9, @"displayOrder");
}

- (CLSCollectionItem)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSCollectionItem *)self _init];
  [v5 _initCommonPropsWithDatabaseRow:v4];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"parentObjectID");
    [v5 setParentObjectID:v6];

    v7 = sub_100003BF0(v4, @"type");
    objc_msgSend(v5, "setType:", objc_msgSend(v7, "integerValue"));

    objc_super v8 = sub_100003BF0(v4, @"referenceObjectID");
    [v5 setReferenceObjectID:v8];

    v9 = sub_100003BF0(v4, @"displayOrder");
    objc_msgSend(v5, "setDisplayOrder:", objc_msgSend(v9, "unsignedIntegerValue"));
  }
  return (CLSCollectionItem *)v5;
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  switch(a3)
  {
    case 0uLL:
      BOOL v9 = 0;
      if (sub_100007540(v7, @"create table CLSCollectionItem(   objectID           text not null,    parentObjectID     text not null,    type               integer,    dateCreated        real not null,    dateLastModified   real not null,    referenceObjectID  text not null,    appIdentifier      text not null,foreign key (parentObjectID) references CLSCollection(objectID) on delete cascade on update cascade)", 0, 0, 0))
      {
        BOOL v9 = 0;
        if (sub_100007540(v8, @"create unique index if not exists CLSCollectionItem_objectID on CLSCollectionItem (objectID)", 0, 0, 0))
        {
          BOOL v9 = 0;
          if (sub_100007540(v8, @"create index if not exists CLSCollectionItem_parentObjectID on CLSCollectionItem (parentObjectID)", 0, 0, 0))goto LABEL_5; {
        }
          }
      }
      goto LABEL_33;
    case 1uLL:
LABEL_5:
      if (sub_100007540(v8, @"create index if not exists CLSCollectionItem_referenceObjectID on CLSCollectionItem (referenceObjectID)", 0, 0, 0))goto LABEL_6; {
      CLSInitLog();
      }
      objc_super v10 = CLSLogDatabase;
      if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_WORD *)v13 = 0;
      CFStringRef v11 = "Failed to migrate CLSCollectionItem(1): Could not add index referenceObjectID";
      goto LABEL_31;
    case 2uLL:
LABEL_6:
      if (sub_100007540(v8, @"alter table CLSCollectionItem add column displayOrder integer default 0", 0, 0, 0))goto LABEL_7; {
      CLSInitLog();
      }
      objc_super v10 = CLSLogDatabase;
      if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_WORD *)v13 = 0;
      CFStringRef v11 = "Failed to migrate CLSCollectionItem(2): Could not add column displayOrder";
      goto LABEL_31;
    case 3uLL:
LABEL_7:
      if ((sub_100007540(v8, @"create table CLSCollectionItem_copy (\n    objectID           text not null,\n    parentObjectID     text not null,\n    type               integer,\n    dateCreated        real not null,\n    dateLastModified   real not null,\n    referenceObjectID  text not null,\n    displayOrder       integer default 0,\nforeign key (parentObjectID) references CLSCollection(objectID) on delete cascade on update cascade)", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        objc_super v10 = CLSLogDatabase;
        if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        *(_WORD *)v13 = 0;
        CFStringRef v11 = "Failed to migrate CLSCollectionItem(3): Could not create new table CLSCollectionItem_copy";
LABEL_31:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, v13, 2u);
        goto LABEL_32;
      }
      if ((sub_100007540(v8, @"insert into CLSCollectionItem_copy select objectID, parentObjectID, type, dateCreated, dateLastModified, referenceObjectID, displayOrder from CLSCollectionItem", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        objc_super v10 = CLSLogDatabase;
        if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        *(_WORD *)v13 = 0;
        CFStringRef v11 = "Failed to migrate CLSCollectionItem(3): Could not insert records into new table CLSCollectionItem_copy";
        goto LABEL_31;
      }
      if ((sub_100007540(v8, @"drop table CLSCollectionItem", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        objc_super v10 = CLSLogDatabase;
        if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        *(_WORD *)v13 = 0;
        CFStringRef v11 = "Failed to migrate CLSCollectionItem(3): Could not drop table CLSCollectionItem";
        goto LABEL_31;
      }
      if ((sub_100007540(v8, @"alter table CLSCollectionItem_copy rename to CLSCollectionItem", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        objc_super v10 = CLSLogDatabase;
        if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        *(_WORD *)v13 = 0;
        CFStringRef v11 = "Failed to migrate CLSCollectionItem(3): Could not rename table CLSCollectionItem_copy";
        goto LABEL_31;
      }
      if ((sub_100007540(v8, @"create unique index if not exists CLSCollectionItem_objectID on CLSCollectionItem (objectID)", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        objc_super v10 = CLSLogDatabase;
        if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        *(_WORD *)v13 = 0;
        CFStringRef v11 = "Failed to migrate CLSCollectionItem(3): Could not add unique index CLSCollectionItem_objectID";
        goto LABEL_31;
      }
      if ((sub_100007540(v8, @"create index if not exists CLSCollectionItem_parentObjectID on CLSCollectionItem (parentObjectID)", 0, 0, 0) & 1) == 0)
      {
        CLSInitLog();
        objc_super v10 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          CFStringRef v11 = "Failed to migrate CLSCollectionItem(3): Could not add index CLSCollectionItem_parentObjectID";
          goto LABEL_31;
        }
LABEL_32:
        BOOL v9 = 0;
        goto LABEL_33;
      }
      *a4 = 4;
LABEL_14:
      BOOL v9 = 1;
LABEL_33:

      return v9;
    default:
      goto LABEL_14;
  }
}

+ (int64_t)migrationOrder
{
  return 2;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSCollectionItem *)self referenceObjectID];
  if ([(CLSCollectionItem *)self type] == (id)2)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(CLSCollectionItem *)self parentObjectID];
    objc_super v8 = [v4 select:v6 identity:v7];

    if (v8 && ([v8 type] == (id)2 || objc_msgSend(v8, "type") == (id)5))
    {
      objc_super v10 = v5;
      BOOL v9 = +[NSArray arrayWithObjects:&v10 count:1];
      [v4 deleteAll:objc_opt_class() where:@"objectID = ?" bindings:v9];
    }
  }
}

@end