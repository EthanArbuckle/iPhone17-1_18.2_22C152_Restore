@interface GEOPDSSearchResultSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSSearchResultSection)init;
- (GEOPDSSearchResultSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sectionHeaderDisplayName;
- (id)sectionSubHeaderDisplayName;
- (id)styleAttributes;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)searchResultSectionCellType;
- (unint64_t)hash;
- (void)_addNoFlagsResolvedItem:(uint64_t)a1;
- (void)_readSectionHeaderDisplayName;
- (void)_readSectionSubHeaderDisplayName;
- (void)_readStyleAttributes;
- (void)addResolvedItem:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSSearchResultSection

- (GEOPDSSearchResultSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSSearchResultSection;
  v2 = [(GEOPDSSearchResultSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSSearchResultSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSSearchResultSection;
  v3 = [(GEOPDSSearchResultSection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSectionHeaderDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionHeaderDisplayName_tags_628);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)sectionHeaderDisplayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSSearchResultSection _readSectionHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addResolvedItem:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSSearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResolvedItems_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSSearchResultSection _addNoFlagsResolvedItem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 84) |= 0x100u;
  }
}

- (void)_addNoFlagsResolvedItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readSectionSubHeaderDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayName_tags_630);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)sectionSubHeaderDisplayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSSearchResultSection _readSectionSubHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)searchResultSectionCellType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if (v2) {
      return *(unsigned int *)(v1 + 76);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_631);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)styleAttributes
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDSSearchResultSection _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchResultSection;
  v4 = [(GEOPDSSearchResultSection *)&v8 description];
  id v5 = [(GEOPDSSearchResultSection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchResultSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSSearchResultSection readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDSSearchResultSection sectionHeaderDisplayName]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"sectionHeaderDisplayName";
      }
      else {
        objc_super v6 = @"section_header_display_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([*(id *)(a1 + 24) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v8 = *(id *)(a1 + 24);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v41 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v7 addObject:v13];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"resolvedItem";
      }
      else {
        v14 = @"resolved_item";
      }
      [v4 setObject:v7 forKey:v14];
    }
    if ((*(_WORD *)(a1 + 84) & 2) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 80);
      if (v15 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53DDA50[v15];
      }
      if (a2) {
        v17 = @"searchResultSectionType";
      }
      else {
        v17 = @"search_result_section_type";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = -[GEOPDSSearchResultSection sectionSubHeaderDisplayName]((id *)a1);
    if (v18)
    {
      if (a2) {
        v19 = @"sectionSubHeaderDisplayName";
      }
      else {
        v19 = @"section_sub_header_display_name";
      }
      [v4 setObject:v18 forKey:v19];
    }

    if (*(_WORD *)(a1 + 84))
    {
      int v20 = *(_DWORD *)(a1 + 76);
      if (v20)
      {
        if (v20 == 1)
        {
          v21 = @"SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NO_NAME";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 76));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v21 = @"SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT";
      }
      if (a2) {
        v22 = @"searchResultSectionCellType";
      }
      else {
        v22 = @"search_result_section_cell_type";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = -[GEOPDSSearchResultSection styleAttributes]((id *)a1);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"styleAttributes";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"style_attributes";
      }
      [v4 setObject:v25 forKey:v26];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v27 = *(void **)(a1 + 8);
      if (v27)
      {
        id v28 = v27;
        objc_sync_enter(v28);
        GEOPDSSearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayNameWithEnrichment_tags_632);
        objc_sync_exit(v28);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v29 = *(id *)(a1 + 40);
    if (v29)
    {
      if (a2) {
        v30 = @"sectionSubHeaderDisplayNameWithEnrichment";
      }
      else {
        v30 = @"section_sub_header_display_name_with_enrichment";
      }
      [v4 setObject:v29 forKey:v30];
    }

    v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __55__GEOPDSSearchResultSection__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;
      }
      else
      {
        id v36 = v32;
      }
      [v4 setObject:v36 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSSearchResultSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_651;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_652;
      }
      GEOPDSSearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSSearchResultSectionCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __55__GEOPDSSearchResultSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_81;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_81;
  }
  if (a3) {
    objc_super v6 = @"sectionHeaderDisplayName";
  }
  else {
    objc_super v6 = @"section_header_display_name";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (void *)[v7 copy];
    id v9 = v8;
    *(_WORD *)(a1 + 84) |= 0x10u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), v8);
  }
  if (a3) {
    id v10 = @"resolvedItem";
  }
  else {
    id v10 = @"resolved_item";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v5;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [GEOPDResolvedItem alloc];
            if (v18) {
              v19 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v18, v17, a3);
            }
            else {
              v19 = 0;
            }
            -[GEOPDSSearchResultSection addResolvedItem:](a1, v19);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v20 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
        uint64_t v14 = v20;
      }
      while (v20);
    }

    id v5 = v44;
  }

  if (a3) {
    v21 = @"searchResultSectionType";
  }
  else {
    v21 = @"search_result_section_type";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_UNKNOWN"])
    {
      int v24 = 0;
    }
    else if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_BUSINESS"])
    {
      int v24 = 1;
    }
    else if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_ADDRESS"])
    {
      int v24 = 2;
    }
    else if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_CATEGORY"])
    {
      int v24 = 3;
    }
    else if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_BRAND"])
    {
      int v24 = 4;
    }
    else if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_CLIENT_RESOLVED"])
    {
      int v24 = 5;
    }
    else if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_DIRECTION_INTENT"])
    {
      int v24 = 6;
    }
    else if ([v23 isEqualToString:@"SEARCH_RESULT_SECTION_TYPE_INTERLEAVED"])
    {
      int v24 = 7;
    }
    else
    {
      int v24 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_51;
    }
    int v24 = [v22 intValue];
  }
  *(_WORD *)(a1 + 84) |= 0x100u;
  *(_WORD *)(a1 + 84) |= 2u;
  *(_DWORD *)(a1 + 80) = v24;
