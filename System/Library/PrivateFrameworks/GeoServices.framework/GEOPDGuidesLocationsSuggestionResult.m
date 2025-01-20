@interface GEOPDGuidesLocationsSuggestionResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGuidesLocationsSuggestionResult)init;
- (GEOPDGuidesLocationsSuggestionResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entrys;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsEntry:(uint64_t)a1;
- (void)_readEntrys;
- (void)_readExploreGuidesEntry;
- (void)addEntry:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuidesLocationsSuggestionResult

- (GEOPDGuidesLocationsSuggestionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesLocationsSuggestionResult;
  v2 = [(GEOPDGuidesLocationsSuggestionResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesLocationsSuggestionResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesLocationsSuggestionResult;
  v3 = [(GEOPDGuidesLocationsSuggestionResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntrys
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
        GEOPDGuidesLocationsSuggestionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntrys_tags_3281);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)entrys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGuidesLocationsSuggestionResult _readEntrys]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addEntry:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesLocationsSuggestionResult _readEntrys](a1);
    -[GEOPDGuidesLocationsSuggestionResult _addNoFlagsEntry:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readExploreGuidesEntry
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDGuidesLocationsSuggestionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExploreGuidesEntry_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesLocationsSuggestionResult;
  v4 = [(GEOPDGuidesLocationsSuggestionResult *)&v8 description];
  id v5 = [(GEOPDGuidesLocationsSuggestionResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesLocationsSuggestionResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDGuidesLocationsSuggestionResult readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v30 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v10 jsonRepresentation];
            }
            else {
            v11 = [v10 dictionaryRepresentation];
            }
            [v5 addObject:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v7);
      }

      [v4 setObject:v5 forKey:@"entry"];
    }
    -[GEOPDGuidesLocationsSuggestionResult _readExploreGuidesEntry](a1);
    id v12 = *(id *)(a1 + 32);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"exploreGuidesEntry";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"explore_guides_entry";
      }
      [v4 setObject:v14 forKey:v15];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDGuidesLocationsSuggestionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExploreImageUrlTemplate_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v18 = *(id *)(a1 + 40);
    if (v18)
    {
      if (a2) {
        v19 = @"exploreImageUrlTemplate";
      }
      else {
        v19 = @"explore_image_url_template";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __66__GEOPDGuidesLocationsSuggestionResult__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;
      }
      else
      {
        id v25 = v21;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPDGuidesLocationsSuggestionResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

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
        id v6 = (int *)&readAll__recursiveTag_3294;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_3295;
      }
      GEOPDGuidesLocationsSuggestionResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGuidesLocationsSuggestionResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __66__GEOPDGuidesLocationsSuggestionResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuidesLocationsSuggestionResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesLocationsSuggestionResultIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDGuidesLocationsSuggestionResult readAll:]((uint64_t)self, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_entrys;
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

    if (self->_exploreGuidesEntry) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_exploreImageUrlTemplate) {
      PBDataWriterWriteStringField();
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
      GEOPDGuidesLocationsSuggestionResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesLocationsSuggestionResult readAll:]((uint64_t)self, 0);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_entrys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v11), "copyWithZone:", a3, (void)v18);
        -[GEOPDGuidesLocationsSuggestionResult addEntry:](v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOPDGuidesLocationEntry *)self->_exploreGuidesEntry copyWithZone:a3];
  long long v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  uint64_t v15 = [(NSString *)self->_exploreImageUrlTemplate copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDGuidesLocationsSuggestionResult readAll:]((uint64_t)self, 1),
         -[GEOPDGuidesLocationsSuggestionResult readAll:]((uint64_t)v4, 1),
         entrys = self->_entrys,
         !((unint64_t)entrys | v4[3]))
     || -[NSMutableArray isEqual:](entrys, "isEqual:"))
    && ((exploreGuidesEntry = self->_exploreGuidesEntry, !((unint64_t)exploreGuidesEntry | v4[4]))
     || -[GEOPDGuidesLocationEntry isEqual:](exploreGuidesEntry, "isEqual:")))
  {
    exploreImageUrlTemplate = self->_exploreImageUrlTemplate;
    if ((unint64_t)exploreImageUrlTemplate | v4[5]) {
      char v8 = -[NSString isEqual:](exploreImageUrlTemplate, "isEqual:");
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
  -[GEOPDGuidesLocationsSuggestionResult readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_entrys hash];
  unint64_t v4 = [(GEOPDGuidesLocationEntry *)self->_exploreGuidesEntry hash] ^ v3;
  return v4 ^ [(NSString *)self->_exploreImageUrlTemplate hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exploreImageUrlTemplate, 0);
  objc_storeStrong((id *)&self->_exploreGuidesEntry, 0);
  objc_storeStrong((id *)&self->_entrys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end