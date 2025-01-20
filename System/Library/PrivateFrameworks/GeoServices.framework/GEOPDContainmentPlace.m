@interface GEOPDContainmentPlace
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDContainmentPlace)init;
- (GEOPDContainmentPlace)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)containerId;
- (id)containmentLine;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readContainerId;
- (void)_readContainmentLine;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDContainmentPlace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containmentLine, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDContainmentPlace readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDMapsIdentifier *)self->_containerId copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOFormattedString *)self->_containmentLine copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDContainmentPlaceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEOPDContainmentPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDContainmentPlace;
  v2 = [(GEOPDContainmentPlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xA) != 0)
    || (*(unsigned char *)&self->_flags & 4) != 0
    && (GEOFormattedStringIsDirty((os_unfair_lock_s *)self->_containmentLine) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDContainmentPlace readAll:]((uint64_t)self, 0);
    if (self->_containerId) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_containmentLine)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
  else
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
}

- (GEOPDContainmentPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDContainmentPlace;
  v3 = [(GEOPDContainmentPlace *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readContainerId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDContainmentPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainerId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)containerId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDContainmentPlace _readContainerId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readContainmentLine
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDContainmentPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainmentLine_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)containmentLine
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDContainmentPlace _readContainmentLine]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDContainmentPlace;
  v4 = [(GEOPDContainmentPlace *)&v8 description];
  id v5 = [(GEOPDContainmentPlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDContainmentPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDContainmentPlace readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDContainmentPlace containerId]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"containerId";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"container_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDContainmentPlace containmentLine]((id *)a1);
    id v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"containmentLine";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"containment_line";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = *(void **)(a1 + 16);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __51__GEOPDContainmentPlace__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOPDContainmentPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_3520;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3521;
      }
      GEOPDContainmentPlaceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 24) readAll:1];
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __51__GEOPDContainmentPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDContainmentPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDContainmentPlace readAll:]((uint64_t)self, 1),
         -[GEOPDContainmentPlace readAll:]((uint64_t)v4, 1),
         containerId = self->_containerId,
         !((unint64_t)containerId | v4[3]))
     || -[GEOPDMapsIdentifier isEqual:](containerId, "isEqual:")))
  {
    containmentLine = self->_containmentLine;
    if ((unint64_t)containmentLine | v4[4]) {
      char v7 = -[GEOFormattedString isEqual:](containmentLine, "isEqual:");
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
  -[GEOPDContainmentPlace readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_containerId hash];
  return [(GEOFormattedString *)self->_containmentLine hash] ^ v3;
}

@end