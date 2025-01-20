@interface GEOPDSearchResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)showDymSuggestionCloseButton;
- (GEOPDSearchResult)init;
- (GEOPDSearchResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)autoRedoSearchThreshold;
- (id)clientResolvedResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultRelatedSearchSuggestion;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionIntent;
- (id)disambiguationLabels;
- (id)displayHeaderSubstitutes;
- (id)displayMapRegion;
- (id)guideSummaryLayoutMetadata;
- (id)jsonRepresentation;
- (id)openPlaceCardForResultWithId;
- (id)placeSummaryLayoutMetadata;
- (id)redoButtonThreshold;
- (id)relatedEntitySections;
- (id)relatedSearchSuggestions;
- (id)resultDetourInfos;
- (id)resultDisplayHeader;
- (id)resultRefinementGroup;
- (id)retainSearchAtIndex:(id *)a1;
- (id)searchClientBehavior;
- (id)searchResultSections;
- (id)searchSessionData;
- (id)sectionList;
- (uint64_t)dymSuggestionVisibleTime;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)mapDisplayType;
- (uint64_t)searchResultType;
- (uint64_t)searchResultViewType;
- (unint64_t)hash;
- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1;
- (void)_addNoFlagsDisplayHeaderSubstitute:(uint64_t)a1;
- (void)_addNoFlagsRelatedEntitySection:(uint64_t)a1;
- (void)_addNoFlagsRelatedSearchSuggestion:(uint64_t)a1;
- (void)_addNoFlagsResultDetourInfo:(uint64_t)a1;
- (void)_addNoFlagsRetainSearch:(uint64_t)a1;
- (void)_addNoFlagsSearchResultSection:(uint64_t)a1;
- (void)_addNoFlagsSearchTierMetadata:(uint64_t)a1;
- (void)_readAutoRedoSearchThreshold;
- (void)_readClientResolvedResult;
- (void)_readDefaultRelatedSearchSuggestion;
- (void)_readDirectionIntent;
- (void)_readDisambiguationLabels;
- (void)_readDisplayHeaderSubstitutes;
- (void)_readDisplayMapRegion;
- (void)_readGuideSummaryLayoutMetadata;
- (void)_readOpenPlaceCardForResultWithId;
- (void)_readPlaceSummaryLayoutMetadata;
- (void)_readRedoButtonThreshold;
- (void)_readRelatedEntitySections;
- (void)_readRelatedSearchSuggestions;
- (void)_readResultDetourInfos;
- (void)_readResultDisplayHeader;
- (void)_readResultRefinementGroup;
- (void)_readRetainSearchs;
- (void)_readSearchClientBehavior;
- (void)_readSearchResultSections;
- (void)_readSearchSessionData;
- (void)_readSectionList;
- (void)addDisambiguationLabel:(uint64_t)a1;
- (void)addDisplayHeaderSubstitute:(uint64_t)a1;
- (void)addRelatedEntitySection:(uint64_t)a1;
- (void)addRelatedSearchSuggestion:(uint64_t)a1;
- (void)addResultDetourInfo:(uint64_t)a1;
- (void)addRetainSearch:(uint64_t)a1;
- (void)addSearchResultSection:(uint64_t)a1;
- (void)addSearchTierMetadata:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAutoRedoSearchThreshold:(uint64_t)a1;
- (void)setClientResolvedResult:(uint64_t)a1;
- (void)setDefaultRelatedSearchSuggestion:(uint64_t)a1;
- (void)setDirectionIntent:(uint64_t)a1;
- (void)setDisplayMapRegion:(uint64_t)a1;
- (void)setGuideSummaryLayoutMetadata:(uint64_t)a1;
- (void)setOpenPlaceCardForResultWithId:(uint64_t)a1;
- (void)setPaginationInfo:(uint64_t)a1;
- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1;
- (void)setRedoButtonThreshold:(uint64_t)a1;
- (void)setResultDisplayHeader:(uint64_t)a1;
- (void)setResultRefinementGroup:(uint64_t)a1;
- (void)setSearchClientBehavior:(uint64_t)a1;
- (void)setSearchSessionData:(uint64_t)a1;
- (void)setSectionList:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchResult

- (id)resultDetourInfos
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchResult _readResultDetourInfos]((uint64_t)a1);
    a1 = (id *)v2[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)hash
{
  -[GEOPDSearchResult readAll:]((uint64_t)self, 1);
  unint64_t v38 = [(GEOMapRegion *)self->_displayMapRegion hash];
  uint64_t v37 = [(NSMutableArray *)self->_disambiguationLabels hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v36 = 2654435761 * self->_isChainResultSet;
  }
  else {
    uint64_t v36 = 0;
  }
  uint64_t v35 = [(NSMutableArray *)self->_relatedSearchSuggestions hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v34 = 2654435761 * self->_searchResultType;
  }
  else {
    uint64_t v34 = 0;
  }
  NSUInteger v33 = [(NSString *)self->_resultDisplayHeader hash];
  unint64_t v32 = [(GEOPDRelatedSearchSuggestion *)self->_defaultRelatedSearchSuggestion hash];
  unint64_t v31 = [(GEOPDSearchClientBehavior *)self->_searchClientBehavior hash];
  uint64_t v30 = [(NSMutableArray *)self->_resultDetourInfos hash];
  unint64_t v29 = [(GEOPDDirectionIntent *)self->_directionIntent hash];
  unint64_t v28 = [(GEOPDResolvedItem *)self->_clientResolvedResult hash];
  uint64_t v27 = [(NSMutableArray *)self->_displayHeaderSubstitutes hash];
  $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    uint64_t v26 = 2654435761 * self->_enablePartialClientization;
    if (*(unsigned char *)&flags)
    {
LABEL_9:
      uint64_t v25 = 2654435761 * self->_dymSuggestionVisibleTime;
      if ((*(_WORD *)&flags & 0x200) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v24 = 0;
      if ((*(unsigned char *)&flags & 4) != 0) {
        goto LABEL_11;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if (*(unsigned char *)&flags) {
      goto LABEL_9;
    }
  }
  uint64_t v25 = 0;
  if ((*(_WORD *)&flags & 0x200) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v24 = 2654435761 * self->_showDymSuggestionCloseButton;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_11:
    uint64_t v23 = 2654435761 * self->_retainSearchTime;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v23 = 0;
LABEL_16:
  uint64_t v22 = [(NSMutableArray *)self->_retainSearchs hash];
  uint64_t v21 = [(NSMutableArray *)self->_searchResultSections hash];
  uint64_t v20 = [(NSMutableArray *)self->_relatedEntitySections hash];
  uint64_t v19 = [(NSMutableArray *)self->_searchTierMetadatas hash];
  unint64_t v18 = [(GEOPDResultRefinementGroup *)self->_resultRefinementGroup hash];
  unint64_t v4 = [(GEOPDSSearchAutoRedoThreshold *)self->_autoRedoSearchThreshold hash];
  unint64_t v5 = [(GEOPDPlaceSummaryLayoutMetadata *)self->_placeSummaryLayoutMetadata hash];
  unint64_t v6 = [(GEOPDSearchSectionList *)self->_sectionList hash];
  $A1FAD422473D1390BB4F551D8B8DF0D1 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&v7 & 0x10) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&v7 & 0x80) != 0) {
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  uint64_t v8 = 2654435761 * self->_disableAddingAdditionalPaddingOnViewport;
  if ((*(unsigned char *)&v7 & 0x10) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v9 = 2654435761 * self->_searchResultViewType;
  if ((*(unsigned char *)&v7 & 0x80) != 0)
  {
LABEL_19:
    uint64_t v10 = 2654435761 * self->_enableStructuredRapAffordance;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
LABEL_23:
  unint64_t v11 = [(GEOPDSSearchSessionData *)self->_searchSessionData hash];
  unint64_t v12 = [(GEOPDMapsIdentifier *)self->_openPlaceCardForResultWithId hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_mapDisplayType;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  unint64_t v15 = v13 ^ [(GEOPDGuideSummaryLayoutMetadata *)self->_guideSummaryLayoutMetadata hash];
  unint64_t v16 = v15 ^ [(GEOPDPaginationInfo *)self->_paginationInfo hash];
  return v14 ^ v16 ^ [(GEOPDSSearchRedoButtonThreshold *)self->_redoButtonThreshold hash];
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        unint64_t v6 = (int *)&readAll__recursiveTag_6944;
      }
      else {
        unint64_t v6 = (int *)&readAll__nonRecursiveTag_6945;
      }
      GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchResult _readDisplayMapRegion](result);
    if ([*(id *)(v3 + 72) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDSearchResult _readOpenPlaceCardForResultWithId](v3);
    if ([*(id *)(v3 + 88) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDSearchResult _readPlaceSummaryLayoutMetadata](v3);
    if ([*(id *)(v3 + 104) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDSearchResult _readRelatedEntitySections](v3);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(v3 + 120);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (-[GEOPDRelatedEntitySection hasGreenTeaWithValue:](*(void *)(*((void *)&v9 + 1) + 8 * v8), a2))
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    -[GEOPDSearchResult _readResultRefinementGroup](v3);
    if (-[GEOPDResultRefinementGroup hasGreenTeaWithValue:](*(void *)(v3 + 152), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchResult _readSectionList](v3);
      return -[GEOPDSearchSectionList hasGreenTeaWithValue:](*(void *)(v3 + 200), a2);
    }
  }
  return result;
}

- (GEOPDSearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchResult;
  v2 = [(GEOPDSearchResult *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDSearchResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchResult;
  uint64_t v3 = [(GEOPDSearchResult *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readDisplayMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_6864);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)displayMapRegion
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchResult _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400020000uLL;
  objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)_readDisambiguationLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 249) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisambiguationLabels_tags_6865);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)disambiguationLabels
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchResult _readDisambiguationLabels]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addDisambiguationLabel:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchResult _readDisambiguationLabels](a1);
    -[GEOPDSearchResult _addNoFlagsDisambiguationLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x8000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1
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

- (void)_readRelatedSearchSuggestions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedSearchSuggestions_tags_6866);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)relatedSearchSuggestions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchResult _readRelatedSearchSuggestions]((uint64_t)a1);
    a1 = (id *)v2[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addRelatedSearchSuggestion:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchResult _readRelatedSearchSuggestions](a1);
    -[GEOPDSearchResult _addNoFlagsRelatedSearchSuggestion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x1000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsRelatedSearchSuggestion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)searchResultType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint64_t v2 = *(void *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if ((v2 & 8) != 0) {
      return *(unsigned int *)(v1 + 232);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readResultDisplayHeader
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 4) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultDisplayHeader_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)resultDisplayHeader
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readResultDisplayHeader]((uint64_t)a1);
    a1 = (id *)v2[18];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setResultDisplayHeader:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x404000000uLL;
  objc_storeStrong((id *)(a1 + 144), a2);
}

