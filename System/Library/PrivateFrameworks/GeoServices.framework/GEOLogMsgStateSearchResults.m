@interface GEOLogMsgStateSearchResults
+ (BOOL)isValid:(id)a3;
+ (Class)searchResultsType;
- (BOOL)hasIncludesEnrichedResult;
- (BOOL)hasSearchQuery;
- (BOOL)includesEnrichedResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateSearchResults)init;
- (GEOLogMsgStateSearchResults)initWithData:(id)a3;
- (GEOLogMsgStateSearchResults)initWithDictionary:(id)a3;
- (GEOLogMsgStateSearchResults)initWithJSON:(id)a3;
- (NSMutableArray)searchResults;
- (NSString)searchQuery;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)searchResultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)searchResultsCount;
- (void)_addNoFlagsSearchResults:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readSearchQuery;
- (void)_readSearchResults;
- (void)addSearchResults:(id)a3;
- (void)clearSearchResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIncludesEnrichedResult:(BOOL)a3;
- (void)setIncludesEnrichedResult:(BOOL)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateSearchResults

- (GEOLogMsgStateSearchResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateSearchResults;
  v2 = [(GEOLogMsgStateSearchResults *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateSearchResults)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateSearchResults;
  v3 = [(GEOLogMsgStateSearchResults *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSearchResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateSearchResultsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchResults_tags_9314);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)searchResults
{
  -[GEOLogMsgStateSearchResults _readSearchResults]((uint64_t)self);
  searchResults = self->_searchResults;

  return searchResults;
}

- (void)setSearchResults:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  searchResults = self->_searchResults;
  self->_searchResults = v4;
}

- (void)clearSearchResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  searchResults = self->_searchResults;

  [(NSMutableArray *)searchResults removeAllObjects];
}

- (void)addSearchResults:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStateSearchResults _readSearchResults]((uint64_t)self);
  -[GEOLogMsgStateSearchResults _addNoFlagsSearchResults:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsSearchResults:(uint64_t)a1
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

- (unint64_t)searchResultsCount
{
  -[GEOLogMsgStateSearchResults _readSearchResults]((uint64_t)self);
  searchResults = self->_searchResults;

  return [(NSMutableArray *)searchResults count];
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateSearchResults _readSearchResults]((uint64_t)self);
  searchResults = self->_searchResults;

  return (id)[(NSMutableArray *)searchResults objectAtIndex:a3];
}

+ (Class)searchResultsType
{
  return (Class)objc_opt_class();
}

- (BOOL)includesEnrichedResult
{
  return self->_includesEnrichedResult;
}

- (void)setIncludesEnrichedResult:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_includesEnrichedResult = a3;
}

- (void)setHasIncludesEnrichedResult:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasIncludesEnrichedResult
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readSearchQuery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateSearchResultsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchQuery_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSearchQuery
{
  return self->_searchQuery != 0;
}

- (NSString)searchQuery
{
  -[GEOLogMsgStateSearchResults _readSearchQuery]((uint64_t)self);
  searchQuery = self->_searchQuery;

  return searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateSearchResults;
  id v4 = [(GEOLogMsgStateSearchResults *)&v8 description];
  id v5 = [(GEOLogMsgStateSearchResults *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateSearchResults _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v19);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v19);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"searchResults";
      }
      else {
        v13 = @"search_results";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v19);
    }
    if (*(unsigned char *)(a1 + 48))
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
      if (a2) {
        v15 = @"includesEnrichedResult";
      }
      else {
        v15 = @"includes_enriched_result";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 searchQuery];
    if (v16)
    {
      if (a2) {
        v17 = @"searchQuery";
      }
      else {
        v17 = @"search_query";
      }
      [v4 setObject:v16 forKey:v17];
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
  return -[GEOLogMsgStateSearchResults _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateSearchResults)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateSearchResults *)-[GEOLogMsgStateSearchResults _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"searchResults";
      }
      else {
        id v6 = @"search_results";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v23 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOSearchResult alloc];
                if (a3) {
                  uint64_t v15 = [(GEOSearchResult *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOSearchResult *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addSearchResults:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v23;
      }

      if (a3) {
        v17 = @"includesEnrichedResult";
      }
      else {
        v17 = @"includes_enriched_result";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludesEnrichedResult:", objc_msgSend(v18, "BOOLValue"));
      }

      if (a3) {
        long long v19 = @"searchQuery";
      }
      else {
        long long v19 = @"search_query";
      }
      long long v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = (void *)[v20 copy];
        [a1 setSearchQuery:v21];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateSearchResults)initWithJSON:(id)a3
{
  return (GEOLogMsgStateSearchResults *)-[GEOLogMsgStateSearchResults _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_9328;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_9329;
    }
    GEOLogMsgStateSearchResultsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStateSearchResultsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateSearchResultsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateSearchResultsReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEOLogMsgStateSearchResults *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_searchResults;
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

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_searchQuery) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOLogMsgStateSearchResults *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 8) = self->_readerMarkPos;
  *((_DWORD *)v9 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgStateSearchResults *)self searchResultsCount])
  {
    [v9 clearSearchResults];
    unint64_t v4 = [(GEOLogMsgStateSearchResults *)self searchResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgStateSearchResults *)self searchResultsAtIndex:i];
        [v9 addSearchResults:v7];
      }
    }
  }
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v9 + 44) = self->_includesEnrichedResult;
    *((unsigned char *)v9 + 48) |= 1u;
  }
  if (self->_searchQuery)
  {
    objc_msgSend(v9, "setSearchQuery:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStateSearchResultsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateSearchResults *)self readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_searchResults;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addSearchResults:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 44) = self->_includesEnrichedResult;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v14 = -[NSString copyWithZone:](self->_searchQuery, "copyWithZone:", a3, (void)v16);
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOLogMsgStateSearchResults *)self readAll:1];
  [v4 readAll:1];
  searchResults = self->_searchResults;
  if ((unint64_t)searchResults | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](searchResults, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 48))
    {
      if (self->_includesEnrichedResult)
      {
        if (*((unsigned char *)v4 + 44)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 44))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 48)) {
    goto LABEL_8;
  }
LABEL_14:
  searchQuery = self->_searchQuery;
  if ((unint64_t)searchQuery | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](searchQuery, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateSearchResults *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_searchResults hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_includesEnrichedResult;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_searchQuery hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgStateSearchResults addSearchResults:](self, "addSearchResults:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 48))
  {
    self->_includesEnrichedResult = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[GEOLogMsgStateSearchResults setSearchQuery:](self, "setSearchQuery:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end