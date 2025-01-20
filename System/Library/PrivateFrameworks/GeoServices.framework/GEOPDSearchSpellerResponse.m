@interface GEOPDSearchSpellerResponse
+ (BOOL)isValid:(id)a3;
+ (Class)spellSuggestionType;
+ (Class)tokenCandidatesType;
- (BOOL)hasDebugResponse;
- (BOOL)hasDecileId;
- (BOOL)hasIsFromDLCacheModel;
- (BOOL)hasIsFromDLRuntimeModel;
- (BOOL)hasLatencyMs;
- (BOOL)hasMisspellScore;
- (BOOL)hasModelNumberMajor;
- (BOOL)hasModelNumberMinor;
- (BOOL)hasRankerModelType;
- (BOOL)hasResultStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromDLCacheModel;
- (BOOL)isFromDLRuntimeModel;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchSpellerResponse)init;
- (GEOPDSearchSpellerResponse)initWithData:(id)a3;
- (GEOPDSearchSpellerResponse)initWithDictionary:(id)a3;
- (GEOPDSearchSpellerResponse)initWithJSON:(id)a3;
- (NSMutableArray)spellSuggestions;
- (NSMutableArray)tokenCandidates;
- (NSString)debugResponse;
- (double)latencyMs;
- (double)misspellScore;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)rankerModelTypeAsString:(int)a3;
- (id)resultStatusAsString:(int)a3;
- (id)spellSuggestionAtIndex:(unint64_t)a3;
- (id)tokenCandidatesAtIndex:(unint64_t)a3;
- (int)StringAsRankerModelType:(id)a3;
- (int)StringAsResultStatus:(id)a3;
- (int)rankerModelType;
- (int)resultStatus;
- (unint64_t)decileId;
- (unint64_t)hash;
- (unint64_t)spellSuggestionsCount;
- (unint64_t)tokenCandidatesCount;
- (unsigned)modelNumberMajor;
- (unsigned)modelNumberMinor;
- (void)_addNoFlagsSpellSuggestion:(uint64_t)a1;
- (void)_addNoFlagsTokenCandidates:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDebugResponse;
- (void)_readSpellSuggestions;
- (void)_readTokenCandidates;
- (void)addSpellSuggestion:(id)a3;
- (void)addTokenCandidates:(id)a3;
- (void)clearSpellSuggestions;
- (void)clearTokenCandidates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDebugResponse:(id)a3;
- (void)setDecileId:(unint64_t)a3;
- (void)setHasDecileId:(BOOL)a3;
- (void)setHasIsFromDLCacheModel:(BOOL)a3;
- (void)setHasIsFromDLRuntimeModel:(BOOL)a3;
- (void)setHasLatencyMs:(BOOL)a3;
- (void)setHasMisspellScore:(BOOL)a3;
- (void)setHasModelNumberMajor:(BOOL)a3;
- (void)setHasModelNumberMinor:(BOOL)a3;
- (void)setHasRankerModelType:(BOOL)a3;
- (void)setHasResultStatus:(BOOL)a3;
- (void)setIsFromDLCacheModel:(BOOL)a3;
- (void)setIsFromDLRuntimeModel:(BOOL)a3;
- (void)setLatencyMs:(double)a3;
- (void)setMisspellScore:(double)a3;
- (void)setModelNumberMajor:(unsigned int)a3;
- (void)setModelNumberMinor:(unsigned int)a3;
- (void)setRankerModelType:(int)a3;
- (void)setResultStatus:(int)a3;
- (void)setSpellSuggestions:(id)a3;
- (void)setTokenCandidates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchSpellerResponse

- (GEOPDSearchSpellerResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSpellerResponse;
  v2 = [(GEOPDSearchSpellerResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSpellerResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSpellerResponse;
  v3 = [(GEOPDSearchSpellerResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSpellSuggestions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpellSuggestions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)spellSuggestions
{
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  spellSuggestions = self->_spellSuggestions;

  return spellSuggestions;
}

- (void)setSpellSuggestions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  spellSuggestions = self->_spellSuggestions;
  self->_spellSuggestions = v4;
}

- (void)clearSpellSuggestions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  spellSuggestions = self->_spellSuggestions;

  [(NSMutableArray *)spellSuggestions removeAllObjects];
}

- (void)addSpellSuggestion:(id)a3
{
  id v4 = a3;
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  -[GEOPDSearchSpellerResponse _addNoFlagsSpellSuggestion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsSpellSuggestion:(uint64_t)a1
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

- (unint64_t)spellSuggestionsCount
{
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  spellSuggestions = self->_spellSuggestions;

  return [(NSMutableArray *)spellSuggestions count];
}

- (id)spellSuggestionAtIndex:(unint64_t)a3
{
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  spellSuggestions = self->_spellSuggestions;

  return (id)[(NSMutableArray *)spellSuggestions objectAtIndex:a3];
}

+ (Class)spellSuggestionType
{
  return (Class)objc_opt_class();
}

- (int)resultStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_resultStatus;
  }
  else {
    return 1;
  }
}

- (void)setResultStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  self->_resultStatus = a3;
}

- (void)setHasResultStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4160;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasResultStatus
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)resultStatusAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53EA388[a3 - 1];
  }

  return v3;
}

