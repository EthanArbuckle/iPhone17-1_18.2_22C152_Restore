@interface GEOLogMsgEventClientACSuggestions
+ (BOOL)isValid:(id)a3;
+ (Class)entriesType;
+ (Class)queryTokensType;
- (BOOL)hasAutocompleteSequenceNumber;
- (BOOL)hasIsRerankerTriggered;
- (BOOL)hasIsRetainedQuery;
- (BOOL)hasKeypressStatus;
- (BOOL)hasOverallLatencyInMs;
- (BOOL)hasQuery;
- (BOOL)hasSelectedIndex;
- (BOOL)hasSelectedSectionIndex;
- (BOOL)hasShouldDifferentiateClientAndServerResults;
- (BOOL)hasTrigger;
- (BOOL)hasWithinSectionSelectedIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRerankerTriggered;
- (BOOL)isRetainedQuery;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldDifferentiateClientAndServerResults;
- (GEOLogMsgEventClientACSuggestions)init;
- (GEOLogMsgEventClientACSuggestions)initWithData:(id)a3;
- (GEOLogMsgEventClientACSuggestions)initWithDictionary:(id)a3;
- (GEOLogMsgEventClientACSuggestions)initWithJSON:(id)a3;
- (NSMutableArray)entries;
- (NSMutableArray)queryTokens;
- (NSString)query;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entriesAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)keypressStatusAsString:(int)a3;
- (id)queryTokensAtIndex:(unint64_t)a3;
- (id)triggerAsString:(int)a3;
- (int)StringAsKeypressStatus:(id)a3;
- (int)StringAsTrigger:(id)a3;
- (int)keypressStatus;
- (int)selectedIndex;
- (int)selectedSectionIndex;
- (int)trigger;
- (int)withinSectionSelectedIndex;
- (int64_t)overallLatencyInMs;
- (unint64_t)entriesCount;
- (unint64_t)hash;
- (unint64_t)queryTokensCount;
- (unsigned)autocompleteSequenceNumber;
- (void)_addNoFlagsEntries:(uint64_t)a1;
- (void)_addNoFlagsQueryTokens:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEntries;
- (void)_readQuery;
- (void)_readQueryTokens;
- (void)addEntries:(id)a3;
- (void)addQueryTokens:(id)a3;
- (void)clearEntries;
- (void)clearQueryTokens;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutocompleteSequenceNumber:(unsigned int)a3;
- (void)setEntries:(id)a3;
- (void)setHasAutocompleteSequenceNumber:(BOOL)a3;
- (void)setHasIsRerankerTriggered:(BOOL)a3;
- (void)setHasIsRetainedQuery:(BOOL)a3;
- (void)setHasKeypressStatus:(BOOL)a3;
- (void)setHasOverallLatencyInMs:(BOOL)a3;
- (void)setHasSelectedIndex:(BOOL)a3;
- (void)setHasSelectedSectionIndex:(BOOL)a3;
- (void)setHasShouldDifferentiateClientAndServerResults:(BOOL)a3;
- (void)setHasTrigger:(BOOL)a3;
- (void)setHasWithinSectionSelectedIndex:(BOOL)a3;
- (void)setIsRerankerTriggered:(BOOL)a3;
- (void)setIsRetainedQuery:(BOOL)a3;
- (void)setKeypressStatus:(int)a3;
- (void)setOverallLatencyInMs:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setQueryTokens:(id)a3;
- (void)setSelectedIndex:(int)a3;
- (void)setSelectedSectionIndex:(int)a3;
- (void)setShouldDifferentiateClientAndServerResults:(BOOL)a3;
- (void)setTrigger:(int)a3;
- (void)setWithinSectionSelectedIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventClientACSuggestions

