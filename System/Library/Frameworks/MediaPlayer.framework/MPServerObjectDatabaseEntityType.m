@interface MPServerObjectDatabaseEntityType
+ (id)entityTypeWithServerEntityType:(id)a3 genericObjectRelationshipKey:(id)a4;
- (NSString)genericObjectRelationshipKey;
- (NSString)serverEntityType;
@end

@implementation MPServerObjectDatabaseEntityType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericObjectRelationshipKey, 0);

  objc_storeStrong((id *)&self->_serverEntityType, 0);
}

- (NSString)genericObjectRelationshipKey
{
  return self->_genericObjectRelationshipKey;
}

- (NSString)serverEntityType
{
  return self->_serverEntityType;
}

+ (id)entityTypeWithServerEntityType:(id)a3 genericObjectRelationshipKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MPServerObjectDatabaseEntityType);
  uint64_t v8 = [v6 copy];

  serverEntityType = v7->_serverEntityType;
  v7->_serverEntityType = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  genericObjectRelationshipKey = v7->_genericObjectRelationshipKey;
  v7->_genericObjectRelationshipKey = (NSString *)v10;

  return v7;
}

@end