- (int)StringAsResultStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_IN_WHITE_LIST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPELL_CORRECTION_NOT_ATTEMPTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_SUGGESTIONS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPELL_CORRECTION_NOT_REQUIRED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SPELL_CORRECTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NOT_PROCESSED"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (unint64_t)decileId
{
  return self->_decileId;
}

- (void)setDecileId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_decileId = a3;
}

- (void)setHasDecileId:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasDecileId
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)latencyMs
{
  return self->_latencyMs;
}

- (void)setLatencyMs:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_latencyMs = a3;
}

- (void)setHasLatencyMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLatencyMs
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readTokenCandidates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenCandidates_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)tokenCandidates
{
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  tokenCandidates = self->_tokenCandidates;

  return tokenCandidates;
}

- (void)setTokenCandidates:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  tokenCandidates = self->_tokenCandidates;
  self->_tokenCandidates = v4;
}

- (void)clearTokenCandidates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  tokenCandidates = self->_tokenCandidates;

  [(NSMutableArray *)tokenCandidates removeAllObjects];
}

- (void)addTokenCandidates:(id)a3
{
  id v4 = a3;
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  -[GEOPDSearchSpellerResponse _addNoFlagsTokenCandidates:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsTokenCandidates:(uint64_t)a1
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

- (unint64_t)tokenCandidatesCount
{
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  tokenCandidates = self->_tokenCandidates;

  return [(NSMutableArray *)tokenCandidates count];
}

- (id)tokenCandidatesAtIndex:(unint64_t)a3
{
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  tokenCandidates = self->_tokenCandidates;

  return (id)[(NSMutableArray *)tokenCandidates objectAtIndex:a3];
}

+ (Class)tokenCandidatesType
{
  return (Class)objc_opt_class();
}

- (double)misspellScore
{
  return self->_misspellScore;
}

- (void)setMisspellScore:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_misspellScore = a3;
}

- (void)setHasMisspellScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMisspellScore
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readDebugResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDebugResponse
{
  return self->_debugResponse != 0;
}

- (NSString)debugResponse
{
  -[GEOPDSearchSpellerResponse _readDebugResponse]((uint64_t)self);
  debugResponse = self->_debugResponse;

  return debugResponse;
}

- (void)setDebugResponse:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_debugResponse, a3);
}

- (int)rankerModelType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_rankerModelType;
  }
  else {
    return 0;
  }
}

- (void)setRankerModelType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_rankerModelType = a3;
}

- (void)setHasRankerModelType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4128;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRankerModelType
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)rankerModelTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53EA3B8[a3];
  }

  return v3;
}

- (int)StringAsRankerModelType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MODEL_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODEL_TYPE_XGBOOST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODEL_TYPE_DL_SEQ2SEQ"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isFromDLCacheModel
{
  return self->_isFromDLCacheModel;
}

- (void)setIsFromDLCacheModel:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  self->_isFromDLCacheModel = a3;
}

- (void)setHasIsFromDLCacheModel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4224;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasIsFromDLCacheModel
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)isFromDLRuntimeModel
{
  return self->_isFromDLRuntimeModel;
}

- (void)setIsFromDLRuntimeModel:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  self->_isFromDLRuntimeModel = a3;
}

- (void)setHasIsFromDLRuntimeModel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4352;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasIsFromDLRuntimeModel
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)modelNumberMajor
{
  return self->_modelNumberMajor;
}

- (void)setModelNumberMajor:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_modelNumberMajor = a3;
}

- (void)setHasModelNumberMajor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasModelNumberMajor
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)modelNumberMinor
{
  return self->_modelNumberMinor;
}

- (void)setModelNumberMinor:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_modelNumberMinor = a3;
}

