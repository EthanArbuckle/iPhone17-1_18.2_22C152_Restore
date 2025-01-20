@interface GEOPlaceSearchResponse
+ (BOOL)isValid:(id)a3;
+ (Class)namedFeaturesType;
+ (Class)placeResultType;
+ (Class)suggestionEntryListsType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsChainResultSet;
- (BOOL)hasMapRegion;
- (BOOL)hasNearbySectionHeader;
- (BOOL)hasStatusCodeInfo;
- (BOOL)hasSuggestionMetadata;
- (BOOL)hasTurnaroundTime;
- (BOOL)isChainResultSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)mapRegion;
- (GEOPlaceSearchResponse)init;
- (GEOPlaceSearchResponse)initWithData:(id)a3;
- (GEOPlaceSearchResponse)initWithDictionary:(id)a3;
- (GEOPlaceSearchResponse)initWithJSON:(id)a3;
- (NSData)suggestionMetadata;
- (NSMutableArray)namedFeatures;
- (NSMutableArray)placeResults;
- (NSMutableArray)suggestionEntryLists;
- (NSString)nearbySectionHeader;
- (PBUnknownFields)unknownFields;
- (double)turnaroundTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)namedFeaturesAtIndex:(unint64_t)a3;
- (id)placeResultAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (id)statusCodeInfoAsString:(int)a3;
- (id)suggestionEntryListsAtIndex:(unint64_t)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsStatusCodeInfo:(id)a3;
- (int)status;
- (int)statusCodeInfo;
- (unint64_t)hash;
- (unint64_t)namedFeaturesCount;
- (unint64_t)placeResultsCount;
- (unint64_t)suggestionEntryListsCount;
- (void)_addNoFlagsNamedFeatures:(uint64_t)a1;
- (void)_addNoFlagsPlaceResult:(uint64_t)a1;
- (void)_addNoFlagsSuggestionEntryLists:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMapRegion;
- (void)_readNamedFeatures;
- (void)_readNearbySectionHeader;
- (void)_readPlaceResults;
- (void)_readSuggestionEntryLists;
- (void)_readSuggestionMetadata;
- (void)addNamedFeatures:(id)a3;
- (void)addPlaceResult:(id)a3;
- (void)addSuggestionEntryLists:(id)a3;
- (void)clearNamedFeatures;
- (void)clearPlaceResults;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSuggestionEntryLists;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIsChainResultSet:(BOOL)a3;
- (void)setHasStatusCodeInfo:(BOOL)a3;
- (void)setHasTurnaroundTime:(BOOL)a3;
- (void)setIsChainResultSet:(BOOL)a3;
- (void)setMapRegion:(id)a3;
- (void)setNamedFeatures:(id)a3;
- (void)setNearbySectionHeader:(id)a3;
- (void)setPlaceResults:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStatusCodeInfo:(int)a3;
- (void)setSuggestionEntryLists:(id)a3;
- (void)setSuggestionMetadata:(id)a3;
- (void)setTurnaroundTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceSearchResponse

- (GEOPlaceSearchResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceSearchResponse;
  v2 = [(GEOPlaceSearchResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceSearchResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceSearchResponse;
  v3 = [(GEOPlaceSearchResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_status = a3;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPlaceResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)placeResults
{
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  placeResults = self->_placeResults;

  return placeResults;
}

- (void)setPlaceResults:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  placeResults = self->_placeResults;
  self->_placeResults = v4;
}

- (void)clearPlaceResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  placeResults = self->_placeResults;

  [(NSMutableArray *)placeResults removeAllObjects];
}

- (void)addPlaceResult:(id)a3
{
  id v4 = a3;
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  -[GEOPlaceSearchResponse _addNoFlagsPlaceResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsPlaceResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)placeResultsCount
{
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  placeResults = self->_placeResults;

  return [(NSMutableArray *)placeResults count];
}

- (id)placeResultAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  placeResults = self->_placeResults;

  return (id)[(NSMutableArray *)placeResults objectAtIndex:a3];
}

+ (Class)placeResultType
{
  return (Class)objc_opt_class();
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_2947);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOPlaceSearchResponse _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readSuggestionEntryLists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryLists_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)suggestionEntryLists
{
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  suggestionEntryLists = self->_suggestionEntryLists;

  return suggestionEntryLists;
}

- (void)setSuggestionEntryLists:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  suggestionEntryLists = self->_suggestionEntryLists;
  self->_suggestionEntryLists = v4;
}

- (void)clearSuggestionEntryLists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  suggestionEntryLists = self->_suggestionEntryLists;

  [(NSMutableArray *)suggestionEntryLists removeAllObjects];
}

- (void)addSuggestionEntryLists:(id)a3
{
  id v4 = a3;
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  -[GEOPlaceSearchResponse _addNoFlagsSuggestionEntryLists:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsSuggestionEntryLists:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)suggestionEntryListsCount
{
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  suggestionEntryLists = self->_suggestionEntryLists;

  return [(NSMutableArray *)suggestionEntryLists count];
}

- (id)suggestionEntryListsAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  suggestionEntryLists = self->_suggestionEntryLists;

  return (id)[(NSMutableArray *)suggestionEntryLists objectAtIndex:a3];
}

