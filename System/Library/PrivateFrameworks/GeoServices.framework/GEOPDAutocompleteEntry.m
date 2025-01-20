@interface GEOPDAutocompleteEntry
+ (BOOL)isValid:(id)a3;
- (BOOL)enableQueryAcceleratorAffordance;
- (BOOL)hasAddress;
- (BOOL)hasAutocompleteOriginationTypeNumber;
- (BOOL)hasAutocompleteResultCellType;
- (BOOL)hasBrandProfile;
- (BOOL)hasBusiness;
- (BOOL)hasCategory;
- (BOOL)hasClientResolved;
- (BOOL)hasCollection;
- (BOOL)hasDirectionIntent;
- (BOOL)hasEnableQueryAcceleratorAffordance;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHighlightExtra;
- (BOOL)hasHighlightMain;
- (BOOL)hasOfflineArea;
- (BOOL)hasParsecRankingFeatures;
- (BOOL)hasPublisher;
- (BOOL)hasQuery;
- (BOOL)hasQueryAcceleratorCompletionString;
- (BOOL)hasRetainSearch;
- (BOOL)hasServerResultScoreMetadata;
- (BOOL)hasSortPriority;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntry)init;
- (GEOPDAutocompleteEntry)initWithData:(id)a3;
- (GEOPDAutocompleteEntry)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntry)initWithJSON:(id)a3;
- (GEOPDAutocompleteEntryAddress)address;
- (GEOPDAutocompleteEntryBrandProfile)brandProfile;
- (GEOPDAutocompleteEntryBusiness)business;
- (GEOPDAutocompleteEntryCategory)category;
- (GEOPDAutocompleteEntryClientResolved)clientResolved;
- (GEOPDAutocompleteEntryCollection)collection;
- (GEOPDAutocompleteEntryDirectionIntent)directionIntent;
- (GEOPDAutocompleteEntryHighlightLine)highlightExtra;
- (GEOPDAutocompleteEntryHighlightLine)highlightMain;
- (GEOPDAutocompleteEntryOfflineArea)offlineArea;
- (GEOPDAutocompleteEntryPublisher)publisher;
- (GEOPDAutocompleteEntryQuery)query;
- (GEOPDParsecRankingFeatures)parsecRankingFeatures;
- (GEOPDRetainedSearchMetadata)retainSearch;
- (GEOPDServerResultScoreMetadata)serverResultScoreMetadata;
- (NSString)queryAcceleratorCompletionString;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)autocompleteResultCellTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsAutocompleteResultCellType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)autocompleteResultCellType;
- (int)sortPriority;
- (int)type;
- (unint64_t)hash;
- (unsigned)autocompleteOriginationTypeNumber;
- (void)_readAddress;
- (void)_readBrandProfile;
- (void)_readBusiness;
- (void)_readCategory;
- (void)_readClientResolved;
- (void)_readCollection;
- (void)_readDirectionIntent;
- (void)_readHighlightExtra;
- (void)_readHighlightMain;
- (void)_readOfflineArea;
- (void)_readParsecRankingFeatures;
- (void)_readPublisher;
- (void)_readQuery;
- (void)_readQueryAcceleratorCompletionString;
- (void)_readRetainSearch;
- (void)_readServerResultScoreMetadata;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setAutocompleteOriginationTypeNumber:(unsigned int)a3;
- (void)setAutocompleteResultCellType:(int)a3;
- (void)setBrandProfile:(id)a3;
- (void)setBusiness:(id)a3;
- (void)setCategory:(id)a3;
- (void)setClientResolved:(id)a3;
- (void)setCollection:(id)a3;
- (void)setDirectionIntent:(id)a3;
- (void)setEnableQueryAcceleratorAffordance:(BOOL)a3;
- (void)setHasAutocompleteOriginationTypeNumber:(BOOL)a3;
- (void)setHasAutocompleteResultCellType:(BOOL)a3;
- (void)setHasEnableQueryAcceleratorAffordance:(BOOL)a3;
- (void)setHasSortPriority:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHighlightExtra:(id)a3;
- (void)setHighlightMain:(id)a3;
- (void)setOfflineArea:(id)a3;
- (void)setParsecRankingFeatures:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryAcceleratorCompletionString:(id)a3;
- (void)setRetainSearch:(id)a3;
- (void)setServerResultScoreMetadata:(id)a3;
- (void)setSortPriority:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntry

- (GEOPDAutocompleteEntryOfflineArea)offlineArea
{
  -[GEOPDAutocompleteEntry _readOfflineArea]((uint64_t)self);
  offlineArea = self->_offlineArea;

  return offlineArea;
}

- (void)_readOfflineArea
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineArea_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_12;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_12;
    }
    GEOPDAutocompleteEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAutocompleteEntryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_176;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_176;
  }
  if (a3) {
    v6 = @"highlightMain";
  }
  else {
    v6 = @"highlight_main";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [GEOPDAutocompleteEntryHighlightLine alloc];
    if (a3) {
      uint64_t v9 = [(GEOPDAutocompleteEntryHighlightLine *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOPDAutocompleteEntryHighlightLine *)v8 initWithDictionary:v7];
    }
    v10 = (void *)v9;
    [a1 setHighlightMain:v9];
  }
  if (a3) {
    v11 = @"highlightExtra";
  }
  else {
    v11 = @"highlight_extra";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEOPDAutocompleteEntryHighlightLine alloc];
    if (a3) {
      uint64_t v14 = [(GEOPDAutocompleteEntryHighlightLine *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOPDAutocompleteEntryHighlightLine *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setHighlightExtra:v14];
  }
  v16 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16;
    if ([v17 isEqualToString:@"QUERY"])
    {
      uint64_t v18 = 0;
    }
    else if ([v17 isEqualToString:@"BUSINESS"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"ADDRESS"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"CATEGORY"])
    {
      uint64_t v18 = 3;
    }
    else if ([v17 isEqualToString:@"BRAND_PROFILE"])
    {
      uint64_t v18 = 4;
    }
    else if ([v17 isEqualToString:@"OFFLINE_AREA"])
    {
      uint64_t v18 = 5;
    }
    else if ([v17 isEqualToString:@"CLIENT_RESOLVED"])
    {
      uint64_t v18 = 6;
    }
    else if ([v17 isEqualToString:@"DIRECTION_INTENT"])
    {
      uint64_t v18 = 7;
    }
    else if ([v17 isEqualToString:@"COLLECTION"])
    {
      uint64_t v18 = 8;
    }
    else if ([v17 isEqualToString:@"PUBLISHER"])
    {
      uint64_t v18 = 9;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_45;
    }
    uint64_t v18 = [v16 intValue];
  }
  [a1 setType:v18];
