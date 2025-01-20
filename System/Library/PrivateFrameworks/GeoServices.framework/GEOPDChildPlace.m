@interface GEOPDChildPlace
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDChildPlace)init;
- (GEOPDChildPlace)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsId;
- (id)name;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (unint64_t)hash;
- (void)_readMapsId;
- (void)_readName;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDChildPlace

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(v1 + 52) |= 1u;
    *(unsigned char *)(v1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEOPDChildPlace readAll:](v1, 0);
    v3 = *(void **)(v1 + 24);
    return [v3 clearUnknownFields:1];
  }
  return result;
}

- (GEOPDChildPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDChildPlace;
  v2 = [(GEOPDChildPlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDChildPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDChildPlace;
  v3 = [(GEOPDChildPlace *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapsId
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
        GEOPDChildPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)mapsId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDChildPlace _readMapsId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readName
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
        GEOPDChildPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_9);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDChildPlace _readName]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDChildPlace;
  v4 = [(GEOPDChildPlace *)&v8 description];
  v5 = [(GEOPDChildPlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDChildPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDChildPlace readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDChildPlace mapsId]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapsId";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"maps_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDChildPlace name]((id *)a1);
    if (v9) {
      [v4 setObject:v9 forKey:@"name"];
    }

    v10 = *(void **)(a1 + 16);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __45__GEOPDChildPlace__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOPDChildPlace _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_1695;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1696;
      }
      GEOPDChildPlaceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 24) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __45__GEOPDChildPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"mapsId";
    }
    else {
      objc_super v7 = @"maps_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [GEOPDMapsIdentifier alloc];
      if (a3) {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithJSON:v8];
      }
      else {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithDictionary:v8];
      }
      v11 = v10;
      v12 = v10;
      *(unsigned char *)(v6 + 52) |= 2u;
      *(unsigned char *)(v6 + 52) |= 8u;
      objc_storeStrong((id *)(v6 + 24), v11);
    }
    v13 = [v5 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = (void *)[v13 copy];
      id v15 = v14;
      *(unsigned char *)(v6 + 52) |= 4u;
      *(unsigned char *)(v6 + 52) |= 8u;
      objc_storeStrong((id *)(v6 + 32), v14);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDChildPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v6 = self->_reader;
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
    -[GEOPDChildPlace readAll:]((uint64_t)self, 0);
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDChildPlace readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_name copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDChildPlaceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDChildPlace readAll:]((uint64_t)self, 1),
         -[GEOPDChildPlace readAll:]((uint64_t)v4, 1),
         mapsId = self->_mapsId,
         !((unint64_t)mapsId | v4[3]))
     || -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")))
  {
    name = self->_name;
    if ((unint64_t)name | v4[4]) {
      char v7 = -[NSString isEqual:](name, "isEqual:");
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
  -[GEOPDChildPlace readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  return [(NSString *)self->_name hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end