+ (Class)suggestionEntryListsType
{
  return (Class)objc_opt_class();
}

- (void)_readSuggestionMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionMetadata_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSuggestionMetadata
{
  return self->_suggestionMetadata != 0;
}

- (NSData)suggestionMetadata
{
  -[GEOPlaceSearchResponse _readSuggestionMetadata]((uint64_t)self);
  suggestionMetadata = self->_suggestionMetadata;

  return suggestionMetadata;
}

- (void)setSuggestionMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_suggestionMetadata, a3);
}

- (void)_readNamedFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNamedFeatures_tags_2949);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)namedFeatures
{
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  namedFeatures = self->_namedFeatures;

  return namedFeatures;
}

- (void)setNamedFeatures:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  namedFeatures = self->_namedFeatures;
  self->_namedFeatures = v4;
}

- (void)clearNamedFeatures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  namedFeatures = self->_namedFeatures;

  [(NSMutableArray *)namedFeatures removeAllObjects];
}

- (void)addNamedFeatures:(id)a3
{
  id v4 = a3;
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  -[GEOPlaceSearchResponse _addNoFlagsNamedFeatures:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsNamedFeatures:(uint64_t)a1
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

- (unint64_t)namedFeaturesCount
{
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  namedFeatures = self->_namedFeatures;

  return [(NSMutableArray *)namedFeatures count];
}

- (id)namedFeaturesAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  namedFeatures = self->_namedFeatures;

  return (id)[(NSMutableArray *)namedFeatures objectAtIndex:a3];
}

+ (Class)namedFeaturesType
{
  return (Class)objc_opt_class();
}

- (int)statusCodeInfo
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_statusCodeInfo;
  }
  else {
    return 1;
  }
}

- (void)setStatusCodeInfo:(int)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_statusCodeInfo = a3;
}

- (void)setHasStatusCodeInfo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasStatusCodeInfo
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)statusCodeInfoAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E71E8[a3 - 1];
  }

  return v3;
}

- (int)StringAsStatusCodeInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TIMEOUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INCOMPLETE_MATCH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LOW_CONFIDENCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AMBIGUOUS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (double)turnaroundTime
{
  return self->_turnaroundTime;
}

- (void)setTurnaroundTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_turnaroundTime = a3;
}

- (void)setHasTurnaroundTime:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasTurnaroundTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readNearbySectionHeader
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearbySectionHeader_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasNearbySectionHeader
{
  return self->_nearbySectionHeader != 0;
}

- (NSString)nearbySectionHeader
{
  -[GEOPlaceSearchResponse _readNearbySectionHeader]((uint64_t)self);
  nearbySectionHeader = self->_nearbySectionHeader;

  return nearbySectionHeader;
}

- (void)setNearbySectionHeader:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_nearbySectionHeader, a3);
}

- (BOOL)isChainResultSet
{
  return self->_isChainResultSet;
}

- (void)setIsChainResultSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_isChainResultSet = a3;
}

