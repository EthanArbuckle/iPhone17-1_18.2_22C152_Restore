@interface GEOPDAutocompleteParametersVenueSearch
+ (BOOL)isValid:(id)a3;
+ (Class)categoryType;
- (BOOL)hasBuildingId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHighlightDiff;
- (BOOL)hasLevelId;
- (BOOL)hasMaxResults;
- (BOOL)hasQuery;
- (BOOL)hasSectionId;
- (BOOL)hasVenueId;
- (BOOL)hasViewportInfo;
- (BOOL)highlightDiff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteParametersVenueSearch)init;
- (GEOPDAutocompleteParametersVenueSearch)initWithData:(id)a3;
- (GEOPDAutocompleteParametersVenueSearch)initWithDictionary:(id)a3;
- (GEOPDAutocompleteParametersVenueSearch)initWithJSON:(id)a3;
- (GEOPDViewportInfo)viewportInfo;
- (NSMutableArray)categorys;
- (NSString)query;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)categoryAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)maxResults;
- (unint64_t)buildingId;
- (unint64_t)categorysCount;
- (unint64_t)hash;
- (unint64_t)levelId;
- (unint64_t)sectionId;
- (unint64_t)venueId;
- (void)_addNoFlagsCategory:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCategorys;
- (void)_readQuery;
- (void)_readViewportInfo;
- (void)addCategory:(id)a3;
- (void)clearCategorys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBuildingId:(unint64_t)a3;
- (void)setCategorys:(id)a3;
- (void)setHasBuildingId:(BOOL)a3;
- (void)setHasHighlightDiff:(BOOL)a3;
- (void)setHasLevelId:(BOOL)a3;
- (void)setHasMaxResults:(BOOL)a3;
- (void)setHasSectionId:(BOOL)a3;
- (void)setHasVenueId:(BOOL)a3;
- (void)setHighlightDiff:(BOOL)a3;
- (void)setLevelId:(unint64_t)a3;
- (void)setMaxResults:(int)a3;
- (void)setQuery:(id)a3;
- (void)setSectionId:(unint64_t)a3;
- (void)setVenueId:(unint64_t)a3;
- (void)setViewportInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteParametersVenueSearch

- (GEOPDAutocompleteParametersVenueSearch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersVenueSearch;
  v2 = [(GEOPDAutocompleteParametersVenueSearch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersVenueSearch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersVenueSearch;
  v3 = [(GEOPDAutocompleteParametersVenueSearch *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersVenueSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_1445);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDAutocompleteParametersVenueSearch _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersVenueSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_1446);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasViewportInfo
{
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersVenueSearch _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (int)maxResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_maxResults;
  }
  else {
    return 15;
  }
}

- (void)setMaxResults:(int)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1040;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasMaxResults
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)highlightDiff
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x20) != 0 && self->_highlightDiff;
}

- (void)setHighlightDiff:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  self->_highlightDiff = a3;
}

- (void)setHasHighlightDiff:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1056;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasHighlightDiff
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unint64_t)venueId
{
  return self->_venueId;
}

- (void)setVenueId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_venueId = a3;
}

- (void)setHasVenueId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1032;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasVenueId
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)levelId
{
  return self->_levelId;
}

- (void)setLevelId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_levelId = a3;
}

- (void)setHasLevelId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLevelId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)sectionId
{
  return self->_sectionId;
}

- (void)setSectionId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_sectionId = a3;
}

- (void)setHasSectionId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1028;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSectionId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)buildingId
{
  return self->_buildingId;
}

- (void)setBuildingId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_buildingId = a3;
}

- (void)setHasBuildingId:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasBuildingId
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersVenueSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)categorys
{
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  categorys = self->_categorys;

  return categorys;
}

- (void)setCategorys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  categorys = self->_categorys;
  self->_categorys = v4;
}

- (void)clearCategorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  categorys = self->_categorys;

  [(NSMutableArray *)categorys removeAllObjects];
}