LABEL_45:

  v19 = [v5 objectForKeyedSubscript:@"query"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [GEOPDAutocompleteEntryQuery alloc];
    if (a3) {
      uint64_t v21 = [(GEOPDAutocompleteEntryQuery *)v20 initWithJSON:v19];
    }
    else {
      uint64_t v21 = [(GEOPDAutocompleteEntryQuery *)v20 initWithDictionary:v19];
    }
    v22 = (void *)v21;
    [a1 setQuery:v21];
  }
  v23 = [v5 objectForKeyedSubscript:@"business"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEOPDAutocompleteEntryBusiness alloc];
    if (a3) {
      uint64_t v25 = [(GEOPDAutocompleteEntryBusiness *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOPDAutocompleteEntryBusiness *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    [a1 setBusiness:v25];
  }
  v27 = [v5 objectForKeyedSubscript:@"address"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = [GEOPDAutocompleteEntryAddress alloc];
    if (a3) {
      uint64_t v29 = [(GEOPDAutocompleteEntryAddress *)v28 initWithJSON:v27];
    }
    else {
      uint64_t v29 = [(GEOPDAutocompleteEntryAddress *)v28 initWithDictionary:v27];
    }
    v30 = (void *)v29;
    [a1 setAddress:v29];
  }
  v31 = [v5 objectForKeyedSubscript:@"category"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEOPDAutocompleteEntryCategory alloc];
    if (a3) {
      uint64_t v33 = [(GEOPDAutocompleteEntryCategory *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEOPDAutocompleteEntryCategory *)v32 initWithDictionary:v31];
    }
    v34 = (void *)v33;
    [a1 setCategory:v33];
  }
  if (a3) {
    v35 = @"brandProfile";
  }
  else {
    v35 = @"brand_profile";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = [GEOPDAutocompleteEntryBrandProfile alloc];
    if (a3) {
      uint64_t v38 = [(GEOPDAutocompleteEntryBrandProfile *)v37 initWithJSON:v36];
    }
    else {
      uint64_t v38 = [(GEOPDAutocompleteEntryBrandProfile *)v37 initWithDictionary:v36];
    }
    v39 = (void *)v38;
    [a1 setBrandProfile:v38];
  }
  if (a3) {
    v40 = @"offlineArea";
  }
  else {
    v40 = @"offline_area";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = [GEOPDAutocompleteEntryOfflineArea alloc];
    if (a3) {
      uint64_t v43 = [(GEOPDAutocompleteEntryOfflineArea *)v42 initWithJSON:v41];
    }
    else {
      uint64_t v43 = [(GEOPDAutocompleteEntryOfflineArea *)v42 initWithDictionary:v41];
    }
    v44 = (void *)v43;
    [a1 setOfflineArea:v43];
  }
  if (a3) {
    v45 = @"clientResolved";
  }
  else {
    v45 = @"client_resolved";
  }
  v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v47 = [GEOPDAutocompleteEntryClientResolved alloc];
    if (a3) {
      uint64_t v48 = [(GEOPDAutocompleteEntryClientResolved *)v47 initWithJSON:v46];
    }
    else {
      uint64_t v48 = [(GEOPDAutocompleteEntryClientResolved *)v47 initWithDictionary:v46];
    }
    v49 = (void *)v48;
    [a1 setClientResolved:v48];
  }
  if (a3) {
    v50 = @"directionIntent";
  }
  else {
    v50 = @"direction_intent";
  }
  v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [GEOPDAutocompleteEntryDirectionIntent alloc];
    if (a3) {
      uint64_t v53 = [(GEOPDAutocompleteEntryDirectionIntent *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEOPDAutocompleteEntryDirectionIntent *)v52 initWithDictionary:v51];
    }
    v54 = (void *)v53;
    [a1 setDirectionIntent:v53];
  }
  if (a3) {
    v55 = @"retainSearch";
  }
  else {
    v55 = @"retain_search";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = [GEOPDRetainedSearchMetadata alloc];
    if (v57) {
      v58 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v57, v56, a3);
    }
    else {
      v58 = 0;
    }
    [a1 setRetainSearch:v58];
  }
  if (a3) {
    v59 = @"parsecRankingFeatures";
  }
  else {
    v59 = @"parsec_ranking_features";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = [GEOPDParsecRankingFeatures alloc];
    if (a3) {
      uint64_t v62 = [(GEOPDParsecRankingFeatures *)v61 initWithJSON:v60];
    }
    else {
      uint64_t v62 = [(GEOPDParsecRankingFeatures *)v61 initWithDictionary:v60];
    }
    v63 = (void *)v62;
    [a1 setParsecRankingFeatures:v62];
  }
  if (a3) {
    v64 = @"sortPriority";
  }
  else {
    v64 = @"sort_priority";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSortPriority:", objc_msgSend(v65, "intValue"));
  }

  if (a3) {
    v66 = @"autocompleteResultCellType";
  }
  else {
    v66 = @"autocomplete_result_cell_type";
  }
  v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v68 = v67;
    if ([v68 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT"])
    {
      uint64_t v69 = 0;
    }
    else if ([v68 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY"])
    {
      uint64_t v69 = 1;
    }
    else if ([v68 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT"])
    {
      uint64_t v69 = 2;
    }
    else if ([v68 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE"])
    {
      uint64_t v69 = 3;
    }
    else if ([v68 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE"])
    {
      uint64_t v69 = 4;
    }
    else
    {
      uint64_t v69 = 0;
    }

    goto LABEL_135;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v69 = [v67 intValue];
LABEL_135:
    [a1 setAutocompleteResultCellType:v69];
  }

  if (a3) {
    v70 = @"serverResultScoreMetadata";
  }
  else {
    v70 = @"server_result_score_metadata";
  }
  v71 = [v5 objectForKeyedSubscript:v70];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v72 = [GEOPDServerResultScoreMetadata alloc];
    if (v72)
    {
      id v73 = v71;
      v72 = [(GEOPDServerResultScoreMetadata *)v72 init];
      if (v72)
      {
        if (a3) {
          v74 = @"normalizedScore";
        }
        else {
          v74 = @"normalized_score";
        }
        v75 = [v73 objectForKeyedSubscript:v74];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v75 floatValue];
          *(unsigned char *)&v72->_flags |= 1u;
          v72->_normalizedScore = v76;
        }
      }
    }
    [a1 setServerResultScoreMetadata:v72];
  }
  if (a3) {
    v77 = @"enableQueryAcceleratorAffordance";
  }
  else {
    v77 = @"enable_query_accelerator_affordance";
  }
  v78 = [v5 objectForKeyedSubscript:v77];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnableQueryAcceleratorAffordance:", objc_msgSend(v78, "BOOLValue"));
  }

  if (a3) {
    v79 = @"queryAcceleratorCompletionString";
  }
  else {
    v79 = @"query_accelerator_completion_string";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v81 = (void *)[v80 copy];
    [a1 setQueryAcceleratorCompletionString:v81];
  }
  v82 = [v5 objectForKeyedSubscript:@"collection"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v83 = [GEOPDAutocompleteEntryCollection alloc];
    if (a3) {
      uint64_t v84 = [(GEOPDAutocompleteEntryCollection *)v83 initWithJSON:v82];
    }
    else {
      uint64_t v84 = [(GEOPDAutocompleteEntryCollection *)v83 initWithDictionary:v82];
    }
    v85 = (void *)v84;
    [a1 setCollection:v84];
  }
  v86 = [v5 objectForKeyedSubscript:@"publisher"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v87 = [GEOPDAutocompleteEntryPublisher alloc];
    if (a3) {
      uint64_t v88 = [(GEOPDAutocompleteEntryPublisher *)v87 initWithJSON:v86];
    }
    else {
      uint64_t v88 = [(GEOPDAutocompleteEntryPublisher *)v87 initWithDictionary:v86];
    }
    v89 = (void *)v88;
    [a1 setPublisher:v88];
  }
  if (a3) {
    v90 = @"autocompleteOriginationTypeNumber";
  }
  else {
    v90 = @"autocomplete_origination_type_number";
  }
  v91 = [v5 objectForKeyedSubscript:v90];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAutocompleteOriginationTypeNumber:", objc_msgSend(v91, "unsignedIntValue"));
  }

  a1 = a1;
LABEL_176:

  return a1;
}

- (GEOPDAutocompleteEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntry;
  v2 = [(GEOPDAutocompleteEntry *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasOfflineArea
{
  return self->_offlineArea != 0;
}

- (GEOPDAutocompleteEntryBrandProfile)brandProfile
{
  -[GEOPDAutocompleteEntry _readBrandProfile]((uint64_t)self);
  brandProfile = self->_brandProfile;

  return brandProfile;
}

- (void)_readClientResolved
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientResolved_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (void)_readCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategory_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (void)_readBrandProfile
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 184) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandProfile_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (GEOPDAutocompleteEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntry;
  id v3 = [(GEOPDAutocompleteEntry *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readHighlightMain
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHighlightMain_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasHighlightMain
{
  return self->_highlightMain != 0;
}

- (GEOPDAutocompleteEntryHighlightLine)highlightMain
{
  -[GEOPDAutocompleteEntry _readHighlightMain]((uint64_t)self);
  highlightMain = self->_highlightMain;

  return highlightMain;
}

- (void)setHighlightMain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x404000u;
  objc_storeStrong((id *)&self->_highlightMain, a3);
}

- (void)_readHighlightExtra
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHighlightExtra_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasHighlightExtra
{
  return self->_highlightExtra != 0;
}

- (GEOPDAutocompleteEntryHighlightLine)highlightExtra
{
  -[GEOPDAutocompleteEntry _readHighlightExtra]((uint64_t)self);
  highlightExtra = self->_highlightExtra;

  return highlightExtra;
}

- (void)setHighlightExtra:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x402000u;
  objc_storeStrong((id *)&self->_highlightExtra, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400008u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 4194312;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EC00EBA47C74C596B32E42AC7A87C130 flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53DD900[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"QUERY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CATEGORY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BRAND_PROFILE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OFFLINE_AREA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CLIENT_RESOLVED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DIRECTION_INTENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"COLLECTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PUBLISHER"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readQuery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (GEOPDAutocompleteEntryQuery)query
{
  -[GEOPDAutocompleteEntry _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x480000u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readBusiness
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusiness_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasBusiness
{
  return self->_business != 0;
}

- (GEOPDAutocompleteEntryBusiness)business
{
  -[GEOPDAutocompleteEntry _readBusiness]((uint64_t)self);
  business = self->_business;

  return business;
}

- (void)setBusiness:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400100u;
  objc_storeStrong((id *)&self->_business, a3);
}

- (void)_readAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 184) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEOPDAutocompleteEntryAddress)address
{
  -[GEOPDAutocompleteEntry _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400040u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (GEOPDAutocompleteEntryCategory)category
{
  -[GEOPDAutocompleteEntry _readCategory]((uint64_t)self);
  category = self->_category;

  return category;
}

- (void)setCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400200u;
  objc_storeStrong((id *)&self->_category, a3);
}

- (BOOL)hasBrandProfile
{
  return self->_brandProfile != 0;
}

- (void)setBrandProfile:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400080u;
  objc_storeStrong((id *)&self->_brandProfile, a3);
}

- (void)setOfflineArea:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x408000u;
  objc_storeStrong((id *)&self->_offlineArea, a3);
}

- (BOOL)hasClientResolved
{
  return self->_clientResolved != 0;
}

- (GEOPDAutocompleteEntryClientResolved)clientResolved
{
  -[GEOPDAutocompleteEntry _readClientResolved]((uint64_t)self);
  clientResolved = self->_clientResolved;

  return clientResolved;
}

- (void)setClientResolved:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400400u;
  objc_storeStrong((id *)&self->_clientResolved, a3);
}

- (void)_readDirectionIntent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionIntent_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasDirectionIntent
{
  return self->_directionIntent != 0;
}

- (GEOPDAutocompleteEntryDirectionIntent)directionIntent
{
  -[GEOPDAutocompleteEntry _readDirectionIntent]((uint64_t)self);
  directionIntent = self->_directionIntent;

  return directionIntent;
}

- (void)setDirectionIntent:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x401000u;
  objc_storeStrong((id *)&self->_directionIntent, a3);
}

- (void)_readRetainSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRetainSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRetainSearch
{
  return self->_retainSearch != 0;
}

- (GEOPDRetainedSearchMetadata)retainSearch
{
  -[GEOPDAutocompleteEntry _readRetainSearch]((uint64_t)self);
  retainSearch = self->_retainSearch;

  return retainSearch;
}

- (void)setRetainSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x500000u;
  objc_storeStrong((id *)&self->_retainSearch, a3);
}

- (void)_readParsecRankingFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParsecRankingFeatures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasParsecRankingFeatures
{
  return self->_parsecRankingFeatures != 0;
}

- (GEOPDParsecRankingFeatures)parsecRankingFeatures
{
  -[GEOPDAutocompleteEntry _readParsecRankingFeatures]((uint64_t)self);
  parsecRankingFeatures = self->_parsecRankingFeatures;

  return parsecRankingFeatures;
}

- (void)setParsecRankingFeatures:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x410000u;
  objc_storeStrong((id *)&self->_parsecRankingFeatures, a3);
}

- (int)sortPriority
{
  return self->_sortPriority;
}

- (void)setSortPriority:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400004u;
  self->_sortPriority = a3;
}

- (void)setHasSortPriority:(BOOL)a3
{
  if (a3) {
    int v3 = 4194308;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EC00EBA47C74C596B32E42AC7A87C130 flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasSortPriority
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)autocompleteResultCellType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_autocompleteResultCellType;
  }
  else {
    return 0;
  }
}

- (void)setAutocompleteResultCellType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400002u;
  self->_autocompleteResultCellType = a3;
}

