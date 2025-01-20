@interface GEOPDSearchQueryNormalizerMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryNormalizerMetadata)init;
- (GEOPDSearchQueryNormalizerMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryNormalizerMetadata

- (GEOPDSearchQueryNormalizerMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryNormalizerMetadata;
  v2 = [(GEOPDSearchQueryNormalizerMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryNormalizerMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryNormalizerMetadata;
  v3 = [(GEOPDSearchQueryNormalizerMetadata *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDSearchQueryNormalizerMetadata;
  v4 = [(GEOPDSearchQueryNormalizerMetadata *)&v8 description];
  v5 = [(GEOPDSearchQueryNormalizerMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryNormalizerMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalQuery_tags_1920);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 32);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"originalQuery";
      }
      else {
        objc_super v8 = @"original_query";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNormalizedQuery_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v11 = *(id *)(a1 + 16);
    if (v11)
    {
      if (a2) {
        v12 = @"normalizedQuery";
      }
      else {
        v12 = @"normalized_query";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNormalizerName_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v15 = *(id *)(a1 + 24);
    if (v15)
    {
      if (a2) {
        v16 = @"normalizerName";
      }
      else {
        v16 = @"normalizer_name";
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
  return -[GEOPDSearchQueryNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_1933;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1934;
      }
      GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryNormalizerMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
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
    -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 0);
    if (self->_originalQuery) {
      PBDataWriterWriteStringField();
    }
    if (self->_normalizedQuery) {
      PBDataWriterWriteStringField();
    }
    if (self->_normalizerName) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_originalQuery copyWithZone:a3];
    v9 = (void *)v5[4];
    v5[4] = v8;

    uint64_t v10 = [(NSString *)self->_normalizedQuery copyWithZone:a3];
    id v11 = (void *)v5[2];
    v5[2] = v10;

    uint64_t v12 = [(NSString *)self->_normalizerName copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchQueryNormalizerMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 1),
         -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)v4, 1),
         originalQuery = self->_originalQuery,
         !((unint64_t)originalQuery | v4[4]))
     || -[NSString isEqual:](originalQuery, "isEqual:"))
    && ((normalizedQuery = self->_normalizedQuery, !((unint64_t)normalizedQuery | v4[2]))
     || -[NSString isEqual:](normalizedQuery, "isEqual:")))
  {
    normalizerName = self->_normalizerName;
    if ((unint64_t)normalizerName | v4[3]) {
      char v8 = -[NSString isEqual:](normalizerName, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_originalQuery hash];
  NSUInteger v4 = [(NSString *)self->_normalizedQuery hash] ^ v3;
  return v4 ^ [(NSString *)self->_normalizerName hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalQuery, 0);
  objc_storeStrong((id *)&self->_normalizerName, 0);
  objc_storeStrong((id *)&self->_normalizedQuery, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end