- (GEOLogMsgEventClientACSuggestions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventClientACSuggestions;
  v2 = [(GEOLogMsgEventClientACSuggestions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventClientACSuggestions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventClientACSuggestions;
  v3 = [(GEOLogMsgEventClientACSuggestions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQuery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventClientACSuggestionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOLogMsgEventClientACSuggestions _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readQueryTokens
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventClientACSuggestionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryTokens_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)queryTokens
{
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  queryTokens = self->_queryTokens;

  return queryTokens;
}

- (void)setQueryTokens:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  queryTokens = self->_queryTokens;
  self->_queryTokens = v4;
}

- (void)clearQueryTokens
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  queryTokens = self->_queryTokens;

  [(NSMutableArray *)queryTokens removeAllObjects];
}

- (void)addQueryTokens:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  -[GEOLogMsgEventClientACSuggestions _addNoFlagsQueryTokens:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsQueryTokens:(uint64_t)a1
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

- (unint64_t)queryTokensCount
{
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  queryTokens = self->_queryTokens;

  return [(NSMutableArray *)queryTokens count];
}

- (id)queryTokensAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  queryTokens = self->_queryTokens;

  return (id)[(NSMutableArray *)queryTokens objectAtIndex:a3];
}

+ (Class)queryTokensType
{
  return (Class)objc_opt_class();
}

- (void)_readEntries
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventClientACSuggestionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntries_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)entries
{
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  entries = self->_entries;

  return entries;
}

- (void)setEntries:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  entries = self->_entries;
  self->_entries = v4;
}

- (void)clearEntries
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  entries = self->_entries;

  [(NSMutableArray *)entries removeAllObjects];
}

- (void)addEntries:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  -[GEOLogMsgEventClientACSuggestions _addNoFlagsEntries:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsEntries:(uint64_t)a1
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

- (unint64_t)entriesCount
{
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  entries = self->_entries;

  return [(NSMutableArray *)entries count];
}

- (id)entriesAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  entries = self->_entries;

  return (id)[(NSMutableArray *)entries objectAtIndex:a3];
}

+ (Class)entriesType
{
  return (Class)objc_opt_class();
}

- (int)selectedIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_selectedIndex;
  }
  else {
    return -1;
  }
}

- (void)setSelectedIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_selectedIndex = a3;
}

- (void)setHasSelectedIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSelectedIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)trigger
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_trigger;
  }
  else {
    return 0;
  }
}

- (void)setTrigger:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8224;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasTrigger
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)triggerAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = (void *)*((void *)&off_1E53EC818 + a3);
  }

  return v3;
}

- (int)StringAsTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AC_LOG_TRIGGER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KEYPRESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESPONSE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SUPPRESS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)keypressStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_keypressStatus;
  }
  else {
    return 0;
  }
}

- (void)setKeypressStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_keypressStatus = a3;
}

- (void)setHasKeypressStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasKeypressStatus
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)keypressStatusAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = (void *)*((void *)&off_1E53EC838 + a3);
  }

  return v3;
}

- (int)StringAsKeypressStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KEYPRESS_STATUS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUBMITTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"THROTTLED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BATCHED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OMITTED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)withinSectionSelectedIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_withinSectionSelectedIndex;
  }
  else {
    return -1;
  }
}

- (void)setWithinSectionSelectedIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_withinSectionSelectedIndex = a3;
}

- (void)setHasWithinSectionSelectedIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8256;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasWithinSectionSelectedIndex
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (int)selectedSectionIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_selectedSectionIndex;
  }
  else {
    return -1;
  }
}

- (void)setSelectedSectionIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_selectedSectionIndex = a3;
}

- (void)setHasSelectedSectionIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8208;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSelectedSectionIndex
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)isRetainedQuery
{
  return self->_isRetainedQuery;
}

- (void)setIsRetainedQuery:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  self->_isRetainedQuery = a3;
}

- (void)setHasIsRetainedQuery:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8448;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasIsRetainedQuery
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)isRerankerTriggered
{
  return self->_isRerankerTriggered;
}

- (void)setIsRerankerTriggered:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_isRerankerTriggered = a3;
}

- (void)setHasIsRerankerTriggered:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8320;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasIsRerankerTriggered
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int64_t)overallLatencyInMs
{
  return self->_overallLatencyInMs;
}

- (void)setOverallLatencyInMs:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_overallLatencyInMs = a3;
}

- (void)setHasOverallLatencyInMs:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasOverallLatencyInMs
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)shouldDifferentiateClientAndServerResults
{
  return self->_shouldDifferentiateClientAndServerResults;
}