- (void)setHasModelNumberMinor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4112;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasModelNumberMinor
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSpellerResponse;
  int v4 = [(GEOPDSearchSpellerResponse *)&v8 description];
  id v5 = [(GEOPDSearchSpellerResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSpellerResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_74;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 48) count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v48 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = [v11 dictionaryRepresentation];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v8);
    }

    if (a2) {
      v13 = @"spellSuggestion";
    }
    else {
      v13 = @"spell_suggestion";
    }
    [v4 setObject:v5 forKey:v13];
  }
  __int16 v14 = *(_WORD *)(a1 + 96);
  if ((v14 & 0x40) != 0)
  {
    unsigned int v15 = *(_DWORD *)(a1 + 88) - 1;
    if (v15 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 88));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E53EA388[v15];
    }
    if (a2) {
      v17 = @"resultStatus";
    }
    else {
      v17 = @"result_status";
    }
    [v4 setObject:v16 forKey:v17];

    __int16 v14 = *(_WORD *)(a1 + 96);
  }
  if (v14)
  {
    v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    if (a2) {
      v19 = @"decileId";
    }
    else {
      v19 = @"decile_id";
    }
    [v4 setObject:v18 forKey:v19];

    __int16 v14 = *(_WORD *)(a1 + 96);
  }
  if ((v14 & 2) != 0)
  {
    v20 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v21 = @"latencyMs";
    }
    else {
      v21 = @"latency_ms";
    }
    [v4 setObject:v20 forKey:v21];
  }
  if ([*(id *)(a1 + 56) count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v23 = *(id *)(a1 + 56);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          if (a2) {
            [v28 jsonRepresentation];
          }
          else {
          v29 = [v28 dictionaryRepresentation];
          }
          [v22 addObject:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v25);
    }

    if (a2) {
      v30 = @"tokenCandidates";
    }
    else {
      v30 = @"token_candidates";
    }
    [v4 setObject:v22 forKey:v30];
  }
  if ((*(_WORD *)(a1 + 96) & 4) != 0)
  {
    v31 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    if (a2) {
      v32 = @"misspellScore";
    }
    else {
      v32 = @"misspell_score";
    }
    [v4 setObject:v31 forKey:v32];
  }
  v33 = [(id)a1 debugResponse];
  if (v33)
  {
    if (a2) {
      v34 = @"debugResponse";
    }
    else {
      v34 = @"debug_response";
    }
    [v4 setObject:v33 forKey:v34];
  }

  __int16 v35 = *(_WORD *)(a1 + 96);
  if ((v35 & 0x20) != 0)
  {
    uint64_t v36 = *(int *)(a1 + 84);
    if (v36 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_1E53EA3B8[v36];
    }
    [v4 setObject:v37 forKey:@"rankerModelType"];

    __int16 v35 = *(_WORD *)(a1 + 96);
    if ((v35 & 0x80) == 0)
    {
LABEL_62:
      if ((v35 & 0x100) == 0) {
        goto LABEL_63;
      }
      goto LABEL_71;
    }
  }
  else if ((v35 & 0x80) == 0)
  {
    goto LABEL_62;
  }
  v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
  [v4 setObject:v38 forKey:@"isFromDLCacheModel"];

  __int16 v35 = *(_WORD *)(a1 + 96);
  if ((v35 & 0x100) == 0)
  {
LABEL_63:
    if ((v35 & 8) == 0) {
      goto LABEL_64;
    }
LABEL_72:
    v40 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    [v4 setObject:v40 forKey:@"modelNumberMajor"];

    if ((*(_WORD *)(a1 + 96) & 0x10) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_71:
  v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 93)];
  [v4 setObject:v39 forKey:@"isFromDLRuntimeModel"];

  __int16 v35 = *(_WORD *)(a1 + 96);
  if ((v35 & 8) != 0) {
    goto LABEL_72;
  }
LABEL_64:
  if ((v35 & 0x10) != 0)
  {
LABEL_73:
    v41 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
    [v4 setObject:v41 forKey:@"modelNumberMinor"];
  }
