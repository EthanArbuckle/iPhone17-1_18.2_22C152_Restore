@interface PDSyncMetadataCache
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDSyncMetadataCache)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDSyncMetadataCache

+ (NSString)entityName
{
  return (NSString *)@"PDSyncMetadataCache";
}

- (PDSyncMetadataCache)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v14.receiver = self;
  v14.super_class = (Class)PDSyncMetadataCache;
  v5 = [(PDSyncMetadataCache *)&v14 init];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"entity");
    uint64_t v7 = +[PDDatabase entityNamed:v6];
    Class entity = v5->_entity;
    v5->_Class entity = (Class)v7;

    if (!v5->_entity) {
      __assert_rtn("-[PDSyncMetadataCache initWithDatabaseRow:]", "PDSyncMetadataCache.m", 41, "_entity != nil");
    }
    uint64_t v9 = sub_100003BF0(v4, @"entityIdentity");
    entityIdClass entity = v5->_entityIdentity;
    v5->_entityIdClass entity = (PDDatabaseValue *)v9;

    uint64_t v11 = sub_100003BF0(v4, @"metadata");
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v11;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  id v6 = a3;
  if (!self->_entity) {
    __assert_rtn("-[PDSyncMetadataCache bindTo:]", "PDSyncMetadataCache.m", 52, "_entity != nil");
  }
  v4 = +[PDDatabase nameOfEntity:](PDDatabase, "nameOfEntity:");
  if (!v4) {
    __assert_rtn("-[PDSyncMetadataCache bindTo:]", "PDSyncMetadataCache.m", 55, "entityName != nil");
  }
  v5 = v4;
  sub_10008C524((uint64_t)v6, v4, @"entity");
  sub_10008C524((uint64_t)v6, self->_entityIdentity, @"entityIdentity");
  sub_10008C524((uint64_t)v6, self->_metadata, @"metadata");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDSyncMetadataCache (\n    entity text not null,\n    entityIdentity text not null,\n    metadata blob\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDSyncMetadataCache_entityIdentity on PDSyncMetadataCache (entityIdentity)", 0, 0, 0))
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
  return (NSString *)@"entityIdentity";
}

- (PDDatabaseValue)identityValue
{
  if (self) {
    self = (PDSyncMetadataCache *)self->_entityIdentity;
  }
  return (PDDatabaseValue *)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entityIdentity, 0);

  objc_storeStrong((id *)&self->_entity, 0);
}

@end