- (void)setHasAutocompleteResultCellType:(BOOL)a3
{
  if (a3) {
    int v3 = 4194306;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EC00EBA47C74C596B32E42AC7A87C130 flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasAutocompleteResultCellType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)autocompleteResultCellTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53DD6D8[a3];
  }

  return v3;
}

- (int)StringAsAutocompleteResultCellType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readServerResultScoreMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServerResultScoreMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasServerResultScoreMetadata
{
  return self->_serverResultScoreMetadata != 0;
}

- (GEOPDServerResultScoreMetadata)serverResultScoreMetadata
{
  -[GEOPDAutocompleteEntry _readServerResultScoreMetadata]((uint64_t)self);
  serverResultScoreMetadata = self->_serverResultScoreMetadata;

  return serverResultScoreMetadata;
}

- (void)setServerResultScoreMetadata:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x600000u;
  objc_storeStrong((id *)&self->_serverResultScoreMetadata, a3);
}

- (BOOL)enableQueryAcceleratorAffordance
{
  return self->_enableQueryAcceleratorAffordance;
}

- (void)setEnableQueryAcceleratorAffordance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400010u;
  self->_enableQueryAcceleratorAffordance = a3;
}

- (void)setHasEnableQueryAcceleratorAffordance:(BOOL)a3
{
  if (a3) {
    int v3 = 4194320;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EC00EBA47C74C596B32E42AC7A87C130 flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEnableQueryAcceleratorAffordance
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readQueryAcceleratorCompletionString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryAcceleratorCompletionString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasQueryAcceleratorCompletionString
{
  return self->_queryAcceleratorCompletionString != 0;
}

- (NSString)queryAcceleratorCompletionString
{
  -[GEOPDAutocompleteEntry _readQueryAcceleratorCompletionString]((uint64_t)self);
  queryAcceleratorCompletionString = self->_queryAcceleratorCompletionString;

  return queryAcceleratorCompletionString;
}

- (void)setQueryAcceleratorCompletionString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x440000u;
  objc_storeStrong((id *)&self->_queryAcceleratorCompletionString, a3);
}

- (void)_readCollection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasCollection
{
  return self->_collection != 0;
}

- (GEOPDAutocompleteEntryCollection)collection
{
  -[GEOPDAutocompleteEntry _readCollection]((uint64_t)self);
  collection = self->_collection;

  return collection;
}

- (void)setCollection:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400800u;
  objc_storeStrong((id *)&self->_collection, a3);
}