LABEL_74:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSpellerResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDSearchSpellerResponse)initWithDictionary:(id)a3
{
  return (GEOPDSearchSpellerResponse *)-[GEOPDSearchSpellerResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_101;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_101;
  }
  if (a3) {
    id v6 = @"spellSuggestion";
  }
  else {
    id v6 = @"spell_suggestion";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  id v49 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v14 = [GEOPDSearchSpellSuggestion alloc];
            if (v14) {
              unsigned int v15 = (void *)-[GEOPDSearchSpellSuggestion _initWithDictionary:isJSON:]((uint64_t)v14, v13, a3);
            }
            else {
              unsigned int v15 = 0;
            }
            [a1 addSpellSuggestion:v15];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v16 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
        uint64_t v10 = v16;
      }
      while (v16);
    }

    id v5 = v49;
  }

  if (a3) {
    v17 = @"resultStatus";
  }
  else {
    v17 = @"result_status";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"NOT_IN_WHITE_LIST"])
    {
      uint64_t v20 = 1;
    }
    else if ([v19 isEqualToString:@"SPELL_CORRECTION_NOT_ATTEMPTED"])
    {
      uint64_t v20 = 2;
    }
    else if ([v19 isEqualToString:@"NO_SUGGESTIONS"])
    {
      uint64_t v20 = 3;
    }
    else if ([v19 isEqualToString:@"SPELL_CORRECTION_NOT_REQUIRED"])
    {
      uint64_t v20 = 4;
    }
    else if ([v19 isEqualToString:@"SPELL_CORRECTED"])
    {
      uint64_t v20 = 5;
    }
    else if ([v19 isEqualToString:@"NOT_PROCESSED"])
    {
      uint64_t v20 = 6;
    }
    else
    {
      uint64_t v20 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_42;
    }
    uint64_t v20 = [v18 intValue];
  }
  [a1 setResultStatus:v20];
LABEL_42:

  if (a3) {
    v21 = @"decileId";
  }
  else {
    v21 = @"decile_id";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDecileId:", objc_msgSend(v22, "unsignedLongLongValue"));
  }

  if (a3) {
    id v23 = @"latencyMs";
  }
  else {
    id v23 = @"latency_ms";
  }
  uint64_t v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v24 doubleValue];
    objc_msgSend(a1, "setLatencyMs:");
  }

  if (a3) {
    uint64_t v25 = @"tokenCandidates";
  }
  else {
    uint64_t v25 = @"token_candidates";
  }
  uint64_t v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v27 = v26;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v51;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v50 + 1) + 8 * v31);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v33 = [GEOPDSearchTokenCandidates alloc];
            if (v33) {
              v34 = -[GEOPDSearchTokenCandidates _initWithDictionary:isJSON:](v33, v32, a3);
            }
            else {
              v34 = 0;
            }
            [a1 addTokenCandidates:v34];
          }
          ++v31;
        }
        while (v29 != v31);
        uint64_t v35 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
        uint64_t v29 = v35;
      }
      while (v35);
    }

    id v5 = v49;
  }

  if (a3) {
    uint64_t v36 = @"misspellScore";
  }
  else {
    uint64_t v36 = @"misspell_score";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v37 doubleValue];
    objc_msgSend(a1, "setMisspellScore:");
  }

  if (a3) {
    v38 = @"debugResponse";
  }
  else {
    v38 = @"debug_response";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v40 = (void *)[v39 copy];
    [a1 setDebugResponse:v40];
  }
  v41 = [v5 objectForKeyedSubscript:@"rankerModelType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = v41;
    if ([v42 isEqualToString:@"MODEL_TYPE_UNKNOWN"])
    {
      uint64_t v43 = 0;
    }
    else if ([v42 isEqualToString:@"MODEL_TYPE_XGBOOST"])
    {
      uint64_t v43 = 1;
    }
    else if ([v42 isEqualToString:@"MODEL_TYPE_DL_SEQ2SEQ"])
    {
      uint64_t v43 = 2;
    }
    else
    {
      uint64_t v43 = 0;
    }

    goto LABEL_91;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v43 = [v41 intValue];
LABEL_91:
    [a1 setRankerModelType:v43];
  }

  long long v44 = [v5 objectForKeyedSubscript:@"isFromDLCacheModel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsFromDLCacheModel:", objc_msgSend(v44, "BOOLValue"));
  }

  long long v45 = [v5 objectForKeyedSubscript:@"isFromDLRuntimeModel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsFromDLRuntimeModel:", objc_msgSend(v45, "BOOLValue"));
  }

  long long v46 = [v5 objectForKeyedSubscript:@"modelNumberMajor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setModelNumberMajor:", objc_msgSend(v46, "unsignedIntValue"));
  }

  long long v47 = [v5 objectForKeyedSubscript:@"modelNumberMinor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setModelNumberMinor:", objc_msgSend(v47, "unsignedIntValue"));
  }

LABEL_101:
  return a1;
}

