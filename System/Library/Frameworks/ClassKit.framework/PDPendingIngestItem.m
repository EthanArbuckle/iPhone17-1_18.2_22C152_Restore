@interface PDPendingIngestItem
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDPendingIngestItem)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDPendingIngestItem

+ (NSString)entityName
{
  return (NSString *)@"PDPendingIngestItem";
}

- (PDPendingIngestItem)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v13.receiver = self;
  v13.super_class = (Class)PDPendingIngestItem;
  v5 = [(PDPendingIngestItem *)&v13 init];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"entity");
    uint64_t v7 = +[PDDatabase entityNamed:v6];
    Class entity = v5->_entity;
    v5->_Class entity = (Class)v7;

    if (!v5->_entity) {
      __assert_rtn("-[PDPendingIngestItem initWithDatabaseRow:]", "PDPendingIngestItem.m", 27, "_entity != nil");
    }
    v9 = sub_100003BF0(v4, @"wasDeleted");
    v5->_wasDeleted = [v9 BOOLValue];

    uint64_t v10 = sub_100003BF0(v4, @"entityIdentity");
    entityIdClass entity = v5->_entityIdentity;
    v5->_entityIdClass entity = (PDDatabaseValue *)v10;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  if (!self->_entity) {
    __assert_rtn("-[PDPendingIngestItem bindTo:]", "PDPendingIngestItem.m", 38, "_entity != nil");
  }
  id v7 = v4;
  v5 = +[PDDatabase nameOfEntity:](PDDatabase, "nameOfEntity:");
  sub_10008C524((uint64_t)v7, v5, @"entity");
  v6 = +[NSNumber numberWithBool:self->_wasDeleted];
  sub_10008C524((uint64_t)v7, v6, @"wasDeleted");

  sub_10008C524((uint64_t)v7, self->_entityIdentity, @"entityIdentity");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3)
  {
    LOBYTE(a3) = 1;
  }
  else if (sub_100007540(v7, @"create table PDPendingIngestItem(   entity text not null,    wasDeleted integer not null,    entityIdentity text not null)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDPendingIngestItem_entityIdentity on PDPendingIngestItem (entityIdentity)", 0, 0, 0))
    {
      LOBYTE(a3) = 1;
      *a4 = 1;
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"entityIdentity";
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDPendingIngestItem *)self->_entityIdentity;
  }
  return (PDDatabaseValue *)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentity, 0);

  objc_storeStrong((id *)&self->_entity, 0);
}

@end