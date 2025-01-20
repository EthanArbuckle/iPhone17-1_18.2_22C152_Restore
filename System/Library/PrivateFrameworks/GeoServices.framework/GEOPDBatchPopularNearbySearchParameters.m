@interface GEOPDBatchPopularNearbySearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBatchPopularNearbySearchParameters)init;
- (GEOPDBatchPopularNearbySearchParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)suggestionEntryMetadatas;
- (unint64_t)hash;
- (void)_addNoFlagsSuggestionEntryMetadata:(uint64_t)a1;
- (void)_readSuggestionEntryMetadatas;
- (void)_readViewportInfo;
- (void)addSuggestionEntryMetadata:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBatchPopularNearbySearchParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_2114;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_2115;
      }
      GEOPDBatchPopularNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOPDBatchPopularNearbySearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBatchPopularNearbySearchParameters;
  v2 = [(GEOPDBatchPopularNearbySearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBatchPopularNearbySearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBatchPopularNearbySearchParameters;
  v3 = [(GEOPDBatchPopularNearbySearchParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDBatchPopularNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_2101);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 64) |= 0x10u;
  *(unsigned char *)(a1 + 64) |= 0x20u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readSuggestionEntryMetadatas
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 64) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDBatchPopularNearbySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadatas_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (id)suggestionEntryMetadatas
{
  -[GEOPDBatchPopularNearbySearchParameters _readSuggestionEntryMetadatas](a1);
  v2 = *(void **)(a1 + 32);

  return v2;
}

- (void)addSuggestionEntryMetadata:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDBatchPopularNearbySearchParameters _readSuggestionEntryMetadatas](a1);
    -[GEOPDBatchPopularNearbySearchParameters _addNoFlagsSuggestionEntryMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsSuggestionEntryMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBatchPopularNearbySearchParameters;
  id v4 = [(GEOPDBatchPopularNearbySearchParameters *)&v8 description];
  id v5 = [(GEOPDBatchPopularNearbySearchParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBatchPopularNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDBatchPopularNearbySearchParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 64) & 2) != 0)
    {
      id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        objc_super v6 = @"maxResults";
      }
      else {
        objc_super v6 = @"max_results";
      }
      [v4 setObject:v5 forKey:v6];
    }
    -[GEOPDBatchPopularNearbySearchParameters _readViewportInfo](a1);
    id v7 = *(id *)(a1 + 40);
    objc_super v8 = v7;
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
    if (*(unsigned char *)(a1 + 64))
    {
      v11 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v12 = @"requestLocalTimestamp";
      }
      else {
        v12 = @"request_local_timestamp";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(void *)(a1 + 32))
    {
      if (a2)
      {
        v13 = (void *)MEMORY[0x1E4F1CA48];
        v14 = -[GEOPDBatchPopularNearbySearchParameters suggestionEntryMetadatas](a1);
        v15 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v16 = -[GEOPDBatchPopularNearbySearchParameters suggestionEntryMetadatas](a1);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = [*(id *)(*((void *)&v32 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v18);
        }

        v22 = @"suggestionEntryMetadata";
      }
      else
      {
        v15 = -[GEOPDBatchPopularNearbySearchParameters suggestionEntryMetadatas](a1);
        v22 = @"suggestion_entry_metadata";
      }
      [v4 setObject:v15 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __69__GEOPDBatchPopularNearbySearchParameters__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPDBatchPopularNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __69__GEOPDBatchPopularNearbySearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDBatchPopularNearbySearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 0);
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_viewportInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_suggestionEntryMetadatas;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDBatchPopularNearbySearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_maxResults;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  id v9 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 24) = self->_requestLocalTimestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_suggestionEntryMetadatas;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        -[GEOPDBatchPopularNearbySearchParameters addSuggestionEntryMetadata:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)v4, 1);
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 64);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_maxResults != *((_DWORD *)v4 + 15)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_17;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 5))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
    {
LABEL_17:
      char v9 = 0;
      goto LABEL_18;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_requestLocalTimestamp != *((double *)v4 + 3)) {
      goto LABEL_17;
    }
  }
  else if (v6)
  {
    goto LABEL_17;
  }
  suggestionEntryMetadatas = self->_suggestionEntryMetadatas;
  if ((unint64_t)suggestionEntryMetadatas | *((void *)v4 + 4)) {
    char v9 = -[NSMutableArray isEqual:](suggestionEntryMetadatas, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_maxResults;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  if (*(unsigned char *)&self->_flags)
  {
    double requestLocalTimestamp = self->_requestLocalTimestamp;
    double v7 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0) {
      double v7 = self->_requestLocalTimestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_suggestionEntryMetadatas hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadatas, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end