@interface GEOPDSearchSpellerRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAbConfigParams;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLanguageContext;
- (BOOL)hasLocationContext;
- (BOOL)hasMaxSuggestions;
- (BOOL)hasPerformCompletion;
- (BOOL)hasQuery;
- (BOOL)hasQueryType;
- (BOOL)hasRequestFlags;
- (BOOL)hasTokenTags;
- (BOOL)hasUseCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)performCompletion;
- (BOOL)readFrom:(id)a3;
- (BOOL)useCache;
- (GEOPDSearchKeyValuePairList)abConfigParams;
- (GEOPDSearchKeyValuePairList)tokenTags;
- (GEOPDSearchLanguageContext)languageContext;
- (GEOPDSearchLocationContext)locationContext;
- (GEOPDSearchSpellerRequest)init;
- (GEOPDSearchSpellerRequest)initWithData:(id)a3;
- (GEOPDSearchSpellerRequest)initWithDictionary:(id)a3;
- (GEOPDSearchSpellerRequest)initWithJSON:(id)a3;
- (NSString)query;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)queryTypeAsString:(int)a3;
- (id)requestFlagsAsString:(int)a3;
- (int)StringAsQueryType:(id)a3;
- (int)StringAsRequestFlags:(id)a3;
- (int)queryType;
- (int)requestFlags;
- (unint64_t)hash;
- (unsigned)maxSuggestions;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbConfigParams;
- (void)_readLanguageContext;
- (void)_readLocationContext;
- (void)_readQuery;
- (void)_readTokenTags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbConfigParams:(id)a3;
- (void)setHasMaxSuggestions:(BOOL)a3;
- (void)setHasPerformCompletion:(BOOL)a3;
- (void)setHasQueryType:(BOOL)a3;
- (void)setHasRequestFlags:(BOOL)a3;
- (void)setHasUseCache:(BOOL)a3;
- (void)setLanguageContext:(id)a3;
- (void)setLocationContext:(id)a3;
- (void)setMaxSuggestions:(unsigned int)a3;
- (void)setPerformCompletion:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setQueryType:(int)a3;
- (void)setRequestFlags:(int)a3;
- (void)setTokenTags:(id)a3;
- (void)setUseCache:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchSpellerRequest

- (GEOPDSearchSpellerRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSpellerRequest;
  v2 = [(GEOPDSearchSpellerRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSpellerRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSpellerRequest;
  v3 = [(GEOPDSearchSpellerRequest *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDSearchSpellerRequest _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readLocationContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocationContext
{
  return self->_locationContext != 0;
}

- (GEOPDSearchLocationContext)locationContext
{
  -[GEOPDSearchSpellerRequest _readLocationContext]((uint64_t)self);
  locationContext = self->_locationContext;

  return locationContext;
}

- (void)setLocationContext:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_locationContext, a3);
}

- (void)_readLanguageContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguageContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLanguageContext
{
  return self->_languageContext != 0;
}

- (GEOPDSearchLanguageContext)languageContext
{
  -[GEOPDSearchSpellerRequest _readLanguageContext]((uint64_t)self);
  languageContext = self->_languageContext;

  return languageContext;
}

- (void)setLanguageContext:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_languageContext, a3);
}

- (BOOL)performCompletion
{
  return self->_performCompletion;
}

- (void)setPerformCompletion:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_performCompletion = a3;
}

- (void)setHasPerformCompletion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1032;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPerformCompletion
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)maxSuggestions
{
  return self->_maxSuggestions;
}

- (void)setMaxSuggestions:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_maxSuggestions = a3;
}

- (void)setHasMaxSuggestions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMaxSuggestions
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readAbConfigParams
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbConfigParams_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAbConfigParams
{
  return self->_abConfigParams != 0;
}

- (GEOPDSearchKeyValuePairList)abConfigParams
{
  -[GEOPDSearchSpellerRequest _readAbConfigParams]((uint64_t)self);
  abConfigParams = self->_abConfigParams;

  return abConfigParams;
}

- (void)setAbConfigParams:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_abConfigParams, a3);
}