- (void)setShouldDifferentiateClientAndServerResults:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  self->_shouldDifferentiateClientAndServerResults = a3;
}

- (void)setHasShouldDifferentiateClientAndServerResults:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8704;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasShouldDifferentiateClientAndServerResults
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (unsigned)autocompleteSequenceNumber
{
  return self->_autocompleteSequenceNumber;
}

- (void)setAutocompleteSequenceNumber:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_autocompleteSequenceNumber = a3;
}

- (void)setHasAutocompleteSequenceNumber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAutocompleteSequenceNumber
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventClientACSuggestions;
  int v4 = [(GEOLogMsgEventClientACSuggestions *)&v8 description];
  id v5 = [(GEOLogMsgEventClientACSuggestions *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventClientACSuggestions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_75;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 query];
  if (v5) {
    [v4 setObject:v5 forKey:@"query"];
  }

  if (*(void *)(a1 + 32))
  {
    objc_super v6 = [(id)a1 queryTokens];
    if (a2) {
      id v7 = @"queryTokens";
    }
    else {
      id v7 = @"query_tokens";
    }
    [v4 setObject:v6 forKey:v7];
  }
  if ([*(id *)(a1 + 16) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = *(id *)(a1 + 16);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"entries"];
  }
  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 8) != 0)
  {
    v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
    if (a2) {
      v18 = @"selectedIndex";
    }
    else {
      v18 = @"selected_index";
    }
    [v4 setObject:v17 forKey:v18];

    __int16 v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 0x20) == 0)
    {
LABEL_23:
      if ((v16 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_40;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_23;
  }
  uint64_t v19 = *(int *)(a1 + 76);
  if (v19 >= 4)
  {
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
  }
  else
  {
    v20 = (void *)*((void *)&off_1E53EC818 + v19);
  }
  [v4 setObject:v20 forKey:@"trigger"];

  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 4) == 0)
  {
LABEL_24:
    if ((v16 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_47;
  }
LABEL_40:
  uint64_t v21 = *(int *)(a1 + 64);
  if (v21 >= 5)
  {
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
  }
  else
  {
    v22 = (void *)*((void *)&off_1E53EC838 + v21);
  }
  if (a2) {
    v23 = @"keypressStatus";
  }
  else {
    v23 = @"keypress_status";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 0x40) == 0)
  {
LABEL_25:
    if ((v16 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_47:
  v24 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  if (a2) {
    v25 = @"withinSectionSelectedIndex";
  }
  else {
    v25 = @"within_section_selected_index";
  }
  [v4 setObject:v24 forKey:v25];

  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 0x10) == 0)
  {
LABEL_26:
    if ((v16 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_51:
  v26 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  if (a2) {
    v27 = @"selectedSectionIndex";
  }
  else {
    v27 = @"selected_section_index";
  }
  [v4 setObject:v26 forKey:v27];

  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 0x100) == 0)
  {
LABEL_27:
    if ((v16 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_55:
  v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 85)];
  if (a2) {
    v29 = @"isRetainedQuery";
  }
  else {
    v29 = @"is_retained_query";
  }
  [v4 setObject:v28 forKey:v29];

  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 0x80) == 0)
  {
LABEL_28:
    if ((v16 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_59:
  v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
  if (a2) {
    v31 = @"isRerankerTriggered";
  }
  else {
    v31 = @"is_reranker_triggered";
  }
  [v4 setObject:v30 forKey:v31];

  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 1) == 0)
  {
LABEL_29:
    if ((v16 & 0x200) == 0) {
      goto LABEL_30;
    }
LABEL_67:
    v34 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 86)];
    if (a2) {
      v35 = @"shouldDifferentiateClientAndServerResults";
    }
    else {
      v35 = @"should_differentiate_client_and_server_results";
    }
    [v4 setObject:v34 forKey:v35];

    if ((*(_WORD *)(a1 + 88) & 2) == 0) {
      goto LABEL_75;
    }
    goto LABEL_71;
  }
LABEL_63:
  v32 = [NSNumber numberWithLongLong:*(void *)(a1 + 24)];
  if (a2) {
    v33 = @"overallLatencyInMs";
  }
  else {
    v33 = @"overall_latency_in_ms";
  }
  [v4 setObject:v32 forKey:v33];

  __int16 v16 = *(_WORD *)(a1 + 88);
  if ((v16 & 0x200) != 0) {
    goto LABEL_67;
  }
LABEL_30:
  if ((v16 & 2) != 0)
  {
LABEL_71:
    v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
    if (a2) {
      v37 = @"autocompleteSequenceNumber";
    }
    else {
      v37 = @"autocomplete_sequence_number";
    }
    [v4 setObject:v36 forKey:v37];
  }
LABEL_75:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventClientACSuggestions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventClientACSuggestions)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventClientACSuggestions *)-[GEOLogMsgEventClientACSuggestions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_107;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_107;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"query"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[v6 copy];
    [a1 setQuery:v7];
  }
  if (a3) {
    objc_super v8 = @"queryTokens";
  }
  else {
    objc_super v8 = @"query_tokens";
  }
  id v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  id v52 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v58 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v16 = (void *)[v15 copy];
            [a1 addQueryTokens:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v12);
    }

    id v5 = v52;
  }

  v17 = [v5 objectForKeyedSubscript:@"entries"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v51 = v17;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v54 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v53 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = [GEOClientACSuggestionEntry alloc];
            if (a3) {
              uint64_t v25 = [(GEOClientACSuggestionEntry *)v24 initWithJSON:v23];
            }
            else {
              uint64_t v25 = [(GEOClientACSuggestionEntry *)v24 initWithDictionary:v23];
            }
            v26 = (void *)v25;
            objc_msgSend(a1, "addEntries:", v25, v51);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v20);
    }

    v17 = v51;
    id v5 = v52;
  }

  if (a3) {
    v27 = @"selectedIndex";
  }
  else {
    v27 = @"selected_index";
  }
  v28 = objc_msgSend(v5, "objectForKeyedSubscript:", v27, v51);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSelectedIndex:", objc_msgSend(v28, "intValue"));
  }

  v29 = [v5 objectForKeyedSubscript:@"trigger"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v29;
    if ([v30 isEqualToString:@"AC_LOG_TRIGGER_UNKNOWN"])
    {
      uint64_t v31 = 0;
    }
    else if ([v30 isEqualToString:@"KEYPRESS"])
    {
      uint64_t v31 = 1;
    }
    else if ([v30 isEqualToString:@"RESPONSE"])
    {
      uint64_t v31 = 2;
    }
    else if ([v30 isEqualToString:@"SUPPRESS"])
    {
      uint64_t v31 = 3;
    }
    else
    {
      uint64_t v31 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_52;
    }
    uint64_t v31 = [v29 intValue];
  }
  [a1 setTrigger:v31];