- (void)_readPublisher
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisher_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasPublisher
{
  return self->_publisher != 0;
}

- (GEOPDAutocompleteEntryPublisher)publisher
{
  -[GEOPDAutocompleteEntry _readPublisher]((uint64_t)self);
  publisher = self->_publisher;

  return publisher;
}

- (void)setPublisher:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x420000u;
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (unsigned)autocompleteOriginationTypeNumber
{
  return self->_autocompleteOriginationTypeNumber;
}

- (void)setAutocompleteOriginationTypeNumber:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x400001u;
  self->_autocompleteOriginationTypeNumber = a3;
}

- (void)setHasAutocompleteOriginationTypeNumber:(BOOL)a3
{
  self->_$EC00EBA47C74C596B32E42AC7A87C130 flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x400000);
}

- (BOOL)hasAutocompleteOriginationTypeNumber
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntry;
  int v4 = [(GEOPDAutocompleteEntry *)&v8 description];
  id v5 = [(GEOPDAutocompleteEntry *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 highlightMain];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"highlightMain";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"highlight_main";
      }
      id v9 = v7;

      [v4 setObject:v9 forKey:v8];
    }

    v10 = [(id)a1 highlightExtra];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"highlightExtra";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"highlight_extra";
      }
      id v14 = v12;

      [v4 setObject:v14 forKey:v13];
    }

    if ((*(unsigned char *)(a1 + 184) & 8) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 176);
      if (v15 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 176));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53DD900[v15];
      }
      [v4 setObject:v16 forKey:@"type"];
    }
    id v17 = [(id)a1 query];
    uint64_t v18 = v17;
    if (v17)
    {
      if (a2) {
        [v17 jsonRepresentation];
      }
      else {
      id v19 = [v17 dictionaryRepresentation];
      }

      [v4 setObject:v19 forKey:@"query"];
    }

    v20 = [(id)a1 business];
    uint64_t v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      id v22 = [v20 dictionaryRepresentation];
      }

      [v4 setObject:v22 forKey:@"business"];
    }

    v23 = [(id)a1 address];
    v24 = v23;
    if (v23)
    {
      if (a2) {
        [v23 jsonRepresentation];
      }
      else {
      id v25 = [v23 dictionaryRepresentation];
      }

      [v4 setObject:v25 forKey:@"address"];
    }

    v26 = [(id)a1 category];
    v27 = v26;
    if (v26)
    {
      if (a2) {
        [v26 jsonRepresentation];
      }
      else {
      id v28 = [v26 dictionaryRepresentation];
      }

      [v4 setObject:v28 forKey:@"category"];
    }

    uint64_t v29 = [(id)a1 brandProfile];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"brandProfile";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"brand_profile";
      }
      id v33 = v31;

      [v4 setObject:v33 forKey:v32];
    }

    v34 = [(id)a1 offlineArea];
    v35 = v34;
    if (v34)
    {
      if (a2)
      {
        v36 = [v34 jsonRepresentation];
        v37 = @"offlineArea";
      }
      else
      {
        v36 = [v34 dictionaryRepresentation];
        v37 = @"offline_area";
      }
      id v38 = v36;

      [v4 setObject:v38 forKey:v37];
    }

    v39 = [(id)a1 clientResolved];
    v40 = v39;
    if (v39)
    {
      if (a2)
      {
        v41 = [v39 jsonRepresentation];
        v42 = @"clientResolved";
      }
      else
      {
        v41 = [v39 dictionaryRepresentation];
        v42 = @"client_resolved";
      }
      id v43 = v41;

      [v4 setObject:v43 forKey:v42];
    }

    v44 = [(id)a1 directionIntent];
    v45 = v44;
    if (v44)
    {
      if (a2)
      {
        v46 = [v44 jsonRepresentation];
        v47 = @"directionIntent";
      }
      else
      {
        v46 = [v44 dictionaryRepresentation];
        v47 = @"direction_intent";
      }
      id v48 = v46;

      [v4 setObject:v48 forKey:v47];
    }

    v49 = [(id)a1 retainSearch];
    v50 = v49;
    if (v49)
    {
      if (a2)
      {
        v51 = [v49 jsonRepresentation];
        v52 = @"retainSearch";
      }
      else
      {
        v51 = [v49 dictionaryRepresentation];
        v52 = @"retain_search";
      }
      id v53 = v51;

      [v4 setObject:v53 forKey:v52];
    }

    v54 = [(id)a1 parsecRankingFeatures];
    v55 = v54;
    if (v54)
    {
      if (a2)
      {
        v56 = [v54 jsonRepresentation];
        v57 = @"parsecRankingFeatures";
      }
      else
      {
        v56 = [v54 dictionaryRepresentation];
        v57 = @"parsec_ranking_features";
      }
      id v58 = v56;

      [v4 setObject:v58 forKey:v57];
    }

    int v59 = *(_DWORD *)(a1 + 184);
    if ((v59 & 4) != 0)
    {
      v60 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 172)];
      if (a2) {
        v61 = @"sortPriority";
      }
      else {
        v61 = @"sort_priority";
      }
      [v4 setObject:v60 forKey:v61];

      int v59 = *(_DWORD *)(a1 + 184);
    }
    if ((v59 & 2) != 0)
    {
      uint64_t v62 = *(int *)(a1 + 168);
      if (v62 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 168));
        v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v63 = off_1E53DD6D8[v62];
      }
      if (a2) {
        v64 = @"autocompleteResultCellType";
      }
      else {
        v64 = @"autocomplete_result_cell_type";
      }
      [v4 setObject:v63 forKey:v64];
    }
    v65 = [(id)a1 serverResultScoreMetadata];
    v66 = v65;
    if (v65)
    {
      if (a2)
      {
        v67 = [v65 jsonRepresentation];
        id v68 = @"serverResultScoreMetadata";
      }
      else
      {
        v67 = [v65 dictionaryRepresentation];
        id v68 = @"server_result_score_metadata";
      }
      id v69 = v67;

      [v4 setObject:v69 forKey:v68];
    }

    if ((*(unsigned char *)(a1 + 184) & 0x10) != 0)
    {
      v70 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 180)];
      if (a2) {
        v71 = @"enableQueryAcceleratorAffordance";
      }
      else {
        v71 = @"enable_query_accelerator_affordance";
      }
      [v4 setObject:v70 forKey:v71];
    }
    v72 = [(id)a1 queryAcceleratorCompletionString];
    if (v72)
    {
      if (a2) {
        id v73 = @"queryAcceleratorCompletionString";
      }
      else {
        id v73 = @"query_accelerator_completion_string";
      }
      [v4 setObject:v72 forKey:v73];
    }

    v74 = [(id)a1 collection];
    v75 = v74;
    if (v74)
    {
      if (a2) {
        [v74 jsonRepresentation];
      }
      else {
      id v76 = [v74 dictionaryRepresentation];
      }

      [v4 setObject:v76 forKey:@"collection"];
    }

    v77 = [(id)a1 publisher];
    v78 = v77;
    if (v77)
    {
      if (a2) {
        [v77 jsonRepresentation];
      }
      else {
      id v79 = [v77 dictionaryRepresentation];
      }

      [v4 setObject:v79 forKey:@"publisher"];
    }

    if (*(unsigned char *)(a1 + 184))
    {
      v80 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 164)];
      if (a2) {
        v81 = @"autocompleteOriginationTypeNumber";
      }
      else {
        v81 = @"autocomplete_origination_type_number";
      }
      [v4 setObject:v80 forKey:v81];
    }
    v82 = *(void **)(a1 + 16);
    if (v82)
    {
      v83 = [v82 dictionaryRepresentation];
      uint64_t v84 = v83;
      if (a2)
      {
        v85 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v83, "count"));
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __52__GEOPDAutocompleteEntry__dictionaryRepresentation___block_invoke;
        v90[3] = &unk_1E53D8860;
        id v86 = v85;
        id v91 = v86;
        [v84 enumerateKeysAndObjectsUsingBlock:v90];
        id v87 = v86;

        uint64_t v84 = v87;
      }
      [v4 setObject:v84 forKey:@"Unknown Fields"];
    }
    id v88 = v4;
  }
  else
  {
    id v88 = 0;
  }

  return v88;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDAutocompleteEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDAutocompleteEntry)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntry *)-[GEOPDAutocompleteEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDAutocompleteEntry)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntry *)-[GEOPDAutocompleteEntry _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDAutocompleteEntry *)self readAll:0];
    if (self->_highlightMain) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_highlightExtra)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_query)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_business)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_address)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_category)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_brandProfile)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_offlineArea)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_clientResolved)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_directionIntent)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_retainSearch)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_parsecRankingFeatures)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
      $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_serverResultScoreMetadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_queryAcceleratorCompletionString)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_collection)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_publisher)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDAutocompleteEntry _readAddress]((uint64_t)self);
  if ([(GEOPDAutocompleteEntryAddress *)self->_address hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteEntry _readBusiness]((uint64_t)self);
  if ([(GEOPDAutocompleteEntryBusiness *)self->_business hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteEntry _readCollection]((uint64_t)self);
  if ([(GEOPDAutocompleteEntryCollection *)self->_collection hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteEntry _readOfflineArea]((uint64_t)self);
  if ([(GEOPDAutocompleteEntryOfflineArea *)self->_offlineArea hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteEntry _readPublisher]((uint64_t)self);
  if ([(GEOPDAutocompleteEntryPublisher *)self->_publisher hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteEntry _readQuery]((uint64_t)self);
  query = self->_query;

  return [(GEOPDAutocompleteEntryQuery *)query hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOPDAutocompleteEntry *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 38) = self->_readerMarkPos;
  *((_DWORD *)v6 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_highlightMain) {
    objc_msgSend(v6, "setHighlightMain:");
  }
  if (self->_highlightExtra) {
    objc_msgSend(v6, "setHighlightExtra:");
  }
  int v4 = v6;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v6 + 44) = self->_type;
    *((_DWORD *)v6 + 46) |= 8u;
  }
  if (self->_query)
  {
    objc_msgSend(v6, "setQuery:");
    int v4 = v6;
  }
  if (self->_business)
  {
    objc_msgSend(v6, "setBusiness:");
    int v4 = v6;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
    int v4 = v6;
  }
  if (self->_category)
  {
    objc_msgSend(v6, "setCategory:");
    int v4 = v6;
  }
  if (self->_brandProfile)
  {
    objc_msgSend(v6, "setBrandProfile:");
    int v4 = v6;
  }
  if (self->_offlineArea)
  {
    objc_msgSend(v6, "setOfflineArea:");
    int v4 = v6;
  }
  if (self->_clientResolved)
  {
    objc_msgSend(v6, "setClientResolved:");
    int v4 = v6;
  }
  if (self->_directionIntent)
  {
    objc_msgSend(v6, "setDirectionIntent:");
    int v4 = v6;
  }
  if (self->_retainSearch)
  {
    objc_msgSend(v6, "setRetainSearch:");
    int v4 = v6;
  }
  if (self->_parsecRankingFeatures)
  {
    objc_msgSend(v6, "setParsecRankingFeatures:");
    int v4 = v6;
  }
  $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *((_DWORD *)v4 + 43) = self->_sortPriority;
    *((_DWORD *)v4 + 46) |= 4u;
    $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_autocompleteResultCellType;
    *((_DWORD *)v4 + 46) |= 2u;
  }
  if (self->_serverResultScoreMetadata)
  {
    objc_msgSend(v6, "setServerResultScoreMetadata:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((unsigned char *)v4 + 180) = self->_enableQueryAcceleratorAffordance;
    *((_DWORD *)v4 + 46) |= 0x10u;
  }
  if (self->_queryAcceleratorCompletionString)
  {
    objc_msgSend(v6, "setQueryAcceleratorCompletionString:");
    int v4 = v6;
  }
  if (self->_collection)
  {
    objc_msgSend(v6, "setCollection:");
    int v4 = v6;
  }
  if (self->_publisher)
  {
    objc_msgSend(v6, "setPublisher:");
    int v4 = v6;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 41) = self->_autocompleteOriginationTypeNumber;
    *((_DWORD *)v4 + 46) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteEntry *)self readAll:0];
  id v9 = [(GEOPDAutocompleteEntryHighlightLine *)self->_highlightMain copyWithZone:a3];
  id v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  id v11 = [(GEOPDAutocompleteEntryHighlightLine *)self->_highlightExtra copyWithZone:a3];
  v12 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v11;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 176) = self->_type;
    *(_DWORD *)(v5 + 184) |= 8u;
  }
  id v13 = [(GEOPDAutocompleteEntryQuery *)self->_query copyWithZone:a3];
  id v14 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v13;

  id v15 = [(GEOPDAutocompleteEntryBusiness *)self->_business copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  id v17 = [(GEOPDAutocompleteEntryAddress *)self->_address copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  id v19 = [(GEOPDAutocompleteEntryCategory *)self->_category copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  id v21 = [(GEOPDAutocompleteEntryBrandProfile *)self->_brandProfile copyWithZone:a3];
  id v22 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v21;

  id v23 = [(GEOPDAutocompleteEntryOfflineArea *)self->_offlineArea copyWithZone:a3];
  v24 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v23;

  id v25 = [(GEOPDAutocompleteEntryClientResolved *)self->_clientResolved copyWithZone:a3];
  v26 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v25;

  id v27 = [(GEOPDAutocompleteEntryDirectionIntent *)self->_directionIntent copyWithZone:a3];
  id v28 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v27;

  id v29 = [(GEOPDRetainedSearchMetadata *)self->_retainSearch copyWithZone:a3];
  v30 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v29;

  id v31 = [(GEOPDParsecRankingFeatures *)self->_parsecRankingFeatures copyWithZone:a3];
  v32 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v31;

  $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 172) = self->_sortPriority;
    *(_DWORD *)(v5 + 184) |= 4u;
    $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_autocompleteResultCellType;
    *(_DWORD *)(v5 + 184) |= 2u;
  }
  id v34 = [(GEOPDServerResultScoreMetadata *)self->_serverResultScoreMetadata copyWithZone:a3];
  v35 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v34;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 180) = self->_enableQueryAcceleratorAffordance;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
  uint64_t v36 = [(NSString *)self->_queryAcceleratorCompletionString copyWithZone:a3];
  v37 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v36;

  id v38 = [(GEOPDAutocompleteEntryCollection *)self->_collection copyWithZone:a3];
  v39 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v38;

  id v40 = [(GEOPDAutocompleteEntryPublisher *)self->_publisher copyWithZone:a3];
  v41 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v40;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 164) = self->_autocompleteOriginationTypeNumber;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  v42 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v42;
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  [(GEOPDAutocompleteEntry *)self readAll:1];
  [v4 readAll:1];
  highlightMain = self->_highlightMain;
  if ((unint64_t)highlightMain | *((void *)v4 + 11))
  {
    if (!-[GEOPDAutocompleteEntryHighlightLine isEqual:](highlightMain, "isEqual:")) {
      goto LABEL_63;
    }
  }
  highlightExtra = self->_highlightExtra;
  if ((unint64_t)highlightExtra | *((void *)v4 + 10))
  {
    if (!-[GEOPDAutocompleteEntryHighlightLine isEqual:](highlightExtra, "isEqual:")) {
      goto LABEL_63;
    }
  }
  int v7 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_type != *((_DWORD *)v4 + 44)) {
      goto LABEL_63;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_63;
  }
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 16) && !-[GEOPDAutocompleteEntryQuery isEqual:](query, "isEqual:")) {
    goto LABEL_63;
  }
  business = self->_business;
  if ((unint64_t)business | *((void *)v4 + 5))
  {
    if (!-[GEOPDAutocompleteEntryBusiness isEqual:](business, "isEqual:")) {
      goto LABEL_63;
    }
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 3))
  {
    if (!-[GEOPDAutocompleteEntryAddress isEqual:](address, "isEqual:")) {
      goto LABEL_63;
    }
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 6))
  {
    if (!-[GEOPDAutocompleteEntryCategory isEqual:](category, "isEqual:")) {
      goto LABEL_63;
    }
  }
  brandProfile = self->_brandProfile;
  if ((unint64_t)brandProfile | *((void *)v4 + 4))
  {
    if (!-[GEOPDAutocompleteEntryBrandProfile isEqual:](brandProfile, "isEqual:")) {
      goto LABEL_63;
    }
  }
  offlineArea = self->_offlineArea;
  if ((unint64_t)offlineArea | *((void *)v4 + 12))
  {
    if (!-[GEOPDAutocompleteEntryOfflineArea isEqual:](offlineArea, "isEqual:")) {
      goto LABEL_63;
    }
  }
  clientResolved = self->_clientResolved;
  if ((unint64_t)clientResolved | *((void *)v4 + 7))
  {
    if (!-[GEOPDAutocompleteEntryClientResolved isEqual:](clientResolved, "isEqual:")) {
      goto LABEL_63;
    }
  }
  directionIntent = self->_directionIntent;
  if ((unint64_t)directionIntent | *((void *)v4 + 9))
  {
    if (!-[GEOPDAutocompleteEntryDirectionIntent isEqual:](directionIntent, "isEqual:")) {
      goto LABEL_63;
    }
  }
  retainSearch = self->_retainSearch;
  if ((unint64_t)retainSearch | *((void *)v4 + 17))
  {
    if (!-[GEOPDRetainedSearchMetadata isEqual:](retainSearch, "isEqual:")) {
      goto LABEL_63;
    }
  }
  parsecRankingFeatures = self->_parsecRankingFeatures;
  if ((unint64_t)parsecRankingFeatures | *((void *)v4 + 13))
  {
    if (!-[GEOPDParsecRankingFeatures isEqual:](parsecRankingFeatures, "isEqual:")) {
      goto LABEL_63;
    }
  }
  $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  int v19 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_sortPriority != *((_DWORD *)v4 + 43)) {
      goto LABEL_63;
    }
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_autocompleteResultCellType != *((_DWORD *)v4 + 42)) {
      goto LABEL_63;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_63;
  }
  serverResultScoreMetadata = self->_serverResultScoreMetadata;
  if ((unint64_t)serverResultScoreMetadata | *((void *)v4 + 18))
  {
    if (!-[GEOPDServerResultScoreMetadata isEqual:](serverResultScoreMetadata, "isEqual:")) {
      goto LABEL_63;
    }
    $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
    int v19 = *((_DWORD *)v4 + 46);
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v19 & 0x10) != 0)
    {
      if (self->_enableQueryAcceleratorAffordance)
      {
        if (!*((unsigned char *)v4 + 180)) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }
      if (!*((unsigned char *)v4 + 180)) {
        goto LABEL_52;
      }
    }