- (int)queryType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_queryType;
  }
  else {
    return 0;
  }
}

- (void)setQueryType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_queryType = a3;
}

- (void)setHasQueryType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1028;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasQueryType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)queryTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53EA358[a3];
  }

  return v3;
}

- (int)StringAsQueryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)useCache
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x10) == 0 || self->_useCache;
}

- (void)setUseCache:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_useCache = a3;
}

- (void)setHasUseCache:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1040;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasUseCache
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)requestFlags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_requestFlags;
  }
  else {
    return 0;
  }
}

- (void)setRequestFlags:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_requestFlags = a3;
}

- (void)setHasRequestFlags:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasRequestFlags
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)requestFlagsAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53EA370[a3];
  }

  return v3;
}

- (int)StringAsRequestFlags:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEBUG_REQUEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEBUG_EVAL_REQUEST"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTokenTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenTags_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTokenTags
{
  return self->_tokenTags != 0;
}

- (GEOPDSearchKeyValuePairList)tokenTags
{
  -[GEOPDSearchSpellerRequest _readTokenTags]((uint64_t)self);
  tokenTags = self->_tokenTags;

  return tokenTags;
}

- (void)setTokenTags:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_tokenTags, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSpellerRequest;
  int v4 = [(GEOPDSearchSpellerRequest *)&v8 description];
  v5 = [(GEOPDSearchSpellerRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSpellerRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_54;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 query];
  if (v5) {
    [v4 setObject:v5 forKey:@"query"];
  }

  objc_super v6 = [(id)a1 locationContext];
  objc_super v7 = v6;
  if (v6)
  {
    if (a2)
    {
      objc_super v8 = [v6 jsonRepresentation];
      v9 = @"locationContext";
    }
    else
    {
      objc_super v8 = [v6 dictionaryRepresentation];
      v9 = @"location_context";
    }
    [v4 setObject:v8 forKey:v9];
  }
  v10 = [(id)a1 languageContext];
  v11 = v10;
  if (v10)
  {
    if (a2)
    {
      v12 = [v10 jsonRepresentation];
      v13 = @"languageContext";
    }
    else
    {
      v12 = [v10 dictionaryRepresentation];
      v13 = @"language_context";
    }
    [v4 setObject:v12 forKey:v13];
  }
  __int16 v14 = *(_WORD *)(a1 + 84);
  if ((v14 & 8) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    if (a2) {
      v16 = @"performCompletion";
    }
    else {
      v16 = @"perform_completion";
    }
    [v4 setObject:v15 forKey:v16];

    __int16 v14 = *(_WORD *)(a1 + 84);
  }
  if ((v14 & 2) != 0)
  {
    v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
    if (a2) {
      v18 = @"maxSuggestions";
    }
    else {
      v18 = @"max_suggestions";
    }
    [v4 setObject:v17 forKey:v18];
  }
  v19 = [(id)a1 abConfigParams];
  v20 = v19;
  if (v19)
  {
    if (a2)
    {
      v21 = [v19 jsonRepresentation];
      v22 = @"abConfigParams";
    }
    else
    {
      v21 = [v19 dictionaryRepresentation];
      v22 = @"ab_config_params";
    }
    [v4 setObject:v21 forKey:v22];
  }
  __int16 v23 = *(_WORD *)(a1 + 84);
  if ((v23 & 4) == 0)
  {
    if ((v23 & 0x10) == 0) {
      goto LABEL_31;
    }
LABEL_40:
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
    if (a2) {
      v28 = @"useCache";
    }
    else {
      v28 = @"use_cache";
    }
    [v4 setObject:v27 forKey:v28];

    if ((*(_WORD *)(a1 + 84) & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_44;
  }
  uint64_t v24 = *(int *)(a1 + 76);
  if (v24 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_1E53EA358[v24];
  }
  if (a2) {
    v26 = @"queryType";
  }
  else {
    v26 = @"query_type";
  }
  [v4 setObject:v25 forKey:v26];

  __int16 v23 = *(_WORD *)(a1 + 84);
  if ((v23 & 0x10) != 0) {
    goto LABEL_40;
  }
LABEL_31:
  if (v23)
  {
LABEL_44:
    uint64_t v29 = *(int *)(a1 + 68);
    if (v29 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_1E53EA370[v29];
    }
    [v4 setObject:v30 forKey:@"flags"];
  }
LABEL_48:
  v31 = [(id)a1 tokenTags];
  v32 = v31;
  if (v31)
  {
    if (a2)
    {
      v33 = [v31 jsonRepresentation];
      v34 = @"tokenTags";
    }
    else
    {
      v33 = [v31 dictionaryRepresentation];
      v34 = @"token_tags";
    }
    [v4 setObject:v33 forKey:v34];
  }
LABEL_54:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSpellerRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDSearchSpellerRequest)initWithDictionary:(id)a3
{
  return (GEOPDSearchSpellerRequest *)-[GEOPDSearchSpellerRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_76;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_76;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"query"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    [a1 setQuery:v7];
  }
  if (a3) {
    objc_super v8 = @"locationContext";
  }
  else {
    objc_super v8 = @"location_context";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOPDSearchLocationContext alloc];
    if (v10) {
      v11 = -[GEOPDSearchLocationContext _initWithDictionary:isJSON:](v10, v9, a3);
    }
    else {
      v11 = 0;
    }
    [a1 setLocationContext:v11];
  }
  if (a3) {
    v12 = @"languageContext";
  }
  else {
    v12 = @"language_context";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v14 = [GEOPDSearchLanguageContext alloc];
    if (v14) {
      v15 = -[GEOPDSearchLanguageContext _initWithDictionary:isJSON:](v14, v13, a3);
    }
    else {
      v15 = 0;
    }
    [a1 setLanguageContext:v15];
  }
  if (a3) {
    v16 = @"performCompletion";
  }
  else {
    v16 = @"perform_completion";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPerformCompletion:", objc_msgSend(v17, "BOOLValue"));
  }

  if (a3) {
    v18 = @"maxSuggestions";
  }
  else {
    v18 = @"max_suggestions";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMaxSuggestions:", objc_msgSend(v19, "unsignedIntValue"));
  }

  if (a3) {
    v20 = @"abConfigParams";
  }
  else {
    v20 = @"ab_config_params";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOPDSearchKeyValuePairList alloc];
    if (v22) {
      __int16 v23 = -[GEOPDSearchKeyValuePairList _initWithDictionary:isJSON:](v22, v21);
    }
    else {
      __int16 v23 = 0;
    }
    [a1 setAbConfigParams:v23];
  }
  if (a3) {
    uint64_t v24 = @"queryType";
  }
  else {
    uint64_t v24 = @"query_type";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;
    if ([v26 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v27 = 0;
    }
    else if ([v26 isEqualToString:@"POI"])
    {
      uint64_t v27 = 1;
    }
    else if ([v26 isEqualToString:@"ADDRESS"])
    {
      uint64_t v27 = 2;
    }
    else
    {
      uint64_t v27 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_51;
    }
    uint64_t v27 = [v25 intValue];
  }
  [a1 setQueryType:v27];
LABEL_51:

  if (a3) {
    v28 = @"useCache";
  }
  else {
    v28 = @"use_cache";
  }
  uint64_t v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUseCache:", objc_msgSend(v29, "BOOLValue"));
  }

  v30 = [v5 objectForKeyedSubscript:@"flags"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v30;
    if ([v31 isEqualToString:@"NONE"])
    {
      uint64_t v32 = 0;
    }
    else if ([v31 isEqualToString:@"DEBUG_REQUEST"])
    {
      uint64_t v32 = 1;
    }
    else if ([v31 isEqualToString:@"DEBUG_EVAL_REQUEST"])
    {
      uint64_t v32 = 2;
    }
    else
    {
      uint64_t v32 = 0;
    }

    goto LABEL_67;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v32 = [v30 intValue];
LABEL_67:
    [a1 setRequestFlags:v32];
  }

  if (a3) {
    v33 = @"tokenTags";
  }
  else {
    v33 = @"token_tags";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = [GEOPDSearchKeyValuePairList alloc];
    if (v35) {
      v36 = -[GEOPDSearchKeyValuePairList _initWithDictionary:isJSON:](v35, v34);
    }
    else {
      v36 = 0;
    }
    [a1 setTokenTags:v36];
  }
LABEL_76:

  return a1;
}