LABEL_52:

  if (a3) {
    v32 = @"keypressStatus";
  }
  else {
    v32 = @"keypress_status";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v33;
    if ([v34 isEqualToString:@"KEYPRESS_STATUS_UNKNOWN"])
    {
      uint64_t v35 = 0;
    }
    else if ([v34 isEqualToString:@"SUBMITTED"])
    {
      uint64_t v35 = 1;
    }
    else if ([v34 isEqualToString:@"THROTTLED"])
    {
      uint64_t v35 = 2;
    }
    else if ([v34 isEqualToString:@"BATCHED"])
    {
      uint64_t v35 = 3;
    }
    else if ([v34 isEqualToString:@"OMITTED"])
    {
      uint64_t v35 = 4;
    }
    else
    {
      uint64_t v35 = 0;
    }

    goto LABEL_70;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = [v33 intValue];
LABEL_70:
    [a1 setKeypressStatus:v35];
  }

  if (a3) {
    v36 = @"withinSectionSelectedIndex";
  }
  else {
    v36 = @"within_section_selected_index";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWithinSectionSelectedIndex:", objc_msgSend(v37, "intValue"));
  }

  if (a3) {
    v38 = @"selectedSectionIndex";
  }
  else {
    v38 = @"selected_section_index";
  }
  long long v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSelectedSectionIndex:", objc_msgSend(v39, "intValue"));
  }

  if (a3) {
    long long v40 = @"isRetainedQuery";
  }
  else {
    long long v40 = @"is_retained_query";
  }
  long long v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsRetainedQuery:", objc_msgSend(v41, "BOOLValue"));
  }

  if (a3) {
    long long v42 = @"isRerankerTriggered";
  }
  else {
    long long v42 = @"is_reranker_triggered";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsRerankerTriggered:", objc_msgSend(v43, "BOOLValue"));
  }

  if (a3) {
    uint64_t v44 = @"overallLatencyInMs";
  }
  else {
    uint64_t v44 = @"overall_latency_in_ms";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOverallLatencyInMs:", objc_msgSend(v45, "longLongValue"));
  }

  if (a3) {
    v46 = @"shouldDifferentiateClientAndServerResults";
  }
  else {
    v46 = @"should_differentiate_client_and_server_results";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShouldDifferentiateClientAndServerResults:", objc_msgSend(v47, "BOOLValue"));
  }

  if (a3) {
    v48 = @"autocompleteSequenceNumber";
  }
  else {
    v48 = @"autocomplete_sequence_number";
  }
  v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAutocompleteSequenceNumber:", objc_msgSend(v49, "unsignedIntValue"));
  }

