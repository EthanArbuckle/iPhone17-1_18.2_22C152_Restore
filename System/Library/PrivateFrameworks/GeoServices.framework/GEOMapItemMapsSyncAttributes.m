@interface GEOMapItemMapsSyncAttributes
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMapsSyncIdentifier;
- (BOOL)hasMapsSyncObjectType;
- (BOOL)hasSecondaryObjectType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemMapsSyncAttributes)init;
- (GEOMapItemMapsSyncAttributes)initWithData:(id)a3;
- (GEOMapItemMapsSyncAttributes)initWithDictionary:(id)a3;
- (GEOMapItemMapsSyncAttributes)initWithJSON:(id)a3;
- (NSString)mapsSyncIdentifier;
- (NSString)mapsSyncObjectType;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)secondaryObjectTypeAsString:(int)a3;
- (int)StringAsSecondaryObjectType:(id)a3;
- (int)secondaryObjectType;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readMapsSyncIdentifier;
- (void)_readMapsSyncObjectType;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasSecondaryObjectType:(BOOL)a3;
- (void)setMapsSyncIdentifier:(id)a3;
- (void)setMapsSyncObjectType:(id)a3;
- (void)setSecondaryObjectType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemMapsSyncAttributes

- (void)setMapsSyncObjectType:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_mapsSyncObjectType, a3);
}

- (void)setMapsSyncIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapsSyncIdentifier, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapItemMapsSyncAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapItemMapsSyncAttributes *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_mapsSyncIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_mapsSyncObjectType copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_secondaryObjectType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (GEOMapItemMapsSyncAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemMapsSyncAttributes;
  v2 = [(GEOMapItemMapsSyncAttributes *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSyncObjectType, 0);
  objc_storeStrong((id *)&self->_mapsSyncIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
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
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapItemMapsSyncAttributes *)self readAll:0];
    if (self->_mapsSyncIdentifier) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_mapsSyncObjectType)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_994;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_995;
    }
    GEOMapItemMapsSyncAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOMapItemMapsSyncAttributes *)self readAll:1];
  [v4 readAll:1];
  mapsSyncIdentifier = self->_mapsSyncIdentifier;
  if ((unint64_t)mapsSyncIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mapsSyncIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  mapsSyncObjectType = self->_mapsSyncObjectType;
  if ((unint64_t)mapsSyncObjectType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](mapsSyncObjectType, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_secondaryObjectType == *((_DWORD *)v4 + 13))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (GEOMapItemMapsSyncAttributes)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemMapsSyncAttributes;
  BOOL v3 = [(GEOMapItemMapsSyncAttributes *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readMapsSyncIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemMapsSyncAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsSyncIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsSyncIdentifier
{
  return self->_mapsSyncIdentifier != 0;
}

- (NSString)mapsSyncIdentifier
{
  -[GEOMapItemMapsSyncAttributes _readMapsSyncIdentifier]((uint64_t)self);
  mapsSyncIdentifier = self->_mapsSyncIdentifier;

  return mapsSyncIdentifier;
}

- (void)_readMapsSyncObjectType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemMapsSyncAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsSyncObjectType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsSyncObjectType
{
  return self->_mapsSyncObjectType != 0;
}

- (NSString)mapsSyncObjectType
{
  -[GEOMapItemMapsSyncAttributes _readMapsSyncObjectType]((uint64_t)self);
  mapsSyncObjectType = self->_mapsSyncObjectType;

  return mapsSyncObjectType;
}

- (int)secondaryObjectType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_secondaryObjectType;
  }
  else {
    return 0;
  }
}

- (void)setSecondaryObjectType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_secondaryObjectType = a3;
}

- (void)setHasSecondaryObjectType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasSecondaryObjectType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)secondaryObjectTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7918[a3];
  }

  return v3;
}

- (int)StringAsSecondaryObjectType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"School"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemMapsSyncAttributes;
  int v4 = [(GEOMapItemMapsSyncAttributes *)&v8 description];
  id v5 = [(GEOMapItemMapsSyncAttributes *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemMapsSyncAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 mapsSyncIdentifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"mapsSyncIdentifier"];
    }

    objc_super v6 = [(id)a1 mapsSyncObjectType];
    if (v6) {
      [v4 setObject:v6 forKey:@"mapsSyncObjectType"];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v7 = *(int *)(a1 + 52);
      if (v7 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53E7918[v7];
      }
      [v4 setObject:v8 forKey:@"secondaryObjectType"];
    }
    uint64_t v9 = *(void **)(a1 + 16);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      uint64_t v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__GEOMapItemMapsSyncAttributes__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        uint64_t v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapItemMapsSyncAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOMapItemMapsSyncAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOMapItemMapsSyncAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemMapsSyncAttributes *)-[GEOMapItemMapsSyncAttributes _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"mapsSyncIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        [a1 setMapsSyncIdentifier:v5];
      }
      objc_super v6 = [v3 objectForKeyedSubscript:@"mapsSyncObjectType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = (void *)[v6 copy];
        [a1 setMapsSyncObjectType:v7];
      }
      objc_super v8 = [v3 objectForKeyedSubscript:@"secondaryObjectType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if ([v9 isEqualToString:@"None"])
        {
          uint64_t v10 = 0;
        }
        else if ([v9 isEqualToString:@"Home"])
        {
          uint64_t v10 = 1;
        }
        else if ([v9 isEqualToString:@"Work"])
        {
          uint64_t v10 = 2;
        }
        else if ([v9 isEqualToString:@"School"])
        {
          uint64_t v10 = 3;
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_21:

          goto LABEL_22;
        }
        uint64_t v10 = [v8 intValue];
      }
      [a1 setSecondaryObjectType:v10];
      goto LABEL_21;
    }
  }
LABEL_22:

  return a1;
}

- (GEOMapItemMapsSyncAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemMapsSyncAttributes *)-[GEOMapItemMapsSyncAttributes _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemMapsSyncAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemMapsSyncAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEOMapItemMapsSyncAttributes *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapsSyncIdentifier) {
    objc_msgSend(v4, "setMapsSyncIdentifier:");
  }
  if (self->_mapsSyncObjectType) {
    objc_msgSend(v4, "setMapsSyncObjectType:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_secondaryObjectType;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (unint64_t)hash
{
  [(GEOMapItemMapsSyncAttributes *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_mapsSyncIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_mapsSyncObjectType hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_secondaryObjectType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[3])
  {
    -[GEOMapItemMapsSyncAttributes setMapsSyncIdentifier:](self, "setMapsSyncIdentifier:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[GEOMapItemMapsSyncAttributes setMapsSyncObjectType:](self, "setMapsSyncObjectType:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    self->_secondaryObjectType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
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
      GEOMapItemMapsSyncAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_999);
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
    [(GEOMapItemMapsSyncAttributes *)self readAll:0];
  }
}

@end