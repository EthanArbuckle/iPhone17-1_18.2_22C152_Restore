@interface HDCodableSyncState
+ (Class)versionedDataType;
- ($2825F4736939C4A6D3AD43837233062D)versionRange;
- (BOOL)decodedObjectOfClass:(Class)a3 version:(int64_t)a4 decodedObject:(id *)a5 error:(id *)a6;
- (BOOL)hasDomain;
- (BOOL)hasKey;
- (BOOL)hasOrigin;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncStateOrigin)origin;
- (HDCodableSyncVersionRange)version;
- (NSMutableArray)versionedDatas;
- (NSString)description;
- (NSString)domain;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)versionedDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)versionedDatasCount;
- (void)addVersionedData:(id)a3;
- (void)clearVersionedDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCodableObject:(id)a3 version:(int64_t)a4 profile:(id)a5;
- (void)setDomain:(id)a3;
- (void)setKey:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setVersion:(id)a3;
- (void)setVersionRange:(id)a3;
- (void)setVersionedDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSyncState

- ($2825F4736939C4A6D3AD43837233062D)versionRange
{
  v2 = [(HDCodableSyncState *)self version];
  $2825F4736939C4A6D3AD43837233062D v3 = ($2825F4736939C4A6D3AD43837233062D)[v2 syncVersionRange];

  return v3;
}

- (void)setVersionRange:(id)a3
{
  id v4 = +[HDCodableSyncVersionRange versionRangeWithSyncVersionRange:a3];
  [(HDCodableSyncState *)self setVersion:v4];
}

- (void)setCodableObject:(id)a3 version:(int64_t)a4 profile:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(HDCodableSyncState *)self versionedDatas];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__HDCodableSyncState_HDSyncSupport__setCodableObject_version_profile___block_invoke;
  v24[3] = &__block_descriptor_40_e41_B16__0__HDCodableSyncStateVersionedData_8l;
  v24[4] = a4;
  objc_msgSend(v10, "hk_removeObjectsPassingTest:", v24);

  id v11 = v8;
  self;
  v12 = [v11 daemon];
  v13 = [v12 behavior];

  v14 = objc_alloc_init(HDCodableSyncStateOrigin);
  [(HDCodableSyncStateOrigin *)v14 setTimestamp:CFAbsoluteTimeGetCurrent()];
  v15 = [v13 currentOSBuild];
  [(HDCodableSyncStateOrigin *)v14 setBuild:v15];

  v16 = [v13 currentDeviceProductType];
  [(HDCodableSyncStateOrigin *)v14 setProductType:v16];

  if (v13)
  {
    [v13 currentOSVersionStruct];
    [(HDCodableSyncStateOrigin *)v14 setMajorVersion:v29];
    [v13 currentOSVersionStruct];
    [(HDCodableSyncStateOrigin *)v14 setMinorVersion:v27];
    [v13 currentOSVersionStruct];
    uint64_t v17 = v25;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    [(HDCodableSyncStateOrigin *)v14 setMajorVersion:0];
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    [(HDCodableSyncStateOrigin *)v14 setMinorVersion:0];
    uint64_t v17 = 0;
    v24[5] = 0;
    v24[6] = 0;
    uint64_t v25 = 0;
  }
  [(HDCodableSyncStateOrigin *)v14 setPatchVersion:v17];
  v18 = [v11 syncIdentityManager];
  v19 = [v18 currentSyncIdentity];
  v20 = [v19 identity];
  v21 = [v20 codableSyncIdentity];
  [(HDCodableSyncStateOrigin *)v14 setSyncIdentity:v21];

  v22 = objc_alloc_init(HDCodableSyncStateVersionedData);
  [(HDCodableSyncStateVersionedData *)v22 setVersion:a4];
  [(HDCodableSyncStateVersionedData *)v22 setOrigin:v14];
  v23 = [v9 data];

  [(HDCodableSyncStateVersionedData *)v22 setObjectData:v23];
  [(HDCodableSyncState *)self addVersionedData:v22];
  [(HDCodableSyncState *)self setOrigin:v14];
}

BOOL __70__HDCodableSyncState_HDSyncSupport__setCodableObject_version_profile___block_invoke(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) == (int)[a2 version];
}