LABEL_107:
  return a1;
}

- (GEOLogMsgEventClientACSuggestions)initWithJSON:(id)a3
{
  return (GEOLogMsgEventClientACSuggestions *)-[GEOLogMsgEventClientACSuggestions _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_802_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_803_0;
    }
    GEOLogMsgEventClientACSuggestionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventClientACSuggestionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventClientACSuggestionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventClientACSuggestionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventClientACSuggestionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    __int16 v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventClientACSuggestions *)self readAll:0];
    if (self->_query) {
      PBDataWriterWriteStringField();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v6 = self->_queryTokens;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = self->_entries;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteInt64Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEOLogMsgEventClientACSuggestions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 12) = self->_readerMarkPos;
  *((_DWORD *)v13 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v13, "setQuery:");
  }
  if ([(GEOLogMsgEventClientACSuggestions *)self queryTokensCount])
  {
    [v13 clearQueryTokens];
    unint64_t v4 = [(GEOLogMsgEventClientACSuggestions *)self queryTokensCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventClientACSuggestions *)self queryTokensAtIndex:i];
        [v13 addQueryTokens:v7];
      }
    }
  }
  if ([(GEOLogMsgEventClientACSuggestions *)self entriesCount])
  {
    [v13 clearEntries];
    unint64_t v8 = [(GEOLogMsgEventClientACSuggestions *)self entriesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLogMsgEventClientACSuggestions *)self entriesAtIndex:j];
        [v13 addEntries:v11];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v13 + 17) = self->_selectedIndex;
    *((_WORD *)v13 + 44) |= 8u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_13:
      if ((flags & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_27;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v13 + 19) = self->_trigger;
  *((_WORD *)v13 + 44) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_14:
    if ((flags & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v13 + 16) = self->_keypressStatus;
  *((_WORD *)v13 + 44) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_15:
    if ((flags & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v13 + 20) = self->_withinSectionSelectedIndex;
  *((_WORD *)v13 + 44) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_16:
    if ((flags & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v13 + 18) = self->_selectedSectionIndex;
  *((_WORD *)v13 + 44) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_17:
    if ((flags & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)v13 + 85) = self->_isRetainedQuery;
  *((_WORD *)v13 + 44) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((unsigned char *)v13 + 84) = self->_isRerankerTriggered;
  *((_WORD *)v13 + 44) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }
LABEL_32:
  v13[3] = self->_overallLatencyInMs;
  *((_WORD *)v13 + 44) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_20:
    if ((flags & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_33:
  *((unsigned char *)v13 + 86) = self->_shouldDifferentiateClientAndServerResults;
  *((_WORD *)v13 + 44) |= 0x200u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_21:
    *((_DWORD *)v13 + 15) = self->_autocompleteSequenceNumber;
    *((_WORD *)v13 + 44) |= 2u;
  }
LABEL_22:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventClientACSuggestions *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
    id v10 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v9;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v11 = self->_queryTokens;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
          [(id)v5 addQueryTokens:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    __int16 v16 = self->_entries;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v16);
          }
          long long v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
          [(id)v5 addEntries:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_selectedIndex;
      *(_WORD *)(v5 + 88) |= 8u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0)
      {
LABEL_21:
        if ((flags & 4) == 0) {
          goto LABEL_22;
        }
        goto LABEL_33;
      }
    }
    else if ((flags & 0x20) == 0)
    {
      goto LABEL_21;
    }
    *(_DWORD *)(v5 + 76) = self->_trigger;
    *(_WORD *)(v5 + 88) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_22:
      if ((flags & 0x40) == 0) {
        goto LABEL_23;
      }
      goto LABEL_34;
    }
LABEL_33:
    *(_DWORD *)(v5 + 64) = self->_keypressStatus;
    *(_WORD *)(v5 + 88) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_23:
      if ((flags & 0x10) == 0) {
        goto LABEL_24;
      }
      goto LABEL_35;
    }
