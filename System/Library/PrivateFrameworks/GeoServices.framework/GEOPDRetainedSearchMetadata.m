@interface GEOPDRetainedSearchMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDRetainedSearchMetadata)init;
- (GEOPDRetainedSearchMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)query;
- (id)sourceAppId;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_readQuery;
- (void)_readSourceAppId;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setQuery:(uint64_t)a1;
- (void)setSourceAppId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDRetainedSearchMetadata

- (GEOPDRetainedSearchMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDRetainedSearchMetadata;
  v2 = [(GEOPDRetainedSearchMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDRetainedSearchMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDRetainedSearchMetadata;
  v3 = [(GEOPDRetainedSearchMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQuery
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
        GEOPDRetainedSearchMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)query
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDRetainedSearchMetadata _readQuery]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setQuery:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 56) |= 4u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readSourceAppId
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
        GEOPDRetainedSearchMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceAppId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)sourceAppId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDRetainedSearchMetadata _readSourceAppId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSourceAppId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 56) |= 8u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDRetainedSearchMetadata;
  id v4 = [(GEOPDRetainedSearchMetadata *)&v8 description];
  v5 = [(GEOPDRetainedSearchMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRetainedSearchMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDRetainedSearchMetadata readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDRetainedSearchMetadata query]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"query"];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v6 = *(int *)(a1 + 52);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53E5D80[v6];
      }
      [v4 setObject:v7 forKey:@"source"];
    }
    objc_super v8 = -[GEOPDRetainedSearchMetadata sourceAppId]((id *)a1);
    if (v8)
    {
      if (a2) {
        v9 = @"sourceAppId";
      }
      else {
        v9 = @"source_app_id";
      }
      [v4 setObject:v8 forKey:v9];
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
        v17[2] = __57__GEOPDRetainedSearchMetadata__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRetainedSearchMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        uint64_t v6 = (int *)&readAll__recursiveTag_1305;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_1306;
      }
      GEOPDRetainedSearchMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __57__GEOPDRetainedSearchMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (!a1) {
    goto LABEL_23;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_23;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"query"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    -[GEOPDRetainedSearchMetadata setQuery:](a1, v7);
  }
  objc_super v8 = [v5 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"RETAIN_SEARCH_SOURCE_DEFAULT"])
    {
      int v10 = 0;
    }
    else if ([v9 isEqualToString:@"RETAIN_SEARCH_SOURCE_SPOTLIGHT"])
    {
      int v10 = 1;
    }
    else if ([v9 isEqualToString:@"RETAIN_SEARCH_SOURCE_SIRI"])
    {
      int v10 = 2;
    }
    else
    {
      int v10 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v8 intValue];
LABEL_16:
    *(unsigned char *)(a1 + 56) |= 0x10u;
    *(unsigned char *)(a1 + 56) |= 1u;
    *(_DWORD *)(a1 + 52) = v10;
  }

  if (a3) {
    v11 = @"sourceAppId";
  }
  else {
    v11 = @"source_app_id";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    -[GEOPDRetainedSearchMetadata setSourceAppId:](a1, v13);
  }
LABEL_23:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRetainedSearchMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    -[GEOPDRetainedSearchMetadata readAll:]((uint64_t)self, 0);
    if (self->_query) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_sourceAppId)
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
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDRetainedSearchMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDRetainedSearchMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
  int v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_source;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_sourceAppId copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDRetainedSearchMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDRetainedSearchMetadata readAll:]((uint64_t)v4, 1);
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_source != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  sourceAppId = self->_sourceAppId;
  if ((unint64_t)sourceAppId | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](sourceAppId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDRetainedSearchMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_query hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_source;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_sourceAppId hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    -[GEOPDRetainedSearchMetadata readAll:]((uint64_t)v3, 0);
    id v3 = v6;
    uint64_t v4 = (void *)*((void *)v6 + 3);
    if (v4)
    {
      -[GEOPDRetainedSearchMetadata setQuery:](a1, v4);
      id v3 = v6;
    }
    if (*((unsigned char *)v3 + 56))
    {
      *(_DWORD *)(a1 + 52) = *((_DWORD *)v3 + 13);
      *(unsigned char *)(a1 + 56) |= 1u;
    }
    uint64_t v5 = (void *)*((void *)v3 + 4);
    if (v5)
    {
      -[GEOPDRetainedSearchMetadata setSourceAppId:](a1, v5);
      id v3 = v6;
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 2u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDRetainedSearchMetadata readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAppId, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end