@interface GEOPDCategorySearchResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCategorySearchResult)init;
- (GEOPDCategorySearchResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)autoRedoSearchThreshold;
- (id)browseCategorys;
- (id)categorySearchResultSection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultRelatedSearchSuggestion;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayMapRegion;
- (id)guideSummaryLayoutMetadata;
- (id)jsonRepresentation;
- (id)placeSummaryLayoutMetadata;
- (id)redoButtonThreshold;
- (id)relatedEntitySections;
- (id)relatedSearchSuggestions;
- (id)resultDetourInfos;
- (id)resultRefinementGroup;
- (id)searchClientBehavior;
- (id)searchSessionData;
- (id)sectionList;
- (os_unfair_lock_s)mapDisplayType;
- (os_unfair_lock_s)searchResultViewType;
- (unint64_t)hash;
- (void)_addNoFlagsBrowseCategory:(uint64_t)a1;
- (void)_addNoFlagsRelatedEntitySection:(uint64_t)a1;
- (void)_addNoFlagsRelatedSearchSuggestion:(uint64_t)a1;
- (void)_addNoFlagsResultDetourInfo:(uint64_t)a1;
- (void)_addNoFlagsSearchTierMetadata:(uint64_t)a1;
- (void)_readAutoRedoSearchThreshold;
- (void)_readBrowseCategorys;
- (void)_readCategorySearchResultSection;
- (void)_readDefaultRelatedSearchSuggestion;
- (void)_readDisplayMapRegion;
- (void)_readGuideSummaryLayoutMetadata;
- (void)_readPlaceSummaryLayoutMetadata;
- (void)_readRedoButtonThreshold;
- (void)_readRelatedEntitySections;
- (void)_readRelatedSearchSuggestions;
- (void)_readResultDetourInfos;
- (void)_readResultRefinementGroup;
- (void)_readSearchClientBehavior;
- (void)_readSearchSessionData;
- (void)_readSectionList;
- (void)addBrowseCategory:(os_unfair_lock_s *)a1;
- (void)addRelatedEntitySection:(os_unfair_lock_s *)a1;
- (void)addRelatedSearchSuggestion:(os_unfair_lock_s *)a1;
- (void)addResultDetourInfo:(os_unfair_lock_s *)a1;
- (void)addSearchTierMetadata:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAutoRedoSearchThreshold:(uint64_t)a1;
- (void)setCategorySearchResultSection:(uint64_t)a1;
- (void)setDefaultRelatedSearchSuggestion:(uint64_t)a1;
- (void)setDisplayMapRegion:(uint64_t)a1;
- (void)setGuideSummaryLayoutMetadata:(uint64_t)a1;
- (void)setPaginationInfo:(uint64_t)a1;
- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1;
- (void)setRedoButtonThreshold:(uint64_t)a1;
- (void)setResultRefinementGroup:(uint64_t)a1;
- (void)setSearchClientBehavior:(uint64_t)a1;
- (void)setSearchSessionData:(uint64_t)a1;
- (void)setSectionList:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCategorySearchResult

- (GEOPDCategorySearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategorySearchResult;
  v2 = [(GEOPDCategorySearchResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategorySearchResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategorySearchResult;
  v3 = [(GEOPDCategorySearchResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)displayMapRegion
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x800u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)_readRelatedSearchSuggestions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedSearchSuggestions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)relatedSearchSuggestions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readRelatedSearchSuggestions]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addRelatedSearchSuggestion:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCategorySearchResult _readRelatedSearchSuggestions]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsRelatedSearchSuggestion:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x20000u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
  }
}

- (void)_addNoFlagsRelatedSearchSuggestion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readResultDetourInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultDetourInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)resultDetourInfos
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readResultDetourInfos]((uint64_t)a1);
    a1 = (id *)v2[14];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addResultDetourInfo:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCategorySearchResult _readResultDetourInfos]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsResultDetourInfo:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x40000u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
  }
}

- (void)_addNoFlagsResultDetourInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readDefaultRelatedSearchSuggestion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDefaultRelatedSearchSuggestion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)defaultRelatedSearchSuggestion
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readDefaultRelatedSearchSuggestion]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDefaultRelatedSearchSuggestion:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x400u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readSearchClientBehavior
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchClientBehavior_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)searchClientBehavior
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readSearchClientBehavior]((uint64_t)a1);
    a1 = (id *)v2[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchClientBehavior:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x100000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 128), a2);
}

