@interface PDMissingEntityReference
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
+ (int64_t)migrationOrder;
- (PDDatabaseValue)identityValue;
- (PDMissingEntityReference)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDMissingEntityReference

+ (NSString)entityName
{
  return (NSString *)@"PDMissingEntityReference";
}

+ (int64_t)migrationOrder
{
  return -1;
}

- (PDMissingEntityReference)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v15.receiver = self;
  v15.super_class = (Class)PDMissingEntityReference;
  v5 = [(PDMissingEntityReference *)&v15 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"entityId");
    entityID = v5->_entityID;
    v5->_entityID = (NSString *)v6;

    uint64_t v8 = sub_100003BF0(v4, @"entityName");
    entityName = v5->_entityName;
    v5->_entityName = (NSString *)v8;

    uint64_t v10 = sub_100003BF0(v4, @"referencingEntityId");
    referencingEntityID = v5->_referencingEntityID;
    v5->_referencingEntityID = (NSString *)v10;

    uint64_t v12 = sub_100003BF0(v4, @"referencingEntityName");
    referencingEntityName = v5->_referencingEntityName;
    v5->_referencingEntityName = (NSString *)v12;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  entityID = self->_entityID;
  id v5 = a3;
  sub_10008C524((uint64_t)v5, entityID, @"entityId");
  sub_10008C524((uint64_t)v5, self->_entityName, @"entityName");
  sub_10008C524((uint64_t)v5, self->_referencingEntityID, @"referencingEntityId");
  sub_10008C524((uint64_t)v5, self->_referencingEntityName, @"referencingEntityName");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDMissingEntityReference(   entityId text not null,    entityName text not null,    referencingEntityId text,    referencingEntityName text)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDMissingEntityReference_entityId on PDMissingEntityReference (entityId)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index PDMissingEntityReference_entityName on PDMissingEntityReference (entityName)", 0, 0, 0))
      {
        a3 = 1;
LABEL_2:
        *a4 = a3;
        LOBYTE(a3) = 1;
      }
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"entityId";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_entityID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencingEntityID, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
  objc_storeStrong((id *)&self->_referencingEntityName, 0);

  objc_storeStrong((id *)&self->_entityName, 0);
}

@end