LABEL_51:

  if (a3) {
    v25 = @"sectionSubHeaderDisplayName";
  }
  else {
    v25 = @"section_sub_header_display_name";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[v26 copy];
    id v28 = v27;
    *(_WORD *)(a1 + 84) |= 0x40u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 48), v27);
  }
  if (a3) {
    id v29 = @"searchResultSectionCellType";
  }
  else {
    id v29 = @"search_result_section_cell_type";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v30;
    if ([v31 isEqualToString:@"SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT"]) {
      int v32 = 0;
    }
    else {
      int v32 = [v31 isEqualToString:@"SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NO_NAME"];
    }

    goto LABEL_66;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v32 = [v30 intValue];
LABEL_66:
    *(_WORD *)(a1 + 84) |= 0x100u;
    *(_WORD *)(a1 + 84) |= 1u;
    *(_DWORD *)(a1 + 76) = v32;
  }

  if (a3) {
    v33 = @"styleAttributes";
  }
  else {
    v33 = @"style_attributes";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = [GEOStyleAttributes alloc];
    if (a3) {
      id v36 = [(GEOStyleAttributes *)v35 initWithJSON:v34];
    }
    else {
      id v36 = [(GEOStyleAttributes *)v35 initWithDictionary:v34];
    }
    v37 = v36;
    v38 = v36;
    *(_WORD *)(a1 + 84) |= 0x80u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), v37);
  }
  if (a3) {
    id v39 = @"sectionSubHeaderDisplayNameWithEnrichment";
  }
  else {
    id v39 = @"section_sub_header_display_name_with_enrichment";
  }
  long long v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v41 = (void *)[v40 copy];
    id v42 = v41;
    *(_WORD *)(a1 + 84) |= 0x20u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), v41);
  }
LABEL_81:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchResultSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 0);
    if (self->_sectionHeaderDisplayName) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_resolvedItems;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_sectionSubHeaderDisplayName) {
      PBDataWriterWriteStringField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sectionSubHeaderDisplayNameWithEnrichment) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSSearchResultSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_sectionHeaderDisplayName copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v11 = self->_resolvedItems;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        -[GEOPDSSearchResultSection addResolvedItem:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_searchResultSectionType;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  uint64_t v16 = -[NSString copyWithZone:](self->_sectionSubHeaderDisplayName, "copyWithZone:", a3, (void)v24);
  uint64_t v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_searchResultSectionCellType;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  id v18 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  uint64_t v20 = [(NSString *)self->_sectionSubHeaderDisplayNameWithEnrichment copyWithZone:a3];
  v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  v22 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v22;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 1);
  -[GEOPDSSearchResultSection readAll:]((uint64_t)v4, 1);
  sectionHeaderDisplayName = self->_sectionHeaderDisplayName;
  if ((unint64_t)sectionHeaderDisplayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sectionHeaderDisplayName, "isEqual:")) {
      goto LABEL_23;
    }
  }
  resolvedItems = self->_resolvedItems;
  if ((unint64_t)resolvedItems | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](resolvedItems, "isEqual:")) {
      goto LABEL_23;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 42);
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_searchResultSectionType != *((_DWORD *)v4 + 20)) {
      goto LABEL_23;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_23;
  }
  sectionSubHeaderDisplayName = self->_sectionSubHeaderDisplayName;
  if ((unint64_t)sectionSubHeaderDisplayName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](sectionSubHeaderDisplayName, "isEqual:"))
    {
LABEL_23:
      char v12 = 0;
      goto LABEL_24;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v8 = *((_WORD *)v4 + 42);
  }
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_searchResultSectionCellType != *((_DWORD *)v4 + 19)) {
      goto LABEL_23;
    }
  }
  else if (v8)
  {
    goto LABEL_23;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 7)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_23;
  }
  sectionSubHeaderDisplayNameWithEnrichment = self->_sectionSubHeaderDisplayNameWithEnrichment;
  if ((unint64_t)sectionSubHeaderDisplayNameWithEnrichment | *((void *)v4 + 5)) {
    char v12 = -[NSString isEqual:](sectionSubHeaderDisplayNameWithEnrichment, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_sectionHeaderDisplayName hash];
  uint64_t v4 = [(NSMutableArray *)self->_resolvedItems hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_searchResultSectionType;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_sectionSubHeaderDisplayName hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_searchResultSectionCellType;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(GEOStyleAttributes *)self->_styleAttributes hash];
  return v8 ^ v9 ^ [(NSString *)self->_sectionSubHeaderDisplayNameWithEnrichment hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSSearchResultSection readAll:](a1, 0);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = *(id *)(a1 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
            if (v10)
            {
              v11 = *(void **)(v10 + 8);
              *(void *)(v10 + 8) = 0;
            }
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      objc_msgSend(*(id *)(a1 + 56), "clearUnknownFields:", 1, (void)v12);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayNameWithEnrichment, 0);
  objc_storeStrong((id *)&self->_sectionHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_resolvedItems, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end