- (void)_readBrowseCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrowseCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)browseCategorys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readBrowseCategorys]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addBrowseCategory:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCategorySearchResult _readBrowseCategorys]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsBrowseCategory:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x100u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
  }
}

- (void)_addNoFlagsBrowseCategory:(uint64_t)a1
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

- (void)_readCategorySearchResultSection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorySearchResultSection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)categorySearchResultSection
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readCategorySearchResultSection]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCategorySearchResultSection:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x200u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readRelatedEntitySections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedEntitySections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)relatedEntitySections
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readRelatedEntitySections]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addRelatedEntitySection:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCategorySearchResult _readRelatedEntitySections]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsRelatedEntitySection:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x10000u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
  }
}

- (void)_addNoFlagsRelatedEntitySection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addSearchTierMetadata:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 0x40) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchTierMetadatas_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
    -[GEOPDCategorySearchResult _addNoFlagsSearchTierMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 184) |= 0x400000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
    *(_DWORD *)(a1 + 184) |= 0x1000000u;
  }
}

- (void)_addNoFlagsSearchTierMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 144);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;

      id v4 = *(void **)(a1 + 144);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readResultRefinementGroup
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinementGroup_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)resultRefinementGroup
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readResultRefinementGroup]((uint64_t)a1);
    a1 = (id *)v2[15];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setResultRefinementGroup:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x80000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 120), a2);
}

- (void)_readAutoRedoSearchThreshold
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 184) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutoRedoSearchThreshold_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)autoRedoSearchThreshold
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readAutoRedoSearchThreshold]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAutoRedoSearchThreshold:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x80u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readPlaceSummaryLayoutMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSummaryLayoutMetadata_tags_2549);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)placeSummaryLayoutMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readPlaceSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x4000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)_readSectionList
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionList_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)sectionList
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readSectionList]((uint64_t)a1);
    a1 = (id *)v2[19];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSectionList:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x800000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 152), a2);
}

- (os_unfair_lock_s)searchResultViewType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint32_t os_unfair_lock_opaque = v1[46]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 42);
    if ((os_unfair_lock_opaque & 2) != 0) {
      return (os_unfair_lock_s *)v1[44]._os_unfair_lock_opaque;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readSearchSessionData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 186) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchSessionData_tags_2550);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)searchSessionData
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readSearchSessionData]((uint64_t)a1);
    a1 = (id *)v2[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchSessionData:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x200000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 136), a2);
}

