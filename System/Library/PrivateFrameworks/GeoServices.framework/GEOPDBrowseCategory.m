@interface GEOPDBrowseCategory
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBrowseCategory)init;
- (GEOPDBrowseCategory)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayString;
- (id)jsonRepresentation;
- (id)popularDisplayToken;
- (id)shortDisplayString;
- (id)styleAttributes;
- (id)subCategorys;
- (id)suggestionEntryMetadata;
- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:;
- (uint64_t)displayMode;
- (uint64_t)sortOrder;
- (uint64_t)subCategoryType;
- (unint64_t)hash;
- (void)_addNoFlagsSubCategory:(uint64_t)a1;
- (void)_readDisplayString;
- (void)_readPopularDisplayToken;
- (void)_readShortDisplayString;
- (void)_readStyleAttributes;
- (void)_readSubCategorys;
- (void)_readSuggestionEntryMetadata;
- (void)addSubCategory:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayString:(uint64_t)a1;
- (void)setPopularDisplayToken:(uint64_t)a1;
- (void)setShortDisplayString:(uint64_t)a1;
- (void)setStyleAttributes:(uint64_t)a1;
- (void)setSuggestionEntryMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBrowseCategory

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x40u;
    *(_WORD *)(a1 + 100) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDBrowseCategory readAll:](a1, 0);
      [*(id *)(a1 + 48) clearUnknownFields:1];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = *(id *)(a1 + 56);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPDBrowseCategory clearUnknownFields:](*(void *)(*((void *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (GEOPDBrowseCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBrowseCategory;
  v2 = [(GEOPDBrowseCategory *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBrowseCategory)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBrowseCategory;
  v3 = [(GEOPDBrowseCategory *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readSuggestionEntryMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)suggestionEntryMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBrowseCategory _readSuggestionEntryMetadata]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x1000u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)_readDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)displayString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBrowseCategory _readDisplayString]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayString:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x80u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)styleAttributes
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBrowseCategory _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setStyleAttributes:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x400u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readSubCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)subCategorys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBrowseCategory _readSubCategorys]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSubCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDBrowseCategory _readSubCategorys](a1);
    -[GEOPDBrowseCategory _addNoFlagsSubCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 100) |= 0x2000u;
  }
}

- (void)_addNoFlagsSubCategory:(uint64_t)a1
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