LABEL_34:
    *(_DWORD *)(v5 + 80) = self->_withinSectionSelectedIndex;
    *(_WORD *)(v5 + 88) |= 0x40u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_24:
      if ((flags & 0x100) == 0) {
        goto LABEL_25;
      }
      goto LABEL_36;
    }
LABEL_35:
    *(_DWORD *)(v5 + 72) = self->_selectedSectionIndex;
    *(_WORD *)(v5 + 88) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_25:
      if ((flags & 0x80) == 0) {
        goto LABEL_26;
      }
      goto LABEL_37;
    }
LABEL_36:
    *(unsigned char *)(v5 + 85) = self->_isRetainedQuery;
    *(_WORD *)(v5 + 88) |= 0x100u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_26:
      if ((flags & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_38;
    }
LABEL_37:
    *(unsigned char *)(v5 + 84) = self->_isRerankerTriggered;
    *(_WORD *)(v5 + 88) |= 0x80u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_27:
      if ((flags & 0x200) == 0) {
        goto LABEL_28;
      }
      goto LABEL_39;
    }
LABEL_38:
    *(void *)(v5 + 24) = self->_overallLatencyInMs;
    *(_WORD *)(v5 + 88) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x200) == 0)
    {
LABEL_28:
      if ((flags & 2) == 0) {
        return (id)v5;
      }
LABEL_29:
      *(_DWORD *)(v5 + 60) = self->_autocompleteSequenceNumber;
      *(_WORD *)(v5 + 88) |= 2u;
      return (id)v5;
    }
LABEL_39:
    *(unsigned char *)(v5 + 86) = self->_shouldDifferentiateClientAndServerResults;
    *(_WORD *)(v5 + 88) |= 0x200u;
    if ((*(_WORD *)&self->_flags & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_29;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventClientACSuggestionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  [(GEOLogMsgEventClientACSuggestions *)self readAll:1];
  [v4 readAll:1];
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_67;
    }
  }
  queryTokens = self->_queryTokens;
  if ((unint64_t)queryTokens | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](queryTokens, "isEqual:")) {
      goto LABEL_67;
    }
  }
  entries = self->_entries;
  if ((unint64_t)entries | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](entries, "isEqual:")) {
      goto LABEL_67;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 44);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_selectedIndex != *((_DWORD *)v4 + 17)) {
      goto LABEL_67;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_trigger != *((_DWORD *)v4 + 19)) {
      goto LABEL_67;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_keypressStatus != *((_DWORD *)v4 + 16)) {
      goto LABEL_67;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_withinSectionSelectedIndex != *((_DWORD *)v4 + 20)) {
      goto LABEL_67;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_selectedSectionIndex != *((_DWORD *)v4 + 18)) {
      goto LABEL_67;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0) {
      goto LABEL_67;
    }
    if (self->_isRetainedQuery)
    {
      if (!*((unsigned char *)v4 + 85)) {
        goto LABEL_67;
      }
    }
    else if (*((unsigned char *)v4 + 85))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0) {
      goto LABEL_67;
    }
    if (self->_isRerankerTriggered)
    {
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_67;
      }
    }
    else if (*((unsigned char *)v4 + 84))
    {
      goto LABEL_67;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_overallLatencyInMs != *((void *)v4 + 3)) {
      goto LABEL_67;
    }
  }
  else if (v9)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x200) != 0)
    {
      if (self->_shouldDifferentiateClientAndServerResults)
      {
        if (!*((unsigned char *)v4 + 86)) {
          goto LABEL_67;
        }
        goto LABEL_62;
      }
      if (!*((unsigned char *)v4 + 86)) {
        goto LABEL_62;
      }
    }