- (void)addCategory:(id)a3
{
  id v4 = a3;
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  -[GEOPDAutocompleteParametersVenueSearch _addNoFlagsCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsCategory:(uint64_t)a1
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

- (unint64_t)categorysCount
{
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  categorys = self->_categorys;

  return [(NSMutableArray *)categorys count];
}

- (id)categoryAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  categorys = self->_categorys;

  return (id)[(NSMutableArray *)categorys objectAtIndex:a3];
}

+ (Class)categoryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteParametersVenueSearch;
  id v4 = [(GEOPDAutocompleteParametersVenueSearch *)&v8 description];
  id v5 = [(GEOPDAutocompleteParametersVenueSearch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersVenueSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_25;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 query];
  if (v5) {
    [v4 setObject:v5 forKey:@"query"];
  }

  objc_super v6 = [(id)a1 viewportInfo];
  id v7 = v6;
  if (v6)
  {
    if (a2)
    {
      objc_super v8 = [v6 jsonRepresentation];
      v9 = @"viewportInfo";
    }
    else
    {
      objc_super v8 = [v6 dictionaryRepresentation];
      v9 = @"viewport_info";
    }
    [v4 setObject:v8 forKey:v9];
  }
  __int16 v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 0x10) != 0)
  {
    v21 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
    if (a2) {
      v22 = @"maxResults";
    }
    else {
      v22 = @"max_results";
    }
    [v4 setObject:v21 forKey:v22];

    __int16 v10 = *(_WORD *)(a1 + 100);
    if ((v10 & 0x20) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_36;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
  if (a2) {
    v24 = @"highlightDiff";
  }
  else {
    v24 = @"highlight_diff";
  }
  [v4 setObject:v23 forKey:v24];

  __int16 v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 8) == 0)
  {
LABEL_12:
    if ((v10 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_36:
  v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
  if (a2) {
    v26 = @"venueId";
  }
  else {
    v26 = @"venue_id";
  }
  [v4 setObject:v25 forKey:v26];

  __int16 v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 2) == 0)
  {
LABEL_13:
    if ((v10 & 4) == 0) {
      goto LABEL_14;
    }
LABEL_44:
    v29 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    if (a2) {
      v30 = @"sectionId";
    }
    else {
      v30 = @"section_id";
    }
    [v4 setObject:v29 forKey:v30];

    if ((*(_WORD *)(a1 + 100) & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
LABEL_40:
  v27 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  if (a2) {
    v28 = @"levelId";
  }
  else {
    v28 = @"level_id";
  }
  [v4 setObject:v27 forKey:v28];

  __int16 v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 4) != 0) {
    goto LABEL_44;
  }
LABEL_14:
  if (v10)
  {
LABEL_15:
    v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    if (a2) {
      v12 = @"buildingId";
    }
    else {
      v12 = @"building_id";
    }
    [v4 setObject:v11 forKey:v12];
  }
LABEL_19:
  if (*(void *)(a1 + 32))
  {
    v13 = [(id)a1 categorys];
    [v4 setObject:v13 forKey:@"category"];
  }
  v14 = *(void **)(a1 + 16);
  if (v14)
  {
    v15 = [v14 dictionaryRepresentation];
    v16 = v15;
    if (a2)
    {
      v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__GEOPDAutocompleteParametersVenueSearch__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E53D8860;
      id v18 = v17;
      id v32 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v31];
      id v19 = v18;

      v16 = v19;
    }
    [v4 setObject:v16 forKey:@"Unknown Fields"];
  }
LABEL_25:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteParametersVenueSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __68__GEOPDAutocompleteParametersVenueSearch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDAutocompleteParametersVenueSearch)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersVenueSearch *)-[GEOPDAutocompleteParametersVenueSearch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"query"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setQuery:v7];
      }
      if (a3) {
        objc_super v8 = @"viewportInfo";
      }
      else {
        objc_super v8 = @"viewport_info";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOPDViewportInfo alloc];
        if (a3) {
          uint64_t v11 = [(GEOPDViewportInfo *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOPDViewportInfo *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setViewportInfo:v11];
      }
      if (a3) {
        v13 = @"maxResults";
      }
      else {
        v13 = @"max_results";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxResults:", objc_msgSend(v14, "intValue"));
      }

      if (a3) {
        v15 = @"highlightDiff";
      }
      else {
        v15 = @"highlight_diff";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHighlightDiff:", objc_msgSend(v16, "BOOLValue"));
      }

      if (a3) {
        v17 = @"venueId";
      }
      else {
        v17 = @"venue_id";
      }
      id v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVenueId:", objc_msgSend(v18, "unsignedLongLongValue"));
      }

      if (a3) {
        id v19 = @"levelId";
      }
      else {
        id v19 = @"level_id";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLevelId:", objc_msgSend(v20, "unsignedLongLongValue"));
      }

      if (a3) {
        v21 = @"sectionId";
      }
      else {
        v21 = @"section_id";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSectionId:", objc_msgSend(v22, "unsignedLongLongValue"));
      }

      if (a3) {
        v23 = @"buildingId";
      }
      else {
        v23 = @"building_id";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBuildingId:", objc_msgSend(v24, "unsignedLongLongValue"));
      }

      v25 = [v5 objectForKeyedSubscript:@"category"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v35 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v32 = objc_msgSend(v31, "copy", (void)v34);
                [a1 addCategory:v32];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v28);
        }
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteParametersVenueSearch)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersVenueSearch *)-[GEOPDAutocompleteParametersVenueSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1474;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1475;
    }
    GEOPDAutocompleteParametersVenueSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDViewportInfo *)self->_viewportInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersVenueSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersVenueSearchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x780) == 0)
    {
      uint64_t v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParametersVenueSearch *)self readAll:0];
  if (self->_query) {
    PBDataWriterWriteStringField();
  }
  if (self->_viewportInfo) {
    PBDataWriterWriteSubmessage();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_9:
      if ((flags & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0) {
      goto LABEL_12;
    }
LABEL_26:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_26;
  }
LABEL_12:
  if (flags) {
LABEL_13:
  }
    PBDataWriterWriteUint64Field();
LABEL_14:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_categorys;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_29:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDAutocompleteParametersVenueSearch _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return [(GEOPDViewportInfo *)viewportInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOPDAutocompleteParametersVenueSearch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 20) = self->_readerMarkPos;
  *((_DWORD *)v9 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query) {
    objc_msgSend(v9, "setQuery:");
  }
  if (self->_viewportInfo) {
    objc_msgSend(v9, "setViewportInfo:");
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v9 + 23) = self->_maxResults;
    *((_WORD *)v9 + 50) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v9 + 96) = self->_highlightDiff;
  *((_WORD *)v9 + 50) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v9[8] = self->_venueId;
  *((_WORD *)v9 + 50) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 4) == 0) {
      goto LABEL_10;
    }