- (void)_readShortDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShortDisplayString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)shortDisplayString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBrowseCategory _readShortDisplayString]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setShortDisplayString:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x200u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readPopularDisplayToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPopularDisplayToken_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)popularDisplayToken
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBrowseCategory _readPopularDisplayToken]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPopularDisplayToken:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x100u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)sortOrder
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 88);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)displayMode
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if (v2) {
      return *(unsigned int *)(v1 + 84);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)subCategoryType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 4) != 0) {
      return *(unsigned int *)(v1 + 92);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBrowseCategory;
  id v4 = [(GEOPDBrowseCategory *)&v8 description];
  id v5 = [(GEOPDBrowseCategory *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBrowseCategory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_77;
  }
  -[GEOPDBrowseCategory readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = -[GEOPDBrowseCategory suggestionEntryMetadata]((id *)a1);
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      id v7 = [v5 base64EncodedStringWithOptions:0];
      [v4 setObject:v7 forKey:@"suggestionEntryMetadata"];
    }
    else
    {
      [v4 setObject:v5 forKey:@"suggestion_entry_metadata"];
    }
  }

  objc_super v8 = -[GEOPDBrowseCategory displayString]((id *)a1);
  if (v8)
  {
    if (a2) {
      uint64_t v9 = @"displayString";
    }
    else {
      uint64_t v9 = @"display_string";
    }
    [v4 setObject:v8 forKey:v9];
  }

  long long v10 = -[GEOPDBrowseCategory styleAttributes]((id *)a1);
  long long v11 = v10;
  if (v10)
  {
    if (a2)
    {
      long long v12 = [v10 jsonRepresentation];
      long long v13 = @"styleAttributes";
    }
    else
    {
      long long v12 = [v10 dictionaryRepresentation];
      long long v13 = @"style_attributes";
    }
    [v4 setObject:v12 forKey:v13];
  }
  if ([*(id *)(a1 + 56) count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if (a2) {
            [v20 jsonRepresentation];
          }
          else {
          v21 = [v20 dictionaryRepresentation];
          }
          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v17);
    }

    if (a2) {
      v22 = @"subCategory";
    }
    else {
      v22 = @"sub_category";
    }
    [v4 setObject:v14 forKey:v22];
  }
  v23 = -[GEOPDBrowseCategory shortDisplayString]((id *)a1);
  if (v23)
  {
    if (a2) {
      v24 = @"shortDisplayString";
    }
    else {
      v24 = @"short_display_string";
    }
    [v4 setObject:v23 forKey:v24];
  }

  v25 = -[GEOPDBrowseCategory popularDisplayToken]((id *)a1);
  if (v25)
  {
    if (a2) {
      v26 = @"popularDisplayToken";
    }
    else {
      v26 = @"popular_display_token";
    }
    [v4 setObject:v25 forKey:v26];
  }

  __int16 v27 = *(_WORD *)(a1 + 100);
  if ((v27 & 2) != 0)
  {
    uint64_t v28 = *(int *)(a1 + 88);
    if (v28 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 88));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E53E5B78[v28];
    }
    if (a2) {
      v30 = @"sortOrder";
    }
    else {
      v30 = @"sort_order";
    }
    [v4 setObject:v29 forKey:v30];

    __int16 v27 = *(_WORD *)(a1 + 100);
    if ((v27 & 1) == 0)
    {
LABEL_43:
      if ((v27 & 4) == 0) {
        goto LABEL_66;
      }
      goto LABEL_59;
    }
  }
  else if ((v27 & 1) == 0)
  {
    goto LABEL_43;
  }
  uint64_t v31 = *(int *)(a1 + 84);
  if (v31 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = off_1E53E5B90[v31];
  }
  if (a2) {
    v33 = @"displayMode";
  }
  else {
    v33 = @"display_mode";
  }
  [v4 setObject:v32 forKey:v33];

  __int16 v27 = *(_WORD *)(a1 + 100);
  if ((v27 & 4) != 0)
  {
LABEL_59:
    uint64_t v34 = *(int *)(a1 + 92);
    if (v34 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 92));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E53E5BA8[v34];
    }
    if (a2) {
      v36 = @"subCategoryType";
    }
    else {
      v36 = @"sub_category_type";
    }
    [v4 setObject:v35 forKey:v36];

    __int16 v27 = *(_WORD *)(a1 + 100);
  }
LABEL_66:
  if ((v27 & 0x20) != 0)
  {
    v46 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 98)];
    if (a2) {
      v47 = @"isSubCategorySameAsTopLevel";
    }
    else {
      v47 = @"is_sub_category_same_as_top_level";
    }
    [v4 setObject:v46 forKey:v47];

    __int16 v27 = *(_WORD *)(a1 + 100);
    if ((v27 & 8) == 0)
    {
LABEL_68:
      if ((v27 & 0x10) == 0) {
        goto LABEL_73;
      }
      goto LABEL_69;
    }
  }
  else if ((v27 & 8) == 0)
  {
    goto LABEL_68;
  }
  v48 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
  if (a2) {
    v49 = @"includeEvChargingParametersOnSearch";
  }
  else {
    v49 = @"include_ev_charging_parameters_on_search";
  }
  [v4 setObject:v48 forKey:v49];

  if ((*(_WORD *)(a1 + 100) & 0x10) != 0)
  {
LABEL_69:
    v37 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 97)];
    if (a2) {
      v38 = @"isAllCategoryForVenue";
    }
    else {
      v38 = @"is_all_category_for_venue";
    }
    [v4 setObject:v37 forKey:v38];
  }
