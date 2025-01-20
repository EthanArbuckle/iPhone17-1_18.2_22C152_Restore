@interface GEOPDSearchQueryDymMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryDymMetadata)init;
- (GEOPDSearchQueryDymMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryDymMetadata

- (GEOPDSearchQueryDymMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryDymMetadata;
  v2 = [(GEOPDSearchQueryDymMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryDymMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryDymMetadata;
  v3 = [(GEOPDSearchQueryDymMetadata *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDSearchQueryDymMetadata;
  v4 = [(GEOPDSearchQueryDymMetadata *)&v8 description];
  v5 = [(GEOPDSearchQueryDymMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryDymMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryDymMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = *(int *)(a1 + 44);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E26F0[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      objc_super v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEOPDSearchQueryDymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalQuery_tags);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v9 = *(id *)(a1 + 16);
    if (v9)
    {
      if (a2) {
        v10 = @"originalQuery";
      }
      else {
        v10 = @"original_query";
      }
      [v4 setObject:v9 forKey:v10];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDSearchQueryDymMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSynonymMetadata_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v13 = *(id *)(a1 + 24);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"synonymMetadata";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"synonym_metadata";
      }
      [v4 setObject:v15 forKey:v16];
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
  return -[GEOPDSearchQueryDymMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_1319_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1320_0;
      }
      GEOPDSearchQueryDymMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDSearchQuerySynonymMetadata readAll:](*(void *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryDymMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDSearchQueryDymMetadataIsDirty((uint64_t)self))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_originalQuery) {
      PBDataWriterWriteStringField();
    }
    if (self->_synonymMetadata) {
      PBDataWriterWriteSubmessage();
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
      GEOPDSearchQueryDymMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_type;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_originalQuery copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEOPDSearchQuerySynonymMetadata *)self->_synonymMetadata copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_type != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  originalQuery = self->_originalQuery;
  if ((unint64_t)originalQuery | *((void *)v4 + 2)
    && !-[NSString isEqual:](originalQuery, "isEqual:"))
  {
    goto LABEL_11;
  }
  synonymMetadata = self->_synonymMetadata;
  if ((unint64_t)synonymMetadata | *((void *)v4 + 3)) {
    char v7 = -[GEOPDSearchQuerySynonymMetadata isEqual:](synonymMetadata, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_originalQuery hash] ^ v3;
  return v4 ^ [(GEOPDSearchQuerySynonymMetadata *)self->_synonymMetadata hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymMetadata, 0);
  objc_storeStrong((id *)&self->_originalQuery, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end