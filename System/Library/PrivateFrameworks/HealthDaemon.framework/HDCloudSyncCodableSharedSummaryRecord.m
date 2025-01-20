@interface HDCloudSyncCodableSharedSummaryRecord
+ (Class)authorizationCategoriesType;
+ (Class)objectTypeIdentifiersType;
- (BOOL)hasCompatibilityVersion;
- (BOOL)hasName;
- (BOOL)hasPackage;
- (BOOL)hasSummaryData;
- (BOOL)hasUuid;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)summaryData;
- (NSMutableArray)authorizationCategories;
- (NSMutableArray)objectTypeIdentifiers;
- (NSString)compatibilityVersion;
- (NSString)name;
- (NSString)package;
- (NSString)uuid;
- (NSString)version;
- (id)authorizationCategoriesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)objectTypeIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)authorizationCategoriesCount;
- (unint64_t)hash;
- (unint64_t)objectTypeIdentifiersCount;
- (void)addAuthorizationCategories:(id)a3;
- (void)addObjectTypeIdentifiers:(id)a3;
- (void)clearAuthorizationCategories;
- (void)clearObjectTypeIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationCategories:(id)a3;
- (void)setCompatibilityVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectTypeIdentifiers:(id)a3;
- (void)setPackage:(id)a3;
- (void)setSummaryData:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableSharedSummaryRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasPackage
{
  return self->_package != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasCompatibilityVersion
{
  return self->_compatibilityVersion != 0;
}

- (void)clearObjectTypeIdentifiers
{
}

- (void)addObjectTypeIdentifiers:(id)a3
{
  id v4 = a3;
  objectTypeIdentifiers = self->_objectTypeIdentifiers;
  id v8 = v4;
  if (!objectTypeIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_objectTypeIdentifiers;
    self->_objectTypeIdentifiers = v6;

    id v4 = v8;
    objectTypeIdentifiers = self->_objectTypeIdentifiers;
  }
  [(NSMutableArray *)objectTypeIdentifiers addObject:v4];
}

- (unint64_t)objectTypeIdentifiersCount
{
  return [(NSMutableArray *)self->_objectTypeIdentifiers count];
}

- (id)objectTypeIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_objectTypeIdentifiers objectAtIndex:a3];
}