LABEL_67:
    BOOL v10 = 0;
    goto LABEL_68;
  }
  if ((*((_WORD *)v4 + 44) & 0x200) != 0) {
    goto LABEL_67;
  }
LABEL_62:
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_autocompleteSequenceNumber != *((_DWORD *)v4 + 15)) {
      goto LABEL_67;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v9 & 2) == 0;
  }
LABEL_68:

  return v10;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventClientACSuggestions *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_query hash];
  uint64_t v4 = [(NSMutableArray *)self->_queryTokens hash];
  uint64_t v5 = [(NSMutableArray *)self->_entries hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_selectedIndex;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_trigger;
      if ((flags & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  if ((flags & 4) != 0)
  {
LABEL_4:
    uint64_t v9 = 2654435761 * self->_keypressStatus;
    if ((flags & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v9 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_5:
    uint64_t v10 = 2654435761 * self->_withinSectionSelectedIndex;
    if ((flags & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    uint64_t v11 = 2654435761 * self->_selectedSectionIndex;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_7:
    uint64_t v12 = 2654435761 * self->_isRetainedQuery;
    if ((flags & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v12 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_8:
    uint64_t v13 = 2654435761 * self->_isRerankerTriggered;
    if (flags) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v13 = 0;
  if (flags)
  {
LABEL_9:
    uint64_t v14 = 2654435761 * self->_overallLatencyInMs;
    if ((*(_WORD *)&self->_flags & 0x200) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v15 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v16 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_19:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v15 = 2654435761 * self->_shouldDifferentiateClientAndServerResults;
  if ((flags & 2) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v16 = 2654435761 * self->_autocompleteSequenceNumber;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 5)) {
    -[GEOLogMsgEventClientACSuggestions setQuery:](self, "setQuery:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOLogMsgEventClientACSuggestions *)self addQueryTokens:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOLogMsgEventClientACSuggestions addEntries:](self, "addEntries:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 8) != 0)
  {
    self->_selectedIndex = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v15 = *((_WORD *)v4 + 44);
    if ((v15 & 0x20) == 0)
    {
LABEL_19:
      if ((v15 & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_31;
    }
  }
  else if ((v15 & 0x20) == 0)
  {
    goto LABEL_19;
  }
  self->_trigger = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 4) == 0)
  {
LABEL_20:
    if ((v15 & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_keypressStatus = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x40) == 0)
  {
LABEL_21:
    if ((v15 & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_withinSectionSelectedIndex = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x10) == 0)
  {
LABEL_22:
    if ((v15 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_selectedSectionIndex = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 0x10u;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x100) == 0)
  {
LABEL_23:
    if ((v15 & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_isRetainedQuery = *((unsigned char *)v4 + 85);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x80) == 0)
  {
LABEL_24:
    if ((v15 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_isRerankerTriggered = *((unsigned char *)v4 + 84);
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 1) == 0)
  {
LABEL_25:
    if ((v15 & 0x200) == 0) {
      goto LABEL_26;
    }
LABEL_37:
    self->_shouldDifferentiateClientAndServerResults = *((unsigned char *)v4 + 86);
    *(_WORD *)&self->_flags |= 0x200u;
    if ((*((_WORD *)v4 + 44) & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_36:
  self->_overallLatencyInMs = *((void *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x200) != 0) {
    goto LABEL_37;
  }
LABEL_26:
  if ((v15 & 2) != 0)
  {
LABEL_27:
    self->_autocompleteSequenceNumber = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_28:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryTokens, 0);
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end