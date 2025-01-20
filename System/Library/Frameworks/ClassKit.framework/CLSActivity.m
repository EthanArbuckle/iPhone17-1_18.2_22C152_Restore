@interface CLSActivity
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int)entityType;
+ (int)syncType;
+ (int64_t)migrationOrder;
- (CLSActivity)initWithCKRecord:(id)a3;
- (CLSActivity)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)generateInsightEventsWithDatabase:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSActivity

+ (id)recordType
{
  return @"CLSActivity";
}

- (CLSActivity)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = (CLSActivity *)[(CLSActivity *)self _init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"parentEntityName"];
    [(CLSActivity *)v5 setParentEntityName:v6];

    [(CLSActivity *)v5 _initCommonPropsWithRecord:v4];
    v7 = [v4 objectForKeyedSubscript:@"primaryActivityItemIdentifier"];
    [(CLSActivity *)v5 setPrimaryActivityItemIdentifier:v7];
  }
  return v5;
}

- (void)populate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSActivity;
  id v4 = a3;
  [(CLSActivity *)&v7 populate:v4];
  v5 = [(CLSActivity *)self primaryActivityItemIdentifier];
  [v4 setObject:v5 forKeyedSubscript:@"primaryActivityItemIdentifier"];

  v6 = [(CLSActivity *)self parentEntityName];
  [v4 setObject:v6 forKeyedSubscript:@"parentEntityName"];

  [(CLSActivity *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncOrder
{
  return 15;
}

- (int64_t)syncableItemType
{
  return 1;
}

- (NSString)parentReferenceName
{
  v2 = [(CLSActivity *)self parentEntityName];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = [v2 isEqualToString:v4];

  if (v5) {
    return (NSString *)@"handoutAssignedItem";
  }
  else {
    return (NSString *)@"context";
  }
}

- (id)generateInsightEventsWithDatabase:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CLSActivity *)self primaryActivityItemIdentifier];

  if (v5)
  {
    v6 = sub_10004C864(v4, self, 206, 0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = [(CLSActivity *)self objectID];
          [v13 setActivityID:v14];

          v15 = [(CLSActivity *)self parentObjectID];
          [v13 setParentObjectID:v15];

          v16 = [(CLSActivity *)self primaryActivityItemIdentifier];
          [v13 setPrimaryActivityItemIdentifier:v16];
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

+ (id)entityName
{
  return @"CLSActivity";
}

- (CLSActivity)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  unsigned int v5 = (CLSActivity *)[(CLSActivity *)self _init];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"parentEntityName");
    [(CLSActivity *)v5 _initCommonPropsWithDatabaseRow:v4];
    objc_super v7 = sub_100003BF0(v4, @"primaryActivityItemIdentifier");
    [(CLSActivity *)v5 setPrimaryActivityItemIdentifier:v7];

    [(CLSActivity *)v5 setParentEntityName:v6];
    id v8 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSActivity *)v5 setParentObjectID:v8];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSActivity;
  id v4 = a3;
  [(CLSActivity *)&v8 bindTo:v4];
  unsigned int v5 = [(CLSActivity *)self primaryActivityItemIdentifier];
  sub_10008C524((uint64_t)v4, v5, @"primaryActivityItemIdentifier");

  v6 = [(CLSActivity *)self parentEntityName];
  sub_10008C524((uint64_t)v4, v6, @"parentEntityName");

  objc_super v7 = [(CLSActivity *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v7, @"parentObjectID");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a3 == 2) {
    goto LABEL_13;
  }
  if (a3 == 1) {
    goto LABEL_22;
  }
  if (a3)
  {
LABEL_18:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_19;
  }
  if (sub_100007540(v7, @"create table CLSActivity(   objectID          text not null,    parentObjectID    text not null,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    primaryActivityItemIdentifier text,    foreign key(parentObjectID) references CLSContext(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index CLSActivity_objectID on CLSActivity (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index CLSActivity_parentObjectID on CLSActivity (parentObjectID)", 0, 0, 0))
      {
LABEL_22:
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create table CLSActivityClone(   objectID                       text not null,\n    parentObjectID                 text not null,\n    appIdentifier                  text,\n    dateCreated                    real not null,\n    dateLastModified               real not null,\n    primaryActivityItemIdentifier  text,\n    parentEntityName               text\n)", 0, 0, 0))
        {
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"create unique index CLSActivityClone_objectID on CLSActivityClone (objectID)", 0, 0, 0))
          {
            LOBYTE(a3) = 0;
            if (sub_100007540(v8, @"create index CLSActivityClone_parentObjectID on CLSActivityClone (parentObjectID)", 0, 0, 0))
            {
              LOBYTE(a3) = 0;
              if (sub_100007540(v8, @"insert into CLSActivityClone (objectID, parentObjectID, appIdentifier, dateCreated, dateLastModified, primaryActivityItemIdentifier) select objectID, parentObjectID, appIdentifier, dateCreated, dateLastModified, primaryActivityItemIdentifier from CLSActivity", 0, 0, 0))
              {
                LOBYTE(a3) = 0;
                if (sub_100007540(v8, @"drop table CLSActivity", 0, 0, 0))
                {
                  LOBYTE(a3) = 0;
                  if (sub_100007540(v8, @"alter table CLSActivityClone rename to CLSActivity", 0, 0, 0))
                  {
LABEL_13:
                    LOBYTE(a3) = 0;
                    if (sub_100007540(v8, @"drop index CLSActivityClone_objectID", 0, 0, 0))
                    {
                      LOBYTE(a3) = 0;
                      if (sub_100007540(v8, @"create unique index CLSActivity_objectID on CLSActivity (objectID)", 0, 0, 0))
                      {
                        LOBYTE(a3) = 0;
                        if (sub_100007540(v8, @"drop index CLSActivityClone_parentObjectID", 0, 0, 0))
                        {
                          LOBYTE(a3) = 0;
                          if (sub_100007540(v8, @"create index CLSActivity_parentObjectID on CLSActivity (parentObjectID)", 0, 0, 0))
                          {
                            a3 = 3;
                            goto LABEL_18;
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
LABEL_19:

  return a3;
}

+ (int64_t)migrationOrder
{
  return 2;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CLSActivity *)self objectID];
  id v7 = v5;
  v6 = +[NSArray arrayWithObjects:&v7 count:1];

  [v4 deleteAll:objc_opt_class() where:@"activityID = ?" bindings:v6];
}

+ (int)syncType
{
  return 2;
}

+ (int)entityType
{
  return 2;
}

@end