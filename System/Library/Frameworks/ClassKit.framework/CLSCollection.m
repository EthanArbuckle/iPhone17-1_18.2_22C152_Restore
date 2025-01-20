@interface CLSCollection
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
+ (void)endpointServer:(id)a3 willQueryForObjectWithPredicate:(id)a4;
- (BOOL)willBeProcessedByEndpointServer:(id)a3;
- (CLSCollection)initWithCKRecord:(id)a3;
- (CLSCollection)initWithDatabaseRow:(id)a3;
- (NSArray)immutableColumnNames;
- (NSString)parentReferenceName;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSCollection

- (BOOL)willBeProcessedByEndpointServer:(id)a3
{
  return 1;
}

+ (void)endpointServer:(id)a3 willQueryForObjectWithPredicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_7;
  }
  CLSInitLog();
  v7 = CLSLogCollection;
  if (os_log_type_enabled(CLSLogCollection, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412290;
    id v21 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLSCollection Query predicate: %@", (uint8_t *)&v20, 0xCu);
  }
  v8 = objc_msgSend(v6, "pd_keypathValueMap");
  v9 = [v8 objectForKey:@"type"];
  if (!v9
    || (+[NSNumber numberWithInteger:3],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9 != v10))
  {

LABEL_7:
    v8 = [v5 database];
    v9 = [v5 daemon];
    id v11 = [[PDCollectionSearchOperation alloc] initForCollectionsWithDatabase:v8];
    v12 = [v5 client];
    v13 = sub_10000C6B4(v12);
    [v11 setSourceApplicationBundleIdentifier:v13];

    id v14 = [[PDCollectionSearchOperation alloc] initForCollectionItemsWithDatabase:v8];
    v15 = [v5 client];
    v16 = sub_10000C6B4(v15);
    [v14 setSourceApplicationBundleIdentifier:v16];

    [v14 addDependency:v11];
    v17 = [v9 operationsManager];
    sub_100111240(v17, v11);

    v18 = [v9 operationsManager];
    sub_100111240(v18, v14);

    goto LABEL_8;
  }
  CLSInitLog();
  v19 = CLSLogCollection;
  if (os_log_type_enabled(CLSLogCollection, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CLSCollection Predicate specifies type=Tag.  Not querying endpoint", (uint8_t *)&v20, 2u);
  }
LABEL_8:
}

+ (id)entityName
{
  return @"CLSCollection";
}

- (void)bindTo:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLSCollection;
  id v4 = a3;
  [(CLSCollection *)&v12 bindTo:v4];
  CFStringRef v13 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1, v12.receiver, v12.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  id v6 = [(CLSCollection *)self name];
  sub_10008C524((uint64_t)v4, v6, @"name");

  v7 = +[NSNumber numberWithInteger:[(CLSCollection *)self type]];
  sub_10008C524((uint64_t)v4, v7, @"type");

  v8 = [(CLSCollection *)self location];
  sub_10008C524((uint64_t)v4, v8, @"location");

  v9 = [(CLSCollection *)self iconID];
  sub_10008C524((uint64_t)v4, v9, @"iconID");

  v10 = [(CLSCollection *)self colorName];
  sub_10008C524((uint64_t)v4, v10, @"colorName");

  id v11 = [(CLSCollection *)self dateClassCreated];
  sub_10008C524((uint64_t)v4, v11, @"dateClassCreated");
}

- (CLSCollection)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSCollection *)self _init];
  id v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"location");
    [v6 setLocation:v7];

    v8 = sub_100003BF0(v4, @"name");
    [v6 setName:v8];

    v9 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", objc_msgSend(v9, "integerValue"));

    v10 = sub_100003BF0(v4, @"iconID");
    [v6 setIconID:v10];

    id v11 = sub_100003BF0(v4, @"colorName");
    [v6 setColorName:v11];

    objc_super v12 = sub_1001630C8(v4, @"dateClassCreated");
    [v6 setDateClassCreated:v12];

    BOOL v13 = [v6 type] == (id)2 || objc_msgSend(v6, "type") == (id)5;
    [v6 setEnforceImmutability:v13];
  }

  return (CLSCollection *)v6;
}