- (os_unfair_lock_s)mapDisplayType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint32_t os_unfair_lock_opaque = v1[46]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 42);
    if (os_unfair_lock_opaque) {
      return (os_unfair_lock_s *)v1[43]._os_unfair_lock_opaque;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readGuideSummaryLayoutMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuideSummaryLayoutMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)guideSummaryLayoutMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readGuideSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setGuideSummaryLayoutMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x1000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setPaginationInfo:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x2000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)_readRedoButtonThreshold
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRedoButtonThreshold_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)redoButtonThreshold
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchResult _readRedoButtonThreshold]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRedoButtonThreshold:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x8000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 88), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCategorySearchResult;
  id v4 = [(GEOPDCategorySearchResult *)&v8 description];
  id v5 = [(GEOPDCategorySearchResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategorySearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDCategorySearchResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDCategorySearchResult displayMapRegion]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"displayMapRegion";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"display_map_region";
      }
      id v9 = v7;

      [v4 setObject:v9 forKey:v8];
    }

    if ((*(unsigned char *)(a1 + 184) & 0x20) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 183)];
      if (a2) {
        v11 = @"isChainResultSet";
      }
      else {
        v11 = @"is_chain_result_set";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 104) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v148 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      id v13 = *(id *)(a1 + 104);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v148 objects:v156 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v149;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v149 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v148 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            id v18 = [v17 dictionaryRepresentation];
            }

            [v12 addObject:v18];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v148 objects:v156 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"relatedSearchSuggestion";
      }
      else {
        v19 = @"related_search_suggestion";
      }
      [v4 setObject:v12 forKey:v19];
    }
    if ([*(id *)(a1 + 112) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id v21 = *(id *)(a1 + 112);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v144 objects:v155 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v145;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v145 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v144 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            id v26 = [v25 dictionaryRepresentation];
            }

            [v20 addObject:v26];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v144 objects:v155 count:16];
        }
        while (v22);
      }

      if (a2) {
        v27 = @"resultDetourInfo";
      }
      else {
        v27 = @"result_detour_info";
      }
      [v4 setObject:v20 forKey:v27];
    }
    v28 = -[GEOPDCategorySearchResult defaultRelatedSearchSuggestion]((id *)a1);
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"defaultRelatedSearchSuggestion";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"default_related_search_suggestion";
      }
      id v32 = v30;

      [v4 setObject:v32 forKey:v31];
    }

    v33 = -[GEOPDCategorySearchResult searchClientBehavior]((id *)a1);
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"searchClientBehavior";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"search_client_behavior";
      }
      id v37 = v35;

      [v4 setObject:v37 forKey:v36];
    }

    if ((*(unsigned char *)(a1 + 184) & 8) != 0)
    {
      v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 181)];
      if (a2) {
        v39 = @"enablePartialClientization";
      }
      else {
        v39 = @"enable_partial_clientization";
      }
      [v4 setObject:v38 forKey:v39];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v41 = *(id *)(a1 + 32);
      uint64_t v42 = [v41 countByEnumeratingWithState:&v140 objects:v154 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v141;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v141 != v43) {
              objc_enumerationMutation(v41);
            }
            v45 = *(void **)(*((void *)&v140 + 1) + 8 * k);
            if (a2) {
              [v45 jsonRepresentation];
            }
            else {
            id v46 = [v45 dictionaryRepresentation];
            }

            [v40 addObject:v46];
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v140 objects:v154 count:16];
        }
        while (v42);
      }

      if (a2) {
        v47 = @"browseCategory";
      }
      else {
        v47 = @"browse_category";
      }
      [v4 setObject:v40 forKey:v47];
    }
    v48 = -[GEOPDCategorySearchResult categorySearchResultSection]((id *)a1);
    v49 = v48;
    if (v48)
    {
      if (a2)
      {
        v50 = [v48 jsonRepresentation];
        v51 = @"categorySearchResultSection";
      }
      else
      {
        v50 = [v48 dictionaryRepresentation];
        v51 = @"category_search_result_section";
      }
      id v52 = v50;

      [v4 setObject:v52 forKey:v51];
    }

    if ([*(id *)(a1 + 96) count])
    {
      v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v54 = *(id *)(a1 + 96);
      uint64_t v55 = [v54 countByEnumeratingWithState:&v136 objects:v153 count:16];
      if (v55)
      {
        uint64_t v56 = *(void *)v137;
        do
        {
          for (uint64_t m = 0; m != v55; ++m)
          {
            if (*(void *)v137 != v56) {
              objc_enumerationMutation(v54);
            }
            v58 = *(void **)(*((void *)&v136 + 1) + 8 * m);
            if (a2) {
              [v58 jsonRepresentation];
            }
            else {
            id v59 = [v58 dictionaryRepresentation];
            }

            [v53 addObject:v59];
          }
          uint64_t v55 = [v54 countByEnumeratingWithState:&v136 objects:v153 count:16];
        }
        while (v55);
      }

      if (a2) {
        v60 = @"relatedEntitySection";
      }
      else {
        v60 = @"related_entity_section";
      }
      [v4 setObject:v53 forKey:v60];
    }
    if ([*(id *)(a1 + 144) count])
    {
      v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v62 = *(id *)(a1 + 144);
      uint64_t v63 = [v62 countByEnumeratingWithState:&v132 objects:v152 count:16];
      if (v63)
      {
        uint64_t v64 = *(void *)v133;
        do
        {
          for (uint64_t n = 0; n != v63; ++n)
          {
            if (*(void *)v133 != v64) {
              objc_enumerationMutation(v62);
            }
            v66 = *(void **)(*((void *)&v132 + 1) + 8 * n);
            if (a2) {
              [v66 jsonRepresentation];
            }
            else {
            id v67 = [v66 dictionaryRepresentation];
            }

            [v61 addObject:v67];
          }
          uint64_t v63 = [v62 countByEnumeratingWithState:&v132 objects:v152 count:16];
        }
        while (v63);
      }

      if (a2) {
        v68 = @"searchTierMetadata";
      }
      else {
        v68 = @"search_tier_metadata";
      }
      [v4 setObject:v61 forKey:v68];
    }
    v69 = -[GEOPDCategorySearchResult resultRefinementGroup]((id *)a1);
    v70 = v69;
    if (v69)
    {
      if (a2)
      {
        v71 = [v69 jsonRepresentation];
        v72 = @"resultRefinementGroup";
      }
      else
      {
        v71 = [v69 dictionaryRepresentation];
        v72 = @"result_refinement_group";
      }
      id v73 = v71;

      [v4 setObject:v73 forKey:v72];
    }

    v74 = -[GEOPDCategorySearchResult autoRedoSearchThreshold]((id *)a1);
    v75 = v74;
    if (v74)
    {
      if (a2)
      {
        v76 = [v74 jsonRepresentation];
        v77 = @"autoRedoSearchThreshold";
      }
      else
      {
        v76 = [v74 dictionaryRepresentation];
        v77 = @"auto_redo_search_threshold";
      }
      id v78 = v76;

      [v4 setObject:v78 forKey:v77];
    }

    v79 = -[GEOPDCategorySearchResult placeSummaryLayoutMetadata]((id *)a1);
    v80 = v79;
    if (v79)
    {
      if (a2)
      {
        v81 = [v79 jsonRepresentation];
        v82 = @"placeSummaryLayoutMetadata";
      }
      else
      {
        v81 = [v79 dictionaryRepresentation];
        v82 = @"place_summary_layout_metadata";
      }
      id v83 = v81;

      [v4 setObject:v83 forKey:v82];
    }

    v84 = -[GEOPDCategorySearchResult sectionList]((id *)a1);
    v85 = v84;
    if (v84)
    {
      if (a2)
      {
        v86 = [v84 jsonRepresentation];
        v87 = @"sectionList";
      }
      else
      {
        v86 = [v84 dictionaryRepresentation];
        v87 = @"section_list";
      }
      id v88 = v86;

      [v4 setObject:v88 forKey:v87];
    }

    int v89 = *(_DWORD *)(a1 + 184);
    if ((v89 & 4) != 0)
    {
      v90 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 180)];
      if (a2) {
        v91 = @"disableAddingAdditionalPaddingOnViewport";
      }
      else {
        v91 = @"disable_adding_additional_padding_on_viewport";
      }
      [v4 setObject:v90 forKey:v91];

      int v89 = *(_DWORD *)(a1 + 184);
    }
    if ((v89 & 2) != 0)
    {
      uint64_t v92 = *(int *)(a1 + 176);
      if (v92 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 176));
        v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v93 = off_1E53DD158[v92];
      }
      if (a2) {
        v94 = @"searchResultViewType";
      }
      else {
        v94 = @"search_result_view_type";
      }
      [v4 setObject:v93 forKey:v94];

      int v89 = *(_DWORD *)(a1 + 184);
    }
    if ((v89 & 0x10) != 0)
    {
      v95 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 182)];
      if (a2) {
        v96 = @"enableStructuredRapAffordance";
      }
      else {
        v96 = @"enable_structured_rap_affordance";
      }
      [v4 setObject:v95 forKey:v96];
    }
    v97 = -[GEOPDCategorySearchResult searchSessionData]((id *)a1);
    v98 = v97;
    if (v97)
    {
      if (a2)
      {
        v99 = [v97 jsonRepresentation];
        v100 = @"searchSessionData";
      }
      else
      {
        v99 = [v97 dictionaryRepresentation];
        v100 = @"search_session_data";
      }
      id v101 = v99;

      [v4 setObject:v101 forKey:v100];
    }

    if (*(unsigned char *)(a1 + 184))
    {
      int v102 = *(_DWORD *)(a1 + 172);
      if (v102)
      {
        if (v102 == 1)
        {
          v103 = @"TOPOGRAPHIC";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 172));
          v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v103 = @"DEFAULT";
      }
      if (a2) {
        v104 = @"mapDisplayType";
      }
      else {
        v104 = @"map_display_type";
      }
      [v4 setObject:v103 forKey:v104];
    }
    v105 = -[GEOPDCategorySearchResult guideSummaryLayoutMetadata]((id *)a1);
    v106 = v105;
    if (v105)
    {
      if (a2)
      {
        v107 = [v105 jsonRepresentation];
        v108 = @"guideSummaryLayoutMetadata";
      }
      else
      {
        v107 = [v105 dictionaryRepresentation];
        v108 = @"guide_summary_layout_metadata";
      }
      id v109 = v107;

      [v4 setObject:v109 forKey:v108];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 185) & 0x20) == 0)
    {
      v110 = *(void **)(a1 + 8);
      if (v110)
      {
        id v111 = v110;
        objc_sync_enter(v111);
        GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaginationInfo_tags);
        objc_sync_exit(v111);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
    id v112 = *(id *)(a1 + 72);
    v113 = v112;
    if (v112)
    {
      if (a2)
      {
        v114 = [v112 jsonRepresentation];
        v115 = @"paginationInfo";
      }
      else
      {
        v114 = [v112 dictionaryRepresentation];
        v115 = @"pagination_info";
      }
      id v116 = v114;

      [v4 setObject:v116 forKey:v115];
    }

    v117 = -[GEOPDCategorySearchResult redoButtonThreshold]((id *)a1);
    v118 = v117;
    if (v117)
    {
      if (a2)
      {
        v119 = [v117 jsonRepresentation];
        v120 = @"redoButtonThreshold";
      }
      else
      {
        v119 = [v117 dictionaryRepresentation];
        v120 = @"redo_button_threshold";
      }
      id v121 = v119;

      [v4 setObject:v121 forKey:v120];
    }

    v122 = *(void **)(a1 + 16);
    if (v122)
    {
      v123 = [v122 dictionaryRepresentation];
      v124 = v123;
      if (a2)
      {
        v125 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v123, "count"));
        v130[0] = MEMORY[0x1E4F143A8];
        v130[1] = 3221225472;
        v130[2] = __55__GEOPDCategorySearchResult__dictionaryRepresentation___block_invoke;
        v130[3] = &unk_1E53D8860;
        id v126 = v125;
        id v131 = v126;
        [v124 enumerateKeysAndObjectsUsingBlock:v130];
        id v127 = v126;
      }
      else
      {
        id v127 = v123;
      }
      [v4 setObject:v127 forKey:@"Unknown Fields"];
    }
    id v128 = v4;
  }
  else
  {
    id v128 = 0;
  }

  return v128;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategorySearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_2674;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2675;
      }
      GEOPDCategorySearchResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDCategorySearchResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