- (void)_readDefaultRelatedSearchSuggestion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 249) & 0x20) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDefaultRelatedSearchSuggestion_tags_6867);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)defaultRelatedSearchSuggestion
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readDefaultRelatedSearchSuggestion]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDefaultRelatedSearchSuggestion:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400002000uLL;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readSearchClientBehavior
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 0x20) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchClientBehavior_tags_6868);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)searchClientBehavior
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readSearchClientBehavior]((uint64_t)a1);
    a1 = (id *)v2[21];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchClientBehavior:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x420000000uLL;
  objc_storeStrong((id *)(a1 + 168), a2);
}

- (void)_readResultDetourInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 2) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultDetourInfos_tags_6869);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (void)addResultDetourInfo:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchResult _readResultDetourInfos](a1);
    -[GEOPDSearchResult _addNoFlagsResultDetourInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x2000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsResultDetourInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      id v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readDirectionIntent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 249) & 0x40) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionIntent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)directionIntent
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readDirectionIntent]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDirectionIntent:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400004000uLL;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readClientResolvedResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 249) & 0x10) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientResolvedResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)clientResolvedResult
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readClientResolvedResult]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setClientResolvedResult:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 248) |= 0x400001000uLL;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readDisplayHeaderSubstitutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 1) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayHeaderSubstitutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)displayHeaderSubstitutes
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readDisplayHeaderSubstitutes]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addDisplayHeaderSubstitute:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchResult _readDisplayHeaderSubstitutes](a1);
    -[GEOPDSearchResult _addNoFlagsDisplayHeaderSubstitute:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x10000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsDisplayHeaderSubstitute:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)dymSuggestionVisibleTime
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint64_t v2 = *(void *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if (v2) {
      return *(unsigned int *)(v1 + 220);
    }
    else {
      return 10;
    }
  }
  return result;
}

- (BOOL)showDymSuggestionCloseButton
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint64_t v2 = *(void *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    return (v2 & 0x200) == 0 || *(unsigned char *)(v1 + 244) != 0;
  }
  return result;
}

- (void)_readRetainSearchs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 0x10) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRetainSearchs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (void)addRetainSearch:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchResult _readRetainSearchs](a1);
    -[GEOPDSearchResult _addNoFlagsRetainSearch:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x10000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsRetainSearch:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 160);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v5;

      id v4 = *(void **)(a1 + 160);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)retainSearchAtIndex:(id *)a1
{
  if (a1)
  {
    id v4 = a1;
    -[GEOPDSearchResult _readRetainSearchs]((uint64_t)a1);
    a1 = [v4[20] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_readSearchResultSections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 0x40) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchResultSections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)searchResultSections
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readSearchResultSections]((uint64_t)a1);
    a1 = (id *)v2[22];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSearchResultSection:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchResult _readSearchResultSections](a1);
    -[GEOPDSearchResult _addNoFlagsSearchResultSection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x40000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsSearchResultSection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 176);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v5;

      id v4 = *(void **)(a1 + 176);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readRelatedEntitySections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 0x80) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedEntitySections_tags_6872);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)relatedEntitySections
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readRelatedEntitySections]((uint64_t)a1);
    a1 = (id *)v2[15];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addRelatedEntitySection:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchResult _readRelatedEntitySections](a1);
    -[GEOPDSearchResult _addNoFlagsRelatedEntitySection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x800000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsRelatedEntitySection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      id v4 = *(void **)(a1 + 120);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 252) & 1) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchTierMetadatas_tags_6873);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    -[GEOPDSearchResult _addNoFlagsSearchTierMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 248) |= 0x100000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(void *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsSearchTierMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 192);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v5;

      id v4 = *(void **)(a1 + 192);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readResultRefinementGroup
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 8) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinementGroup_tags_6874);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)resultRefinementGroup
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readResultRefinementGroup]((uint64_t)a1);
    a1 = (id *)v2[19];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setResultRefinementGroup:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x408000000uLL;
  objc_storeStrong((id *)(a1 + 152), a2);
}

- (void)_readAutoRedoSearchThreshold
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 249) & 8) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutoRedoSearchThreshold_tags_6875);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)autoRedoSearchThreshold
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readAutoRedoSearchThreshold]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAutoRedoSearchThreshold:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400000800uLL;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readPlaceSummaryLayoutMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 0x20) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSummaryLayoutMetadata_tags_6876);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)placeSummaryLayoutMetadata
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readPlaceSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400200000uLL;
  objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)_readSectionList
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 252) & 2) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionList_tags_6877);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)sectionList
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readSectionList]((uint64_t)a1);
    a1 = (id *)v2[25];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSectionList:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x600000000uLL;
  objc_storeStrong((id *)(a1 + 200), a2);
}

- (uint64_t)searchResultViewType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint64_t v2 = *(void *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if ((v2 & 0x10) != 0) {
      return *(unsigned int *)(v1 + 236);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 251) & 0x80) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchSessionData_tags_6878);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)searchSessionData
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readSearchSessionData]((uint64_t)a1);
    a1 = (id *)v2[23];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchSessionData:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x480000000uLL;
  objc_storeStrong((id *)(a1 + 184), a2);
}

- (void)_readOpenPlaceCardForResultWithId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 8) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenPlaceCardForResultWithId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)openPlaceCardForResultWithId
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readOpenPlaceCardForResultWithId]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setOpenPlaceCardForResultWithId:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400080000uLL;
  objc_storeStrong((id *)(a1 + 88), a2);
}

- (uint64_t)mapDisplayType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint64_t v2 = *(void *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 224);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 4) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuideSummaryLayoutMetadata_tags_6879);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)guideSummaryLayoutMetadata
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readGuideSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setGuideSummaryLayoutMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400040000uLL;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setPaginationInfo:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400100000uLL;
  objc_storeStrong((id *)(a1 + 96), a2);
}