LABEL_73:
  v39 = *(void **)(a1 + 16);
  if (v39)
  {
    v40 = [v39 dictionaryRepresentation];
    v41 = v40;
    if (a2)
    {
      v42 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __49__GEOPDBrowseCategory__dictionaryRepresentation___block_invoke;
      v50[3] = &unk_1E53D8860;
      id v43 = v42;
      id v51 = v43;
      [v41 enumerateKeysAndObjectsUsingBlock:v50];
      id v44 = v43;

      v41 = v44;
    }
    [v4 setObject:v41 forKey:@"Unknown Fields"];
  }
LABEL_77:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDBrowseCategory _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_170_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_171_0;
      }
      GEOPDBrowseCategoryReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDBrowseCategoryCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEOPDBrowseCategory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_110;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_110;
  }
  if (a3) {
    objc_super v6 = @"suggestionEntryMetadata";
  }
  else {
    objc_super v6 = @"suggestion_entry_metadata";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
    -[GEOPDBrowseCategory setSuggestionEntryMetadata:](a1, v8);
  }
  if (a3) {
    uint64_t v9 = @"displayString";
  }
  else {
    uint64_t v9 = @"display_string";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = (void *)[v10 copy];
    -[GEOPDBrowseCategory setDisplayString:](a1, v11);
  }
  if (a3) {
    long long v12 = @"styleAttributes";
  }
  else {
    long long v12 = @"style_attributes";
  }
  long long v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOStyleAttributes alloc];
    if (a3) {
      id v15 = [(GEOStyleAttributes *)v14 initWithJSON:v13];
    }
    else {
      id v15 = [(GEOStyleAttributes *)v14 initWithDictionary:v13];
    }
    uint64_t v16 = v15;
    -[GEOPDBrowseCategory setStyleAttributes:](a1, v15);
  }
  if (a3) {
    uint64_t v17 = @"subCategory";
  }
  else {
    uint64_t v17 = @"sub_category";
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = v5;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v58;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v58 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v57 + 1) + 8 * v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v25 = [GEOPDBrowseCategory alloc];
            if (v25) {
              v26 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:](v25, v24, a3);
            }
            else {
              v26 = 0;
            }
            -[GEOPDBrowseCategory addSubCategory:](a1, v26);
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v27 = [v19 countByEnumeratingWithState:&v57 objects:v61 count:16];
        uint64_t v21 = v27;
      }
      while (v27);
    }

    id v5 = v56;
  }

  if (a3) {
    uint64_t v28 = @"shortDisplayString";
  }
  else {
    uint64_t v28 = @"short_display_string";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = (void *)[v29 copy];
    -[GEOPDBrowseCategory setShortDisplayString:](a1, v30);
  }
  if (a3) {
    uint64_t v31 = @"popularDisplayToken";
  }
  else {
    uint64_t v31 = @"popular_display_token";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = (void *)[v32 copy];
    -[GEOPDBrowseCategory setPopularDisplayToken:](a1, v33);
  }
  if (a3) {
    uint64_t v34 = @"sortOrder";
  }
  else {
    uint64_t v34 = @"sort_order";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = v35;
    if ([v36 isEqualToString:@"BROWSE_RESULT_SORT_ORDER_UNKNOWN"])
    {
      int v37 = 0;
    }
    else if ([v36 isEqualToString:@"BROWSE_RESULT_SORT_ORDER_SEARCH_RETURNED"])
    {
      int v37 = 1;
    }
    else if ([v36 isEqualToString:@"BROWSE_RESULT_SORT_ORDER_CLIENT_ALPHABETIC"])
    {
      int v37 = 2;
    }
    else
    {
      int v37 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_64;
    }
    int v37 = [v35 intValue];
  }
  *(_WORD *)(a1 + 100) |= 0x2000u;
  *(_WORD *)(a1 + 100) |= 2u;
  *(_DWORD *)(a1 + 88) = v37;