void __55__GEOPDCategorySearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDCategorySearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDCategorySearchResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v27 = self->_reader;
    objc_sync_enter(v27);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v28 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v28];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v27);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    objc_super v6 = self->_relatedSearchSuggestions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v46;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v7);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = self->_resultDetourInfos;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v42;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v11);
    }

    if (self->_defaultRelatedSearchSuggestion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_searchClientBehavior) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v14 = self->_browseCategorys;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v38;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v15);
    }

    if (self->_categorySearchResultSection) {
      PBDataWriterWriteSubmessage();
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = self->_relatedEntitySections;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v50 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v34;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v50 count:16];
      }
      while (v19);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v22 = self->_searchTierMetadatas;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v49 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v30;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v49 count:16];
      }
      while (v23);
    }

    if (self->_resultRefinementGroup) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_autoRedoSearchThreshold) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeSummaryLayoutMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sectionList) {
      PBDataWriterWriteSubmessage();
    }
    $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_searchSessionData) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_guideSummaryLayoutMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_paginationInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_redoButtonThreshold) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v29);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDCategorySearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_51;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 0);
  id v9 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 183) = self->_isChainResultSet;
    *(_DWORD *)(v5 + 184) |= 0x20u;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v11 = self->_relatedSearchSuggestions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v78 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDCategorySearchResult addRelatedSearchSuggestion:]((os_unfair_lock_s *)v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v77 objects:v85 count:16];
    }
    while (v12);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v16 = self->_resultDetourInfos;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v73 objects:v84 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v74 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDCategorySearchResult addResultDetourInfo:]((os_unfair_lock_s *)v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v73 objects:v84 count:16];
    }
    while (v17);
  }

  id v21 = [(GEOPDRelatedSearchSuggestion *)self->_defaultRelatedSearchSuggestion copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v21;

  id v23 = [(GEOPDSearchClientBehavior *)self->_searchClientBehavior copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v23;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 181) = self->_enablePartialClientization;
    *(_DWORD *)(v5 + 184) |= 8u;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v25 = self->_browseCategorys;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v70 != v27) {
          objc_enumerationMutation(v25);
        }
        long long v29 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDCategorySearchResult addBrowseCategory:]((os_unfair_lock_s *)v5, v29);
      }
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v69 objects:v83 count:16];
    }
    while (v26);
  }

  id v30 = [(GEOPDSCategorySearchResultSection *)self->_categorySearchResultSection copyWithZone:a3];
  long long v31 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v30;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v32 = self->_relatedEntitySections;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v65 objects:v82 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v66;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v66 != v34) {
          objc_enumerationMutation(v32);
        }
        long long v36 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDCategorySearchResult addRelatedEntitySection:]((os_unfair_lock_s *)v5, v36);
      }
      uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v65 objects:v82 count:16];
    }
    while (v33);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v37 = self->_searchTierMetadatas;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v61 objects:v81 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v62;
    do
    {
      for (uint64_t n = 0; n != v38; ++n)
      {
        if (*(void *)v62 != v39) {
          objc_enumerationMutation(v37);
        }
        long long v41 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * n), "copyWithZone:", a3, (void)v61);
        -[GEOPDCategorySearchResult addSearchTierMetadata:](v5, v41);
      }
      uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v61 objects:v81 count:16];
    }
    while (v38);
  }

  id v42 = [(GEOPDResultRefinementGroup *)self->_resultRefinementGroup copyWithZone:a3];
  long long v43 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v42;

  id v44 = [(GEOPDSSearchAutoRedoThreshold *)self->_autoRedoSearchThreshold copyWithZone:a3];
  long long v45 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v44;

  id v46 = [(GEOPDPlaceSummaryLayoutMetadata *)self->_placeSummaryLayoutMetadata copyWithZone:a3];
  long long v47 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v46;

  id v48 = [(GEOPDSearchSectionList *)self->_sectionList copyWithZone:a3];
  v49 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v48;

  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_46;
    }
