@interface GEOPDRefinementSessionState
+ (BOOL)isValid:(id)a3;
+ (Class)relatedEntitySectionType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasSearchSectionList;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDRefinementSessionState)init;
- (GEOPDRefinementSessionState)initWithData:(id)a3;
- (GEOPDRefinementSessionState)initWithDictionary:(id)a3;
- (GEOPDRefinementSessionState)initWithJSON:(id)a3;
- (GEOPDSearchSectionList)searchSectionList;
- (NSMutableArray)relatedEntitySections;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)relatedEntitySectionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)relatedEntitySectionsCount;
- (void)_addNoFlagsRelatedEntitySection:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readRelatedEntitySections;
- (void)_readSearchSectionList;
- (void)addRelatedEntitySection:(id)a3;
- (void)clearRelatedEntitySections;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setRelatedEntitySections:(id)a3;
- (void)setSearchSectionList:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDRefinementSessionState

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDRefinementSessionStateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDRefinementSessionState *)self readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_relatedEntitySections;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        [(id)v5 addRelatedEntitySection:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOPDSearchSectionList *)self->_searchSectionList copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDRefinementSessionState *)self readAll:1],
         [v4 readAll:1],
         relatedEntitySections = self->_relatedEntitySections,
         !((unint64_t)relatedEntitySections | v4[3]))
     || -[NSMutableArray isEqual:](relatedEntitySections, "isEqual:")))
  {
    searchSectionList = self->_searchSectionList;
    if ((unint64_t)searchSectionList | v4[4]) {
      char v7 = -[GEOPDSearchSectionList isEqual:](searchSectionList, "isEqual:");
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

- (GEOPDRefinementSessionState)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDRefinementSessionState;
  v2 = [(GEOPDRefinementSessionState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDRefinementSessionState)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDRefinementSessionState;
  v3 = [(GEOPDRefinementSessionState *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readRelatedEntitySections
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
        GEOPDRefinementSessionStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedEntitySections_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)relatedEntitySections
{
  -[GEOPDRefinementSessionState _readRelatedEntitySections]((uint64_t)self);
  relatedEntitySections = self->_relatedEntitySections;

  return relatedEntitySections;
}

- (void)setRelatedEntitySections:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  relatedEntitySections = self->_relatedEntitySections;
  self->_relatedEntitySections = v4;
}

- (void)clearRelatedEntitySections
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  relatedEntitySections = self->_relatedEntitySections;

  [(NSMutableArray *)relatedEntitySections removeAllObjects];
}

- (void)addRelatedEntitySection:(id)a3
{
  id v4 = a3;
  -[GEOPDRefinementSessionState _readRelatedEntitySections]((uint64_t)self);
  -[GEOPDRefinementSessionState _addNoFlagsRelatedEntitySection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsRelatedEntitySection:(uint64_t)a1
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

- (unint64_t)relatedEntitySectionsCount
{
  -[GEOPDRefinementSessionState _readRelatedEntitySections]((uint64_t)self);
  relatedEntitySections = self->_relatedEntitySections;

  return [(NSMutableArray *)relatedEntitySections count];
}

- (id)relatedEntitySectionAtIndex:(unint64_t)a3
{
  -[GEOPDRefinementSessionState _readRelatedEntitySections]((uint64_t)self);
  relatedEntitySections = self->_relatedEntitySections;

  return (id)[(NSMutableArray *)relatedEntitySections objectAtIndex:a3];
}

+ (Class)relatedEntitySectionType
{
  return (Class)objc_opt_class();
}

- (void)_readSearchSectionList
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
        GEOPDRefinementSessionStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchSectionList_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSearchSectionList
{
  return self->_searchSectionList != 0;
}

- (GEOPDSearchSectionList)searchSectionList
{
  -[GEOPDRefinementSessionState _readSearchSectionList]((uint64_t)self);
  searchSectionList = self->_searchSectionList;

  return searchSectionList;
}

- (void)setSearchSectionList:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_searchSectionList, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDRefinementSessionState;
  id v4 = [(GEOPDRefinementSessionState *)&v8 description];
  id v5 = [(GEOPDRefinementSessionState *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRefinementSessionState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v8);
      }

      if (a2) {
        id v13 = @"relatedEntitySection";
      }
      else {
        id v13 = @"related_entity_section";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = [(id)a1 searchSectionList];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        long long v16 = [v14 jsonRepresentation];
        long long v17 = @"searchSectionList";
      }
      else
      {
        long long v16 = [v14 dictionaryRepresentation];
        long long v17 = @"search_section_list";
      }
      [v4 setObject:v16 forKey:v17];
    }
    long long v18 = *(void **)(a1 + 16);
    if (v18)
    {
      long long v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __57__GEOPDRefinementSessionState__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDRefinementSessionState _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDRefinementSessionState__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDRefinementSessionState)initWithDictionary:(id)a3
{
  return (GEOPDRefinementSessionState *)-[GEOPDRefinementSessionState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"relatedEntitySection";
      }
      else {
        id v6 = @"related_entity_section";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v5;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOPDRelatedEntitySection alloc];
                if (v14) {
                  v15 = (void *)-[GEOPDRelatedEntitySection _initWithDictionary:isJSON:]((uint64_t)v14, v13, a3);
                }
                else {
                  v15 = 0;
                }
                [a1 addRelatedEntitySection:v15];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v16 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
            uint64_t v10 = v16;
          }
          while (v16);
        }

        id v5 = v22;
      }

      if (a3) {
        long long v17 = @"searchSectionList";
      }
      else {
        long long v17 = @"search_section_list";
      }
      long long v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v19 = [GEOPDSearchSectionList alloc];
        if (v19) {
          v20 = (void *)-[GEOPDSearchSectionList _initWithDictionary:isJSON:](v19, v18, a3);
        }
        else {
          v20 = 0;
        }
        [a1 setSearchSectionList:v20];
      }
    }
  }

  return a1;
}