- (void)setHasIsChainResultSet:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1028;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasIsChainResultSet
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceSearchResponse;
  int v4 = [(GEOPlaceSearchResponse *)&v8 description];
  id v5 = [(GEOPlaceSearchResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceSearchResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_85;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 96);
  if (v5 <= 29)
  {
    objc_super v6 = @"STATUS_SUCCESS";
    switch(v5)
    {
      case 0:
        goto LABEL_19;
      case 1:
        objc_super v6 = @"STATUS_FAILED";
        break;
      case 2:
        objc_super v6 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_14;
      case 5:
        objc_super v6 = @"INVALID_REQUEST";
        break;
      default:
        if (v5 != 20) {
          goto LABEL_14;
        }
        objc_super v6 = @"FAILED_NO_RESULT";
        break;
    }
    goto LABEL_19;
  }
  if (v5 > 49)
  {
    if (v5 == 50)
    {
      objc_super v6 = @"STATUS_DEDUPED";
      goto LABEL_19;
    }
    if (v5 == 60)
    {
      objc_super v6 = @"VERSION_MISMATCH";
      goto LABEL_19;
    }
LABEL_14:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 96));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v5 == 30)
  {
    objc_super v6 = @"NEEDS_REFINEMENT";
    goto LABEL_19;
  }
  if (v5 != 40) {
    goto LABEL_14;
  }
  objc_super v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_19:
  [v4 setObject:v6 forKey:@"status"];

  if ([*(id *)(a1 + 48) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v63 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"placeResult"];
  }
  v15 = [(id)a1 mapRegion];
  v16 = v15;
  if (v15)
  {
    if (a2) {
      [v15 jsonRepresentation];
    }
    else {
    v17 = [v15 dictionaryRepresentation];
    }
    [v4 setObject:v17 forKey:@"mapRegion"];
  }
  if ([*(id *)(a1 + 56) count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v19 = *(id *)(a1 + 56);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          if (a2) {
            [v24 jsonRepresentation];
          }
          else {
          v25 = [v24 dictionaryRepresentation];
          }
          [v18 addObject:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v21);
    }

    [v4 setObject:v18 forKey:@"suggestionEntryLists"];
  }
  v26 = [(id)a1 suggestionMetadata];
  v27 = v26;
  if (v26)
  {
    if (a2)
    {
      v28 = [v26 base64EncodedStringWithOptions:0];
      [v4 setObject:v28 forKey:@"suggestionMetadata"];
    }
    else
    {
      [v4 setObject:v26 forKey:@"suggestionMetadata"];
    }
  }

  if ([*(id *)(a1 + 32) count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v30 = *(id *)(a1 + 32);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v55 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          if (a2) {
            [v35 jsonRepresentation];
          }
          else {
          v36 = [v35 dictionaryRepresentation];
          }
          [v29 addObject:v36];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"namedFeatures"];
  }
  __int16 v37 = *(_WORD *)(a1 + 104);
  if ((v37 & 2) != 0)
  {
    unsigned int v38 = *(_DWORD *)(a1 + 92) - 1;
    if (v38 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 92));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_1E53E71E8[v38];
    }
    [v4 setObject:v39 forKey:@"statusCodeInfo"];

    __int16 v37 = *(_WORD *)(a1 + 104);
  }
  if (v37)
  {
    v40 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    [v4 setObject:v40 forKey:@"turnaroundTime"];
  }
  v41 = [(id)a1 nearbySectionHeader];
  if (v41)
  {
    if (a2) {
      v42 = @"nearbySectionHeader";
    }
    else {
      v42 = @"nearby_section_header";
    }
    [v4 setObject:v41 forKey:v42];
  }

  if ((*(_WORD *)(a1 + 104) & 4) != 0)
  {
    v43 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
    if (a2) {
      v44 = @"isChainResultSet";
    }
    else {
      v44 = @"is_chain_result_set";
    }
    [v4 setObject:v43 forKey:v44];
  }
  v45 = *(void **)(a1 + 16);
  if (v45)
  {
    v46 = [v45 dictionaryRepresentation];
    v47 = v46;
    if (a2)
    {
      v48 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __52__GEOPlaceSearchResponse__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E53D8860;
      id v49 = v48;
      id v53 = v49;
      [v47 enumerateKeysAndObjectsUsingBlock:v52];
      id v50 = v49;

      v47 = v50;
    }
    [v4 setObject:v47 forKey:@"Unknown Fields"];
  }