- (NSArray)immutableColumnNames
{
  v4[0] = @"name";
  v4[1] = @"type";
  v4[2] = @"iconID";
  v4[3] = @"location";
  v4[4] = @"colorName";
  v4[5] = @"dateClassCreated";
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return (NSArray *)v2;
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 2) {
    goto LABEL_7;
  }
  if (a3 == 1) {
    goto LABEL_17;
  }
  if (a3)
  {
LABEL_13:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_14;
  }
  if (sub_100007540(v7, @"create table CLSCollection(   objectID           text not null,    name               text not null,    type               integer,    dateCreated        real not null,    dateLastModified   real not null,    location           text not null,    appIdentifier      text not null,    iconID             text,    colorName          text)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSCollection_objectID on CLSCollection (objectID)", 0, 0, 0))
    {
LABEL_17:
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"alter table CLSCollection add column dateClassCreated real", 0, 0, 0))
      {
LABEL_7:
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create table CLSCollection_copy (\n    objectID           text not null,\n    name               text not null,\n    type               integer,\n    dateCreated        real not null,\n    dateLastModified   real not null,\n    location           text not null,\n    iconID             text,\n    colorName          text,\n    dateClassCreated   real\n)", 0, 0, 0))
        {
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"insert into CLSCollection_copy (objectID, name, type, dateCreated, dateLastModified, location, iconID, colorName, dateClassCreated) select objectID, name, type, dateCreated, dateLastModified, location, iconID, colorName, dateClassCreated from CLSCollection", 0, 0, 0))
          {
            LOBYTE(a3) = 0;
            if (sub_100007540(v8, @"drop table CLSCollection", 0, 0, 0))
            {
              LOBYTE(a3) = 0;
              if (sub_100007540(v8, @"alter table CLSCollection_copy rename to CLSCollection", 0, 0, 0))
              {
                LOBYTE(a3) = 0;
                if (sub_100007540(v8, @"create unique index if not exists CLSCollection_objectID on CLSCollection (objectID)", 0, 0, 0))
                {
                  a3 = 3;
                  goto LABEL_13;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_14:

  return a3;
}

+ (int64_t)migrationOrder
{
  return 1;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSCollection *)self objectID];
  if ([(CLSCollection *)self type] == (id)2 || [(CLSCollection *)self type] == (id)5)
  {
    id v7 = v5;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
  }
}

+ (id)recordType
{
  return @"CLSCollection";
}

- (int64_t)syncableItemType
{
  return 1;
}

- (CLSCollection)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSCollection *)self _init];
  id v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    id v7 = [v4 objectForKeyedSubscript:@"name"];
    [v6 setName:v7];

    v8 = [v4 objectForKeyedSubscript:@"type"];
    [v6 setType:CLSCollectionTypeFromString()];

    v9 = [v4 objectForKeyedSubscript:@"colorName"];
    [v6 setColorName:v9];

    v10 = [v4 objectForKeyedSubscript:@"iconID"];
    [v6 setIconID:v10];

    id v11 = [v4 objectForKeyedSubscript:@"location"];
    [v6 setLocation:v11];
  }
  return (CLSCollection *)v6;
}

- (void)populate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSCollection;
  id v4 = a3;
  [(CLSCollection *)&v10 populate:v4];
  id v5 = [(CLSCollection *)self name];
  [v4 setObject:v5 forKeyedSubscript:@"name"];

  [(CLSCollection *)self type];
  id v6 = NSStringFromCollectionType();
  [v4 setObject:v6 forKeyedSubscript:@"type"];

  id v7 = [(CLSCollection *)self colorName];
  [v4 setObject:v7 forKeyedSubscript:@"colorName"];

  v8 = [(CLSCollection *)self iconID];
  [v4 setObject:v8 forKeyedSubscript:@"iconID"];

  v9 = [(CLSCollection *)self location];
  [v4 setObject:v9 forKeyedSubscript:@"location"];

  [(CLSCollection *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  return [(CLSCollection *)self type] != (id)2 && [(CLSCollection *)self type] != (id)5;
}

- (int64_t)syncOrder
{
  return 20;
}

- (NSString)parentReferenceName
{
  return 0;
}

@end