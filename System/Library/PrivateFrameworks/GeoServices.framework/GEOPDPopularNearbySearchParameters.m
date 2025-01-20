@interface GEOPDPopularNearbySearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPopularNearbySearchParameters)init;
- (GEOPDPopularNearbySearchParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readViewportInfo;
- (void)readAll:(uint64_t)a1;
- (void)setSuggestionEntryMetadata:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPopularNearbySearchParameters

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPopularNearbySearchParameters readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v6 = @"maxResults";
      }
      else {
        v6 = @"max_results";
      }
      [v4 setObject:v5 forKey:v6];
    }
    -[GEOPDPopularNearbySearchParameters _readViewportInfo](a1);
    id v7 = *(id *)(a1 + 32);
    v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"viewportInfo";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"viewport_info";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDPopularNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_6167);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v13 = *(id *)(a1 + 24);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 base64EncodedStringWithOptions:0];
        [v4 setObject:v15 forKey:@"suggestionEntryMetadata"];
      }
      else
      {
        [v4 setObject:v13 forKey:@"suggestion_entry_metadata"];
      }
    }

    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      uint64_t v16 = *(int *)(a1 + 56);
      if (v16 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_1E53DCE60[v16];
      }
      if (a2) {
        v18 = @"searchType";
      }
      else {
        v18 = @"search_type";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __64__GEOPDPopularNearbySearchParameters__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
        v6 = (int *)&readAll__recursiveTag_6168;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_6169;
      }
      GEOPDPopularNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPopularNearbySearchParameters;
  v4 = [(GEOPDPopularNearbySearchParameters *)&v8 description];
  id v5 = [(GEOPDPopularNearbySearchParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 8u;
  *(unsigned char *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (GEOPDPopularNearbySearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPopularNearbySearchParameters;
  v2 = [(GEOPDPopularNearbySearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDPopularNearbySearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPopularNearbySearchParameters;
  v3 = [(GEOPDPopularNearbySearchParameters *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPopularNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_6166);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  *(unsigned char *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPopularNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPopularNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEOPDPopularNearbySearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPopularNearbySearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
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
    -[GEOPDPopularNearbySearchParameters readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v8;
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_suggestionEntryMetadata)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPopularNearbySearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPopularNearbySearchParameters readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_maxResults;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v9 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
  id v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_searchType;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  id v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDPopularNearbySearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDPopularNearbySearchParameters readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 4) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
    goto LABEL_15;
  }
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_searchType != *((_DWORD *)v4 + 14)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDPopularNearbySearchParameters readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_maxResults;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  uint64_t v5 = [(NSData *)self->_suggestionEntryMetadata hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_searchType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end