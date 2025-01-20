@interface CLSArchivedMultipleChoiceAnswerItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (int64_t)migrationOrder;
- (id)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSArchivedMultipleChoiceAnswerItem

+ (id)entityName
{
  return @"CLSArchivedMultipleChoiceAnswerItem";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSArchivedMultipleChoiceAnswerItem *)self _init];
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
  return v6;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSArchivedMultipleChoiceAnswerItem;
  id v4 = a3;
  [(CLSArchivedMultipleChoiceAnswerItem *)&v9 bindTo:v4];
  CFStringRef v10 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9.receiver, v9.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSArchivedMultipleChoiceAnswerItem *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = [(CLSArchivedMultipleChoiceAnswerItem *)self itemText];
  sub_10008C524((uint64_t)v4, v7, @"itemText");

  v8 = +[NSNumber numberWithInteger:[(CLSArchivedMultipleChoiceAnswerItem *)self displayOrder]];
  sub_10008C524((uint64_t)v4, v8, @"displayOrder");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSArchivedMultipleChoiceAnswerItem (\n    objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    itemText          text,\n    displayOrder      integer,\nforeign key (parentObjectID) references CLSArchivedMultipleChoiceAnswerFormat(objectID) on delete cascade on update cascade\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSArchivedMultipleChoiceAnswerItem_objectID on CLSArchivedMultipleChoiceAnswerItem (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSArchivedMultipleChoiceAnswerItem_parentObjectID on CLSArchivedMultipleChoiceAnswerItem (parentObjectID)", 0, 0, 0))
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
  id v5 = [(CLSArchivedMultipleChoiceAnswerItem *)self objectID];
  id v7 = v5;
  v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
}

+ (int64_t)migrationOrder
{
  return 5;
}

@end