- (GEOPDRefinementSessionState)initWithJSON:(id)a3
{
  return (GEOPDRefinementSessionState *)-[GEOPDRefinementSessionState _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_286;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_287;
    }
    GEOPDRefinementSessionStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDRefinementSessionStateCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDRefinementSessionStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRefinementSessionStateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v10 = self->_reader;
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
    [(GEOPDRefinementSessionState *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_relatedEntitySections;
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

    if (self->_searchSectionList) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOPDRefinementSessionState _readRelatedEntitySections]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_relatedEntitySections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[GEOPDRelatedEntitySection hasGreenTeaWithValue:](*(void *)(*((void *)&v11 + 1) + 8 * v9), v3))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEOPDRefinementSessionState _readSearchSectionList]((uint64_t)self);
  return -[GEOPDSearchSectionList hasGreenTeaWithValue:]((uint64_t)self->_searchSectionList, v3);
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPDRefinementSessionState *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDRefinementSessionState *)self relatedEntitySectionsCount])
  {
    [v8 clearRelatedEntitySections];
    unint64_t v4 = [(GEOPDRefinementSessionState *)self relatedEntitySectionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDRefinementSessionState *)self relatedEntitySectionAtIndex:i];
        [v8 addRelatedEntitySection:v7];
      }
    }
  }
  if (self->_searchSectionList) {
    objc_msgSend(v8, "setSearchSectionList:");
  }
}

- (unint64_t)hash
{
  [(GEOPDRefinementSessionState *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_relatedEntitySections hash];
  return [(GEOPDSearchSectionList *)self->_searchSectionList hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPDRefinementSessionState addRelatedEntitySection:](self, "addRelatedEntitySection:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  searchSectionList = self->_searchSectionList;
  uint64_t v11 = *((void *)v4 + 4);
  if (searchSectionList)
  {
    if (v11) {
      -[GEOPDSearchSectionList mergeFrom:]((uint64_t)searchSectionList, v11);
    }
  }
  else if (v11)
  {
    [(GEOPDRefinementSessionState *)self setSearchSectionList:*((void *)v4 + 4)];
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDRefinementSessionStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_291);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDRefinementSessionState *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_relatedEntitySections;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDRelatedEntitySection clearUnknownFields:](*(void *)(*((void *)&v12 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    -[GEOPDSearchSectionList clearUnknownFields:]((uint64_t)self->_searchSectionList, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSectionList, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end