- (GEOPDSearchSpellerResponse)initWithJSON:(id)a3
{
  return (GEOPDSearchSpellerResponse *)-[GEOPDSearchSpellerResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_287;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_288;
    }
    GEOPDSearchSpellerResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = self->_spellSuggestions;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        if (!--v10)
        {
          uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v12 = self->_tokenCandidates;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          -[GEOPDSearchTokenCandidates readAll:](*(void *)(*((void *)&v16 + 1) + 8 * i), 1);
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  int v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  id v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v6;
          int v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      uint64_t v16 = *v6;
      int v17 = *((unsigned __int8 *)a3 + v16);
      if (*((unsigned char *)a3 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v18 = v10 & 7;
      if (v17 || v18 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if (v18 == 2 && PBReaderPlaceMark() && GEOPDSearchSpellSuggestionIsValid((char *)a3)) {
            goto LABEL_46;
          }
          goto LABEL_95;
        case 2u:
          if ((v10 & 7) != 0) {
            goto LABEL_95;
          }
          unsigned int v23 = 0;
          while (1)
          {
            uint64_t v24 = *v4;
            uint64_t v25 = *(void *)((char *)a3 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_90;
            }
            int v27 = *(char *)(*(void *)((char *)a3 + *v7) + v25);
            *(void *)((char *)a3 + v24) = v26;
            if (v27 < 0)
            {
              BOOL v28 = v23++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_92;
          }
        case 3u:
          if ((v10 & 7) != 0) {
            goto LABEL_95;
          }
          unsigned int v29 = 0;
          while (1)
          {
            uint64_t v30 = *v4;
            uint64_t v31 = *(void *)((char *)a3 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_90;
            }
            int v33 = *(char *)(*(void *)((char *)a3 + *v7) + v31);
            *(void *)((char *)a3 + v30) = v32;
            if (v33 < 0)
            {
              BOOL v28 = v29++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_92;
          }
        case 4u:
        case 6u:
          if (v18 != 1) {
            goto LABEL_95;
          }
          uint64_t v20 = *v4;
          unint64_t v21 = *(void *)((char *)a3 + v20);
          if (v21 > 0xFFFFFFFFFFFFFFF7) {
            goto LABEL_91;
          }
          unint64_t v22 = v21 + 8;
          if (v22 > *(void *)((char *)a3 + *v5)) {
            goto LABEL_91;
          }
          *(void *)((char *)a3 + v20) = v22;
          continue;
        case 5u:
          if (v18 != 2 || !PBReaderPlaceMark() || !GEOPDSearchTokenCandidatesIsValid((char *)a3)) {
            goto LABEL_95;
          }
LABEL_46:
          PBReaderRecallMark();
          continue;
        case 7u:
          if (v18 == 2) {
            goto LABEL_48;
          }
          goto LABEL_95;
        case 8u:
          if ((v10 & 7) != 0) {
            goto LABEL_95;
          }
          unsigned int v34 = 0;
          while (1)
          {
            uint64_t v35 = *v4;
            uint64_t v36 = *(void *)((char *)a3 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_90;
            }
            int v38 = *(char *)(*(void *)((char *)a3 + *v7) + v36);
            *(void *)((char *)a3 + v35) = v37;
            if (v38 < 0)
            {
              BOOL v28 = v34++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_92;
          }
        case 9u:
          if ((v10 & 7) != 0) {
            goto LABEL_95;
          }
          unsigned int v39 = 0;
          while (1)
          {
            uint64_t v40 = *v4;
            uint64_t v41 = *(void *)((char *)a3 + v40);
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_90;
            }
            int v43 = *(char *)(*(void *)((char *)a3 + *v7) + v41);
            *(void *)((char *)a3 + v40) = v42;
            if (v43 < 0)
            {
              BOOL v28 = v39++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_92;
          }
        case 0xAu:
          if ((v10 & 7) != 0) {
            goto LABEL_95;
          }
          unsigned int v44 = 0;
          while (1)
          {
            uint64_t v45 = *v4;
            uint64_t v46 = *(void *)((char *)a3 + v45);
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_90;
            }
            int v48 = *(char *)(*(void *)((char *)a3 + *v7) + v46);
            *(void *)((char *)a3 + v45) = v47;
            if (v48 < 0)
            {
              BOOL v28 = v44++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_92;
          }
        case 0xBu:
          if ((v10 & 7) != 0) {
            goto LABEL_95;
          }
          unsigned int v49 = 0;
          while (1)
          {
            uint64_t v50 = *v4;
            uint64_t v51 = *(void *)((char *)a3 + v50);
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_90;
            }
            int v53 = *(char *)(*(void *)((char *)a3 + *v7) + v51);
            *(void *)((char *)a3 + v50) = v52;
            if (v53 < 0)
            {
              BOOL v28 = v49++ > 8;
              if (!v28) {
                continue;
              }
            }
            goto LABEL_92;
          }
        case 0xCu:
          if ((v10 & 7) != 0) {
            goto LABEL_95;
          }
          unsigned int v54 = 0;
          break;
        default:
LABEL_48:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_95:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        uint64_t v55 = *v4;
        uint64_t v56 = *(void *)((char *)a3 + v55);
        unint64_t v57 = v56 + 1;
        if (v56 == -1 || v57 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        int v58 = *(char *)(*(void *)((char *)a3 + *v7) + v56);
        *(void *)((char *)a3 + v55) = v57;
        if (v58 < 0)
        {
          BOOL v28 = v54++ > 8;
          if (!v28) {
            continue;
          }
        }
        goto LABEL_92;
      }
LABEL_90:
      uint64_t v16 = *v6;
LABEL_91:
      *((unsigned char *)a3 + v16) = 1;
LABEL_92:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v59 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v59;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSpellerResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1E00) == 0))
  {
    uint64_t v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    int v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDSearchSpellerResponse *)self readAll:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = self->_spellSuggestions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = self->_tokenCandidates;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_debugResponse) {
      PBDataWriterWriteStringField();
    }
    __int16 v15 = (__int16)self->_flags;
    if ((v15 & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 v15 = (__int16)self->_flags;
    }
    if ((v15 & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  __int16 v15 = (id *)a3;
  [(GEOPDSearchSpellerResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 16) = self->_readerMarkPos;
  *((_DWORD *)v15 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDSearchSpellerResponse *)self spellSuggestionsCount])
  {
    [v15 clearSpellSuggestions];
    unint64_t v4 = [(GEOPDSearchSpellerResponse *)self spellSuggestionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDSearchSpellerResponse *)self spellSuggestionAtIndex:i];
        [v15 addSpellSuggestion:v7];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
LABEL_27:
    v15[3] = self->_decileId;
    *((_WORD *)v15 + 48) |= 1u;
    if ((*(_WORD *)&self->_flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *((_DWORD *)v15 + 22) = self->_resultStatus;
  *((_WORD *)v15 + 48) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_27;
  }
LABEL_7:
  if ((flags & 2) != 0)
  {
LABEL_8:
    v15[4] = *(id *)&self->_latencyMs;
    *((_WORD *)v15 + 48) |= 2u;
  }
LABEL_9:
  if ([(GEOPDSearchSpellerResponse *)self tokenCandidatesCount])
  {
    [v15 clearTokenCandidates];
    unint64_t v9 = [(GEOPDSearchSpellerResponse *)self tokenCandidatesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOPDSearchSpellerResponse *)self tokenCandidatesAtIndex:j];
        [v15 addTokenCandidates:v12];
      }
    }
  }
  uint64_t v13 = v15;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    v15[5] = *(id *)&self->_misspellScore;
    *((_WORD *)v15 + 48) |= 4u;
  }
  if (self->_debugResponse)
  {
    objc_msgSend(v15, "setDebugResponse:");
    uint64_t v13 = v15;
  }
  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 0x20) != 0)
  {
    *((_DWORD *)v13 + 21) = self->_rankerModelType;
    *((_WORD *)v13 + 48) |= 0x20u;
    __int16 v14 = (__int16)self->_flags;
    if ((v14 & 0x80) == 0)
    {
LABEL_19:
      if ((v14 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_31;
    }
  }
  else if ((v14 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  *((unsigned char *)v13 + 92) = self->_isFromDLCacheModel;
  *((_WORD *)v13 + 48) |= 0x80u;
  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 0x100) == 0)
  {
LABEL_20:
    if ((v14 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((unsigned char *)v13 + 93) = self->_isFromDLRuntimeModel;
  *((_WORD *)v13 + 48) |= 0x100u;
  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 8) == 0)
  {
LABEL_21:
    if ((v14 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_32:
  *((_DWORD *)v13 + 19) = self->_modelNumberMajor;
  *((_WORD *)v13 + 48) |= 8u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_22:
    *((_DWORD *)v13 + 20) = self->_modelNumberMinor;
    *((_WORD *)v13 + 48) |= 0x10u;
  }
LABEL_23:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDSearchSpellerResponse *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    unint64_t v9 = self->_spellSuggestions;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyWithZone:a3];
          [(id)v5 addSpellSuggestion:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) != 0)
    {
      *(_DWORD *)(v5 + 88) = self->_resultStatus;
      *(_WORD *)(v5 + 96) |= 0x40u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 2) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_14;
    }
    *(void *)(v5 + 24) = self->_decileId;
    *(_WORD *)(v5 + 96) |= 1u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
    {
LABEL_16:
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      __int16 v15 = self->_tokenCandidates;
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            long long v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (void)v24);
            [(id)v5 addTokenCandidates:v19];
          }
          uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v16);
      }

      if ((*(_WORD *)&self->_flags & 4) != 0)
      {
        *(double *)(v5 + 40) = self->_misspellScore;
        *(_WORD *)(v5 + 96) |= 4u;
      }
      uint64_t v20 = -[NSString copyWithZone:](self->_debugResponse, "copyWithZone:", a3, (void)v24);
      long long v21 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v20;

      __int16 v22 = (__int16)self->_flags;
      if ((v22 & 0x20) != 0)
      {
        *(_DWORD *)(v5 + 84) = self->_rankerModelType;
        *(_WORD *)(v5 + 96) |= 0x20u;
        __int16 v22 = (__int16)self->_flags;
        if ((v22 & 0x80) == 0)
        {
LABEL_27:
          if ((v22 & 0x100) == 0) {
            goto LABEL_28;
          }
          goto LABEL_37;
        }
      }
      else if ((v22 & 0x80) == 0)
      {
        goto LABEL_27;
      }
      *(unsigned char *)(v5 + 92) = self->_isFromDLCacheModel;
      *(_WORD *)(v5 + 96) |= 0x80u;
      __int16 v22 = (__int16)self->_flags;
      if ((v22 & 0x100) == 0)
      {
LABEL_28:
        if ((v22 & 8) == 0) {
          goto LABEL_29;
        }
        goto LABEL_38;
      }