LABEL_23:
    v9[7] = self->_sectionId;
    *((_WORD *)v9 + 50) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_22:
  v9[5] = self->_levelId;
  *((_WORD *)v9 + 50) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_23;
  }
LABEL_10:
  if (flags)
  {
LABEL_11:
    v9[3] = self->_buildingId;
    *((_WORD *)v9 + 50) |= 1u;
  }
LABEL_12:
  if ([(GEOPDAutocompleteParametersVenueSearch *)self categorysCount])
  {
    [v9 clearCategorys];
    unint64_t v5 = [(GEOPDAutocompleteParametersVenueSearch *)self categorysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPDAutocompleteParametersVenueSearch *)self categoryAtIndex:i];
        [v9 addCategory:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteParametersVenueSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParametersVenueSearch *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_maxResults;
    *(_WORD *)(v5 + 100) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 96) = self->_highlightDiff;
  *(_WORD *)(v5 + 100) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(void *)(v5 + 64) = self->_venueId;
  *(_WORD *)(v5 + 100) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 4) == 0) {
      goto LABEL_10;
    }
LABEL_25:
    *(void *)(v5 + 56) = self->_sectionId;
    *(_WORD *)(v5 + 100) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_24:
  *(void *)(v5 + 40) = self->_levelId;
  *(_WORD *)(v5 + 100) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_25;
  }
