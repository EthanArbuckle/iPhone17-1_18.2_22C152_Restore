@interface GEOLogMsgStateSuggestions
+ (BOOL)isValid:(id)a3;
+ (Class)displayedResultType;
- (BOOL)hasAcSequenceNumber;
- (BOOL)hasSearchFieldType;
- (BOOL)hasSearchString;
- (BOOL)hasSelectedIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateSuggestions)init;
- (GEOLogMsgStateSuggestions)initWithData:(id)a3;
- (GEOLogMsgStateSuggestions)initWithDictionary:(id)a3;
- (GEOLogMsgStateSuggestions)initWithJSON:(id)a3;
- (NSMutableArray)displayedResults;
- (NSString)searchString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayedResultAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)searchFieldTypeAsString:(int)a3;
- (int)StringAsSearchFieldType:(id)a3;
- (int)acSequenceNumber;
- (int)searchFieldType;
- (int)selectedIndex;
- (unint64_t)displayedResultsCount;
- (unint64_t)hash;
- (void)_addNoFlagsDisplayedResult:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayedResults;
- (void)_readSearchString;
- (void)addDisplayedResult:(id)a3;
- (void)clearDisplayedResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAcSequenceNumber:(int)a3;
- (void)setDisplayedResults:(id)a3;
- (void)setHasAcSequenceNumber:(BOOL)a3;
- (void)setHasSearchFieldType:(BOOL)a3;
- (void)setHasSelectedIndex:(BOOL)a3;
- (void)setSearchFieldType:(int)a3;
- (void)setSearchString:(id)a3;
- (void)setSelectedIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateSuggestions

- (GEOLogMsgStateSuggestions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateSuggestions;
  v2 = [(GEOLogMsgStateSuggestions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateSuggestions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateSuggestions;
  v3 = [(GEOLogMsgStateSuggestions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateSuggestionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_4);
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
  -[GEOLogMsgStateSuggestions _readSearchString]((uint64_t)self);
  searchString = self->_searchString;

  return searchString;
}

- (void)setSearchString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)_readDisplayedResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateSuggestionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayedResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)displayedResults
{
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  displayedResults = self->_displayedResults;

  return displayedResults;
}

- (void)setDisplayedResults:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  displayedResults = self->_displayedResults;
  self->_displayedResults = v4;
}

- (void)clearDisplayedResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  displayedResults = self->_displayedResults;

  [(NSMutableArray *)displayedResults removeAllObjects];
}

- (void)addDisplayedResult:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  -[GEOLogMsgStateSuggestions _addNoFlagsDisplayedResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsDisplayedResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)displayedResultsCount
{
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  displayedResults = self->_displayedResults;

  return [(NSMutableArray *)displayedResults count];
}

- (id)displayedResultAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  displayedResults = self->_displayedResults;

  return (id)[(NSMutableArray *)displayedResults objectAtIndex:a3];
}

+ (Class)displayedResultType
{
  return (Class)objc_opt_class();
}

- (int)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_selectedIndex = a3;
}

- (void)setHasSelectedIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSelectedIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)searchFieldType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_searchFieldType;
  }
  else {
    return 0;
  }
}

- (void)setSearchFieldType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_searchFieldType = a3;
}

- (void)setHasSearchFieldType:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSearchFieldType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)searchFieldTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8400[a3];
  }

  return v3;
}

- (int)StringAsSearchFieldType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SEARCH_FIELD_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH_FIELD_TYPE_NORMAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_FIELD_TYPE_DIRECTIONS_START"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH_FIELD_TYPE_DIRECTIONS_END"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)acSequenceNumber
{
  return self->_acSequenceNumber;
}

- (void)setAcSequenceNumber:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_acSequenceNumber = a3;
}

- (void)setHasAcSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasAcSequenceNumber
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateSuggestions;
  int v4 = [(GEOLogMsgStateSuggestions *)&v8 description];
  id v5 = [(GEOLogMsgStateSuggestions *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateSuggestions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_41;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 searchString];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"searchString";
    }
    else {
      objc_super v6 = @"search_string";
    }
    [v4 setObject:v5 forKey:v6];
  }

  if ([*(id *)(a1 + 16) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = *(id *)(a1 + 16);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    if (a2) {
      v15 = @"displayedResult";
    }
    else {
      v15 = @"displayed_result";
    }
    [v4 setObject:v7 forKey:v15];
  }
  char v16 = *(unsigned char *)(a1 + 56);
  if ((v16 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 56) & 2) == 0) {
      goto LABEL_24;
    }
LABEL_30:
    uint64_t v19 = *(int *)(a1 + 48);
    if (v19 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 48));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E53F8400[v19];
    }
    if (a2) {
      v21 = @"searchFieldType";
    }
    else {
      v21 = @"search_field_type";
    }
    [v4 setObject:v20 forKey:v21];

    if ((*(unsigned char *)(a1 + 56) & 1) == 0) {
      goto LABEL_41;
    }
    goto LABEL_37;
  }
  v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  if (a2) {
    v18 = @"selectedIndex";
  }
  else {
    v18 = @"selected_index";
  }
  [v4 setObject:v17 forKey:v18];

  char v16 = *(unsigned char *)(a1 + 56);
  if ((v16 & 2) != 0) {
    goto LABEL_30;
  }