LABEL_37:
      *(unsigned char *)(v5 + 93) = self->_isFromDLRuntimeModel;
      *(_WORD *)(v5 + 96) |= 0x100u;
      __int16 v22 = (__int16)self->_flags;
      if ((v22 & 8) == 0)
      {
LABEL_29:
        if ((v22 & 0x10) == 0) {
          return (id)v5;
        }
LABEL_30:
        *(_DWORD *)(v5 + 80) = self->_modelNumberMinor;
        *(_WORD *)(v5 + 96) |= 0x10u;
        return (id)v5;
      }
LABEL_38:
      *(_DWORD *)(v5 + 76) = self->_modelNumberMajor;
      *(_WORD *)(v5 + 96) |= 8u;
      if ((*(_WORD *)&self->_flags & 0x10) == 0) {
        return (id)v5;
      }
      goto LABEL_30;
    }
LABEL_15:
    *(double *)(v5 + 32) = self->_latencyMs;
    *(_WORD *)(v5 + 96) |= 2u;
    goto LABEL_16;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchSpellerResponseReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  [(GEOPDSearchSpellerResponse *)self readAll:1];
  [v4 readAll:1];
  spellSuggestions = self->_spellSuggestions;
  if ((unint64_t)spellSuggestions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](spellSuggestions, "isEqual:")) {
      goto LABEL_61;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 48);
  if ((flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_resultStatus != *((_DWORD *)v4 + 22)) {
      goto LABEL_61;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_61;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_decileId != *((void *)v4 + 3)) {
      goto LABEL_61;
    }
  }
  else if (v7)
  {
    goto LABEL_61;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_latencyMs != *((double *)v4 + 4)) {
      goto LABEL_61;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_61;
  }
  tokenCandidates = self->_tokenCandidates;
  if ((unint64_t)tokenCandidates | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](tokenCandidates, "isEqual:")) {
      goto LABEL_61;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 48);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_misspellScore != *((double *)v4 + 5)) {
      goto LABEL_61;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_61;
  }
  debugResponse = self->_debugResponse;
  if ((unint64_t)debugResponse | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](debugResponse, "isEqual:")) {
      goto LABEL_61;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 48);
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_rankerModelType != *((_DWORD *)v4 + 21)) {
      goto LABEL_61;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_61;
    }
    if (self->_isFromDLCacheModel)
    {
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 92))
    {
      goto LABEL_61;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v7 & 0x100) != 0)
    {
      if (self->_isFromDLRuntimeModel)
      {
        if (!*((unsigned char *)v4 + 93)) {
          goto LABEL_61;
        }
        goto LABEL_51;
      }
      if (!*((unsigned char *)v4 + 93)) {
        goto LABEL_51;
      }
    }
