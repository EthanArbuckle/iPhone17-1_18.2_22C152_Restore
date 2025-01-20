@interface GEOPDSource
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSource)init;
- (GEOPDSource)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setSourceId:(uint64_t)a1;
- (void)setVersion:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSource

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    v6 = self->_reader;
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
    -[GEOPDSource readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_sourceId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_version)
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
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSourceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSource readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_resultProviderId;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_sourceId copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_version copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (GEOPDSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSource;
  v2 = [(GEOPDSource *)&v6 init];
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
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 2u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSource readAll:](a1, 0);
    }
  }
}

- (GEOPDSource)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSource;
  v3 = [(GEOPDSource *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)setSourceId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 4u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setVersion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 8u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSource;
  id v4 = [(GEOPDSource *)&v8 description];
  uint64_t v5 = [(GEOPDSource *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSource readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        objc_super v6 = @"resultProviderId";
      }
      else {
        objc_super v6 = @"result_provider_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      objc_super v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEOPDSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceId_tags_8541);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v9 = *(id *)(a1 + 24);
    if (v9)
    {
      if (a2) {
        v10 = @"sourceId";
      }
      else {
        v10 = @"source_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      uint64_t v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersion_tags_8542);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v13 = *(id *)(a1 + 32);
    if (v13) {
      [v4 setObject:v13 forKey:@"version"];
    }

    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __41__GEOPDSource__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSource _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_8543;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_8544;
      }
      GEOPDSourceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __41__GEOPDSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSourceReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDSource readAll:]((uint64_t)self, 1);
  -[GEOPDSource readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  sourceId = self->_sourceId;
  if ((unint64_t)sourceId | *((void *)v4 + 3) && !-[NSString isEqual:](sourceId, "isEqual:")) {
    goto LABEL_11;
  }
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](version, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSource readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_resultProviderId;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_sourceId hash] ^ v3;
  return v4 ^ [(NSString *)self->_version hash];
}

@end