- (GEOPDSearchSpellerRequest)initWithJSON:(id)a3
{
  return (GEOPDSearchSpellerRequest *)-[GEOPDSearchSpellerRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_63;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_63;
    }
    GEOPDSearchSpellerRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    -[GEOPDSearchLocationContext readAll:]((uint64_t)self->_locationContext, 1);
    -[GEOPDSearchLanguageContext readAll:]((uint64_t)self->_languageContext, 1);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  int v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  objc_super v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    objc_super v7 = (int *)MEMORY[0x1E4F940B8];
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
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v17 = v10 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if (v17 != 2) {
            goto LABEL_78;
          }
          goto LABEL_24;
        case 2u:
          if (v17 != 2 || !PBReaderPlaceMark() || !GEOPDSearchLocationContextIsValid((char *)a3)) {
            goto LABEL_78;
          }
          goto LABEL_33;
        case 3u:
          if (v17 == 2 && PBReaderPlaceMark() && GEOPDSearchLanguageContextIsValid((char *)a3)) {
            goto LABEL_33;
          }
          goto LABEL_78;
        case 4u:
          if ((v10 & 7) != 0) {
            goto LABEL_78;
          }
          unsigned int v19 = 0;
          while (1)
          {
            uint64_t v20 = *v4;
            uint64_t v21 = *(void *)((char *)a3 + v20);
            unint64_t v22 = v21 + 1;
            if (v21 == -1 || v22 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_74;
            }
            int v23 = *(char *)(*(void *)((char *)a3 + *v7) + v21);
            *(void *)((char *)a3 + v20) = v22;
            if (v23 < 0)
            {
              BOOL v24 = v19++ > 8;
              if (!v24) {
                continue;
              }
            }
            goto LABEL_75;
          }
        case 5u:
          if ((v10 & 7) != 0) {
            goto LABEL_78;
          }
          unsigned int v25 = 0;
          while (1)
          {
            uint64_t v26 = *v4;
            uint64_t v27 = *(void *)((char *)a3 + v26);
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_74;
            }
            int v29 = *(char *)(*(void *)((char *)a3 + *v7) + v27);
            *(void *)((char *)a3 + v26) = v28;
            if (v29 < 0)
            {
              BOOL v24 = v25++ > 8;
              if (!v24) {
                continue;
              }
            }
            goto LABEL_75;
          }
        case 6u:
        case 0xAu:
          if (v17 != 2 || !PBReaderPlaceMark() || !GEOPDSearchKeyValuePairListIsValid((char *)a3)) {
            goto LABEL_78;
          }