LABEL_61:
    BOOL v10 = 0;
    goto LABEL_62;
  }
  if ((v7 & 0x100) != 0) {
    goto LABEL_61;
  }
LABEL_51:
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_modelNumberMajor != *((_DWORD *)v4 + 19)) {
      goto LABEL_61;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_modelNumberMinor != *((_DWORD *)v4 + 20)) {
      goto LABEL_61;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v7 & 0x10) == 0;
  }
LABEL_62:

  return v10;
}

- (unint64_t)hash
{
  [(GEOPDSearchSpellerResponse *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_spellSuggestions hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
    uint64_t v5 = 0;
    if (flags) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v6 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = 2654435761 * self->_resultStatus;
  if ((flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_decileId;
  if ((flags & 2) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double latencyMs = self->_latencyMs;
  double v8 = -latencyMs;
  if (latencyMs >= 0.0) {
    double v8 = self->_latencyMs;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  uint64_t v12 = [(NSMutableArray *)self->_tokenCandidates hash];
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    double misspellScore = self->_misspellScore;
    double v15 = -misspellScore;
    if (misspellScore >= 0.0) {
      double v15 = self->_misspellScore;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  NSUInteger v18 = [(NSString *)self->_debugResponse hash];
  __int16 v19 = (__int16)self->_flags;
  if ((v19 & 0x20) != 0)
  {
    uint64_t v20 = 2654435761 * self->_rankerModelType;
    if ((v19 & 0x80) != 0)
    {
LABEL_23:
      uint64_t v21 = 2654435761 * self->_isFromDLCacheModel;
      if ((*(_WORD *)&self->_flags & 0x100) != 0) {
        goto LABEL_24;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((v19 & 0x80) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_24:
    uint64_t v22 = 2654435761 * self->_isFromDLRuntimeModel;
    if ((v19 & 8) != 0) {
      goto LABEL_25;
    }
LABEL_30:
    uint64_t v23 = 0;
    if ((v19 & 0x10) != 0) {
      goto LABEL_26;
    }
LABEL_31:
    uint64_t v24 = 0;
    return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_29:
  uint64_t v22 = 0;
  if ((v19 & 8) == 0) {
    goto LABEL_30;
  }
LABEL_25:
  uint64_t v23 = 2654435761 * self->_modelNumberMajor;
  if ((v19 & 0x10) == 0) {
    goto LABEL_31;
  }
LABEL_26:
  uint64_t v24 = 2654435761 * self->_modelNumberMinor;
  return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDSearchSpellerResponse *)self addSpellSuggestion:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 48);
  if ((v10 & 0x40) != 0)
  {
    self->_resultStatus = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 0x40u;
    __int16 v10 = *((_WORD *)v4 + 48);
    if ((v10 & 1) == 0)
    {
LABEL_10:
      if ((v10 & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_10;
  }
  self->_decileId = *((void *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 48) & 2) != 0)
  {
LABEL_11:
    self->_double latencyMs = *((double *)v4 + 4);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_12:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v4 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEOPDSearchSpellerResponse addTokenCandidates:](self, "addTokenCandidates:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  if ((*((_WORD *)v4 + 48) & 4) != 0)
  {
    self->_double misspellScore = *((double *)v4 + 5);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 2)) {
    -[GEOPDSearchSpellerResponse setDebugResponse:](self, "setDebugResponse:");
  }
  __int16 v16 = *((_WORD *)v4 + 48);
  if ((v16 & 0x20) != 0)
  {
    self->_rankerModelType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 0x20u;
    __int16 v16 = *((_WORD *)v4 + 48);
    if ((v16 & 0x80) == 0)
    {
LABEL_25:
      if ((v16 & 0x100) == 0) {
        goto LABEL_26;
      }
      goto LABEL_35;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_25;
  }
  self->_isFromDLCacheModel = *((unsigned char *)v4 + 92);
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v16 = *((_WORD *)v4 + 48);
  if ((v16 & 0x100) == 0)
  {
LABEL_26:
    if ((v16 & 8) == 0) {
      goto LABEL_27;
    }
LABEL_36:
    self->_modelNumberMajor = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 8u;
    if ((*((_WORD *)v4 + 48) & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_35:
  self->_isFromDLRuntimeModel = *((unsigned char *)v4 + 93);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v16 = *((_WORD *)v4 + 48);
  if ((v16 & 8) != 0) {
    goto LABEL_36;
  }
LABEL_27:
  if ((v16 & 0x10) != 0)
  {
LABEL_28:
    self->_modelNumberMinor = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_29:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCandidates, 0);
  objc_storeStrong((id *)&self->_spellSuggestions, 0);
  objc_storeStrong((id *)&self->_debugResponse, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end