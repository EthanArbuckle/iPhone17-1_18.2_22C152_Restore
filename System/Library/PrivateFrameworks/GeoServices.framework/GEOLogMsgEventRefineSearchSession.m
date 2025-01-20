@interface GEOLogMsgEventRefineSearchSession
+ (BOOL)isValid:(id)a3;
+ (Class)suggestionItemType;
- (BOOL)hasRefineSearchType;
- (BOOL)hasSearchString;
- (BOOL)hasSearchType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventRefineSearchSession)init;
- (GEOLogMsgEventRefineSearchSession)initWithData:(id)a3;
- (GEOLogMsgEventRefineSearchSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventRefineSearchSession)initWithJSON:(id)a3;
- (NSMutableArray)suggestionItems;
- (NSString)searchString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)refineSearchTypeAsString:(int)a3;
- (id)searchTypeAsString:(int)a3;
- (id)suggestionItemAtIndex:(unint64_t)a3;
- (int)StringAsRefineSearchType:(id)a3;
- (int)StringAsSearchType:(id)a3;
- (int)refineSearchType;
- (int)searchType;
- (unint64_t)hash;
- (unint64_t)suggestionItemsCount;
- (void)_addNoFlagsSuggestionItem:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readSearchString;
- (void)_readSuggestionItems;
- (void)addSuggestionItem:(id)a3;
- (void)clearSuggestionItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasRefineSearchType:(BOOL)a3;
- (void)setHasSearchType:(BOOL)a3;
- (void)setRefineSearchType:(int)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchType:(int)a3;
- (void)setSuggestionItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventRefineSearchSession

- (GEOLogMsgEventRefineSearchSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventRefineSearchSession;
  v2 = [(GEOLogMsgEventRefineSearchSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventRefineSearchSession)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventRefineSearchSession;
  v3 = [(GEOLogMsgEventRefineSearchSession *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)searchType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_searchType;
  }
  else {
    return 0;
  }
}

- (void)setSearchType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_searchType = a3;
}

- (void)setHasSearchType:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSearchType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)searchTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EA8B8[a3];
  }

  return v3;
}

- (int)StringAsSearchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SEARCH_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH_TYPE_BROWSE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_TYPE_NORMAL_SEARCH"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)refineSearchType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_refineSearchType;
  }
  else {
    return 0;
  }
}

- (void)setRefineSearchType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_refineSearchType = a3;
}

- (void)setHasRefineSearchType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasRefineSearchType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)refineSearchTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EA8D0[a3];
  }

  return v3;
}

- (int)StringAsRefineSearchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REFINE_SEARCH_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REFINE_SEARCH_TYPE_KEYWORD_SUGGESTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REFINE_SEARCH_TYPE_DISAMBIGUATION"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRefineSearchSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEOLogMsgEventRefineSearchSession _readSearchString]((uint64_t)self);
  searchString = self->_searchString;

  return searchString;
}

- (void)setSearchString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)_readSuggestionItems
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 52) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRefineSearchSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionItems_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)suggestionItems
{
  -[GEOLogMsgEventRefineSearchSession _readSuggestionItems]((uint64_t)self);
  suggestionItems = self->_suggestionItems;

  return suggestionItems;
}

- (void)setSuggestionItems:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  suggestionItems = self->_suggestionItems;
  self->_suggestionItems = v4;
}

- (void)clearSuggestionItems
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  suggestionItems = self->_suggestionItems;

  [(NSMutableArray *)suggestionItems removeAllObjects];
}

- (void)addSuggestionItem:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventRefineSearchSession _readSuggestionItems]((uint64_t)self);
  -[GEOLogMsgEventRefineSearchSession _addNoFlagsSuggestionItem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSuggestionItem:(uint64_t)a1
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

- (unint64_t)suggestionItemsCount
{
  -[GEOLogMsgEventRefineSearchSession _readSuggestionItems]((uint64_t)self);
  suggestionItems = self->_suggestionItems;

  return [(NSMutableArray *)suggestionItems count];
}

- (id)suggestionItemAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventRefineSearchSession _readSuggestionItems]((uint64_t)self);
  suggestionItems = self->_suggestionItems;

  return (id)[(NSMutableArray *)suggestionItems objectAtIndex:a3];
}