- (void)_readRedoButtonThreshold
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 0x40) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRedoButtonThreshold_tags_6881);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)redoButtonThreshold
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchResult _readRedoButtonThreshold]((uint64_t)a1);
    a1 = (id *)v2[14];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRedoButtonThreshold:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 248) |= 0x400400000uLL;
  objc_storeStrong((id *)(a1 + 112), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchResult;
  id v4 = [(GEOPDSearchResult *)&v8 description];
  id v5 = [(GEOPDSearchResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDSearchResult displayMapRegion]((id *)a1);
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

    if ([*(id *)(a1 + 56) count])
    {
      long long v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v206 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      id v11 = *(id *)(a1 + 56);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v206 objects:v217 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v207;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v207 != v13) {
              objc_enumerationMutation(v11);
            }
            unint64_t v15 = *(void **)(*((void *)&v206 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            id v16 = [v15 dictionaryRepresentation];
            }

            [v10 addObject:v16];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v206 objects:v217 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"disambiguationLabel";
      }
      else {
        v17 = @"disambiguation_label";
      }
      [v4 setObject:v10 forKey:v17];
    }
    if (*(unsigned char *)(a1 + 249))
    {
      unint64_t v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 243)];
      if (a2) {
        uint64_t v19 = @"isChainResultSet";
      }
      else {
        uint64_t v19 = @"is_chain_result_set";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if ([*(id *)(a1 + 128) count])
    {
      uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
      long long v204 = 0u;
      long long v205 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      id v21 = *(id *)(a1 + 128);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v202 objects:v216 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v203;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v203 != v23) {
              objc_enumerationMutation(v21);
            }
            uint64_t v25 = *(void **)(*((void *)&v202 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            id v26 = [v25 dictionaryRepresentation];
            }

            [v20 addObject:v26];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v202 objects:v216 count:16];
        }
        while (v22);
      }

      if (a2) {
        uint64_t v27 = @"relatedSearchSuggestion";
      }
      else {
        uint64_t v27 = @"related_search_suggestion";
      }
      [v4 setObject:v20 forKey:v27];
    }
    if ((*(unsigned char *)(a1 + 248) & 8) != 0)
    {
      uint64_t v28 = *(int *)(a1 + 232);
      if (v28 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 232));
        unint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v29 = off_1E53DD130[v28];
      }
      if (a2) {
        uint64_t v30 = @"searchResultType";
      }
      else {
        uint64_t v30 = @"search_result_type";
      }
      [v4 setObject:v29 forKey:v30];
    }
    unint64_t v31 = -[GEOPDSearchResult resultDisplayHeader]((id *)a1);
    if (v31)
    {
      if (a2) {
        unint64_t v32 = @"resultDisplayHeader";
      }
      else {
        unint64_t v32 = @"result_display_header";
      }
      [v4 setObject:v31 forKey:v32];
    }

    NSUInteger v33 = -[GEOPDSearchResult defaultRelatedSearchSuggestion]((id *)a1);
    uint64_t v34 = v33;
    if (v33)
    {
      if (a2)
      {
        uint64_t v35 = [v33 jsonRepresentation];
        uint64_t v36 = @"defaultRelatedSearchSuggestion";
      }
      else
      {
        uint64_t v35 = [v33 dictionaryRepresentation];
        uint64_t v36 = @"default_related_search_suggestion";
      }
      id v37 = v35;

      [v4 setObject:v37 forKey:v36];
    }

    unint64_t v38 = -[GEOPDSearchResult searchClientBehavior]((id *)a1);
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"searchClientBehavior";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"search_client_behavior";
      }
      id v42 = v40;

      [v4 setObject:v42 forKey:v41];
    }

    if ([*(id *)(a1 + 136) count])
    {
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      id v44 = *(id *)(a1 + 136);
      uint64_t v45 = [v44 countByEnumeratingWithState:&v198 objects:v215 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v199;
        do
        {
          for (uint64_t k = 0; k != v45; ++k)
          {
            if (*(void *)v199 != v46) {
              objc_enumerationMutation(v44);
            }
            v48 = *(void **)(*((void *)&v198 + 1) + 8 * k);
            if (a2) {
              [v48 jsonRepresentation];
            }
            else {
            id v49 = [v48 dictionaryRepresentation];
            }

            [v43 addObject:v49];
          }
          uint64_t v45 = [v44 countByEnumeratingWithState:&v198 objects:v215 count:16];
        }
        while (v45);
      }

      if (a2) {
        v50 = @"resultDetourInfo";
      }
      else {
        v50 = @"result_detour_info";
      }
      [v4 setObject:v43 forKey:v50];
    }
    v51 = -[GEOPDSearchResult directionIntent]((id *)a1);
    v52 = v51;
    if (v51)
    {
      if (a2)
      {
        v53 = [v51 jsonRepresentation];
        v54 = @"directionIntent";
      }
      else
      {
        v53 = [v51 dictionaryRepresentation];
        v54 = @"direction_intent";
      }
      id v55 = v53;

      [v4 setObject:v55 forKey:v54];
    }

    v56 = -[GEOPDSearchResult clientResolvedResult]((id *)a1);
    v57 = v56;
    if (v56)
    {
      if (a2)
      {
        v58 = [v56 jsonRepresentation];
        v59 = @"clientResolvedResult";
      }
      else
      {
        v58 = [v56 dictionaryRepresentation];
        v59 = @"client_resolved_result";
      }
      id v60 = v58;

      [v4 setObject:v60 forKey:v59];
    }

    if ([*(id *)(a1 + 64) count])
    {
      v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v196 = 0u;
      long long v197 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      id v62 = *(id *)(a1 + 64);
      uint64_t v63 = [v62 countByEnumeratingWithState:&v194 objects:v214 count:16];
      if (v63)
      {
        uint64_t v64 = *(void *)v195;
        do
        {
          for (uint64_t m = 0; m != v63; ++m)
          {
            if (*(void *)v195 != v64) {
              objc_enumerationMutation(v62);
            }
            v66 = *(void **)(*((void *)&v194 + 1) + 8 * m);
            if (a2) {
              [v66 jsonRepresentation];
            }
            else {
            id v67 = [v66 dictionaryRepresentation];
            }

            [v61 addObject:v67];
          }
          uint64_t v63 = [v62 countByEnumeratingWithState:&v194 objects:v214 count:16];
        }
        while (v63);
      }

      if (a2) {
        v68 = @"displayHeaderSubstitute";
      }
      else {
        v68 = @"display_header_substitute";
      }
      [v4 setObject:v61 forKey:v68];
    }
    uint64_t v69 = *(void *)(a1 + 248);
    if ((v69 & 0x40) != 0)
    {
      v70 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 241)];
      if (a2) {
        v71 = @"enablePartialClientization";
      }
      else {
        v71 = @"enable_partial_clientization";
      }
      [v4 setObject:v70 forKey:v71];

      uint64_t v69 = *(void *)(a1 + 248);
    }
    if (v69)
    {
      v72 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 220)];
      if (a2) {
        v73 = @"dymSuggestionVisibleTime";
      }
      else {
        v73 = @"dym_suggestion_visible_time";
      }
      [v4 setObject:v72 forKey:v73];

      uint64_t v69 = *(void *)(a1 + 248);
    }
    if ((v69 & 0x200) != 0)
    {
      v74 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 244)];
      if (a2) {
        v75 = @"showDymSuggestionCloseButton";
      }
      else {
        v75 = @"show_dym_suggestion_close_button";
      }
      [v4 setObject:v74 forKey:v75];

      uint64_t v69 = *(void *)(a1 + 248);
    }
    if ((v69 & 4) != 0)
    {
      v76 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 228)];
      if (a2) {
        v77 = @"retainSearchTime";
      }
      else {
        v77 = @"retain_search_time";
      }
      [v4 setObject:v76 forKey:v77];
    }
    if ([*(id *)(a1 + 160) count])
    {
      v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      id v79 = *(id *)(a1 + 160);
      uint64_t v80 = [v79 countByEnumeratingWithState:&v190 objects:v213 count:16];
      if (v80)
      {
        uint64_t v81 = *(void *)v191;
        do
        {
          for (uint64_t n = 0; n != v80; ++n)
          {
            if (*(void *)v191 != v81) {
              objc_enumerationMutation(v79);
            }
            v83 = *(void **)(*((void *)&v190 + 1) + 8 * n);
            if (a2) {
              [v83 jsonRepresentation];
            }
            else {
            id v84 = [v83 dictionaryRepresentation];
            }

            [v78 addObject:v84];
          }
          uint64_t v80 = [v79 countByEnumeratingWithState:&v190 objects:v213 count:16];
        }
        while (v80);
      }

      if (a2) {
        v85 = @"retainSearch";
      }
      else {
        v85 = @"retain_search";
      }
      [v4 setObject:v78 forKey:v85];
    }
    if ([*(id *)(a1 + 176) count])
    {
      v86 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
      long long v188 = 0u;
      long long v189 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      id v87 = *(id *)(a1 + 176);
      uint64_t v88 = [v87 countByEnumeratingWithState:&v186 objects:v212 count:16];
      if (v88)
      {
        uint64_t v89 = *(void *)v187;
        do
        {
          for (iuint64_t i = 0; ii != v88; ++ii)
          {
            if (*(void *)v187 != v89) {
              objc_enumerationMutation(v87);
            }
            v91 = *(void **)(*((void *)&v186 + 1) + 8 * ii);
            if (a2) {
              [v91 jsonRepresentation];
            }
            else {
            id v92 = [v91 dictionaryRepresentation];
            }

            [v86 addObject:v92];
          }
          uint64_t v88 = [v87 countByEnumeratingWithState:&v186 objects:v212 count:16];
        }
        while (v88);
      }

      if (a2) {
        v93 = @"searchResultSection";
      }
      else {
        v93 = @"search_result_section";
      }
      [v4 setObject:v86 forKey:v93];
    }
    if ([*(id *)(a1 + 120) count])
    {
      v94 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
      long long v184 = 0u;
      long long v185 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      id v95 = *(id *)(a1 + 120);
      uint64_t v96 = [v95 countByEnumeratingWithState:&v182 objects:v211 count:16];
      if (v96)
      {
        uint64_t v97 = *(void *)v183;
        do
        {
          for (juint64_t j = 0; jj != v96; ++jj)
          {
            if (*(void *)v183 != v97) {
              objc_enumerationMutation(v95);
            }
            v99 = *(void **)(*((void *)&v182 + 1) + 8 * jj);
            if (a2) {
              [v99 jsonRepresentation];
            }
            else {
            id v100 = [v99 dictionaryRepresentation];
            }

            [v94 addObject:v100];
          }
          uint64_t v96 = [v95 countByEnumeratingWithState:&v182 objects:v211 count:16];
        }
        while (v96);
      }

      if (a2) {
        v101 = @"relatedEntitySection";
      }
      else {
        v101 = @"related_entity_section";
      }
      [v4 setObject:v94 forKey:v101];
    }
    if ([*(id *)(a1 + 192) count])
    {
      v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
      long long v180 = 0u;
      long long v181 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      id v103 = *(id *)(a1 + 192);
      uint64_t v104 = [v103 countByEnumeratingWithState:&v178 objects:v210 count:16];
      if (v104)
      {
        uint64_t v105 = *(void *)v179;
        do
        {
          for (kuint64_t k = 0; kk != v104; ++kk)
          {
            if (*(void *)v179 != v105) {
              objc_enumerationMutation(v103);
            }
            v107 = *(void **)(*((void *)&v178 + 1) + 8 * kk);
            if (a2) {
              [v107 jsonRepresentation];
            }
            else {
            id v108 = [v107 dictionaryRepresentation];
            }

            [v102 addObject:v108];
          }
          uint64_t v104 = [v103 countByEnumeratingWithState:&v178 objects:v210 count:16];
        }
        while (v104);
      }

      if (a2) {
        v109 = @"searchTierMetadata";
      }
      else {
        v109 = @"search_tier_metadata";
      }
      [v4 setObject:v102 forKey:v109];
    }
    v110 = -[GEOPDSearchResult resultRefinementGroup]((id *)a1);
    v111 = v110;
    if (v110)
    {
      if (a2)
      {
        v112 = [v110 jsonRepresentation];
        v113 = @"resultRefinementGroup";
      }
      else
      {
        v112 = [v110 dictionaryRepresentation];
        v113 = @"result_refinement_group";
      }
      id v114 = v112;

      [v4 setObject:v114 forKey:v113];
    }

    v115 = -[GEOPDSearchResult autoRedoSearchThreshold]((id *)a1);
    v116 = v115;
    if (v115)
    {
      if (a2)
      {
        v117 = [v115 jsonRepresentation];
        v118 = @"autoRedoSearchThreshold";
      }
      else
      {
        v117 = [v115 dictionaryRepresentation];
        v118 = @"auto_redo_search_threshold";
      }
      id v119 = v117;

      [v4 setObject:v119 forKey:v118];
    }

    v120 = -[GEOPDSearchResult placeSummaryLayoutMetadata]((id *)a1);
    v121 = v120;
    if (v120)
    {
      if (a2)
      {
        v122 = [v120 jsonRepresentation];
        v123 = @"placeSummaryLayoutMetadata";
      }
      else
      {
        v122 = [v120 dictionaryRepresentation];
        v123 = @"place_summary_layout_metadata";
      }
      id v124 = v122;

      [v4 setObject:v124 forKey:v123];
    }

    v125 = -[GEOPDSearchResult sectionList]((id *)a1);
    v126 = v125;
    if (v125)
    {
      if (a2)
      {
        v127 = [v125 jsonRepresentation];
        v128 = @"sectionList";
      }
      else
      {
        v127 = [v125 dictionaryRepresentation];
        v128 = @"section_list";
      }
      id v129 = v127;

      [v4 setObject:v129 forKey:v128];
    }

    uint64_t v130 = *(void *)(a1 + 248);
    if ((v130 & 0x20) != 0)
    {
      v131 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 240)];
      if (a2) {
        v132 = @"disableAddingAdditionalPaddingOnViewport";
      }
      else {
        v132 = @"disable_adding_additional_padding_on_viewport";
      }
      [v4 setObject:v131 forKey:v132];

      uint64_t v130 = *(void *)(a1 + 248);
    }
    if ((v130 & 0x10) != 0)
    {
      uint64_t v133 = *(int *)(a1 + 236);
      if (v133 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 236));
        v134 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v134 = off_1E53DD158[v133];
      }
      if (a2) {
        v135 = @"searchResultViewType";
      }
      else {
        v135 = @"search_result_view_type";
      }
      [v4 setObject:v134 forKey:v135];

      uint64_t v130 = *(void *)(a1 + 248);
    }
    if ((v130 & 0x80) != 0)
    {
      v136 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 242)];
      if (a2) {
        v137 = @"enableStructuredRapAffordance";
      }
      else {
        v137 = @"enable_structured_rap_affordance";
      }
      [v4 setObject:v136 forKey:v137];
    }
    v138 = -[GEOPDSearchResult searchSessionData]((id *)a1);
    v139 = v138;
    if (v138)
    {
      if (a2)
      {
        v140 = [v138 jsonRepresentation];
        v141 = @"searchSessionData";
      }
      else
      {
        v140 = [v138 dictionaryRepresentation];
        v141 = @"search_session_data";
      }
      id v142 = v140;

      [v4 setObject:v142 forKey:v141];
    }

    v143 = -[GEOPDSearchResult openPlaceCardForResultWithId]((id *)a1);
    v144 = v143;
    if (v143)
    {
      if (a2)
      {
        v145 = [v143 jsonRepresentation];
        v146 = @"openPlaceCardForResultWithId";
      }
      else
      {
        v145 = [v143 dictionaryRepresentation];
        v146 = @"open_place_card_for_result_with_id";
      }
      id v147 = v145;

      [v4 setObject:v147 forKey:v146];
    }

    if ((*(unsigned char *)(a1 + 248) & 2) != 0)
    {
      int v148 = *(_DWORD *)(a1 + 224);
      if (v148)
      {
        if (v148 == 1)
        {
          v149 = @"TOPOGRAPHIC";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 224));
          v149 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v149 = @"DEFAULT";
      }
      if (a2) {
        v150 = @"mapDisplayType";
      }
      else {
        v150 = @"map_display_type";
      }
      [v4 setObject:v149 forKey:v150];
    }
    v151 = -[GEOPDSearchResult guideSummaryLayoutMetadata]((id *)a1);
    v152 = v151;
    if (v151)
    {
      if (a2)
      {
        v153 = [v151 jsonRepresentation];
        v154 = @"guideSummaryLayoutMetadata";
      }
      else
      {
        v153 = [v151 dictionaryRepresentation];
        v154 = @"guide_summary_layout_metadata";
      }
      id v155 = v153;

      [v4 setObject:v155 forKey:v154];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(unsigned char *)(a1 + 250) & 0x10) == 0)
    {
      v156 = *(void **)(a1 + 8);
      if (v156)
      {
        id v157 = v156;
        objc_sync_enter(v157);
        GEOPDSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaginationInfo_tags_6880);
        objc_sync_exit(v157);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    id v158 = *(id *)(a1 + 96);
    v159 = v158;
    if (v158)
    {
      if (a2)
      {
        v160 = [v158 jsonRepresentation];
        v161 = @"paginationInfo";
      }
      else
      {
        v160 = [v158 dictionaryRepresentation];
        v161 = @"pagination_info";
      }
      id v162 = v160;

      [v4 setObject:v162 forKey:v161];
    }

    v163 = -[GEOPDSearchResult redoButtonThreshold]((id *)a1);
    v164 = v163;
    if (v163)
    {
      if (a2)
      {
        v165 = [v163 jsonRepresentation];
        v166 = @"redoButtonThreshold";
      }
      else
      {
        v165 = [v163 dictionaryRepresentation];
        v166 = @"redo_button_threshold";
      }
      id v167 = v165;

      [v4 setObject:v167 forKey:v166];
    }

    v168 = *(void **)(a1 + 16);
    if (v168)
    {
      v169 = [v168 dictionaryRepresentation];
      v170 = v169;
      if (a2)
      {
        v171 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v169, "count"));
        v176[0] = MEMORY[0x1E4F143A8];
        v176[1] = 3221225472;
        v176[2] = __47__GEOPDSearchResult__dictionaryRepresentation___block_invoke;
        v176[3] = &unk_1E53D8860;
        id v172 = v171;
        id v177 = v172;
        [v170 enumerateKeysAndObjectsUsingBlock:v176];
        id v173 = v172;
      }
      else
      {
        id v173 = v169;
      }
      [v4 setObject:v173 forKey:@"Unknown Fields"];
    }
    id v174 = v4;
  }
  else
  {
    id v174 = 0;
  }

  return v174;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDSearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (id)[a1 init];

  if (!v6) {
    goto LABEL_356;
  }
  if (a3) {
    id v7 = @"displayMapRegion";
  }
  else {
    id v7 = @"display_map_region";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  unint64_t v9 = 0x1E4F1C000uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOMapRegion alloc];
    if (a3) {
      id v11 = [(GEOMapRegion *)v10 initWithJSON:v8];
    }
    else {
      id v11 = [(GEOMapRegion *)v10 initWithDictionary:v8];
    }
    uint64_t v12 = v11;
    -[GEOPDSearchResult setDisplayMapRegion:]((uint64_t)v6, v11);
  }
  if (a3) {
    uint64_t v13 = @"disambiguationLabel";
  }
  else {
    uint64_t v13 = @"disambiguation_label";
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  id v206 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v242 = 0u;
    long long v243 = 0u;
    long long v240 = 0u;
    long long v241 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v240 objects:v251 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v241;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v241 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v240 + 1) + 8 * v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [GEOPDMultiLocalizedString alloc];
            if (v21) {
              uint64_t v22 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v21, v20, a3);
            }
            else {
              uint64_t v22 = 0;
            }
            -[GEOPDSearchResult addDisambiguationLabel:]((uint64_t)v6, v22);
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v23 = [v15 countByEnumeratingWithState:&v240 objects:v251 count:16];
        uint64_t v17 = v23;
      }
      while (v23);
    }

    id v5 = v206;
  }

  if (a3) {
    uint64_t v24 = @"isChainResultSet";
  }
  else {
    uint64_t v24 = @"is_chain_result_set";
  }
  uint64_t v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v26 = [v25 BOOLValue];
    *((void *)v6 + 31) |= 0x400000100uLL;
    *((unsigned char *)v6 + 243) = v26;
  }

  if (a3) {
    uint64_t v27 = @"relatedSearchSuggestion";
  }
  else {
    uint64_t v27 = @"related_search_suggestion";
  }
  v210 = v27;
  uint64_t v28 = objc_msgSend(v5, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v238 = 0u;
    long long v239 = 0u;
    long long v236 = 0u;
    long long v237 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v236 objects:v250 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v237;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v237 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v236 + 1) + 8 * v33);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v35 = [GEOPDRelatedSearchSuggestion alloc];
            if (v35) {
              uint64_t v36 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v35, v34, a3);
            }
            else {
              uint64_t v36 = 0;
            }
            -[GEOPDSearchResult addRelatedSearchSuggestion:]((uint64_t)v6, v36);
          }
          ++v33;
        }
        while (v31 != v33);
        uint64_t v37 = [v29 countByEnumeratingWithState:&v236 objects:v250 count:16];
        uint64_t v31 = v37;
      }
      while (v37);
    }

    id v5 = v206;
  }

  if (a3) {
    unint64_t v38 = @"searchResultType";
  }
  else {
    unint64_t v38 = @"search_result_type";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v39;
    if ([v40 isEqualToString:@"SEARCH_RESULT_TYPE_UNKNOWN"])
    {
      int v41 = 0;
    }
    else if ([v40 isEqualToString:@"SEARCH_RESULT_TYPE_DEFAULT"])
    {
      int v41 = 1;
    }
    else if ([v40 isEqualToString:@"SEARCH_RESULT_TYPE_NO_RESULT"])
    {
      int v41 = 2;
    }
    else if ([v40 isEqualToString:@"SEARCH_RESULT_TYPE_WITH_HINT"])
    {
      int v41 = 3;
    }
    else if ([v40 isEqualToString:@"SEARCH_RESULT_TYPE_DYM"])
    {
      int v41 = 4;
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
      goto LABEL_70;
    }
    int v41 = [v39 intValue];
  }
  *((void *)v6 + 31) |= 0x400000008uLL;
  *((_DWORD *)v6 + 58) = v41;
