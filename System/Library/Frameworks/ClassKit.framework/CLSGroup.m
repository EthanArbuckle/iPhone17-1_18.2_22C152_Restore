@interface CLSGroup
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)searchColumnName;
+ (int64_t)migrationOrder;
- (CLSGroup)initWithDatabaseRow:(id)a3;
- (NSArray)immutableColumnNames;
- (NSArray)searchableColumnNames;
- (NSArray)tokenizableColumnNames;
- (void)bindTo:(id)a3;
- (void)setExpiration:(double)a3;
@end

@implementation CLSGroup

+ (id)entityName
{
  return @"CLSGroup";
}

+ (id)searchColumnName
{
  return @"searchText";
}

- (NSArray)searchableColumnNames
{
  v4[0] = @"groupName";
  v4[1] = @"emailAddress";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

- (NSArray)tokenizableColumnNames
{
  CFStringRef v4 = @"groupName";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (CLSGroup)initWithDatabaseRow:(id)a3
{
  CFStringRef v4 = (uint64_t *)a3;
  id v5 = [(CLSGroup *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"groupName");
    [v6 setGroupName:v7];

    v8 = sub_100003BF0(v4, @"emailAddress");
    [v6 setEmailAddress:v8];

    v9 = sub_100003BF0(v4, @"locationID");
    [v6 setLocationID:v9];

    v10 = sub_100003BF0(v4, @"searchText");
    [v6 setSearchText:v10];
  }
  return (CLSGroup *)v6;
}

- (void)bindTo:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSGroup;
  id v4 = a3;
  [(CLSGroup *)&v10 bindTo:v4];
  CFStringRef v11 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, v10.receiver, v10.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSGroup *)self groupName];
  sub_10008C524((uint64_t)v4, v6, @"groupName");

  v7 = [(CLSGroup *)self locationID];
  sub_10008C524((uint64_t)v4, v7, @"locationID");

  v8 = [(CLSGroup *)self emailAddress];
  sub_10008C524((uint64_t)v4, v8, @"emailAddress");

  v9 = [(CLSGroup *)self searchText];
  sub_10008C524((uint64_t)v4, v9, @"searchText");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSGroup (\n    objectID            text not null,\n    dateCreated         real not null,\n    dateLastModified    real not null,\n    dateExpires         real,\n    groupName           text not null,\n    emailAddress        text,\n    locationID          text,\n    searchText          text\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSGroup_objectID on CLSGroup (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSGroup_searchText on CLSGroup (searchText)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index if not exists CLSGroup_dateExpires on CLSGroup (dateExpires)", 0, 0, 0))
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
  return 1;
}

- (void)setExpiration:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CLSGroup;
  [(CLSGroup *)&v3 setExpiration:a3];
}

@end