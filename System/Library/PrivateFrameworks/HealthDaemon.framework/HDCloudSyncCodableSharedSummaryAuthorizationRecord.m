@interface HDCloudSyncCodableSharedSummaryAuthorizationRecord
+ (Class)authorizationCategoriesType;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)authorizationCategories;
- (NSString)uuid;
- (id)authorizationCategoriesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)authorizationCategoriesCount;
- (unint64_t)hash;
- (void)addAuthorizationCategories:(id)a3;
- (void)clearAuthorizationCategories;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationCategories:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableSharedSummaryAuthorizationRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)clearAuthorizationCategories
{
}

- (void)addAuthorizationCategories:(id)a3
{
  id v4 = a3;
  authorizationCategories = self->_authorizationCategories;
  id v8 = v4;
  if (!authorizationCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_authorizationCategories;
    self->_authorizationCategories = v6;

    id v4 = v8;
    authorizationCategories = self->_authorizationCategories;
  }
  [(NSMutableArray *)authorizationCategories addObject:v4];
}

- (unint64_t)authorizationCategoriesCount
{
  return [(NSMutableArray *)self->_authorizationCategories count];
}

- (id)authorizationCategoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_authorizationCategories objectAtIndex:a3];
}

+ (Class)authorizationCategoriesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryAuthorizationRecord;
  id v4 = [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)&v8 description];
  v5 = [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  authorizationCategories = self->_authorizationCategories;
  if (authorizationCategories) {
    [v4 setObject:authorizationCategories forKey:@"authorizationCategories"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryAuthorizationRecordReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_authorizationCategories;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_uuid) {
    objc_msgSend(v8, "setUuid:");
  }
  if ([(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self authorizationCategoriesCount])
  {
    [v8 clearAuthorizationCategories];
    unint64_t v4 = [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self authorizationCategoriesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self authorizationCategoriesAtIndex:i];
        [v8 addAuthorizationCategories:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_authorizationCategories;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addAuthorizationCategories:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[2])) || -[NSString isEqual:](uuid, "isEqual:")))
  {
    authorizationCategories = self->_authorizationCategories;
    if ((unint64_t)authorizationCategories | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](authorizationCategories, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  return [(NSMutableArray *)self->_authorizationCategories hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setUuid:](self, "setUuid:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDCloudSyncCodableSharedSummaryAuthorizationRecord addAuthorizationCategories:](self, "addAuthorizationCategories:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSMutableArray)authorizationCategories
{
  return self->_authorizationCategories;
}

- (void)setAuthorizationCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_authorizationCategories, 0);
}

@end