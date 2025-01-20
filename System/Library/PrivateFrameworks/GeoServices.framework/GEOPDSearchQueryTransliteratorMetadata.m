@interface GEOPDSearchQueryTransliteratorMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryTransliteratorMetadata)init;
- (GEOPDSearchQueryTransliteratorMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryTransliteratorMetadata

- (GEOPDSearchQueryTransliteratorMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryTransliteratorMetadata;
  v2 = [(GEOPDSearchQueryTransliteratorMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryTransliteratorMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryTransliteratorMetadata;
  v3 = [(GEOPDSearchQueryTransliteratorMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryTransliteratorMetadata;
  v4 = [(GEOPDSearchQueryTransliteratorMetadata *)&v8 description];
  v5 = [(GEOPDSearchQueryTransliteratorMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryTransliteratorMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryTransliteratorMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryTransliteratorMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReading_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = *(id *)(a1 + 24);
    if (v7) {
      [v4 setObject:v7 forKey:@"reading"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchQueryTransliteratorMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParentQuery_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v10 = *(id *)(a1 + 16);
    if (v10)
    {
      if (a2) {
        v11 = @"parentQuery";
      }
      else {
        v11 = @"parent_query";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v12 = *(int *)(a1 + 44);
      if (v12 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53E2920[v12];
      }
      if (a2) {
        v14 = @"transliteratorSource";
      }
      else {
        v14 = @"transliterator_source";
      }
      [v4 setObject:v13 forKey:v14];
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
  return -[GEOPDSearchQueryTransliteratorMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_2252;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2253;
      }
      GEOPDSearchQueryTransliteratorMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryTransliteratorMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 0);
    if (self->_reading) {
      PBDataWriterWriteStringField();
    }
    if (self->_parentQuery) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryTransliteratorMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_reading copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_parentQuery copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_transliteratorSource;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)v4, 1);
  reading = self->_reading;
  if ((unint64_t)reading | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](reading, "isEqual:")) {
      goto LABEL_10;
    }
  }
  parentQuery = self->_parentQuery;
  if ((unint64_t)parentQuery | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](parentQuery, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_transliteratorSource == *((_DWORD *)v4 + 11))
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

- (unint64_t)hash
{
  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_reading hash];
  NSUInteger v4 = [(NSString *)self->_parentQuery hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_transliteratorSource;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reading, 0);
  objc_storeStrong((id *)&self->_parentQuery, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end