LABEL_33:
          PBReaderRecallMark();
          continue;
        case 7u:
          if ((v10 & 7) != 0) {
            goto LABEL_78;
          }
          unsigned int v30 = 0;
          while (1)
          {
            uint64_t v31 = *v4;
            uint64_t v32 = *(void *)((char *)a3 + v31);
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_74;
            }
            int v34 = *(char *)(*(void *)((char *)a3 + *v7) + v32);
            *(void *)((char *)a3 + v31) = v33;
            if (v34 < 0)
            {
              BOOL v24 = v30++ > 8;
              if (!v24) {
                continue;
              }
            }
            goto LABEL_75;
          }
        case 8u:
          if ((v10 & 7) != 0) {
            goto LABEL_78;
          }
          unsigned int v35 = 0;
          while (1)
          {
            uint64_t v36 = *v4;
            uint64_t v37 = *(void *)((char *)a3 + v36);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_74;
            }
            int v39 = *(char *)(*(void *)((char *)a3 + *v7) + v37);
            *(void *)((char *)a3 + v36) = v38;
            if (v39 < 0)
            {
              BOOL v24 = v35++ > 8;
              if (!v24) {
                continue;
              }
            }
            goto LABEL_75;
          }
        case 9u:
          if ((v10 & 7) != 0) {
            goto LABEL_78;
          }
          unsigned int v40 = 0;
          break;
        default:
LABEL_24:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_78:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        uint64_t v41 = *v4;
        uint64_t v42 = *(void *)((char *)a3 + v41);
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        int v44 = *(char *)(*(void *)((char *)a3 + *v7) + v42);
        *(void *)((char *)a3 + v41) = v43;
        if (v44 < 0)
        {
          BOOL v24 = v40++ > 8;
          if (!v24) {
            continue;
          }
        }
        goto LABEL_75;
      }
LABEL_74:
      *((unsigned char *)a3 + *v6) = 1;
LABEL_75:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v45 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v45;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSpellerRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x500) == 0)
    {
      if ((flags & 0x80) != 0)
      {
        if (GEOPDSearchLocationContextIsDirty((uint64_t)self->_locationContext)) {
          goto LABEL_3;
        }
        __int16 flags = (__int16)self->_flags;
      }
      if ((flags & 0x40) != 0)
      {
        if (GEOPDSearchLanguageContextIsDirty((uint64_t)self->_languageContext)) {
          goto LABEL_3;
        }
        __int16 flags = (__int16)self->_flags;
      }
      if ((flags & 0x220) == 0)
      {
        unsigned int v9 = self->_reader;
        objc_sync_enter(v9);
        *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
        [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
        unint64_t v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
        [v11 writeData:v10];
        os_unfair_lock_unlock(p_readerLock);

        objc_sync_exit(v9);
        goto LABEL_21;
      }
    }
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDSearchSpellerRequest *)self readAll:0];
  if (self->_query) {
    PBDataWriterWriteStringField();
  }
  objc_super v6 = v11;
  if (self->_locationContext)
  {
    PBDataWriterWriteSubmessage();
    objc_super v6 = v11;
  }
  if (self->_languageContext)
  {
    PBDataWriterWriteSubmessage();
    objc_super v6 = v11;
  }
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    objc_super v6 = v11;
    __int16 v7 = (__int16)self->_flags;
  }
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    objc_super v6 = v11;
  }
  if (self->_abConfigParams)
  {
    PBDataWriterWriteSubmessage();
    objc_super v6 = v11;
  }
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 4) == 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_17;
    }
LABEL_26:
    PBDataWriterWriteBOOLField();
    objc_super v6 = v11;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  objc_super v6 = v11;
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_17:
  if (v8)
  {
LABEL_18:
    PBDataWriterWriteInt32Field();
    objc_super v6 = v11;
  }
LABEL_19:
  if (!self->_tokenTags) {
    goto LABEL_22;
  }
  PBDataWriterWriteSubmessage();
LABEL_21:
  objc_super v6 = v11;
LABEL_22:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDSearchSpellerRequest _readLocationContext]((uint64_t)self);
  locationContext = self->_locationContext;

  return -[GEOPDSearchLocationContext hasGreenTeaWithValue:]((uint64_t)locationContext, v3);
}