LABEL_70:

  if (a3) {
    id v42 = @"resultDisplayHeader";
  }
  else {
    id v42 = @"result_display_header";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = (void *)[v43 copy];
    -[GEOPDSearchResult setResultDisplayHeader:]((uint64_t)v6, v44);
  }
  if (a3) {
    uint64_t v45 = @"defaultRelatedSearchSuggestion";
  }
  else {
    uint64_t v45 = @"default_related_search_suggestion";
  }
  uint64_t v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v47 = [GEOPDRelatedSearchSuggestion alloc];
    if (v47) {
      v48 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v47, v46, a3);
    }
    else {
      v48 = 0;
    }
    -[GEOPDSearchResult setDefaultRelatedSearchSuggestion:]((uint64_t)v6, v48);
  }
  if (a3) {
    id v49 = @"searchClientBehavior";
  }
  else {
    id v49 = @"search_client_behavior";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = [GEOPDSearchClientBehavior alloc];
    if (v51) {
      v52 = -[GEOPDSearchClientBehavior _initWithDictionary:isJSON:](v51, v50, a3);
    }
    else {
      v52 = 0;
    }
    -[GEOPDSearchResult setSearchClientBehavior:]((uint64_t)v6, v52);
  }
  if (a3) {
    v53 = @"resultDetourInfo";
  }
  else {
    v53 = @"result_detour_info";
  }
  v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v234 = 0u;
    long long v235 = 0u;
    long long v232 = 0u;
    long long v233 = 0u;
    id v55 = v54;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v232 objects:v249 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v233;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v233 != v58) {
            objc_enumerationMutation(v55);
          }
          uint64_t v60 = *(void *)(*((void *)&v232 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v61 = [GEOPDResultDetourInfo alloc];
            if (a3) {
              id v62 = [(GEOPDResultDetourInfo *)v61 initWithJSON:v60];
            }
            else {
              id v62 = [(GEOPDResultDetourInfo *)v61 initWithDictionary:v60];
            }
            uint64_t v63 = v62;
            -[GEOPDSearchResult addResultDetourInfo:]((uint64_t)v6, v62);
          }
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v232 objects:v249 count:16];
      }
      while (v57);
    }

    id v5 = v206;
  }

  if (a3) {
    uint64_t v64 = @"directionIntent";
  }
  else {
    uint64_t v64 = @"direction_intent";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v66 = [GEOPDDirectionIntent alloc];
    if (v66) {
      id v67 = (void *)-[GEOPDDirectionIntent _initWithDictionary:isJSON:]((uint64_t)v66, v65, a3);
    }
    else {
      id v67 = 0;
    }
    -[GEOPDSearchResult setDirectionIntent:]((uint64_t)v6, v67);
  }
  if (a3) {
    v68 = @"clientResolvedResult";
  }
  else {
    v68 = @"client_resolved_result";
  }
  uint64_t v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v70 = [GEOPDResolvedItem alloc];
    if (v70) {
      v71 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v70, v69, a3);
    }
    else {
      v71 = 0;
    }
    -[GEOPDSearchResult setClientResolvedResult:]((uint64_t)v6, v71);
  }
  if (a3) {
    v72 = @"displayHeaderSubstitute";
  }
  else {
    v72 = @"display_header_substitute";
  }
  v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v230 = 0u;
    long long v231 = 0u;
    long long v228 = 0u;
    long long v229 = 0u;
    long long v205 = v73;
    obuint64_t j = v73;
    uint64_t v74 = [obj countByEnumeratingWithState:&v228 objects:v248 count:16];
    if (!v74) {
      goto LABEL_163;
    }
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v229;
    if (a3) {
      v77 = @"substituteType";
    }
    else {
      v77 = @"substitute_type";
    }
    v78 = @"interpreted_query";
    if (a3) {
      v78 = @"interpretedQuery";
    }
    long long v207 = v78;
    long long v208 = v77;
    id v209 = v6;
    while (1)
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v229 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v80 = *(void **)(*((void *)&v228 + 1) + 8 * v79);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v81 = [GEOPDDisplayHeaderSubstitute alloc];
          if (v81)
          {
            v82 = v81;
            id v83 = v80;
            uint64_t v84 = [(GEOPDDisplayHeaderSubstitute *)v82 init];
            if (v84)
            {
              unint64_t v85 = v9;
              v86 = [v83 objectForKeyedSubscript:v208];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v87 = v86;
                if ([v87 isEqualToString:@"SUBSTITUTE_TYPE_UNKNOWN"])
                {
                  int v88 = 0;
                }
                else if ([v87 isEqualToString:@"SUBSTITUTE_TYPE_INTERPRETED_QUERY"])
                {
                  int v88 = 1;
                }
                else if ([v87 isEqualToString:@"SUBSTITUTE_TYPE_RELATED_SEARCH_SUGGESTION"])
                {
                  int v88 = 2;
                }
                else
                {
                  int v88 = 0;
                }

LABEL_148:
                *(unsigned char *)(v84 + 56) |= 0x10u;
                *(unsigned char *)(v84 + 56) |= 1u;
                *(_DWORD *)(v84 + 52) = v88;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v88 = [v86 intValue];
                  goto LABEL_148;
                }
              }

              uint64_t v89 = [v83 objectForKeyedSubscript:v207];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v90 = (void *)[v89 copy];
                id v91 = v90;
                *(unsigned char *)(v84 + 56) |= 4u;
                *(unsigned char *)(v84 + 56) |= 0x10u;
                objc_storeStrong((id *)(v84 + 24), v90);
              }
              id v92 = [v83 objectForKeyedSubscript:v210];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v93 = [GEOPDRelatedSearchSuggestion alloc];
                if (v93) {
                  v94 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v93, v92, a3);
                }
                else {
                  v94 = 0;
                }
                id v95 = v94;
                *(unsigned char *)(v84 + 56) |= 8u;
                *(unsigned char *)(v84 + 56) |= 0x10u;
                objc_storeStrong((id *)(v84 + 32), v94);
              }
              id v6 = v209;
              unint64_t v9 = v85;
            }
          }
          else
          {
            uint64_t v84 = 0;
          }
          -[GEOPDSearchResult addDisplayHeaderSubstitute:]((uint64_t)v6, (void *)v84);
        }
        ++v79;
      }
      while (v75 != v79);
      uint64_t v96 = [obj countByEnumeratingWithState:&v228 objects:v248 count:16];
      uint64_t v75 = v96;
      if (!v96)
      {
LABEL_163:

        v73 = v205;
        id v5 = v206;
        break;
      }
    }
  }

  if (a3) {
    uint64_t v97 = @"enablePartialClientization";
  }
  else {
    uint64_t v97 = @"enable_partial_clientization";
  }
  v98 = [v5 objectForKeyedSubscript:v97];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v99 = [v98 BOOLValue];
    *((void *)v6 + 31) |= 0x400000040uLL;
    *((unsigned char *)v6 + 241) = v99;
  }

  if (a3) {
    id v100 = @"dymSuggestionVisibleTime";
  }
  else {
    id v100 = @"dym_suggestion_visible_time";
  }
  v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v102 = [v101 unsignedIntValue];
    *((void *)v6 + 31) |= 0x400000001uLL;
    *((_DWORD *)v6 + 55) = v102;
  }

  if (a3) {
    id v103 = @"showDymSuggestionCloseButton";
  }
  else {
    id v103 = @"show_dym_suggestion_close_button";
  }
  uint64_t v104 = [v5 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v105 = [v104 BOOLValue];
    *((void *)v6 + 31) |= 0x400000200uLL;
    *((unsigned char *)v6 + 244) = v105;
  }

  if (a3) {
    v106 = @"retainSearchTime";
  }
  else {
    v106 = @"retain_search_time";
  }
  v107 = [v5 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v108 = [v107 unsignedIntValue];
    *((void *)v6 + 31) |= 0x400000004uLL;
    *((_DWORD *)v6 + 57) = v108;
  }

  if (a3) {
    v109 = @"retainSearch";
  }
  else {
    v109 = @"retain_search";
  }
  v110 = [v5 objectForKeyedSubscript:v109];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v226 = 0u;
    long long v227 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    id v111 = v110;
    uint64_t v112 = [v111 countByEnumeratingWithState:&v224 objects:v247 count:16];
    if (v112)
    {
      uint64_t v113 = v112;
      uint64_t v114 = *(void *)v225;
      do
      {
        uint64_t v115 = 0;
        do
        {
          if (*(void *)v225 != v114) {
            objc_enumerationMutation(v111);
          }
          v116 = *(void **)(*((void *)&v224 + 1) + 8 * v115);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v117 = [GEOPDRetainedSearchMetadata alloc];
            if (v117) {
              v118 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v117, v116, a3);
            }
            else {
              v118 = 0;
            }
            -[GEOPDSearchResult addRetainSearch:]((uint64_t)v6, v118);
          }
          ++v115;
        }
        while (v113 != v115);
        uint64_t v119 = [v111 countByEnumeratingWithState:&v224 objects:v247 count:16];
        uint64_t v113 = v119;
      }
      while (v119);
    }

    id v5 = v206;
  }

  if (a3) {
    v120 = @"searchResultSection";
  }
  else {
    v120 = @"search_result_section";
  }
  v121 = [v5 objectForKeyedSubscript:v120];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v222 = 0u;
    long long v223 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    id v122 = v121;
    uint64_t v123 = [v122 countByEnumeratingWithState:&v220 objects:v246 count:16];
    if (v123)
    {
      uint64_t v124 = v123;
      uint64_t v125 = *(void *)v221;
      do
      {
        uint64_t v126 = 0;
        do
        {
          if (*(void *)v221 != v125) {
            objc_enumerationMutation(v122);
          }
          v127 = *(void **)(*((void *)&v220 + 1) + 8 * v126);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v128 = [GEOPDSSearchResultSection alloc];
            if (v128) {
              id v129 = (void *)-[GEOPDSSearchResultSection _initWithDictionary:isJSON:]((uint64_t)v128, v127, a3);
            }
            else {
              id v129 = 0;
            }
            -[GEOPDSearchResult addSearchResultSection:]((uint64_t)v6, v129);
          }
          ++v126;
        }
        while (v124 != v126);
        uint64_t v130 = [v122 countByEnumeratingWithState:&v220 objects:v246 count:16];
        uint64_t v124 = v130;
      }
      while (v130);
    }

    id v5 = v206;
  }

  if (a3) {
    v131 = @"relatedEntitySection";
  }
  else {
    v131 = @"related_entity_section";
  }
  v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v218 = 0u;
    long long v219 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    id v133 = v132;
    uint64_t v134 = [v133 countByEnumeratingWithState:&v216 objects:v245 count:16];
    if (v134)
    {
      uint64_t v135 = v134;
      uint64_t v136 = *(void *)v217;
      do
      {
        uint64_t v137 = 0;
        do
        {
          if (*(void *)v217 != v136) {
            objc_enumerationMutation(v133);
          }
          v138 = *(void **)(*((void *)&v216 + 1) + 8 * v137);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v139 = [GEOPDRelatedEntitySection alloc];
            if (v139) {
              v140 = (void *)-[GEOPDRelatedEntitySection _initWithDictionary:isJSON:]((uint64_t)v139, v138, a3);
            }
            else {
              v140 = 0;
            }
            -[GEOPDSearchResult addRelatedEntitySection:]((uint64_t)v6, v140);
          }
          ++v137;
        }
        while (v135 != v137);
        uint64_t v141 = [v133 countByEnumeratingWithState:&v216 objects:v245 count:16];
        uint64_t v135 = v141;
      }
      while (v141);
    }

    id v5 = v206;
  }

  if (a3) {
    id v142 = @"searchTierMetadata";
  }
  else {
    id v142 = @"search_tier_metadata";
  }
  v143 = [v5 objectForKeyedSubscript:v142];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v214 = 0u;
    long long v215 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    id v144 = v143;
    uint64_t v145 = [v144 countByEnumeratingWithState:&v212 objects:v244 count:16];
    if (v145)
    {
      uint64_t v146 = v145;
      uint64_t v147 = *(void *)v213;
      do
      {
        uint64_t v148 = 0;
        do
        {
          if (*(void *)v213 != v147) {
            objc_enumerationMutation(v144);
          }
          v149 = *(void **)(*((void *)&v212 + 1) + 8 * v148);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v150 = [GEOPDSSearchTierMetadata alloc];
            if (v150) {
              v151 = (void *)-[GEOPDSSearchTierMetadata _initWithDictionary:isJSON:]((uint64_t)v150, v149, a3);
            }
            else {
              v151 = 0;
            }
            -[GEOPDSearchResult addSearchTierMetadata:]((uint64_t)v6, v151);
          }
          ++v148;
        }
        while (v146 != v148);
        uint64_t v152 = [v144 countByEnumeratingWithState:&v212 objects:v244 count:16];
        uint64_t v146 = v152;
      }
      while (v152);
    }

    id v5 = v206;
  }

  if (a3) {
    v153 = @"resultRefinementGroup";
  }
  else {
    v153 = @"result_refinement_group";
  }
  v154 = [v5 objectForKeyedSubscript:v153];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v155 = [GEOPDResultRefinementGroup alloc];
    if (v155) {
      v156 = -[GEOPDResultRefinementGroup _initWithDictionary:isJSON:](v155, v154, a3);
    }
    else {
      v156 = 0;
    }
    -[GEOPDSearchResult setResultRefinementGroup:]((uint64_t)v6, v156);
  }
  if (a3) {
    id v157 = @"autoRedoSearchThreshold";
  }
  else {
    id v157 = @"auto_redo_search_threshold";
  }
  id v158 = [v5 objectForKeyedSubscript:v157];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v159 = [GEOPDSSearchAutoRedoThreshold alloc];
    if (v159) {
      v160 = (void *)-[GEOPDSSearchAutoRedoThreshold _initWithDictionary:isJSON:]((uint64_t)v159, v158, a3);
    }
    else {
      v160 = 0;
    }
    -[GEOPDSearchResult setAutoRedoSearchThreshold:]((uint64_t)v6, v160);
  }
  if (a3) {
    v161 = @"placeSummaryLayoutMetadata";
  }
  else {
    v161 = @"place_summary_layout_metadata";
  }
  id v162 = [v5 objectForKeyedSubscript:v161];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v163 = [GEOPDPlaceSummaryLayoutMetadata alloc];
    if (a3) {
      v164 = [(GEOPDPlaceSummaryLayoutMetadata *)v163 initWithJSON:v162];
    }
    else {
      v164 = [(GEOPDPlaceSummaryLayoutMetadata *)v163 initWithDictionary:v162];
    }
    v165 = v164;
    -[GEOPDSearchResult setPlaceSummaryLayoutMetadata:]((uint64_t)v6, v164);
  }
  if (a3) {
    v166 = @"sectionList";
  }
  else {
    v166 = @"section_list";
  }
  id v167 = [v5 objectForKeyedSubscript:v166];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v168 = [GEOPDSearchSectionList alloc];
    if (v168) {
      v169 = (void *)-[GEOPDSearchSectionList _initWithDictionary:isJSON:](v168, v167, a3);
    }
    else {
      v169 = 0;
    }
    -[GEOPDSearchResult setSectionList:]((uint64_t)v6, v169);
  }
  if (a3) {
    v170 = @"disableAddingAdditionalPaddingOnViewport";
  }
  else {
    v170 = @"disable_adding_additional_padding_on_viewport";
  }
  v171 = [v5 objectForKeyedSubscript:v170];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v172 = [v171 BOOLValue];
    *((void *)v6 + 31) |= 0x400000020uLL;
    *((unsigned char *)v6 + 240) = v172;
  }

  if (a3) {
    id v173 = @"searchResultViewType";
  }
  else {
    id v173 = @"search_result_view_type";
  }
  id v174 = [v5 objectForKeyedSubscript:v173];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v175 = v174;
    if ([v175 isEqualToString:@"SEARCH_RESULT_VIEW_TYPE_DEFAULT"])
    {
      int v176 = 0;
    }
    else if ([v175 isEqualToString:@"SEARCH_RESULT_VIEW_TYPE_RESULT_LIST"])
    {
      int v176 = 1;
    }
    else if ([v175 isEqualToString:@"SEARCH_RESULT_VIEW_TYPE_PLACE_CARD"])
    {
      int v176 = 2;
    }
    else
    {
      int v176 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_305;
    }
    int v176 = [v174 intValue];
  }
  *((void *)v6 + 31) |= 0x400000010uLL;
  *((_DWORD *)v6 + 59) = v176;
