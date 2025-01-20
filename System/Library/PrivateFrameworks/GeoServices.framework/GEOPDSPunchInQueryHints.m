@interface GEOPDSPunchInQueryHints
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSPunchInQueryHints)init;
- (GEOPDSPunchInQueryHints)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)completedSearchQuery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)originalSearchQuery;
- (unint64_t)hash;
- (void)_readCompletedSearchQuery;
- (void)_readOriginalSearchQuery;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setCompletedSearchQuery:(uint64_t)a1;
- (void)setOriginalSearchQuery:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSPunchInQueryHints

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    v6 = v3;
    -[GEOPDSPunchInQueryHints readAll:]((uint64_t)v3, 0);
    v3 = v6;
    v4 = (void *)v6[4];
    if (v4)
    {
      -[GEOPDSPunchInQueryHints setOriginalSearchQuery:](a1, v4);
      v3 = v6;
    }
    v5 = (void *)v3[3];
    if (v5)
    {
      -[GEOPDSPunchInQueryHints setCompletedSearchQuery:](a1, v5);
      v3 = v6;
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 1u;
    *(unsigned char *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSPunchInQueryHints readAll:](a1, 0);
    }
  }
}

- (GEOPDSPunchInQueryHints)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSPunchInQueryHints;
  v2 = [(GEOPDSPunchInQueryHints *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSPunchInQueryHints)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSPunchInQueryHints;
  v3 = [(GEOPDSPunchInQueryHints *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalSearchQuery
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
        GEOPDSPunchInQueryHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalSearchQuery_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)originalSearchQuery
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSPunchInQueryHints _readOriginalSearchQuery]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setOriginalSearchQuery:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 52) |= 4u;
    *(unsigned char *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readCompletedSearchQuery
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
        GEOPDSPunchInQueryHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCompletedSearchQuery_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)completedSearchQuery
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSPunchInQueryHints _readCompletedSearchQuery]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCompletedSearchQuery:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 52) |= 2u;
    *(unsigned char *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSPunchInQueryHints;
  id v4 = [(GEOPDSPunchInQueryHints *)&v8 description];
  v5 = [(GEOPDSPunchInQueryHints *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSPunchInQueryHints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSPunchInQueryHints readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDSPunchInQueryHints originalSearchQuery]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"originalSearchQuery";
      }
      else {
        objc_super v6 = @"original_search_query";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = -[GEOPDSPunchInQueryHints completedSearchQuery]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"completedSearchQuery";
      }
      else {
        objc_super v8 = @"completed_search_query";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = *(void **)(a1 + 16);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __53__GEOPDSPunchInQueryHints__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOPDSPunchInQueryHints _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_364;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_365;
      }
      GEOPDSPunchInQueryHintsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __53__GEOPDSPunchInQueryHints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSPunchInQueryHintsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    -[GEOPDSPunchInQueryHints readAll:]((uint64_t)self, 0);
    if (self->_originalSearchQuery) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_completedSearchQuery)
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
    -[GEOPDSPunchInQueryHints readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_originalSearchQuery copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_completedSearchQuery copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSPunchInQueryHintsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSPunchInQueryHints readAll:]((uint64_t)self, 1),
         -[GEOPDSPunchInQueryHints readAll:]((uint64_t)v4, 1),
         originalSearchQuery = self->_originalSearchQuery,
         !((unint64_t)originalSearchQuery | v4[4]))
     || -[NSString isEqual:](originalSearchQuery, "isEqual:")))
  {
    completedSearchQuery = self->_completedSearchQuery;
    if ((unint64_t)completedSearchQuery | v4[3]) {
      char v7 = -[NSString isEqual:](completedSearchQuery, "isEqual:");
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
  -[GEOPDSPunchInQueryHints readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_originalSearchQuery hash];
  return [(NSString *)self->_completedSearchQuery hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSearchQuery, 0);
  objc_storeStrong((id *)&self->_completedSearchQuery, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end