LABEL_85:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceSearchResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPlaceSearchResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPlaceSearchResponse)initWithDictionary:(id)a3
{
  return (GEOPlaceSearchResponse *)-[GEOPlaceSearchResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v117 = a2;
  if (!a1 || (v123 = (void *)[a1 init]) == 0)
  {
    v123 = 0;
    goto LABEL_206;
  }
  int v4 = [v117 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v6 = 20;
    }
    else if ([v5 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v6 = 30;
    }
    else if ([v5 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v6 = 40;
    }
    else if ([v5 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v6 = 50;
    }
    else if ([v5 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v6 = 60;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_28;
    }
    uint64_t v6 = [v4 intValue];
  }
  [v123 setStatus:v6];
LABEL_28:

  id v7 = [v117 objectForKeyedSubscript:@"placeResult"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v135 objects:v157 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v136 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v135 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [GEOPlaceResult alloc];
            if (a3) {
              uint64_t v14 = [(GEOPlaceResult *)v13 initWithJSON:v12];
            }
            else {
              uint64_t v14 = [(GEOPlaceResult *)v13 initWithDictionary:v12];
            }
            v15 = (void *)v14;
            [v123 addPlaceResult:v14];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v135 objects:v157 count:16];
      }
      while (v9);
    }
  }
  v16 = [v117 objectForKeyedSubscript:@"mapRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v18 = [(GEOMapRegion *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEOMapRegion *)v17 initWithDictionary:v16];
    }
    id v19 = (void *)v18;
    [v123 setMapRegion:v18];
  }
  v110 = [v117 objectForKeyedSubscript:@"suggestionEntryLists"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    obuint64_t j = v110;
    uint64_t v114 = [obj countByEnumeratingWithState:&v131 objects:v156 count:16];
    if (!v114) {
      goto LABEL_162;
    }
    uint64_t v20 = @"content_type";
    uint64_t v113 = *(void *)v132;
    if (a3) {
      uint64_t v20 = @"contentType";
    }
    v109 = v20;
    while (1)
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v132 != v113)
        {
          uint64_t v22 = v21;
          objc_enumerationMutation(obj);
          uint64_t v21 = v22;
        }
        uint64_t v115 = v21;
        v23 = *(void **)(*((void *)&v131 + 1) + 8 * v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = [GEOSuggestionEntryList alloc];
          if (v24)
          {
            id v116 = v23;
            uint64_t v119 = [(GEOSuggestionEntryList *)v24 init];
            if (v119)
            {
              v112 = [v116 objectForKeyedSubscript:@"suggestionEntries"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v141 = 0u;
                long long v142 = 0u;
                long long v139 = 0u;
                long long v140 = 0u;
                id v118 = v112;
                uint64_t v121 = [v118 countByEnumeratingWithState:&v139 objects:v158 count:16];
                if (v121)
                {
                  uint64_t v120 = *(void *)v140;
                  do
                  {
                    uint64_t v25 = 0;
                    do
                    {
                      if (*(void *)v140 != v120)
                      {
                        uint64_t v26 = v25;
                        objc_enumerationMutation(v118);
                        uint64_t v25 = v26;
                      }
                      uint64_t v124 = v25;
                      v27 = *(void **)(*((void *)&v139 + 1) + 8 * v25);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v28 = [GEOSuggestionEntry alloc];
                        if (v28)
                        {
                          id v125 = v27;
                          uint64_t v29 = [(GEOSuggestionEntry *)v28 init];
                          if (v29)
                          {
                            id v30 = [v125 objectForKeyedSubscript:@"displayLine"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v153 = 0u;
                              long long v154 = 0u;
                              long long v151 = 0u;
                              long long v152 = 0u;
                              id v31 = v30;
                              uint64_t v32 = [v31 countByEnumeratingWithState:&v151 objects:v161 count:16];
                              if (v32)
                              {
                                uint64_t v33 = *(void *)v152;
                                do
                                {
                                  for (uint64_t j = 0; j != v32; ++j)
                                  {
                                    if (*(void *)v152 != v33) {
                                      objc_enumerationMutation(v31);
                                    }
                                    v35 = *(void **)(*((void *)&v151 + 1) + 8 * j);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v36 = (void *)[v35 copy];
                                      -[GEOSuggestionEntry addDisplayLine:](v29, v36);
                                    }
                                  }
                                  uint64_t v32 = [v31 countByEnumeratingWithState:&v151 objects:v161 count:16];
                                }
                                while (v32);
                              }
                            }
                            v122 = [v125 objectForKeyedSubscript:@"textHighlights"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v149 = 0u;
                              long long v150 = 0u;
                              long long v147 = 0u;
                              long long v148 = 0u;
                              id v37 = v122;
                              uint64_t v38 = [v37 countByEnumeratingWithState:&v147 objects:v160 count:16];
                              if (v38)
                              {
                                uint64_t v39 = *(void *)v148;
                                do
                                {
                                  for (uint64_t k = 0; k != v38; ++k)
                                  {
                                    if (*(void *)v148 != v39) {
                                      objc_enumerationMutation(v37);
                                    }
                                    v41 = *(void **)(*((void *)&v147 + 1) + 8 * k);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v42 = v41;
                                      v43 = [v42 objectForKeyedSubscript:@"lineNumber"];
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        uint64_t v44 = [v43 unsignedIntValue];
                                        uint64_t v45 = 0x200000000;
                                      }
                                      else
                                      {
                                        uint64_t v44 = 0;
                                        uint64_t v45 = 0;
                                      }

                                      v46 = [v42 objectForKeyedSubscript:@"startIndex"];
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass()) {
                                        v45 |= [v46 unsignedIntValue] | 0x400000000;
                                      }

                                      v47 = [v42 objectForKeyedSubscript:@"length"];
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        unsigned int v48 = [v47 unsignedIntValue];
                                        v45 |= 0x100000000uLL;
                                      }
                                      else
                                      {
                                        unsigned int v48 = 0;
                                      }

                                      os_unfair_lock_lock((os_unfair_lock_t)(v29 + 112));
                                      if ((*(_WORD *)(v29 + 116) & 2) == 0)
                                      {
                                        id v49 = *(void **)(v29 + 8);
                                        if (v49)
                                        {
                                          id v50 = v49;
                                          objc_sync_enter(v50);
                                          GEOSuggestionEntryReadSpecified(v29, *(void *)(v29 + 8), (int *)&_readTextHighlights_tags);
                                          objc_sync_exit(v50);
                                        }
                                      }
                                      os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 112));
                                      if (-[GEOSuggestionEntry _reserveTextHighlights:](v29, 1uLL))
                                      {
                                        v51 = (unint64_t *)(*(void *)(v29 + 24) + 16 * *(void *)(v29 + 32));
                                        unint64_t *v51 = v48 | (unint64_t)(v44 << 32);
                                        v51[1] = v45;
                                        ++*(void *)(v29 + 32);
                                      }
                                      os_unfair_lock_lock_with_options();
                                      *(_WORD *)(v29 + 116) |= 2u;
                                      os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 112));
                                      *(_WORD *)(v29 + 116) |= 0x200u;
                                    }
                                  }
                                  uint64_t v38 = [v37 countByEnumeratingWithState:&v147 objects:v160 count:16];
                                }
                                while (v38);
                              }
                            }
                            v52 = [v125 objectForKeyedSubscript:@"iconID"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v53 = (void *)[v52 copy];
                              id v54 = v53;
                              *(_WORD *)(v29 + 116) |= 0x10u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 64), v53);
                            }
                            long long v55 = [v125 objectForKeyedSubscript:@"latlng"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v56 = [GEOLatLng alloc];
                              if (a3) {
                                long long v57 = [(GEOLatLng *)v56 initWithJSON:v55];
                              }
                              else {
                                long long v57 = [(GEOLatLng *)v56 initWithDictionary:v55];
                              }
                              long long v58 = v57;
                              long long v59 = v57;
                              *(_WORD *)(v29 + 116) |= 0x20u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 72), v58);
                            }
                            long long v60 = [v125 objectForKeyedSubscript:@"suggestionEntryMetadata"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v61 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v60 options:0];
                              id v62 = v61;
                              *(_WORD *)(v29 + 116) |= 0x100u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 96), v61);
                            }
                            long long v63 = [v125 objectForKeyedSubscript:@"searchQueryDisplayString"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v64 = (void *)[v63 copy];
                              id v65 = v64;
                              *(_WORD *)(v29 + 116) |= 0x80u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 88), v64);
                            }
                            v66 = [v125 objectForKeyedSubscript:@"calloutTitle"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v67 = (void *)[v66 copy];
                              id v68 = v67;
                              *(_WORD *)(v29 + 116) |= 4u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 48), v67);
                            }
                            uint64_t v69 = [v125 objectForKeyedSubscript:@"namedFeature"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              long long v145 = 0u;
                              long long v146 = 0u;
                              long long v143 = 0u;
                              long long v144 = 0u;
                              id v70 = v69;
                              uint64_t v71 = [v70 countByEnumeratingWithState:&v143 objects:v159 count:16];
                              if (v71)
                              {
                                uint64_t v72 = *(void *)v144;
                                do
                                {
                                  for (uint64_t m = 0; m != v71; ++m)
                                  {
                                    if (*(void *)v144 != v72) {
                                      objc_enumerationMutation(v70);
                                    }
                                    uint64_t v74 = *(void *)(*((void *)&v143 + 1) + 8 * m);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v75 = [GEONamedFeature alloc];
                                      if (a3) {
                                        v76 = [(GEONamedFeature *)v75 initWithJSON:v74];
                                      }
                                      else {
                                        v76 = [(GEONamedFeature *)v75 initWithDictionary:v74];
                                      }
                                      v77 = v76;
                                      -[GEOSuggestionEntry addNamedFeature:](v29, v76);
                                    }
                                  }
                                  uint64_t v71 = [v70 countByEnumeratingWithState:&v143 objects:v159 count:16];
                                }
                                while (v71);
                              }
                            }
                          }
                        }
                        else
                        {
                          uint64_t v29 = 0;
                        }
                        -[GEOSuggestionEntryList addSuggestionEntries:](v119, (void *)v29);
                      }
                      uint64_t v25 = v124 + 1;
                    }
                    while (v124 + 1 != v121);
                    uint64_t v78 = [v118 countByEnumeratingWithState:&v139 objects:v158 count:16];
                    uint64_t v121 = v78;
                  }
                  while (v78);
                }
              }
              v79 = [v116 objectForKeyedSubscript:@"localizedSectionHeader"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v80 = (void *)[v79 copy];
                id v81 = v80;
                *(unsigned char *)(v119 + 60) |= 8u;
                *(unsigned char *)(v119 + 60) |= 0x20u;
                objc_storeStrong((id *)(v119 + 24), v80);
              }
              v82 = [v116 objectForKeyedSubscript:@"showSectionHeader"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v83 = [v82 BOOLValue];
                *(unsigned char *)(v119 + 60) |= 0x20u;
                *(unsigned char *)(v119 + 60) |= 2u;
                *(unsigned char *)(v119 + 56) = v83;
              }

              v84 = [v116 objectForKeyedSubscript:v109];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v85 = v84;
                if ([v85 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_UNKNOWN"])
                {
                  int v86 = 0;
                }
                else if ([v85 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_PRIMARY"])
                {
                  int v86 = 1;
                }
                else if ([v85 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_RELATED_RESULTS"])
                {
                  int v86 = 2;
                }
                else if ([v85 isEqualToString:@"AUTOCOMPLETE_SECTION_CONTENT_TYPE_PARTIAL_MATCHES"])
                {
                  int v86 = 3;
                }
                else
                {
                  int v86 = 0;
                }

LABEL_154:
                *(unsigned char *)(v119 + 60) |= 0x20u;
                *(unsigned char *)(v119 + 60) |= 1u;
                *(_DWORD *)(v119 + 52) = v86;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v86 = [v84 intValue];
                  goto LABEL_154;
                }
              }
            }
            objc_msgSend(v123, "addSuggestionEntryLists:", v119, v109);
          }
          else
          {
            uint64_t v119 = 0;
            objc_msgSend(v123, "addSuggestionEntryLists:", 0, v109);
          }
        }
        uint64_t v21 = v115 + 1;
      }
      while (v115 + 1 != v114);
      uint64_t v87 = [obj countByEnumeratingWithState:&v131 objects:v156 count:16];
      uint64_t v114 = v87;
      if (!v87)
      {
LABEL_162:

        break;
      }
    }
  }

  v88 = [v117 objectForKeyedSubscript:@"suggestionMetadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v89 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v88 options:0];
    [v123 setSuggestionMetadata:v89];
  }
  v90 = [v117 objectForKeyedSubscript:@"namedFeatures"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v91 = v90;
    uint64_t v92 = [v91 countByEnumeratingWithState:&v127 objects:v155 count:16];
    if (v92)
    {
      uint64_t v93 = *(void *)v128;
      do
      {
        for (uint64_t n = 0; n != v92; ++n)
        {
          if (*(void *)v128 != v93) {
            objc_enumerationMutation(v91);
          }
          uint64_t v95 = *(void *)(*((void *)&v127 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v96 = [GEONamedFeature alloc];
            if (a3) {
              uint64_t v97 = [(GEONamedFeature *)v96 initWithJSON:v95];
            }
            else {
              uint64_t v97 = [(GEONamedFeature *)v96 initWithDictionary:v95];
            }
            v98 = (void *)v97;
            objc_msgSend(v123, "addNamedFeatures:", v97, v109);
          }
        }
        uint64_t v92 = [v91 countByEnumeratingWithState:&v127 objects:v155 count:16];
      }
      while (v92);
    }
  }
  v99 = [v117 objectForKeyedSubscript:@"statusCodeInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v100 = v99;
    if ([v100 isEqualToString:@"TIMEOUT"])
    {
      uint64_t v101 = 1;
    }
    else if ([v100 isEqualToString:@"INCOMPLETE_MATCH"])
    {
      uint64_t v101 = 2;
    }
    else if ([v100 isEqualToString:@"LOW_CONFIDENCE"])
    {
      uint64_t v101 = 3;
    }
    else if ([v100 isEqualToString:@"AMBIGUOUS"])
    {
      uint64_t v101 = 4;
    }
    else
    {
      uint64_t v101 = 1;
    }

    goto LABEL_192;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v101 = [v99 intValue];
LABEL_192:
    objc_msgSend(v123, "setStatusCodeInfo:", v101, v109);
  }

  v102 = [v117 objectForKeyedSubscript:@"turnaroundTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v102 doubleValue];
    objc_msgSend(v123, "setTurnaroundTime:");
  }

  if (a3) {
    v103 = @"nearbySectionHeader";
  }
  else {
    v103 = @"nearby_section_header";
  }
  v104 = objc_msgSend(v117, "objectForKeyedSubscript:", v103, v109);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v105 = (void *)[v104 copy];
    [v123 setNearbySectionHeader:v105];
  }
  if (a3) {
    v106 = @"isChainResultSet";
  }
  else {
    v106 = @"is_chain_result_set";
  }
  v107 = [v117 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v123, "setIsChainResultSet:", objc_msgSend(v107, "BOOLValue"));
  }