LABEL_64:

  if (a3) {
    v38 = @"displayMode";
  }
  else {
    v38 = @"display_mode";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v39;
    if ([v40 isEqualToString:@"BROWSE_RESULT_DISPLAY_MODE_UNKNOWN"])
    {
      int v41 = 0;
    }
    else if ([v40 isEqualToString:@"BROWSE_RESULT_DISPLAY_MODE_LIST_AND_PINS"])
    {
      int v41 = 1;
    }
    else if ([v40 isEqualToString:@"BROWSE_RESULT_DISPLAY_MODE_LIST_ONLY"])
    {
      int v41 = 2;
    }
    else
    {
      int v41 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_79;
    }
    int v41 = [v39 intValue];
  }
  *(_WORD *)(a1 + 100) |= 0x2000u;
  *(_WORD *)(a1 + 100) |= 1u;
  *(_DWORD *)(a1 + 84) = v41;
LABEL_79:

  if (a3) {
    v42 = @"subCategoryType";
  }
  else {
    v42 = @"sub_category_type";
  }
  id v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v43;
    if ([v44 isEqualToString:@"BROWSE_SUBCATEGORY_TYPE_UNKNOWN"])
    {
      int v45 = 0;
    }
    else if ([v44 isEqualToString:@"BROWSE_SUBCATEGORY_TYPE_SUBCATEGORIES"])
    {
      int v45 = 1;
    }
    else if ([v44 isEqualToString:@"BROWSE_SUBCATEGORY_TYPE_BUILDINGS"])
    {
      int v45 = 2;
    }
    else
    {
      int v45 = 0;
    }

    goto LABEL_93;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v45 = [v43 intValue];
LABEL_93:
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 4u;
    *(_DWORD *)(a1 + 92) = v45;
  }

  if (a3) {
    v46 = @"isSubCategorySameAsTopLevel";
  }
  else {
    v46 = @"is_sub_category_same_as_top_level";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v48 = [v47 BOOLValue];
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 0x20u;
    *(unsigned char *)(a1 + 98) = v48;
  }

  if (a3) {
    v49 = @"includeEvChargingParametersOnSearch";
  }
  else {
    v49 = @"include_ev_charging_parameters_on_search";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v51 = [v50 BOOLValue];
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 8u;
    *(unsigned char *)(a1 + 96) = v51;
  }

  if (a3) {
    long long v52 = @"isAllCategoryForVenue";
  }
  else {
    long long v52 = @"is_all_category_for_venue";
  }
  long long v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v54 = [v53 BOOLValue];
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 0x10u;
    *(unsigned char *)(a1 + 97) = v54;
  }