LABEL_63:
    BOOL v24 = 0;
    goto LABEL_64;
  }
  if ((v19 & 0x10) != 0) {
    goto LABEL_63;
  }
LABEL_52:
  queryAcceleratorCompletionString = self->_queryAcceleratorCompletionString;
  if ((unint64_t)queryAcceleratorCompletionString | *((void *)v4 + 15)
    && !-[NSString isEqual:](queryAcceleratorCompletionString, "isEqual:"))
  {
    goto LABEL_63;
  }
  collection = self->_collection;
  if ((unint64_t)collection | *((void *)v4 + 8))
  {
    if (!-[GEOPDAutocompleteEntryCollection isEqual:](collection, "isEqual:")) {
      goto LABEL_63;
    }
  }
  publisher = self->_publisher;
  if ((unint64_t)publisher | *((void *)v4 + 14))
  {
    if (!-[GEOPDAutocompleteEntryPublisher isEqual:](publisher, "isEqual:")) {
      goto LABEL_63;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((_DWORD *)v4 + 46) & 1) == 0 || self->_autocompleteOriginationTypeNumber != *((_DWORD *)v4 + 41)) {
      goto LABEL_63;
    }
    BOOL v24 = 1;
  }
  else
  {
    BOOL v24 = (*((_DWORD *)v4 + 46) & 1) == 0;
  }