LABEL_305:

  if (a3) {
    id v177 = @"enableStructuredRapAffordance";
  }
  else {
    id v177 = @"enable_structured_rap_affordance";
  }
  long long v178 = [v5 objectForKeyedSubscript:v177];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v179 = [v178 BOOLValue];
    *((void *)v6 + 31) |= 0x400000080uLL;
    *((unsigned char *)v6 + 242) = v179;
  }

  if (a3) {
    long long v180 = @"searchSessionData";
  }
  else {
    long long v180 = @"search_session_data";
  }
  long long v181 = [v5 objectForKeyedSubscript:v180];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v182 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v181);
    -[GEOPDSearchResult setSearchSessionData:]((uint64_t)v6, v182);
  }
  if (a3) {
    long long v183 = @"openPlaceCardForResultWithId";
  }
  else {
    long long v183 = @"open_place_card_for_result_with_id";
  }
  long long v184 = [v5 objectForKeyedSubscript:v183];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v185 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      long long v186 = [(GEOPDMapsIdentifier *)v185 initWithJSON:v184];
    }
    else {
      long long v186 = [(GEOPDMapsIdentifier *)v185 initWithDictionary:v184];
    }
    long long v187 = v186;
    -[GEOPDSearchResult setOpenPlaceCardForResultWithId:]((uint64_t)v6, v186);
  }
  if (a3) {
    long long v188 = @"mapDisplayType";
  }
  else {
    long long v188 = @"map_display_type";
  }
  long long v189 = [v5 objectForKeyedSubscript:v188];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v190 = v189;
    if ([v190 isEqualToString:@"DEFAULT"]) {
      int v191 = 0;
    }
    else {
      int v191 = [v190 isEqualToString:@"TOPOGRAPHIC"];
    }

    goto LABEL_333;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v191 = [v189 intValue];
