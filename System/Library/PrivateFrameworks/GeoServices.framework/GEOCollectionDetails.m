@interface GEOCollectionDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)currentlySaved;
- (BOOL)hasCollectionCategory;
- (BOOL)hasCurrentlySaved;
- (BOOL)hasTargetId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCollectionDetails)init;
- (GEOCollectionDetails)initWithData:(id)a3;
- (GEOCollectionDetails)initWithDictionary:(id)a3;
- (GEOCollectionDetails)initWithJSON:(id)a3;
- (NSString)collectionCategory;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)collectionIdAtIndex:(unint64_t)a3;
- (unint64_t)collectionIds;
- (unint64_t)collectionIdsCount;
- (unint64_t)hash;
- (unint64_t)targetId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCollectionCategory;
- (void)_readCollectionIds;
- (void)addCollectionId:(unint64_t)a3;
- (void)clearCollectionIds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCollectionCategory:(id)a3;
- (void)setCollectionIds:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setCurrentlySaved:(BOOL)a3;
- (void)setHasCurrentlySaved:(BOOL)a3;
- (void)setHasTargetId:(BOOL)a3;
- (void)setTargetId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCollectionDetails

- (GEOCollectionDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCollectionDetails;
  v2 = [(GEOCollectionDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCollectionDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCollectionDetails;
  v3 = [(GEOCollectionDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCollectionDetails;
  [(GEOCollectionDetails *)&v3 dealloc];
}

- (void)_readCollectionIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCollectionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionIds_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)collectionIdsCount
{
  return self->_collectionIds.count;
}

- (unint64_t)collectionIds
{
  return self->_collectionIds.list;
}

- (void)clearCollectionIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt64Clear();
}

- (void)addCollectionId:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unint64_t)collectionIdAtIndex:(unint64_t)a3
{
  -[GEOCollectionDetails _readCollectionIds]((uint64_t)self);
  p_collectionIds = &self->_collectionIds;
  unint64_t count = self->_collectionIds.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_collectionIds->list[a3];
}

- (void)setCollectionIds:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147438](&self->_collectionIds, a3, a4);
}

- (void)_readCollectionCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCollectionDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCollectionCategory
{
  return self->_collectionCategory != 0;
}

- (NSString)collectionCategory
{
  -[GEOCollectionDetails _readCollectionCategory]((uint64_t)self);
  collectionCategory = self->_collectionCategory;

  return collectionCategory;
}

- (void)setCollectionCategory:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_collectionCategory, a3);
}

- (unint64_t)targetId
{
  return self->_targetId;
}

- (void)setTargetId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_targetId = a3;
}

- (void)setHasTargetId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasTargetId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)currentlySaved
{
  return self->_currentlySaved;
}

- (void)setCurrentlySaved:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_currentlySaved = a3;
}

- (void)setHasCurrentlySaved:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCurrentlySaved
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCollectionDetails;
  v4 = [(GEOCollectionDetails *)&v8 description];
  v5 = [(GEOCollectionDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCollectionDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      v5 = PBRepeatedUInt64NSArray();
      if (a2) {
        objc_super v6 = @"collectionId";
      }
      else {
        objc_super v6 = @"collection_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 collectionCategory];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"collectionCategory";
      }
      else {
        objc_super v8 = @"collection_category";
      }
      [v4 setObject:v7 forKey:v8];
    }

    char v9 = *(unsigned char *)(a1 + 72);
    if (v9)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        v11 = @"targetId";
      }
      else {
        v11 = @"target_id";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 72);
    }
    if ((v9 & 2) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
      if (a2) {
        v13 = @"currentlySaved";
      }
      else {
        v13 = @"currently_saved";
      }
      [v4 setObject:v12 forKey:v13];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCollectionDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCollectionDetails)initWithDictionary:(id)a3
{
  return (GEOCollectionDetails *)-[GEOCollectionDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"collectionId";
      }
      else {
        objc_super v6 = @"collection_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addCollectionId:", objc_msgSend(v13, "unsignedLongLongValue", (void)v22));
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v14 = @"collectionCategory";
      }
      else {
        v14 = @"collection_category";
      }
      v15 = objc_msgSend(v5, "objectForKeyedSubscript:", v14, (void)v22);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setCollectionCategory:v16];
      }
      if (a3) {
        v17 = @"targetId";
      }
      else {
        v17 = @"target_id";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTargetId:", objc_msgSend(v18, "unsignedLongLongValue"));
      }

      if (a3) {
        v19 = @"currentlySaved";
      }
      else {
        v19 = @"currently_saved";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCurrentlySaved:", objc_msgSend(v20, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOCollectionDetails)initWithJSON:(id)a3
{
  return (GEOCollectionDetails *)-[GEOCollectionDetails _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_484_0;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_485_0;
    }
    GEOCollectionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCollectionDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCollectionDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x1C) == 0)
    {
      id v8 = self->_reader;
      objc_sync_enter(v8);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v10 writeData:v9];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_13;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCollectionDetails *)self readAll:0];
  id v5 = v10;
  if (self->_collectionIds.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v5 = v10;
      ++v6;
    }
    while (v6 < self->_collectionIds.count);
  }
  if (self->_collectionCategory)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v5 = v10;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
LABEL_13:
    id v5 = v10;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = (id *)a3;
  [(GEOCollectionDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOCollectionDetails *)self collectionIdsCount])
  {
    [v8 clearCollectionIds];
    unint64_t v4 = [(GEOCollectionDetails *)self collectionIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addCollectionId:", -[GEOCollectionDetails collectionIdAtIndex:](self, "collectionIdAtIndex:", i));
    }
  }
  if (self->_collectionCategory) {
    objc_msgSend(v8, "setCollectionCategory:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v8[6] = self->_targetId;
    *((unsigned char *)v8 + 72) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v8 + 68) = self->_currentlySaved;
    *((unsigned char *)v8 + 72) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCollectionDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCollectionDetails *)self readAll:0];
  PBRepeatedUInt64Copy();
  uint64_t v9 = [(NSString *)self->_collectionCategory copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 48) = self->_targetId;
    *(unsigned char *)(v5 + 72) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 68) = self->_currentlySaved;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOCollectionDetails *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_12;
  }
  collectionCategory = self->_collectionCategory;
  if ((unint64_t)collectionCategory | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](collectionCategory, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_targetId != *((void *)v4 + 6)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_12;
  }
  BOOL v6 = (*((unsigned char *)v4 + 72) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0)
    {
LABEL_12:
      BOOL v6 = 0;
      goto LABEL_13;
    }
    if (self->_currentlySaved)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_12;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_12;
    }
    BOOL v6 = 1;
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  [(GEOCollectionDetails *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt64Hash();
  NSUInteger v4 = [(NSString *)self->_collectionCategory hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v5 = 2654435761u * self->_targetId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_currentlySaved;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v9 = a3;
  [v9 readAll:0];
  uint64_t v4 = [v9 collectionIdsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOCollectionDetails addCollectionId:](self, "addCollectionId:", [v9 collectionIdAtIndex:i]);
  }
  objc_super v7 = v9;
  if (v9[5])
  {
    -[GEOCollectionDetails setCollectionCategory:](self, "setCollectionCategory:");
    objc_super v7 = v9;
  }
  char v8 = *((unsigned char *)v7 + 72);
  if (v8)
  {
    self->_targetId = v7[6];
    *(unsigned char *)&self->_flags |= 1u;
    char v8 = *((unsigned char *)v7 + 72);
  }
  if ((v8 & 2) != 0)
  {
    self->_currentlySaved = *((unsigned char *)v7 + 68);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionCategory, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end