LABEL_64:

  return v24;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteEntry *)self readAll:1];
  unint64_t v25 = [(GEOPDAutocompleteEntryHighlightLine *)self->_highlightMain hash];
  unint64_t v24 = [(GEOPDAutocompleteEntryHighlightLine *)self->_highlightExtra hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v23 = 2654435761 * self->_type;
  }
  else {
    uint64_t v23 = 0;
  }
  unint64_t v22 = [(GEOPDAutocompleteEntryQuery *)self->_query hash];
  unint64_t v21 = [(GEOPDAutocompleteEntryBusiness *)self->_business hash];
  unint64_t v20 = [(GEOPDAutocompleteEntryAddress *)self->_address hash];
  unint64_t v19 = [(GEOPDAutocompleteEntryCategory *)self->_category hash];
  unint64_t v18 = [(GEOPDAutocompleteEntryBrandProfile *)self->_brandProfile hash];
  unint64_t v17 = [(GEOPDAutocompleteEntryOfflineArea *)self->_offlineArea hash];
  unint64_t v16 = [(GEOPDAutocompleteEntryClientResolved *)self->_clientResolved hash];
  unint64_t v15 = [(GEOPDAutocompleteEntryDirectionIntent *)self->_directionIntent hash];
  unint64_t v14 = [(GEOPDRetainedSearchMetadata *)self->_retainSearch hash];
  unint64_t v13 = [(GEOPDParsecRankingFeatures *)self->_parsecRankingFeatures hash];
  $EC00EBA47C74C596B32E42AC7A87C130 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_sortPriority;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
