@interface CLSLocation
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)searchColumnName;
- (CLSLocation)initWithDatabaseRow:(id)a3;
- (NSArray)immutableColumnNames;
- (NSArray)searchableColumnNames;
- (void)bindTo:(id)a3;
@end

@implementation CLSLocation

+ (id)entityName
{
  return @"CLSLocation";
}

+ (id)searchColumnName
{
  return @"searchText";
}

- (NSArray)searchableColumnNames
{
  CFStringRef v4 = @"locationName";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (CLSLocation)initWithDatabaseRow:(id)a3
{
  CFStringRef v4 = (uint64_t *)a3;
  id v5 = [(CLSLocation *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"locationName");
    [v6 setLocationName:v7];

    v8 = sub_100003BF0(v4, @"searchText");
    [v6 setSearchText:v8];

    v9 = sub_100003BF0(v4, @"sourceType");
    objc_msgSend(v6, "setSourceType:", (int)objc_msgSend(v9, "intValue"));

    v10 = sub_100003BF0(v4, @"isEditable");
    objc_msgSend(v6, "setIsEditable:", objc_msgSend(v10, "BOOLValue"));
  }
  return (CLSLocation *)v6;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSLocation;
  id v4 = a3;
  [(CLSLocation *)&v9 bindTo:v4];
  id v5 = [(CLSLocation *)self locationName];
  sub_10008C524((uint64_t)v4, v5, @"locationName");

  v6 = [(CLSLocation *)self searchText];
  sub_10008C524((uint64_t)v4, v6, @"searchText");

  v7 = +[NSNumber numberWithInteger:[(CLSLocation *)self sourceType]];
  sub_10008C524((uint64_t)v4, v7, @"sourceType");

  v8 = +[NSNumber numberWithBool:[(CLSLocation *)self isEditable]];
  sub_10008C524((uint64_t)v4, v8, @"isEditable");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 2) {
    goto LABEL_8;
  }
  if (a3 == 1) {
    goto LABEL_14;
  }
  if (a3)
  {
LABEL_10:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_11;
  }
  if (sub_100007540(v7, @"create table CLSLocation (\n    objectID               text not null,\n    dateCreated            real not null,\n    dateLastModified       real not null,\n    locationName           text,\n    sourceType             integer,\n    isEditable             integer\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSLocation_objectID on CLSLocation (objectID)", 0, 0, 0))
    {
LABEL_14:
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"alter table CLSLocation add column searchText text", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index if not exists CLSLocation_searchText on CLSLocation (searchText)", 0, 0, 0))
        {
LABEL_8:
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"alter table CLSLocation add column dateExpires real", 0, 0, 0))
          {
            a3 = 3;
            goto LABEL_10;
          }
        }
      }
    }
  }
LABEL_11:

  return a3;
}

@end