LABEL_53:
    *(_DWORD *)(v5 + 176) = self->_searchResultViewType;
    *(_DWORD *)(v5 + 184) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  *(unsigned char *)(v5 + 180) = self->_disableAddingAdditionalPaddingOnViewport;
  *(_DWORD *)(v5 + 184) |= 4u;
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0) {
    goto LABEL_53;
  }
LABEL_46:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_47:
    *(unsigned char *)(v5 + 182) = self->_enableStructuredRapAffordance;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
LABEL_48:
  id v51 = -[GEOPDSSearchSessionData copyWithZone:](self->_searchSessionData, "copyWithZone:", a3, (void)v61);
  id v52 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v51;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 172) = self->_mapDisplayType;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  id v53 = [(GEOPDGuideSummaryLayoutMetadata *)self->_guideSummaryLayoutMetadata copyWithZone:a3];
  uint64_t v54 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v53;

  id v55 = [(GEOPDPaginationInfo *)self->_paginationInfo copyWithZone:a3];
  uint64_t v56 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v55;

  id v57 = [(GEOPDSSearchRedoButtonThreshold *)self->_redoButtonThreshold copyWithZone:a3];
  v58 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v57;

  id v59 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v59;
LABEL_51:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 1);
  -[GEOPDCategorySearchResult readAll:]((uint64_t)v4, 1);
  displayMapRegiouint64_t n = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((void *)v4 + 7))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:")) {
      goto LABEL_79;
    }
  }
  int v6 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_79;
    }
    if (self->_isChainResultSet)
    {
      if (!*((unsigned char *)v4 + 183)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 183))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  relatedSearchSuggestions = self->_relatedSearchSuggestions;
  if ((unint64_t)relatedSearchSuggestions | *((void *)v4 + 13)
    && !-[NSMutableArray isEqual:](relatedSearchSuggestions, "isEqual:"))
  {
    goto LABEL_79;
  }
  resultDetourInfos = self->_resultDetourInfos;
  if ((unint64_t)resultDetourInfos | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](resultDetourInfos, "isEqual:")) {
      goto LABEL_79;
    }
  }
  defaultRelatedSearchSuggestiouint64_t n = self->_defaultRelatedSearchSuggestion;
  if ((unint64_t)defaultRelatedSearchSuggestion | *((void *)v4 + 6))
  {
    if (!-[GEOPDRelatedSearchSuggestion isEqual:](defaultRelatedSearchSuggestion, "isEqual:")) {
      goto LABEL_79;
    }
  }
  searchClientBehavior = self->_searchClientBehavior;
  if ((unint64_t)searchClientBehavior | *((void *)v4 + 16))
  {
    if (!-[GEOPDSearchClientBehavior isEqual:](searchClientBehavior, "isEqual:")) {
      goto LABEL_79;
    }
  }
  int v11 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v11 & 8) == 0) {
      goto LABEL_79;
    }
    if (self->_enablePartialClientization)
    {
      if (!*((unsigned char *)v4 + 181)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 181))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_79;
  }
  browseCategorys = self->_browseCategorys;
  if ((unint64_t)browseCategorys | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](browseCategorys, "isEqual:"))
  {
    goto LABEL_79;
  }
  categorySearchResultSectiouint64_t n = self->_categorySearchResultSection;
  if ((unint64_t)categorySearchResultSection | *((void *)v4 + 5))
  {
    if (!-[GEOPDSCategorySearchResultSection isEqual:](categorySearchResultSection, "isEqual:")) {
      goto LABEL_79;
    }
  }
  relatedEntitySections = self->_relatedEntitySections;
  if ((unint64_t)relatedEntitySections | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](relatedEntitySections, "isEqual:")) {
      goto LABEL_79;
    }
  }
  searchTierMetadatas = self->_searchTierMetadatas;
  if ((unint64_t)searchTierMetadatas | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](searchTierMetadatas, "isEqual:")) {
      goto LABEL_79;
    }
  }
  resultRefinementGroup = self->_resultRefinementGroup;
  if ((unint64_t)resultRefinementGroup | *((void *)v4 + 15))
  {
    if (!-[GEOPDResultRefinementGroup isEqual:](resultRefinementGroup, "isEqual:")) {
      goto LABEL_79;
    }
  }
  autoRedoSearchThreshold = self->_autoRedoSearchThreshold;
  if ((unint64_t)autoRedoSearchThreshold | *((void *)v4 + 3))
  {
    if (!-[GEOPDSSearchAutoRedoThreshold isEqual:](autoRedoSearchThreshold, "isEqual:")) {
      goto LABEL_79;
    }
  }
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  if ((unint64_t)placeSummaryLayoutMetadata | *((void *)v4 + 10))
  {
    if (!-[GEOPDPlaceSummaryLayoutMetadata isEqual:](placeSummaryLayoutMetadata, "isEqual:")) {
      goto LABEL_79;
    }
  }
  sectionList = self->_sectionList;
  if ((unint64_t)sectionList | *((void *)v4 + 19))
  {
    if (!-[GEOPDSearchSectionList isEqual:](sectionList, "isEqual:")) {
      goto LABEL_79;
    }
  }
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
  int v21 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v21 & 4) == 0) {
      goto LABEL_79;
    }
    if (self->_disableAddingAdditionalPaddingOnViewport)
    {
      if (!*((unsigned char *)v4 + 180)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 180))
    {
      goto LABEL_79;
    }
  }
  else if ((v21 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_searchResultViewType != *((_DWORD *)v4 + 44)) {
      goto LABEL_79;
    }
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0) {
      goto LABEL_79;
    }
    if (self->_enableStructuredRapAffordance)
    {
      if (!*((unsigned char *)v4 + 182)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 182))
    {
      goto LABEL_79;
    }
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  searchSessionData = self->_searchSessionData;
  if (!((unint64_t)searchSessionData | *((void *)v4 + 17))) {
    goto LABEL_68;
  }
  if (!-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:"))
  {
LABEL_79:
    char v26 = 0;
    goto LABEL_80;
  }
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
  int v21 = *((_DWORD *)v4 + 46);
LABEL_68:
  if (*(unsigned char *)&flags)
  {
    if ((v21 & 1) == 0 || self->_mapDisplayType != *((_DWORD *)v4 + 43)) {
      goto LABEL_79;
    }
  }
  else if (v21)
  {
    goto LABEL_79;
  }
  guideSummaryLayoutMetadata = self->_guideSummaryLayoutMetadata;
  if ((unint64_t)guideSummaryLayoutMetadata | *((void *)v4 + 8)
    && !-[GEOPDGuideSummaryLayoutMetadata isEqual:](guideSummaryLayoutMetadata, "isEqual:"))
  {
    goto LABEL_79;
  }
  paginationInfo = self->_paginationInfo;
  if ((unint64_t)paginationInfo | *((void *)v4 + 9))
  {
    if (!-[GEOPDPaginationInfo isEqual:](paginationInfo, "isEqual:")) {
      goto LABEL_79;
    }
  }
  redoButtonThreshold = self->_redoButtonThreshold;
  if ((unint64_t)redoButtonThreshold | *((void *)v4 + 11)) {
    char v26 = -[GEOPDSSearchRedoButtonThreshold isEqual:](redoButtonThreshold, "isEqual:");
  }
  else {
    char v26 = 1;
  }
LABEL_80:

  return v26;
}

