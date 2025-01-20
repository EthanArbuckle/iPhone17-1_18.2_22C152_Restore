@interface GEOPDTransitScheduleCategory
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitScheduleCategory)init;
- (GEOPDTransitScheduleCategory)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)artwork;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (uint64_t)groupIndexAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readArtwork;
- (void)_readDisplayName;
- (void)_readGroupIndexs;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitScheduleCategory

- (uint64_t)groupIndexAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDTransitScheduleCategory _readGroupIndexs](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDTransitScheduleCategory readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDTransitScheduleCategory displayName]((id *)a1);
    if (v5)
    {
      if (a2) {
        uint64_t v6 = @"displayName";
      }
      else {
        uint64_t v6 = @"display_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(void *)(a1 + 32))
    {
      v7 = PBRepeatedUInt32NSArray();
      if (a2) {
        v8 = @"groupIndex";
      }
      else {
        v8 = @"group_index";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDTransitScheduleCategory artwork]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"artwork"];
    }
    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __58__GEOPDTransitScheduleCategory__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (GEOPDTransitScheduleCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitScheduleCategory;
  v2 = [(GEOPDTransitScheduleCategory *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDTransitScheduleCategory)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitScheduleCategory;
  uint64_t v3 = [(GEOPDTransitScheduleCategory *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDTransitScheduleCategory;
  [(GEOPDTransitScheduleCategory *)&v3 dealloc];
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_9534);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitScheduleCategory _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readGroupIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroupIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_9535);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)artwork
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitScheduleCategory _readArtwork]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitScheduleCategory;
  unint64_t v4 = [(GEOPDTransitScheduleCategory *)&v8 description];
  v5 = [(GEOPDTransitScheduleCategory *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitScheduleCategory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitScheduleCategory _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_9542;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9543;
      }
      GEOPDTransitScheduleCategoryReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 48) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __58__GEOPDTransitScheduleCategory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitScheduleCategoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1A) != 0)
    || (*(unsigned char *)&self->_flags & 4) != 0
    && (GEOPBTransitArtworkIsDirty((os_unfair_lock_s *)self->_artwork) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitScheduleCategory readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_groupIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_groupIndexs.count);
    }
    if (self->_artwork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
  else
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitScheduleCategory readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
    id v9 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v8;

    PBRepeatedUInt32Copy();
    id v10 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDTransitScheduleCategoryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDTransitScheduleCategory readAll:]((uint64_t)self, 1),
         -[GEOPDTransitScheduleCategory readAll:]((uint64_t)v4, 1),
         displayName = self->_displayName,
         !((unint64_t)displayName | v4[7]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && PBRepeatedUInt32IsEqual())
  {
    artwork = self->_artwork;
    if ((unint64_t)artwork | v4[6]) {
      char v7 = -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:");
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
  -[GEOPDTransitScheduleCategory readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  uint64_t v4 = PBRepeatedUInt32Hash() ^ v3;
  return v4 ^ [(GEOPBTransitArtwork *)self->_artwork hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end