- (BOOL)decodedObjectOfClass:(Class)a3 version:(int64_t)a4 decodedObject:(id *)a5 error:(id *)a6
{
  id v11 = [(HDCodableSyncState *)self versionedDatas];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__HDCodableSyncState_HDSyncSupport__decodedObjectOfClass_version_decodedObject_error___block_invoke;
  v21[3] = &__block_descriptor_40_e41_B16__0__HDCodableSyncStateVersionedData_8l;
  v21[4] = a4;
  v12 = objc_msgSend(v11, "hk_firstObjectPassingTest:", v21);

  if (v12)
  {
    id v13 = objc_alloc((Class)objc_opt_class());
    v14 = [v12 objectData];
    v15 = (void *)[v13 initWithData:v14];

    BOOL v16 = v15 != 0;
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      v18 = [(HDCodableSyncState *)self domain];
      v19 = [(HDCodableSyncState *)self key];
      objc_msgSend(v17, "hk_assignError:code:format:", a6, 129, @"Unable to decode data as class %@ for version %d (%@, %@)", a3, a4, v18, v19);
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

BOOL __86__HDCodableSyncState_HDSyncSupport__decodedObjectOfClass_version_decodedObject_error___block_invoke(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) == (int)[a2 version];
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (void)clearVersionedDatas
{
}

- (void)addVersionedData:(id)a3
{
  id v4 = a3;
  versionedDatas = self->_versionedDatas;
  id v8 = v4;
  if (!versionedDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_versionedDatas;
    self->_versionedDatas = v6;

    id v4 = v8;
    versionedDatas = self->_versionedDatas;
  }
  [(NSMutableArray *)versionedDatas addObject:v4];
}

- (unint64_t)versionedDatasCount
{
  return [(NSMutableArray *)self->_versionedDatas count];
}

- (id)versionedDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_versionedDatas objectAtIndex:a3];
}

+ (Class)versionedDataType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  $2825F4736939C4A6D3AD43837233062D v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncState;
  id v4 = [(HDCodableSyncState *)&v8 description];
  v5 = [(HDCodableSyncState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  $2825F4736939C4A6D3AD43837233062D v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  key = self->_key;
  if (key) {
    [v4 setObject:key forKey:@"key"];
  }
  version = self->_version;
  if (version)
  {
    objc_super v8 = [(HDCodableSyncVersionRange *)version dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"version"];
  }
  origin = self->_origin;
  if (origin)
  {
    v10 = [(HDCodableSyncStateOrigin *)origin dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"origin"];
  }
  if ([(NSMutableArray *)self->_versionedDatas count])
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_versionedDatas, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_versionedDatas;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"versionedData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncStateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  if (self->_version) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_origin) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_versionedDatas;
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
        PBDataWriterWriteSubmessage();
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
  if (self->_domain) {
    objc_msgSend(v8, "setDomain:");
  }
  if (self->_key) {
    objc_msgSend(v8, "setKey:");
  }
  if (self->_version) {
    objc_msgSend(v8, "setVersion:");
  }
  if (self->_origin) {
    objc_msgSend(v8, "setOrigin:");
  }
  if ([(HDCodableSyncState *)self versionedDatasCount])
  {
    [v8 clearVersionedDatas];
    unint64_t v4 = [(HDCodableSyncState *)self versionedDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableSyncState *)self versionedDataAtIndex:i];
        [v8 addVersionedData:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(HDCodableSyncVersionRange *)self->_version copyWithZone:a3];
  long long v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(HDCodableSyncStateOrigin *)self->_origin copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_versionedDatas;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addVersionedData:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[1]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[4]))
     || -[HDCodableSyncVersionRange isEqual:](version, "isEqual:"))
    && ((origin = self->_origin, !((unint64_t)origin | v4[3]))
     || -[HDCodableSyncStateOrigin isEqual:](origin, "isEqual:")))
  {
    versionedDatas = self->_versionedDatas;
    if ((unint64_t)versionedDatas | v4[5]) {
      char v10 = -[NSMutableArray isEqual:](versionedDatas, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  NSUInteger v4 = [(NSString *)self->_key hash] ^ v3;
  unint64_t v5 = [(HDCodableSyncVersionRange *)self->_version hash];
  unint64_t v6 = v4 ^ v5 ^ [(HDCodableSyncStateOrigin *)self->_origin hash];
  return v6 ^ [(NSMutableArray *)self->_versionedDatas hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[HDCodableSyncState setDomain:](self, "setDomain:");
  }
  if (*((void *)v4 + 2)) {
    -[HDCodableSyncState setKey:](self, "setKey:");
  }
  version = self->_version;
  uint64_t v6 = *((void *)v4 + 4);
  if (version)
  {
    if (v6) {
      -[HDCodableSyncVersionRange mergeFrom:](version, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableSyncState setVersion:](self, "setVersion:");
  }
  origin = self->_origin;
  uint64_t v8 = *((void *)v4 + 3);
  if (origin)
  {
    if (v8) {
      -[HDCodableSyncStateOrigin mergeFrom:](origin, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HDCodableSyncState setOrigin:](self, "setOrigin:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 5);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[HDCodableSyncState addVersionedData:](self, "addVersionedData:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (HDCodableSyncVersionRange)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (HDCodableSyncStateOrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (NSMutableArray)versionedDatas
{
  return self->_versionedDatas;
}

- (void)setVersionedDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionedDatas, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end