+ (Class)suggestionItemType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventRefineSearchSession;
  id v4 = [(GEOLogMsgEventRefineSearchSession *)&v8 description];
  id v5 = [(GEOLogMsgEventRefineSearchSession *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventRefineSearchSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 52);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 48);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 48));
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = off_1E53EA8B8[v6];
      }
      if (a2) {
        objc_super v8 = @"searchType";
      }
      else {
        objc_super v8 = @"search_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 52);
    }
    if (v5)
    {
      uint64_t v9 = *(int *)(a1 + 44);
      if (v9 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53EA8D0[v9];
      }
      if (a2) {
        v11 = @"refineSearchType";
      }
      else {
        v11 = @"refine_search_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 searchString];
    if (v12)
    {
      if (a2) {
        v13 = @"searchString";
      }
      else {
        v13 = @"search_string";
      }
      [v4 setObject:v12 forKey:v13];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = *(id *)(a1 + 24);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"suggestionItem";
      }
      else {
        v22 = @"suggestion_item";
      }
      [v4 setObject:v14 forKey:v22];
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
  return -[GEOLogMsgEventRefineSearchSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventRefineSearchSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventRefineSearchSession *)-[GEOLogMsgEventRefineSearchSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_56;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_56;
  }
  if (a3) {
    uint64_t v6 = @"searchType";
  }
  else {
    uint64_t v6 = @"search_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"SEARCH_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"SEARCH_TYPE_BROWSE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"SEARCH_TYPE_NORMAL_SEARCH"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setSearchType:v9];
LABEL_18:

  if (a3) {
    v10 = @"refineSearchType";
  }
  else {
    v10 = @"refine_search_type";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"REFINE_SEARCH_TYPE_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"REFINE_SEARCH_TYPE_KEYWORD_SUGGESTION"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"REFINE_SEARCH_TYPE_DISAMBIGUATION"])
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_32:
    [a1 setRefineSearchType:v13];
  }

  if (a3) {
    v14 = @"searchString";
  }
  else {
    v14 = @"search_string";
  }
  id v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = (void *)[v15 copy];
    [a1 setSearchString:v16];
  }
  if (a3) {
    uint64_t v17 = @"suggestionItem";
  }
  else {
    uint64_t v17 = @"suggestion_item";
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v25 = [GEOSuggestionItem alloc];
            if (a3) {
              uint64_t v26 = [(GEOSuggestionItem *)v25 initWithJSON:v24];
            }
            else {
              uint64_t v26 = [(GEOSuggestionItem *)v25 initWithDictionary:v24];
            }
            long long v27 = (void *)v26;
            [a1 addSuggestionItem:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v21);
    }

    id v5 = v29;
  }

LABEL_56:
  return a1;
}

- (GEOLogMsgEventRefineSearchSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventRefineSearchSession *)-[GEOLogMsgEventRefineSearchSession _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_66;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_66;
    }
    GEOLogMsgEventRefineSearchSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventRefineSearchSessionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventRefineSearchSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventRefineSearchSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventRefineSearchSession *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_searchString) {
      PBDataWriterWriteStringField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_suggestionItems;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOLogMsgEventRefineSearchSession *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 8) = self->_readerMarkPos;
  *((_DWORD *)v9 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 12) = self->_searchType;
    *((unsigned char *)v9 + 52) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v9 + 11) = self->_refineSearchType;
    *((unsigned char *)v9 + 52) |= 1u;
  }
  if (self->_searchString) {
    objc_msgSend(v9, "setSearchString:");
  }
  if ([(GEOLogMsgEventRefineSearchSession *)self suggestionItemsCount])
  {
    [v9 clearSuggestionItems];
    unint64_t v5 = [(GEOLogMsgEventRefineSearchSession *)self suggestionItemsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLogMsgEventRefineSearchSession *)self suggestionItemAtIndex:i];
        [v9 addSuggestionItem:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventRefineSearchSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventRefineSearchSession *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_searchType;
    *(unsigned char *)(v5 + 52) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 44) = self->_refineSearchType;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_searchString copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_suggestionItems;
  uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addSuggestionItem:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOLogMsgEventRefineSearchSession *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_searchType != *((_DWORD *)v4 + 12)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_refineSearchType != *((_DWORD *)v4 + 11)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_16;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 2)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_16;
  }
  suggestionItems = self->_suggestionItems;
  if ((unint64_t)suggestionItems | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](suggestionItems, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventRefineSearchSession *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_searchType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_refineSearchType;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_searchString hash];
  return v5 ^ [(NSMutableArray *)self->_suggestionItems hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_searchType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if (v5)
  {
    self->_refineSearchType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[GEOLogMsgEventRefineSearchSession setSearchString:](self, "setSearchString:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOLogMsgEventRefineSearchSession addSuggestionItem:](self, "addSuggestionItem:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionItems, 0);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end