+ (Class)objectTypeIdentifiersType
{
  return (Class)objc_opt_class();
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

- (BOOL)hasSummaryData
{
  return self->_summaryData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryRecord;
  id v4 = [(HDCloudSyncCodableSharedSummaryRecord *)&v8 description];
  v5 = [(HDCloudSyncCodableSharedSummaryRecord *)self dictionaryRepresentation];
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
  package = self->_package;
  if (package) {
    [v4 setObject:package forKey:@"package"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion) {
    [v4 setObject:compatibilityVersion forKey:@"compatibilityVersion"];
  }
  objectTypeIdentifiers = self->_objectTypeIdentifiers;
  if (objectTypeIdentifiers) {
    [v4 setObject:objectTypeIdentifiers forKey:@"objectTypeIdentifiers"];
  }
  authorizationCategories = self->_authorizationCategories;
  if (authorizationCategories) {
    [v4 setObject:authorizationCategories forKey:@"authorizationCategories"];
  }
  summaryData = self->_summaryData;
  if (summaryData) {
    [v4 setObject:summaryData forKey:@"summaryData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryRecordReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_package) {
    PBDataWriterWriteStringField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_version) {
    PBDataWriterWriteStringField();
  }
  if (self->_compatibilityVersion) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_objectTypeIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_authorizationCategories;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_summaryData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_uuid) {
    objc_msgSend(v12, "setUuid:");
  }
  if (self->_package) {
    objc_msgSend(v12, "setPackage:");
  }
  if (self->_name) {
    objc_msgSend(v12, "setName:");
  }
  if (self->_version) {
    objc_msgSend(v12, "setVersion:");
  }
  if (self->_compatibilityVersion) {
    objc_msgSend(v12, "setCompatibilityVersion:");
  }
  if ([(HDCloudSyncCodableSharedSummaryRecord *)self objectTypeIdentifiersCount])
  {
    [v12 clearObjectTypeIdentifiers];
    unint64_t v4 = [(HDCloudSyncCodableSharedSummaryRecord *)self objectTypeIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCloudSyncCodableSharedSummaryRecord *)self objectTypeIdentifiersAtIndex:i];
        [v12 addObjectTypeIdentifiers:v7];
      }
    }
  }
  if ([(HDCloudSyncCodableSharedSummaryRecord *)self authorizationCategoriesCount])
  {
    [v12 clearAuthorizationCategories];
    unint64_t v8 = [(HDCloudSyncCodableSharedSummaryRecord *)self authorizationCategoriesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HDCloudSyncCodableSharedSummaryRecord *)self authorizationCategoriesAtIndex:j];
        [v12 addAuthorizationCategories:v11];
      }
    }
  }
  if (self->_summaryData) {
    objc_msgSend(v12, "setSummaryData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  uint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  uint64_t v8 = [(NSString *)self->_package copyWithZone:a3];
  unint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_version copyWithZone:a3];
  uint64_t v13 = (void *)v5[8];
  v5[8] = v12;

  uint64_t v14 = [(NSString *)self->_compatibilityVersion copyWithZone:a3];
  long long v15 = (void *)v5[2];
  v5[2] = v14;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v16 = self->_objectTypeIdentifiers;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addObjectTypeIdentifiers:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v18);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v22 = self->_authorizationCategories;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v26), "copyWithZone:", a3, (void)v31);
        [v5 addAuthorizationCategories:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v24);
  }

  uint64_t v28 = [(NSData *)self->_summaryData copyWithZone:a3];
  v29 = (void *)v5[6];
  v5[6] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[7])) || -[NSString isEqual:](uuid, "isEqual:"))
    && ((package = self->_package, !((unint64_t)package | v4[5]))
     || -[NSString isEqual:](package, "isEqual:"))
    && ((name = self->_name, !((unint64_t)name | v4[3])) || -[NSString isEqual:](name, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[8]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((compatibilityVersion = self->_compatibilityVersion, !((unint64_t)compatibilityVersion | v4[2]))
     || -[NSString isEqual:](compatibilityVersion, "isEqual:"))
    && ((objectTypeIdentifiers = self->_objectTypeIdentifiers, !((unint64_t)objectTypeIdentifiers | v4[4]))
     || -[NSMutableArray isEqual:](objectTypeIdentifiers, "isEqual:"))
    && ((authorizationCategories = self->_authorizationCategories, !((unint64_t)authorizationCategories | v4[1]))
     || -[NSMutableArray isEqual:](authorizationCategories, "isEqual:")))
  {
    summaryData = self->_summaryData;
    if ((unint64_t)summaryData | v4[6]) {
      char v13 = -[NSData isEqual:](summaryData, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  NSUInteger v4 = [(NSString *)self->_package hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_name hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_version hash];
  NSUInteger v7 = [(NSString *)self->_compatibilityVersion hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_objectTypeIdentifiers hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_authorizationCategories hash];
  return v9 ^ [(NSData *)self->_summaryData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[HDCloudSyncCodableSharedSummaryRecord setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 5)) {
    -[HDCloudSyncCodableSharedSummaryRecord setPackage:](self, "setPackage:");
  }
  if (*((void *)v4 + 3)) {
    -[HDCloudSyncCodableSharedSummaryRecord setName:](self, "setName:");
  }
  if (*((void *)v4 + 8)) {
    -[HDCloudSyncCodableSharedSummaryRecord setVersion:](self, "setVersion:");
  }
  if (*((void *)v4 + 2)) {
    -[HDCloudSyncCodableSharedSummaryRecord setCompatibilityVersion:](self, "setCompatibilityVersion:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HDCloudSyncCodableSharedSummaryRecord *)self addObjectTypeIdentifiers:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 1);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HDCloudSyncCodableSharedSummaryRecord addAuthorizationCategories:](self, "addAuthorizationCategories:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 6)) {
    -[HDCloudSyncCodableSharedSummaryRecord setSummaryData:](self, "setSummaryData:");
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (NSMutableArray)objectTypeIdentifiers
{
  return self->_objectTypeIdentifiers;
}

- (void)setObjectTypeIdentifiers:(id)a3
{
}

- (NSMutableArray)authorizationCategories
{
  return self->_authorizationCategories;
}

- (void)setAuthorizationCategories:(id)a3
{
}

- (NSData)summaryData
{
  return self->_summaryData;
}

- (void)setSummaryData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_summaryData, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);

  objc_storeStrong((id *)&self->_authorizationCategories, 0);
}

@end