LABEL_110:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBrowseCategoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F80) == 0))
  {
    long long v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBrowseCategory readAll:]((uint64_t)self, 0);
    if (self->_suggestionEntryMetadata) {
      PBDataWriterWriteDataField();
    }
    if (self->_displayString) {
      PBDataWriterWriteStringField();
    }
    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_subCategorys;
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

    if (self->_shortDisplayString) {
      PBDataWriterWriteStringField();
    }
    if (self->_popularDisplayToken) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBrowseCategory readAll:]((uint64_t)self, 0);
    uint64_t v9 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
    id v10 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v9;

    uint64_t v11 = [(NSString *)self->_displayString copyWithZone:a3];
    long long v12 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v11;

    id v13 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
    long long v14 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v13;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v15 = self->_subCategorys;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
          -[GEOPDBrowseCategory addSubCategory:](v5, v19);
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [(NSString *)self->_shortDisplayString copyWithZone:a3];
    uint64_t v21 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v20;

    uint64_t v22 = [(NSString *)self->_popularDisplayToken copyWithZone:a3];
    uint64_t v23 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v22;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 88) = self->_sortOrder;
      *(_WORD *)(v5 + 100) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_23;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_14;
    }
    *(_DWORD *)(v5 + 84) = self->_displayMode;
    *(_WORD *)(v5 + 100) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_15:
      if ((flags & 0x20) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
LABEL_23:
    *(_DWORD *)(v5 + 92) = self->_subCategoryType;
    *(_WORD *)(v5 + 100) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_16:
      if ((flags & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_25;
    }
LABEL_24:
    *(unsigned char *)(v5 + 98) = self->_isSubCategorySameAsTopLevel;
    *(_WORD *)(v5 + 100) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_17:
      if ((flags & 0x10) == 0)
      {
LABEL_19:
        v25 = self->_unknownFields;
        id v8 = *(id *)(v5 + 16);
        *(void *)(v5 + 16) = v25;
        goto LABEL_20;
      }
LABEL_18:
      *(unsigned char *)(v5 + 97) = self->_isAllCategoryForVenue;
      *(_WORD *)(v5 + 100) |= 0x10u;
      goto LABEL_19;
    }
LABEL_25:
    *(unsigned char *)(v5 + 96) = self->_includeEvChargingParametersOnSearch;
    *(_WORD *)(v5 + 100) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
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
  GEOPDBrowseCategoryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_20:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  -[GEOPDBrowseCategory readAll:]((uint64_t)self, 1);
  -[GEOPDBrowseCategory readAll:]((uint64_t)v4, 1);
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:")) {
      goto LABEL_47;
    }
  }
  displayString = self->_displayString;
  if ((unint64_t)displayString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayString, "isEqual:")) {
      goto LABEL_47;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
      goto LABEL_47;
    }
  }
  subCategorys = self->_subCategorys;
  if ((unint64_t)subCategorys | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](subCategorys, "isEqual:")) {
      goto LABEL_47;
    }
  }
  shortDisplayString = self->_shortDisplayString;
  if ((unint64_t)shortDisplayString | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](shortDisplayString, "isEqual:")) {
      goto LABEL_47;
    }
  }
  popularDisplayToken = self->_popularDisplayToken;
  if ((unint64_t)popularDisplayToken | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](popularDisplayToken, "isEqual:")) {
      goto LABEL_47;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 50);
  if ((flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_sortOrder != *((_DWORD *)v4 + 22)) {
      goto LABEL_47;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_47;
  }
  if (flags)
  {
    if ((v12 & 1) == 0 || self->_displayMode != *((_DWORD *)v4 + 21)) {
      goto LABEL_47;
    }
  }
  else if (v12)
  {
    goto LABEL_47;
  }
  if ((flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_subCategoryType != *((_DWORD *)v4 + 23)) {
      goto LABEL_47;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0) {
      goto LABEL_47;
    }
    if (self->_isSubCategorySameAsTopLevel)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_47;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 8) != 0)
  {
    if ((v12 & 8) == 0) {
      goto LABEL_47;
    }
    if (self->_includeEvChargingParametersOnSearch)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_47;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_47;
  }
  BOOL v13 = (v12 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v12 & 0x10) != 0)
    {
      if (self->_isAllCategoryForVenue)
      {
        if (!*((unsigned char *)v4 + 97)) {
          goto LABEL_47;
        }
      }
      else if (*((unsigned char *)v4 + 97))
      {
        goto LABEL_47;
      }
      BOOL v13 = 1;
      goto LABEL_48;
    }
LABEL_47:
    BOOL v13 = 0;
  }