LABEL_206:
  return v123;
}

- (GEOPlaceSearchResponse)initWithJSON:(id)a3
{
  return (GEOPlaceSearchResponse *)-[GEOPlaceSearchResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_2983;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2984;
    }
    GEOPlaceSearchResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPlaceSearchResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceSearchResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceSearchResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceSearchResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    id v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPlaceSearchResponse *)self readAll:0];
    PBDataWriterWriteInt32Field();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = self->_placeResults;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v30;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v7);
    }

    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = self->_suggestionEntryLists;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v11);
    }

    if (self->_suggestionMetadata) {
      PBDataWriterWriteDataField();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = self->_namedFeatures;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v15);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_nearbySectionHeader) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  -[GEOPlaceSearchResponse _readMapRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = self->_placeResults;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v29 + 1) + 8 * i) hasGreenTeaWithValue:v3])
        {
LABEL_31:
          BOOL v5 = 1;
          goto LABEL_32;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_suggestionEntryLists;
  uint64_t v11 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    uint64_t v14 = &OBJC_IVAR___GEORPCorrectedLabel__featureRegion;
    uint64_t v24 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        if (v16)
        {
          -[GEOSuggestionEntryList _readSuggestionEntries](*(void *)(*((void *)&v25 + 1) + 8 * j));
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v17 = *(id *)(v16 + v14[790]);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v34;
            while (2)
            {
              for (uint64_t k = 0; k != v19; ++k)
              {
                if (*(void *)v34 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * k);
                if (v22)
                {
                  -[GEOSuggestionEntry _readLatlng](*(void *)(*((void *)&v33 + 1) + 8 * k));
                  if ([*(id *)(v22 + 72) hasGreenTeaWithValue:v3])
                  {

                    goto LABEL_31;
                  }
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v13 = v24;
        uint64_t v14 = &OBJC_IVAR___GEORPCorrectedLabel__featureRegion;
      }
      uint64_t v12 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v12);
  }
  BOOL v5 = 0;
LABEL_32:

  return v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v18 = (id *)a3;
  [(GEOPlaceSearchResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 20) = self->_readerMarkPos;
  *((_DWORD *)v18 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v18 + 24) = self->_status;
  if ([(GEOPlaceSearchResponse *)self placeResultsCount])
  {
    [v18 clearPlaceResults];
    unint64_t v4 = [(GEOPlaceSearchResponse *)self placeResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPlaceSearchResponse *)self placeResultAtIndex:i];
        [v18 addPlaceResult:v7];
      }
    }
  }
  if (self->_mapRegion) {
    objc_msgSend(v18, "setMapRegion:");
  }
  if ([(GEOPlaceSearchResponse *)self suggestionEntryListsCount])
  {
    [v18 clearSuggestionEntryLists];
    unint64_t v8 = [(GEOPlaceSearchResponse *)self suggestionEntryListsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPlaceSearchResponse *)self suggestionEntryListsAtIndex:j];
        [v18 addSuggestionEntryLists:v11];
      }
    }
  }
  if (self->_suggestionMetadata) {
    objc_msgSend(v18, "setSuggestionMetadata:");
  }
  if ([(GEOPlaceSearchResponse *)self namedFeaturesCount])
  {
    [v18 clearNamedFeatures];
    unint64_t v12 = [(GEOPlaceSearchResponse *)self namedFeaturesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOPlaceSearchResponse *)self namedFeaturesAtIndex:k];
        [v18 addNamedFeatures:v15];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  id v17 = v18;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v18 + 23) = self->_statusCodeInfo;
    *((_WORD *)v18 + 52) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    v18[9] = *(id *)&self->_turnaroundTime;
    *((_WORD *)v18 + 52) |= 1u;
  }
  if (self->_nearbySectionHeader)
  {
    objc_msgSend(v18, "setNearbySectionHeader:");
    id v17 = v18;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((unsigned char *)v17 + 100) = self->_isChainResultSet;
    *((_WORD *)v17 + 52) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPlaceSearchResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_33;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlaceSearchResponse *)self readAll:0];
  *(_DWORD *)(v5 + 96) = self->_status;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v9 = self->_placeResults;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPlaceResult:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = self->_suggestionEntryLists;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addSuggestionEntryLists:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(NSData *)self->_suggestionMetadata copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v21;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v23 = self->_namedFeatures;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * k), "copyWithZone:", a3, (void)v33);
        [(id)v5 addNamedFeatures:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v24);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_statusCodeInfo;
    *(_WORD *)(v5 + 104) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 72) = self->_turnaroundTime;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  uint64_t v29 = -[NSString copyWithZone:](self->_nearbySectionHeader, "copyWithZone:", a3, (void)v33);
  long long v30 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v29;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 100) = self->_isChainResultSet;
    *(_WORD *)(v5 + 104) |= 4u;
  }
  long long v31 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v31;