LABEL_333:
    *((void *)v6 + 31) |= 0x400000002uLL;
    *((_DWORD *)v6 + 56) = v191;
  }

  if (a3) {
    long long v192 = @"guideSummaryLayoutMetadata";
  }
  else {
    long long v192 = @"guide_summary_layout_metadata";
  }
  long long v193 = [v5 objectForKeyedSubscript:v192];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v194 = [GEOPDGuideSummaryLayoutMetadata alloc];
    if (v194) {
      long long v195 = (void *)-[GEOPDGuideSummaryLayoutMetadata _initWithDictionary:isJSON:]((uint64_t)v194, v193, a3);
    }
    else {
      long long v195 = 0;
    }
    -[GEOPDSearchResult setGuideSummaryLayoutMetadata:]((uint64_t)v6, v195);
  }
  if (a3) {
    long long v196 = @"paginationInfo";
  }
  else {
    long long v196 = @"pagination_info";
  }
  long long v197 = [v5 objectForKeyedSubscript:v196];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v198 = [GEOPDPaginationInfo alloc];
    if (v198) {
      long long v199 = (void *)-[GEOPDPaginationInfo _initWithDictionary:isJSON:](v198, v197, a3);
    }
    else {
      long long v199 = 0;
    }
    -[GEOPDSearchResult setPaginationInfo:]((uint64_t)v6, v199);
  }
  if (a3) {
    long long v200 = @"redoButtonThreshold";
  }
  else {
    long long v200 = @"redo_button_threshold";
  }
  long long v201 = [v5 objectForKeyedSubscript:v200];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v202 = [GEOPDSSearchRedoButtonThreshold alloc];
    if (v202) {
      long long v203 = (void *)-[GEOPDSSearchRedoButtonThreshold _initWithDictionary:isJSON:]((uint64_t)v202, v201, a3);
    }
    else {
      long long v203 = 0;
    }
    -[GEOPDSearchResult setRedoButtonThreshold:]((uint64_t)v6, v203);
  }