- (void)copyTo:(id)a3
{
  __int16 v7 = (id *)a3;
  [(GEOPDSearchSpellerRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v7, "setQuery:");
  }
  if (self->_locationContext) {
    objc_msgSend(v7, "setLocationContext:");
  }
  int v4 = v7;
  if (self->_languageContext)
  {
    objc_msgSend(v7, "setLanguageContext:");
    int v4 = v7;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_performCompletion;
    *((_WORD *)v4 + 42) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_maxSuggestions;
    *((_WORD *)v4 + 42) |= 2u;
  }
  if (self->_abConfigParams)
  {
    objc_msgSend(v7, "setAbConfigParams:");
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_queryType;
    *((_WORD *)v4 + 42) |= 4u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 0x10) == 0)
    {
LABEL_15:
      if ((v6 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  *((unsigned char *)v4 + 81) = self->_useCache;
  *((_WORD *)v4 + 42) |= 0x10u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_16:
    *((_DWORD *)v4 + 17) = self->_requestFlags;
    *((_WORD *)v4 + 42) |= 1u;
  }
LABEL_17:
  if (self->_tokenTags)
  {
    objc_msgSend(v7, "setTokenTags:");
    int v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDSearchSpellerRequest *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
    unint64_t v10 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v9;

    id v11 = [(GEOPDSearchLocationContext *)self->_locationContext copyWithZone:a3];
    uint64_t v12 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v11;

    id v13 = [(GEOPDSearchLanguageContext *)self->_languageContext copyWithZone:a3];
    char v14 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v13;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      *(unsigned char *)(v5 + 80) = self->_performCompletion;
      *(_WORD *)(v5 + 84) |= 8u;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_maxSuggestions;
      *(_WORD *)(v5 + 84) |= 2u;
    }
    id v16 = [(GEOPDSearchKeyValuePairList *)self->_abConfigParams copyWithZone:a3];
    int v17 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v16;

    __int16 v18 = (__int16)self->_flags;
    if ((v18 & 4) != 0)
    {
      *(_DWORD *)(v5 + 76) = self->_queryType;
      *(_WORD *)(v5 + 84) |= 4u;
      __int16 v18 = (__int16)self->_flags;
      if ((v18 & 0x10) == 0)
      {
LABEL_11:
        if ((v18 & 1) == 0)
        {
LABEL_13:
          id v19 = [(GEOPDSearchKeyValuePairList *)self->_tokenTags copyWithZone:a3];
          id v8 = *(id *)(v5 + 48);
          *(void *)(v5 + 48) = v19;
          goto LABEL_14;
        }
LABEL_12:
        *(_DWORD *)(v5 + 68) = self->_requestFlags;
        *(_WORD *)(v5 + 84) |= 1u;
        goto LABEL_13;
      }
    }
    else if ((v18 & 0x10) == 0)
    {
      goto LABEL_11;
    }
    *(unsigned char *)(v5 + 81) = self->_useCache;
    *(_WORD *)(v5 + 84) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  __int16 v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchSpellerRequestReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_14:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  [(GEOPDSearchSpellerRequest *)self readAll:1];
  [v4 readAll:1];
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_44;
    }
  }
  locationContext = self->_locationContext;
  if ((unint64_t)locationContext | *((void *)v4 + 4))
  {
    if (!-[GEOPDSearchLocationContext isEqual:](locationContext, "isEqual:")) {
      goto LABEL_44;
    }
  }
  languageContext = self->_languageContext;
  if ((unint64_t)languageContext | *((void *)v4 + 3))
  {
    if (!-[GEOPDSearchLanguageContext isEqual:](languageContext, "isEqual:")) {
      goto LABEL_44;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 42);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_44;
    }
    if (self->_performCompletion)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_44;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_maxSuggestions != *((_DWORD *)v4 + 18)) {
      goto LABEL_44;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_44;
  }
  abConfigParams = self->_abConfigParams;
  if ((unint64_t)abConfigParams | *((void *)v4 + 2))
  {
    if (!-[GEOPDSearchKeyValuePairList isEqual:](abConfigParams, "isEqual:")) {
      goto LABEL_44;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 42);
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_queryType != *((_DWORD *)v4 + 19)) {
      goto LABEL_44;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) != 0)
    {
      if (self->_useCache)
      {
        if (!*((unsigned char *)v4 + 81)) {
          goto LABEL_44;
        }
        goto LABEL_37;
      }
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_37;
      }
    }
LABEL_44:
    char v12 = 0;
    goto LABEL_45;
  }
  if ((v9 & 0x10) != 0) {
    goto LABEL_44;
  }
