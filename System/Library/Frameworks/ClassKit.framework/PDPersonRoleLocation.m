@interface PDPersonRoleLocation
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (int64_t)migrationOrder;
- (PDDatabaseValue)identityValue;
- (PDPersonRoleLocation)initWithDatabaseRow:(id)a3;
- (id)dictionaryRepresentation;
- (void)bindTo:(id)a3;
@end

@implementation PDPersonRoleLocation

+ (NSString)entityName
{
  return (NSString *)@"PDPersonRoleLocation";
}

- (PDPersonRoleLocation)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"personID");
  v6 = sub_100003BF0(v4, @"roleID");
  v7 = sub_100003BF0(v4, @"locationID");
  v8 = sub_100003BF0(v4, @"roleType");

  v9 = (PDPersonRoleLocation *)sub_1000BB794(self, v5, v6, v7, (uint64_t)[v8 integerValue]);
  return v9;
}

- (void)bindTo:(id)a3
{
  id v8 = a3;
  v4 = [(PDPersonRoleLocation *)self identityValue];
  sub_10008C524((uint64_t)v8, v4, @"identity");

  if (self)
  {
    sub_10008C524((uint64_t)v8, self->_personID, @"personID");
    sub_10008C524((uint64_t)v8, self->_roleID, @"roleID");
    locationID = self->_locationID;
  }
  else
  {
    sub_10008C524((uint64_t)v8, 0, @"personID");
    sub_10008C524((uint64_t)v8, 0, @"roleID");
    locationID = 0;
  }
  sub_10008C524((uint64_t)v8, locationID, @"locationID");
  if (self) {
    int64_t roleType = self->_roleType;
  }
  else {
    int64_t roleType = 0;
  }
  v7 = +[NSNumber numberWithInteger:roleType];
  sub_10008C524((uint64_t)v8, v7, @"roleType");
}

+ (int64_t)migrationOrder
{
  return 2;
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDPersonRoleLocation(   identity text not null,    personID text not null,    roleID text not null,    locationID text not null,    foreign key (personID) references CLSPerson(objectID) on delete cascade on update cascade,    foreign key (roleID) references CLSRole(objectID) on delete cascade on update cascade,    foreign key (locationID) references CLSLocation(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDPersonRoleLocation_identity on PDPersonRoleLocation (identity)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index PDPersonRoleLocation_personID on PDPersonRoleLocation (personID)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index PDPersonRoleLocation_roleID on PDPersonRoleLocation (roleID)", 0, 0, 0))
        {
          LOBYTE(a3) = 0;
          if (sub_100007540(v8, @"create index PDPersonRoleLocation_locationID on PDPersonRoleLocation (locationID)", 0, 0, 0))
          {
            LOBYTE(a3) = 0;
            if (sub_100007540(v8, @"alter table PDPersonRoleLocation add column roleType integer", 0, 0, 0))
            {
              LOBYTE(a3) = 0;
              if (sub_100007540(v8, @"create index PDPersonRoleLocation_roleType on PDPersonRoleLocation (roleType)", 0, 0, 0))
              {
                a3 = 1;
LABEL_2:
                *a4 = a3;
                LOBYTE(a3) = 1;
              }
            }
          }
        }
      }
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"identity";
}

- (PDDatabaseValue)identityValue
{
  if (self)
  {
    v3 = self->_personID;
    v4 = self->_roleID;
    locationID = self->_locationID;
  }
  else
  {
    v4 = 0;
    v3 = 0;
    locationID = 0;
  }
  v6 = +[NSString stringWithFormat:@"%@/%@/%@", v3, v4, locationID];
  id v7 = [v6 sha224];

  return (PDDatabaseValue *)v7;
}

- (id)dictionaryRepresentation
{
  v9[0] = @"personID";
  v9[1] = @"roleID";
  CFStringRef personID = (const __CFString *)self->_personID;
  CFStringRef roleID = (const __CFString *)self->_roleID;
  if (!personID) {
    CFStringRef personID = &stru_1001F6580;
  }
  if (!roleID) {
    CFStringRef roleID = &stru_1001F6580;
  }
  v10[0] = personID;
  v10[1] = roleID;
  CFStringRef locationID = (const __CFString *)self->_locationID;
  int64_t roleType = self->_roleType;
  if (!locationID) {
    CFStringRef locationID = &stru_1001F6580;
  }
  v10[2] = locationID;
  v9[2] = @"locationID";
  v9[3] = @"roleType";
  v6 = +[CLSRole stringForRoleType:roleType];
  v10[3] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong((id *)&self->_roleID, 0);

  objc_storeStrong((id *)&self->_personID, 0);
}

@end