LABEL_356:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchResultIsDirty((uint64_t)self) & 1) == 0)
  {
    id v40 = self->_reader;
    objc_sync_enter(v40);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    int v41 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v41];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v40);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v6 = self->_disambiguationLabels;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v71;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v71 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v70 objects:v81 count:16];
      }
      while (v7);
    }

    if (*((unsigned char *)&self->_flags + 1)) {
      PBDataWriterWriteBOOLField();
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v10 = self->_relatedSearchSuggestions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v67;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v67 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v11);
    }

    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_resultDisplayHeader) {
      PBDataWriterWriteStringField();
    }
    if (self->_defaultRelatedSearchSuggestion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_searchClientBehavior) {
      PBDataWriterWriteSubmessage();
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v14 = self->_resultDetourInfos;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v62 objects:v79 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v63;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v62 objects:v79 count:16];
      }
      while (v15);
    }

    if (self->_directionIntent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientResolvedResult) {
      PBDataWriterWriteSubmessage();
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v18 = self->_displayHeaderSubstitutes;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v78 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v59;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v59 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v78 count:16];
      }
      while (v19);
    }

    $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
    }
    if (*(unsigned char *)&flags)
    {
      PBDataWriterWriteUint32Field();
      $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v23 = self->_retainSearchs;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v77 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v55;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v23);
          }
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v77 count:16];
      }
      while (v24);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v27 = self->_searchResultSections;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v76 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v51;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v27);
          }
          PBDataWriterWriteSubmessage();
          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v76 count:16];
      }
      while (v28);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v31 = self->_relatedEntitySections;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v75 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v47;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v31);
          }
          PBDataWriterWriteSubmessage();
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v75 count:16];
      }
      while (v32);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v35 = self->_searchTierMetadatas;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v74 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v43;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v35);
          }
          PBDataWriterWriteSubmessage();
          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v74 count:16];
      }
      while (v36);
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
    $A1FAD422473D1390BB4F551D8B8DF0D1 v39 = self->_flags;
    if ((*(unsigned char *)&v39 & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      $A1FAD422473D1390BB4F551D8B8DF0D1 v39 = self->_flags;
    }
    if ((*(unsigned char *)&v39 & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      $A1FAD422473D1390BB4F551D8B8DF0D1 v39 = self->_flags;
    }
    if ((*(unsigned char *)&v39 & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_searchSessionData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_openPlaceCardForResultWithId) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
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
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v42);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 4) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_77;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchResult readAll:]((uint64_t)self, 0);
  id v9 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
  id v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v11 = self->_disambiguationLabels;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v111 objects:v122 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v112 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v111 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchResult addDisambiguationLabel:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v111 objects:v122 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(unsigned char *)(v5 + 243) = self->_isChainResultSet;
    *(void *)(v5 + 248) |= 0x100uLL;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v16 = self->_relatedSearchSuggestions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v107 objects:v121 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v108;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v108 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = (void *)[*(id *)(*((void *)&v107 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDSearchResult addRelatedSearchSuggestion:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v107 objects:v121 count:16];
    }
    while (v17);
  }

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_searchResultType;
    *(void *)(v5 + 248) |= 8uLL;
  }
  uint64_t v21 = [(NSString *)self->_resultDisplayHeader copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v21;

  id v23 = [(GEOPDRelatedSearchSuggestion *)self->_defaultRelatedSearchSuggestion copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v23;

  id v25 = [(GEOPDSearchClientBehavior *)self->_searchClientBehavior copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v25;

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v27 = self->_resultDetourInfos;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v103 objects:v120 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v104;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v104 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDSearchResult addResultDetourInfo:](v5, v31);
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v103 objects:v120 count:16];
    }
    while (v28);
  }

  id v32 = [(GEOPDDirectionIntent *)self->_directionIntent copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v32;

  id v34 = [(GEOPDResolvedItem *)self->_clientResolvedResult copyWithZone:a3];
  uint64_t v35 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v34;

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v36 = self->_displayHeaderSubstitutes;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v99 objects:v119 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v100;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v100 != v38) {
          objc_enumerationMutation(v36);
        }
        id v40 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDSearchResult addDisplayHeaderSubstitute:](v5, v40);
      }
      uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v99 objects:v119 count:16];
    }
    while (v37);
  }

  $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 241) = self->_enablePartialClientization;
    *(void *)(v5 + 248) |= 0x40uLL;
    $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_39:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_40;
      }
      goto LABEL_80;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_39;
  }
  *(_DWORD *)(v5 + 220) = self->_dymSuggestionVisibleTime;
  *(void *)(v5 + 248) |= 1uLL;
  $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_80:
  *(unsigned char *)(v5 + 244) = self->_showDymSuggestionCloseButton;
  *(void *)(v5 + 248) |= 0x200uLL;
  if ((*(void *)&self->_flags & 4) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 228) = self->_retainSearchTime;
    *(void *)(v5 + 248) |= 4uLL;
  }
