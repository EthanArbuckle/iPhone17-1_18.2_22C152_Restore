@interface CLSOrganization
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)searchColumnName;
- (NSArray)immutableColumnNames;
- (NSArray)searchableColumnNames;
- (NSArray)tokenizableColumnNames;
- (id)initWithDatabaseRow:(id)a3;
- (id)tokensForSearchableColumn:(id)a3 withValue:(id)a4 tokenize:(BOOL)a5;
- (unint64_t)changeHash;
- (void)bindTo:(id)a3;
@end

@implementation CLSOrganization

+ (id)entityName
{
  return @"CLSOrganization";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSOrganization *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"name");
    [v6 setName:v7];

    v8 = sub_100003BF0(v4, @"searchText");
    [v6 setSearchText:v8];

    v9 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", (int)objc_msgSend(v9, "intValue"));

    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = sub_100003BF0(v4, @"locationIDs");
    if (v12)
    {
      v13 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v11 withData:v12];
      [v6 setLocationIDs:v13];
    }
    else
    {
      [v6 setLocationIDs:&__NSArray0__struct];
    }
    v14 = sub_100003BF0(v4, @"emailDomains");

    if (v14)
    {
      v15 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v11 withData:v14];
      [v6 setEmailDomains:v15];
    }
    else
    {
      [v6 setEmailDomains:&__NSArray0__struct];
    }
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLSOrganization;
  [(CLSOrganization *)&v18 bindTo:v4];
  id v5 = [(CLSOrganization *)self name];
  sub_10008C524((uint64_t)v4, v5, @"name");

  v6 = [(CLSOrganization *)self searchText];
  sub_10008C524((uint64_t)v4, v6, @"searchText");

  v7 = +[NSNumber numberWithInteger:[(CLSOrganization *)self type]];
  sub_10008C524((uint64_t)v4, v7, @"type");

  v8 = [(CLSOrganization *)self locationIDs];
  if (v8)
  {
    id v17 = 0;
    v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v17];
    id v10 = v17;
    v11 = v10;
    if (v10) {
      objc_msgSend(v10, "cls_debug:", CLSLogDatabase);
    }
    sub_10008C524((uint64_t)v4, v9, @"locationIDs");
  }
  v12 = [(CLSOrganization *)self emailDomains];
  if (v12)
  {
    id v16 = 0;
    v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v16];
    id v14 = v16;
    v15 = v14;
    if (v14) {
      objc_msgSend(v14, "cls_debug:", CLSLogDatabase);
    }
    sub_10008C524((uint64_t)v4, v13, @"emailDomains");
  }
}

- (unint64_t)changeHash
{
  v7.receiver = self;
  v7.super_class = (Class)CLSOrganization;
  unint64_t v3 = [(CLSOrganization *)&v7 changeHash];
  id v4 = [(CLSOrganization *)self name];
  unint64_t v5 = (unint64_t)objc_msgSend(v4, "_cls_stableHash") ^ v3;

  return v5 ^ (2 * (void)[(CLSOrganization *)self type]);
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSOrganization (\n    objectID               text not null,\n    dateCreated            real not null,\n    dateLastModified       real not null,\n    dateExpires            real,\n    name                   text not null,\n    type                   integer,\n    locationIDs            blob,\n    emailDomains           blob,\n    searchText             text\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSOrganization_objectID on CLSOrganization (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSOrganization_searchText on CLSOrganization (searchText)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index if not exists CLSOrganization_dateExpires on CLSOrganization (dateExpires)", 0, 0, 0))
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

+ (id)searchColumnName
{
  return @"searchText";
}

- (NSArray)searchableColumnNames
{
  CFStringRef v4 = @"emailDomains";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)tokenizableColumnNames
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (id)tokensForSearchableColumn:(id)a3 withValue:(id)a4 tokenize:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  id v10 = 0;
  if (v7 && v8)
  {
    if ([v7 isEqualToString:@"emailDomains"])
    {
      v11 = [(CLSOrganization *)self emailDomains];
      id v10 = +[NSSet setWithArray:v11];
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

@end