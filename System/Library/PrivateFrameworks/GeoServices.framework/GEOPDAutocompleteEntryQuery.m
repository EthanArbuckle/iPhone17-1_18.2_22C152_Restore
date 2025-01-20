@interface GEOPDAutocompleteEntryQuery
+ (BOOL)isValid:(id)a3;
+ (Class)resultRefinementType;
- (BOOL)hasCompletion;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasQueryHasAttributeIntentsInRefinements;
- (BOOL)hasShowIntermediateStateTapBehaviorListView;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTapBehavior;
- (BOOL)isEqual:(id)a3;
- (BOOL)queryHasAttributeIntentsInRefinements;
- (BOOL)readFrom:(id)a3;
- (BOOL)showIntermediateStateTapBehaviorListView;
- (GEOPDAutocompleteEntryQuery)init;
- (GEOPDAutocompleteEntryQuery)initWithData:(id)a3;
- (GEOPDAutocompleteEntryQuery)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryQuery)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSMutableArray)resultRefinements;
- (NSString)completion;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resultRefinementAtIndex:(unint64_t)a3;
- (id)tapBehaviorAsString:(int)a3;
- (int)StringAsTapBehavior:(id)a3;
- (int)tapBehavior;
- (unint64_t)hash;
- (unint64_t)resultRefinementsCount;
- (void)_addNoFlagsResultRefinement:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCompletion;
- (void)_readResultRefinements;
- (void)_readStyleAttributes;
- (void)addResultRefinement:(id)a3;
- (void)clearResultRefinements;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setHasQueryHasAttributeIntentsInRefinements:(BOOL)a3;
- (void)setHasShowIntermediateStateTapBehaviorListView:(BOOL)a3;
- (void)setHasTapBehavior:(BOOL)a3;
- (void)setQueryHasAttributeIntentsInRefinements:(BOOL)a3;
- (void)setResultRefinements:(id)a3;
- (void)setShowIntermediateStateTapBehaviorListView:(BOOL)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTapBehavior:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryQuery

- (GEOPDAutocompleteEntryQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryQuery;
  v2 = [(GEOPDAutocompleteEntryQuery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryQuery)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryQuery;
  v3 = [(GEOPDAutocompleteEntryQuery *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCompletion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCompletion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCompletion
{
  return self->_completion != 0;
}

- (NSString)completion
{
  -[GEOPDAutocompleteEntryQuery _readCompletion]((uint64_t)self);
  completion = self->_completion;

  return completion;
}

- (void)setCompletion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_completion, a3);
}

- (int)tapBehavior
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_tapBehavior;
  }
  else {
    return 0;
  }
}

- (void)setTapBehavior:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_tapBehavior = a3;
}

- (void)setHasTapBehavior:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTapBehavior
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)tapBehaviorAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"SHOW_RESULTS_IN_LIST_VIEW";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"SHOW_RESULTS_ON_MAP";
  }
  return v4;
}

- (int)StringAsTapBehavior:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SHOW_RESULTS_ON_MAP"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SHOW_RESULTS_IN_LIST_VIEW"];
  }

  return v4;
}

- (BOOL)showIntermediateStateTapBehaviorListView
{
  return self->_showIntermediateStateTapBehaviorListView;
}

- (void)setShowIntermediateStateTapBehaviorListView:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_showIntermediateStateTapBehaviorListView = a3;
}

- (void)setHasShowIntermediateStateTapBehaviorListView:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasShowIntermediateStateTapBehaviorListView
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readResultRefinements
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinements_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)resultRefinements
{
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  resultRefinements = self->_resultRefinements;

  return resultRefinements;
}

- (void)setResultRefinements:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  resultRefinements = self->_resultRefinements;
  self->_resultRefinements = v4;
}

- (void)clearResultRefinements
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  resultRefinements = self->_resultRefinements;

  [(NSMutableArray *)resultRefinements removeAllObjects];
}

