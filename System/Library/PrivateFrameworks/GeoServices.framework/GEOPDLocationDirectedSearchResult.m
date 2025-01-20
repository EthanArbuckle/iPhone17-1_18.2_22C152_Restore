@interface GEOPDLocationDirectedSearchResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLocationDirectedSearchResult)init;
- (GEOPDLocationDirectedSearchResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disambiguationLabels;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1;
- (void)_readDisambiguationLabels;
- (void)_readDisplayMapRegion;
- (void)addDisambiguationLabel:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayMapRegion:(uint64_t)a1;
- (void)setPaginationInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLocationDirectedSearchResult

- (GEOPDLocationDirectedSearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocationDirectedSearchResult;
  v2 = [(GEOPDLocationDirectedSearchResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocationDirectedSearchResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocationDirectedSearchResult;
  v3 = [(GEOPDLocationDirectedSearchResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayMapRegion
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_3639);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 4u;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readDisambiguationLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocationDirectedSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisambiguationLabels_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)disambiguationLabels
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLocationDirectedSearchResult _readDisambiguationLabels]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addDisambiguationLabel:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDLocationDirectedSearchResult _readDisambiguationLabels](a1);
    -[GEOPDLocationDirectedSearchResult _addNoFlagsDisambiguationLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setPaginationInfo:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 8u;
  *(unsigned char *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLocationDirectedSearchResult;
  id v4 = [(GEOPDLocationDirectedSearchResult *)&v8 description];
  id v5 = [(GEOPDLocationDirectedSearchResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocationDirectedSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDLocationDirectedSearchResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDLocationDirectedSearchResult _readDisplayMapRegion](a1);
    id v5 = *(id *)(a1 + 32);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"displayMapRegion";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"display_map_region";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v10 = *(id *)(a1 + 24);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v9 addObject:v15];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"disambiguationLabel";
      }
      else {
        v16 = @"disambiguation_label";
      }
      [v4 setObject:v9 forKey:v16];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDLocationDirectedSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaginationInfo_tags_3640);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v19 = *(id *)(a1 + 40);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"paginationInfo";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"pagination_info";
      }
      [v4 setObject:v21 forKey:v22];
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
        v30[2] = __63__GEOPDLocationDirectedSearchResult__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;
      }
      else
      {
        id v28 = v24;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
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
  return -[GEOPDLocationDirectedSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_3641;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3642;
      }
      GEOPDLocationDirectedSearchResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDLocationDirectedSearchResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __63__GEOPDLocationDirectedSearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDLocationDirectedSearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDLocationDirectedSearchResultIsDirty((uint64_t)self))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_disambiguationLabels;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_paginationInfo) {
      PBDataWriterWriteSubmessage();
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDLocationDirectedSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 0);
  id v8 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->_disambiguationLabels;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (void)v18);
        -[GEOPDLocationDirectedSearchResult addDisambiguationLabel:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v15 = [(GEOPDPaginationInfo *)self->_paginationInfo copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 1),
         -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)v4, 1),
         displayMapRegion = self->_displayMapRegion,
         !((unint64_t)displayMapRegion | v4[4]))
     || -[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
    && ((disambiguationLabels = self->_disambiguationLabels, !((unint64_t)disambiguationLabels | v4[3]))
     || -[NSMutableArray isEqual:](disambiguationLabels, "isEqual:")))
  {
    paginationInfo = self->_paginationInfo;
    if ((unint64_t)paginationInfo | v4[5]) {
      char v8 = -[GEOPDPaginationInfo isEqual:](paginationInfo, "isEqual:");
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
  -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOMapRegion *)self->_displayMapRegion hash];
  uint64_t v4 = [(NSMutableArray *)self->_disambiguationLabels hash] ^ v3;
  return v4 ^ [(GEOPDPaginationInfo *)self->_paginationInfo hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_disambiguationLabels, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end