LABEL_37:
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_requestFlags != *((_DWORD *)v4 + 17)) {
      goto LABEL_44;
    }
  }
  else if (v9)
  {
    goto LABEL_44;
  }
  tokenTags = self->_tokenTags;
  if ((unint64_t)tokenTags | *((void *)v4 + 6)) {
    char v12 = -[GEOPDSearchKeyValuePairList isEqual:](tokenTags, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  [(GEOPDSearchSpellerRequest *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_query hash];
  unint64_t v4 = [(GEOPDSearchLocationContext *)self->_locationContext hash];
  unint64_t v5 = [(GEOPDSearchLanguageContext *)self->_languageContext hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_performCompletion;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_maxSuggestions;
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  unint64_t v9 = [(GEOPDSearchKeyValuePairList *)self->_abConfigParams hash];
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 4) == 0)
  {
    uint64_t v11 = 0;
    if ((v10 & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v12 = 0;
    if (v10) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ [(GEOPDSearchKeyValuePairList *)self->_tokenTags hash];
  }
  uint64_t v11 = 2654435761 * self->_queryType;
  if ((v10 & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v12 = 2654435761 * self->_useCache;
  if ((v10 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v13 = 2654435761 * self->_requestFlags;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ [(GEOPDSearchKeyValuePairList *)self->_tokenTags hash];
}

- (void)mergeFrom:(id)a3
{
  v15 = a3;
  [v15 readAll:0];
  if (v15[5]) {
    -[GEOPDSearchSpellerRequest setQuery:](self, "setQuery:");
  }
  locationContext = self->_locationContext;
  unint64_t v5 = v15;
  __int16 v6 = (void *)v15[4];
  if (locationContext)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDSearchLocationContext mergeFrom:]((uint64_t)locationContext, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    [(GEOPDSearchSpellerRequest *)self setLocationContext:v15[4]];
  }
  unint64_t v5 = v15;
LABEL_9:
  languageContext = self->_languageContext;
  uint64_t v8 = (void *)v5[3];
  if (languageContext)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDSearchLanguageContext mergeFrom:]((uint64_t)languageContext, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    [(GEOPDSearchSpellerRequest *)self setLanguageContext:v5[3]];
  }
  unint64_t v5 = v15;
LABEL_15:
  __int16 v9 = *((_WORD *)v5 + 42);
  if ((v9 & 8) != 0)
  {
    self->_performCompletion = *((unsigned char *)v5 + 80);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v9 = *((_WORD *)v5 + 42);
  }
  if ((v9 & 2) != 0)
  {
    self->_maxSuggestions = *((_DWORD *)v5 + 18);
    *(_WORD *)&self->_flags |= 2u;
  }
  abConfigParams = self->_abConfigParams;
  uint64_t v11 = v5[2];
  if (abConfigParams)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEOPDSearchKeyValuePairList mergeFrom:]((uint64_t)abConfigParams, v11);
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    [(GEOPDSearchSpellerRequest *)self setAbConfigParams:v5[2]];
  }
  unint64_t v5 = v15;
LABEL_25:
  __int16 v12 = *((_WORD *)v5 + 42);
  if ((v12 & 4) != 0)
  {
    self->_queryType = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v12 = *((_WORD *)v5 + 42);
    if ((v12 & 0x10) == 0)
    {
LABEL_27:
      if ((v12 & 1) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((v12 & 0x10) == 0)
  {
    goto LABEL_27;
  }
  self->_useCache = *((unsigned char *)v5 + 81);
  *(_WORD *)&self->_flags |= 0x10u;
  if (*((_WORD *)v5 + 42))
  {
LABEL_28:
    self->_requestFlags = *((_DWORD *)v5 + 17);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_29:
  tokenTags = self->_tokenTags;
  uint64_t v14 = v5[6];
  if (tokenTags)
  {
    if (v14) {
      -[GEOPDSearchKeyValuePairList mergeFrom:]((uint64_t)tokenTags, v14);
    }
  }
  else if (v14)
  {
    tokenTags = (GEOPDSearchKeyValuePairList *)[(GEOPDSearchSpellerRequest *)self setTokenTags:v5[6]];
  }

  MEMORY[0x1F4181820](tokenTags);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenTags, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_locationContext, 0);
  objc_storeStrong((id *)&self->_languageContext, 0);
  objc_storeStrong((id *)&self->_abConfigParams, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end