@interface PDServerScheduledEvent
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDServerScheduledEvent)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDServerScheduledEvent

+ (NSString)entityName
{
  return (NSString *)@"PDServerScheduledEvent";
}

- (PDServerScheduledEvent)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v18.receiver = self;
  v18.super_class = (Class)PDServerScheduledEvent;
  v5 = [(PDServerScheduledEvent *)&v18 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"objectID");
    objectID = v5->_objectID;
    v5->_objectID = (NSString *)v6;

    uint64_t v8 = sub_100003BF0(v4, @"scheduleID");
    scheduleID = v5->_scheduleID;
    v5->_scheduleID = (NSString *)v8;

    uint64_t v10 = sub_1001630C8(v4, @"dateCreated");
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v10;

    uint64_t v12 = sub_1001630C8(v4, @"dateLastModified");
    dateLastModified = v5->_dateLastModified;
    v5->_dateLastModified = (NSDate *)v12;

    uint64_t v14 = sub_1001630C8(v4, @"eventDate");
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v14;

    v16 = sub_100003BF0(v4, @"status");
    v5->_status = (int64_t)[v16 integerValue];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  objectID = self->_objectID;
  id v5 = a3;
  sub_10008C524((uint64_t)v5, objectID, @"objectID");
  sub_10008C524((uint64_t)v5, self->_scheduleID, @"scheduleID");
  sub_10008C524((uint64_t)v5, self->_dateCreated, @"dateCreated");
  sub_10008C524((uint64_t)v5, self->_dateLastModified, @"dateLastModified");
  sub_10008C524((uint64_t)v5, self->_eventDate, @"eventDate");
  id v6 = +[NSNumber numberWithInteger:self->_status];
  sub_10008C524((uint64_t)v5, v6, @"status");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDServerScheduledEvent(   objectID          text not null,\n    scheduleID        text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    eventDate         real not null,\n    status            integer default 0\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDServerScheduledEvent_objectID on PDServerScheduledEvent (objectID)", 0, 0, 0))
    {
      a3 = 1;
LABEL_2:
      *a4 = a3;
      LOBYTE(a3) = 1;
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"objectID";
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDServerScheduledEvent *)self->_objectID;
  }
  return (PDDatabaseValue *)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_scheduleID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end