- (void)addResultRefinement:(id)a3
{
  id v4 = a3;
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  -[GEOPDAutocompleteEntryQuery _addNoFlagsResultRefinement:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsResultRefinement:(uint64_t)a1
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

- (unint64_t)resultRefinementsCount
{
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  resultRefinements = self->_resultRefinements;

  return [(NSMutableArray *)resultRefinements count];
}

- (id)resultRefinementAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  resultRefinements = self->_resultRefinements;

  return (id)[(NSMutableArray *)resultRefinements objectAtIndex:a3];
}

+ (Class)resultRefinementType
{
  return (Class)objc_opt_class();
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_774);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPDAutocompleteEntryQuery _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (BOOL)queryHasAttributeIntentsInRefinements
{
  return self->_queryHasAttributeIntentsInRefinements;
}

- (void)setQueryHasAttributeIntentsInRefinements:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_queryHasAttributeIntentsInRefinements = a3;
}

- (void)setHasQueryHasAttributeIntentsInRefinements:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasQueryHasAttributeIntentsInRefinements
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntryQuery;
  id v4 = [(GEOPDAutocompleteEntryQuery *)&v8 description];
  id v5 = [(GEOPDAutocompleteEntryQuery *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryQuery _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 completion];
    if (v5) {
      [v4 setObject:v5 forKey:@"completion"];
    }

    char v6 = *(unsigned char *)(a1 + 68);
    if (v6)
    {
      int v7 = *(_DWORD *)(a1 + 60);
      if (v7)
      {
        if (v7 == 1)
        {
          objc_super v8 = @"SHOW_RESULTS_IN_LIST_VIEW";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_super v8 = @"SHOW_RESULTS_ON_MAP";
      }
      if (a2) {
        v9 = @"tapBehavior";
      }
      else {
        v9 = @"tap_behavior";
      }
      [v4 setObject:v8 forKey:v9];

      char v6 = *(unsigned char *)(a1 + 68);
    }
    if ((v6 & 4) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
      if (a2) {
        v11 = @"showIntermediateStateTapBehaviorListView";
      }
      else {
        v11 = @"show_intermediate_state_tap_behavior_list_view";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"resultRefinement";
      }
      else {
        v20 = @"result_refinement";
      }
      [v4 setObject:v12 forKey:v20];
    }
    v21 = [(id)a1 styleAttributes];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"styleAttributes";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"style_attributes";
      }
      [v4 setObject:v23 forKey:v24];
    }
    if ((*(unsigned char *)(a1 + 68) & 2) != 0)
    {
      v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
      if (a2) {
        v26 = @"queryHasAttributeIntentsInRefinements";
      }
      else {
        v26 = @"query_has_attribute_intents_in_refinements";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __57__GEOPDAutocompleteEntryQuery__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteEntryQuery _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDAutocompleteEntryQuery__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v7 = *(void **)(a1 + 32);
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

- (GEOPDAutocompleteEntryQuery)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryQuery *)-[GEOPDAutocompleteEntryQuery _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_53;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_53;
  }
  char v6 = [v5 objectForKeyedSubscript:@"completion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = (void *)[v6 copy];
    [a1 setCompletion:v7];
  }
  if (a3) {
    objc_super v8 = @"tapBehavior";
  }
  else {
    objc_super v8 = @"tap_behavior";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"SHOW_RESULTS_ON_MAP"]) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = [v10 isEqualToString:@"SHOW_RESULTS_IN_LIST_VIEW"];
    }

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_15:
    [a1 setTapBehavior:v11];
  }

  if (a3) {
    v12 = @"showIntermediateStateTapBehaviorListView";
  }
  else {
    v12 = @"show_intermediate_state_tap_behavior_list_view";
  }
  id v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShowIntermediateStateTapBehaviorListView:", objc_msgSend(v13, "BOOLValue"));
  }

  if (a3) {
    uint64_t v14 = @"resultRefinement";
  }
  else {
    uint64_t v14 = @"result_refinement";
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v34 + 1) + 8 * v20);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = [GEOPDResultRefinement alloc];
            if (v22) {
              v23 = (void *)-[GEOPDResultRefinement _initWithDictionary:isJSON:](v22, v21, a3);
            }
            else {
              v23 = 0;
            }
            [a1 addResultRefinement:v23];
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v24 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
        uint64_t v18 = v24;
      }
      while (v24);
    }

    id v5 = v33;
  }

  if (a3) {
    v25 = @"styleAttributes";
  }
  else {
    v25 = @"style_attributes";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEOStyleAttributes alloc];
    if (a3) {
      uint64_t v28 = [(GEOStyleAttributes *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEOStyleAttributes *)v27 initWithDictionary:v26];
    }
    v29 = (void *)v28;
    [a1 setStyleAttributes:v28];
  }
  if (a3) {
    v30 = @"queryHasAttributeIntentsInRefinements";
  }
  else {
    v30 = @"query_has_attribute_intents_in_refinements";
  }
  id v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setQueryHasAttributeIntentsInRefinements:", objc_msgSend(v31, "BOOLValue"));
  }