LABEL_42:
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v42 = self->_retainSearchs;
  uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v95 objects:v118 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v96;
    do
    {
      for (uint64_t n = 0; n != v43; ++n)
      {
        if (*(void *)v96 != v44) {
          objc_enumerationMutation(v42);
        }
        long long v46 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * n) copyWithZone:a3];
        -[GEOPDSearchResult addRetainSearch:](v5, v46);
      }
      uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v95 objects:v118 count:16];
    }
    while (v43);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v47 = self->_searchResultSections;
  uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v91 objects:v117 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v92;
    do
    {
      for (iuint64_t i = 0; ii != v48; ++ii)
      {
        if (*(void *)v92 != v49) {
          objc_enumerationMutation(v47);
        }
        long long v51 = (void *)[*(id *)(*((void *)&v91 + 1) + 8 * ii) copyWithZone:a3];
        -[GEOPDSearchResult addSearchResultSection:](v5, v51);
      }
      uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v91 objects:v117 count:16];
    }
    while (v48);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v52 = self->_relatedEntitySections;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v87 objects:v116 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v88;
    do
    {
      for (juint64_t j = 0; jj != v53; ++jj)
      {
        if (*(void *)v88 != v54) {
          objc_enumerationMutation(v52);
        }
        long long v56 = (void *)[*(id *)(*((void *)&v87 + 1) + 8 * jj) copyWithZone:a3];
        -[GEOPDSearchResult addRelatedEntitySection:](v5, v56);
      }
      uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v87 objects:v116 count:16];
    }
    while (v53);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v57 = self->_searchTierMetadatas;
  uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v83 objects:v115 count:16];
  if (v58)
  {
    uint64_t v59 = *(void *)v84;
    do
    {
      for (kuint64_t k = 0; kk != v58; ++kk)
      {
        if (*(void *)v84 != v59) {
          objc_enumerationMutation(v57);
        }
        long long v61 = objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * kk), "copyWithZone:", a3, (void)v83);
        -[GEOPDSearchResult addSearchTierMetadata:](v5, v61);
      }
      uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v83 objects:v115 count:16];
    }
    while (v58);
  }

  id v62 = [(GEOPDResultRefinementGroup *)self->_resultRefinementGroup copyWithZone:a3];
  long long v63 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v62;

  id v64 = [(GEOPDSSearchAutoRedoThreshold *)self->_autoRedoSearchThreshold copyWithZone:a3];
  long long v65 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v64;

  id v66 = [(GEOPDPlaceSummaryLayoutMetadata *)self->_placeSummaryLayoutMetadata copyWithZone:a3];
  long long v67 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v66;

  id v68 = [(GEOPDSearchSectionList *)self->_sectionList copyWithZone:a3];
  long long v69 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v68;

  $A1FAD422473D1390BB4F551D8B8DF0D1 v70 = self->_flags;
  if ((*(unsigned char *)&v70 & 0x20) == 0)
  {
    if ((*(unsigned char *)&v70 & 0x10) == 0) {
      goto LABEL_72;
    }
LABEL_83:
    *(_DWORD *)(v5 + 236) = self->_searchResultViewType;
    *(void *)(v5 + 248) |= 0x10uLL;
    if ((*(void *)&self->_flags & 0x80) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
  *(unsigned char *)(v5 + 240) = self->_disableAddingAdditionalPaddingOnViewport;
  *(void *)(v5 + 248) |= 0x20uLL;
  $A1FAD422473D1390BB4F551D8B8DF0D1 v70 = self->_flags;
  if ((*(unsigned char *)&v70 & 0x10) != 0) {
    goto LABEL_83;
  }
LABEL_72:
  if ((*(unsigned char *)&v70 & 0x80) != 0)
  {
LABEL_73:
    *(unsigned char *)(v5 + 242) = self->_enableStructuredRapAffordance;
    *(void *)(v5 + 248) |= 0x80uLL;
  }
LABEL_74:
  id v71 = -[GEOPDSSearchSessionData copyWithZone:](self->_searchSessionData, "copyWithZone:", a3, (void)v83);
  long long v72 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v71;

  id v73 = [(GEOPDMapsIdentifier *)self->_openPlaceCardForResultWithId copyWithZone:a3];
  uint64_t v74 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v73;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_mapDisplayType;
    *(void *)(v5 + 248) |= 2uLL;
  }
  id v75 = [(GEOPDGuideSummaryLayoutMetadata *)self->_guideSummaryLayoutMetadata copyWithZone:a3];
  uint64_t v76 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v75;

  id v77 = [(GEOPDPaginationInfo *)self->_paginationInfo copyWithZone:a3];
  v78 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v77;

  id v79 = [(GEOPDSSearchRedoButtonThreshold *)self->_redoButtonThreshold copyWithZone:a3];
  uint64_t v80 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v79;

  uint64_t v81 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v81;
LABEL_77:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_114;
  }
  -[GEOPDSearchResult readAll:]((uint64_t)self, 1);
  -[GEOPDSearchResult readAll:]((uint64_t)v4, 1);
  displayMapRegiouint64_t n = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((void *)v4 + 9))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:")) {
      goto LABEL_114;
    }
  }
  disambiguationLabels = self->_disambiguationLabels;
  if ((unint64_t)disambiguationLabels | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](disambiguationLabels, "isEqual:")) {
      goto LABEL_114;
    }
  }
  $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
  uint64_t v8 = *((void *)v4 + 31);
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0) {
      goto LABEL_114;
    }
    if (self->_isChainResultSet)
    {
      if (!*((unsigned char *)v4 + 243)) {
        goto LABEL_114;
      }
    }
    else if (*((unsigned char *)v4 + 243))
    {
      goto LABEL_114;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_114;
  }
  relatedSearchSuggestions = self->_relatedSearchSuggestions;
  if ((unint64_t)relatedSearchSuggestions | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](relatedSearchSuggestions, "isEqual:")) {
      goto LABEL_114;
    }
    $A1FAD422473D1390BB4F551D8B8DF0D1 flags = self->_flags;
    uint64_t v8 = *((void *)v4 + 31);
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_searchResultType != *((_DWORD *)v4 + 58)) {
      goto LABEL_114;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_114;
  }
  resultDisplayHeader = self->_resultDisplayHeader;
  if ((unint64_t)resultDisplayHeader | *((void *)v4 + 18)
    && !-[NSString isEqual:](resultDisplayHeader, "isEqual:"))
  {
    goto LABEL_114;
  }
  defaultRelatedSearchSuggestiouint64_t n = self->_defaultRelatedSearchSuggestion;
  if ((unint64_t)defaultRelatedSearchSuggestion | *((void *)v4 + 5))
  {
    if (!-[GEOPDRelatedSearchSuggestion isEqual:](defaultRelatedSearchSuggestion, "isEqual:")) {
      goto LABEL_114;
    }
  }
  searchClientBehavior = self->_searchClientBehavior;
  if ((unint64_t)searchClientBehavior | *((void *)v4 + 21))
  {
    if (!-[GEOPDSearchClientBehavior isEqual:](searchClientBehavior, "isEqual:")) {
      goto LABEL_114;
    }
  }
  resultDetourInfos = self->_resultDetourInfos;
  if ((unint64_t)resultDetourInfos | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](resultDetourInfos, "isEqual:")) {
      goto LABEL_114;
    }
  }
  directionIntent = self->_directionIntent;
  if ((unint64_t)directionIntent | *((void *)v4 + 6))
  {
    if (!-[GEOPDDirectionIntent isEqual:](directionIntent, "isEqual:")) {
      goto LABEL_114;
    }
  }
  clientResolvedResult = self->_clientResolvedResult;
  if ((unint64_t)clientResolvedResult | *((void *)v4 + 4))
  {
    if (!-[GEOPDResolvedItem isEqual:](clientResolvedResult, "isEqual:")) {
      goto LABEL_114;
    }
  }
  displayHeaderSubstitutes = self->_displayHeaderSubstitutes;
  if ((unint64_t)displayHeaderSubstitutes | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](displayHeaderSubstitutes, "isEqual:")) {
      goto LABEL_114;
    }
  }
  $A1FAD422473D1390BB4F551D8B8DF0D1 v17 = self->_flags;
  uint64_t v18 = *((void *)v4 + 31);
  if ((*(unsigned char *)&v17 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0) {
      goto LABEL_114;
    }
    if (self->_enablePartialClientization)
    {
      if (!*((unsigned char *)v4 + 241)) {
        goto LABEL_114;
      }
    }
    else if (*((unsigned char *)v4 + 241))
    {
      goto LABEL_114;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_114;
  }
  if (*(unsigned char *)&v17)
  {
    if ((v18 & 1) == 0 || self->_dymSuggestionVisibleTime != *((_DWORD *)v4 + 55)) {
      goto LABEL_114;
    }
  }
  else if (v18)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    if ((v18 & 0x200) == 0) {
      goto LABEL_114;
    }
    if (self->_showDymSuggestionCloseButton)
    {
      if (!*((unsigned char *)v4 + 244)) {
        goto LABEL_114;
      }
    }
    else if (*((unsigned char *)v4 + 244))
    {
      goto LABEL_114;
    }
  }
  else if ((v18 & 0x200) != 0)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_retainSearchTime != *((_DWORD *)v4 + 57)) {
      goto LABEL_114;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_114;
  }
  retainSearchs = self->_retainSearchs;
  if ((unint64_t)retainSearchs | *((void *)v4 + 20)
    && !-[NSMutableArray isEqual:](retainSearchs, "isEqual:"))
  {
    goto LABEL_114;
  }
  searchResultSections = self->_searchResultSections;
  if ((unint64_t)searchResultSections | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](searchResultSections, "isEqual:")) {
      goto LABEL_114;
    }
  }
  relatedEntitySections = self->_relatedEntitySections;
  if ((unint64_t)relatedEntitySections | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](relatedEntitySections, "isEqual:")) {
      goto LABEL_114;
    }
  }
  searchTierMetadatas = self->_searchTierMetadatas;
  if ((unint64_t)searchTierMetadatas | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](searchTierMetadatas, "isEqual:")) {
      goto LABEL_114;
    }
  }
  resultRefinementGroup = self->_resultRefinementGroup;
  if ((unint64_t)resultRefinementGroup | *((void *)v4 + 19))
  {
    if (!-[GEOPDResultRefinementGroup isEqual:](resultRefinementGroup, "isEqual:")) {
      goto LABEL_114;
    }
  }
  autoRedoSearchThreshold = self->_autoRedoSearchThreshold;
  if ((unint64_t)autoRedoSearchThreshold | *((void *)v4 + 3))
  {
    if (!-[GEOPDSSearchAutoRedoThreshold isEqual:](autoRedoSearchThreshold, "isEqual:")) {
      goto LABEL_114;
    }
  }
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  if ((unint64_t)placeSummaryLayoutMetadata | *((void *)v4 + 13))
  {
    if (!-[GEOPDPlaceSummaryLayoutMetadata isEqual:](placeSummaryLayoutMetadata, "isEqual:")) {
      goto LABEL_114;
    }
  }
  sectionList = self->_sectionList;
  if ((unint64_t)sectionList | *((void *)v4 + 25))
  {
    if (!-[GEOPDSearchSectionList isEqual:](sectionList, "isEqual:")) {
      goto LABEL_114;
    }
  }
  $A1FAD422473D1390BB4F551D8B8DF0D1 v27 = self->_flags;
  uint64_t v28 = *((void *)v4 + 31);
  if ((*(unsigned char *)&v27 & 0x20) != 0)
  {
    if ((v28 & 0x20) == 0) {
      goto LABEL_114;
    }
    if (self->_disableAddingAdditionalPaddingOnViewport)
    {
      if (!*((unsigned char *)v4 + 240)) {
        goto LABEL_114;
      }
    }
    else if (*((unsigned char *)v4 + 240))
    {
      goto LABEL_114;
    }
  }
  else if ((v28 & 0x20) != 0)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&v27 & 0x10) != 0)
  {
    if ((v28 & 0x10) == 0 || self->_searchResultViewType != *((_DWORD *)v4 + 59)) {
      goto LABEL_114;
    }
  }
  else if ((v28 & 0x10) != 0)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&v27 & 0x80) != 0)
  {
    if ((v28 & 0x80) != 0)
    {
      if (self->_enableStructuredRapAffordance)
      {
        if (!*((unsigned char *)v4 + 242)) {
          goto LABEL_114;
        }
        goto LABEL_99;
      }
      if (!*((unsigned char *)v4 + 242)) {
        goto LABEL_99;
      }
    }
LABEL_114:
    char v35 = 0;
    goto LABEL_115;
  }
  if ((v28 & 0x80) != 0) {
    goto LABEL_114;
  }
LABEL_99:
  searchSessionData = self->_searchSessionData;
  if ((unint64_t)searchSessionData | *((void *)v4 + 23)
    && !-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:"))
  {
    goto LABEL_114;
  }
  openPlaceCardForResultWithId = self->_openPlaceCardForResultWithId;
  if ((unint64_t)openPlaceCardForResultWithId | *((void *)v4 + 11))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](openPlaceCardForResultWithId, "isEqual:")) {
      goto LABEL_114;
    }
  }
  uint64_t v31 = *((void *)v4 + 31);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v31 & 2) == 0 || self->_mapDisplayType != *((_DWORD *)v4 + 56)) {
      goto LABEL_114;
    }
  }
  else if ((v31 & 2) != 0)
  {
    goto LABEL_114;
  }
  guideSummaryLayoutMetadata = self->_guideSummaryLayoutMetadata;
  if ((unint64_t)guideSummaryLayoutMetadata | *((void *)v4 + 10)
    && !-[GEOPDGuideSummaryLayoutMetadata isEqual:](guideSummaryLayoutMetadata, "isEqual:"))
  {
    goto LABEL_114;
  }
  paginationInfo = self->_paginationInfo;
  if ((unint64_t)paginationInfo | *((void *)v4 + 12))
  {
    if (!-[GEOPDPaginationInfo isEqual:](paginationInfo, "isEqual:")) {
      goto LABEL_114;
    }
  }
  redoButtonThreshold = self->_redoButtonThreshold;
  if ((unint64_t)redoButtonThreshold | *((void *)v4 + 14)) {
    char v35 = -[GEOPDSSearchRedoButtonThreshold isEqual:](redoButtonThreshold, "isEqual:");
  }
  else {
    char v35 = 1;
  }
LABEL_115:

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionList, 0);
  objc_storeStrong((id *)&self->_searchTierMetadatas, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchResultSections, 0);
  objc_storeStrong((id *)&self->_searchClientBehavior, 0);
  objc_storeStrong((id *)&self->_retainSearchs, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);
  objc_storeStrong((id *)&self->_resultDetourInfos, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestions, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_redoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_openPlaceCardForResultWithId, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_displayHeaderSubstitutes, 0);
  objc_storeStrong((id *)&self->_disambiguationLabels, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_defaultRelatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_clientResolvedResult, 0);
  objc_storeStrong((id *)&self->_autoRedoSearchThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end