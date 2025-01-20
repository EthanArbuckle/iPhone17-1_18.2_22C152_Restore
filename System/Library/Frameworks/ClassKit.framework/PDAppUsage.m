@interface PDAppUsage
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDAppUsage)initWithDatabaseRow:(id)a3;
- (PDDatabaseValue)identityValue;
- (void)bindTo:(id)a3;
@end

@implementation PDAppUsage

+ (NSString)entityName
{
  return (NSString *)@"PDAppUsage";
}

- (PDAppUsage)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v21.receiver = self;
  v21.super_class = (Class)PDAppUsage;
  v5 = [(PDAppUsage *)&v21 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"objectID");
    objectID = v5->_objectID;
    v5->_objectID = (NSString *)v6;

    uint64_t v8 = sub_100003BF0(v4, @"activityID");
    activityID = v5->_activityID;
    v5->_activityID = (NSString *)v8;

    uint64_t v10 = sub_100003BF0(v4, @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    uint64_t v12 = sub_1001630C8(v4, @"startDate");
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v12;

    uint64_t v14 = sub_1001630C8(v4, @"endDate");
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v14;

    v16 = sub_100003BF0(v4, @"starting");
    v5->_starting = [v16 BOOLValue];

    v17 = sub_100003BF0(v4, @"ignoreSignal");
    v5->_ignoreSignal = [v17 BOOLValue];

    uint64_t v18 = sub_1001630C8(v4, @"dateCreated");
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v18;
  }
  return v5;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"objectID";
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDAppUsage *)self->_objectID;
  }
  return (PDDatabaseValue *)self;
}

- (void)bindTo:(id)a3
{
  objectID = self->_objectID;
  id v7 = a3;
  sub_10008C524((uint64_t)v7, objectID, @"objectID");
  sub_10008C524((uint64_t)v7, self->_activityID, @"activityID");
  sub_10008C524((uint64_t)v7, self->_bundleIdentifier, @"bundleIdentifier");
  sub_10008C524((uint64_t)v7, self->_startDate, @"startDate");
  sub_10008C524((uint64_t)v7, self->_endDate, @"endDate");
  v5 = +[NSNumber numberWithBool:self->_starting];
  sub_10008C524((uint64_t)v7, v5, @"starting");

  uint64_t v6 = +[NSNumber numberWithBool:self->_ignoreSignal];
  sub_10008C524((uint64_t)v7, v6, @"ignoreSignal");

  sub_10008C524((uint64_t)v7, self->_dateCreated, @"dateCreated");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDAppUsage(   objectID          text not null,\n    activityID        text not null,\n    bundleIdentifier  text not null,\n    dateCreated       real not null,\n    startDate         real,\n    endDate           real,\n    starting          integer,\n    ignoreSignal      integer,\n    foreign key (activityID) references CLSActivity(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDAppUsage_objectID on PDAppUsage (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index PDAppUsage_bundleIdentifier on PDAppUsage (bundleIdentifier)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index PDAppUsage_activityID on PDAppUsage (activityID)", 0, 0, 0))
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end