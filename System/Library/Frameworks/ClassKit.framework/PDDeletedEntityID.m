@interface PDDeletedEntityID
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (int64_t)migrationOrder;
- (PDDatabaseValue)identityValue;
- (PDDeletedEntityID)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDDeletedEntityID

+ (NSString)entityName
{
  return (NSString *)@"PDDeletedEntityID";
}

+ (int64_t)migrationOrder
{
  return -1;
}

- (PDDeletedEntityID)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v15.receiver = self;
  v15.super_class = (Class)PDDeletedEntityID;
  v5 = [(PDDeletedEntityID *)&v15 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"entityIdentity");
    entityIdentity = v5->_entityIdentity;
    v5->_entityIdentity = (PDDatabaseValue *)v6;

    uint64_t v8 = sub_1001630C8(v4, @"deletedAtDate");
    deletedAtDate = v5->_deletedAtDate;
    v5->_deletedAtDate = (NSDate *)v8;

    uint64_t v10 = sub_100003BF0(v4, @"entityName");
    entityName = v5->_entityName;
    v5->_entityName = (NSString *)v10;

    uint64_t v12 = sub_100003BF0(v4, @"parentObjectID");
    parentObjectID = v5->_parentObjectID;
    v5->_parentObjectID = (NSString *)v12;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  entityIdentity = self->_entityIdentity;
  id v5 = a3;
  sub_10008C524((uint64_t)v5, entityIdentity, @"entityIdentity");
  sub_10008C524((uint64_t)v5, self->_deletedAtDate, @"deletedAtDate");
  sub_10008C524((uint64_t)v5, self->_entityName, @"entityName");
  sub_10008C524((uint64_t)v5, self->_parentObjectID, @"parentObjectID");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3 == 1) {
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_7:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_8;
  }
  if (sub_100007540(v7, @"create table PDDeletedEntityID(   entityIdentity text not null,    deletedAtDate real not null,    entityName text not null)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDDeletedEntityID_entityIdentity on PDDeletedEntityID (entityIdentity)", 0, 0, 0))
    {
LABEL_5:
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"alter table PDDeletedEntityID add column parentObjectID text", 0, 0, 0))
      {
        a3 = 2;
        goto LABEL_7;
      }
    }
  }
LABEL_8:

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"entityIdentity";
}

- (PDDatabaseValue)identityValue
{
  return self->_entityIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentObjectID, 0);
  objc_storeStrong((id *)&self->_entityIdentity, 0);
  objc_storeStrong((id *)&self->_deletedAtDate, 0);

  objc_storeStrong((id *)&self->_entityName, 0);
}

@end