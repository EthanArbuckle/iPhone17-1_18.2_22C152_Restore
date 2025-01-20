@interface PDObserverTrackedItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (int64_t)migrationOrder;
- (PDDatabaseValue)identityValue;
- (PDObserverTrackedItem)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDObserverTrackedItem

+ (NSString)entityName
{
  return (NSString *)@"PDObserverTrackedItem";
}

+ (int64_t)migrationOrder
{
  return -1;
}

- (PDObserverTrackedItem)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v20.receiver = self;
  v20.super_class = (Class)PDObserverTrackedItem;
  v5 = [(PDObserverTrackedItem *)&v20 init];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"observerChangeID");
    v5->_observerChangeID = (int64_t)[v6 integerValue];

    uint64_t v7 = sub_100003BF0(v4, @"objectID");
    objectID = v5->_objectID;
    v5->_objectID = (NSString *)v7;

    uint64_t v9 = sub_100003BF0(v4, @"entityID");
    entityID = v5->_entityID;
    v5->_entityID = (NSString *)v9;

    uint64_t v11 = sub_100003BF0(v4, @"entityClassName");
    entityClassName = v5->_entityClassName;
    v5->_entityClassName = (NSString *)v11;

    v13 = sub_100003BF0(v4, @"entityHash");
    if (v13)
    {
      v14 = +[NSScanner scannerWithString:v13];
      v21 = 0;
      if ([v14 scanUnsignedLongLong:&v21]) {
        id v15 = v21;
      }
      else {
        id v15 = [v13 hash];
      }
    }
    else
    {
      id v15 = 0;
    }
    v5->_entityHash = (unint64_t)v15;
    uint64_t v16 = sub_1001630C8(v4, @"dateLastChanged");
    dateLastChanged = v5->_dateLastChanged;
    v5->_dateLastChanged = (NSDate *)v16;

    v18 = sub_100003BF0(v4, @"action");
    v5->_action = [v18 intValue];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  objectID = self->_objectID;
  id v5 = a3;
  sub_10008C524((uint64_t)v5, objectID, @"objectID");
  sub_10008C524((uint64_t)v5, self->_entityID, @"entityID");
  sub_10008C524((uint64_t)v5, self->_entityClassName, @"entityClassName");
  sub_10008C524((uint64_t)v5, +[NSString stringWithFormat:@"%lu", self->_entityHash], @"entityHash");
  sub_10008C524((uint64_t)v5, self->_dateLastChanged, @"dateLastChanged");
  id v6 = +[NSNumber numberWithInt:self->_action];
  sub_10008C524((uint64_t)v5, v6, @"action");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 1) {
    goto LABEL_8;
  }
  if (a3)
  {
LABEL_15:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_16;
  }
  if (sub_100007540(v7, @"create table PDObserverTrackedItem (\n    objectID text not null,\n    entityID text not null,\n    entityClassName text not null,\n    entityHash text,\n    dateLastChanged real,\n    action integer)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDObserverTrackedItem_objectID on PDObserverTrackedItem (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index PDObserverTrackedItem_entityID on PDObserverTrackedItem (entityID)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index PDObserverTrackedItem_entityClassName on PDObserverTrackedItem (entityClassName)", 0, 0, 0))
        {
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"create index PDObserverTrackedItem_dateLastChanged on PDObserverTrackedItem (dateLastChanged)", 0, 0, 0))
          {
LABEL_8:
            LOBYTE(a3) = 0;
            if (sub_100007540(v8, @"drop table if exists PDObserverTrackedItem", 0, 0, 0))
            {
              LOBYTE(a3) = 0;
              if (sub_100007540(v8, @"create table PDObserverTrackedItem (\n    observerChangeID integer primary key,\n    objectID text not null,\n    entityID text not null,\n    entityClassName text not null,\n    entityHash text,\n    dateLastChanged real,\n    action integer)", 0, 0, 0))
              {
                LOBYTE(a3) = 0;
                if (sub_100007540(v8, @"create unique index PDObserverTrackedItem_objectID on PDObserverTrackedItem (objectID)", 0, 0, 0))
                {
                  LOBYTE(a3) = 0;
                  if (sub_100007540(v8, @"create index PDObserverTrackedItem_entityID on PDObserverTrackedItem (entityID)", 0, 0, 0))
                  {
                    LOBYTE(a3) = 0;
                    if (sub_100007540(v8, @"create index PDObserverTrackedItem_entityClassName on PDObserverTrackedItem (entityClassName)", 0, 0, 0))
                    {
                      LOBYTE(a3) = 0;
                      if (sub_100007540(v8, @"create index PDObserverTrackedItem_dateLastChanged on PDObserverTrackedItem (dateLastChanged)", 0, 0, 0))
                      {
                        a3 = 2;
                        goto LABEL_15;
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
LABEL_16:

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"objectID";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_objectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLastChanged, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
  objc_storeStrong((id *)&self->_entityClassName, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end