LABEL_24:
  if (v16)
  {
LABEL_37:
    v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
    if (a2) {
      v23 = @"acSequenceNumber";
    }
    else {
      v23 = @"ac_sequence_number";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_41:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateSuggestions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateSuggestions)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateSuggestions *)-[GEOLogMsgStateSuggestions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_53;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_53;
  }
  if (a3) {
    objc_super v6 = @"searchString";
  }
  else {
    objc_super v6 = @"search_string";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (void *)[v7 copy];
    [a1 setSearchString:v8];
  }
  if (a3) {
    uint64_t v9 = @"displayedResult";
  }
  else {
    uint64_t v9 = @"displayed_result";
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = [GEOAutoCompleteResultInfo alloc];
            if (a3) {
              uint64_t v18 = [(GEOAutoCompleteResultInfo *)v17 initWithJSON:v16];
            }
            else {
              uint64_t v18 = [(GEOAutoCompleteResultInfo *)v17 initWithDictionary:v16];
            }
            uint64_t v19 = (void *)v18;
            [a1 addDisplayedResult:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    id v5 = v29;
  }

  if (a3) {
    v20 = @"selectedIndex";
  }
  else {
    v20 = @"selected_index";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSelectedIndex:", objc_msgSend(v21, "intValue"));
  }

  if (a3) {
    v22 = @"searchFieldType";
  }
  else {
    v22 = @"search_field_type";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
    if ([v24 isEqualToString:@"SEARCH_FIELD_TYPE_UNKNOWN"])
    {
      uint64_t v25 = 0;
    }
    else if ([v24 isEqualToString:@"SEARCH_FIELD_TYPE_NORMAL"])
    {
      uint64_t v25 = 1;
    }
    else if ([v24 isEqualToString:@"SEARCH_FIELD_TYPE_DIRECTIONS_START"])
    {
      uint64_t v25 = 2;
    }
    else if ([v24 isEqualToString:@"SEARCH_FIELD_TYPE_DIRECTIONS_END"])
    {
      uint64_t v25 = 3;
    }
    else
    {
      uint64_t v25 = 0;
    }

    goto LABEL_46;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = [v23 intValue];
LABEL_46:
    [a1 setSearchFieldType:v25];
  }

  if (a3) {
    long long v26 = @"acSequenceNumber";
  }
  else {
    long long v26 = @"ac_sequence_number";
  }
  long long v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAcSequenceNumber:", objc_msgSend(v27, "intValue"));
  }

LABEL_53:
  return a1;
}

- (GEOLogMsgStateSuggestions)initWithJSON:(id)a3
{
  return (GEOLogMsgStateSuggestions *)-[GEOLogMsgStateSuggestions _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_9389;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_9390;
    }
    GEOLogMsgStateSuggestionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStateSuggestionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateSuggestionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateSuggestionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    id v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateSuggestions *)self readAll:0];
    if (self->_searchString) {
      PBDataWriterWriteStringField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_displayedResults;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOLogMsgStateSuggestions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 8) = self->_readerMarkPos;
  *((_DWORD *)v9 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_searchString) {
    objc_msgSend(v9, "setSearchString:");
  }
  if ([(GEOLogMsgStateSuggestions *)self displayedResultsCount])
  {
    [v9 clearDisplayedResults];
    unint64_t v4 = [(GEOLogMsgStateSuggestions *)self displayedResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgStateSuggestions *)self displayedResultAtIndex:i];
        [v9 addDisplayedResult:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v9 + 13) = self->_selectedIndex;
    *((unsigned char *)v9 + 56) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v9 + 12) = self->_searchFieldType;
  *((unsigned char *)v9 + 56) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_10:
    *((_DWORD *)v9 + 11) = self->_acSequenceNumber;
    *((unsigned char *)v9 + 56) |= 1u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateSuggestions *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_searchString copyWithZone:a3];
    uint64_t v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = self->_displayedResults;
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
          [(id)v5 addDisplayedResult:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 52) = self->_selectedIndex;
      *(unsigned char *)(v5 + 56) |= 4u;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_14:
        if ((flags & 1) == 0) {
          return (id)v5;
        }
LABEL_15:
        *(_DWORD *)(v5 + 44) = self->_acSequenceNumber;
        *(unsigned char *)(v5 + 56) |= 1u;
        return (id)v5;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_14;
    }
    *(_DWORD *)(v5 + 48) = self->_searchFieldType;
    *(unsigned char *)(v5 + 56) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_15;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateSuggestionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOLogMsgStateSuggestions *)self readAll:1];
  [v4 readAll:1];
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:")) {
      goto LABEL_20;
    }
  }
  displayedResults = self->_displayedResults;
  if ((unint64_t)displayedResults | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](displayedResults, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_selectedIndex != *((_DWORD *)v4 + 13)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_20:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_searchFieldType != *((_DWORD *)v4 + 12)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_acSequenceNumber != *((_DWORD *)v4 + 11)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateSuggestions *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  uint64_t v4 = [(NSMutableArray *)self->_displayedResults hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_selectedIndex;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_searchFieldType;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_acSequenceNumber;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEOLogMsgStateSuggestions setSearchString:](self, "setSearchString:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgStateSuggestions addDisplayedResult:](self, "addDisplayedResult:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 56);
  if ((v10 & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    self->_searchFieldType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_flags |= 2u;
    if ((*((unsigned char *)v4 + 56) & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  self->_selectedIndex = *((_DWORD *)v4 + 13);
  *(unsigned char *)&self->_flags |= 4u;
  char v10 = *((unsigned char *)v4 + 56);
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if (v10)
  {
LABEL_13:
    self->_acSequenceNumber = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_14:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_displayedResults, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end