LABEL_6:
      uint64_t v5 = 2654435761 * self->_autocompleteResultCellType;
      goto LABEL_9;
    }
  }
  uint64_t v5 = 0;
LABEL_9:
  unint64_t v6 = [(GEOPDServerResultScoreMetadata *)self->_serverResultScoreMetadata hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v7 = 2654435761 * self->_enableQueryAcceleratorAffordance;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_queryAcceleratorCompletionString hash];
  unint64_t v9 = [(GEOPDAutocompleteEntryCollection *)self->_collection hash];
  unint64_t v10 = [(GEOPDAutocompleteEntryPublisher *)self->_publisher hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v11 = 2654435761 * self->_autocompleteOriginationTypeNumber;
  }
  else {
    uint64_t v11 = 0;
  }
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  v37 = a3;
  [v37 readAll:0];
  uint64_t v4 = v37;
  highlightMain = self->_highlightMain;
  uint64_t v6 = v37[11];
  if (highlightMain)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPDAutocompleteEntryHighlightLine mergeFrom:](highlightMain, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPDAutocompleteEntry setHighlightMain:](self, "setHighlightMain:");
  }
  uint64_t v4 = v37;
LABEL_7:
  highlightExtra = self->_highlightExtra;
  uint64_t v8 = v4[10];
  if (highlightExtra)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOPDAutocompleteEntryHighlightLine mergeFrom:](highlightExtra, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOPDAutocompleteEntry setHighlightExtra:](self, "setHighlightExtra:");
  }
  uint64_t v4 = v37;
LABEL_13:
  if ((v4[23] & 8) != 0)
  {
    self->_type = *((_DWORD *)v4 + 44);
    *(_DWORD *)&self->_flags |= 8u;
  }
  query = self->_query;
  uint64_t v10 = v4[16];
  if (query)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDAutocompleteEntryQuery mergeFrom:](query, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDAutocompleteEntry setQuery:](self, "setQuery:");
  }
  uint64_t v4 = v37;
LABEL_21:
  business = self->_business;
  uint64_t v12 = v4[5];
  if (business)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDAutocompleteEntryBusiness mergeFrom:](business, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDAutocompleteEntry setBusiness:](self, "setBusiness:");
  }
  uint64_t v4 = v37;
LABEL_27:
  address = self->_address;
  uint64_t v14 = v4[3];
  if (address)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOPDAutocompleteEntryAddress mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOPDAutocompleteEntry setAddress:](self, "setAddress:");
  }
  uint64_t v4 = v37;
LABEL_33:
  category = self->_category;
  uint64_t v16 = v4[6];
  if (category)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOPDAutocompleteEntryCategory mergeFrom:](category, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOPDAutocompleteEntry setCategory:](self, "setCategory:");
  }
  uint64_t v4 = v37;
LABEL_39:
  brandProfile = self->_brandProfile;
  uint64_t v18 = v4[4];
  if (brandProfile)
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOPDAutocompleteEntryBrandProfile mergeFrom:](brandProfile, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOPDAutocompleteEntry setBrandProfile:](self, "setBrandProfile:");
  }
  uint64_t v4 = v37;
