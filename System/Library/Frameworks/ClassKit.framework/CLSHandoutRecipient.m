@interface CLSHandoutRecipient
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityDidInsertNotificationName;
+ (id)entityName;
+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (CLSHandoutRecipient)initWithCKRecord:(id)a3;
- (CLSHandoutRecipient)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSHandoutRecipient

+ (id)entityName
{
  return @"CLSHandoutRecipient";
}

- (CLSHandoutRecipient)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"classID");
  v6 = sub_100003BF0(v4, @"personID");
  v7 = [(CLSHandoutRecipient *)self initWithClassID:v5 personID:v6];

  if (v7)
  {
    [(CLSHandoutRecipient *)v7 _initCommonPropsWithDatabaseRow:v4];
    v8 = sub_100003BF0(v4, @"parentObjectID");
    [(CLSHandoutRecipient *)v7 setParentObjectID:v8];
  }
  return v7;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSHandoutRecipient;
  id v4 = a3;
  [(CLSHandoutRecipient *)&v9 bindTo:v4];
  CFStringRef v10 = @"appIdentifier";
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9.receiver, v9.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSHandoutRecipient *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = [(CLSHandoutRecipient *)self classID];
  sub_10008C524((uint64_t)v4, v7, @"classID");

  v8 = [(CLSHandoutRecipient *)self personID];
  sub_10008C524((uint64_t)v4, v8, @"personID");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 1) {
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_15:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_16;
  }
  if (sub_100007540(v7, @"create table CLSHandoutRecipient(   objectID          text not null,    parentObjectID    text not null,    appIdentifier     text not null,    dateCreated       real not null,    dateLastModified  real not null,    classID           text not null,    personID          text,    foreign key (parentObjectID) references CLSHandout(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSHandoutRecipient_objectID on CLSHandoutRecipient (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create unique index if not exists CLSHandoutRecipient_classID_personID_parentObjectID on CLSHandoutRecipient (classID, personID, parentObjectID)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index if not exists CLSHandoutRecipient_parentObjectID on CLSHandoutRecipient (parentObjectID)", 0, 0, 0))
        {
LABEL_7:
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"create table CLSHandoutRecipient_temp (\n    objectID            text not null,\n    parentObjectID      text not null,\n    dateCreated         real not null,\n    dateLastModified    real not null,\n    classID             text not null,\n    personID            text,\n    foreign key (parentObjectID) references CLSHandout(objectID) on delete cascade on update cascade\n)\n", 0, 0, 0))
          {
            LOBYTE(a3) = 0;
            if (sub_100007540(v8, @"insert into CLSHandoutRecipient_temp select objectID, parentObjectID, dateCreated, dateLastModified, classID, personID from CLSHandoutRecipient", 0, 0, 0))
            {
              LOBYTE(a3) = 0;
              if (sub_100007540(v8, @"drop table CLSHandoutRecipient", 0, 0, 0))
              {
                LOBYTE(a3) = 0;
                if (sub_100007540(v8, @"alter table CLSHandoutRecipient_temp rename to CLSHandoutRecipient", 0, 0, 0))
                {
                  LOBYTE(a3) = 0;
                  if (sub_100007540(v8, @"create unique index if not exists CLSHandoutRecipient_objectID on CLSHandoutRecipient (objectID)", 0, 0, 0))
                  {
                    LOBYTE(a3) = 0;
                    if (sub_100007540(v8, @"create unique index if not exists CLSHandoutRecipient_classID_personID_parentObjectID on CLSHandoutRecipient (classID, personID, parentObjectID)", 0, 0, 0))
                    {
                      LOBYTE(a3) = 0;
                      if (sub_100007540(v8, @"create index if not exists CLSHandoutRecipient_parentObjectID on CLSHandoutRecipient (parentObjectID)", 0, 0, 0))
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

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  v5 = [(CLSHandoutRecipient *)self objectID];
  v6 = [v4 select:objc_opt_class() identity:v5];
  if (!v6)
  {
    id v7 = objc_opt_new();
    v6 = v7;
    if (v7) {
      objc_setProperty_nonatomic_copy(v7, v8, v5, 8);
    }
  }
  objc_super v9 = [(CLSHandoutRecipient *)self classID];
  v11 = v9;
  CFStringRef v10 = +[NSArray arrayWithObjects:&v11 count:1];
  sub_100075F40((uint64_t)v6, v10);

  [v4 insertOrUpdateObject:v6];
}

+ (int64_t)migrationOrder
{
  return 2;
}

+ (id)entityDidInsertNotificationName
{
  return @"PDDatabaseEntityHandoutRecipientDidInsertNotification";
}

+ (id)recordType
{
  return @"CLSHandoutRecipient";
}

- (CLSHandoutRecipient)initWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSHandoutRecipient *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithRecord:v4];
    id v7 = [v4 objectForKeyedSubscript:@"classID"];
    [v6 setClassID:v7];

    v8 = [v4 objectForKeyedSubscript:@"personID"];
    [v6 setPersonID:v8];
  }
  return (CLSHandoutRecipient *)v6;
}

- (void)populate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSHandoutRecipient;
  id v4 = a3;
  [(CLSHandoutRecipient *)&v7 populate:v4];
  id v5 = [(CLSHandoutRecipient *)self classID];
  [v4 setObject:v5 forKeyedSubscript:@"classID"];

  v6 = [(CLSHandoutRecipient *)self personID];
  [v4 setObject:v6 forKeyedSubscript:@"personID"];

  [(CLSHandoutRecipient *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncOrder
{
  return 2;
}

- (int64_t)syncableItemType
{
  return 0;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"handout";
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSHandoutRecipient *)self parentObjectID];
  if (v5)
  {
    v6 = [v4 select:objc_opt_class() identity:v5];
    objc_super v7 = v6;
    if (v6) {
      int64_t v8 = (int64_t)[v6 syncBackend:v4];
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

+ (id)payloadsForObject:(id)a3 withSyncItem:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  CFStringRef v10 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v10 setType:4];
  v11 = (char *)[v8 state] - 1;
  if ((unint64_t)v11 < 3) {
    uint64_t v12 = (v11 + 1);
  }
  else {
    uint64_t v12 = 0;
  }
  [(PDDPPayload *)v10 setAction:v12];
  if ([v8 state] == (id)3)
  {
    v13 = objc_opt_new();
    [(PDDPPayload *)v10 setRecipient:v13];

    v14 = [v8 entityIdentity];
    v15 = [(PDDPPayload *)v10 recipient];
    [v15 setObjectId:v14];

    v16 = [v8 entityIdentity];
    uint64_t v17 = [v9 select:objc_opt_class() identity:v16];
    v18 = (void *)v17;
    if (v17) {
      v19 = *(void **)(v17 + 16);
    }
    else {
      v19 = 0;
    }
    id v20 = v19;
    v21 = [v20 firstObject];
    v22 = [(PDDPPayload *)v10 recipient];
    [v22 setClassId:v21];
  }
  else
  {
    v16 = sub_10001FB44(v7);
    [(PDDPPayload *)v10 setRecipient:v16];
  }

  v25 = v10;
  v23 = +[NSArray arrayWithObjects:&v25 count:1];

  return v23;
}

- (id)payloadsWithClassIDs:(id)a3 dependencies:(id)a4
{
  id v5 = objc_alloc_init(PDDPPayload);
  [(PDDPPayload *)v5 setType:4];
  v6 = sub_10001FB44(self);
  [(PDDPPayload *)v5 setRecipient:v6];

  id v9 = v5;
  id v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(CLSHandoutRecipient *)self parentObjectID];
  id v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

@end