LABEL_53:
  return a1;
}

- (GEOPDAutocompleteEntryQuery)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryQuery *)-[GEOPDAutocompleteEntryQuery _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_802;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_803;
    }
    GEOPDAutocompleteEntryQueryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAutocompleteEntryQueryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryQueryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryQueryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDAutocompleteEntryQuery *)self readAll:0];
    if (self->_completion) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v7 = self->_resultRefinements;
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

    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_resultRefinements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[GEOPDResultRefinement hasGreenTeaWithValue:](*(void *)(*((void *)&v12 + 1) + 8 * i), v3))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOPDAutocompleteEntryQuery *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_completion) {
    objc_msgSend(v9, "setCompletion:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v9 + 15) = self->_tapBehavior;
    *((unsigned char *)v9 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v9 + 65) = self->_showIntermediateStateTapBehaviorListView;
    *((unsigned char *)v9 + 68) |= 4u;
  }
  if ([(GEOPDAutocompleteEntryQuery *)self resultRefinementsCount])
  {
    [v9 clearResultRefinements];
    unint64_t v5 = [(GEOPDAutocompleteEntryQuery *)self resultRefinementsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPDAutocompleteEntryQuery *)self resultRefinementAtIndex:i];
        [v9 addResultRefinement:v8];
      }
    }
  }
  if (self->_styleAttributes) {
    objc_msgSend(v9, "setStyleAttributes:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v9 + 64) = self->_queryHasAttributeIntentsInRefinements;
    *((unsigned char *)v9 + 68) |= 2u;
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteEntryQueryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteEntryQuery *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_completion copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 60) = self->_tapBehavior;
    *(unsigned char *)(v5 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 65) = self->_showIntermediateStateTapBehaviorListView;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v12 = self->_resultRefinements;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v5 addResultRefinement:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v17 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_queryHasAttributeIntentsInRefinements;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOPDAutocompleteEntryQuery *)self readAll:1];
  [v4 readAll:1];
  completion = self->_completion;
  if ((unint64_t)completion | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](completion, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_tapBehavior != *((_DWORD *)v4 + 15)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0) {
      goto LABEL_23;
    }
    if (self->_showIntermediateStateTapBehaviorListView)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_23;
  }
  resultRefinements = self->_resultRefinements;
  if ((unint64_t)resultRefinements | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](resultRefinements, "isEqual:"))
  {
    goto LABEL_23;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 5))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_23;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 68) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) != 0)
    {
      if (self->_queryHasAttributeIntentsInRefinements)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_23;
        }
      }
      else if (*((unsigned char *)v4 + 64))
      {
        goto LABEL_23;
      }
      BOOL v8 = 1;
      goto LABEL_24;
    }
LABEL_23:
    BOOL v8 = 0;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteEntryQuery *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_completion hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_tapBehavior;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_showIntermediateStateTapBehaviorListView;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = [(NSMutableArray *)self->_resultRefinements hash];
  unint64_t v7 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_queryHasAttributeIntentsInRefinements;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEOPDAutocompleteEntryQuery setCompletion:](self, "setCompletion:");
  }
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_tapBehavior = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if ((v5 & 4) != 0)
  {
    self->_showIntermediateStateTapBehaviorListView = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_flags |= 4u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOPDAutocompleteEntryQuery addResultRefinement:](self, "addResultRefinement:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  styleAttributes = self->_styleAttributes;
  uint64_t v12 = *((void *)v4 + 5);
  if (styleAttributes)
  {
    if (v12) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOPDAutocompleteEntryQuery setStyleAttributes:](self, "setStyleAttributes:");
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_queryHasAttributeIntentsInRefinements = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteEntryQueryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_807);
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
  *(unsigned char *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteEntryQuery *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_resultRefinements;
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
          -[GEOPDResultRefinement clearUnknownFields:](*(void *)(*((void *)&v12 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1, (void)v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_resultRefinements, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end