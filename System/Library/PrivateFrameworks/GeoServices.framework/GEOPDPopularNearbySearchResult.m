@interface GEOPDPopularNearbySearchResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPopularNearbySearchResult)init;
- (GEOPDPopularNearbySearchResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayMapRegion;
- (id)jsonRepresentation;
- (id)sectionHeader;
- (unint64_t)hash;
- (void)_readDisplayMapRegion;
- (void)_readSectionHeader;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayMapRegion:(uint64_t)a1;
- (void)setSectionHeader:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPopularNearbySearchResult

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPopularNearbySearchResult readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDPopularNearbySearchResult displayMapRegion]((id *)a1);
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        v8 = @"displayMapRegion";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        v8 = @"display_map_region";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDPopularNearbySearchResult sectionHeader]((id *)a1);
    if (v9)
    {
      if (a2) {
        v10 = @"sectionHeader";
      }
      else {
        v10 = @"section_header";
      }
      [v4 setObject:v9 forKey:v10];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
      if (a2) {
        v12 = @"isChainResultSet";
      }
      else {
        v12 = @"is_chain_result_set";
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
        v20[2] = __60__GEOPDPopularNearbySearchResult__dictionaryRepresentation___block_invoke;
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
      GEOPDPopularNearbySearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 0);
  id v9 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_sectionHeader copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 52) = self->_isChainResultSet;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
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
    goto LABEL_8;
  }
  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 1);
  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)v4, 1);
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((void *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:")) {
      goto LABEL_8;
    }
  }
  sectionHeader = self->_sectionHeader;
  if ((unint64_t)sectionHeader | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sectionHeader, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_isChainResultSet)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

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
    BOOL v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_sectionHeader)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
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
        v6 = (int *)&readAll__recursiveTag_6183;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_6184;
      }
      GEOPDPopularNearbySearchResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 24) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)displayMapRegion
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPopularNearbySearchResult _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (GEOPDPopularNearbySearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPopularNearbySearchResult;
  v2 = [(GEOPDPopularNearbySearchResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDPopularNearbySearchResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPopularNearbySearchResult;
  v3 = [(GEOPDPopularNearbySearchResult *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readDisplayMapRegion
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
        GEOPDPopularNearbySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_6181);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 4u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readSectionHeader
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
        GEOPDPopularNearbySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionHeader_tags_6182);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)sectionHeader
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPopularNearbySearchResult _readSectionHeader]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSectionHeader:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 8u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPopularNearbySearchResult;
  id v4 = [(GEOPDPopularNearbySearchResult *)&v8 description];
  id v5 = [(GEOPDPopularNearbySearchResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPopularNearbySearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPopularNearbySearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDPopularNearbySearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOPDPopularNearbySearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOMapRegion *)self->_displayMapRegion hash];
  NSUInteger v4 = [(NSString *)self->_sectionHeader hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_isChainResultSet;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end