LABEL_48:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDBrowseCategory readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSData *)self->_suggestionEntryMetadata hash];
  NSUInteger v4 = [(NSString *)self->_displayString hash];
  unint64_t v5 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  uint64_t v6 = [(NSMutableArray *)self->_subCategorys hash];
  NSUInteger v7 = [(NSString *)self->_shortDisplayString hash];
  NSUInteger v8 = [(NSString *)self->_popularDisplayToken hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_sortOrder;
    if (flags)
    {
LABEL_3:
      uint64_t v11 = 2654435761 * self->_displayMode;
      if ((flags & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (flags) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  if ((flags & 4) != 0)
  {
LABEL_4:
    uint64_t v12 = 2654435761 * self->_subCategoryType;
    if ((flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v12 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v13 = 2654435761 * self->_isSubCategorySameAsTopLevel;
    if ((flags & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v14 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_11:
  uint64_t v13 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v14 = 2654435761 * self->_includeEvChargingParametersOnSearch;
  if ((flags & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v15 = 2654435761 * self->_isAllCategoryForVenue;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_29;
  }
  -[GEOPDBrowseCategory readAll:]((uint64_t)v3, 0);
  unint64_t v5 = (void *)*((void *)v4 + 8);
  if (v5) {
    -[GEOPDBrowseCategory setSuggestionEntryMetadata:](a1, v5);
  }
  uint64_t v6 = (void *)*((void *)v4 + 3);
  if (v6) {
    -[GEOPDBrowseCategory setDisplayString:](a1, v6);
  }
  NSUInteger v7 = *(void **)(a1 + 48);
  uint64_t v8 = *((void *)v4 + 6);
  if (v7)
  {
    if (v8) {
      objc_msgSend(v7, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOPDBrowseCategory setStyleAttributes:](a1, *((void **)v4 + 6));
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = *((id *)v4 + 7);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        -[GEOPDBrowseCategory addSubCategory:](a1, *(void **)(*((void *)&v17 + 1) + 8 * i));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  uint64_t v14 = (void *)*((void *)v4 + 5);
  if (v14) {
    -[GEOPDBrowseCategory setShortDisplayString:](a1, v14);
  }
  uint64_t v15 = (void *)*((void *)v4 + 4);
  if (v15) {
    -[GEOPDBrowseCategory setPopularDisplayToken:](a1, v15);
  }
  __int16 v16 = *((_WORD *)v4 + 50);
  if ((v16 & 2) != 0)
  {
    *(_DWORD *)(a1 + 88) = *((_DWORD *)v4 + 22);
    *(_WORD *)(a1 + 100) |= 2u;
    __int16 v16 = *((_WORD *)v4 + 50);
    if ((v16 & 1) == 0)
    {
LABEL_24:
      if ((v16 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_32;
    }
  }
  else if ((v16 & 1) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(a1 + 84) = *((_DWORD *)v4 + 21);
  *(_WORD *)(a1 + 100) |= 1u;
  __int16 v16 = *((_WORD *)v4 + 50);
  if ((v16 & 4) == 0)
  {
LABEL_25:
    if ((v16 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(a1 + 92) = *((_DWORD *)v4 + 23);
  *(_WORD *)(a1 + 100) |= 4u;
  __int16 v16 = *((_WORD *)v4 + 50);
  if ((v16 & 0x20) == 0)
  {
LABEL_26:
    if ((v16 & 8) == 0) {
      goto LABEL_27;
    }
LABEL_34:
    *(unsigned char *)(a1 + 96) = *((unsigned char *)v4 + 96);
    *(_WORD *)(a1 + 100) |= 8u;
    if ((*((_WORD *)v4 + 50) & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_33:
  *(unsigned char *)(a1 + 98) = *((unsigned char *)v4 + 98);
  *(_WORD *)(a1 + 100) |= 0x20u;
  __int16 v16 = *((_WORD *)v4 + 50);
  if ((v16 & 8) != 0) {
    goto LABEL_34;
  }
LABEL_27:
  if ((v16 & 0x10) != 0)
  {
LABEL_28:
    *(unsigned char *)(a1 + 97) = *((unsigned char *)v4 + 97);
    *(_WORD *)(a1 + 100) |= 0x10u;
  }
LABEL_29:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_subCategorys, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_shortDisplayString, 0);
  objc_storeStrong((id *)&self->_popularDisplayToken, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end