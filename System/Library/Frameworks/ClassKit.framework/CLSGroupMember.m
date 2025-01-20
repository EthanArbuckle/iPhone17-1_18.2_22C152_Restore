@interface CLSGroupMember
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (int64_t)migrationOrder;
- (CLSGroupMember)initWithDatabaseRow:(id)a3;
- (NSArray)immutableColumnNames;
- (void)bindTo:(id)a3;
@end

@implementation CLSGroupMember

+ (id)entityName
{
  return @"CLSGroupMember";
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (CLSGroupMember)initWithDatabaseRow:(id)a3
{
  CFStringRef v4 = (uint64_t *)a3;
  id v5 = [(CLSGroupMember *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"personID");
    [v6 setPersonID:v8];
  }
  return (CLSGroupMember *)v6;
}

- (void)bindTo:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSGroupMember;
  id v4 = a3;
  [(CLSGroupMember *)&v8 bindTo:v4];
  CFStringRef v9 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1, v8.receiver, v8.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSGroupMember *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = [(CLSGroupMember *)self personID];
  sub_10008C524((uint64_t)v4, v7, @"personID");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSGroupMember (\n    objectID            text not null,\n    parentObjectID      text not null,\n    dateCreated         real not null,\n    dateLastModified    real not null,\n    personID            text not null,\n    dateExpires         real,\n    foreign key (parentObjectID) references CLSGroup(objectID) on delete cascade on update cascade\n    foreign key (personID) references CLSPerson(objectID) on delete cascade on update cascade\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSGroupMember_objectID on CLSGroupMember (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSGroupMember_parentObjectID on CLSGroupMember (parentObjectID)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index if not exists CLSGroupMember_dateExpires on CLSGroupMember(dateExpires)", 0, 0, 0))
        {
          a3 = 1;
LABEL_2:
          *a4 = a3;
          LOBYTE(a3) = 1;
        }
      }
    }
  }

  return a3;
}

+ (int64_t)migrationOrder
{
  return 2;
}

@end