- (unint64_t)hash
{
  -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 1);
  unint64_t v27 = [(GEOMapRegion *)self->_displayMapRegion hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v26 = 2654435761 * self->_isChainResultSet;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v25 = [(NSMutableArray *)self->_relatedSearchSuggestions hash];
  uint64_t v24 = [(NSMutableArray *)self->_resultDetourInfos hash];
  unint64_t v23 = [(GEOPDRelatedSearchSuggestion *)self->_defaultRelatedSearchSuggestion hash];
  unint64_t v22 = [(GEOPDSearchClientBehavior *)self->_searchClientBehavior hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v21 = 2654435761 * self->_enablePartialClientization;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v20 = [(NSMutableArray *)self->_browseCategorys hash];
  unint64_t v19 = [(GEOPDSCategorySearchResultSection *)self->_categorySearchResultSection hash];
  uint64_t v18 = [(NSMutableArray *)self->_relatedEntitySections hash];
  uint64_t v17 = [(NSMutableArray *)self->_searchTierMetadatas hash];
  unint64_t v3 = [(GEOPDResultRefinementGroup *)self->_resultRefinementGroup hash];
  unint64_t v4 = [(GEOPDSSearchAutoRedoThreshold *)self->_autoRedoSearchThreshold hash];
  unint64_t v5 = [(GEOPDPlaceSummaryLayoutMetadata *)self->_placeSummaryLayoutMetadata hash];
  unint64_t v6 = [(GEOPDSearchSectionList *)self->_sectionList hash];
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  uint64_t v8 = 2654435761 * self->_disableAddingAdditionalPaddingOnViewport;
  if ((*(unsigned char *)&flags & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_searchResultViewType;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_10:
    uint64_t v10 = 2654435761 * self->_enableStructuredRapAffordance;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v10 = 0;
LABEL_14:
  unint64_t v11 = [(GEOPDSSearchSessionData *)self->_searchSessionData hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_mapDisplayType;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v8;
  unint64_t v14 = v9 ^ v10 ^ v11 ^ v12 ^ [(GEOPDGuideSummaryLayoutMetadata *)self->_guideSummaryLayoutMetadata hash];
  unint64_t v15 = v14 ^ [(GEOPDPaginationInfo *)self->_paginationInfo hash];
  return v13 ^ v15 ^ [(GEOPDSSearchRedoButtonThreshold *)self->_redoButtonThreshold hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionList, 0);
  objc_storeStrong((id *)&self->_searchTierMetadatas, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchClientBehavior, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_resultDetourInfos, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestions, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_redoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_defaultRelatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_categorySearchResultSection, 0);
  objc_storeStrong((id *)&self->_browseCategorys, 0);
  objc_storeStrong((id *)&self->_autoRedoSearchThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end