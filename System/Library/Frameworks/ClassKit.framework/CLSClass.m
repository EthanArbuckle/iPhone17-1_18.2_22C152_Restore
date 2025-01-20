@interface CLSClass
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)searchColumnName;
+ (int64_t)migrationOrder;
- (CLSClass)initWithDatabaseRow:(id)a3;
- (NSArray)immutableColumnNames;
- (NSArray)searchableColumnNames;
- (void)bindTo:(id)a3;
- (void)setExpiration:(double)a3;
@end

@implementation CLSClass

+ (id)entityName
{
  return @"CLSClass";
}

+ (id)searchColumnName
{
  return @"searchText";
}

- (NSArray)searchableColumnNames
{
  v4[0] = @"className";
  v4[1] = @"customClassName";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

- (NSArray)immutableColumnNames
{
  CFStringRef v4 = @"dateExpires";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (CLSClass)initWithDatabaseRow:(id)a3
{
  CFStringRef v4 = (uint64_t *)a3;
  id v5 = [(CLSClass *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"className");
    [v6 setClassName:v7];

    v8 = sub_100003BF0(v4, @"source");
    objc_msgSend(v6, "setSource:", (int)objc_msgSend(v8, "intValue"));

    v9 = sub_100003BF0(v4, @"customClassName");
    [v6 setCustomClassName:v9];

    v10 = sub_100003BF0(v4, @"locationID");
    [v6 setLocationID:v10];

    v11 = sub_100003BF0(v4, @"iconID");
    [v6 setIconID:v11];

    v12 = sub_100003BF0(v4, @"searchText");
    [v6 setSearchText:v12];

    v13 = sub_100003BF0(v4, @"isEditable");
    objc_msgSend(v6, "setIsEditable:", objc_msgSend(v13, "BOOLValue"));

    v14 = sub_100003BF0(v4, @"originatingSource");
    objc_msgSend(v6, "setOriginatingSource:", (int)objc_msgSend(v14, "intValue"));

    v15 = sub_100003BF0(v4, @"tempObjectID");
    [v6 setTempObjectID:v15];
  }
  return (CLSClass *)v6;
}

- (void)bindTo:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CLSClass;
  id v4 = a3;
  [(CLSClass *)&v15 bindTo:v4];
  CFStringRef v16 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1, v15.receiver, v15.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSClass *)self className];
  sub_10008C524((uint64_t)v4, v6, @"className");

  v7 = [(CLSClass *)self customClassName];
  sub_10008C524((uint64_t)v4, v7, @"customClassName");

  v8 = +[NSNumber numberWithInteger:[(CLSClass *)self source]];
  sub_10008C524((uint64_t)v4, v8, @"source");

  v9 = [(CLSClass *)self locationID];
  sub_10008C524((uint64_t)v4, v9, @"locationID");

  v10 = [(CLSClass *)self iconID];
  sub_10008C524((uint64_t)v4, v10, @"iconID");

  v11 = [(CLSClass *)self searchText];
  sub_10008C524((uint64_t)v4, v11, @"searchText");

  v12 = +[NSNumber numberWithBool:[(CLSClass *)self isEditable]];
  sub_10008C524((uint64_t)v4, v12, @"isEditable");

  v13 = +[NSNumber numberWithInteger:[(CLSClass *)self originatingSource]];
  sub_10008C524((uint64_t)v4, v13, @"originatingSource");

  v14 = [(CLSClass *)self tempObjectID];
  sub_10008C524((uint64_t)v4, v14, @"tempObjectID");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 2) {
    goto LABEL_19;
  }
  if (a3 == 1) {
    goto LABEL_32;
  }
  if (a3)
  {
LABEL_28:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_29;
  }
  if (sub_100007540(v7, @"create table CLSClass(   objectID            text not null,    dateCreated         real not null,    dateLastModified    real not null,    className           text not null)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSClass_objectID on CLSClass (objectID)", 0, 0, 0))
    {
LABEL_32:
      int v9 = sub_100007540(v8, @"alter table CLSClass add column source integer", 0, 0, 0);
      int v10 = sub_100007540(v8, @"alter table CLSClass add column customClassName text", 0, 0, 0);
      int v11 = sub_100007540(v8, @"alter table CLSClass add column appIdentifier text", 0, 0, 0);
      int v12 = sub_100007540(v8, @"alter table CLSClass add column iconID text", 0, 0, 0);
      int v13 = sub_100007540(v8, @"alter table CLSClass add column locationID text", 0, 0, 0);
      int v14 = sub_100007540(v8, @"alter table CLSClass add column isEditable integer", 0, 0, 0);
      LOBYTE(a3) = 0;
      if (v11)
      {
        if (v9)
        {
          if (v10)
          {
            if (v12)
            {
              if (v13)
              {
                if (v14)
                {
                  LOBYTE(a3) = 0;
                  if (sub_100007540(v8, @"alter table CLSClass add column searchText text", 0, 0, 0))
                  {
                    LOBYTE(a3) = 0;
                    if (sub_100007540(v8, @"create index if not exists CLSClass_searchText on CLSClass (searchText)", 0, 0, 0))
                    {
                      LOBYTE(a3) = 0;
                      if (sub_100007540(v8, @"create index if not exists CLSClass_locationID on CLSClass (locationID)", 0, 0, 0))
                      {
                        LOBYTE(a3) = 0;
                        if (sub_100007540(v8, @"alter table CLSClass add column tempObjectID text", 0, 0, 0))
                        {
                          LOBYTE(a3) = 0;
                          if (sub_100007540(v8, @"alter table CLSClass add column dateExpires real", 0, 0, 0))
                          {
                            LOBYTE(a3) = 0;
                            if (sub_100007540(v8, @"create index if not exists CLSClass_dateExpires on CLSClass (dateExpires)", 0, 0, 0))
                            {
                              LOBYTE(a3) = 0;
                              if (sub_100007540(v8, @"alter table CLSClass add column originatingSource integer", 0, 0, 0))
                              {
LABEL_19:
                                LOBYTE(a3) = 0;
                                if (sub_100007540(v8, @"create table CLSClass_temp (\n    objectID            text not null,\n    dateCreated         real not null,\n    dateLastModified    real not null,\n    className           text not null,\n    source              integer,\n    customClassName     text,\n    iconID              text,\n    locationID          text,\n    isEditable          integer,\n    searchText          text,\n    tempObjectID        text,\n    dateExpires         real,\n    originatingSource   integer\n)\n", 0, 0, 0))
                                {
                                  LOBYTE(a3) = 0;
                                  if (sub_100007540(v8, @"insert into CLSClass_temp select objectID, dateCreated, dateLastModified, className, source, customClassName, iconID, locationID, isEditable, searchText, tempObjectID, dateExpires, originatingSource from CLSClass", 0, 0, 0))
                                  {
                                    LOBYTE(a3) = 0;
                                    if (sub_100007540(v8, @"drop table CLSClass", 0, 0, 0))
                                    {
                                      LOBYTE(a3) = 0;
                                      if (sub_100007540(v8, @"create unique index if not exists CLSClass_objectID on CLSClass_temp (objectID)", 0, 0, 0))
                                      {
                                        LOBYTE(a3) = 0;
                                        if (sub_100007540(v8, @"create index if not exists CLSClass_searchText on CLSClass_temp (searchText)", 0, 0, 0))
                                        {
                                          LOBYTE(a3) = 0;
                                          if (sub_100007540(v8, @"create index if not exists CLSClass_locationID on CLSClass_temp (locationID)", 0, 0, 0))
                                          {
                                            LOBYTE(a3) = 0;
                                            if (sub_100007540(v8, @"create index if not exists CLSClass_dateExpires on CLSClass_temp (dateExpires)", 0, 0, 0))
                                            {
                                              LOBYTE(a3) = 0;
                                              if (sub_100007540(v8, @"alter table CLSClass_temp rename to CLSClass", 0, 0, 0))
                                              {
                                                a3 = 3;
                                                goto LABEL_28;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_29:

  return a3;
}

+ (int64_t)migrationOrder
{
  return 1;
}

- (void)setExpiration:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CLSClass;
  [(CLSClass *)&v3 setExpiration:a3];
}

@end