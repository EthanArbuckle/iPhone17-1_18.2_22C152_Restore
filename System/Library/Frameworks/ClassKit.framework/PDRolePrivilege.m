@interface PDRolePrivilege
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (int64_t)migrationOrder;
- (PDDatabaseValue)identityValue;
- (PDRolePrivilege)initWithDatabaseRow:(id)a3;
- (id)dictionaryRepresentation;
- (void)bindTo:(id)a3;
@end

@implementation PDRolePrivilege

+ (NSString)entityName
{
  return (NSString *)@"PDRolePrivilege";
}

- (PDRolePrivilege)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = sub_100003BF0(v4, @"roleID");
  v6 = sub_100003BF0(v4, @"privilegeName");

  v7 = (PDRolePrivilege *)sub_1001654D4(self, v5, v6);
  return v7;
}

- (void)bindTo:(id)a3
{
  id v6 = a3;
  v4 = [(PDRolePrivilege *)self identityValue];
  sub_10008C524((uint64_t)v6, v4, @"identity");

  if (self)
  {
    sub_10008C524((uint64_t)v6, self->_roleID, @"roleID");
    privilegeName = self->_privilegeName;
  }
  else
  {
    sub_10008C524((uint64_t)v6, 0, @"roleID");
    privilegeName = 0;
  }
  sub_10008C524((uint64_t)v6, privilegeName, @"privilegeName");
}

+ (int64_t)migrationOrder
{
  return 2;
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDRolePrivilege(   identity text not null,    roleID text not null,    privilegeName text not null,    foreign key (roleID) references CLSRole(objectID) on delete cascade on update cascade)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDRolePrivilege_identity on PDRolePrivilege (identity)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index PDRolePrivilege_roleID on PDRolePrivilege (roleID)", 0, 0, 0))
      {
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"create index PDRolePrivilege_privilegeName on PDRolePrivilege (privilegeName)", 0, 0, 0))
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

+ (NSString)identityColumnName
{
  return (NSString *)@"identity";
}

- (PDDatabaseValue)identityValue
{
  if (self)
  {
    v3 = self->_roleID;
    privilegeName = self->_privilegeName;
  }
  else
  {
    v3 = 0;
    privilegeName = 0;
  }
  v5 = +[NSString stringWithFormat:@"%@/%@", v3, privilegeName];
  id v6 = [v5 sha224];

  return (PDDatabaseValue *)v6;
}

- (id)dictionaryRepresentation
{
  CFStringRef privilegeName = &stru_1001F6580;
  v6[0] = @"roleID";
  v6[1] = @"privilegeName";
  CFStringRef roleID = (const __CFString *)self->_roleID;
  if (!roleID) {
    CFStringRef roleID = &stru_1001F6580;
  }
  if (self->_privilegeName) {
    CFStringRef privilegeName = (const __CFString *)self->_privilegeName;
  }
  v7[0] = roleID;
  v7[1] = privilegeName;
  v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privilegeName, 0);

  objc_storeStrong((id *)&self->_roleID, 0);
}

@end