LABEL_33:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOPlaceSearchResponse *)self readAll:1];
  [v4 readAll:1];
  if (self->_status != *((_DWORD *)v4 + 24)) {
    goto LABEL_28;
  }
  placeResults = self->_placeResults;
  if ((unint64_t)placeResults | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](placeResults, "isEqual:")) {
      goto LABEL_28;
    }
  }
  mapRegiouint64_t n = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_28;
    }
  }
  suggestionEntryLists = self->_suggestionEntryLists;
  if ((unint64_t)suggestionEntryLists | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](suggestionEntryLists, "isEqual:")) {
      goto LABEL_28;
    }
  }
  suggestionMetadata = self->_suggestionMetadata;
  if ((unint64_t)suggestionMetadata | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](suggestionMetadata, "isEqual:")) {
      goto LABEL_28;
    }
  }
  namedFeatures = self->_namedFeatures;
  if ((unint64_t)namedFeatures | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](namedFeatures, "isEqual:")) {
      goto LABEL_28;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 52);
  if ((flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_statusCodeInfo != *((_DWORD *)v4 + 23)) {
      goto LABEL_28;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_28;
  }
  if (flags)
  {
    if ((v11 & 1) == 0 || self->_turnaroundTime != *((double *)v4 + 9)) {
      goto LABEL_28;
    }
  }
  else if (v11)
  {
    goto LABEL_28;
  }
  nearbySectionHeader = self->_nearbySectionHeader;
  if ((unint64_t)nearbySectionHeader | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](nearbySectionHeader, "isEqual:")) {
      goto LABEL_28;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v11 = *((_WORD *)v4 + 52);
  }
  BOOL v13 = (v11 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) != 0)
    {
      if (self->_isChainResultSet)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)v4 + 100))
      {
        goto LABEL_28;
      }
      BOOL v13 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v13 = 0;
  }
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  [(GEOPlaceSearchResponse *)self readAll:1];
  uint64_t status = self->_status;
  uint64_t v4 = [(NSMutableArray *)self->_placeResults hash];
  unint64_t v5 = [(GEOMapRegion *)self->_mapRegion hash];
  uint64_t v6 = [(NSMutableArray *)self->_suggestionEntryLists hash];
  uint64_t v7 = [(NSData *)self->_suggestionMetadata hash];
  uint64_t v8 = [(NSMutableArray *)self->_namedFeatures hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_statusCodeInfo;
    if (flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v15 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double turnaroundTime = self->_turnaroundTime;
  double v12 = -turnaroundTime;
  if (turnaroundTime >= 0.0) {
    double v12 = self->_turnaroundTime;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_11:
  NSUInteger v16 = [(NSString *)self->_nearbySectionHeader hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v17 = 2654435761 * self->_isChainResultSet;
  }
  else {
    uint64_t v17 = 0;
  }
  return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * status) ^ v10 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  self->_uint64_t status = *((_DWORD *)v4 + 24);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPlaceSearchResponse *)self addPlaceResult:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  mapRegiouint64_t n = self->_mapRegion;
  uint64_t v11 = *((void *)v4 + 3);
  if (mapRegion)
  {
    if (v11) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOPlaceSearchResponse setMapRegion:](self, "setMapRegion:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = *((id *)v4 + 7);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        [(GEOPlaceSearchResponse *)self addSuggestionEntryLists:*(void *)(*((void *)&v27 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }

  if (*((void *)v4 + 8)) {
    -[GEOPlaceSearchResponse setSuggestionMetadata:](self, "setSuggestionMetadata:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = *((id *)v4 + 4);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        -[GEOPlaceSearchResponse addNamedFeatures:](self, "addNamedFeatures:", *(void *)(*((void *)&v23 + 1) + 8 * k), (void)v23);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  __int16 v22 = *((_WORD *)v4 + 52);
  if ((v22 & 2) != 0)
  {
    self->_statusCodeInfo = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v22 = *((_WORD *)v4 + 52);
  }
  if (v22)
  {
    self->_double turnaroundTime = *((double *)v4 + 9);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[GEOPlaceSearchResponse setNearbySectionHeader:](self, "setNearbySectionHeader:");
  }
  if ((*((_WORD *)v4 + 52) & 4) != 0)
  {
    self->_isChainResultSet = *((unsigned char *)v4 + 100);
    *(_WORD *)&self->_flags |= 4u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceSearchResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2988);
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
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x408u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPlaceSearchResponse *)self readAll:0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v7 = self->_placeResults;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v45;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v44 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v58 count:16];
      }
      while (v9);
    }

    [(GEOMapRegion *)self->_mapRegion clearUnknownFields:1];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v32 = self;
    obuint64_t j = self->_suggestionEntryLists;
    uint64_t v35 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v57 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v41;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * v12);
          if (v13)
          {
            os_unfair_lock_lock_with_options();
            *(unsigned char *)(v13 + 60) |= 4u;
            *(unsigned char *)(v13 + 60) |= 0x20u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 48));
            uint64_t v14 = *(void **)(v13 + 16);
            *(void *)(v13 + 16) = 0;

            -[GEOSuggestionEntryList readAll:](v13, 0);
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v15 = *(id *)(v13 + 32);
            uint64_t v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v59, 16, v32);
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v49;
              do
              {
                uint64_t v19 = 0;
                do
                {
                  if (*(void *)v49 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v48 + 1) + 8 * v19);
                  if (v20)
                  {
                    os_unfair_lock_lock_with_options();
                    *(_WORD *)(v20 + 116) |= 1u;
                    *(_WORD *)(v20 + 116) |= 0x200u;
                    os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 112));
                    uint64_t v21 = *(void **)(v20 + 16);
                    *(void *)(v20 + 16) = 0;

                    -[GEOSuggestionEntry readAll:](v20, 0);
                    [*(id *)(v20 + 72) clearUnknownFields:1];
                    long long v54 = 0u;
                    long long v55 = 0u;
                    long long v52 = 0u;
                    long long v53 = 0u;
                    id v22 = *(id *)(v20 + 80);
                    uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v60 count:16];
                    if (v23)
                    {
                      uint64_t v24 = v23;
                      uint64_t v25 = *(void *)v53;
                      do
                      {
                        uint64_t v26 = 0;
                        do
                        {
                          if (*(void *)v53 != v25) {
                            objc_enumerationMutation(v22);
                          }
                          [*(id *)(*((void *)&v52 + 1) + 8 * v26++) clearUnknownFields:1];
                        }
                        while (v24 != v26);
                        uint64_t v24 = [v22 countByEnumeratingWithState:&v52 objects:v60 count:16];
                      }
                      while (v24);
                    }
                  }
                  ++v19;
                }
                while (v19 != v17);
                uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v59 count:16];
              }
              while (v17);
            }
          }
          ++v12;
        }
        while (v12 != v35);
        uint64_t v35 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v57 count:16];
      }
      while (v35);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v27 = v32->_namedFeatures;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v56 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v37;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v31++), "clearUnknownFields:", 1, v32);
        }
        while (v29 != v31);
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v56 count:16];
      }
      while (v29);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionEntryLists, 0);
  objc_storeStrong((id *)&self->_placeResults, 0);
  objc_storeStrong((id *)&self->_nearbySectionHeader, 0);
  objc_storeStrong((id *)&self->_namedFeatures, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end