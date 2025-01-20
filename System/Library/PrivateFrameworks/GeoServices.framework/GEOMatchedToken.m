@interface GEOMatchedToken
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGeoType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMatchedToken)init;
- (GEOMatchedToken)initWithData:(id)a3;
- (GEOMatchedToken)initWithDictionary:(id)a3;
- (GEOMatchedToken)initWithJSON:(id)a3;
- (NSString)matchedToken;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)geoType;
- (unint64_t)geoIdAtIndex:(unint64_t)a3;
- (unint64_t)geoIds;
- (unint64_t)geoIdsCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readGeoIds;
- (void)addGeoId:(unint64_t)a3;
- (void)clearGeoIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setGeoIds:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setGeoType:(int)a3;
- (void)setHasGeoType:(BOOL)a3;
- (void)setMatchedToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMatchedToken

- (GEOMatchedToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMatchedToken;
  v2 = [(GEOMatchedToken *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMatchedToken)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMatchedToken;
  v3 = [(GEOMatchedToken *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOMatchedToken;
  [(GEOMatchedToken *)&v3 dealloc];
}

- (NSString)matchedToken
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOMatchedTokenReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readMatchedToken_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  matchedToken = self->_matchedToken;

  return matchedToken;
}

- (void)setMatchedToken:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_matchedToken, a3);
}

- (int)geoType
{
  return self->_geoType;
}

- (void)setGeoType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_geoType = a3;
}

- (void)setHasGeoType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasGeoType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readGeoIds
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
        GEOMatchedTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoIds_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)geoIdsCount
{
  return self->_geoIds.count;
}

- (unint64_t)geoIds
{
  return self->_geoIds.list;
}

- (void)clearGeoIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt64Clear();
}

- (void)addGeoId:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unint64_t)geoIdAtIndex:(unint64_t)a3
{
  -[GEOMatchedToken _readGeoIds]((uint64_t)self);
  p_geoIds = &self->_geoIds;
  unint64_t count = self->_geoIds.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_geoIds->list[a3];
}

- (void)setGeoIds:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147438](&self->_geoIds, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMatchedToken;
  v4 = [(GEOMatchedToken *)&v8 description];
  v5 = [(GEOMatchedToken *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMatchedToken _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 matchedToken];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"matchedToken";
      }
      else {
        objc_super v6 = @"matched_token";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 72))
    {
      objc_super v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        objc_super v8 = @"geoType";
      }
      else {
        objc_super v8 = @"geo_type";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(void *)(a1 + 32))
    {
      v9 = PBRepeatedUInt64NSArray();
      if (a2) {
        v10 = @"geoId";
      }
      else {
        v10 = @"geo_id";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 16);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __45__GEOMatchedToken__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOMatchedToken _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOMatchedToken__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOMatchedToken)initWithDictionary:(id)a3
{
  return (GEOMatchedToken *)-[GEOMatchedToken _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"matchedToken";
      }
      else {
        objc_super v6 = @"matched_token";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setMatchedToken:v8];
      }
      if (a3) {
        v9 = @"geoType";
      }
      else {
        v9 = @"geo_type";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGeoType:", objc_msgSend(v10, "intValue"));
      }

      if (a3) {
        v11 = @"geoId";
      }
      else {
        v11 = @"geo_id";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v21;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v20 + 1) + 8 * v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addGeoId:", objc_msgSend(v18, "unsignedLongLongValue", (void)v20));
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v15);
        }
      }
    }
  }

  return a1;
}

- (GEOMatchedToken)initWithJSON:(id)a3
{
  return (GEOMatchedToken *)-[GEOMatchedToken _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1603;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1604;
    }
    GEOMatchedTokenReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMatchedTokenIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMatchedTokenReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMatchedToken *)self readAll:0];
    PBDataWriterWriteStringField();
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_geoIds.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v5;
      }
      while (v5 < self->_geoIds.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v8];
  }
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOMatchedToken *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v7 setMatchedToken:self->_matchedToken];
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v7 + 17) = self->_geoType;
    *((unsigned char *)v7 + 72) |= 1u;
  }
  if ([(GEOMatchedToken *)self geoIdsCount])
  {
    [v7 clearGeoIds];
    unint64_t v4 = [(GEOMatchedToken *)self geoIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addGeoId:", -[GEOMatchedToken geoIdAtIndex:](self, "geoIdAtIndex:", i));
    }
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
      GEOMatchedTokenReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMatchedToken *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_matchedToken copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_geoType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  PBRepeatedUInt64Copy();
  v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOMatchedToken *)self readAll:1];
  [v4 readAll:1];
  matchedToken = self->_matchedToken;
  if ((unint64_t)matchedToken | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](matchedToken, "isEqual:")) {
      goto LABEL_10;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_geoType != *((_DWORD *)v4 + 17)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_10:
    char IsEqual = 0;
    goto LABEL_11;
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOMatchedToken *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_matchedToken hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_geoType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ PBRepeatedUInt64Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  objc_super v7 = (int *)a3;
  [v7 readAll:0];
  if (*((void *)v7 + 6)) {
    -[GEOMatchedToken setMatchedToken:](self, "setMatchedToken:");
  }
  if (v7[18])
  {
    self->_geoType = v7[17];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v7 geoIdsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOMatchedToken addGeoId:](self, "addGeoId:", [v7 geoIdAtIndex:i]);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOMatchedTokenReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1608);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMatchedToken *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedToken, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end