LABEL_45:
  offlineArea = self->_offlineArea;
  uint64_t v20 = v4[12];
  if (offlineArea)
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOPDAutocompleteEntryOfflineArea mergeFrom:](offlineArea, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOPDAutocompleteEntry setOfflineArea:](self, "setOfflineArea:");
  }
  uint64_t v4 = v37;
LABEL_51:
  clientResolved = self->_clientResolved;
  uint64_t v22 = v4[7];
  if (clientResolved)
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOPDAutocompleteEntryClientResolved mergeFrom:](clientResolved, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOPDAutocompleteEntry setClientResolved:](self, "setClientResolved:");
  }
  uint64_t v4 = v37;
LABEL_57:
  directionIntent = self->_directionIntent;
  uint64_t v24 = v4[9];
  if (directionIntent)
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOPDAutocompleteEntryDirectionIntent mergeFrom:](directionIntent, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOPDAutocompleteEntry setDirectionIntent:](self, "setDirectionIntent:");
  }
  uint64_t v4 = v37;
LABEL_63:
  retainSearch = self->_retainSearch;
  v26 = (void *)v4[17];
  if (retainSearch)
  {
    if (!v26) {
      goto LABEL_69;
    }
    -[GEOPDRetainedSearchMetadata mergeFrom:]((uint64_t)retainSearch, v26);
  }
  else
  {
    if (!v26) {
      goto LABEL_69;
    }
    [(GEOPDAutocompleteEntry *)self setRetainSearch:v4[17]];
  }
  uint64_t v4 = v37;
LABEL_69:
  parsecRankingFeatures = self->_parsecRankingFeatures;
  uint64_t v28 = v4[13];
  if (parsecRankingFeatures)
  {
    if (!v28) {
      goto LABEL_75;
    }
    -[GEOPDParsecRankingFeatures mergeFrom:](parsecRankingFeatures, "mergeFrom:");
  }
  else
  {
    if (!v28) {
      goto LABEL_75;
    }
    -[GEOPDAutocompleteEntry setParsecRankingFeatures:](self, "setParsecRankingFeatures:");
  }
  uint64_t v4 = v37;
LABEL_75:
  int v29 = *((_DWORD *)v4 + 46);
  if ((v29 & 4) != 0)
  {
    self->_sortPriority = *((_DWORD *)v4 + 43);
    *(_DWORD *)&self->_flags |= 4u;
    int v29 = *((_DWORD *)v4 + 46);
  }
  if ((v29 & 2) != 0)
  {
    self->_autocompleteResultCellType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 2u;
  }
  serverResultScoreMetadata = self->_serverResultScoreMetadata;
  id v31 = (void *)v4[18];
  if (serverResultScoreMetadata)
  {
    if (!v31) {
      goto LABEL_87;
    }
    v32 = v31;
    if ((_BYTE)v32[5])
    {
      serverResultScoreMetadata->_normalizedScore = v32[4];
      *(unsigned char *)&serverResultScoreMetadata->_flags |= 1u;
    }
  }
  else
  {
    if (!v31) {
      goto LABEL_87;
    }
    -[GEOPDAutocompleteEntry setServerResultScoreMetadata:](self, "setServerResultScoreMetadata:");
  }
  uint64_t v4 = v37;
LABEL_87:
  if ((v4[23] & 0x10) != 0)
  {
    self->_enableQueryAcceleratorAffordance = *((unsigned char *)v4 + 180);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (v4[15])
  {
    -[GEOPDAutocompleteEntry setQueryAcceleratorCompletionString:](self, "setQueryAcceleratorCompletionString:");
    uint64_t v4 = v37;
  }
  collection = self->_collection;
  uint64_t v34 = v4[8];
  if (collection)
  {
    if (!v34) {
      goto LABEL_97;
    }
    -[GEOPDAutocompleteEntryCollection mergeFrom:](collection, "mergeFrom:");
  }
  else
  {
    if (!v34) {
      goto LABEL_97;
    }
    -[GEOPDAutocompleteEntry setCollection:](self, "setCollection:");
  }
  uint64_t v4 = v37;
LABEL_97:
  publisher = self->_publisher;
  uint64_t v36 = v4[14];
  if (publisher)
  {
    if (!v36) {
      goto LABEL_103;
    }
    -[GEOPDAutocompleteEntryPublisher mergeFrom:](publisher, "mergeFrom:");
  }
  else
  {
    if (!v36) {
      goto LABEL_103;
    }
    -[GEOPDAutocompleteEntry setPublisher:](self, "setPublisher:");
  }
  uint64_t v4 = v37;
LABEL_103:
  if (v4[23])
  {
    self->_autocompleteOriginationTypeNumber = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 1u;
  }

  MEMORY[0x1F4181870]();
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteEntry *)self readAll:0];
    [(GEOPDAutocompleteEntryHighlightLine *)self->_highlightMain clearUnknownFields:1];
    [(GEOPDAutocompleteEntryHighlightLine *)self->_highlightExtra clearUnknownFields:1];
    [(GEOPDAutocompleteEntryQuery *)self->_query clearUnknownFields:1];
    [(GEOPDAutocompleteEntryBusiness *)self->_business clearUnknownFields:1];
    [(GEOPDAutocompleteEntryAddress *)self->_address clearUnknownFields:1];
    [(GEOPDAutocompleteEntryCategory *)self->_category clearUnknownFields:1];
    [(GEOPDAutocompleteEntryBrandProfile *)self->_brandProfile clearUnknownFields:1];
    [(GEOPDAutocompleteEntryOfflineArea *)self->_offlineArea clearUnknownFields:1];
    [(GEOPDAutocompleteEntryClientResolved *)self->_clientResolved clearUnknownFields:1];
    [(GEOPDAutocompleteEntryDirectionIntent *)self->_directionIntent clearUnknownFields:1];
    -[GEOPDRetainedSearchMetadata clearUnknownFields:]((uint64_t)self->_retainSearch, 1);
    [(GEOPDParsecRankingFeatures *)self->_parsecRankingFeatures clearUnknownFields:1];
    serverResultScoreMetadata = self->_serverResultScoreMetadata;
    if (serverResultScoreMetadata)
    {
      uint64_t v8 = serverResultScoreMetadata->_unknownFields;
      serverResultScoreMetadata->_unknownFields = 0;
    }
    [(GEOPDAutocompleteEntryCollection *)self->_collection clearUnknownFields:1];
    publisher = self->_publisher;
    [(GEOPDAutocompleteEntryPublisher *)publisher clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverResultScoreMetadata, 0);
  objc_storeStrong((id *)&self->_retainSearch, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryAcceleratorCompletionString, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_parsecRankingFeatures, 0);
  objc_storeStrong((id *)&self->_offlineArea, 0);
  objc_storeStrong((id *)&self->_highlightMain, 0);
  objc_storeStrong((id *)&self->_highlightExtra, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_clientResolved, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_business, 0);
  objc_storeStrong((id *)&self->_brandProfile, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end