LABEL_10:
  if (flags)
  {
LABEL_11:
    *(void *)(v5 + 24) = self->_buildingId;
    *(_WORD *)(v5 + 100) |= 1u;
  }
LABEL_12:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v14 = self->_categorys;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v5 addCategory:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  id v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  [(GEOPDAutocompleteParametersVenueSearch *)self readAll:1];
  [v4 readAll:1];
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_41;
    }
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 9))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_41;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_maxResults != *((_DWORD *)v4 + 23)) {
      goto LABEL_41;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v8 & 0x20) != 0)
    {
      if (self->_highlightDiff)
      {
        if (!*((unsigned char *)v4 + 96)) {
          goto LABEL_41;
        }
        goto LABEL_19;
      }
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_19;
      }
    }
LABEL_41:
    char v10 = 0;
    goto LABEL_42;
  }
  if ((v8 & 0x20) != 0) {
    goto LABEL_41;
  }
LABEL_19:
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_venueId != *((void *)v4 + 8)) {
      goto LABEL_41;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_levelId != *((void *)v4 + 5)) {
      goto LABEL_41;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_sectionId != *((void *)v4 + 7)) {
      goto LABEL_41;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_41;
  }
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_buildingId != *((void *)v4 + 3)) {
      goto LABEL_41;
    }
  }
  else if (v8)
  {
    goto LABEL_41;
  }
  categorys = self->_categorys;
  if ((unint64_t)categorys | *((void *)v4 + 4)) {
    char v10 = -[NSMutableArray isEqual:](categorys, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_42:

  return v10;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteParametersVenueSearch *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_query hash];
  unint64_t v4 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v6 = 2654435761 * self->_maxResults;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_highlightDiff;
      if ((flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    unint64_t v8 = 2654435761u * self->_venueId;
    if ((flags & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v8 = 0;
  if ((flags & 2) != 0)
  {
LABEL_5:
    unint64_t v9 = 2654435761u * self->_levelId;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t v10 = 0;
    if (flags) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_categorys hash];
  }
LABEL_11:
  unint64_t v9 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  unint64_t v10 = 2654435761u * self->_sectionId;
  if ((flags & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v11 = 2654435761u * self->_buildingId;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_categorys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 6)) {
    -[GEOPDAutocompleteParametersVenueSearch setQuery:](self, "setQuery:");
  }
  viewportInfo = self->_viewportInfo;
  uint64_t v6 = *((void *)v4 + 9);
  if (viewportInfo)
  {
    if (v6) {
      -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPDAutocompleteParametersVenueSearch setViewportInfo:](self, "setViewportInfo:");
  }
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((v7 & 0x10) != 0)
  {
    self->_maxResults = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v7 = *((_WORD *)v4 + 50);
    if ((v7 & 0x20) == 0)
    {
LABEL_10:
      if ((v7 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_25;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_10;
  }
  self->_highlightDiff = *((unsigned char *)v4 + 96);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((v7 & 8) == 0)
  {
LABEL_11:
    if ((v7 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_venueId = *((void *)v4 + 8);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((v7 & 2) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_levelId = *((void *)v4 + 5);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_27:
  self->_sectionId = *((void *)v4 + 7);
  *(_WORD *)&self->_flags |= 4u;
  if (*((_WORD *)v4 + 50))
  {
LABEL_14:
    self->_buildingId = *((void *)v4 + 3);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_15:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 4);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOPDAutocompleteParametersVenueSearch addCategory:](self, "addCategory:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersVenueSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1479);
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
  *(_WORD *)&self->_flags |= 0x440u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteParametersVenueSearch *)self readAll:0];
    viewportInfo = self->_viewportInfo;
    [(GEOPDViewportInfo *)viewportInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end