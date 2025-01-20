@interface GEOPDPaginationInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPaginationInfo)init;
- (GEOPDPaginationInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setNextPageToken:(uint64_t)a1;
- (void)setPrevPageToken:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPaginationInfo

- (void)mergeFrom:(uint64_t)a1
{
  v7 = a2;
  -[GEOPDPaginationInfo readAll:]((uint64_t)v7, 0);
  v3 = v7;
  v4 = (void *)v7[4];
  if (v4)
  {
    -[GEOPDPaginationInfo setPrevPageToken:](a1, v4);
    v3 = v7;
  }
  v5 = (void *)v3[3];
  if (v5)
  {
    -[GEOPDPaginationInfo setNextPageToken:](a1, v5);
    v3 = v7;
  }
  char v6 = *((unsigned char *)v3 + 60);
  if (v6)
  {
    *(_DWORD *)(a1 + 52) = *((_DWORD *)v3 + 13);
    *(unsigned char *)(a1 + 60) |= 1u;
    char v6 = *((unsigned char *)v3 + 60);
  }
  if ((v6 & 2) != 0)
  {
    *(_DWORD *)(a1 + 56) = *((_DWORD *)v3 + 14);
    *(unsigned char *)(a1 + 60) |= 2u;
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDPaginationInfo readAll:](a1, 0);
  }
}

- (GEOPDPaginationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPaginationInfo;
  v2 = [(GEOPDPaginationInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPaginationInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPaginationInfo;
  v3 = [(GEOPDPaginationInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setPrevPageToken:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  *(unsigned char *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setNextPageToken:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 8u;
  *(unsigned char *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPaginationInfo;
  id v4 = [(GEOPDPaginationInfo *)&v8 description];
  v5 = [(GEOPDPaginationInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPaginationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPaginationInfo readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDPaginationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrevPageToken_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 32);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"prevPageToken";
      }
      else {
        objc_super v8 = @"prev_page_token";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDPaginationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNextPageToken_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v11 = *(id *)(a1 + 24);
    if (v11)
    {
      if (a2) {
        v12 = @"nextPageToken";
      }
      else {
        v12 = @"next_page_token";
      }
      [v4 setObject:v11 forKey:v12];
    }

    char v13 = *(unsigned char *)(a1 + 60);
    if (v13)
    {
      v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v15 = @"totalPageCount";
      }
      else {
        v15 = @"total_page_count";
      }
      [v4 setObject:v14 forKey:v15];

      char v13 = *(unsigned char *)(a1 + 60);
    }
    if ((v13 & 2) != 0)
    {
      v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      if (a2) {
        v17 = @"totalResults";
      }
      else {
        v17 = @"total_results";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __49__GEOPDPaginationInfo__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOPDPaginationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_4541;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_4542;
      }
      GEOPDPaginationInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __49__GEOPDPaginationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
      id v7 = @"prevPageToken";
    }
    else {
      id v7 = @"prev_page_token";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      -[GEOPDPaginationInfo setPrevPageToken:](v6, v9);
    }
    if (a3) {
      id v10 = @"nextPageToken";
    }
    else {
      id v10 = @"next_page_token";
    }
    id v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      -[GEOPDPaginationInfo setNextPageToken:](v6, v12);
    }
    if (a3) {
      char v13 = @"totalPageCount";
    }
    else {
      char v13 = @"total_page_count";
    }
    v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = [v14 unsignedIntValue];
      *(unsigned char *)(v6 + 60) |= 0x20u;
      *(unsigned char *)(v6 + 60) |= 1u;
      *(_DWORD *)(v6 + 52) = v15;
    }

    if (a3) {
      v16 = @"totalResults";
    }
    else {
      v16 = @"total_results";
    }
    v17 = [v5 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v18 = [v17 unsignedIntValue];
      *(unsigned char *)(v6 + 60) |= 0x20u;
      *(unsigned char *)(v6 + 60) |= 2u;
      *(_DWORD *)(v6 + 56) = v18;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPaginationInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPaginationInfo readAll:]((uint64_t)self, 0);
    if (self->_prevPageToken) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_nextPageToken)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPaginationInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPaginationInfo readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_prevPageToken copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_nextPageToken copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_totalPageCount;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_totalResults;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDPaginationInfo readAll:]((uint64_t)self, 1);
  -[GEOPDPaginationInfo readAll:]((uint64_t)v4, 1);
  prevPageToken = self->_prevPageToken;
  if ((unint64_t)prevPageToken | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](prevPageToken, "isEqual:")) {
      goto LABEL_15;
    }
  }
  nextPageToken = self->_nextPageToken;
  if ((unint64_t)nextPageToken | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](nextPageToken, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_totalPageCount != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_totalResults != *((_DWORD *)v4 + 14)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDPaginationInfo readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_prevPageToken hash];
  NSUInteger v4 = [(NSString *)self->_nextPageToken hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_totalPageCount;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_totalResults;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPageToken, 0);
  objc_storeStrong((id *)&self->_nextPageToken, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end